@interface NSXPCInterface(HMUserManagementRemoteProtocols)
+ (uint64_t)hm_userManagementRemoteHostInterface;
+ (uint64_t)hm_userManagementRemoteServiceInterface;
@end

@implementation NSXPCInterface(HMUserManagementRemoteProtocols)

+ (uint64_t)hm_userManagementRemoteHostInterface
{
  return [a1 interfaceWithProtocol:&unk_1EEF181D8];
}

+ (uint64_t)hm_userManagementRemoteServiceInterface
{
  return [a1 interfaceWithProtocol:&unk_1EEF706E0];
}

@end