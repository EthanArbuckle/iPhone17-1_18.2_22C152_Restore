@interface GEOConfigStorageGetValueForKeyRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOConfigStorageGetValueForKeyRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOConfigStorageGetValueForKeyRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSString)countryCode;
- (NSString)keyString;
- (unint64_t)keyOptions;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setKeyOptions:(unint64_t)a3;
- (void)setKeyString:(id)a3;
@end

@implementation GEOConfigStorageGetValueForKeyRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOConfigStorageGetValueForKeyRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"defaults.getConfigValueForKey" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOConfigStorageGetValueForKeyRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOConfigStorageGetValueForKeyRequest;
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
    v11 = xpc_dictionary_get_string(v6, "countryCode");
    if (v11)
    {
      uint64_t v12 = [NSString stringWithUTF8String:v11];
      countryCode = v7->_countryCode;
      v7->_countryCode = (NSString *)v12;
    }
    v14 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOConfigStorageGetValueForKeyRequest;
  [(GEOXPCRequest *)&v9 encodeToXPCDictionary:v4];
  keyString = self->_keyString;
  if (keyString)
  {
    id v6 = [(NSString *)keyString UTF8String];
    if (v6) {
      xpc_dictionary_set_string(v4, "keyString", v6);
    }
  }
  xpc_dictionary_set_int64(v4, "keyOptions", self->_keyOptions);
  countryCode = self->_countryCode;
  if (countryCode)
  {
    v8 = [(NSString *)countryCode UTF8String];
    if (v8) {
      xpc_dictionary_set_string(v4, "countryCode", v8);
    }
  }
}

- (BOOL)isValid
{
  return [(GEOConfigStorageGetValueForKeyRequest *)self keyOptions] != 0;
}

- (unint64_t)reply
{
  return 1;
}

- (NSString)keyString
{
  return self->_keyString;
}

- (void)setKeyString:(id)a3
{
}

- (unint64_t)keyOptions
{
  return self->_keyOptions;
}

- (void)setKeyOptions:(unint64_t)a3
{
  self->_keyOptions = a3;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);

  objc_storeStrong((id *)&self->_keyString, 0);
}

@end