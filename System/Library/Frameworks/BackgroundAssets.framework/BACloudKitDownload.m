@interface BACloudKitDownload
+ (BOOL)supportsSecureCoding;
- (BACloudKitDownload)init;
- (BACloudKitDownload)initWithCoder:(id)a3;
- (BACloudKitDownload)initWithIdentifier:(id)a3 recordType:(id)a4 expectedFieldKey:(id)a5 expectedFieldValue:(id)a6 assetKey:(id)a7 applicationGroupIdentifier:(id)a8;
- (BACloudKitDownload)initWithIdentifier:(id)a3 recordType:(id)a4 expectedFieldKey:(id)a5 expectedFieldValue:(id)a6 assetKey:(id)a7 applicationGroupIdentifier:(id)a8 containerIdentifier:(id)a9 zoneID:(id)a10 databaseScope:(int64_t)a11 priority:(int64_t)a12;
- (BACloudKitDownload)initWithIdentifier:(id)a3 recordType:(id)a4 recordName:(id)a5 assetKey:(id)a6 applicationGroupIdentifier:(id)a7;
- (CKContainerID)containerID;
- (CKQuery)query;
- (CKRecordZoneID)zoneID;
- (NSString)assetKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initWithIdentifier:(void *)a3 query:(void *)a4 assetKey:(void *)a5 applicationGroupIdentifier:(void *)a6 containerIdentifier:(void *)a7 zoneID:(uint64_t)a8 databaseScope:(uint64_t)a9 priority:;
- (int64_t)databaseScope;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetKey:(id)a3;
- (void)setContainerID:(id)a3;
- (void)setDatabaseScope:(int64_t)a3;
- (void)setQuery:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation BACloudKitDownload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BACloudKitDownload)init
{
  result = (BACloudKitDownload *)os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
  if (result)
  {
    int v3 = 136315138;
    v4 = "BACloudKitDownload cannot be constructed using -init.";
    _os_log_fault_impl(&dword_226E14000, &_os_log_internal, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF BackgroundAssets: %s", (uint8_t *)&v3, 0xCu);
  }
  qword_26815EF58 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: BACloudKitDownload cannot be constructed using -init.";
  __break(1u);
  return result;
}

- (BACloudKitDownload)initWithIdentifier:(id)a3 recordType:(id)a4 recordName:(id)a5 assetKey:(id)a6 applicationGroupIdentifier:(id)a7
{
  return [(BACloudKitDownload *)self initWithIdentifier:a3 recordType:a4 expectedFieldKey:@"Name" expectedFieldValue:a5 assetKey:a6 applicationGroupIdentifier:a7];
}

- (BACloudKitDownload)initWithIdentifier:(id)a3 recordType:(id)a4 expectedFieldKey:(id)a5 expectedFieldValue:(id)a6 assetKey:(id)a7 applicationGroupIdentifier:(id)a8
{
  v13 = (void *)MEMORY[0x263EFD610];
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v26 = [v13 defaultContainer];
  v20 = [v26 containerIdentifier];
  v21 = [MEMORY[0x263EFD7F8] defaultRecordZone];
  v22 = [v21 zoneID];
  v23 = [(BACloudKitDownload *)self initWithIdentifier:v19 recordType:v18 expectedFieldKey:v17 expectedFieldValue:v16 assetKey:v15 applicationGroupIdentifier:v14 containerIdentifier:v20 zoneID:v22 databaseScope:1 priority:0];

  return v23;
}

- (BACloudKitDownload)initWithIdentifier:(id)a3 recordType:(id)a4 expectedFieldKey:(id)a5 expectedFieldValue:(id)a6 assetKey:(id)a7 applicationGroupIdentifier:(id)a8 containerIdentifier:(id)a9 zoneID:(id)a10 databaseScope:(int64_t)a11 priority:(int64_t)a12
{
  id v34 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v19 length])
  {
    v29 = (void *)MEMORY[0x263EFF940];
    uint64_t v30 = *MEMORY[0x263EFF4A0];
    v31 = @"expectedFieldKey must be a valid string.";
LABEL_11:
    v25 = [v29 exceptionWithName:v30 reason:v31 userInfo:0];
    [v25 raise];
    v28 = 0;
    goto LABEL_12;
  }
  if (!v20)
  {
    v29 = (void *)MEMORY[0x263EFF940];
    uint64_t v30 = *MEMORY[0x263EFF4A0];
    v31 = @"expectedFieldValue cannot be passed in as nil.";
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v29 = (void *)MEMORY[0x263EFF940];
            uint64_t v30 = *MEMORY[0x263EFF4A0];
            v31 = @"expectedFieldValue must be of type: NSString, NSNumber, NSDate, NSData, or NSArray.";
            goto LABEL_11;
          }
        }
      }
    }
  }
  v25 = [NSString stringWithFormat:@"%@ == %%@", v19];
  v26 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", v25, v20);
  id v33 = v18;
  v27 = (void *)[objc_alloc(MEMORY[0x263EFD7B0]) initWithRecordType:v18 predicate:v26];
  self = (BACloudKitDownload *)-[BACloudKitDownload initWithIdentifier:query:assetKey:applicationGroupIdentifier:containerIdentifier:zoneID:databaseScope:priority:](self, v34, v27, v21, v22, v23, v24, a11, a12);

  id v18 = v33;
  v28 = self;
LABEL_12:

  return v28;
}

- (id)initWithIdentifier:(void *)a3 query:(void *)a4 assetKey:(void *)a5 applicationGroupIdentifier:(void *)a6 containerIdentifier:(void *)a7 zoneID:(uint64_t)a8 databaseScope:(uint64_t)a9 priority:
{
  uint64_t v36 = a8;
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v38 = a5;
  id v18 = a6;
  id v19 = a7;
  if (a1)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v21 = (void *)MEMORY[0x263EFF4A0];
    if ((isKindOfClass & 1) == 0 || ![v15 length])
    {
      id v22 = objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *v21, @"NSString *  must be a valid unique string.", 0, v36);
      [v22 raise];
    }
    if (([v16 isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
      id v23 = [MEMORY[0x263EFF940] exceptionWithName:*v21 reason:@"Provided query must be a valid CKQuery." userInfo:0];
      [v23 raise];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v17 length])
    {
      id v24 = objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *v21, @"Provided assetKey must be a valid string.", 0, v36);
      [v24 raise];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v18 length])
    {
      v25 = objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *v21, @"Provided containerIdentifier must be a valid string.", 0, v36);
      [v25 raise];
    }
    if (([v19 isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
      v26 = [MEMORY[0x263EFF940] exceptionWithName:*v21 reason:@"Provided CKRecordZoneID must be a valid object." userInfo:0];
      [v26 raise];
    }
    v39.receiver = a1;
    v39.super_class = (Class)BACloudKitDownload;
    v27 = v38;
    a1 = objc_msgSendSuper2(&v39, sel_initPrivatelyWithApplicationGroupIdentifier_, v38, v36);
    if (a1)
    {
      v28 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x263EFFB08]);
      if (v28)
      {
        v29 = v28;
        CFStringRef v30 = (const __CFString *)SecTaskCopyValueForEntitlement(v28, @"com.apple.developer.icloud-container-environment", 0);
        if (v30)
        {
          CFStringRef v31 = v30;
          CFTypeID v32 = CFGetTypeID(v30);
          if (v32 == CFStringGetTypeID())
          {
            uint64_t v33 = 1;
            if (CFStringCompare(v31, @"production", 1uLL)) {
              uint64_t v33 = 2;
            }
          }
          else
          {
            uint64_t v33 = 2;
          }
          CFRelease(v31);
        }
        else
        {
          uint64_t v33 = 2;
        }
        CFRelease(v29);
        v27 = v38;
      }
      else
      {
        uint64_t v33 = 2;
      }
      [a1 setIdentifier:v15];
      [a1 setPriority:a9];
      id v34 = (void *)[objc_alloc(MEMORY[0x263EFD620]) initWithContainerIdentifier:v18 environment:v33];
      [a1 setContainerID:v34];

      [a1 setQuery:v16];
      [a1 setAssetKey:v17];
      [a1 setZoneID:v19];
      [a1 setDatabaseScope:v37];
    }
  }
  else
  {
    v27 = v38;
  }

  return a1;
}

- (BACloudKitDownload)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BACloudKitDownload;
  v5 = [(BADownload *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BACKD.ContainerID"];
    [(BACloudKitDownload *)v5 setContainerID:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BACKD.query"];
    [(BACloudKitDownload *)v5 setQuery:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BACKD.assetKey"];
    [(BACloudKitDownload *)v5 setAssetKey:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BACKD.zoneID"];
    [(BACloudKitDownload *)v5 setZoneID:v9];

    -[BACloudKitDownload setDatabaseScope:](v5, "setDatabaseScope:", [v4 decodeIntegerForKey:@"BACKD.databaseScope"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BACloudKitDownload;
  id v4 = a3;
  [(BADownload *)&v9 encodeWithCoder:v4];
  v5 = [(BACloudKitDownload *)self containerID];
  [v4 encodeObject:v5 forKey:@"BACKD.ContainerID"];

  v6 = [(BACloudKitDownload *)self query];
  [v4 encodeObject:v6 forKey:@"BACKD.query"];

  v7 = [(BACloudKitDownload *)self assetKey];
  [v4 encodeObject:v7 forKey:@"BACKD.assetKey"];

  v8 = [(BACloudKitDownload *)self zoneID];
  [v4 encodeObject:v8 forKey:@"BACKD.zoneID"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[BACloudKitDownload databaseScope](self, "databaseScope"), @"BACKD.databaseScope");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BACloudKitDownload;
  return [(BADownload *)&v4 copyWithZone:a3];
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
}

- (CKQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (NSString)assetKey
{
  return self->_assetKey;
}

- (void)setAssetKey:(id)a3
{
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(int64_t)a3
{
  self->_databaseScope = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_assetKey, 0);
  objc_storeStrong((id *)&self->_query, 0);

  objc_storeStrong((id *)&self->_containerID, 0);
}

@end