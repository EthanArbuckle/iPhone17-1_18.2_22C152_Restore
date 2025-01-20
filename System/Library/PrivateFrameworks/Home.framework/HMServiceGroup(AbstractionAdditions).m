@interface HMServiceGroup(AbstractionAdditions)
- (id)hf_accessoryLikeObject;
- (id)hf_accessoryType;
- (id)hf_associatedAccessories;
- (id)hf_containedCharacteristics;
- (id)hf_containedProfiles;
- (id)hf_containedServices;
- (id)hf_moveToRoom:()AbstractionAdditions;
- (id)hf_safeRoom;
- (id)hf_setTileSize:()AbstractionAdditions;
- (id)hf_tileSize;
- (uint64_t)hf_canShowInControlCenter;
- (uint64_t)hf_canSpanMultipleRooms;
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
- (uint64_t)hf_updateIsFavorite:()AbstractionAdditions;
- (uint64_t)hf_updateIsVisibleInHomeStatus:()AbstractionAdditions;
- (uint64_t)hf_updateShowInHomeDashboard:()AbstractionAdditions;
@end

@implementation HMServiceGroup(AbstractionAdditions)

- (id)hf_accessoryLikeObject
{
  return +[HFAccessoryLikeObject _accessoryLikeObjectForObject:a1];
}

- (uint64_t)hf_itemClass
{
  return objc_opt_class();
}

- (id)hf_containedServices
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = [a1 services];
  v3 = [v1 setWithArray:v2];

  return v3;
}

- (id)hf_containedProfiles
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = [a1 services];
  v3 = [v1 setWithArray:v2];
  v4 = objc_msgSend(v3, "na_flatMap:", &__block_literal_global_161);

  return v4;
}

- (id)hf_containedCharacteristics
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = [a1 services];
  v3 = objc_msgSend(v2, "na_flatMap:", &__block_literal_global_163);
  v4 = [v1 setWithArray:v3];

  return v4;
}

- (id)hf_associatedAccessories
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = [a1 services];
  v3 = [v1 setWithArray:v2];
  v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_166);

  return v4;
}

- (id)hf_accessoryType
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [a1 services];
  v4 = [v2 setWithArray:v3];
  v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_169);

  if ([v5 count] == 1)
  {
    v6 = [v5 anyObject];
  }
  else
  {
    v7 = [a1 services];
    v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_172];

    v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_174);
    v10 = objc_msgSend(v9, "hf_firstMostCommonObject");
    v11 = [v10 serviceType];
    v12 = [v10 serviceSubtype];
    v6 = +[HFAccessoryType serviceType:v11 subtype:v12];
  }
  return v6;
}

- (uint64_t)hf_isInRoom:()AbstractionAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "hf_associatedAccessories");
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__HMServiceGroup_AbstractionAdditions__hf_isInRoom___block_invoke;
  v9[3] = &unk_26408D968;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

- (id)hf_safeRoom
{
  if (objc_msgSend(a1, "hf_areAllServicesInSameRoom"))
  {
    v2 = [a1 services];
    v3 = [v2 firstObject];
    id v4 = [v3 accessory];
    v5 = [v4 room];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (uint64_t)hf_canSpanMultipleRooms
{
  return 1;
}

- (uint64_t)hf_isIdentifiable
{
  return 0;
}

- (uint64_t)hf_canShowInControlCenter
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = [a1 services];
  v3 = [v1 setWithArray:v2];
  uint64_t v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_177);

  return v4;
}

- (uint64_t)hf_isMatterOnlyAccessory
{
  return 0;
}

- (id)hf_moveToRoom:()AbstractionAdditions
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F58190];
  id v6 = objc_msgSend(a1, "hf_associatedAccessories");
  uint64_t v7 = [v6 allObjects];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__HMServiceGroup_AbstractionAdditions__hf_moveToRoom___block_invoke;
  v12[3] = &unk_26408E2E8;
  id v13 = v4;
  id v8 = v4;
  v9 = objc_msgSend(v7, "na_map:", v12);
  id v10 = [v5 combineAllFutures:v9];

  return v10;
}

- (uint64_t)hf_isFavorite
{
  return objc_msgSend(a1, "hf_isOnForContextType:", 2);
}

- (uint64_t)hf_hasSetFavorite
{
  return objc_msgSend(a1, "hf_hasSetForContextType:", 2);
}

- (uint64_t)hf_effectiveIsFavorite
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 2);
}

- (uint64_t)hf_updateIsFavorite:()AbstractionAdditions
{
  return objc_msgSend(a1, "hf_updateValue:forContextType:", a3, 2);
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
  v1 = [a1 services];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_180);

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

- (uint64_t)hf_effectiveShowInHomeDashboard
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 3);
}

- (uint64_t)hf_updateShowInHomeDashboard:()AbstractionAdditions
{
  return objc_msgSend(a1, "hf_updateValue:forContextType:", a3, 3);
}

- (id)hf_tileSize
{
  return +[HFHomeKitObjectSettingsStore tileSizeForObject:a1];
}

- (id)hf_setTileSize:()AbstractionAdditions
{
  return +[HFHomeKitObjectSettingsStore setTileSize:a3 forObject:a1];
}

@end