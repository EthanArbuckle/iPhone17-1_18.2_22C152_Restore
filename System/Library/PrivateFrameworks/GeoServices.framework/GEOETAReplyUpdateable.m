@interface GEOETAReplyUpdateable
- (BOOL)isValid;
- (GEOETAReplyUpdateable)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (GEOETATrafficUpdateErrorInfo)errorInfo;
- (GEOETATrafficUpdateResponse)response;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setErrorInfo:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation GEOETAReplyUpdateable

- (GEOETAReplyUpdateable)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOETAReplyUpdateable;
  v7 = [(GEOXPCReply *)&v20 initWithXPCDictionary:v6 error:a4];
  if (!v7) {
    goto LABEL_8;
  }
  size_t length = 0;
  data = xpc_dictionary_get_data(v6, "responseData", &length);
  if (data)
  {
    v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
    v10 = [[GEOETATrafficUpdateResponse alloc] initWithData:v9];
  }
  else
  {
    uint64_t v18 = xpc_dictionary_get_value(v6, "responseData");
    v9 = (void *)v18;
    if (!v18 || MEMORY[0x18C1213B0](v18) != MEMORY[0x1E4F14580]) {
      goto LABEL_5;
    }
    v10 = objc_alloc_init(GEOETATrafficUpdateResponse);
  }
  response = v7->_response;
  v7->_response = v10;

LABEL_5:
  size_t length = 0;
  v12 = xpc_dictionary_get_data(v6, "errorInfo", &length);
  if (v12)
  {
    v13 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v12 length:length freeWhenDone:0];
    uint64_t v14 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v13 error:a4];
    errorInfo = v7->_errorInfo;
    v7->_errorInfo = (GEOETATrafficUpdateErrorInfo *)v14;
  }
  v16 = v7;
LABEL_8:

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOETAReplyUpdateable;
  [(GEOXPCReply *)&v9 encodeToXPCDictionary:v4];
  response = self->_response;
  if (response)
  {
    id v6 = [(GEOETATrafficUpdateResponse *)response data];
    xpc_dictionary_set_data(v4, "responseData", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
  errorInfo = self->_errorInfo;
  if (errorInfo)
  {
    id v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:errorInfo requiringSecureCoding:1 error:0];
    xpc_dictionary_set_data(v4, "errorInfo", (const void *)[v8 bytes], objc_msgSend(v8, "length"));
  }
}

- (BOOL)isValid
{
  v3 = [(GEOETAReplyUpdateable *)self response];
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

- (GEOETATrafficUpdateResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (GEOETATrafficUpdateErrorInfo)errorInfo
{
  return self->_errorInfo;
}

- (void)setErrorInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorInfo, 0);

  objc_storeStrong((id *)&self->_response, 0);
}

@end