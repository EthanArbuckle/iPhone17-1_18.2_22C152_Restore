@interface AUUIAlert
- (AUUIAlert)initWithViewController:(id)a3;
- (AUUIAlert)initWithViewController:(id)a3 actionSheet:(BOOL)a4;
- (AUUIAlertDelegate)delegate;
- (BOOL)alertViewShouldEnableFirstOtherButton:(id)a3;
- (BOOL)stackButtons;
- (NSString)alternateButtonTitle;
- (NSString)cancelButtonTitle;
- (NSString)destructiveButtonTitle;
- (NSString)message;
- (NSString)okButtonTitle;
- (NSString)title;
- (UIAlertAction)alternateAction;
- (UIAlertAction)cancelAction;
- (UIAlertAction)destructiveAction;
- (UIAlertAction)okAction;
- (id)alert;
- (id)context;
- (id)viewController;
- (int64_t)tag;
- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4;
- (void)applicationDidEnterBackgroundNotification:(id)a3;
- (void)dealloc;
- (void)dismissWithCancelActionAnimated:(BOOL)a3;
- (void)dismissWithOKActionAnimated:(BOOL)a3;
- (void)enableAlternateAction:(BOOL)a3;
- (void)enableCancelAction:(BOOL)a3;
- (void)enableDestructiveAction:(BOOL)a3;
- (void)enableOKAction:(BOOL)a3;
- (void)prepareToShow;
- (void)setAlert:(id)a3;
- (void)setAlternateAction:(id)a3;
- (void)setAlternateButtonTitle:(id)a3;
- (void)setCancelAction:(id)a3;
- (void)setCancelButtonTitle:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestructiveAction:(id)a3;
- (void)setDestructiveButtonTitle:(id)a3;
- (void)setMessage:(id)a3;
- (void)setOkAction:(id)a3;
- (void)setOkButtonTitle:(id)a3;
- (void)setStackButtons:(BOOL)a3;
- (void)setTag:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setViewController:(id)a3;
- (void)show;
@end

@implementation AUUIAlert

- (AUUIAlert)initWithViewController:(id)a3
{
  return (AUUIAlert *)MEMORY[0x270F9A6D0](self, sel_initWithViewController_actionSheet_, a3);
}

- (AUUIAlert)initWithViewController:(id)a3 actionSheet:(BOOL)a4
{
  BOOL v4 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AUUIAlert;
  v7 = [(AUUIAlert *)&v16 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_alertControllerWithTitle_message_preferredStyle_(MEMORY[0x263F1C3F8], v6, 0, 0, !v4);
    objc_msgSend_setAlert_(v7, v9, v8);
    objc_msgSend_setViewController_(v7, v10, (uint64_t)a3);
    v7->okButtonIndex = -1;
    v7->cancelButtonIndex = -1;
    v7->alternateButtonIndex = -1;
    v7->destructiveButtonIndex = -1;
    v13 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v11, v12);
    objc_msgSend_addObserver_selector_name_object_(v13, v14, (uint64_t)v7, sel_applicationDidEnterBackgroundNotification_, *MEMORY[0x263F1D050], 0);
  }
  return v7;
}

- (void)dealloc
{
  BOOL v4 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2);
  objc_msgSend_removeObserver_name_object_(v4, v5, (uint64_t)self, *MEMORY[0x263F1D050], 0);

  self->title = 0;
  self->message = 0;

  self->okButtonTitle = 0;
  self->cancelButtonTitle = 0;

  self->alternateButtonTitle = 0;
  self->destructiveButtonTitle = 0;
  objc_msgSend_setOkAction_(self, v6, 0);
  objc_msgSend_setCancelAction_(self, v7, 0);
  objc_msgSend_setDestructiveAction_(self, v8, 0);
  objc_msgSend_setAlternateAction_(self, v9, 0);
  objc_msgSend_dismissWithNoActionAnimated_(self, v10, 0);

  self->alert = 0;
  v11.receiver = self;
  v11.super_class = (Class)AUUIAlert;
  [(AUUIAlert *)&v11 dealloc];
}

- (void)prepareToShow
{
  self->prepared = 1;
  id alert = self->alert;
  objc_msgSend_setTitle_(alert, a2, (uint64_t)self->title);
  objc_msgSend_setMessage_(alert, v4, (uint64_t)self->message);
  if (objc_msgSend_length(self->destructiveButtonTitle, v5, v6))
  {
    destructiveButtonTitle = self->destructiveButtonTitle;
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = sub_226868DBC;
    v58[3] = &unk_2647BA640;
    v58[4] = self;
    uint64_t v10 = objc_msgSend_actionWithTitle_style_handler_(MEMORY[0x263F1C3F0], v7, (uint64_t)destructiveButtonTitle, 2, v58);
    objc_msgSend_setDestructiveAction_(self, v11, v10);
  }
  if (objc_msgSend_length(self->cancelButtonTitle, v7, v8))
  {
    cancelButtonTitle = self->cancelButtonTitle;
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = sub_226868E18;
    v57[3] = &unk_2647BA640;
    v57[4] = self;
    uint64_t v15 = objc_msgSend_actionWithTitle_style_handler_(MEMORY[0x263F1C3F0], v12, (uint64_t)cancelButtonTitle, 1, v57);
    objc_msgSend_setCancelAction_(self, v16, v15);
  }
  if (objc_msgSend_length(self->alternateButtonTitle, v12, v13))
  {
    alternateButtonTitle = self->alternateButtonTitle;
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = sub_226868E74;
    v56[3] = &unk_2647BA640;
    v56[4] = self;
    uint64_t v20 = objc_msgSend_actionWithTitle_style_handler_(MEMORY[0x263F1C3F0], v17, (uint64_t)alternateButtonTitle, 0, v56);
    objc_msgSend_setAlternateAction_(self, v21, v20);
  }
  if (objc_msgSend_length(self->okButtonTitle, v17, v18))
  {
    okButtonTitle = self->okButtonTitle;
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = sub_226868ED0;
    v55[3] = &unk_2647BA640;
    v55[4] = self;
    uint64_t v25 = objc_msgSend_actionWithTitle_style_handler_(MEMORY[0x263F1C3F0], v22, (uint64_t)okButtonTitle, 0, v55);
    objc_msgSend_setOkAction_(self, v26, v25);
  }
  if (objc_msgSend_destructiveAction(self, v22, v23))
  {
    uint64_t v29 = objc_msgSend_destructiveAction(self, v27, v28);
    objc_msgSend_addAction_(alert, v30, v29);
    if (objc_msgSend_alternateAction(self, v31, v32))
    {
      uint64_t v35 = objc_msgSend_alternateAction(self, v33, v34);
      objc_msgSend_addAction_(alert, v36, v35);
    }
    if (objc_msgSend_okAction(self, v33, v34))
    {
      uint64_t ok = objc_msgSend_okAction(self, v37, v38);
      objc_msgSend_addAction_(alert, v40, ok);
    }
    if (objc_msgSend_cancelAction(self, v37, v38))
    {
      uint64_t v43 = objc_msgSend_cancelAction(self, v41, v42);
LABEL_22:
      objc_msgSend_addAction_(alert, v44, v43);
    }
  }
  else
  {
    if (objc_msgSend_cancelAction(self, v27, v28))
    {
      uint64_t v47 = objc_msgSend_cancelAction(self, v45, v46);
      objc_msgSend_addAction_(alert, v48, v47);
    }
    if (objc_msgSend_alternateAction(self, v45, v46))
    {
      uint64_t v51 = objc_msgSend_alternateAction(self, v49, v50);
      objc_msgSend_addAction_(alert, v52, v51);
    }
    if (objc_msgSend_okAction(self, v49, v50))
    {
      uint64_t v43 = objc_msgSend_okAction(self, v53, v54);
      goto LABEL_22;
    }
  }
}

- (void)show
{
  if (!self->prepared) {
    objc_msgSend_prepareToShow(self, a2, v2);
  }
  id alert = self->alert;
  uint64_t v5 = objc_msgSend_viewController(self, a2, v2);

  MEMORY[0x270F9A6D0](v5, sel_presentViewController_animated_completion_, alert);
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  int64_t cancelButtonIndex = self->cancelButtonIndex;
  if (cancelButtonIndex != -1 && cancelButtonIndex == a4)
  {
    if (objc_opt_respondsToSelector())
    {
      delegate = self->delegate;
      MEMORY[0x270F9A6D0](delegate, sel_auUIAlertCancelAction_, self);
    }
  }
  else
  {
    int64_t okButtonIndex = self->okButtonIndex;
    if (okButtonIndex != -1 && okButtonIndex == a4)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v15 = self->delegate;
        MEMORY[0x270F9A6D0](v15, sel_auUIAlertOKAction_, self);
      }
    }
    else
    {
      int64_t alternateButtonIndex = self->alternateButtonIndex;
      if (alternateButtonIndex != -1 && alternateButtonIndex == a4)
      {
        if (objc_opt_respondsToSelector())
        {
          objc_super v16 = self->delegate;
          id context = self->context;
          MEMORY[0x270F9A6D0](v16, sel_auUIAlertAlternateAction_, context);
        }
      }
      else
      {
        int64_t destructiveButtonIndex = self->destructiveButtonIndex;
        BOOL v12 = destructiveButtonIndex != -1 && destructiveButtonIndex == a4;
        if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          uint64_t v13 = self->delegate;
          MEMORY[0x270F9A6D0](v13, sel_auUIAlertDestructiveAction_, self);
        }
      }
    }
  }
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(id)a3
{
  id v17 = a3;
  BOOL v4 = 1;
  char v16 = 1;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = objc_msgSend_methodSignatureForSelector_(self->delegate, v5, (uint64_t)sel_alertViewShouldEnableFirstOtherButton_);
    uint64_t v8 = objc_msgSend_invocationWithMethodSignature_(MEMORY[0x263EFF958], v7, v6);
    objc_msgSend_setTarget_(v8, v9, (uint64_t)self->delegate);
    objc_msgSend_setSelector_(v8, v10, (uint64_t)sel_alertViewShouldEnableFirstOtherButton_);
    objc_msgSend_setArgument_atIndex_(v8, v11, (uint64_t)&v17, 2);
    objc_msgSend_invoke(v8, v12, v13);
    objc_msgSend_getReturnValue_(v8, v14, (uint64_t)&v16);
    return v16 != 0;
  }
  return v4;
}

- (void)dismissWithOKActionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_msgSend_alert(self, a2, a3);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_226869204;
  v7[3] = &unk_2647B8428;
  v7[4] = self;
  objc_msgSend_dismissViewControllerAnimated_completion_(v5, v6, v3, v7);
}

- (void)dismissWithCancelActionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_msgSend_alert(self, a2, a3);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2268692E4;
  v7[3] = &unk_2647B8428;
  v7[4] = self;
  objc_msgSend_dismissViewControllerAnimated_completion_(v5, v6, v3, v7);
}

- (void)enableOKAction:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t ok = objc_msgSend_okAction(self, a2, a3);

  objc_msgSend_setEnabled_(ok, v5, v3);
}

- (void)enableCancelAction:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = objc_msgSend_cancelAction(self, a2, a3);

  objc_msgSend_setEnabled_(v4, v5, v3);
}

- (void)enableDestructiveAction:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = objc_msgSend_destructiveAction(self, a2, a3);

  objc_msgSend_setEnabled_(v4, v5, v3);
}

- (void)enableAlternateAction:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = objc_msgSend_alternateAction(self, a2, a3);

  objc_msgSend_setEnabled_(v4, v5, v3);
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  objc_msgSend_setDelegate_(self, a2, 0);

  objc_msgSend_dismissWithNoActionAnimated_(self, v4, 0);
}

- (id)viewController
{
  return self->viewController;
}

- (void)setViewController:(id)a3
{
}

- (AUUIAlertDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (AUUIAlertDelegate *)a3;
}

- (id)context
{
  return self->context;
}

- (void)setContext:(id)a3
{
}

- (int64_t)tag
{
  return self->tag;
}

- (void)setTag:(int64_t)a3
{
  self->tag = a3;
}

- (id)alert
{
  return self->alert;
}

- (void)setAlert:(id)a3
{
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)okButtonTitle
{
  return self->okButtonTitle;
}

- (void)setOkButtonTitle:(id)a3
{
}

- (NSString)cancelButtonTitle
{
  return self->cancelButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
}

- (NSString)alternateButtonTitle
{
  return self->alternateButtonTitle;
}

- (void)setAlternateButtonTitle:(id)a3
{
}

- (NSString)destructiveButtonTitle
{
  return self->destructiveButtonTitle;
}

- (void)setDestructiveButtonTitle:(id)a3
{
}

- (BOOL)stackButtons
{
  return self->stackButtons;
}

- (void)setStackButtons:(BOOL)a3
{
  self->stackButtons = a3;
}

- (UIAlertAction)okAction
{
  return self->okAction;
}

- (void)setOkAction:(id)a3
{
}

- (UIAlertAction)cancelAction
{
  return self->cancelAction;
}

- (void)setCancelAction:(id)a3
{
}

- (UIAlertAction)alternateAction
{
  return self->alternateAction;
}

- (void)setAlternateAction:(id)a3
{
}

- (UIAlertAction)destructiveAction
{
  return self->destructiveAction;
}

- (void)setDestructiveAction:(id)a3
{
}

@end