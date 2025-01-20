@interface HDOntologyTransaction
- (BOOL)isWriteTransaction;
- (HDDatabaseTransaction)databaseTransaction;
- (HDOntologyTransaction)init;
- (HDOntologyTransaction)initWithProfile:(id)a3 databaseTransaction:(id)a4 graphDatabase:(id)a5 isWriteTransaction:(BOOL)a6;
- (HDProfile)profile;
- (HDSimpleGraphDatabase)graphDatabase;
@end

@implementation HDOntologyTransaction

- (HDOntologyTransaction)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDOntologyTransaction)initWithProfile:(id)a3 databaseTransaction:(id)a4 graphDatabase:(id)a5 isWriteTransaction:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDOntologyTransaction;
  v13 = [(HDOntologyTransaction *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_profile, v10);
    objc_storeStrong((id *)&v14->_databaseTransaction, a4);
    objc_storeStrong((id *)&v14->_graphDatabase, a5);
    v14->_isWriteTransaction = a6;
  }

  return v14;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HDDatabaseTransaction)databaseTransaction
{
  return self->_databaseTransaction;
}

- (HDSimpleGraphDatabase)graphDatabase
{
  return self->_graphDatabase;
}

- (BOOL)isWriteTransaction
{
  return self->_isWriteTransaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphDatabase, 0);
  objc_storeStrong((id *)&self->_databaseTransaction, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end