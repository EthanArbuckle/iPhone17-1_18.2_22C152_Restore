@interface LAContext(UI)
- (id)uiHelper;
- (void)_authenticateWithOptions:()UI acl:availableMechanisms:hostVC:context:operation:updatedOptions:reply:;
- (void)_validateAvailableMechanims:()UI completion:;
- (void)evaluateAccessControl:()UI operation:options:presentationContext:reply:;
- (void)setUiHelper:()UI;
@end

@implementation LAContext(UI)

- (void)setUiHelper:()UI
{
}

- (id)uiHelper
{
  return objc_getAssociatedObject(a1, sel_uiHelper);
}

- (void)evaluateAccessControl:()UI operation:options:presentationContext:reply:
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = [v12 objectForKeyedSubscript:&unk_26F32BB18];
  char v16 = [v15 BOOLValue];

  v17 = (void *)[v12 mutableCopy];
  [v17 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:&unk_26F32BB18];
  objc_initWeak(&location, a1);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __83__LAContext_UI__evaluateAccessControl_operation_options_presentationContext_reply___block_invoke;
  v22[3] = &unk_26506EA20;
  char v28 = v16;
  id v18 = v14;
  id v26 = v18;
  objc_copyWeak(v27, &location);
  id v19 = v13;
  id v23 = v19;
  v27[1] = a3;
  v27[2] = a4;
  id v20 = v12;
  id v24 = v20;
  id v21 = v17;
  id v25 = v21;
  [a1 evaluateAccessControl:a3 operation:a4 options:v21 reply:v22];

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
}

- (void)_authenticateWithOptions:()UI acl:availableMechanisms:hostVC:context:operation:updatedOptions:reply:
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  id v21 = a10;
  objc_initWeak(&location, a1);
  v22 = [a1 uiHelper];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __112__LAContext_UI___authenticateWithOptions_acl_availableMechanisms_hostVC_context_operation_updatedOptions_reply___block_invoke;
  v25[3] = &unk_26506EA48;
  objc_copyWeak(v28, &location);
  id v23 = v21;
  id v27 = v23;
  v28[1] = a4;
  v28[2] = a8;
  id v24 = v20;
  id v26 = v24;
  [v22 authenticateWithOptions:v16 availableMechanisms:v17 hostVC:v18 context:v19 reply:v25];

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
}

- (void)_validateAvailableMechanims:()UI completion:
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 containsObject:&unk_26F32BB30])
  {
    id v7 = v5;
    id v8 = v6;
    TCCAccessRequest();
  }
  else
  {
    (*((void (**)(id, id))v6 + 2))(v6, v5);
  }
}

@end