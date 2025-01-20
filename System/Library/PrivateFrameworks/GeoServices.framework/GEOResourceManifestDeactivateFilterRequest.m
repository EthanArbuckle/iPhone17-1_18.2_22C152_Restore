@interface GEOResourceManifestDeactivateFilterRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOActiveResourceFilter)filter;
- (GEOResourceManifestDeactivateFilterRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOResourceManifestDeactivateFilterRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setFilter:(id)a3;
@end

@implementation GEOResourceManifestDeactivateFilterRequest

+ (Class)replyClass
{
  return 0;
}

- (GEOResourceManifestDeactivateFilterRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"resourcemanifest.deactivateFilter" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOResourceManifestDeactivateFilterRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOResourceManifestDeactivateFilterRequest;
  v7 = [(GEOXPCRequest *)&v16 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v6, "filter", &length);
    if (data)
    {
      v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
      v10 = [[GEOActiveResourceFilter alloc] initWithData:v9];
    }
    else
    {
      uint64_t v14 = xpc_dictionary_get_value(v6, "filter");
      v9 = (void *)v14;
      if (!v14 || MEMORY[0x18C1213B0](v14) != MEMORY[0x1E4F14580]) {
        goto LABEL_5;
      }
      v10 = objc_alloc_init(GEOActiveResourceFilter);
    }
    filter = v7->_filter;
    v7->_filter = v10;

LABEL_5:
    v12 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOResourceManifestDeactivateFilterRequest;
  [(GEOXPCRequest *)&v7 encodeToXPCDictionary:v4];
  filter = self->_filter;
  if (filter)
  {
    id v6 = [(GEOActiveResourceFilter *)filter data];
    xpc_dictionary_set_data(v4, "filter", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 0;
}

- (GEOActiveResourceFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end