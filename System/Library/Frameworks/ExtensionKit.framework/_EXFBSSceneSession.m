@interface _EXFBSSceneSession
- (FBSScene)fbsScene;
- (id)makeSceneWithError:(id *)a3;
- (void)connectWithFBSScene:(id)a3;
- (void)setFbsScene:(id)a3;
@end

@implementation _EXFBSSceneSession

- (id)makeSceneWithError:(id *)a3
{
  v4 = [(_EXSceneSession *)self extension];
  int v5 = [v4 hasSwiftEntryPoint];

  if (v5)
  {
    v6 = +[_EXRunningUIExtension sharedInstance];
    v7 = [v6 sceneFactory];

    v8 = [(_EXSceneSession *)self configuration];
    v9 = [v7 makeSceneWithConfiguration:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)connectWithFBSScene:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_fbsScene, a3);
  v6 = [v5 identifier];
  v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v6];
  if (v7)
  {
    [(_EXSceneSession *)self setIdentifier:v7];
    v8 = objc_alloc_init(MEMORY[0x263F04E18]);
    v9 = [v5 settings];
    v10 = objc_msgSend(v9, "ex_role");
    [v8 setSceneIdentifier:v10];

    v11 = [(_EXSceneSession *)self makeConfigurationWithParameters:v8];
    [(_EXSceneSession *)self setConfiguration:v11];

    v12 = [(_EXSceneSession *)self extension];
    v13 = [(_EXSceneSession *)self configuration];
    [v12 prepareForSceneConnectionWithConfiguration:v13];

    v14 = [MEMORY[0x263F04E10] sharedInstance];
    [v14 addSession:self];

    uint64_t v16 = 0;
    v15 = [(_EXFBSSceneSession *)self makeSceneWithError:&v16];
    if (v15)
    {
      [(_EXSceneSession *)self setScene:v15];
      [(_EXSceneSession *)self connectToScene:v15];
    }
  }
  else
  {
    v8 = _EXDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[_EXFBSSceneSession connectWithFBSScene:]((uint64_t)v6, v8);
    }
  }
}

- (FBSScene)fbsScene
{
  return (FBSScene *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFbsScene:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)connectWithFBSScene:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_2156DD000, a2, OS_LOG_TYPE_FAULT, "Unexpected scene identifier. ExtensionKit requires the scene identifier to be a UUID string. Got: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end