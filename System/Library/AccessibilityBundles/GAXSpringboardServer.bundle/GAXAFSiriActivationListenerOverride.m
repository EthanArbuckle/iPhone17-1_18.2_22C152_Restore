@interface GAXAFSiriActivationListenerOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_activateWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation GAXAFSiriActivationListenerOverride

+ (id)safeCategoryTargetClassName
{
  return @"AFSiriActivationListener";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_activateWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = +[GAXSpringboard sharedInstance];
  unsigned int v13 = [v12 isActive];

  if (!v13) {
    goto LABEL_10;
  }
  v14 = GAXLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Guided Access is active. Blocking Hey Siri request.", buf, 2u);
  }

  v15 = +[NSError ax_errorWithDomain:@"GAXAFSiriActivationErrorDomain" description:@"Hey Siri is not permitted in Guided Access or its variants."];
  *(void *)buf = 0;
  v29 = buf;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  if (v11)
  {
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_13E34;
    v24 = &unk_28C80;
    id v26 = v11;
    id v16 = v15;
    id v25 = v16;
    v27 = buf;
    AXPerformSafeBlock();

    if (v29[24])
    {
      _Block_object_dispose(buf, 8);

      goto LABEL_11;
    }
  }
  v17 = GAXLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    v18 = NSStringFromSelector(a2);
    sub_15B80(v18, v32, v17);
  }

  BOOL v19 = v29[24] == 0;
  _Block_object_dispose(buf, 8);

  if (v19)
  {
LABEL_10:
    v20.receiver = self;
    v20.super_class = (Class)GAXAFSiriActivationListenerOverride;
    [(GAXAFSiriActivationListenerOverride *)&v20 _activateWithRequestInfo:v9 context:v10 completion:v11];
  }
LABEL_11:
}

@end