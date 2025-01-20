@interface _EXExtensionIdentity(SceneProviding)
- (_EXViewControllerSceneConfiguration)configurationWithParameters:()SceneProviding;
- (id)scenes;
- (void)extensionViewControllerClassForSceneRole:()SceneProviding;
@end

@implementation _EXExtensionIdentity(SceneProviding)

- (_EXViewControllerSceneConfiguration)configurationWithParameters:()SceneProviding
{
  id v4 = a3;
  id v5 = [v4 sceneIdentifier];
  if (!v5) {
    id v5 = (id)*MEMORY[0x263F04E28];
  }
  v6 = [(_EXSceneConfiguration *)[_EXViewControllerSceneConfiguration alloc] initWithParameters:v4];

  v7 = [a1 attributes];
  v8 = objc_msgSend(v7, "_EX_dictionaryForKey:", @"EXSceneManifest");
  v9 = objc_msgSend(v8, "_EX_dictionaryForKey:", v5);

  if (v9)
  {
    v10 = objc_msgSend(v9, "_EX_stringForKey:", @"EXStoryboardName");
    [(_EXViewControllerSceneConfiguration *)v6 setStoryboardName:v10];

    v11 = [(_EXViewControllerSceneConfiguration *)v6 storyboardName];

    if (!v11)
    {
      v12 = _EXDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[_EXExtensionIdentity(SceneProviding) configurationWithParameters:]((uint64_t)v5, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    v19 = objc_msgSend(v9, "_EX_stringForKeys:", &unk_26C6547C8);
    if (v19)
    {
      [(_EXViewControllerSceneConfiguration *)v6 setViewControllerClassName:v19];
    }
    else
    {
      v20 = _EXDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[_EXExtensionIdentity(SceneProviding) configurationWithParameters:]((uint64_t)v5, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    v27 = objc_msgSend(v9, "_EX_stringForKey:", @"EXSceneDelegateClass");
    if (v27)
    {
      [(_EXSceneConfiguration *)v6 setSceneDelegateClassName:v27];
    }
    else
    {
      v28 = _EXDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[_EXExtensionIdentity(SceneProviding) configurationWithParameters:]((uint64_t)v5, v28, v29, v30, v31, v32, v33, v34);
      }
    }
  }

  return v6;
}

- (void)extensionViewControllerClassForSceneRole:()SceneProviding
{
  id v4 = a3;
  if (!v4) {
    id v4 = (id)*MEMORY[0x263F04E28];
  }
  id v5 = [a1 extensionPointConfiguration];
  v6 = objc_msgSend(v5, "_EX_dictionaryForKey:", @"EXSceneManifest");
  v7 = objc_msgSend(v6, "_EX_dictionaryForKey:", v4);

  if (!v7
    || (objc_msgSend(v7, "_EX_stringForKeys:", &unk_26C6547E0),
        (v8 = (NSString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v11 = objc_opt_class();
    goto LABEL_8;
  }
  v9 = v8;
  Class v10 = NSClassFromString(v8);
  if (v10)
  {
    v11 = v10;

LABEL_8:
    v11;

    return;
  }
  v12 = _EXDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[_EXExtensionIdentity(SceneProviding) extensionViewControllerClassForSceneRole:]((uint64_t)v9, v12);
  }

  __break(1u);
}

- (id)scenes
{
  v1 = [a1 extensionPointConfiguration];
  v2 = objc_msgSend(v1, "_EX_dictionaryForKey:", @"EXSceneManifest");
  v3 = [v2 allKeys];

  return v3;
}

- (void)configurationWithParameters:()SceneProviding .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)configurationWithParameters:()SceneProviding .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)extensionViewControllerClassForSceneRole:()SceneProviding .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = 136315906;
  v3 = "viewControllerClass";
  __int16 v4 = 2080;
  id v5 = "/Library/Caches/com.apple.xbs/Sources/ExtensionKit/ExtensionKit/Source/Util/EXExtension+UserInterfaceConfiguration.m";
  __int16 v6 = 1024;
  int v7 = 64;
  __int16 v8 = 2114;
  uint64_t v9 = a1;
}

@end