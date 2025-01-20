@interface CalAccountStoreChangeFilterDelegateForLegacyICBURestore
- (BOOL)allowChangesToExistingTopLevelAccount:(id)a3;
- (BOOL)allowCreationOfTopLevelAccountWithTypeIdentifier:(id)a3;
@end

@implementation CalAccountStoreChangeFilterDelegateForLegacyICBURestore

- (BOOL)allowChangesToExistingTopLevelAccount:(id)a3
{
  id v3 = a3;
  v4 = [v3 accountTypeIdentifier];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F17858]];

  if (v5)
  {
    v6 = [v3 accountPropertyForKey:*MEMORY[0x1E4F17660]];
    BOOL v7 = v6 == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)allowCreationOfTopLevelAccountWithTypeIdentifier:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x1E4F17858]];
}

@end