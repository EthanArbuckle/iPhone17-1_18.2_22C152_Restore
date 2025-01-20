@interface HMCameraClipEncryptionContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMCameraClipEncryptionContext)initWithCoder:(id)a3;
- (HMCameraClipEncryptionContext)initWithKey:(id)a3 scheme:(unint64_t)a4;
- (NSData)key;
- (id)description;
- (unint64_t)hash;
- (unint64_t)scheme;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMCameraClipEncryptionContext

- (void).cxx_destruct
{
}

- (unint64_t)scheme
{
  return self->_scheme;
}

- (NSData)key
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (HMCameraClipEncryptionContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"k"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"s"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = [(HMCameraClipEncryptionContext *)self initWithKey:v5 scheme:v6];
    v8 = self;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(HMCameraClipEncryptionContext *)self key];
  [v5 encodeObject:v4 forKey:@"k"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[HMCameraClipEncryptionContext scheme](self, "scheme"), @"s");
}

- (unint64_t)hash
{
  v2 = [(HMCameraClipEncryptionContext *)self key];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  BOOL v7 = v6;
  if (v6)
  {
    v8 = [v6 key];
    v9 = [(HMCameraClipEncryptionContext *)self key];
    if ([v8 isEqualToData:v9])
    {
      uint64_t v10 = [v7 scheme];
      BOOL v11 = v10 == [(HMCameraClipEncryptionContext *)self scheme];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  id v4 = [(HMCameraClipEncryptionContext *)self key];
  objc_msgSend(v3, "appendFormat:", @" key length: %lu", objc_msgSend(v4, "length"));

  id v5 = HMStringFromCameraClipEncryptionScheme([(HMCameraClipEncryptionContext *)self scheme]);
  [v3 appendFormat:@" scheme: %@", v5];

  [v3 appendString:@">"];
  id v6 = (void *)[v3 copy];

  return v6;
}

- (HMCameraClipEncryptionContext)initWithKey:(id)a3 scheme:(unint64_t)a4
{
  id v6 = a3;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!a4)
  {
LABEL_7:
    v12 = (void *)_HMFPreconditionFailure();
    return (HMCameraClipEncryptionContext *)+[HMCameraClipEncryptionContext supportsSecureCoding];
  }
  BOOL v7 = v6;
  v14.receiver = self;
  v14.super_class = (Class)HMCameraClipEncryptionContext;
  v8 = [(HMCameraClipEncryptionContext *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    key = v8->_key;
    v8->_key = (NSData *)v9;

    v8->_scheme = a4;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end