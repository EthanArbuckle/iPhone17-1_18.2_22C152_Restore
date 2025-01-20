@interface GEOTransitRouteUpdateReplySimple
- (BOOL)isValid;
- (GEOTransitRouteUpdateReplySimple)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (GEOTransitRouteUpdateResponse)response;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation GEOTransitRouteUpdateReplySimple

- (GEOTransitRouteUpdateReplySimple)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOTransitRouteUpdateReplySimple;
  v7 = [(GEOXPCReply *)&v16 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v6, "transitUpdateResponseData", &length);
    if (data)
    {
      v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
      v10 = [[GEOTransitRouteUpdateResponse alloc] initWithData:v9];
    }
    else
    {
      uint64_t v14 = xpc_dictionary_get_value(v6, "transitUpdateResponseData");
      v9 = (void *)v14;
      if (!v14 || MEMORY[0x18C1213B0](v14) != MEMORY[0x1E4F14580]) {
        goto LABEL_5;
      }
      v10 = objc_alloc_init(GEOTransitRouteUpdateResponse);
    }
    response = v7->_response;
    v7->_response = v10;

LABEL_5:
    v12 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitRouteUpdateReplySimple;
  [(GEOXPCReply *)&v7 encodeToXPCDictionary:v4];
  response = self->_response;
  if (response)
  {
    id v6 = [(GEOTransitRouteUpdateResponse *)response data];
    xpc_dictionary_set_data(v4, "transitUpdateResponseData", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
}

- (BOOL)isValid
{
  v3 = [(GEOTransitRouteUpdateReplySimple *)self response];
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

- (GEOTransitRouteUpdateResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (void).cxx_destruct
{
}

@end