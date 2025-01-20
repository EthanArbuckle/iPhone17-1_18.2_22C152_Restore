@interface CDDCloudKitScheduledActivity
+ (NSString)entityName;
- (id)xpcActivityCriteria;
- (unint64_t)activityType;
- (void)populateFromCriteria:(id)a3;
- (void)setActivityType:(unint64_t)a3;
@end

@implementation CDDCloudKitScheduledActivity

+ (NSString)entityName
{
  return (NSString *)@"CDDCloudKitScheduledActivity";
}

- (unint64_t)activityType
{
  v2 = (void *)[(CDDCloudKitScheduledActivity *)self activityTypeNum];

  return [v2 unsignedIntegerValue];
}

- (void)setActivityType:(unint64_t)a3
{
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];

  [(CDDCloudKitScheduledActivity *)self setActivityTypeNum:v4];
}

- (void)populateFromCriteria:(id)a3
{
  uint64_t v4 = objc_msgSend(a3, "objectForKey:", objc_msgSend(NSString, "stringWithUTF8String:", *MEMORY[0x1E4F14360]));
  if (v4 && (v5 = v4, xpc_BOOL_get_value(v4)))
  {
    if (!xpc_BOOL_get_value(v5)) {
      return;
    }
    uint64_t v6 = MEMORY[0x1E4F1CC38];
  }
  else
  {
    uint64_t v6 = MEMORY[0x1E4F1CC28];
  }

  [(CDDCloudKitScheduledActivity *)self setIsUserRequestedBackupTask:v6];
}

- (id)xpcActivityCriteria
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  LODWORD(self) = objc_msgSend((id)-[CDDCloudKitScheduledActivity isUserRequestedBackupTask](self, "isUserRequestedBackupTask"), "BOOLValue");
  uint64_t v4 = [NSString stringWithUTF8String:*MEMORY[0x1E4F14360]];
  if (self) {
    uint64_t v5 = MEMORY[0x1E4F14518];
  }
  else {
    uint64_t v5 = MEMORY[0x1E4F14510];
  }
  [v3 setObject:v5 forKey:v4];
  uint64_t v6 = (void *)[v3 copy];

  return v6;
}

@end