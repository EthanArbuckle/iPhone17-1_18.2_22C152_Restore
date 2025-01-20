@interface SFWebProcessPlugInPageExtensionController
- (SFWebProcessPlugInPageExtensionController)initWithBrowserContextController:(id)a3;
- (void)_clearExtensionControllerInterface;
- (void)_setUpExtensionControllerInterface;
- (void)clearExtensionScriptWorlds;
- (void)dealloc;
- (void)evaluateJavaScriptForSharingExtension:(id)a3 extraArguments:(id)a4 completionHandler:(id)a5;
- (void)finalizeJavaScriptForSharingExtension:(id)a3 arguments:(id)a4;
- (void)prepareJavaScriptWorldForSharingExtension:(id)a3 javaScript:(id)a4;
@end

@implementation SFWebProcessPlugInPageExtensionController

- (SFWebProcessPlugInPageExtensionController)initWithBrowserContextController:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFWebProcessPlugInPageExtensionController;
  v5 = [(SFWebProcessPlugInPageExtensionController *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_browserContextController, v4);
    [(SFWebProcessPlugInPageExtensionController *)v6 _setUpExtensionControllerInterface];
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    extensionToScriptWorldMap = v6->_extensionToScriptWorldMap;
    v6->_extensionToScriptWorldMap = v7;

    v9 = v6;
  }

  return v6;
}

- (void)_setUpExtensionControllerInterface
{
  v3 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1EFCBA278];
  extensionControllerInterface = self->_extensionControllerInterface;
  self->_extensionControllerInterface = v3;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContextController);
  v5 = [WeakRetained _remoteObjectRegistry];
  [v5 registerExportedObject:self interface:self->_extensionControllerInterface];
}

- (void)dealloc
{
  [(SFWebProcessPlugInPageExtensionController *)self clearExtensionScriptWorlds];
  [(SFWebProcessPlugInPageExtensionController *)self _clearExtensionControllerInterface];
  v3.receiver = self;
  v3.super_class = (Class)SFWebProcessPlugInPageExtensionController;
  [(SFWebProcessPlugInPageExtensionController *)&v3 dealloc];
}

- (void)_clearExtensionControllerInterface
{
  if (self->_extensionControllerInterface)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContextController);
    id v5 = [WeakRetained _remoteObjectRegistry];

    [v5 unregisterExportedObject:self interface:self->_extensionControllerInterface];
    extensionControllerInterface = self->_extensionControllerInterface;
    self->_extensionControllerInterface = 0;
  }
}

- (void)prepareJavaScriptWorldForSharingExtension:(id)a3 javaScript:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SFWebProcessPlugInPageExtensionController prepareJavaScriptWorldForSharingExtension:javaScript:](v8);
  }
  v9 = [(NSMutableDictionary *)self->_extensionToScriptWorldMap objectForKey:v6];
  if (!v9)
  {
    v9 = [MEMORY[0x1E4F466E8] world];
    [(NSMutableDictionary *)self->_extensionToScriptWorldMap setObject:v9 forKey:v6];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContextController);
  objc_super v11 = [WeakRetained mainFrame];
  v12 = [v11 jsContextForWorld:v9];

  id v13 = (id)[v12 evaluateScript:v7];
  v14 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1A690B000, v14, OS_LOG_TYPE_INFO, "Finished setting up JavaScript world", v15, 2u);
  }
}

- (void)evaluateJavaScriptForSharingExtension:(id)a3 extraArguments:(id)a4 completionHandler:(id)a5
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a5;
  objc_super v11 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[SFWebProcessPlugInPageExtensionController evaluateJavaScriptForSharingExtension:extraArguments:completionHandler:](v11);
  }
  v12 = [(NSMutableDictionary *)self->_extensionToScriptWorldMap objectForKey:v8];
  if (v12)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContextController);
    v14 = [WeakRetained mainFrame];
    v15 = [v14 jsContextForWorld:v12];

    v16 = [v15 globalObject];
    v17 = [v16 valueForProperty:@"ExtensionPreprocessingJS"];

    if (([v17 isUndefined] & 1) != 0
      || ([v17 valueForProperty:@"run"],
          v18 = objc_claimAutoreleasedReturnValue(),
          int v19 = [v18 isUndefined],
          v18,
          v19))
    {
      v10[2](v10, MEMORY[0x1E4F1CC08]);
    }
    else
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __116__SFWebProcessPlugInPageExtensionController_evaluateJavaScriptForSharingExtension_extraArguments_completionHandler___block_invoke;
      v31[3] = &unk_1E5C75DD8;
      v32 = v10;
      v29 = (void *)MEMORY[0x1AD0C36A0](v31);
      id v21 = objc_alloc(MEMORY[0x1E4F1CA60]);
      v34[0] = @"extensionName";
      v34[1] = @"completionFunction";
      v35[0] = v8;
      v22 = (void *)MEMORY[0x1AD0C36A0](v29);
      v35[1] = v22;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
      v24 = (void *)[v21 initWithDictionary:v23];

      if (v9) {
        [v24 setObject:v9 forKey:@"extraArguments"];
      }
      v25 = (void *)[v24 copy];
      v26 = WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A690B000, v26, OS_LOG_TYPE_INFO, "Invoking extension's JavaScript", buf, 2u);
      }
      v33 = v25;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
      id v28 = (id)[v17 invokeMethod:@"run" withArguments:v27];
    }
  }
  else
  {
    v20 = WBS_LOG_CHANNEL_PREFIXExtensions();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SFWebProcessPlugInPageExtensionController evaluateJavaScriptForSharingExtension:extraArguments:completionHandler:](v20);
    }
    v10[2](v10, 0);
  }
}

void __116__SFWebProcessPlugInPageExtensionController_evaluateJavaScriptForSharingExtension_extraArguments_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 toDictionary];
  id v5 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    id v7 = v4;
    _os_log_impl(&dword_1A690B000, v5, OS_LOG_TYPE_INFO, "Script returned results to native code: %p", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)finalizeJavaScriptForSharingExtension:(id)a3 arguments:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_extensionToScriptWorldMap objectForKey:v6];
  if (v8)
  {
    [(NSMutableDictionary *)self->_extensionToScriptWorldMap removeObjectForKey:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContextController);
    v10 = [WeakRetained mainFrame];
    objc_super v11 = [v10 jsContextForWorld:v8];

    v12 = [v11 globalObject];
    id v13 = [v12 valueForProperty:@"ExtensionPreprocessingJS"];

    if (([v13 isUndefined] & 1) == 0)
    {
      v14 = [v13 valueForProperty:@"finalize"];
      char v15 = [v14 isUndefined];

      if ((v15 & 1) == 0)
      {
        v19[0] = v7;
        v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
        id v17 = (id)[v13 invokeMethod:@"finalize" withArguments:v16];

        v18 = [v11 globalObject];
        [v18 deleteProperty:@"ExtensionPreprocessingJS"];
      }
    }
    [v8 clearWrappers];
  }
}

- (void)clearExtensionScriptWorlds
{
  [(NSMutableDictionary *)self->_extensionToScriptWorldMap enumerateKeysAndObjectsUsingBlock:&__block_literal_global_31];
  extensionToScriptWorldMap = self->_extensionToScriptWorldMap;

  [(NSMutableDictionary *)extensionToScriptWorldMap removeAllObjects];
}

uint64_t __71__SFWebProcessPlugInPageExtensionController_clearExtensionScriptWorlds__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 clearWrappers];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionToScriptWorldMap, 0);
  objc_storeStrong((id *)&self->_extensionControllerInterface, 0);

  objc_destroyWeak((id *)&self->_browserContextController);
}

- (void)prepareJavaScriptWorldForSharingExtension:(os_log_t)log javaScript:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A690B000, log, OS_LOG_TYPE_DEBUG, "Setting up JavaScript world to run extension", v1, 2u);
}

- (void)evaluateJavaScriptForSharingExtension:(os_log_t)log extraArguments:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Can't find extension JavaScript world, possibly because the page navigated; won't run JavaScript code",
    v1,
    2u);
}

- (void)evaluateJavaScriptForSharingExtension:(os_log_t)log extraArguments:completionHandler:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A690B000, log, OS_LOG_TYPE_DEBUG, "Running JavaScript extension", v1, 2u);
}

@end