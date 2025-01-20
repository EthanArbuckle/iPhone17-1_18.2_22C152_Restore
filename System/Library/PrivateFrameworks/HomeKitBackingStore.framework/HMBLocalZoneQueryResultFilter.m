@interface HMBLocalZoneQueryResultFilter
- (HMBLocalSQLQueryTableQueryAll)query;
- (HMBLocalZoneQueryResultFilter)initWithLocalZone:(id)a3 statement:(id)a4 columns:(id)a5 filter:(id)a6;
- (NSArray)columns;
- (id)fetchRowFromStatement:(sqlite3_stmt *)a3 skip:(BOOL *)a4 updatedSequence:(unint64_t *)a5 error:(id *)a6;
- (id)filter;
@end

@implementation HMBLocalZoneQueryResultFilter

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

- (id)filter
{
  return self->_filter;
}

- (NSArray)columns
{
  return self->_columns;
}

- (HMBLocalSQLQueryTableQueryAll)query
{
  return self->_query;
}

- (id)fetchRowFromStatement:(sqlite3_stmt *)a3 skip:(BOOL *)a4 updatedSequence:(unint64_t *)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v11 = (void *)MEMORY[0x1E4F1CA60];
  v12 = [(HMBLocalZoneQueryResultFilter *)self columns];
  v13 = objc_msgSend(v11, "dictionaryWithCapacity:", objc_msgSend(v12, "count"));

  *a5 = sqlite3_column_int64(a3, 0);
  v14 = [(HMBLocalZoneQueryResultFilter *)self columns];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __82__HMBLocalZoneQueryResultFilter_fetchRowFromStatement_skip_updatedSequence_error___block_invoke;
  v27 = &unk_1E69EA5F8;
  v29 = a3;
  id v15 = v13;
  id v28 = v15;
  [v14 enumerateObjectsUsingBlock:&v24];

  v16 = [(HMBLocalZoneQueryResultFilter *)self filter];
  uint64_t v17 = ((uint64_t (**)(void, id))v16)[2](v16, v15);

  if (v17)
  {
    if (v17 == 2) {
      goto LABEL_10;
    }
    if (v17 == 1)
    {
      v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*a5];
      goto LABEL_11;
    }
    v19 = (void *)MEMORY[0x1D944CB30]();
    v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v31 = v22;
      __int16 v32 = 2048;
      uint64_t v33 = v17;
      _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unknown filter result received: %lu", buf, 0x16u);
    }
    if (!a6)
    {
LABEL_10:
      v18 = 0;
    }
    else
    {
      [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
      v18 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    *a4 = 1;
    v18 = &unk_1F2C4CA50;
  }
LABEL_11:

  return v18;
}

void __82__HMBLocalZoneQueryResultFilter_fetchRowFromStatement_skip_updatedSequence_error___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = objc_msgSend(MEMORY[0x1E4F1C9B8], "hmbDataWithSQLite3ColumnNoCopy:column:", *(void *)(a1 + 40), objc_msgSend(v8, "offset"));
  if (v3)
  {
    v4 = [v8 modelField];
    v5 = [v4 decodeQueryableValue:v3];
    v6 = *(void **)(a1 + 32);
    v7 = [v8 name];
    [v6 setObject:v5 forKeyedSubscript:v7];
  }
}

- (HMBLocalZoneQueryResultFilter)initWithLocalZone:(id)a3 statement:(id)a4 columns:(id)a5 filter:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  unint64_t v15 = +[HMBSQLQueryIterator maximumRowsPerSelect];
  v20.receiver = self;
  v20.super_class = (Class)HMBLocalZoneQueryResultFilter;
  v16 = [(HMBLocalZoneQueryResult *)&v20 initWithLocalZone:v14 statement:v13 initialSequence:&unk_1F2C4CA50 arguments:MEMORY[0x1E4F1CC08] maximumRowsPerSelect:v15];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_columns, a5);
    uint64_t v17 = MEMORY[0x1D944CD20](v12);
    id filter = v16->_filter;
    v16->_id filter = (id)v17;
  }
  return v16;
}

@end