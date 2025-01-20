@interface GEOConfigStorageSetValueForKeyRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOConfigStorageSetValueForKeyRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOConfigStorageSetValueForKeyRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSString)keyString;
- (id)keyValue;
- (unint64_t)keyOptions;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setKeyOptions:(unint64_t)a3;
- (void)setKeyString:(id)a3;
- (void)setKeyValue:(id)a3;
@end

@implementation GEOConfigStorageSetValueForKeyRequest

- (unint64_t)reply
{
  return 2;
}

- (BOOL)isValid
{
  return [(GEOConfigStorageSetValueForKeyRequest *)self keyOptions] != 0;
}

- (unint64_t)keyOptions
{
  return self->_keyOptions;
}

- (GEOConfigStorageSetValueForKeyRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOConfigStorageSetValueForKeyRequest;
  v7 = [(GEOXPCRequest *)&v16 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    string = xpc_dictionary_get_string(v6, "keyString");
    if (string)
    {
      uint64_t v9 = [NSString stringWithUTF8String:string];
      keyString = v7->_keyString;
      v7->_keyString = (NSString *)v9;
    }
    v7->_keyOptions = xpc_dictionary_get_int64(v6, "keyOptions");
    v11 = xpc_dictionary_get_value(v6, "keyValue");
    if (v11)
    {
      uint64_t v12 = _CFXPCCreateCFObjectFromXPCObject();
      id keyValue = v7->_keyValue;
      v7->_id keyValue = (id)v12;
    }
    v14 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOConfigStorageSetValueForKeyRequest;
  [(GEOXPCRequest *)&v8 encodeToXPCDictionary:v4];
  keyString = self->_keyString;
  if (keyString)
  {
    id v6 = [(NSString *)keyString UTF8String];
    if (v6) {
      xpc_dictionary_set_string(v4, "keyString", v6);
    }
  }
  xpc_dictionary_set_int64(v4, "keyOptions", self->_keyOptions);
  if (self->_keyValue)
  {
    v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v7) {
      xpc_dictionary_set_value(v4, "keyValue", v7);
    }
  }
}

- (NSString)keyString
{
  return self->_keyString;
}

- (id)keyValue
{
  return self->_keyValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keyValue, 0);

  objc_storeStrong((id *)&self->_keyString, 0);
}

- (void)setKeyValue:(id)a3
{
}

- (void)setKeyString:(id)a3
{
}

- (void)setKeyOptions:(unint64_t)a3
{
  self->_keyOptions = a3;
}

- (GEOConfigStorageSetValueForKeyRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"defaults.setConfigValueForKey" traits:a3 auditToken:a4 throttleToken:a5];
}

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

@end