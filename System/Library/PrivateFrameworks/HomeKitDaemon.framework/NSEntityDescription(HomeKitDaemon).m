@interface NSEntityDescription(HomeKitDaemon)
- (id)hmd_attributeForSettingsPath:()HomeKitDaemon;
- (id)hmd_attributesBySettingsPath;
- (void)hmd_recursivelyEnumerateSubentitiesUsingBlock:()HomeKitDaemon;
@end

@implementation NSEntityDescription(HomeKitDaemon)

- (id)hmd_attributeForSettingsPath:()HomeKitDaemon
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "hmd_attributesBySettingsPath");
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)hmd_attributesBySettingsPath
{
  v2 = objc_getAssociatedObject(a1, sel_hmd_attributeForSettingsPath_);
  if (!v2)
  {
    v3 = [MEMORY[0x263EFF9A0] dictionary];
    id v4 = [a1 attributesByName];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __66__NSEntityDescription_HomeKitDaemon__hmd_attributesBySettingsPath__block_invoke;
    v9[3] = &unk_264A1E420;
    id v5 = v3;
    id v10 = v5;
    [v4 enumerateKeysAndObjectsUsingBlock:v9];

    v2 = (void *)[v5 copy];
    v6 = [a1 managedObjectModel];
    int v7 = objc_msgSend(v6, "hmd_isImmutable");

    if (v7) {
      objc_setAssociatedObject(a1, sel_hmd_attributeForSettingsPath_, v2, (void *)0x301);
    }
  }
  return v2;
}

- (void)hmd_recursivelyEnumerateSubentitiesUsingBlock:()HomeKitDaemon
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  uint64_t v14 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__NSEntityDescription_HomeKitDaemon__hmd_recursivelyEnumerateSubentitiesUsingBlock___block_invoke;
  aBlock[3] = &unk_264A1E3F8;
  v9 = &v15;
  id v5 = v4;
  id v8 = v5;
  id v10 = &v11;
  v6 = (void (**)(void *, uint64_t, void, uint64_t *))_Block_copy(aBlock);
  v12[3] = (uint64_t)v6;
  v6[2](v6, a1, 0, v16 + 3);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
}

@end