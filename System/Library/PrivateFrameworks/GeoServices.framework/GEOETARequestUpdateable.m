@interface GEOETARequestUpdateable
+ (Class)replyClass;
- (BOOL)isValid;
- (GEODataConditionalConnectionProperties)connectionProperties;
- (GEOETARequestUpdateable)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOETARequestUpdateable)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (GEOETATrafficUpdateRequest)request;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setConnectionProperties:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation GEOETARequestUpdateable

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOETARequestUpdateable)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"ETA.startETARequest" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOETARequestUpdateable)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOETARequestUpdateable;
  v7 = [(GEOXPCRequest *)&v20 initWithXPCDictionary:v6 error:a4];
  if (!v7) {
    goto LABEL_8;
  }
  size_t length = 0;
  data = xpc_dictionary_get_data(v6, "requestData", &length);
  if (data)
  {
    v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
    v10 = [[GEOETATrafficUpdateRequest alloc] initWithData:v9];
  }
  else
  {
    uint64_t v18 = xpc_dictionary_get_value(v6, "requestData");
    v9 = (void *)v18;
    if (!v18 || MEMORY[0x18C1213B0](v18) != MEMORY[0x1E4F14580]) {
      goto LABEL_5;
    }
    v10 = objc_alloc_init(GEOETATrafficUpdateRequest);
  }
  request = v7->_request;
  v7->_request = v10;

LABEL_5:
  size_t length = 0;
  v12 = xpc_dictionary_get_data(v6, "connectionProperties", &length);
  if (v12)
  {
    v13 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v12 length:length freeWhenDone:0];
    uint64_t v14 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v13 error:a4];
    connectionProperties = v7->_connectionProperties;
    v7->_connectionProperties = (GEODataConditionalConnectionProperties *)v14;
  }
  v16 = v7;
LABEL_8:

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOETARequestUpdateable;
  [(GEOXPCRequest *)&v9 encodeToXPCDictionary:v4];
  request = self->_request;
  if (request)
  {
    id v6 = [(GEOETATrafficUpdateRequest *)request data];
    xpc_dictionary_set_data(v4, "requestData", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
  connectionProperties = self->_connectionProperties;
  if (connectionProperties)
  {
    id v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:connectionProperties requiringSecureCoding:1 error:0];
    xpc_dictionary_set_data(v4, "connectionProperties", (const void *)[v8 bytes], objc_msgSend(v8, "length"));
  }
}

- (BOOL)isValid
{
  v2 = [(GEOETARequestUpdateable *)self request];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)reply
{
  v2 = [(GEOXPCRequest *)self method];
  unint64_t v3 = [v2 hasPrefix:@"start"];

  return v3;
}

- (GEOETATrafficUpdateRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (GEODataConditionalConnectionProperties)connectionProperties
{
  return self->_connectionProperties;
}

- (void)setConnectionProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionProperties, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end