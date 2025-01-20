@interface GEOPlaceByIdentifiersRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOPlaceByIdentifiersRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOPlaceByIdentifiersRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSArray)identifiers;
- (NSUUID)requestUUID;
- (int)resultProvider;
- (unint64_t)options;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setRequestUUID:(id)a3;
- (void)setResultProvider:(int)a3;
@end

@implementation GEOPlaceByIdentifiersRequest

- (void)encodeToXPCDictionary:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOPlaceByIdentifiersRequest;
  [(GEOXPCRequest *)&v7 encodeToXPCDictionary:v4];
  requestUUID = self->_requestUUID;
  if (requestUUID)
  {
    *(void *)uuid = 0;
    uint64_t v9 = 0;
    [(NSUUID *)requestUUID getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v4, "requestUUID", uuid);
  }
  if ([(NSArray *)self->_identifiers count])
  {
    id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_identifiers requiringSecureCoding:1 error:0];
    xpc_dictionary_set_data(v4, "identifiers", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
  xpc_dictionary_set_int64(v4, "resultProvider", self->_resultProvider);
  xpc_dictionary_set_int64(v4, "options", self->_options);
}

- (unint64_t)reply
{
  return 1;
}

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setResultProvider:(int)a3
{
  self->_resultProvider = a3;
}

- (void)setRequestUUID:(id)a3
{
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)setIdentifiers:(id)a3
{
}

- (GEOPlaceByIdentifiersRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"placedata.requestMUIDs" traits:a3 auditToken:a4 throttleToken:a5];
}

- (BOOL)isValid
{
  v3 = [(GEOPlaceByIdentifiersRequest *)self requestUUID];
  if (v3)
  {
    id v4 = [(GEOPlaceByIdentifiersRequest *)self identifiers];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);

  objc_storeStrong((id *)&self->_requestUUID, 0);
}

- (int)resultProvider
{
  return self->_resultProvider;
}

- (unint64_t)options
{
  return self->_options;
}

- (GEOPlaceByIdentifiersRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)GEOPlaceByIdentifiersRequest;
  objc_super v7 = [(GEOXPCRequest *)&v22 initWithXPCDictionary:v6 error:a4];
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
    data = xpc_dictionary_get_data(v6, "identifiers", &length);
    if (data)
    {
      v12 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
      v13 = (void *)MEMORY[0x1E4F28DC0];
      v14 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v15 = objc_opt_class();
      v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
      uint64_t v17 = [v13 unarchivedObjectOfClasses:v16 fromData:v12 error:a4];
      identifiers = v7->_identifiers;
      v7->_identifiers = (NSArray *)v17;
    }
    v7->_resultProvider = xpc_dictionary_get_int64(v6, "resultProvider");
    v7->_options = xpc_dictionary_get_int64(v6, "options");
    v19 = v7;
  }

  return v7;
}

@end