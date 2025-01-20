@interface GEOOfflineServiceRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOOfflineServiceRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOOfflineServiceRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSData)request;
- (NSData)requestMetadata;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestMetadata:(id)a3;
@end

@implementation GEOOfflineServiceRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOOfflineServiceRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"offlineserver.request" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOOfflineServiceRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOOfflineServiceRequest;
  v7 = [(GEOXPCRequest *)&v19 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v6, "request", &length);
    if (data)
    {
      v9 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
      uint64_t v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:a4];
      request = v7->_request;
      v7->_request = (NSData *)v10;
    }
    size_t length = 0;
    v12 = xpc_dictionary_get_data(v6, "requestMetadata", &length);
    if (v12)
    {
      v13 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v12 length:length freeWhenDone:0];
      uint64_t v14 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v13 error:a4];
      requestMetadata = v7->_requestMetadata;
      v7->_requestMetadata = (NSData *)v14;
    }
    v16 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOOfflineServiceRequest;
  [(GEOXPCRequest *)&v9 encodeToXPCDictionary:v4];
  request = self->_request;
  if (request)
  {
    id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:request requiringSecureCoding:1 error:0];
    xpc_dictionary_set_data(v4, "request", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
  requestMetadata = self->_requestMetadata;
  if (requestMetadata)
  {
    id v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:requestMetadata requiringSecureCoding:1 error:0];
    xpc_dictionary_set_data(v4, "requestMetadata", (const void *)[v8 bytes], objc_msgSend(v8, "length"));
  }
}

- (BOOL)isValid
{
  v2 = [(GEOOfflineServiceRequest *)self request];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)reply
{
  return 1;
}

- (NSData)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSData)requestMetadata
{
  return self->_requestMetadata;
}

- (void)setRequestMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestMetadata, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end