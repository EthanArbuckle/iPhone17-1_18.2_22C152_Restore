@interface GEOConfigClearExpiredKeyRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOConfigClearExpiredKeyRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOConfigClearExpiredKeyRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSString)keyString;
- (unint64_t)keyOptions;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setKeyOptions:(unint64_t)a3;
- (void)setKeyString:(id)a3;
@end

@implementation GEOConfigClearExpiredKeyRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOConfigClearExpiredKeyRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"defaults.clearExpiredKey" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOConfigClearExpiredKeyRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOConfigClearExpiredKeyRequest;
  v7 = [(GEOXPCRequest *)&v13 initWithXPCDictionary:v6 error:a4];
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
    v11 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOConfigClearExpiredKeyRequest;
  [(GEOXPCRequest *)&v7 encodeToXPCDictionary:v4];
  keyString = self->_keyString;
  if (keyString)
  {
    id v6 = [(NSString *)keyString UTF8String];
    if (v6) {
      xpc_dictionary_set_string(v4, "keyString", v6);
    }
  }
  xpc_dictionary_set_int64(v4, "keyOptions", self->_keyOptions);
}

- (BOOL)isValid
{
  v3 = [(GEOConfigClearExpiredKeyRequest *)self keyString];
  if ([v3 length]) {
    BOOL v4 = [(GEOConfigClearExpiredKeyRequest *)self keyOptions] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (unint64_t)reply
{
  return 0;
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

- (void).cxx_destruct
{
}

@end