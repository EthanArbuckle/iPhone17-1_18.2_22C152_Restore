@interface FedStatsUtils
+ (BOOL)checkDeviceRegionCodeRestrictionForAllowedRegions:(id)a3 deniedRegions:(id)a4;
+ (id)SHA1AsBitString:(id)a3;
+ (id)bitStringToInt:(id)a3;
+ (id)intToBitString:(unint64_t)a3 withLength:(unint64_t)a4;
+ (id)tokenizeAndSampleUnigramFromNgram:(id)a3;
@end

@implementation FedStatsUtils

+ (id)bitStringToInt:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] > 0x3F)
  {
LABEL_2:
    v4 = 0;
    goto LABEL_8;
  }
  uint64_t v5 = 0;
  if ([v3 length])
  {
    uint64_t v6 = 0;
    do
    {
      v7 = objc_msgSend(v3, "substringWithRange:", v6, 1);
      uint64_t v8 = [&unk_27000EE00 indexOfObject:v7];

      if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_2;
      }
      uint64_t v5 = v8 + 2 * v5;
    }
    while (++v6 < (unint64_t)[v3 length]);
  }
  v4 = [NSNumber numberWithUnsignedInteger:v5];
LABEL_8:

  return v4;
}

+ (id)intToBitString:(unint64_t)a3 withLength:(unint64_t)a4
{
  uint64_t v6 = [MEMORY[0x263F089D8] string];
  if (a4)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = [&unk_27000EE18 objectAtIndex:((1 << v7) & a3) != 0];
      [v6 insertString:v8 atIndex:0];

      ++v7;
    }
    while (a4 != v7);
  }
  return v6;
}

+ (id)SHA1AsBitString:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v4 = (const char *)[a3 UTF8String];
  CC_LONG v5 = strlen(v4);
  CC_SHA1(v4, v5, md);
  uint64_t v6 = [MEMORY[0x263F089D8] stringWithCapacity:160];
  for (uint64_t i = 0; i != 20; ++i)
  {
    uint64_t v8 = [a1 intToBitString:md[i] withLength:8];
    [v6 appendFormat:@"%@", v8];
  }
  return v6;
}

+ (id)tokenizeAndSampleUnigramFromNgram:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F089C0] punctuationCharacterSet];
  CC_LONG v5 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  [v4 formUnionWithCharacterSet:v5];

  uint64_t v6 = [v3 componentsSeparatedByCharactersInSet:v4];
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "length", (void)v16)) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  v14 = objc_msgSend(v7, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v7, "count")));

  return v14;
}

+ (BOOL)checkDeviceRegionCodeRestrictionForAllowedRegions:(id)a3 deniedRegions:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  uint64_t v7 = (void *)v6;
  if (!(v5 | v6))
  {
    char v8 = 1;
    goto LABEL_17;
  }
  if (v5 && v6)
  {
LABEL_16:
    char v8 = 0;
    goto LABEL_17;
  }
  if (checkDeviceRegionCodeRestrictionForAllowedRegions_deniedRegions__onceToken != -1) {
    dispatch_once(&checkDeviceRegionCodeRestrictionForAllowedRegions_deniedRegions__onceToken, &__block_literal_global_0);
  }
  uint64_t v9 = checkDeviceRegionCodeRestrictionForAllowedRegions_deniedRegions__deviceRegionCode;
  uint64_t v10 = +[FedStatsLog logger];
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (!v9)
  {
    if (v11) {
      +[FedStatsUtils checkDeviceRegionCodeRestrictionForAllowedRegions:deniedRegions:](v10);
    }

    goto LABEL_16;
  }
  if (v11) {
    +[FedStatsUtils checkDeviceRegionCodeRestrictionForAllowedRegions:deniedRegions:](v10);
  }

  char v12 = [v7 containsObject:checkDeviceRegionCodeRestrictionForAllowedRegions_deniedRegions__deviceRegionCode];
  char v8 = v12 ^ 1;
  if (v5 && (v12 & 1) == 0) {
    char v8 = [(id)v5 containsObject:checkDeviceRegionCodeRestrictionForAllowedRegions_deniedRegions__deviceRegionCode];
  }
LABEL_17:

  return v8;
}

void __81__FedStatsUtils_checkDeviceRegionCodeRestrictionForAllowedRegions_deniedRegions___block_invoke()
{
  id v3 = [MEMORY[0x263F62D20] lastKnownEstimates];
  v0 = [v3 lastObject];
  uint64_t v1 = [v0 countryCode];
  v2 = (void *)checkDeviceRegionCodeRestrictionForAllowedRegions_deniedRegions__deviceRegionCode;
  checkDeviceRegionCodeRestrictionForAllowedRegions_deniedRegions__deviceRegionCode = v1;
}

+ (void)checkDeviceRegionCodeRestrictionForAllowedRegions:(os_log_t)log deniedRegions:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_24DF55000, log, OS_LOG_TYPE_DEBUG, "Cannot determine device region code.", v1, 2u);
}

+ (void)checkDeviceRegionCodeRestrictionForAllowedRegions:(os_log_t)log deniedRegions:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = checkDeviceRegionCodeRestrictionForAllowedRegions_deniedRegions__deviceRegionCode;
  _os_log_debug_impl(&dword_24DF55000, log, OS_LOG_TYPE_DEBUG, "Device region code: %@", (uint8_t *)&v1, 0xCu);
}

@end