@interface PHCameraSmartSharingMetadata
+ (BOOL)storeMetadata:(id)a3 forPhotoLibrary:(id)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)_metadataFileURLForPhotoLibrary:(id)a3;
+ (id)_readMetadataFromFileURL:(id)a3;
+ (id)retrieveMetadataForPhotoLibrary:(id)a3;
+ (int64_t)version;
- (BOOL)hasActiveLibraryScope;
- (BOOL)locationShiftingRequired;
- (NSArray)filterContactIDs;
- (NSArray)frequentLocations;
- (NSArray)homeLocations;
- (NSArray)identities;
- (NSDate)creationDate;
- (NSString)libraryScopeLocalIdentifier;
- (PHCameraSmartSharingMetadata)init;
- (PHCameraSmartSharingMetadata)initWithCoder:(id)a3;
- (PHCameraSmartSharingMetadata)initWithLibraryScopeIdentifier:(id)a3 filterContactIDs:(id)a4 homeLocations:(id)a5 isOnTrip:(BOOL)a6;
- (PHCameraSmartSharingMetadata)initWithLibraryScopeIdentifier:(id)a3 identities:(id)a4 homeLocations:(id)a5 frequentLocations:(id)a6 locationShiftingRequired:(BOOL)a7;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PHCameraSmartSharingMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frequentLocations, 0);
  objc_storeStrong((id *)&self->_homeLocations, 0);
  objc_storeStrong((id *)&self->_filterContactIDs, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_libraryScopeLocalIdentifier, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (BOOL)locationShiftingRequired
{
  return self->_locationShiftingRequired;
}

- (NSArray)frequentLocations
{
  return self->_frequentLocations;
}

- (NSArray)homeLocations
{
  return self->_homeLocations;
}

- (NSArray)filterContactIDs
{
  return self->_filterContactIDs;
}

- (NSArray)identities
{
  return self->_identities;
}

- (NSString)libraryScopeLocalIdentifier
{
  return self->_libraryScopeLocalIdentifier;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  objc_msgSend(v9, "encodeInteger:forKey:", +[PHCameraSmartSharingMetadata version](PHCameraSmartSharingMetadata, "version"), @"version");
  v4 = [(PHCameraSmartSharingMetadata *)self libraryScopeLocalIdentifier];
  [v9 encodeObject:v4 forKey:@"libraryScopeLocalIdentifier"];

  v5 = [(PHCameraSmartSharingMetadata *)self identities];
  [v9 encodeObject:v5 forKey:@"identities"];

  v6 = [(PHCameraSmartSharingMetadata *)self creationDate];
  [v9 encodeObject:v6 forKey:@"creationDate"];

  v7 = [(PHCameraSmartSharingMetadata *)self homeLocations];
  [v9 encodeObject:v7 forKey:@"homeLocations"];

  v8 = [(PHCameraSmartSharingMetadata *)self frequentLocations];
  [v9 encodeObject:v8 forKey:@"frequentLocations"];

  objc_msgSend(v9, "encodeBool:forKey:", -[PHCameraSmartSharingMetadata locationShiftingRequired](self, "locationShiftingRequired"), @"locationShiftingRequired");
}

- (PHCameraSmartSharingMetadata)initWithCoder:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"version"];
  if (v5 != +[PHCameraSmartSharingMetadata version])
  {
    v30 = PLPhotoKitGetLog();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      v29 = 0;
      goto LABEL_18;
    }
    *(_DWORD *)buf = 134218240;
    uint64_t v40 = v5;
    __int16 v41 = 2048;
    int64_t v42 = +[PHCameraSmartSharingMetadata version];
    v31 = "[PHCameraSmartSharingMetadata] decode warning: version mismatch %ld != %ld";
    v32 = v30;
    uint32_t v33 = 22;
LABEL_16:
    _os_log_impl(&dword_19B043000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);
    goto LABEL_17;
  }
  v35.receiver = self;
  v35.super_class = (Class)PHCameraSmartSharingMetadata;
  self = [(PHCameraSmartSharingMetadata *)&v35 init];
  if (self)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"libraryScopeLocalIdentifier"];
    libraryScopeLocalIdentifier = self->_libraryScopeLocalIdentifier;
    self->_libraryScopeLocalIdentifier = v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = self->_creationDate;
    self->_creationDate = v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"identities"];
    v14 = (void *)v13;
    uint64_t v15 = MEMORY[0x1E4F1CBF0];
    v16 = (void *)(v13 ? v13 : MEMORY[0x1E4F1CBF0]);
    objc_storeStrong((id *)&self->_identities, v16);

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
    v19 = [v17 setWithArray:v18];
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"homeLocations"];
    v21 = (void *)v20;
    v22 = (void *)(v20 ? v20 : v15);
    objc_storeStrong((id *)&self->_homeLocations, v22);

    v23 = (void *)MEMORY[0x1E4F1CAD0];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
    v25 = [v23 setWithArray:v24];
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"frequentLocations"];
    v27 = (void *)v26;
    v28 = (void *)(v26 ? v26 : v15);
    objc_storeStrong((id *)&self->_frequentLocations, v28);

    self->_locationShiftingRequired = [v4 decodeBoolForKey:@"locationShiftingRequired"];
    if (!self->_creationDate)
    {
      v30 = PLPhotoKitGetLog();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_WORD *)buf = 0;
      v31 = "[PHCameraSmartSharingMetadata] decode fail, nil field";
      v32 = v30;
      uint32_t v33 = 2;
      goto LABEL_16;
    }
  }
  self = self;
  v29 = self;
LABEL_18:

  return v29;
}

- (BOOL)hasActiveLibraryScope
{
  v2 = [(PHCameraSmartSharingMetadata *)self libraryScopeLocalIdentifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)description
{
  uint64_t v15 = NSString;
  BOOL v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(PHCameraSmartSharingMetadata *)self libraryScopeLocalIdentifier];
  v6 = [(PHCameraSmartSharingMetadata *)self creationDate];
  v7 = [(PHCameraSmartSharingMetadata *)self identities];
  v8 = [v7 componentsJoinedByString:@", "];
  id v9 = [(PHCameraSmartSharingMetadata *)self homeLocations];
  v10 = [v9 componentsJoinedByString:@", "];
  v11 = [(PHCameraSmartSharingMetadata *)self frequentLocations];
  v12 = [v11 componentsJoinedByString:@", "];
  objc_msgSend(v15, "stringWithFormat:", @"<%@:%p; libraryScope:%@ creationDate:%@ identities:[%@] homeLocations:[%@] frequentLocations:[%@] locationShiftingRequired:%d>",
    v4,
    self,
    v5,
    v6,
    v8,
    v10,
    v12,
  uint64_t v13 = [(PHCameraSmartSharingMetadata *)self locationShiftingRequired]);

  return v13;
}

- (PHCameraSmartSharingMetadata)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PHCameraSmartSharingMetadata.m" lineNumber:147 description:@"Unavailable initializer"];

  return 0;
}

- (PHCameraSmartSharingMetadata)initWithLibraryScopeIdentifier:(id)a3 filterContactIDs:(id)a4 homeLocations:(id)a5 isOnTrip:(BOOL)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * v15);
        v17 = [PHCameraSmartSharingIdentity alloc];
        uint64_t v28 = v16;
        v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
        v19 = [(PHCameraSmartSharingIdentity *)v17 initWithPhoneNumber:0 emailAddress:0 contactIdentifiers:v18];
        [v10 addObject:v19];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v13);
  }

  uint64_t v20 = [(PHCameraSmartSharingMetadata *)self initWithLibraryScopeIdentifier:v23 identities:v10 homeLocations:v9 frequentLocations:0 locationShiftingRequired:0];
  return v20;
}

- (PHCameraSmartSharingMetadata)initWithLibraryScopeIdentifier:(id)a3 identities:(id)a4 homeLocations:(id)a5 frequentLocations:(id)a6 locationShiftingRequired:(BOOL)a7
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v62.receiver = self;
  v62.super_class = (Class)PHCameraSmartSharingMetadata;
  uint64_t v16 = [(PHCameraSmartSharingMetadata *)&v62 init];
  if (v16)
  {
    uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v16->_creationDate;
    v16->_creationDate = (NSDate *)v17;

    id v53 = v12;
    uint64_t v19 = [v12 copy];
    libraryScopeLocalIdentifier = v16->_libraryScopeLocalIdentifier;
    v16->_libraryScopeLocalIdentifier = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    v22 = (void *)v21;
    id v23 = (void *)MEMORY[0x1E4F1CBF0];
    if (v21) {
      long long v24 = (void *)v21;
    }
    else {
      long long v24 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v16->_identities, v24);

    id v51 = v14;
    uint64_t v25 = [v14 copy];
    long long v26 = (void *)v25;
    if (v25) {
      long long v27 = (void *)v25;
    }
    else {
      long long v27 = v23;
    }
    objc_storeStrong((id *)&v16->_homeLocations, v27);

    id v49 = v15;
    uint64_t v28 = [v15 copy];
    v29 = (void *)v28;
    if (v28) {
      uint64_t v30 = (void *)v28;
    }
    else {
      uint64_t v30 = v23;
    }
    objc_storeStrong((id *)&v16->_frequentLocations, v30);

    v50 = v16;
    v16->_locationShiftingRequired = a7;
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v52 = v13;
    id v32 = v13;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v58 objects:v64 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v59 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          v38 = [v37 contactIdentifiers];
          uint64_t v39 = [v38 countByEnumeratingWithState:&v54 objects:v63 count:16];
          if (v39)
          {
            uint64_t v40 = v39;
            uint64_t v41 = *(void *)v55;
            do
            {
              for (uint64_t j = 0; j != v40; ++j)
              {
                if (*(void *)v55 != v41) {
                  objc_enumerationMutation(v38);
                }
                uint64_t v43 = *(void **)(*((void *)&v54 + 1) + 8 * j);
                if ([v43 length]) {
                  [v31 addObject:v43];
                }
              }
              uint64_t v40 = [v38 countByEnumeratingWithState:&v54 objects:v63 count:16];
            }
            while (v40);
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v58 objects:v64 count:16];
      }
      while (v34);
    }

    v44 = [v31 allObjects];
    uint64_t v45 = [v44 copy];
    v46 = (void *)v45;
    if (v45) {
      v47 = (void *)v45;
    }
    else {
      v47 = (void *)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v16 = v50;
    objc_storeStrong((id *)&v50->_filterContactIDs, v47);

    id v13 = v52;
    id v12 = v53;
    id v14 = v51;
    id v15 = v49;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)version
{
  return 8;
}

+ (BOOL)storeMetadata:(id)a3 forPhotoLibrary:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)*MEMORY[0x1E4F8C5F0];
  [(id)*MEMORY[0x1E4F8C5F0] UTF8String];
  id v11 = (void *)xpc_copy_entitlement_for_self();
  if (v11 == (void *)MEMORY[0x1E4F14518])
  {
    id v22 = 0;
    id v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v22];
    id v15 = v22;
    if (v14)
    {
      uint64_t v16 = [a1 _metadataFileURLForPhotoLibrary:v9];
      id v21 = v15;
      char v13 = [v14 writeToURL:v16 options:1073741825 error:&v21];
      id v17 = v21;

      if ((v13 & 1) == 0)
      {
        v18 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v17;
          _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, "[PHCameraSmartSharingMetadata] error writing file: %@", buf, 0xCu);
        }

        if (a5) {
          *a5 = v17;
        }
      }
    }
    else
    {
      uint64_t v19 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v15;
        _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "[PHCameraSmartSharingMetadata] archive error: %@", buf, 0xCu);
      }

      if (a5)
      {
        id v17 = v15;
        char v13 = 0;
        *a5 = v17;
      }
      else
      {
        char v13 = 0;
        id v17 = v15;
      }
    }
  }
  else
  {
    id v12 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v10;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "[PHCameraSmartSharingMetadata] missing entitlement %@", buf, 0xCu);
    }

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Missing entitlement %@", v10);
      char v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

+ (id)_readMetadataFromFileURL:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = [v3 path];
  char v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    id v16 = 0;
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v3 options:0 error:&v16];
    id v8 = v16;
    if (v7)
    {
      id v15 = v8;
      id v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v15];
      v10 = v15;

      if (v9)
      {
        id v11 = v9;
        id v12 = v11;
      }
      else
      {
        char v13 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v10;
          _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_ERROR, "[PHCameraSmartSharingMetadata] retrieveMetadataForLibraryScope error unarchiving file: %@", buf, 0xCu);
        }

        id v11 = 0;
        id v12 = 0;
      }
    }
    else
    {
      id v11 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v8;
        _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_ERROR, "[PHCameraSmartSharingMetadata] retrieveMetadataForLibraryScope error reading file: %@", buf, 0xCu);
      }
      id v12 = 0;
      v10 = v8;
    }
  }
  else
  {
    v10 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v3;
      __int16 v19 = 2112;
      uint64_t v20 = 0;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_INFO, "[PHCameraSmartSharingMetadata] missing file %@ error:%@", buf, 0x16u);
    }
    id v12 = 0;
  }

  return v12;
}

+ (id)retrieveMetadataForPhotoLibrary:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
    char v6 = (void *)MEMORY[0x1E4F1CB10];
    v7 = [v5 photoDirectoryWithType:20 createIfNeeded:0 error:0];
    id v8 = [v6 fileURLWithPath:v7];

    id v9 = [v8 URLByAppendingPathComponent:@"camera_smart_sharing_metadata.plist"];
    if (v9)
    {
      v10 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v11 = [v9 path];
      char v12 = [v10 fileExistsAtPath:v11];

      if (v12)
      {

        id v4 = 0;
        goto LABEL_15;
      }
    }
    char v13 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v9;
      _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_ERROR, "[PHCameraSmartSharingMetadata] unable to directly access %@, opening the default photo library, which is slower.", buf, 0xCu);
    }

    id v4 = +[PHPhotoLibrary sharedPhotoLibrary];
  }
  id v14 = *MEMORY[0x1E4F8C5E8];
  [(id)*MEMORY[0x1E4F8C5E8] UTF8String];
  id v9 = xpc_copy_entitlement_for_self();
  [(id)*MEMORY[0x1E4F8C5F0] UTF8String];
  uint64_t v15 = xpc_copy_entitlement_for_self();
  id v16 = v15;
  if (v9 != MEMORY[0x1E4F14518] && v15 != MEMORY[0x1E4F14518])
  {
    id v22 = PLPhotoKitGetLog();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 138412290;
    v36 = v14;
    id v24 = "[PHCameraSmartSharingMetadata] missing entitlement %@";
LABEL_19:
    uint64_t v25 = v22;
    uint32_t v26 = 12;
LABEL_20:
    _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);
    goto LABEL_24;
  }
  id v34 = 0;
  char v18 = [v4 requestSandboxExtensionsIfNeededWithError:&v34];
  id v22 = v34;
  if ((v18 & 1) == 0)
  {
    long long v27 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v36 = v22;
      __int16 v37 = 2112;
      id v38 = v4;
      _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_ERROR, "[PHCameraSmartSharingMetadata] failed to request sandbox extensions:%@ for library:%@", buf, 0x16u);
    }

    goto LABEL_24;
  }
  uint64_t v19 = [a1 _metadataFileURLForPhotoLibrary:v4];

  id v9 = v19;
LABEL_15:
  uint64_t v20 = [a1 _readMetadataFromFileURL:v9];
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    goto LABEL_26;
  }
  v29 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B043000, v29, OS_LOG_TYPE_DEFAULT, "[PHCameraSmartSharingMetadata] unable to retrieve metadata, requesting updated cache and trying again.", buf, 2u);
  }

  if (!v4)
  {
    id v4 = +[PHPhotoLibrary sharedPhotoLibrary];
  }
  uint64_t v30 = [v4 photoAnalysisClient];
  id v33 = 0;
  id v31 = [v30 requestCameraSmartSharingProcessingForLibraryScopeWithUUID:0 withOptions:0 error:&v33];
  id v16 = v33;

  if (!v31)
  {
    id v22 = PLPhotoKitGetLog();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 138412290;
    v36 = v16;
    id v24 = "[PHCameraSmartSharingMetadata] error requesting updated metadata:%@";
    goto LABEL_19;
  }
  uint64_t v32 = [a1 _readMetadataFromFileURL:v9];
  if (v32)
  {
    uint64_t v21 = (void *)v32;
    goto LABEL_25;
  }
  id v22 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    id v24 = "[PHCameraSmartSharingMetadata] failed to retrieve metadata on second try, giving up.";
    uint64_t v25 = v22;
    uint32_t v26 = 2;
    goto LABEL_20;
  }
LABEL_24:

  uint64_t v21 = 0;
LABEL_25:

LABEL_26:

  return v21;
}

+ (id)_metadataFileURLForPhotoLibrary:(id)a3
{
  BOOL v3 = [a3 urlForApplicationDataFolderIdentifier:10];
  id v4 = [v3 URLByAppendingPathComponent:@"camera_smart_sharing_metadata.plist"];

  return v4;
}

@end