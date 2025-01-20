@interface WFOverlayImageAction
+ (id)userInterfaceProtocol;
+ (id)userInterfaceXPCInterface;
- (void)getImageInputs:(id)a3 withInput:(id)a4;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)runWithNoUserInterface:(id)a3;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
@end

@implementation WFOverlayImageAction

+ (id)userInterfaceXPCInterface
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___WFOverlayImageAction;
  v2 = objc_msgSendSuper2(&v10, sel_userInterfaceXPCInterface);
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_showWithOverlayImage_images_completionHandler_ argumentIndex:1 ofReply:0];

  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_showWithOverlayImage_images_completionHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E2810;
}

- (void)getImageInputs:(id)a3 withInput:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__WFOverlayImageAction_getImageInputs_withInput___block_invoke;
  v10[3] = &unk_264E5D218;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v7 generateCollectionByCoercingToItemClass:v8 completionHandler:v10];
}

void __49__WFOverlayImageAction_getImageInputs_withInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v25[2] = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    uint64_t v8 = [*(id *)(a1 + 32) parameterStateForKey:@"WFImage"];
    id v9 = [*(id *)(a1 + 32) parameterValueForKey:@"WFImage" ofClass:objc_opt_class()];
    if ([v9 numberOfItems])
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __49__WFOverlayImageAction_getImageInputs_withInput___block_invoke_2;
      v21[3] = &unk_264E5C010;
      id v23 = *(id *)(a1 + 40);
      id v22 = v6;
      [v9 getObjectRepresentation:v21 forClass:objc_opt_class()];

      objc_super v10 = v23;
    }
    else
    {
      id v11 = [v8 variable];

      if (v11)
      {
        v12 = NSString;
        v13 = WFLocalizedString(@"The variable “%@” did not include an image to overlay.");
        v14 = [v8 variable];
        v15 = [v14 nameIncludingPropertyName];
        objc_super v10 = objc_msgSend(v12, "localizedStringWithFormat:", v13, v15);
      }
      else
      {
        objc_super v10 = WFLocalizedString(@"Make sure to choose a variable in the Overlay Image action.");
      }
      v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = *MEMORY[0x263F08438];
      v24[0] = *MEMORY[0x263F08338];
      v18 = WFLocalizedString(@"No Overlay Image");
      v24[1] = *MEMORY[0x263F08320];
      v25[0] = v18;
      v25[1] = v10;
      v19 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
      v20 = [v16 errorWithDomain:v17 code:22 userInfo:v19];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __49__WFOverlayImageAction_getImageInputs_withInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32), a2, 0);
  }
  else {
    return (*(uint64_t (**)(void))(v3 + 16))();
  }
}

- (void)runWithNoUserInterface:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__WFOverlayImageAction_runWithNoUserInterface___block_invoke;
  v3[3] = &unk_264E5BFE8;
  v3[4] = self;
  [(WFOverlayImageAction *)self getImageInputs:v3 withInput:a3];
}

void __47__WFOverlayImageAction_runWithNoUserInterface___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v7 numberOfItems];
  if (v8 && v10)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __47__WFOverlayImageAction_runWithNoUserInterface___block_invoke_2;
    v12[3] = &unk_264E5BFC0;
    v12[4] = *(void *)(a1 + 32);
    id v13 = v8;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __47__WFOverlayImageAction_runWithNoUserInterface___block_invoke_5;
    v11[3] = &unk_264E5E840;
    v11[4] = *(void *)(a1 + 32);
    [v7 transformItemsUsingBlock:v12 completionHandler:v11];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v9];
  }
}

void __47__WFOverlayImageAction_runWithNoUserInterface___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__WFOverlayImageAction_runWithNoUserInterface___block_invoke_3;
  v8[3] = &unk_264E5DB78;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v10 = v5;
  id v7 = v5;
  [a2 getFileRepresentation:v8 forType:0];
}

void __47__WFOverlayImageAction_runWithNoUserInterface___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

void __47__WFOverlayImageAction_runWithNoUserInterface___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  WFImageSizeFromFile();
  double v5 = v4;
  double v7 = v6;
  id v8 = [a1[4] parameterValueForKey:@"WFImageWidth" ofClass:objc_opt_class()];
  [v8 doubleValue];
  double v10 = v9;
  id v11 = [a1[4] parameterValueForKey:@"WFImageHeight" ofClass:objc_opt_class()];
  [v11 doubleValue];
  double v13 = v12;

  if (v10 == 0.0 && v13 == 0.0)
  {
    [a1[5] sizeInPixels];
    double v10 = v14;
    double v13 = v15;
  }
  else if (v13 == 0.0)
  {
    [a1[5] sizeInPixels];
    double v17 = v10 * v16;
    [a1[5] sizeInPixels];
    double v13 = v17 / v18;
  }
  else if (v10 == 0.0)
  {
    [a1[5] sizeInPixels];
    double v20 = v13 * v19;
    [a1[5] sizeInPixels];
    double v10 = v20 / v21;
  }
  id v22 = [a1[4] parameterValueForKey:@"WFImagePosition" ofClass:objc_opt_class()];
  if ([v22 isEqualToString:@"Center"])
  {
    double v23 = (v5 - v10) * 0.5;
    double v24 = (v7 - v13) * 0.5;
  }
  else
  {
    if (([v22 isEqualToString:@"Top Right"] & 1) != 0
      || [v22 isEqualToString:@"Bottom Right"])
    {
      double v23 = v5 - v10;
    }
    else
    {
      double v23 = 0.0;
      if (([v22 isEqualToString:@"Top Left"] & 1) == 0) {
        [v22 isEqualToString:@"Bottom Left"];
      }
    }
    double v24 = 0.0;
  }
  double v25 = 0.0;
  if (([v22 isEqualToString:@"Top Left"] & 1) == 0
    && ([v22 isEqualToString:@"Top Right"] & 1) == 0)
  {
    if (([v22 isEqualToString:@"Bottom Left"] & 1) != 0
      || (double v25 = v24, [v22 isEqualToString:@"Bottom Right"]))
    {
      double v25 = v7 - v13;
    }
  }
  if ([v22 isEqualToString:@"Custom"])
  {
    v26 = [a1[4] parameterValueForKey:@"WFImageX" ofClass:objc_opt_class()];
    [v26 doubleValue];
    double v23 = v27;

    v28 = [a1[4] parameterValueForKey:@"WFImageY" ofClass:objc_opt_class()];
    [v28 doubleValue];
    double v25 = v29;
  }
  v30 = [a1[4] parameterValueForKey:@"WFOverlayImageOpacity" ofClass:objc_opt_class()];
  [v30 doubleValue];
  double v32 = v31 / 100.0;

  v33 = [a1[4] parameterValueForKey:@"WFRotation" ofClass:objc_opt_class()];
  [v33 doubleValue];
  double v35 = v34 * 3.14159265 / 180.0;

  v36 = -[WFOverlayImageTransform initWithCenter:bounds:rotation:scale:opacity:]([WFOverlayImageTransform alloc], "initWithCenter:bounds:rotation:scale:opacity:", v10 * 0.5 + v23, v13 * 0.5 + v25, 0.0, 0.0, v10, v13, v35, 1.0, *(void *)&v32);
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __47__WFOverlayImageAction_runWithNoUserInterface___block_invoke_4;
  v38[3] = &unk_264E5DBC8;
  id v37 = a1[5];
  id v39 = a1[6];
  [(WFOverlayImageTransform *)v36 applyToImageFile:v3 withOverlayImage:v37 completionHandler:v38];
}

uint64_t __47__WFOverlayImageAction_runWithNoUserInterface___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__WFOverlayImageAction_runWithRemoteUserInterface_input___block_invoke;
  v8[3] = &unk_264E5BF98;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(WFOverlayImageAction *)self getImageInputs:v8 withInput:a4];
}

void __57__WFOverlayImageAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v7 numberOfItems];
  if (v8 && v10)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __57__WFOverlayImageAction_runWithRemoteUserInterface_input___block_invoke_2;
    v13[3] = &unk_264E5EBA0;
    id v14 = *(id *)(a1 + 40);
    id v11 = v8;
    uint64_t v12 = *(void *)(a1 + 32);
    id v15 = v11;
    uint64_t v16 = v12;
    [v7 getFileRepresentations:v13 forType:0];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v9];
  }
}

uint64_t __57__WFOverlayImageAction_runWithRemoteUserInterface_input___block_invoke_2(void *a1, uint64_t a2)
{
  id v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__WFOverlayImageAction_runWithRemoteUserInterface_input___block_invoke_3;
  v5[3] = &unk_264E5EEE8;
  v5[4] = a1[6];
  return [v3 showWithOverlayImage:v2 images:a2 completionHandler:v5];
}

void __57__WFOverlayImageAction_runWithRemoteUserInterface_input___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        uint64_t v12 = [*(id *)(a1 + 32) output];
        [v12 addFile:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  id v5 = [(WFOverlayImageAction *)self parameterValueForKey:@"WFShouldShowImageEditor" ofClass:objc_opt_class()];
  char v6 = [v5 BOOLValue];

  if (v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)WFOverlayImageAction;
    [(WFOverlayImageAction *)&v7 runAsynchronouslyWithInput:v4];
  }
  else
  {
    [(WFOverlayImageAction *)self runWithNoUserInterface:v4];
  }
}

@end