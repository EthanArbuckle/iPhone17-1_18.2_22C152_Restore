@interface GEOLocationShiftingFlushCacheRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOLocationShiftingFlushCacheRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOLocationShiftingFlushCacheRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
@end

@implementation GEOLocationShiftingFlushCacheRequest

+ (Class)replyClass
{
  return 0;
}

- (GEOLocationShiftingFlushCacheRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"locationshift.flushDiskCache" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOLocationShiftingFlushCacheRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GEOLocationShiftingFlushCacheRequest;
  v4 = [(GEOXPCRequest *)&v8 initWithXPCDictionary:a3 error:a4];
  v5 = v4;
  if (v4) {
    v6 = v4;
  }

  return v5;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GEOLocationShiftingFlushCacheRequest;
  [(GEOXPCRequest *)&v3 encodeToXPCDictionary:a3];
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 0;
}

@end