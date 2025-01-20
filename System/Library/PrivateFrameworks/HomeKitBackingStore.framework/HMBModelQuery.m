@interface HMBModelQuery
- (BOOL)hasExpectedIndexes;
- (Class)modelClass;
- (HMBModelQuery)initWithSQLPredicate:(id)a3 initialSequence:(id)a4 maximumRowsPerSelect:(unint64_t)a5 arguments:(id)a6;
- (NSDictionary)argumentFields;
- (NSDictionary)arguments;
- (NSDictionary)encodedDefaultValuesByArgumentName;
- (NSMapTable)preparedQueries;
- (NSNumber)initialSequence;
- (NSString)sqlPredicate;
- (NSString)sqlSelect;
- (id)description;
- (id)performQueryOn:(id)a3 arguments:(id)a4;
- (id)prepareOnTable:(id)a3;
- (id)sqlSelectStatementForModelType:(id)a3;
- (unint64_t)maximumRowsPerSelect;
- (void)setModelClass:(Class)a3;
@end

@implementation HMBModelQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedDefaultValuesByArgumentName, 0);
  objc_storeStrong((id *)&self->_argumentFields, 0);
  objc_storeStrong((id *)&self->_sqlSelect, 0);
  objc_storeStrong((id *)&self->_modelClass, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_initialSequence, 0);
  objc_storeStrong((id *)&self->_sqlPredicate, 0);
  objc_storeStrong((id *)&self->_preparedQueries, 0);
}

- (NSDictionary)encodedDefaultValuesByArgumentName
{
  return self->_encodedDefaultValuesByArgumentName;
}

- (NSDictionary)argumentFields
{
  return self->_argumentFields;
}

- (NSString)sqlSelect
{
  return self->_sqlSelect;
}

- (Class)modelClass
{
  return self->_modelClass;
}

- (NSDictionary)arguments
{
  return self->_arguments;
}

- (NSNumber)initialSequence
{
  return self->_initialSequence;
}

- (unint64_t)maximumRowsPerSelect
{
  return self->_maximumRowsPerSelect;
}

- (NSString)sqlPredicate
{
  return self->_sqlPredicate;
}

- (NSMapTable)preparedQueries
{
  return self->_preparedQueries;
}

- (BOOL)hasExpectedIndexes
{
  if (!+[HMBSQLStatement explainStatements])
  {
    v3 = (HMBModelQuery *)_HMFPreconditionFailure();
    [(HMBModelQuery *)v3 sqlSelectStatementForModelType:v5];
  }
  return 1;
}

- (id)sqlSelectStatementForModelType:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)performQueryOn:(id)a3 arguments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  id v10 = NSString;
  v11 = NSStringFromSelector(a2);
  v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (id)description
{
  v3 = NSString;
  id v4 = [(HMBModelQuery *)self modelClass];
  if (v4)
  {
    NSStringFromClass([(HMBModelQuery *)self modelClass]);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = @"Unknown";
  }
  id v6 = [(HMBModelQuery *)self sqlPredicate];
  id v7 = [v3 stringWithFormat:@"<HMBModelUnindexedQuery class: %@ query: '%@'>", v5, v6];

  if (v4) {
  return v7;
  }
}

- (id)prepareOnTable:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 context];
  id v6 = [(HMBModelQuery *)self preparedQueries];
  id v7 = [v6 objectForKey:v5];

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    uint64_t v9 = [v4 modelType];
    v8 = [(HMBModelQuery *)self sqlSelectStatementForModelType:v9];

    id v10 = [[HMBSQLQueryStatement alloc] initWithContext:v5 statement:v8];
    if (!v10)
    {
      v28 = (void *)MEMORY[0x1D944CB30]();
      v29 = self;
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v46 = v31;
        __int16 v47 = 2112;
        v48 = v8;
        _os_log_impl(&dword_1D4693000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to prepare statement: %@", buf, 0x16u);
      }
      v32 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v33 = *MEMORY[0x1E4F1C3B8];
      v34 = [NSString stringWithFormat:@"Failed to prepare statement: %@", v8];
      id v35 = [v32 exceptionWithName:v33 reason:v34 userInfo:0];

      objc_exception_throw(v35);
    }
    id v7 = v10;
    v11 = [(HMBModelQuery *)self preparedQueries];
    [v11 setObject:v7 forKey:v5];

    p_sqlSelect = &self->_sqlSelect;
    if (!self->_sqlSelect && v8)
    {
      id v13 = (void *)MEMORY[0x1E4F1CA60];
      v14 = [(HMBModelQuery *)self arguments];
      v36 = objc_msgSend(v13, "dictionaryWithCapacity:", objc_msgSend(v14, "count"));

      v15 = (void *)MEMORY[0x1E4F1CA60];
      v16 = [(HMBModelQuery *)self arguments];
      v17 = objc_msgSend(v15, "dictionaryWithCapacity:", objc_msgSend(v16, "count"));

      v18 = [(objc_class *)[(HMBModelQuery *)self modelClass] hmbProperties];
      v19 = [v7 arguments];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __32__HMBModelQuery_prepareOnTable___block_invoke;
      v41[3] = &unk_1E69EA6C0;
      v41[4] = self;
      id v42 = v18;
      v20 = v36;
      v43 = v20;
      v21 = v17;
      v44 = v21;
      id v37 = v18;
      [v19 enumerateKeysAndObjectsUsingBlock:v41];

      v22 = [(HMBModelQuery *)self arguments];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __32__HMBModelQuery_prepareOnTable___block_invoke_42;
      v38[3] = &unk_1E69EA6E8;
      id v7 = v7;
      id v39 = v7;
      v40 = self;
      [v22 enumerateKeysAndObjectsUsingBlock:v38];

      argumentFields = self->_argumentFields;
      self->_argumentFields = v20;
      v24 = v20;

      encodedDefaultValuesByArgumentName = self->_encodedDefaultValuesByArgumentName;
      self->_encodedDefaultValuesByArgumentName = v21;
      v26 = v21;

      objc_storeStrong((id *)p_sqlSelect, v8);
    }
  }

  return v7;
}

void __32__HMBModelQuery_prepareOnTable___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v38 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) arguments];
  id v7 = [v6 objectForKey:v38];

  if ((![v38 isEqualToString:@"_sequence_offset"] || v7)
    && ([v38 hasPrefix:@"_"] & 1) == 0)
  {
    if (!v7)
    {
      v14 = (void *)MEMORY[0x1D944CB30]();
      id v15 = *(id *)(a1 + 32);
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = HMFGetLogIdentifier();
        v18 = [*(id *)(a1 + 32) arguments];
        *(_DWORD *)buf = 138543874;
        v40 = v17;
        __int16 v41 = 2112;
        id v42 = v38;
        __int16 v43 = 2112;
        uint64_t v44 = (uint64_t)v18;
        _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_ERROR, "%{public}@The query statement's SQL contains an argument named '%@' which does not exist as an argument in the query's argument dictionary: %@", buf, 0x20u);
      }
      v19 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v20 = *MEMORY[0x1E4F1C3B8];
      v21 = NSString;
      v22 = [*(id *)(a1 + 32) arguments];
      v23 = [v21 stringWithFormat:@"The query statement's SQL contains an argument named '%@' which does not exist as an argument in the query's argument dictionary: %@", v38, v22];
      id v24 = [v19 exceptionWithName:v20 reason:v23 userInfo:0];

      objc_exception_throw(v24);
    }
    v8 = *(void **)(a1 + 40);
    uint64_t v9 = [v7 propertyName];
    id v10 = [v8 objectForKey:v9];

    if (!v10)
    {
      v25 = (void *)MEMORY[0x1D944CB30]();
      id v26 = *(id *)(a1 + 32);
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = HMFGetLogIdentifier();
        v29 = [v7 propertyName];
        uint64_t v30 = [*(id *)(a1 + 32) modelClass];
        uint64_t v31 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        v40 = v28;
        __int16 v41 = 2112;
        id v42 = v29;
        __int16 v43 = 2112;
        uint64_t v44 = v30;
        __int16 v45 = 2112;
        uint64_t v46 = v31;
        _os_log_impl(&dword_1D4693000, v27, OS_LOG_TYPE_ERROR, "%{public}@The query statement's SQL contains an argument for a property named '%@' which does not exist as a property on %@: %@", buf, 0x2Au);
      }
      v32 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v33 = *MEMORY[0x1E4F1C3B8];
      v34 = NSString;
      id v35 = [v7 propertyName];
      v36 = [v34 stringWithFormat:@"The query statement's SQL contains an argument for a property named '%@' which does not exist as a property on %@: %@", v35, objc_msgSend(*(id *)(a1 + 32), "modelClass"), *(void *)(a1 + 40)];
      id v37 = [v32 exceptionWithName:v33 reason:v36 userInfo:0];

      objc_exception_throw(v37);
    }
    [*(id *)(a1 + 48) setObject:v10 forKey:v38];
    uint64_t v11 = [v7 defaultValue];
    if (v11)
    {
      v12 = (void *)v11;
      id v13 = [v10 encodeQueryableValue:v11];
    }
    else
    {
      id v13 = [MEMORY[0x1E4F1CA98] null];
    }
    [*(id *)(a1 + 56) setObject:v13 forKeyedSubscript:v38];
  }
}

void __32__HMBModelQuery_prepareOnTable___block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) arguments];
  id v7 = [v6 objectForKey:v19];

  if (!v7)
  {
    v8 = (void *)MEMORY[0x1D944CB30]();
    id v9 = *(id *)(a1 + 40);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      v12 = [*(id *)(a1 + 32) arguments];
      *(_DWORD *)buf = 138543874;
      v21 = v11;
      __int16 v22 = 2112;
      id v23 = v19;
      __int16 v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_ERROR, "%{public}@The query's argument dictionary contains an argument named '%@' which does not exist as an argument in the query statement's SQL: %@", buf, 0x20u);
    }
    id v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3B8];
    id v15 = NSString;
    v16 = [*(id *)(a1 + 32) arguments];
    v17 = [v15 stringWithFormat:@"The query's argument dictionary contains an argument named '%@' which does not exist as an argument in the query statement's SQL: %@", v19, v16];
    id v18 = [v13 exceptionWithName:v14 reason:v17 userInfo:0];

    objc_exception_throw(v18);
  }
}

- (void)setModelClass:(Class)a3
{
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    _HMFPreconditionFailure();
LABEL_7:
    id v5 = (HMBModelQuery *)_HMFPreconditionFailure();
    [(HMBModelQuery *)v5 initWithSQLPredicate:v7 initialSequence:v8 maximumRowsPerSelect:v9 arguments:v10];
    return;
  }
  if (!self->_modelClass) {
    objc_storeStrong((id *)&self->_modelClass, a3);
  }
  if ([(HMBModelQuery *)self modelClass] != a3) {
    goto LABEL_7;
  }
}

- (HMBModelQuery)initWithSQLPredicate:(id)a3 initialSequence:(id)a4 maximumRowsPerSelect:(unint64_t)a5 arguments:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMBModelQuery;
  uint64_t v14 = [(HMBModelQuery *)&v21 init];
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sqlPredicate, a3);
    uint64_t v16 = [v13 copy];
    arguments = v15->_arguments;
    v15->_arguments = (NSDictionary *)v16;

    objc_storeStrong((id *)&v15->_initialSequence, a4);
    v15->_maximumRowsPerSelect = a5;
    uint64_t v18 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    preparedQueries = v15->_preparedQueries;
    v15->_preparedQueries = (NSMapTable *)v18;
  }
  return v15;
}

@end