@interface _HDOntologyShardRegistryInsertOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (_HDOntologyShardRegistryInsertOperation)init;
- (_HDOntologyShardRegistryInsertOperation)initWithCoder:(id)a3;
- (id)transactionContext;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HDOntologyShardRegistryInsertOperation

- (_HDOntologyShardRegistryInsertOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [a3 daemon];
  v10 = [v9 ontologyUpdateCoordinator];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80___HDOntologyShardRegistryInsertOperation_performWithProfile_transaction_error___block_invoke;
  v12[3] = &unk_1E62F9428;
  v12[4] = self;
  LOBYTE(a5) = [v10 performOntologyTransactionForWrite:1 databaseTransaction:v8 error:a5 transactionHandler:v12];

  return (char)a5;
}

- (id)transactionContext
{
  v2 = +[HDMutableDatabaseTransactionContext contextForReadingProtectedData];
  [v2 setAllowsJournalingDuringProtectedRead:1];
  v3 = (void *)[v2 copy];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (_HDOntologyShardRegistryInsertOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_HDOntologyShardRegistryInsertOperation;
  v5 = [(_HDOntologyShardRegistryInsertOperation *)&v10 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"entries"];
    entries = v5->_entries;
    v5->_entries = (NSArray *)v7;
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end