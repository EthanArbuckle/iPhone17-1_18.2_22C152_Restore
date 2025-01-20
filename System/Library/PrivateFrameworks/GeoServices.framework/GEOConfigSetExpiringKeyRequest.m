@interface GEOConfigSetExpiringKeyRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOConfigSetExpiringKeyRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOConfigSetExpiringKeyRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSDate)expireTime;
- (NSString)expireOSVersion;
- (NSString)keyString;
- (unint64_t)keyOptions;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setExpireOSVersion:(id)a3;
- (void)setExpireTime:(id)a3;
- (void)setKeyOptions:(unint64_t)a3;
- (void)setKeyString:(id)a3;
@end

@implementation GEOConfigSetExpiringKeyRequest

+ (Class)replyClass
{
  return 0;
}

- (GEOConfigSetExpiringKeyRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"defaults.setExpiringKey" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOConfigSetExpiringKeyRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOConfigSetExpiringKeyRequest;
  v7 = [(GEOXPCRequest *)&v18 initWithXPCDictionary:v6 error:a4];
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
    if (xpc_dictionary_get_double(v6, "expireTime") != 0.0)
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
      expireTime = v7->_expireTime;
      v7->_expireTime = (NSDate *)v11;
    }
    v13 = xpc_dictionary_get_string(v6, "expireOSVersion");
    if (v13)
    {
      uint64_t v14 = [NSString stringWithUTF8String:v13];
      expireOSVersion = v7->_expireOSVersion;
      v7->_expireOSVersion = (NSString *)v14;
    }
    v16 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOConfigSetExpiringKeyRequest;
  [(GEOXPCRequest *)&v11 encodeToXPCDictionary:v4];
  keyString = self->_keyString;
  if (keyString)
  {
    id v6 = [(NSString *)keyString UTF8String];
    if (v6) {
      xpc_dictionary_set_string(v4, "keyString", v6);
    }
  }
  xpc_dictionary_set_int64(v4, "keyOptions", self->_keyOptions);
  expireTime = self->_expireTime;
  if (expireTime)
  {
    [(NSDate *)expireTime timeIntervalSinceReferenceDate];
    if (v8 != 0.0) {
      xpc_dictionary_set_double(v4, "expireTime", v8);
    }
  }
  expireOSVersion = self->_expireOSVersion;
  if (expireOSVersion)
  {
    v10 = [(NSString *)expireOSVersion UTF8String];
    if (v10) {
      xpc_dictionary_set_string(v4, "expireOSVersion", v10);
    }
  }
}

- (BOOL)isValid
{
  v3 = [(GEOConfigSetExpiringKeyRequest *)self keyString];
  if ([v3 length]) {
    BOOL v4 = [(GEOConfigSetExpiringKeyRequest *)self keyOptions] != 0;
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

- (NSDate)expireTime
{
  return self->_expireTime;
}

- (void)setExpireTime:(id)a3
{
}

- (NSString)expireOSVersion
{
  return self->_expireOSVersion;
}

- (void)setExpireOSVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expireOSVersion, 0);
  objc_storeStrong((id *)&self->_expireTime, 0);

  objc_storeStrong((id *)&self->_keyString, 0);
}

@end