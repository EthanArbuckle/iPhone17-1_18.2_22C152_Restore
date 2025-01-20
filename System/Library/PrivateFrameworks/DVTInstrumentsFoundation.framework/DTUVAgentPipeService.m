@interface DTUVAgentPipeService
+ (void)registerCapabilities:(id)a3;
- (id)createExternalService:(id)a3 error:(id *)a4;
@end

@implementation DTUVAgentPipeService

+ (void)registerCapabilities:(id)a3
{
}

- (id)createExternalService:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = DTUVSharedServiceFactory(a4);
  v7 = (void *)[v6 newAgentPipeService:v5 error:a4];

  return v7;
}

@end