@interface DKReportingConcurrentRequest
+ (id)concurrentRequestWithGenerator:(id)a3;
- (DKExtensionAdapter)generator;
- (DKReportingConcurrentRequest)initWithGenerator:(id)a3;
- (NSMutableSet)manifest;
- (void)setGenerator:(id)a3;
- (void)setManifest:(id)a3;
@end

@implementation DKReportingConcurrentRequest

- (DKReportingConcurrentRequest)initWithGenerator:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DKReportingConcurrentRequest;
  v6 = [(DKReportingConcurrentRequest *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_generator, a3);
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    manifest = v7->_manifest;
    v7->_manifest = (NSMutableSet *)v8;
  }
  return v7;
}

+ (id)concurrentRequestWithGenerator:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithGenerator:v4];

  return v5;
}

- (DKExtensionAdapter)generator
{
  return self->_generator;
}

- (void)setGenerator:(id)a3
{
}

- (NSMutableSet)manifest
{
  return self->_manifest;
}

- (void)setManifest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_generator, 0);
}

@end