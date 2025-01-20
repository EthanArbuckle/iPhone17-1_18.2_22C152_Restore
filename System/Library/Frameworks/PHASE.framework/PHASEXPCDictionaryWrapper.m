@interface PHASEXPCDictionaryWrapper
+ (BOOL)supportsSecureCoding;
+ (id)wrapperWithDictionary:(id)a3;
- (OS_xpc_object)dictionary;
- (PHASEXPCDictionaryWrapper)initWithCoder:(id)a3;
- (PHASEXPCDictionaryWrapper)initWithDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PHASEXPCDictionaryWrapper

+ (id)wrapperWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = [[PHASEXPCDictionaryWrapper alloc] initWithDictionary:v3];

  return v4;
}

- (PHASEXPCDictionaryWrapper)initWithDictionary:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5 && MEMORY[0x223C94820](v5) == MEMORY[0x263EF8708])
  {
    v11.receiver = self;
    v11.super_class = (Class)PHASEXPCDictionaryWrapper;
    v8 = [(PHASEXPCDictionaryWrapper *)&v11 init];
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

- (PHASEXPCDictionaryWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 decodeXPCObjectOfType:MEMORY[0x263EF8708] forKey:@"dictionary"];
    self = [(PHASEXPCDictionaryWrapper *)self initWithDictionary:v5];

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