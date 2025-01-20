@interface CDContextualKeyPath
@end

@implementation CDContextualKeyPath

void __44___CDContextualKeyPath_isMultiDeviceKeyPath__block_invoke()
{
  v29[9] = *MEMORY[0x1E4F143B8];
  v22 = +[_CDUserContextQueries keyPathForUserIsLeavingHomeStatus];
  v29[0] = v22;
  v0 = +[_CDUserContextQueries keyPathForUserIsArrivingAtHomeStatus];
  v29[1] = v0;
  v1 = +[_CDContextQueries keyPathForAppUsageDataDictionaries];
  v29[2] = v1;
  v2 = +[_CDContextQueries keyPathForAppWebUsageDataDictionaries];
  v29[3] = v2;
  v3 = +[_CDContextQueries keyPathForBacklightOnStatus];
  v29[4] = v3;
  v4 = +[_CDContextQueries keyPathForWiredConnectionQuality];
  v29[5] = v4;
  v5 = +[_CDContextQueries keyPathForWiFiConnectionQuality];
  v29[6] = v5;
  v6 = +[_CDContextQueries keyPathForCellConnectionQuality];
  v29[7] = v6;
  v7 = +[_CDContextQueries keyPathForNextAlarm];
  v29[8] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:9];

  if (os_variant_has_internal_content())
  {
    v9 = +[_CDContextQueries keyPathForAppWebUsageDataDictionaries];
    v28[0] = v9;
    v10 = +[_CDContextQueries keyPathForForegroundApp];
    v28[1] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    v12 = [v8 arrayByAddingObjectsFromArray:v11];
  }
  else
  {
    v12 = v8;
  }
  v13 = [MEMORY[0x1E4F1CA80] set];
  [v13 addObjectsFromArray:v12];
  v14 = +[_CDMDCSContextualPredicate predicates];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [*(id *)(*((void *)&v23 + 1) + 8 * v18) keyPaths];
        [v13 unionSet:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }
  uint64_t v20 = [v13 copy];
  v21 = (void *)isMultiDeviceKeyPath_whitelist;
  isMultiDeviceKeyPath_whitelist = v20;
}

@end