@interface GEOPlaceRequestMessage
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOPDPlaceRequest)request;
- (GEOPlaceRequestMessage)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOPlaceRequestMessage)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSUUID)requestUUID;
- (double)timeout;
- (unint64_t)cachePolicy;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setCachePolicy:(unint64_t)a3;
- (void)setRequest:(id)a3;
- (void)setRequestUUID:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation GEOPlaceRequestMessage

- (BOOL)isValid
{
  v3 = [(GEOPlaceRequestMessage *)self requestUUID];
  if (v3)
  {
    v4 = [(GEOPlaceRequestMessage *)self request];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (GEOPDPlaceRequest)request
{
  return self->_request;
}

- (GEOPlaceRequestMessage)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOPlaceRequestMessage;
  v7 = [(GEOXPCRequest *)&v19 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    uuid = xpc_dictionary_get_uuid(v6, "requestUUID");
    if (uuid)
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uuid];
      requestUUID = v7->_requestUUID;
      v7->_requestUUID = (NSUUID *)v9;
    }
    size_t length = 0;
    data = xpc_dictionary_get_data(v6, "req", &length);
    if (data)
    {
      v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
      v13 = [[GEOPDPlaceRequest alloc] initWithData:v12];
    }
    else
    {
      uint64_t v17 = xpc_dictionary_get_value(v6, "req");
      v12 = (void *)v17;
      if (!v17 || MEMORY[0x18C1213B0](v17) != MEMORY[0x1E4F14580]) {
        goto LABEL_7;
      }
      v13 = objc_alloc_init(GEOPDPlaceRequest);
    }
    request = v7->_request;
    v7->_request = v13;

LABEL_7:
    v7->_cachePolicy = xpc_dictionary_get_int64(v6, "cachePolicy");
    v7->_timeout = xpc_dictionary_get_double(v6, "timeout");
    v15 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOPlaceRequestMessage;
  [(GEOXPCRequest *)&v8 encodeToXPCDictionary:v4];
  requestUUID = self->_requestUUID;
  if (requestUUID)
  {
    *(void *)uuid = 0;
    uint64_t v10 = 0;
    [(NSUUID *)requestUUID getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v4, "requestUUID", uuid);
  }
  request = self->_request;
  if (request)
  {
    id v7 = [(GEOPDPlaceRequest *)request data];
    xpc_dictionary_set_data(v4, "req", (const void *)[v7 bytes], objc_msgSend(v7, "length"));
  }
  xpc_dictionary_set_int64(v4, "cachePolicy", self->_cachePolicy);
  xpc_dictionary_set_double(v4, "timeout", self->_timeout);
}

- (double)timeout
{
  return self->_timeout;
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void)setRequestUUID:(id)a3
{
}

- (void)setRequest:(id)a3
{
}

- (void)setCachePolicy:(unint64_t)a3
{
  self->_cachePolicy = a3;
}

- (GEOPlaceRequestMessage)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"placedata.performPlaceDataRequest" traits:a3 auditToken:a4 throttleToken:a5];
}

- (unint64_t)reply
{
  return 1;
}

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end