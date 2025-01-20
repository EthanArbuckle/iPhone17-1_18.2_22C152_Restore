@interface FOAgentConnectionPrivate
+ (id)newConnection;
+ (id)newInterface;
@end

@implementation FOAgentConnectionPrivate

+ (id)newConnection
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.FamilyControlsAgent.private" options:4096];
  v4 = (void *)[a1 newInterface];
  [v3 setRemoteObjectInterface:v4];

  return v3;
}

+ (id)newInterface
{
  return (id)objc_claimAutoreleasedReturnValue();
}

@end