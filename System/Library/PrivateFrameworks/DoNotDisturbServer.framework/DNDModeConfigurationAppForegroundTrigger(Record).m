@interface DNDModeConfigurationAppForegroundTrigger(Record)
+ (uint64_t)newWithDictionaryRepresentation:()Record context:;
- (id)dictionaryRepresentationWithContext:()Record;
@end

@implementation DNDModeConfigurationAppForegroundTrigger(Record)

+ (uint64_t)newWithDictionaryRepresentation:()Record context:
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_msgSend(v6, "bs_safeDictionaryForKey:", @"applicationIdentifier");
  if (v7)
  {
    v8 = (void *)[MEMORY[0x1E4F5F598] newWithDictionaryRepresentation:v7 context:v5];
    v9 = [v5 applicationIdentifierMapper];
    v10 = [v9 applicationIdentifierForFileWithSourceApplicationIdentifier:v8];
  }
  else
  {
    v8 = objc_msgSend(v6, "bs_safeStringForKey:", @"bundleIdentifier");
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:v8 platform:0];
  }

  v11 = objc_msgSend(v6, "bs_safeNumberForKey:", @"enabledSetting");

  uint64_t v12 = [v11 unsignedIntegerValue];
  uint64_t v13 = [objc_alloc(MEMORY[0x1E4F5F660]) initWithApplicationIdentifier:v10 enabledSetting:v12];

  return v13;
}

- (id)dictionaryRepresentationWithContext:()Record
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 destination];
  if (!v5)
  {
    id v6 = [v4 applicationIdentifierMapper];
    v7 = [a1 applicationIdentifier];
    uint64_t v8 = [v6 applicationIdentifierForSyncWithSourceApplicationIdentifier:v7];
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    id v6 = [v4 applicationIdentifierMapper];
    v7 = [a1 applicationIdentifier];
    uint64_t v8 = [v6 applicationIdentifierForFileWithSourceApplicationIdentifier:v7];
LABEL_5:
    v9 = (void *)v8;

    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:
  v15[0] = @"DNDModeConfigurationAppForegroundTrigger";
  v14[0] = @"class";
  v14[1] = @"applicationIdentifier";
  v10 = [v9 dictionaryRepresentationWithContext:v4];
  v15[1] = v10;
  v14[2] = @"enabledSetting";
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "enabledSetting"));
  v15[2] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

@end