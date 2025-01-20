@interface _HDOntologyFeatureCoordinatorRequireOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (_HDOntologyFeatureCoordinatorRequireOperation)init;
- (_HDOntologyFeatureCoordinatorRequireOperation)initWithCoder:(id)a3;
- (id)transactionContext;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HDOntologyFeatureCoordinatorRequireOperation

- (_HDOntologyFeatureCoordinatorRequireOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v8 = self->_items;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  v12 = [v9 daemon];
  v13 = [v12 ontologyUpdateCoordinator];

  v14 = [v13 featureCoordinator];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __85__HDOntologyFeatureCoordinator__processRequiredShardItems_profile_transaction_error___block_invoke;
  v26[3] = &unk_1E6309310;
  v15 = v8;
  v27 = v15;
  v16 = v14;
  v28 = v16;
  v29 = &v30;
  char v17 = [v13 performOntologyTransactionForWrite:1 databaseTransaction:v10 error:a5 transactionHandler:v26];
  _HKInitializeLogging();
  v18 = HKLogHealthOntology();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = HKStringFromBool();
    *(_DWORD *)buf = 138543618;
    uint64_t v35 = v11;
    __int16 v36 = 2114;
    v37 = v19;
    _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: has new required shards %{public}@", buf, 0x16u);
  }
  if (*((unsigned char *)v31 + 24) && v16)
  {
    _HKInitializeLogging();
    v20 = HKLogHealthOntology();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = (uint64_t)v16;
      _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Trigger gated ontology update", buf, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained(v16 + 8);
    [WeakRetained triggerGatedUpdateWithMaximumDelay:&__block_literal_global_348 completion:5.0];
  }
  _HKInitializeLogging();
  v22 = HKLogHealthOntology();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = HKStringFromBool();
    id v24 = *a5;
    *(_DWORD *)buf = 138543874;
    uint64_t v35 = v11;
    __int16 v36 = 2112;
    v37 = v23;
    __int16 v38 = 2112;
    id v39 = v24;
    _os_log_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: _processRequiredShardItems success %@: %@", buf, 0x20u);
  }
  _Block_object_dispose(&v30, 8);

  return v17;
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

- (_HDOntologyFeatureCoordinatorRequireOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_HDOntologyFeatureCoordinatorRequireOperation;
  v5 = [(_HDOntologyFeatureCoordinatorRequireOperation *)&v10 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"items"];
    items = v5->_items;
    v5->_items = (NSArray *)v7;
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end