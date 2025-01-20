@interface GEOConfigGetAllValueInStoreReply
- (BOOL)isValid;
- (GEOConfigGetAllValueInStoreReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSDictionary)keyStringsAndValues;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setKeyStringsAndValues:(id)a3;
@end

@implementation GEOConfigGetAllValueInStoreReply

- (void).cxx_destruct
{
}

- (void)setKeyStringsAndValues:(id)a3
{
}

- (BOOL)isValid
{
  return 1;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GEOConfigGetAllValueInStoreReply;
  [(GEOXPCReply *)&v6 encodeToXPCDictionary:v4];
  if ([(NSDictionary *)self->_keyStringsAndValues count])
  {
    v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v5) {
      xpc_dictionary_set_value(v4, "keyStringsAndValues", v5);
    }
  }
}

- (GEOConfigGetAllValueInStoreReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOConfigGetAllValueInStoreReply;
  v7 = [(GEOXPCReply *)&v13 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v8 = xpc_dictionary_get_value(v6, "keyStringsAndValues");
    if (v8)
    {
      uint64_t v9 = _CFXPCCreateCFObjectFromXPCObject();
      keyStringsAndValues = v7->_keyStringsAndValues;
      v7->_keyStringsAndValues = (NSDictionary *)v9;
    }
    v11 = v7;
  }

  return v7;
}

- (NSDictionary)keyStringsAndValues
{
  return self->_keyStringsAndValues;
}

@end