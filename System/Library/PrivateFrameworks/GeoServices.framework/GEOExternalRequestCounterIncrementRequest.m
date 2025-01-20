@interface GEOExternalRequestCounterIncrementRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOExternalRequestCounterIncrementRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOExternalRequestCounterIncrementRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (GEOExternalRequestCounterInfo)info;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setInfo:(id)a3;
@end

@implementation GEOExternalRequestCounterIncrementRequest

+ (Class)replyClass
{
  return 0;
}

- (GEOExternalRequestCounterIncrementRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"requestCounter.externalIncrement" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOExternalRequestCounterIncrementRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOExternalRequestCounterIncrementRequest;
  v7 = [(GEOXPCRequest *)&v12 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v8 = xpc_dictionary_get_dictionary(v6, "info");
    if (v8)
    {
      v9 = [[GEOExternalRequestCounterInfo alloc] initWithXPCDictionary:v8 error:a4];
      if (v9) {
        objc_storeStrong((id *)&v7->_info, v9);
      }
    }
    v10 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GEOExternalRequestCounterIncrementRequest;
  [(GEOXPCRequest *)&v6 encodeToXPCDictionary:v4];
  if (self->_info)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    [(GEOExternalRequestCounterInfo *)self->_info encodeToXPCDictionary:empty];
    xpc_dictionary_set_value(v4, "info", empty);
  }
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 0;
}

- (GEOExternalRequestCounterInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end