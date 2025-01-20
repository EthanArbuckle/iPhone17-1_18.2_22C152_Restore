@interface MDMSkipKeysUtilities
- (BOOL)isBuddyPaneSkipped:(id)a3;
- (NSString)testSetupAssistantPayloadPath;
- (id)_cloudConfigSkipKeys;
- (id)_payloadSkipKeys;
- (id)_specialSkipKeys;
- (id)_validateAndUpdateSkipKeys:(id)a3;
- (id)currentSkipKeys;
- (void)setTestSetupAssistantPayloadPath:(id)a3;
@end

@implementation MDMSkipKeysUtilities

- (id)currentSkipKeys
{
  v3 = (void *)MEMORY[0x1E4F1CA80];
  v4 = [(MDMSkipKeysUtilities *)self _cloudConfigSkipKeys];
  v5 = [v3 setWithArray:v4];

  v6 = [(MDMSkipKeysUtilities *)self _payloadSkipKeys];
  [v5 addObjectsFromArray:v6];

  v7 = [(MDMSkipKeysUtilities *)self _specialSkipKeys];
  [v5 addObjectsFromArray:v7];

  v8 = (void *)[v5 copy];

  return v8;
}

- (BOOL)isBuddyPaneSkipped:(id)a3
{
  id v4 = a3;
  v5 = [(MDMSkipKeysUtilities *)self currentSkipKeys];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (id)_cloudConfigSkipKeys
{
  v3 = +[MDMCloudConfiguration sharedConfiguration];
  [v3 refreshDetailsFromDisk];

  id v4 = +[MDMCloudConfiguration sharedConfiguration];
  v5 = [v4 skipSetupKeys];

  char v6 = [(MDMSkipKeysUtilities *)self _validateAndUpdateSkipKeys:v5];

  return v6;
}

- (id)_payloadSkipKeys
{
  v3 = [(MDMSkipKeysUtilities *)self testSetupAssistantPayloadPath];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    MDMSetupAssistantSettingsFilePath();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  char v6 = v5;

  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v8 = [v7 fileExistsAtPath:v6];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v6];
    v10 = [v9 objectForKeyedSubscript:@"SkipSetupItems"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [v9 objectForKeyedSubscript:@"SkipSetupItems"];
      v12 = [(MDMSkipKeysUtilities *)self _validateAndUpdateSkipKeys:v11];
    }
    else
    {
      v12 = [(MDMSkipKeysUtilities *)self _validateAndUpdateSkipKeys:0];
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_specialSkipKeys
{
  v2 = objc_opt_new();
  v3 = DMCDeviceManagementDaemonSetupOptionDirectoryPath();
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3];

  if (v5) {
    [v2 addObject:*MEMORY[0x1E4F5E608]];
  }
  char v6 = (void *)[v2 copy];

  return v6;
}

- (id)_validateAndUpdateSkipKeys:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = (void *)MEMORY[0x1E4F5E550];
  id v5 = a3;
  char v6 = [v4 allSkipKeys];
  v7 = [v3 setWithArray:v6];

  if (v5) {
    id v8 = v5;
  }
  else {
    id v8 = (id)MEMORY[0x1E4F1CBF0];
  }
  v9 = [MEMORY[0x1E4F1CA80] setWithArray:v8];

  if ([v9 containsObject:*MEMORY[0x1E4F5E600]])
  {
    uint64_t v10 = [v7 mutableCopy];

    v9 = (void *)v10;
  }
  else
  {
    [v9 intersectSet:v7];
  }
  v11 = [v9 allObjects];

  return v11;
}

- (NSString)testSetupAssistantPayloadPath
{
  return self->_testSetupAssistantPayloadPath;
}

- (void)setTestSetupAssistantPayloadPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end