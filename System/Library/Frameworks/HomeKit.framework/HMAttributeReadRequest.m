@interface HMAttributeReadRequest
+ (id)readRequestWithAccessoryProfile:(id)a3 attribute:(id)a4;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation HMAttributeReadRequest

- (unint64_t)hash
{
  v3 = [(HMAttributeRequest *)self accessoryProfile];
  uint64_t v4 = [v3 hash];
  v5 = [(HMAttributeRequest *)self attribute];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMAttributeReadRequest *)a3;
  if (self == v4)
  {
    char v11 = 1;
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
    unint64_t v6 = v5;
    if (v6)
    {
      v7 = [(HMAttributeRequest *)self accessoryProfile];
      v8 = [(HMAttributeRequest *)v6 accessoryProfile];
      if ([v7 isEqual:v8])
      {
        v9 = [(HMAttributeRequest *)self attribute];
        v10 = [(HMAttributeRequest *)v6 attribute];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  return v11;
}

+ (id)readRequestWithAccessoryProfile:(id)a3 attribute:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(HMAttributeRequest *)[HMAttributeReadRequest alloc] initWithAccessoryProfile:v6 attribute:v5];

  return v7;
}

@end