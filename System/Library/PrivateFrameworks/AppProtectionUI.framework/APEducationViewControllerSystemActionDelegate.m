@interface APEducationViewControllerSystemActionDelegate
- (APEducationViewControllerSystemActionDelegate)init;
- (APEducationViewControllerSystemActionDelegateDismissalDelegate)delegate;
- (void)educationViewController:(id)a3 requestAuthenticationWithCompletion:(id)a4;
- (void)educationViewController:(id)a3 requestHideOfApplication:(id)a4 completion:(id)a5;
- (void)educationViewController:(id)a3 requestLockOfApplication:(id)a4 completion:(id)a5;
- (void)educationViewControllerRequestsDismissal:(id)a3 withResult:(int64_t)a4;
- (void)setDelegate:(id)a3;
@end

@implementation APEducationViewControllerSystemActionDelegate

- (APEducationViewControllerSystemActionDelegateDismissalDelegate)delegate
{
  v2 = (void *)MEMORY[0x24C56D1C0]((char *)self + OBJC_IVAR___APEducationViewControllerSystemActionDelegate_delegate, a2);

  return (APEducationViewControllerSystemActionDelegateDismissalDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (void)educationViewController:(id)a3 requestAuthenticationWithCompletion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = self;
  id v9 = a3;
  v10 = self;
  id v11 = objc_msgSend(v8, sel_sharedGuard);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_247E0D048;
  *(void *)(v12 + 24) = v7;
  v14[4] = sub_247E0CF68;
  v14[5] = v12;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = sub_247E120C4;
  v14[3] = &block_descriptor_43;
  v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_authenticateUnconditionallyWithCompletion_, v13);
  _Block_release(v13);

  swift_release();
}

- (void)educationViewController:(id)a3 requestLockOfApplication:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  v10 = self;
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  id v14 = objc_msgSend(v10, sel_sharedManager);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_247E0D048;
  *(void *)(v15 + 24) = v9;
  v17[4] = sub_247E0CF24;
  v17[5] = v15;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 1107296256;
  v17[2] = sub_247E120C4;
  v17[3] = &block_descriptor_27;
  v16 = _Block_copy(v17);
  swift_retain();
  swift_release();
  objc_msgSend(v14, sel_setSubject_isLocked_completion_, v12, 1, v16);
  _Block_release(v16);

  swift_release();
}

- (void)educationViewController:(id)a3 requestHideOfApplication:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  v10 = self;
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  id v14 = objc_msgSend(v10, sel_sharedManager);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_247E0CCE8;
  *(void *)(v15 + 24) = v9;
  v17[4] = sub_247E0CCF0;
  v17[5] = v15;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 1107296256;
  v17[2] = sub_247E120C4;
  v17[3] = &block_descriptor_11;
  v16 = _Block_copy(v17);
  swift_retain();
  swift_release();
  objc_msgSend(v14, sel_setSubject_isHidden_completion_, v12, 1, v16);
  _Block_release(v16);

  swift_release();
}

- (void)educationViewControllerRequestsDismissal:(id)a3 withResult:(int64_t)a4
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = self;
  *(void *)(v6 + 24) = a3;
  v11[4] = sub_247E0CCC8;
  v11[5] = v6;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = sub_247E0DBE8;
  v11[3] = &block_descriptor;
  uint64_t v7 = _Block_copy(v11);
  id v8 = a3;
  uint64_t v9 = self;
  id v10 = v8;
  swift_release();
  objc_msgSend(v10, sel_dismissViewControllerAnimated_completion_, 1, v7);
  _Block_release(v7);
}

- (APEducationViewControllerSystemActionDelegate)init
{
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)APEducationViewControllerSystemActionDelegate;
  return [(APEducationViewControllerSystemActionDelegate *)&v4 init];
}

- (void).cxx_destruct
{
}

@end