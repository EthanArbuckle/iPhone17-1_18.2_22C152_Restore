@interface IMDLocalDaemon
+ (IMLocalDaemonProtocol)sharedDaemon;
+ (void)setSharedDaemon:(id)a3;
@end

@implementation IMDLocalDaemon

+ (IMLocalDaemonProtocol)sharedDaemon
{
  return (IMLocalDaemonProtocol *)(id)qword_1EBE2BE10;
}

+ (void)setSharedDaemon:(id)a3
{
}

@end