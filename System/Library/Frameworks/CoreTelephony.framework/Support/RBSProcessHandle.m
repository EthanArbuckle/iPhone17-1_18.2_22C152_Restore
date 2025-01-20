@interface RBSProcessHandle
- (BOOL)ct_isLaunchAngel;
- (NSString)ct_processType;
@end

@implementation RBSProcessHandle

- (BOOL)ct_isLaunchAngel
{
  v2 = [(RBSProcessHandle *)self ct_processType];
  unsigned __int8 v3 = [v2 isEqualToString:@"angel"];

  return v3;
}

- (NSString)ct_processType
{
  if ([(RBSProcessHandle *)self isDaemon]) {
    return (NSString *)@"daemon";
  }
  if ([(RBSProcessHandle *)self isApplication]) {
    return (NSString *)@"application";
  }
  if ([(RBSProcessHandle *)self isXPCService]) {
    return (NSString *)@"xpc-service";
  }
  if ([(RBSProcessHandle *)self hasConsistentLaunchdJob]) {
    return (NSString *)@"angel";
  }
  return (NSString *)@"unknown";
}

@end