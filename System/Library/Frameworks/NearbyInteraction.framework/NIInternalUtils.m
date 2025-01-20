@interface NIInternalUtils
+ (BOOL)isIntValidAntennaDiversityOverride:(int64_t)a3;
+ (BOOL)isIntValidNearbyObjectUpdateRate:(int64_t)a3;
+ (BOOL)isIntValidRelationshipSpecifier:(int64_t)a3;
+ (BOOL)nearbyObjectUpdateRate:(int64_t)a3 isGreaterThan:(int64_t)a4;
+ (const)AntennaDiversityOverrideToString:(int64_t)a3;
+ (const)NINearbyObjectUpdateRateToShortString:(int64_t)a3;
+ (const)NINearbyObjectUpdateRateToString:(int64_t)a3;
+ (const)NIRelationshipSpecifierToString:(unint64_t)a3;
+ (const)NISessionBackgroundModeToString:(int64_t)a3;
+ (id)NISystemPassiveAccessIntentToString:(unsigned int)a3;
+ (id)NISystemResourceAvailabilityToString:(unint64_t)a3;
@end

@implementation NIInternalUtils

+ (const)NIRelationshipSpecifierToString:(unint64_t)a3
{
  if (a3 > 0xF) {
    return "N/A";
  }
  else {
    return off_1E5AC23A0[a3];
  }
}

+ (BOOL)isIntValidRelationshipSpecifier:(int64_t)a3
{
  return (unint64_t)a3 < 0x10;
}

+ (const)AntennaDiversityOverrideToString:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return "N/A";
  }
  else {
    return off_1E5AC2420[a3];
  }
}

+ (BOOL)isIntValidAntennaDiversityOverride:(int64_t)a3
{
  return (unint64_t)a3 < 3;
}

+ (BOOL)isIntValidNearbyObjectUpdateRate:(int64_t)a3
{
  return (unint64_t)a3 < 4;
}

+ (BOOL)nearbyObjectUpdateRate:(int64_t)a3 isGreaterThan:(int64_t)a4
{
  unsigned int v4 = (9u >> (a4 & 0xF)) & 1;
  if ((unint64_t)a4 >= 4) {
    LOBYTE(v4) = 0;
  }
  BOOL v5 = (a4 & 0xF) == 3;
  if ((unint64_t)a4 >= 4) {
    BOOL v5 = 0;
  }
  if (a3) {
    BOOL v5 = 0;
  }
  if (a3 == 1) {
    BOOL v5 = v4;
  }
  BOOL v6 = a3 == 2 || v5;
  return a3 != a4 && v6;
}

+ (const)NISessionBackgroundModeToString:(int64_t)a3
{
  if ((unint64_t)a3 >= 3) {
    +[NIInternalUtils NISessionBackgroundModeToString:]();
  }
  return off_1E5AC2438[a3];
}

+ (const)NINearbyObjectUpdateRateToString:(int64_t)a3
{
  if ((unint64_t)a3 >= 4) {
    +[NIInternalUtils NINearbyObjectUpdateRateToString:]();
  }
  return off_1E5AC2450[a3];
}

+ (const)NINearbyObjectUpdateRateToShortString:(int64_t)a3
{
  if ((unint64_t)a3 >= 4) {
    +[NIInternalUtils NINearbyObjectUpdateRateToShortString:]();
  }
  return off_1E5AC2470[a3];
}

+ (id)NISystemResourceAvailabilityToString:(unint64_t)a3
{
  unsigned int v4 = (void *)MEMORY[0x1A623D8C0](a1, a2);
  if (a3)
  {
    BOOL v5 = [MEMORY[0x1E4F28E78] stringWithString:@"Unavailable:"];
    BOOL v6 = v5;
    if (a3) {
      [v5 appendString:@"AirplaneMode|"];
    }
    if ((a3 & 2) != 0) {
      [v6 appendString:@"GeographicalRegion|"];
    }
    if ((a3 & 4) != 0) {
      [v6 appendString:@"RecoveringFromError|"];
    }
    if ((a3 & 8) != 0) {
      [v6 appendString:@"NotReady|"];
    }
    if ((a3 & 0x10) != 0) {
      [v6 appendString:@"Unsupported|"];
    }
    objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = @"Available";
  }

  return v7;
}

+ (id)NISystemPassiveAccessIntentToString:(unsigned int)a3
{
  unsigned int v4 = (void *)MEMORY[0x1A623D8C0](a1, a2);
  if (a3)
  {
    BOOL v5 = [MEMORY[0x1E4F28E78] stringWithString:@"Intent:"];
    BOOL v6 = v5;
    if (a3) {
      [v5 appendString:@"WristRaise|"];
    }
    if ((a3 & 2) != 0) {
      [v6 appendString:@"GeofenceEntry|"];
    }
    if ((a3 & 4) != 0) {
      [v6 appendString:@"WalletInteraction|"];
    }
    objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = @"NoIntent";
  }

  return v7;
}

+ (void)NISessionBackgroundModeToString:.cold.1()
{
}

+ (void)NINearbyObjectUpdateRateToString:.cold.1()
{
}

+ (void)NINearbyObjectUpdateRateToShortString:.cold.1()
{
}

@end