@interface HMBSQLStatement
+ (BOOL)explainStatements;
+ (id)logCategory;
+ (id)queryPlansForContext:(id)a3 statement:(id)a4;
+ (sqlite3_stmt)sqlStatementForContext:(id)a3 statement:(id)a4;
+ (void)setExplainStatements:(BOOL)a3;
- (BOOL)isFinalized;
- (HMBSQLContext)context;
- (HMBSQLStatement)initWithContext:(id)a3 statement:(id)a4;
- (HMBSQLStatement)initWithContext:(id)a3 statement:(sqlite3_stmt *)a4 queryPlans:(id)a5;
- (NSArray)queryPlans;
- (id)logIdentifier;
- (sqlite3_stmt)statement;
- (void)dealloc;
- (void)finalize;
- (void)setFinalized:(BOOL)a3;
@end

@implementation HMBSQLStatement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryPlans, 0);
  objc_destroyWeak((id *)&self->_context);
}

- (void)setFinalized:(BOOL)a3
{
  self->_finalized = a3;
}

- (BOOL)isFinalized
{
  return self->_finalized;
}

- (NSArray)queryPlans
{
  return self->_queryPlans;
}

- (sqlite3_stmt)statement
{
  return self->_statement;
}

- (HMBSQLContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (HMBSQLContext *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMBSQLStatement *)self context];
  v3 = [v2 logIdentifier];

  return v3;
}

- (void)finalize
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D944CB30](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v14 = 138543618;
    v15 = v6;
    __int16 v16 = 2048;
    uint64_t v17 = [(HMBSQLStatement *)v4 statement];
    _os_log_impl(&dword_1D4693000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Finalizing statement: %p", (uint8_t *)&v14, 0x16u);
  }
  if ([(HMBSQLStatement *)v4 isFinalized]) {
    _HMFPreconditionFailure();
  }
  v7 = [(HMBSQLStatement *)v4 context];
  v8 = (os_unfair_lock *)v7;
  if (v7)
  {
    os_unfair_lock_assert_owner(v7 + 2);
    sqlite3_finalize([(HMBSQLStatement *)v4 statement]);
    [(HMBSQLStatement *)v4 setFinalized:1];
  }
  else
  {
    v9 = (void *)MEMORY[0x1D944CB30]();
    v10 = v4;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      uint64_t v13 = [(HMBSQLStatement *)v10 statement];
      int v14 = 138543618;
      v15 = v12;
      __int16 v16 = 2048;
      uint64_t v17 = v13;
      _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_ERROR, "%{public}@Can't finalize statement %p: its context is gone", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (![(HMBSQLStatement *)self isFinalized])
  {
    v3 = [(HMBSQLStatement *)self context];
    if (v3)
    {
      os_unfair_lock_lock_with_options();
      [(HMBSQLStatement *)self finalize];
      os_unfair_lock_unlock(v3 + 2);
    }
    else
    {
      v4 = (void *)MEMORY[0x1D944CB30]();
      v5 = self;
      v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v10 = v7;
        __int16 v11 = 2048;
        uint64_t v12 = [(HMBSQLStatement *)v5 statement];
        _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_ERROR, "%{public}@Can't finalize statement %p: its context is gone", buf, 0x16u);
      }
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)HMBSQLStatement;
  [(HMBSQLStatement *)&v8 dealloc];
}

- (HMBSQLStatement)initWithContext:(id)a3 statement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (HMBSQLStatement *)[(id)objc_opt_class() sqlStatementForContext:v6 statement:v7];
  if (v8)
  {
    v9 = [(id)objc_opt_class() queryPlansForContext:v6 statement:v7];
    self = [(HMBSQLStatement *)self initWithContext:v6 statement:v8 queryPlans:v9];

    objc_super v8 = self;
  }

  return v8;
}

- (HMBSQLStatement)initWithContext:(id)a3 statement:(sqlite3_stmt *)a4 queryPlans:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMBSQLStatement;
  v10 = [(HMBSQLStatement *)&v13 init];
  __int16 v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_context, v8);
    v11->_statement = a4;
    objc_storeStrong((id *)&v11->_queryPlans, a5);
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7 != -1) {
    dispatch_once(&logCategory__hmf_once_t7, &__block_literal_global_42);
  }
  v2 = (void *)logCategory__hmf_once_v8;
  return v2;
}

uint64_t __30__HMBSQLStatement_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v8;
  logCategory__hmf_once_id v8 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)queryPlansForContext:(id)a3 statement:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([a1 explainStatements])
  {
    id v8 = (sqlite3 *)[v6 connection];
    id v9 = [@"EXPLAIN QUERY PLAN " stringByAppendingString:v7];
    v10 = (const char *)[v9 UTF8String];
    id v19 = 0;
    __int16 v11 = selectSQLite3(v8, v10, MEMORY[0x1E4F1CC08], &v19);
    id v12 = v19;

    if (v11)
    {
      objc_super v13 = objc_msgSend(v11, "na_map:", &__block_literal_global_129);
    }
    else
    {
      int v14 = (void *)MEMORY[0x1D944CB30]();
      id v15 = a1;
      __int16 v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v21 = v17;
        __int16 v22 = 2112;
        id v23 = v7;
        __int16 v24 = 2112;
        id v25 = v12;
        _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to explain statement '%@': %@", buf, 0x20u);
      }
      objc_super v13 = 0;
    }
  }
  else
  {
    objc_super v13 = 0;
  }

  return v13;
}

HMBSQLStatementQueryPlanTuple *__50__HMBSQLStatement_queryPlansForContext_statement___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HMBSQLStatementQueryPlanTuple alloc] initWithRow:v2];

  return v3;
}

+ (sqlite3_stmt)sqlStatementForContext:(id)a3 statement:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (sqlite3 *)[v6 connection];
  id v9 = v7;
  id v23 = 0;
  v10 = prepareSQLite3(v8, (const char *)[v9 UTF8String], &v23);
  id v11 = v23;
  id v12 = (void *)MEMORY[0x1D944CB30]();
  id v13 = a1;
  int v14 = HMFGetOSLogHandle();
  id v15 = v14;
  if (v10)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      __int16 v16 = HMFGetLogIdentifier();
      uint64_t v17 = sqlite3_sql(v10);
      *(_DWORD *)buf = 138543618;
      id v25 = v16;
      __int16 v26 = 2080;
      v27 = v17;
      uint64_t v18 = "%{public}@Prepared SQL statement: %s";
      id v19 = v15;
      os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
      uint32_t v21 = 22;
LABEL_6:
      _os_log_impl(&dword_1D4693000, v19, v20, v18, buf, v21);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __int16 v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v25 = v16;
    __int16 v26 = 2112;
    v27 = (const char *)v9;
    __int16 v28 = 2112;
    id v29 = v11;
    uint64_t v18 = "%{public}@Unable to prepare SQL statement '%@': %@";
    id v19 = v15;
    os_log_type_t v20 = OS_LOG_TYPE_ERROR;
    uint32_t v21 = 32;
    goto LABEL_6;
  }

  return v10;
}

+ (void)setExplainStatements:(BOOL)a3
{
  _explainStatements = a3;
}

+ (BOOL)explainStatements
{
  return _explainStatements;
}

@end