@interface GEOMapSubscriptionSizeEstimationRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOMapRegion)region;
- (GEOMapSubscriptionSizeEstimationRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOMapSubscriptionSizeEstimationRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSUUID)requestUUID;
- (unint64_t)dataTypes;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setDataTypes:(unint64_t)a3;
- (void)setRegion:(id)a3;
- (void)setRequestUUID:(id)a3;
@end

@implementation GEOMapSubscriptionSizeEstimationRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOMapSubscriptionSizeEstimationRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"subscriptions.determineEstimatedSize" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOMapSubscriptionSizeEstimationRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOMapSubscriptionSizeEstimationRequest;
  v7 = [(GEOXPCRequest *)&v19 initWithXPCDictionary:v6 error:a4];
  if (!v7) {
    goto LABEL_8;
  }
  v7->_dataTypes = xpc_dictionary_get_int64(v6, "dataTypes");
  size_t length = 0;
  data = xpc_dictionary_get_data(v6, "region", &length);
  if (data)
  {
    v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
    v10 = [[GEOMapRegion alloc] initWithData:v9];
  }
  else
  {
    uint64_t v17 = xpc_dictionary_get_value(v6, "region");
    v9 = (void *)v17;
    if (!v17 || MEMORY[0x18C1213B0](v17) != MEMORY[0x1E4F14580]) {
      goto LABEL_5;
    }
    v10 = objc_alloc_init(GEOMapRegion);
  }
  region = v7->_region;
  v7->_region = v10;

LABEL_5:
  uuid = xpc_dictionary_get_uuid(v6, "requestUUID");
  if (uuid)
  {
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uuid];
    requestUUID = v7->_requestUUID;
    v7->_requestUUID = (NSUUID *)v13;
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
  v8.super_class = (Class)GEOMapSubscriptionSizeEstimationRequest;
  [(GEOXPCRequest *)&v8 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "dataTypes", self->_dataTypes);
  region = self->_region;
  if (region)
  {
    id v6 = [(GEOMapRegion *)region data];
    xpc_dictionary_set_data(v4, "region", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
  requestUUID = self->_requestUUID;
  if (requestUUID)
  {
    *(void *)uuid = 0;
    uint64_t v10 = 0;
    [(NSUUID *)requestUUID getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v4, "requestUUID", uuid);
  }
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- (unint64_t)dataTypes
{
  return self->_dataTypes;
}

- (void)setDataTypes:(unint64_t)a3
{
  self->_dataTypes = a3;
}

- (GEOMapRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestUUID, 0);

  objc_storeStrong((id *)&self->_region, 0);
}

@end