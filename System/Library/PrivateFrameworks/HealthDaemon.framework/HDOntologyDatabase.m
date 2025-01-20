@interface HDOntologyDatabase
+ (id)ontologyContentVersionWithTransaction:(id)a3 error:(id *)a4;
- (BOOL)isAvailable;
- (BOOL)performTransactionWithDatabaseTransaction:(id)a3 error:(id *)a4 transactionHandler:(id)a5;
- (BOOL)performTransactionWithError:(id *)a3 transactionHandler:(id)a4;
- (BOOL)unitTesting_performWriteTransactionWithError:(id *)a3 transactionHandler:(id)a4;
- (HDOntologyBackingStore)unitTesting_ontologyBackingStore;
- (HDOntologyDatabase)init;
- (HDOntologyDatabase)initWithProfile:(id)a3;
- (HDProfile)profile;
- (id)backingStore;
- (id)ontologyContentVersionWithError:(id *)a3;
- (id)unitTesting_schemaVersionWithError:(id *)a3;
- (void)addOntologyDatabaseAvailabilityObserver:(id)a3;
- (void)invalidateAndWait;
- (void)ontologyBackingStore:(id)a3 didBecomeAvailable:(BOOL)a4;
- (void)removeOntologyDatabaseAvailabilityObserver:(id)a3;
- (void)setUnitTesting_ontologyBackingStore:(id)a3;
- (void)unitTesting_close;
@end

@implementation HDOntologyDatabase

- (HDOntologyDatabase)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDOntologyDatabase)initWithProfile:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDOntologyDatabase;
  v5 = [(HDOntologyDatabase *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    id v7 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v8 = HKLogHealthOntology();
    uint64_t v9 = [v7 initWithName:@"HDOntologyDatabaseAvailabilityObserver" loggingCategory:v8];
    databaseAvailableObservers = v6->_databaseAvailableObservers;
    v6->_databaseAvailableObservers = (HKObserverSet *)v9;
  }
  return v6;
}

- (BOOL)performTransactionWithError:(id *)a3 transactionHandler:(id)a4
{
  id v6 = a4;
  id v7 = -[HDOntologyDatabase backingStore]((uint64_t)self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a3) = [v7 performOntologyTransactionForWrite:0 profile:WeakRetained databaseTransaction:0 error:a3 transactionHandler:v6];

  return (char)a3;
}

- (id)backingStore
{
  if (a1)
  {
    v1 = *(void **)(a1 + 32);
    if (v1)
    {
      id v2 = v1;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      id v4 = [WeakRetained daemon];
      id v2 = [v4 ontologyBackingStore];
    }
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (BOOL)performTransactionWithDatabaseTransaction:(id)a3 error:(id *)a4 transactionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = -[HDOntologyDatabase backingStore]((uint64_t)self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a4) = [v10 performOntologyTransactionForWrite:0 profile:WeakRetained databaseTransaction:v9 error:a4 transactionHandler:v8];

  return (char)a4;
}

- (id)ontologyContentVersionWithError:(id *)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__66;
  v11 = __Block_byref_object_dispose__66;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__HDOntologyDatabase_ontologyContentVersionWithError___block_invoke;
  v6[3] = &unk_1E62FC310;
  v6[4] = &v7;
  if ([(HDOntologyDatabase *)self performTransactionWithError:a3 transactionHandler:v6])
  {
    v3 = (void *)v8[5];
  }
  else
  {
    v3 = 0;
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __54__HDOntologyDatabase_ontologyContentVersionWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = +[HDOntologyDatabase ontologyContentVersionWithTransaction:a2 error:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 1;
}

+ (id)ontologyContentVersionWithTransaction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  self;
  id v6 = +[HDOntologyShardRegistry importedMercuryZipTSVEntriesWithTransaction:v5 error:a4];

  if (!v6)
  {
    id v7 = 0;
    goto LABEL_11;
  }
  id v7 = (id)[objc_alloc(MEMORY[0x1E4F2B308]) initWithShardEntries:v6];

  if (!v7)
  {
LABEL_11:
    v11 = 0;
    goto LABEL_13;
  }
  if ([v7 isEmptyVersion])
  {
    id v8 = v5;
    self;
    uint64_t v9 = [v8 graphDatabase];

    id v15 = 0;
    LODWORD(v8) = [v9 metadataValueForKey:@"ontologyAssetVersion" valueOut:&v15 error:a4];
    v10 = (__CFString *)v15;

    v11 = 0;
    if (v8)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F2B308]);
      if (v10) {
        v13 = v10;
      }
      else {
        v13 = &stru_1F1728D60;
      }
      v11 = (void *)[v12 initWithString:v13];
    }
  }
  else
  {
    id v7 = v7;
    v11 = v7;
  }
LABEL_13:

  return v11;
}

- (void)ontologyBackingStore:(id)a3 didBecomeAvailable:(BOOL)a4
{
  databaseAvailableObservers = self->_databaseAvailableObservers;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__HDOntologyDatabase_ontologyBackingStore_didBecomeAvailable___block_invoke;
  v5[3] = &unk_1E62FC338;
  v5[4] = self;
  BOOL v6 = a4;
  [(HKObserverSet *)databaseAvailableObservers notifyObservers:v5];
}

uint64_t __62__HDOntologyDatabase_ontologyBackingStore_didBecomeAvailable___block_invoke(uint64_t a1, void *a2)
{
  return [a2 ontologyDatabase:*(void *)(a1 + 32) didBecomeAvailable:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)isAvailable
{
  id v2 = -[HDOntologyDatabase backingStore]((uint64_t)self);
  char v3 = [v2 isAvailable];

  return v3;
}

- (void)addOntologyDatabaseAvailabilityObserver:(id)a3
{
  id v5 = a3;
  uint64_t v4 = -[HDOntologyDatabase backingStore]((uint64_t)self);
  [v4 registerOntologyDatabase:self];

  [(HKObserverSet *)self->_databaseAvailableObservers registerObserver:v5];
}

- (void)removeOntologyDatabaseAvailabilityObserver:(id)a3
{
}

- (void)invalidateAndWait
{
}

- (void)unitTesting_close
{
  -[HDOntologyDatabase backingStore]((uint64_t)self);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 close];
}

- (BOOL)unitTesting_performWriteTransactionWithError:(id *)a3 transactionHandler:(id)a4
{
  id v6 = a4;
  id v7 = -[HDOntologyDatabase backingStore]((uint64_t)self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a3) = [v7 performOntologyTransactionForWrite:1 profile:WeakRetained databaseTransaction:0 error:a3 transactionHandler:v6];

  return (char)a3;
}

- (id)unitTesting_schemaVersionWithError:(id *)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__66;
  v11 = __Block_byref_object_dispose__66;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__HDOntologyDatabase_unitTesting_schemaVersionWithError___block_invoke;
  v6[3] = &unk_1E62FC310;
  v6[4] = &v7;
  if ([(HDOntologyDatabase *)self performTransactionWithError:a3 transactionHandler:v6])
  {
    char v3 = (void *)v8[5];
  }
  else
  {
    char v3 = 0;
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

BOOL __57__HDOntologyDatabase_unitTesting_schemaVersionWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 graphDatabase];
  uint64_t v6 = [v5 schemaVersionWithError:a3];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HDOntologyBackingStore)unitTesting_ontologyBackingStore
{
  return self->_unitTesting_ontologyBackingStore;
}

- (void)setUnitTesting_ontologyBackingStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTesting_ontologyBackingStore, 0);
  objc_destroyWeak((id *)&self->_profile);

  objc_storeStrong((id *)&self->_databaseAvailableObservers, 0);
}

@end