@interface HMAccessoryProfile(AbstractionAdditions)
- (id)hf_accessoryLikeObject;
- (id)hf_accessoryType;
- (id)hf_associatedAccessories;
- (id)hf_containedCharacteristics;
- (id)hf_containedServices;
- (id)hf_moveToRoom:()AbstractionAdditions;
- (id)hf_safeRoom;
- (id)hf_serviceNameComponents;
- (id)hf_setTileSize:()AbstractionAdditions;
- (id)hf_tileSize;
- (id)hf_updateIsFavorite:()AbstractionAdditions;
- (uint64_t)hf_canShowInControlCenter;
- (uint64_t)hf_canSpanMultipleRooms;
- (uint64_t)hf_containedProfiles;
- (uint64_t)hf_effectiveIsFavorite;
- (uint64_t)hf_effectiveShowInHomeDashboard;
- (uint64_t)hf_hasSetFavorite;
- (uint64_t)hf_hasSetShowInHomeDashboard;
- (uint64_t)hf_hasSetVisibleInHomeStatus;
- (uint64_t)hf_isFavorite;
- (uint64_t)hf_isForcedVisibleInHomeStatus;
- (uint64_t)hf_isIdentifiable;
- (uint64_t)hf_isInRoom:()AbstractionAdditions;
- (uint64_t)hf_isMatterOnlyAccessory;
- (uint64_t)hf_isVisibleInHomeStatus;
- (uint64_t)hf_itemClass;
- (uint64_t)hf_showInHomeDashboard;
- (uint64_t)hf_supportsHomeStatus;
- (uint64_t)hf_updateIsVisibleInHomeStatus:()AbstractionAdditions;
- (uint64_t)hf_updateShowInHomeDashboard:()AbstractionAdditions;
@end

@implementation HMAccessoryProfile(AbstractionAdditions)

- (uint64_t)hf_effectiveShowInHomeDashboard
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 3);
}

- (uint64_t)hf_effectiveIsFavorite
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 2);
}

- (id)hf_serviceNameComponents
{
  v1 = [a1 accessory];
  v2 = objc_msgSend(v1, "hf_serviceNameComponents");

  return v2;
}

- (id)hf_associatedAccessories
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = [a1 accessory];
  v3 = objc_msgSend(v1, "na_setWithSafeObject:", v2);

  return v3;
}

- (id)hf_containedServices
{
  if (_MergedGlobals_216 != -1) {
    dispatch_once(&_MergedGlobals_216, &__block_literal_global_186);
  }
  v0 = (void *)qword_26AB2ECE8;
  return v0;
}

- (id)hf_containedCharacteristics
{
  if (qword_26AB2ECF0 != -1) {
    dispatch_once(&qword_26AB2ECF0, &__block_literal_global_190);
  }
  v0 = (void *)qword_26AB2ECF8;
  return v0;
}

- (uint64_t)hf_containedProfiles
{
  return objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", a1);
}

- (id)hf_accessoryLikeObject
{
  return +[HFAccessoryLikeObject _accessoryLikeObjectForObject:a1];
}

- (uint64_t)hf_itemClass
{
  return objc_opt_class();
}

- (id)hf_accessoryType
{
  v1 = [a1 accessory];
  v2 = objc_msgSend(v1, "hf_accessoryType");

  return v2;
}

- (uint64_t)hf_isInRoom:()AbstractionAdditions
{
  id v4 = a3;
  v5 = [a1 accessory];
  v6 = [v5 room];
  v7 = [v6 uniqueIdentifier];
  v8 = [v4 uniqueIdentifier];

  uint64_t v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);
  return v9;
}

- (id)hf_safeRoom
{
  v1 = [a1 accessory];
  v2 = [v1 room];

  return v2;
}

- (uint64_t)hf_canSpanMultipleRooms
{
  return 0;
}

- (uint64_t)hf_isIdentifiable
{
  v2 = [a1 accessory];
  if ([v2 supportsIdentify])
  {
    uint64_t v3 = 1;
  }
  else
  {
    id v4 = [a1 accessory];
    uint64_t v3 = objc_msgSend(v4, "hf_isHomePod");
  }
  return v3;
}

- (uint64_t)hf_canShowInControlCenter
{
  v1 = [a1 accessory];
  uint64_t v2 = objc_msgSend(v1, "hf_showsAsAccessoryInControlCentre");

  return v2;
}

- (uint64_t)hf_isMatterOnlyAccessory
{
  return 0;
}

- (id)hf_moveToRoom:()AbstractionAdditions
{
  id v4 = a3;
  v5 = [a1 accessory];
  v6 = objc_msgSend(v5, "hf_moveToRoom:", v4);

  return v6;
}

- (uint64_t)hf_isFavorite
{
  return objc_msgSend(a1, "hf_isOnForContextType:", 2);
}

- (uint64_t)hf_hasSetFavorite
{
  return objc_msgSend(a1, "hf_hasSetForContextType:", 2);
}

- (id)hf_updateIsFavorite:()AbstractionAdditions
{
  v5 = [a1 accessory];
  int v6 = objc_msgSend(v5, "hf_isCamera");

  if (v6)
  {
    NSLog(&cfstr_AttemptingToUp_0.isa);
    [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    objc_msgSend(a1, "hf_updateValue:forContextType:", a3, 2);
  v7 = };
  return v7;
}

- (uint64_t)hf_supportsHomeStatus
{
  return objc_msgSend(a1, "hf_shouldHideForContextType:", 1) ^ 1;
}

- (uint64_t)hf_isVisibleInHomeStatus
{
  if (objc_msgSend(a1, "hf_isForcedVisibleInHomeStatus")) {
    return 1;
  }
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 1);
}

- (uint64_t)hf_hasSetVisibleInHomeStatus
{
  return objc_msgSend(a1, "hf_hasSetForContextType:", 1);
}

- (uint64_t)hf_isForcedVisibleInHomeStatus
{
  v1 = [a1 accessory];
  uint64_t v2 = objc_msgSend(v1, "hf_isForcedVisibleInHomeStatus");

  return v2;
}

- (uint64_t)hf_updateIsVisibleInHomeStatus:()AbstractionAdditions
{
  return objc_msgSend(a1, "hf_updateValue:forContextType:", a3, 1);
}

- (uint64_t)hf_showInHomeDashboard
{
  return objc_msgSend(a1, "hf_isOnForContextType:", 3);
}

- (uint64_t)hf_hasSetShowInHomeDashboard
{
  return objc_msgSend(a1, "hf_hasSetForContextType:", 3);
}

- (uint64_t)hf_updateShowInHomeDashboard:()AbstractionAdditions
{
  return objc_msgSend(a1, "hf_updateValue:forContextType:", a3, 3);
}

- (id)hf_tileSize
{
  v1 = [a1 accessory];
  uint64_t v2 = +[HFHomeKitObjectSettingsStore tileSizeForObject:v1];

  return v2;
}

- (id)hf_setTileSize:()AbstractionAdditions
{
  id v4 = a3;
  v5 = [a1 accessory];
  int v6 = +[HFHomeKitObjectSettingsStore setTileSize:v4 forObject:v5];

  return v6;
}

@end