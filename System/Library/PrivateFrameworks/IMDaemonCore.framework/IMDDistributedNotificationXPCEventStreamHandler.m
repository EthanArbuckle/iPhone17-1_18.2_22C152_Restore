@interface IMDDistributedNotificationXPCEventStreamHandler
+ (id)sharedInstance;
- (IMDDistributedNotificationXPCEventStreamHandler)init;
- (IMDDistributedNotificationXPCEventStreamHandler)initWithEventStreamName:(const char *)a3;
@end

@implementation IMDDistributedNotificationXPCEventStreamHandler

+ (id)sharedInstance
{
  if (qword_1EBE2BA80 != -1) {
    dispatch_once(&qword_1EBE2BA80, &unk_1F3390980);
  }
  v2 = (void *)qword_1EBE2BB18;

  return v2;
}

- (IMDDistributedNotificationXPCEventStreamHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)IMDDistributedNotificationXPCEventStreamHandler;
  return [(IMDXPCEventStreamHandler *)&v3 initWithEventStreamName:"com.apple.distnoted.matching"];
}

- (IMDDistributedNotificationXPCEventStreamHandler)initWithEventStreamName:(const char *)a3
{
  return 0;
}

@end