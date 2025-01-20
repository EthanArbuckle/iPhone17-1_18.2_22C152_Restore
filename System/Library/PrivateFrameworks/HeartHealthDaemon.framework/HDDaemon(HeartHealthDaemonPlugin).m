@interface HDDaemon(HeartHealthDaemonPlugin)
- (id)heartDaemonExtension;
@end

@implementation HDDaemon(HeartHealthDaemonPlugin)

- (id)heartDaemonExtension
{
  v4 = [a1 daemonExtensionWithIdentifier:*MEMORY[0x1E4F67D70]];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HDHeartDaemonExtension.m" lineNumber:71 description:@"Health Heart Daemon Extension should not be nil"];
  }

  return v4;
}

@end