@interface CCDatabaseSetChangeEnumerator
+ (unint64_t)localItemInstanceCountFromBookmark:(id)a3;
+ (unint64_t)sharedItemCountFromBookmark:(id)a3;
- (BOOL)_resetDatabaseAccess:(id *)a3;
- (BOOL)beginWithBookmark:(id)a3 error:(id *)a4;
- (BOOL)imputeChangesSinceLastContentVector:(id)a3 lastMetaContentVector:(id)a4 error:(id *)a5;
- (BOOL)isBookmarkUpToDate:(id)a3;
- (BOOL)reset:(id *)a3;
- (CCDatabaseSetChangeEnumerator)init;
- (CCDatabaseSetChangeEnumerator)initWithSet:(id)a3 readAccess:(id)a4;
- (id)_cachedDeviceWithRowId:(id)a3;
- (id)contentMessageFromContentData:(id)a3;
- (id)itemInstanceCount:(id *)a3;
- (id)metaContentMessageFromMetaContentData:(id)a3;
- (id)next;
- (id)nextBookmark;
- (id)sharedItemCount:(id *)a3;
- (int64_t)lastDeltaDate;
- (int64_t)resourceVersion;
- (void)dealloc;
- (void)lastDeltaDate;
- (void)next;
- (void)resourceVersion;
@end

@implementation CCDatabaseSetChangeEnumerator

- (CCDatabaseSetChangeEnumerator)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (CCDatabaseSetChangeEnumerator)initWithSet:(id)a3 readAccess:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CCDatabaseSetChangeEnumerator;
  v9 = [(CCDatabaseSetChangeEnumerator *)&v18 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v9->_set, a3);
  uint64_t v11 = [v8 databaseReadAccessForSet:v7];
  databaseAccess = v10->_databaseAccess;
  v10->_databaseAccess = (CCDatabaseReadOnlyAccess *)v11;

  if (!v10->_databaseAccess)
  {
    v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseSetChangeEnumerator initWithSet:readAccess:]();
    }
    goto LABEL_9;
  }
  v13 = [[CCDatabaseSetStateReader alloc] initWithDatabaseAccess:v10->_databaseAccess];
  stateReader = v10->_stateReader;
  v10->_stateReader = v13;

  if (!v10->_stateReader)
  {
    v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseSetChangeEnumerator initWithSet:readAccess:]();
    }
LABEL_9:

    v15 = 0;
    goto LABEL_10;
  }
LABEL_4:
  v15 = v10;
LABEL_10:

  return v15;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "dealloc - %@", v2, v3, v4, v5, v6);
}

- (BOOL)beginWithBookmark:(id)a3 error:(id *)a4
{
  v56[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  int64_t v7 = [(CCDatabaseSetChangeEnumerator *)self resourceVersion];
  if (v7 != -1)
  {
    if (v6)
    {
      int64_t v8 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = v6;
        uint64_t v10 = +[CCSetChangeBookmark currentBookmarkVersion];
        uint64_t v11 = [v9 bookmarkVersion];
        if (v11 == v10)
        {
          uint64_t v12 = [v9 resourceVersion];
          if (v12 && v12 == v8)
          {
            v13 = [v9 contentVector];
            lastContentStateVector = self->_lastContentStateVector;
            self->_lastContentStateVector = v13;

            v15 = [v9 metaContentVector];
            lastMetaContentStateVector = self->_lastMetaContentStateVector;
            self->_lastMetaContentStateVector = v15;

            goto LABEL_12;
          }
          v44 = (void *)MEMORY[0x263F087E8];
          uint64_t v45 = *MEMORY[0x263F2A630];
          uint64_t v51 = *MEMORY[0x263F07F80];
          v30 = [NSString stringWithFormat:@"Database resource version (%lld) invalidates the provided bookmark (%lld): %@", v8, v12, v9];
          v52 = v30;
          v36 = [NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
          v37 = v44;
          uint64_t v38 = v45;
        }
        else
        {
          v34 = (void *)MEMORY[0x263F087E8];
          uint64_t v35 = *MEMORY[0x263F2A630];
          uint64_t v53 = *MEMORY[0x263F07F80];
          v30 = [NSString stringWithFormat:@"Current bookmark version requirement (%d) invalidates the provided bookmark (%d): %@", v10, v11, v9];
          v54 = v30;
          v36 = [NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
          v37 = v34;
          uint64_t v38 = v35;
        }
        v46 = [v37 errorWithDomain:v38 code:2 userInfo:v36];
        CCSetError(a4, v46);
      }
      else
      {
        id v26 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v55 = *MEMORY[0x263F08320];
        v27 = NSString;
        v28 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v28);
        v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        v31 = [v27 stringWithFormat:@"The provided bookmark was of class %@, but we expected %@", v9, v30];
        v56[0] = v31;
        v32 = [NSDictionary dictionaryWithObjects:v56 forKeys:&v55 count:1];
        v33 = (void *)[v26 initWithDomain:@"com.apple.CascadeSets.Set" code:2 userInfo:v32];
        CCSetError(a4, v33);
      }
      BOOL v17 = 0;
      goto LABEL_25;
    }
    objc_super v18 = (CKDistributedTimestampStateVector *)objc_alloc_init((Class)getCKDistributedTimestampStateVectorClass_1());
    v19 = self->_lastContentStateVector;
    self->_lastContentStateVector = v18;

    v20 = (CKDistributedTimestampStateVector *)objc_alloc_init((Class)getCKDistributedTimestampStateVectorClass_1());
    v9 = self->_lastMetaContentStateVector;
    self->_lastMetaContentStateVector = v20;
LABEL_12:

    v21 = self->_lastContentStateVector;
    v22 = self->_lastMetaContentStateVector;
    id v48 = 0;
    BOOL v17 = [(CCDatabaseSetChangeEnumerator *)self imputeChangesSinceLastContentVector:v21 lastMetaContentVector:v22 error:&v48];
    v23 = v48;
    v9 = v23;
    if (!v17)
    {
      v24 = [v23 domain];
      if ([v24 isEqual:@"com.apple.CascadeSets.Set"]) {
        uint64_t v25 = 2 * ([v9 code] == 2);
      }
      else {
        uint64_t v25 = 0;
      }

      v39 = (void *)MEMORY[0x263F087E8];
      uint64_t v40 = *MEMORY[0x263F2A630];
      uint64_t v49 = *MEMORY[0x263F08608];
      v41 = v9;
      if (!v9)
      {
        v41 = [MEMORY[0x263EFF9D0] null];
      }
      v50 = v41;
      v42 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      v43 = [v39 errorWithDomain:v40 code:v25 userInfo:v42];
      CCSetError(a4, v43);

      if (!v9) {
    }
      }
    goto LABEL_25;
  }
  v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[CCDatabaseSetChangeEnumerator beginWithBookmark:error:]();
  }
  BOOL v17 = 1;
LABEL_25:

  return v17;
}

- (BOOL)reset:(id *)a3
{
  lastContentStateVector = self->_lastContentStateVector;
  self->_lastContentStateVector = 0;

  lastMetaContentStateVector = self->_lastMetaContentStateVector;
  self->_lastMetaContentStateVector = 0;

  contentContentsVector = self->_contentContentsVector;
  self->_contentContentsVector = 0;

  contentRemovalsVector = self->_contentRemovalsVector;
  self->_contentRemovalsVector = 0;

  metaContentContentsVector = self->_metaContentContentsVector;
  self->_metaContentContentsVector = 0;

  metaContentRemovalsVector = self->_metaContentRemovalsVector;
  self->_metaContentRemovalsVector = 0;

  currentMutableSetChange = self->_currentMutableSetChange;
  self->_currentMutableSetChange = 0;

  seenContentBuilder = self->_seenContentBuilder;
  self->_seenContentBuilder = 0;

  seenMetaContentBuilder = self->_seenMetaContentBuilder;
  self->_seenMetaContentBuilder = 0;

  provenanceEnumerator = self->_provenanceEnumerator;
  self->_provenanceEnumerator = 0;

  resourceVersion = self->_resourceVersion;
  self->_resourceVersion = 0;

  lastDeltaDate = self->_lastDeltaDate;
  self->_lastDeltaDate = 0;

  deviceMapping = self->_deviceMapping;
  self->_deviceMapping = 0;

  deviceCache = self->_deviceCache;
  self->_deviceCache = 0;

  return [(CCDatabaseSetChangeEnumerator *)self _resetDatabaseAccess:a3];
}

- (BOOL)_resetDatabaseAccess:(id *)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  databaseAccess = self->_databaseAccess;
  if (!databaseAccess)
  {
    int64_t v7 = 0;
    goto LABEL_9;
  }
  id v15 = 0;
  char v5 = [(CCDatabaseReadOnlyAccess *)databaseAccess reset:&v15];
  id v6 = v15;
  int64_t v7 = v6;
  if (v5)
  {
LABEL_9:
    BOOL v13 = 1;
    goto LABEL_10;
  }
  int64_t v8 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = *MEMORY[0x263F2A630];
  v16[0] = *MEMORY[0x263F08608];
  uint64_t v10 = v6;
  if (!v6)
  {
    uint64_t v10 = [MEMORY[0x263EFF9D0] null];
  }
  v16[1] = *MEMORY[0x263F07F80];
  v17[0] = v10;
  v17[1] = @"Failed to reset database";
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  uint64_t v12 = [v8 errorWithDomain:v9 code:0 userInfo:v11];
  CCSetError(a3, v12);

  if (!v7) {
  BOOL v13 = 0;
  }
LABEL_10:

  return v13;
}

- (id)next
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  if (!self->_provenanceEnumerator)
  {
    __biome_log_for_category();
    v79 = (CCMutableSetChange *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v79->super, OS_LOG_TYPE_FAULT)) {
      -[CCDatabaseSetChangeEnumerator next]();
    }
    uint64_t v51 = 0;
    goto LABEL_66;
  }
  uint64_t v4 = 0;
  char v5 = CCRepeatedInt64;
  *(void *)&long long v2 = 138412546;
  long long v69 = v2;
  while (1)
  {
    id v6 = v4;
    int64_t v7 = [(CCDatabaseValueRowEnumerator *)self->_provenanceEnumerator next];
    uint64_t v4 = [&v5[25] joinedProvenanceFromDatabaseValueRow:v7];

    if (!v4) {
      break;
    }
    int64_t v8 = (void *)MEMORY[0x24C5B1100]();
    uint64_t v9 = [v4 provenance];
    uint64_t v10 = [v4 provenance];
    uint64_t v11 = [v10 contentHash];

    uint64_t v12 = [v4 provenance];
    BOOL v13 = [v12 instanceHash];

    v14 = [v4 contentData];
    v78 = [v4 metaContentData];
    if (!v11)
    {
      id v15 = __biome_log_for_category();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v81 = v9;
        _os_log_error_impl(&dword_249B92000, v15, OS_LOG_TYPE_ERROR, "missing content hash, provenance row is not enumerable: %@", buf, 0xCu);
      }
      v79 = 0;
      goto LABEL_45;
    }
    v76 = v13;
    id v15 = [v9 deviceRowId];
    v16 = [(CCDatabaseDeviceMapping *)self->_deviceMapping siteIdentifierForDeviceRowId:v15];
    if (!v16)
    {
      log = __biome_log_for_category();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v69;
        v81 = v15;
        __int16 v82 = 2112;
        v83 = v9;
        _os_log_error_impl(&dword_249B92000, log, OS_LOG_TYPE_ERROR, "could not find device with rowId: %@ for provenance row: %@", buf, 0x16u);
      }
      v79 = 0;
      goto LABEL_44;
    }
    v75 = v14;
    log = [(CCDatabaseSetChangeEnumerator *)self _cachedDeviceWithRowId:v15];
    BOOL v17 = [v9 contentState];
    unsigned __int8 v18 = [v17 unsignedIntValue];

    v19 = [v9 metaContentState];
    unsigned __int8 v20 = [v19 unsignedIntValue];

    currentMutableSetChange = self->_currentMutableSetChange;
    v72 = v8;
    unsigned __int8 v73 = v20;
    if (!currentMutableSetChange)
    {
      v79 = 0;
LABEL_21:
      v23 = [(CCDatabaseSetChangeEnumerator *)self contentMessageFromContentData:v75];
      v24 = [[CCSharedItem alloc] initWithSharedIdentifier:v11 content:v23];
      uint64_t v25 = [[CCMutableSetChange alloc] initWithSharedItem:v24 changeType:1];
      id v26 = self->_currentMutableSetChange;
      self->_currentMutableSetChange = v25;

      goto LABEL_22;
    }
    if ([(CCMutableSetChange *)currentMutableSetChange containsContentHash:v11])
    {
      v79 = 0;
    }
    else
    {
      if ([(CCMutableSetChange *)self->_currentMutableSetChange containsChanges]) {
        v79 = self->_currentMutableSetChange;
      }
      else {
        v79 = 0;
      }
      v22 = self->_currentMutableSetChange;
      self->_currentMutableSetChange = 0;
    }
    if (!self->_currentMutableSetChange) {
      goto LABEL_21;
    }
LABEL_22:
    v27 = [v9 contentSequenceNumber];
    uint64_t v28 = [v27 unsignedIntegerValue];

    uint64_t v29 = [objc_alloc((Class)getCKDistributedTimestampClass()) initWithSiteIdentifierObject:v16 clockValue:v28];
    int v30 = v18;
    v71 = (void *)v29;
    if (v18 == 2)
    {
      v14 = v75;
      if ([(CKDistributedTimestampStateVector *)self->_contentRemovalsVector atomStateForTimestamp:v29] == 2)
      {
        v34 = [(CCMutableSetChange *)self->_currentMutableSetChange removedDevices];
        [v34 addObject:log];

        [(CCDatabaseSetStateVectorBuilder *)self->_seenContentBuilder addClockValue:v28 withAtomState:2 forDeviceRowId:v15];
      }
LABEL_30:
      int v32 = v73;
      goto LABEL_31;
    }
    v14 = v75;
    if (v30 != 1) {
      goto LABEL_30;
    }
    if ([(CKDistributedTimestampStateVector *)self->_contentContentsVector atomStateForTimestamp:v29] == 1)
    {
      v31 = [(CCMutableSetChange *)self->_currentMutableSetChange addedDevices];
      [v31 addObject:log];

      [(CCDatabaseSetStateVectorBuilder *)self->_seenContentBuilder addClockValue:v28 withAtomState:1 forDeviceRowId:v15];
    }
    int v32 = v73;
    if (v73 != 2)
    {
      v33 = [(CCMutableSetChange *)self->_currentMutableSetChange allDevices];
      [v33 addObject:log];
    }
LABEL_31:
    uint64_t v35 = [v9 metaContentSequenceNumber];

    if (v35)
    {
      v36 = [v9 metaContentSequenceNumber];
      uint64_t v37 = [v36 unsignedIntegerValue];

      uint64_t v38 = (void *)[objc_alloc((Class)getCKDistributedTimestampClass()) initWithSiteIdentifierObject:v16 clockValue:v37];
      if (v32 == 2)
      {
        if ([(CKDistributedTimestampStateVector *)self->_metaContentRemovalsVector atomStateForTimestamp:v38] == 2)
        {
          v74 = v38;
          v44 = [[CCItemInstance alloc] initWithSharedIdentifier:v11 instanceIdentifier:v76 content:0 metaContent:0];
          uint64_t v45 = [(CCMutableSetChange *)self->_currentMutableSetChange removedLocalInstances];
          [v45 addObject:v44];

          [(CCDatabaseSetStateVectorBuilder *)self->_seenMetaContentBuilder addClockValue:v37 withAtomState:2 forDeviceRowId:v15];
          goto LABEL_41;
        }
      }
      else if (v32 == 1)
      {
        v74 = v38;
        if ([(CKDistributedTimestampStateVector *)self->_metaContentContentsVector atomStateForTimestamp:v38] == 1&& v78)
        {
          v70 = [(CCDatabaseSetChangeEnumerator *)self metaContentMessageFromMetaContentData:v78];
          v39 = [CCItemInstance alloc];
          uint64_t v40 = [(CCMutableSetChange *)self->_currentMutableSetChange sharedItem];
          v41 = [v40 content];
          v42 = [(CCItemInstance *)v39 initWithSharedIdentifier:v11 instanceIdentifier:v76 content:v41 metaContent:v70];

          v43 = [(CCMutableSetChange *)self->_currentMutableSetChange addedLocalInstances];
          [v43 addObject:v42];

          [(CCDatabaseSetStateVectorBuilder *)self->_seenMetaContentBuilder addClockValue:v37 withAtomState:1 forDeviceRowId:v15];
          goto LABEL_40;
        }
        if (v78)
        {
LABEL_40:
          v44 = [(CCDatabaseSetChangeEnumerator *)self metaContentMessageFromMetaContentData:v78];
          v46 = [CCItemInstance alloc];
          v47 = [(CCMutableSetChange *)self->_currentMutableSetChange sharedItem];
          id v48 = [v47 content];
          uint64_t v49 = [(CCItemInstance *)v46 initWithSharedIdentifier:v11 instanceIdentifier:v76 content:v48 metaContent:v44];

          v50 = [(CCMutableSetChange *)self->_currentMutableSetChange allLocalInstances];
          [v50 addObject:v49];

LABEL_41:
          uint64_t v38 = v74;
        }
      }

      v14 = v75;
    }

    char v5 = CCRepeatedInt64;
    int64_t v8 = v72;
LABEL_44:

    BOOL v13 = v76;
LABEL_45:

    if (v79) {
      goto LABEL_54;
    }
  }
  v52 = self->_currentMutableSetChange;
  if (v52 && [(CCMutableSetChange *)v52 containsChanges])
  {
    v79 = self->_currentMutableSetChange;
    uint64_t v53 = self->_currentMutableSetChange;
    self->_currentMutableSetChange = 0;
  }
  else
  {
    v79 = 0;
  }
LABEL_54:
  v54 = [(CCMutableSetChange *)v79 addedDevices];
  uint64_t v55 = [(CCMutableSetChange *)v79 removedDevices];
  int v56 = [v54 isEqual:v55];

  if (v56)
  {
    v57 = [(CCMutableSetChange *)v79 addedDevices];
    [v57 removeAllObjects];

    v58 = [(CCMutableSetChange *)v79 removedDevices];
    [v58 removeAllObjects];

    v59 = v79;
    uint64_t v60 = 1;
    goto LABEL_56;
  }
  v61 = [(CCMutableSetChange *)v79 removedDevices];
  if ([v61 count])
  {
    v62 = [(CCMutableSetChange *)v79 allDevices];
    uint64_t v63 = [v62 count];

    if (!v63)
    {
      v59 = v79;
      uint64_t v60 = 2;
      goto LABEL_56;
    }
  }
  else
  {
  }
  v64 = [(CCMutableSetChange *)v79 addedDevices];
  v65 = [(CCMutableSetChange *)v79 allDevices];
  if ([v64 isEqual:v65])
  {
    v66 = [(CCMutableSetChange *)v79 removedDevices];
    uint64_t v67 = [v66 count];

    if (!v67)
    {
      v59 = v79;
      uint64_t v60 = 0;
LABEL_56:
      [(CCMutableSetChange *)v59 setSharedItemChangeType:v60];
    }
  }
  else
  {
  }
  uint64_t v51 = (void *)[(CCMutableSetChange *)v79 copy];

LABEL_66:

  return v51;
}

- (id)nextBookmark
{
  getCKDistributedTimestampStateVectorClass_1();
  uint64_t v3 = objc_opt_new();
  [v3 unionStateVector:self->_lastContentStateVector];
  uint64_t v4 = [(CCDatabaseSetStateVectorBuilder *)self->_seenContentBuilder build];
  [v3 unionStateVector:v4];

  getCKDistributedTimestampStateVectorClass_1();
  char v5 = objc_opt_new();
  [v5 unionStateVector:self->_lastMetaContentStateVector];
  id v6 = [(CCDatabaseSetStateVectorBuilder *)self->_seenMetaContentBuilder build];
  [v5 unionStateVector:v6];

  int64_t v7 = [[CCSetChangeBookmark alloc] initWithContentVector:v3 metaContentVector:v5 resourceVersion:[(CCDatabaseSetChangeEnumerator *)self resourceVersion] lastDeltaDate:[(CCDatabaseSetChangeEnumerator *)self lastDeltaDate] set:self->_set];

  return v7;
}

- (id)sharedItemCount:(id *)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  stateReader = self->_stateReader;
  id v16 = 0;
  id v6 = [(CCDatabaseSetStateReader *)stateReader sharedItemCount:&v16];
  id v7 = v16;
  int64_t v8 = v7;
  if (!v6)
  {
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F2A630];
    v17[0] = *MEMORY[0x263F08608];
    uint64_t v11 = v7;
    if (!v7)
    {
      uint64_t v11 = [MEMORY[0x263EFF9D0] null];
    }
    v17[1] = *MEMORY[0x263F07F80];
    v18[0] = v11;
    uint64_t v12 = [NSString stringWithFormat:@"Failed to count shared items in set: %@", self->_set];
    v18[1] = v12;
    BOOL v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    v14 = [v9 errorWithDomain:v10 code:0 userInfo:v13];
    CCSetError(a3, v14);

    if (!v8) {
  }
    }

  return v6;
}

- (id)itemInstanceCount:(id *)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  stateReader = self->_stateReader;
  id v16 = 0;
  id v6 = [(CCDatabaseSetStateReader *)stateReader itemInstanceCount:&v16];
  id v7 = v16;
  int64_t v8 = v7;
  if (!v6)
  {
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F2A630];
    v17[0] = *MEMORY[0x263F08608];
    uint64_t v11 = v7;
    if (!v7)
    {
      uint64_t v11 = [MEMORY[0x263EFF9D0] null];
    }
    v17[1] = *MEMORY[0x263F07F80];
    v18[0] = v11;
    uint64_t v12 = [NSString stringWithFormat:@"Failed to count item instances in set: %@", self->_set];
    v18[1] = v12;
    BOOL v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    v14 = [v9 errorWithDomain:v10 code:0 userInfo:v13];
    CCSetError(a3, v14);

    if (!v8) {
  }
    }

  return v6;
}

- (int64_t)resourceVersion
{
  resourceVersion = self->_resourceVersion;
  if (resourceVersion) {
    return [(NSNumber *)resourceVersion longLongValue];
  }
  stateReader = self->_stateReader;
  id v10 = 0;
  char v5 = [(CCDatabaseSetStateReader *)stateReader resourceVersion:&v10];
  id v6 = v10;
  id v7 = self->_resourceVersion;
  self->_resourceVersion = v5;

  if (self->_resourceVersion)
  {

    resourceVersion = self->_resourceVersion;
    return [(NSNumber *)resourceVersion longLongValue];
  }
  uint64_t v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[CCDatabaseSetChangeEnumerator resourceVersion]((uint64_t)self);
  }

  return -1;
}

- (int64_t)lastDeltaDate
{
  lastDeltaDate = self->_lastDeltaDate;
  if (lastDeltaDate) {
    return [(NSNumber *)lastDeltaDate longLongValue];
  }
  stateReader = self->_stateReader;
  id v10 = 0;
  char v5 = [(CCDatabaseSetStateReader *)stateReader lastDeltaDate:&v10];
  id v6 = v10;
  id v7 = self->_lastDeltaDate;
  self->_lastDeltaDate = v5;

  if (self->_lastDeltaDate)
  {
LABEL_3:

    lastDeltaDate = self->_lastDeltaDate;
    return [(NSNumber *)lastDeltaDate longLongValue];
  }
  if (!v6)
  {
    self->_lastDeltaDate = (NSNumber *)&unk_26FDCD4A8;

    goto LABEL_3;
  }
  uint64_t v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[CCDatabaseSetChangeEnumerator lastDeltaDate]((uint64_t)self);
  }

  return -1;
}

- (BOOL)isBookmarkUpToDate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseSetChangeEnumerator isBookmarkUpToDate:]((uint64_t)v4, v7);
    }

    goto LABEL_7;
  }
  int64_t v5 = [(CCDatabaseSetChangeEnumerator *)self lastDeltaDate];
  if (v5 < 0)
  {
LABEL_7:
    BOOL v6 = 0;
    goto LABEL_8;
  }
  BOOL v6 = v5 == [v4 lastDeltaDate];
LABEL_8:

  return v6;
}

- (BOOL)imputeChangesSinceLastContentVector:(id)a3 lastMetaContentVector:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  stateReader = self->_stateReader;
  id v85 = 0;
  v86[0] = 0;
  id v83 = 0;
  id v84 = 0;
  BOOL v10 = [(CCDatabaseSetStateReader *)stateReader constructStateVectorsFromDatabaseOutContent:v86 outMetaContent:&v85 outDeviceMapping:&v84 error:&v83];
  id v11 = v86[0];
  id v12 = v85;
  id v13 = v84;
  id v14 = v84;
  id v15 = v83;
  id v16 = __biome_log_for_category();
  BOOL v17 = v16;
  if (v10)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:]5();
    }

    unsigned __int8 v18 = __biome_log_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:]2();
    }

    if (v11)
    {
      v19 = __biome_log_for_category();
      unsigned __int8 v20 = v19;
      if (v12)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:]6();
        }

        v21 = __biome_log_for_category();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:]5();
        }

        v72 = [v7 clockVector];
        char v22 = objc_msgSend(v11, "isGreaterThanOrEqualToVector:");
        v23 = __biome_log_for_category();
        v24 = v23;
        if ((v22 & 1) == 0)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
            -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:]4((uint64_t)v11);
          }

          id v26 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.CascadeSets.Set" code:2 userInfo:0];
          CCSetError(a5, v26);
          BOOL v51 = 0;
          goto LABEL_70;
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:]3();
        }

        uint64_t v25 = __biome_log_for_category();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:]2();
        }

        id v26 = [v8 clockVector];
        if (([v12 isGreaterThanOrEqualToVector:v26] & 1) == 0)
        {
          int v56 = __biome_log_for_category();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT)) {
            -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:]1((uint64_t)v12);
          }

          v57 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.CascadeSets.Set" code:2 userInfo:0];
          CCSetError(a5, v57);
          BOOL v51 = 0;
          goto LABEL_69;
        }
        v27 = (void *)[objc_alloc((Class)getCKMergeableDeltaVectorsClass()) initWithPreviousStateVector:v7 currentStateVector:v11];
        id obj = [v27 contents];
        v66 = v27;
        id v71 = [v27 removals];
        uint64_t v28 = (void *)[objc_alloc((Class)getCKMergeableDeltaVectorsClass()) initWithPreviousStateVector:v8 currentStateVector:v12];
        id v67 = [v28 contents];
        v65 = v28;
        id v70 = [v28 removals];
        uint64_t v29 = __biome_log_for_category();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:]0();
        }

        int v30 = __biome_log_for_category();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.9();
        }

        v31 = __biome_log_for_category();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.8();
        }
        v62 = v26;

        int v32 = __biome_log_for_category();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.7();
        }

        uint64_t v79 = 0;
        v80 = &v79;
        uint64_t v81 = 0x2020000000;
        char v82 = 1;
        contexta = (void *)MEMORY[0x24C5B1100]();
        v33 = self->_stateReader;
        id v78 = 0;
        v77[0] = MEMORY[0x263EF8330];
        v77[1] = 3221225472;
        v77[2] = __97__CCDatabaseSetChangeEnumerator_imputeChangesSinceLastContentVector_lastMetaContentVector_error___block_invoke;
        v77[3] = &unk_26527A598;
        v77[4] = &v79;
        BOOL v34 = [(CCDatabaseSetStateReader *)v33 enumerateProvenanceRecordsForStateVector:v71 withType:0 selectAtomsInState:2 skipOverAtomsInState:1 deviceMapping:v14 error:&v78 usingBlock:v77];
        id v69 = v78;
        if (!v34)
        {
          v58 = __biome_log_for_category();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
            -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.6();
          }

          CCSetError(a5, v69);
          BOOL v51 = 0;
          goto LABEL_68;
        }
        v61 = (void *)MEMORY[0x24C5B1100]();
        uint64_t v35 = self->_stateReader;
        v75[0] = MEMORY[0x263EF8330];
        v75[1] = 3221225472;
        v75[2] = __97__CCDatabaseSetChangeEnumerator_imputeChangesSinceLastContentVector_lastMetaContentVector_error___block_invoke_33;
        v75[3] = &unk_26527A598;
        v75[4] = &v79;
        id v76 = 0;
        BOOL v36 = [(CCDatabaseSetStateReader *)v35 enumerateProvenanceRecordsForStateVector:v70 withType:1 selectAtomsInState:2 skipOverAtomsInState:1 deviceMapping:v14 error:&v76 usingBlock:v75];
        id context = v76;
        if (!v36)
        {
          v59 = __biome_log_for_category();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
            -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.5();
          }

          CCSetError(a5, context);
          BOOL v51 = 0;
          goto LABEL_67;
        }
        if (*((unsigned char *)v80 + 24))
        {
          objc_storeStrong((id *)&self->_contentContentsVector, obj);
          objc_storeStrong((id *)&self->_contentRemovalsVector, v71);
          objc_storeStrong((id *)&self->_metaContentContentsVector, v67);
          objc_storeStrong((id *)&self->_metaContentRemovalsVector, v70);
          objc_storeStrong((id *)&self->_deviceMapping, v13);
          uint64_t v37 = [[CCDatabaseSetStateVectorBuilder alloc] initWithDeviceMapping:self->_deviceMapping missingAtomsImplied:0];
          seenContentBuilder = self->_seenContentBuilder;
          self->_seenContentBuilder = v37;

          v39 = [[CCDatabaseSetStateVectorBuilder alloc] initWithDeviceMapping:self->_deviceMapping missingAtomsImplied:0];
          seenMetaContentBuilder = self->_seenMetaContentBuilder;
          self->_seenMetaContentBuilder = v39;

          v41 = (void *)MEMORY[0x24C5B1100]();
          v42 = self->_stateReader;
          v43 = self->_seenContentBuilder;
          v44 = self->_seenMetaContentBuilder;
          deviceMapping = self->_deviceMapping;
          id v74 = 0;
          uint64_t v46 = [(CCDatabaseSetStateReader *)v42 provenanceRecordEnumeratorForContentDeltaVector:v66 metaContentDeltaVector:v65 seenContentBuilder:v43 seenMetaContentBuilder:v44 deviceMapping:deviceMapping error:&v74];
          id v47 = v74;
          provenanceEnumerator = self->_provenanceEnumerator;
          p_provenanceEnumerator = &self->_provenanceEnumerator;
          *p_provenanceEnumerator = (CCDatabaseValueRowEnumerator *)v46;

          if (*p_provenanceEnumerator) {
            BOOL v50 = v47 == 0;
          }
          else {
            BOOL v50 = 0;
          }
          BOOL v51 = v50;
          v52 = v47;
          if (!v50)
          {
            __biome_log_for_category();
            v53 = id v26 = v62;
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
              -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.4(p_provenanceEnumerator);
            }

            CCSetError(a5, v52);
            BOOL v51 = 0;
            goto LABEL_66;
          }
        }
        else
        {
          uint64_t v60 = __biome_log_for_category();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
            -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:]();
          }

          v52 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.CascadeSets.Set" code:2 userInfo:0];
          CCSetError(a5, v52);
          BOOL v51 = 0;
        }
        id v26 = v62;
LABEL_66:

LABEL_67:
LABEL_68:
        v57 = v66;

        _Block_object_dispose(&v79, 8);
LABEL_69:

LABEL_70:
        goto LABEL_49;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:]();
      }
    }
    else
    {
      v54 = __biome_log_for_category();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:]();
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:]9();
    }

    CCSetError(a5, v15);
  }
  BOOL v51 = 0;
LABEL_49:

  return v51;
}

void __97__CCDatabaseSetChangeEnumerator_imputeChangesSinceLastContentVector_lastMetaContentVector_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  int64_t v5 = [v7 contentState];
  if ([v5 unsignedIntValue] == 2)
  {
    BOOL v6 = [v7 contentHash];

    if (!v6)
    {
      *a3 = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    }
  }
  else
  {
  }
}

void __97__CCDatabaseSetChangeEnumerator_imputeChangesSinceLastContentVector_lastMetaContentVector_error___block_invoke_33(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  int64_t v5 = [v7 metaContentState];
  if ([v5 unsignedIntValue] == 2)
  {
    BOOL v6 = [v7 instanceHash];

    if (!v6)
    {
      *a3 = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    }
  }
  else
  {
  }
}

- (id)contentMessageFromContentData:(id)a3
{
  if (a3)
  {
    set = self->_set;
    id v4 = a3;
    id v9 = 0;
    int64_t v5 = +[CCItemMessage contentMessageForItemType:[(CCSet *)set itemType] data:v4 error:&v9];

    id v6 = v9;
    if (!v5)
    {
      id v7 = __biome_log_for_category();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CCDatabaseSetChangeEnumerator contentMessageFromContentData:]();
      }
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)metaContentMessageFromMetaContentData:(id)a3
{
  if (a3)
  {
    set = self->_set;
    id v4 = a3;
    id v9 = 0;
    int64_t v5 = +[CCItemMessage metaContentMessageForItemType:[(CCSet *)set itemType] data:v4 error:&v9];

    id v6 = v9;
    if (!v5)
    {
      id v7 = __biome_log_for_category();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CCDatabaseSetChangeEnumerator contentMessageFromContentData:]();
      }
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)_cachedDeviceWithRowId:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(NSMutableDictionary *)self->_deviceCache objectForKey:v4];
  if (!v5)
  {
    id v6 = [(CCDatabaseDeviceMapping *)self->_deviceMapping deviceRecordForDeviceRowId:v4];
    id v7 = [CCDevice alloc];
    id v8 = [v6 deviceId];
    int64_t v5 = -[CCDevice initWithIdentifier:options:](v7, "initWithIdentifier:options:", v8, [v6 options]);

    if (!self->_deviceCache)
    {
      id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      deviceCache = self->_deviceCache;
      self->_deviceCache = v9;
    }
    if (v5) {
      [(NSMutableDictionary *)self->_deviceCache setObject:v5 forKey:v4];
    }
  }

  return v5;
}

+ (unint64_t)sharedItemCountFromBookmark:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v4 = [v3 contentVector];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__CCDatabaseSetChangeEnumerator_sharedItemCountFromBookmark___block_invoke;
  v7[3] = &unk_26527A5C0;
  v7[4] = &v8;
  [v4 enumerateAllClockValuesUsingBlock:v7];

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __61__CCDatabaseSetChangeEnumerator_sharedItemCountFromBookmark___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  if (a6 == 1) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a4;
  }
  return result;
}

+ (unint64_t)localItemInstanceCountFromBookmark:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v4 = [v3 metaContentVector];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__CCDatabaseSetChangeEnumerator_localItemInstanceCountFromBookmark___block_invoke;
  v7[3] = &unk_26527A5C0;
  v7[4] = &v8;
  [v4 enumerateAllClockValuesUsingBlock:v7];

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __68__CCDatabaseSetChangeEnumerator_localItemInstanceCountFromBookmark___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  if (a6 == 1) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a4;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCache, 0);
  objc_storeStrong((id *)&self->_deviceMapping, 0);
  objc_storeStrong((id *)&self->_lastDeltaDate, 0);
  objc_storeStrong((id *)&self->_resourceVersion, 0);
  objc_storeStrong((id *)&self->_seenMetaContentBuilder, 0);
  objc_storeStrong((id *)&self->_seenContentBuilder, 0);
  objc_storeStrong((id *)&self->_currentMutableSetChange, 0);
  objc_storeStrong((id *)&self->_provenanceEnumerator, 0);
  objc_storeStrong((id *)&self->_metaContentRemovalsVector, 0);
  objc_storeStrong((id *)&self->_metaContentContentsVector, 0);
  objc_storeStrong((id *)&self->_contentRemovalsVector, 0);
  objc_storeStrong((id *)&self->_contentContentsVector, 0);
  objc_storeStrong((id *)&self->_lastMetaContentStateVector, 0);
  objc_storeStrong((id *)&self->_lastContentStateVector, 0);
  objc_storeStrong((id *)&self->_stateReader, 0);
  objc_storeStrong((id *)&self->_databaseAccess, 0);

  objc_storeStrong((id *)&self->_set, 0);
}

- (void)initWithSet:readAccess:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_249B92000, v0, v1, "Failed to obtain database read access.", v2, v3, v4, v5, v6);
}

- (void)initWithSet:readAccess:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_249B92000, v0, v1, "State reader creation failed.", v2, v3, v4, v5, v6);
}

- (void)beginWithBookmark:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_249B92000, v0, v1, "Could not determine a valid resource version for the current set - returning no results from enumeration", v2, v3, v4, v5, v6);
}

- (void)next
{
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(&dword_249B92000, v0, OS_LOG_TYPE_FAULT, "provenance enumerator was not initialized, returning nil results", v1, 2u);
}

- (void)resourceVersion
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 8);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_249B92000, v1, v2, "failed to read resource version for set: %@ error: %@", (void)v3, DWORD2(v3));
}

- (void)lastDeltaDate
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 8);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_249B92000, v1, v2, "failed to read last delta date for set: %@ error: %@", (void)v3, DWORD2(v3));
}

- (void)isBookmarkUpToDate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  long long v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_249B92000, a2, OS_LOG_TYPE_ERROR, "Unexpected bookmark class: %@", v5, 0xCu);
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_249B92000, v0, v1, "The current stateVector is missing.", v2, v3, v4, v5, v6);
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_249B92000, v0, v1, "The current metaContentStateVector is missing.", v2, v3, v4, v5, v6);
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_249B92000, v0, v1, "Bookmark is invalid and cannot be resumed from as it is too old and tombstones have been cleaned up", v2, v3, v4, v5, v6);
}

- (void)imputeChangesSinceLastContentVector:(void *)a1 lastMetaContentVector:error:.cold.4(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_249B92000, v1, v2, "Could not construct provenance enumerator %@ with error: %@", (void)v3, DWORD2(v3));
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Failed to enumerate provenance rows for tombstoned metacontent: %@", v2, v3, v4, v5, v6);
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Failed to enumerate provenance rows for tombstoned content: %@", v2, v3, v4, v5, v6);
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_249B92000, v0, v1, "metaContentRemovalsVector %@", v2, v3, v4, v5, v6);
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_249B92000, v0, v1, "metaContentContentsVector %@", v2, v3, v4, v5, v6);
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.9()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_249B92000, v0, v1, "contentRemovalsVector %@", v2, v3, v4, v5, v6);
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.10()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_249B92000, v0, v1, "contentContentsVector %@", v2, v3, v4, v5, v6);
}

- (void)imputeChangesSinceLastContentVector:(uint64_t)a1 lastMetaContentVector:error:.cold.11(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7(&dword_249B92000, v1, v2, "Current meta content state vector has regressed from last known client provided state vector current:%@ last:%@", (void)v3, DWORD2(v3));
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.12()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_249B92000, v0, v1, "metaContentStateVector %@", v2, v3, v4, v5, v6);
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.13()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_249B92000, v0, v1, "lastMetaContentVector %@", v2, v3, v4, v5, v6);
}

- (void)imputeChangesSinceLastContentVector:(uint64_t)a1 lastMetaContentVector:error:.cold.14(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7(&dword_249B92000, v1, v2, "Current content state vector has regressed from last known client provided state vector current:%@ last:%@", (void)v3, DWORD2(v3));
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.15()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_249B92000, v0, v1, "contentStateVector %@", v2, v3, v4, v5, v6);
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.16()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_249B92000, v0, v1, "lastContentVector %@", v2, v3, v4, v5, v6);
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.19()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Failed to construct content and metacontent state vectors from database: %@", v2, v3, v4, v5, v6);
}

- (void)contentMessageFromContentData:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "error initializing metacontent message: %@", v2, v3, v4, v5, v6);
}

@end