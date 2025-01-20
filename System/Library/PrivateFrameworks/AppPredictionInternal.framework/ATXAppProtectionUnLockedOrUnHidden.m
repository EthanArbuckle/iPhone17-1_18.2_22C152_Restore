@interface ATXAppProtectionUnLockedOrUnHidden
- (ATXAppProtectionUnLockedOrUnHidden)initWithUnLockedApps:(id)a3 unHiddenApps:(id)a4;
- (NSSet)unHiddenApps;
- (NSSet)unLockedApps;
@end

@implementation ATXAppProtectionUnLockedOrUnHidden

- (ATXAppProtectionUnLockedOrUnHidden)initWithUnLockedApps:(id)a3 unHiddenApps:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXAppProtectionUnLockedOrUnHidden;
  v8 = [(ATXAppProtectionUnLockedOrUnHidden *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    unLockedApps = v8->_unLockedApps;
    v8->_unLockedApps = (NSSet *)v9;

    uint64_t v11 = [v7 copy];
    unHiddenApps = v8->_unHiddenApps;
    v8->_unHiddenApps = (NSSet *)v11;
  }
  return v8;
}

- (NSSet)unLockedApps
{
  return self->_unLockedApps;
}

- (NSSet)unHiddenApps
{
  return self->_unHiddenApps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unHiddenApps, 0);
  objc_storeStrong((id *)&self->_unLockedApps, 0);
}

@end