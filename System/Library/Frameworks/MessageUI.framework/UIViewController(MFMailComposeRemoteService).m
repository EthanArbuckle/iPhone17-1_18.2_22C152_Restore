@interface UIViewController(MFMailComposeRemoteService)
- (id)mf_dataForUICustomization;
- (uint64_t)mf_classesForUICustomization;
- (uint64_t)mf_keyPathsMapForUICustomization;
- (void)mf_setDataForUICustomization:()MFMailComposeRemoteService;
@end

@implementation UIViewController(MFMailComposeRemoteService)

- (uint64_t)mf_classesForUICustomization
{
  return 0;
}

- (uint64_t)mf_keyPathsMapForUICustomization
{
  return 0;
}

- (id)mf_dataForUICustomization
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(a1, "mf_keyPathsMapForUICustomization");
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = objc_msgSend(v2, "allKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v9 = [a1 valueForKeyPath:v8];
        if (v9) {
          [v3 setObject:v9 forKey:v8];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  v10 = objc_msgSend(v3, "mf_filterUsingMap:inverse:", v2, 0);
  v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:0];

  return v11;
}

- (void)mf_setDataForUICustomization:()MFMailComposeRemoteService
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v4 error:0];
  uint64_t v6 = objc_msgSend(a1, "mf_classesForUICustomization");
  v7 = [v5 decodeObjectOfClasses:v6 forKey:*MEMORY[0x1E4F284E8]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = objc_msgSend(a1, "mf_keyPathsMapForUICustomization");
    v9 = objc_msgSend(v7, "mf_filterUsingMap:inverse:", v8, 1);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__UIViewController_MFMailComposeRemoteService__mf_setDataForUICustomization___block_invoke;
    v10[3] = &unk_1E5F79578;
    v10[4] = a1;
    [v9 enumerateKeysAndObjectsUsingBlock:v10];
  }
  else
  {
    uint64_t v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF945000, v8, OS_LOG_TYPE_DEFAULT, "#Warning Unexpected format for UI customization data.", buf, 2u);
    }
  }
}

@end