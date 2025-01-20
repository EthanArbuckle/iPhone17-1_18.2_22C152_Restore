@interface WCSessionFile
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)updateUserInfo:(id)a3 error:(id *)a4;
- (BOOL)updateUserInfoData:(id)a3 error:(id *)a4;
- (BOOL)verifyMetadata;
- (NSData)userInfoData;
- (NSDate)creationDate;
- (NSDictionary)metadata;
- (NSFileHandle)fileDescriptor;
- (NSNumber)fileSize;
- (NSString)fileIdentifier;
- (NSString)relativePath;
- (NSURL)fileURL;
- (WCSessionFile)initWithCoder:(id)a3;
- (WCSessionFile)initWithFileURL:(id)a3;
- (WCSessionFile)initWithIdentifier:(id)a3 fileURL:(id)a4 relativePath:(id)a5;
- (WCSessionFile)initWithIdentifier:(id)a3 relativePath:(id)a4;
- (WCUserInfo)userInfoStorage;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setFileDescriptor:(id)a3;
- (void)setFileIdentifier:(id)a3;
- (void)setFileSize:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setRelativePath:(id)a3;
- (void)setUserInfoStorage:(id)a3;
@end

@implementation WCSessionFile

- (WCSessionFile)initWithIdentifier:(id)a3 fileURL:(id)a4 relativePath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WCSessionFile;
  v12 = [(WCSessionFile *)&v20 init];
  v13 = v12;
  if (v12)
  {
    metadata = v12->_metadata;
    v12->_metadata = 0;

    objc_storeStrong((id *)&v13->_fileURL, a4);
    objc_storeStrong((id *)&v13->_fileIdentifier, a3);
    objc_storeStrong((id *)&v13->_relativePath, a5);
    uint64_t v15 = objc_opt_new();
    creationDate = v13->_creationDate;
    v13->_creationDate = (NSDate *)v15;

    v17 = objc_alloc_init(WCUserInfo);
    userInfoStorage = v13->_userInfoStorage;
    v13->_userInfoStorage = v17;
  }
  return v13;
}

- (WCSessionFile)initWithFileURL:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [v5 UUIDString];
  v7 = [(WCSessionFile *)self initWithIdentifier:v6 fileURL:v4 relativePath:0];

  return v7;
}

- (WCSessionFile)initWithIdentifier:(id)a3 relativePath:(id)a4
{
  return [(WCSessionFile *)self initWithIdentifier:a3 fileURL:0 relativePath:a4];
}

- (NSURL)fileURL
{
  v3 = self->_fileURL;
  if (!v3)
  {
    id v4 = NSURL;
    v5 = NSHomeDirectory();
    v6 = [v4 fileURLWithPath:v5 isDirectory:1];

    v7 = NSURL;
    v8 = [(WCSessionFile *)self relativePath];
    v3 = [v7 fileURLWithPath:v8 isDirectory:0 relativeToURL:v6];
  }

  return v3;
}

- (NSDictionary)metadata
{
  v2 = [(WCSessionFile *)self userInfoStorage];
  v3 = [v2 userInfo];

  return (NSDictionary *)v3;
}

- (BOOL)updateUserInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(WCSessionFile *)self userInfoStorage];
  LOBYTE(a4) = [v7 updateUserInfo:v6 error:a4];

  return (char)a4;
}

- (BOOL)updateUserInfoData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(WCSessionFile *)self userInfoStorage];
  LOBYTE(a4) = [v7 updateUserInfoData:v6 error:a4];

  return (char)a4;
}

- (NSData)userInfoData
{
  v2 = [(WCSessionFile *)self userInfoStorage];
  v3 = [v2 userInfoData];

  return (NSData *)v3;
}

- (BOOL)verifyMetadata
{
  v3 = [(WCSessionFile *)self userInfoStorage];
  id v4 = [v3 userInfoData];

  if (!v4) {
    return 1;
  }
  v5 = [(WCSessionFile *)self userInfoStorage];
  char v6 = [v5 verifyUserInfo];

  return v6;
}

- (id)description
{
  v3 = [(WCSessionFile *)self userInfoStorage];
  id v4 = [v3 userInfoData];
  v5 = v4;
  if (!v4)
  {
    char v6 = [(WCSessionFile *)self userInfoStorage];
    v5 = [v6 userInfo];
  }
  v7 = NSString;
  v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  id v10 = [(WCSessionFile *)self fileIdentifier];
  id v11 = [(WCSessionFile *)self fileURL];
  uint64_t v12 = [v11 path];
  v13 = (void *)v12;
  v14 = "YES";
  if (!v5) {
    v14 = "NO";
  }
  uint64_t v15 = [v7 stringWithFormat:@"<%@: %p, identifier: %@, file: %@, hasMetadata: %s>", v9, self, v10, v12, v14];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WCSessionFile *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      char v6 = [(WCSessionFile *)self fileIdentifier];
      v7 = [(WCSessionFile *)v5 fileIdentifier];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(WCSessionFile *)self fileIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(WCSessionFile *)self creationDate];
  char v6 = [v4 creationDate];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  fileSize = self->_fileSize;
  id v5 = a3;
  [v5 encodeObject:fileSize forKey:@"fileSize"];
  [v5 encodeObject:self->_fileURL forKey:@"fileURL"];
  [v5 encodeObject:self->_fileDescriptor forKey:@"fileDescriptor"];
  [v5 encodeObject:self->_fileIdentifier forKey:@"fileIdentifier"];
  [v5 encodeObject:self->_creationDate forKey:@"creationDate"];
  [v5 encodeObject:self->_userInfoStorage forKey:@"userInfoStorage"];
  [v5 encodeObject:self->_relativePath forKey:@"relativePath"];
}

- (WCSessionFile)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WCSessionFile;
  id v5 = [(WCSessionFile *)&v24 init];
  if (v5)
  {
    char v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileSize"];
    uint64_t v7 = [v6 copy];
    fileSize = v5->_fileSize;
    v5->_fileSize = (NSNumber *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileURL"];
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileDescriptor"];
    fileDescriptor = v5->_fileDescriptor;
    v5->_fileDescriptor = (NSFileHandle *)v11;

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileIdentifier"];
    uint64_t v14 = [v13 copy];
    fileIdentifier = v5->_fileIdentifier;
    v5->_fileIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userInfoStorage"];
    userInfoStorage = v5->_userInfoStorage;
    v5->_userInfoStorage = (WCUserInfo *)v18;

    objc_super v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relativePath"];
    uint64_t v21 = [v20 copy];
    relativePath = v5->_relativePath;
    v5->_relativePath = (NSString *)v21;
  }
  return v5;
}

- (void)setFileURL:(id)a3
{
}

- (void)setMetadata:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (WCUserInfo)userInfoStorage
{
  return self->_userInfoStorage;
}

- (void)setUserInfoStorage:(id)a3
{
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (void)setRelativePath:(id)a3
{
}

- (NSString)fileIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFileIdentifier:(id)a3
{
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(id)a3
{
}

- (NSFileHandle)fileDescriptor
{
  return self->_fileDescriptor;
}

- (void)setFileDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileDescriptor, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_fileIdentifier, 0);
  objc_storeStrong((id *)&self->_relativePath, 0);
  objc_storeStrong((id *)&self->_userInfoStorage, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end