@interface HMCameraClipVideoAssetContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMCameraClipVideoAssetContext)initWithCoder:(id)a3;
- (HMCameraClipVideoAssetContext)initWithURL:(id)a3 expirationDate:(id)a4 requiredHTTPHeaders:(id)a5;
- (HMCameraClipVideoAssetContext)initWithURL:(id)a3 expirationDate:(id)a4 requiredHTTPHeaders:(id)a5 hlsPlaylist:(id)a6;
- (NSData)hlsPlaylist;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMCameraClipVideoAssetContext

- (void).cxx_destruct
{
}

- (NSData)hlsPlaylist
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMCameraClipVideoAssetContext;
  id v4 = a3;
  [(HMCameraClipAssetContext *)&v6 encodeWithCoder:v4];
  v5 = [(HMCameraClipVideoAssetContext *)self hlsPlaylist];
  [v4 encodeObject:v5 forKey:@"HMCCV.hp"];
}

- (HMCameraClipVideoAssetContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [[HMCameraClipAssetContext alloc] initWithCoder:v4];
  objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCCV.hp"];

  if (v5)
  {
    v7 = [(HMCameraClipAssetContext *)v5 url];
    v8 = [(HMCameraClipAssetContext *)v5 expirationDate];
    v9 = [(HMCameraClipAssetContext *)v5 requiredHTTPHeaders];
    self = [(HMCameraClipVideoAssetContext *)self initWithURL:v7 expirationDate:v8 requiredHTTPHeaders:v9 hlsPlaylist:v6];

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)HMCameraClipVideoAssetContext;
  unint64_t v3 = [(HMCameraClipAssetContext *)&v7 hash];
  id v4 = [(HMCameraClipVideoAssetContext *)self hlsPlaylist];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMCameraClipVideoAssetContext *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v5 = v4;
    }
    else {
      unint64_t v5 = 0;
    }
    objc_super v6 = v5;
    if (v6
      && (v11.receiver = self,
          v11.super_class = (Class)HMCameraClipVideoAssetContext,
          [(HMCameraClipAssetContext *)&v11 isEqual:v6]))
    {
      objc_super v7 = [(HMCameraClipVideoAssetContext *)self hlsPlaylist];
      v8 = [(HMCameraClipVideoAssetContext *)v6 hlsPlaylist];
      char v9 = [v7 isEqualToData:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(HMCameraClipAssetContext *)self url];
  objc_super v6 = [(HMCameraClipAssetContext *)self expirationDate];
  objc_super v7 = [(HMCameraClipAssetContext *)self requiredHTTPHeaders];
  v8 = [(HMCameraClipVideoAssetContext *)self hlsPlaylist];
  char v9 = [v3 stringWithFormat:@"<%@ url: %@ expirationDate: %@ requiredHTTPHeaders: %@ hlsPlaylist: %lu bytes>", v4, v5, v6, v7, objc_msgSend(v8, "length")];

  return v9;
}

- (HMCameraClipVideoAssetContext)initWithURL:(id)a3 expirationDate:(id)a4 requiredHTTPHeaders:(id)a5 hlsPlaylist:(id)a6
{
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HMCameraClipVideoAssetContext;
  objc_super v11 = [(HMCameraClipAssetContext *)&v15 initWithURL:a3 expirationDate:a4 requiredHTTPHeaders:a5];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    hlsPlaylist = v11->_hlsPlaylist;
    v11->_hlsPlaylist = (NSData *)v12;
  }
  return v11;
}

- (HMCameraClipVideoAssetContext)initWithURL:(id)a3 expirationDate:(id)a4 requiredHTTPHeaders:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v12 = *MEMORY[0x1E4F1C3B8];
  v13 = NSString;
  v14 = NSStringFromSelector(a2);
  objc_super v15 = [v13 stringWithFormat:@"%@ is unavailable", v14];
  id v16 = [v11 exceptionWithName:v12 reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end