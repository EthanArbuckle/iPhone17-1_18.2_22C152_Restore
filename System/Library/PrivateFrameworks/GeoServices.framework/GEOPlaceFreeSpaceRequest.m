@interface GEOPlaceFreeSpaceRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOPlaceFreeSpaceRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOPlaceFreeSpaceRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)freeBytes;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setFreeBytes:(unint64_t)a3;
@end

@implementation GEOPlaceFreeSpaceRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOPlaceFreeSpaceRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"placedata.shrinkBySize" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOPlaceFreeSpaceRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOPlaceFreeSpaceRequest;
  v7 = [(GEOXPCRequest *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_freeBytes = xpc_dictionary_get_int64(v6, "sz");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOPlaceFreeSpaceRequest;
  id v4 = a3;
  [(GEOXPCRequest *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "sz", self->_freeBytes);
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- (unint64_t)freeBytes
{
  return self->_freeBytes;
}

- (void)setFreeBytes:(unint64_t)a3
{
  self->_freeBytes = a3;
}

@end