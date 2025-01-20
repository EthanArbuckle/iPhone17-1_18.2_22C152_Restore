@interface GAXSBInCallPresentationManagerOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)handleOpenApplicationRequest:(id)a3 clientWorkspace:(id)a4 actions:(id)a5 origin:(id)a6 options:(id)a7 withResult:(id)a8;
@end

@implementation GAXSBInCallPresentationManagerOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBInCallPresentationManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)handleOpenApplicationRequest:(id)a3 clientWorkspace:(id)a4 actions:(id)a5 origin:(id)a6 options:(id)a7 withResult:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = +[GAXSpringboard sharedInstance];
  if ([v20 isActive]
    && ([v20 frontmostAppIdentifier],
        v21 = objc_claimAutoreleasedReturnValue(),
        unsigned int v22 = [v21 isEqualToString:@"com.apple.ContactlessUIService"],
        v21,
        v22))
  {
    v23 = GAXLogCommon();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Informing Tap2Pay of activation for InCallPresentation.", buf, 2u);
    }

    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2050000000;
    v24 = (void *)qword_37A68;
    uint64_t v35 = qword_37A68;
    if (!qword_37A68)
    {
      *(void *)buf = _NSConcreteStackBlock;
      uint64_t v28 = 3221225472;
      v29 = sub_12AA8;
      v30 = &unk_28990;
      v31 = &v32;
      sub_12AA8((uint64_t)buf);
      v24 = (void *)v33[3];
    }
    id v25 = v24;
    _Block_object_dispose(&v32, 8);
    [v25 notifyIncomingCallAction:&stru_2B7E0];
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)GAXSBInCallPresentationManagerOverride;
    [(GAXSBInCallPresentationManagerOverride *)&v26 handleOpenApplicationRequest:v14 clientWorkspace:v15 actions:v16 origin:v17 options:v18 withResult:v19];
  }
}

@end