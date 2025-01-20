@interface CRKResourcesServiceTransportProvider
- (void)fetchTransportWithCompletion:(id)a3;
@end

@implementation CRKResourcesServiceTransportProvider

- (void)fetchTransportWithCompletion:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08D68];
  v4 = (void (**)(id, void *, void))a3;
  id v6 = (id)[[v3 alloc] initWithServiceName:@"com.apple.ClassroomKit.ResourcesService"];
  v5 = (void *)[objc_alloc(MEMORY[0x263F39CE8]) initWithXPCConnection:v6];
  v4[2](v4, v5, 0);
}

@end