@interface GEOMAResourcePurgeCacheToSizeRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOMAResourcePurgeCacheToSizeRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOMAResourcePurgeCacheToSizeRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (int)urgency;
- (unint64_t)reply;
- (unint64_t)targetSize;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setTargetSize:(unint64_t)a3;
- (void)setUrgency:(int)a3;
@end

@implementation GEOMAResourcePurgeCacheToSizeRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOMAResourcePurgeCacheToSizeRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"MAResources.purgeDiskCache" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOMAResourcePurgeCacheToSizeRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMAResourcePurgeCacheToSizeRequest;
  v7 = [(GEOXPCRequest *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_urgency = xpc_dictionary_get_int64(v6, "urgency");
    v7->_targetSize = xpc_dictionary_get_int64(v6, "targetSize");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOMAResourcePurgeCacheToSizeRequest;
  id v4 = a3;
  [(GEOXPCRequest *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "urgency", self->_urgency);
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

- (int)urgency
{
  return self->_urgency;
}

- (void)setUrgency:(int)a3
{
  self->_urgency = a3;
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