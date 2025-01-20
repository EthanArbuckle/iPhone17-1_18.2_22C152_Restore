@interface _FAFamilyCircleRequestConnectionFactory
- (id)createServiceConnectionWithInterruptionHandler:(id)a3 invalidationHandler:(id)a4;
@end

@implementation _FAFamilyCircleRequestConnectionFactory

- (id)createServiceConnectionWithInterruptionHandler:(id)a3 invalidationHandler:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F29268];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithMachServiceName:@"com.apple.familycircle.agent" options:4096];
  v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2954170];
  [v8 setRemoteObjectInterface:v9];
  [v8 setInterruptionHandler:v7];

  [v8 setInvalidationHandler:v6];
  return v8;
}

@end