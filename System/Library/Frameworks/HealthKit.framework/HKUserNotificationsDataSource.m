@interface HKUserNotificationsDataSource
- (BOOL)areNotificationsAuthorizedWithBundleIdentifier:(id)a3;
@end

@implementation HKUserNotificationsDataSource

- (BOOL)areNotificationsAuthorizedWithBundleIdentifier:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F44680];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4];

  v6 = [v5 notificationSettings];
  uint64_t v7 = [v6 authorizationStatus];

  BOOL v9 = v7 == 4 || (v7 & 0xFFFFFFFFFFFFFFFELL) == 2;
  return v9;
}

@end