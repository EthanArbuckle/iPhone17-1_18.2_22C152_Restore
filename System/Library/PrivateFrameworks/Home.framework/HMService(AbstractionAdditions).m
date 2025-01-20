@interface HMService(AbstractionAdditions)
- (Class)hf_itemClass;
- (id)hf_accessoryLikeObject;
- (id)hf_accessoryType;
- (id)hf_associatedAccessories;
- (id)hf_containedCharacteristics;
- (id)hf_containedProfiles;
- (id)hf_moveToRoom:()AbstractionAdditions;
- (id)hf_safeRoom;
- (id)hf_setTileSize:()AbstractionAdditions;
- (id)hf_tileSize;
- (uint64_t)hf_canSpanMultipleRooms;
- (uint64_t)hf_containedServices;
- (uint64_t)hf_effectiveIsFavorite;
- (uint64_t)hf_effectiveShowInHomeDashboard;
- (uint64_t)hf_hasSetFavorite;
- (uint64_t)hf_hasSetShowInHomeDashboard;
- (uint64_t)hf_hasSetVisibleInHomeStatus;
- (uint64_t)hf_isFavorite;
- (uint64_t)hf_isIdentifiable;
- (uint64_t)hf_isInRoom:()AbstractionAdditions;
- (uint64_t)hf_isMatterOnlyAccessory;
- (uint64_t)hf_isVisibleInHomeStatus;
- (uint64_t)hf_showInHomeDashboard;
- (uint64_t)hf_supportsHomeStatus;
- (uint64_t)hf_updateIsFavorite:()AbstractionAdditions;
- (uint64_t)hf_updateIsVisibleInHomeStatus:()AbstractionAdditions;
- (uint64_t)hf_updateShowInHomeDashboard:()AbstractionAdditions;
@end

@implementation HMService(AbstractionAdditions)

- (uint64_t)hf_effectiveShowInHomeDashboard
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 3);
}

- (uint64_t)hf_effectiveIsFavorite
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 2);
}

- (id)hf_accessoryType
{
  return +[HFAccessoryType serviceTypeWithService:a1];
}

- (id)hf_tileSize
{
  return +[HFHomeKitObjectSettingsStore tileSizeForObject:a1];
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

- (uint64_t)hf_hasSetFavorite
{
  return objc_msgSend(a1, "hf_hasSetForContextType:", 2);
}

- (uint64_t)hf_canSpanMultipleRooms
{
  return 0;
}

- (id)hf_accessoryLikeObject
{
  return +[HFAccessoryLikeObject _accessoryLikeObjectForObject:a1];
}

- (uint64_t)hf_supportsHomeStatus
{
  return objc_msgSend(a1, "hf_shouldHideForContextType:", 1) ^ 1;
}

- (Class)hf_itemClass
{
  return +[HFServiceItem itemClassForService:a1];
}

- (uint64_t)hf_containedServices
{
  return [MEMORY[0x263EFFA08] setWithObject:a1];
}

- (id)hf_containedProfiles
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [a1 accessory];
  v4 = [v3 profiles];
  v5 = [v2 setWithArray:v4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__HMService_AbstractionAdditions__hf_containedProfiles__block_invoke;
  v8[3] = &unk_26408E240;
  v8[4] = a1;
  v6 = objc_msgSend(v5, "na_filter:", v8);

  return v6;
}

- (id)hf_associatedAccessories
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = [a1 accessory];
  v3 = objc_msgSend(v1, "na_setWithSafeObject:", v2);

  return v3;
}

- (uint64_t)hf_isInRoom:()AbstractionAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "hf_parentRoom");
  v6 = [v5 uniqueIdentifier];
  v7 = [v4 uniqueIdentifier];

  uint64_t v8 = objc_msgSend(v6, "hmf_isEqualToUUID:", v7);
  return v8;
}

- (id)hf_containedCharacteristics
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = [a1 characteristics];
  v3 = [v1 setWithArray:v2];

  return v3;
}

- (id)hf_safeRoom
{
  v1 = [a1 accessory];
  v2 = [v1 room];

  return v2;
}

- (uint64_t)hf_isIdentifiable
{
  v1 = [a1 accessory];
  uint64_t v2 = [v1 supportsIdentify];

  return v2;
}

- (uint64_t)hf_isMatterOnlyAccessory
{
  return 0;
}

- (id)hf_moveToRoom:()AbstractionAdditions
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F58190];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__HMService_AbstractionAdditions__hf_moveToRoom___block_invoke;
  v9[3] = &unk_26408E218;
  v9[4] = a1;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 futureWithErrorOnlyHandlerAdapterBlock:v9];

  return v7;
}

- (uint64_t)hf_isFavorite
{
  return objc_msgSend(a1, "hf_isOnForContextType:", 2);
}

- (uint64_t)hf_updateIsFavorite:()AbstractionAdditions
{
  return objc_msgSend(a1, "hf_updateValue:forContextType:", a3, 2);
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

- (id)hf_setTileSize:()AbstractionAdditions
{
  return +[HFHomeKitObjectSettingsStore setTileSize:a3 forObject:a1];
}

@end