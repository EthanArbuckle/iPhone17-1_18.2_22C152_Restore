@interface WFSetParkedCarAction
- (BOOL)locationParameterIsCurrentLocation;
- (id)contentDestinationWithError:(id *)a3;
- (id)missingLocationError;
- (id)resizedCompressedJPEGImageDataWithWFImage:(id)a3;
- (void)fetchLastParkedCarContentItemWithCompletionHandler:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFSetParkedCarAction

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (BOOL)locationParameterIsCurrentLocation
{
  v2 = [(WFSetParkedCarAction *)self parameterStateForKey:@"WFLocation"];
  v3 = [v2 value];
  char v4 = [v3 isCurrentLocation];

  return v4;
}

- (void)fetchLastParkedCarContentItemWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 500000000);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__WFSetParkedCarAction_fetchLastParkedCarContentItemWithCompletionHandler___block_invoke;
  v7[3] = &unk_264E5EE18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, MEMORY[0x263EF83A0], v7);
}

void __75__WFSetParkedCarAction_fetchLastParkedCarContentItemWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [getRTRoutineManagerClass() defaultManager];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __75__WFSetParkedCarAction_fetchLastParkedCarContentItemWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_264E5E4B8;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 fetchLastVehicleEventsWithHandler:v4];
}

void __75__WFSetParkedCarAction_fetchLastParkedCarContentItemWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [a2 firstObject];
  if (v6)
  {
    v7 = (void *)MEMORY[0x263F337C8];
    id v8 = (void *)MEMORY[0x263F33708];
    v9 = [*(id *)(a1 + 32) appDescriptor];
    v10 = [v8 locationWithAppDescriptor:v9];
    v11 = [v7 itemWithObject:v6 origin:v10 disclosureLevel:1];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v12 = getWFActionsLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      v14 = "-[WFSetParkedCarAction fetchLastParkedCarContentItemWithCompletionHandler:]_block_invoke_2";
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_23C364000, v12, OS_LOG_TYPE_ERROR, "%s No RTVehicleEvent found, error = %@", (uint8_t *)&v13, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)resizedCompressedJPEGImageDataWithWFImage:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = [a3 UIImage];
  id v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 bounds];
  double v6 = v5;

  v7 = [MEMORY[0x263F1C920] mainScreen];
  [v7 bounds];
  double v9 = v8;

  if (v6 >= v9) {
    double v10 = v6;
  }
  else {
    double v10 = v9;
  }
  [v3 size];
  double v12 = v11;
  [v3 size];
  double v14 = v13;
  [v3 size];
  if (v12 <= v14) {
    double v15 = v16;
  }
  double v17 = v15 / v10 * 0.5;
  if (v17 >= 1.0) {
    double v18 = v17;
  }
  else {
    double v18 = 1.0;
  }
  [v3 size];
  CGFloat v20 = v19 / v18;
  [v3 size];
  v37.size.double height = v21 / v18;
  v37.origin.x = 0.0;
  v37.origin.y = 0.0;
  v37.size.double width = v20;
  CGRect v38 = CGRectIntegral(v37);
  double width = v38.size.width;
  double height = v38.size.height;
  objc_msgSend(v3, "scale", v38.origin.x, v38.origin.y);
  CGFloat v25 = v24;
  v36.double width = width;
  v36.double height = height;
  UIGraphicsBeginImageContextWithOptions(v36, 1, v25);
  objc_msgSend(v3, "drawInRect:", 0.0, 0.0, width, height);
  UIGraphicsGetImageFromCurrentImageContext();
  v26 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  if (v26)
  {
    v27 = UIImageJPEGRepresentation(v26, 0.699999988);
    if (v27)
    {
      v28 = v27;
      v29 = v28;
      goto LABEL_18;
    }
    v30 = getWFActionsLogObject();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      int v32 = 136315138;
      v33 = "-[WFSetParkedCarAction resizedCompressedJPEGImageDataWithWFImage:]";
      _os_log_impl(&dword_23C364000, v30, OS_LOG_TYPE_ERROR, "%s Failed to convert UIImage to JPEG data.", (uint8_t *)&v32, 0xCu);
    }

    v28 = 0;
  }
  else
  {
    v28 = getWFActionsLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int v32 = 136315138;
      v33 = "-[WFSetParkedCarAction resizedCompressedJPEGImageDataWithWFImage:]";
      _os_log_impl(&dword_23C364000, v28, OS_LOG_TYPE_ERROR, "%s Failed to resize UIImage for save.", (uint8_t *)&v32, 0xCu);
    }
  }
  v29 = 0;
LABEL_18:

  return v29;
}

- (id)missingLocationError
{
  v11[2] = *MEMORY[0x263EF8340];
  v2 = WFLocalizedString(@"No Car Location Provided");
  id v3 = WFLocalizedString(@"Please provide a location for the parked car.");
  id v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F870B8];
  uint64_t v6 = *MEMORY[0x263F08320];
  v10[0] = *MEMORY[0x263F08338];
  v10[1] = v6;
  v11[0] = v2;
  v11[1] = v3;
  v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  double v8 = [v4 errorWithDomain:v5 code:6 userInfo:v7];

  return v8;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 numberOfItems])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __51__WFSetParkedCarAction_runAsynchronouslyWithInput___block_invoke;
    v9[3] = &unk_264E57370;
    v9[4] = self;
    uint64_t v10 = 0;
    double v11 = &v10;
    uint64_t v12 = 0x2050000000;
    uint64_t v5 = (void *)getCLLocationClass_softClass_11671;
    uint64_t v13 = getCLLocationClass_softClass_11671;
    if (!getCLLocationClass_softClass_11671)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      double v15 = __getCLLocationClass_block_invoke_11672;
      double v16 = &unk_264E5EC88;
      double v17 = &v10;
      __getCLLocationClass_block_invoke_11672((uint64_t)&buf);
      uint64_t v5 = (void *)v11[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v10, 8);
    [v4 getObjectRepresentation:v9 forClass:objc_opt_class()];
  }
  else
  {
    v7 = getWFActionsLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[WFSetParkedCarAction runAsynchronouslyWithInput:]";
      _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_ERROR, "%s No input provided to WFSetParkedCarAction", (uint8_t *)&buf, 0xCu);
    }

    double v8 = [(WFSetParkedCarAction *)self missingLocationError];
    [(WFSetParkedCarAction *)self finishRunningWithError:v8];
  }
}

void __51__WFSetParkedCarAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    double v8 = [*(id *)(a1 + 32) parameterValueForKey:@"WFSetParkedCarNotes" ofClass:objc_opt_class()];
    double v9 = [getRTRoutineManagerClass() defaultManager];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __51__WFSetParkedCarAction_runAsynchronouslyWithInput___block_invoke_166;
    void v11[3] = &unk_264E5EBC8;
    v11[4] = *(void *)(a1 + 32);
    [v9 vehicleEventAtLocation:v6 notes:v8 handler:v11];
  }
  else
  {
    uint64_t v10 = getWFActionsLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v13 = "-[WFSetParkedCarAction runAsynchronouslyWithInput:]_block_invoke";
      _os_log_impl(&dword_23C364000, v10, OS_LOG_TYPE_ERROR, "%s Failed to coerce location content collection to CLLocation.", buf, 0xCu);
    }

    [*(id *)(a1 + 32) finishRunningWithError:v7];
  }
}

void __51__WFSetParkedCarAction_runAsynchronouslyWithInput___block_invoke_166(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = getWFActionsLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      double v8 = "-[WFSetParkedCarAction runAsynchronouslyWithInput:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_23C364000, v4, OS_LOG_TYPE_ERROR, "%s CoreRoutine error setting vehicle event: %@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) finishRunningWithError:v3];
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __51__WFSetParkedCarAction_runAsynchronouslyWithInput___block_invoke_167;
    v6[3] = &unk_264E57320;
    v6[4] = v5;
    [v5 fetchLastParkedCarContentItemWithCompletionHandler:v6];
  }
}

void __51__WFSetParkedCarAction_runAsynchronouslyWithInput___block_invoke_167(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v8 = [*(id *)(a1 + 32) parameterValueForKey:@"WFImage" ofClass:objc_opt_class()];
    if ([v8 numberOfItems])
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __51__WFSetParkedCarAction_runAsynchronouslyWithInput___block_invoke_170;
      void v11[3] = &unk_264E57348;
      v11[4] = *(void *)(a1 + 32);
      id v12 = v7;
      [v8 getObjectRepresentation:v11 forClass:objc_opt_class()];
    }
    else
    {
      id v10 = [*(id *)(a1 + 32) output];
      [v10 addItem:v7];

      [*(id *)(a1 + 32) finishRunningWithError:0];
    }
  }
  else
  {

    __int16 v9 = getWFActionsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v14 = "-[WFSetParkedCarAction runAsynchronouslyWithInput:]_block_invoke";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_ERROR, "%s No car content item found after saving it: %@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) finishRunningWithError:0];
  }
}

void __51__WFSetParkedCarAction_runAsynchronouslyWithInput___block_invoke_170(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a2)
  {
    id v7 = [*(id *)(a1 + 32) resizedCompressedJPEGImageDataWithWFImage:a2];
    if (v7)
    {
      double v8 = [getRTRoutineManagerClass() defaultManager];
      __int16 v9 = [*(id *)(a1 + 40) vehicleEvent];
      id v10 = [v9 identifier];
      [v8 updateVehicleEventWithIdentifier:v10 photo:v7];

      uint64_t v11 = *(void **)(a1 + 32);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __51__WFSetParkedCarAction_runAsynchronouslyWithInput___block_invoke_171;
      v16[3] = &unk_264E57320;
      v16[4] = v11;
      [v11 fetchLastParkedCarContentItemWithCompletionHandler:v16];
    }
    else
    {
      uint64_t v14 = getWFActionsLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v18 = "-[WFSetParkedCarAction runAsynchronouslyWithInput:]_block_invoke";
        _os_log_impl(&dword_23C364000, v14, OS_LOG_TYPE_ERROR, "%s Failed to resize/compress parked car image.", buf, 0xCu);
      }

      __int16 v15 = [*(id *)(a1 + 32) output];
      [v15 addItem:*(void *)(a1 + 40)];

      [*(id *)(a1 + 32) finishRunningWithError:0];
    }
  }
  else
  {
    id v12 = getWFActionsLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v18 = "-[WFSetParkedCarAction runAsynchronouslyWithInput:]_block_invoke";
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_23C364000, v12, OS_LOG_TYPE_ERROR, "%s Failed to coerce imageCollection to WFImage with error: %@", buf, 0x16u);
    }

    uint64_t v13 = [*(id *)(a1 + 32) output];
    [v13 addItem:*(void *)(a1 + 40)];

    [*(id *)(a1 + 32) finishRunningWithError:0];
  }
}

void __51__WFSetParkedCarAction_runAsynchronouslyWithInput___block_invoke_171(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  if (a2)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = a2;
    id v7 = [v5 output];
    [v7 addItem:v6];
  }
  [*(id *)(a1 + 32) finishRunningWithError:v8];
}

@end