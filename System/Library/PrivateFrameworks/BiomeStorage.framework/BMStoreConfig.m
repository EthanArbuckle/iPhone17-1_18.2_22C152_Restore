@interface BMStoreConfig
+ (id)newLibraryStoreConfigForStreamIdentifier:(id)a3 domain:(unint64_t)a4 segmentSize:(unint64_t)a5 protectionClass:(unint64_t)a6 pruningPolicy:(id)a7;
+ (id)newPrivateStreamDefaultConfigurationWithProtectionClass:(unint64_t)a3 segmentSize:(unint64_t)a4;
+ (id)newPrivateStreamDefaultConfigurationWithStoreBasePath:(id)a3;
+ (id)newPrivateStreamDefaultConfigurationWithStoreBasePath:(id)a3 protectionClass:(unint64_t)a4;
+ (id)newPublicStreamDefaultConfiguration;
+ (id)newPublicStreamDefaultConfigurationWithProtectionClass:(unint64_t)a3;
+ (id)newRestrictedStreamDefaultConfiguration;
+ (id)newRestrictedStreamDefaultConfigurationWithProtectionClass:(unint64_t)a3;
+ (id)newRestrictedStreamWithSegmentSize:(unint64_t)a3;
+ (id)newRestrictedStreamWithSegmentSize:(unint64_t)a3 protectionClass:(unint64_t)a4;
+ (id)newRestrictedStreamWithSegmentSize:(unint64_t)a3 protectionClass:(unint64_t)a4 domain:(unint64_t)a5;
+ (id)newStreamDefaultConfigurationForPublicStream:(BOOL)a3;
+ (id)newStreamDefaultConfigurationForPublicStream:(BOOL)a3 protectionClass:(unint64_t)a4;
+ (id)newStreamDefaultConfigurationForPublicStream:(BOOL)a3 protectionClass:(unint64_t)a4 segmentSize:(unint64_t)a5;
+ (int)defaultStoreVersion;
+ (unint64_t)_streamTypeFromStorePath:(id)a3 domain:(unint64_t *)a4;
+ (unint64_t)streamTypeFromStorePath:(id)a3;
- (BMAccount)account;
- (BMPruningPolicy)pruningPolicy;
- (BMStoreConfig)initWithStoreBasePath:(id)a3 segmentSize:(unint64_t)a4;
- (BMStoreConfig)initWithStoreBasePath:(id)a3 segmentSize:(unint64_t)a4 protectionClass:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isManaged;
- (NSString)datastorePath;
- (NSString)remoteName;
- (id)_initWithStoreVersion:(unint64_t)a3 storeBasePath:(id)a4 segmentSize:(unint64_t)a5 protectionClass:(unint64_t)a6 storeLocationOption:(int64_t)a7 account:(id)a8 remoteName:(id)a9 pruningPolicy:(id)a10 streamType:(unint64_t)a11 domain:(unint64_t)a12 user:(unsigned int)a13 isManaged:(BOOL)a14 streamIdentifier:(id)a15;
- (id)copyWithRemoteName:(id)a3;
- (id)copyWithStoreBasePath:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)resolvedPathWithStreamIdentifier:(id)a3;
- (id)subscriptionsConfig;
- (id)tombstonesConfig;
- (int64_t)storeLocationOption;
- (unint64_t)configDatastoreVersion;
- (unint64_t)domain;
- (unint64_t)hash;
- (unint64_t)protectionClass;
- (unint64_t)segmentSize;
- (unint64_t)streamType;
- (unsigned)uid;
- (void)setAccount:(id)a3;
- (void)setPruningPolicy:(id)a3;
- (void)setRemoteName:(id)a3;
- (void)setStoreLocationOption:(int64_t)a3;
@end

@implementation BMStoreConfig

- (id)_initWithStoreVersion:(unint64_t)a3 storeBasePath:(id)a4 segmentSize:(unint64_t)a5 protectionClass:(unint64_t)a6 storeLocationOption:(int64_t)a7 account:(id)a8 remoteName:(id)a9 pruningPolicy:(id)a10 streamType:(unint64_t)a11 domain:(unint64_t)a12 user:(unsigned int)a13 isManaged:(BOOL)a14 streamIdentifier:(id)a15
{
  id v18 = a4;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v32 = a15;
  if ([v18 hasPrefix:@"file://"])
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"BMStoreConfig.m", 166, @"Invalid parameter not satisfying: %@", @"![storeBasePath hasPrefix:@\"file://\"]" object file lineNumber description];
  }
  v33.receiver = self;
  v33.super_class = (Class)BMStoreConfig;
  v22 = [(BMStoreConfig *)&v33 init];
  v23 = v22;
  if (v22)
  {
    v22->_configDatastoreVersion = a3;
    objc_storeStrong((id *)&v22->_datastorePath, a4);
    v23->_segmentSize = a5;
    v23->_storeLocationOption = a7 & 0xFFFFFFFFFFFFFFFELL | (v20 != 0);
    objc_storeStrong((id *)&v23->_account, a8);
    objc_storeStrong((id *)&v23->_remoteName, a9);
    objc_storeStrong((id *)&v23->_pruningPolicy, a10);
    v23->_protectionClass = a6;
    v23->_streamType = a11;
    v23->_domain = a12;
    if (a12 == 1)
    {
      unsigned int v24 = 0;
    }
    else
    {
      unsigned int v24 = a13;
      if (!a13) {
        unsigned int v24 = geteuid();
      }
    }
    v23->_uid = v24;
    v23->_isManaged = a14;
    objc_storeStrong((id *)&v23->_streamIdentifierForLogging, a15);
  }

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_remoteName, 0);
  objc_storeStrong((id *)&self->_pruningPolicy, 0);
  objc_storeStrong((id *)&self->_datastorePath, 0);
  objc_storeStrong((id *)&self->_streamIdentifierForLogging, 0);
}

- (NSString)remoteName
{
  return self->_remoteName;
}

- (BMAccount)account
{
  return self->_account;
}

- (int64_t)storeLocationOption
{
  return self->_storeLocationOption;
}

+ (id)newPrivateStreamDefaultConfigurationWithStoreBasePath:(id)a3 protectionClass:(unint64_t)a4
{
  id v6 = a3;
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F4FB78] pathForStreamType:4 domain:0];
  }
  v7 = (void *)[objc_alloc((Class)a1) initWithStoreBasePath:v6 segmentSize:0x100000 protectionClass:a4];

  return v7;
}

+ (id)newRestrictedStreamWithSegmentSize:(unint64_t)a3 protectionClass:(unint64_t)a4 domain:(unint64_t)a5
{
  v8 = [BMStoreConfig alloc];
  v9 = [MEMORY[0x1E4F4FB78] pathForStreamType:2 domain:a5];
  v10 = [(BMStoreConfig *)v8 initWithStoreBasePath:v9 segmentSize:a3 protectionClass:a4];

  return v10;
}

- (BMStoreConfig)initWithStoreBasePath:(id)a3 segmentSize:(unint64_t)a4 protectionClass:(unint64_t)a5
{
  id v8 = a3;
  int v9 = +[BMStoreConfig defaultStoreVersion];
  uint64_t v20 = 0;
  uint64_t v10 = [(id)objc_opt_class() _streamTypeFromStorePath:v8 domain:&v20];
  char v12 = v10 == 4 || (unint64_t)(v10 - 1) < 2;
  uint64_t v13 = [MEMORY[0x1E4F4FB78] _pathForTesting];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [MEMORY[0x1E4F4FB78] _pathForTesting];
    char v16 = [v8 hasPrefix:v15];

    v12 &= ~v16;
  }
  BYTE4(v19) = v12;
  LODWORD(v19) = 0;
  v17 = -[BMStoreConfig _initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:](self, "_initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:", v9, v8, a4, a5, 0, 0, 0, 0, v10, v20, v19, 0);

  return v17;
}

- (id)copyWithRemoteName:(id)a3
{
  id v4 = a3;
  v5 = [BMStoreConfig alloc];
  BYTE4(v8) = self->_isManaged;
  LODWORD(v8) = self->_uid;
  id v6 = -[BMStoreConfig _initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:](v5, "_initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:", self->_configDatastoreVersion, self->_datastorePath, self->_segmentSize, self->_protectionClass, self->_storeLocationOption, self->_account, v4, self->_pruningPolicy, self->_streamType, self->_domain, v8, self->_streamIdentifierForLogging);

  return v6;
}

+ (id)newLibraryStoreConfigForStreamIdentifier:(id)a3 domain:(unint64_t)a4 segmentSize:(unint64_t)a5 protectionClass:(unint64_t)a6 pruningPolicy:(id)a7
{
  id v11 = a7;
  id v12 = a3;
  int v13 = +[BMStoreConfig defaultStoreVersion];
  v14 = [MEMORY[0x1E4F4FB78] _pathForLibraryStreamWithDomain:a4];
  v15 = [MEMORY[0x1E4F4FB78] _pathForTesting];
  if (v15)
  {
    char v16 = [MEMORY[0x1E4F4FB78] _pathForTesting];
    char v17 = [v14 hasPrefix:v16];

    char v18 = v17 ^ 1;
  }
  else
  {
    char v18 = 1;
  }

  BYTE4(v21) = v18;
  LODWORD(v21) = 0;
  uint64_t v19 = objc_msgSend(objc_alloc((Class)a1), "_initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:", v13, v14, a5, a6, 0, 0, 0, v11, 2, a4, v21, v12);

  return v19;
}

+ (int)defaultStoreVersion
{
  return 10;
}

+ (unint64_t)_streamTypeFromStorePath:(id)a3 domain:(unint64_t *)a4
{
  id v18 = 0;
  int v4 = [MEMORY[0x1E4F4FB78] getServiceDomain:a4 subpath:&v18 forPath:a3];
  id v5 = v18;
  if (v4)
  {
    id v6 = [MEMORY[0x1E4F4FBA0] streams];
    v7 = [MEMORY[0x1E4F4FBA0] public];
    uint64_t v8 = [v6 stringByAppendingPathComponent:v7];
    char v9 = [v5 hasPrefix:v8];

    if (v9)
    {
      unint64_t v10 = 1;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F4FBA0] restricted];
      id v12 = [v6 stringByAppendingPathComponent:v11];
      char v13 = [v5 hasPrefix:v12];

      if (v13)
      {
        unint64_t v10 = 2;
      }
      else
      {
        v14 = [MEMORY[0x1E4F4FBA0] private];
        v15 = [v6 stringByAppendingPathComponent:v14];
        int v16 = [v5 hasPrefix:v15];

        if (v16) {
          unint64_t v10 = 4;
        }
        else {
          unint64_t v10 = 3;
        }
      }
    }
  }
  else
  {
    unint64_t v10 = 3;
  }

  return v10;
}

- (BOOL)isManaged
{
  return self->_isManaged;
}

- (unint64_t)domain
{
  return self->_domain;
}

- (BMPruningPolicy)pruningPolicy
{
  return self->_pruningPolicy;
}

- (NSString)datastorePath
{
  return self->_datastorePath;
}

- (unint64_t)segmentSize
{
  return self->_segmentSize;
}

- (id)resolvedPathWithStreamIdentifier:(id)a3
{
  int v4 = [(NSString *)self->_datastorePath stringByAppendingPathComponent:a3];
  int64_t storeLocationOption = self->_storeLocationOption;
  if (storeLocationOption)
  {
    id v6 = [MEMORY[0x1E4F4FBA0] remoteDevices];
    v7 = [v4 stringByAppendingPathComponent:v6];
    uint64_t v8 = [v7 stringByAppendingPathComponent:self->_remoteName];

    int v4 = v7;
  }
  else
  {
    if ((storeLocationOption & 4) != 0) {
      [MEMORY[0x1E4F4FBA0] subscriptions];
    }
    else {
    id v6 = [MEMORY[0x1E4F4FBA0] localDevice];
    }
    uint64_t v8 = [v4 stringByAppendingPathComponent:v6];
  }

  if ((self->_storeLocationOption & 2) != 0)
  {
    char v9 = [MEMORY[0x1E4F4FBA0] tombstones];
    uint64_t v10 = [v8 stringByAppendingPathComponent:v9];

    uint64_t v8 = (void *)v10;
  }
  return v8;
}

- (unint64_t)protectionClass
{
  return self->_protectionClass;
}

- (unint64_t)configDatastoreVersion
{
  return self->_configDatastoreVersion;
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setPruningPolicy:(id)a3
{
}

- (BMStoreConfig)initWithStoreBasePath:(id)a3 segmentSize:(unint64_t)a4
{
  return [(BMStoreConfig *)self initWithStoreBasePath:a3 segmentSize:a4 protectionClass:3];
}

+ (id)newStreamDefaultConfigurationForPublicStream:(BOOL)a3
{
  return (id)[a1 newStreamDefaultConfigurationForPublicStream:a3 protectionClass:3];
}

+ (id)newStreamDefaultConfigurationForPublicStream:(BOOL)a3 protectionClass:(unint64_t)a4
{
  return (id)[a1 newStreamDefaultConfigurationForPublicStream:a3 protectionClass:a4 segmentSize:0x100000];
}

+ (id)newStreamDefaultConfigurationForPublicStream:(BOOL)a3 protectionClass:(unint64_t)a4 segmentSize:(unint64_t)a5
{
  if (a3) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  uint64_t v8 = [MEMORY[0x1E4F4FB78] pathForStreamType:v7 domain:0];
  char v9 = [[BMStoreConfig alloc] initWithStoreBasePath:v8 segmentSize:a5 protectionClass:a4];

  return v9;
}

+ (id)newPublicStreamDefaultConfiguration
{
  return (id)[a1 newPublicStreamDefaultConfigurationWithProtectionClass:3];
}

+ (id)newPublicStreamDefaultConfigurationWithProtectionClass:(unint64_t)a3
{
  return (id)[a1 newStreamDefaultConfigurationForPublicStream:1 protectionClass:a3];
}

+ (id)newRestrictedStreamDefaultConfiguration
{
  return (id)[a1 newRestrictedStreamDefaultConfigurationWithProtectionClass:3];
}

+ (id)newRestrictedStreamDefaultConfigurationWithProtectionClass:(unint64_t)a3
{
  return (id)[a1 newRestrictedStreamWithSegmentSize:0x100000 protectionClass:a3];
}

+ (id)newRestrictedStreamWithSegmentSize:(unint64_t)a3
{
  return (id)[a1 newRestrictedStreamWithSegmentSize:a3 protectionClass:3];
}

+ (id)newRestrictedStreamWithSegmentSize:(unint64_t)a3 protectionClass:(unint64_t)a4
{
  return (id)[a1 newRestrictedStreamWithSegmentSize:a3 protectionClass:a4 domain:0];
}

+ (id)newPrivateStreamDefaultConfigurationWithStoreBasePath:(id)a3
{
  return (id)[a1 newPrivateStreamDefaultConfigurationWithStoreBasePath:a3 protectionClass:3];
}

+ (id)newPrivateStreamDefaultConfigurationWithProtectionClass:(unint64_t)a3 segmentSize:(unint64_t)a4
{
  return (id)[a1 newStreamDefaultConfigurationForPublicStream:0 protectionClass:a3 segmentSize:a4];
}

- (unint64_t)streamType
{
  return self->_streamType;
}

- (id)subscriptionsConfig
{
  uint64_t v3 = +[BMStoreConfig defaultStoreVersion];
  id v4 = [[BMPruningPolicy alloc] initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:5242880 maxStreamSize:604800.0];
  id v5 = [BMStoreConfig alloc];
  unint64_t domain = self->_domain;
  unsigned int uid = self->_uid;
  BOOL isManaged = self->_isManaged;
  datastorePath = self->_datastorePath;
  uint64_t v10 = [(NSString *)self->_streamIdentifierForLogging stringByAppendingString:@":subscriptions"];
  BYTE4(v13) = isManaged;
  LODWORD(v13) = uid;
  id v11 = -[BMStoreConfig _initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:](v5, "_initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:", v3, datastorePath, 0x20000, 4, 4, 0, 0, v4, 2, domain, v13, v10);

  return v11;
}

- (id)tombstonesConfig
{
  uint64_t v16 = +[BMStoreConfig defaultStoreVersion];
  id v3 = [[BMPruningPolicy alloc] initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:10485760 maxStreamSize:691200.0];
  id v4 = [BMStoreConfig alloc];
  unint64_t protectionClass = self->_protectionClass;
  remoteName = self->_remoteName;
  account = self->_account;
  unint64_t domain = self->_domain;
  unsigned int uid = self->_uid;
  BOOL isManaged = self->_isManaged;
  datastorePath = self->_datastorePath;
  id v12 = [(NSString *)self->_streamIdentifierForLogging stringByAppendingString:@":tombstones"];
  BYTE4(v15) = isManaged;
  LODWORD(v15) = uid;
  id v13 = -[BMStoreConfig _initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:](v4, "_initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:", v16, datastorePath, 0x100000, protectionClass, 2, account, remoteName, v3, 2, domain, v15, v12);

  return v13;
}

- (id)copyWithStoreBasePath:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v5 = [(id)objc_opt_class() _streamTypeFromStorePath:v4 domain:&v15];
  char v7 = v5 == 4 || (unint64_t)(v5 - 1) < 2;
  uint64_t v8 = [MEMORY[0x1E4F4FB78] _pathForTesting];
  if (v8)
  {
    char v9 = (void *)v8;
    uint64_t v10 = [MEMORY[0x1E4F4FB78] _pathForTesting];
    char v11 = [v4 hasPrefix:v10];

    v7 &= ~v11;
  }
  uint64_t v12 = [(BMStoreConfig *)self copy];
  id v13 = *(void **)(v12 + 16);
  *(void *)(v12 + 16) = v4;

  *(unsigned char *)(v12 + 32) = v7;
  return (id)v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [BMStoreConfig alloc];
  unint64_t configDatastoreVersion = self->_configDatastoreVersion;
  id v6 = (void *)[(NSString *)self->_datastorePath copy];
  unint64_t segmentSize = self->_segmentSize;
  unint64_t protectionClass = self->_protectionClass;
  remoteName = self->_remoteName;
  account = self->_account;
  int64_t storeLocationOption = self->_storeLocationOption;
  uint64_t v12 = (void *)[(BMPruningPolicy *)self->_pruningPolicy copy];
  BYTE4(v15) = self->_isManaged;
  LODWORD(v15) = self->_uid;
  id v13 = -[BMStoreConfig _initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:](v4, "_initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:", configDatastoreVersion, v6, segmentSize, protectionClass, storeLocationOption, account, remoteName, v12, self->_streamType, self->_domain, v15, self->_streamIdentifierForLogging);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = v4;
    BOOL v6 = [(NSString *)self->_datastorePath isEqualToString:v5[2]];
    BOOL v7 = self->_segmentSize == v5[5] && v6;
    BOOL v8 = self->_protectionClass == v5[6] && v7;
    pruningPolicy = self->_pruningPolicy;
    if (pruningPolicy == (BMPruningPolicy *)v5[7]) {
      char v10 = 1;
    }
    else {
      char v10 = -[BMPruningPolicy isEqual:](pruningPolicy, "isEqual:");
    }
    char v12 = v8 & v10;
    if (self->_configDatastoreVersion != v5[8]) {
      char v12 = 0;
    }
    if (self->_storeLocationOption == v5[9]) {
      char v13 = v12;
    }
    else {
      char v13 = 0;
    }
    remoteName = self->_remoteName;
    if (remoteName == (NSString *)v5[10]) {
      char v15 = 1;
    }
    else {
      char v15 = -[NSString isEqualToString:](remoteName, "isEqualToString:");
    }
    char v16 = v13 & v15;
    account = self->_account;
    if (account == (BMAccount *)v5[11]) {
      char v18 = 1;
    }
    else {
      char v18 = -[BMAccount isEqual:](account, "isEqual:");
    }
    char v11 = v16 & v18;
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_datastorePath hash];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_configDatastoreVersion];
  uint64_t v5 = [v4 hash] ^ v3;
  BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_segmentSize];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

+ (unint64_t)streamTypeFromStorePath:(id)a3
{
  uint64_t v4 = 0;
  return [a1 _streamTypeFromStorePath:a3 domain:&v4];
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<BMStoreConfig datastorePath: %@ version: %lu>", self->_datastorePath, self->_configDatastoreVersion];
  return v2;
}

- (void)setStoreLocationOption:(int64_t)a3
{
  self->_int64_t storeLocationOption = a3;
}

- (void)setRemoteName:(id)a3
{
}

- (void)setAccount:(id)a3
{
}

@end