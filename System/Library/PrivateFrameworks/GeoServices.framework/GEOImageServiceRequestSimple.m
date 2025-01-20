@interface GEOImageServiceRequestSimple
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOImageServiceRequest)request;
- (GEOImageServiceRequestSimple)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOImageServiceRequestSimple)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSUUID)identifier;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation GEOImageServiceRequestSimple

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOImageServiceRequestSimple)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"ImageService.startImageServiceRequest" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOImageServiceRequestSimple)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOImageServiceRequestSimple;
  v7 = [(GEOXPCRequest *)&v19 initWithXPCDictionary:v6 error:a4];
  if (!v7) {
    goto LABEL_8;
  }
  size_t length = 0;
  data = xpc_dictionary_get_data(v6, "imageServiceRequestData", &length);
  if (data)
  {
    v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
    v10 = [[GEOImageServiceRequest alloc] initWithData:v9];
  }
  else
  {
    uint64_t v17 = xpc_dictionary_get_value(v6, "imageServiceRequestData");
    v9 = (void *)v17;
    if (!v17 || MEMORY[0x18C1213B0](v17) != MEMORY[0x1E4F14580]) {
      goto LABEL_5;
    }
    v10 = objc_alloc_init(GEOImageServiceRequest);
  }
  request = v7->_request;
  v7->_request = v10;

LABEL_5:
  uuid = xpc_dictionary_get_uuid(v6, "identifier");
  if (uuid)
  {
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uuid];
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v13;
  }
  v15 = v7;
LABEL_8:

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOImageServiceRequestSimple;
  [(GEOXPCRequest *)&v8 encodeToXPCDictionary:v4];
  request = self->_request;
  if (request)
  {
    id v6 = [(GEOImageServiceRequest *)request data];
    xpc_dictionary_set_data(v4, "imageServiceRequestData", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
  identifier = self->_identifier;
  if (identifier)
  {
    *(void *)uuid = 0;
    uint64_t v10 = 0;
    [(NSUUID *)identifier getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v4, "identifier", uuid);
  }
}

- (BOOL)isValid
{
  v2 = [(GEOImageServiceRequestSimple *)self request];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)reply
{
  v2 = [(GEOXPCRequest *)self method];
  unint64_t v3 = [v2 hasPrefix:@"start"];

  return v3;
}

- (GEOImageServiceRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end