@interface ATXAppProtectionLockedOrHidden
- (ATXAppProtectionLockedOrHidden)initWithLockedApps:(id)a3 hiddenApps:(id)a4;
- (NSSet)hiddenApps;
- (NSSet)lockedApps;
@end

@implementation ATXAppProtectionLockedOrHidden

- (ATXAppProtectionLockedOrHidden)initWithLockedApps:(id)a3 hiddenApps:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXAppProtectionLockedOrHidden;
  v8 = [(ATXAppProtectionLockedOrHidden *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    lockedApps = v8->_lockedApps;
    v8->_lockedApps = (NSSet *)v9;

    uint64_t v11 = [v7 copy];
    hiddenApps = v8->_hiddenApps;
    v8->_hiddenApps = (NSSet *)v11;
  }
  return v8;
}

- (NSSet)lockedApps
{
  return self->_lockedApps;
}

- (NSSet)hiddenApps
{
  return self->_hiddenApps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenApps, 0);
  objc_storeStrong((id *)&self->_lockedApps, 0);
}

@end