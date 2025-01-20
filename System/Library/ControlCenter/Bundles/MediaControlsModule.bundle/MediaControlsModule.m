void sub_2406914A8(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t vars8;

  v6 = a2;
  objc_msgSend_dismissModule(*(void **)(a1 + 32), v3, v4);
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }
}

uint64_t sub_240691508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_requestExpandModule, a3);
}

uint64_t sub_240691510(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_setHomeGestureDismissalAllowed_, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

ewController *v12;
  MRUMediaControlsModuleRootViewController *v13;
  id v14;
  const char *v15;
  MRUMediaControlsModuleRootViewController *v16;
  id v17;
  const char *v18;
  MRUMediaControlsModuleRootViewController *v19;
  id v20;
  const char *v21;
  void v23[4];
  id v24;
  void v25[4];
  id v26;
  void v27[4];
  id v28;
  uint64_t vars8;

  contentViewController = self->_contentViewController;
  if (!contentViewController)
  {
    v5 = objc_msgSend_contentModuleContext(self, a2, v2);
    v6 = objc_alloc(MEMORY[0x263F54148]);
    v9 = objc_msgSend_sharedManager(MEMORY[0x263F54158], v7, v8);
    v11 = (MRUMediaControlsModuleRootViewController *)objc_msgSend_initWithManager_(v6, v10, (uint64_t)v9);
    v12 = self->_contentViewController;
    self->_contentViewController = v11;

    v13 = self->_contentViewController;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = sub_2406914A8;
    v27[3] = &unk_2650CE1A0;
    v14 = v5;
    v28 = v14;
    objc_msgSend_setDismissalBlock_(v13, v15, (uint64_t)v27);
    v16 = self->_contentViewController;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = sub_240691508;
    v25[3] = &unk_2650CE1C8;
    v17 = v14;
    v26 = v17;
    objc_msgSend_setRoutingCornerViewTappedBlock_(v16, v18, (uint64_t)v25);
    v19 = self->_contentViewController;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = sub_240691510;
    v23[3] = &unk_2650CE1F0;
    v24 = v17;
    v20 = v17;
    objc_msgSend_setHomeGestureDismissalAllowedBlock_(v19, v21, (uint64_t)v23);

    contentViewController = self->_contentViewController;
  }

  return contentViewController;
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
}

- (void)setContentViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);

  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end