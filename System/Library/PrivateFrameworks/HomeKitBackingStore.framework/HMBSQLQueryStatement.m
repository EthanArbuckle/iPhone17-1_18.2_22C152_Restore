@interface HMBSQLQueryStatement
- (HMBSQLQueryStatement)initWithContext:(id)a3 statement:(id)a4;
- (HMBSQLQueryStatement)initWithContext:(id)a3 statement:(sqlite3_stmt *)a4 queryPlans:(id)a5 arguments:(id)a6;
- (NSDictionary)arguments;
@end

@implementation HMBSQLQueryStatement

- (void).cxx_destruct
{
}

- (NSDictionary)arguments
{
  return self->_arguments;
}

- (HMBSQLQueryStatement)initWithContext:(id)a3 statement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(id)objc_opt_class() sqlStatementForContext:v6 statement:v7];
  if (v8)
  {
    v9 = (sqlite3_stmt *)v8;
    v18 = [(id)objc_opt_class() queryPlansForContext:v6 statement:v7];
    v10 = [MEMORY[0x1E4F1CA60] dictionary];
    for (uint64_t i = 0; (int)i <= sqlite3_bind_parameter_count(v9); uint64_t i = (i + 1))
    {
      v12 = sqlite3_bind_parameter_name(v9, i);
      if (v12)
      {
        v13 = v12;
        if (*v12 != 63)
        {
          v14 = [MEMORY[0x1E4F28ED0] numberWithInt:i];
          v15 = [NSString stringWithUTF8String:v13 + 1];
          [v10 setObject:v14 forKey:v15];
        }
      }
    }
    self = [(HMBSQLQueryStatement *)self initWithContext:v6 statement:v9 queryPlans:v18 arguments:v10];

    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (HMBSQLQueryStatement)initWithContext:(id)a3 statement:(sqlite3_stmt *)a4 queryPlans:(id)a5 arguments:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HMBSQLQueryStatement;
  v12 = [(HMBSQLStatement *)&v15 initWithContext:a3 statement:a4 queryPlans:a5];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_arguments, a6);
  }

  return v13;
}

@end