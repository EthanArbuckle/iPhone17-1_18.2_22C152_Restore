@interface CLBSceneUpdate
+ (id)_applicationForScene:(id)a3;
+ (id)_sceneForApplication:(id)a3;
- (CLBApplicationInfo)appInfo;
- (CLBSceneUpdate)initWithApplication:(id)a3;
- (CLBSceneUpdate)initWithRequest:(id)a3 displayStyle:(int64_t)a4;
- (CLBSceneUpdate)initWithScene:(id)a3;
- (Class)sceneSpecificationClass;
- (id)_initWithApplication:(id)a3 scene:(id)a4 displayStyle:(int64_t)a5 createIfNeeded:(BOOL)a6;
- (id)clientSettingsUpdateBlockIfNecessary;
- (id)performUpdate;
- (id)settingsUpdateBlock;
- (void)_updateDisplayStyleForSettings:(id)a3;
- (void)setClientSettingsUpdateBlockIfNecessary:(id)a3;
- (void)setSettingsUpdateBlock:(id)a3;
@end

@implementation CLBSceneUpdate

- (id)_initWithApplication:(id)a3 scene:(id)a4 displayStyle:(int64_t)a5 createIfNeeded:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  if (v12
    || (+[CLBSceneUpdate _sceneForApplication:v11],
        (id v12 = (id)objc_claimAutoreleasedReturnValue()) != 0)
    || a6)
  {
    v17.receiver = self;
    v17.super_class = (Class)CLBSceneUpdate;
    v13 = [(CLBSceneUpdate *)&v17 init];
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_appInfo, a3);
      objc_storeStrong((id *)&v14->_scene, v12);
      v14->_displayStyle = a5;
    }
    v15 = v14;
  }
  else
  {

    v15 = 0;
  }

  return v15;
}

- (CLBSceneUpdate)initWithScene:(id)a3
{
  id v4 = a3;
  v5 = +[CLBSceneUpdate _applicationForScene:v4];
  v6 = v5;
  if (v5)
  {
    v7 = -[CLBSceneUpdate _initWithApplication:scene:displayStyle:createIfNeeded:](self, "_initWithApplication:scene:displayStyle:createIfNeeded:", v5, v4, [v5 displayStyle], 0);
  }
  else
  {
    v8 = +[CLFLog commonLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_1000FFBA8((uint64_t)v4, v8);
    }

    v7 = 0;
  }

  return v7;
}

- (CLBSceneUpdate)initWithApplication:(id)a3
{
  id v4 = a3;
  v5 = -[CLBSceneUpdate _initWithApplication:scene:displayStyle:createIfNeeded:](self, "_initWithApplication:scene:displayStyle:createIfNeeded:", v4, 0, [v4 displayStyle], 1);

  return v5;
}

- (CLBSceneUpdate)initWithRequest:(id)a3 displayStyle:(int64_t)a4
{
  id v7 = a3;
  v8 = [v7 application];
  v9 = [(CLBSceneUpdate *)self _initWithApplication:v8 scene:0 displayStyle:a4 createIfNeeded:1];

  if (v9) {
    objc_storeStrong((id *)&v9->_request, a3);
  }

  return v9;
}

- (id)performUpdate
{
  if (!self->_scene)
  {
    v3 = [(id)qword_100186478 sceneManager];
    id v4 = [v3 workspace];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100015474;
    v40[3] = &unk_10015C730;
    v40[4] = self;
    v5 = [v4 createScene:v40];
    scene = self->_scene;
    self->_scene = v5;

    id v7 = self->_scene;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10001555C;
    v39[3] = &unk_10015C758;
    v39[4] = self;
    [(FBScene *)v7 updateSettingsWithBlock:v39];
  }
  v8 = [(CLBOpenApplicationRequest *)self->_request pptActivationContext];
  v9 = [(CLBOpenApplicationRequest *)self->_request systemCompletion];
  if ([(FBScene *)self->_scene isActive])
  {
    id v10 = 0;
  }
  else
  {
    if (self->_clientSettingsUpdateBlockIfNecessary)
    {
      id v11 = self->_scene;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100015620;
      v38[3] = &unk_10015C780;
      v38[4] = self;
      [(FBScene *)v11 configureParameters:v38];
    }
    id v12 = [(CLBOpenApplicationRequest *)self->_request systemRequest];
    v13 = [v12 options];
    v14 = [v13 dictionary];
    v15 = objc_msgSend(v14, "bs_safeDictionaryForKey:", FBSOpenApplicationOptionKeyDebuggingOptions);

    if ([v15 count]) {
      BOOL v16 = 0;
    }
    else {
      BOOL v16 = v8 == 0;
    }
    if (v16 && v9 == 0)
    {
      id v10 = 0;
    }
    else
    {
      id v10 = objc_alloc_init((Class)FBMutableProcessExecutionContext);
      v18 = objc_msgSend(v15, "bs_safeArrayForKey:", FBSDebugOptionKeyArguments);
      v19 = objc_msgSend(v15, "bs_safeDictionaryForKey:", FBSDebugOptionKeyEnvironment);
      v20 = objc_msgSend(v15, "bs_safeStringForKey:", FBSDebugOptionKeyStandardOutPath);
      v21 = objc_msgSend(v15, "bs_safeStringForKey:", FBSDebugOptionKeyStandardErrorPath);
      unsigned int v31 = objc_msgSend(v15, "bs_BOOLForKey:", FBSDebugOptionKeyDisableASLR);
      unsigned int v30 = objc_msgSend(v15, "bs_BOOLForKey:", FBSDebugOptionKeyWaitForDebugger);
      if ([v18 count]) {
        [v10 setArguments:v18];
      }
      v32 = v18;
      if ([v19 count]) {
        [v10 setEnvironment:v19];
      }
      if (v20)
      {
        v22 = +[NSURL URLWithString:v20];
        [v10 setStandardOutputURL:v22];
      }
      if (v21)
      {
        v23 = +[NSURL URLWithString:v21];
        [v10 setStandardErrorURL:v23];
      }
      [v10 setDisableASLR:v31];
      [v10 setWaitForDebugger:v30];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1000156A8;
      v36[3] = &unk_10015C7A8;
      v37 = v9;
      [v10 setCompletion:v36];
      [v8 prepareExecutionContext:v10];
    }
  }
  v24 = self->_scene;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100015728;
  v33[3] = &unk_10015C7D0;
  v33[4] = self;
  id v34 = v8;
  id v35 = v10;
  id v25 = v10;
  id v26 = v8;
  [(FBScene *)v24 performUpdate:v33];
  if (v9 && !v25) {
    v9[2](v9, 0);
  }
  request = self->_request;
  self->_request = 0;

  v28 = self->_scene;
  return v28;
}

- (void)_updateDisplayStyleForSettings:(id)a3
{
  id v4 = a3;
  v5 = +[FBDisplayManager mainConfiguration];
  v6 = v5;
  int64_t displayStyle = self->_displayStyle;
  if (displayStyle == 1)
  {
    v8 = objc_msgSend(v5, "clb_displayConfigurationForNonClarityUIApp");
    [v4 setDisplayConfiguration:v8];
    uint64_t v9 = sub_10000730C();
    sub_1000254CC(v9, (uint64_t)&v13);
    BSRectWithSize();
    objc_msgSend(v4, "setFrame:");
  }
  else if (!displayStyle)
  {
    [v4 setDisplayConfiguration:v5];
    [v6 bounds];
    objc_msgSend(v4, "setFrame:");
  }
  id v10 = +[CLFLog commonLog];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(CLBApplicationInfo *)self->_appInfo bundleIdentifier];
    [v4 frame];
    id v12 = NSStringFromCGRect(v18);
    *(_DWORD *)buf = 138412546;
    v15 = v11;
    __int16 v16 = 2112;
    objc_super v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Using scene frame for %@: %@", buf, 0x16u);
  }
}

+ (id)_sceneForApplication:(id)a3
{
  v3 = (void *)qword_100186478;
  id v4 = a3;
  v5 = [v3 sceneManager];
  v6 = [v5 workspace];
  id v7 = [v4 defaultSceneIdentifier];

  v8 = [v6 sceneWithIdentifier:v7];

  return v8;
}

+ (id)_applicationForScene:(id)a3
{
  v3 = [a3 definition];
  id v4 = [v3 clientIdentity];
  v5 = [v4 processIdentity];
  v6 = [v5 embeddedApplicationIdentifier];

  id v7 = [(id)qword_100186478 appLibrary];
  v8 = [v7 installedApplicationWithBundleIdentifier:v6];

  return v8;
}

- (CLBApplicationInfo)appInfo
{
  return self->_appInfo;
}

- (id)settingsUpdateBlock
{
  return self->_settingsUpdateBlock;
}

- (void)setSettingsUpdateBlock:(id)a3
{
}

- (id)clientSettingsUpdateBlockIfNecessary
{
  return self->_clientSettingsUpdateBlockIfNecessary;
}

- (void)setClientSettingsUpdateBlockIfNecessary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientSettingsUpdateBlockIfNecessary, 0);
  objc_storeStrong(&self->_settingsUpdateBlock, 0);
  objc_storeStrong((id *)&self->_appInfo, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_scene, 0);
}

- (Class)sceneSpecificationClass
{
  type metadata accessor for ClarityUIApplicationSceneSpecificationWrapper();
  static ClarityUIApplicationSceneSpecificationWrapper.specificationClass.getter();

  return (Class)swift_getObjCClassFromMetadata();
}

@end