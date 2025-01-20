@interface WFPlaylistSubstitutableState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFPlaylistSubstitutableState)initWithPlaylist:(id)a3;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFPlaylistSubstitutableState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __89__WFPlaylistSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
  v13[3] = &unk_264E56630;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  v12.receiver = self;
  v12.super_class = (Class)WFPlaylistSubstitutableState;
  id v10 = v9;
  id v11 = v8;
  [(WFVariableSubstitutableParameterState *)&v12 processWithContext:v11 userInputRequiredHandler:a4 valueHandler:v13];
}

void __89__WFPlaylistSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5
    || ([*(id *)(a1 + 32) variable],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) variable];
    uint64_t v9 = objc_opt_class();
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __89__WFPlaylistSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
    v11[3] = &unk_264E5E1E0;
    uint64_t v10 = *(void *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    [v8 getObjectRepresentationForClass:v9 context:v10 completionHandler:v11];
  }
}

void __89__WFPlaylistSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v7;
  if (v7)
  {
    id v9 = a5;
    uint64_t v10 = [[WFPlaylistDescriptor alloc] initWithPlaylistName:v12 persistentIdentifier:0];
    (*(void (**)(uint64_t, WFPlaylistDescriptor *, id))(v8 + 16))(v8, v10, v9);
  }
  else
  {
    id v11 = *(void (**)(uint64_t, void, WFPlaylistDescriptor *))(v8 + 16);
    uint64_t v10 = a5;
    v11(v8, 0, v10);
  }
}

- (WFPlaylistSubstitutableState)initWithPlaylist:(id)a3
{
  id v4 = a3;
  id v5 = [WFPlaylistDescriptor alloc];
  id v6 = [v4 name];

  id v7 = [(WFPlaylistDescriptor *)v5 initWithPlaylistName:v6 persistentIdentifier:0];
  v10.receiver = self;
  v10.super_class = (Class)WFPlaylistSubstitutableState;
  uint64_t v8 = [(WFVariableSubstitutableParameterState *)&v10 initWithValue:v7];

  return v8;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"WFPlaylistSubstitutableState.m", 153, @"Invalid parameter not satisfying: %@", @"[value isKindOfClass:[WFPlaylistDescriptor class]]" object file lineNumber description];
  }
  if ([v5 entireMusicLibrary])
  {
    objc_super v10 = @"EntireMusicLibrary";
    v11[0] = MEMORY[0x263EFFA88];
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    uint64_t v6 = [v5 playlistName];
  }
  id v7 = (void *)v6;

  return v7;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 objectForKeyedSubscript:@"EntireMusicLibrary"];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = WFEnforceClass(v6, v7);
    int v9 = [v8 BOOLValue];

    if (v9)
    {
      objc_super v10 = [[WFPlaylistDescriptor alloc] initWithEntireMusicLibrary];
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v11 = objc_opt_class();
    id v12 = WFEnforceClass(v5, v11);
    if ([v12 length])
    {
      objc_super v10 = [[WFPlaylistDescriptor alloc] initWithPlaylistName:v12 persistentIdentifier:0];

      goto LABEL_8;
    }
  }
  objc_super v10 = 0;
LABEL_8:

  return v10;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end