@interface IMUnlockMonitor
+ (id)sharedInstance;
- (BOOL)hasReceivedFirstUnlockNotification;
- (BOOL)isSystemLocked;
- (BOOL)isUnderFirstDataProtectionLock;
- (IMUnlockMonitor)init;
- (void)addListener:(id)a3;
- (void)removeListener:(id)a3;
@end

@implementation IMUnlockMonitor

- (BOOL)isUnderFirstDataProtectionLock
{
  v2 = self;
  BOOL v3 = sub_1A077D838();

  return v3;
}

+ (id)sharedInstance
{
  if (qword_1EB4A59A8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB4A59D8;

  return v2;
}

- (IMUnlockMonitor)init
{
  return (IMUnlockMonitor *)sub_1A078088C();
}

- (void)addListener:(id)a3
{
}

- (BOOL)hasReceivedFirstUnlockNotification
{
  v2 = self;
  char v3 = sub_1A0954BE4();

  return v3 & 1;
}

- (BOOL)isSystemLocked
{
  v2 = self;
  char v3 = sub_1A0954CD4();

  return v3 & 1;
}

- (void)removeListener:(id)a3
{
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end