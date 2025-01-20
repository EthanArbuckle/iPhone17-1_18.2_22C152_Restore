@interface DIUploadAsset
+ (BOOL)supportsSecureCoding;
- (DIUploadAsset)initWithCoder:(id)a3;
- (DIUploadAsset)initWithData:(id)a3 assetType:(int64_t)a4;
- (NSData)data;
- (NSUUID)assetID;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetID:(id)a3;
@end

@implementation DIUploadAsset

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DIUploadAsset *)self data];
  [v4 encodeObject:v5 forKey:@"assetData"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DIUploadAsset type](self, "type"), @"assetType");
  id v6 = [(DIUploadAsset *)self assetID];
  [v4 encodeObject:v6 forKey:@"assetID"];
}

- (DIUploadAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetData"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"assetType"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetID"];

  if (v5) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v10 = 0;
  }
  else
  {
    v9 = [(DIUploadAsset *)self initWithData:v5 assetType:v6];
    [(DIUploadAsset *)v9 setAssetID:v7];
    self = v9;
    v10 = self;
  }

  return v10;
}

- (DIUploadAsset)initWithData:(id)a3 assetType:(int64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DIUploadAsset;
  BOOL v8 = [(DIUploadAsset *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_data, a3);
    v9->_type = a4;
    v10 = (NSUUID *)objc_alloc_init(MEMORY[0x263F08C38]);
    assetID = v9->_assetID;
    v9->_assetID = v10;
  }
  return v9;
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = [(DIUploadAsset *)self type];
  v5 = [(DIUploadAsset *)self assetID];
  uint64_t v6 = [v5 UUIDString];
  id v7 = [(DIUploadAsset *)self data];
  BOOL v8 = [v7 description];
  v9 = [v3 stringWithFormat:@"DIUploadAsset: type=%ld assetID=%@, data=%@", v4, v6, v8];

  return v9;
}

- (NSData)data
{
  return self->_data;
}

- (int64_t)type
{
  return self->_type;
}

- (NSUUID)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end