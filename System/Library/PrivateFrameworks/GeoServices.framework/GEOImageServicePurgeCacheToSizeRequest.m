@interface GEOImageServicePurgeCacheToSizeRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOImageServicePurgeCacheToSizeRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOImageServicePurgeCacheToSizeRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)reply;
- (unint64_t)targetSize;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setTargetSize:(unint64_t)a3;
@end

@implementation GEOImageServicePurgeCacheToSizeRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOImageServicePurgeCacheToSizeRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"ImageService.purgeDiskCache" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOImageServicePurgeCacheToSizeRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOImageServicePurgeCacheToSizeRequest;
  v7 = [(GEOXPCRequest *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_targetSize = xpc_dictionary_get_int64(v6, "targetSize");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOImageServicePurgeCacheToSizeRequest;
  id v4 = a3;
  [(GEOXPCRequest *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "targetSize", self->_targetSize);
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- (unint64_t)targetSize
{
  return self->_targetSize;
}

- (void)setTargetSize:(unint64_t)a3
{
  self->_targetSize = a3;
}

@end