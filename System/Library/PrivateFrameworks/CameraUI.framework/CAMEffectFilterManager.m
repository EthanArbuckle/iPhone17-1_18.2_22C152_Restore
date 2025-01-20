@interface CAMEffectFilterManager
+ (BOOL)areFilters:(id)a3 equalTo:(id)a4;
+ (BOOL)isDepthEffectInFilters:(id)a3;
+ (BOOL)isLightingEffectInFilters:(id)a3;
+ (id)ciFilterNameForFilterType:(int64_t)a3;
+ (id)ciFilterNameForFilterType:(int64_t)a3 lightingType:(int64_t)a4;
+ (id)displayNameForType:(int64_t)a3;
+ (id)filtersForFilterType:(int64_t)a3 lightingType:(int64_t)a4 applyDepthEffect:(BOOL)a5;
+ (id)namesFromFilters:(id)a3;
@end

@implementation CAMEffectFilterManager

+ (id)filtersForFilterType:(int64_t)a3 lightingType:(int64_t)a4 applyDepthEffect:(BOOL)a5
{
  BOOL v5 = a5;
  v9 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  v10 = v9;
  if (v5) {
    [v9 addObject:@"CIDepthEffect"];
  }
  v11 = [a1 ciFilterNameForFilterType:a3 lightingType:a4];
  if (v11) {
    [v10 addObject:v11];
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__16;
  v25 = __Block_byref_object_dispose__16;
  id v26 = 0;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __77__CAMEffectFilterManager_filtersForFilterType_lightingType_applyDepthEffect___block_invoke;
  v18 = &unk_263FA4D68;
  v20 = &v21;
  id v12 = v10;
  id v19 = v12;
  [v12 enumerateObjectsUsingBlock:&v15];
  v13 = objc_msgSend((id)v22[5], "copy", v15, v16, v17, v18);

  _Block_object_dispose(&v21, 8);
  return v13;
}

+ (id)ciFilterNameForFilterType:(int64_t)a3 lightingType:(int64_t)a4
{
  v7 = +[CAMCaptureCapabilities capabilities];
  uint64_t v8 = [v7 supportedPortraitLightingVersion];

  v9 = [MEMORY[0x263F306D8] ciFilterNameForLightingType:a4 version:v8];
  if ([v9 length])
  {
    id v10 = v9;
  }
  else
  {
    id v10 = [a1 ciFilterNameForFilterType:a3];
  }
  v11 = v10;

  return v11;
}

+ (id)ciFilterNameForFilterType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE) {
    return 0;
  }
  else {
    return off_263FA4DB0[a3 - 1];
  }
}

uint64_t __77__CAMEffectFilterManager_filtersForFilterType_lightingType_applyDepthEffect___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [MEMORY[0x263F00640] filterWithName:a2];
  if (v3)
  {
    v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v9 = v3;
    if (!v4)
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v4 addObject:v9];
  }
  return MEMORY[0x270F9A758]();
}

+ (BOOL)areFilters:(id)a3 equalTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  if (v7 == [v6 count])
  {
    uint64_t v8 = +[CAMEffectFilterManager namesFromFilters:v5];
    uint64_t v9 = +[CAMEffectFilterManager namesFromFilters:v6];
    char v10 = [v8 isEqualToArray:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (id)namesFromFilters:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__CAMEffectFilterManager_namesFromFilters___block_invoke;
  v8[3] = &unk_263FA4D90;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __43__CAMEffectFilterManager_namesFromFilters___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  [v2 addObject:v3];
}

+ (id)displayNameForType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      id v4 = @"FILTER_NONE";
      goto LABEL_22;
    case 1:
      id v4 = @"FILTER_MONO";
      goto LABEL_22;
    case 2:
      id v4 = @"FILTER_TONAL";
      goto LABEL_22;
    case 3:
      id v4 = @"FILTER_NOIR";
      uint64_t v7 = @"We understand 'Noir' may be hard to localize for your language. If that's the case, we'd prefer to use the EN string.";
      goto LABEL_23;
    case 4:
      id v4 = @"FILTER_FADE";
      goto LABEL_22;
    case 5:
      id v4 = @"FILTER_CHROME";
      goto LABEL_22;
    case 6:
      id v4 = @"FILTER_PROCESS";
      goto LABEL_22;
    case 7:
      id v4 = @"FILTER_TRANSFER";
      goto LABEL_22;
    case 8:
      id v4 = @"FILTER_INSTANT";
      goto LABEL_22;
    case 9:
      id v4 = @"FILTER_VIVID";
      goto LABEL_22;
    case 10:
      id v4 = @"FILTER_VIVID_WARM";
      goto LABEL_22;
    case 11:
      id v4 = @"FILTER_VIVID_COOL";
      goto LABEL_22;
    case 12:
      id v4 = @"FILTER_DRAMATIC";
      goto LABEL_22;
    case 13:
      id v4 = @"FILTER_DRAMATIC_WARM";
      goto LABEL_22;
    case 14:
      id v4 = @"FILTER_DRAMATIC_COOL";
      goto LABEL_22;
    case 15:
      id v4 = @"FILTER_SILVERPLATE";
      goto LABEL_22;
    case 16:
      id v4 = @"FILTER_PORTRAIT";
LABEL_22:
      uint64_t v7 = 0;
LABEL_23:
      id v5 = CAMLocalizedFrameworkString(v4, v7);
      break;
    default:
      id v5 = 0;
      break;
  }
  return v5;
}

+ (BOOL)isDepthEffectInFilters:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "name", (void)v12);
        char v9 = [v8 isEqualToString:@"CIDepthEffect"];

        if (v9)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

+ (BOOL)isLightingEffectInFilters:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = (void *)MEMORY[0x263F306D8];
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "name", (void)v11);
        uint64_t v9 = [v7 ciLightingTypeForFilterName:v8];

        if ((unint64_t)(v9 - 7) > 0xFFFFFFFFFFFFFFFALL)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

@end