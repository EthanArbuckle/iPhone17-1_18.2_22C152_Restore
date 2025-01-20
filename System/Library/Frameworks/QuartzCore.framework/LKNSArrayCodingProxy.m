@interface LKNSArrayCodingProxy
+ (BOOL)supportsSecureCoding;
- (LKNSArrayCodingProxy)initWithCoder:(id)a3;
- (LKNSArrayCodingProxy)initWithObject:(id)a3;
- (id)decodedObject;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LKNSArrayCodingProxy

- (id)decodedObject
{
  return self->_array;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LKNSArrayCodingProxy)initWithCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)LKNSArrayCodingProxy;
  v4 = [(LKNSArrayCodingProxy *)&v14 init];
  if (v4)
  {
    v5 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E4F28B90], "CA_supportedClasses"), @"array");
    if (v5)
    {
      v6 = v5;
      uint64_t v7 = [v5 count];
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
      if (v7)
      {
        uint64_t v9 = 0;
        v10 = (void *)*MEMORY[0x1E4F1D260];
        do
        {
          v11 = (void *)[v6 objectAtIndex:v9];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v11 = (void *)[v11 decodedObject];
          }
          if (v11) {
            v12 = v11;
          }
          else {
            v12 = v10;
          }
          [v8 addObject:v12];
          ++v9;
        }
        while (v7 != v9);
      }
      v4->_array = (NSArray *)[v8 copy];
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)LKNSArrayCodingProxy;
  [(LKNSArrayCodingProxy *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  NSUInteger v5 = [(NSArray *)self->_array count];
  id v13 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = (objc_object *)*MEMORY[0x1E4F1D260];
    do
    {
      v8 = [(NSArray *)self->_array objectAtIndex:v6];
      Proxy = CACodingCreateProxy((NSCoder *)a3, v8);
      v10 = Proxy;
      if (v8) {
        v11 = v8;
      }
      else {
        v11 = v7;
      }
      if (Proxy) {
        v12 = Proxy;
      }
      else {
        v12 = (CATintedImage *)v11;
      }
      [v13 addObject:v12];

      ++v6;
    }
    while (v5 != v6);
  }
  [a3 encodeObject:v13 forKey:@"array"];
}

- (LKNSArrayCodingProxy)initWithObject:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)LKNSArrayCodingProxy;
  uint64_t v4 = [(LKNSArrayCodingProxy *)&v6 init];
  if (v4) {
    v4->_array = (NSArray *)[a3 copy];
  }
  return v4;
}

@end