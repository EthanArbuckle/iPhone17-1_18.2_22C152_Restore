@interface MSRadarInteraction
+ (id)interactionWithTitle:(id)a3 message:(id)a4 builder:(id)a5;
+ (id)interactionWithTitle:(id)a3 message:(id)a4 radarURL:(id)a5;
- (MSRadarInteraction)initWithTitle:(id)a3 message:(id)a4 radarURL:(id)a5;
- (NSString)cancelButtonTitle;
- (NSString)maybeLaterButtonTitle;
- (NSString)message;
- (NSString)openButtonTitle;
- (NSString)title;
- (NSURL)radarURL;
- (UIAlertController)interactionViewController;
- (id)cancelHandler;
- (id)maybeLaterHandler;
- (id)openHandler;
- (void)openTapToRadar;
- (void)promptToFile;
- (void)promptToFileWithCompletionHandler:(id)a3;
- (void)setCancelButtonTitle:(id)a3;
- (void)setCancelHandler:(id)a3;
- (void)setMaybeLaterButtonTitle:(id)a3;
- (void)setMaybeLaterHandler:(id)a3;
- (void)setOpenButtonTitle:(id)a3;
- (void)setOpenHandler:(id)a3;
@end

@implementation MSRadarInteraction

+ (id)interactionWithTitle:(id)a3 message:(id)a4 radarURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[objc_alloc((Class)a1) initWithTitle:v8 message:v9 radarURL:v10];

  return v11;
}

+ (id)interactionWithTitle:(id)a3 message:(id)a4 builder:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[MSRadarURLBuilder radarURLWithBuilder:a5];
  v11 = [a1 interactionWithTitle:v8 message:v9 radarURL:v10];

  return v11;
}

- (MSRadarInteraction)initWithTitle:(id)a3 message:(id)a4 radarURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MSRadarInteraction;
  v11 = [(MSRadarInteraction *)&v21 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    radarURL = v11->_radarURL;
    v11->_radarURL = (NSURL *)v12;

    uint64_t v14 = [v8 copy];
    title = v11->_title;
    v11->_title = (NSString *)v14;

    uint64_t v16 = [v9 copy];
    message = v11->_message;
    v11->_message = (NSString *)v16;

    cancelButtonTitle = v11->_cancelButtonTitle;
    v11->_cancelButtonTitle = (NSString *)@"Never mind";

    openButtonTitle = v11->_openButtonTitle;
    v11->_openButtonTitle = (NSString *)@"Open Tap-to-Radar";
  }
  return v11;
}

- (UIAlertController)interactionViewController
{
  Class v3 = (Class)getUIAlertControllerClass[0]();
  v4 = [(MSRadarInteraction *)self title];
  v5 = [(MSRadarInteraction *)self message];
  v6 = [(objc_class *)v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  Class v7 = (Class)getUIAlertActionClass[0]();
  id v8 = [(MSRadarInteraction *)self openButtonTitle];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __47__MSRadarInteraction_interactionViewController__block_invoke;
  v20[3] = &unk_1E63FEE98;
  v20[4] = self;
  id v9 = [(objc_class *)v7 actionWithTitle:v8 style:0 handler:v20];
  [v6 addAction:v9];

  id v10 = [(MSRadarInteraction *)self maybeLaterButtonTitle];

  if (v10)
  {
    Class v11 = (Class)getUIAlertActionClass[0]();
    uint64_t v12 = [(MSRadarInteraction *)self maybeLaterButtonTitle];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __47__MSRadarInteraction_interactionViewController__block_invoke_2;
    v19[3] = &unk_1E63FEE98;
    v19[4] = self;
    v13 = [(objc_class *)v11 actionWithTitle:v12 style:0 handler:v19];
    [v6 addAction:v13];
  }
  Class v14 = (Class)getUIAlertActionClass[0]();
  v15 = [(MSRadarInteraction *)self cancelButtonTitle];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __47__MSRadarInteraction_interactionViewController__block_invoke_3;
  v18[3] = &unk_1E63FEE98;
  v18[4] = self;
  uint64_t v16 = [(objc_class *)v14 actionWithTitle:v15 style:1 handler:v18];
  [v6 addAction:v16];

  return (UIAlertController *)v6;
}

void __47__MSRadarInteraction_interactionViewController__block_invoke(uint64_t a1)
{
  id v4 = [(Class)getUIApplicationClass[0]() sharedApplication];
  v2 = [*(id *)(a1 + 32) radarURL];
  [v4 openURL:v2 options:MEMORY[0x1E4F1CC08] completionHandler:0];

  Class v3 = [*(id *)(a1 + 32) openHandler];

  if (v3)
  {
    v5 = [*(id *)(a1 + 32) openHandler];
    v5[2](v5, *(void *)(a1 + 32));
  }
}

void __47__MSRadarInteraction_interactionViewController__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) maybeLaterHandler];

  if (v2)
  {
    Class v3 = [*(id *)(a1 + 32) maybeLaterHandler];
    v3[2](v3, *(void *)(a1 + 32));
  }
}

void __47__MSRadarInteraction_interactionViewController__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cancelHandler];

  if (v2)
  {
    Class v3 = [*(id *)(a1 + 32) cancelHandler];
    v3[2](v3, *(void *)(a1 + 32));
  }
}

- (void)promptToFile
{
}

- (void)promptToFileWithCompletionHandler:(id)a3
{
  id v4 = a3;
  CFOptionFlags v15 = 0;
  v5 = [(MSRadarInteraction *)self title];
  v6 = [(MSRadarInteraction *)self message];
  CFUserNotificationDisplayAlert(30.0, 3uLL, 0, 0, 0, v5, v6, @"File Radar", @"Don't File", 0, &v15);

  if (!v15)
  {
    id v9 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    id v10 = [(MSRadarInteraction *)self radarURL];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__MSRadarInteraction_promptToFileWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E63FEEC0;
    id v14 = v4;
    [v9 openURL:v10 configuration:0 completionHandler:v13];

    Class v11 = [(MSRadarInteraction *)self openHandler];

    if (v11)
    {
      uint64_t v12 = [(MSRadarInteraction *)self openHandler];
      ((void (**)(void, MSRadarInteraction *))v12)[2](v12, self);
    }
    id v8 = (void (**)(void, void))v14;
    goto LABEL_7;
  }
  Class v7 = [(MSRadarInteraction *)self cancelHandler];

  if (v7)
  {
    id v8 = [(MSRadarInteraction *)self cancelHandler];
    ((void (**)(void, MSRadarInteraction *))v8)[2](v8, self);
LABEL_7:
  }
}

uint64_t __56__MSRadarInteraction_promptToFileWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)openTapToRadar
{
  id v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  Class v3 = [(MSRadarInteraction *)self radarURL];
  [v5 openURL:v3 configuration:0 completionHandler:0];

  id v4 = [(MSRadarInteraction *)self openHandler];

  if (v4)
  {
    v6 = [(MSRadarInteraction *)self openHandler];
    v6[2](v6, self);
  }
}

- (NSURL)radarURL
{
  return self->_radarURL;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)openButtonTitle
{
  return self->_openButtonTitle;
}

- (void)setOpenButtonTitle:(id)a3
{
}

- (id)openHandler
{
  return self->_openHandler;
}

- (void)setOpenHandler:(id)a3
{
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setCancelHandler:(id)a3
{
}

- (NSString)maybeLaterButtonTitle
{
  return self->_maybeLaterButtonTitle;
}

- (void)setMaybeLaterButtonTitle:(id)a3
{
}

- (id)maybeLaterHandler
{
  return self->_maybeLaterHandler;
}

- (void)setMaybeLaterHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_maybeLaterHandler, 0);
  objc_storeStrong((id *)&self->_maybeLaterButtonTitle, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong(&self->_openHandler, 0);
  objc_storeStrong((id *)&self->_openButtonTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_radarURL, 0);
}

@end