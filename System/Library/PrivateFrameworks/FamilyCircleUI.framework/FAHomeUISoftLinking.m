@interface FAHomeUISoftLinking
+ (id)getHomeImage;
+ (id)getURLScheme;
+ (uint64_t)getURLScheme;
- (FAHomeUISoftLinking)initWithHome:(id)a3 notificationName:(id)a4;
- (id)getPeopleAddController;
- (void)addPeopleViewController:(id)a3 didSendInvitations:(id)a4;
- (void)addPeopleViewControllerDidCancel:(id)a3;
@end

@implementation FAHomeUISoftLinking

- (FAHomeUISoftLinking)initWithHome:(id)a3 notificationName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FAHomeUISoftLinking;
  v8 = [(FAHomeUISoftLinking *)&v14 init];
  if (v8)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v9 = (void *)getHUAddPeopleViewControllerClass_softClass;
    uint64_t v19 = getHUAddPeopleViewControllerClass_softClass;
    if (!getHUAddPeopleViewControllerClass_softClass)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __getHUAddPeopleViewControllerClass_block_invoke;
      v15[3] = &unk_264348998;
      v15[4] = &v16;
      __getHUAddPeopleViewControllerClass_block_invoke((uint64_t)v15);
      v9 = (void *)v17[3];
    }
    v10 = v9;
    _Block_object_dispose(&v16, 8);
    uint64_t v11 = [[v10 alloc] initWithHome:v6];
    addPeopleController = v8->_addPeopleController;
    v8->_addPeopleController = (HUAddPeopleViewController *)v11;

    [(HUAddPeopleViewController *)v8->_addPeopleController setDelegate:v8];
    objc_storeStrong((id *)&v8->_homeReloadSignal, a4);
  }

  return v8;
}

- (id)getPeopleAddController
{
  return self->_addPeopleController;
}

+ (id)getURLScheme
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v2 = (void **)getHFHomeURLSchemeSymbolLoc_ptr;
  uint64_t v10 = getHFHomeURLSchemeSymbolLoc_ptr;
  if (!getHFHomeURLSchemeSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getHFHomeURLSchemeSymbolLoc_block_invoke;
    v6[3] = &unk_264348998;
    v6[4] = &v7;
    __getHFHomeURLSchemeSymbolLoc_block_invoke((uint64_t)v6);
    v2 = (void **)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    v5 = (_Unwind_Exception *)+[FAHomeUISoftLinking getURLScheme]();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v5);
  }
  v3 = *v2;
  return v3;
}

+ (id)getHomeImage
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v2 = (void (*)(__CFString *))getHUImageNamedSymbolLoc_ptr;
  uint64_t v10 = getHUImageNamedSymbolLoc_ptr;
  if (!getHUImageNamedSymbolLoc_ptr)
  {
    v3 = (void *)HomeUILibrary();
    v8[3] = (uint64_t)dlsym(v3, "HUImageNamed");
    getHUImageNamedSymbolLoc_ptr = (_UNKNOWN *)v8[3];
    v2 = (void (*)(__CFString *))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    id v6 = (_Unwind_Exception *)+[FAHomeUISoftLinking getURLScheme]();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  v4 = v2(@"home");
  return v4;
}

- (void)addPeopleViewControllerDidCancel:(id)a3
{
}

- (void)addPeopleViewController:(id)a3 didSendInvitations:(id)a4
{
  [a3 dismissViewControllerAnimated:1 completion:&__block_literal_global_27];
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:self->_homeReloadSignal object:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeReloadSignal, 0);
  objc_storeStrong((id *)&self->_addPeopleController, 0);
}

+ (uint64_t)getURLScheme
{
  return __getHUAddPeopleViewControllerClass_block_invoke_cold_1();
}

@end