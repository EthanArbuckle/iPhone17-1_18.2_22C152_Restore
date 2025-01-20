@interface BADownload
+ (BOOL)supportsSecureCoding;
+ (id)classesForSerialization;
- (BADownload)copyAsNonEssential;
- (BADownload)init;
- (BADownload)initWithCoder:(id)a3;
- (BADownloadState)state;
- (BADownloaderPriority)priority;
- (BOOL)cloneDownloadToFinalDestinationURL:(id *)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEssential;
- (NSString)applicationGroupIdentifier;
- (NSString)identifier;
- (NSString)uniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)initPrivatelyWithApplicationGroupIdentifier:(id)a3;
- (id)stagedDownloadedFileURL;
- (int64_t)necessity;
- (uint64_t)clientSpecifiedFileSize;
- (uint64_t)internalState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationGroupIdentifier:(id)a3;
- (void)setClientSpecifiedFileSize:(void *)a1;
- (void)setIdentifier:(id)a3;
- (void)setInternalState:(void *)a1;
- (void)setNecessity:(int64_t)a3;
- (void)setPriority:(int64_t)a3;
- (void)setStagedDownloadedFileURL:(void *)a1;
- (void)setUniqueIdentifier:(id)a3;
- (void)syncTo:(id)a3;
@end

@implementation BADownload

+ (id)classesForSerialization
{
  if (classesForSerialization_onceToken != -1) {
    dispatch_once(&classesForSerialization_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)classesForSerialization_collections;

  return v2;
}

void __50__BADownload_VeryPrivate__classesForSerialization__block_invoke()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v0 = +[NSSet _baassets_collectionClasses]();
  v1 = (void *)classesForSerialization_collections;
  classesForSerialization_collections = v0;

  v2 = (void *)classesForSerialization_collections;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:7];
  uint64_t v4 = objc_msgSend(v2, "setByAddingObjectsFromArray:", v3, v6, v7, v8, v9, v10, v11);
  v5 = (void *)classesForSerialization_collections;
  classesForSerialization_collections = v4;
}

- (void)syncTo:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 priority];
  uint64_t v5 = 1000;
  if (v4 <= 1000) {
    uint64_t v5 = [v9 priority];
  }
  [(BADownload *)self setPriority:v5];
  -[BADownload setNecessity:](self, "setNecessity:", [v9 necessity]);
  uint64_t v7 = [(BADownload *)v9 stagedDownloadedFileURL];
  -[BADownload setStagedDownloadedFileURL:](self, v7);

  uint64_t v8 = -[BADownload internalState](v9);
  -[BADownload setInternalState:](self, v8);
}

- (BOOL)cloneDownloadToFinalDestinationURL:(id *)a3 error:(id *)a4
{
  v44[2] = *MEMORY[0x263EF8340];
  uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v8 = [(BADownload *)self applicationGroupIdentifier];
  id v9 = [v7 containerURLForSecurityApplicationGroupIdentifier:v8];

  if (v9)
  {
    uint64_t v10 = [v9 URLByAppendingPathComponent:@"Library/Caches/com.apple.BackgroundAssets"];

    char v42 = 0;
    uint64_t v11 = [v10 path];
    int v12 = [v7 fileExistsAtPath:v11 isDirectory:&v42];

    if (v12)
    {
      if (v42)
      {
LABEL_6:
        v40 = a4;
        v41 = v7;
        uint64_t v13 = [MEMORY[0x263F08C38] UUID];
        v14 = [v13 UUIDString];
        uint64_t v15 = [v14 substringToIndex:8];

        v39 = (void *)v15;
        v16 = [NSString stringWithFormat:@"BAFile-%@", v15];
        [NSString stringWithFormat:@"%@.%@", v16, @"tmp"];
        uint64_t v38 = v17 = v10;
        v19 = objc_msgSend(v10, "URLByAppendingPathComponent:");
        uint64_t v20 = 0;
        while (1)
        {
          id v21 = [(BADownload *)self stagedDownloadedFileURL];
          v22 = (const char *)[v21 fileSystemRepresentation];
          id v23 = v19;
          int v24 = clonefile(v22, (const char *)[v23 fileSystemRepresentation], 3u);
          BOOL v25 = v24 == 0;

          if (!v24) {
            break;
          }
          v26 = __error();
          if (v20 == 0x7FFFFFFFFFFFFFFFLL || *v26 != 17)
          {
            uint64_t v7 = v41;
            if (v40)
            {
              v43[0] = @"SourceURL";
              uint64_t v33 = [(BADownload *)self stagedDownloadedFileURL];
              v34 = (void *)v33;
              if (!v33)
              {
                uint64_t v33 = [MEMORY[0x263EFF9D0] null];
              }
              v37 = (void *)v33;
              v43[1] = @"DestURL";
              v44[0] = v33;
              v35 = v23;
              if (!v23)
              {
                v35 = [MEMORY[0x263EFF9D0] null];
              }
              v44[1] = v35;
              v36 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
              if (v23)
              {
                if (v34) {
                  goto LABEL_30;
                }
LABEL_34:
              }
              else
              {

                if (!v34) {
                  goto LABEL_34;
                }
              }
LABEL_30:

              id *v40 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:v36];
            }
            v31 = (void *)v38;
            v30 = v39;
            if (!a3)
            {
LABEL_21:

              goto LABEL_22;
            }
LABEL_20:
            *a3 = 0;
            goto LABEL_21;
          }
          v28 = [NSString stringWithFormat:@"%@-%ld.%@", v16, ++v20, @"tmp"];
          v19 = [v17 URLByAppendingPathComponent:v28];
        }
        if (a3) {
          *a3 = v23;
        }
        a3 = v40;
        uint64_t v7 = v41;
        v31 = (void *)v38;
        v30 = v39;
        if (!v40) {
          goto LABEL_21;
        }
        goto LABEL_20;
      }
      [v7 removeItemAtURL:v10 error:0];
    }
    [v7 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:0];
    goto LABEL_6;
  }
  v29 = BAClientLogObject();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    -[BADownload(VeryPrivate) cloneDownloadToFinalDestinationURL:error:](self, v29);
  }

  if (a4)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:2 userInfo:0];
  }
  BOOL v25 = 0;
  if (a3) {
    *a3 = 0;
  }
LABEL_22:

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BADownload)init
{
  result = (BADownload *)os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
  if (result)
  {
    int v3 = 136315138;
    uint64_t v4 = "BADownload cannot be constructed using -init.";
    _os_log_fault_impl(&dword_226E14000, &_os_log_internal, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF BackgroundAssets: %s", (uint8_t *)&v3, 0xCu);
  }
  qword_26815EF58 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: BADownload cannot be constructed using -init.";
  __break(1u);
  return result;
}

- (BADownload)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BADownload;
  uint64_t v5 = [(BADownload *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(BADownload *)v5 setIdentifier:v6];

    -[BADownload setInternalState:](v5, [v4 decodeIntegerForKey:@"internalState"]);
    if ([v4 containsValueForKey:@"necessity"])
    {
      unint64_t v7 = [v4 decodeIntegerForKey:@"necessity"];
      self;
      if (v7 >= 2) {
        unint64_t v8 = 0;
      }
      else {
        unint64_t v8 = v7;
      }
    }
    else
    {
      unint64_t v8 = 0;
    }
    [(BADownload *)v5 setNecessity:v8];
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"priority"];
    uint64_t v10 = [v9 integerValue];
    if (v10 >= 1000) {
      uint64_t v11 = 1000;
    }
    else {
      uint64_t v11 = v10;
    }
    [(BADownload *)v5 setPriority:v11];
    int v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
    [(BADownload *)v5 setUniqueIdentifier:v12];

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationGroupIdentifier"];
    [(BADownload *)v5 setApplicationGroupIdentifier:v13];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stagedDownloadedFileURL"];
    objc_setProperty_atomic(v5, v15, v14, 64);

    -[BADownload setClientSpecifiedFileSize:](v5, [v4 decodeIntegerForKey:@"clientSpecifiedFileSize"]);
  }

  return v5;
}

- (void)setInternalState:(void *)a1
{
  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    obj[2] = a2;
    objc_sync_exit(obj);
  }
}

- (void)setStagedDownloadedFileURL:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 64);
  }
}

- (void)setClientSpecifiedFileSize:(void *)a1
{
  if (a1)
  {
    uint64_t v4 = [a1 necessity];
    if (a2 || v4 != 1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      obj = a1;
      objc_sync_enter(obj);
      obj[4] = a2;
      objc_sync_exit(obj);
    }
    else
    {
      BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
      if (v5) {
        -[BADownload setClientSpecifiedFileSize:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
      qword_26815EF58 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: The provided fileSize for BADownload must be a posit"
                                 "ive number that matches the actual file size on the server.";
      __break(1u);
    }
  }
}

- (id)initPrivatelyWithApplicationGroupIdentifier:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BADownload;
  BOOL v5 = [(BADownload *)&v22 init];
  if (!v5) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Provided applicationGroupIdentifier must be a valid string." userInfo:0];
    [v7 raise];
LABEL_11:

    v18 = 0;
    goto LABEL_12;
  }
  uint64_t v6 = [MEMORY[0x263F01890] bundleRecordForCurrentProcess];
  if (!v6)
  {
    uint64_t v7 = [NSString stringWithFormat:@"The current process is not contained in an app bundle.So the request app group is not available: %@", v4];
    uint64_t v8 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v7 userInfo:0];
    [v8 raise];
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v7 = v6;
  uint64_t v8 = [v6 groupContainerURLs];
  uint64_t v9 = [v8 allKeys];
  char v10 = [v9 containsObject:v4];

  if ((v10 & 1) == 0)
  {
    v19 = [NSString stringWithFormat:@"The current app has no app groups it is a member of %@", v4];
    uint64_t v20 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v19 userInfo:0];
    [v20 raise];

    goto LABEL_10;
  }

  uint64_t v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = NSStringFromClass(v11);
  -[BADownload setInternalState:](v5, 0);
  [(BADownload *)v5 setPriority:0];
  [(BADownload *)v5 setApplicationGroupIdentifier:v4];
  [(BADownload *)v5 setNecessity:0];
  -[BADownload setClientSpecifiedFileSize:](v5, 0);
  uint64_t v13 = NSString;
  v14 = [(BADownload *)v5 applicationGroupIdentifier];
  SEL v15 = [MEMORY[0x263F08C38] UUID];
  v16 = [v15 UUIDString];
  objc_super v17 = [v13 stringWithFormat:@"%@.%@.%@", v12, v14, v16];
  [(BADownload *)v5 setUniqueIdentifier:v17];

LABEL_6:
  v18 = v5;
LABEL_12:

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  BOOL v5 = [(BADownload *)v4 identifier];
  [v12 encodeObject:v5 forKey:@"identifier"];

  [v12 encodeInteger:-[BADownload internalState](v4) forKey:@"internalState"];
  objc_msgSend(v12, "encodeInteger:forKey:", -[BADownload necessity](v4, "necessity"), @"necessity");
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[BADownload priority](v4, "priority"));
  [v12 encodeObject:v6 forKey:@"priority"];

  [v12 encodeInteger:-[BADownload clientSpecifiedFileSize](v4) forKey:@"clientSpecifiedFileSize"];
  uint64_t v7 = [(BADownload *)v4 uniqueIdentifier];
  [v12 encodeObject:v7 forKey:@"uniqueIdentifier"];

  uint64_t v8 = [(BADownload *)v4 applicationGroupIdentifier];
  [v12 encodeObject:v8 forKey:@"applicationGroupIdentifier"];

  if (v4 && objc_getProperty(v4, v9, 64, 1))
  {
    id v11 = objc_getProperty(v4, v10, 64, 1);
    [v12 encodeObject:v11 forKey:@"stagedDownloadedFileURL"];
  }
  objc_sync_exit(v4);
}

- (uint64_t)internalState
{
  if (!a1) {
    return 0;
  }
  v1 = a1;
  objc_sync_enter(v1);
  uint64_t v2 = v1[2];
  objc_sync_exit(v1);

  return v2;
}

- (uint64_t)clientSpecifiedFileSize
{
  if (!a1) {
    return 0;
  }
  v1 = a1;
  objc_sync_enter(v1);
  uint64_t v2 = v1[4];
  objc_sync_exit(v1);

  return v2;
}

- (id)stagedDownloadedFileURL
{
  if (result) {
    return objc_getProperty(result, a2, 64, 1);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  if (v6 == v7) {
    BOOL v5 = (void *)+[BAManifestDownload superclass];
  }
  uint64_t v8 = self;
  objc_sync_enter(v8);
  uint64_t v9 = (void *)[v5 allocWithZone:a3];
  char v10 = [(BADownload *)v8 applicationGroupIdentifier];
  id v11 = (void *)[v9 initPrivatelyWithApplicationGroupIdentifier:v10];

  if (v11)
  {
    id v12 = [(BADownload *)v8 identifier];
    uint64_t v13 = (void *)[v12 copyWithZone:a3];
    [v11 setIdentifier:v13];

    uint64_t v14 = -[BADownload internalState](v8);
    -[BADownload setInternalState:](v11, v14);
    objc_msgSend(v11, "setPriority:", -[BADownload priority](v8, "priority"));
    if (v6 == v7)
    {
      [v11 setNecessity:0];
      uint64_t v15 = 0;
    }
    else
    {
      objc_msgSend(v11, "setNecessity:", -[BADownload necessity](v8, "necessity"));
      uint64_t v15 = -[BADownload clientSpecifiedFileSize](v8);
    }
    -[BADownload setClientSpecifiedFileSize:](v11, v15);
    v16 = [(BADownload *)v8 uniqueIdentifier];
    objc_super v17 = (void *)[v16 copyWithZone:a3];
    [v11 setUniqueIdentifier:v17];

    v18 = [(BADownload *)v8 applicationGroupIdentifier];
    v19 = (void *)[v18 copyWithZone:a3];
    [v11 setApplicationGroupIdentifier:v19];

    if (v8) {
      id Property = objc_getProperty(v8, v20, 64, 1);
    }
    else {
      id Property = 0;
    }
    id v22 = Property;
    id v23 = (void *)[v22 copyWithZone:a3];
    objc_setProperty_atomic(v11, v24, v23, 64);
  }
  objc_sync_exit(v8);

  return v11;
}

- (BADownloaderPriority)priority
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BADownloaderPriority priority = v2->_priority;
  objc_sync_exit(v2);

  return priority;
}

- (void)setPriority:(int64_t)a3
{
  if (a3 > 1000)
  {
    BOOL v4 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v4) {
      -[BADownload setPriority:](v4, v5, v6, v7, v8, v9, v10, v11);
    }
    qword_26815EF58 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Priority cannot be set to a value greater than BADownl"
                               "oaderPriorityMax.";
    __break(1u);
  }
  else if (a3 >= -1000)
  {
    obj = self;
    objc_sync_enter(obj);
    obj->_BADownloaderPriority priority = a3;
    objc_sync_exit(obj);

    return;
  }
  BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
  if (v12) {
    -[BADownload setPriority:](v12, v13, v14, v15, v16, v17, v18, v19);
  }
  qword_26815EF58 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Priority cannot be set to a value less than BADownloaderPriorityMin.";
  __break(1u);
}

- (BOOL)isEssential
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_necessity == 1;
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)necessity
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  int64_t necessity = v2->_necessity;
  objc_sync_exit(v2);

  return necessity;
}

- (void)setNecessity:(int64_t)a3
{
  self;
  if ((unint64_t)a3 >= 2)
  {
    BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v5) {
      -[BADownload setNecessity:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
    qword_26815EF58 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Cannot provide an unsupported BADownloadNecessity.";
    __break(1u);
  }
  else
  {
    obj = self;
    objc_sync_enter(obj);
    obj->_int64_t necessity = a3;
    objc_sync_exit(obj);
  }
}

- (BADownloadState)state
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = -[BADownload internalState](v2);
  if (v3 > 8) {
    BADownloadState v4 = BADownloadStateFailed;
  }
  else {
    BADownloadState v4 = qword_226E28E68[v3];
  }
  objc_sync_exit(v2);

  return v4;
}

- (BADownload)copyAsNonEssential
{
  uint64_t v2 = (BADownload *)[(BADownload *)self copy];
  [(BADownload *)v2 setNecessity:0];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  BADownloadState v4 = (BADownload *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      uint64_t v6 = [(BADownload *)self uniqueIdentifier];
      uint64_t v7 = [(BADownload *)v5 uniqueIdentifier];
      if ([v6 isEqual:v7])
      {
        uint64_t v8 = [(BADownload *)self identifier];
        uint64_t v9 = [(BADownload *)v5 identifier];
        char v10 = [v8 isEqualToString:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(BADownload *)self uniqueIdentifier];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(BADownload *)self identifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  unint64_t v6 = [(BADownload *)self identifier];
  uint64_t v7 = BADownloadNecessityToString([(BADownload *)self necessity]);
  uint64_t v8 = [v3 stringWithFormat:@"%@ (%p): [ID:%@, Necessity:%@]", v5, self, v6, v7];

  return v8;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  unint64_t v6 = [(BADownload *)self identifier];
  uint64_t v7 = (void *)[v3 initWithFormat:@"%@ (%p): %@\n", v5, self, v6];

  uint64_t v8 = -[BADownload internalState](self);
  if ((unint64_t)(v8 + 2) > 0xA) {
    uint64_t v9 = @"???";
  }
  else {
    uint64_t v9 = off_2647E8ED8[v8 + 2];
  }
  [v7 appendFormat:@"State: %@\n", v9];
  objc_msgSend(v7, "appendFormat:", @"Priority: %lu\n", -[BADownload priority](self, "priority"));
  char v10 = BADownloadNecessityToString([(BADownload *)self necessity]);
  [v7 appendFormat:@"Download Necessity: %@\n", v10];

  uint64_t v11 = [(BADownload *)self uniqueIdentifier];
  [v7 appendFormat:@"Unique identifier: %@\n", v11];

  uint64_t v12 = [(BADownload *)self applicationGroupIdentifier];
  [v7 appendFormat:@"App Group identifier: %@\n", v12];

  if (self) {
    id Property = objc_getProperty(self, v13, 64, 1);
  }
  else {
    id Property = 0;
  }
  [v7 appendFormat:@"Staged file url: %@\n", Property];
  objc_msgSend(v7, "appendFormat:", @"Client file size: %ld\n", -[BADownload clientSpecifiedFileSize](self));

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)applicationGroupIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setApplicationGroupIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedDownloadedFileURL, 0);
  objc_storeStrong((id *)&self->_applicationGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setClientSpecifiedFileSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setPriority:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setPriority:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setNecessity:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end