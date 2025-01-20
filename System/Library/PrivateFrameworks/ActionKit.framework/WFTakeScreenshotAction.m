@interface WFTakeScreenshotAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (BOOL)skipsProcessingHiddenParameters;
- (FBSDisplayLayoutMonitor)displayLayoutMonitor;
- (id)contentDestinationWithError:(id *)a3;
- (id)disabledOnPlatforms;
- (id)parameterSummary;
- (id)screenshotDisplay:(id)a3 error:(id *)a4;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)cancel;
- (void)notifyVisibleScenesOfScreenshot:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setDisplayLayoutMonitor:(id)a3;
- (void)takeScreenshot;
@end

@implementation WFTakeScreenshotAction

- (void).cxx_destruct
{
}

- (void)setDisplayLayoutMonitor:(id)a3
{
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return self->_displayLayoutMonitor;
}

- (void)notifyVisibleScenesOfScreenshot:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
  v6 = [MEMORY[0x263F3F738] configurationForDefaultMainDisplayMonitor];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__WFTakeScreenshotAction_notifyVisibleScenesOfScreenshot___block_invoke;
  v10[3] = &unk_264E574B8;
  id v11 = v5;
  v12 = self;
  id v13 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 setTransitionHandler:v10];
  v9 = [MEMORY[0x263F3F728] monitorWithConfiguration:v6];
  [(WFTakeScreenshotAction *)self setDisplayLayoutMonitor:v9];
}

void __58__WFTakeScreenshotAction_notifyVisibleScenesOfScreenshot___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a2;
  v5 = v4;
  if (a3)
  {
    v19 = v4;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v6 = [a3 elements];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      uint64_t v10 = *MEMORY[0x263F3F580];
      uint64_t v11 = *MEMORY[0x263F3F598];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v13 isUIApplicationElement])
          {
            v14 = [v13 bundleIdentifier];
            getUIDidTakeScreenshotActionClass();
            v15 = objc_opt_new();
            v25 = v15;
            v26[0] = v10;
            v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
            v26[1] = v11;
            v27[0] = v16;
            v27[1] = MEMORY[0x263EFFA88];
            v17 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];

            v18 = [MEMORY[0x263F3F778] optionsWithDictionary:v17];
            [*(id *)(a1 + 32) openApplication:v14 withOptions:v18 completion:0];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
      }
      while (v8);
    }

    v5 = v19;
    [v19 invalidate];
    [*(id *)(a1 + 40) setDisplayLayoutMonitor:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)screenshotDisplay:(id)a3 error:(id *)a4
{
  v70[7] = *MEMORY[0x263EF8340];
  id v4 = a3;
  CGSize v5 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  long long v63 = *MEMORY[0x263F001A8];
  CGSize v64 = v5;
  id v58 = v4;
  [v4 displayId];
  if (CARenderServerGetDisplayLogicalBounds())
  {
    double height = v64.height;
    double v6 = v64.width;
  }
  else
  {
    [v58 bounds];
    double height = v8;
    *(void *)&long long v63 = v9;
    *((void *)&v63 + 1) = v10;
    v64.unint64_t width = v6;
    v64.double height = v8;
  }
  uint64_t v11 = *MEMORY[0x263EF8AE8];
  v69[0] = *MEMORY[0x263F0EF50];
  unint64_t width = (unint64_t)v6;
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedLong:");
  v70[0] = v12;
  v69[1] = *MEMORY[0x263F0EDF8];
  id v13 = [NSNumber numberWithUnsignedLong:(unint64_t)height];
  size_t v14 = (4 * width + 63) & 0xFFFFFFFFFFFFFFC0;
  v70[1] = v13;
  uint64_t v15 = *MEMORY[0x263F0ED48];
  v69[2] = *MEMORY[0x263F0EE48];
  v69[3] = v15;
  v70[2] = &unk_26F074BC8;
  v70[3] = &unk_26F074BE0;
  v69[4] = *MEMORY[0x263F0ED50];
  v16 = [NSNumber numberWithUnsignedLong:v14];
  size_t v17 = (v11 + v14 * (unint64_t)height) & ~v11;
  v70[4] = v16;
  v69[5] = *MEMORY[0x263F0ED30];
  v18 = [NSNumber numberWithUnsignedLong:v17];
  v70[5] = v18;
  v69[6] = *MEMORY[0x263F0ED58];
  v70[6] = &unk_26F074BF8;
  CFDictionaryRef properties = [NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:7];

  v19 = IOSurfaceCreate(properties);
  if (v19)
  {
    id v20 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v21 = *MEMORY[0x263F15F90];
    uint64_t v22 = *MEMORY[0x263F15F40];
    v65[0] = *MEMORY[0x263F15F88];
    v65[1] = v22;
    v66[0] = v21;
    v66[1] = v19;
    v65[2] = *MEMORY[0x263F15F48];
    long long v23 = [v58 name];
    v66[2] = v23;
    v65[3] = *MEMORY[0x263F15FA8];
    long long v24 = [NSNumber numberWithInt:(int)*(double *)&v63];
    v66[3] = v24;
    v65[4] = *MEMORY[0x263F15FB0];
    v25 = [NSNumber numberWithInt:(int)*((double *)&v63 + 1)];
    v66[4] = v25;
    uint64_t v26 = *MEMORY[0x263F15F68];
    v65[5] = *MEMORY[0x263F15F58];
    v65[6] = v26;
    v66[5] = MEMORY[0x263EFFA88];
    v66[6] = MEMORY[0x263EFFA88];
    v27 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:7];
    v28 = [v20 initWithDictionary:v27];

    uint64_t v29 = [(WFTakeScreenshotAction *)self parameterValueForKey:@"WFTakeScreenshotIgnoreContextualAssistanceLayers" ofClass:objc_opt_class()];
    LODWORD(v24) = [v29 BOOLValue];

    if (v24) {
      [v28 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F15F60]];
    }
    CARenderServerSnapshot();
    IOSurfaceLock(v19, 1u, 0);
    BaseAddress = IOSurfaceGetBaseAddress(v19);
    CGDataProviderRef v31 = CGDataProviderCreateWithData(v19, BaseAddress, v17, (CGDataProviderReleaseDataCallback)release_surface_data);
    v32 = v31;
    if (!v31)
    {
      uint64_t v33 = getWFActionsLogObject();
      if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v68 = "-[WFTakeScreenshotAction screenshotDisplay:error:]";
        _os_log_impl(&dword_23C364000, (os_log_t)v33, OS_LOG_TYPE_ERROR, "%s Failed to create new data provider.", buf, 0xCu);
      }
      v37 = 0;
      goto LABEL_24;
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__WFTakeScreenshotAction_screenshotDisplay_error___block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v31;
    uint64_t v33 = (uint64_t)_Block_copy(aBlock);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __50__WFTakeScreenshotAction_screenshotDisplay_error___block_invoke_2;
    v61[3] = &__block_descriptor_40_e5_v8__0l;
    v61[4] = DeviceRGB;
    v35 = (void (**)(void))_Block_copy(v61);
    CGImageRef v36 = CGImageCreate(width, (unint64_t)height, 8uLL, 0x20uLL, v14, DeviceRGB, 0x2002u, v32, 0, 1, kCGRenderingIntentDefault);
    v37 = v36;
    if (!v36)
    {
LABEL_23:
      v35[2](v35);

      (*(void (**)(uint64_t))(v33 + 16))(v33);
LABEL_24:

      goto LABEL_25;
    }
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __50__WFTakeScreenshotAction_screenshotDisplay_error___block_invoke_3;
    v60[3] = &__block_descriptor_40_e5_v8__0l;
    v60[4] = v36;
    v38 = (void (**)(void))_Block_copy(v60);
    v39 = [v58 currentOrientation];
    char v40 = [v39 isEqualToString:*MEMORY[0x263F15A58]];

    if (v40)
    {
      CGFloat v41 = 1.57079633;
    }
    else
    {
      v42 = [v58 currentOrientation];
      char v43 = [v42 isEqualToString:*MEMORY[0x263F15A50]];

      if (v43)
      {
        CGFloat v41 = -1.57079633;
      }
      else
      {
        v44 = [v58 currentOrientation];
        char v45 = [v44 isEqualToString:*MEMORY[0x263F15A48]];

        if ((v45 & 1) == 0)
        {
          v37 = (CGImage *)[objc_alloc(MEMORY[0x263F85308]) initWithCGImage:v37 scale:1 orientation:1.0];
          goto LABEL_22;
        }
        CGFloat v41 = 3.14159265;
      }
    }
    CGSize v46 = v64;
    CGAffineTransformMakeRotation(&v59, v41);
    v72.origin.x = 0.0;
    v72.origin.y = 0.0;
    v72.size = v46;
    CGRect v73 = CGRectApplyAffineTransform(v72, &v59);
    double v47 = v73.size.width;
    double v48 = v73.size.height;
    objc_msgSend(MEMORY[0x263F85188], "HDRCapableContextWithSize:scale:", v73.size.width, v73.size.height, 1.0);
    id v49 = objc_claimAutoreleasedReturnValue();
    CGContextTranslateCTM((CGContextRef)[v49 CGContext], v47 * 0.5, v48 * 0.5);
    id v50 = v49;
    CGContextRotateCTM((CGContextRef)[v50 CGContext], v41);
    id v51 = v50;
    CGContextScaleCTM((CGContextRef)[v51 CGContext], 1.0, -1.0);
    id v52 = v51;
    v53 = (CGContext *)[v52 CGContext];
    v74.size = v64;
    v74.origin.x = ceil(v64.width * -0.5);
    v74.origin.y = ceil(v64.height * -0.5);
    CGContextDrawImage(v53, v74, v37);
    v37 = [v52 image];

LABEL_22:
    v38[2](v38);

    goto LABEL_23;
  }
  v28 = getWFActionsLogObject();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v68 = "-[WFTakeScreenshotAction screenshotDisplay:error:]";
    _os_log_impl(&dword_23C364000, v28, OS_LOG_TYPE_ERROR, "%s Failed to create IOSurface.", buf, 0xCu);
  }
  v37 = 0;
LABEL_25:

  return v37;
}

void __50__WFTakeScreenshotAction_screenshotDisplay_error___block_invoke(uint64_t a1)
{
}

void __50__WFTakeScreenshotAction_screenshotDisplay_error___block_invoke_2(uint64_t a1)
{
}

void __50__WFTakeScreenshotAction_screenshotDisplay_error___block_invoke_3(uint64_t a1)
{
}

- (void)takeScreenshot
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v3 = [MEMORY[0x263F15778] displays];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    uint64_t v7 = *MEMORY[0x263F33B00];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (([v9 isCloning] & 1) == 0)
        {
          id v20 = 0;
          uint64_t v10 = [(WFTakeScreenshotAction *)self screenshotDisplay:v9 error:&v20];
          id v11 = v20;
          v12 = v11;
          if (v10) {
            BOOL v13 = 1;
          }
          else {
            BOOL v13 = v11 == 0;
          }
          if (!v13)
          {
            [(WFTakeScreenshotAction *)self finishRunningWithError:v11];

            return;
          }
          if (v10)
          {
            [MEMORY[0x263F33898] log:v7];
            size_t v14 = (void *)MEMORY[0x263F338B0];
            uint64_t v15 = [MEMORY[0x263F337E8] screenshotLocation];
            v16 = [v14 itemWithObject:v10 origin:v15 disclosureLevel:1];

            [v16 setIsScreenshot:1];
            size_t v17 = [(WFTakeScreenshotAction *)self output];
            [v17 addItem:v16];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  v18 = softLinkSBSSpringBoardServerPort();
  softLinkSBFlashColor((uint64_t)v18, 1.0, 1.0, 1.0);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __40__WFTakeScreenshotAction_takeScreenshot__block_invoke;
  v19[3] = &unk_264E5EE70;
  v19[4] = self;
  [(WFTakeScreenshotAction *)self notifyVisibleScenesOfScreenshot:v19];
}

uint64_t __40__WFTakeScreenshotAction_takeScreenshot__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishRunningWithError:0];
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  uint64_t v5 = NSString;
  id v6 = a5;
  uint64_t v7 = WFLocalizedString(@"Allow “%1$@” to take a screenshot?");
  double v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v6);

  return v8;
}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (id)parameterSummary
{
  id v2 = objc_alloc(MEMORY[0x263F86888]);
  v3 = WFLocalizedStringResourceWithKey(@"Take screenshot", @"Take screenshot");
  uint64_t v4 = (void *)[v2 initWithString:v3];

  return v4;
}

- (void)cancel
{
  v2.receiver = self;
  v2.super_class = (Class)WFTakeScreenshotAction;
  [(WFTakeScreenshotAction *)&v2 cancel];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v39[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend(MEMORY[0x263F338E8], "defaultProfile", a3);
  char v5 = [v4 isScreenShotAllowed];

  if (v5)
  {
    id v6 = [(WFTakeScreenshotAction *)self variableSource];
    uint64_t v7 = [v6 workflowStartDate];

    double v8 = [(WFTakeScreenshotAction *)self variableSource];
    uint64_t v9 = [v8 contentForPrivateVariableKey:@"WFTakeScreenshotActionConfirmed"];

    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    id v15 = v10;

    char v16 = [v15 BOOLValue];
    if (v7 && (v16 & 1) == 0)
    {
      size_t v17 = [MEMORY[0x263EFF8F0] currentCalendar];
      v18 = [v17 dateByAddingUnit:64 value:10 toDate:v7 options:0];

      v19 = [MEMORY[0x263EFF910] date];
      uint64_t v20 = [v19 compare:v18];

      if (v20 == 1)
      {
        long long v21 = [(WFTakeScreenshotAction *)self workflow];
        if ([v21 hiddenFromLibraryAndSync])
        {
        }
        else
        {
          long long v22 = [(WFTakeScreenshotAction *)self workflow];
          long long v23 = [v22 name];

          if (v23)
          {
            long long v24 = NSString;
            v25 = WFLocalizedString(@"The shortcut “%@” wants to take a screenshot. Do you want to allow it?");
            uint64_t v26 = objc_msgSend(v24, "localizedStringWithFormat:", v25, v23);

LABEL_18:
            v27 = [MEMORY[0x263F336E8] alertWithPreferredStyle:0];
            v28 = [(WFTakeScreenshotAction *)self localizedName];
            [v27 setTitle:v28];

            [v27 setMessage:v26];
            uint64_t v29 = (void *)MEMORY[0x263F336F0];
            v30 = WFLocalizedString(@"Don’t Allow");
            v37[0] = MEMORY[0x263EF8330];
            v37[1] = 3221225472;
            v37[2] = __53__WFTakeScreenshotAction_runAsynchronouslyWithInput___block_invoke;
            v37[3] = &unk_264E5EE70;
            v37[4] = self;
            CGDataProviderRef v31 = [v29 buttonWithTitle:v30 style:1 handler:v37];
            [v27 addButton:v31];

            v32 = (void *)MEMORY[0x263F336F0];
            uint64_t v33 = WFLocalizedString(@"OK");
            v36[0] = MEMORY[0x263EF8330];
            v36[1] = 3221225472;
            v36[2] = __53__WFTakeScreenshotAction_runAsynchronouslyWithInput___block_invoke_2;
            v36[3] = &unk_264E5EE70;
            v36[4] = self;
            v34 = [v32 buttonWithTitle:v33 style:0 preferred:1 handler:v36];
            [v27 addButton:v34];

            v35 = [(WFTakeScreenshotAction *)self userInterface];
            [v35 presentAlert:v27];

            goto LABEL_19;
          }
        }
        uint64_t v26 = WFLocalizedString(@"This shortcut wants to take a screenshot. Do you want to allow it?");
        goto LABEL_18;
      }
    }
    [(WFTakeScreenshotAction *)self takeScreenshot];
  }
  else
  {
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F870B8];
    uint64_t v38 = *MEMORY[0x263F08320];
    uint64_t v7 = WFLocalizedString(@"Your administrator doesn't allow taking screenshots.");
    v39[0] = v7;
    BOOL v13 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
    size_t v14 = [v11 errorWithDomain:v12 code:8 userInfo:v13];
    [(WFTakeScreenshotAction *)self finishRunningWithError:v14];
  }
LABEL_19:
}

void __53__WFTakeScreenshotAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] userCancelledError];
  [v1 finishRunningWithError:v2];
}

uint64_t __53__WFTakeScreenshotAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) variableSource];
  [v2 setContent:MEMORY[0x263EFFA88] forPrivateVariableKey:@"WFTakeScreenshotActionConfirmed"];

  v3 = *(void **)(a1 + 32);
  return [v3 takeScreenshot];
}

- (BOOL)skipsProcessingHiddenParameters
{
  return 0;
}

- (id)disabledOnPlatforms
{
  v5.receiver = self;
  v5.super_class = (Class)WFTakeScreenshotAction;
  id v2 = [(WFTakeScreenshotAction *)&v5 disabledOnPlatforms];
  v3 = [v2 arrayByAddingObject:*MEMORY[0x263F871E8]];

  return v3;
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end