@interface GEOConfigGetExpiringKeysRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOConfigGetExpiringKeysRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOConfigGetExpiringKeysRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)keyOptions;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setKeyOptions:(unint64_t)a3;
@end

@implementation GEOConfigGetExpiringKeysRequest

- (BOOL)isValid
{
  return [(GEOConfigGetExpiringKeysRequest *)self keyOptions] != 0;
}

- (unint64_t)keyOptions
{
  return self->_keyOptions;
}

- (GEOConfigGetExpiringKeysRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOConfigGetExpiringKeysRequest;
  v7 = [(GEOXPCRequest *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_keyOptions = xpc_dictionary_get_int64(v6, "keyOptions");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOConfigGetExpiringKeysRequest;
  id v4 = a3;
  [(GEOXPCRequest *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "keyOptions", self->_keyOptions);
}

- (void)setKeyOptions:(unint64_t)a3
{
  self->_keyOptions = a3;
}

- (unint64_t)reply
{
  return 1;
}

- (GEOConfigGetExpiringKeysRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"defaults.getAllExpiringKeys" traits:a3 auditToken:a4 throttleToken:a5];
}

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

@end