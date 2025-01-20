@interface NSXPCConnection(LNConnection)
- (void)ln_configureWithBundleIdentifier:()LNConnection interface:;
@end

@implementation NSXPCConnection(LNConnection)

- (void)ln_configureWithBundleIdentifier:()LNConnection interface:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"LNConnection.m", 1045, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  [a1 setRemoteObjectInterface:v8];
  v11 = @"bundleIdentifier";
  v12[0] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [a1 setUserInfo:v9];
}

@end