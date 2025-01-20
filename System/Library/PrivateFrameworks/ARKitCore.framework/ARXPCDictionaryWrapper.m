@interface ARXPCDictionaryWrapper
+ (BOOL)supportsSecureCoding;
+ (id)wrapperWithDictionary:(id)a3;
- (ARXPCDictionaryWrapper)initWithCoder:(id)a3;
- (ARXPCDictionaryWrapper)initWithDictionary:(id)a3;
- (OS_xpc_object)dictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ARXPCDictionaryWrapper

+ (id)wrapperWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

- (ARXPCDictionaryWrapper)initWithDictionary:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5 && object_getClass(v5) == (Class)MEMORY[0x1E4F14590])
  {
    v11.receiver = self;
    v11.super_class = (Class)ARXPCDictionaryWrapper;
    v8 = [(ARXPCDictionaryWrapper *)&v11 init];
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_dictionary, a3);
    }
    self = v9;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARXPCDictionaryWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"dictionary"];
    self = [(ARXPCDictionaryWrapper *)self initWithDictionary:v5];

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    dictionary = self->_dictionary;
    if (dictionary) {
      [v5 encodeXPCObject:dictionary forKey:@"dictionary"];
    }
  }
}

- (OS_xpc_object)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
}

@end