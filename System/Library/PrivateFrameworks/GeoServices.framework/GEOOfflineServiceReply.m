@interface GEOOfflineServiceReply
- (BOOL)isValid;
- (GEOOfflineServiceReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSData)response;
- (NSData)responseMetadata;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setResponse:(id)a3;
- (void)setResponseMetadata:(id)a3;
@end

@implementation GEOOfflineServiceReply

- (GEOOfflineServiceReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOOfflineServiceReply;
  v7 = [(GEOXPCReply *)&v19 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v6, "response", &length);
    if (data)
    {
      v9 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
      uint64_t v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:a4];
      response = v7->_response;
      v7->_response = (NSData *)v10;
    }
    size_t length = 0;
    v12 = xpc_dictionary_get_data(v6, "responseMetadata", &length);
    if (v12)
    {
      v13 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v12 length:length freeWhenDone:0];
      uint64_t v14 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v13 error:a4];
      responseMetadata = v7->_responseMetadata;
      v7->_responseMetadata = (NSData *)v14;
    }
    v16 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOOfflineServiceReply;
  [(GEOXPCReply *)&v9 encodeToXPCDictionary:v4];
  response = self->_response;
  if (response)
  {
    id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:response requiringSecureCoding:1 error:0];
    xpc_dictionary_set_data(v4, "response", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
  responseMetadata = self->_responseMetadata;
  if (responseMetadata)
  {
    id v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:responseMetadata requiringSecureCoding:1 error:0];
    xpc_dictionary_set_data(v4, "responseMetadata", (const void *)[v8 bytes], objc_msgSend(v8, "length"));
  }
}

- (BOOL)isValid
{
  v3 = [(GEOOfflineServiceReply *)self response];
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

- (NSData)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (NSData)responseMetadata
{
  return self->_responseMetadata;
}

- (void)setResponseMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseMetadata, 0);

  objc_storeStrong((id *)&self->_response, 0);
}

@end