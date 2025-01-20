@interface GEOETAUpdateableWillSendReply
- (BOOL)isValid;
- (GEOETATrafficUpdateRequest)updatedRequest;
- (GEOETAUpdateableWillSendReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setUpdatedRequest:(id)a3;
@end

@implementation GEOETAUpdateableWillSendReply

- (GEOETAUpdateableWillSendReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOETAUpdateableWillSendReply;
  v7 = [(GEOXPCReply *)&v16 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v6, "requestData", &length);
    if (data)
    {
      v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
      v10 = [[GEOETATrafficUpdateRequest alloc] initWithData:v9];
    }
    else
    {
      uint64_t v14 = xpc_dictionary_get_value(v6, "requestData");
      v9 = (void *)v14;
      if (!v14 || MEMORY[0x18C1213B0](v14) != MEMORY[0x1E4F14580]) {
        goto LABEL_5;
      }
      v10 = objc_alloc_init(GEOETATrafficUpdateRequest);
    }
    updatedRequest = v7->_updatedRequest;
    v7->_updatedRequest = v10;

LABEL_5:
    v12 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOETAUpdateableWillSendReply;
  [(GEOXPCReply *)&v7 encodeToXPCDictionary:v4];
  updatedRequest = self->_updatedRequest;
  if (updatedRequest)
  {
    id v6 = [(GEOETATrafficUpdateRequest *)updatedRequest data];
    xpc_dictionary_set_data(v4, "requestData", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
}

- (BOOL)isValid
{
  return 1;
}

- (GEOETATrafficUpdateRequest)updatedRequest
{
  return self->_updatedRequest;
}

- (void)setUpdatedRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end