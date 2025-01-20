@interface UIKeyboardArbiterHost
@end

@implementation UIKeyboardArbiterHost

uint64_t __45___UIKeyboardArbiterHost_updateSceneSettings__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) updateClientSettings:*(void *)(a1 + 40) withTransitionContext:0];
}

void __33___UIKeyboardArbiterHost_dealloc__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) identifier];
  v1 = [getFBSceneManagerClass_0() sharedInstance];
  [v1 destroyScene:v2 withTransitionContext:0];
}

void __76___UIKeyboardArbiterHost_launchAdvisorWithOmniscientDelegate_sceneDelegate___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F83088] useSystemService])
  {
    v4 = objc_alloc_init(_UIKeyboardArbiterHost);
    id v2 = [[_UIKeyboardArbiter alloc] initWithLink:v4];
    v3 = (void *)_MergedGlobals_3;
    _MergedGlobals_3 = (uint64_t)v2;

    [(id)_MergedGlobals_3 setOmniscientDelegate:*(void *)(a1 + 32)];
    [(id)_MergedGlobals_3 setSceneDelegate:*(void *)(a1 + 40)];
    [(id)_MergedGlobals_3 resume];
  }
}

uint64_t __33___UIKeyboardArbiterHost_attach___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) attachLayer:*(void *)(a1 + 40)];
}

uint64_t __33___UIKeyboardArbiterHost_detach___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) detachLayer:*(void *)(a1 + 40)];
}

void __75___UIKeyboardArbiterHost__createSceneWithIdentifier_initialClientSettings___block_invoke(uint64_t a1)
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2050000000;
  id v2 = (void *)getFBDisplayManagerClass_softClass_0;
  uint64_t v25 = getFBDisplayManagerClass_softClass_0;
  if (!getFBDisplayManagerClass_softClass_0)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __getFBDisplayManagerClass_block_invoke_0;
    v21[3] = &unk_264721890;
    v21[4] = &v22;
    __getFBDisplayManagerClass_block_invoke_0((uint64_t)v21);
    id v2 = (void *)v23[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v22, 8);
  v4 = [v3 mainConfiguration];
  v5 = (void *)MEMORY[0x263F3F768];
  v6 = +[FBSSceneSpecification specification];
  v7 = [v5 parametersForSpecification:v6];

  [v7 setClientSettings:*(void *)(a1 + 32)];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __75___UIKeyboardArbiterHost__createSceneWithIdentifier_initialClientSettings___block_invoke_2;
  v18[3] = &unk_264721968;
  id v8 = v4;
  id v19 = v8;
  id v20 = *(id *)(a1 + 32);
  [v7 updateSettingsWithBlock:v18];
  v9 = [getFBSceneManagerClass_0() sharedInstance];
  uint64_t v10 = *(void *)(a1 + 40);
  v11 = [getFBLocalSynchronousSceneClientProviderClass() sharedInstance];
  v12 = [v9 createSceneWithIdentifier:v10 parameters:v7 clientProvider:v11 transitionContext:0];

  v13 = [getFBLocalSynchronousSceneClientProviderClass() sharedInstance];
  uint64_t v14 = [v13 fbsSceneForScene:v12];
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  [getFBSceneManagerClass_0() setKeyboardScene:v12];
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 48) file:@"_UIKeyboardArbiterHost.m" lineNumber:192 description:@"Expected a scene but did not find one."];
  }
}

void __75___UIKeyboardArbiterHost__createSceneWithIdentifier_initialClientSettings___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setDisplayConfiguration:v3];
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v4, "setFrame:");
  [*(id *)(a1 + 40) preferredLevel];
  objc_msgSend(v4, "setLevel:");
  objc_msgSend(v4, "setInterfaceOrientation:", objc_msgSend(*(id *)(a1 + 40), "preferredInterfaceOrientation"));
  [v4 setForeground:1];
}

uint64_t __75___UIKeyboardArbiterHost__createSceneWithIdentifier_initialClientSettings___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end