@interface LKNSDictionaryCodingProxy
+ (BOOL)supportsSecureCoding;
- (LKNSDictionaryCodingProxy)initWithCoder:(id)a3;
- (LKNSDictionaryCodingProxy)initWithObject:(id)a3;
- (id)decodedObject;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LKNSDictionaryCodingProxy

- (id)decodedObject
{
  return self->_dict;
}

- (LKNSDictionaryCodingProxy)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)LKNSDictionaryCodingProxy;
  v4 = [(LKNSDictionaryCodingProxy *)&v15 init];
  if (v4)
  {
    v5 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E4F28B90], "CA_supportedClasses"), @"dict");
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
      v8 = (void *)[v6 keyEnumerator];
      uint64_t v9 = [v8 nextObject];
      if (v9)
      {
        uint64_t v10 = v9;
        v11 = (void *)*MEMORY[0x1E4F1D260];
        do
        {
          v12 = (void *)[v6 objectForKey:v10];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v12 = (void *)[v12 decodedObject];
          }
          if (v12) {
            v13 = v12;
          }
          else {
            v13 = v11;
          }
          [v7 setObject:v13 forKey:v10];
          uint64_t v10 = [v8 nextObject];
        }
        while (v10);
      }
      v4->_dict = (NSDictionary *)[v7 copy];
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)LKNSDictionaryCodingProxy;
  [(LKNSDictionaryCodingProxy *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSDictionary count](self->_dict, "count"));
  v5 = [(NSDictionary *)self->_dict keyEnumerator];
  uint64_t v6 = [(NSEnumerator *)v5 nextObject];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = (objc_object *)*MEMORY[0x1E4F1D260];
    do
    {
      uint64_t v9 = [(NSDictionary *)self->_dict objectForKey:v7];
      Proxy = CACodingCreateProxy((NSCoder *)a3, v9);
      v11 = Proxy;
      if (v9) {
        v12 = v9;
      }
      else {
        v12 = v8;
      }
      if (Proxy) {
        v13 = Proxy;
      }
      else {
        v13 = (CATintedImage *)v12;
      }
      [v14 setObject:v13 forKey:v7];

      uint64_t v7 = [(NSEnumerator *)v5 nextObject];
    }
    while (v7);
  }
  [a3 encodeObject:v14 forKey:@"dict"];
}

- (LKNSDictionaryCodingProxy)initWithObject:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)LKNSDictionaryCodingProxy;
  uint64_t v4 = [(LKNSDictionaryCodingProxy *)&v6 init];
  if (v4) {
    v4->_dict = (NSDictionary *)[a3 copy];
  }
  return v4;
}

@end