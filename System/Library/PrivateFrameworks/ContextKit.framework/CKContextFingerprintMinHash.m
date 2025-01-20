@interface CKContextFingerprintMinHash
+ (BOOL)supportsSecureCoding;
+ (id)parse:(id)a3;
- (CKContextFingerprintMinHash)initWithCoder:(id)a3;
- (CKContextFingerprintMinHash)initWithHashes:(int *)a3 count:(unsigned int)a4;
- (float)compareFingerprintWith:(id)a3;
- (id)data;
- (id)debugDescription;
- (int)hashes;
- (unsigned)numHashes;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKContextFingerprintMinHash

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKContextFingerprintMinHash)initWithHashes:(int *)a3 count:(unsigned int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CKContextFingerprintMinHash;
  v6 = [(CKContextFingerprintMinHash *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_numHashes = a4;
    if (a3)
    {
      v8 = (int *)malloc_type_malloc(4 * a4, 0xF1746BCEuLL);
      v7->_hashes = v8;
      memcpy(v8, a3, 4 * a4);
    }
    else
    {
      v6->_hashes = (int *)malloc_type_calloc(1uLL, 4 * a4, 0xE49E7481uLL);
    }
  }
  return v7;
}

- (CKContextFingerprintMinHash)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKContextFingerprintMinHash;
  v5 = [(CKContextFingerprint *)&v12 initWithCoder:v4];
  if (!v5) {
    goto LABEL_4;
  }
  v5->_uint64_t numHashes = [v4 decodeIntegerForKey:@"numHashes"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hashes"];
  uint64_t numHashes = v5->_numHashes;
  size_t v8 = 4 * numHashes;
  if ([v6 length] == 4 * numHashes)
  {
    v9 = (int *)malloc_type_malloc(4 * numHashes, 0x1B8E61D9uLL);
    v5->_hashes = v9;
    id v10 = v6;
    memcpy(v9, (const void *)[v10 bytes], v8);

LABEL_4:
    return v5;
  }
  result = (CKContextFingerprintMinHash *)os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
  if (result) {
    -[CKContextFingerprintMinHash initWithCoder:](v6, 4 * numHashes);
  }
  __break(1u);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKContextFingerprintMinHash;
  id v4 = a3;
  [(CKContextFingerprint *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_numHashes, @"numHashes", v6.receiver, v6.super_class);
  v5 = [(CKContextFingerprintMinHash *)self data];
  [v4 encodeObject:v5 forKey:@"hashes"];
}

- (id)data
{
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:self->_hashes length:4 * self->_numHashes freeWhenDone:0];
}

- (id)debugDescription
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)CKContextFingerprintMinHash;
  id v4 = [(CKContextFingerprint *)&v10 debugDescription];
  v5 = [v3 stringWithFormat:@"%@ hashes:%i data:", v4, self->_numHashes];
  objc_super v6 = (void *)[v5 mutableCopy];

  if (self->_numHashes)
  {
    unint64_t v7 = 0;
    do
    {
      if (v7) {
        size_t v8 = @",%08x";
      }
      else {
        size_t v8 = @"%08x";
      }
      objc_msgSend(v6, "appendFormat:", v8, self->_hashes[v7++]);
    }
    while (v7 < self->_numHashes);
  }
  return v6;
}

+ (id)parse:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 rangeOfString:@"CKContextFingerprintMinHash "])
  {
    v47.receiver = a1;
    v47.super_class = (Class)&OBJC_METACLASS___CKContextFingerprintMinHash;
    objc_msgSendSuper2(&v47, sel_parse_, v4);
    v5 = (CKContextFingerprintMinHash *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v6 setObject:&stru_1EF81F168 forKeyedSubscript:@"type"];
    [v6 setObject:&stru_1EF81F168 forKeyedSubscript:@"hashes"];
    [v6 setObject:&stru_1EF81F168 forKeyedSubscript:@"data"];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    unint64_t v7 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    id v37 = v4;
    size_t v8 = [v4 componentsSeparatedByCharactersInSet:v7];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v44;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v44 != v12) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if (([v14 isEqualToString:@"CKContextFingerprintMinHash"] & 1) == 0)
          {
            uint64_t v15 = [v14 rangeOfString:@":"];
            if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
              goto LABEL_29;
            }
            uint64_t v16 = v15;
            v17 = [v14 substringToIndex:v15];
            v18 = [v14 substringFromIndex:v16 + 1];
            if (![v18 length]) {
              goto LABEL_28;
            }
            v19 = [v6 objectForKeyedSubscript:v17];
            v20 = v19;
            if (v19 != &stru_1EF81F168)
            {

LABEL_28:
LABEL_29:

              goto LABEL_30;
            }
            [v6 setObject:v18 forKeyedSubscript:v17];
            ++v11;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v43 objects:v49 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }

    if (v11 == [v6 count])
    {
      v21 = [v6 objectForKeyedSubscript:@"hashes"];
      int v22 = [v21 intValue];

      v5 = [[CKContextFingerprintMinHash alloc] initWithHashes:0 count:v22 & ~(v22 >> 31)];
      v23 = [v6 objectForKeyedSubscript:@"type"];
      -[CKContextFingerprint setType:](v5, "setType:", (int)[v23 intValue]);

      if (v22 >= 1)
      {
        int v42 = 0;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v36 = v6;
        v24 = [v6 objectForKeyedSubscript:@"data"];
        v25 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
        v26 = [v24 componentsSeparatedByCharactersInSet:v25];

        uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:v48 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          int v29 = 0;
          uint64_t v30 = *(void *)v39;
          do
          {
            uint64_t v31 = 0;
            uint64_t v32 = v29;
            do
            {
              if (*(void *)v39 != v30) {
                objc_enumerationMutation(v26);
              }
              v33 = [MEMORY[0x1E4F28FE8] scannerWithString:*(void *)(*((void *)&v38 + 1) + 8 * v31)];
              [v33 scanHexInt:&v42];
              int v34 = v42;
              int v29 = v32 + 1;
              [(CKContextFingerprintMinHash *)v5 hashes][4 * v32] = v34;

              ++v31;
              ++v32;
            }
            while (v28 != v31);
            uint64_t v28 = [v26 countByEnumeratingWithState:&v38 objects:v48 count:16];
          }
          while (v28);
        }

        id v6 = v36;
      }
    }
    else
    {
LABEL_30:
      v5 = 0;
    }

    id v4 = v37;
  }

  return v5;
}

- (void)dealloc
{
  free(self->_hashes);
  v3.receiver = self;
  v3.super_class = (Class)CKContextFingerprintMinHash;
  [(CKContextFingerprintMinHash *)&v3 dealloc];
}

- (float)compareFingerprintWith:(id)a3
{
  id v4 = (CKContextFingerprintMinHash *)a3;
  v5 = v4;
  if (v4 == self)
  {
    float v6 = 1.0;
  }
  else
  {
    float v6 = 0.0;
    if (v4)
    {
      if (self->_numHashes)
      {
        int64_t v7 = [(CKContextFingerprint *)self type];
        if (v7 == [(CKContextFingerprint *)v5 type])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            size_t v8 = v5;
            if ([(CKContextFingerprintMinHash *)v8 numHashes])
            {
              unsigned int v9 = [(CKContextFingerprintMinHash *)v8 numHashes];
              uint64_t v10 = [(CKContextFingerprintMinHash *)v8 hashes];
              uint64_t numHashes = self->_numHashes;
              if (numHashes <= v9) {
                unsigned int v12 = v9;
              }
              else {
                unsigned int v12 = self->_numHashes;
              }
              unsigned int v13 = 2 * v12;
              if (numHashes)
              {
                uint64_t v14 = 0;
                unsigned int v15 = 0;
                do
                {
                  if (v9)
                  {
                    uint64_t v16 = v9;
                    v17 = (int *)v10;
                    while (1)
                    {
                      int v18 = *v17++;
                      if (self->_hashes[v14] == v18) {
                        break;
                      }
                      if (!--v16) {
                        goto LABEL_18;
                      }
                    }
                    v15 += 2;
                  }
LABEL_18:
                  ++v14;
                }
                while (v14 != numHashes);
              }
              else
              {
                unsigned int v15 = 0;
              }
              float v6 = (float)v15 / (float)v13;
            }
          }
        }
      }
    }
  }

  return v6;
}

- (unsigned)numHashes
{
  return self->_numHashes;
}

- (int)hashes
{
  return self->_hashes;
}

- (void)initWithCoder:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = [a1 length];
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Illegal object length: %lu, expected: %lu", (uint8_t *)&v3, 0x16u);
}

@end