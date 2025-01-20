@interface GKPreferences(ScreenTime)
- (id)screenTimePinCallback;
- (uint64_t)activeScreenTimeRemotePinUIWithHandler:()ScreenTime;
- (uint64_t)isScreenTimeRestrictionsPasscodeSet;
- (uint64_t)shouldShowScreenTimePINController;
- (void)screenTimePINControllerDidFinish:()ScreenTime;
- (void)setScreenTimePinCallback:()ScreenTime;
@end

@implementation GKPreferences(ScreenTime)

- (id)screenTimePinCallback
{
  return objc_getAssociatedObject(a1, "_screenTimePinCallback");
}

- (void)setScreenTimePinCallback:()ScreenTime
{
  id v4 = _Block_copy(aBlock);
  objc_setAssociatedObject(a1, "_screenTimePinCallback", v4, (void *)3);
}

- (uint64_t)isScreenTimeRestrictionsPasscodeSet
{
  return [MEMORY[0x1E4F99DA0] isRestrictionsPasscodeSet];
}

- (uint64_t)shouldShowScreenTimePINController
{
  v2 = [MEMORY[0x1E4F637E8] shared];
  if ([v2 isAccountModificationRestricted])
  {
    uint64_t v3 = [a1 isScreenTimeRestrictionsPasscodeSet];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F637E8] shared];
    if ([v4 isAddingFriendsRestricted]) {
      uint64_t v3 = [a1 isScreenTimeRestrictionsPasscodeSet];
    }
    else {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

- (uint64_t)activeScreenTimeRemotePinUIWithHandler:()ScreenTime
{
  objc_msgSend(a1, "setScreenTimePinCallback:");
  v2 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v2 addObserver:a1 selector:sel_screenTimePINControllerDidFinish_ name:*MEMORY[0x1E4F99DB8] object:0 suspensionBehavior:4];

  uint64_t v3 = (void *)MEMORY[0x1E4F99DA0];

  return [v3 activateRemotePINUI];
}

- (void)screenTimePINControllerDidFinish:()ScreenTime
{
  id v10 = a3;
  id v4 = [a1 screenTimePinCallback];

  if (v4)
  {
    v5 = [v10 userInfo];
    v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F99DB0]];
    uint64_t v7 = [v6 BOOLValue];

    v8 = [a1 screenTimePinCallback];
    v8[2](v8, v7);

    [a1 setScreenTimePinCallback:0];
  }
  v9 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v9 removeObserver:a1];
}

@end