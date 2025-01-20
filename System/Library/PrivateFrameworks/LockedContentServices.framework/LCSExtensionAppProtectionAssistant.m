@interface LCSExtensionAppProtectionAssistant
- (APExtension)appProtectionExtension;
- (APExtensionSubjectMonitorRegistry)appProtectionRegistry;
- (APSubjectMonitorSubscription)subscription;
- (BOOL)shouldShield;
- (LCSExtension)extension;
- (LCSExtensionAppProtectionAssistant)initWithExtension:(id)a3;
- (NSHashTable)observers;
- (NSString)description;
- (id)applicationIconImage;
- (id)createShieldUIViewController;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)addObserver:(id)a3;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)requestUnshielding;
- (void)setAppProtectionExtension:(id)a3;
- (void)setAppProtectionRegistry:(id)a3;
- (void)setExtension:(id)a3;
- (void)setSubscription:(id)a3;
@end

@implementation LCSExtensionAppProtectionAssistant

- (LCSExtensionAppProtectionAssistant)initWithExtension:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)LCSExtensionAppProtectionAssistant;
  v6 = [(LCSExtensionAppProtectionAssistant *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extension, a3);
    id v8 = objc_alloc(MEMORY[0x263F251D8]);
    v9 = [v5 applicationExtensionRecord];
    v10 = (APExtension *)[v8 initWithApplicationExtensionRecord:v9];

    appProtectionExtension = v7->_appProtectionExtension;
    v7->_appProtectionExtension = v10;
    v12 = v10;

    v13 = (void *)[objc_alloc(MEMORY[0x263F251F0]) initWithExtensionSubject:v12];
    uint64_t v14 = [v13 addMonitor:v7];
    subscription = v7->_subscription;
    v7->_subscription = (APSubjectMonitorSubscription *)v14;

    [v13 resume];
    appProtectionRegistry = v7->_appProtectionRegistry;
    v7->_appProtectionRegistry = (APExtensionSubjectMonitorRegistry *)v13;

    LOBYTE(v13) = [(APExtension *)v12 isEffectivelyLocked];
    v7->_shouldShield = (char)v13;
  }

  return v7;
}

- (void)dealloc
{
  [(APSubjectMonitorSubscription *)self->_subscription invalidate];
  [(APExtensionSubjectMonitorRegistry *)self->_appProtectionRegistry invalidate];
  v3.receiver = self;
  v3.super_class = (Class)LCSExtensionAppProtectionAssistant;
  [(LCSExtensionAppProtectionAssistant *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSHashTable *)self->_observers removeObject:v4];
    if (![(NSHashTable *)self->_observers count])
    {
      observers = self->_observers;
      self->_observers = 0;
    }
  }
  MEMORY[0x270F9A758]();
}

- (id)createShieldUIViewController
{
  v2 = [[LCSAppProtectionShieldViewController alloc] initWithAssistant:self];
  return v2;
}

- (id)applicationIconImage
{
  id v3 = objc_alloc(MEMORY[0x263F4B540]);
  id v4 = [(LCSExtension *)self->_extension containerBundleIdentifier];
  id v5 = (void *)[v3 initWithBundleIdentifier:v4];

  v6 = objc_msgSend(objc_alloc(MEMORY[0x263F4B558]), "initWithSize:scale:", 64.0, 64.0, 2.0);
  [v6 setDrawBorder:1];
  v7 = [v5 prepareImageForDescriptor:v6];
  id v8 = (void *)MEMORY[0x263F827E8];
  uint64_t v9 = [v7 CGImage];
  [v7 scale];
  v10 = objc_msgSend(v8, "imageWithCGImage:scale:orientation:", v9, 0);

  return v10;
}

- (void)requestUnshielding
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = LCSLogExtension();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(LCSExtensionAppProtectionAssistant *)self succinctDescription];
    *(_DWORD *)buf = 138543362;
    v15 = v4;
    _os_log_impl(&dword_255087000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will request unshielding", buf, 0xCu);
  }
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"AppProtectionLocalizedDescription" value:0 table:0];

  v7 = NSString;
  id v8 = [(LCSExtension *)self->_extension localizedDisplayName];
  uint64_t v9 = objc_msgSend(v7, "stringWithFormat:", v6, v8);

  objc_initWeak((id *)buf, self);
  v10 = [MEMORY[0x263F251F8] sharedGuard];
  appProtectionExtension = self->_appProtectionExtension;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__LCSExtensionAppProtectionAssistant_requestUnshielding__block_invoke;
  v12[3] = &unk_2653BE9C8;
  v12[4] = self;
  objc_copyWeak(&v13, (id *)buf);
  [v10 authenticateForExtension:appProtectionExtension reasonDescription:v9 completion:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __56__LCSExtensionAppProtectionAssistant_requestUnshielding__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = LCSLogExtension();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [*(id *)(a1 + 32) succinctDescription];
    *(_DWORD *)buf = 138412802;
    v12 = v7;
    __int16 v13 = 1024;
    int v14 = a2;
    __int16 v15 = 2114;
    id v16 = v5;
    _os_log_impl(&dword_255087000, v6, OS_LOG_TYPE_DEFAULT, "authenticateForSubject: %@ with success: %{BOOL}u error: %{public}@", buf, 0x1Cu);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__LCSExtensionAppProtectionAssistant_requestUnshielding__block_invoke_13;
  v8[3] = &unk_2653BE9A0;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  char v10 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v8);
  objc_destroyWeak(&v9);
}

void __56__LCSExtensionAppProtectionAssistant_requestUnshielding__block_invoke_13(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained && *(unsigned char *)(a1 + 40))
  {
    *((unsigned char *)WeakRetained + 8) = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = objc_msgSend(WeakRetained[4], "allObjects", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v9 extensionAppProtectionAssistantShouldShieldDidChange:v3];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    uint64_t v18 = *(void *)v25;
    id v19 = v5;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEqual:", self->_appProtectionExtension, v18, v19))
        {
          int v11 = [v10 isEffectivelyLocked];
          if (self->_shouldShield != v11)
          {
            self->_shouldShield = v11;
            long long v20 = 0u;
            long long v21 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            long long v12 = [(NSHashTable *)self->_observers allObjects];
            uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v21;
              do
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v21 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v17 = *(void **)(*((void *)&v20 + 1) + 8 * j);
                  if (objc_opt_respondsToSelector()) {
                    [v17 extensionAppProtectionAssistantShouldShieldDidChange:self];
                  }
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
              }
              while (v14);
            }

            uint64_t v8 = v18;
            id v5 = v19;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }
}

- (NSString)description
{
  return (NSString *)[(LCSExtensionAppProtectionAssistant *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v3 = [(LCSExtensionAppProtectionAssistant *)self succinctDescriptionBuilder];
  id v4 = [(LCSExtension *)self->_extension bundleIdentifier];
  [v3 appendString:v4 withName:@"extension"];

  id v5 = [v3 build];

  return v5;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x263F29C40] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(LCSExtensionAppProtectionAssistant *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(LCSExtensionAppProtectionAssistant *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__LCSExtensionAppProtectionAssistant_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_2653BE9F0;
  id v6 = v5;
  id v10 = v6;
  int v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __76__LCSExtensionAppProtectionAssistant_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "shouldShield"), @"shouldShield", 1);
}

- (LCSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (APExtension)appProtectionExtension
{
  return self->_appProtectionExtension;
}

- (void)setAppProtectionExtension:(id)a3
{
}

- (BOOL)shouldShield
{
  return self->_shouldShield;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (APExtensionSubjectMonitorRegistry)appProtectionRegistry
{
  return self->_appProtectionRegistry;
}

- (void)setAppProtectionRegistry:(id)a3
{
}

- (APSubjectMonitorSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_appProtectionRegistry, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_appProtectionExtension, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end