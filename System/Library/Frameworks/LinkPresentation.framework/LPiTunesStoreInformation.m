@interface LPiTunesStoreInformation
+ (id)_convertNewStorefrontIdentifier:(id)a3;
+ (id)shared;
+ (unint64_t)_convertCapabilities:(unint64_t)a3;
- (LPiTunesStoreInformation)init;
- (NSString)storefrontIdentifier;
- (unint64_t)capabilities;
- (unint64_t)userStateForMediaStorefrontIdentifier:(id)a3;
- (void)_capabilitiesDidChangeNotification;
- (void)_notifyChangeHandlers;
- (void)_setCapabilities:(unint64_t)a3;
- (void)_setStorefrontIdentifier:(id)a3;
- (void)_setupCloudServiceController;
- (void)_storefrontDidChangeNotification;
- (void)registerForStoreAvailablityChangesWithToken:(id)a3 handler:(id)a4;
- (void)unregisterForStoreAvailablityChangesWithToken:(id)a3;
@end

@implementation LPiTunesStoreInformation

+ (id)shared
{
  v2 = (void *)shared_singleton;
  if (!shared_singleton)
  {
    v3 = objc_alloc_init(LPiTunesStoreInformation);
    v4 = (void *)shared_singleton;
    shared_singleton = (uint64_t)v3;

    v2 = (void *)shared_singleton;
  }

  return v2;
}

- (LPiTunesStoreInformation)init
{
  v7.receiver = self;
  v7.super_class = (Class)LPiTunesStoreInformation;
  v2 = [(LPiTunesStoreInformation *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    changeHandlers = v2->_changeHandlers;
    v2->_changeHandlers = (NSMapTable *)v3;

    v2->_capabilities = 0;
    [(LPiTunesStoreInformation *)v2 _setupCloudServiceController];
    v5 = v2;
  }

  return v2;
}

- (void)_setupCloudServiceController
{
  uint64_t v3 = cloudServiceControllerQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__LPiTunesStoreInformation__setupCloudServiceController__block_invoke;
  block[3] = &unk_1E5B04DF0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __56__LPiTunesStoreInformation__setupCloudServiceController__block_invoke(uint64_t a1)
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v2 = (void *)getSKCloudServiceControllerClass_softClass;
  uint64_t v18 = getSKCloudServiceControllerClass_softClass;
  if (!getSKCloudServiceControllerClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getSKCloudServiceControllerClass_block_invoke;
    v14[3] = &unk_1E5B04EB8;
    v14[4] = &v15;
    __getSKCloudServiceControllerClass_block_invoke((uint64_t)v14);
    v2 = (void *)v16[3];
  }
  uint64_t v3 = v2;
  _Block_object_dispose(&v15, 8);
  uint64_t v4 = [[v3 alloc] init];
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v4;

  [*(id *)(*(void *)(a1 + 32) + 8) _setAllowsPromptingForPrivacyAcknowledgement:0];
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__LPiTunesStoreInformation__setupCloudServiceController__block_invoke_2;
  v13[3] = &unk_1E5B05898;
  v13[4] = v7;
  [v8 requestStorefrontIdentifierWithCompletionHandler:v13];
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 8);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__LPiTunesStoreInformation__setupCloudServiceController__block_invoke_4;
  v12[3] = &unk_1E5B058E8;
  v12[4] = v9;
  return [v10 requestCapabilitiesWithCompletionHandler:v12];
}

void __56__LPiTunesStoreInformation__setupCloudServiceController__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__LPiTunesStoreInformation__setupCloudServiceController__block_invoke_3;
  v5[3] = &unk_1E5B04E18;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __56__LPiTunesStoreInformation__setupCloudServiceController__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _setStorefrontIdentifier:*(void *)(a1 + 40)];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  id v4 = (void *)getSKStorefrontIdentifierDidChangeNotificationSymbolLoc_ptr;
  uint64_t v11 = getSKStorefrontIdentifierDidChangeNotificationSymbolLoc_ptr;
  if (!getSKStorefrontIdentifierDidChangeNotificationSymbolLoc_ptr)
  {
    uint64_t v5 = StoreKitLibrary();
    v9[3] = (uint64_t)dlsym(v5, "SKStorefrontIdentifierDidChangeNotification");
    getSKStorefrontIdentifierDidChangeNotificationSymbolLoc_ptr = v9[3];
    id v4 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v4)
  {
    [v2 addObserver:v3 selector:sel__storefrontDidChangeNotification name:*v4 object:*(void *)(*(void *)(a1 + 32) + 8)];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"NSNotificationName getSKStorefrontIdentifierDidChangeNotification(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"LPiTunesStoreInformation.m", 19, @"%s", dlerror());

    __break(1u);
  }
}

void __56__LPiTunesStoreInformation__setupCloudServiceController__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    v5[6] = v3;
    v5[7] = v4;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__LPiTunesStoreInformation__setupCloudServiceController__block_invoke_5;
    v5[3] = &unk_1E5B058C0;
    v5[4] = *(void *)(a1 + 32);
    void v5[5] = a2;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

void __56__LPiTunesStoreInformation__setupCloudServiceController__block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) _setCapabilities:*(void *)(a1 + 40)];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v4 = (void *)getSKCloudServiceCapabilitiesDidChangeNotificationSymbolLoc_ptr;
  uint64_t v11 = getSKCloudServiceCapabilitiesDidChangeNotificationSymbolLoc_ptr;
  if (!getSKCloudServiceCapabilitiesDidChangeNotificationSymbolLoc_ptr)
  {
    uint64_t v5 = StoreKitLibrary();
    v9[3] = (uint64_t)dlsym(v5, "SKCloudServiceCapabilitiesDidChangeNotification");
    getSKCloudServiceCapabilitiesDidChangeNotificationSymbolLoc_ptr = v9[3];
    uint64_t v4 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v4)
  {
    [v2 addObserver:v3 selector:sel__capabilitiesDidChangeNotification name:*v4 object:*(void *)(*(void *)(a1 + 32) + 8)];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"NSNotificationName getSKCloudServiceCapabilitiesDidChangeNotification(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"LPiTunesStoreInformation.m", 18, @"%s", dlerror());

    __break(1u);
  }
}

- (unint64_t)userStateForMediaStorefrontIdentifier:(id)a3
{
  id v4 = a3;
  storefrontIdentifier = self->_storefrontIdentifier;
  if (storefrontIdentifier && self->_hasUpdatedCapabilities)
  {
    if ([(NSString *)storefrontIdentifier isEqualToString:v4])
    {
      if (self->_capabilities) {
        unint64_t v6 = 1;
      }
      else {
        unint64_t v6 = 2;
      }
    }
    else
    {
      unint64_t v6 = 4;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

+ (unint64_t)_convertCapabilities:(unint64_t)a3
{
  return a3 & 1;
}

- (void)_setCapabilities:(unint64_t)a3
{
  self->_hasUpdatedCapabilities = 1;
  unint64_t v4 = [(id)objc_opt_class() _convertCapabilities:a3];
  if (self->_capabilities != v4)
  {
    self->_capabilities = v4;
    [(LPiTunesStoreInformation *)self _notifyChangeHandlers];
  }
}

- (NSString)storefrontIdentifier
{
  return self->_storefrontIdentifier;
}

+ (id)_convertNewStorefrontIdentifier:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] >= 6)
  {
    unint64_t v4 = [v3 substringToIndex:6];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)_setStorefrontIdentifier:(id)a3
{
  id v5 = a3;
  unint64_t v4 = [(id)objc_opt_class() _convertNewStorefrontIdentifier:v5];
  if (![(NSString *)self->_storefrontIdentifier isEqualToString:v4])
  {
    objc_storeStrong((id *)&self->_storefrontIdentifier, v4);
    [(LPiTunesStoreInformation *)self _notifyChangeHandlers];
  }
}

- (void)_capabilitiesDidChangeNotification
{
  id v3 = cloudServiceControllerQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__LPiTunesStoreInformation__capabilitiesDidChangeNotification__block_invoke;
  block[3] = &unk_1E5B04DF0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __62__LPiTunesStoreInformation__capabilitiesDidChangeNotification__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__LPiTunesStoreInformation__capabilitiesDidChangeNotification__block_invoke_2;
  v4[3] = &unk_1E5B058E8;
  v4[4] = v1;
  return [v2 requestCapabilitiesWithCompletionHandler:v4];
}

void __62__LPiTunesStoreInformation__capabilitiesDidChangeNotification__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    v5[6] = v3;
    v5[7] = v4;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62__LPiTunesStoreInformation__capabilitiesDidChangeNotification__block_invoke_3;
    v5[3] = &unk_1E5B058C0;
    v5[4] = *(void *)(a1 + 32);
    void v5[5] = a2;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __62__LPiTunesStoreInformation__capabilitiesDidChangeNotification__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setCapabilities:*(void *)(a1 + 40)];
}

- (void)_storefrontDidChangeNotification
{
  uint64_t v3 = cloudServiceControllerQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__LPiTunesStoreInformation__storefrontDidChangeNotification__block_invoke;
  block[3] = &unk_1E5B04DF0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __60__LPiTunesStoreInformation__storefrontDidChangeNotification__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__LPiTunesStoreInformation__storefrontDidChangeNotification__block_invoke_2;
  v4[3] = &unk_1E5B05898;
  v4[4] = v1;
  return [v2 requestStorefrontIdentifierWithCompletionHandler:v4];
}

void __60__LPiTunesStoreInformation__storefrontDidChangeNotification__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__LPiTunesStoreInformation__storefrontDidChangeNotification__block_invoke_3;
  v5[3] = &unk_1E5B04E18;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __60__LPiTunesStoreInformation__storefrontDidChangeNotification__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setStorefrontIdentifier:*(void *)(a1 + 40)];
}

- (void)_notifyChangeHandlers
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = [(NSMapTable *)self->_changeHandlers objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5++) + 16))();
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)registerForStoreAvailablityChangesWithToken:(id)a3 handler:(id)a4
{
  changeHandlers = self->_changeHandlers;
  id v6 = a3;
  id v7 = _Block_copy(a4);
  -[NSMapTable setObject:forKey:](changeHandlers, "setObject:forKey:");
}

- (void)unregisterForStoreAvailablityChangesWithToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_changeHandlers, 0);

  objc_storeStrong((id *)&self->_cloudServiceController, 0);
}

@end