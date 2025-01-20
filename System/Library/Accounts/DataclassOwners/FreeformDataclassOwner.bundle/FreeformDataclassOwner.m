void CRLLogSinkf(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  void (**v15)(void, void, void, void, void, void);
  uint64_t v16;
  uint64_t v17;

  v11 = a2;
  v12 = a5;
  v16 = a6;
  v17 = a6;
  v13 = objc_msgSend(objc_alloc((Class)NSString), "crl_initRedactedWithFormat:arguments:", v12, a6);
  if (s_logSinkBlocks && [(id)s_logSinkBlocks count] && objc_msgSend((id)s_logSinkBlocks, "count"))
  {
    v14 = 0;
    do
    {
      objc_msgSend((id)s_logSinkBlocks, "objectAtIndexedSubscript:", v14, v16, v17);
      v15 = (void (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, uint64_t, id, uint64_t, uint64_t, id))v15)[2](v15, a1, v11, a3, a4, v13);

      ++v14;
    }
    while (v14 < (unint64_t)[(id)s_logSinkBlocks count]);
  }
}

void CRLLogSinkv(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11 = a2;
  id v12 = +[NSString stringWithUTF8String:a5];
  CRLLogSinkf(a1, v11, a3, a4, v12, a6);
}

void CRLLogSink(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

id CRLLogSinkSetBlock(void *a1)
{
  id v1 = a1;
  id v2 = [(id)s_logSinkBlocks copy];
  if (v1)
  {
    id v3 = objc_retainBlock(v1);
    id v8 = v3;
    uint64_t v4 = +[NSArray arrayWithObjects:&v8 count:1];
    v5 = (void *)s_logSinkBlocks;
    s_logSinkBlocks = v4;
  }
  else
  {
    v6 = (void *)s_logSinkBlocks;
    s_logSinkBlocks = (uint64_t)&__NSArray0__struct;
  }
  return v2;
}

id CRLLogSinkSetBlocks(void *a1)
{
  id v1 = a1;
  id v2 = [(id)s_logSinkBlocks copy];
  id v3 = (void *)s_logSinkBlocks;
  s_logSinkBlocks = (uint64_t)v1;

  return v2;
}

os_log_t CRLLogCreateCategory(char *category)
{
  os_log_t v1 = os_log_create("com.apple.freeform", category);
  return v1;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id EnabledCategories()
{
  if (EnabledCategories_pred != -1) {
    dispatch_once(&EnabledCategories_pred, &__block_literal_global);
  }
  v0 = (void *)EnabledCategories_sYESCategories;
  return v0;
}

id DisabledCategories()
{
  if (DisabledCategories_pred != -1) {
    dispatch_once(&DisabledCategories_pred, &__block_literal_global_44);
  }
  v0 = (void *)DisabledCategories_sNOCategories;
  return v0;
}

id CRLLogCat_GetSortedCategories()
{
  v0 = EnabledCategories();
  id v1 = [v0 allObjects];

  id v2 = DisabledCategories();
  id v3 = [v2 allObjects];

  if (v3)
  {
    if (v1)
    {
      uint64_t v4 = [v1 arrayByAddingObjectsFromArray:v3];

      id v1 = (id)v4;
    }
    else
    {
      id v1 = v3;
    }
  }
  v5 = [v1 sortedArrayUsingSelector:"caseInsensitiveCompare:"];

  return v5;
}

BOOL CRLLogCat_AreAnyCategoriesEnabled()
{
  v0 = EnabledCategories();
  BOOL v1 = [v0 count] != 0;

  return v1;
}

BOOL CRLLogCat_AreAnyCategoriesDisabled()
{
  v0 = DisabledCategories();
  BOOL v1 = [v0 count] != 0;

  return v1;
}

id CRLLogCat_IsCategoryEnabled(void *a1)
{
  id v1 = a1;
  id v2 = EnabledCategories();
  id v3 = [v2 containsObject:v1];

  return v3;
}

id CRLLogCat_IsCategoryDefined(void *a1)
{
  id v1 = a1;
  id v2 = EnabledCategories();
  if ([v2 containsObject:v1])
  {
    id v3 = &dword_0 + 1;
  }
  else
  {
    uint64_t v4 = DisabledCategories();
    id v3 = [v4 containsObject:v1];
  }
  return v3;
}

void CRLLogCat_SetCategoryEnabled(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = EnabledCategories();
  v5 = DisabledCategories();
  unsigned int v6 = [v5 containsObject:v3];
  if ([v4 containsObject:v3]) {
    unsigned int v7 = 0;
  }
  else {
    unsigned int v7 = [v5 containsObject:v3] ^ 1;
  }
  if (a2) {
    id v8 = v5;
  }
  else {
    id v8 = v4;
  }
  if (a2) {
    v9 = v4;
  }
  else {
    v9 = v5;
  }
  [v8 removeObject:v3];
  [v9 addObject:v3];
  v10 = +[NSUserDefaults standardUserDefaults];
  id v11 = [v4 allObjects];
  [v10 setObject:v11 forKey:@"CRLLogCatYES"];

  id v12 = [v5 allObjects];
  [v10 setObject:v12 forKey:@"CRLLogCatNO"];

  if (v7)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = ___sendCategoryAddedNotification_block_invoke;
    block[3] = &unk_289E0;
    id v16 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  if (v6 == a2)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __CRLLogCat_SetCategoryEnabled_block_invoke;
    v13[3] = &unk_289E0;
    id v14 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
  }
}

void CRLLogCat_ToggleCategoryEnabled(void *a1)
{
  id v2 = a1;
  unsigned int v1 = CRLLogCat_IsCategoryEnabled(v2);
  CRLLogCat_SetCategoryEnabled(v2, v1 ^ 1);
}

void CRLLogCat_RemoveCategory(void *a1)
{
  id v1 = a1;
  EnabledCategories();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = DisabledCategories();
  [v3 removeObject:v1];
  [v2 removeObject:v1];
}

id CRLLogCat_GetEnabledCategories()
{
  v0 = EnabledCategories();
  id v1 = [v0 immutableSet];

  return v1;
}

id CRLLogCat_GetDisabledCategories()
{
  v0 = DisabledCategories();
  id v1 = [v0 immutableSet];

  return v1;
}

void CRLLogCat_EnableCategory(void *a1)
{
}

void CRLLogCat_DisableCategory(void *a1)
{
}

id CRLLogGetNameDictionary()
{
  if (CRLLogGetNameDictionary_onceToken != -1) {
    dispatch_once(&CRLLogGetNameDictionary_onceToken, &__block_literal_global_50);
  }
  v0 = (void *)CRLLogGetNameDictionary_nameDictionary;
  return v0;
}

id CRLLogEnsureCreated(void *a1, id *a2, dispatch_once_t *a3)
{
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = __CRLLogEnsureCreated_block_invoke;
  v13 = &unk_28A28;
  id v14 = a1;
  v15 = a2;
  dispatch_once_t v5 = *a3;
  id v6 = a1;
  if (v5 != -1) {
    dispatch_once(a3, &v10);
  }
  unsigned int v7 = CRLLogGetNameDictionary();
  objc_msgSend(v7, "setObject:forKey:", v6, *a2, v10, v11, v12, v13, v14, v15);

  id v8 = *a2;
  return v8;
}

void __CRLLogEnsureCreated_block_invoke(uint64_t a1)
{
  os_log_t v2 = os_log_create("com.apple.freeform", (const char *)[*(id *)(a1 + 32) UTF8String]);

  **(void **)(a1 + 40) = v2;
}

id CRLLogGetName(void *a1)
{
  id v1 = a1;
  os_log_t v2 = CRLLogGetNameDictionary();
  id v3 = [v2 objectForKey:v1];

  return v3;
}

void ___sendCategoryAddedNotification_block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_54);
    }
    id v3 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      ___sendCategoryAddedNotification_block_invoke_cold_2(v2, v3);
    }
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_60);
    }
    uint64_t v4 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      ___sendCategoryAddedNotification_block_invoke_cold_1(v4, v2);
    }
    dispatch_once_t v5 = +[NSString stringWithUTF8String:"void _sendCategoryAddedNotification(NSString *__strong)_block_invoke"];
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLLog.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 151, 0, "invalid nil value for '%{public}s'", "category");
  }
  unsigned int v7 = +[NSNotificationCenter defaultCenter];
  uint64_t v8 = *(void *)(a1 + 32);
  CFStringRef v10 = @"CRLLogCatCategoryKey";
  uint64_t v11 = v8;
  v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v7 postNotificationName:@"CRLLogCatCategoryAdded" object:0 userInfo:v9];
}

void ___sendCategoryAddedNotification_block_invoke_2(id a1)
{
  CRLAssertCat_log_t = os_log_create("com.apple.freeform", "CRLAssertCat");
  _objc_release_x1();
}

void ___sendCategoryAddedNotification_block_invoke_58(id a1)
{
  CRLAssertCat_log_t = os_log_create("com.apple.freeform", "CRLAssertCat");
  _objc_release_x1();
}

uint64_t CRLBuildIndexFromBuildVersion(void *a1)
{
  id v1 = a1;
  uint64_t v25 = 0;
  int v2 = +[NSRegularExpression regularExpressionWithPattern:@"([0-9]+)([A-Za-z])([0-9]+)([A-Za-z])?" options:1 error:&v25];
  id v3 = objc_msgSend(v2, "firstMatchInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 rangeAtIndex:1];
    unsigned int v7 = objc_msgSend(v1, "substringWithRange:", v5, v6);
    uint64_t v8 = (int)[v7 intValue];

    id v9 = [v4 rangeAtIndex:2];
    uint64_t v11 = objc_msgSend(v1, "substringWithRange:", v9, v10);
    id v12 = [v11 uppercaseString];
    uint64_t v13 = [v12 characterAtIndex:0];

    id v14 = [v4 rangeAtIndex:3];
    id v16 = objc_msgSend(v1, "substringWithRange:", v14, v15);
    uint64_t v17 = (int)[v16 intValue];

    id v18 = [v4 rangeAtIndex:4];
    uint64_t v20 = 0;
    if (v18 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = objc_msgSend(v1, "substringWithRange:", v18, v19);
      v22 = [v21 uppercaseString];
      uint64_t v20 = [v22 characterAtIndex:0] - 64;
    }
    uint64_t v23 = v20 | (32 * (((v13 << 14) - 0x100000) | (v8 << 19) | v17));
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

id CRLBuildIndexSetFromString(void *a1)
{
  id v1 = a1;
  id v23 = 0;
  int v2 = +[NSRegularExpression regularExpressionWithPattern:@"([0-9A-Za-z]+)([-,])? *" options:1 error:&v23];
  id v3 = v23;
  uint64_t v4 = (char *)[v1 length];
  id v22 = +[NSMutableIndexSet indexSet];
  if (!v4) {
    goto LABEL_28;
  }
  id v21 = v3;
  uint64_t v5 = 0;
  id v6 = 0;
  while (1)
  {
    unsigned int v7 = objc_msgSend(v2, "firstMatchInString:options:range:", v1, 0, v5, v4);
    uint64_t v8 = v7;
    if (!v7) {
      break;
    }
    id v9 = [v7 rangeAtIndex:1];
    uint64_t v11 = objc_msgSend(v1, "substringWithRange:", v9, v10);
    id v12 = [v8 rangeAtIndex:2];
    if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v14 = 0;
      if ([0 isEqualToString:@"-"]) {
        goto LABEL_8;
      }
LABEL_12:
      if (v6)
      {
        unint64_t v15 = CRLBuildIndexFromBuildVersion(v6);
        unint64_t v16 = CRLBuildIndexFromBuildVersion(v11);
        if (v15 && v16 && v16 >= v15) {
          objc_msgSend(v22, "addIndexesInRange:", v15, v16 - v15 + 1);
        }

        id v6 = 0;
      }
      else
      {
        uint64_t v17 = CRLBuildIndexFromBuildVersion(v11);
        if (v17) {
          [v22 addIndex:v17];
        }
        id v6 = 0;
      }
      goto LABEL_21;
    }
    id v14 = objc_msgSend(v1, "substringWithRange:", v12, v13);
    if ([v14 isEqualToString:@"-"])
    {
LABEL_8:
      if (!v6) {
        id v6 = v11;
      }
      goto LABEL_21;
    }
    if (!v14 || [v14 isEqualToString:@","]) {
      goto LABEL_12;
    }
LABEL_21:
    [v8 rangeAtIndex:0];
    v5 += v18;
    v4 -= v18;

    if (!v4) {
      goto LABEL_24;
    }
  }

LABEL_24:
  id v3 = v21;
  if (v6)
  {
    uint64_t v19 = CRLBuildIndexFromBuildVersion(v6);
    if (v19) {
      objc_msgSend(v22, "addIndexesInRange:", v19, 0x7FFFFFFFFFFFFFFELL - v19);
    }
  }
LABEL_28:

  return v22;
}

id CRLProductBuildVersion()
{
  v0 = +[NSBundle bundleForClass:objc_opt_class()];
  id v1 = [v0 bundlePath];
  int v2 = [v1 stringByAppendingPathComponent:@"../../CoreServices/SystemVersion.plist"];
  id v3 = [v2 stringByStandardizingPath];

  uint64_t v4 = +[NSDictionary dictionaryWithContentsOfFile:v3];
  uint64_t v5 = [v4 objectForKey:@"ProductBuildVersion"];
  id v6 = +[NSString stringWithFormat:@"%@", v5];

  return v6;
}

id CRLProductName()
{
  v0 = +[NSBundle bundleForClass:objc_opt_class()];
  id v1 = [v0 bundlePath];
  int v2 = [v1 stringByAppendingPathComponent:@"../../CoreServices/SystemVersion.plist"];
  id v3 = [v2 stringByStandardizingPath];

  uint64_t v4 = +[NSDictionary dictionaryWithContentsOfFile:v3];
  uint64_t v5 = [v4 objectForKey:@"ProductName"];
  id v6 = +[NSString stringWithFormat:@"%@", v5];

  return v6;
}

uint64_t CRLProductBuildIndex()
{
  uint64_t result = CRLProductBuildIndex_s_buildIndex;
  if (!CRLProductBuildIndex_s_buildIndex)
  {
    id v1 = CRLProductBuildVersion();
    CRLProductBuildIndex_s_buildIndex = CRLBuildIndexFromBuildVersion(v1);

    return CRLProductBuildIndex_s_buildIndex;
  }
  return result;
}

id CRLSystemVersion()
{
  v0 = +[UIDevice currentDevice];
  id v1 = [v0 systemVersion];

  return v1;
}

uint64_t CRLSystemVersionNumber()
{
  v0 = CRLSystemVersion();
  uint64_t v1 = CRLVersionNumberFromString(v0);

  return v1;
}

uint64_t CRLVersionNumberFromString(void *a1)
{
  uint64_t v1 = [a1 componentsSeparatedByString:@"."];
  id v2 = [v1 count];
  if ((uint64_t)v2 < 1)
  {
    uint64_t v5 = 0;
  }
  else
  {
    unint64_t v3 = (unint64_t)v2;
    uint64_t v4 = [v1 objectAtIndexedSubscript:0];
    uint64_t v5 = 1000000 * (void)[v4 integerValue];

    if (v3 != 1)
    {
      id v6 = [v1 objectAtIndexedSubscript:1];
      v5 += 1000 * (void)[v6 integerValue];

      if (v3 >= 3)
      {
        unsigned int v7 = [v1 objectAtIndexedSubscript:2];
        v5 += (uint64_t)[v7 integerValue];
      }
    }
  }

  return v5;
}

id CRLValidPlatformTags()
{
  v0 = (void *)CRLValidPlatformTags_validPlatforms;
  if (!CRLValidPlatformTags_validPlatforms)
  {
    uint64_t v1 = +[NSMutableSet setWithObject:@"ios"];
    id v2 = (void *)CRLValidPlatformTags_validPlatforms;
    CRLValidPlatformTags_validPlatforms = v1;

    p_appendPlatformComponent((void *)CRLValidPlatformTags_validPlatforms, @"-arm");
    unint64_t v3 = (void *)CRLValidPlatformTags_validPlatforms;
    uint64_t v4 = +[UIScreen mainScreen];
    [v4 scale];
    if (v5 == 2.0) {
      id v6 = @"@2x";
    }
    else {
      id v6 = @"@1x";
    }
    p_appendPlatformComponent(v3, v6);

    [(id)CRLValidPlatformTags_validPlatforms addObject:@"default"];
    v0 = (void *)CRLValidPlatformTags_validPlatforms;
  }
  return v0;
}

void p_appendPlatformComponent(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  double v5 = +[NSMutableSet set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = +[NSString stringWithFormat:@"%@%@", *(void *)(*((void *)&v12 + 1) + 8 * (void)v10), v4, (void)v12];
        [v5 addObject:v11];

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [v6 unionSet:v5];
}

__CFString *CRLPlatformTag()
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v0 = CRLValidPlatformTags();
  id v1 = [v0 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = *(void *)v11;
    id v4 = &stru_29E20;
    do
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v11 != v3) {
          objc_enumerationMutation(v0);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v6, "isEqualToString:", @"default", (void)v10) & 1) == 0)
        {
          id v7 = [v6 length];
          if (v7 > [(__CFString *)v4 length])
          {
            id v8 = v6;

            id v4 = v8;
          }
        }
      }
      id v2 = [v0 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v2);
  }
  else
  {
    id v4 = &stru_29E20;
  }

  return v4;
}

id CRLPlatformSpecificStringForBuildIndex(void *a1, uint64_t a2)
{
  id v2 = a1;
  id v36 = 0;
  v35 = +[NSRegularExpression regularExpressionWithPattern:@"(?:\\[(ios|ios-sim|ios-sim@1x|ios-sim@2x|ios-arm|ios@2x|mac|mac32|mac64|default)(?:\\:([^\\]]*))?\\])?([^\\[]*)" options:1 error:&v36];
  id v32 = v36;
  uint64_t v3 = (char *)[v2 length];
  uint64_t v4 = 0;
  id v34 = 0;
  do
  {
    if (!v3) {
      break;
    }
    double v5 = objc_msgSend(v35, "firstMatchInString:options:range:", v2, 0, v4, v3);
    if (!v5) {
      break;
    }
    id v6 = v5;
    id v7 = [v5 rangeAtIndex:1];
    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
      id v9 = 0;
    }
    else {
      id v9 = v7;
    }
    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = v8;
    }
    long long v11 = objc_msgSend(v2, "substringWithRange:", v9, v10);
    id v12 = [v6 rangeAtIndex:2];
    if (v12 == (id)0x7FFFFFFFFFFFFFFFLL) {
      id v14 = 0;
    }
    else {
      id v14 = v12;
    }
    if (v12 == (id)0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = v13;
    }
    unint64_t v16 = objc_msgSend(v2, "substringWithRange:", v14, v15);
    id v17 = [v6 rangeAtIndex:3];
    if (v17 == (id)0x7FFFFFFFFFFFFFFFLL) {
      id v19 = 0;
    }
    else {
      id v19 = v17;
    }
    if (v17 == (id)0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = v18;
    }
    id v21 = objc_msgSend(v2, "substringWithRange:", v19, v20);
    if ([v11 length])
    {
      id v22 = CRLValidPlatformTags();
      unsigned int v23 = [v22 containsObject:v11];

      if (!v23) {
        goto LABEL_29;
      }
    }
    if (![v16 length])
    {
      id v29 = v21;

      char v27 = 0;
      id v34 = v29;
      goto LABEL_31;
    }
    v24 = CRLBuildIndexSetFromString(v16);
    uint64_t v25 = v24;
    if (!v24 || ([v24 containsIndex:a2] & 1) == 0)
    {

LABEL_29:
      [v6 rangeAtIndex:0];
      v4 += v28;
      v3 -= v28;
      char v27 = 1;
      goto LABEL_31;
    }
    id v26 = v21;

    char v27 = 0;
    id v34 = v26;
LABEL_31:
  }
  while ((v27 & 1) != 0);
  id v30 = v34;

  return v30;
}

id CRLPlatformSpecificString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = CRLProductBuildIndex();
  uint64_t v3 = CRLPlatformSpecificStringForBuildIndex(v1, v2);

  return v3;
}

void sub_65F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Cu);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return v0;
}

void CRLNormalizeRanges(void *a1)
{
  id v15 = a1;
  [v15 sortUsingFunction:compareRangeValues context:0];
  if ((unint64_t)[v15 count] >= 2)
  {
    unsigned int v1 = 0;
    unint64_t v2 = 1;
    do
    {
      uint64_t v3 = v1;
      unsigned int v1 = v2;
      uint64_t v4 = [v15 objectAtIndex:v3];
      id location = [v4 rangeValue];
      NSUInteger length = v6;

      uint64_t v8 = [v15 objectAtIndex:v2];
      id v9 = [v8 rangeValue];
      NSUInteger v11 = v10;
      while (1)
      {

        v17.id location = (NSUInteger)location;
        v17.NSUInteger length = length;
        v19.id location = (NSUInteger)v9;
        v19.NSUInteger length = v11;
        if (!NSIntersectionRange(v17, v19).length) {
          break;
        }
        v18.id location = (NSUInteger)location;
        v18.NSUInteger length = length;
        v20.id location = (NSUInteger)v9;
        v20.NSUInteger length = v11;
        NSRange v12 = NSUnionRange(v18, v20);
        id location = (id)v12.location;
        NSUInteger length = v12.length;
        uint64_t v8 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v12.location, v12.length);
        [v15 replaceObjectAtIndex:v3 withObject:v8];
        [v15 removeObjectAtIndex:v2];
        if ((unint64_t)[v15 count] <= v2)
        {
          NSUInteger v11 = 0;
        }
        else
        {
          uint64_t v13 = [v15 objectAtIndex:v2];
          id v9 = [v13 rangeValue];
          NSUInteger v11 = v14;
        }
      }
      unint64_t v2 = (v2 + 1);
    }
    while ((unint64_t)[v15 count] > v2);
  }
}

uint64_t compareRangeValues(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 rangeValue];
  id v5 = [v3 rangeValue];

  if (v4 < v5) {
    return -1;
  }
  else {
    return v4 > v5;
  }
}

id CRLIntersectionLocations(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 count];
  id v6 = [v4 count];
  if (v5 <= v6) {
    id v7 = v6;
  }
  else {
    id v7 = v5;
  }
  uint64_t v8 = +[NSMutableArray arrayWithCapacity:v7];
  id v9 = [v3 mutableCopy];
  id v10 = [v4 mutableCopy];
  CRLNormalizeRanges(v9);
  CRLNormalizeRanges(v10);
  if (v5 && v6)
  {
    while ([v9 count] && objc_msgSend(v10, "count"))
    {
      NSUInteger v11 = [v9 objectAtIndex:0];
      id v12 = [v11 rangeValue];
      NSUInteger v14 = v13;

      id v15 = [v10 objectAtIndex:0];
      id v16 = [v15 rangeValue];
      NSUInteger v18 = v17;

      v24.id location = (NSUInteger)v12;
      v24.NSUInteger length = v14;
      v26.id location = (NSUInteger)v16;
      v26.NSUInteger length = v18;
      if (NSIntersectionRange(v24, v26).length)
      {
        v25.id location = (NSUInteger)v12;
        v25.NSUInteger length = v14;
        v27.id location = (NSUInteger)v16;
        v27.NSUInteger length = v18;
        NSRange v19 = NSIntersectionRange(v25, v27);
        NSRange v20 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v19.location, v19.length);
        [v8 addObject:v20];
      }
      if (v12 >= v16) {
        id v21 = v10;
      }
      else {
        id v21 = v9;
      }
      [v21 removeObjectAtIndex:0];
    }
  }

  return v8;
}

id CRLUnionLocations(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 count];
  id v6 = [v4 count];
  if (v5 <= v6) {
    id v7 = v6;
  }
  else {
    id v7 = v5;
  }
  +[NSMutableArray arrayWithCapacity:v7];
  id v32 = v31 = v3;
  id v8 = [v3 mutableCopy];
  id v30 = v4;
  id v9 = [v4 mutableCopy];
  CRLNormalizeRanges(v8);
  CRLNormalizeRanges(v9);
LABEL_5:
  if ([v8 count] && objc_msgSend(v9, "count"))
  {
    id v10 = [v8 objectAtIndex:0];
    id v11 = [v10 rangeValue];
    NSUInteger v13 = v12;

    NSUInteger v14 = [v9 objectAtIndex:0];
    id v15 = [v14 rangeValue];
    NSUInteger v17 = v16;

    if (v11 >= v15) {
      NSUInteger length = v17;
    }
    else {
      NSUInteger length = v13;
    }
    if (v11 >= v15) {
      NSUInteger v19 = (NSUInteger)v15;
    }
    else {
      NSUInteger v19 = (NSUInteger)v11;
    }
    while (1)
    {
      while (1)
      {
        if (![v8 count] || !objc_msgSend(v9, "count"))
        {
LABEL_24:
          uint64_t v28 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v19, length);
          [v32 addObject:v28];

          goto LABEL_5;
        }
        v34.NSUInteger location = (NSUInteger)v11;
        v34.NSUInteger length = v13;
        v38.NSUInteger location = v19;
        v38.NSUInteger length = length;
        NSUInteger location = NSIntersectionRange(v34, v38).location;
        BOOL v21 = location != 0;
        if (location)
        {
          v35.NSUInteger location = (NSUInteger)v11;
          v35.NSUInteger length = v13;
          v39.NSUInteger location = v19;
          v39.NSUInteger length = length;
          NSRange v22 = NSUnionRange(v35, v39);
          NSUInteger v19 = v22.location;
          NSUInteger length = v22.length;
          [v8 removeObjectAtIndex:0];
          if ([v8 count])
          {
            unsigned int v23 = [v8 objectAtIndex:0];
            id v11 = [v23 rangeValue];
            NSUInteger v13 = v24;
          }
        }
        v36.NSUInteger location = (NSUInteger)v15;
        v36.NSUInteger length = v17;
        v40.NSUInteger location = v19;
        v40.NSUInteger length = length;
        if (NSIntersectionRange(v36, v40).location) {
          break;
        }
LABEL_21:
        if (!v21) {
          goto LABEL_24;
        }
      }
      v37.NSUInteger location = (NSUInteger)v15;
      v37.NSUInteger length = v17;
      v41.NSUInteger location = v19;
      v41.NSUInteger length = length;
      NSRange v25 = NSUnionRange(v37, v41);
      NSUInteger v19 = v25.location;
      NSUInteger length = v25.length;
      [v9 removeObjectAtIndex:0];
      if (![v9 count])
      {
        BOOL v21 = 1;
        goto LABEL_21;
      }
      NSRange v26 = [v9 objectAtIndex:0];
      id v15 = [v26 rangeValue];
      NSUInteger v17 = v27;
    }
  }
  [v32 addObjectsFromArray:v8];
  [v32 addObjectsFromArray:v9];

  return v32;
}

id CRLComplementLocations(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 count];
  id v6 = [v4 count];
  if (v5 <= v6) {
    id v7 = v6;
  }
  else {
    id v7 = v5;
  }
  id v8 = +[NSMutableArray arrayWithCapacity:v7];
  uint64_t v28 = v3;
  id v9 = [v3 mutableCopy];
  NSUInteger v27 = v4;
  id v10 = [v4 mutableCopy];
  CRLNormalizeRanges(v9);
  CRLNormalizeRanges(v10);
  id v11 = [v9 objectAtIndex:0];
  NSUInteger v12 = [v11 rangeValue];

  if ([v9 count])
  {
    int64_t v13 = 0;
    do
    {
      if (![v10 count]) {
        break;
      }
      NSUInteger v14 = [v9 objectAtIndex:0];
      id v15 = [v14 rangeValue];
      NSUInteger v17 = v16;

      NSUInteger v18 = [v10 objectAtIndex:0];
      NSUInteger v19 = [v18 rangeValue];
      NSUInteger v21 = v20;

      v30.NSUInteger location = (NSUInteger)v15;
      v30.NSUInteger length = v17;
      v31.NSUInteger location = (NSUInteger)v19;
      v31.NSUInteger length = v21;
      NSRange v22 = NSIntersectionRange(v30, v31);
      if (v22.location)
      {
        if (v22.location > (unint64_t)v12) {
          int64_t v13 = v22.location - (void)v12;
        }
        if (v13)
        {
          unsigned int v23 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v12, v13);
          [v8 addObject:v23];
        }
        if ((unint64_t)&v15[v17] <= v22.location + v22.length) {
          goto LABEL_16;
        }
        [v10 removeObjectAtIndex:0];
        int64_t v13 = 0;
        NSUInteger v12 = (unsigned char *)(v22.location + v22.length);
      }
      else
      {
        if (v19 > v15)
        {
          int64_t v13 = &v15[v17] - v12;
          NSUInteger v24 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v12, v13);
          [v8 addObject:v24];

LABEL_16:
          [v9 removeObjectAtIndex:0];
          if ([v9 count])
          {
            NSRange v25 = [v9 objectAtIndex:0];
            NSUInteger v12 = [v25 rangeValue];

            int64_t v13 = 0;
          }
          continue;
        }
        [v10 removeObjectAtIndex:0];
      }
    }
    while ([v9 count]);
  }

  return v8;
}

NSUInteger CRLIntersectionRangeWithEdge(NSRange a1, NSRange a2, int a3)
{
  NSUInteger length = a2.length;
  NSUInteger location = a2.location;
  NSUInteger v6 = a1.length;
  NSUInteger v7 = a1.location;
  NSRange v8 = NSIntersectionRange(a1, a2);
  if (length) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v7 | location) {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v11 = v10;
  }
  if (v8 == 0uLL) {
    NSUInteger v12 = v11;
  }
  else {
    NSUInteger v12 = v8.location;
  }
  if (location + length == v7) {
    NSUInteger v13 = v7;
  }
  else {
    NSUInteger v13 = v12;
  }
  if (v7 + v6 == location) {
    NSUInteger v14 = location;
  }
  else {
    NSUInteger v14 = v13;
  }
  if (a3) {
    return v14;
  }
  else {
    return v12;
  }
}

uint64_t CRLAdjustSelectionRangeForChangedRange(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = a1;
  if (!a5) {
    return v5;
  }
  if (a1 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_4);
    }
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      CRLAdjustSelectionRangeForChangedRange_cold_4();
    }
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_7);
    }
    NSUInteger v7 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      -[NSString(CRLAdditions) crl_stringByUniquingPathInsideDirectory:withFormat:](v7);
    }
    NSRange v8 = +[NSString stringWithUTF8String:"NSRange CRLAdjustSelectionRangeForChangedRange(NSRange, NSRange, NSInteger)"];
    BOOL v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLRangeUtils.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:218 isFatal:0 description:"Bad selectionRange passed to CRLAdjustSelectionRangeForChangedRange"];

    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    if (a3 != 0x7FFFFFFFFFFFFFFFLL) {
      return v5;
    }
    goto LABEL_14;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_14:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_12);
    }
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      CRLAdjustSelectionRangeForChangedRange_cold_2();
    }
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_15);
    }
    uint64_t v10 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      -[NSString(CRLAdditions) crl_stringByUniquingPathInsideDirectory:withFormat:](v10);
    }
    uint64_t v11 = +[NSString stringWithUTF8String:"NSRange CRLAdjustSelectionRangeForChangedRange(NSRange, NSRange, NSInteger)"];
    NSUInteger v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLRangeUtils.m"];
    NSUInteger v13 = "Bad changingRange passed to CRLAdjustSelectionRangeForChangedRange";
    NSUInteger v14 = v11;
    id v15 = v12;
    uint64_t v16 = 219;
LABEL_33:
    +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:v16 isFatal:0 description:v13];

    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (-a4 > a5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_19);
    }
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      CRLAdjustSelectionRangeForChangedRange_cold_6();
    }
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_22);
    }
    NSUInteger v18 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      -[NSString(CRLAdditions) crl_stringByUniquingPathInsideDirectory:withFormat:](v18);
    }
    uint64_t v11 = +[NSString stringWithUTF8String:"NSRange CRLAdjustSelectionRangeForChangedRange(NSRange, NSRange, NSInteger)"];
    NSUInteger v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLRangeUtils.m"];
    NSUInteger v13 = "Bad delta passed to CRLAdjustSelectionRangeForChangedRange";
    NSUInteger v14 = v11;
    id v15 = v12;
    uint64_t v16 = 223;
    goto LABEL_33;
  }
  unint64_t v20 = a1 + a2;
  if (a1 + a2 >= a3)
  {
    unint64_t v21 = a3 + a4;
    if (a3 + a4 >= a1)
    {
      if ((a3 != a1 || a4 != a2) && (a1 > a3 || v20 < v21) && a3 <= a1)
      {
        if (v21 >= v20)
        {
          if (-a2 > a5 && a1 >= a4 + a5 + a3) {
            return a4 + a5 + a3;
          }
        }
        else
        {
          if (a1 <= a3)
          {
            +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (CRLAssertCat_init_token != -1) {
              dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_26);
            }
            if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
              CRLAdjustSelectionRangeForChangedRange_cold_8();
            }
            if (CRLAssertCat_init_token != -1) {
              dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_29);
            }
            NSRange v22 = CRLAssertCat_log_t;
            if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
              -[NSString(CRLAdditions) crl_stringByUniquingPathInsideDirectory:withFormat:](v22);
            }
            unsigned int v23 = +[NSString stringWithUTF8String:"NSRange CRLAdjustSelectionRangeForChangedRange(NSRange, NSRange, NSInteger)"];
            NSUInteger v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLRangeUtils.m"];
            +[CRLAssertionHandler handleFailureInFunction:v23 file:v24 lineNumber:262 isFatal:0 description:"expected selectionRange to start within changingRange"];
          }
          if (a3 > v5 + a5) {
            return a3;
          }
        }
      }
    }
    else
    {
      return a1 + a5;
    }
  }
  return v5;
}

uint64_t enumerateAllSubrangesOfRange(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = result + a2;
  if (!__CFADD__(result, a2))
  {
    unint64_t v5 = result;
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = 0;
      do
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(a3 + 16))(a3, v5, v7, v6 + v7);
        ++v7;
      }
      while (v5 + v7 <= v3);
      ++v5;
      v6 += v7;
    }
    while (v5 <= v3);
  }
  return result;
}

NSUInteger NSIntersectionRangeInclusive(NSRange a1, NSRange range1)
{
  if (a1.location != range1.location + range1.length)
  {
    if (a1.location + a1.length == range1.location) {
      a1.NSUInteger location = range1.location;
    }
    else {
      a1.NSUInteger location = NSIntersectionRange(a1, range1).location;
    }
  }
  return a1.location;
}

unint64_t NSExpandedRange(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  unint64_t v5 = a4 + a5;
  if (a4 + a3 >= a1) {
    unint64_t v6 = a4;
  }
  else {
    unint64_t v6 = a1 - a3;
  }
  if (a1 + a2 + a3 < v5) {
    unint64_t v5 = a1 + a2 + a3;
  }
  if (v6 >= v5) {
    return v5;
  }
  else {
    return v6;
  }
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

uint64_t CRLVersionCurrent()
{
  return 0x3000200000000;
}

BOOL CRLVersionIsPatchSupportedForVersions(unint64_t a1, unint64_t *a2, uint64_t a3)
{
  BOOL v3 = 0;
  if (a3)
  {
    uint64_t v4 = HIDWORD(a1) & 0xFFFFFF;
    uint64_t v5 = a3 - 1;
    do
    {
      unint64_t v6 = *a2++;
      unint64_t v7 = HIDWORD(v6);
      BOOL v8 = (a1 & 0xFFFFFF) >= v6;
      if (v4 == HIDWORD(v6)) {
        BOOL v3 = v8;
      }
    }
    while (v4 < v7 && v5-- != 0);
  }
  return v3;
}

BOOL CRLVersionIsTooNew(unint64_t a1)
{
  return a1 > 0x3000200000000;
}

BOOL CRLVersionIsSupported(unint64_t a1)
{
  return a1 < 0x3000200000001;
}

uint64_t CRLVersionParse(uint64_t result, _WORD *a2, _WORD *a3, _DWORD *a4)
{
  if (a2) {
    *a2 = HIWORD(result);
  }
  if (a3) {
    *a3 = WORD2(result);
  }
  if (a4) {
    *a4 = result;
  }
  return result;
}

uint64_t CRLVersionMake(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return (a1 << 48) | (a2 << 32) | a3;
}

unint64_t CRLVersionFromNSString(void *a1)
{
  unsigned int v1 = [a1 componentsSeparatedByString:@"."];
  if ([v1 count] == (char *)&dword_0 + 3)
  {
    unint64_t v2 = [v1 objectAtIndexedSubscript:0];
    uint64_t v3 = (uint64_t)[v2 integerValue];

    if (v3 >= 0x10000)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (CRLAssertCat_init_token != -1) {
        dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_11);
      }
      if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        CRLVersionFromNSString_cold_10();
      }
      if (CRLAssertCat_init_token != -1) {
        dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_14);
      }
      NSUInteger v14 = CRLAssertCat_log_t;
      if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        -[NSString(CRLAdditions) crl_stringByUniquingPathInsideDirectory:withFormat:](v14);
      }
      id v15 = +[NSString stringWithUTF8String:"CRLVersion CRLVersionFromNSString(NSString * _Nonnull __strong)"];
      uint64_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLVersion.m"];
      +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:141 isFatal:0 description:"Out-of-bounds type assignment was clamped to max"];
      uint64_t v3 = 0xFFFFLL;
    }
    else
    {
      if ((v3 & 0x8000000000000000) == 0) {
        goto LABEL_4;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (CRLAssertCat_init_token != -1) {
        dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_18);
      }
      if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        CRLVersionFromNSString_cold_12();
      }
      if (CRLAssertCat_init_token != -1) {
        dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_21);
      }
      unsigned int v23 = CRLAssertCat_log_t;
      if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        -[NSString(CRLAdditions) crl_stringByUniquingPathInsideDirectory:withFormat:](v23);
      }
      id v15 = +[NSString stringWithUTF8String:"CRLVersion CRLVersionFromNSString(NSString * _Nonnull __strong)"];
      uint64_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLVersion.m"];
      +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:141 isFatal:0 description:"Out-of-bounds type assignment was clamped to min"];
      uint64_t v3 = 0;
    }

LABEL_4:
    uint64_t v4 = [v1 objectAtIndexedSubscript:1];
    uint64_t v5 = (uint64_t)[v4 integerValue];

    if (v5 >= 0x10000)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (CRLAssertCat_init_token != -1) {
        dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_25);
      }
      if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        CRLVersionFromNSString_cold_6();
      }
      if (CRLAssertCat_init_token != -1) {
        dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_28);
      }
      NSUInteger v17 = CRLAssertCat_log_t;
      if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        -[NSString(CRLAdditions) crl_stringByUniquingPathInsideDirectory:withFormat:](v17);
      }
      NSUInteger v18 = +[NSString stringWithUTF8String:"CRLVersion CRLVersionFromNSString(NSString * _Nonnull __strong)"];
      NSUInteger v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLVersion.m"];
      +[CRLAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:142 isFatal:0 description:"Out-of-bounds type assignment was clamped to max"];

      unint64_t v6 = 0xFFFF00000000;
    }
    else if (v5 < 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (CRLAssertCat_init_token != -1) {
        dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_31);
      }
      if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        CRLVersionFromNSString_cold_8();
      }
      if (CRLAssertCat_init_token != -1) {
        dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_34);
      }
      NSUInteger v24 = CRLAssertCat_log_t;
      if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        -[NSString(CRLAdditions) crl_stringByUniquingPathInsideDirectory:withFormat:](v24);
      }
      NSRange v25 = +[NSString stringWithUTF8String:"CRLVersion CRLVersionFromNSString(NSString * _Nonnull __strong)"];
      NSRange v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLVersion.m"];
      +[CRLAssertionHandler handleFailureInFunction:v25 file:v26 lineNumber:142 isFatal:0 description:"Out-of-bounds type assignment was clamped to min"];

      unint64_t v6 = 0;
    }
    else
    {
      unint64_t v6 = (unint64_t)(unsigned __int16)v5 << 32;
    }
    unint64_t v7 = [v1 objectAtIndexedSubscript:2];
    uint64_t v8 = (uint64_t)[v7 integerValue];

    if (v8 >= 0x100000000)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (CRLAssertCat_init_token != -1) {
        dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_37);
      }
      if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        CRLVersionFromNSString_cold_2();
      }
      if (CRLAssertCat_init_token != -1) {
        dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_40);
      }
      unint64_t v20 = CRLAssertCat_log_t;
      if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        -[NSString(CRLAdditions) crl_stringByUniquingPathInsideDirectory:withFormat:](v20);
      }
      unint64_t v21 = +[NSString stringWithUTF8String:"CRLVersion CRLVersionFromNSString(NSString * _Nonnull __strong)"];
      NSRange v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLVersion.m"];
      +[CRLAssertionHandler handleFailureInFunction:v21 file:v22 lineNumber:143 isFatal:0 description:"Out-of-bounds type assignment was clamped to max"];
      uint64_t v8 = 0xFFFFFFFFLL;
    }
    else
    {
      if ((v8 & 0x8000000000000000) == 0)
      {
LABEL_9:
        unint64_t v9 = v8 | v6 | (v3 << 48);
        goto LABEL_19;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (CRLAssertCat_init_token != -1) {
        dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_43);
      }
      if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        CRLVersionFromNSString_cold_4();
      }
      if (CRLAssertCat_init_token != -1) {
        dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_46);
      }
      NSUInteger v27 = CRLAssertCat_log_t;
      if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        -[NSString(CRLAdditions) crl_stringByUniquingPathInsideDirectory:withFormat:](v27);
      }
      unint64_t v21 = +[NSString stringWithUTF8String:"CRLVersion CRLVersionFromNSString(NSString * _Nonnull __strong)"];
      NSRange v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLVersion.m"];
      +[CRLAssertionHandler handleFailureInFunction:v21 file:v22 lineNumber:143 isFatal:0 description:"Out-of-bounds type assignment was clamped to min"];
      uint64_t v8 = 0;
    }

    goto LABEL_9;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (CRLAssertCat_init_token != -1) {
    dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_5);
  }
  if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    CRLVersionFromNSString_cold_14();
  }
  if (CRLAssertCat_init_token != -1) {
    dispatch_once(&CRLAssertCat_init_token, &__block_literal_global_6);
  }
  uint64_t v10 = CRLAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    -[NSString(CRLAdditions) crl_stringByUniquingPathInsideDirectory:withFormat:](v10);
  }
  uint64_t v11 = +[NSString stringWithUTF8String:"CRLVersion CRLVersionFromNSString(NSString * _Nonnull __strong)"];
  NSUInteger v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLVersion.m"];
  +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:137 isFatal:0 description:"Version should consist of 3 numbers separated by '.'"];

  unint64_t v9 = 0;
LABEL_19:

  return v9;
}

NSString *NSStringFromCRLVersion(unint64_t a1)
{
  return +[NSString stringWithFormat:@"%u.%u.%u", HIWORD(a1), WORD2(a1), a1];
}

uint64_t NSStringFromCRLError(unsigned int a1)
{
  if (a1 > 5) {
    return 0;
  }
  else {
    return (uint64_t)*(&off_29478 + (int)a1);
  }
}

id CRLAppBundleIdentifier()
{
  if (CRLAppBundleIdentifier_onceToken != -1) {
    dispatch_once(&CRLAppBundleIdentifier_onceToken, &__block_literal_global_6);
  }
  uint64_t v0 = (void *)CRLAppBundleIdentifier_identifier;
  return v0;
}

id CRLAppGroupIdentifier()
{
  if (CRLAppGroupIdentifier_onceToken != -1) {
    dispatch_once(&CRLAppGroupIdentifier_onceToken, &__block_literal_global_7_0);
  }
  uint64_t v0 = (void *)CRLAppGroupIdentifier_identifier;
  return v0;
}

intptr_t CRLDynamicBaseAddress()
{
  uint64_t v0 = getsectbyname("__TEXT", "__text");
  uint64_t addr = v0->addr;
  uint64_t offset = v0->offset;
  uint32_t bufsize = 1024;
  if (_NSGetExecutablePath(buf, &bufsize))
  {
    intptr_t image_vmaddr_slide = -1;
  }
  else if (_dyld_image_count())
  {
    uint32_t v4 = 0;
    while (1)
    {
      image_name = _dyld_get_image_name(v4);
      if (!strcmp(image_name, buf)) {
        break;
      }
      if (++v4 >= _dyld_image_count()) {
        goto LABEL_7;
      }
    }
    intptr_t image_vmaddr_slide = _dyld_get_image_vmaddr_slide(v4);
  }
  else
  {
LABEL_7:
    intptr_t image_vmaddr_slide = 0;
  }
  return addr - offset + image_vmaddr_slide;
}

void CRLCrashFinalThrow()
{
  id v0 = +[NSException exceptionWithName:@"CRLCrash" reason:@"CRLCrash was called" userInfo:0];
  objc_exception_throw(v0);
}

void CRLSetCrashReporterInfov(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = a2;
  uint64_t v8 = a2;
  unint64_t v2 = +[NSString stringWithUTF8String:a1];
  id v3 = objc_msgSend(objc_alloc((Class)NSString), "crl_initRedactedWithFormat:arguments:", v2, v7);
  uint32_t v4 = (const char *)[v3 UTF8String];
  unint64_t v6 = 0;
  if (v4)
  {
    asprintf(&v6, "%s", v4);
    uint64_t v5 = v6;
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (!v5) {
    uint64_t v5 = "CRLSetCrashReporterInfo: unknown reason";
  }
  __crashreporter_info__ = (uint64_t)v5;
}

void CRLSetCrashReporterInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

NSString one-time initialization function for deviceManagementRestrictionsChangedNotificationName()
{
  NSString result = String._bridgeToObjectiveC()();
  static CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName = (uint64_t)result;
  return result;
}

uint64_t *CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName.unsafeMutableAddressor()
{
  if (one-time initialization token for deviceManagementRestrictionsChangedNotificationName != -1) {
    swift_once();
  }
  return &static CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName;
}

id static CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName.getter()
{
  return static CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName.getter(&one-time initialization token for deviceManagementRestrictionsChangedNotificationName, (void **)&static CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName);
}

uint64_t variable initialization expression of CRLDeviceManagementRestrictionsManager.isKeyboardMathSolvingAllowed()
{
  return 1;
}

uint64_t CRLDeviceManagementRestrictionsManager.isMathPaperSolvingAllowed.getter()
{
  unsigned int v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed);
  swift_beginAccess();
  return *v1;
}

uint64_t key path getter for CRLDeviceManagementRestrictionsManager.isMathPaperSolvingAllowed : CRLDeviceManagementRestrictionsManager@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return key path getter for CRLDeviceManagementRestrictionsManager.isMathPaperSolvingAllowed : CRLDeviceManagementRestrictionsManager(a1, &OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed, a2);
}

uint64_t key path setter for CRLDeviceManagementRestrictionsManager.isMathPaperSolvingAllowed : CRLDeviceManagementRestrictionsManager(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CRLDeviceManagementRestrictionsManager.isMathPaperSolvingAllowed : CRLDeviceManagementRestrictionsManager(a1, a2, a3, a4, &OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed);
}

uint64_t CRLDeviceManagementRestrictionsManager.isKeyboardMathSolvingAllowed.getter()
{
  unsigned int v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed);
  swift_beginAccess();
  return *v1;
}

uint64_t key path getter for CRLDeviceManagementRestrictionsManager.isKeyboardMathSolvingAllowed : CRLDeviceManagementRestrictionsManager@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return key path getter for CRLDeviceManagementRestrictionsManager.isMathPaperSolvingAllowed : CRLDeviceManagementRestrictionsManager(a1, &OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed, a2);
}

uint64_t key path setter for CRLDeviceManagementRestrictionsManager.isKeyboardMathSolvingAllowed : CRLDeviceManagementRestrictionsManager(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CRLDeviceManagementRestrictionsManager.isMathPaperSolvingAllowed : CRLDeviceManagementRestrictionsManager(a1, a2, a3, a4, &OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed);
}

uint64_t CRLDeviceManagementRestrictionsManager.isDefinitionLookupAllowed.getter()
{
  unsigned int v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed);
  swift_beginAccess();
  return *v1;
}

uint64_t key path getter for CRLDeviceManagementRestrictionsManager.isDefinitionLookupAllowed : CRLDeviceManagementRestrictionsManager@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return key path getter for CRLDeviceManagementRestrictionsManager.isMathPaperSolvingAllowed : CRLDeviceManagementRestrictionsManager(a1, &OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed, a2);
}

uint64_t key path getter for CRLDeviceManagementRestrictionsManager.isMathPaperSolvingAllowed : CRLDeviceManagementRestrictionsManager@<X0>(void *a1@<X0>, void *a2@<X3>, unsigned char *a3@<X8>)
{
  uint32_t v4 = (unsigned char *)(*a1 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t key path setter for CRLDeviceManagementRestrictionsManager.isDefinitionLookupAllowed : CRLDeviceManagementRestrictionsManager(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CRLDeviceManagementRestrictionsManager.isMathPaperSolvingAllowed : CRLDeviceManagementRestrictionsManager(a1, a2, a3, a4, &OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed);
}

uint64_t key path setter for CRLDeviceManagementRestrictionsManager.isMathPaperSolvingAllowed : CRLDeviceManagementRestrictionsManager(char *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v5 = *a1;
  unint64_t v6 = (unsigned char *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  unsigned char *v6 = v5;
  return result;
}

id CRLDeviceManagementRestrictionsManager.connection.getter()
{
  uint64_t v1 = OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager____lazy_storage___connection;
  unint64_t v2 = *(char **)(v0
                + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager____lazy_storage___connection);
  id v3 = v2;
  if (v2 == (unsigned char *)&dword_0 + 1)
  {
    id v3 = [self sharedConnection];
    uint32_t v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    id v5 = v3;
    outlined consume of MCProfileConnection??(v4);
  }
  outlined copy of MCProfileConnection??(v2);
  return v3;
}

id CRLDeviceManagementRestrictionsManager.__deallocating_deinit()
{
  id v1 = CRLDeviceManagementRestrictionsManager.connection.getter();
  if (v1)
  {
    unint64_t v2 = v1;
    [v1 unregisterObserver:v0];
  }
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for CRLDeviceManagementRestrictionsManager();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for CRLDeviceManagementRestrictionsManager()
{
  return self;
}

void one-time initialization function for _sharedManager()
{
  id v0 = [objc_allocWithZone((Class)type metadata accessor for CRLDeviceManagementRestrictionsManager()) init];
  CRLDeviceManagementRestrictionsManager.registerObserver()();
  static CRLDeviceManagementRestrictionsManager._sharedManager = (uint64_t)v0;
}

id CRLDeviceManagementRestrictionsManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

id @objc static CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName.getter(uint64_t a1, uint64_t a2, void *a3, void **a4)
{
  if (*a3 != -1) {
    swift_once();
  }
  id v5 = *a4;
  return v5;
}

id static CRLDeviceManagementRestrictionsManager.shared.getter()
{
  return static CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName.getter(&one-time initialization token for _sharedManager, (void **)&static CRLDeviceManagementRestrictionsManager._sharedManager);
}

id static CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName.getter(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  id v3 = *a2;
  return v3;
}

Swift::Void __swiftcall CRLDeviceManagementRestrictionsManager.registerObserver()()
{
  id v1 = CRLDeviceManagementRestrictionsManager.connection.getter();
  if (v1)
  {
    unint64_t v2 = v1;
    [v1 registerObserver:v0];
  }
  id v3 = CRLDeviceManagementRestrictionsManager.connection.getter();
  if (v3)
  {
    objc_super v4 = v3;
    unsigned __int8 v5 = [v3 isMathPaperSolvingAllowed];
  }
  else
  {
    unsigned __int8 v5 = 1;
  }
  unint64_t v6 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed);
  unsigned __int8 v7 = 1;
  swift_beginAccess();
  unsigned __int8 *v6 = v5;
  id v8 = CRLDeviceManagementRestrictionsManager.connection.getter();
  if (v8)
  {
    unint64_t v9 = v8;
    unsigned __int8 v7 = [v8 isKeyboardMathSolvingAllowed];
  }
  uint64_t v10 = (unsigned __int8 *)(v0
                          + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed);
  unsigned __int8 v11 = 1;
  swift_beginAccess();
  unsigned __int8 *v10 = v7;
  id v12 = CRLDeviceManagementRestrictionsManager.connection.getter();
  if (v12)
  {
    NSUInteger v13 = v12;
    unsigned __int8 v11 = [v12 isDefinitionLookupAllowed];
  }
  NSUInteger v14 = (unsigned __int8 *)(v0
                          + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed);
  swift_beginAccess();
  *NSUInteger v14 = v11;
}

id CRLDeviceManagementRestrictionsManager.init()()
{
  v0[OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed] = 1;
  v0[OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed] = 1;
  v0[OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed] = 1;
  *(void *)&v0[OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager____lazy_storage___connection] = 1;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CRLDeviceManagementRestrictionsManager();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance ACAccountDataclass(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance ACAccountDataclass(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance ACAccountDataclass(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance ACAccountDataclass(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance ACAccountDataclass@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance ACAccountDataclass@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance ACAccountDataclass@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance ACAccountDataclass(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type ACAccountDataclass and conformance ACAccountDataclass(&lazy protocol witness table cache variable for type ACAccountDataclass and conformance ACAccountDataclass);
  uint64_t v3 = lazy protocol witness table accessor for type ACAccountDataclass and conformance ACAccountDataclass((unint64_t *)&lazy protocol witness table cache variable for type ACAccountDataclass and conformance ACAccountDataclass);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance ACAccountDataclass(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance ACAccountDataclass(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance ACAccountDataclass(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance ACAccountDataclass()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ACAccountDataclass()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ACAccountDataclass()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void specialized CRLDeviceManagementRestrictionsManager.profileConnectionDidReceiveEffectiveSettingsChangedNotification(_:userInfo:)(void *a1)
{
  if (!a1)
  {
    __break(1u);
    return;
  }
  unsigned __int8 v3 = [a1 isMathPaperSolvingAllowed];
  uint64_t v4 = (unsigned char *)(v1
               + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed);
  swift_beginAccess();
  char v5 = v3 ^ *v4;
  if (v5) {
    *uint64_t v4 = [a1 isMathPaperSolvingAllowed];
  }
  unsigned int v6 = [a1 isKeyboardMathSolvingAllowed];
  unsigned __int8 v7 = (unsigned char *)(v1
               + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed);
  swift_beginAccess();
  if (v6 != *v7)
  {
    *unsigned __int8 v7 = [a1 isKeyboardMathSolvingAllowed];
    char v5 = 1;
  }
  unsigned int v8 = [a1 isDefinitionLookupAllowed];
  unint64_t v9 = (unsigned char *)(v1
               + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed);
  swift_beginAccess();
  if (v8 == *v9)
  {
    if ((v5 & 1) == 0) {
      return;
    }
  }
  else
  {
    unsigned char *v9 = [a1 isDefinitionLookupAllowed];
  }
  id v10 = [self defaultCenter];
  if (one-time initialization token for deviceManagementRestrictionsChangedNotificationName != -1) {
    swift_once();
  }
  [v10 postNotificationName:static CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName object:0 userInfo:0];
}

void outlined consume of MCProfileConnection??(id a1)
{
  if (a1 != (char *)&dword_0 + 1) {
}
  }

id outlined copy of MCProfileConnection??(id result)
{
  if (result != (char *)&dword_0 + 1) {
    return result;
  }
  return result;
}

void type metadata accessor for ACAccountDataclass()
{
  if (!lazy cache variable for type metadata for ACAccountDataclass)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for ACAccountDataclass);
    }
  }
}

uint64_t base witness table accessor for RawRepresentable in ACAccountDataclass()
{
  return lazy protocol witness table accessor for type ACAccountDataclass and conformance ACAccountDataclass(&lazy protocol witness table cache variable for type ACAccountDataclass and conformance ACAccountDataclass);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in ACAccountDataclass()
{
  return lazy protocol witness table accessor for type ACAccountDataclass and conformance ACAccountDataclass(&lazy protocol witness table cache variable for type ACAccountDataclass and conformance ACAccountDataclass);
}

uint64_t base witness table accessor for Equatable in ACAccountDataclass()
{
  return lazy protocol witness table accessor for type ACAccountDataclass and conformance ACAccountDataclass(&lazy protocol witness table cache variable for type ACAccountDataclass and conformance ACAccountDataclass);
}

uint64_t lazy protocol witness table accessor for type ACAccountDataclass and conformance ACAccountDataclass(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ACAccountDataclass();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void UUID.UUIDCodingError.hash(into:)()
{
}

Swift::Int UUID.UUIDCodingError.hashValue.getter()
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance UUID.UUIDCodingError()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Error._domain.getter in conformance UUID.UUIDCodingError()
{
  return Error._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance UUID.UUIDCodingError()
{
  return Error._code.getter();
}

uint64_t protocol witness for Error._userInfo.getter in conformance UUID.UUIDCodingError()
{
  return Error._userInfo.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance UUID.UUIDCodingError()
{
  return Error._getEmbeddedNSError()();
}

uint64_t UUID.init(crl_data:)(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2 >> 62;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v5) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
      uint64_t v5 = (int)v5;
LABEL_6:
      if (v5 == 16)
      {
        if (!v2) {
          goto LABEL_18;
        }
        if (v2 != 1)
        {
          uint64_t v9 = *(void *)(a1 + 16);
          swift_retain();
          swift_retain();
          if (!__DataStorage._bytes.getter())
          {
LABEL_26:
            __DataStorage._length.getter();
            __break(1u);
            JUMPOUT(0x1056CLL);
          }
          if (!__OFSUB__(v9, __DataStorage._offset.getter()))
          {
            __DataStorage._length.getter();
            swift_release();
            swift_release();
            goto LABEL_18;
          }
          goto LABEL_23;
        }
        if ((int)a1 <= a1 >> 32)
        {
          if (!__DataStorage._bytes.getter())
          {
LABEL_25:
            __DataStorage._length.getter();
            __break(1u);
            goto LABEL_26;
          }
          if (!__OFSUB__((int)a1, __DataStorage._offset.getter()))
          {
            __DataStorage._length.getter();
LABEL_18:
            UUID.init(uuid:)();
            return outlined consume of Data._Representation(a1, a2);
          }
LABEL_24:
          __break(1u);
          goto LABEL_25;
        }
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
LABEL_13:
      lazy protocol witness table accessor for type UUID.UUIDCodingError and conformance UUID.UUIDCodingError();
      swift_allocError();
      swift_willThrow();
      return outlined consume of Data._Representation(a1, a2);
    case 2uLL:
      uint64_t v7 = *(void *)(a1 + 16);
      uint64_t v6 = *(void *)(a1 + 24);
      BOOL v8 = __OFSUB__(v6, v7);
      uint64_t v5 = v6 - v7;
      if (!v8) {
        goto LABEL_6;
      }
      goto LABEL_21;
    case 3uLL:
      goto LABEL_13;
    default:
      uint64_t v5 = BYTE6(a2);
      goto LABEL_6;
  }
}

unint64_t lazy protocol witness table accessor for type UUID.UUIDCodingError and conformance UUID.UUIDCodingError()
{
  unint64_t result = lazy protocol witness table cache variable for type UUID.UUIDCodingError and conformance UUID.UUIDCodingError;
  if (!lazy protocol witness table cache variable for type UUID.UUIDCodingError and conformance UUID.UUIDCodingError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UUID.UUIDCodingError and conformance UUID.UUIDCodingError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UUID.UUIDCodingError and conformance UUID.UUIDCodingError;
  if (!lazy protocol witness table cache variable for type UUID.UUIDCodingError and conformance UUID.UUIDCodingError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UUID.UUIDCodingError and conformance UUID.UUIDCodingError);
  }
  return result;
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t UUID.crl_data()()
{
  uint64_t __src = UUID.uuid.getter();
  char v10 = v0;
  char v11 = v1;
  char v12 = v2;
  char v13 = v3;
  char v14 = v4;
  char v15 = v5;
  char v16 = v6;
  char v17 = v7;
  UUID.uuid.getter();
  return specialized Data.init(bytes:count:)(&__src, 16);
}

uint64_t specialized Data.InlineData.init(_:)(unsigned char *__src, unsigned char *a2)
{
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t specialized Data.init(bytes:count:)(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return specialized Data.InlineData.init(_:)(__src, &__src[a2]);
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  __DataStorage.init(bytes:length:)();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  type metadata accessor for Data.RangeReference();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UUID.UUIDCodingError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for UUID.UUIDCodingError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x109C0);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t getEnumTag for UUID.UUIDCodingError()
{
  return 0;
}

ValueMetadata *type metadata accessor for UUID.UUIDCodingError()
{
  return &type metadata for UUID.UUIDCodingError;
}

const char *CRLFeatureFlags.feature.getter(char a1)
{
  uint64_t result = "AdoptTipsNext";
  switch(a1)
  {
    case 1:
      uint64_t result = "AppAnalytics";
      break;
    case 2:
      uint64_t result = "AppIntents";
      break;
    case 3:
      uint64_t result = "AppIntentsSettings";
      break;
    case 4:
      uint64_t result = "BetterPencilSelection";
      break;
    case 5:
      uint64_t result = "ChangeShape";
      break;
    case 6:
      uint64_t result = "CloudQuotaMessaging";
      break;
    case 7:
      uint64_t result = "DrawingDataDetectors";
      break;
    case 8:
      uint64_t result = "EasierConnectionLines";
      break;
    case 9:
      uint64_t result = "FileImportExport";
      break;
    case 10:
      uint64_t result = "PKDrawingExport";
      break;
    case 11:
      uint64_t result = "Folders";
      break;
    case 12:
      uint64_t result = "Follow";
      break;
    case 13:
      uint64_t result = "GenerativePlayground";
      break;
    case 14:
      uint64_t result = "HandwritingIntelligence";
      break;
    case 15:
      uint64_t result = "MathPaper";
      break;
    case 16:
      uint64_t result = "MagicLists";
      break;
    case 17:
      uint64_t result = "Scenes";
      break;
    case 18:
      uint64_t result = "SendACopy";
      break;
    case 19:
      uint64_t result = "SnapToGrid";
      break;
    case 20:
      uint64_t result = "Stencils";
      break;
    case 21:
      uint64_t result = "ThreeDimensionalObjects";
      break;
    case 22:
      uint64_t result = "ToolPickerItemAPI";
      break;
    case 23:
      uint64_t result = "VerticalTextBoxAlignment";
      break;
    case 24:
      uint64_t result = "AllowMinRequiredVersionForGoodEnoughFidelityToSaveToCloudKit";
      break;
    case 25:
      uint64_t result = "UseSandboxEnvironment";
      break;
    default:
      return result;
  }
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CRLFeatureFlags(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CRLFeatureFlags()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CRLFeatureFlags()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CRLFeatureFlags()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

const char *protocol witness for FeatureFlagsKey.domain.getter in conformance CRLFeatureFlags()
{
  return "Freeform";
}

const char *protocol witness for FeatureFlagsKey.feature.getter in conformance CRLFeatureFlags()
{
  return CRLFeatureFlags.feature.getter(*v0);
}

const char *protocol witness for FeatureFlagsKey.domain.getter in conformance CRLUIKitFeatureFlags()
{
  return "UIKit";
}

const char *protocol witness for FeatureFlagsKey.feature.getter in conformance CRLUIKitFeatureFlags()
{
  return "redesigned_text_cursor";
}

const char *protocol witness for FeatureFlagsKey.domain.getter in conformance CRLAppleAccountFeatureFlags()
{
  return "AppleAccount";
}

const char *protocol witness for FeatureFlagsKey.feature.getter in conformance CRLAppleAccountFeatureFlags()
{
  return "AABranding";
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CRLPencilAndPaperFeatureFlags(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

const char *protocol witness for FeatureFlagsKey.domain.getter in conformance CRLPencilAndPaperFeatureFlags()
{
  return "PencilAndPaper";
}

const char *protocol witness for FeatureFlagsKey.feature.getter in conformance CRLPencilAndPaperFeatureFlags()
{
  if (*v0) {
    return "DrawingDataDetectors";
  }
  else {
    return "MathPaper";
  }
}

uint64_t @objc static CRLFeatureFlagGroup.isDrawingDataDetectorsEnabled.getter(uint64_t a1, uint64_t a2, char a3, char a4)
{
  char v10 = &type metadata for CRLPencilAndPaperFeatureFlags;
  unint64_t v11 = lazy protocol witness table accessor for type CRLPencilAndPaperFeatureFlags and conformance CRLPencilAndPaperFeatureFlags();
  v9[0] = a3;
  char v6 = isFeatureEnabled(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  if (v6)
  {
    char v10 = &type metadata for CRLFeatureFlags;
    unint64_t v11 = lazy protocol witness table accessor for type CRLFeatureFlags and conformance CRLFeatureFlags();
    v9[0] = a4;
    char v7 = isFeatureEnabled(_:)();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }
  else
  {
    char v7 = 0;
  }
  return v7 & 1;
}

uint64_t @objc static CRLFeatureFlagGroup.isAaBrandingEnabled.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v7 = a3;
  uint64_t v8 = a4();
  char v4 = isFeatureEnabled(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4 & 1;
}

uint64_t @objc static CRLFeatureFlagGroup.isAdoptTipsNextEnabled.getter(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = &type metadata for CRLFeatureFlags;
  unint64_t v8 = lazy protocol witness table accessor for type CRLFeatureFlags and conformance CRLFeatureFlags();
  v6[0] = a3;
  char v4 = isFeatureEnabled(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4 & 1;
}

id CRLFeatureFlagGroup.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CRLFeatureFlagGroup();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CRLFeatureFlagGroup()
{
  return self;
}

unint64_t lazy protocol witness table accessor for type CRLFeatureFlags and conformance CRLFeatureFlags()
{
  unint64_t result = lazy protocol witness table cache variable for type CRLFeatureFlags and conformance CRLFeatureFlags;
  if (!lazy protocol witness table cache variable for type CRLFeatureFlags and conformance CRLFeatureFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CRLFeatureFlags and conformance CRLFeatureFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CRLFeatureFlags and conformance CRLFeatureFlags;
  if (!lazy protocol witness table cache variable for type CRLFeatureFlags and conformance CRLFeatureFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CRLFeatureFlags and conformance CRLFeatureFlags);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t lazy protocol witness table accessor for type CRLUIKitFeatureFlags and conformance CRLUIKitFeatureFlags()
{
  unint64_t result = lazy protocol witness table cache variable for type CRLUIKitFeatureFlags and conformance CRLUIKitFeatureFlags;
  if (!lazy protocol witness table cache variable for type CRLUIKitFeatureFlags and conformance CRLUIKitFeatureFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CRLUIKitFeatureFlags and conformance CRLUIKitFeatureFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CRLUIKitFeatureFlags and conformance CRLUIKitFeatureFlags;
  if (!lazy protocol witness table cache variable for type CRLUIKitFeatureFlags and conformance CRLUIKitFeatureFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CRLUIKitFeatureFlags and conformance CRLUIKitFeatureFlags);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CRLPencilAndPaperFeatureFlags and conformance CRLPencilAndPaperFeatureFlags()
{
  unint64_t result = lazy protocol witness table cache variable for type CRLPencilAndPaperFeatureFlags and conformance CRLPencilAndPaperFeatureFlags;
  if (!lazy protocol witness table cache variable for type CRLPencilAndPaperFeatureFlags and conformance CRLPencilAndPaperFeatureFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CRLPencilAndPaperFeatureFlags and conformance CRLPencilAndPaperFeatureFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CRLPencilAndPaperFeatureFlags and conformance CRLPencilAndPaperFeatureFlags;
  if (!lazy protocol witness table cache variable for type CRLPencilAndPaperFeatureFlags and conformance CRLPencilAndPaperFeatureFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CRLPencilAndPaperFeatureFlags and conformance CRLPencilAndPaperFeatureFlags);
  }
  return result;
}

uint64_t specialized static CRLFeatureFlagGroup.isMathPaperEnabled.getter()
{
  uint64_t v5 = &type metadata for CRLPencilAndPaperFeatureFlags;
  unint64_t v6 = lazy protocol witness table accessor for type CRLPencilAndPaperFeatureFlags and conformance CRLPencilAndPaperFeatureFlags();
  v4[0] = 0;
  char v0 = isFeatureEnabled(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  uint64_t result = 0;
  if (v0)
  {
    uint64_t v5 = &type metadata for CRLFeatureFlags;
    unint64_t v6 = lazy protocol witness table accessor for type CRLFeatureFlags and conformance CRLFeatureFlags();
    v4[0] = 15;
    char v2 = isFeatureEnabled(_:)();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
    if (v2)
    {
      if (one-time initialization token for _sharedManager != -1) {
        swift_once();
      }
      int v3 = (unsigned __int8 *)(static CRLDeviceManagementRestrictionsManager._sharedManager
                             + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed);
      swift_beginAccess();
      return *v3;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CRLAppleAccountFeatureFlags and conformance CRLAppleAccountFeatureFlags()
{
  unint64_t result = lazy protocol witness table cache variable for type CRLAppleAccountFeatureFlags and conformance CRLAppleAccountFeatureFlags;
  if (!lazy protocol witness table cache variable for type CRLAppleAccountFeatureFlags and conformance CRLAppleAccountFeatureFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CRLAppleAccountFeatureFlags and conformance CRLAppleAccountFeatureFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CRLAppleAccountFeatureFlags and conformance CRLAppleAccountFeatureFlags;
  if (!lazy protocol witness table cache variable for type CRLAppleAccountFeatureFlags and conformance CRLAppleAccountFeatureFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CRLAppleAccountFeatureFlags and conformance CRLAppleAccountFeatureFlags);
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLAppleAccountFeatureFlags()
{
  return &type metadata for CRLAppleAccountFeatureFlags;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CRLPencilAndPaperFeatureFlags(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CRLPencilAndPaperFeatureFlags(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x114F0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for CRLPencilAndPaperFeatureFlags(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for CRLPencilAndPaperFeatureFlags(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CRLPencilAndPaperFeatureFlags()
{
  return &type metadata for CRLPencilAndPaperFeatureFlags;
}

unsigned char *storeEnumTagSinglePayload for CRLAppleAccountFeatureFlags(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x115D8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLUIKitFeatureFlags()
{
  return &type metadata for CRLUIKitFeatureFlags;
}

uint64_t getEnumTagSinglePayload for CRLFeatureFlags(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE7) {
    goto LABEL_17;
  }
  if (a2 + 25 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 25) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 25;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 25;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 25;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1A;
  int v8 = v6 - 26;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CRLFeatureFlags(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 25 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 25) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE6)
  {
    unsigned int v6 = ((a2 - 231) >> 8) + 1;
    *unint64_t result = a2 + 25;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1176CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 25;
        break;
    }
  }
  return result;
}

unsigned char *destructiveInjectEnumTag for CRLFeatureFlags(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CRLFeatureFlags()
{
  return &type metadata for CRLFeatureFlags;
}

id CRLDataclassOwner.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CRLDataclassOwner()
{
  return self;
}

Class @objc CRLDataclassOwner.actions(forDeleting:forDataclass:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  if (a5())
  {
    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v5.super.isa = 0;
  }
  return v5.super.isa;
}

char *specialized _arrayForceCast<A, B>(_:)(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  int v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (char *)v3;
  }
  char v13 = &_swiftEmptyArrayStorage;
  unint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
        type metadata accessor for ACDataclassAction();
        swift_dynamicCast();
        int v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3[2] + 1, 1);
          int v3 = v13;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v6 > 1), v7 + 1, 1);
          int v3 = v13;
        }
        v3[2] = v7 + 1;
        outlined init with take of Any(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      int v8 = (id *)(a1 + 32);
      type metadata accessor for ACDataclassAction();
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        int v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3[2] + 1, 1);
          int v3 = v13;
        }
        unint64_t v11 = v3[2];
        unint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
          int v3 = v13;
        }
        v3[2] = v11 + 1;
        outlined init with take of Any(v12, &v3[4 * v11 + 4]);
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

Class @objc CRLDataclassOwner.actionsForEnablingDataclass(on:forDataclass:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  if (a5())
  {
    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v5.super.isa = 0;
  }
  return v5.super.isa;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  char v13 = v10 + 32;
  char v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void specialized CRLDataclassOwner.setDefaultToEnsureOwnershipOfUserData()()
{
  id v0 = CRLAppBundleIdentifier();
  if (v0)
  {
    uint64_t v1 = v0;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }
  id v3 = [objc_allocWithZone((Class)NSUserDefaults) initWithSuiteName:v2];

  if (v3)
  {
    if (one-time initialization token for dataclassOwner != -1) {
      swift_once();
    }
    swift_beginAccess();
    id v4 = (id)static OS_os_log.dataclassOwner;
    uint64_t v5 = static os_log_type_t.default.getter();
    _CRLLog(_:dso:type:format:_:)((uint64_t)v4, (uint64_t)&dword_0, v5, (uint64_t)"Setting the user default to tell the app that it needs to ensure ownership of its data.", 87, 2, (uint64_t)&_swiftEmptyArrayStorage);

    [v3 setBool:1 forKey:@"CRLEnsureOwnershipOfDataUserDefault"];
  }
  else
  {
    if (one-time initialization token for dataclassOwner != -1) {
      swift_once();
    }
    swift_beginAccess();
    id v3 = (id)static OS_os_log.dataclassOwner;
    uint64_t v6 = static os_log_type_t.fault.getter();
    _CRLLog(_:dso:type:format:_:)((uint64_t)v3, (uint64_t)&dword_0, v6, (uint64_t)"Unable to access Freeform's defaults for setting CRLEnsureOwnershipOfDataUserDefault.", 85, 2, (uint64_t)&_swiftEmptyArrayStorage);
  }
}

void specialized CRLDataclassOwner.setDefaultThatDataclassOwnerIsLaunchingAppInBackground()()
{
  id v0 = CRLAppBundleIdentifier();
  if (v0)
  {
    uint64_t v1 = v0;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }
  id v3 = [objc_allocWithZone((Class)NSUserDefaults) initWithSuiteName:v2];

  if (v3)
  {
    if (one-time initialization token for dataclassOwner != -1) {
      swift_once();
    }
    swift_beginAccess();
    id v4 = (id)static OS_os_log.dataclassOwner;
    uint64_t v5 = static os_log_type_t.default.getter();
    _CRLLog(_:dso:type:format:_:)((uint64_t)v4, (uint64_t)&dword_0, v5, (uint64_t)"Setting the user default to tell the app that it dataclass owner is launching it.", 81, 2, (uint64_t)&_swiftEmptyArrayStorage);

    [v3 setBool:1 forKey:@"CRLDataclassOwnerDidLaunchAppInBackgroundUserDefault"];
  }
  else
  {
    if (one-time initialization token for dataclassOwner != -1) {
      swift_once();
    }
    swift_beginAccess();
    id v3 = (id)static OS_os_log.dataclassOwner;
    uint64_t v6 = static os_log_type_t.fault.getter();
    _CRLLog(_:dso:type:format:_:)((uint64_t)v3, (uint64_t)&dword_0, v6, (uint64_t)"Unable to access Freeform's defaults for setting CRLDataclassOwnerDidLaunchAppInBackgroundUserDefault.", 102, 2, (uint64_t)&_swiftEmptyArrayStorage);
  }
}

char *specialized CRLDataclassOwner.actionsForDisablingDataclass(on:forDataclass:)()
{
  NSString v0 = CRLAppBundleIdentifier();
  if (v0)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v0 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  id v1 = [objc_allocWithZone((Class)NSUserDefaults) initWithSuiteName:v0];

  if (v1)
  {
    unsigned __int8 v2 = [v1 BOOLForKey:@"CRLUserHasUnsyncedDataUserDefault"];

    if (v2)
    {
      if (one-time initialization token for dataclassOwner != -1) {
        swift_once();
      }
      swift_beginAccess();
      id v3 = (id)static OS_os_log.dataclassOwner;
      uint64_t v4 = static os_log_type_t.default.getter();
      _CRLLog(_:dso:type:format:_:)((uint64_t)v3, (uint64_t)&dword_0, v4, (uint64_t)"User has unsynced Freeform data: returning an action that unsynced data will be lost.", 85, 2, (uint64_t)&_swiftEmptyArrayStorage);

      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
      uint64_t v5 = (_OWORD *)swift_allocObject();
      v5[1] = xmmword_20660;
      uint64_t v6 = self;
      uint64_t result = (char *)[v6 actionWithType:8];
      if (result)
      {
        *((void *)v5 + 4) = result;
        uint64_t result = (char *)[v6 actionWithType:0];
        if (result)
        {
LABEL_9:
          *((void *)v5 + 5) = result;
          specialized Array._endMutation()();
LABEL_28:
          unint64_t v20 = specialized _arrayForceCast<A, B>(_:)((unint64_t)v5);
          swift_bridgeObjectRelease();
          return v20;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_31;
    }
  }
  else
  {
    if (one-time initialization token for dataclassOwner != -1) {
      swift_once();
    }
    swift_beginAccess();
    id v8 = (id)static OS_os_log.dataclassOwner;
    uint64_t v9 = static os_log_type_t.fault.getter();
    _CRLLog(_:dso:type:format:_:)((uint64_t)v8, (uint64_t)&dword_0, v9, (uint64_t)"Unable to access Freeform's defaults for hasUnsyncedData().", 59, 2, (uint64_t)&_swiftEmptyArrayStorage);
  }
  NSString v10 = CRLAppBundleIdentifier();
  if (v10)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  id v11 = [objc_allocWithZone((Class)NSUserDefaults) initWithSuiteName:v10];

  if (!v11)
  {
    if (one-time initialization token for dataclassOwner != -1) {
      swift_once();
    }
    swift_beginAccess();
    id v16 = (id)static OS_os_log.dataclassOwner;
    uint64_t v17 = static os_log_type_t.fault.getter();
    _CRLLog(_:dso:type:format:_:)((uint64_t)v16, (uint64_t)&dword_0, v17, (uint64_t)"Unable to access Freeform's defaults for hasData().", 51, 2, (uint64_t)&_swiftEmptyArrayStorage);

    goto LABEL_25;
  }
  unsigned __int8 v12 = [v11 BOOLForKey:@"CRLUserHasDataUserDefault"];

  if ((v12 & 1) == 0)
  {
LABEL_25:
    if (one-time initialization token for dataclassOwner != -1) {
      swift_once();
    }
    swift_beginAccess();
    id v18 = (id)static OS_os_log.dataclassOwner;
    uint64_t v19 = static os_log_type_t.default.getter();
    uint64_t v5 = &_swiftEmptyArrayStorage;
    _CRLLog(_:dso:type:format:_:)((uint64_t)v18, (uint64_t)&dword_0, v19, (uint64_t)"User has no Freeform data: not returning any actions.", 53, 2, (uint64_t)&_swiftEmptyArrayStorage);

    goto LABEL_28;
  }
  if (one-time initialization token for dataclassOwner != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v13 = (id)static OS_os_log.dataclassOwner;
  uint64_t v14 = static os_log_type_t.default.getter();
  _CRLLog(_:dso:type:format:_:)((uint64_t)v13, (uint64_t)&dword_0, v14, (uint64_t)"User has synced Freeform data: returning an action that local synced data will be deleted.", 90, 2, (uint64_t)&_swiftEmptyArrayStorage);

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v5 = (_OWORD *)swift_allocObject();
  v5[1] = xmmword_20660;
  char v15 = self;
  uint64_t result = (char *)[v15 actionWithType:3];
  if (!result)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  *((void *)v5 + 4) = result;
  uint64_t result = (char *)[v15 actionWithType:0];
  if (result) {
    goto LABEL_9;
  }
LABEL_32:
  __break(1u);
  return result;
}

id specialized CRLDataclassOwner.actionsForEnablingDataclass(on:forDataclass:)()
{
  NSString v0 = CRLAppBundleIdentifier();
  if (v0)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v0 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  id v1 = [objc_allocWithZone((Class)NSUserDefaults) initWithSuiteName:v0];

  if (!v1)
  {
    if (one-time initialization token for dataclassOwner != -1) {
      swift_once();
    }
    swift_beginAccess();
    id v10 = (id)static OS_os_log.dataclassOwner;
    uint64_t v11 = static os_log_type_t.fault.getter();
    _CRLLog(_:dso:type:format:_:)((uint64_t)v10, (uint64_t)&dword_0, v11, (uint64_t)"Unable to access Freeform's defaults for hasData().", 51, 2, (uint64_t)&_swiftEmptyArrayStorage);

    goto LABEL_13;
  }
  unsigned __int8 v2 = [v1 BOOLForKey:@"CRLUserHasDataUserDefault"];

  if ((v2 & 1) == 0)
  {
LABEL_13:
    if (one-time initialization token for dataclassOwner != -1) {
      swift_once();
    }
    swift_beginAccess();
    id v12 = (id)static OS_os_log.dataclassOwner;
    uint64_t v13 = static os_log_type_t.default.getter();
    _CRLLog(_:dso:type:format:_:)((uint64_t)v12, (uint64_t)&dword_0, v13, (uint64_t)"User has no existing Freeform data, returning an action to enable to create the sync data store.", 96, 2, (uint64_t)&_swiftEmptyArrayStorage);

    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_20650;
    id result = [self actionWithType:1];
    if (result)
    {
      id v14 = result;
      *(void *)(v5 + 56) = type metadata accessor for ACDataclassAction();
      *(void *)(v5 + 32) = v14;
      return (id)v5;
    }
    __break(1u);
    goto LABEL_19;
  }
  if (one-time initialization token for dataclassOwner != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v3 = (id)static OS_os_log.dataclassOwner;
  uint64_t v4 = static os_log_type_t.default.getter();
  _CRLLog(_:dso:type:format:_:)((uint64_t)v3, (uint64_t)&dword_0, v4, (uint64_t)"User has existing Freeform data, returning an action to enable to merge local data into the sync data.", 102, 2, (uint64_t)&_swiftEmptyArrayStorage);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_20670;
  uint64_t v6 = self;
  id result = [v6 actionWithType:5];
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  id v8 = result;
  unint64_t v9 = type metadata accessor for ACDataclassAction();
  *(void *)(v5 + 56) = v9;
  *(void *)(v5 + 32) = v8;
  id result = [v6 actionWithType:0];
  if (result)
  {
    *(void *)(v5 + 88) = v9;
    *(void *)(v5 + 64) = result;
    return (id)v5;
  }
LABEL_20:
  __break(1u);
  return result;
}

void *specialized CRLDataclassOwner.perform(_:for:withChildren:forDataclass:)(void *result)
{
  if (result)
  {
    id v1 = (int *)[result type];
    if ((unint64_t)v1 - 1 < 6 || v1 == &dword_8)
    {
      specialized CRLDataclassOwner.setDefaultToEnsureOwnershipOfUserData()();
      specialized CRLDataclassOwner.setDefaultThatDataclassOwnerIsLaunchingAppInBackground()();
      if (one-time initialization token for dataclassOwner != -1) {
        swift_once();
      }
      swift_beginAccess();
      id v3 = (id)static OS_os_log.dataclassOwner;
      uint64_t v4 = static os_log_type_t.default.getter();
      _CRLLog(_:dso:type:format:_:)((uint64_t)v3, (uint64_t)&dword_0, v4, (uint64_t)"Attempting to launch the app in the background.", 47, 2, (uint64_t)&_swiftEmptyArrayStorage);

      [self backgroundLaunchFreeformIfNotAlreadyRunning];
    }
    return &dword_0 + 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t type metadata accessor for ACDataclassAction()
{
  unint64_t result = lazy cache variable for type metadata for ACDataclassAction;
  if (!lazy cache variable for type metadata for ACDataclassAction)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for ACDataclassAction);
  }
  return result;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t *OS_os_log.dataclassOwner.unsafeMutableAddressor()
{
  if (one-time initialization token for dataclassOwner != -1) {
    swift_once();
  }
  return &static OS_os_log.dataclassOwner;
}

void one-time initialization function for crlDefault()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLDefaultCat_log_t, &CRLDefaultCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlDefault = (uint64_t)v1;
}

uint64_t *OS_os_log.crlDefault.unsafeMutableAddressor()
{
  if (one-time initialization token for crlDefault != -1) {
    swift_once();
  }
  return &static OS_os_log.crlDefault;
}

id static OS_os_log.crlDefault.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlDefault, (void **)&static OS_os_log.crlDefault);
}

void static OS_os_log.crlDefault.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlDefault.modify())()
{
  if (one-time initialization token for crlDefault != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlAssert()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAssertCat_log_t, &CRLAssertCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlAssert = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAssert.unsafeMutableAddressor()
{
  if (one-time initialization token for crlAssert != -1) {
    swift_once();
  }
  return &static OS_os_log.crlAssert;
}

id static OS_os_log.crlAssert.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlAssert, (void **)&static OS_os_log.crlAssert);
}

void static OS_os_log.crlAssert.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlAssert.modify())()
{
  if (one-time initialization token for crlAssert != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlError()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLErrorCat_log_t, &CRLErrorCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlError = (uint64_t)v1;
}

uint64_t *OS_os_log.crlError.unsafeMutableAddressor()
{
  if (one-time initialization token for crlError != -1) {
    swift_once();
  }
  return &static OS_os_log.crlError;
}

id static OS_os_log.crlError.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlError, (void **)&static OS_os_log.crlError);
}

void static OS_os_log.crlError.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlError.modify())()
{
  if (one-time initialization token for crlError != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlWarning()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLWarningCat_log_t, &CRLWarningCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlWarning = (uint64_t)v1;
}

uint64_t *OS_os_log.crlWarning.unsafeMutableAddressor()
{
  if (one-time initialization token for crlWarning != -1) {
    swift_once();
  }
  return &static OS_os_log.crlWarning;
}

id static OS_os_log.crlWarning.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlWarning, (void **)&static OS_os_log.crlWarning);
}

void static OS_os_log.crlWarning.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlWarning.modify())()
{
  if (one-time initialization token for crlWarning != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlAlert()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAlertCat_log_t, &CRLAlertCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlAlert = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAlert.unsafeMutableAddressor()
{
  if (one-time initialization token for crlAlert != -1) {
    swift_once();
  }
  return &static OS_os_log.crlAlert;
}

id static OS_os_log.crlAlert.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlAlert, (void **)&static OS_os_log.crlAlert);
}

void static OS_os_log.crlAlert.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlAlert.modify())()
{
  if (one-time initialization token for crlAlert != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlPerformance()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLPerformanceCat_log_t, &CRLPerformanceCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlPerformance = (uint64_t)v1;
}

uint64_t *OS_os_log.crlPerformance.unsafeMutableAddressor()
{
  if (one-time initialization token for crlPerformance != -1) {
    swift_once();
  }
  return &static OS_os_log.crlPerformance;
}

id static OS_os_log.crlPerformance.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlPerformance, (void **)&static OS_os_log.crlPerformance);
}

void static OS_os_log.crlPerformance.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlPerformance.modify())()
{
  if (one-time initialization token for crlPerformance != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlStatusHUD()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLStatusHUDCat_log_t, &CRLStatusHUDCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlStatusHUD = (uint64_t)v1;
}

uint64_t *OS_os_log.crlStatusHUD.unsafeMutableAddressor()
{
  if (one-time initialization token for crlStatusHUD != -1) {
    swift_once();
  }
  return &static OS_os_log.crlStatusHUD;
}

id static OS_os_log.crlStatusHUD.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlStatusHUD, (void **)&static OS_os_log.crlStatusHUD);
}

void static OS_os_log.crlStatusHUD.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlStatusHUD.modify())()
{
  if (one-time initialization token for crlStatusHUD != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlTextInput()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLTextInputCat_log_t, &CRLTextInputCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlTextInput = (uint64_t)v1;
}

uint64_t *OS_os_log.crlTextInput.unsafeMutableAddressor()
{
  if (one-time initialization token for crlTextInput != -1) {
    swift_once();
  }
  return &static OS_os_log.crlTextInput;
}

id static OS_os_log.crlTextInput.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlTextInput, (void **)&static OS_os_log.crlTextInput);
}

void static OS_os_log.crlTextInput.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlTextInput.modify())()
{
  if (one-time initialization token for crlTextInput != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlTraceableResource()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLTraceableResourceCat_log_t, &CRLTraceableResourceCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlTraceableResource = (uint64_t)v1;
}

uint64_t *OS_os_log.crlTraceableResource.unsafeMutableAddressor()
{
  if (one-time initialization token for crlTraceableResource != -1) {
    swift_once();
  }
  return &static OS_os_log.crlTraceableResource;
}

id static OS_os_log.crlTraceableResource.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlTraceableResource, (void **)&static OS_os_log.crlTraceableResource);
}

void static OS_os_log.crlTraceableResource.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlTraceableResource.modify())()
{
  if (one-time initialization token for crlTraceableResource != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlStorageHierachy()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLStorageHierachyCat_log_t, &CRLStorageHierachyCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlStorageHierachy = (uint64_t)v1;
}

uint64_t *OS_os_log.crlStorageHierachy.unsafeMutableAddressor()
{
  if (one-time initialization token for crlStorageHierachy != -1) {
    swift_once();
  }
  return &static OS_os_log.crlStorageHierachy;
}

id static OS_os_log.crlStorageHierachy.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlStorageHierachy, (void **)&static OS_os_log.crlStorageHierachy);
}

void static OS_os_log.crlStorageHierachy.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlStorageHierachy.modify())()
{
  if (one-time initialization token for crlStorageHierachy != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlSerializableObject()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSerializableObjectCat_log_t, &CRLSerializableObjectCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlSerializableObject = (uint64_t)v1;
}

uint64_t *OS_os_log.crlSerializableObject.unsafeMutableAddressor()
{
  if (one-time initialization token for crlSerializableObject != -1) {
    swift_once();
  }
  return &static OS_os_log.crlSerializableObject;
}

id static OS_os_log.crlSerializableObject.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlSerializableObject, (void **)&static OS_os_log.crlSerializableObject);
}

void static OS_os_log.crlSerializableObject.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlSerializableObject.modify())()
{
  if (one-time initialization token for crlSerializableObject != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlCollaborationParticipant()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCollaborationParticipantCat_log_t, &CRLCollaborationParticipantCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlCollaborationParticipant = (uint64_t)v1;
}

uint64_t *OS_os_log.crlCollaborationParticipant.unsafeMutableAddressor()
{
  if (one-time initialization token for crlCollaborationParticipant != -1) {
    swift_once();
  }
  return &static OS_os_log.crlCollaborationParticipant;
}

id static OS_os_log.crlCollaborationParticipant.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlCollaborationParticipant, (void **)&static OS_os_log.crlCollaborationParticipant);
}

void static OS_os_log.crlCollaborationParticipant.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlCollaborationParticipant.modify())()
{
  if (one-time initialization token for crlCollaborationParticipant != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlSpotlight()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSpotlightCat_log_t, &CRLSpotlightCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlSpotlight = (uint64_t)v1;
}

uint64_t *OS_os_log.crlSpotlight.unsafeMutableAddressor()
{
  if (one-time initialization token for crlSpotlight != -1) {
    swift_once();
  }
  return &static OS_os_log.crlSpotlight;
}

id static OS_os_log.crlSpotlight.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlSpotlight, (void **)&static OS_os_log.crlSpotlight);
}

void static OS_os_log.crlSpotlight.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlSpotlight.modify())()
{
  if (one-time initialization token for crlSpotlight != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlNetworkReachability()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLNetworkReachabilityCat_log_t, &CRLNetworkReachabilityCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlNetworkReachability = (uint64_t)v1;
}

uint64_t *OS_os_log.crlNetworkReachability.unsafeMutableAddressor()
{
  if (one-time initialization token for crlNetworkReachability != -1) {
    swift_once();
  }
  return &static OS_os_log.crlNetworkReachability;
}

id static OS_os_log.crlNetworkReachability.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlNetworkReachability, (void **)&static OS_os_log.crlNetworkReachability);
}

void static OS_os_log.crlNetworkReachability.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlNetworkReachability.modify())()
{
  if (one-time initialization token for crlNetworkReachability != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlAssetDownloadManager()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAssetDownloadManagerCat_log_t, &CRLAssetDownloadManagerCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlAssetDownloadManager = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAssetDownloadManager.unsafeMutableAddressor()
{
  if (one-time initialization token for crlAssetDownloadManager != -1) {
    swift_once();
  }
  return &static OS_os_log.crlAssetDownloadManager;
}

id static OS_os_log.crlAssetDownloadManager.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlAssetDownloadManager, (void **)&static OS_os_log.crlAssetDownloadManager);
}

void static OS_os_log.crlAssetDownloadManager.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlAssetDownloadManager.modify())()
{
  if (one-time initialization token for crlAssetDownloadManager != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlAppAnalytics()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAppAnalyticsCat_log_t, &CRLAppAnalyticsCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlAppAnalytics = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAppAnalytics.unsafeMutableAddressor()
{
  if (one-time initialization token for crlAppAnalytics != -1) {
    swift_once();
  }
  return &static OS_os_log.crlAppAnalytics;
}

id static OS_os_log.crlAppAnalytics.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlAppAnalytics, (void **)&static OS_os_log.crlAppAnalytics);
}

void static OS_os_log.crlAppAnalytics.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlAppAnalytics.modify())()
{
  if (one-time initialization token for crlAppAnalytics != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlAnalytics()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAnalyticsCat_log_t, &CRLAnalyticsCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlAnalytics = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAnalytics.unsafeMutableAddressor()
{
  if (one-time initialization token for crlAnalytics != -1) {
    swift_once();
  }
  return &static OS_os_log.crlAnalytics;
}

id static OS_os_log.crlAnalytics.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlAnalytics, (void **)&static OS_os_log.crlAnalytics);
}

void static OS_os_log.crlAnalytics.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlAnalytics.modify())()
{
  if (one-time initialization token for crlAnalytics != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlKeyboard()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLKeyboardCat_log_t, &CRLKeyboardCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlKeyboard = (uint64_t)v1;
}

uint64_t *OS_os_log.crlKeyboard.unsafeMutableAddressor()
{
  if (one-time initialization token for crlKeyboard != -1) {
    swift_once();
  }
  return &static OS_os_log.crlKeyboard;
}

id static OS_os_log.crlKeyboard.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlKeyboard, (void **)&static OS_os_log.crlKeyboard);
}

void static OS_os_log.crlKeyboard.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlKeyboard.modify())()
{
  if (one-time initialization token for crlKeyboard != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlFolderUI()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLFolderUICat_log_t, &CRLFolderUICat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlFolderUI = (uint64_t)v1;
}

uint64_t *OS_os_log.crlFolderUI.unsafeMutableAddressor()
{
  if (one-time initialization token for crlFolderUI != -1) {
    swift_once();
  }
  return &static OS_os_log.crlFolderUI;
}

id static OS_os_log.crlFolderUI.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlFolderUI, (void **)&static OS_os_log.crlFolderUI);
}

void static OS_os_log.crlFolderUI.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlFolderUI.modify())()
{
  if (one-time initialization token for crlFolderUI != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlBoardLibrary()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLBoardLibraryCat_log_t, &CRLBoardLibraryCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlBoardLibrary = (uint64_t)v1;
}

uint64_t *OS_os_log.crlBoardLibrary.unsafeMutableAddressor()
{
  if (one-time initialization token for crlBoardLibrary != -1) {
    swift_once();
  }
  return &static OS_os_log.crlBoardLibrary;
}

id static OS_os_log.crlBoardLibrary.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlBoardLibrary, (void **)&static OS_os_log.crlBoardLibrary);
}

void static OS_os_log.crlBoardLibrary.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlBoardLibrary.modify())()
{
  if (one-time initialization token for crlBoardLibrary != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlBoardPreviewImageCache()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLBoardPreviewImageCacheCat_log_t, &CRLBoardPreviewImageCacheCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlBoardPreviewImageCache = (uint64_t)v1;
}

uint64_t *OS_os_log.crlBoardPreviewImageCache.unsafeMutableAddressor()
{
  if (one-time initialization token for crlBoardPreviewImageCache != -1) {
    swift_once();
  }
  return &static OS_os_log.crlBoardPreviewImageCache;
}

id static OS_os_log.crlBoardPreviewImageCache.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlBoardPreviewImageCache, (void **)&static OS_os_log.crlBoardPreviewImageCache);
}

void static OS_os_log.crlBoardPreviewImageCache.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlBoardPreviewImageCache.modify())()
{
  if (one-time initialization token for crlBoardPreviewImageCache != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlSharingExtension()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSharingExtensionCat_log_t, &CRLSharingExtensionCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlSharingExtension = (uint64_t)v1;
}

uint64_t *OS_os_log.crlSharingExtension.unsafeMutableAddressor()
{
  if (one-time initialization token for crlSharingExtension != -1) {
    swift_once();
  }
  return &static OS_os_log.crlSharingExtension;
}

id static OS_os_log.crlSharingExtension.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlSharingExtension, (void **)&static OS_os_log.crlSharingExtension);
}

void static OS_os_log.crlSharingExtension.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlSharingExtension.modify())()
{
  if (one-time initialization token for crlSharingExtension != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlStencilLibrary()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLStencilLibraryCat_log_t, &CRLStencilLibraryCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlStencilLibrary = (uint64_t)v1;
}

uint64_t *OS_os_log.crlStencilLibrary.unsafeMutableAddressor()
{
  if (one-time initialization token for crlStencilLibrary != -1) {
    swift_once();
  }
  return &static OS_os_log.crlStencilLibrary;
}

id static OS_os_log.crlStencilLibrary.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlStencilLibrary, (void **)&static OS_os_log.crlStencilLibrary);
}

void static OS_os_log.crlStencilLibrary.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlStencilLibrary.modify())()
{
  if (one-time initialization token for crlStencilLibrary != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlRealTimeMessageTransfer()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCarmelRealTimeMessageTransferCat_log_t, &CRLCarmelRealTimeMessageTransferCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlRealTimeMessageTransfer = (uint64_t)v1;
}

uint64_t *OS_os_log.crlRealTimeMessageTransfer.unsafeMutableAddressor()
{
  if (one-time initialization token for crlRealTimeMessageTransfer != -1) {
    swift_once();
  }
  return &static OS_os_log.crlRealTimeMessageTransfer;
}

id static OS_os_log.crlRealTimeMessageTransfer.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlRealTimeMessageTransfer, (void **)&static OS_os_log.crlRealTimeMessageTransfer);
}

void static OS_os_log.crlRealTimeMessageTransfer.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlRealTimeMessageTransfer.modify())()
{
  if (one-time initialization token for crlRealTimeMessageTransfer != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlZoneRefetch()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLZoneRefetchCat_log_t, &CRLZoneRefetchCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlZoneRefetch = (uint64_t)v1;
}

uint64_t *OS_os_log.crlZoneRefetch.unsafeMutableAddressor()
{
  if (one-time initialization token for crlZoneRefetch != -1) {
    swift_once();
  }
  return &static OS_os_log.crlZoneRefetch;
}

id static OS_os_log.crlZoneRefetch.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlZoneRefetch, (void **)&static OS_os_log.crlZoneRefetch);
}

void static OS_os_log.crlZoneRefetch.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlZoneRefetch.modify())()
{
  if (one-time initialization token for crlZoneRefetch != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlSendACopy()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSendACopyCat_log_t, &CRLSendACopyCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlSendACopy = (uint64_t)v1;
}

uint64_t *OS_os_log.crlSendACopy.unsafeMutableAddressor()
{
  if (one-time initialization token for crlSendACopy != -1) {
    swift_once();
  }
  return &static OS_os_log.crlSendACopy;
}

id static OS_os_log.crlSendACopy.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlSendACopy, (void **)&static OS_os_log.crlSendACopy);
}

void static OS_os_log.crlSendACopy.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlSendACopy.modify())()
{
  if (one-time initialization token for crlSendACopy != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlCloudKitEnvironment()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCloudKitEnvironmentCat_log_t, &CRLCloudKitEnvironmentCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlCloudKitEnvironment = (uint64_t)v1;
}

uint64_t *OS_os_log.crlCloudKitEnvironment.unsafeMutableAddressor()
{
  if (one-time initialization token for crlCloudKitEnvironment != -1) {
    swift_once();
  }
  return &static OS_os_log.crlCloudKitEnvironment;
}

id static OS_os_log.crlCloudKitEnvironment.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlCloudKitEnvironment, (void **)&static OS_os_log.crlCloudKitEnvironment);
}

void static OS_os_log.crlCloudKitEnvironment.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlCloudKitEnvironment.modify())()
{
  if (one-time initialization token for crlCloudKitEnvironment != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlSidebar()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSidebarCat_log_t, &CRLSidebarCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlSidebar = (uint64_t)v1;
}

uint64_t *OS_os_log.crlSidebar.unsafeMutableAddressor()
{
  if (one-time initialization token for crlSidebar != -1) {
    swift_once();
  }
  return &static OS_os_log.crlSidebar;
}

id static OS_os_log.crlSidebar.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlSidebar, (void **)&static OS_os_log.crlSidebar);
}

void static OS_os_log.crlSidebar.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlSidebar.modify())()
{
  if (one-time initialization token for crlSidebar != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlInsertMedia()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLInsertMediaCat_log_t, &CRLInsertMediaCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlInsertMedia = (uint64_t)v1;
}

uint64_t *OS_os_log.crlInsertMedia.unsafeMutableAddressor()
{
  if (one-time initialization token for crlInsertMedia != -1) {
    swift_once();
  }
  return &static OS_os_log.crlInsertMedia;
}

id static OS_os_log.crlInsertMedia.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlInsertMedia, (void **)&static OS_os_log.crlInsertMedia);
}

void static OS_os_log.crlInsertMedia.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlInsertMedia.modify())()
{
  if (one-time initialization token for crlInsertMedia != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlCollaboratorCursor()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCollaboratorCursorCat_log_t, &CRLCollaboratorCursorCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlCollaboratorCursor = (uint64_t)v1;
}

uint64_t *OS_os_log.crlCollaboratorCursor.unsafeMutableAddressor()
{
  if (one-time initialization token for crlCollaboratorCursor != -1) {
    swift_once();
  }
  return &static OS_os_log.crlCollaboratorCursor;
}

id static OS_os_log.crlCollaboratorCursor.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlCollaboratorCursor, (void **)&static OS_os_log.crlCollaboratorCursor);
}

void static OS_os_log.crlCollaboratorCursor.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlCollaboratorCursor.modify())()
{
  if (one-time initialization token for crlCollaboratorCursor != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlStateRestoration()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLStateRestorationCat_log_t, &CRLStateRestorationCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlStateRestoration = (uint64_t)v1;
}

uint64_t *OS_os_log.crlStateRestoration.unsafeMutableAddressor()
{
  if (one-time initialization token for crlStateRestoration != -1) {
    swift_once();
  }
  return &static OS_os_log.crlStateRestoration;
}

id static OS_os_log.crlStateRestoration.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlStateRestoration, (void **)&static OS_os_log.crlStateRestoration);
}

void static OS_os_log.crlStateRestoration.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlStateRestoration.modify())()
{
  if (one-time initialization token for crlStateRestoration != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlFollow()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLFollowCat_log_t, &CRLFollowCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlFollow = (uint64_t)v1;
}

uint64_t *OS_os_log.crlFollow.unsafeMutableAddressor()
{
  if (one-time initialization token for crlFollow != -1) {
    swift_once();
  }
  return &static OS_os_log.crlFollow;
}

id static OS_os_log.crlFollow.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlFollow, (void **)&static OS_os_log.crlFollow);
}

void static OS_os_log.crlFollow.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlFollow.modify())()
{
  if (one-time initialization token for crlFollow != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlJoinLeave()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLJoinLeaveCat_log_t, &CRLJoinLeaveCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlJoinLeave = (uint64_t)v1;
}

uint64_t *OS_os_log.crlJoinLeave.unsafeMutableAddressor()
{
  if (one-time initialization token for crlJoinLeave != -1) {
    swift_once();
  }
  return &static OS_os_log.crlJoinLeave;
}

id static OS_os_log.crlJoinLeave.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlJoinLeave, (void **)&static OS_os_log.crlJoinLeave);
}

void static OS_os_log.crlJoinLeave.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlJoinLeave.modify())()
{
  if (one-time initialization token for crlJoinLeave != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlPencilHover()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLPencilHoverCat_log_t, &CRLPencilHoverCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlPencilHover = (uint64_t)v1;
}

uint64_t *OS_os_log.crlPencilHover.unsafeMutableAddressor()
{
  if (one-time initialization token for crlPencilHover != -1) {
    swift_once();
  }
  return &static OS_os_log.crlPencilHover;
}

id static OS_os_log.crlPencilHover.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlPencilHover, (void **)&static OS_os_log.crlPencilHover);
}

void static OS_os_log.crlPencilHover.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlPencilHover.modify())()
{
  if (one-time initialization token for crlPencilHover != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlScenes()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLScenesCat_log_t, &CRLScenesCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlScenes = (uint64_t)v1;
}

uint64_t *OS_os_log.crlScenes.unsafeMutableAddressor()
{
  if (one-time initialization token for crlScenes != -1) {
    swift_once();
  }
  return &static OS_os_log.crlScenes;
}

id static OS_os_log.crlScenes.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlScenes, (void **)&static OS_os_log.crlScenes);
}

void static OS_os_log.crlScenes.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlScenes.modify())()
{
  if (one-time initialization token for crlScenes != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlThreeDimensionalObjects()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLThreeDimensionalObjectsCat_log_t, &CRLThreeDimensionalObjectsCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlThreeDimensionalObjects = (uint64_t)v1;
}

uint64_t *OS_os_log.crlThreeDimensionalObjects.unsafeMutableAddressor()
{
  if (one-time initialization token for crlThreeDimensionalObjects != -1) {
    swift_once();
  }
  return &static OS_os_log.crlThreeDimensionalObjects;
}

id static OS_os_log.crlThreeDimensionalObjects.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlThreeDimensionalObjects, (void **)&static OS_os_log.crlThreeDimensionalObjects);
}

void static OS_os_log.crlThreeDimensionalObjects.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlThreeDimensionalObjects.modify())()
{
  if (one-time initialization token for crlThreeDimensionalObjects != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlChangeShape()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLChangeShapeCat_log_t, &CRLChangeShapeCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlChangeShape = (uint64_t)v1;
}

uint64_t *OS_os_log.crlChangeShape.unsafeMutableAddressor()
{
  if (one-time initialization token for crlChangeShape != -1) {
    swift_once();
  }
  return &static OS_os_log.crlChangeShape;
}

id static OS_os_log.crlChangeShape.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlChangeShape, (void **)&static OS_os_log.crlChangeShape);
}

void static OS_os_log.crlChangeShape.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlChangeShape.modify())()
{
  if (one-time initialization token for crlChangeShape != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlCloudQuotaMessaging()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCloudQuotaMessagingCat_log_t, &CRLCloudQuotaMessagingCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlCloudQuotaMessaging = (uint64_t)v1;
}

uint64_t *OS_os_log.crlCloudQuotaMessaging.unsafeMutableAddressor()
{
  if (one-time initialization token for crlCloudQuotaMessaging != -1) {
    swift_once();
  }
  return &static OS_os_log.crlCloudQuotaMessaging;
}

id static OS_os_log.crlCloudQuotaMessaging.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlCloudQuotaMessaging, (void **)&static OS_os_log.crlCloudQuotaMessaging);
}

void static OS_os_log.crlCloudQuotaMessaging.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlCloudQuotaMessaging.modify())()
{
  if (one-time initialization token for crlCloudQuotaMessaging != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crl3DBreakthrough()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRL3DBreakthroughCat_log_t, &CRL3DBreakthroughCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crl3DBreakthrough = (uint64_t)v1;
}

uint64_t *OS_os_log.crl3DBreakthrough.unsafeMutableAddressor()
{
  if (one-time initialization token for crl3DBreakthrough != -1) {
    swift_once();
  }
  return &static OS_os_log.crl3DBreakthrough;
}

id static OS_os_log.crl3DBreakthrough.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crl3DBreakthrough, (void **)&static OS_os_log.crl3DBreakthrough);
}

void static OS_os_log.crl3DBreakthrough.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crl3DBreakthrough.modify())()
{
  if (one-time initialization token for crl3DBreakthrough != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlLayerAnimation()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLLayerAnimationCat_log_t, &CRLLayerAnimationCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlLayerAnimation = (uint64_t)v1;
}

uint64_t *OS_os_log.crlLayerAnimation.unsafeMutableAddressor()
{
  if (one-time initialization token for crlLayerAnimation != -1) {
    swift_once();
  }
  return &static OS_os_log.crlLayerAnimation;
}

id static OS_os_log.crlLayerAnimation.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlLayerAnimation, (void **)&static OS_os_log.crlLayerAnimation);
}

void static OS_os_log.crlLayerAnimation.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlLayerAnimation.modify())()
{
  if (one-time initialization token for crlLayerAnimation != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlAnimationImpl()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAnimationImplCat_log_t, &CRLAnimationImplCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlAnimationImpl = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAnimationImpl.unsafeMutableAddressor()
{
  if (one-time initialization token for crlAnimationImpl != -1) {
    swift_once();
  }
  return &static OS_os_log.crlAnimationImpl;
}

id static OS_os_log.crlAnimationImpl.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlAnimationImpl, (void **)&static OS_os_log.crlAnimationImpl);
}

void static OS_os_log.crlAnimationImpl.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlAnimationImpl.modify())()
{
  if (one-time initialization token for crlAnimationImpl != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for crlMiniFormatter()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLMiniFormatterCat_log_t, &CRLMiniFormatterCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlMiniFormatter = (uint64_t)v1;
}

uint64_t *OS_os_log.crlMiniFormatter.unsafeMutableAddressor()
{
  if (one-time initialization token for crlMiniFormatter != -1) {
    swift_once();
  }
  return &static OS_os_log.crlMiniFormatter;
}

id static OS_os_log.crlMiniFormatter.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for crlMiniFormatter, (void **)&static OS_os_log.crlMiniFormatter);
}

void static OS_os_log.crlMiniFormatter.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlMiniFormatter.modify())()
{
  if (one-time initialization token for crlMiniFormatter != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for sceneManagement()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSceneManagementCat_log_t, &CRLSceneManagementCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.sceneManagement = (uint64_t)v1;
}

uint64_t *OS_os_log.sceneManagement.unsafeMutableAddressor()
{
  if (one-time initialization token for sceneManagement != -1) {
    swift_once();
  }
  return &static OS_os_log.sceneManagement;
}

id static OS_os_log.sceneManagement.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for sceneManagement, (void **)&static OS_os_log.sceneManagement);
}

void static OS_os_log.sceneManagement.setter(void *a1)
{
}

uint64_t (*static OS_os_log.sceneManagement.modify())()
{
  if (one-time initialization token for sceneManagement != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for composition()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCompositionCat_log_t, &CRLCompositionCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.composition = (uint64_t)v1;
}

uint64_t *OS_os_log.composition.unsafeMutableAddressor()
{
  if (one-time initialization token for composition != -1) {
    swift_once();
  }
  return &static OS_os_log.composition;
}

id static OS_os_log.composition.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for composition, (void **)&static OS_os_log.composition);
}

void static OS_os_log.composition.setter(void *a1)
{
}

uint64_t (*static OS_os_log.composition.modify())()
{
  if (one-time initialization token for composition != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for CRLViewController()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLViewControllerCat_log_t, &CRLViewControllerCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.CRLViewController = (uint64_t)v1;
}

uint64_t *OS_os_log.CRLViewController.unsafeMutableAddressor()
{
  if (one-time initialization token for CRLViewController != -1) {
    swift_once();
  }
  return &static OS_os_log.CRLViewController;
}

id static OS_os_log.CRLViewController.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for CRLViewController, (void **)&static OS_os_log.CRLViewController);
}

void static OS_os_log.CRLViewController.setter(void *a1)
{
}

uint64_t (*static OS_os_log.CRLViewController.modify())()
{
  if (one-time initialization token for CRLViewController != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for appIntents()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAppIntentsCat_log_t, &CRLAppIntentsCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.appIntents = (uint64_t)v1;
}

uint64_t *OS_os_log.appIntents.unsafeMutableAddressor()
{
  if (one-time initialization token for appIntents != -1) {
    swift_once();
  }
  return &static OS_os_log.appIntents;
}

id static OS_os_log.appIntents.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for appIntents, (void **)&static OS_os_log.appIntents);
}

void static OS_os_log.appIntents.setter(void *a1)
{
}

uint64_t (*static OS_os_log.appIntents.modify())()
{
  if (one-time initialization token for appIntents != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for appState()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAppStateCat_log_t, &CRLAppStateCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.appState = (uint64_t)v1;
}

uint64_t *OS_os_log.appState.unsafeMutableAddressor()
{
  if (one-time initialization token for appState != -1) {
    swift_once();
  }
  return &static OS_os_log.appState;
}

id static OS_os_log.appState.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for appState, (void **)&static OS_os_log.appState);
}

void static OS_os_log.appState.setter(void *a1)
{
}

uint64_t (*static OS_os_log.appState.modify())()
{
  if (one-time initialization token for appState != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for interaction()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLInteractionCat_log_t, &CRLInteractionCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.interaction = (uint64_t)v1;
}

uint64_t *OS_os_log.interaction.unsafeMutableAddressor()
{
  if (one-time initialization token for interaction != -1) {
    swift_once();
  }
  return &static OS_os_log.interaction;
}

id static OS_os_log.interaction.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for interaction, (void **)&static OS_os_log.interaction);
}

void static OS_os_log.interaction.setter(void *a1)
{
}

uint64_t (*static OS_os_log.interaction.modify())()
{
  if (one-time initialization token for interaction != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for contentState()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLContentStateCat_log_t, &CRLContentStateCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.contentState = (uint64_t)v1;
}

uint64_t *OS_os_log.contentState.unsafeMutableAddressor()
{
  if (one-time initialization token for contentState != -1) {
    swift_once();
  }
  return &static OS_os_log.contentState;
}

id static OS_os_log.contentState.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for contentState, (void **)&static OS_os_log.contentState);
}

void static OS_os_log.contentState.setter(void *a1)
{
}

uint64_t (*static OS_os_log.contentState.modify())()
{
  if (one-time initialization token for contentState != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for boardStore()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLBoardDataStoreCat_log_t, &CRLBoardDataStoreCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.boardStore = (uint64_t)v1;
}

uint64_t *OS_os_log.boardStore.unsafeMutableAddressor()
{
  if (one-time initialization token for boardStore != -1) {
    swift_once();
  }
  return &static OS_os_log.boardStore;
}

id static OS_os_log.boardStore.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for boardStore, (void **)&static OS_os_log.boardStore);
}

void static OS_os_log.boardStore.setter(void *a1)
{
}

uint64_t (*static OS_os_log.boardStore.modify())()
{
  if (one-time initialization token for boardStore != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for fileProviderStore()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLFileProviderStoreCat_log_t, &CRLFileProviderStoreCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.fileProviderStore = (uint64_t)v1;
}

uint64_t *OS_os_log.fileProviderStore.unsafeMutableAddressor()
{
  if (one-time initialization token for fileProviderStore != -1) {
    swift_once();
  }
  return &static OS_os_log.fileProviderStore;
}

id static OS_os_log.fileProviderStore.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for fileProviderStore, (void **)&static OS_os_log.fileProviderStore);
}

void static OS_os_log.fileProviderStore.setter(void *a1)
{
}

uint64_t (*static OS_os_log.fileProviderStore.modify())()
{
  if (one-time initialization token for fileProviderStore != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for persistence()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLPersistenceCat_log_t, &CRLPersistenceCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.persistence = (uint64_t)v1;
}

uint64_t *OS_os_log.persistence.unsafeMutableAddressor()
{
  if (one-time initialization token for persistence != -1) {
    swift_once();
  }
  return &static OS_os_log.persistence;
}

id static OS_os_log.persistence.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for persistence, (void **)&static OS_os_log.persistence);
}

void static OS_os_log.persistence.setter(void *a1)
{
}

uint64_t (*static OS_os_log.persistence.modify())()
{
  if (one-time initialization token for persistence != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for dataSync()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLDataSyncCat_log_t, &CRLDataSyncCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.dataSync = (uint64_t)v1;
}

uint64_t *OS_os_log.dataSync.unsafeMutableAddressor()
{
  if (one-time initialization token for dataSync != -1) {
    swift_once();
  }
  return &static OS_os_log.dataSync;
}

id static OS_os_log.dataSync.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for dataSync, (void **)&static OS_os_log.dataSync);
}

void static OS_os_log.dataSync.setter(void *a1)
{
}

uint64_t (*static OS_os_log.dataSync.modify())()
{
  if (one-time initialization token for dataSync != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for commandController()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCommandControllerCat_log_t, &CRLCommandControllerCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.commandController = (uint64_t)v1;
}

uint64_t *OS_os_log.commandController.unsafeMutableAddressor()
{
  if (one-time initialization token for commandController != -1) {
    swift_once();
  }
  return &static OS_os_log.commandController;
}

id static OS_os_log.commandController.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for commandController, (void **)&static OS_os_log.commandController);
}

void static OS_os_log.commandController.setter(void *a1)
{
}

uint64_t (*static OS_os_log.commandController.modify())()
{
  if (one-time initialization token for commandController != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for suspendResumeCollaboration()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSuspendResumeCollaborationCat_log_t, &CRLSuspendResumeCollaborationCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.suspendResumeCollaboration = (uint64_t)v1;
}

uint64_t *OS_os_log.suspendResumeCollaboration.unsafeMutableAddressor()
{
  if (one-time initialization token for suspendResumeCollaboration != -1) {
    swift_once();
  }
  return &static OS_os_log.suspendResumeCollaboration;
}

id static OS_os_log.suspendResumeCollaboration.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for suspendResumeCollaboration, (void **)&static OS_os_log.suspendResumeCollaboration);
}

void static OS_os_log.suspendResumeCollaboration.setter(void *a1)
{
}

uint64_t (*static OS_os_log.suspendResumeCollaboration.modify())()
{
  if (one-time initialization token for suspendResumeCollaboration != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for realTimeSync()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCarmelRealTimeSyncCat_log_t, &CRLCarmelRealTimeSyncCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.realTimeSync = (uint64_t)v1;
}

uint64_t *OS_os_log.realTimeSync.unsafeMutableAddressor()
{
  if (one-time initialization token for realTimeSync != -1) {
    swift_once();
  }
  return &static OS_os_log.realTimeSync;
}

id static OS_os_log.realTimeSync.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for realTimeSync, (void **)&static OS_os_log.realTimeSync);
}

void static OS_os_log.realTimeSync.setter(void *a1)
{
}

uint64_t (*static OS_os_log.realTimeSync.modify())()
{
  if (one-time initialization token for realTimeSync != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for keyboardInput()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLKeyboardInputCat_log_t, &CRLKeyboardInputCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.keyboardInput = (uint64_t)v1;
}

uint64_t *OS_os_log.keyboardInput.unsafeMutableAddressor()
{
  if (one-time initialization token for keyboardInput != -1) {
    swift_once();
  }
  return &static OS_os_log.keyboardInput;
}

id static OS_os_log.keyboardInput.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for keyboardInput, (void **)&static OS_os_log.keyboardInput);
}

void static OS_os_log.keyboardInput.setter(void *a1)
{
}

uint64_t (*static OS_os_log.keyboardInput.modify())()
{
  if (one-time initialization token for keyboardInput != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for target_gesture()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLTargetGestureCat_log_t, &CRLTargetGestureCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.target_gesture = (uint64_t)v1;
}

uint64_t *OS_os_log.target_gesture.unsafeMutableAddressor()
{
  if (one-time initialization token for target_gesture != -1) {
    swift_once();
  }
  return &static OS_os_log.target_gesture;
}

id static OS_os_log.target_gesture.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for target_gesture, (void **)&static OS_os_log.target_gesture);
}

void static OS_os_log.target_gesture.setter(void *a1)
{
}

uint64_t (*static OS_os_log.target_gesture.modify())()
{
  if (one-time initialization token for target_gesture != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for upgrade()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLDataStoreUpgradeCat_log_t, &CRLDataStoreUpgradeCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.upgrade = (uint64_t)v1;
}

uint64_t *OS_os_log.upgrade.unsafeMutableAddressor()
{
  if (one-time initialization token for upgrade != -1) {
    swift_once();
  }
  return &static OS_os_log.upgrade;
}

id static OS_os_log.upgrade.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for upgrade, (void **)&static OS_os_log.upgrade);
}

void static OS_os_log.upgrade.setter(void *a1)
{
}

uint64_t (*static OS_os_log.upgrade.modify())()
{
  if (one-time initialization token for upgrade != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for pasteboard()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLPasteboardCat_log_t, &CRLPasteboardCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.pasteboard = (uint64_t)v1;
}

uint64_t *OS_os_log.pasteboard.unsafeMutableAddressor()
{
  if (one-time initialization token for pasteboard != -1) {
    swift_once();
  }
  return &static OS_os_log.pasteboard;
}

id static OS_os_log.pasteboard.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for pasteboard, (void **)&static OS_os_log.pasteboard);
}

void static OS_os_log.pasteboard.setter(void *a1)
{
}

uint64_t (*static OS_os_log.pasteboard.modify())()
{
  if (one-time initialization token for pasteboard != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for boardItemDataSize()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLBoardItemDataSizeCat_log_t, &CRLBoardItemDataSizeCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.boardItemDataSize = (uint64_t)v1;
}

uint64_t *OS_os_log.boardItemDataSize.unsafeMutableAddressor()
{
  if (one-time initialization token for boardItemDataSize != -1) {
    swift_once();
  }
  return &static OS_os_log.boardItemDataSize;
}

id static OS_os_log.boardItemDataSize.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for boardItemDataSize, (void **)&static OS_os_log.boardItemDataSize);
}

void static OS_os_log.boardItemDataSize.setter(void *a1)
{
}

uint64_t (*static OS_os_log.boardItemDataSize.modify())()
{
  if (one-time initialization token for boardItemDataSize != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for boardItemLifecycle()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLBoardItemLifecycleCat_log_t, &CRLBoardItemLifecycleCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.boardItemLifecycle = (uint64_t)v1;
}

uint64_t *OS_os_log.boardItemLifecycle.unsafeMutableAddressor()
{
  if (one-time initialization token for boardItemLifecycle != -1) {
    swift_once();
  }
  return &static OS_os_log.boardItemLifecycle;
}

id static OS_os_log.boardItemLifecycle.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for boardItemLifecycle, (void **)&static OS_os_log.boardItemLifecycle);
}

void static OS_os_log.boardItemLifecycle.setter(void *a1)
{
}

uint64_t (*static OS_os_log.boardItemLifecycle.modify())()
{
  if (one-time initialization token for boardItemLifecycle != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for assetManagement()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAssetManagementCat_log_t, &CRLAssetManagementCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.assetManagement = (uint64_t)v1;
}

uint64_t *OS_os_log.assetManagement.unsafeMutableAddressor()
{
  if (one-time initialization token for assetManagement != -1) {
    swift_once();
  }
  return &static OS_os_log.assetManagement;
}

id static OS_os_log.assetManagement.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for assetManagement, (void **)&static OS_os_log.assetManagement);
}

void static OS_os_log.assetManagement.setter(void *a1)
{
}

uint64_t (*static OS_os_log.assetManagement.modify())()
{
  if (one-time initialization token for assetManagement != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for dataclassOwner()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLDataclassOwnerCat_log_t, &CRLDataclassOwnerCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.dataclassOwner = (uint64_t)v1;
}

id static OS_os_log.dataclassOwner.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for dataclassOwner, (void **)&static OS_os_log.dataclassOwner);
}

void static OS_os_log.dataclassOwner.setter(void *a1)
{
}

uint64_t (*static OS_os_log.dataclassOwner.modify())()
{
  if (one-time initialization token for dataclassOwner != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.dataclassOwner.modify;
}

void one-time initialization function for shareState()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLShareStateCat_log_t, &CRLShareStateCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.shareState = (uint64_t)v1;
}

uint64_t *OS_os_log.shareState.unsafeMutableAddressor()
{
  if (one-time initialization token for shareState != -1) {
    swift_once();
  }
  return &static OS_os_log.shareState;
}

id static OS_os_log.shareState.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for shareState, (void **)&static OS_os_log.shareState);
}

void static OS_os_log.shareState.setter(void *a1)
{
}

uint64_t (*static OS_os_log.shareState.modify())()
{
  if (one-time initialization token for shareState != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for DrawingDataDetectors()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLDrawingDataDetectors_log_t, &CRLDrawingDataDetectors_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.DrawingDataDetectors = (uint64_t)v1;
}

uint64_t *OS_os_log.DrawingDataDetectors.unsafeMutableAddressor()
{
  if (one-time initialization token for DrawingDataDetectors != -1) {
    swift_once();
  }
  return &static OS_os_log.DrawingDataDetectors;
}

id static OS_os_log.DrawingDataDetectors.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for DrawingDataDetectors, (void **)&static OS_os_log.DrawingDataDetectors);
}

void static OS_os_log.DrawingDataDetectors.setter(void *a1)
{
}

uint64_t (*static OS_os_log.DrawingDataDetectors.modify())()
{
  if (one-time initialization token for DrawingDataDetectors != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

void one-time initialization function for sideStore()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSideStore_log_t, &CRLSideStore_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.sideStore = (uint64_t)v1;
}

uint64_t *OS_os_log.sideStore.unsafeMutableAddressor()
{
  if (one-time initialization token for sideStore != -1) {
    swift_once();
  }
  return &static OS_os_log.sideStore;
}

id static OS_os_log.sideStore.getter()
{
  return static OS_os_log.crlDefault.getter(&one-time initialization token for sideStore, (void **)&static OS_os_log.sideStore);
}

id static OS_os_log.crlDefault.getter(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v3 = *a2;
  return v3;
}

void static OS_os_log.sideStore.setter(void *a1)
{
}

void static OS_os_log.crlDefault.setter(void *a1, void *a2, void **a3)
{
  if (*a2 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v5 = *a3;
  *a3 = a1;
}

uint64_t (*static OS_os_log.sideStore.modify())()
{
  if (one-time initialization token for sideStore != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static OS_os_log.crlAssert.modify;
}

uint64_t _CRLLog(_:dso:type:format:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  switch(*(void *)(a7 + 16))
  {
    case 1:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_20650;
      uint64_t v10 = v9 + 32;
      uint64_t v11 = a7 + 32;
      goto LABEL_25;
    case 2:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_20670;
      outlined init with copy of CVarArg(a7 + 32, v12 + 32);
      uint64_t v10 = v12 + 72;
      uint64_t v11 = a7 + 72;
      goto LABEL_25;
    case 3:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_207D0;
      outlined init with copy of CVarArg(a7 + 32, v13 + 32);
      outlined init with copy of CVarArg(a7 + 72, v13 + 72);
      uint64_t v10 = v13 + 112;
      uint64_t v11 = a7 + 112;
      goto LABEL_25;
    case 4:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_207C0;
      outlined init with copy of CVarArg(a7 + 32, v14 + 32);
      outlined init with copy of CVarArg(a7 + 72, v14 + 72);
      outlined init with copy of CVarArg(a7 + 112, v14 + 112);
      uint64_t v10 = v14 + 152;
      uint64_t v11 = a7 + 152;
      goto LABEL_25;
    case 5:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v15 = swift_allocObject();
      *(_OWORD *)(v15 + 16) = xmmword_207B0;
      outlined init with copy of CVarArg(a7 + 32, v15 + 32);
      outlined init with copy of CVarArg(a7 + 72, v15 + 72);
      outlined init with copy of CVarArg(a7 + 112, v15 + 112);
      outlined init with copy of CVarArg(a7 + 152, v15 + 152);
      uint64_t v10 = v15 + 192;
      uint64_t v11 = a7 + 192;
      goto LABEL_25;
    case 6:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v16 = swift_allocObject();
      *(_OWORD *)(v16 + 16) = xmmword_207A0;
      outlined init with copy of CVarArg(a7 + 32, v16 + 32);
      outlined init with copy of CVarArg(a7 + 72, v16 + 72);
      outlined init with copy of CVarArg(a7 + 112, v16 + 112);
      outlined init with copy of CVarArg(a7 + 152, v16 + 152);
      outlined init with copy of CVarArg(a7 + 192, v16 + 192);
      uint64_t v10 = v16 + 232;
      uint64_t v11 = a7 + 232;
      goto LABEL_25;
    case 7:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v17 = swift_allocObject();
      *(_OWORD *)(v17 + 16) = xmmword_20790;
      outlined init with copy of CVarArg(a7 + 32, v17 + 32);
      outlined init with copy of CVarArg(a7 + 72, v17 + 72);
      outlined init with copy of CVarArg(a7 + 112, v17 + 112);
      outlined init with copy of CVarArg(a7 + 152, v17 + 152);
      outlined init with copy of CVarArg(a7 + 192, v17 + 192);
      outlined init with copy of CVarArg(a7 + 232, v17 + 232);
      uint64_t v10 = v17 + 272;
      uint64_t v11 = a7 + 272;
      goto LABEL_25;
    case 8:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_20780;
      outlined init with copy of CVarArg(a7 + 32, v18 + 32);
      outlined init with copy of CVarArg(a7 + 72, v18 + 72);
      outlined init with copy of CVarArg(a7 + 112, v18 + 112);
      outlined init with copy of CVarArg(a7 + 152, v18 + 152);
      outlined init with copy of CVarArg(a7 + 192, v18 + 192);
      outlined init with copy of CVarArg(a7 + 232, v18 + 232);
      outlined init with copy of CVarArg(a7 + 272, v18 + 272);
      uint64_t v10 = v18 + 312;
      uint64_t v11 = a7 + 312;
      goto LABEL_25;
    case 9:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v19 = swift_allocObject();
      *(_OWORD *)(v19 + 16) = xmmword_20770;
      outlined init with copy of CVarArg(a7 + 32, v19 + 32);
      outlined init with copy of CVarArg(a7 + 72, v19 + 72);
      outlined init with copy of CVarArg(a7 + 112, v19 + 112);
      outlined init with copy of CVarArg(a7 + 152, v19 + 152);
      outlined init with copy of CVarArg(a7 + 192, v19 + 192);
      outlined init with copy of CVarArg(a7 + 232, v19 + 232);
      outlined init with copy of CVarArg(a7 + 272, v19 + 272);
      outlined init with copy of CVarArg(a7 + 312, v19 + 312);
      uint64_t v10 = v19 + 352;
      uint64_t v11 = a7 + 352;
      goto LABEL_25;
    case 0xALL:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = xmmword_20760;
      outlined init with copy of CVarArg(a7 + 32, v20 + 32);
      outlined init with copy of CVarArg(a7 + 72, v20 + 72);
      outlined init with copy of CVarArg(a7 + 112, v20 + 112);
      outlined init with copy of CVarArg(a7 + 152, v20 + 152);
      outlined init with copy of CVarArg(a7 + 192, v20 + 192);
      outlined init with copy of CVarArg(a7 + 232, v20 + 232);
      outlined init with copy of CVarArg(a7 + 272, v20 + 272);
      outlined init with copy of CVarArg(a7 + 312, v20 + 312);
      outlined init with copy of CVarArg(a7 + 352, v20 + 352);
      uint64_t v10 = v20 + 392;
      uint64_t v11 = a7 + 392;
      goto LABEL_25;
    case 0xBLL:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_20750;
      outlined init with copy of CVarArg(a7 + 32, v21 + 32);
      outlined init with copy of CVarArg(a7 + 72, v21 + 72);
      outlined init with copy of CVarArg(a7 + 112, v21 + 112);
      outlined init with copy of CVarArg(a7 + 152, v21 + 152);
      outlined init with copy of CVarArg(a7 + 192, v21 + 192);
      outlined init with copy of CVarArg(a7 + 232, v21 + 232);
      outlined init with copy of CVarArg(a7 + 272, v21 + 272);
      outlined init with copy of CVarArg(a7 + 312, v21 + 312);
      outlined init with copy of CVarArg(a7 + 352, v21 + 352);
      outlined init with copy of CVarArg(a7 + 392, v21 + 392);
      uint64_t v10 = v21 + 432;
      uint64_t v11 = a7 + 432;
      goto LABEL_25;
    case 0xCLL:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_20740;
      outlined init with copy of CVarArg(a7 + 32, v22 + 32);
      outlined init with copy of CVarArg(a7 + 72, v22 + 72);
      outlined init with copy of CVarArg(a7 + 112, v22 + 112);
      outlined init with copy of CVarArg(a7 + 152, v22 + 152);
      outlined init with copy of CVarArg(a7 + 192, v22 + 192);
      outlined init with copy of CVarArg(a7 + 232, v22 + 232);
      outlined init with copy of CVarArg(a7 + 272, v22 + 272);
      outlined init with copy of CVarArg(a7 + 312, v22 + 312);
      outlined init with copy of CVarArg(a7 + 352, v22 + 352);
      outlined init with copy of CVarArg(a7 + 392, v22 + 392);
      outlined init with copy of CVarArg(a7 + 432, v22 + 432);
      uint64_t v10 = v22 + 472;
      uint64_t v11 = a7 + 472;
      goto LABEL_25;
    case 0xDLL:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = xmmword_20730;
      outlined init with copy of CVarArg(a7 + 32, v23 + 32);
      outlined init with copy of CVarArg(a7 + 72, v23 + 72);
      outlined init with copy of CVarArg(a7 + 112, v23 + 112);
      outlined init with copy of CVarArg(a7 + 152, v23 + 152);
      outlined init with copy of CVarArg(a7 + 192, v23 + 192);
      outlined init with copy of CVarArg(a7 + 232, v23 + 232);
      outlined init with copy of CVarArg(a7 + 272, v23 + 272);
      outlined init with copy of CVarArg(a7 + 312, v23 + 312);
      outlined init with copy of CVarArg(a7 + 352, v23 + 352);
      outlined init with copy of CVarArg(a7 + 392, v23 + 392);
      outlined init with copy of CVarArg(a7 + 432, v23 + 432);
      outlined init with copy of CVarArg(a7 + 472, v23 + 472);
      uint64_t v10 = v23 + 512;
      uint64_t v11 = a7 + 512;
      goto LABEL_25;
    case 0xELL:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v24 = swift_allocObject();
      *(_OWORD *)(v24 + 16) = xmmword_20720;
      outlined init with copy of CVarArg(a7 + 32, v24 + 32);
      outlined init with copy of CVarArg(a7 + 72, v24 + 72);
      outlined init with copy of CVarArg(a7 + 112, v24 + 112);
      outlined init with copy of CVarArg(a7 + 152, v24 + 152);
      outlined init with copy of CVarArg(a7 + 192, v24 + 192);
      outlined init with copy of CVarArg(a7 + 232, v24 + 232);
      outlined init with copy of CVarArg(a7 + 272, v24 + 272);
      outlined init with copy of CVarArg(a7 + 312, v24 + 312);
      outlined init with copy of CVarArg(a7 + 352, v24 + 352);
      outlined init with copy of CVarArg(a7 + 392, v24 + 392);
      outlined init with copy of CVarArg(a7 + 432, v24 + 432);
      outlined init with copy of CVarArg(a7 + 472, v24 + 472);
      outlined init with copy of CVarArg(a7 + 512, v24 + 512);
      uint64_t v10 = v24 + 552;
      uint64_t v11 = a7 + 552;
      goto LABEL_25;
    case 0xFLL:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v25 = swift_allocObject();
      *(_OWORD *)(v25 + 16) = xmmword_20710;
      outlined init with copy of CVarArg(a7 + 32, v25 + 32);
      outlined init with copy of CVarArg(a7 + 72, v25 + 72);
      outlined init with copy of CVarArg(a7 + 112, v25 + 112);
      outlined init with copy of CVarArg(a7 + 152, v25 + 152);
      outlined init with copy of CVarArg(a7 + 192, v25 + 192);
      outlined init with copy of CVarArg(a7 + 232, v25 + 232);
      outlined init with copy of CVarArg(a7 + 272, v25 + 272);
      outlined init with copy of CVarArg(a7 + 312, v25 + 312);
      outlined init with copy of CVarArg(a7 + 352, v25 + 352);
      outlined init with copy of CVarArg(a7 + 392, v25 + 392);
      outlined init with copy of CVarArg(a7 + 432, v25 + 432);
      outlined init with copy of CVarArg(a7 + 472, v25 + 472);
      outlined init with copy of CVarArg(a7 + 512, v25 + 512);
      outlined init with copy of CVarArg(a7 + 552, v25 + 552);
      uint64_t v10 = v25 + 592;
      uint64_t v11 = a7 + 592;
      goto LABEL_25;
    case 0x10:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v26 = swift_allocObject();
      *(_OWORD *)(v26 + 16) = xmmword_20700;
      outlined init with copy of CVarArg(a7 + 32, v26 + 32);
      outlined init with copy of CVarArg(a7 + 72, v26 + 72);
      outlined init with copy of CVarArg(a7 + 112, v26 + 112);
      outlined init with copy of CVarArg(a7 + 152, v26 + 152);
      outlined init with copy of CVarArg(a7 + 192, v26 + 192);
      outlined init with copy of CVarArg(a7 + 232, v26 + 232);
      outlined init with copy of CVarArg(a7 + 272, v26 + 272);
      outlined init with copy of CVarArg(a7 + 312, v26 + 312);
      outlined init with copy of CVarArg(a7 + 352, v26 + 352);
      outlined init with copy of CVarArg(a7 + 392, v26 + 392);
      outlined init with copy of CVarArg(a7 + 432, v26 + 432);
      outlined init with copy of CVarArg(a7 + 472, v26 + 472);
      outlined init with copy of CVarArg(a7 + 512, v26 + 512);
      outlined init with copy of CVarArg(a7 + 552, v26 + 552);
      outlined init with copy of CVarArg(a7 + 592, v26 + 592);
      uint64_t v10 = v26 + 632;
      uint64_t v11 = a7 + 632;
      goto LABEL_25;
    case 0x11:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v27 = swift_allocObject();
      *(_OWORD *)(v27 + 16) = xmmword_206F0;
      outlined init with copy of CVarArg(a7 + 32, v27 + 32);
      outlined init with copy of CVarArg(a7 + 72, v27 + 72);
      outlined init with copy of CVarArg(a7 + 112, v27 + 112);
      outlined init with copy of CVarArg(a7 + 152, v27 + 152);
      outlined init with copy of CVarArg(a7 + 192, v27 + 192);
      outlined init with copy of CVarArg(a7 + 232, v27 + 232);
      outlined init with copy of CVarArg(a7 + 272, v27 + 272);
      outlined init with copy of CVarArg(a7 + 312, v27 + 312);
      outlined init with copy of CVarArg(a7 + 352, v27 + 352);
      outlined init with copy of CVarArg(a7 + 392, v27 + 392);
      outlined init with copy of CVarArg(a7 + 432, v27 + 432);
      outlined init with copy of CVarArg(a7 + 472, v27 + 472);
      outlined init with copy of CVarArg(a7 + 512, v27 + 512);
      outlined init with copy of CVarArg(a7 + 552, v27 + 552);
      outlined init with copy of CVarArg(a7 + 592, v27 + 592);
      outlined init with copy of CVarArg(a7 + 632, v27 + 632);
      uint64_t v10 = v27 + 672;
      uint64_t v11 = a7 + 672;
      goto LABEL_25;
    case 0x12:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = xmmword_206E0;
      outlined init with copy of CVarArg(a7 + 32, v28 + 32);
      outlined init with copy of CVarArg(a7 + 72, v28 + 72);
      outlined init with copy of CVarArg(a7 + 112, v28 + 112);
      outlined init with copy of CVarArg(a7 + 152, v28 + 152);
      outlined init with copy of CVarArg(a7 + 192, v28 + 192);
      outlined init with copy of CVarArg(a7 + 232, v28 + 232);
      outlined init with copy of CVarArg(a7 + 272, v28 + 272);
      outlined init with copy of CVarArg(a7 + 312, v28 + 312);
      outlined init with copy of CVarArg(a7 + 352, v28 + 352);
      outlined init with copy of CVarArg(a7 + 392, v28 + 392);
      outlined init with copy of CVarArg(a7 + 432, v28 + 432);
      outlined init with copy of CVarArg(a7 + 472, v28 + 472);
      outlined init with copy of CVarArg(a7 + 512, v28 + 512);
      outlined init with copy of CVarArg(a7 + 552, v28 + 552);
      outlined init with copy of CVarArg(a7 + 592, v28 + 592);
      outlined init with copy of CVarArg(a7 + 632, v28 + 632);
      outlined init with copy of CVarArg(a7 + 672, v28 + 672);
      uint64_t v10 = v28 + 712;
      uint64_t v11 = a7 + 712;
      goto LABEL_25;
    case 0x13:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v29 = swift_allocObject();
      *(_OWORD *)(v29 + 16) = xmmword_206D0;
      outlined init with copy of CVarArg(a7 + 32, v29 + 32);
      outlined init with copy of CVarArg(a7 + 72, v29 + 72);
      outlined init with copy of CVarArg(a7 + 112, v29 + 112);
      outlined init with copy of CVarArg(a7 + 152, v29 + 152);
      outlined init with copy of CVarArg(a7 + 192, v29 + 192);
      outlined init with copy of CVarArg(a7 + 232, v29 + 232);
      outlined init with copy of CVarArg(a7 + 272, v29 + 272);
      outlined init with copy of CVarArg(a7 + 312, v29 + 312);
      outlined init with copy of CVarArg(a7 + 352, v29 + 352);
      outlined init with copy of CVarArg(a7 + 392, v29 + 392);
      outlined init with copy of CVarArg(a7 + 432, v29 + 432);
      outlined init with copy of CVarArg(a7 + 472, v29 + 472);
      outlined init with copy of CVarArg(a7 + 512, v29 + 512);
      outlined init with copy of CVarArg(a7 + 552, v29 + 552);
      outlined init with copy of CVarArg(a7 + 592, v29 + 592);
      outlined init with copy of CVarArg(a7 + 632, v29 + 632);
      outlined init with copy of CVarArg(a7 + 672, v29 + 672);
      outlined init with copy of CVarArg(a7 + 712, v29 + 712);
      uint64_t v10 = v29 + 752;
      uint64_t v11 = a7 + 752;
      goto LABEL_25;
    case 0x14:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v30 = swift_allocObject();
      *(_OWORD *)(v30 + 16) = xmmword_206C0;
      outlined init with copy of CVarArg(a7 + 32, v30 + 32);
      outlined init with copy of CVarArg(a7 + 72, v30 + 72);
      outlined init with copy of CVarArg(a7 + 112, v30 + 112);
      outlined init with copy of CVarArg(a7 + 152, v30 + 152);
      outlined init with copy of CVarArg(a7 + 192, v30 + 192);
      outlined init with copy of CVarArg(a7 + 232, v30 + 232);
      outlined init with copy of CVarArg(a7 + 272, v30 + 272);
      outlined init with copy of CVarArg(a7 + 312, v30 + 312);
      outlined init with copy of CVarArg(a7 + 352, v30 + 352);
      outlined init with copy of CVarArg(a7 + 392, v30 + 392);
      outlined init with copy of CVarArg(a7 + 432, v30 + 432);
      outlined init with copy of CVarArg(a7 + 472, v30 + 472);
      outlined init with copy of CVarArg(a7 + 512, v30 + 512);
      outlined init with copy of CVarArg(a7 + 552, v30 + 552);
      outlined init with copy of CVarArg(a7 + 592, v30 + 592);
      outlined init with copy of CVarArg(a7 + 632, v30 + 632);
      outlined init with copy of CVarArg(a7 + 672, v30 + 672);
      outlined init with copy of CVarArg(a7 + 712, v30 + 712);
      outlined init with copy of CVarArg(a7 + 752, v30 + 752);
      uint64_t v10 = v30 + 792;
      uint64_t v11 = a7 + 792;
LABEL_25:
      outlined init with copy of CVarArg(v11, v10);
      os_log(_:dso:log:type:_:)();
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      uint64_t result = os_log(_:dso:log:type:_:)();
      break;
  }
  return result;
}

uint64_t outlined init with copy of CVarArg(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t SQLiteDatabase.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC22FreeformDataclassOwner14SQLiteDatabase_url;
  uint64_t v2 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t ObjC metadata update function for SQLiteDatabase()
{
  return type metadata accessor for SQLiteDatabase();
}

uint64_t type metadata accessor for SQLiteDatabase()
{
  uint64_t result = type metadata singleton initialization cache for SQLiteDatabase;
  if (!type metadata singleton initialization cache for SQLiteDatabase) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for SQLiteDatabase()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable () -> ()(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t SQLiteStatement.__deallocating_deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(type metadata accessor for DispatchQoS() - 8);
  uint64_t v7 = __chkstk_darwin();
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(v0 + 24);
  if (v10)
  {
    uint64_t v11 = *(void **)(*(void *)(v1 + 16) + 32);
    v16[0] = v7;
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v10;
    aBlock[4] = partial apply for closure #1 in SQLiteStatement.deinit;
    aBlock[5] = v12;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    aBlock[3] = &block_descriptor;
    uint64_t v13 = _Block_copy(aBlock);
    id v14 = v11;
    static DispatchQoS.unspecified.getter();
    v16[1] = &_swiftEmptyArrayStorage;
    lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v13);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(char *, void))(v6 + 8))(v9, v16[0]);
    swift_release();
  }
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SQLiteStatement()
{
  return self;
}

uint64_t SQLiteRowIterator.next()()
{
  uint64_t v1 = type metadata accessor for DispatchPredicate();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (uint64_t *)((char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = v0[2];
  uint64_t v6 = *(void **)(*(void *)(v5 + 16) + 32);
  *uint64_t v4 = v6;
  (*(void (**)(void *, void, uint64_t))(v2 + 104))(v4, enum case for DispatchPredicate.onQueue(_:), v1);
  id v7 = v6;
  LOBYTE(v6) = _dispatchPreconditionTest(_:)();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v2 + 8))(v4, v1);
  if (v6)
  {
    uint64_t v9 = v0[4];
    uint64_t v10 = v0[3];
    uint64_t v11 = v0[5];
    v0[3] = 0;
    v0[4] = 0;
    v0[5] = 1;
    outlined consume of SQLiteError?(v10, v9, v11);
    unsigned int v12 = sqlite3_step(*(sqlite3_stmt **)(v5 + 24));
    uint64_t result = 0;
    if (v12 && v12 != 101)
    {
      if (v12 == 100)
      {
        return swift_retain();
      }
      else
      {
        uint64_t v13 = v0[3];
        uint64_t v14 = v0[4];
        uint64_t v15 = v0[5];
        v0[3] = v12;
        v0[4] = 0;
        v0[5] = 0;
        outlined consume of SQLiteError?(v13, v14, v15);
        return 0;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t SQLiteRowIterator.__deallocating_deinit()
{
  swift_release();
  outlined consume of SQLiteError?(v0[3], v0[4], v0[5]);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SQLiteRowIterator()
{
  return self;
}

uint64_t protocol witness for IteratorProtocol.next() in conformance SQLiteRowIterator@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SQLiteRowIterator.next()();
  *a1 = result;
  return result;
}

uint64_t SQLTransaction.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SQLTransaction()
{
  return self;
}

uint64_t getEnumTagSinglePayload for SQLTransaction.Kind(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SQLTransaction.Kind(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1C07CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLTransaction.Kind()
{
  return &type metadata for SQLTransaction.Kind;
}

uint64_t destroy for SQLiteError()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for SQLiteError(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SQLiteError(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SQLiteError(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLiteError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLiteError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLiteError()
{
  return &type metadata for SQLiteError;
}

unint64_t lazy protocol witness table accessor for type SQLTransaction.Kind and conformance SQLTransaction.Kind()
{
  unint64_t result = lazy protocol witness table cache variable for type SQLTransaction.Kind and conformance SQLTransaction.Kind;
  if (!lazy protocol witness table cache variable for type SQLTransaction.Kind and conformance SQLTransaction.Kind)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SQLTransaction.Kind and conformance SQLTransaction.Kind);
  }
  return result;
}

uint64_t outlined consume of SQLiteError?(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1C2C0()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t partial apply for closure #1 in SQLiteStatement.deinit()
{
  return sqlite3_finalize(*(sqlite3_stmt **)(v0 + 16));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags()
{
  unint64_t result = lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags;
  if (!lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A];
  if (!lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A]);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLiteRow()
{
  return &type metadata for SQLiteRow;
}

void ___sendCategoryAddedNotification_block_invoke_cold_1(void *a1, int a2)
{
  unint64_t v3 = a1;
  int v4 = +[CRLAssertionHandler packedBacktraceString];
  v5[0] = 67109378;
  v5[1] = a2;
  __int16 v6 = 2114;
  BOOL v7 = v4;
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)v5, 0x12u);
}

void ___sendCategoryAddedNotification_block_invoke_cold_2(int a1, NSObject *a2)
{
  v2[0] = 67110146;
  v2[1] = a1;
  __int16 v3 = 2082;
  int v4 = "void _sendCategoryAddedNotification(NSString *__strong)_block_invoke";
  __int16 v5 = 2082;
  __int16 v6 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLLog.m";
  __int16 v7 = 1024;
  int v8 = 151;
  __int16 v9 = 2082;
  uint64_t v10 = "category";
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", (uint8_t *)v2, 0x2Cu);
}

void CRLAdjustSelectionRangeForChangedRange_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_0, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Bad changingRange passed to CRLAdjustSelectionRangeForChangedRange", v2, v3, v4, v5, v6);
}

void CRLAdjustSelectionRangeForChangedRange_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_0, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Bad selectionRange passed to CRLAdjustSelectionRangeForChangedRange", v2, v3, v4, v5, v6);
}

void CRLAdjustSelectionRangeForChangedRange_cold_6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_0, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Bad delta passed to CRLAdjustSelectionRangeForChangedRange", v2, v3, v4, v5, v6);
}

void CRLAdjustSelectionRangeForChangedRange_cold_8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_0, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d expected selectionRange to start within changingRange", v2, v3, v4, v5, v6);
}

void CRLVersionFromNSString_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_0, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Out-of-bounds type assignment was clamped to max", v2, v3, v4, v5, v6);
}

void CRLVersionFromNSString_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_0, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Out-of-bounds type assignment was clamped to min", v2, v3, v4, v5, v6);
}

void CRLVersionFromNSString_cold_6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_0, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Out-of-bounds type assignment was clamped to max", v2, v3, v4, v5, v6);
}

void CRLVersionFromNSString_cold_8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_0, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Out-of-bounds type assignment was clamped to min", v2, v3, v4, v5, v6);
}

void CRLVersionFromNSString_cold_10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(&dword_0, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Out-of-bounds type assignment was clamped to max", v2, v3, v4, v5, v6);
}

void CRLVersionFromNSString_cold_12()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(&dword_0, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Out-of-bounds type assignment was clamped to min", v2, v3, v4, v5, v6);
}

void CRLVersionFromNSString_cold_14()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_0, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Version should consist of 3 numbers separated by '.'", v2, v3, v4, v5, v6);
}

void __CRLAppBundleIdentifier_block_invoke_cold_1()
{
}

void __CRLAppGroupIdentifier_block_invoke_cold_1()
{
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t UUID.init(uuid:)()
{
  return UUID.init(uuid:)();
}

uint64_t UUID.uuid.getter()
{
  return UUID.uuid.getter();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t os_log(_:dso:log:type:_:)()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return _dispatchPreconditionTest(_:)();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return _CFLocaleCopyCurrent();
}

void CFRelease(CFTypeRef cf)
{
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return _CFStringGetCharactersPtr(theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return _CFStringTokenizerAdvanceToNextToken(tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return _CFStringTokenizerCreate(alloc, string, range, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFRange CurrentTokenRange = _CFStringTokenizerGetCurrentTokenRange(tokenizer);
  CFIndex length = CurrentTokenRange.length;
  CFIndex location = CurrentTokenRange.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

CFStringTokenizerTokenType CFStringTokenizerGoToTokenAtIndex(CFStringTokenizerRef tokenizer, CFIndex index)
{
  return _CFStringTokenizerGoToTokenAtIndex(tokenizer, index);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSRange v4 = _NSIntersectionRange(range1, range2);
  NSUInteger length = v4.length;
  NSUInteger location = v4.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSRange v4 = _NSUnionRange(range1, range2);
  NSUInteger length = v4.length;
  NSUInteger location = v4.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

void NSZoneFree(NSZone *zone, void *ptr)
{
}

void *__cdecl NSZoneMalloc(NSZone *zone, NSUInteger size)
{
  return _NSZoneMalloc(zone, size);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

int _NSGetExecutablePath(char *buf, uint32_t *bufsize)
{
  return __NSGetExecutablePath(buf, bufsize);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

const char *__cdecl _dyld_get_image_name(uint32_t image_index)
{
  return __dyld_get_image_name(image_index);
}

intptr_t _dyld_get_image_vmaddr_slide(uint32_t image_index)
{
  return __dyld_get_image_vmaddr_slide(image_index);
}

uint32_t _dyld_image_count(void)
{
  return __dyld_image_count();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return _dladdr(a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

char *__cdecl ether_ntoa(const ether_addr *a1)
{
  return _ether_ntoa(a1);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

const section_64 *__cdecl getsectbyname(const char *segname, const char *sectname)
{
  return _getsectbyname(segname, sectname);
}

uint8_t *__cdecl getsegmentdata(const mach_header_64 *mhp, const char *segname, unint64_t *size)
{
  return _getsegmentdata(mhp, segname, size);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__atomicIncrementAssertCount(void *a1, const char *a2, ...)
{
  return _[a1 _atomicIncrementAssertCount];
}

id objc_msgSend_addCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCharactersInString:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addIndexesInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIndexesInRange:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayForKey:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return _[a1 bundlePath];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_callStackReturnAddresses(void *a1, const char *a2, ...)
{
  return _[a1 callStackReturnAddresses];
}

id objc_msgSend_canBeConvertedToEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canBeConvertedToEncoding:");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterIsMember:");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_characterSetWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithRange:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_containsIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsIndex:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_crl_appendJSONStringToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_appendJSONStringToString:");
}

id objc_msgSend_crl_compressWithAlgorithm_operation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_compressWithAlgorithm:operation:");
}

id objc_msgSend_crl_countInstancesOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_countInstancesOfString:options:");
}

id objc_msgSend_crl_displayNameFromFilenameDeletingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_displayNameFromFilenameDeletingPathExtension:");
}

id objc_msgSend_crl_filenameFromDisplayNameWithExtension_characterLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_filenameFromDisplayNameWithExtension:characterLimit:");
}

id objc_msgSend_crl_filenameTruncatedToCharacterLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_filenameTruncatedToCharacterLimit:");
}

id objc_msgSend_crl_initRedactedWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_initRedactedWithFormat:arguments:");
}

id objc_msgSend_crl_initUnRedactedWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_initUnRedactedWithFormat:arguments:");
}

id objc_msgSend_crl_isCJKString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_isCJKString");
}

id objc_msgSend_crl_parseBaseTitleWithLocalizedCopyString_firstCopyFormatString_generalCopyFormatString_outNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_parseBaseTitleWithLocalizedCopyString:firstCopyFormatString:generalCopyFormatString:outNumber:");
}

id objc_msgSend_crl_platformString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_platformString");
}

id objc_msgSend_crl_regexForTitleParsingWithLocalizedCopyString_isFirstCopyFormatString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_regexForTitleParsingWithLocalizedCopyString:isFirstCopyFormatString:");
}

id objc_msgSend_crl_registerDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_registerDefaults");
}

id objc_msgSend_crl_stringByApplyingSubstitutions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringByApplyingSubstitutions:");
}

id objc_msgSend_crl_stringByBase64EncodingBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringByBase64EncodingBytes:length:");
}

id objc_msgSend_crl_stringByBase64EncodingBytes_length_breakLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringByBase64EncodingBytes:length:breakLines:");
}

id objc_msgSend_crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithLocalizedCopyString_firstCopyFormatString_generalCopyFormatString_numberFormatter_uniquenessTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithLocalizedCopyString:firstCopyFormatString:generalCopyFormatString:numberFormatter:uniquenessTest:");
}

id objc_msgSend_crl_stringByIndentingString_times_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringByIndentingString:times:");
}

id objc_msgSend_crl_stringByRemovingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringByRemovingCharactersInSet:");
}

id objc_msgSend_crl_stringByRemovingCharactersInSet_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringByRemovingCharactersInSet:options:");
}

id objc_msgSend_crl_stringByReplacingInstancesOfCharactersInSet_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringByReplacingInstancesOfCharactersInSet:withString:");
}

id objc_msgSend_crl_stringByUniquingPathInsideDirectory_withFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringByUniquingPathInsideDirectory:withFormat:");
}

id objc_msgSend_crl_stringWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringWithFormat:arguments:");
}

id objc_msgSend_crl_stringWithNormalizedHyphens(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringWithNormalizedHyphens");
}

id objc_msgSend_crl_stringWithNormalizedQuotationMarks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringWithNormalizedQuotationMarks");
}

id objc_msgSend_crl_stringWithPathRelativeTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringWithPathRelativeTo:");
}

id objc_msgSend_crl_tolerantStringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_tolerantStringByAppendingPathExtension:");
}

id objc_msgSend_crl_uncommentedAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_uncommentedAddress");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultDefaults(void *a1, const char *a2, ...)
{
  return _[a1 defaultDefaults];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithSharedKeySet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithSharedKeySet:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:");
}

id objc_msgSend_escapedPatternForString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "escapedPatternForString:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return _[a1 familyName];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_firstMatchInString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstMatchInString:options:range:");
}

id objc_msgSend_getCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCharacters:");
}

id objc_msgSend_getCharacters_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCharacters:range:");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return _[a1 givenName];
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_isFatal_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:isFatal:description:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_isFatal_format_args_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:isFatal:format:args:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_immutableSet(void *a1, const char *a2, ...)
{
  return _[a1 immutableSet];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return _[a1 indexSet];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytesNoCopy:length:encoding:freeWhenDone:");
}

id objc_msgSend_initWithCharacters_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCharacters:length:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPattern:options:error:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_insertString_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertString:atIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return _[a1 invertedSet];
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return _[a1 isAtEnd];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isQAFatalAssertionsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isQAFatalAssertionsEnabled];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastThrottleCheck(void *a1, const char *a2, ...)
{
  return _[a1 lastThrottleCheck];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringFromPersonNameComponents_style_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringFromPersonNameComponents:style:options:");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_mutableCopyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopyWithZone:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectWithItemProviderData_typeIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectWithItemProviderData:typeIdentifier:error:");
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openApplication:withOptions:completion:");
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsWithDictionary:");
}

id objc_msgSend_p_backgroundLaunchFreeformWithFrontBoardIfNotAlreadyRunning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "p_backgroundLaunchFreeformWithFrontBoardIfNotAlreadyRunning");
}

id objc_msgSend_p_performBlockIgnoringAssertions_onlyFatal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "p_performBlockIgnoringAssertions:onlyFatal:");
}

id objc_msgSend_packedBacktraceString(void *a1, const char *a2, ...)
{
  return _[a1 packedBacktraceString];
}

id objc_msgSend_packedBacktraceStringWithReturnAddresses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "packedBacktraceStringWithReturnAddresses:");
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return _[a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return _[a1 pointerValue];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_punctuationCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 punctuationCharacterSet];
}

id objc_msgSend_rangeAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeAtIndex:");
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfCharacterFromSet:");
}

id objc_msgSend_rangeOfCharacterFromSet_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfCharacterFromSet:options:");
}

id objc_msgSend_rangeOfCharacterFromSet_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:");
}

id objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:");
}

id objc_msgSend_rangeOfComposedCharacterSequencesForRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfComposedCharacterSequencesForRange:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_rangeOfString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:range:");
}

id objc_msgSend_rangeValue(void *a1, const char *a2, ...)
{
  return _[a1 rangeValue];
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDefaults:");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_replaceCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceCharactersInRange:withString:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_replaceOccurrencesOfString_withString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scanCharactersFromSet_intoString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanCharactersFromSet:intoString:");
}

id objc_msgSend_scanLocation(void *a1, const char *a2, ...)
{
  return _[a1 scanLocation];
}

id objc_msgSend_scanUpToCharactersFromSet_intoString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanUpToCharactersFromSet:intoString:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setCaseSensitive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCaseSensitive:");
}

id objc_msgSend_setCharactersToBeSkipped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCharactersToBeSkipped:");
}

id objc_msgSend_setLastThrottleCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastThrottleCheck:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setThrottleCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThrottleCount:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithSet:");
}

id objc_msgSend_sharedKeySetForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedKeySetForKeys:");
}

id objc_msgSend_simulateCrashWithMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "simulateCrashWithMessage:");
}

id objc_msgSend_sortUsingFunction_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingFunction:context:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByPaddingToLength:withString:startingAtIndex:");
}

id objc_msgSend_stringByReplacingMatchesInString_options_range_withTemplate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingMatchesInString:options:range:withTemplate:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return _[a1 stringByStandardizingPath];
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithCharacters_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCharacters:length:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_systemName(void *a1, const char *a2, ...)
{
  return _[a1 systemName];
}

id objc_msgSend_systemVersion(void *a1, const char *a2, ...)
{
  return _[a1 systemVersion];
}

id objc_msgSend_throttleCount(void *a1, const char *a2, ...)
{
  return _[a1 throttleCount];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_usesMetricSystem(void *a1, const char *a2, ...)
{
  return _[a1 usesMetricSystem];
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithPointer:");
}

id objc_msgSend_valueWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithRange:");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceCharacterSet];
}