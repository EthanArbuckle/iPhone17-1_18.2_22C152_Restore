@interface ECPOPAccount
+ (id)standardPorts;
+ (id)standardSSLPorts;
- (BOOL)daysAfterDownloadToDeleteMessagesFromServerIsSet;
- (BOOL)hasNotFinishedFirstTimeSync;
- (int64_t)bigMessageWarningSize;
- (int64_t)daysAfterDownloadToDeleteMessagesFromServer;
- (int64_t)defaultPortNumber;
- (int64_t)defaultSecurePortNumber;
- (int64_t)deletionPolicy;
- (void)setBigMessageWarningSize:(int64_t)a3;
- (void)setDaysAfterDownloadToDeleteMessagesFromServer:(int64_t)a3;
- (void)setDeletionPolicy:(int64_t)a3;
- (void)setHasNotFinishedFirstTimeSync:(BOOL)a3;
@end

@implementation ECPOPAccount

- (int64_t)bigMessageWarningSize
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"BigMessageWarningSize"];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)setBigMessageWarningSize:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

- (int64_t)daysAfterDownloadToDeleteMessagesFromServer
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"DaysAfterDownloadToDeleteMessagesFromServer"];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)setDaysAfterDownloadToDeleteMessagesFromServer:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

- (BOOL)daysAfterDownloadToDeleteMessagesFromServerIsSet
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"DaysAfterDownloadToDeleteMessagesFromServer"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (int64_t)deletionPolicy
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"DeletionPolicy"];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)setDeletionPolicy:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

- (BOOL)hasNotFinishedFirstTimeSync
{
  v2 = [(ECAccount *)self dataclassProperties];
  v3 = [v2 objectForKeyedSubscript:@"HasNotFinishedFirstTimeSync"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setHasNotFinishedFirstTimeSync:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");
}

+ (id)standardPorts
{
  return &unk_1F1A731B8;
}

+ (id)standardSSLPorts
{
  return &unk_1F1A731D0;
}

- (int64_t)defaultPortNumber
{
  return 110;
}

- (int64_t)defaultSecurePortNumber
{
  return 995;
}

@end