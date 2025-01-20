@interface GEOPlaceReplyMessage
- (BOOL)isValid;
- (GEOPDPlaceResponse)response;
- (GEOPlaceReplyMessage)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSUUID)requestUUID;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setRequestUUID:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation GEOPlaceReplyMessage

- (BOOL)isValid
{
  v3 = [(GEOPlaceReplyMessage *)self response];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(GEOXPCReply *)self error];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (GEOPDPlaceResponse)response
{
  return self->_response;
}

- (GEOPlaceReplyMessage)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOPlaceReplyMessage;
  v7 = [(GEOXPCReply *)&v19 initWithXPCDictionary:v6 error:a4];
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
    data = xpc_dictionary_get_data(v6, "resp", &length);
    if (data)
    {
      v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
      v13 = [[GEOPDPlaceResponse alloc] initWithData:v12];
    }
    else
    {
      uint64_t v17 = xpc_dictionary_get_value(v6, "resp");
      v12 = (void *)v17;
      if (!v17 || MEMORY[0x18C1213B0](v17) != MEMORY[0x1E4F14580]) {
        goto LABEL_7;
      }
      v13 = objc_alloc_init(GEOPDPlaceResponse);
    }
    response = v7->_response;
    v7->_response = v13;

LABEL_7:
    v15 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOPlaceReplyMessage;
  [(GEOXPCReply *)&v8 encodeToXPCDictionary:v4];
  requestUUID = self->_requestUUID;
  if (requestUUID)
  {
    *(void *)uuid = 0;
    uint64_t v10 = 0;
    [(NSUUID *)requestUUID getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v4, "requestUUID", uuid);
  }
  response = self->_response;
  if (response)
  {
    id v7 = [(GEOPDPlaceResponse *)response data];
    xpc_dictionary_set_data(v4, "resp", (const void *)[v7 bytes], objc_msgSend(v7, "length"));
  }
}

- (void)setResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_requestUUID, 0);
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
}

@end