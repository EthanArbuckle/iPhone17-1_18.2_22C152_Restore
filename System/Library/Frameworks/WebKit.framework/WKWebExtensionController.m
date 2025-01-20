@interface WKWebExtensionController
+ (NSSet)allExtensionDataTypes;
+ (void)initialize;
- (BOOL)_inTestingMode;
- (BOOL)loadExtensionContext:(id)a3 error:(id *)a4;
- (BOOL)unloadExtensionContext:(id)a3 error:(id *)a4;
- (NSSet)extensionContexts;
- (NSSet)extensions;
- (Object)_apiObject;
- (WKWebExtensionController)init;
- (WKWebExtensionController)initWithConfiguration:(id)a3;
- (WKWebExtensionControllerConfiguration)configuration;
- (WKWebExtensionControllerDelegate)delegate;
- (id)extensionContextForExtension:(id)a3;
- (id)extensionContextForURL:(id)a3;
- (uint64_t)fetchDataRecordOfTypes:(id *)a1 forExtensionContext:completionHandler:;
- (uint64_t)fetchDataRecordOfTypes:(uint64_t)a1 forExtensionContext:completionHandler:;
- (uint64_t)fetchDataRecordsOfTypes:(id *)a1 completionHandler:;
- (uint64_t)fetchDataRecordsOfTypes:(uint64_t)a1 completionHandler:;
- (uint64_t)fetchDataRecordsOfTypes:(uint64_t)a1 completionHandler:(void *)a2;
- (uint64_t)removeDataOfTypes:(id *)a1 fromDataRecords:completionHandler:;
- (uint64_t)removeDataOfTypes:(uint64_t)a1 fromDataRecords:completionHandler:;
- (void)_objc_initiateDealloc;
- (void)_setTestingMode:(BOOL)a3;
- (void)_webExtensionController;
- (void)dealloc;
- (void)didActivateTab:(id)a3 previousActiveTab:(id)a4;
- (void)didChangeTabProperties:(unint64_t)a3 forTab:(id)a4;
- (void)didCloseTab:(id)a3 windowIsClosing:(BOOL)a4;
- (void)didCloseWindow:(id)a3;
- (void)didDeselectTabs:(id)a3;
- (void)didFocusWindow:(id)a3;
- (void)didMoveTab:(id)a3 fromIndex:(unint64_t)a4 inWindow:(id)a5;
- (void)didOpenTab:(id)a3;
- (void)didOpenWindow:(id)a3;
- (void)didReplaceTab:(id)a3 withTab:(id)a4;
- (void)didSelectTabs:(id)a3;
- (void)fetchDataRecordOfTypes:(id)a3 forExtensionContext:(id)a4 completionHandler:(id)a5;
- (void)fetchDataRecordOfTypes:(uint64_t)a1 forExtensionContext:(uint64_t *)a2 completionHandler:;
- (void)fetchDataRecordsOfTypes:(id)a3 completionHandler:(id)a4;
- (void)removeDataOfTypes:(id)a3 fromDataRecords:(id)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation WKWebExtensionController

- (void)setDelegate:(id)a3
{
}

- (WKWebExtensionController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 63, @"Invalid parameter not satisfying: %@", @"[configuration isKindOfClass:WKWebExtensionControllerConfiguration.class]" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)WKWebExtensionController;
  v6 = [(WKWebExtensionController *)&v11 init];
  if (v6)
  {
    WebKit::WebExtensionControllerConfiguration::copy((WebKit::WebExtensionControllerConfiguration *)[v5 _webExtensionControllerConfiguration], &v10);
    API::Object::constructInWrapper<WebKit::WebExtensionController,WTF::Ref<WebKit::WebExtensionControllerConfiguration,WTF::RawPtrTraits<WebKit::WebExtensionControllerConfiguration>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionControllerConfiguration>>>(v6, &v10);
    if (v10) {
      CFRelease(*(CFTypeRef *)(v10 + 8));
    }
    v7 = v6;
  }

  return v6;
}

- (Object)_apiObject
{
  return (Object *)&self->_webExtensionController;
}

- (void)_webExtensionController
{
  return &self->_webExtensionController;
}

- (void)_setTestingMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  self->_anon_38[128] = self->_anon_38[128] & 0xFD | v3;
}

- (void)didChangeTabProperties:(unint64_t)a3 forTab:(id)a4
{
  id v15 = a4;
  if (([v15 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 262, @"Invalid parameter not satisfying: %@", @"[changedTab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
  }
  v7 = &self->_anon_38[8];
  v8 = (id **)WTF::HashTable<void const*,void const*,WTF::IdentityExtractor,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<void const*>>::begin((void **)&self->_anon_38[8]);
  v9 = v8;
  objc_super v11 = v10;
  if (*(void *)v7) {
    uint64_t v12 = *(void *)v7 + 8 * *(unsigned int *)(*(void *)v7 - 4);
  }
  else {
    uint64_t v12 = 0;
  }
  if ((id **)v12 != v8)
  {
    do
    {
      v13 = WebKit::WebExtensionAction::wrapper(*v9);
      [v13 didChangeTabProperties:a3 forTab:v15];

      while (++v9 != v11)
      {
        if ((unint64_t)*v9 + 1 > 1) {
          goto LABEL_12;
        }
      }
      v9 = v11;
LABEL_12:
      ;
    }
    while (v9 != (id **)v12);
  }
}

- (void)didFocusWindow:(id)a3
{
  id v13 = a3;
  if (v13 && ([v13 conformsToProtocol:&unk_1EEA97770] & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 193, @"Invalid parameter not satisfying: %@", @"[focusedWindow conformsToProtocol:@protocol(WKWebExtensionWindow)]" object file lineNumber description];
  }
  id v5 = &self->_anon_38[8];
  v6 = (id **)WTF::HashTable<void const*,void const*,WTF::IdentityExtractor,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<void const*>>::begin((void **)&self->_anon_38[8]);
  v7 = v6;
  v9 = v8;
  if (*(void *)v5) {
    uint64_t v10 = *(void *)v5 + 8 * *(unsigned int *)(*(void *)v5 - 4);
  }
  else {
    uint64_t v10 = 0;
  }
  if ((id **)v10 != v6)
  {
    do
    {
      objc_super v11 = WebKit::WebExtensionAction::wrapper(*v7);
      [v11 didFocusWindow:v13];

      while (++v7 != v9)
      {
        if ((unint64_t)*v7 + 1 > 1) {
          goto LABEL_13;
        }
      }
      v7 = v9;
LABEL_13:
      ;
    }
    while (v7 != (id **)v10);
  }
}

- (void)didOpenWindow:(id)a3
{
  id v13 = a3;
  if (([v13 conformsToProtocol:&unk_1EEA97770] & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 176, @"Invalid parameter not satisfying: %@", @"[newWindow conformsToProtocol:@protocol(WKWebExtensionWindow)]" object file lineNumber description];
  }
  id v5 = &self->_anon_38[8];
  v6 = (id **)WTF::HashTable<void const*,void const*,WTF::IdentityExtractor,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<void const*>>::begin((void **)&self->_anon_38[8]);
  v7 = v6;
  v9 = v8;
  if (*(void *)v5) {
    uint64_t v10 = *(void *)v5 + 8 * *(unsigned int *)(*(void *)v5 - 4);
  }
  else {
    uint64_t v10 = 0;
  }
  if ((id **)v10 != v6)
  {
    do
    {
      objc_super v11 = WebKit::WebExtensionAction::wrapper(*v7);
      [v11 didOpenWindow:v13];

      while (++v7 != v9)
      {
        if ((unint64_t)*v7 + 1 > 1) {
          goto LABEL_12;
        }
      }
      v7 = v9;
LABEL_12:
      ;
    }
    while (v7 != (id **)v10);
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    MEMORY[0x1F41813B0](a1);
  }
}

- (void)_objc_initiateDealloc
{
  if (WTF::isMainRunLoop((WTF *)self))
  {
    MEMORY[0x1F4181400](self);
  }
  else
  {
    char v3 = MEMORY[0x1E4F14428];
    v4 = (void (__cdecl *)(void *))MEMORY[0x1E4FBA8B8];
    dispatch_async_f(v3, self, v4);
  }
}

- (void)dealloc
{
  (**(void (***)(void))self->_webExtensionController.data.__lx)();
  v3.receiver = self;
  v3.super_class = (Class)WKWebExtensionController;
  [(WKWebExtensionController *)&v3 dealloc];
}

- (WKWebExtensionController)init
{
  v7.receiver = self;
  v7.super_class = (Class)WKWebExtensionController;
  v2 = [(WKWebExtensionController *)&v7 init];
  if (v2)
  {
    uint64_t v3 = API::Object::newObject(0x40uLL, 115);
    uint64_t v6 = WebKit::WebExtensionControllerConfiguration::WebExtensionControllerConfiguration(v3, 1);
    API::Object::constructInWrapper<WebKit::WebExtensionController,WTF::Ref<WebKit::WebExtensionControllerConfiguration,WTF::RawPtrTraits<WebKit::WebExtensionControllerConfiguration>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionControllerConfiguration>>>(v2, &v6);
    if (v6) {
      CFRelease(*(CFTypeRef *)(v6 + 8));
    }
    v4 = v2;
  }

  return v2;
}

- (WKWebExtensionControllerConfiguration)configuration
{
  WebKit::WebExtensionControllerConfiguration::copy(*(WebKit::WebExtensionControllerConfiguration **)&self->_webExtensionController.data.__lx[40], (uint64_t *)&v5);
  v2 = v5;
  uint64_t v3 = WebKit::WebExtensionAction::wrapper((id *)v5);
  if (v2) {
    CFRelease(*((CFTypeRef *)v2 + 1));
  }

  return (WKWebExtensionControllerConfiguration *)v3;
}

- (BOOL)loadExtensionContext:(id)a3 error:(id *)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 80, @"Invalid parameter not satisfying: %@", @"[extensionContext isKindOfClass:WKWebExtensionContext.class]" object file lineNumber description];
  }
  char v8 = WebKit::WebExtensionController::load((uint64_t)&self->_webExtensionController, [v7 _webExtensionContext], a4);

  return v8;
}

- (BOOL)unloadExtensionContext:(id)a3 error:(id *)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 87, @"Invalid parameter not satisfying: %@", @"[extensionContext isKindOfClass:WKWebExtensionContext.class]" object file lineNumber description];
  }
  char v8 = WebKit::WebExtensionController::unload(self->_webExtensionController.data.__lx, [v7 _webExtensionContext], a4);

  return v8;
}

- (id)extensionContextForExtension:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 94, @"Invalid parameter not satisfying: %@", @"[extension isKindOfClass:WKWebExtension.class]" object file lineNumber description];
  }
  WebKit::WebExtensionController::extensionContext((uint64_t)&self->_webExtensionController, [v5 _webExtension], &v10);
  uint64_t v6 = v10;
  if (v10)
  {
    id v7 = WebKit::WebExtensionAction::wrapper((id *)v10);
    CFRelease(*((CFTypeRef *)v6 + 1));
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)extensionContextForURL:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 103, @"Invalid parameter not satisfying: %@", @"[url isKindOfClass:NSURL.class]" object file lineNumber description];
  }
  MEMORY[0x19972E8A0](v12, v5);
  WebKit::WebExtensionController::extensionContext((WebKit::WebExtensionController *)&self->_webExtensionController, (const WTF::URL *)v12, (WTF **)&v13);
  id v7 = v12[0];
  v12[0] = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v6);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  char v8 = v13;
  if (v13)
  {
    v9 = WebKit::WebExtensionAction::wrapper(v13);
    CFRelease(v8[1]);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSSet)extensions
{
  WebKit::WebExtensionController::extensions((WebKit::WebExtensionController *)&self->_webExtensionController, (uint64_t *)&v15);
  if (!v15 || !*((_DWORD *)v15 - 3))
  {
    id v5 = [MEMORY[0x1E4F1CAD0] set];
    goto LABEL_27;
  }
  id v2 = objc_alloc(MEMORY[0x1E4F1CA80]);
  if (v15) {
    uint64_t v3 = *((unsigned int *)v15 - 3);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v6 = (void *)[v2 initWithCapacity:v3];
  if (v15)
  {
    uint64_t v7 = *((unsigned int *)v15 - 1);
    char v8 = &v15[v7];
    if (*((_DWORD *)v15 - 3))
    {
      v9 = v15;
      if (v7)
      {
        uint64_t v10 = 8 * v7;
        v9 = v15;
        while ((unint64_t)(*v9 + 1) <= 1)
        {
          ++v9;
          v10 -= 8;
          if (!v10)
          {
            v9 = v8;
            goto LABEL_14;
          }
        }
      }
      goto LABEL_14;
    }
    v9 = &v15[v7];
  }
  else
  {
    v9 = 0;
    uint64_t v7 = 0;
  }
  char v8 = &v15[v7];
  if (!v15)
  {
    objc_super v11 = 0;
    goto LABEL_19;
  }
LABEL_14:
  objc_super v11 = &v15[*((unsigned int *)v15 - 1)];
LABEL_19:
  while (v9 != v11)
  {
    uint64_t v12 = WebKit::WebExtensionAction::wrapper((id *)*v9);
    [v6 addObject:v12];

    id v13 = v9 + 1;
    v9 = v8;
    if (v13 != v8)
    {
      v9 = v13;
      while ((unint64_t)(*v9 + 1) <= 1)
      {
        if (++v9 == v8)
        {
          v9 = v8;
          break;
        }
      }
    }
  }
  id v5 = (void *)[v6 copy];

LABEL_27:
  if (v15) {
    WTF::HashTable<WTF::RefPtr<WebKit::WebPageProxy const,WTF::RawPtrTraits<WebKit::WebPageProxy const>,WTF::DefaultRefDerefTraits<WebKit::WebPageProxy const>>,WTF::RefPtr<WebKit::WebPageProxy const,WTF::RawPtrTraits<WebKit::WebPageProxy const>,WTF::DefaultRefDerefTraits<WebKit::WebPageProxy const>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::RefPtr<WebKit::WebPageProxy const,WTF::RawPtrTraits<WebKit::WebPageProxy const>,WTF::DefaultRefDerefTraits<WebKit::WebPageProxy const>>>,WTF::HashTraits<WTF::RefPtr<WebKit::WebPageProxy const,WTF::RawPtrTraits<WebKit::WebPageProxy const>,WTF::DefaultRefDerefTraits<WebKit::WebPageProxy const>>>,WTF::HashTraits<WTF::RefPtr<WebKit::WebPageProxy const,WTF::RawPtrTraits<WebKit::WebPageProxy const>,WTF::DefaultRefDerefTraits<WebKit::WebPageProxy const>>>>::deallocateTable(v15, v4);
  }

  return (NSSet *)v5;
}

- (NSSet)extensionContexts
{
  uint64_t v3 = &self->_anon_38[8];
  uint64_t v2 = *(void *)&self->_anon_38[8];
  if (v2 && *(_DWORD *)(v2 - 12))
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA80]);
    if (*(void *)v3) {
      uint64_t v5 = *(unsigned int *)(*(void *)v3 - 12);
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v7 = (void *)[v4 initWithCapacity:v5];
    char v8 = (id **)WTF::HashTable<void const*,void const*,WTF::IdentityExtractor,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<void const*>>::begin((void **)v3);
    v9 = v8;
    objc_super v11 = v10;
    if (*(void *)v3) {
      uint64_t v12 = *(void *)v3 + 8 * *(unsigned int *)(*(void *)v3 - 4);
    }
    else {
      uint64_t v12 = 0;
    }
    if ((id **)v12 != v8)
    {
      do
      {
        id v13 = WebKit::WebExtensionAction::wrapper(*v9);
        [v7 addObject:v13];

        while (++v9 != v11)
        {
          if ((unint64_t)*v9 + 1 > 1) {
            goto LABEL_16;
          }
        }
        v9 = v11;
LABEL_16:
        ;
      }
      while (v9 != (id **)v12);
    }
    uint64_t v6 = (void *)[v7 copy];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] set];
  }

  return (NSSet *)v6;
}

+ (NSSet)allExtensionDataTypes
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"local", @"session", @"synchronized", 0);
}

- (void)fetchDataRecordsOfTypes:(id)a3 completionHandler:(id)a4
{
  uint64_t v7 = (WebKit *)a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 141, @"Invalid parameter not satisfying: %@", @"[dataTypes isKindOfClass:NSSet.class]" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 142, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  unsigned __int8 v10 = WebKit::toWebExtensionDataTypes(v7, v9);
  objc_super v11 = _Block_copy(v8);
  uint64_t v12 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v12 = &unk_1EEA0F800;
  v12[1] = v11;
  v16 = v12;
  WebKit::WebExtensionController::getDataRecords((WebKit::WebExtensionController *)&self->_webExtensionController, v10, (uint64_t *)&v16);
  uint64_t v13 = (uint64_t)v16;
  v16 = 0;
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
  }
}

- (void)fetchDataRecordOfTypes:(id)a3 forExtensionContext:(id)a4 completionHandler:(id)a5
{
  v9 = (WebKit *)a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 151, @"Invalid parameter not satisfying: %@", @"[dataTypes isKindOfClass:NSSet.class]" object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v11) {
      goto LABEL_5;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 152, @"Invalid parameter not satisfying: %@", @"[extensionContext isKindOfClass:WKWebExtensionContext.class]" object file lineNumber description];

    if (v11) {
      goto LABEL_5;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 153, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_5:
  unsigned __int8 v13 = WebKit::toWebExtensionDataTypes(v9, v12);
  uint64_t v14 = [v10 _webExtensionContext];
  id v15 = _Block_copy(v11);
  v16 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v16 = &unk_1EEA0F828;
  v16[1] = v15;
  v21 = v16;
  WebKit::WebExtensionController::getDataRecord((WebKit::WebExtensionController *)&self->_webExtensionController, (const WTF::String *)v13, v14, (uint64_t *)&v21);
  uint64_t v17 = (uint64_t)v21;
  v21 = 0;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
  }
}

- (void)removeDataOfTypes:(id)a3 fromDataRecords:(id)a4 completionHandler:(id)a5
{
  v9 = (WebKit *)a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 165, @"Invalid parameter not satisfying: %@", @"[dataTypes isKindOfClass:NSSet.class]" object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v11) {
      goto LABEL_5;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 166, @"Invalid parameter not satisfying: %@", @"[dataRecords isKindOfClass:NSArray.class]" object file lineNumber description];

    if (v11) {
      goto LABEL_5;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 167, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_5:
  unsigned __int8 v13 = WebKit::toWebExtensionDataTypes(v9, v12);
  WTF::makeVector<WTF::Ref<WebKit::WebExtensionDataRecord,WTF::RawPtrTraits<WebKit::WebExtensionDataRecord>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionDataRecord>>>(v10, (uint64_t)v22);
  uint64_t v14 = _Block_copy(v11);
  id v15 = (void *)WTF::fastMalloc((WTF *)0x10);
  *id v15 = &unk_1EEA0F850;
  v15[1] = v14;
  v21 = v15;
  WebKit::WebExtensionController::removeData((WebKit::WebExtensionController *)&self->_webExtensionController, v13, (uint64_t)v22, (uint64_t *)&v21);
  uint64_t v17 = (uint64_t)v21;
  v21 = 0;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
  }
  WTF::Vector<WTF::Ref<WebKit::WebPageProxy,WTF::RawPtrTraits<WebKit::WebPageProxy>,WTF::DefaultRefDerefTraits<WebKit::WebPageProxy>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v22, v16);
}

- (void)didCloseWindow:(id)a3
{
  id v13 = a3;
  if (([v13 conformsToProtocol:&unk_1EEA97770] & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 184, @"Invalid parameter not satisfying: %@", @"[closedWindow conformsToProtocol:@protocol(WKWebExtensionWindow)]" object file lineNumber description];
  }
  uint64_t v5 = &self->_anon_38[8];
  uint64_t v6 = (id **)WTF::HashTable<void const*,void const*,WTF::IdentityExtractor,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<void const*>>::begin((void **)&self->_anon_38[8]);
  uint64_t v7 = v6;
  v9 = v8;
  if (*(void *)v5) {
    uint64_t v10 = *(void *)v5 + 8 * *(unsigned int *)(*(void *)v5 - 4);
  }
  else {
    uint64_t v10 = 0;
  }
  if ((id **)v10 != v6)
  {
    do
    {
      id v11 = WebKit::WebExtensionAction::wrapper(*v7);
      [v11 didCloseWindow:v13];

      while (++v7 != v9)
      {
        if ((unint64_t)*v7 + 1 > 1) {
          goto LABEL_12;
        }
      }
      uint64_t v7 = v9;
LABEL_12:
      ;
    }
    while (v7 != (id **)v10);
  }
}

- (void)didOpenTab:(id)a3
{
  id v13 = a3;
  if (([v13 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 201, @"Invalid parameter not satisfying: %@", @"[newTab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
  }
  uint64_t v5 = &self->_anon_38[8];
  uint64_t v6 = (id **)WTF::HashTable<void const*,void const*,WTF::IdentityExtractor,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<void const*>>::begin((void **)&self->_anon_38[8]);
  uint64_t v7 = v6;
  v9 = v8;
  if (*(void *)v5) {
    uint64_t v10 = *(void *)v5 + 8 * *(unsigned int *)(*(void *)v5 - 4);
  }
  else {
    uint64_t v10 = 0;
  }
  if ((id **)v10 != v6)
  {
    do
    {
      id v11 = WebKit::WebExtensionAction::wrapper(*v7);
      [v11 didOpenTab:v13];

      while (++v7 != v9)
      {
        if ((unint64_t)*v7 + 1 > 1) {
          goto LABEL_12;
        }
      }
      uint64_t v7 = v9;
LABEL_12:
      ;
    }
    while (v7 != (id **)v10);
  }
}

- (void)didCloseTab:(id)a3 windowIsClosing:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  if (([v15 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 209, @"Invalid parameter not satisfying: %@", @"[closedTab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
  }
  uint64_t v7 = &self->_anon_38[8];
  id v8 = (id **)WTF::HashTable<void const*,void const*,WTF::IdentityExtractor,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<void const*>>::begin((void **)&self->_anon_38[8]);
  v9 = v8;
  id v11 = v10;
  if (*(void *)v7) {
    uint64_t v12 = *(void *)v7 + 8 * *(unsigned int *)(*(void *)v7 - 4);
  }
  else {
    uint64_t v12 = 0;
  }
  if ((id **)v12 != v8)
  {
    do
    {
      id v13 = WebKit::WebExtensionAction::wrapper(*v9);
      [v13 didCloseTab:v15 windowIsClosing:v4];

      while (++v9 != v11)
      {
        if ((unint64_t)*v9 + 1 > 1) {
          goto LABEL_12;
        }
      }
      v9 = v11;
LABEL_12:
      ;
    }
    while (v9 != (id **)v12);
  }
}

- (void)didActivateTab:(id)a3 previousActiveTab:(id)a4
{
  id v17 = a3;
  id v7 = a4;
  if ([v17 conformsToProtocol:&unk_1EEA97528])
  {
    if (!v7) {
      goto LABEL_5;
    }
  }
  else
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 217, @"Invalid parameter not satisfying: %@", @"[activatedTab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];

    if (!v7) {
      goto LABEL_5;
    }
  }
  if (([v7 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 219, @"Invalid parameter not satisfying: %@", @"[previousTab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
  }
LABEL_5:
  id v8 = &self->_anon_38[8];
  v9 = (id **)WTF::HashTable<void const*,void const*,WTF::IdentityExtractor,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<void const*>>::begin((void **)&self->_anon_38[8]);
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  if (*(void *)v8) {
    uint64_t v13 = *(void *)v8 + 8 * *(unsigned int *)(*(void *)v8 - 4);
  }
  else {
    uint64_t v13 = 0;
  }
  if ((id **)v13 != v9)
  {
    do
    {
      uint64_t v14 = WebKit::WebExtensionAction::wrapper(*v10);
      [v14 didActivateTab:v17 previousActiveTab:v7];

      while (++v10 != v12)
      {
        if ((unint64_t)*v10 + 1 > 1) {
          goto LABEL_14;
        }
      }
      uint64_t v10 = v12;
LABEL_14:
      ;
    }
    while (v10 != (id **)v13);
  }
}

- (void)didSelectTabs:(id)a3
{
  id v13 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 227, @"Invalid parameter not satisfying: %@", @"[selectedTabs isKindOfClass:NSSet.class]" object file lineNumber description];
  }
  uint64_t v5 = &self->_anon_38[8];
  uint64_t v6 = (id **)WTF::HashTable<void const*,void const*,WTF::IdentityExtractor,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<void const*>>::begin((void **)&self->_anon_38[8]);
  id v7 = v6;
  v9 = v8;
  if (*(void *)v5) {
    uint64_t v10 = *(void *)v5 + 8 * *(unsigned int *)(*(void *)v5 - 4);
  }
  else {
    uint64_t v10 = 0;
  }
  if ((id **)v10 != v6)
  {
    do
    {
      id v11 = WebKit::WebExtensionAction::wrapper(*v7);
      [v11 didSelectTabs:v13];

      while (++v7 != v9)
      {
        if ((unint64_t)*v7 + 1 > 1) {
          goto LABEL_12;
        }
      }
      id v7 = v9;
LABEL_12:
      ;
    }
    while (v7 != (id **)v10);
  }
}

- (void)didDeselectTabs:(id)a3
{
  id v13 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 235, @"Invalid parameter not satisfying: %@", @"[deselectedTabs isKindOfClass:NSSet.class]" object file lineNumber description];
  }
  uint64_t v5 = &self->_anon_38[8];
  uint64_t v6 = (id **)WTF::HashTable<void const*,void const*,WTF::IdentityExtractor,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<void const*>>::begin((void **)&self->_anon_38[8]);
  id v7 = v6;
  v9 = v8;
  if (*(void *)v5) {
    uint64_t v10 = *(void *)v5 + 8 * *(unsigned int *)(*(void *)v5 - 4);
  }
  else {
    uint64_t v10 = 0;
  }
  if ((id **)v10 != v6)
  {
    do
    {
      id v11 = WebKit::WebExtensionAction::wrapper(*v7);
      [v11 didDeselectTabs:v13];

      while (++v7 != v9)
      {
        if ((unint64_t)*v7 + 1 > 1) {
          goto LABEL_12;
        }
      }
      id v7 = v9;
LABEL_12:
      ;
    }
    while (v7 != (id **)v10);
  }
}

- (void)didMoveTab:(id)a3 fromIndex:(unint64_t)a4 inWindow:(id)a5
{
  id v19 = a3;
  id v9 = a5;
  if ([v19 conformsToProtocol:&unk_1EEA97528])
  {
    if (!v9) {
      goto LABEL_5;
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 243, @"Invalid parameter not satisfying: %@", @"[movedTab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];

    if (!v9) {
      goto LABEL_5;
    }
  }
  if (([v9 conformsToProtocol:&unk_1EEA97770] & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 245, @"Invalid parameter not satisfying: %@", @"[oldWindow conformsToProtocol:@protocol(WKWebExtensionWindow)]" object file lineNumber description];
  }
LABEL_5:
  uint64_t v10 = &self->_anon_38[8];
  id v11 = (id **)WTF::HashTable<void const*,void const*,WTF::IdentityExtractor,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<void const*>>::begin((void **)&self->_anon_38[8]);
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  if (*(void *)v10) {
    uint64_t v15 = *(void *)v10 + 8 * *(unsigned int *)(*(void *)v10 - 4);
  }
  else {
    uint64_t v15 = 0;
  }
  if ((id **)v15 != v11)
  {
    do
    {
      v16 = WebKit::WebExtensionAction::wrapper(*v12);
      [v16 didMoveTab:v19 fromIndex:a4 inWindow:v9];

      while (++v12 != v14)
      {
        if ((unint64_t)*v12 + 1 > 1) {
          goto LABEL_14;
        }
      }
      uint64_t v12 = v14;
LABEL_14:
      ;
    }
    while (v12 != (id **)v15);
  }
}

- (void)didReplaceTab:(id)a3 withTab:(id)a4
{
  id v17 = a3;
  id v7 = a4;
  if (([v17 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 253, @"Invalid parameter not satisfying: %@", @"[oldTab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
  }
  if (([v7 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WKWebExtensionController.mm", 254, @"Invalid parameter not satisfying: %@", @"[newTab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
  }
  id v8 = &self->_anon_38[8];
  id v9 = (id **)WTF::HashTable<void const*,void const*,WTF::IdentityExtractor,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<void const*>>::begin((void **)&self->_anon_38[8]);
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  if (*(void *)v8) {
    uint64_t v13 = *(void *)v8 + 8 * *(unsigned int *)(*(void *)v8 - 4);
  }
  else {
    uint64_t v13 = 0;
  }
  if ((id **)v13 != v9)
  {
    do
    {
      uint64_t v14 = WebKit::WebExtensionAction::wrapper(*v10);
      [v14 didReplaceTab:v17 withTab:v7];

      while (++v10 != v12)
      {
        if ((unint64_t)*v10 + 1 > 1) {
          goto LABEL_14;
        }
      }
      uint64_t v10 = v12;
LABEL_14:
      ;
    }
    while (v10 != (id **)v13);
  }
}

- (BOOL)_inTestingMode
{
  return (self->_anon_38[128] >> 1) & 1;
}

- (WKWebExtensionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WKWebExtensionControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

- (uint64_t)fetchDataRecordsOfTypes:(uint64_t)a1 completionHandler:
{
  return a1;
}

- (uint64_t)fetchDataRecordsOfTypes:(id *)a1 completionHandler:
{
  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)fetchDataRecordsOfTypes:(uint64_t)a1 completionHandler:(void *)a2
{
  v7[0] = *a2;
  uint64_t v3 = a2[1];
  *a2 = 0;
  a2[1] = 0;
  v7[1] = v3;
  BOOL v4 = WebKit::toAPI((uint64_t)v7);
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();

  return WTF::Vector<WTF::Ref<WebKit::WebPageProxy,WTF::RawPtrTraits<WebKit::WebPageProxy>,WTF::DefaultRefDerefTraits<WebKit::WebPageProxy>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v7, v5);
}

- (uint64_t)fetchDataRecordOfTypes:(uint64_t)a1 forExtensionContext:completionHandler:
{
  return a1;
}

- (uint64_t)fetchDataRecordOfTypes:(id *)a1 forExtensionContext:completionHandler:
{
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)fetchDataRecordOfTypes:(uint64_t)a1 forExtensionContext:(uint64_t *)a2 completionHandler:
{
  uint64_t v3 = *a2;
  *a2 = 0;
  if (v3)
  {
    BOOL v4 = WebKit::WebExtensionAction::wrapper((id *)v3);
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();

    uint64_t v5 = *(const void **)(v3 + 8);
    CFRelease(v5);
  }
  else
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 8) + 16);
    v6();
  }
}

- (uint64_t)removeDataOfTypes:(uint64_t)a1 fromDataRecords:completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)removeDataOfTypes:(id *)a1 fromDataRecords:completionHandler:
{
  return WTF::fastFree((WTF *)a1, v2);
}

@end