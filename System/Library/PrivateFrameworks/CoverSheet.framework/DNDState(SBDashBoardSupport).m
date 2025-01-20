@interface DNDState(SBDashBoardSupport)
- (BOOL)_isDNDSettingEnabled:()SBDashBoardSupport;
- (uint64_t)sb_isBedtimeModeActive;
- (uint64_t)sb_isDimmingModeActive;
- (uint64_t)sb_isDrivingModeActive;
@end

@implementation DNDState(SBDashBoardSupport)

- (uint64_t)sb_isDimmingModeActive
{
  v2 = [a1 activeModeConfiguration];
  uint64_t v3 = objc_msgSend(a1, "_isDNDSettingEnabled:", objc_msgSend(v2, "dimsLockScreen"));

  return v3;
}

- (uint64_t)sb_isDrivingModeActive
{
  v1 = [a1 activeModeIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.donotdisturb.mode.driving"];

  return v2;
}

- (uint64_t)sb_isBedtimeModeActive
{
  v1 = [a1 activeModeIdentifier];
  if (([v1 isEqualToString:@"com.apple.donotdisturb.mode.bedtime"] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x1E4FA5460]] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:*MEMORY[0x1E4F78AA0]];
  }

  return v2;
}

- (BOOL)_isDNDSettingEnabled:()SBDashBoardSupport
{
  return DNDResolvedDimsLockScreenSetting() == 2;
}

@end