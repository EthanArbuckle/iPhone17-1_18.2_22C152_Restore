@interface HMBLocalZoneQueryResultRecordIDSequence
- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 currentSequence:(id)a4 error:(id *)a5;
- (HMBLocalZoneQueryResultRecordIDSequence)initWithLocalZone:(id)a3 statement:(id)a4 initialSequence:(id)a5 sequenceBindOffset:(unint64_t)a6 arguments:(id)a7 maximumRowsPerSelect:(unint64_t)a8;
- (NSData)currentSequenceAsData;
- (NSData)lastReturnedSequence;
- (NSMutableSet)returnedIDs;
- (id)fetchRow:(id)a3 error:(id *)a4;
- (id)fetchRowFromStatement:(sqlite3_stmt *)a3 skip:(BOOL *)a4 updatedSequenceColumn:(id *)a5 error:(id *)a6;
- (id)nextObject;
- (void)setCurrentSequenceAsData:(id)a3;
- (void)setLastReturnedSequence:(id)a3;
- (void)setReturnedIDs:(id)a3;
@end

@implementation HMBLocalZoneQueryResultRecordIDSequence

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returnedIDs, 0);
  objc_storeStrong((id *)&self->_lastReturnedSequence, 0);
  objc_storeStrong((id *)&self->_currentSequenceAsData, 0);
}

- (void)setReturnedIDs:(id)a3
{
  objc_storeStrong((id *)&self->_returnedIDs, a3);
}

- (NSMutableSet)returnedIDs
{
  return self->_returnedIDs;
}

- (void)setLastReturnedSequence:(id)a3
{
}

- (NSData)lastReturnedSequence
{
  return self->_lastReturnedSequence;
}

- (void)setCurrentSequenceAsData:(id)a3
{
}

- (NSData)currentSequenceAsData
{
  return self->_currentSequenceAsData;
}

- (id)fetchRow:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(HMBLocalZoneQueryResult *)self localZone];
  uint64_t v8 = [v6 unsignedIntegerValue];

  v9 = [v7 fetchModelWithRecordRow:v8 error:a4];

  return v9;
}

- (HMBLocalZoneQueryResultRecordIDSequence)initWithLocalZone:(id)a3 statement:(id)a4 initialSequence:(id)a5 sequenceBindOffset:(unint64_t)a6 arguments:(id)a7 maximumRowsPerSelect:(unint64_t)a8
{
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMBLocalZoneQueryResultRecordIDSequence;
  v16 = [(HMBLocalZoneQueryResult *)&v19 initWithLocalZone:a3 statement:a4 initialSequence:0 arguments:a7 maximumRowsPerSelect:a8];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_currentSequenceAsData, a5);
    [(HMBSQLQueryIterator *)v17 setSequenceBindOffset:a6];
  }

  return v17;
}

- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 currentSequence:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [(HMBLocalZoneQueryResult *)self arguments];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__HMBLocalZoneQueryResultRecordIDSequence_bindPropertiesToStatement_currentSequence_error___block_invoke;
  v11[3] = &unk_1E69EA9C8;
  v11[4] = self;
  v11[5] = a3;
  [v9 enumerateKeysAndObjectsUsingBlock:v11];

  hmbBindDataSQLite3(a3, [(HMBSQLQueryIterator *)self sequenceBindOffset], v8, a5);
  hmbBindIntSQLite3(a3, [(HMBLocalZoneQueryResult *)self zoneRowBindOffset], [(HMBLocalZoneQueryResult *)self zoneRow], a5);
  return 1;
}

void __91__HMBLocalZoneQueryResultRecordIDSequence_bindPropertiesToStatement_currentSequence_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  int v5 = [a2 intValue];
  if (v5 != [*(id *)(a1 + 32) sequenceBindOffset])
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];

    v7 = *(sqlite3_stmt **)(a1 + 40);
    if (v6 == v12)
    {
      uint64_t v14 = 0;
      v9 = (id *)&v14;
      v10 = &v14;
      int v11 = v5;
      id v8 = 0;
    }
    else
    {
      id v8 = v12;
      uint64_t v13 = 0;
      v9 = (id *)&v13;
      v10 = &v13;
      int v11 = v5;
    }
    hmbBindDataSQLite3(v7, v11, v8, v10);
  }
}

- (id)fetchRowFromStatement:(sqlite3_stmt *)a3 skip:(BOOL *)a4 updatedSequenceColumn:(id *)a5 error:(id *)a6
{
  sqlite3_int64 v10 = sqlite3_column_int64(a3, 0);
  *a5 = [MEMORY[0x1E4F1C9B8] hmbDataWithSQLite3Column:a3 column:1];
  int v11 = [(HMBLocalZoneQueryResultRecordIDSequence *)self lastReturnedSequence];
  char v12 = [v11 isEqual:*a5];

  if (v12)
  {
    uint64_t v13 = [(HMBLocalZoneQueryResultRecordIDSequence *)self returnedIDs];
    uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v10];
    int v15 = [v13 containsObject:v14];

    if (v15)
    {
      *a4 = 1;
      v16 = &unk_1F2C4CA98;
      goto LABEL_7;
    }
    v18 = [(HMBLocalZoneQueryResultRecordIDSequence *)self returnedIDs];
    objc_super v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v10];
    [v18 addObject:v19];
  }
  else
  {
    [(HMBLocalZoneQueryResultRecordIDSequence *)self setLastReturnedSequence:*a5];
    v17 = (void *)MEMORY[0x1E4F1CA80];
    v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v10];
    objc_super v19 = [v17 setWithObject:v18];
    [(HMBLocalZoneQueryResultRecordIDSequence *)self setReturnedIDs:v19];
  }

  v16 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v10];
LABEL_7:
  return v16;
}

- (id)nextObject
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  v42 = v58;
  v41 = v46;
  *(void *)&long long v2 = 138543874;
  long long v40 = v2;
  while (1)
  {
    v3 = [(HMBSQLQueryIterator *)self error];
    BOOL v4 = v3 == 0;

    if (!v4) {
      goto LABEL_38;
    }
    int v5 = [(HMBSQLQueryIterator *)self cachedResults];
    if (!v5) {
      goto LABEL_7;
    }
    id v6 = [(HMBSQLQueryIterator *)self cachedResults];
    if ([v6 count])
    {

      goto LABEL_29;
    }
    v7 = [(HMBLocalZoneQueryResultRecordIDSequence *)self currentSequenceAsData];
    BOOL v8 = v7 == 0;

    if (!v8)
    {
LABEL_7:
      v9 = self;
      while (1)
      {
        sqlite3_int64 v10 = [(HMBSQLQueryIterator *)v9 cachedResults];
        if (v10)
        {
          int v11 = [(HMBSQLQueryIterator *)v9 cachedResults];
          if ([v11 count])
          {

LABEL_28:
            break;
          }
          char v12 = [(HMBLocalZoneQueryResultRecordIDSequence *)v9 currentSequenceAsData];
          BOOL v13 = v12 == 0;

          if (v13) {
            goto LABEL_28;
          }
        }
        uint64_t v14 = [(HMBSQLQueryIterator *)v9 maximumRowsPerQuery];
        uint64_t v60 = 0;
        v61 = &v60;
        uint64_t v62 = 0x3032000000;
        v63 = __Block_byref_object_copy__5179;
        v64 = __Block_byref_object_dispose__5180;
        id v65 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v14];
        uint64_t v55 = 0;
        v56 = &v55;
        uint64_t v57 = 0x3032000000;
        v58[0] = __Block_byref_object_copy__5179;
        v58[1] = __Block_byref_object_dispose__5180;
        id v59 = 0;
        uint64_t v51 = 0;
        v52 = &v51;
        uint64_t v53 = 0x2020000000;
        char v54 = 0;
        int v15 = [(HMBSQLQueryIterator *)v9 statement];
        v16 = [v15 context];
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v46[0] = ____fetchNextBatch_block_invoke_5182;
        v46[1] = &unk_1E69EAA18;
        v17 = v9;
        v47 = v17;
        v48 = &v55;
        v49 = &v51;
        v50 = &v60;
        v18 = [v16 sqlBlockWithActivity:0 block:v45];

        objc_super v19 = (void *)v61[5];
        if (v19)
        {
          if (*((unsigned char *)v52 + 24) || [v19 count])
          {
            v20 = [(HMBLocalZoneQueryResultRecordIDSequence *)v17 currentSequenceAsData];
            BOOL v21 = v20 == 0;

            if (!v21) {
              [(HMBLocalZoneQueryResultRecordIDSequence *)v17 setCurrentSequenceAsData:v56[5]];
            }
            v22 = [(HMBSQLQueryIterator *)v17 cachedResults];
            BOOL v23 = v22 == 0;

            if (v23)
            {
              [(HMBSQLQueryIterator *)v17 setCachedResults:v61[5]];
            }
            else
            {
              v24 = [(HMBSQLQueryIterator *)v17 cachedResults];
              [v24 addObjectsFromArray:v61[5]];
            }
            char v30 = 1;
            goto LABEL_24;
          }
          [(HMBLocalZoneQueryResultRecordIDSequence *)v17 setCurrentSequenceAsData:0];
        }
        else
        {
          v25 = (void *)MEMORY[0x1D944CB30]();
          v26 = v17;
          HMFGetOSLogHandle();
          v27 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            id v28 = (id)objc_claimAutoreleasedReturnValue();
            v29 = [(HMBSQLQueryIterator *)v26 currentSequence];
            *(_DWORD *)buf = v40;
            id v67 = v28;
            __int16 v68 = 2112;
            v69 = v29;
            __int16 v70 = 2112;
            v71 = v18;
            _os_log_impl(&dword_1D4693000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch additional items into query enumeration %@: %@", buf, 0x20u);
          }
          [(HMBSQLQueryIterator *)v26 setError:v18];
          [(HMBLocalZoneQueryResultRecordIDSequence *)v26 setCurrentSequenceAsData:0];
          [(HMBSQLQueryIterator *)v26 setCachedResults:0];
        }
        char v30 = 0;
LABEL_24:

        _Block_object_dispose(&v51, 8);
        _Block_object_dispose(&v55, 8);

        _Block_object_dispose(&v60, 8);
        if ((v30 & 1) == 0) {
          goto LABEL_28;
        }
      }
    }
LABEL_29:
    v31 = [(HMBSQLQueryIterator *)self cachedResults];
    if (![v31 count])
    {

LABEL_36:
      [(HMBLocalZoneQueryResultRecordIDSequence *)self setCurrentSequenceAsData:0];
      goto LABEL_38;
    }
    v32 = [(HMBSQLQueryIterator *)self error];
    BOOL v33 = v32 == 0;

    if (!v33) {
      goto LABEL_36;
    }
    v34 = [(HMBSQLQueryIterator *)self cachedResults];
    v35 = objc_msgSend(v34, "hmf_dequeue");

    id v44 = 0;
    v36 = [(HMBLocalZoneQueryResultRecordIDSequence *)self fetchRow:v35 error:&v44];
    id v37 = v44;
    v38 = v37;
    if (!v36)
    {
      if (v37) {
        break;
      }
    }

    if (v36) {
      goto LABEL_39;
    }
  }
  [(HMBSQLQueryIterator *)self setError:v37];
  [(HMBLocalZoneQueryResultRecordIDSequence *)self setCurrentSequenceAsData:0];

LABEL_38:
  v36 = 0;
LABEL_39:
  return v36;
}

@end