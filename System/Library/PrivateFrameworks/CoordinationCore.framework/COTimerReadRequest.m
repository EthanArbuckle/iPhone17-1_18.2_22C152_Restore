@interface COTimerReadRequest
+ (BOOL)supportsSecureCoding;
+ (id)acceptableResponses;
- (BOOL)isForMerge;
- (BOOL)requiresFilter;
- (COTimerReadRequest)initWithAccessory:(id)a3;
- (COTimerReadRequest)initWithAccessoryUniqueIdentifier:(id)a3;
- (COTimerReadRequest)initWithAccessoryUniqueIdentifier:(id)a3 requiresFilter:(BOOL)a4;
- (COTimerReadRequest)initWithCoder:(id)a3;
- (NSString)eTag;
- (NSUUID)accessoryUniqueIdentifier;
- (id)initForMerge;
- (void)encodeWithCoder:(id)a3;
- (void)setETag:(id)a3;
@end

@implementation COTimerReadRequest

- (COTimerReadRequest)initWithAccessoryUniqueIdentifier:(id)a3 requiresFilter:(BOOL)a4
{
  id v7 = a3;
  v8 = [(COMeshCommand *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accessoryUniqueIdentifier, a3);
    v9->_requiresFilter = a4;
  }

  return v9;
}

- (COTimerReadRequest)initWithAccessoryUniqueIdentifier:(id)a3
{
  return [(COTimerReadRequest *)self initWithAccessoryUniqueIdentifier:a3 requiresFilter:1];
}

- (COTimerReadRequest)initWithAccessory:(id)a3
{
  v4 = [a3 uniqueIdentifier];
  v5 = [(COTimerReadRequest *)self initWithAccessoryUniqueIdentifier:v4];

  return v5;
}

- (id)initForMerge
{
  id result = [(COMeshCommand *)self init];
  if (result)
  {
    *((unsigned char *)result + 17) = 0;
    *((unsigned char *)result + 16) = 1;
  }
  return result;
}

- (COTimerReadRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)COTimerReadRequest;
  v5 = [(COMeshCommand *)&v11 initWithCoder:v4];
  if (v5)
  {
    if ([v4 containsValueForKey:@"accessory"])
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessory"];
      accessoryUniqueIdentifier = v5->_accessoryUniqueIdentifier;
      v5->_accessoryUniqueIdentifier = (NSUUID *)v6;
    }
    v5->_requiresFilter = [v4 containsValueForKey:@"filtered"];
    v5->_isForMerge = [v4 containsValueForKey:@"merge"];
    if ([v4 containsValueForKey:@"etag"])
    {
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"etag"];
      eTag = v5->_eTag;
      v5->_eTag = (NSString *)v8;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)COTimerReadRequest;
  [(COMeshCommand *)&v8 encodeWithCoder:v4];
  v5 = [(COTimerReadRequest *)self accessoryUniqueIdentifier];
  if (v5) {
    [v4 encodeObject:v5 forKey:@"accessory"];
  }
  if ([(COTimerReadRequest *)self requiresFilter]) {
    [v4 encodeObject:MEMORY[0x263EFFA88] forKey:@"filtered"];
  }
  if ([(COTimerReadRequest *)self isForMerge]) {
    [v4 encodeObject:MEMORY[0x263EFFA88] forKey:@"merge"];
  }
  uint64_t v6 = [(COTimerReadRequest *)self eTag];

  if (v6)
  {
    id v7 = [(COTimerReadRequest *)self eTag];
    [v4 encodeObject:v7 forKey:@"etag"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)acceptableResponses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (NSUUID)accessoryUniqueIdentifier
{
  return self->_accessoryUniqueIdentifier;
}

- (BOOL)isForMerge
{
  return self->_isForMerge;
}

- (NSString)eTag
{
  return self->_eTag;
}

- (void)setETag:(id)a3
{
}

- (BOOL)requiresFilter
{
  return self->_requiresFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eTag, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIdentifier, 0);
}

@end