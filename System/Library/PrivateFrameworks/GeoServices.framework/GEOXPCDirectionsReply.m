@interface GEOXPCDirectionsReply
- (BOOL)isValid;
- (GEODirectionsError)directionsError;
- (GEODirectionsResponse)directionsResponse;
- (GEOXPCDirectionsReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setDirectionsError:(id)a3;
- (void)setDirectionsResponse:(id)a3;
@end

@implementation GEOXPCDirectionsReply

- (GEOXPCDirectionsReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOXPCDirectionsReply;
  v7 = [(GEOXPCReply *)&v20 initWithXPCDictionary:v6 error:a4];
  if (!v7) {
    goto LABEL_8;
  }
  size_t length = 0;
  data = xpc_dictionary_get_data(v6, "responseData", &length);
  if (data)
  {
    v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
    v10 = [[GEODirectionsResponse alloc] initWithData:v9];
  }
  else
  {
    uint64_t v18 = xpc_dictionary_get_value(v6, "responseData");
    v9 = (void *)v18;
    if (!v18 || MEMORY[0x18C1213B0](v18) != MEMORY[0x1E4F14580]) {
      goto LABEL_5;
    }
    v10 = objc_alloc_init(GEODirectionsResponse);
  }
  directionsResponse = v7->_directionsResponse;
  v7->_directionsResponse = v10;

LABEL_5:
  size_t length = 0;
  v12 = xpc_dictionary_get_data(v6, "directionsError", &length);
  if (v12)
  {
    v13 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v12 length:length freeWhenDone:0];
    uint64_t v14 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v13 error:a4];
    directionsError = v7->_directionsError;
    v7->_directionsError = (GEODirectionsError *)v14;
  }
  v16 = v7;
LABEL_8:

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOXPCDirectionsReply;
  [(GEOXPCReply *)&v9 encodeToXPCDictionary:v4];
  directionsResponse = self->_directionsResponse;
  if (directionsResponse)
  {
    id v6 = [(GEODirectionsResponse *)directionsResponse data];
    xpc_dictionary_set_data(v4, "responseData", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
  directionsError = self->_directionsError;
  if (directionsError)
  {
    id v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:directionsError requiringSecureCoding:1 error:0];
    xpc_dictionary_set_data(v4, "directionsError", (const void *)[v8 bytes], objc_msgSend(v8, "length"));
  }
}

- (BOOL)isValid
{
  return 1;
}

- (GEODirectionsResponse)directionsResponse
{
  return self->_directionsResponse;
}

- (void)setDirectionsResponse:(id)a3
{
}

- (GEODirectionsError)directionsError
{
  return self->_directionsError;
}

- (void)setDirectionsError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsError, 0);

  objc_storeStrong((id *)&self->_directionsResponse, 0);
}

@end