@interface INIntentExecutionInfo
+ (void)initialize;
- (BOOL)canRunOnLocalDevice;
- (BOOL)hasCustomUIExtension;
- (INIntentExecutionInfo)initWithIntent:(id)a3;
- (INIntentExecutionInfo)initWithIntentClassName:(id)a3 extensionBundleId:(id)a4;
- (INIntentExecutionInfo)initWithIntentClassName:(id)a3 launchableAppBundleId:(id)a4;
- (INIntentExecutionInfo)initWithIntentTypeName:(id)a3;
- (NSString)intentClassName;
- (NSString)uiExtensionBundleId;
- (id)_extensionsWithError:(id *)a3;
- (id)_initWithIntentClassName:(id)a3 preferredCallProvider:(int64_t)a4 launchableAppBundleId:(id)a5 displayableAppBundleId:(id)a6 extensionBundleId:(id)a7 uiExtensionBundleId:(id)a8 containingAppBundleURL:(id)a9;
- (id)_matchingAttributesForExtensionPoint:(id)a3 error:(id *)a4;
- (id)_uiExtensionsWithError:(id *)a3;
- (int64_t)preferredCallProvider;
@end

@implementation INIntentExecutionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiExtensionBundleId, 0);
  objc_storeStrong((id *)&self->_intentClassName, 0);
  objc_storeStrong((id *)&self->_uiExtensions, 0);

  objc_storeStrong((id *)&self->_extensions, 0);
}

- (NSString)uiExtensionBundleId
{
  return self->_uiExtensionBundleId;
}

- (int64_t)preferredCallProvider
{
  return self->_preferredCallProvider;
}

- (NSString)intentClassName
{
  return self->_intentClassName;
}

- (id)_uiExtensionsWithError:(id *)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uiExtensions = self->_uiExtensions;
  if (uiExtensions) {
    goto LABEL_8;
  }
  v6 = [(INIntentExecutionInfo *)self uiExtensionBundleId];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:v6 error:a3];
    if (v7)
    {
      v8 = (void *)v7;
      v17[0] = v7;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      v10 = self->_uiExtensions;
      self->_uiExtensions = v9;

LABEL_7:
      uiExtensions = self->_uiExtensions;
LABEL_8:
      v15 = uiExtensions;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v11 = [(INIntentExecutionInfo *)self _matchingAttributesForExtensionPoint:@"com.apple.intents-ui-service" error:a3];
    if (v11)
    {
      v12 = (void *)v11;
      v13 = [MEMORY[0x1E4F28C70] extensionsWithMatchingAttributes:v11 error:a3];
      v14 = self->_uiExtensions;
      self->_uiExtensions = v13;

      goto LABEL_7;
    }
  }

  v15 = 0;
LABEL_9:

  return v15;
}

- (id)_extensionsWithError:(id *)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  extensions = self->_extensions;
  if (extensions) {
    goto LABEL_8;
  }
  v6 = [(INExecutionInfo *)self extensionBundleId];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:v6 error:a3];
    if (v7)
    {
      v8 = (void *)v7;
      v17[0] = v7;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      v10 = self->_extensions;
      self->_extensions = v9;

LABEL_7:
      extensions = self->_extensions;
LABEL_8:
      v15 = extensions;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v11 = [(INIntentExecutionInfo *)self _matchingAttributesForExtensionPoint:@"com.apple.intents-service" error:a3];
    if (v11)
    {
      v12 = (void *)v11;
      v13 = [MEMORY[0x1E4F28C70] extensionsWithMatchingAttributes:v11 error:a3];
      v14 = self->_extensions;
      self->_extensions = v13;

      goto LABEL_7;
    }
  }

  v15 = 0;
LABEL_9:

  return v15;
}

- (id)_matchingAttributesForExtensionPoint:(id)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F282B0]];

  v8 = [(INIntentExecutionInfo *)self intentClassName];
  v21[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [v7 setObject:v9 forKeyedSubscript:@"IntentsSupported"];

  v10 = [(INExecutionInfo *)self containingAppBundleURL];
  uint64_t v11 = [(INExecutionInfo *)self launchableAppBundleId];
  v12 = (void *)v11;
  if (!v10 && v11)
  {
    v13 = [(INExecutionInfo *)self _applicationRecord];
    v10 = [v13 URL];
  }
  if (v10 || !v12)
  {
    if (v10)
    {
      v17 = [v10 path];
      [v7 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F914B0]];
    }
    a4 = v7;
  }
  else if (a4)
  {
    v14 = [NSString stringWithFormat:@"Cannot match extensions for \"%@\" because it does not have a bundle URL", v12, 0];
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28228];
    v20 = v14;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    *a4 = [v15 errorWithDomain:@"IntentsErrorDomain" code:2005 userInfo:v16];

    a4 = 0;
  }

  return a4;
}

- (BOOL)canRunOnLocalDevice
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(INExecutionInfo *)self _applicationRecord];
  v4 = [v3 applicationState];
  int v5 = [v4 isInstalled];

  if (!v5) {
    goto LABEL_4;
  }
  id v6 = [(INExecutionInfo *)self _appInfo];
  uint64_t v7 = [v6 supportedActions];
  v8 = [(INIntentExecutionInfo *)self intentClassName];
  char v9 = [v7 containsObject:v8];

  if (v9) {
    return 1;
  }
LABEL_4:
  id v16 = 0;
  uint64_t v11 = [(INIntentExecutionInfo *)self _extensionsWithError:&v16];
  id v12 = v16;
  uint64_t v13 = [v11 count];
  BOOL v10 = v13 != 0;
  if (!v13)
  {
    if (v12)
    {
      v14 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v18 = "-[INIntentExecutionInfo canRunOnLocalDevice]";
        __int16 v19 = 2114;
        v20 = self;
        __int16 v21 = 2114;
        id v22 = v12;
        _os_log_error_impl(&dword_18CB2F000, v14, OS_LOG_TYPE_ERROR, "%s Failed to match extensions for execution info %{public}@: %{public}@", buf, 0x20u);
      }
    }
  }

  return v10;
}

- (BOOL)hasCustomUIExtension
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  v3 = [(INIntentExecutionInfo *)self _uiExtensionsWithError:&v8];
  id v4 = v8;
  uint64_t v5 = [v3 count];
  if (!v5 && !v3)
  {
    id v6 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      BOOL v10 = "-[INIntentExecutionInfo hasCustomUIExtension]";
      __int16 v11 = 2114;
      id v12 = self;
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_error_impl(&dword_18CB2F000, v6, OS_LOG_TYPE_ERROR, "%s Failed to match UI extensions for execution info %{public}@: %{public}@", buf, 0x20u);
    }
  }

  return v5 != 0;
}

- (id)_initWithIntentClassName:(id)a3 preferredCallProvider:(int64_t)a4 launchableAppBundleId:(id)a5 displayableAppBundleId:(id)a6 extensionBundleId:(id)a7 uiExtensionBundleId:(id)a8 containingAppBundleURL:(id)a9
{
  id v15 = a3;
  id v16 = a8;
  v24.receiver = self;
  v24.super_class = (Class)INIntentExecutionInfo;
  v17 = [(INExecutionInfo *)&v24 _initWithLaunchableAppBundleId:a5 displayableAppBundleId:a6 containingAppBundleURL:a9 extensionBundleId:a7];
  if (v17)
  {
    uint64_t v18 = [v15 copy];
    __int16 v19 = (void *)v17[8];
    v17[8] = v18;

    v17[9] = a4;
    uint64_t v20 = [v16 copy];
    __int16 v21 = (void *)v17[10];
    v17[10] = v20;

    id v22 = v17;
  }

  return v17;
}

- (INIntentExecutionInfo)initWithIntentClassName:(id)a3 extensionBundleId:(id)a4
{
  return (INIntentExecutionInfo *)[(INIntentExecutionInfo *)self _initWithIntentClassName:a3 preferredCallProvider:0 launchableAppBundleId:0 displayableAppBundleId:0 extensionBundleId:a4 uiExtensionBundleId:0 containingAppBundleURL:0];
}

- (INIntentExecutionInfo)initWithIntentClassName:(id)a3 launchableAppBundleId:(id)a4
{
  return (INIntentExecutionInfo *)[(INIntentExecutionInfo *)self _initWithIntentClassName:a3 preferredCallProvider:0 launchableAppBundleId:a4 displayableAppBundleId:0 extensionBundleId:0 uiExtensionBundleId:0 containingAppBundleURL:0];
}

- (INIntentExecutionInfo)initWithIntentTypeName:(id)a3
{
  id v4 = a3;
  id v13 = 0;
  id v14 = 0;
  int v5 = INParseCustomIntentTypeName(v4, &v14, &v13);
  id v6 = v14;
  id v7 = v13;
  if (v5)
  {
    self = [(INIntentExecutionInfo *)self initWithIntentClassName:v6 launchableAppBundleId:v7];
    id v8 = self;
  }
  else
  {
    char v9 = INIntentSchemaGetIntentDescriptionWithType(v4);
    BOOL v10 = v9;
    if (v9)
    {
      __int16 v11 = NSStringFromClass((Class)[v9 facadeClass]);
      self = (INIntentExecutionInfo *)[(INIntentExecutionInfo *)self _initWithIntentClassName:v11 preferredCallProvider:0 launchableAppBundleId:0 displayableAppBundleId:0 extensionBundleId:0 uiExtensionBundleId:0 containingAppBundleURL:0];

      id v8 = self;
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

- (INIntentExecutionInfo)initWithIntent:(id)a3
{
  id v4 = a3;
  [v4 launchId];
  id v19 = 0;
  uint64_t v18 = v20 = 0;
  INExtractAppInfoFromSiriLaunchIdWithoutLaunchServices(v18, &v20, &v19);
  id v5 = v20;
  id v6 = v19;
  id v7 = v4;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v7 preferredCallProvider];
      char v9 = v7;
    }
    else
    {

      uint64_t v8 = 0;
      char v9 = 0;
    }
    id v11 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v11 preferredCallProvider];
      BOOL v10 = v11;
    }
    else
    {

      BOOL v10 = 0;
    }
    id v12 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = 2;
    }
  }
  else
  {
    char v9 = 0;
    BOOL v10 = 0;
    uint64_t v8 = 0;
  }

  id v13 = [v7 _className];
  id v14 = [v7 extensionBundleId];
  id v15 = [v7 _uiExtensionBundleId];
  id v16 = [(INIntentExecutionInfo *)self _initWithIntentClassName:v13 preferredCallProvider:v8 launchableAppBundleId:v5 displayableAppBundleId:0 extensionBundleId:v14 uiExtensionBundleId:v15 containingAppBundleURL:v6];

  return v16;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
  {
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_71966);
  }
}

@end