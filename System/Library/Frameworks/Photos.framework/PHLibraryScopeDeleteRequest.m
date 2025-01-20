@interface PHLibraryScopeDeleteRequest
- (BOOL)photosctlExpungeOverride;
- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4;
- (PHLibraryScopeDeleteRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (int64_t)operation;
- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4;
- (void)encodeToXPCDict:(id)a3;
- (void)setOperation:(int64_t)a3;
- (void)setPhotosctlExpungeOverride:(BOOL)a3;
@end

@implementation PHLibraryScopeDeleteRequest

- (void)setPhotosctlExpungeOverride:(BOOL)a3
{
  self->_photosctlExpungeOverride = a3;
}

- (BOOL)photosctlExpungeOverride
{
  return self->_photosctlExpungeOverride;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int64_t v6 = [(PHLibraryScopeDeleteRequest *)self operation];
  switch(v6)
  {
    case 2:
      id v10 = 0;
      char v7 = [v5 incrementallyDeleteAndSaveWithError:&v10];
      id v8 = v10;
      if ((v7 & 1) == 0)
      {
        v9 = PLBackendGetLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v12 = v8;
          _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "Failed to incrementally delete scope: %@", buf, 0xCu);
        }
      }
      break;
    case 1:
      [v5 untrash];
      break;
    case 0:
      [v5 trash];
      break;
  }
}

- (void)encodeToXPCDict:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHLibraryScopeDeleteRequest;
  id v4 = a3;
  [(PHObjectDeleteRequest *)&v5 encodeToXPCDict:v4];
  xpc_dictionary_set_int64(v4, "deleteOperation", self->_operation);
  xpc_dictionary_set_BOOL(v4, "photosctlExpungeOverride", self->_photosctlExpungeOverride);
}

- (PHLibraryScopeDeleteRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHLibraryScopeDeleteRequest;
  v9 = [(PHObjectDeleteRequest *)&v11 initWithXPCDict:v8 request:a4 clientAuthorization:a5];
  if (v9)
  {
    v9->_operation = xpc_dictionary_get_int64(v8, "deleteOperation");
    v9->_photosctlExpungeOverride = xpc_dictionary_get_BOOL(v8, "photosctlExpungeOverride");
  }

  return v9;
}

- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PHLibraryScopeDeleteRequest;
  id v24 = 0;
  unsigned int v7 = [(PHObjectDeleteRequest *)&v23 validateForDeleteManagedObject:v6 error:&v24];
  id v8 = v24;
  if (v7)
  {
    if (![(PHLibraryScopeDeleteRequest *)self operation]
      && [v6 trashedState] == 1)
    {
      v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      id v10 = [NSString stringWithFormat:@"LibraryScope is already is trash state"];
      v30[0] = v10;
      objc_super v11 = (void *)MEMORY[0x1E4F1C9E8];
      id v12 = (void **)v30;
      uint64_t v13 = &v29;
LABEL_15:
      v20 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
      uint64_t v21 = objc_msgSend(v9, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v20);

      char v14 = 0;
      id v8 = (id)v21;
      goto LABEL_16;
    }
    if ([(PHLibraryScopeDeleteRequest *)self operation] == 1
      && ![v6 trashedState])
    {
      v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      id v10 = [NSString stringWithFormat:@"LibraryScope is not is trash state"];
      v28 = v10;
      objc_super v11 = (void *)MEMORY[0x1E4F1C9E8];
      id v12 = &v28;
      uint64_t v13 = &v27;
      goto LABEL_15;
    }
    if ([(PHLibraryScopeDeleteRequest *)self photosctlExpungeOverride]
      || [(PHLibraryScopeDeleteRequest *)self operation] != 2)
    {
      char v14 = 1;
      goto LABEL_19;
    }
    int v15 = [v6 libraryScopeIsActive];
    if (v15)
    {
      v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v17 = [NSString stringWithFormat:@"A LibraryScope that's actively syncing cannot be expunged. Use -[PHLibraryScope startExitFromLibraryScopeWithRetentionPolicy:completion:]"];
      v26 = v17;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      uint64_t v19 = objc_msgSend(v16, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v18);

      id v8 = (id)v19;
    }
    char v14 = v15 ^ 1;
  }
  else
  {
    char v14 = 0;
  }
LABEL_16:
  if (a4 && (v14 & 1) == 0)
  {
    id v8 = v8;
    char v14 = 0;
    *a4 = v8;
  }
LABEL_19:

  return v14;
}

@end