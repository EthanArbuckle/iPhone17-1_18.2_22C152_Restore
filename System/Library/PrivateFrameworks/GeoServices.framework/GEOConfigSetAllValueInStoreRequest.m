@interface GEOConfigSetAllValueInStoreRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOConfigSetAllValueInStoreRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOConfigSetAllValueInStoreRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSDictionary)keyStringsAndValues;
- (unint64_t)keyOptions;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setKeyOptions:(unint64_t)a3;
- (void)setKeyStringsAndValues:(id)a3;
@end

@implementation GEOConfigSetAllValueInStoreRequest

+ (Class)replyClass
{
  return 0;
}

- (GEOConfigSetAllValueInStoreRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"defaults.setAllValuesInStore" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOConfigSetAllValueInStoreRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOConfigSetAllValueInStoreRequest;
  v7 = [(GEOXPCRequest *)&v13 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_keyOptions = xpc_dictionary_get_int64(v6, "keyOptions");
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

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GEOConfigSetAllValueInStoreRequest;
  [(GEOXPCRequest *)&v6 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "keyOptions", self->_keyOptions);
  if ([(NSDictionary *)self->_keyStringsAndValues count])
  {
    v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v5) {
      xpc_dictionary_set_value(v4, "keyStringsAndValues", v5);
    }
  }
}

- (BOOL)isValid
{
  return [(GEOConfigSetAllValueInStoreRequest *)self keyOptions] != 0;
}

- (unint64_t)reply
{
  return 0;
}

- (unint64_t)keyOptions
{
  return self->_keyOptions;
}

- (void)setKeyOptions:(unint64_t)a3
{
  self->_keyOptions = a3;
}

- (NSDictionary)keyStringsAndValues
{
  return self->_keyStringsAndValues;
}

- (void)setKeyStringsAndValues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end