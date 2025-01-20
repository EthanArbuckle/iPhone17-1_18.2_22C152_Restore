@interface HMBSQLQueryIterator
+ (unint64_t)maximumRowsPerSelect;
+ (void)setMaximumRowsPerSelect:(unint64_t)a3;
- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4;
- (HMBSQLQueryIterator)initWithStatement:(id)a3 initialSequence:(id)a4 maximumRowsPerSelect:(unint64_t)a5;
- (HMBSQLQueryIterator)initWithStatement:(id)a3 initialSequence:(id)a4 maximumRowsPerSelect:(unint64_t)a5 error:(id)a6;
- (HMBSQLQueryStatement)statement;
- (NSError)error;
- (NSMutableArray)cachedResults;
- (NSNumber)currentSequence;
- (id)fetchRow:(id)a3 error:(id *)a4;
- (id)fetchRowFromStatement:(sqlite3_stmt *)a3 skip:(BOOL *)a4 updatedSequence:(unint64_t *)a5 error:(id *)a6;
- (id)nextObject;
- (int)sequenceBindOffset;
- (unint64_t)maximumRowsPerQuery;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)setCachedResults:(id)a3;
- (void)setCurrentSequence:(id)a3;
- (void)setError:(id)a3;
- (void)setSequenceBindOffset:(int)a3;
@end

@implementation HMBSQLQueryIterator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSequence, 0);
  objc_storeStrong((id *)&self->_cachedResults, 0);
  objc_storeStrong((id *)&self->_statement, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setSequenceBindOffset:(int)a3
{
  self->_sequenceBindOffset = a3;
}

- (int)sequenceBindOffset
{
  return self->_sequenceBindOffset;
}

- (void)setCurrentSequence:(id)a3
{
}

- (NSNumber)currentSequence
{
  return self->_currentSequence;
}

- (void)setCachedResults:(id)a3
{
}

- (NSMutableArray)cachedResults
{
  return self->_cachedResults;
}

- (unint64_t)maximumRowsPerQuery
{
  return self->_maximumRowsPerQuery;
}

- (HMBSQLQueryStatement)statement
{
  return self->_statement;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  return 1;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, unsigned char *))a3;
  char v7 = 0;
  do
  {
    v5 = (void *)MEMORY[0x1D944CB30]();
    v6 = [(HMBSQLQueryIterator *)self nextObject];
    if (v6) {
      v4[2](v4, v6, &v7);
    }
  }
  while (v6 && !v7);
}

- (id)nextObject
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v3 = [(HMBSQLQueryIterator *)self error];
  BOOL v4 = v3 == 0;

  if (!v4) {
    goto LABEL_2;
  }
  v46 = v49;
  *(void *)&long long v5 = 138543874;
  long long v45 = v5;
  while (1)
  {
    v8 = [(HMBSQLQueryIterator *)self cachedResults];
    if (!v8) {
      goto LABEL_11;
    }
    v9 = [(HMBSQLQueryIterator *)self cachedResults];
    if ([v9 count])
    {

      goto LABEL_33;
    }
    v10 = [(HMBSQLQueryIterator *)self currentSequence];
    BOOL v11 = v10 == 0;

    if (!v11)
    {
LABEL_11:
      v12 = self;
      while (1)
      {
        v13 = [(HMBSQLQueryIterator *)v12 cachedResults];
        if (v13)
        {
          v14 = [(HMBSQLQueryIterator *)v12 cachedResults];
          if ([v14 count])
          {

LABEL_32:
            break;
          }
          v15 = [(HMBSQLQueryIterator *)v12 currentSequence];
          BOOL v16 = v15 == 0;

          if (v16) {
            goto LABEL_32;
          }
        }
        uint64_t v17 = [(HMBSQLQueryIterator *)v12 maximumRowsPerQuery];
        uint64_t v64 = 0;
        v65 = &v64;
        uint64_t v66 = 0x3032000000;
        v67 = __Block_byref_object_copy_;
        v68 = __Block_byref_object_dispose_;
        id v69 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v17];
        uint64_t v60 = 0;
        v61 = &v60;
        uint64_t v62 = 0x2020000000;
        uint64_t v63 = 0;
        uint64_t v56 = 0;
        v57 = &v56;
        uint64_t v58 = 0x2020000000;
        char v59 = 0;
        int v18 = [(HMBSQLQueryIterator *)v12 sequenceBindOffset];
        v19 = [(HMBSQLQueryIterator *)v12 statement];
        v20 = [v19 context];
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v49[0] = ____fetchNextBatch_block_invoke;
        v49[1] = &unk_1E69E9600;
        int v55 = v18;
        v21 = v12;
        v50 = v21;
        v51 = &v56;
        v52 = &v60;
        v53 = &v64;
        uint64_t v54 = v17;
        v22 = [v20 sqlBlockWithActivity:0 block:v48];

        v23 = (void *)v65[5];
        if (v23)
        {
          if (*((unsigned char *)v57 + 24) || [v23 count])
          {
            v24 = [(HMBSQLQueryIterator *)v21 currentSequence];
            BOOL v25 = v24 == 0;

            if (!v25)
            {
              v26 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v61[3]];
              [(HMBSQLQueryIterator *)v21 setCurrentSequence:v26];
            }
            v27 = [(HMBSQLQueryIterator *)v21 cachedResults];
            BOOL v28 = v27 == 0;

            if (v28)
            {
              [(HMBSQLQueryIterator *)v21 setCachedResults:v65[5]];
            }
            else
            {
              v29 = [(HMBSQLQueryIterator *)v21 cachedResults];
              [v29 addObjectsFromArray:v65[5]];
            }
            char v35 = 1;
            goto LABEL_28;
          }
          [(HMBSQLQueryIterator *)v21 setCurrentSequence:0];
        }
        else
        {
          v30 = (void *)MEMORY[0x1D944CB30]();
          v31 = v21;
          HMFGetOSLogHandle();
          v32 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            id v33 = (id)objc_claimAutoreleasedReturnValue();
            v34 = [(HMBSQLQueryIterator *)v31 currentSequence];
            *(_DWORD *)buf = v45;
            id v71 = v33;
            __int16 v72 = 2112;
            v73 = v34;
            __int16 v74 = 2112;
            v75 = v22;
            _os_log_impl(&dword_1D4693000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch additional items into query enumeration %@: %@", buf, 0x20u);
          }
          [(HMBSQLQueryIterator *)v31 setError:v22];
          [(HMBSQLQueryIterator *)v31 setCurrentSequence:0];
          [(HMBSQLQueryIterator *)v31 setCachedResults:0];
        }
        char v35 = 0;
LABEL_28:

        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v60, 8);
        _Block_object_dispose(&v64, 8);

        if ((v35 & 1) == 0) {
          goto LABEL_32;
        }
      }
    }
LABEL_33:
    v36 = [(HMBSQLQueryIterator *)self cachedResults];
    if (![v36 count])
    {

LABEL_42:
      [(HMBSQLQueryIterator *)self setCurrentSequence:0];
      goto LABEL_2;
    }
    v37 = [(HMBSQLQueryIterator *)self error];
    BOOL v38 = v37 == 0;

    if (!v38) {
      goto LABEL_42;
    }
    v39 = [(HMBSQLQueryIterator *)self cachedResults];
    v40 = objc_msgSend(v39, "hmf_dequeue");

    id v47 = 0;
    v6 = [(HMBSQLQueryIterator *)self fetchRow:v40 error:&v47];
    id v41 = v47;
    v42 = v41;
    if (v6) {
      break;
    }
    if (![v41 isHMFError] || objc_msgSend(v42, "code") != 2)
    {
      [(HMBSQLQueryIterator *)self setError:v42];
      [(HMBSQLQueryIterator *)self setCurrentSequence:0];

LABEL_2:
      v6 = 0;
      goto LABEL_3;
    }

    v43 = [(HMBSQLQueryIterator *)self error];
    BOOL v44 = v43 == 0;

    if (!v44) {
      goto LABEL_2;
    }
  }

LABEL_3:
  return v6;
}

- (id)fetchRow:(id)a3 error:(id *)a4
{
  id v4 = a3;
  return v4;
}

- (id)fetchRowFromStatement:(sqlite3_stmt *)a3 skip:(BOOL *)a4 updatedSequence:(unint64_t *)a5 error:(id *)a6
{
  v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3B8];
  v8 = NSString;
  v9 = NSStringFromSelector(a2);
  v10 = [v8 stringWithFormat:@"You must override %@ in a subclass", v9];
  id v11 = [v6 exceptionWithName:v7 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (HMBSQLQueryIterator)initWithStatement:(id)a3 initialSequence:(id)a4 maximumRowsPerSelect:(unint64_t)a5 error:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMBSQLQueryIterator;
  v14 = [(HMBSQLQueryIterator *)&v20 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_statement, a3);
    cachedResults = v15->_cachedResults;
    v15->_cachedResults = 0;

    objc_storeStrong((id *)&v15->_currentSequence, a4);
    v15->_maximumRowsPerQuery = a5;
    objc_storeStrong((id *)&v15->_error, a6);
    uint64_t v17 = [v11 arguments];
    int v18 = objc_msgSend(v17, "hmf_numberForKey:", @"_sequence_offset");

    v15->_sequenceBindOffset = [v18 intValue];
  }

  return v15;
}

- (HMBSQLQueryIterator)initWithStatement:(id)a3 initialSequence:(id)a4 maximumRowsPerSelect:(unint64_t)a5
{
  return [(HMBSQLQueryIterator *)self initWithStatement:a3 initialSequence:a4 maximumRowsPerSelect:a5 error:0];
}

+ (void)setMaximumRowsPerSelect:(unint64_t)a3
{
  _maximumRowsPerSelect = a3;
}

+ (unint64_t)maximumRowsPerSelect
{
  return _maximumRowsPerSelect;
}

@end