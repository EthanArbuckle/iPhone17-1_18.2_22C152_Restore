@interface EFBloomFilter
+ (id)bestBloomFilterForValues:(id)a3 excludingValues:(id)a4 falsePositiveRate:(double)a5 knownFalsePositives:(id *)a6;
+ (id)bestBloomFilterForValues:(id)a3 excludingValues:(id)a4 knownFalsePositives:(id *)a5;
+ (id)bloomFilterWithContentsOfFile:(id)a3 error:(id *)a4;
- (BOOL)mayContainData:(id)a3;
- (BOOL)mayContainString:(id)a3;
- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (EFBloomFilter)init;
- (EFBloomFilter)initWithValues:(id)a3;
- (EFBloomFilter)initWithValues:(id)a3 falsePositiveRate:(double)a4;
- (EFBloomFilter)initWithValues:(id)a3 falsePositiveRate:(double)a4 seed:(unint64_t)a5;
- (id)_initWithBucketCount:(unint64_t)a3 hashFunctionCount:(unint64_t)a4 seed:(unint64_t)a5 indexes:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)bucketCount;
- (unint64_t)hashFunctionCount;
- (unint64_t)seed;
@end

@implementation EFBloomFilter

- (EFBloomFilter)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  v4 = [(EFBloomFilter *)self _initWithBucketCount:1 hashFunctionCount:1 seed:0 indexes:v3];

  return v4;
}

- (EFBloomFilter)initWithValues:(id)a3
{
  return [(EFBloomFilter *)self initWithValues:a3 falsePositiveRate:0.05];
}

- (EFBloomFilter)initWithValues:(id)a3 falsePositiveRate:(double)a4
{
  return [(EFBloomFilter *)self initWithValues:a3 falsePositiveRate:0 seed:a4];
}

- (EFBloomFilter)initWithValues:(id)a3 falsePositiveRate:(double)a4 seed:(unint64_t)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  if (a4 <= 0.0)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"EFBloomFilter.m", 111, @"Invalid parameter not satisfying: %@", @"falsePositiveRate > 0.0" object file lineNumber description];
  }
  if (a4 >= 1.0)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"EFBloomFilter.m", 112, @"Invalid parameter not satisfying: %@", @"falsePositiveRate < 1.0" object file lineNumber description];
  }
  unint64_t v9 = [v28 count];
  if (v9 <= 1) {
    unint64_t v10 = 1;
  }
  else {
    unint64_t v10 = v9;
  }
  double v11 = log(a4);
  if (v11 * -1.44269504 >= 0.0) {
    double v12 = v11 * -1.44269504;
  }
  else {
    double v12 = 0.0;
  }
  double v13 = v11 * -2.08136898;
  if (v13 >= 0.0) {
    double v14 = v13;
  }
  else {
    double v14 = 0.0;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v16 = v28;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
  uint64_t v18 = vcvtpd_u64_f64(fmin(v12, 100.0));
  unint64_t v19 = vcvtpd_u64_f64(fmin(v14 * (double)v10, 9.22337204e18));
  if (v17)
  {
    uint64_t v20 = *(void *)v30;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v16);
        }
        v22 = *(void **)(*((void *)&v29 + 1) + 8 * v21);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          addStringToIndexes(v15, v22, v19, v18, a5);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            addDataToIndexes(v15, v22, v19, v18, a5);
          }
        }
        ++v21;
      }
      while (v17 != v21);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v17);
  }

  v23 = [(EFBloomFilter *)self _initWithBucketCount:v19 hashFunctionCount:v18 seed:a5 indexes:v15];
  return v23;
}

- (id)_initWithBucketCount:(unint64_t)a3 hashFunctionCount:(unint64_t)a4 seed:(unint64_t)a5 indexes:(id)a6
{
  id v12 = a6;
  if (!a3)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"EFBloomFilter.m", 129, @"Invalid parameter not satisfying: %@", @"bucketCount > 0" object file lineNumber description];
LABEL_10:

    if (a4) {
      goto LABEL_4;
    }
LABEL_11:
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"EFBloomFilter.m", 131, @"Invalid parameter not satisfying: %@", @"hashFunctionCount > 0" object file lineNumber description];
    goto LABEL_13;
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"EFBloomFilter.m", 130, @"Invalid parameter not satisfying: %@", @"bucketCount <= kMaxBuckets" object file lineNumber description];
    goto LABEL_10;
  }
  if (!a4) {
    goto LABEL_11;
  }
LABEL_4:
  if (a4 < 0x65) {
    goto LABEL_5;
  }
  uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"EFBloomFilter.m", 132, @"Invalid parameter not satisfying: %@", @"hashFunctionCount <= kMaxHashFunctions" object file lineNumber description];
LABEL_13:

LABEL_5:
  v18.receiver = self;
  v18.super_class = (Class)EFBloomFilter;
  double v13 = [(EFBloomFilter *)&v18 init];
  double v14 = v13;
  if (v13)
  {
    v13->_bucketCount = a3;
    v13->_hashFunctionCount = a4;
    v13->_seed = a5;
    objc_storeStrong((id *)&v13->_indexes, a6);
  }

  return v14;
}

+ (id)bestBloomFilterForValues:(id)a3 excludingValues:(id)a4 knownFalsePositives:(id *)a5
{
  v5 = [a1 bestBloomFilterForValues:a3 excludingValues:a4 falsePositiveRate:a5 knownFalsePositives:0.05];
  return v5;
}

+ (id)bestBloomFilterForValues:(id)a3 excludingValues:(id)a4 falsePositiveRate:(double)a5 knownFalsePositives:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  if ([v9 count])
  {
    unint64_t v11 = [v9 count];
    double v12 = log(a5);
    double v13 = v12 * -1.44269504;
    if (v12 * -1.44269504 < 0.0) {
      double v13 = 0.0;
    }
    unint64_t v14 = vcvtpd_u64_f64(fmin(v13, 100.0));
    double v15 = v12 * -2.08136898;
    if (v15 < 0.0) {
      double v15 = 0.0;
    }
    id v39 = 0;
    bestBloomFilterCandidate(v9, v10, vcvtpd_u64_f64(fmin(v15 * (double)v11, 9.22337204e18)), v14, &v39);
    id v16 = (EFBloomFilter *)objc_claimAutoreleasedReturnValue();
    id v17 = v39;
    objc_super v18 = v17;
    if (v17 && ![v17 count]) {
      goto LABEL_21;
    }
    if (v14 >= 2)
    {
      unint64_t v19 = [v9 count];
      double v20 = (double)(v14 - 1);
      double v21 = -(v20 * (double)v19);
      long double v22 = pow(a5, 1.0 / v20);
      long double v23 = log(1.0 - v22);
      id v38 = 0;
      v24 = bestBloomFilterCandidate(v9, v10, vcvtpd_u64_f64(fmin(v21 / v23, 9.22337204e18)), v14 - 1, &v38);
      id v25 = v38;
      unint64_t v26 = [v25 count];
      if (v26 >= [v18 count])
      {
        id v28 = v18;
        v27 = v16;
      }
      else
      {
        v27 = v24;

        id v28 = v25;
        if (v28)
        {
          objc_super v18 = v28;
          id v16 = v27;
          if (![v28 count])
          {
LABEL_20:

            goto LABEL_21;
          }
        }
      }

      id v16 = v27;
      objc_super v18 = v28;
      if (v14 > 0x7FFFFFFFFFFFFFFELL)
      {
LABEL_21:
        if (a6) {
          *a6 = v18;
        }

        goto LABEL_24;
      }
    }
    uint64_t v29 = v14 + 1;
    double v30 = -((double)(unint64_t)v29 * (double)(unint64_t)[v9 count]);
    long double v31 = pow(a5, 1.0 / (double)(unint64_t)v29);
    long double v32 = log(1.0 - v31);
    id v37 = 0;
    bestBloomFilterCandidate(v9, v10, vcvtpd_u64_f64(fmin(v30 / v32, 9.22337204e18)), v29, &v37);
    v27 = (EFBloomFilter *)objc_claimAutoreleasedReturnValue();
    id v28 = v37;
    unint64_t v33 = [v28 count];
    if (v33 < [v18 count])
    {
      uint64_t v34 = v27;

      id v35 = v28;
      objc_super v18 = v35;
      id v16 = v34;
    }
    goto LABEL_20;
  }
  if (a6) {
    *a6 = (id)MEMORY[0x1E4F1CBF0];
  }
  id v16 = objc_alloc_init(EFBloomFilter);
LABEL_24:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [EFBloomFilter alloc];
  unint64_t v5 = [(EFBloomFilter *)self bucketCount];
  unint64_t v6 = [(EFBloomFilter *)self hashFunctionCount];
  unint64_t v7 = [(EFBloomFilter *)self seed];
  indexes = self->_indexes;
  return [(EFBloomFilter *)v4 _initWithBucketCount:v5 hashFunctionCount:v6 seed:v7 indexes:indexes];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [EFMutableBloomFilter alloc];
  unint64_t v5 = [(EFBloomFilter *)self bucketCount];
  unint64_t v6 = [(EFBloomFilter *)self hashFunctionCount];
  unint64_t v7 = [(EFBloomFilter *)self seed];
  indexes = self->_indexes;
  return [(EFMutableBloomFilter *)v4 _initWithBucketCount:v5 hashFunctionCount:v6 seed:v7 indexes:indexes];
}

+ (id)bloomFilterWithContentsOfFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v6 options:2 error:a4];
  v8 = v7;
  if (!v7) {
    goto LABEL_23;
  }
  if ((unint64_t)[v7 length] <= 0x17)
  {
    if (a4)
    {
      id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "ef_invalidInputError");
LABEL_22:
      double v21 = 0;
      *a4 = v9;
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  unsigned __int8 v26 = 0;
  [v8 getBytes:&v26 length:1];
  int v10 = v26 >> 4;
  if (v10 == 1)
  {
    if (a4) {
      goto LABEL_21;
    }
    goto LABEL_23;
  }
  if (v10 != 2)
  {
    if (a4) {
      goto LABEL_21;
    }
    goto LABEL_23;
  }
  if ((v26 & 0xF) != 1)
  {
    if (a4)
    {
LABEL_21:
      id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "ef_notSupportedError");
      goto LABEL_22;
    }
LABEL_23:
    double v21 = 0;
    goto LABEL_24;
  }
  uint64_t v25 = 0;
  objc_msgSend(v8, "getBytes:range:", &v25, 4, 8);
  uint64_t v24 = 0;
  objc_msgSend(v8, "getBytes:range:", &v24, 12, 8);
  uint64_t v23 = 0;
  objc_msgSend(v8, "getBytes:range:", &v23, 20, 1);
  id v11 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  double v12 = objc_msgSend(v8, "subdataWithRange:", 24, objc_msgSend(v8, "length") - 24);
  id v13 = v11;
  id v14 = v12;
  unint64_t v15 = [v14 length];
  if (v15 >= 8)
  {
    uint64_t v16 = 0;
    unint64_t v17 = v15 >> 3;
    do
    {
      unint64_t v27 = 0;
      objc_msgSend(v14, "getBytes:range:", &v27, 8 * v16, 8);
      uint64_t v18 = 0;
      unint64_t v19 = v27;
      do
      {
        if (v19)
        {
          [v13 addIndex:v18 | (v16 << 6)];
          unint64_t v19 = v27;
        }
        v19 >>= 1;
        unint64_t v27 = v19;
        ++v18;
      }
      while (v18 != 64);
      ++v16;
    }
    while (v16 != v17);
  }

  id v20 = objc_alloc((Class)a1);
  double v21 = (void *)[v20 _initWithBucketCount:v24 hashFunctionCount:v23 seed:v25 indexes:v13];

LABEL_24:
  return v21;
}

- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  int v19 = 0;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  char v18 = 33;
  [v9 appendBytes:&v18 length:1];
  [v9 appendBytes:&v19 length:3];
  unint64_t v17 = [(EFBloomFilter *)self seed];
  [v9 appendBytes:&v17 length:8];
  unint64_t v16 = [(EFBloomFilter *)self bucketCount];
  [v9 appendBytes:&v16 length:8];
  unint64_t v15 = [(EFBloomFilter *)self hashFunctionCount];
  [v9 appendBytes:&v15 length:1];
  [v9 appendBytes:&v19 length:3];
  int v10 = (void *)[(NSIndexSet *)self->_indexes copy];
  [(EFBloomFilter *)self bucketCount];
  id v11 = v9;
  uint64_t v26 = 0;
  unint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __appendIndexesToData_block_invoke;
  v20[3] = &unk_1E6121DB8;
  long double v22 = v25;
  uint64_t v23 = &v26;
  char v24 = 0;
  id v12 = v11;
  id v21 = v12;
  [v10 enumerateIndexesUsingBlock:v20];
  if (v27[3]) {
    [v12 appendBytes:v27 + 3 length:8];
  }

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v26, 8);

  char v13 = [v12 writeToURL:v8 options:a4 error:a5];
  return v13;
}

- (BOOL)mayContainString:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__EFBloomFilter_mayContainString___block_invoke;
  v7[3] = &unk_1E6121D68;
  id v8 = v4;
  id v5 = v4;
  LOBYTE(self) = checkValueWithBlock(self, v7);

  return (char)self;
}

unint64_t __34__EFBloomFilter_mayContainString___block_invoke(uint64_t a1, uint64_t a2, unint64_t *a3, void *a4)
{
  unint64_t result = EFMurmurHash3String(*(void **)(a1 + 32), a2, a4);
  *a3 = result;
  return result;
}

- (BOOL)mayContainData:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__EFBloomFilter_mayContainData___block_invoke;
  v7[3] = &unk_1E6121D68;
  id v8 = v4;
  id v5 = v4;
  LOBYTE(self) = checkValueWithBlock(self, v7);

  return (char)self;
}

unint64_t __32__EFBloomFilter_mayContainData___block_invoke(uint64_t a1, uint64_t a2, unint64_t *a3, void *a4)
{
  unint64_t result = EFMurmurHash3Data(*(void **)(a1 + 32), a2, a4);
  *a3 = result;
  return result;
}

- (unint64_t)bucketCount
{
  return self->_bucketCount;
}

- (unint64_t)hashFunctionCount
{
  return self->_hashFunctionCount;
}

- (unint64_t)seed
{
  return self->_seed;
}

- (void).cxx_destruct
{
}

@end