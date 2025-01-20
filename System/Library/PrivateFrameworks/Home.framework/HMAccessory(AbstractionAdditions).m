@interface HMAccessory(AbstractionAdditions)
- (id)hf_accessoryLikeObjects;
- (id)hf_accessoryType;
- (id)hf_containedCharacteristics;
- (id)hf_containedProfiles;
- (id)hf_containedServices;
- (id)hf_itemClass;
- (id)hf_moveToRoom:()AbstractionAdditions;
- (id)hf_setTileSize:()AbstractionAdditions;
- (id)hf_tileSize;
- (id)hf_updateIsFavorite:()AbstractionAdditions;
- (uint64_t)hf_associatedAccessories;
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
- (uint64_t)hf_isVisibleInHomeStatus;
- (uint64_t)hf_showInHomeDashboard;
- (uint64_t)hf_supportsHomeStatus;
- (uint64_t)hf_updateIsVisibleInHomeStatus:()AbstractionAdditions;
- (uint64_t)hf_updateShowInHomeDashboard:()AbstractionAdditions;
@end

@implementation HMAccessory(AbstractionAdditions)

- (id)hf_accessoryLikeObjects
{
  if (objc_msgSend(a1, "hf_isMatterOnlyAccessory"))
  {
    v4 = (void *)MEMORY[0x263EFFA08];
    v5 = +[HFAccessoryLikeObject _accessoryLikeObjectForObject:a1];
    v6 = [v4 setWithObject:v5];

    goto LABEL_20;
  }
  v7 = objc_msgSend(a1, "hf_visibleServices");
  if (objc_msgSend(a1, "hf_showAsAccessoryTile")
    && [v7 count]
    && (objc_msgSend(a1, "hf_isMediaAccessory") & 1) == 0
    && (objc_msgSend(a1, "hf_isProgrammableSwitch") & 1) == 0)
  {
    v21 = (void *)MEMORY[0x263EFFA08];
    v22 = +[HFAccessoryLikeObject _accessoryLikeObjectForObject:a1];
    v6 = [v21 setWithObject:v22];

    goto LABEL_19;
  }
  v8 = [MEMORY[0x263EFFA08] set];
  if (!objc_msgSend(a1, "hf_isCamera"))
  {
    if (!objc_msgSend(a1, "hf_isRemoteControl"))
    {
      if (objc_msgSend(a1, "hf_isMediaAccessory"))
      {
        v19 = (void *)MEMORY[0x263EFFA08];
        v14 = [a1 mediaProfile];
        objc_msgSend(v19, "na_setWithSafeObject:", v14);
        id v18 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
      if ([v7 count]) {
        goto LABEL_24;
      }
      if (objc_msgSend(a1, "hf_isSupportedAccessory"))
      {
        if (!objc_msgSend(a1, "hf_isProgrammableSwitch")) {
          goto LABEL_17;
        }
        if (!objc_msgSend(a1, "hf_showAsAccessoryTile"))
        {
LABEL_24:
          id v18 = v7;
          goto LABEL_16;
        }
      }
    }
    v12 = (void *)MEMORY[0x263EFFA08];
    v13 = +[HFAccessoryLikeObject _accessoryLikeObjectForObject:a1];
    v6 = [v12 setWithObject:v13];

    goto LABEL_18;
  }
  int v9 = objc_msgSend(a1, "hf_showAsAccessoryTile");
  v10 = (void *)MEMORY[0x263EFFA08];
  if (!v9)
  {
    v14 = [a1 cameraProfiles];
    v15 = [v7 allObjects];
    v16 = [v14 arrayByAddingObjectsFromArray:v15];
    v17 = objc_msgSend(v16, "na_arrayByFlattening");
    id v18 = [v10 setWithArray:v17];

LABEL_15:
    v8 = v14;
LABEL_16:

    v8 = v18;
LABEL_17:
    objc_initWeak(&location, a1);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __60__HMAccessory_AbstractionAdditions__hf_accessoryLikeObjects__block_invoke;
    v23[3] = &unk_26408E1D0;
    v23[4] = a1;
    objc_copyWeak(v24, &location);
    v24[1] = a2;
    v6 = objc_msgSend(v8, "na_flatMap:", v23);
    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
    goto LABEL_18;
  }
  v11 = +[HFAccessoryLikeObject _accessoryLikeObjectForObject:a1];
  v6 = [v10 setWithObject:v11];

LABEL_18:
LABEL_19:

LABEL_20:
  return v6;
}

- (uint64_t)hf_isVisibleInHomeStatus
{
  if (objc_msgSend(a1, "hf_isForcedVisibleInHomeStatus")) {
    return 1;
  }
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 1);
}

- (uint64_t)hf_isForcedVisibleInHomeStatus
{
  return 0;
}

- (id)hf_accessoryType
{
  v2 = objc_msgSend(a1, "hf_effectiveCategoryType");
  if (([v2 isEqualToString:*MEMORY[0x263F0B0D0]] & 1) != 0
    || objc_msgSend(a1, "hf_isSingleSensorAccessory"))
  {
    v3 = objc_msgSend(a1, "hf_primaryService");
    if (v3)
    {
      id v4 = v3;
      v5 = objc_msgSend(v3, "hf_accessoryType");
LABEL_5:

      goto LABEL_14;
    }
  }
  else if (([v2 isEqualToString:*MEMORY[0x263F0B0E0]] & 1) != 0 {
         || [v2 isEqualToString:*MEMORY[0x263F0B158]])
  }
  {
    v6 = objc_msgSend(a1, "hf_primaryService");
    uint64_t v7 = [v6 associatedServiceType];
    if (v7)
    {
      v8 = (void *)v7;
      int v9 = objc_msgSend(a1, "hf_visibleServices");
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __53__HMAccessory_AbstractionAdditions__hf_accessoryType__block_invoke;
      v12[3] = &unk_26408E0E8;
      id v4 = v6;
      id v13 = v4;
      int v10 = objc_msgSend(v9, "na_all:", v12);

      if (v10)
      {
        v5 = objc_msgSend(v4, "hf_accessoryType");

        goto LABEL_5;
      }
    }
    else
    {
    }
  }
  v5 = +[HFAccessoryType categoryType:v2];
LABEL_14:

  return v5;
}

- (uint64_t)hf_effectiveIsFavorite
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 2);
}

- (id)hf_containedServices
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = [a1 services];
  v3 = [v1 setWithArray:v2];

  return v3;
}

- (uint64_t)hf_effectiveShowInHomeDashboard
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 3);
}

- (id)hf_containedProfiles
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = [a1 profiles];
  v3 = [v1 setWithArray:v2];

  return v3;
}

- (uint64_t)hf_associatedAccessories
{
  return [MEMORY[0x263EFFA08] setWithObject:a1];
}

- (id)hf_itemClass
{
  if ((objc_msgSend(a1, "hf_isRemoteControl") & 1) == 0
    && (objc_msgSend(a1, "hf_isMediaAccessory") & 1) == 0
    && objc_msgSend(a1, "hf_isSupportedAccessory"))
  {
    objc_msgSend(a1, "hf_isPureProgrammableSwitch");
  }
  v2 = objc_opt_class();
  return v2;
}

- (id)hf_containedCharacteristics
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = [a1 services];
  v3 = objc_msgSend(v2, "na_flatMap:", &__block_literal_global_66);
  id v4 = [v1 setWithArray:v3];

  return v4;
}

- (uint64_t)hf_isInRoom:()AbstractionAdditions
{
  id v4 = a3;
  v5 = [a1 room];
  v6 = [v5 uniqueIdentifier];
  uint64_t v7 = [v4 uniqueIdentifier];

  uint64_t v8 = objc_msgSend(v6, "hmf_isEqualToUUID:", v7);
  return v8;
}

- (uint64_t)hf_canSpanMultipleRooms
{
  return 0;
}

- (uint64_t)hf_isIdentifiable
{
  if ([a1 supportsIdentify]) {
    return 1;
  }
  return objc_msgSend(a1, "hf_isHomePod");
}

- (id)hf_moveToRoom:()AbstractionAdditions
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F58190];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__HMAccessory_AbstractionAdditions__hf_moveToRoom___block_invoke;
  v9[3] = &unk_26408E218;
  v9[4] = a1;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 futureWithErrorOnlyHandlerAdapterBlock:v9];

  return v7;
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
  if (objc_msgSend(a1, "hf_isCamera"))
  {
    NSLog(&cfstr_AttemptingToUp.isa);
    [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    objc_msgSend(a1, "hf_updateValue:forContextType:", a3, 2);
  v5 = };
  return v5;
}

- (uint64_t)hf_supportsHomeStatus
{
  return objc_msgSend(a1, "hf_shouldHideForContextType:", 1) ^ 1;
}

- (uint64_t)hf_hasSetVisibleInHomeStatus
{
  return objc_msgSend(a1, "hf_hasSetForContextType:", 1);
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
  return +[HFHomeKitObjectSettingsStore tileSizeForObject:a1];
}

- (id)hf_setTileSize:()AbstractionAdditions
{
  return +[HFHomeKitObjectSettingsStore setTileSize:a3 forObject:a1];
}

@end