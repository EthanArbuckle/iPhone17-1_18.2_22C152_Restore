@interface GAXSBSceneManagerCoordinatorOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
@end

@implementation GAXSBSceneManagerCoordinatorOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBSceneManagerCoordinator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSceneManagerCoordinator", @"scene:didReceiveActions:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BSAction", @"UIActionType", "q", 0);
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[GAXSpringboard sharedInstance];
  if ([v8 isActive])
  {
    v20 = self;
    v21 = v8;
    id v23 = v6;
    v9 = +[NSMutableSet set];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v22 = v7;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v16 = [v15 safeValueForKey:@"UIActionType"];
          v17 = (char *)[v16 integerValue];

          if (v17 == (unsigned char *)&stru_20.cmdsize + 2 || v17 == (unsigned char *)&dword_4 + 3)
          {
            v19 = GAXLogCommon();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Guided Access active. Intercepting status bar tap", buf, 2u);
            }
          }
          else
          {
            [v9 addObject:v15];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v12);
    }

    v24.receiver = v20;
    v24.super_class = (Class)GAXSBSceneManagerCoordinatorOverride;
    id v6 = v23;
    [(GAXSBSceneManagerCoordinatorOverride *)&v24 scene:v23 didReceiveActions:v9];

    v8 = v21;
    id v7 = v22;
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)GAXSBSceneManagerCoordinatorOverride;
    [(GAXSBSceneManagerCoordinatorOverride *)&v30 scene:v6 didReceiveActions:v7];
  }
}

@end