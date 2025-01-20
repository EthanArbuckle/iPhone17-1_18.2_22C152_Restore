@interface PHChangeRequest
+ (id)sanitizedFailureWithError:(id)a3;
- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (BOOL)isClientEntitled;
- (BOOL)isMutated;
- (BOOL)isNewRequest;
- (BOOL)prepareForPhotoLibraryCheck:(id)a3 error:(id *)a4;
- (BOOL)prepareForServicePreflightCheck:(id *)a3;
- (BOOL)shouldPerformConcurrentWork;
- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (BOOL)validateMutationsToManagedObject:(id)a3 error:(id *)a4;
- (NSManagedObjectID)objectID;
- (NSString)changeTypeForSummary;
- (NSString)clientBundleID;
- (NSString)clientName;
- (NSString)managedEntityName;
- (NSString)uuid;
- (PHChangeRequest)init;
- (PHChangeRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (PHChangeRequestHelper)helper;
- (PHCreationRequestOptions)creationOptions;
- (PHPhotoLibrary)photoLibrary;
- (PLChangesForServiceHandling)changesForServiceHandler;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)initForNewObject;
- (int64_t)accessScopeOptionsRequirement;
- (void)didMutate;
- (void)encodeToXPCDict:(id)a3;
- (void)performConcurrentWork;
- (void)setCreationOptions:(id)a3;
- (void)setShouldPerformConcurrentWork:(BOOL)a3;
@end

@implementation PHChangeRequest

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoLibrary);

  objc_storeStrong((id *)&self->_helper, 0);
}

- (PHPhotoLibrary)photoLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  return (PHPhotoLibrary *)WeakRetained;
}

- (PHChangeRequestHelper)helper
{
  return self->_helper;
}

- (void)setShouldPerformConcurrentWork:(BOOL)a3
{
  self->_shouldPerformConcurrentWork = a3;
}

- (BOOL)shouldPerformConcurrentWork
{
  return self->_shouldPerformConcurrentWork;
}

- (PHCreationRequestOptions)creationOptions
{
  return [(PHChangeRequestHelper *)self->_helper creationOptions];
}

- (void)setCreationOptions:(id)a3
{
}

- (void)didMutate
{
}

- (BOOL)prepareForServicePreflightCheck:(id *)a3
{
  v4 = [(PHChangeRequest *)self helper];
  v5 = v4;
  if (v4) {
    char v6 = [v4 prepareForServicePreflightCheck:a3];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)prepareForPhotoLibraryCheck:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(PHChangeRequest *)self helper];
  v8 = v7;
  if (v7) {
    char v9 = [v7 prepareForPhotoLibraryCheck:v6 error:a4];
  }
  else {
    char v9 = 1;
  }

  return v9;
}

- (NSString)changeTypeForSummary
{
  v2 = [(PHChangeRequest *)self managedEntityName];
  if (!v2)
  {
    v2 = [(id)objc_opt_class() description];
  }

  return (NSString *)v2;
}

- (int64_t)accessScopeOptionsRequirement
{
  return 7;
}

- (PLChangesForServiceHandling)changesForServiceHandler
{
  return 0;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = (objc_class *)objc_opt_class();
  char v9 = NSStringFromClass(v8);
  v10 = NSStringFromSelector(a2);
  v11 = [v7 stringWithFormat:@"%@ must implement %@", v9, v10];
  v12 = (void *)[v5 initWithName:v6 reason:v11 userInfo:0];

  objc_exception_throw(v12);
}

- (PHChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  v10 = NSString;
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v13 = NSStringFromSelector(a2);
  v14 = [v10 stringWithFormat:@"%@ must implement %@", v12, v13];
  v15 = (void *)[v8 initWithName:v9 reason:v14 userInfo:0];

  objc_exception_throw(v15);
}

- (NSString)uuid
{
  v2 = [(PHChangeRequest *)self helper];
  v3 = [v2 uuid];

  return (NSString *)v3;
}

- (BOOL)isMutated
{
  v2 = [(PHChangeRequest *)self helper];
  char v3 = [v2 isMutated];

  return v3;
}

- (id)initForNewObject
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v5 stringWithFormat:@"%@ must implement %@", v7, v8];
  v10 = (void *)[v3 initWithName:v4 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (BOOL)isNewRequest
{
  v2 = [(PHChangeRequest *)self helper];
  char v3 = [v2 isNewRequest];

  return v3;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  return [(PHChangeRequestHelper *)self->_helper allowMutationToManagedObject:a3 propertyKey:a4 error:a5];
}

- (BOOL)validateMutationsToManagedObject:(id)a3 error:(id *)a4
{
  return [(PHChangeRequestHelper *)self->_helper validateMutationsToManagedObject:a3 error:a4];
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  return [(PHChangeRequestHelper *)self->_helper applyMutationsToManagedObject:a3 error:a5];
}

- (void)performConcurrentWork
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v5 stringWithFormat:@"%@ must implement %@", v7, v8];
  v10 = (void *)[v3 initWithName:v4 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  id v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  v10 = NSStringFromSelector(a2);
  v11 = [v7 stringWithFormat:@"%@ must implement %@", v9, v10];
  v12 = (void *)[v5 initWithName:v6 reason:v11 userInfo:0];

  v13 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    v14 = [v12 description];
    *(_DWORD *)buf = 136315394;
    v17 = "-[PHChangeRequest createManagedObjectForInsertIntoPhotoLibrary:error:]";
    __int16 v18 = 2114;
    v19 = v14;
    _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_FAULT, "Exception in %s: %{public}@", buf, 0x16u);
  }
  return 0;
}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  return 1;
}

- (PHChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v12 = *MEMORY[0x1E4F1C3B8];
  v13 = NSString;
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  v16 = NSStringFromSelector(a2);
  v17 = [v13 stringWithFormat:@"%@ must implement %@", v15, v16];
  __int16 v18 = (void *)[v11 initWithName:v12 reason:v17 userInfo:0];

  objc_exception_throw(v18);
}

- (NSString)managedEntityName
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSString;
  uint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = NSStringFromSelector(a2);
  id v9 = [v5 stringWithFormat:@"%@ must implement %@", v7, v8];
  id v10 = (void *)[v3 initWithName:v4 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (NSString)clientBundleID
{
  return [(PHChangeRequestHelper *)self->_helper clientBundleIdentifier];
}

- (NSString)clientName
{
  return [(PHChangeRequestHelper *)self->_helper clientDisplayName];
}

- (BOOL)isClientEntitled
{
  return [(PHChangeRequestHelper *)self->_helper isClientEntitled];
}

- (NSManagedObjectID)objectID
{
  return [(PHChangeRequestHelper *)self->_helper objectID];
}

- (PHChangeRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)PHChangeRequest;
  v2 = [(PHChangeRequest *)&v5 init];
  if (v2 && (PLIsAssetsd() & 1) == 0)
  {
    +[PHPhotoLibrary assertTransaction];
    id v3 = [(id)objc_opt_class() photoLibraryForCurrentTransaction];
    objc_storeWeak((id *)&v2->_photoLibrary, v3);
  }
  return v2;
}

+ (id)sanitizedFailureWithError:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    objc_super v5 = [v3 domain];
    int v6 = [v5 isEqualToString:*MEMORY[0x1E4F8C500]];

    id v7 = v4;
    if (v6)
    {
      id v7 = PHErrorFromPLError(v4);
    }
    id v8 = [v7 domain];
    int v9 = [v8 isEqualToString:*MEMORY[0x1E4F8B288]];

    if (v9)
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithUnderlyingError:localizedDescription:", v4, @"Shared Album change failed");

      id v7 = (void *)v10;
    }
    id v11 = [v7 domain];
    int v12 = [v11 isEqualToString:@"PHPhotosErrorDomain"];

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = [v7 code];
      v15 = [v7 userInfo];
      v16 = objc_msgSend(v13, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", v14, v15);
    }
    else
    {
      uint64_t v20 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v4;
        _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_ERROR, "Failed to santize unexpected error from change processing: %@", buf, 0xCu);
      }

      v21 = (void *)MEMORY[0x1E4F28C58];
      v22 = [v4 localizedDescription];
      v16 = objc_msgSend(v21, "ph_genericErrorWithLocalizedDescription:", @"Changes failed with error %@", v22);
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26 = @"Unexpected failure with nil error";
    __int16 v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v16 = objc_msgSend(v17, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v18);

    v19 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_FAULT, "Unexpected failure with nil error", buf, 2u);
    }
  }
  v23 = [MEMORY[0x1E4F8B9B8] failureWithError:v16];

  return v23;
}

@end