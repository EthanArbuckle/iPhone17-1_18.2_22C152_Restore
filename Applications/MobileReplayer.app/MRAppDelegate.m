@interface MRAppDelegate
- (BOOL)shouldCreateViewController;
- (void)_closeInterposeDylib;
- (void)dealloc;
- (void)startupAndCreateViewController:(BOOL)a3;
@end

@implementation MRAppDelegate

- (void)dealloc
{
  [(MRAppDelegate *)self _closeInterposeDylib];
  v3.receiver = self;
  v3.super_class = (Class)MRAppDelegate;
  [(MRAppDelegate *)&v3 dealloc];
}

- (void)_closeInterposeDylib
{
  interposeDylib = self->_interposeDylib;
  if (interposeDylib)
  {
    dlclose(interposeDylib);
    self->_interposeDylib = 0;
  }
}

- (void)startupAndCreateViewController:(BOOL)a3
{
  self->_shouldCreateViewController = a3;
  v4 = +[NSProcessInfo processInfo];
  id v15 = [v4 environment];

  v5 = [v15 objectForKeyedSubscript:@"METAL_LOAD_INTERPOSER"];
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    v7 = (const char *)DYGetMTLInterposeDylibPath();
    uint64_t v8 = [v15 objectForKeyedSubscript:@"GT_HOST_URL_MTL"];
    v9 = "DYGetMTLGuestAppClient";
  }
  else
  {
    v7 = (const char *)DYGetGLInterposeDylibPath();
    uint64_t v8 = [v15 objectForKeyedSubscript:@"GT_HOST_URL_GL"];
    v9 = "DYGetGLGuestAppClient";
  }
  v10 = (void *)v8;
  if (!self->_interposeDylib)
  {
    v11 = dlopen(v7, 9);
    self->_interposeDylib = v11;
    if (!v11)
    {
      dlerror();
      dy_abort();
LABEL_19:
      __break(1u);
      return;
    }
  }
  if (!v10) {
    goto LABEL_18;
  }
  v12 = (void (*)(void))dlsym((void *)0xFFFFFFFFFFFFFFFELL, v9);
  if (!v12) {
    __assert_rtn("-[MRAppDelegate startupAndCreateViewController:]", (const char *)&unk_1000055D9, 0, "GetGuestClient != NULL");
  }
  v13 = v12();
  if (!v13) {
    __assert_rtn("-[MRAppDelegate startupAndCreateViewController:]", (const char *)&unk_1000055D9, 0, "appClient != nil");
  }
  v14 = +[MRReplayController sharedController];
  if (([v14 initializeTransportWith:v13] & 1) == 0
    || ([v14 setDelegate:self], (objc_msgSend(v14, "informReady") & 1) == 0))
  {
LABEL_18:
    dy_abort();
    goto LABEL_19;
  }
}

- (BOOL)shouldCreateViewController
{
  return self->_shouldCreateViewController;
}

@end