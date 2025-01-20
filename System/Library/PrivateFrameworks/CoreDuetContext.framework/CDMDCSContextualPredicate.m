@interface CDMDCSContextualPredicate
@end

@implementation CDMDCSContextualPredicate

void __59___CDMDCSContextualPredicate_predicateForUserIsLeavingHome__block_invoke(uint64_t a1)
{
  id v6 = +[_CDUserContextQueries keyPathForUserIsLeavingHomeStatus];
  v2 = *(void **)(a1 + 32);
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = [v2 _predicateForChangeAtKeyPath:v6 identifier:v3];
  v5 = (void *)predicateForUserIsLeavingHome_contextualPredicate;
  predicateForUserIsLeavingHome_contextualPredicate = v4;
}

void __62___CDMDCSContextualPredicate_predicateForUserIsArrivingAtHome__block_invoke(uint64_t a1)
{
  id v6 = +[_CDUserContextQueries keyPathForUserIsArrivingAtHomeStatus];
  v2 = *(void **)(a1 + 32);
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = [v2 _predicateForChangeAtKeyPath:v6 identifier:v3];
  v5 = (void *)predicateForUserIsArrivingAtHome_contextualPredicate;
  predicateForUserIsArrivingAtHome_contextualPredicate = v4;
}

void __67___CDMDCSContextualPredicate_predicateForPhotosAppBecameForeground__block_invoke(uint64_t a1)
{
  id v8 = +[_CDContextQueries keyPathForAppUsageDataDictionaries];
  v2 = (void *)MEMORY[0x1E4F28F60];
  v3 = +[_CDContextQueries keyPathForAppUsageDataDictionaries];
  uint64_t v4 = +[_CDContextQueries appUsageBundleID];
  v5 = [v2 predicateWithFormat:@"SUBQUERY(self.%@.value, $appInfo, $appInfo.%@ == %@) .@count > 0", v3, v4, @"com.apple.mobileslideshow"];

  uint64_t v6 = [*(id *)(a1 + 32) _predicateForKeyPath:v8 withPredicate:v5 identifier:@"2984e253-ce6b-f5b2-77af-000000000000"];
  v7 = (void *)predicateForPhotosAppBecameForeground_contextualPredicate;
  predicateForPhotosAppBecameForeground_contextualPredicate = v6;
}

void __60___CDMDCSContextualPredicate_predicateForNetworkQualityFair__block_invoke(uint64_t a1)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v2 = +[_CDContextQueries keyPathForWiredConnectionQuality];
  v14[0] = v2;
  v3 = +[_CDContextQueries keyPathForWiFiConnectionQuality];
  v14[1] = v3;
  uint64_t v4 = +[_CDContextQueries keyPathForCellConnectionQuality];
  v14[2] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  v7 = (void *)MEMORY[0x1E4F28F60];
  id v8 = +[_CDContextQueries keyPathForWiredConnectionQuality];
  v9 = +[_CDContextQueries keyPathForWiFiConnectionQuality];
  v10 = +[_CDContextQueries keyPathForCellConnectionQuality];
  v11 = [v7 predicateWithFormat:@"self.%@.value >= %@ or self.%@.value >= %@ or self.%@.value >= %@", v8, &unk_1EDDE09F0, v9, &unk_1EDDE09F0, v10, &unk_1EDDE09F0];

  uint64_t v12 = [*(id *)(a1 + 32) contextualPredicateForKeyPaths:v6 withPredicate:v11 identifier:@"0f403649-9be2-e755-d0fa-000000000000"];
  v13 = (void *)predicateForNetworkQualityFair_contextualPredicate;
  predicateForNetworkQualityFair_contextualPredicate = v12;
}

void __59___CDMDCSContextualPredicate_predicateForNetworkQualityBad__block_invoke(uint64_t a1)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v2 = +[_CDContextQueries keyPathForWiredConnectionQuality];
  v14[0] = v2;
  v3 = +[_CDContextQueries keyPathForWiFiConnectionQuality];
  v14[1] = v3;
  uint64_t v4 = +[_CDContextQueries keyPathForCellConnectionQuality];
  v14[2] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  v7 = (void *)MEMORY[0x1E4F28F60];
  id v8 = +[_CDContextQueries keyPathForWiredConnectionQuality];
  v9 = +[_CDContextQueries keyPathForWiFiConnectionQuality];
  v10 = +[_CDContextQueries keyPathForCellConnectionQuality];
  v11 = [v7 predicateWithFormat:@"self.%@.value <= %@ and self.%@.value <= %@ and self.%@.value <= %@", v8, &unk_1EDDE0A08, v9, &unk_1EDDE0A08, v10, &unk_1EDDE0A08];

  uint64_t v12 = [*(id *)(a1 + 32) contextualPredicateForKeyPaths:v6 withPredicate:v11 identifier:@"a56a7166-c833-0cbd-948e-000000000000"];
  v13 = (void *)predicateForNetworkQualityBad_contextualPredicate;
  predicateForNetworkQualityBad_contextualPredicate = v12;
}

void __58___CDMDCSContextualPredicate_predicateForIsConnectedToCar__block_invoke(uint64_t a1)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v2 = +[_CDContextQueries keyPathForCarplayConnectedStatus];
  v3 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v2];
  uint64_t v4 = +[_CDContextQueries keyPathForCarConnectedStatus];
  v5 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v4];
  uint64_t v6 = *(void **)(a1 + 32);
  v11[0] = v3;
  v11[1] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v9 = [v6 orPredicateWithSubpredicates:v7 identifier:v8];
  v10 = (void *)predicateForIsConnectedToCar_contextualPredicate;
  predicateForIsConnectedToCar_contextualPredicate = v9;
}

void __75___CDMDCSContextualPredicate_predicateForIsConnectedToAudioBluetoothDevice__block_invoke(uint64_t a1)
{
  id v9 = +[_CDContextQueries keyPathForBluetoothDataDictionary];
  v2 = +[_CDContextQueries bluetoothConnectionStatusKey];
  v3 = +[_CDContextQueries bluetoothDeviceTypeKey];
  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self.%@.value.%@ == %@ and self.%@.value.%@ in %@", v9, v2, MEMORY[0x1E4F1CC38], v9, v3, &unk_1EDDE0B70];
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v7 = [v5 _predicateForKeyPath:v9 withPredicate:v4 identifier:v6];
  id v8 = (void *)predicateForIsConnectedToAudioBluetoothDevice_contextualPredicate;
  predicateForIsConnectedToAudioBluetoothDevice_contextualPredicate = v7;
}

void __51___CDMDCSContextualPredicate_predicateForNextAlarm__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = +[_CDContextQueries keyPathForNextAlarm];
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = [v2 _predicateForChangeAtKeyPath:v6 identifier:v3];
  v5 = (void *)predicateForNextAlarm_contextualPredicate;
  predicateForNextAlarm_contextualPredicate = v4;
}

void __59___CDMDCSContextualPredicate_predicateForBacklightOnStatus__block_invoke(uint64_t a1)
{
  id v6 = +[_CDContextQueries keyPathForBacklightOnStatus];
  v2 = *(void **)(a1 + 32);
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = [v2 _predicateForChangeAtKeyPath:v6 identifier:v3];
  v5 = (void *)predicateForBacklightOnStatus_contextualPredicate;
  predicateForBacklightOnStatus_contextualPredicate = v4;
}

void __55___CDMDCSContextualPredicate_predicateForForegroundApp__block_invoke(uint64_t a1)
{
  id v6 = +[_CDContextQueries keyPathForForegroundApp];
  v2 = *(void **)(a1 + 32);
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = [v2 _predicateForChangeAtKeyPath:v6 identifier:v3];
  v5 = (void *)predicateForForegroundApp_contextualPredicate;
  predicateForForegroundApp_contextualPredicate = v4;
}

void __54___CDMDCSContextualPredicate_predicateWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) predicates];
  v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v1, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "identifier", (void)v12);
        [v2 setObject:v8 forKey:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  uint64_t v10 = [v2 copy];
  v11 = (void *)predicateWithIdentifier__mapping;
  predicateWithIdentifier__mapping = v10;
}

void __40___CDMDCSContextualPredicate_predicates__block_invoke()
{
  v17[8] = *MEMORY[0x1E4F143B8];
  v0 = +[_CDMDCSContextualPredicate predicateForUserIsLeavingHome];
  v17[0] = v0;
  v1 = +[_CDMDCSContextualPredicate predicateForUserIsArrivingAtHome];
  v17[1] = v1;
  v2 = +[_CDMDCSContextualPredicate predicateForPhotosAppBecameForeground];
  v17[2] = v2;
  id v3 = +[_CDMDCSContextualPredicate predicateForNetworkQualityFair];
  v17[3] = v3;
  uint64_t v4 = +[_CDMDCSContextualPredicate predicateForNetworkQualityBad];
  v17[4] = v4;
  uint64_t v5 = +[_CDMDCSContextualPredicate predicateForIsConnectedToCar];
  v17[5] = v5;
  uint64_t v6 = +[_CDMDCSContextualPredicate predicateForIsConnectedToAudioBluetoothDevice];
  v17[6] = v6;
  uint64_t v7 = +[_CDMDCSContextualPredicate predicateForNextAlarm];
  v17[7] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:8];
  id v9 = (void *)predicates_predicates;
  predicates_predicates = v8;

  if (os_variant_has_internal_content())
  {
    uint64_t v10 = (void *)predicates_predicates;
    v11 = +[_CDMDCSContextualPredicate predicateForBacklightOnStatus];
    v16[0] = v11;
    long long v12 = +[_CDMDCSContextualPredicate predicateForForegroundApp];
    v16[1] = v12;
    long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    uint64_t v14 = [v10 arrayByAddingObjectsFromArray:v13];
    long long v15 = (void *)predicates_predicates;
    predicates_predicates = v14;
  }
}

uint64_t __44___CDMDCSContextualPredicate_initWithCoder___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  initWithCoder__allowedParameterClasses = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  return MEMORY[0x1F41817F8]();
}

@end