@interface APSProcessModePreferences
- (APSProcessModePreferences)initWithUser:(id)a3;
- (APSUser)user;
- (NSDictionary)defaultUserPersistentTopics;
- (NSDictionary)persistentTopics;
- (NSDictionary)tokenTopics;
- (void)setDefaultUserPersistentTopics:(id)a3;
- (void)setPersistentTopics:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation APSProcessModePreferences

- (APSProcessModePreferences)initWithUser:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)APSProcessModePreferences;
  result = [(APSProcessModePreferences *)&v5 init];
  if (result) {
    result->_user = (APSUser *)a3;
  }
  return result;
}

- (NSDictionary)defaultUserPersistentTopics
{
  v2 = (void *)sub_10007E420(APSPersistentTopicsKey, 1);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (void)setDefaultUserPersistentTopics:(id)a3
{
  sub_10007E524(APSPersistentTopicsKey, a3, 1);
  int v4 = [(APSUser *)self->_user isDefaultUser];
  sub_10007E648(v4);
}

- (NSDictionary)persistentTopics
{
  v2 = (void *)sub_10007E420(APSPersistentTopicsKey, [(APSUser *)self->_user isDefaultUser]);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (void)setPersistentTopics:(id)a3
{
  CFStringRef v4 = (const __CFString *)APSPersistentTopicsKey;
  user = self->_user;
  id v6 = a3;
  sub_10007E524(v4, v6, [(APSUser *)user isDefaultUser]);

  int v7 = [(APSUser *)self->_user isDefaultUser];
  sub_10007E648(v7);
}

- (NSDictionary)tokenTopics
{
  return 0;
}

- (APSUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
  self->_user = (APSUser *)a3;
}

@end