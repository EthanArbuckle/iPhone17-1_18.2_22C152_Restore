@interface IMXPCDictionary
+ (_xpc_type_s)type;
- (IMXPCDictionary)initWithDictionary:(id)a3 key:(const char *)a4;
- (id)dictionaryForKey:(const char *)a3;
@end

@implementation IMXPCDictionary

- (id)dictionaryForKey:(const char *)a3
{
  uint64_t v5 = [(IMXPCObject *)self object];
  if (v5
    && (v6 = (void *)v5,
        [(IMXPCObject *)self object],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = MEMORY[0x1A6228EC0](),
        uint64_t v9 = MEMORY[0x1E4F14590],
        v7,
        v6,
        v8 == v9))
  {
    v11 = [(IMXPCObject *)self object];
    v12 = xpc_dictionary_get_value(v11, a3);

    v10 = (void *)IMCreateDictionaryFromXPCObjectWithStandardAllowlist();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (IMXPCDictionary)initWithDictionary:(id)a3 key:(const char *)a4
{
  id v6 = a3;
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  if (v6)
  {
    uint64_t v8 = (void *)IMCreateXPCObjectFromDictionary();
    xpc_dictionary_set_value(v7, a4, v8);
  }
  v11.receiver = self;
  v11.super_class = (Class)IMXPCDictionary;
  uint64_t v9 = [(IMXPCObject *)&v11 initWithXPCObject:v7];

  return v9;
}

+ (_xpc_type_s)type
{
  return (_xpc_type_s *)MEMORY[0x1E4F14590];
}

@end