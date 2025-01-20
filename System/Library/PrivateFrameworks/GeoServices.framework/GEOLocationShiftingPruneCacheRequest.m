@interface GEOLocationShiftingPruneCacheRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOLocationShiftingPruneCacheRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOLocationShiftingPruneCacheRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
@end

@implementation GEOLocationShiftingPruneCacheRequest

+ (Class)replyClass
{
  return 0;
}

- (GEOLocationShiftingPruneCacheRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"locationshift.pruneDiskCache" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOLocationShiftingPruneCacheRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GEOLocationShiftingPruneCacheRequest;
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
  v3.super_class = (Class)GEOLocationShiftingPruneCacheRequest;
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