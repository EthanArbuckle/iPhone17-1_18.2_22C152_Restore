@interface GEOETARequestSimple
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOETARequest)request;
- (GEOETARequestSimple)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOETARequestSimple)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation GEOETARequestSimple

- (GEOETARequestSimple)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOETARequestSimple;
  v7 = [(GEOXPCRequest *)&v16 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v6, "requestData", &length);
    if (data)
    {
      v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
      v10 = [[GEOETARequest alloc] initWithData:v9];
    }
    else
    {
      uint64_t v14 = xpc_dictionary_get_value(v6, "requestData");
      v9 = (void *)v14;
      if (!v14 || MEMORY[0x18C1213B0](v14) != MEMORY[0x1E4F14580]) {
        goto LABEL_5;
      }
      v10 = objc_alloc_init(GEOETARequest);
    }
    request = v7->_request;
    v7->_request = v10;

LABEL_5:
    v12 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOETARequestSimple;
  [(GEOXPCRequest *)&v7 encodeToXPCDictionary:v4];
  request = self->_request;
  if (request)
  {
    id v6 = [(GEOETARequest *)request data];
    xpc_dictionary_set_data(v4, "requestData", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
}

- (unint64_t)reply
{
  v2 = [(GEOXPCRequest *)self method];
  unint64_t v3 = [v2 hasPrefix:@"start"];

  return v3;
}

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isValid
{
  v2 = [(GEOETARequestSimple *)self request];
  BOOL v3 = v2 != 0;

  return v3;
}

- (GEOETARequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
}

- (void)setRequest:(id)a3
{
}

- (GEOETARequestSimple)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"ETA.startSimpleETARequest" traits:a3 auditToken:a4 throttleToken:a5];
}

@end