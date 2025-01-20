@interface HMFKey
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToData:(id)a3;
- (HMFKey)init;
- (HMFKey)initWithCoder:(id)a3;
- (HMFKey)initWithType:(id)a3 size:(unint64_t)a4 data:(id)a5;
- (NSData)data;
- (NSString)type;
- (id)shortDescription;
- (unint64_t)hash;
- (unint64_t)size;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMFKey

- (HMFKey)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMFKey)initWithType:(id)a3 size:(unint64_t)a4 data:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v8 || (v10 = v9, ![v8 length])) {
    _HMFPreconditionFailure(@"type && [type length] > 0");
  }
  if (!v10) {
    _HMFPreconditionFailure(@"data");
  }
  v19.receiver = self;
  v19.super_class = (Class)HMFKey;
  v11 = [(HMFKey *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    type = v11->_type;
    v11->_type = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E4F1C9B8];
    id v15 = v10;
    uint64_t v16 = objc_msgSend(v14, "_newZeroingDataWithBytes:length:", objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
    data = v11->_data;
    v11->_data = (NSData *)v16;

    if (!a4) {
      a4 = 8 * [v15 length];
    }
    v11->_size = a4;
  }

  return v11;
}

- (unint64_t)hash
{
  v2 = [(HMFKey *)self data];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMFKey *)a3;
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
    v6 = v5;
    id v7 = v6;
    if (v6)
    {
      id v8 = [(HMFKey *)v6 type];
      id v9 = [(HMFKey *)self type];
      if ([v8 isEqualToString:v9]
        && (uint64_t v10 = [(HMFKey *)v7 size], v10 == [(HMFKey *)self size]))
      {
        v11 = [(HMFKey *)v7 data];
        uint64_t v12 = [(HMFKey *)self data];
        char v13 = [v11 isEqual:v12];
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

- (BOOL)isEqualToData:(id)a3
{
  id v4 = a3;
  v5 = [(HMFKey *)self data];
  char v6 = HMFEqualObjects(v5, v4);

  return v6;
}

- (id)shortDescription
{
  unint64_t v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  v5 = [(HMFKey *)self type];
  unint64_t v6 = [(HMFKey *)self size];
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v6);
  id v8 = [v3 stringWithFormat:@"%@ type: %@ length: %@", v4, v5, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMFKey)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"HMF.kt"])
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMF.kt"];
  }
  else
  {
    v5 = @"Unknown";
  }
  if ([v4 containsValueForKey:@"HMF.ks"]) {
    uint64_t v6 = [v4 decodeIntegerForKey:@"HMF.ks"];
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HAP.data"];
  id v8 = [(HMFKey *)self initWithType:v5 size:v6 data:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMFKey *)self type];
  [v4 encodeObject:v5 forKey:@"HMF.kt"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMFKey size](self, "size"), @"HMF.ks");
  id v6 = [(HMFKey *)self data];
  [v4 encodeObject:v6 forKey:@"HAP.data"];
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end