@interface CPSAppBundleInstaller
- (BOOL)inactive;
- (BOOL)stopStallingCurrentInstallation;
- (CPSAppBundleInstaller)initWithBundleIdentifier:(id)a3 extractedBundleURL:(id)a4;
- (NSString)bundleIdentifier;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4;
- (void)coordinatorDidInstallPlaceholder:(id)a3 forApplicationRecord:(id)a4;
- (void)installWithCompletionHandler:(id)a3;
@end

@implementation CPSAppBundleInstaller

- (CPSAppBundleInstaller)initWithBundleIdentifier:(id)a3 extractedBundleURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CPSAppBundleInstaller;
  v9 = [(CPSAppBundleInstaller *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v10->_extractedBundleURL, a4);
    v11 = v10;
  }

  return v10;
}

- (void)installWithCompletionHandler:(id)a3
{
  v4 = (void *)MEMORY[0x2166BE5C0](a3, a2);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v4;

  char v32 = 0;
  extractedBundleURL = self->_extractedBundleURL;
  id v31 = 0;
  id v7 = [MEMORY[0x263F4BEA0] placeholderForInstallable:extractedBundleURL client:18 installType:1 metadata:0 error:&v31];
  id v8 = v31;
  placeholder = self->_placeholder;
  self->_placeholder = v7;

  if (!v7)
  {
    v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CPSAppBundleInstaller installWithCompletionHandler:].cold.4(v10);
    }
  }
  v11 = (void *)MEMORY[0x263F4BE98];
  v12 = [(IXPlaceholder *)self->_placeholder bundleID];
  bundleIdentifier = v12;
  if (!v12) {
    bundleIdentifier = self->_bundleIdentifier;
  }
  id v30 = v8;
  v14 = [v11 coordinatorForAppWithBundleID:bundleIdentifier withClientID:18 createIfNotExisting:1 created:&v32 error:&v30];
  id v15 = v30;

  installCoordinator = self->_installCoordinator;
  self->_installCoordinator = v14;

  if (!v14)
  {
    v17 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CPSAppBundleInstaller installWithCompletionHandler:](v17);
    }
  }
  [(IXInitiatingAppInstallCoordinator *)self->_installCoordinator setObserver:self];
  v18 = objc_opt_new();
  [v18 setLsInstallType:1];
  v19 = self->_installCoordinator;
  id v29 = v15;
  char v20 = [(IXInitiatingAppInstallCoordinator *)v19 setInstallOptions:v18 error:&v29];
  id v21 = v29;

  if ((v20 & 1) == 0)
  {
    v22 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[CPSAppBundleInstaller installWithCompletionHandler:](v22);
    }
  }
  v24 = self->_placeholder;
  v23 = self->_installCoordinator;
  id v28 = v21;
  char v25 = [(IXInitiatingAppInstallCoordinator *)v23 setPlaceholderPromise:v24 error:&v28];
  id v26 = v28;

  if ((v25 & 1) == 0)
  {
    v27 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[CPSAppBundleInstaller installWithCompletionHandler:](v27);
    }
  }
}

- (void)coordinatorDidInstallPlaceholder:(id)a3 forApplicationRecord:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v27 = v5;
    _os_log_impl(&dword_21559C000, v6, OS_LOG_TYPE_INFO, "Coordinator %{private}@ successfully installed placeholder", buf, 0xCu);
  }
  id completionHandler = (void (**)(id, void))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 0);
    id v8 = self->_completionHandler;
    self->_id completionHandler = 0;
  }
  id v9 = v5;
  id v10 = objc_alloc(MEMORY[0x263F4BEB8]);
  v11 = NSString;
  v12 = [(IXPlaceholder *)self->_placeholder bundleID];
  objc_super v13 = [v11 stringWithFormat:@"App Asset: %@", v12];
  v14 = (IXPromisedTransferToPath *)[v10 initWithName:v13 client:18 transferPath:self->_extractedBundleURL diskSpaceNeeded:0];
  appAssetPromise = self->_appAssetPromise;
  self->_appAssetPromise = v14;

  v16 = self->_appAssetPromise;
  if (!v16)
  {
    v17 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CPSAppBundleInstaller coordinatorDidInstallPlaceholder:forApplicationRecord:](v17);
    }
    v16 = self->_appAssetPromise;
  }
  id v25 = 0;
  char v18 = [v9 setAppAssetPromise:v16 error:&v25];
  id v19 = v25;
  if ((v18 & 1) == 0)
  {
    char v20 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[CPSAppBundleInstaller coordinatorDidInstallPlaceholder:forApplicationRecord:](v20);
    }
  }
  if (+[CPSClipURL shouldStallProgress]
    || +[CPSClipURL usesDemoMetadata])
  {
    [(IXPromisedTransferToPath *)self->_appAssetPromise setPercentComplete:0.5];
  }
  else
  {
    [(IXPromisedTransferToPath *)self->_appAssetPromise setComplete:1];
  }
  id v24 = v19;
  char v21 = [v9 setInitialODRAssetPromises:MEMORY[0x263EFFA68] error:&v24];
  id v22 = v24;

  if ((v21 & 1) == 0)
  {
    v23 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[CPSAppBundleInstaller coordinatorDidInstallPlaceholder:forApplicationRecord:](v23);
    }
  }
}

- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138477827;
    id v8 = v5;
    _os_log_impl(&dword_21559C000, v6, OS_LOG_TYPE_INFO, "Coordinator %{private}@ completed successfully", (uint8_t *)&v7, 0xCu);
  }
  self->_inactive = 1;
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v6 = a4;
  int v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[CPSAppBundleInstaller coordinator:canceledWithReason:client:]((uint64_t)v6, v7);
  }
  self->_inactive = 1;
  id completionHandler = (void (**)(id, id))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, v6);
  }
}

- (BOOL)stopStallingCurrentInstallation
{
  appAssetPromise = self->_appAssetPromise;
  if (appAssetPromise)
  {
    [(IXPromisedTransferToPath *)self->_appAssetPromise setPercentComplete:1.0];
    [(IXPromisedTransferToPath *)self->_appAssetPromise setComplete:1];
  }
  else
  {
    v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_21559C000, v4, OS_LOG_TYPE_INFO, "Unable to stop stalling installation because there's no app asset promise", v6, 2u);
    }
  }
  return appAssetPromise != 0;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)inactive
{
  return self->_inactive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_appAssetPromise, 0);
  objc_storeStrong((id *)&self->_installCoordinator, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);

  objc_storeStrong((id *)&self->_extractedBundleURL, 0);
}

- (void)installWithCompletionHandler:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "Unable to set placeholder promise with error %{public}@", v6, v7, v8, v9, v10);
}

- (void)installWithCompletionHandler:(void *)a1 .cold.2(void *a1)
{
  id v2 = a1;
  v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "Unable to set install options with error %{public}@", v6, v7, v8, v9, v10);
}

- (void)installWithCompletionHandler:(void *)a1 .cold.3(void *a1)
{
  id v2 = a1;
  v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "Unable to create IXInitiatingAppInstallCoordinator with error %{public}@", v6, v7, v8, v9, v10);
}

- (void)installWithCompletionHandler:(void *)a1 .cold.4(void *a1)
{
  id v2 = a1;
  v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "Unable to create IXPlaceholder with error %{public}@", v6, v7, v8, v9, v10);
}

- (void)coordinatorDidInstallPlaceholder:(void *)a1 forApplicationRecord:.cold.1(void *a1)
{
  id v2 = a1;
  v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "Failed to set ODR promises %{public}@", v6, v7, v8, v9, v10);
}

- (void)coordinatorDidInstallPlaceholder:(void *)a1 forApplicationRecord:.cold.2(void *a1)
{
  id v2 = a1;
  v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "Failed to set app asset promise %{public}@", v6, v7, v8, v9, v10);
}

- (void)coordinatorDidInstallPlaceholder:(os_log_t)log forApplicationRecord:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21559C000, log, OS_LOG_TYPE_ERROR, "Failed to create app asset promise", v1, 2u);
}

- (void)coordinator:(uint64_t)a1 canceledWithReason:(void *)a2 client:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = a2;
  uint64_t v4 = IXStringForClientID();
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_21559C000, v3, OS_LOG_TYPE_ERROR, "Failed for reason %@ client %@", (uint8_t *)&v5, 0x16u);
}

@end