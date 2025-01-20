@interface HMCameraClipAssetContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMCameraClipAssetContext)init;
- (HMCameraClipAssetContext)initWithCoder:(id)a3;
- (HMCameraClipAssetContext)initWithURL:(id)a3 expirationDate:(id)a4 requiredHTTPHeaders:(id)a5;
- (NSDate)expirationDate;
- (NSDictionary)requiredHTTPHeaders;
- (NSURL)url;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMCameraClipAssetContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredHTTPHeaders, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (NSDictionary)requiredHTTPHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMCameraClipAssetContext *)self url];
  [v4 encodeObject:v5 forKey:@"HMCCV.u"];

  v6 = [(HMCameraClipAssetContext *)self expirationDate];
  [v4 encodeObject:v6 forKey:@"HMCCV.ed"];

  id v7 = [(HMCameraClipAssetContext *)self requiredHTTPHeaders];
  [v4 encodeObject:v7 forKey:@"HMCCV.rhh"];
}

- (HMCameraClipAssetContext)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCCV.u"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCCV.ed"];
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:3];
  v9 = objc_msgSend(v7, "setWithArray:", v8, v13, v14);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"HMCCV.rhh"];

  v11 = 0;
  if (v5 && v6 && v10)
  {
    self = [(HMCameraClipAssetContext *)self initWithURL:v5 expirationDate:v6 requiredHTTPHeaders:v10];
    v11 = self;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(HMCameraClipAssetContext *)self url];
  uint64_t v4 = [v3 hash];

  v5 = [(HMCameraClipAssetContext *)self expirationDate];
  uint64_t v6 = [v5 hash] ^ v4;

  id v7 = [(HMCameraClipAssetContext *)self requiredHTTPHeaders];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMCameraClipAssetContext *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    uint64_t v6 = v5;
    if (v6)
    {
      id v7 = [(HMCameraClipAssetContext *)self url];
      unint64_t v8 = [(HMCameraClipAssetContext *)v6 url];
      if ([v7 isEqual:v8])
      {
        v9 = [(HMCameraClipAssetContext *)self expirationDate];
        v10 = [(HMCameraClipAssetContext *)v6 expirationDate];
        if ([v9 isEqualToDate:v10])
        {
          v11 = [(HMCameraClipAssetContext *)self requiredHTTPHeaders];
          v12 = [(HMCameraClipAssetContext *)v6 requiredHTTPHeaders];
          char v13 = [v11 isEqualToDictionary:v12];
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HMCameraClipAssetContext *)self url];
  uint64_t v6 = [(HMCameraClipAssetContext *)self expirationDate];
  id v7 = [(HMCameraClipAssetContext *)self requiredHTTPHeaders];
  unint64_t v8 = [v3 stringWithFormat:@"<%@ url: %@ expirationDate: %@ requiredHTTPHeaders: %@>", v4, v5, v6, v7];

  return v8;
}

- (HMCameraClipAssetContext)initWithURL:(id)a3 expirationDate:(id)a4 requiredHTTPHeaders:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMCameraClipAssetContext;
  v12 = [(HMCameraClipAssetContext *)&v17 init];
  char v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    objc_storeStrong((id *)&v13->_expirationDate, a4);
    uint64_t v14 = [v11 copy];
    requiredHTTPHeaders = v13->_requiredHTTPHeaders;
    v13->_requiredHTTPHeaders = (NSDictionary *)v14;
  }
  return v13;
}

- (HMCameraClipAssetContext)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end