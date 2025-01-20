@interface HMAttributeWriteRequest
+ (id)writeRequestWithAccessoryProfile:(id)a3 attribute:(id)a4 value:(id)a5;
- (BOOL)isEqual:(id)a3;
- (HMAttributeWriteRequest)initWithAccessoryProfile:(id)a3 attribute:(id)a4 value:(id)a5;
- (NSCopying)value;
- (unint64_t)hash;
@end

@implementation HMAttributeWriteRequest

- (void).cxx_destruct
{
}

- (NSCopying)value
{
  return self->_value;
}

- (unint64_t)hash
{
  v3 = [(HMAttributeRequest *)self accessoryProfile];
  v4 = [v3 uniqueIdentifier];
  uint64_t v5 = [v4 hash];
  v6 = [(HMAttributeRequest *)self attribute];
  unint64_t v7 = [v6 hash] ^ v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMAttributeWriteRequest *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      unint64_t v7 = [(HMAttributeRequest *)self accessoryProfile];
      v8 = [v7 uniqueIdentifier];
      v9 = [(HMAttributeRequest *)v6 accessoryProfile];
      v10 = [v9 uniqueIdentifier];
      if ([v8 isEqual:v10])
      {
        v11 = [(HMAttributeRequest *)self attribute];
        v12 = [(HMAttributeRequest *)v6 attribute];
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

- (HMAttributeWriteRequest)initWithAccessoryProfile:(id)a3 attribute:(id)a4 value:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMAttributeWriteRequest;
  v10 = [(HMAttributeRequest *)&v13 initWithAccessoryProfile:a3 attribute:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_value, a5);
  }

  return v11;
}

+ (id)writeRequestWithAccessoryProfile:(id)a3 attribute:(id)a4 value:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[HMAttributeWriteRequest alloc] initWithAccessoryProfile:v9 attribute:v8 value:v7];

  return v10;
}

@end