@interface ACXRemoteApplication(CarouselPreferenceServices)
- (id)cslprf_displayName;
@end

@implementation ACXRemoteApplication(CarouselPreferenceServices)

- (id)cslprf_displayName
{
  uint64_t v2 = *MEMORY[0x263EFFB68];
  uint64_t v3 = *MEMORY[0x263EFFA90];
  v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263EFFB68], *MEMORY[0x263EFFA90], 0);
  v5 = [MEMORY[0x263EFF960] preferredLanguages];
  v6 = [a1 localizedInfoPlistStringsForKeys:v4 fetchingFirstMatchingLocalizationInList:v5];

  v7 = [v6 objectForKeyedSubscript:v3];

  v8 = v6;
  if (v7)
  {
    uint64_t v9 = v3;
LABEL_5:
    uint64_t v11 = [v8 objectForKeyedSubscript:v9];
    goto LABEL_6;
  }
  v10 = [v6 objectForKeyedSubscript:v2];

  if (v10)
  {
    v8 = v6;
    uint64_t v9 = v2;
    goto LABEL_5;
  }
  uint64_t v11 = [a1 applicationName];
LABEL_6:
  v12 = (void *)v11;

  return v12;
}

@end