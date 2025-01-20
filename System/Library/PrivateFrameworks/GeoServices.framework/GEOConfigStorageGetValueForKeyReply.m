@interface GEOConfigStorageGetValueForKeyReply
- (BOOL)isValid;
- (GEOConfigStorageGetValueForKeyReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (id)keyValue;
- (int64_t)keySource;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setKeySource:(int64_t)a3;
- (void)setKeyValue:(id)a3;
@end

@implementation GEOConfigStorageGetValueForKeyReply

- (GEOConfigStorageGetValueForKeyReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOConfigStorageGetValueForKeyReply;
  v7 = [(GEOXPCReply *)&v13 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v8 = xpc_dictionary_get_value(v6, "keyValue");
    if (v8)
    {
      uint64_t v9 = _CFXPCCreateCFObjectFromXPCObject();
      id keyValue = v7->_keyValue;
      v7->_id keyValue = (id)v9;
    }
    v7->_keySource = xpc_dictionary_get_int64(v6, "keySource");
    v11 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GEOConfigStorageGetValueForKeyReply;
  [(GEOXPCReply *)&v6 encodeToXPCDictionary:v4];
  if (self->_keyValue)
  {
    v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v5) {
      xpc_dictionary_set_value(v4, "keyValue", v5);
    }
  }
  xpc_dictionary_set_int64(v4, "keySource", self->_keySource);
}

- (BOOL)isValid
{
  return 1;
}

- (id)keyValue
{
  return self->_keyValue;
}

- (void)setKeyValue:(id)a3
{
}

- (int64_t)keySource
{
  return self->_keySource;
}

- (void)setKeySource:(int64_t)a3
{
  self->_keySource = a3;
}

- (void).cxx_destruct
{
}

@end