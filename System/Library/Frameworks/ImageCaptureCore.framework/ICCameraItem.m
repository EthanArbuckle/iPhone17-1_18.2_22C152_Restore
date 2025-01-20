@interface ICCameraItem
- (BOOL)hasMetadata;
- (BOOL)hasThumbnail;
- (BOOL)isInTemporaryStore;
- (BOOL)isLocked;
- (BOOL)isRaw;
- (BOOL)wasAddedAfterContentCatalogCompleted;
- (CGImageRef)largeThumbnailIfAvailable;
- (CGImageRef)thumbnail;
- (CGImageRef)thumbnailIfAvailable;
- (ICCameraDevice)device;
- (ICCameraFolder)parentFolder;
- (ICCameraItem)initWithDictionary:(id)a3 parentFolder:(id)a4 device:(id)a5;
- (ICCameraItem)initWithName:(id)a3 parentFolder:(id)a4 device:(id)a5;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSDictionary)metadata;
- (NSDictionary)metadataIfAvailable;
- (NSMutableDictionary)userData;
- (NSString)UTI;
- (NSString)fileSystemPath;
- (NSString)mediaItemType;
- (NSString)name;
- (NSString)relativeFileSystemPath;
- (id)description;
- (id)userObject;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)objectID;
- (unint64_t)ownerID;
- (unint64_t)parentID;
- (unint64_t)privMetadataState;
- (unint64_t)privThumbnailState;
- (unint64_t)twinID;
- (unsigned)objectHandle;
- (unsigned)ptpObjectHandle;
- (void)appendToPath:(id)a3;
- (void)flushMetadataCache;
- (void)flushThumbnailCache;
- (void)requestMetadata;
- (void)requestThumbnail;
- (void)setAddedAfterContentCatalogCompleted:(BOOL)a3;
- (void)setCreationDate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setInTemporaryStore:(BOOL)a3;
- (void)setLocked:(BOOL)a3;
- (void)setMetadataState:(unint64_t)a3;
- (void)setModificationDate:(id)a3;
- (void)setName:(id)a3;
- (void)setObjectHandle:(unsigned int)a3;
- (void)setObjectID:(unint64_t)a3;
- (void)setOwnerID:(unint64_t)a3;
- (void)setParentFolder:(id)a3;
- (void)setParentID:(unint64_t)a3;
- (void)setPrivMetadataState:(unint64_t)a3;
- (void)setPrivThumbnailState:(unint64_t)a3;
- (void)setPtpObjectHandle:(unsigned int)a3;
- (void)setRaw:(BOOL)a3;
- (void)setTwinID:(unint64_t)a3;
- (void)setUTI:(id)a3;
- (void)setUserData:(id)a3;
- (void)setUserObject:(id)a3;
@end

@implementation ICCameraItem

- (ICCameraItem)initWithName:(id)a3 parentFolder:(id)a4 device:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICCameraItem;
  v11 = [(ICCameraItem *)&v17 init];
  v12 = v11;
  if (v11)
  {
    [(ICCameraItem *)v11 setName:v8];
    [(ICCameraItem *)v12 setParentFolder:v9];
    -[ICCameraItem setParentID:](v12, "setParentID:", [v9 objectID]);
    atomic_fetch_add(NextICAObjectID__sLastICObjectID, 2u);
    signed int v13 = atomic_load((unsigned int *)NextICAObjectID__sLastICObjectID);
    [(ICCameraItem *)v12 setObjectID:v13];
    [(ICCameraItem *)v12 setOwnerID:0];
    [(ICCameraItem *)v12 setTwinID:0];
    [(ICCameraItem *)v12 setDevice:v10];
    v14 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    [(ICCameraItem *)v12 setUserData:v14];

    v15 = v12;
  }

  return v12;
}

- (void)setUTI:(id)a3
{
  id v13 = a3;
  v4 = [(id)*MEMORY[0x1E4F443C8] identifier];
  int v5 = [v13 isEqualToString:v4];

  if (v5)
  {
    v6 = (NSString **)MEMORY[0x1E4F225C8];
  }
  else
  {
    v7 = [(id)*MEMORY[0x1E4F44400] identifier];
    int v8 = [v13 isEqualToString:v7];

    if (v8)
    {
      v6 = (NSString **)MEMORY[0x1E4F225F8];
    }
    else
    {
      id v9 = [(id)*MEMORY[0x1E4F44448] identifier];
      int v10 = [v13 isEqualToString:v9];

      if (v10)
      {
        v6 = (NSString **)MEMORY[0x1E4F22660];
      }
      else
      {
        v11 = [(id)*MEMORY[0x1E4F44330] identifier];
        int v12 = [v13 isEqualToString:v11];

        if (v12) {
          v6 = (NSString **)MEMORY[0x1E4F22538];
        }
        else {
          v6 = (NSString **)MEMORY[0x1E4F22590];
        }
      }
    }
  }
  self->_UTI = *v6;
}

- (void)setParentID:(unint64_t)a3
{
  self->_parentID = a3;
}

- (void)setOwnerID:(unint64_t)a3
{
  self->_ownerID = a3;
}

- (void)setTwinID:(unint64_t)a3
{
  self->_twinID = a3;
}

- (void)setObjectID:(unint64_t)a3
{
  self->_objectID = a3;
}

- (NSString)mediaItemType
{
  return (NSString *)@"item";
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"\n%@ <%p>:\n", objc_opt_class(), self];
  v4 = [(ICCameraItem *)self device];
  int v5 = [v4 name];
  [v3 appendFormat:@"  device                  : %@\n", v5];

  objc_msgSend(v3, "appendFormat:", @"  parentID                : 0x%lx\n", -[ICCameraItem parentID](self, "parentID"));
  objc_msgSend(v3, "appendFormat:", @"  objectID                : 0x%lx\n", -[ICCameraItem objectID](self, "objectID"));
  v6 = [(ICCameraItem *)self parentFolder];
  v7 = [v6 name];
  [v3 appendFormat:@"  parentFolder            : %@\n", v7];

  int v8 = [(ICCameraItem *)self name];
  [v3 appendFormat:@"  name                    : %@\n", v8];

  id v9 = [(ICCameraItem *)self UTI];
  [v3 appendFormat:@"  UTI                     : %@\n", v9];

  BOOL v10 = [(ICCameraItem *)self isLocked];
  v11 = "NO";
  if (v10) {
    v11 = "YES";
  }
  objc_msgSend(v3, "appendFormat:", @"  locked                  : %s\n", v11);
  int v12 = [(ICCameraItem *)self creationDate];
  [v3 appendFormat:@"  creationDate            : %@\n", v12];

  id v13 = [(ICCameraItem *)self modificationDate];
  [v3 appendFormat:@"  modificationDate        : %@\n", v13];

  return v3;
}

- (void)setMetadataState:(unint64_t)a3
{
  if ([(ICCameraItem *)self privMetadataState] != a3)
  {
    [(ICCameraItem *)self setPrivMetadataState:a3];
  }
}

- (id)valueForUndefinedKey:(id)a3
{
  if ([a3 isEqual:@"thumbnail"])
  {
    v4 = [(ICCameraItem *)self thumbnail];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)requestThumbnail
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BEEFF000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
}

- (void)requestMetadata
{
  __ICOSLogCreate();
  uint64_t v2 = [NSString stringWithFormat:@"[ICCameraItem requestMetadata] - unimplemented in base class"];
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
    -[ICCameraItem requestThumbnail]();
  }
}

- (void)flushThumbnailCache
{
  __ICOSLogCreate();
  uint64_t v2 = [NSString stringWithFormat:@"[ICCameraItem flushThumbnailCache] - unimplemented in base class"];
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
    -[ICCameraItem requestThumbnail]();
  }
}

- (void)flushMetadataCache
{
  __ICOSLogCreate();
  uint64_t v2 = [NSString stringWithFormat:@"[ICCameraItem flushMetadataCache] - unimplemented in base class"];
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
    -[ICCameraItem requestThumbnail]();
  }
}

- (CGImageRef)thumbnail
{
  return 0;
}

- (NSDictionary)metadata
{
  return 0;
}

- (BOOL)hasThumbnail
{
  return 0;
}

- (BOOL)hasMetadata
{
  return 0;
}

- (NSString)fileSystemPath
{
  uint64_t v3 = [(ICCameraItem *)self device];
  uint64_t v4 = [v3 volumePath];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28E78] stringWithCapacity:0];
    [(ICCameraItem *)self appendToPath:v5];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSString *)v5;
}

- (void)appendToPath:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(ICCameraItem *)self device];
  uint64_t v5 = [v4 volumePath];

  if (v5)
  {
    uint8_t v6 = [(ICCameraItem *)self parentFolder];

    if (v6)
    {
      v7 = [(ICCameraItem *)self parentFolder];
      [v7 appendToPath:v9];
    }
    else
    {
      [v9 appendString:v5];
    }
    int v8 = [(ICCameraItem *)self name];
    [v9 appendFormat:@"/%@", v8];
  }
}

- (ICCameraItem)initWithDictionary:(id)a3 parentFolder:(id)a4 device:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)ICCameraItem;
  v11 = [(ICCameraItem *)&v28 init];
  int v12 = v11;
  if (v11)
  {
    [(ICCameraItem *)v11 setDevice:v10];
    [(ICCameraItem *)v12 setParentFolder:v9];
    -[ICCameraItem setParentID:](v12, "setParentID:", [v9 objectID]);
    id v13 = [v8 objectForKeyedSubscript:@"icao"];
    -[ICCameraItem setObjectID:](v12, "setObjectID:", [v13 unsignedIntegerValue]);

    [(ICCameraItem *)v12 setOwnerID:0];
    [(ICCameraItem *)v12 setTwinID:0];
    v14 = [v8 objectForKeyedSubscript:@"ifil"];
    [(ICCameraItem *)v12 setName:v14];

    v15 = [v8 objectForKeyedSubscript:@"AddedAfterContentCatalogCompleted"];
    v16 = v15;
    if (v15) {
      uint64_t v17 = [v15 BOOLValue];
    }
    else {
      uint64_t v17 = 0;
    }
    [(ICCameraItem *)v12 setAddedAfterContentCatalogCompleted:v17];
    v18 = [v8 objectForKeyedSubscript:@"file"];
    int v19 = [v18 unsignedIntValue];

    v20 = (id *)MEMORY[0x1E4F443C8];
    if (v19 != 1684632165) {
      v20 = (id *)MEMORY[0x1E4F44378];
    }
    v21 = [*v20 identifier];
    [(ICCameraItem *)v12 setUTI:v21];

    v22 = [v8 objectForKeyedSubscript:@"lock"];
    -[ICCameraItem setLocked:](v12, "setLocked:", [v22 unsignedIntValue] == 1);

    v23 = [v8 objectForKeyedSubscript:@"ICAObjectInTemporaryStoreKey"];
    -[ICCameraItem setInTemporaryStore:](v12, "setInTemporaryStore:", [v23 isEqualToString:@"YES"]);

    v24 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    [(ICCameraItem *)v12 setUserData:v24];

    v25 = [v8 objectForKeyedSubscript:@"PTPObjH"];
    -[ICCameraItem setPtpObjectHandle:](v12, "setPtpObjectHandle:", [v25 unsignedIntValue]);

    [(ICCameraItem *)v12 setCreationDate:0];
    [(ICCameraItem *)v12 setModificationDate:0];
    v26 = v12;
  }
  return v12;
}

- (CGImageRef)thumbnailIfAvailable
{
  return 0;
}

- (CGImageRef)largeThumbnailIfAvailable
{
  return 0;
}

- (NSDictionary)metadataIfAvailable
{
  return 0;
}

- (ICCameraDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (ICCameraFolder)parentFolder
{
  return self->_parentFolder;
}

- (void)setParentFolder:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)UTI
{
  return self->_UTI;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (BOOL)isRaw
{
  return self->_raw;
}

- (void)setRaw:(BOOL)a3
{
  self->_raw = a3;
}

- (BOOL)isInTemporaryStore
{
  return self->_inTemporaryStore;
}

- (void)setInTemporaryStore:(BOOL)a3
{
  self->_inTemporaryStore = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
}

- (NSMutableDictionary)userData
{
  return self->_userData;
}

- (void)setUserData:(id)a3
{
}

- (unsigned)ptpObjectHandle
{
  return self->_ptpObjectHandle;
}

- (void)setPtpObjectHandle:(unsigned int)a3
{
  self->_ptpObjectHandle = a3;
}

- (BOOL)wasAddedAfterContentCatalogCompleted
{
  return self->_addedAfterContentCatalogCompleted;
}

- (void)setAddedAfterContentCatalogCompleted:(BOOL)a3
{
  self->_addedAfterContentCatalogCompleted = a3;
}

- (unint64_t)privMetadataState
{
  return self->_privMetadataState;
}

- (void)setPrivMetadataState:(unint64_t)a3
{
  self->_privMetadataState = a3;
}

- (unint64_t)privThumbnailState
{
  return self->_privThumbnailState;
}

- (void)setPrivThumbnailState:(unint64_t)a3
{
  self->_privThumbnailState = a3;
}

- (unsigned)objectHandle
{
  return self->_objectHandle;
}

- (void)setObjectHandle:(unsigned int)a3
{
  self->_objectHandle = a3;
}

- (unint64_t)parentID
{
  return self->_parentID;
}

- (unint64_t)ownerID
{
  return self->_ownerID;
}

- (unint64_t)twinID
{
  return self->_twinID;
}

- (unint64_t)objectID
{
  return self->_objectID;
}

- (id)userObject
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setUserObject:(id)a3
{
}

- (NSString)relativeFileSystemPath
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeFileSystemPath, 0);
  objc_storeStrong(&self->_userObject, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_parentFolder, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end