@interface DIFileUploadAsset
+ (BOOL)supportsSecureCoding;
- (DIFileUploadAsset)initWithCoder:(id)a3;
- (DIFileUploadAsset)initWithURL:(id)a3 assetType:(int64_t)a4;
- (NSFileHandle)fileHandle;
- (NSURL)url;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation DIFileUploadAsset

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DIFileUploadAsset;
  id v4 = a3;
  [(DIUploadAsset *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_url, @"assetURL", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_fileHandle forKey:@"assetFileHandle"];
}

- (DIFileUploadAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIFileUploadAsset;
  objc_super v5 = [(DIUploadAsset *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetURL"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetFileHandle"];
    fileHandle = v5->_fileHandle;
    v5->_fileHandle = (NSFileHandle *)v8;
  }
  return v5;
}

- (DIFileUploadAsset)initWithURL:(id)a3 assetType:(int64_t)a4
{
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x263EFF8F8]);
  v15.receiver = self;
  v15.super_class = (Class)DIFileUploadAsset;
  v9 = [(DIUploadAsset *)&v15 initWithData:v8 assetType:a4];

  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    v10 = (void *)MEMORY[0x263F08840];
    objc_super v11 = [(NSURL *)v9->_url path];
    uint64_t v12 = [v10 fileHandleForUpdatingAtPath:v11];
    fileHandle = v9->_fileHandle;
    v9->_fileHandle = (NSFileHandle *)v12;
  }
  return v9;
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = [(DIUploadAsset *)self type];
  objc_super v5 = [(DIUploadAsset *)self assetID];
  uint64_t v6 = [v5 UUIDString];
  id v7 = [(DIUploadAsset *)self data];
  id v8 = [v7 description];
  v9 = [(DIFileUploadAsset *)self url];
  v10 = [v9 path];
  objc_super v11 = [v3 stringWithFormat:@"DIFileUploadAsset: type=%ld assetID=%@, data=%@ url=%@", v4, v6, v8, v10];

  return v11;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end