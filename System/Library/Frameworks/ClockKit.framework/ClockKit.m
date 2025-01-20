uint64_t CLKInternalBuild()
{
  if (CLKInternalBuild_onceToken != -1) {
    dispatch_once(&CLKInternalBuild_onceToken, &__block_literal_global_238_0);
  }
  return CLKInternalBuild_internal;
}

BOOL CLKRunningInProcess(uint64_t a1)
{
  if ((a1 & 0x40) != 0)
  {
    if (CLKIsBridge_onceToken != -1) {
      dispatch_once(&CLKIsBridge_onceToken, &__block_literal_global_25);
    }
    if (CLKIsBridge___result) {
      return 1;
    }
  }
  if ((a1 & 0x100) != 0)
  {
    if (CLKIsCreateWatchFace_onceToken != -1) {
      dispatch_once(&CLKIsCreateWatchFace_onceToken, &__block_literal_global_30);
    }
    if (CLKIsCreateWatchFace___result) {
      return 1;
    }
  }
  if ((a1 & 0x1000) != 0)
  {
    if (CLKIsCLKCompanionWatchFaceLibraryServiceProcess_onceToken != -1) {
      dispatch_once(&CLKIsCLKCompanionWatchFaceLibraryServiceProcess_onceToken, &__block_literal_global_35);
    }
    if (CLKIsCLKCompanionWatchFaceLibraryServiceProcess___result) {
      return 1;
    }
  }
  if ((a1 & 0x200) != 0)
  {
    if (CLKIsNTKCLITool_onceToken != -1) {
      dispatch_once(&CLKIsNTKCLITool_onceToken, &__block_literal_global_41);
    }
    if (CLKIsNTKCLITool___result) {
      return 1;
    }
  }
  if ((a1 & 0x400) != 0)
  {
    if (CLKIsNTKXCTests_onceToken != -1) {
      dispatch_once(&CLKIsNTKXCTests_onceToken, &__block_literal_global_46);
    }
    if (CLKIsNTKXCTests___result) {
      return 1;
    }
  }
  if ((a1 & 0x800) != 0)
  {
    if (CLKIsGreenfieldTool_onceToken != -1) {
      dispatch_once(&CLKIsGreenfieldTool_onceToken, &__block_literal_global_54_0);
    }
    if (CLKIsGreenfieldTool___result) {
      return 1;
    }
  }
  if ((a1 & 4) != 0)
  {
    if (CLKIsUVPreviewApp_onceToken != -1) {
      dispatch_once(&CLKIsUVPreviewApp_onceToken, &__block_literal_global_72);
    }
    if (CLKIsUVPreviewApp___isUVPreview) {
      return 1;
    }
  }
  if ((a1 & 2) != 0)
  {
    if (CLKIsFaceSnapshotService_onceToken != -1) {
      dispatch_once(&CLKIsFaceSnapshotService_onceToken, &__block_literal_global_64);
    }
    if (CLKIsFaceSnapshotService___isFaceSnapshotService) {
      return 1;
    }
  }
  if ((a1 & 1) == 0) {
    return a1 == 0;
  }
  if (CLKIsNTKDaemon_onceToken != -1) {
    dispatch_once(&CLKIsNTKDaemon_onceToken, &__block_literal_global_59);
  }
  return CLKIsNTKDaemon___isDaemon || a1 == 0;
}

void sub_21C59BD60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
}

void sub_21C59C4B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C59D3EC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CLKLoggingObjectForDomain(uint64_t a1)
{
  if (CLKLoggingObjectForDomain_onceToken != -1) {
    dispatch_once(&CLKLoggingObjectForDomain_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)CLKLoggingObjectForDomain___logObjects;
  v3 = [NSNumber numberWithInteger:a1];
  v4 = [v2 objectForKey:v3];

  return v4;
}

void __CLKLoggingObjectForDomain_block_invoke()
{
  v0 = [MEMORY[0x263EFF9A0] dictionary];
  for (unint64_t i = -1; i != 10; ++i)
  {
    v2 = "default";
    if (i == 9) {
      v3 = "com.apple.runtime-issues";
    }
    else {
      v3 = "ClockKit";
    }
    if (i <= 9) {
      v2 = off_26440E7B0[i];
    }
    os_log_t v4 = os_log_create(v3, v2);
    if (v4)
    {
      v5 = [NSNumber numberWithInteger:i + 1];
      [v0 setObject:v4 forKey:v5];
    }
  }
  v6 = (void *)CLKLoggingObjectForDomain___logObjects;
  CLKLoggingObjectForDomain___logObjects = (uint64_t)v0;
}

uint64_t __CLKInternalBuild_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  CLKInternalBuild_internal = result;
  return result;
}

void __CLKIsNTKDaemon_block_invoke()
{
  v0 = [MEMORY[0x263F08AB0] processInfo];
  id v1 = [v0 processName];

  CLKIsNTKDaemon___isDaemon = [v1 isEqualToString:@"nanotimekitcompaniond"];
}

id CLKComplicationServerInterface()
{
  if (CLKComplicationServerInterface_onceToken != -1) {
    dispatch_once(&CLKComplicationServerInterface_onceToken, &__block_literal_global);
  }
  v0 = (void *)CLKComplicationServerInterface_interface;

  return v0;
}

uint64_t __CLKComplicationServerInterface_block_invoke()
{
  CLKComplicationServerInterface_interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CCE5BA0];

  return MEMORY[0x270F9A758]();
}

id CLKComplicationClientInterface()
{
  if (CLKComplicationClientInterface_onceToken != -1) {
    dispatch_once(&CLKComplicationClientInterface_onceToken, &__block_literal_global_55);
  }
  v0 = (void *)CLKComplicationClientInterface_interface;

  return v0;
}

void __CLKComplicationClientInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CCE8A40];
  id v1 = (void *)CLKComplicationClientInterface_interface;
  CLKComplicationClientInterface_interface = v0;

  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  [(id)CLKComplicationClientInterface_interface setClasses:v19 forSelector:sel_setActiveComplications_ argumentIndex:0 ofReply:0];
  os_log_t v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  [(id)CLKComplicationClientInterface_interface setClasses:v6 forSelector:sel_getTimelineEntriesForComplication_afterDate_limit_withHandler_ argumentIndex:0 ofReply:1];
  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
  [(id)CLKComplicationClientInterface_interface setClasses:v12 forSelector:sel_getComplicationDescriptorsWithHandler_ argumentIndex:0 ofReply:1];
  v13 = (void *)MEMORY[0x263EFFA08];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  [(id)CLKComplicationClientInterface_interface setClasses:v15 forSelector:sel_handleSharedComplicationDescriptors_ argumentIndex:0 ofReply:0];
  v16 = (void *)MEMORY[0x263EFFA08];
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  [(id)CLKComplicationClientInterface_interface setClasses:v18 forSelector:sel_getWidgetMigrationConfigurationFrom_withHandler_ argumentIndex:0 ofReply:1];
}

id CLKDateHandlerAssertionBlock(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  id v9 = a2;
  uint64_t v10 = objc_alloc_init(CLKAssertionBlockSentinel);
  [(CLKAssertionBlockSentinel *)v10 setMessage:v8];

  [(CLKAssertionBlockSentinel *)v10 setFatal:a3];
  [(CLKAssertionBlockSentinel *)v10 setFallbackBlock:v9];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __CLKDateHandlerAssertionBlock_block_invoke;
  v15[3] = &unk_26440D9B8;
  v16 = v10;
  id v17 = v7;
  id v11 = v7;
  v12 = v10;
  v13 = (void *)[v15 copy];

  return v13;
}

void __CLKDateHandlerAssertionBlock_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 markCalled];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id CLKComplicationPrivacyBehaviorAssertionBlock(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  id v9 = a2;
  uint64_t v10 = objc_alloc_init(CLKAssertionBlockSentinel);
  [(CLKAssertionBlockSentinel *)v10 setMessage:v8];

  [(CLKAssertionBlockSentinel *)v10 setFatal:a3];
  [(CLKAssertionBlockSentinel *)v10 setFallbackBlock:v9];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __CLKComplicationPrivacyBehaviorAssertionBlock_block_invoke;
  v15[3] = &unk_26440D9E0;
  v16 = v10;
  id v17 = v7;
  id v11 = v7;
  v12 = v10;
  v13 = (void *)[v15 copy];

  return v13;
}

uint64_t __CLKComplicationPrivacyBehaviorAssertionBlock_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) markCalled];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

id CLKComplicationTemplateAssertionBlock(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  id v9 = a2;
  uint64_t v10 = objc_alloc_init(CLKAssertionBlockSentinel);
  [(CLKAssertionBlockSentinel *)v10 setMessage:v8];

  [(CLKAssertionBlockSentinel *)v10 setFatal:a3];
  [(CLKAssertionBlockSentinel *)v10 setFallbackBlock:v9];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __CLKComplicationTemplateAssertionBlock_block_invoke;
  v15[3] = &unk_26440DA08;
  v16 = v10;
  id v17 = v7;
  id v11 = v7;
  v12 = v10;
  v13 = (void *)[v15 copy];

  return v13;
}

void __CLKComplicationTemplateAssertionBlock_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 markCalled];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id CLKComplicationTimeTravelDirectionsAssertionBlock(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  id v9 = a2;
  uint64_t v10 = objc_alloc_init(CLKAssertionBlockSentinel);
  [(CLKAssertionBlockSentinel *)v10 setMessage:v8];

  [(CLKAssertionBlockSentinel *)v10 setFatal:a3];
  [(CLKAssertionBlockSentinel *)v10 setFallbackBlock:v9];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __CLKComplicationTimeTravelDirectionsAssertionBlock_block_invoke;
  v15[3] = &unk_26440D9E0;
  v16 = v10;
  id v17 = v7;
  id v11 = v7;
  v12 = v10;
  v13 = (void *)[v15 copy];

  return v13;
}

uint64_t __CLKComplicationTimeTravelDirectionsAssertionBlock_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) markCalled];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

id CLKComplicationTimelineAnimationBehaviorBlock(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  id v9 = a2;
  uint64_t v10 = objc_alloc_init(CLKAssertionBlockSentinel);
  [(CLKAssertionBlockSentinel *)v10 setMessage:v8];

  [(CLKAssertionBlockSentinel *)v10 setFatal:a3];
  [(CLKAssertionBlockSentinel *)v10 setFallbackBlock:v9];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __CLKComplicationTimelineAnimationBehaviorBlock_block_invoke;
  v15[3] = &unk_26440D9E0;
  v16 = v10;
  id v17 = v7;
  id v11 = v7;
  v12 = v10;
  v13 = (void *)[v15 copy];

  return v13;
}

uint64_t __CLKComplicationTimelineAnimationBehaviorBlock_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) markCalled];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

id CLKComplicationTimelineEntryAssertionBlock(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  id v9 = a2;
  uint64_t v10 = objc_alloc_init(CLKAssertionBlockSentinel);
  [(CLKAssertionBlockSentinel *)v10 setMessage:v8];

  [(CLKAssertionBlockSentinel *)v10 setFatal:a3];
  [(CLKAssertionBlockSentinel *)v10 setFallbackBlock:v9];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __CLKComplicationTimelineEntryAssertionBlock_block_invoke;
  v15[3] = &unk_26440DA30;
  v16 = v10;
  id v17 = v7;
  id v11 = v7;
  v12 = v10;
  v13 = (void *)[v15 copy];

  return v13;
}

void __CLKComplicationTimelineEntryAssertionBlock_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 markCalled];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id CLKComplicationTimelineEntryArrayAssertionBlock(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  id v9 = a2;
  uint64_t v10 = objc_alloc_init(CLKAssertionBlockSentinel);
  [(CLKAssertionBlockSentinel *)v10 setMessage:v8];

  [(CLKAssertionBlockSentinel *)v10 setFatal:a3];
  [(CLKAssertionBlockSentinel *)v10 setFallbackBlock:v9];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __CLKComplicationTimelineEntryArrayAssertionBlock_block_invoke;
  v15[3] = &unk_26440DA58;
  v16 = v10;
  id v17 = v7;
  id v11 = v7;
  v12 = v10;
  v13 = (void *)[v15 copy];

  return v13;
}

void __CLKComplicationTimelineEntryArrayAssertionBlock_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 markCalled];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id CLKComplicationWidgetMigrationConfigurationAssertionBlock(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  id v9 = a2;
  uint64_t v10 = objc_alloc_init(CLKAssertionBlockSentinel);
  [(CLKAssertionBlockSentinel *)v10 setMessage:v8];

  [(CLKAssertionBlockSentinel *)v10 setFatal:a3];
  [(CLKAssertionBlockSentinel *)v10 setFallbackBlock:v9];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __CLKComplicationWidgetMigrationConfigurationAssertionBlock_block_invoke;
  v15[3] = &unk_26440DA80;
  v16 = v10;
  id v17 = v7;
  id v11 = v7;
  v12 = v10;
  v13 = (void *)[v15 copy];

  return v13;
}

void __CLKComplicationWidgetMigrationConfigurationAssertionBlock_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 markCalled];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_21C5A096C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C5A191C(_Unwind_Exception *a1)
{
}

void sub_21C5A2244(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_21C5A34B4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21C5A392C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21C5A4040(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_21C5A4D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_21C5A55E4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21C5A61BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a72, 8);
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x2A8], 8);
  _Block_object_dispose(&STACK[0x300], 8);
  _Block_object_dispose((const void *)(v72 - 200), 8);
  _Block_object_dispose((const void *)(v72 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21C5A6BB4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21C5A913C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(exception_object);
    v13 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [v12 reason];
      +[CLKComplicationTemplate complicationTemplateWithJSONObjectRepresentation:bundle:purpose:](v14, v11 - 128, v13);
    }

    objc_end_catch();
    JUMPOUT(0x21C5A8DF0);
  }
  _Unwind_Resume(exception_object);
}

void _SquareImageSizeScaled(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, double a6)
{
  id v16 = a1;
  uint64_t v11 = +[CLKRenderingContext sharedRenderingContext];
  id v12 = [v11 device];
  v13 = +[CLKDeviceMetrics metricsWithDevice:v12 identitySizeClass:2];

  [v13 setRoundingBehavior:a2];
  if (a5)
  {
    if (v16) {
      objc_msgSend(v13, "scaledValue:withOverrides:", a6);
    }
    else {
      [v13 scaledValue:a6];
    }
    *a5 = v14;
    a5[1] = v14;
  }
  if (a4)
  {
    if (!a3) {
      [v13 setNewestAllowedSizeClass:&unk_26CCDB6E0];
    }
    if (v16) {
      objc_msgSend(v13, "scaledValue:withOverrides:", a6);
    }
    else {
      [v13 scaledValue:a6];
    }
    *a4 = v15;
    a4[1] = v15;
  }
}

void _ModularLargeImageSize(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6 = +[CLKRenderingContext sharedRenderingContext];
  id v7 = [v6 device];
  id v12 = +[CLKDeviceMetrics metricsWithDevice:v7 identitySizeClass:2];

  if (a3)
  {
    *(double *)a3 = ___ModularLargeImageSize_block_invoke(v8, v12);
    *(void *)(a3 + _Block_object_dispose(&a9, 8) = v9;
  }
  if (a2)
  {
    uint64_t v10 = v12;
    if (!a1)
    {
      uint64_t v8 = [v12 setNewestAllowedSizeClass:&unk_26CCDB6E0];
      uint64_t v10 = v12;
    }
    *(double *)a2 = ___ModularLargeImageSize_block_invoke(v8, v10);
    *(void *)(a2 + _Block_object_dispose(&a9, 8) = v11;
  }
}

void _UtilitarianFlatImageSizeForDevice(void *a1, uint64_t a2, _OWORD *a3, _OWORD *a4)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_UtilitarianFlatImageSizeForDevice___lock);
  id WeakRetained = objc_loadWeakRetained(&_UtilitarianFlatImageSizeForDevice___cachedDevice);
  if (WeakRetained)
  {
    uint64_t v8 = WeakRetained;
    id v9 = objc_loadWeakRetained(&_UtilitarianFlatImageSizeForDevice___cachedDevice);
    if (v9 == obj)
    {
      uint64_t v10 = [obj version];
      uint64_t v11 = _UtilitarianFlatImageSizeForDevice___previousCLKDeviceVersion;

      if (v10 == v11) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v12 = objc_storeWeak(&_UtilitarianFlatImageSizeForDevice___cachedDevice, obj);
  _UtilitarianFlatImageSizeForDevice___previousCLKDeviceVersion = [obj version];

  ___UtilitarianFlatImageSizeForDevice_block_invoke(v13, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_UtilitarianFlatImageSizeForDevice___lock);
  if (a4) {
    *a4 = xmmword_267C8B078;
  }
  if (a3) {
    *a3 = *(_OWORD *)&_UtilitarianFlatImageSizeForDevice__imageSize[2 * a2];
  }
}

void sub_21C5B9940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double CLKComplicationGraphicExtraLargeCircularScalingFactor()
{
  os_unfair_lock_lock((os_unfair_lock_t)&CLKComplicationGraphicExtraLargeCircularScalingFactor___lock);
  id WeakRetained = objc_loadWeakRetained(&CLKComplicationGraphicExtraLargeCircularScalingFactor___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v1 = WeakRetained;
  id v2 = +[CLKDevice currentDevice];
  id v3 = objc_loadWeakRetained(&CLKComplicationGraphicExtraLargeCircularScalingFactor___cachedDevice);
  if (v2 != v3)
  {

LABEL_5:
    id v7 = +[CLKDevice currentDevice];
    objc_storeWeak(&CLKComplicationGraphicExtraLargeCircularScalingFactor___cachedDevice, v7);

    id v8 = objc_loadWeakRetained(&CLKComplicationGraphicExtraLargeCircularScalingFactor___cachedDevice);
    CLKComplicationGraphicExtraLargeCircularScalingFactor___previousCLKDeviceVersion = [v8 version];

    id v9 = +[CLKDevice currentDevice];
    __CLKComplicationGraphicExtraLargeCircularScalingFactor_block_invoke((uint64_t)v9, (uint64_t)v9);

    goto LABEL_6;
  }
  id v4 = +[CLKDevice currentDevice];
  uint64_t v5 = [v4 version];
  uint64_t v6 = CLKComplicationGraphicExtraLargeCircularScalingFactor___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKComplicationGraphicExtraLargeCircularScalingFactor___lock);
  return *(double *)&CLKComplicationGraphicExtraLargeCircularScalingFactor_scalingFactor;
}

void __CLKComplicationGraphicExtraLargeCircularScalingFactor_block_invoke(uint64_t a1, uint64_t a2)
{
  v6[2] = *MEMORY[0x263EF8340];
  id v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v2 setRoundingBehavior:0];
  v5[0] = &unk_26CCDB6E0;
  v5[1] = &unk_26CCDB710;
  v6[0] = &unk_26CCDC378;
  v6[1] = &unk_26CCDC388;
  id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  [v2 constantValue:v3 withOverrides:2.86];
  CLKComplicationGraphicExtraLargeCircularScalingFactor_scalingFactor = v4;
}

uint64_t ComplicationDisplayLibraryCore()
{
  if (!ComplicationDisplayLibraryCore_frameworkLibrary) {
    ComplicationDisplayLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return ComplicationDisplayLibraryCore_frameworkLibrary;
}

uint64_t __ComplicationDisplayLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ComplicationDisplayLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t ComplicationDisplayLibrary()
{
  uint64_t v0 = ComplicationDisplayLibraryCore();
  if (!v0)
  {
    id v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *__getCDGraphicLargeRectangularComplicationSizeSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ComplicationDisplayLibrary();
  uint64_t result = dlsym(v2, "CDGraphicLargeRectangularComplicationSize");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCDGraphicLargeRectangularComplicationSizeSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

void *__getCDGraphicLargeRectangularComplicationInsetSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ComplicationDisplayLibrary();
  uint64_t result = dlsym(v2, "CDGraphicLargeRectangularComplicationInset");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCDGraphicLargeRectangularComplicationInsetSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

void *__getCDGraphicLargeRectangularComplicationLargeImageHeightSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ComplicationDisplayLibrary();
  uint64_t result = dlsym(v2, "CDGraphicLargeRectangularComplicationLargeImageHeight");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCDGraphicLargeRectangularComplicationLargeImageHeightSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                       + 24);
  return result;
}

void *__getCDCircularMediumComplicationDiameterSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ComplicationDisplayLibrary();
  uint64_t result = dlsym(v2, "CDCircularMediumComplicationDiameter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCDCircularMediumComplicationDiameterSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_21C5C33B8(_Unwind_Exception *a1)
{
}

uint64_t _GetNextSegment(void *a1, unint64_t a2, __CFString **a3, unint64_t *a4, void *a5)
{
  id v9 = a1;
  uint64_t v10 = [v9 rangeOfString:@"Ω-♨︎-Д-⚽︎-猫"];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t NextSegment = 0;
  }
  else
  {
    uint64_t v13 = v10;
    uint64_t v14 = v11;
    uint64_t v15 = [MEMORY[0x263F08B08] scannerWithString:v9];
    [v15 setCharactersToBeSkipped:0];
    v25 = &stru_26CCC52F8;
    [v15 scanUpToString:@"Ω-♨︎-Д-⚽︎-猫" intoString:&v25];
    id v16 = v25;
    [v15 scanString:@"Ω-♨︎-Д-⚽︎-猫" intoString:0];
    unint64_t v24 = 0;
    if ([v15 scanInteger:&v24]
      && (v24 & 0x8000000000000000) == 0
      && v24 < a2
      && [v15 scanString:@"止" intoString:0])
    {
      *a4 = v24;
      id v17 = v16;
      *a3 = v17;
      *a5 = [v15 scanLocation];
      uint64_t NextSegment = 1;
    }
    else
    {
      uint64_t v18 = v13 + v14;
      uint64_t v23 = 0;
      id v19 = [v9 substringFromIndex:v18];
      v22 = v16;
      uint64_t NextSegment = _GetNextSegment(v19, a2, &v22, a4, &v23);
      id v17 = v22;

      if (NextSegment)
      {
        v20 = [v9 substringToIndex:v18];
        *a3 = [v20 stringByAppendingString:v17];

        *a5 = v23 + v18;
      }
    }
  }
  return NextSegment;
}

void sub_21C5C4D40(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_21C5C4DD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_0_1(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

uint64_t _EnumerateCalendarUnitsBackwardWithBlock(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  unsigned __int8 v6 = 0;
  uint64_t v4 = 0x38u;
  do
  {
    if ((*(void *)((unsigned char *)&__allAllowedUnits + v4) & ~v3) != 0)
    {
      int v5 = 0;
      if (!v4) {
        return result;
      }
    }
    else
    {
      uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
      int v5 = v6;
      if (!v4) {
        return result;
      }
    }
    v4 -= 8;
  }
  while (!v5);
  return result;
}

void sub_21C5C8864(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21C5C8D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _EnumerateCalendarUnitsWithBlock(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  unint64_t v4 = 0;
  unsigned __int8 v6 = 0;
  do
  {
    if ((__allAllowedUnits[v4] & ~v3) != 0)
    {
      int v5 = 0;
    }
    else
    {
      uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
      int v5 = v6;
    }
    if (v4 > 6) {
      break;
    }
    ++v4;
  }
  while (!v5);
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_1_1(id a1)
{
  return a1;
}

void sub_21C5CD0B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C5CD1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C5CE150(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_21C5CE1E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double CLKValueForDeviceMetrics(void *a1, double a2, double a3, double a4, double a5)
{
  switch([a1 sizeClass])
  {
    case 0:
      return a2;
    case 1:
      a2 = a3;
      break;
    case 2:
    case 4:
    case 7:
      a2 = a4;
      break;
    default:
      a2 = a5;
      break;
  }
  return a2;
}

double CLKSizeForDeviceMetrics(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  switch([a1 sizeClass])
  {
    case 0:
      return a2;
    case 1:
      a2 = a4;
      break;
    case 2:
    case 4:
    case 7:
      a2 = a6;
      break;
    default:
      a2 = a8;
      break;
  }
  return a2;
}

double CLKPointForDeviceMetrics(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  switch([a1 sizeClass])
  {
    case 0:
      return a2;
    case 1:
      a2 = a4;
      break;
    case 2:
    case 4:
    case 7:
      a2 = a6;
      break;
    default:
      a2 = a8;
      break;
  }
  return a2;
}

uint64_t CLKValueForLuxoDeviceMetrics(void *a1)
{
  return [a1 sizeClass];
}

uint64_t CLKScaledValueWithCompactLuxoDeviceMetrics(void *a1, double a2)
{
  id v3 = a1;
  unint64_t v4 = [v3 sizeClass];
  if (v4 > 7) {
    goto LABEL_5;
  }
  if (((1 << v4) & 0x96) != 0) {
    goto LABEL_7;
  }
  if (v4) {
LABEL_5:
  }
    double v5 = 1.13580247;
  else {
    double v5 = 0.839506173;
  }
  a2 = a2 * v5;
LABEL_7:
  [v3 screenScale];
  unint64_t v7 = v6;

  v9.n128_f64[0] = a2;
  v10.n128_u64[0] = v7;

  return MEMORY[0x270F82EF0](v8, v9, v10);
}

uint64_t CLKRoundForDevice(void *a1, double a2)
{
  uint64_t v3 = [a1 screenScale];
  v4.n128_u64[0] = v5.n128_u64[0];
  v5.n128_f64[0] = a2;

  return MEMORY[0x270F82EF0](v3, v5, v4);
}

uint64_t CLKScaledPointWithCompactLuxoDeviceMetrics(void *a1, double a2, double a3)
{
  id v5 = a1;
  CLKScaledValueWithCompactLuxoDeviceMetrics(v5, a2);
  CLKScaledValueWithCompactLuxoDeviceMetrics(v5, a3);
  [v5 screenScale];

  return UIPointRoundToScale();
}

uint64_t CLKPointRoundForDevice(void *a1)
{
  [a1 screenScale];

  return UIPointRoundToScale();
}

uint64_t CLKSizeForLuxoDeviceMetrics(void *a1)
{
  return [a1 sizeClass];
}

uint64_t CLKPointForLuxoDeviceMetrics(void *a1)
{
  return [a1 sizeClass];
}

uint64_t CLKRectCenteredIntegralRectForDevice(void *a1)
{
  return UIRectCenteredIntegralRectScale();
}

uint64_t CLKRectCenteredXInRectForDevice(void *a1)
{
  return UIRectCenteredXInRectScale();
}

uint64_t CLKRectCenteredYInRectForDevice(void *a1)
{
  return UIRectCenteredYInRectScale();
}

uint64_t CLKRectCenteredAboutPointForDevice(void *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  uint64_t v13 = [a1 screenScale];
  v14.n128_u64[0] = v15.n128_u64[0];
  v15.n128_f64[0] = a2;
  v16.n128_f64[0] = a3;
  v17.n128_f64[0] = a4;
  v18.n128_f64[0] = a5;
  v19.n128_f64[0] = a6;
  v20.n128_f64[0] = a7;

  return MEMORY[0x270F82E60](v13, v15, v16, v17, v18, v19, v20, v14);
}

uint64_t CLKRectIntegralForDevice(void *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v9 = [a1 screenScale];
  v10.n128_u64[0] = v11.n128_u64[0];
  v11.n128_f64[0] = a2;
  v12.n128_f64[0] = a3;
  v13.n128_f64[0] = a4;
  v14.n128_f64[0] = a5;

  return MEMORY[0x270F82ED0](v9, v11, v12, v13, v14, v10);
}

uint64_t CLKFloorForDevice(void *a1, double a2)
{
  uint64_t v3 = [a1 screenScale];
  v4.n128_u64[0] = v5.n128_u64[0];
  v5.n128_f64[0] = a2;

  return MEMORY[0x270F82D20](v3, v5, v4);
}

uint64_t CLKCeilForDevice(void *a1, double a2)
{
  uint64_t v3 = [a1 screenScale];
  v4.n128_u64[0] = v5.n128_u64[0];
  v5.n128_f64[0] = a2;

  return MEMORY[0x270F82CB8](v3, v5, v4);
}

uint64_t CLKSizeRoundForDevice(void *a1)
{
  [a1 screenScale];

  return UISizeRoundToScale();
}

BOOL CLKFloatEqualsFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 0.00000011920929;
}

BOOL CLKPointEqualsPoint(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a1, a3) < 0.00000011920929;
  return vabdd_f64(a2, a4) < 0.00000011920929 && v4;
}

BOOL CLKSizeEqualsSize(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a1, a3) < 0.00000011920929;
  return vabdd_f64(a2, a4) < 0.00000011920929 && v4;
}

uint64_t CLKRectEqualsRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  if (CGRectEqualToRect(*(CGRect *)&a1, *(CGRect *)&a5)) {
    return 1;
  }
  double v17 = vabdd_f64(a2, a6);
  if (vabdd_f64(a1, a5) >= 0.00000011920929 || v17 >= 0.00000011920929) {
    return 0;
  }
  BOOL v19 = vabdd_f64(a3, a7) < 0.00000011920929;
  return vabdd_f64(a4, a8) < 0.00000011920929 && v19;
}

BOOL CLKSizeIsEmpty(double a1, double a2)
{
  BOOL v2 = fabs(a1) < 0.00000011920929;
  return fabs(a2) < 0.00000011920929 && v2;
}

double CLKAddPoints(double a1, double a2, double a3)
{
  return a1 + a3;
}

double CLKReversePoint(double a1, double a2)
{
  return a2;
}

double CLKReverseSize(double a1, double a2)
{
  return a2;
}

double CLKReverseVector(double a1, double a2)
{
  return a2;
}

double CLKInterpolateBetweenFloatsClipped(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * fmin(fmax(a3, 0.0), 1.0);
}

double CLKInterpolateBetweenFloatsUnclipped(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * a3;
}

void CLKWrapRadians(long double a1)
{
}

double CLKInterpolateShortestPathBetweenAnglesUnclipped(double a1, double a2, double a3)
{
  double v5 = fmod(a2 - a1 + 3.14159265, 6.28318531) + -3.14159265;
  if (v5 < -3.14159265) {
    double v5 = v5 + 6.28318531;
  }
  return a1 + v5 * a3;
}

double CLKInterpolateShortestPathBetweenAnglesClipped(double a1, double a2, double a3)
{
  double v4 = fmin(fmax(a3, 0.0), 1.0);
  double v5 = fmod(a2 - a1 + 3.14159265, 6.28318531) + -3.14159265;
  if (v5 < -3.14159265) {
    double v5 = v5 + 6.28318531;
  }
  return a1 + v5 * v4;
}

double CLKReverseInterpolateFromFloats(double a1, double a2, double a3)
{
  return fmin(fmax(1.0 / (a2 - a1) * (a3 - a1), 0.0), 1.0);
}

double CLKCompressFraction(double a1, double a2, double a3)
{
  double result = 0.0;
  double v5 = fmin(fmax(a2, 0.0), 1.0);
  double v6 = fmin(fmax(a3, 0.0), 1.0);
  if (v6 < v5) {
    double v6 = v5;
  }
  double v7 = v6 - v5;
  if (v7 != 0.0) {
    return fmin(fmax((fmin(fmax(a1, 0.0), 1.0) - v5) / v7, 0.0), 1.0);
  }
  return result;
}

double CLKMapFractionIntoRange(double a1, double a2, double a3, double a4, double a5)
{
  return (a1 - a2) * (a5 - a4) / (a3 - a2) + a4;
}

double CLKInterpolateBetweenPointsUnclipped(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + (a3 - a1) * a5;
}

double CLKInterpolateBetweenPoints(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + (a3 - a1) * fmin(fmax(a5, 0.0), 1.0);
}

double CLKInterpolateBetweenVectors(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + (a3 - a1) * fmin(fmax(a5, 0.0), 1.0);
}

double CLKInterpolateBetweenSizesUnclipped(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + (a3 - a1) * a5;
}

double CLKInterpolateBetweenSizes(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + (a3 - a1) * fmin(fmax(a5, 0.0), 1.0);
}

double CLKInterpolateBetweenRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a1 + (a5 - a1) * fmin(fmax(a9, 0.0), 1.0);
}

double CLKInterpolateBetweenRectsUnclipped(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a1 + (a5 - a1) * a9;
}

double CLKInterpolateBetweenTransform@<D0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>, double a4@<D0>)
{
  double result = fmin(fmax(a4, 0.0), 1.0);
  float64x2_t v5 = vmlaq_n_f64(a1[1], vsubq_f64(a2[1], a1[1]), result);
  *a3 = vmlaq_n_f64(*a1, vsubq_f64(*a2, *a1), result);
  a3[1] = v5;
  a3[2] = vmlaq_n_f64(a1[2], vsubq_f64(a2[2], a1[2]), result);
  return result;
}

double CLKAlterRect(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + a5;
}

double CLKSmoothStep(double a1)
{
  return a1 * a1 * 3.0 + a1 * a1 * a1 * -2.0;
}

double CLKSecondHalfSmoothStep(double a1)
{
  return a1 * a1 * a1 * (a1 * a1 * a1) * 3.0 + a1 * a1 * a1 * (a1 * a1 * a1 * (a1 * a1 * a1)) * -2.0;
}

double CLKFirstHalfSmoothStep(double a1)
{
  double v1 = (1.0 - a1) * ((1.0 - a1) * (1.0 - a1));
  return 1.0 - (v1 * v1 * 3.0 + v1 * (v1 * v1) * -2.0);
}

uint64_t CLKSizeCenteredAboutPointForDevice(void *a1, double a2, double a3, double a4, double a5)
{
  unint64_t v9 = *MEMORY[0x263F00148];
  unint64_t v10 = *(void *)(MEMORY[0x263F00148] + 8);
  uint64_t v11 = [a1 screenScale];
  v12.n128_u64[0] = v13.n128_u64[0];
  v13.n128_u64[0] = v9;
  v14.n128_u64[0] = v10;
  v15.n128_f64[0] = a2;
  v16.n128_f64[0] = a3;
  v17.n128_f64[0] = a4;
  v18.n128_f64[0] = a5;

  return MEMORY[0x270F82E60](v11, v13, v14, v15, v16, v17, v18, v12);
}

uint64_t CLKSizeCenteredInRectForDevice(void *a1, double a2, double a3)
{
  id v5 = a1;
  UIRectGetCenter();
  unint64_t v7 = v6;
  unint64_t v9 = v8;
  unint64_t v10 = *MEMORY[0x263F00148];
  unint64_t v11 = *(void *)(MEMORY[0x263F00148] + 8);
  [v5 screenScale];
  unint64_t v13 = v12;

  v15.n128_u64[0] = v10;
  v16.n128_u64[0] = v11;
  v17.n128_f64[0] = a2;
  v18.n128_f64[0] = a3;
  v19.n128_u64[0] = v7;
  v20.n128_u64[0] = v9;
  v21.n128_u64[0] = v13;

  return MEMORY[0x270F82E60](v14, v15, v16, v17, v18, v19, v20, v21);
}

double CLKPixelAlignRectForDevice(void *a1, double a2)
{
  [a1 screenScale];
  if (v3 == 0.0) {
    double v4 = 2.0;
  }
  else {
    double v4 = v3;
  }
  return round(a2 * v4) / v4;
}

BOOL CLKRectIsPixelAlignedForDevice(void *a1, double a2, double a3, double a4, double a5)
{
  [a1 screenScale];
  if (v9 == 0.0) {
    double v9 = 2.0;
  }
  return vabdd_f64(a2, round(a2 * v9) / v9) < 0.00000011920929
      && vabdd_f64(a3, round(a3 * v9) / v9) < 0.00000011920929
      && vabdd_f64(a4, round(a4 * v9) / v9) < 0.00000011920929
      && vabdd_f64(a5, round(a5 * v9) / v9) < 0.00000011920929;
}

void CLKFrameFromCenterBoundsAndTransform(uint64_t a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  v24.origin.x = a4;
  v24.origin.y = a5;
  v24.size.width = a6;
  v24.size.height = a7;
  CGFloat v14 = CGRectGetWidth(v24) * -0.5;
  v25.origin.x = a4;
  v25.origin.y = a5;
  v25.size.width = a6;
  v25.size.height = a7;
  CGFloat Height = CGRectGetHeight(v25);
  long long v16 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v22.a = *(_OWORD *)a1;
  *(_OWORD *)&v22.c = v16;
  *(_OWORD *)&v22.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformTranslate(&v23, &v22, v14, Height * -0.5);
  long long v17 = *(_OWORD *)&v23.c;
  *(_OWORD *)a1 = *(_OWORD *)&v23.a;
  *(_OWORD *)(a1 + 16) = v17;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v23.tx;
  *(double *)&long long v17 = a3 + *(double *)(a1 + 40);
  *(double *)(a1 + 32) = a2 + *(double *)(a1 + 32);
  *(void *)(a1 + 40) = v17;
  long long v18 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v23.a = *(_OWORD *)a1;
  *(_OWORD *)&v23.c = v18;
  *(_OWORD *)&v23.tx = *(_OWORD *)(a1 + 32);
  CGFloat v19 = a4;
  *(CGFloat *)&long long v18 = a5;
  CGFloat v20 = a6;
  CGFloat v21 = a7;
  CGRectApplyAffineTransform(*(CGRect *)((char *)&v18 - 8), &v23);
}

double CLKRadiansToDegrees(double a1)
{
  return a1 * 57.2957795;
}

double CLKDegreesToRadians(double a1)
{
  return a1 * 0.0174532925;
}

void CLKClockRadiansToPolarRadians(double a1)
{
}

void CLKPolarRadiansToClockRadians(double a1)
{
}

void CLKNormalizeAngle(long double a1)
{
}

id CLKInterpolateBetweenColors(void *a1, void *a2, double a3)
{
  id v5 = a1;
  id v6 = a2;
  if (CLKEqualObjects(v5, v6))
  {
    id v7 = v5;
  }
  else
  {
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
    double v15 = 0.0;
    double v16 = 0.0;
    double v17 = 0.0;
    double v18 = 0.0;
    [v5 getRed:&v18 green:&v17 blue:&v16 alpha:&v15];
    [v6 getRed:&v14 green:&v13 blue:&v12 alpha:&v11];
    double v8 = fmin(fmax(a3, 0.0), 1.0);
    id v7 = [MEMORY[0x263F825C8] colorWithRed:v18 + (v14 - v18) * v8 green:v17 + (v13 - v17) * v8 blue:v16 + (v12 - v16) * v8 alpha:v15 + (v11 - v15) * v8];
  }
  double v9 = v7;

  return v9;
}

uint64_t CLKDeviceCategoryForSizeClass(unint64_t a1)
{
  if (a1 > 8) {
    return 0;
  }
  else {
    return qword_21C6148B0[a1];
  }
}

uint64_t CLKDeviceUUIDForNRDevice(void *a1, const char *a2)
{
  return [a1 valueForProperty:*MEMORY[0x263F57620]];
}

BOOL CLKDeviceIsNRDevicePaired(void *a1)
{
  double v1 = [a1 valueForProperty:*MEMORY[0x263F57620]];
  BOOL v2 = v1 != 0;

  return v2;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t _isWeekdayDayTemplate(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"EEE d"] & 1) != 0
    || ([v1 isEqualToString:@"EEEE d"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"ccccc d"];
  }

  return v2;
}

uint64_t CLKComplicationFamilyFromString(void *a1, void *a2)
{
  id v3 = a1;
  if (v3
    && (_BoxedComplicationFamiliesByName(),
        double v4 = objc_claimAutoreleasedReturnValue(),
        [v4 objectForKey:v3],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    if (a2) {
      *a2 = [v5 integerValue];
    }

    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

id _BoxedComplicationFamiliesByName()
{
  if (_BoxedComplicationFamiliesByName_onceToken != -1) {
    dispatch_once(&_BoxedComplicationFamiliesByName_onceToken, &__block_literal_global_243);
  }
  uint64_t v0 = (void *)_BoxedComplicationFamiliesByName_complicationFamiliesByName;

  return v0;
}

id CLKStringForComplicationFamily(uint64_t a1)
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__1;
  unint64_t v10 = __Block_byref_object_dispose__1;
  double v11 = @"unknown-family";
  uint64_t v2 = _BoxedComplicationFamiliesByName();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __CLKStringForComplicationFamily_block_invoke;
  v5[3] = &unk_26440E768;
  v5[4] = &v6;
  v5[5] = a1;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_21C5D7C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __CLKStringForComplicationFamily_block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 integerValue] == *(void *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

BOOL CLKIsComplicationFamilySupportedOnDevice(uint64_t a1, void *a2)
{
  return (unint64_t)(a1 - 8) > 4 || objc_msgSend(a2, "deviceCategory", v2, v3) != 1;
}

uint64_t CLKIsClockFaceApp()
{
  if (CLKIsClockFaceApp_onceToken != -1) {
    dispatch_once(&CLKIsClockFaceApp_onceToken, &__block_literal_global_19);
  }
  return CLKIsClockFaceApp___isClockFaceApp;
}

void __CLKIsClockFaceApp_block_invoke()
{
  id v1 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v0 = [v1 bundleIdentifier];
  CLKIsClockFaceApp___isClockFaceApp = [v0 isEqualToString:@"com.apple.clockface"];
}

uint64_t CLKIsBridge()
{
  if (CLKIsBridge_onceToken != -1) {
    dispatch_once(&CLKIsBridge_onceToken, &__block_literal_global_25);
  }
  return CLKIsBridge___result;
}

void __CLKIsBridge_block_invoke()
{
  id v1 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v0 = [v1 bundleIdentifier];
  CLKIsBridge___double result = [v0 isEqualToString:@"com.apple.Bridge"];
}

uint64_t CLKIsCreateWatchFace()
{
  if (CLKIsCreateWatchFace_onceToken != -1) {
    dispatch_once(&CLKIsCreateWatchFace_onceToken, &__block_literal_global_30);
  }
  return CLKIsCreateWatchFace___result;
}

void __CLKIsCreateWatchFace_block_invoke()
{
  id v1 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v0 = [v1 bundleIdentifier];
  CLKIsCreateWatchFace___double result = [v0 isEqualToString:@"com.apple.NanoTimeKit.CreateWatchFace"];
}

uint64_t CLKIsCLKCompanionWatchFaceLibraryServiceProcess()
{
  if (CLKIsCLKCompanionWatchFaceLibraryServiceProcess_onceToken != -1) {
    dispatch_once(&CLKIsCLKCompanionWatchFaceLibraryServiceProcess_onceToken, &__block_literal_global_35);
  }
  return CLKIsCLKCompanionWatchFaceLibraryServiceProcess___result;
}

void __CLKIsCLKCompanionWatchFaceLibraryServiceProcess_block_invoke()
{
  if (CLKInternalBuild())
  {
    uint64_t v0 = [MEMORY[0x263F08AB0] processInfo];
    id v1 = [v0 processName];

    CLKIsCLKCompanionWatchFaceLibraryServiceProcess___double result = [v1 isEqualToString:@"CLKCompanionWatchFaceLibraryService"];
  }
  else
  {
    CLKIsCLKCompanionWatchFaceLibraryServiceProcess___double result = 0;
  }
}

uint64_t CLKIsNTKCLITool()
{
  if (CLKIsNTKCLITool_onceToken != -1) {
    dispatch_once(&CLKIsNTKCLITool_onceToken, &__block_literal_global_41);
  }
  return CLKIsNTKCLITool___result;
}

void __CLKIsNTKCLITool_block_invoke()
{
  if (CLKInternalBuild())
  {
    uint64_t v0 = [MEMORY[0x263F08AB0] processInfo];
    id v1 = [v0 processName];

    CLKIsNTKCLITool___double result = [v1 isEqualToString:@"NTKCLITool"];
  }
  else
  {
    CLKIsNTKCLITool___double result = 0;
  }
}

uint64_t CLKIsNTKXCTests()
{
  if (CLKIsNTKXCTests_onceToken != -1) {
    dispatch_once(&CLKIsNTKXCTests_onceToken, &__block_literal_global_46);
  }
  return CLKIsNTKXCTests___result;
}

void __CLKIsNTKXCTests_block_invoke()
{
  if (CLKInternalBuild())
  {
    uint64_t v0 = [MEMORY[0x263F08AB0] processInfo];
    id v2 = [v0 processName];

    if ([v2 isEqualToString:@"xctest"]) {
      char v1 = 1;
    }
    else {
      char v1 = [v2 isEqualToString:@"NanoTimeKitTests-Runner"];
    }
    CLKIsNTKXCTests___double result = v1;
  }
  else
  {
    CLKIsNTKXCTests___double result = 0;
  }
}

uint64_t CLKIsGreenfieldTool()
{
  if (CLKIsGreenfieldTool_onceToken != -1) {
    dispatch_once(&CLKIsGreenfieldTool_onceToken, &__block_literal_global_54_0);
  }
  return CLKIsGreenfieldTool___result;
}

void __CLKIsGreenfieldTool_block_invoke()
{
  if (CLKInternalBuild())
  {
    uint64_t v0 = [MEMORY[0x263F08AB0] processInfo];
    id v1 = [v0 processName];

    CLKIsGreenfieldTool___double result = [v1 isEqualToString:@"GreenfieldTool"];
  }
  else
  {
    CLKIsGreenfieldTool___double result = 0;
  }
}

uint64_t CLKIsNTKDaemon()
{
  if (CLKIsNTKDaemon_onceToken != -1) {
    dispatch_once(&CLKIsNTKDaemon_onceToken, &__block_literal_global_59);
  }
  return CLKIsNTKDaemon___isDaemon;
}

uint64_t CLKIsFaceSnapshotService()
{
  if (CLKIsFaceSnapshotService_onceToken != -1) {
    dispatch_once(&CLKIsFaceSnapshotService_onceToken, &__block_literal_global_64);
  }
  return CLKIsFaceSnapshotService___isFaceSnapshotService;
}

void __CLKIsFaceSnapshotService_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08AB0] processInfo];
  id v2 = [v0 processName];

  if ([v2 isEqualToString:@"NTKFaceSnapshotService"]) {
    char v1 = 1;
  }
  else {
    char v1 = [v2 isEqualToString:@"NTKComplicationSnapshotService"];
  }
  CLKIsFaceSnapshotService___isFaceSnapshotService = v1;
}

uint64_t CLKIsUVPreviewApp()
{
  if (CLKIsUVPreviewApp_onceToken != -1) {
    dispatch_once(&CLKIsUVPreviewApp_onceToken, &__block_literal_global_72);
  }
  return CLKIsUVPreviewApp___isUVPreview;
}

void __CLKIsUVPreviewApp_block_invoke()
{
  id v3 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v0 = [v3 bundleIdentifier];
  if ([v0 isEqualToString:@"com.apple.dt.XcodePreviews"])
  {
    CLKIsUVPreviewApp___isUVPreview = 1;
  }
  else
  {
    char v1 = [MEMORY[0x263F086E0] mainBundle];
    id v2 = [v1 bundleIdentifier];
    CLKIsUVPreviewApp___isUVPreview = [v2 isEqualToString:@"com.apple.PreviewShell"];
  }
}

uint64_t CLKIsBeingDebugged()
{
  pid_t v0 = getpid();

  return CLKPIDIsBeingDebugged(v0);
}

uint64_t CLKPIDIsBeingDebugged(int a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  memset(v3, 0, sizeof(v3));
  LODWORD(v4) = 0;
  *(void *)v34 = 0xE00000001;
  int v35 = 1;
  int v36 = a1;
  size_t v2 = 648;
  if (sysctl(v34, 4u, v3, &v2, 0, 0)) {
    CLKPIDIsBeingDebugged_cold_1();
  }
  return (v4 >> 11) & 1;
}

BOOL CLKIsValidComplicationDynamicFontSize(unint64_t a1)
{
  return a1 < 5;
}

BOOL CLKIsValidComplicationColumnAlignment(unint64_t a1)
{
  return a1 < 2;
}

BOOL CLKIsValidComplicationRingStyle(unint64_t a1)
{
  return a1 < 2;
}

BOOL CLKIsValidForegroundHighlightMode(unint64_t a1)
{
  return a1 < 3;
}

__CFString *CLKComplicationFamilyDescription(unint64_t a1)
{
  if (a1 > 0xC) {
    return &stru_26CCC52F8;
  }
  else {
    return off_26440E800[a1];
  }
}

uint64_t CLKComplicationIconAssetName(unint64_t a1)
{
  if (a1 > 0xC) {
    return 0;
  }
  else {
    return (uint64_t)*(&off_26440E868 + a1);
  }
}

NSArray *CLKAllComplicationFamilies(void)
{
  return (NSArray *)&unk_26CCDC5E8;
}

double _CLKWidgetGroupHorizontalMargin(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_CLKWidgetGroupHorizontalMargin___lock);
  id WeakRetained = objc_loadWeakRetained(&_CLKWidgetGroupHorizontalMargin___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&_CLKWidgetGroupHorizontalMargin___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&_CLKWidgetGroupHorizontalMargin___cachedDevice, v1);
    _CLKWidgetGroupHorizontalMargin___previousCLKDeviceVersion = [v1 version];

    ___CLKWidgetGroupHorizontalMargin_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = _CLKWidgetGroupHorizontalMargin___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_CLKWidgetGroupHorizontalMargin___lock);
  double v9 = *(double *)&_CLKWidgetGroupHorizontalMargin__widgeGroupHorizontalMargin;

  return v9;
}

double _CLKWidgetGroupBottomMargin(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_CLKWidgetGroupBottomMargin___lock);
  id WeakRetained = objc_loadWeakRetained(&_CLKWidgetGroupBottomMargin___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&_CLKWidgetGroupBottomMargin___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&_CLKWidgetGroupBottomMargin___cachedDevice, v1);
    _CLKWidgetGroupBottomMargin___previousCLKDeviceVersion = [v1 version];

    ___CLKWidgetGroupBottomMargin_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = _CLKWidgetGroupBottomMargin___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_CLKWidgetGroupBottomMargin___lock);
  double v9 = *(double *)&_CLKWidgetGroupBottomMargin__widgeGroupBottomMargin;

  return v9;
}

double CLKWidgetGroupSafeAreaInsets(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CLKWidgetGroupSafeAreaInsets___lock);
  id WeakRetained = objc_loadWeakRetained(&CLKWidgetGroupSafeAreaInsets___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CLKWidgetGroupSafeAreaInsets___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CLKWidgetGroupSafeAreaInsets___cachedDevice, v1);
    CLKWidgetGroupSafeAreaInsets___previousCLKDeviceVersion = [v1 version];

    __CLKWidgetGroupSafeAreaInsets_block_invoke(v8, v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CLKWidgetGroupSafeAreaInsets___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKWidgetGroupSafeAreaInsets___lock);
  double v9 = *(double *)&CLKWidgetGroupSafeAreaInsets__safeAreaInsets_0;

  return v9;
}

void __CLKWidgetGroupSafeAreaInsets_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v7 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  [v7 scaledValue:6.0];
  uint64_t v4 = v3;
  uint64_t v5 = _CLKWidgetGroupHorizontalMargin(v2);
  double v6 = _CLKWidgetGroupBottomMargin(v2);

  CLKWidgetGroupSafeAreaInsets__safeAreaInsets_0 = v4;
  CLKWidgetGroupSafeAreaInsets__safeAreaInsets_1 = v5;
  CLKWidgetGroupSafeAreaInsets__safeAreaInsets_2 = *(void *)&v6;
  CLKWidgetGroupSafeAreaInsets__safeAreaInsets_3 = v5;
}

double CLKWidgetGroupNestedContentDiameter(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CLKWidgetGroupNestedContentDiameter___lock);
  id WeakRetained = objc_loadWeakRetained(&CLKWidgetGroupNestedContentDiameter___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CLKWidgetGroupNestedContentDiameter___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CLKWidgetGroupNestedContentDiameter___cachedDevice, v1);
    CLKWidgetGroupNestedContentDiameter___previousCLKDeviceVersion = [v1 version];

    __CLKWidgetGroupNestedContentDiameter_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CLKWidgetGroupNestedContentDiameter___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKWidgetGroupNestedContentDiameter___lock);
  double v9 = *(double *)&CLKWidgetGroupNestedContentDiameter__diameter;

  return v9;
}

void __CLKWidgetGroupNestedContentDiameter_block_invoke(uint64_t a1, uint64_t a2)
{
  v6[6] = *MEMORY[0x263EF8340];
  id v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v2 setRoundingBehavior:2];
  v5[0] = &unk_26CCDBF08;
  v5[1] = &unk_26CCDBF20;
  v6[0] = &unk_26CCDC458;
  v6[1] = &unk_26CCDC468;
  void v5[2] = &unk_26CCDBF38;
  v5[3] = &unk_26CCDBF50;
  v6[2] = &unk_26CCDC478;
  void v6[3] = &unk_26CCDC478;
  v5[4] = &unk_26CCDBF68;
  v5[5] = &unk_26CCDBF80;
  v6[4] = &unk_26CCDC458;
  v6[5] = &unk_26CCDC488;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:6];
  [v2 scaledValue:v3 withOverrides:42.0];
  CLKWidgetGroupNestedContentDiameter__diameter = v4;
}

double CLKWidgetGroupSquareContentCornerRadius(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CLKWidgetGroupSquareContentCornerRadius___lock);
  id WeakRetained = objc_loadWeakRetained(&CLKWidgetGroupSquareContentCornerRadius___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CLKWidgetGroupSquareContentCornerRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CLKWidgetGroupSquareContentCornerRadius___cachedDevice, v1);
    CLKWidgetGroupSquareContentCornerRadius___previousCLKDeviceVersion = [v1 version];

    __CLKWidgetGroupSquareContentCornerRadius_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CLKWidgetGroupSquareContentCornerRadius___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKWidgetGroupSquareContentCornerRadius___lock);
  double v9 = *(double *)&CLKWidgetGroupSquareContentCornerRadius__cornerRadius;

  return v9;
}

void __CLKWidgetGroupSquareContentCornerRadius_block_invoke(uint64_t a1, uint64_t a2)
{
  v6[6] = *MEMORY[0x263EF8340];
  id v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  v5[0] = &unk_26CCDBF08;
  v5[1] = &unk_26CCDBF20;
  v6[0] = &unk_26CCDC408;
  v6[1] = &unk_26CCDC408;
  void v5[2] = &unk_26CCDBF38;
  v5[3] = &unk_26CCDBF50;
  v6[2] = &unk_26CCDC498;
  void v6[3] = &unk_26CCDC498;
  v5[4] = &unk_26CCDBF68;
  v5[5] = &unk_26CCDBF80;
  v6[4] = &unk_26CCDC408;
  v6[5] = &unk_26CCDC498;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:6];
  [v2 scaledValue:v3 withOverrides:3.0];
  CLKWidgetGroupSquareContentCornerRadius__cornerRadius = v4;
}

id _AlternatePunctuationAttributes()
{
  if (_AlternatePunctuationAttributes_onceToken != -1) {
    dispatch_once(&_AlternatePunctuationAttributes_onceToken, &__block_literal_global_11);
  }
  pid_t v0 = (void *)_AlternatePunctuationAttributes___altPunctAttr;

  return v0;
}

void sub_21C5DAAB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_21C5DAD38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_21C5DD5A8(_Unwind_Exception *a1)
{
}

double CLKContrastRatioForColors(void *a1, void *a2)
{
  id v3 = a2;
  double v4 = _CLKRelativeLuminanceForColor(a1);
  double v5 = _CLKRelativeLuminanceForColor(v3);

  if (v4 >= v5) {
    double v6 = v4;
  }
  else {
    double v6 = v5;
  }
  double v7 = v6 + 0.05;
  if (v4 >= v5) {
    double v8 = v5;
  }
  else {
    double v8 = v4;
  }
  return v7 / (v8 + 0.05);
}

double _CLKRelativeLuminanceForColor(void *a1)
{
  double v7 = 0.0;
  double v8 = 0.0;
  uint64_t v5 = 0;
  double v6 = 0.0;
  [a1 getRed:&v8 green:&v7 blue:&v6 alpha:&v5];
  if (v8 <= 0.03928) {
    double v1 = v8 / 12.92;
  }
  else {
    double v1 = pow((v8 + 0.055) / 1.055, 2.4);
  }
  if (v7 <= 0.03928) {
    double v2 = v7 / 12.92;
  }
  else {
    double v2 = pow((v7 + 0.055) / 1.055, 2.4);
  }
  if (v6 <= 0.03928) {
    double v3 = v6 / 12.92;
  }
  else {
    double v3 = pow((v6 + 0.055) / 1.055, 2.4);
  }
  return v2 * 0.7152 + v1 * 0.2126 + v3 * 0.0722;
}

BOOL CLKIsBlackColor(void *a1)
{
  double v4 = 0.0;
  double v2 = 0.0;
  double v3 = 0.0;
  [a1 getRed:&v4 green:&v3 blue:&v2 alpha:0];
  BOOL result = 0;
  if (v4 == 0.0 && v3 == 0.0) {
    return v2 == 0.0;
  }
  return result;
}

void sub_21C5DE5D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C5DE710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C5DE850(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C5DE98C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C5DEAC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C5DF74C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

__n128 __copy_helper_block_e8_48n12_8_8_s0_t8w32(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 4_Block_object_dispose(&a9, 8) = *(id *)(a2 + 48);
  __n128 result = *(__n128 *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(__n128 *)(a1 + 72) = result;
  return result;
}

void __destroy_helper_block_e8_48n4_8_s0(uint64_t a1)
{
}

void CLKClockTimerDateForNow(uint64_t a1@<X8>)
{
  id v2 = +[CLKClockTimer now];
  CLKClockTimerDateForDate(v2, a1);
}

double CLKClockTimerDateForDate@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = a1;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  double v4 = [MEMORY[0x263EFF8F0] currentCalendar];
  [v4 getHour:&v12 minute:&v11 second:&v10 nanosecond:&v9 fromDate:v3];

  double v5 = (double)v9;
  uint64_t v6 = v12;
  *(void *)a2 = v3;
  *(void *)(a2 + _Block_object_dispose(&a9, 8) = v6;
  uint64_t v7 = v10;
  double result = v5 / 1000000000.0;
  *(void *)(a2 + 16) = v11;
  *(void *)(a2 + 24) = v7;
  *(double *)(a2 + 32) = result;
  return result;
}

void CLKClockTimerDateConvertTo12Hour(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v4 = *(void **)a1;
  unint64_t v5 = *(void *)(a1 + 8) % 0xCuLL;
  if (!v5) {
    unint64_t v5 = 12;
  }
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = v5;
  *(void *)a2 = v4;
  *(_OWORD *)(a2 + _Block_object_dispose(&a9, 8) = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  uint64_t v6 = *(void **)a1;
}

id _CLKFormatTimeIntervalSeconds(unsigned char *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long double a9, char a10)
{
  long long v15 = +[_CLKTimeFormatData instanceForCurrentLocale];
  +[_CLKTimeFormatSentinel listenForLocaleChangesIfNecessary];
  id v16 = v15;
  double v17 = fmod(a9, 1.0);
  unint64_t v18 = (unint64_t)a9;
  unint64_t v19 = (unint64_t)a9 / 0x3C;
  if ((unint64_t)a9 > 0xE0F) {
    int v20 = 1;
  }
  else {
    int v20 = a2;
  }
  long long v21 = [v16 singleWidthNumberFormatter];
  if (a6)
  {
    uint64_t v22 = [v16 doubleWidthNumberFormatter];

    long long v21 = (void *)v22;
  }
  int v57 = a8;
  if (v20)
  {
    long long v23 = [NSNumber numberWithUnsignedInteger:v18 / 0xE10];
    long long v24 = [v21 stringFromNumber:v23];
  }
  else
  {
    long long v24 = &stru_26CCC52F8;
    if (!a5) {
      goto LABEL_10;
    }
  }
  uint64_t v25 = [v16 doubleWidthNumberFormatter];

  long long v21 = (void *)v25;
LABEL_10:
  long long v26 = [NSNumber numberWithUnsignedInteger:v19 - 60 * ((unint64_t)((v19 * (unsigned __int128)0x888888888888889uLL) >> 64) >> 1)];
  long long v27 = [v21 stringFromNumber:v26];

  if (a4)
  {
    unint64_t v28 = v18 - 60 * v19;
    long long v29 = [v16 doubleWidthNumberFormatter];
    long long v30 = [NSNumber numberWithUnsignedInteger:v28];
    long long v31 = [v29 stringFromNumber:v30];
  }
  else
  {
    long long v31 = &stru_26CCC52F8;
  }
  if (a3)
  {
    long long v32 = [v16 doubleWidthNumberFormatter];
    long long v33 = [NSNumber numberWithUnsignedInteger:(unint64_t)(v17 * 100.0)];
    v34 = [v32 stringFromNumber:v33];
  }
  else
  {
    v34 = &stru_26CCC52F8;
  }
  int v35 = v24;
  id v36 = v27;
  uint64_t v37 = v31;
  v38 = v34;

  v39 = v35;
  id v40 = v36;
  v41 = v37;
  v42 = v38;
  if (v20)
  {
    if (!a4 || a7)
    {
      uint64_t v43 = [v16 formatHourMin];
    }
    else
    {
      if (a3) {
        [v16 formatHourMinSecSubsec];
      }
      else {
      uint64_t v43 = [v16 formatHourMinSec];
      }
    }
  }
  else if (a4)
  {
    if (a7 || (a3 & 1) == 0)
    {
      uint64_t v43 = [v16 formatMinSec];
    }
    else
    {
      uint64_t v43 = [v16 formatMinSecSubsec];
    }
  }
  else
  {
    uint64_t v43 = [v16 formatMin];
  }
  v44 = (void *)v43;
  if (a1) {
    *a1 = v20;
  }
  if ((v20 & 1) == 0)
  {
    uint64_t v45 = [NSString stringWithFormat:@"HH%@", v43];

    v44 = (void *)v45;
  }
  v46 = [v44 stringByReplacingOccurrencesOfString:@"HH" withString:@"%1$@"];

  v47 = [v46 stringByReplacingOccurrencesOfString:@"H" withString:@"%1$@"];

  v48 = [v47 stringByReplacingOccurrencesOfString:@"mm" withString:@"%2$@"];

  v49 = [v48 stringByReplacingOccurrencesOfString:@"m" withString:@"%2$@"];

  v50 = [v49 stringByReplacingOccurrencesOfString:@"ss" withString:@"%3$@"];

  v51 = [v50 stringByReplacingOccurrencesOfString:@"SS" withString:@"%4$@"];

  if (v57)
  {
    if ([(__CFString *)v42 length])
    {

      v42 = @"−−";
    }
    if (a9 >= 60.0 && [(__CFString *)v41 length] && (a10 & 1) == 0)
    {

      v41 = @"−−";
    }
  }
  v52 = objc_msgSend(NSString, "stringWithFormat:", v51, v39, v40, v41, v42);

  return v52;
}

id CLKFormatTimeIntervalSecondsForLowFidelity(int a1, unsigned char *a2, int a3, int a4, int a5, int a6, long double a7)
{
  return _CLKFormatTimeIntervalSeconds(a2, a1, a3, a4, 0, a5, a6, 1, a7, 0);
}

id CLKFormatTimeIntervalSecondsForLowerFidelity(int a1, unsigned char *a2, int a3, int a4, int a5, int a6, long double a7)
{
  return _CLKFormatTimeIntervalSeconds(a2, a1, a3, a4, 0, a5, a6, 1, a7, 1);
}

id CLKFormatTimeIntervalSeconds(int a1, unsigned char *a2, int a3, int a4, int a5, int a6, long double a7)
{
  return _CLKFormatTimeIntervalSeconds(a2, a1, a3, a4, 0, a5, a6, 0, a7, 0);
}

id CLKFormatTimeInterval(unsigned char *a1, int a2, int a3, int a4, long double a5)
{
  return _CLKFormatTimeIntervalSeconds(a1, 0, a2, 1, 0, a3, a4, 0, a5, 0);
}

id CLKFormatTimeIntervalFull(int a1, int a2, int a3, long double a4)
{
  return _CLKFormatTimeIntervalSeconds(0, a1, a2, 1, a3, a3, 0, 0, a4, 0);
}

id _MonospaceNumbersFeatureSettings()
{
  v6[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F83530];
  v5[0] = *MEMORY[0x263F83548];
  v5[1] = v0;
  v6[0] = &unk_26CCDC058;
  v6[1] = &unk_26CCDC070;
  double v1 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  double v4 = v1;
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:1];

  return v2;
}

id _StylisticSet(uint64_t a1)
{
  v8[2] = *MEMORY[0x263EF8340];
  if ((unint64_t)(a1 - 21) >= 0xFFFFFFFFFFFFFFECLL)
  {
    uint64_t v2 = *MEMORY[0x263F83530];
    v7[0] = *MEMORY[0x263F83548];
    v7[1] = v2;
    v8[0] = &unk_26CCDBFF8;
    id v3 = [NSNumber numberWithUnsignedInteger:2 * a1];
    v8[1] = v3;
    double v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

    uint64_t v6 = v4;
    double v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:1];
  }
  else
  {
    double v1 = (void *)MEMORY[0x263EFFA68];
  }

  return v1;
}

double CLKKernValueForDesignSpecTrackingValue(void *a1, double a2)
{
  id v3 = a1;
  double v4 = a2 / (double)CTFontGetUnitsPerEm(v3);
  [(__CTFont *)v3 pointSize];
  double v6 = v5;

  return v6 * v4;
}

void sub_21C5E43E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_21C5E446C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _ForceDateFormatterLocaleToUseNumberSystem(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)MEMORY[0x263EFF960];
  id v4 = a1;
  double v5 = [v4 locale];
  double v6 = [v5 localeIdentifier];
  uint64_t v7 = [v3 componentsFromLocaleIdentifier:v6];
  id v11 = (id)[v7 mutableCopy];

  double v8 = CLKLocaleNumberSystemIdentifier(a2);
  [v11 setObject:v8 forKeyedSubscript:@"numbers"];

  uint64_t v9 = [MEMORY[0x263EFF960] localeIdentifierFromComponents:v11];
  uint64_t v10 = (const void *)_CFLocaleCopyAsIfCurrent();
  [v4 setLocale:v10];

  CFRelease(v10);
}

id _BasicTimeFormat()
{
  uint64_t v0 = (void *)MEMORY[0x263F08790];
  double v1 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v2 = [v0 dateFormatFromTemplate:@"j:mm" options:0 locale:v1];

  return v2;
}

void sub_21C5E5A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

id CLKActiveComplicationsFromActivePairedDevice()
{
  uint64_t v0 = +[CLKDevice activeNRDevice];
  double v1 = CLKActiveComplicationsFromPairedDevice(v0);

  return v1;
}

id CLKActiveComplicationsFromPairedDevice(void *a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(id))getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
  uint64_t v22 = getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
  if (!getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getNRWatchOSVersionForRemoteDeviceSymbolLoc_block_invoke;
    long long v24 = (__CFString *)&unk_26440E380;
    uint64_t v25 = &v19;
    uint64_t v3 = (void *)NanoRegistryLibrary();
    id v4 = dlsym(v3, "NRWatchOSVersionForRemoteDevice");
    *(void *)(v25[1] + 24) = v4;
    getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr = *(_UNKNOWN **)(v25[1] + 24);
    uint64_t v2 = (uint64_t (*)(id))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v2) {
    goto LABEL_20;
  }
  uint64_t v5 = v2(v1);

  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x2020000000;
  double v6 = (uint64_t (*)(uint64_t, uint64_t))getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr;
  uint64_t v22 = getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr;
  if (!getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getNRVersionIsGreaterThanOrEqualSymbolLoc_block_invoke;
    long long v24 = (__CFString *)&unk_26440E380;
    uint64_t v25 = &v19;
    uint64_t v7 = (void *)NanoRegistryLibrary();
    double v8 = dlsym(v7, "NRVersionIsGreaterThanOrEqual");
    *(void *)(v25[1] + 24) = v8;
    getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr = *(_UNKNOWN **)(v25[1] + 24);
    double v6 = (uint64_t (*)(uint64_t, uint64_t))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v6)
  {
LABEL_20:
    __101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    __break(1u);
  }
  int v9 = v6(v5, 0x40000);
  if (v9) {
    uint64_t v10 = @"CLKActiveComplications";
  }
  else {
    uint64_t v10 = @"activeComplications";
  }
  if (v9) {
    id v11 = @"com.apple.ClockKit.activeComplications";
  }
  else {
    id v11 = @"com.apple.sockpuppet.activeComplications";
  }
  uint64_t v12 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v1;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    long long v24 = v10;
    _os_log_impl(&dword_21C599000, v12, OS_LOG_TYPE_DEFAULT, "Retrieving active complication list from NPS for (%@). domain=%@ key=%@", buf, 0x20u);
  }

  id v13 = objc_alloc((Class)getNPSDomainAccessorClass());
  long long v14 = objc_msgSend(v13, "initWithDomain:pairedDevice:", v11, v1, v19);
  id v15 = (id)[v14 synchronize];
  id v16 = [v14 objectForKey:v10];
  double v17 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = @"CLKActiveComplications";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    _os_log_impl(&dword_21C599000, v17, OS_LOG_TYPE_DEFAULT, "Retrieved NPS %@ (%@)", buf, 0x16u);
  }

  return v16;
}

void sub_21C5E64D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

id getNPSDomainAccessorClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getNPSDomainAccessorClass_softClass;
  uint64_t v7 = getNPSDomainAccessorClass_softClass;
  if (!getNPSDomainAccessorClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    _OWORD v3[2] = __getNPSDomainAccessorClass_block_invoke;
    v3[3] = &unk_26440E380;
    v3[4] = &v4;
    __getNPSDomainAccessorClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_21C5E65C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CLKSetActiveComplicationsForLocalDevice(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = @"CLKActiveComplications";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v1;
    _os_log_impl(&dword_21C599000, v2, OS_LOG_TYPE_DEFAULT, "Setting NPS %@ to (%@)", buf, 0x16u);
  }

  uint64_t v3 = (void *)[objc_alloc((Class)getNPSDomainAccessorClass()) initWithDomain:@"com.apple.ClockKit.activeComplications"];
  [v3 setObject:v1 forKey:@"CLKActiveComplications"];
  id v4 = (id)[v3 synchronize];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2050000000;
  uint64_t v5 = (void *)getNPSManagerClass_softClass;
  uint64_t v12 = getNPSManagerClass_softClass;
  if (!getNPSManagerClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getNPSManagerClass_block_invoke;
    long long v14 = &unk_26440E380;
    id v15 = &v9;
    __getNPSManagerClass_block_invoke((uint64_t)buf);
    uint64_t v5 = (void *)v10[3];
  }
  uint64_t v6 = v5;
  _Block_object_dispose(&v9, 8);
  id v7 = objc_alloc_init(v6);
  double v8 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", @"CLKActiveComplications", v9);
  [v7 synchronizeUserDefaultsDomain:@"com.apple.ClockKit.activeComplications" keys:v8 cloudEnabled:1];
}

void sub_21C5E67BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *__getNRWatchOSVersionForRemoteDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)NanoRegistryLibrary();
  double result = dlsym(v2, "NRWatchOSVersionForRemoteDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t NanoRegistryLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    _OWORD v3[2] = 3221225472;
    v3[3] = __NanoRegistryLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26440EC20;
    uint64_t v5 = 0;
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = NanoRegistryLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __NanoRegistryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoRegistryLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getNRVersionIsGreaterThanOrEqualSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRVersionIsGreaterThanOrEqual");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __getNPSDomainAccessorClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("NPSDomainAccessor");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getNPSDomainAccessorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getNPSDomainAccessorClass_block_invoke_cold_1();
    NanoPreferencesSyncLibrary();
  }
}

void NanoPreferencesSyncLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __NanoPreferencesSyncLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_26440EC38;
    uint64_t v3 = 0;
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __NanoPreferencesSyncLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoPreferencesSyncLibraryCore_frameworkLibrary = result;
  return result;
}

CLKFullColorSymbolImageProvider *__getNPSManagerClass_block_invoke(uint64_t a1)
{
  NanoPreferencesSyncLibrary();
  uint64_t result = (CLKFullColorSymbolImageProvider *)objc_getClass("NPSManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getNPSManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (CLKFullColorSymbolImageProvider *)__getNPSManagerClass_block_invoke_cold_1();
    return [(CLKFullColorSymbolImageProvider *)v3 initWithSystemName:v5];
  }
  return result;
}

void sub_21C5E9C80(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_21C5E9D20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C5E9DE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C5E9EA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C5EB4E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_21C5EB770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id _AssetBundleSuffixesForSizeClass()
{
  uint64_t v0 = [MEMORY[0x263EFF980] arrayWithObject:&stru_26CCC52F8];
  [v0 addObject:@"-sunscreen"];

  return v0;
}

void sub_21C5ED414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C5ED990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _ValidateTemplate(void *a1, uint64_t a2)
{
  id v3 = a1;
  SEL v4 = v3;
  if (v3)
  {
    if ([v3 isCompatibleWithFamily:a2])
    {
      uint64_t v5 = [v4 validateWithError:0];
    }
    else
    {
      uint64_t v6 = CLKLoggingObjectForDomain(10);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        _ValidateTemplate_cold_1(a2, v4, v6);
      }

      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

uint64_t _ValidateEntry(void *a1, uint64_t a2)
{
  id v3 = a1;
  if ([v3 validateWithError:0]) {
    uint64_t v4 = [v3 validateComplicationFamily:a2];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t _ValidateEntries(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = ___ValidateEntries_block_invoke;
  void v6[3] = &unk_26440EFB8;
  v6[4] = &v7;
  v6[5] = a2;
  [v3 enumerateObjectsUsingBlock:v6];
  uint64_t v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void sub_21C5EFA20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id CLKget_AVAudioSessionMediaServicesWereResetNotification()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAVAudioSessionMediaServicesWereResetNotificationSymbolLoc_ptr;
  uint64_t v8 = getAVAudioSessionMediaServicesWereResetNotificationSymbolLoc_ptr;
  if (!getAVAudioSessionMediaServicesWereResetNotificationSymbolLoc_ptr)
  {
    id v1 = (void *)AVFoundationLibrary();
    void v6[3] = (uint64_t)dlsym(v1, "AVAudioSessionMediaServicesWereResetNotification");
    getAVAudioSessionMediaServicesWereResetNotificationSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  long long v2 = *v0;

  return v2;
}

__n128 CLKget_kCMTimeZero@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  long long v2 = (__n128 *)getkCMTimeZeroSymbolLoc_ptr;
  uint64_t v9 = getkCMTimeZeroSymbolLoc_ptr;
  if (!getkCMTimeZeroSymbolLoc_ptr)
  {
    id v3 = (void *)CoreMediaLibrary();
    v7[3] = (uint64_t)dlsym(v3, "kCMTimeZero");
    getkCMTimeZeroSymbolLoc_ptr = v7[3];
    long long v2 = (__n128 *)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    uint64_t v5 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  __n128 result = *v2;
  *a1 = *v2;
  a1[1].n128_u64[0] = v2[1].n128_u64[0];
  return result;
}

__n128 CLKget_kCMTimeInvalid@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  long long v2 = (__n128 *)getkCMTimeInvalidSymbolLoc_ptr;
  uint64_t v9 = getkCMTimeInvalidSymbolLoc_ptr;
  if (!getkCMTimeInvalidSymbolLoc_ptr)
  {
    id v3 = (void *)CoreMediaLibrary();
    v7[3] = (uint64_t)dlsym(v3, "kCMTimeInvalid");
    getkCMTimeInvalidSymbolLoc_ptr = v7[3];
    long long v2 = (__n128 *)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    uint64_t v5 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  __n128 result = *v2;
  *a1 = *v2;
  a1[1].n128_u64[0] = v2[1].n128_u64[0];
  return result;
}

__n128 getkCMTimePositiveInfinity@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  long long v2 = (__n128 *)getkCMTimePositiveInfinitySymbolLoc_ptr;
  uint64_t v9 = getkCMTimePositiveInfinitySymbolLoc_ptr;
  if (!getkCMTimePositiveInfinitySymbolLoc_ptr)
  {
    id v3 = (void *)CoreMediaLibrary();
    v7[3] = (uint64_t)dlsym(v3, "kCMTimePositiveInfinity");
    getkCMTimePositiveInfinitySymbolLoc_ptr = v7[3];
    long long v2 = (__n128 *)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    uint64_t v5 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  __n128 result = *v2;
  *a1 = *v2;
  a1[1].n128_u64[0] = v2[1].n128_u64[0];
  return result;
}

id CLKget_AVSynchronizedLayerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAVSynchronizedLayerClass_softClass;
  uint64_t v7 = getAVSynchronizedLayerClass_softClass;
  if (!getAVSynchronizedLayerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    _OWORD v3[2] = __getAVSynchronizedLayerClass_block_invoke;
    v3[3] = &unk_26440E380;
    v3[4] = &v4;
    __getAVSynchronizedLayerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_21C5F14B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _CMTimeMakeWithSeconds(uint64_t a1, double a2)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v4 = (uint64_t (*)(uint64_t, double))getCMTimeMakeWithSecondsSymbolLoc_ptr;
  uint64_t v11 = getCMTimeMakeWithSecondsSymbolLoc_ptr;
  if (!getCMTimeMakeWithSecondsSymbolLoc_ptr)
  {
    uint64_t v5 = (void *)CoreMediaLibrary();
    v9[3] = (uint64_t)dlsym(v5, "CMTimeMakeWithSeconds");
    getCMTimeMakeWithSecondsSymbolLoc_ptr = (_UNKNOWN *)v9[3];
    uint64_t v4 = (uint64_t (*)(uint64_t, double))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    uint64_t v7 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  return v4(a1, a2);
}

void sub_21C5F16C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C5F1AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  _Block_object_dispose((const void *)(v19 - 112), 8);
  _Unwind_Resume(a1);
}

id getAVAudioSessionClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAVAudioSessionClass_softClass;
  uint64_t v7 = getAVAudioSessionClass_softClass;
  if (!getAVAudioSessionClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    _OWORD v3[2] = __getAVAudioSessionClass_block_invoke;
    v3[3] = &unk_26440E380;
    v3[4] = &v4;
    __getAVAudioSessionClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_21C5F1C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAVAudioSessionCategoryAmbient()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAVAudioSessionCategoryAmbientSymbolLoc_ptr;
  uint64_t v8 = getAVAudioSessionCategoryAmbientSymbolLoc_ptr;
  if (!getAVAudioSessionCategoryAmbientSymbolLoc_ptr)
  {
    id v1 = (void *)AVFoundationLibrary();
    void v6[3] = (uint64_t)dlsym(v1, "AVAudioSessionCategoryAmbient");
    getAVAudioSessionCategoryAmbientSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  long long v2 = *v0;

  return v2;
}

uint64_t _CMTimeCompare(long long *a1, long long *a2)
{
  *(void *)&long long v12 = 0;
  *((void *)&v12 + 1) = &v12;
  uint64_t v13 = 0x2020000000;
  uint64_t v4 = (uint64_t (*)(long long *, long long *))getCMTimeCompareSymbolLoc_ptr;
  long long v14 = getCMTimeCompareSymbolLoc_ptr;
  if (!getCMTimeCompareSymbolLoc_ptr)
  {
    *(void *)&long long v8 = MEMORY[0x263EF8330];
    *((void *)&v8 + 1) = 3221225472;
    uint64_t v9 = __getCMTimeCompareSymbolLoc_block_invoke;
    uint64_t v10 = &unk_26440E380;
    uint64_t v11 = &v12;
    uint64_t v5 = (void *)CoreMediaLibrary();
    *(void *)(*((void *)&v12 + 1) + 24) = dlsym(v5, "CMTimeCompare");
    getCMTimeCompareSymbolLoc_ptr = *(_UNKNOWN **)(*((void *)v11 + 1) + 24);
    uint64_t v4 = *(uint64_t (**)(long long *, long long *))(*((void *)&v12 + 1) + 24);
  }
  _Block_object_dispose(&v12, 8);
  if (!v4)
  {
    uint64_t v7 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    _Block_object_dispose(&v12, 8);
    _Unwind_Resume(v7);
  }
  long long v8 = *a1;
  uint64_t v9 = (void *(*)(uint64_t))*((void *)a1 + 2);
  long long v12 = *a2;
  uint64_t v13 = *((void *)a2 + 2);
  return v4(&v8, &v12);
}

void sub_21C5F328C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAVAudioSessionMediaServicesWereResetNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)AVFoundationLibrary();
  __n128 result = dlsym(v2, "AVAudioSessionMediaServicesWereResetNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVAudioSessionMediaServicesWereResetNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                               + 24);
  return result;
}

uint64_t AVFoundationLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AVFoundationLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    _OWORD v3[2] = 3221225472;
    v3[3] = __AVFoundationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26440F088;
    uint64_t v5 = 0;
    AVFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = AVFoundationLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!AVFoundationLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __AVFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AVFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getkCMTimeZeroSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)CoreMediaLibrary();
  uint64_t result = dlsym(v2, "kCMTimeZero");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCMTimeZeroSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreMediaLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!CoreMediaLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    _OWORD v3[2] = 3221225472;
    v3[3] = __CoreMediaLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26440F0A0;
    uint64_t v5 = 0;
    CoreMediaLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = CoreMediaLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!CoreMediaLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __CoreMediaLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreMediaLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getkCMTimeInvalidSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)CoreMediaLibrary();
  uint64_t result = dlsym(v2, "kCMTimeInvalid");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCMTimeInvalidSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCMTimePositiveInfinitySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)CoreMediaLibrary();
  uint64_t result = dlsym(v2, "kCMTimePositiveInfinity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCMTimePositiveInfinitySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAVSynchronizedLayerClass_block_invoke(uint64_t a1)
{
  AVFoundationLibrary();
  Class result = objc_getClass("AVSynchronizedLayer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVSynchronizedLayerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getAVSynchronizedLayerClass_block_invoke_cold_1();
    return (Class)__getCMTimeMakeWithSecondsSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getCMTimeMakeWithSecondsSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)CoreMediaLibrary();
  Class result = dlsym(v2, "CMTimeMakeWithSeconds");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCMTimeMakeWithSecondsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAVPlayerLayerClass_block_invoke(uint64_t a1)
{
  AVFoundationLibrary();
  Class result = objc_getClass("AVPlayerLayer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVPlayerLayerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getAVPlayerLayerClass_block_invoke_cold_1();
    return (Class)__getAVAudioSessionClass_block_invoke(v3);
  }
  return result;
}

Class __getAVAudioSessionClass_block_invoke(uint64_t a1)
{
  AVFoundationLibrary();
  Class result = objc_getClass("AVAudioSession");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVAudioSessionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getAVAudioSessionClass_block_invoke_cold_1();
    return (Class)__getAVAudioSessionCategoryAmbientSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getAVAudioSessionCategoryAmbientSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)AVFoundationLibrary();
  Class result = dlsym(v2, "AVAudioSessionCategoryAmbient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVAudioSessionCategoryAmbientSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAVQueuePlayerClass_block_invoke(uint64_t a1)
{
  AVFoundationLibrary();
  Class result = objc_getClass("AVQueuePlayer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVQueuePlayerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getAVQueuePlayerClass_block_invoke_cold_1();
    return (Class)__getAVPlayerItemDidPlayToEndTimeNotificationSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getAVPlayerItemDidPlayToEndTimeNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)AVFoundationLibrary();
  Class result = dlsym(v2, "AVPlayerItemDidPlayToEndTimeNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVPlayerItemDidPlayToEndTimeNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAVLayerVideoGravityResizeAspectSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)AVFoundationLibrary();
  Class result = dlsym(v2, "AVLayerVideoGravityResizeAspect");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVLayerVideoGravityResizeAspectSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAVLayerVideoGravityResizeAspectFillSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)AVFoundationLibrary();
  Class result = dlsym(v2, "AVLayerVideoGravityResizeAspectFill");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVLayerVideoGravityResizeAspectFillSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCMTimeCompareSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)CoreMediaLibrary();
  Class result = dlsym(v2, "CMTimeCompare");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCMTimeCompareSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAVURLAssetClass_block_invoke(uint64_t a1)
{
  AVFoundationLibrary();
  Class result = objc_getClass("AVURLAsset");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVURLAssetClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getAVURLAssetClass_block_invoke_cold_1();
    return (Class)__getAVPlayerItemClass_block_invoke(v3);
  }
  return result;
}

CLKTimeIntervalTextProvider *__getAVPlayerItemClass_block_invoke(uint64_t a1)
{
  AVFoundationLibrary();
  Class result = (CLKTimeIntervalTextProvider *)objc_getClass("AVPlayerItem");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVPlayerItemClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (CLKTimeIntervalTextProvider *)__getAVPlayerItemClass_block_invoke_cold_1();
    return [(CLKTimeIntervalTextProvider *)v3 initWithStartDate:v5 endDate:v6];
  }
  return result;
}

void sub_21C5F4B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CLKForcedTime()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!CLKInternalBuild())
  {
    id v3 = 0;
    goto LABEL_19;
  }
  if (CLKForcedTime_onceToken != -1) {
    dispatch_once(&CLKForcedTime_onceToken, &__block_literal_global_21);
  }
  if ((CLKForcedTime_needsUpdate & 1) == 0)
  {
    id v0 = (id)__forcedTime;
    id v1 = (void *)CFPreferencesCopyAppValue(@"com.apple.ClockKit.forcedTime", (CFStringRef)*MEMORY[0x263EFFE48]);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v2 = v1;
    }
    else {
      id v2 = 0;
    }
    SEL v4 = (void *)__forcedTime;
    __forcedTime = (uint64_t)v2;

    CLKForcedTime_needsUpdate = 1;
    if (__forcedTime)
    {
      uint64_t v5 = CLKLoggingObjectForDomain(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        uint64_t v11 = __forcedTime;
        uint64_t v6 = "Using forced time: %@";
        uint64_t v7 = v5;
        uint32_t v8 = 12;
LABEL_15:
        _os_log_impl(&dword_21C599000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
      }
    }
    else
    {
      if (!v0)
      {
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v5 = CLKLoggingObjectForDomain(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        uint64_t v6 = "No longer using forced time";
        uint64_t v7 = v5;
        uint32_t v8 = 2;
        goto LABEL_15;
      }
    }

    goto LABEL_17;
  }
LABEL_18:
  id v3 = (id)__forcedTime;
LABEL_19:

  return v3;
}

uint64_t __CLKForcedTime_block_invoke()
{
  id v0 = (const char *)[@"CLKForcedTimeChangedNotification" UTF8String];
  id v1 = MEMORY[0x263EF83A0];

  return notify_register_dispatch(v0, &CLKForcedTime_notifyToken, v1, &__block_literal_global_7_0);
}

void __CLKForcedTime_block_invoke_2()
{
  id v0 = CLKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_21C599000, v0, OS_LOG_TYPE_DEFAULT, "Changed forced time notification", v2, 2u);
  }

  CLKForcedTime_needsUpdate = 0;
  id v1 = [MEMORY[0x263F08A00] defaultCenter];
  [v1 postNotificationName:@"CLKForcedTimeChangedNotification" object:0];
}

id CLKStartOfDayForDate(void *a1)
{
  if (a1)
  {
    id v1 = (void *)MEMORY[0x263EFF8F0];
    id v2 = a1;
    id v3 = [v1 currentCalendar];
    SEL v4 = [v3 startOfDayForDate:v2];
  }
  else
  {
    SEL v4 = 0;
  }

  return v4;
}

id CLKStartOfNextDayForDate(void *a1)
{
  if (a1)
  {
    id v1 = (void *)MEMORY[0x263EFF8F0];
    id v2 = a1;
    id v3 = [v1 currentCalendar];
    SEL v4 = [v3 dateByAddingUnit:16 value:1 toDate:v2 options:0];

    uint64_t v5 = [v3 startOfDayForDate:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id CLKStartOfPreviousDayForDate(void *a1)
{
  if (a1)
  {
    id v1 = (void *)MEMORY[0x263EFF8F0];
    id v2 = a1;
    id v3 = [v1 currentCalendar];
    SEL v4 = [v3 dateByAddingUnit:16 value:-1 toDate:v2 options:0];

    uint64_t v5 = [v3 startOfDayForDate:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id CLKStartOfNthDayForDate(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v3 = (void *)MEMORY[0x263EFF8F0];
    id v4 = a1;
    uint64_t v5 = [v3 currentCalendar];
    uint64_t v6 = [v5 dateByAddingUnit:16 value:a2 toDate:v4 options:0];

    uint64_t v7 = [v5 startOfDayForDate:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

double CLKPercentageOfDayDoneForDate(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  double v3 = 0.0;
  if (v1)
  {
    id v4 = CLKStartOfDayForDate(v1);
    [v4 timeIntervalSinceReferenceDate];
    double v6 = v5;

    uint64_t v7 = CLKStartOfNextDayForDate(v2);
    [v7 timeIntervalSinceReferenceDate];
    double v9 = v8;

    [v2 timeIntervalSinceReferenceDate];
    if (v9 - v6 > 0.0) {
      double v3 = (v10 - v6) / (v9 - v6);
    }
  }

  return v3;
}

id CLKEndOfDayForDate(void *a1)
{
  if (a1)
  {
    id v1 = (void *)MEMORY[0x263EFF8F0];
    id v2 = a1;
    double v3 = [v1 currentCalendar];
    id v4 = [v3 components:28 fromDate:v2];

    double v5 = [v3 dateFromComponents:v4];
    double v6 = [v3 dateByAddingUnit:16 value:1 toDate:v5 options:1026];
    uint64_t v7 = [v3 dateByAddingUnit:64 value:-1 toDate:v6 options:1026];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

BOOL CLKIsDateAfter5PM(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF8F0];
  id v2 = a1;
  double v3 = [v1 currentCalendar];
  uint64_t v4 = [v3 component:32 fromDate:v2];

  return v4 > 16;
}

id CLKDateFor5PMOnDate(void *a1)
{
  if (a1)
  {
    id v1 = (void *)MEMORY[0x263EFF8F0];
    id v2 = a1;
    double v3 = [v1 currentCalendar];
    uint64_t v4 = [v3 components:28 fromDate:v2];

    [v4 setHour:17];
    double v5 = [v3 dateFromComponents:v4];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

id CLKDateFor9AMOnDate(void *a1)
{
  if (a1)
  {
    id v1 = (void *)MEMORY[0x263EFF8F0];
    id v2 = a1;
    double v3 = [v1 currentCalendar];
    uint64_t v4 = [v3 components:60 fromDate:v2];

    [v4 setHour:9];
    double v5 = [v3 dateFromComponents:v4];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

uint64_t CLKDatesHaveSameTimeDesignatorPeriod(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (CLKDatesHaveSameTimeDesignatorPeriod_onceToken != -1) {
    dispatch_once(&CLKDatesHaveSameTimeDesignatorPeriod_onceToken, &__block_literal_global_11_0);
  }
  double v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  int v6 = [v3 isSameDayAsDate:v4 inCalendar:v5];

  if (v6)
  {
    [(id)CLKDatesHaveSameTimeDesignatorPeriod___timeFormatter setOverrideDate:v3];
    uint64_t v7 = [(id)CLKDatesHaveSameTimeDesignatorPeriod___timeFormatter designatorText];
    [(id)CLKDatesHaveSameTimeDesignatorPeriod___timeFormatter setOverrideDate:v4];
    double v8 = [(id)CLKDatesHaveSameTimeDesignatorPeriod___timeFormatter designatorText];
    uint64_t v9 = [v7 isEqualToString:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __CLKDatesHaveSameTimeDesignatorPeriod_block_invoke()
{
  id v0 = objc_alloc_init(CLKTimeFormatter);
  id v1 = (void *)CLKDatesHaveSameTimeDesignatorPeriod___timeFormatter;
  CLKDatesHaveSameTimeDesignatorPeriod___timeFormatter = (uint64_t)v0;

  [(id)CLKDatesHaveSameTimeDesignatorPeriod___timeFormatter setSuppressesDesignatorWhitespace:1];
  id v2 = (void *)CLKDatesHaveSameTimeDesignatorPeriod___timeFormatter;

  return [v2 setPaused:1 forReason:@"AlwaysPaused"];
}

id CLKRoundDateToNearestInterval(void *a1, uint64_t a2, int a3)
{
  if (a1)
  {
    double v5 = (void *)MEMORY[0x263EFF8F0];
    id v6 = a1;
    uint64_t v7 = [v5 currentCalendar];
    double v8 = [v7 startOfDayForDate:v6];
    [v8 timeIntervalSince1970];
    double v10 = v9;
    [v6 timeIntervalSince1970];
    double v12 = v11;

    uint64_t v13 = llround((v12 - v10) / (double)a2);
    if (a3) {
      uint64_t v13 = (uint64_t)(v12 - v10) / a2;
    }
    long long v14 = [v7 dateByAddingUnit:128 value:v13 * a2 toDate:v8 options:2];
  }
  else
  {
    long long v14 = 0;
  }

  return v14;
}

id CLKRoundDateToMinuteGranularity(void *a1, unint64_t a2)
{
  if (a2 <= 1) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = a2;
  }
  return CLKRoundDateToNearestInterval(a1, 60 * v2, 0);
}

id CLKRoundDateDownToNearestHour(void *a1)
{
  return CLKRoundDateToNearestInterval(a1, 3600, 1);
}

id CLKRoundDateDownToNearestMinute(void *a1)
{
  return CLKRoundDateToNearestInterval(a1, 60, 1);
}

id CLKRoundDateDownToNearestSecond(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (void *)MEMORY[0x263EFF910];
    [a1 timeIntervalSinceReferenceDate];
    a1 = [v2 dateWithTimeIntervalSinceReferenceDate:floor(v3)];
    uint64_t v1 = vars8;
  }
  return a1;
}

double CLKHourMinuteSecondAnglesForTime(double *a1, double *a2, double *a3, uint64_t a4, void *a5)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  [a5 getHour:&v12 minute:&v11 second:&v10 nanosecond:&v9 fromDate:a4];
  if (a1)
  {
    double result = ((double)v10 + (double)v11 * 60.0 + (double)(v12 % 12) * 60.0 * 60.0) / 43200.0 * 6.28318531;
    *a1 = result;
  }
  if (a2)
  {
    double result = ((double)v10 + (double)v11 * 60.0) / 3600.0 * 6.28318531;
    *a2 = result;
  }
  if (a3)
  {
    double result = ((double)v10 / 60.0 + (double)v9 / 6.0e10) * 6.28318531;
    *a3 = result;
  }
  return result;
}

void CLKSetCompanionDisplayDate(id obj)
{
}

id CLKCompanionDisplayDate()
{
  if (CLKCompanionDisplayDate_onceToken != -1) {
    dispatch_once(&CLKCompanionDisplayDate_onceToken, &__block_literal_global_17_1);
  }
  if (__overrideCompanionDisplayDate) {
    id v0 = (void *)__overrideCompanionDisplayDate;
  }
  else {
    id v0 = (void *)CLKCompanionDisplayDate__date;
  }

  return v0;
}

void __CLKCompanionDisplayDate_block_invoke()
{
  uint64_t v0 = CLKDebugCompanionDisplayDateOverride();
  uint64_t v1 = (void *)CLKCompanionDisplayDate__date;
  CLKCompanionDisplayDate__date = v0;

  if (!CLKCompanionDisplayDate__date)
  {
    id v5 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
    uint64_t v2 = objc_opt_new();
    [v2 setYear:2016];
    [v2 setMonth:9];
    [v2 setDay:23];
    [v2 setHour:10];
    [v2 setMinute:9];
    [v2 setSecond:30];
    uint64_t v3 = [v5 dateFromComponents:v2];
    id v4 = (void *)CLKCompanionDisplayDate__date;
    CLKCompanionDisplayDate__date = v3;
  }
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id CLKWatchFaceLibraryServerInterface()
{
  if (CLKWatchFaceLibraryServerInterface_onceToken != -1) {
    dispatch_once(&CLKWatchFaceLibraryServerInterface_onceToken, &__block_literal_global_22);
  }
  uint64_t v0 = (void *)CLKWatchFaceLibraryServerInterface_interface;

  return v0;
}

uint64_t __CLKWatchFaceLibraryServerInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CCDE628];
  uint64_t v1 = CLKWatchFaceLibraryServerInterface_interface;
  CLKWatchFaceLibraryServerInterface_interface = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void _CLKSetViewBoundsAndPositionFromFrame(void *a1, double a2, double a3, double a4, double a5)
{
  id v14 = a1;
  [v14 bounds];
  objc_msgSend(v14, "setBounds:");
  uint64_t v9 = [v14 layer];
  [v9 anchorPoint];
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v14, "setCenter:", a2 + v11 * a4, a3 + v13 * a5);
}

void sub_21C5F9B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double CLKSceneSizeForDevice(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CLKSceneSizeForDevice___lock);
  id WeakRetained = objc_loadWeakRetained(&CLKSceneSizeForDevice___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CLKSceneSizeForDevice___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CLKSceneSizeForDevice___cachedDevice, v1);
    CLKSceneSizeForDevice___previousCLKDeviceVersion = [v1 version];

    __CLKSceneSizeForDevice_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CLKSceneSizeForDevice___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKSceneSizeForDevice___lock);
  double v9 = *(double *)&CLKSceneSizeForDevice_width;

  return v9;
}

void __CLKSceneSizeForDevice_block_invoke(uint64_t a1, uint64_t a2)
{
  v6[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  v5[0] = &unk_26CCDC190;
  v5[1] = &unk_26CCDC1A8;
  v6[0] = &unk_26CCDC4C8;
  v6[1] = &unk_26CCDC4D8;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  [v2 scaledValue:v3 withOverrides:156.0];
  CLKSceneSizeForDevice_width = v4;
}

double CLKDialDiameterForDeviceWithRoundingBehavior(uint64_t a1, uint64_t a2)
{
  v9[5] = *MEMORY[0x263EF8340];
  uint64_t v3 = +[CLKDeviceMetrics metricsWithDevice:a1 identitySizeClass:2];
  [v3 setRoundingBehavior:a2];
  v8[0] = &unk_26CCDC190;
  v8[1] = &unk_26CCDC1C0;
  v9[0] = &unk_26CCDC4C8;
  v9[1] = &unk_26CCDC4E8;
  v8[2] = &unk_26CCDC1A8;
  void v8[3] = &unk_26CCDC1D8;
  v9[2] = &unk_26CCDC4F8;
  v9[3] = &unk_26CCDC508;
  v8[4] = &unk_26CCDC1F0;
  v9[4] = &unk_26CCDC518;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5];
  [v3 scaledValue:v4 withOverrides:155.0];
  double v6 = v5;

  return v6;
}

double CLKDialDiameterForDevice(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CLKDialDiameterForDevice___lock);
  id WeakRetained = objc_loadWeakRetained(&CLKDialDiameterForDevice___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CLKDialDiameterForDevice___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CLKDialDiameterForDevice___cachedDevice, v1);
    CLKDialDiameterForDevice___previousCLKDeviceVersion = [v1 version];

    CLKDialDiameterForDevice__dialDiameter = CLKDialDiameterForDeviceWithRoundingBehavior((uint64_t)v1, 2);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CLKDialDiameterForDevice___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKDialDiameterForDevice___lock);
  double v8 = *(double *)&CLKDialDiameterForDevice__dialDiameter;

  return v8;
}

double CLKLargeDialDiameterForDevice(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CLKLargeDialDiameterForDevice___lock);
  id WeakRetained = objc_loadWeakRetained(&CLKLargeDialDiameterForDevice___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CLKLargeDialDiameterForDevice___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CLKLargeDialDiameterForDevice___cachedDevice, v1);
    CLKLargeDialDiameterForDevice___previousCLKDeviceVersion = [v1 version];

    __CLKLargeDialDiameterForDevice_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CLKLargeDialDiameterForDevice___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKLargeDialDiameterForDevice___lock);
  double v9 = *(double *)&CLKLargeDialDiameterForDevice__largeDialDiameter;

  return v9;
}

void __CLKLargeDialDiameterForDevice_block_invoke(uint64_t a1, uint64_t a2)
{
  void v6[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v2 setRoundingBehavior:2];
  v5[0] = &unk_26CCDC1A8;
  v5[1] = &unk_26CCDC1D8;
  v6[0] = &unk_26CCDC528;
  v6[1] = &unk_26CCDC538;
  void v5[2] = &unk_26CCDC1F0;
  v6[2] = &unk_26CCDC548;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
  [v2 scaledValue:v3 withOverrides:161.0];
  CLKLargeDialDiameterForDevice__largeDialDiameter = v4;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

id CLKLocalizedString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = CLKBundle();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:&stru_26CCC52F8 table:@"ClockKit"];

  return v3;
}

id CLKBundle()
{
  if (CLKBundle_onceToken != -1) {
    dispatch_once(&CLKBundle_onceToken, &__block_literal_global_260);
  }
  uint64_t v0 = (void *)CLKBundle___bundle;

  return v0;
}

id CLKWorldClockLocalizedString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = CLKBundle();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:&stru_26CCC52F8 table:@"WorldClockFormats"];

  return v3;
}

id CLKGreenfieldLocalizedString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = CLKBundle();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:&stru_26CCC52F8 table:@"ClockKit-greenfield"];

  return v3;
}

uint64_t CLKLocaleCurrentNumberSystem()
{
  if (CLKLocaleCurrentNumberSystem_onceToken != -1) {
    dispatch_once(&CLKLocaleCurrentNumberSystem_onceToken, &__block_literal_global_26);
  }
  return numberSystem;
}

void __CLKLocaleCurrentNumberSystem_block_invoke()
{
  +[CLKCurrentLocaleSentinel shared];

  _CLKUpdateNumberSystem();
}

void _CLKUpdateNumberSystem()
{
  uint64_t v0 = (void *)MEMORY[0x263F50758];
  id v1 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v2 = [v1 localeIdentifier];
  id v5 = [v0 numberingSystemForLocaleID:v2];

  if ([v5 isEqualToString:@"arab"])
  {
    uint64_t v3 = 1;
  }
  else if ([v5 isEqualToString:@"deva"])
  {
    uint64_t v3 = 2;
  }
  else if ([v5 isEqualToString:@"beng"])
  {
    uint64_t v3 = 3;
  }
  else if ([v5 isEqualToString:@"guru"])
  {
    uint64_t v3 = 4;
  }
  else if ([v5 isEqualToString:@"gujr"])
  {
    uint64_t v3 = 5;
  }
  else if ([v5 isEqualToString:@"telu"])
  {
    uint64_t v3 = 6;
  }
  else if ([v5 isEqualToString:@"mlym"])
  {
    uint64_t v3 = 7;
  }
  else if ([v5 isEqualToString:@"knda"])
  {
    uint64_t v3 = 8;
  }
  else if ([v5 isEqualToString:@"orya"])
  {
    uint64_t v3 = 9;
  }
  else if ([v5 isEqualToString:@"olck"])
  {
    uint64_t v3 = 10;
  }
  else if ([v5 isEqualToString:@"arabext"])
  {
    uint64_t v3 = 11;
  }
  else if ([v5 isEqualToString:@"mtei"])
  {
    uint64_t v3 = 12;
  }
  else if ([v5 isEqualToString:@"mymr"])
  {
    uint64_t v3 = 13;
  }
  else
  {
    int v4 = [v5 isEqualToString:@"khmr"];
    uint64_t v3 = 14;
    if (!v4) {
      uint64_t v3 = 0;
    }
  }
  numberSystem = v3;
}

__CFString *CLKLocaleNumberSystemIdentifier(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xD) {
    return @"latn";
  }
  else {
    return off_26440F338[a1 - 1];
  }
}

__CFString *CLKLocaleRenderingHintLanguageIdentifierForNumberingSystem(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xD) {
    return @"en";
  }
  else {
    return off_26440F3A8[a1 - 1];
  }
}

uint64_t CLKLocaleNumberSystemForFirstLanguage()
{
  uint64_t v0 = [MEMORY[0x263EFF960] preferredLanguages];
  id v1 = [v0 firstObject];
  uint64_t v2 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v1];
  uint64_t v3 = [v2 numberingSystem];
  if ([v3 isEqualToString:@"latn"])
  {
    uint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"arab"])
  {
    uint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"deva"])
  {
    uint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"beng"])
  {
    uint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"guru"])
  {
    uint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"gujr"])
  {
    uint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"telu"])
  {
    uint64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"mlym"])
  {
    uint64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"knda"])
  {
    uint64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"orya"])
  {
    uint64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"olck"])
  {
    uint64_t v4 = 10;
  }
  else if ([v3 isEqualToString:@"arabext"])
  {
    uint64_t v4 = 11;
  }
  else if ([v3 isEqualToString:@"mtei"])
  {
    uint64_t v4 = 12;
  }
  else if ([v3 isEqualToString:@"mymr"])
  {
    uint64_t v4 = 13;
  }
  else if ([v3 isEqualToString:@"khmr"])
  {
    uint64_t v4 = 14;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

__CFString *CLKLocaleNumberSystemPrefix()
{
  if (CLKLocaleCurrentNumberSystem_onceToken != -1) {
    dispatch_once(&CLKLocaleCurrentNumberSystem_onceToken, &__block_literal_global_26);
  }
  if ((unint64_t)(numberSystem - 1) > 0xD) {
    return @"Latn";
  }
  else {
    return off_26440F418[numberSystem - 1];
  }
}

uint64_t CLKLayoutIsRTL()
{
  if (CLKLayoutIsRTL_onceToken != -1) {
    dispatch_once(&CLKLayoutIsRTL_onceToken, &__block_literal_global_153);
  }
  return isLayoutRTL;
}

void __CLKLayoutIsRTL_block_invoke()
{
  +[CLKCurrentLocaleSentinel shared];

  _CLKUpdateIsLayoutRTL();
}

void _CLKUpdateIsLayoutRTL()
{
  uint64_t v0 = [MEMORY[0x263F82E88] _applicationKeyWindow];
  id v6 = v0;
  if (v0)
  {
    BOOL v1 = [v0 effectiveUserInterfaceLayoutDirection] == 1;
    uint64_t v2 = v6;
    char v3 = v1;
    isLayoutRTL = v3;
  }
  else
  {
    if (*MEMORY[0x263F83300])
    {
      isLayoutRTL = [(id)*MEMORY[0x263F83300] userInterfaceLayoutDirection] != 0;
    }
    else
    {
      uint64_t v4 = [MEMORY[0x263EFF960] currentLocale];
      id v5 = [v4 objectForKey:*MEMORY[0x263EFF508]];

      isLayoutRTL = [MEMORY[0x263EFF960] characterDirectionForLanguage:v5] == 2;
    }
    uint64_t v2 = 0;
  }
}

uint64_t CLKLanguageIsTallScript()
{
  if (CLKLanguageIsTallScript_onceToken != -1) {
    dispatch_once(&CLKLanguageIsTallScript_onceToken, &__block_literal_global_155);
  }
  return languageIsTallScript;
}

void __CLKLanguageIsTallScript_block_invoke()
{
  +[CLKCurrentLocaleSentinel shared];

  _CLKUpdateLanguageIsTallScript();
}

void _CLKUpdateLanguageIsTallScript()
{
  uint64_t v0 = [MEMORY[0x263EFF960] currentLocale];
  id v1 = [v0 objectForKey:*MEMORY[0x263EFF508]];

  languageIsTallScript = [&unk_26CCDC630 containsObject:v1];
}

BOOL CLKCurrentLocaleIs24HourMode()
{
  uint64_t v0 = [MEMORY[0x263EFF960] currentLocale];
  BOOL v1 = CLKLocaleIs24HourMode(v0);

  return v1;
}

BOOL CLKLocaleIs24HourMode(void *a1)
{
  CFLocaleRef v1 = a1;
  uint64_t v2 = [MEMORY[0x263EFF960] currentLocale];
  char v3 = (void *)v2;
  if (!v1 || (const __CFLocale *)v2 == v1)
  {
    os_unfair_lock_lock(&CLKLocaleIs24HourMode_lock);
    if ((void *)CLKLocaleIs24HourMode_cachedLocale != v3)
    {
      objc_storeStrong((id *)&CLKLocaleIs24HourMode_cachedLocale, v3);
      CLKLocaleIs24HourMode_cachedIs24Hour = [MEMORY[0x263EFF960] _usesTwelveHourClock] ^ 1;
    }
    os_unfair_lock_unlock(&CLKLocaleIs24HourMode_lock);
    BOOL v6 = CLKLocaleIs24HourMode_cachedIs24Hour != 0;
  }
  else
  {
    uint64_t v4 = CFDateFormatterCreate(0, v1, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
    CFStringRef Format = CFDateFormatterGetFormat(v4);
    BOOL v6 = (BOOL)Format;
    if (Format) {
      BOOL v6 = CFStringFind(Format, @"H", 0).location != -1
    }
        || CFStringFind((CFStringRef)v6, @"k", 0).location != -1;
    CFRelease(v4);
  }

  return v6;
}

uint64_t CLKIsCurrentLocaleCJK()
{
  if (CLKIsCurrentLocaleCJK_onceToken != -1) {
    dispatch_once(&CLKIsCurrentLocaleCJK_onceToken, &__block_literal_global_163);
  }
  uint64_t v0 = [MEMORY[0x263EFF960] currentLocale];
  CFLocaleRef v1 = [v0 objectForKey:*MEMORY[0x263EFF508]];

  uint64_t v2 = [(id)CLKIsCurrentLocaleCJK__cjkSet containsObject:v1];
  return v2;
}

uint64_t __CLKIsCurrentLocaleCJK_block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"zh", @"ja", @"ko", 0);
  uint64_t v1 = CLKIsCurrentLocaleCJK__cjkSet;
  CLKIsCurrentLocaleCJK__cjkSet = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t CLKIsCurrentLocaleNonLatin()
{
  if (CLKIsCurrentLocaleNonLatin_onceToken != -1) {
    dispatch_once(&CLKIsCurrentLocaleNonLatin_onceToken, &__block_literal_global_175);
  }
  uint64_t v0 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v1 = [v0 objectForKey:*MEMORY[0x263EFF508]];

  uint64_t v2 = [(id)CLKIsCurrentLocaleNonLatin__nonLatinSet containsObject:v1];
  return v2;
}

uint64_t __CLKIsCurrentLocaleNonLatin_block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"zh", @"ja", @"ko", @"hi", @"th", @"ar", 0);
  uint64_t v1 = CLKIsCurrentLocaleNonLatin__nonLatinSet;
  CLKIsCurrentLocaleNonLatin__nonLatinSet = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t CLKDesignatorRequiresWhitespace()
{
  if (CLKDesignatorRequiresWhitespace_onceToken != -1) {
    dispatch_once(&CLKDesignatorRequiresWhitespace_onceToken, &__block_literal_global_183);
  }
  return CLKDesignatorRequiresWhitespace_requiresWhitespace;
}

void __CLKDesignatorRequiresWhitespace_block_invoke()
{
  CLKLocalizedString(@"DESIGNATOR_REQUIRES_WHITESPACE");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  CLKDesignatorRequiresWhitespace_requiresWhitespace = [v0 BOOLValue];
}

uint64_t CLKUsesFauxSmallCaps()
{
  if (CLKUsesFauxSmallCaps_onceToken != -1) {
    dispatch_once(&CLKUsesFauxSmallCaps_onceToken, &__block_literal_global_191);
  }
  return CLKUsesFauxSmallCaps_fauxSmallCaps;
}

void __CLKUsesFauxSmallCaps_block_invoke()
{
  CLKLocalizedString(@"INTERVAL_ALLOW_FAUX_SMALL_CAPS_FOR_FIT");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  CLKUsesFauxSmallCaps_fauxSmallCaps = [v0 BOOLValue];
}

BOOL CLKSmallCapsAllowed()
{
  if (CLKSmallCapsAllowed_onceToken != -1) {
    dispatch_once(&CLKSmallCapsAllowed_onceToken, &__block_literal_global_196);
  }
  return (CLKSmallCapsAllowed_smallCapsAllowed & 1) == 0;
}

void __CLKSmallCapsAllowed_block_invoke()
{
  CLKLocalizedString(@"SMALL_CAPS_FONT_ALLOWED");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  if ([v0 isEqualToString:@"0"]) {
    CLKSmallCapsAllowed_smallCapsAllowed = 1;
  }
}

BOOL CLKDropLeftRedundantDesignator()
{
  if (CLKDropLeftRedundantDesignator_onceToken != -1) {
    dispatch_once(&CLKDropLeftRedundantDesignator_onceToken, &__block_literal_global_204);
  }
  return (CLKDropLeftRedundantDesignator_dropLeft & 1) == 0;
}

uint64_t __CLKDropLeftRedundantDesignator_block_invoke()
{
  uint64_t v0 = CLKLocalizedString(@"INTERVAL_DROP_LEFTMOST_REDUNDANT_DESIGNATOR");
  uint64_t v1 = v0;
  if (v0)
  {
    uint64_t v3 = v0;
    uint64_t v0 = [(id)v0 BOOLValue];
    uint64_t v1 = v3;
    if ((v0 & 1) == 0) {
      CLKDropLeftRedundantDesignator_dropLeft = 1;
    }
  }

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t CLKRemovesPunctuationFromWeekdayDay()
{
  if (CLKRemovesPunctuationFromWeekdayDay_onceToken != -1) {
    dispatch_once(&CLKRemovesPunctuationFromWeekdayDay_onceToken, &__block_literal_global_209);
  }
  return CLKRemovesPunctuationFromWeekdayDay_removesPunctuation;
}

void __CLKRemovesPunctuationFromWeekdayDay_block_invoke()
{
  CLKLocalizedString(@"DATE_WEEKDAY_DAY_REMOVE_PUNCTUATION");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  CLKRemovesPunctuationFromWeekdayDay_removesPunctuation = [v0 BOOLValue];
}

uint64_t CLKEqualObjects(void *a1, void *a2)
{
  if (a1 == a2) {
    return 1;
  }
  else {
    return [a1 isEqual:a2];
  }
}

void CLKValidateArray(void *a1, uint64_t a2)
{
  id v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263F08170], @"Array validation failed: putative array is a %@", objc_opt_class() format];
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __CLKValidateArray_block_invoke;
  v4[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24lu32l8;
  v4[4] = a2;
  [v3 enumerateObjectsUsingBlock:v4];
}

void __CLKValidateArray_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263F08170], @"Array validation failed: expected object class %@, found %@", *(void *)(a1 + 32), v3 format];
  }
}

void CLKRecursivelyValidateArray(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263F08170], @"Array validation failed: putative array is a %@", objc_opt_class() format];
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __CLKRecursivelyValidateArray_block_invoke;
  void v6[3] = &unk_26440F2B0;
  id v7 = v4;
  id v5 = v4;
  [v3 enumerateObjectsUsingBlock:v6];
}

void __CLKRecursivelyValidateArray_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v4 = *(void **)(a1 + 32);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __CLKRecursivelyValidateArray_block_invoke_2;
  double v9 = &unk_26440F288;
  id v5 = v3;
  id v10 = v5;
  double v11 = &v12;
  [v4 enumerateObjectsUsingBlock:&v6];
  if (!*((unsigned char *)v13 + 24)) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263F08170], @"Array validation failed: expected object in classes %@, found %@", *(void *)(a1 + 32), v5, v6, v7, v8, v9 format];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CLKRecursivelyValidateArray(v5, *(void *)(a1 + 32));
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      CLKRecursivelyValidateDictionary(v5, *(void *)(a1 + 32));
    }
  }

  _Block_object_dispose(&v12, 8);
}

void sub_21C5FEA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __CLKRecursivelyValidateArray_block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void CLKRecursivelyValidateDictionary(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263F08170], @"Dictionary validation failed: putative dictionary is a %@", objc_opt_class() format];
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __CLKRecursivelyValidateDictionary_block_invoke;
  void v6[3] = &unk_26440F300;
  id v7 = v4;
  id v5 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
}

void __CLKRecursivelyValidateDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __CLKRecursivelyValidateDictionary_block_invoke_2;
  v10[3] = &unk_26440F2D8;
  double v13 = &v19;
  id v8 = v5;
  id v11 = v8;
  uint64_t v14 = &v15;
  id v9 = v6;
  id v12 = v9;
  [v7 enumerateObjectsUsingBlock:v10];
  if (!*((unsigned char *)v20 + 24) || !*((unsigned char *)v16 + 24)) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263F08170], @"Dictionary validation failed: expected key and value in classes %@, found [%@: %@]", *(void *)(a1 + 32), v8, v9 format];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CLKRecursivelyValidateArray(v8, *(void **)(a1 + 32));
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      CLKRecursivelyValidateDictionary(v8, *(void *)(a1 + 32));
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CLKRecursivelyValidateArray(v9, *(void **)(a1 + 32));
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      CLKRecursivelyValidateDictionary(v9, *(void *)(a1 + 32));
    }
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

void sub_21C5FEDA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __CLKRecursivelyValidateDictionary_block_invoke_2(uint64_t result, uint64_t a2, unsigned char *a3)
{
  uint64_t v4 = result;
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t result = objc_opt_isKindOfClass();
    if (result) {
      *(unsigned char *)(*(void *)(*(void *)(v4 + 48) + 8) + 24) = 1;
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(v4 + 56) + 8) + 24))
  {
    uint64_t result = objc_opt_isKindOfClass();
    if (result) {
      *(unsigned char *)(*(void *)(*(void *)(v4 + 56) + 8) + 24) = 1;
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(v4 + 48) + 8) + 24))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(v4 + 56) + 8) + 24)) {
      *a3 = 1;
    }
  }
  return result;
}

void CLKRequestConcreteImplementation(void *a1)
{
  id v1 = a1;
  if (CLKInternalBuild_onceToken != -1) {
    dispatch_once(&CLKInternalBuild_onceToken, &__block_literal_global_238_0);
  }
  if (CLKInternalBuild_internal) {
    NSRequestConcreteImplementation();
  }
}

void sub_21C5FEF30(_Unwind_Exception *exception_object, int a2, ...)
{
  va_start(va, a2);
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    id v3 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = [v2 reason];
      CLKRequestConcreteImplementation_cold_1(v4, (uint8_t *)va, v3);
    }

    objc_end_catch();
    JUMPOUT(0x21C5FEEE4);
  }
  _Unwind_Resume(exception_object);
}

void _CLKGenerateSimulatedCrash(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a1;
  id v11 = a2;
  id v12 = (void *)[[NSString alloc] initWithFormat:v11 arguments:&a9];
  uint64_t v13 = CLKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    _CLKGenerateSimulatedCrash_cold_2(v12, v13);
  }

  uint64_t v14 = getpid();
  id v15 = v12;
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v16 = (void (*)(uint64_t, uint64_t, id))getSimulateCrashSymbolLoc_ptr;
  char v22 = getSimulateCrashSymbolLoc_ptr;
  if (!getSimulateCrashSymbolLoc_ptr)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __getSimulateCrashSymbolLoc_block_invoke;
    v18[3] = &unk_26440E380;
    v18[4] = &v19;
    __getSimulateCrashSymbolLoc_block_invoke((uint64_t)v18);
    uint64_t v16 = (void (*)(uint64_t, uint64_t, id))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v16)
  {
    uint64_t v17 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v17);
  }
  v16(v14, 464371934, v15);
}

id CLKUniqueBundle(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F086E0];
  id v2 = a1;
  id v3 = (void *)[[v1 alloc] _initUniqueWithURL:v2];

  return v3;
}

id CLKBuildVersion()
{
  if (CLKBuildVersion_onceToken != -1) {
    dispatch_once(&CLKBuildVersion_onceToken, &__block_literal_global_245);
  }
  id v0 = (void *)CLKBuildVersion___buildVersion;

  return v0;
}

uint64_t __CLKBuildVersion_block_invoke()
{
  uint64_t v0 = MGGetStringAnswer();
  uint64_t v1 = CLKBuildVersion___buildVersion;
  CLKBuildVersion___buildVersion = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __CLKBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v1 = CLKBundle___bundle;
  CLKBundle___bundle = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void *__getSimulateCrashSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!CrashReporterSupportLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    void v5[2] = 3221225472;
    void v5[3] = __CrashReporterSupportLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_26440F320;
    uint64_t v7 = 0;
    CrashReporterSupportLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    id v2 = (void *)CrashReporterSupportLibraryCore_frameworkLibrary;
    if (CrashReporterSupportLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)CrashReporterSupportLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "SimulateCrash");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSimulateCrashSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CrashReporterSupportLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CrashReporterSupportLibraryCore_frameworkLibrary = result;
  return result;
}

id CLKDebugCompanionDisplayDateOverride()
{
  if (CLKDebugCompanionDisplayDateOverride_onceToken != -1) {
    dispatch_once(&CLKDebugCompanionDisplayDateOverride_onceToken, &__block_literal_global_27);
  }
  uint64_t v0 = (void *)CLKDebugCompanionDisplayDateOverride___overrideDate;

  return v0;
}

void __CLKDebugCompanionDisplayDateOverride_block_invoke()
{
  CFPropertyListRef v0 = CFPreferencesCopyAppValue(@"IdealizedDateOverride", @"com.apple.ClockKit");
  uint64_t v1 = (void *)CLKDebugCompanionDisplayDateOverride___overrideDate;
  CLKDebugCompanionDisplayDateOverride___overrideDate = (uint64_t)v0;

  if (CLKDebugCompanionDisplayDateOverride___overrideDate)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v2 = (void *)CLKDebugCompanionDisplayDateOverride___overrideDate;
      CLKDebugCompanionDisplayDateOverride___overrideDate = 0;
    }
  }
}

uint64_t CLKComplicationAppIntentWidgetMigrationConfiguration.kind.getter()
{
  uint64_t v1 = *(void *)((char *)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x60));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CLKComplicationAppIntentWidgetMigrationConfiguration.extensionBundleIdentifier.getter()
{
  uint64_t v1 = *(void *)((char *)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x68));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CLKComplicationAppIntentWidgetMigrationConfiguration.intent.getter@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, char *))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)v1)
                                                                            + 0x50)
                                                                - 8)
                                                    + 16))(a1, &v1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)v1) + 0x70)]);
}

uint64_t CLKComplicationAppIntentWidgetMigrationConfiguration.localizedDisplayName.getter()
{
  uint64_t v1 = *(void *)((char *)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x78));
  swift_bridgeObjectRetain();
  return v1;
}

id CLKComplicationAppIntentWidgetMigrationConfiguration.__allocating_init(kind:extensionBundleIdentifier:intent:localizedDisplayName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7;
  id v16 = objc_allocWithZone(v8);
  id v17 = sub_21C60006C(a1, a2, a3, a4, a5, a6, a7);
  (*(void (**)(uint64_t))(*(void *)(*((void *)v8 + 10) - 8) + 8))(a5);
  return v17;
}

id CLKComplicationAppIntentWidgetMigrationConfiguration.init(kind:extensionBundleIdentifier:intent:localizedDisplayName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9 = *MEMORY[0x263F8EED0] & *v7;
  id v10 = sub_21C60006C(a1, a2, a3, a4, a5, a6, a7);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v9 + 80) - 8) + 8))(a5);
  return v10;
}

uint64_t sub_21C5FF980(void *a1)
{
  type metadata accessor for CLKComplicationAppIntentWidgetMigrationConfiguration();
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t sub_21C5FFA30(uint64_t a1, uint64_t a2, void *a3)
{
  return 0;
}

id sub_21C5FFA5C()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v0 = sub_21C5FFBF4();
  id v1 = objc_allocWithZone((Class)CLKComplicationIntentWidgetMigrationConfiguration);
  swift_bridgeObjectRetain();
  id v2 = (void *)sub_21C60A590();
  swift_bridgeObjectRelease();
  id v3 = (void *)sub_21C60A590();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_21C60A590();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v1, sel_initWithKind_extensionBundleIdentifier_intent_localizedDisplayName_, v2, v3, v0, v4);

  return v5;
}

id sub_21C5FFBB0(void *a1)
{
  id v1 = a1;
  id v2 = sub_21C5FFA5C();

  return v2;
}

id sub_21C5FFBF4()
{
  uint64_t v1 = *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x50);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v12 - v3;
  long long v6 = (char *)v0 + *(void *)(v5 + 112);
  swift_bridgeObjectRetain();
  sub_21C60A470();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v6, v1);
  swift_getDynamicType();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_21C60A460();
  id v7 = objc_allocWithZone(MEMORY[0x263F0F9A0]);
  uint64_t v8 = (void *)sub_21C60A590();
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_0(v13, v13[3]);
  uint64_t v9 = sub_21C60A710();
  __swift_project_boxed_opaque_existential_0(v12, v12[3]);
  id v10 = objc_msgSend(v7, sel_initWithAppBundleIdentifier_linkAction_linkActionMetadata_, v8, v9, sub_21C60A710());
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  return v10;
}

id CLKComplicationAppIntentWidgetMigrationConfiguration.__allocating_init(private:)()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_initPrivate);
}

void CLKComplicationAppIntentWidgetMigrationConfiguration.init(private:)()
{
}

void sub_21C5FFEA0()
{
}

id CLKComplicationAppIntentWidgetMigrationConfiguration.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CLKComplicationAppIntentWidgetMigrationConfiguration();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21C5FFF58(char *a1)
{
  objc_super v2 = (void *)MEMORY[0x263F8EED0];
  uint64_t v3 = *MEMORY[0x263F8EED0] & *(void *)a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *))(*(void *)(*(void *)(v3 + 80) - 8) + 8))(&a1[*(void *)((*v2 & *(void *)a1)
                                                                                                 + 0x70)]);

  return swift_bridgeObjectRelease();
}

id sub_21C60006C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v10 = (void *)MEMORY[0x263F8EED0];
  uint64_t v11 = *MEMORY[0x263F8EED0] & *(void *)v7;
  id v12 = &v7[*(void *)(v11 + 0x60)];
  *(void *)id v12 = a1;
  *((void *)v12 + 1) = a2;
  uint64_t v13 = &v7[*(void *)((*v10 & *(void *)v7) + 0x68)];
  *(void *)uint64_t v13 = a3;
  *((void *)v13 + 1) = a4;
  (*(void (**)(char *, uint64_t, void))(*(void *)(*(void *)(v11 + 80) - 8) + 16))(&v7[*(void *)((*v10 & *(void *)v7) + 0x70)], a5, *(void *)(v11 + 80));
  uint64_t v14 = &v7[*(void *)((*v10 & *(void *)v7) + 0x78)];
  *(void *)uint64_t v14 = a6;
  *((void *)v14 + 1) = a7;
  v16.receiver = v7;
  v16.super_class = (Class)type metadata accessor for CLKComplicationAppIntentWidgetMigrationConfiguration();
  return objc_msgSendSuper2(&v16, sel_initPrivate);
}

void sub_21C6001B8()
{
}

uint64_t type metadata accessor for CLKComplicationAppIntentWidgetMigrationConfiguration()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21C600204()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for CLKComplicationAppIntentWidgetMigrationConfiguration(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CLKComplicationAppIntentWidgetMigrationConfiguration);
}

uint64_t dispatch thunk of CLKComplicationAppIntentWidgetMigrationConfiguration.__allocating_init(kind:extensionBundleIdentifier:intent:localizedDisplayName:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

void type metadata accessor for CLKComplicationFamily(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

uint64_t sub_21C600308(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_21C600328(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + _Block_object_dispose(&a9, 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void sub_21C600364(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

CGPoint __swiftcall CLKDeviceMetrics.scaledPoint(_:overrides:)(CGPoint _, Swift::OpaquePointer overrides)
{
  sub_21C6004A0((uint64_t)overrides._rawValue, (SEL *)&selRef_valueWithCGPoint_, (SEL *)&selRef_scaledPoint_withOverrides_, _.x, _.y);
  result.y = v3;
  result.x = v2;
  return result;
}

CGSize __swiftcall CLKDeviceMetrics.scaledSize(_:overrides:)(CGSize _, Swift::OpaquePointer overrides)
{
  sub_21C6004A0((uint64_t)overrides._rawValue, (SEL *)&selRef_valueWithCGSize_, (SEL *)&selRef_scaledSize_withOverrides_, _.width, _.height);
  result.height = v3;
  result.width = v2;
  return result;
}

void sub_21C6004A0(uint64_t a1, SEL *a2, SEL *a3, double a4, double a5)
{
  uint64_t v61 = a1 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(a1 + 64);
  int64_t v62 = (unint64_t)(v9 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v12 = 0;
  uint64_t v13 = MEMORY[0x263F8EE80];
  v60 = a2;
LABEL_4:
  while (2)
  {
    unint64_t v14 = v13 & 0xC000000000000001;
    if (v13 < 0) {
      uint64_t v15 = v13;
    }
    else {
      uint64_t v15 = v13 & 0xFFFFFFFFFFFFFF8;
    }
    while (1)
    {
      while (1)
      {
        if (v11)
        {
          unint64_t v16 = __clz(__rbit64(v11));
          v11 &= v11 - 1;
          unint64_t v17 = v16 | (v12 << 6);
        }
        else
        {
          int64_t v18 = v12 + 1;
          if (__OFADD__(v12, 1))
          {
            __break(1u);
            goto LABEL_56;
          }
          if (v18 >= v62) {
            goto LABEL_54;
          }
          unint64_t v19 = *(void *)(v61 + 8 * v18);
          ++v12;
          if (!v19)
          {
            int64_t v12 = v18 + 1;
            if (v18 + 1 >= v62) {
              goto LABEL_54;
            }
            unint64_t v19 = *(void *)(v61 + 8 * v12);
            if (!v19)
            {
              int64_t v12 = v18 + 2;
              if (v18 + 2 >= v62) {
                goto LABEL_54;
              }
              unint64_t v19 = *(void *)(v61 + 8 * v12);
              if (!v19)
              {
                int64_t v12 = v18 + 3;
                if (v18 + 3 >= v62) {
                  goto LABEL_54;
                }
                unint64_t v19 = *(void *)(v61 + 8 * v12);
                if (!v19)
                {
                  int64_t v12 = v18 + 4;
                  if (v18 + 4 >= v62) {
                    goto LABEL_54;
                  }
                  unint64_t v19 = *(void *)(v61 + 8 * v12);
                  if (!v19)
                  {
                    int64_t v20 = v18 + 5;
                    if (v20 >= v62)
                    {
LABEL_54:
                      swift_release();
                      sub_21C60237C(0, (unint64_t *)&qword_267C8AFA0);
                      sub_21C60237C(0, &qword_267C8AFA8);
                      sub_21C6023B8();
                      int v57 = (void *)sub_21C60A580();
                      swift_bridgeObjectRelease();
                      objc_msgSend(v59, *a3, v57, a4, a5);

                      return;
                    }
                    unint64_t v19 = *(void *)(v61 + 8 * v20);
                    if (!v19)
                    {
                      while (1)
                      {
                        int64_t v12 = v20 + 1;
                        if (__OFADD__(v20, 1)) {
                          goto LABEL_60;
                        }
                        if (v12 >= v62) {
                          goto LABEL_54;
                        }
                        unint64_t v19 = *(void *)(v61 + 8 * v12);
                        ++v20;
                        if (v19) {
                          goto LABEL_26;
                        }
                      }
                    }
                    int64_t v12 = v20;
                  }
                }
              }
            }
          }
LABEL_26:
          unint64_t v11 = (v19 - 1) & v19;
          unint64_t v17 = __clz(__rbit64(v19)) + (v12 << 6);
        }
        uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8 * v17);
        char v22 = (double *)(*(void *)(a1 + 56) + 16 * v17);
        double v23 = *v22;
        double v24 = v22[1];
        id v25 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInteger_, v21);
        id v26 = objc_msgSend(self, *a2, v23, v24);
        if (v26)
        {
          id v32 = v26;
          if (v14)
          {
            uint64_t v33 = sub_21C60A680();
            if (__OFADD__(v33, 1))
            {
LABEL_57:
              __break(1u);
              goto LABEL_58;
            }
            uint64_t v13 = sub_21C601060(v15, v33 + 1);
          }
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          unint64_t v36 = sub_21C6014E8((uint64_t)v25);
          uint64_t v37 = *(void *)(v13 + 16);
          BOOL v38 = (v35 & 1) == 0;
          uint64_t v39 = v37 + v38;
          if (!__OFADD__(v37, v38))
          {
            char v40 = v35;
            if (*(void *)(v13 + 24) >= v39)
            {
              a2 = v60;
              if (isUniquelyReferenced_nonNull_native)
              {
LABEL_44:
                if (v40)
                {
                  uint64_t v49 = *(void *)(v13 + 56);
                  v50 = *(void **)(v49 + 8 * v36);
                  *(void *)(v49 + 8 * v36) = v32;
                }
                else
                {
                  *(void *)(v13 + 8 * (v36 >> 6) + 64) |= 1 << v36;
                  uint64_t v51 = 8 * v36;
                  *(void *)(*(void *)(v13 + 48) + v51) = v25;
                  *(void *)(*(void *)(v13 + 56) + v51) = v32;
                  uint64_t v52 = *(void *)(v13 + 16);
                  BOOL v53 = __OFADD__(v52, 1);
                  uint64_t v54 = v52 + 1;
                  if (v53) {
                    goto LABEL_59;
                  }
                  *(void *)(v13 + 16) = v54;
                  id v55 = v25;
                }

LABEL_52:
                swift_bridgeObjectRelease();
                goto LABEL_4;
              }
              sub_21C6021EC();
            }
            else
            {
              sub_21C6015A4(v39, isUniquelyReferenced_nonNull_native);
              unint64_t v41 = sub_21C6014E8((uint64_t)v25);
              if ((v40 & 1) != (v42 & 1)) {
                goto LABEL_61;
              }
              unint64_t v36 = v41;
            }
            a2 = v60;
            goto LABEL_44;
          }
LABEL_56:
          __break(1u);
          goto LABEL_57;
        }
        if (v14) {
          break;
        }
        swift_bridgeObjectRetain();
        unint64_t v29 = sub_21C6014E8((uint64_t)v25);
        char v31 = v30;
        swift_bridgeObjectRelease();
        if (v31)
        {
          a2 = v60;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_21C6021EC();
            a2 = v60;
          }

          v56 = *(void **)(*(void *)(v13 + 56) + 8 * v29);
          sub_21C601E38(v29, v13);

          goto LABEL_52;
        }

        a2 = v60;
      }
      id v27 = v25;
      swift_bridgeObjectRetain();
      uint64_t v28 = sub_21C60A690();

      if (v28) {
        break;
      }

      swift_bridgeObjectRelease();
    }
    swift_unknownObjectRelease();
    uint64_t v43 = sub_21C60A680();
    uint64_t v44 = sub_21C601060(v15, v43);
    swift_retain();
    unint64_t v45 = sub_21C6014E8((uint64_t)v27);
    char v47 = v46;
    swift_release();
    if (v47)
    {

      v48 = *(void **)(*(void *)(v44 + 56) + 8 * v45);
      sub_21C601E38(v45, v44);

      swift_bridgeObjectRelease();
      uint64_t v13 = v44;
      a2 = v60;
      continue;
    }
    break;
  }
LABEL_58:
  __break(1u);
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
LABEL_61:
  sub_21C60237C(0, (unint64_t *)&qword_267C8AFA0);
  sub_21C60A730();
  __break(1u);
}

void CLKDeviceMetrics.scaledValue(_:overrides:)(uint64_t a1, double a2)
{
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v53 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v8 = 0;
  uint64_t v9 = MEMORY[0x263F8EE80];
  uint64_t v52 = v4;
LABEL_6:
  while (2)
  {
    unint64_t v11 = v9 & 0xC000000000000001;
    if (v9 < 0) {
      uint64_t v12 = v9;
    }
    else {
      uint64_t v12 = v9 & 0xFFFFFFFFFFFFFF8;
    }
    while (1)
    {
      while (1)
      {
        if (v7)
        {
          unint64_t v13 = __clz(__rbit64(v7));
          v7 &= v7 - 1;
          unint64_t v14 = v13 | (v8 << 6);
        }
        else
        {
          int64_t v15 = v8 + 1;
          if (__OFADD__(v8, 1))
          {
            __break(1u);
            goto LABEL_54;
          }
          if (v15 >= v53) {
            goto LABEL_52;
          }
          unint64_t v16 = *(void *)(v4 + 8 * v15);
          ++v8;
          if (!v16)
          {
            int64_t v8 = v15 + 1;
            if (v15 + 1 >= v53) {
              goto LABEL_52;
            }
            unint64_t v16 = *(void *)(v4 + 8 * v8);
            if (!v16)
            {
              int64_t v8 = v15 + 2;
              if (v15 + 2 >= v53) {
                goto LABEL_52;
              }
              unint64_t v16 = *(void *)(v4 + 8 * v8);
              if (!v16)
              {
                int64_t v8 = v15 + 3;
                if (v15 + 3 >= v53) {
                  goto LABEL_52;
                }
                unint64_t v16 = *(void *)(v4 + 8 * v8);
                if (!v16)
                {
                  int64_t v8 = v15 + 4;
                  if (v15 + 4 >= v53) {
                    goto LABEL_52;
                  }
                  unint64_t v16 = *(void *)(v4 + 8 * v8);
                  if (!v16)
                  {
                    int64_t v17 = v15 + 5;
                    if (v17 >= v53)
                    {
LABEL_52:
                      swift_release();
                      sub_21C60237C(0, (unint64_t *)&qword_267C8AFA0);
                      sub_21C6023B8();
                      v50 = (void *)sub_21C60A580();
                      swift_bridgeObjectRelease();
                      objc_msgSend(v51, sel_scaledValue_withOverrides_, v50, a2);

                      return;
                    }
                    unint64_t v16 = *(void *)(v4 + 8 * v17);
                    if (!v16)
                    {
                      while (1)
                      {
                        int64_t v8 = v17 + 1;
                        if (__OFADD__(v17, 1)) {
                          goto LABEL_58;
                        }
                        if (v8 >= v53) {
                          goto LABEL_52;
                        }
                        unint64_t v16 = *(void *)(v4 + 8 * v8);
                        ++v17;
                        if (v16) {
                          goto LABEL_28;
                        }
                      }
                    }
                    int64_t v8 = v17;
                  }
                }
              }
            }
          }
LABEL_28:
          unint64_t v7 = (v16 - 1) & v16;
          unint64_t v14 = __clz(__rbit64(v16)) + (v8 << 6);
        }
        uint64_t v18 = 8 * v14;
        double v19 = *(double *)(*(void *)(a1 + 56) + v18);
        id v20 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInteger_, *(void *)(*(void *)(a1 + 48) + v18));
        id v21 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v19);
        if (v21)
        {
          id v27 = v21;
          if (v11)
          {
            uint64_t v28 = sub_21C60A680();
            if (__OFADD__(v28, 1))
            {
LABEL_55:
              __break(1u);
              goto LABEL_56;
            }
            uint64_t v9 = sub_21C6012B4(v12, v28 + 1);
          }
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          unint64_t v31 = sub_21C6014E8((uint64_t)v20);
          uint64_t v32 = *(void *)(v9 + 16);
          BOOL v33 = (v30 & 1) == 0;
          uint64_t v34 = v32 + v33;
          if (!__OFADD__(v32, v33))
          {
            char v35 = v30;
            if (*(void *)(v9 + 24) >= v34)
            {
              if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
                sub_21C602414();
              }
            }
            else
            {
              sub_21C601854(v34, isUniquelyReferenced_nonNull_native);
              unint64_t v36 = sub_21C6014E8((uint64_t)v20);
              if ((v35 & 1) != (v37 & 1)) {
                goto LABEL_59;
              }
              unint64_t v31 = v36;
            }
            uint64_t v4 = v52;
            if (v35)
            {
              uint64_t v10 = *(void *)(v9 + 56);

              *(void *)(v10 + 8 * v31) = v27;
            }
            else
            {
              *(void *)(v9 + 8 * (v31 >> 6) + 64) |= 1 << v31;
              uint64_t v44 = 8 * v31;
              *(void *)(*(void *)(v9 + 48) + v44) = v20;
              *(void *)(*(void *)(v9 + 56) + v44) = v27;
              uint64_t v45 = *(void *)(v9 + 16);
              BOOL v46 = __OFADD__(v45, 1);
              uint64_t v47 = v45 + 1;
              if (v46) {
                goto LABEL_57;
              }
              *(void *)(v9 + 16) = v47;
              id v48 = v20;
            }
LABEL_5:

            swift_bridgeObjectRelease();
            goto LABEL_6;
          }
LABEL_54:
          __break(1u);
          goto LABEL_55;
        }
        if (v11) {
          break;
        }
        swift_bridgeObjectRetain();
        unint64_t v24 = sub_21C6014E8((uint64_t)v20);
        char v26 = v25;
        swift_bridgeObjectRelease();
        if (v26)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_21C602414();
          }

          uint64_t v49 = *(void **)(*(void *)(v9 + 56) + 8 * v24);
          sub_21C601E38(v24, v9);

          goto LABEL_5;
        }
      }
      id v22 = v20;
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_21C60A690();

      if (v23) {
        break;
      }

      swift_bridgeObjectRelease();
    }
    swift_unknownObjectRelease();
    uint64_t v38 = sub_21C60A680();
    uint64_t v39 = sub_21C6012B4(v12, v38);
    swift_retain();
    unint64_t v40 = sub_21C6014E8((uint64_t)v22);
    char v42 = v41;
    swift_release();
    if (v42)
    {

      uint64_t v43 = *(void **)(*(void *)(v39 + 56) + 8 * v40);
      sub_21C601E38(v40, v39);

      swift_bridgeObjectRelease();
      uint64_t v9 = v39;
      continue;
    }
    break;
  }
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  sub_21C60237C(0, (unint64_t *)&qword_267C8AFA0);
  sub_21C60A730();
  __break(1u);
}

id CLKDeviceMetrics.with(roundingBehavior:_:)(uint64_t a1, void (*a2)(id))
{
  id v5 = objc_msgSend(v2, sel_roundingBehavior);
  a2(objc_msgSend(v2, sel_setRoundingBehavior_, a1));

  return objc_msgSend(v2, sel_setRoundingBehavior_, v5);
}

id CLKDeviceMetrics.value(luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:)(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(v4, sel_valueCompact_regular_luxoCompact_luxoRegular_aloeCompact_aloeRegular_, 0.0, 0.0, a1, a2, a3, a4);
}

id CLKDeviceMetrics.value(luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:avoniaCompact:avoniaRegular:)(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return objc_msgSend(v7, sel_valueCompact_regular_luxoCompact_luxoRegular_aloeCompact_aloeRegular_agave_avoniaCompact_avoniaRegular_, 0.0, 0.0, a1, a2, a3, a4, a5, a6, *(void *)&a7);
}

id CLKDeviceMetrics.value(luxoCompact:aloeCompact:luxoRegular:aloeRegular:agave:)(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(v4, sel_valueCompact_regular_luxoCompact_luxoRegular_aloeCompact_aloeRegular_, 0.0, 0.0, a1, a3, a2, a4);
}

id CLKDeviceMetrics.value(luxoCompact:aloeCompact:luxoRegular:aloeRegular:agave:avoniaCompact:avoniaRegular:)(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return objc_msgSend(v7, sel_valueCompact_regular_luxoCompact_luxoRegular_aloeCompact_aloeRegular_agave_avoniaCompact_avoniaRegular_, 0.0, 0.0, a1, a3, a2, a4, a5, a6, *(void *)&a7);
}

uint64_t sub_21C601060(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C8AFC8);
    uint64_t v2 = sub_21C60A6E0();
    uint64_t v18 = v2;
    sub_21C60A670();
    uint64_t v3 = sub_21C60A6A0();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_21C60237C(0, (unint64_t *)&qword_267C8AFA0);
      do
      {
        swift_dynamicCast();
        sub_21C60237C(0, &qword_267C8AFA8);
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_21C6015A4(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        uint64_t result = sub_21C60A610();
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_21C60A6A0();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE80];
  }
  return v2;
}

uint64_t sub_21C6012B4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C8AFC0);
    uint64_t v2 = sub_21C60A6E0();
    uint64_t v18 = v2;
    sub_21C60A670();
    uint64_t v3 = sub_21C60A6A0();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_21C60237C(0, (unint64_t *)&qword_267C8AFA0);
      do
      {
        swift_dynamicCast();
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_21C601854(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        uint64_t result = sub_21C60A610();
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_21C60A6A0();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE80];
  }
  return v2;
}

unint64_t sub_21C6014E8(uint64_t a1)
{
  uint64_t v2 = sub_21C60A610();

  return sub_21C601FEC(a1, v2);
}

unint64_t sub_21C60152C(uint64_t a1, uint64_t a2)
{
  sub_21C60A740();
  sub_21C60A5E0();
  uint64_t v4 = sub_21C60A760();

  return sub_21C602108(a1, a2, v4);
}

uint64_t sub_21C6015A4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C8AFC8);
  char v37 = a2;
  uint64_t v6 = sub_21C60A6D0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    unint64_t v36 = v2;
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v9 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v13 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v15 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v22 = v21 | (v15 << 6);
      }
      else
      {
        if (__OFADD__(v15++, 1)) {
          goto LABEL_38;
        }
        if (v15 >= v12)
        {
LABEL_31:
          swift_release();
          uint64_t v3 = v36;
          if (v37)
          {
            uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
            if (v35 >= 64) {
              bzero((void *)(v5 + 64), ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
            }
            else {
              *unint64_t v9 = -1 << v35;
            }
            *(void *)(v5 + 16) = 0;
          }
          break;
        }
        unint64_t v24 = v9[v15];
        if (!v24)
        {
          int64_t v25 = v15 + 1;
          if (v15 + 1 >= v12) {
            goto LABEL_31;
          }
          unint64_t v24 = v9[v25];
          if (!v24)
          {
            while (1)
            {
              int64_t v15 = v25 + 1;
              if (__OFADD__(v25, 1)) {
                break;
              }
              if (v15 >= v12) {
                goto LABEL_31;
              }
              unint64_t v24 = v9[v15];
              ++v25;
              if (v24) {
                goto LABEL_20;
              }
            }
LABEL_37:
            __break(1u);
LABEL_38:
            __break(1u);
            return result;
          }
          ++v15;
        }
LABEL_20:
        unint64_t v11 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v15 << 6);
      }
      uint64_t v26 = 8 * v22;
      id v27 = *(void **)(*(void *)(v5 + 48) + v26);
      uint64_t v28 = *(void **)(*(void *)(v5 + 56) + v26);
      if ((v37 & 1) == 0)
      {
        id v29 = v27;
        id v30 = v28;
      }
      uint64_t result = sub_21C60A610();
      uint64_t v16 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v17 = result & ~v16;
      unint64_t v18 = v17 >> 6;
      if (((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v31 = 0;
        unint64_t v32 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v32 && (v31 & 1) != 0)
          {
            __break(1u);
            goto LABEL_37;
          }
          BOOL v33 = v18 == v32;
          if (v18 == v32) {
            unint64_t v18 = 0;
          }
          v31 |= v33;
          uint64_t v34 = *(void *)(v13 + 8 * v18);
        }
        while (v34 == -1);
        unint64_t v19 = __clz(__rbit64(~v34)) + (v18 << 6);
      }
      *(void *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t v20 = 8 * v19;
      *(void *)(*(void *)(v7 + 48) + v20) = v27;
      *(void *)(*(void *)(v7 + 56) + v20) = v28;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_21C601854(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C8AFC0);
  uint64_t v6 = sub_21C60A6D0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  unint64_t v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    char v31 = *(void **)(*(void *)(v5 + 48) + v30);
    unint64_t v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    uint64_t result = sub_21C60A610();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  uint64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_21C601B28(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C8AFB8);
  char v6 = a2;
  uint64_t v7 = sub_21C60A6D0();
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v36 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v22 = v21 | (v14 << 6);
      }
      else
      {
        int64_t v23 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v35) {
          goto LABEL_33;
        }
        unint64_t v24 = v36[v23];
        ++v14;
        if (!v24)
        {
          int64_t v14 = v23 + 1;
          if (v23 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v24 = v36[v14];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v35)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v6)
              {
                uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
                if (v34 >= 64) {
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v36 = -1 << v34;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v36[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v14 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_40;
                }
                if (v14 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v24 = v36[v14];
                ++v25;
                if (v24) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v14 = v25;
          }
        }
LABEL_30:
        unint64_t v11 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v14 << 6);
      }
      uint64_t v30 = 16 * v22;
      char v31 = (uint64_t *)(*(void *)(v5 + 48) + v30);
      uint64_t v33 = *v31;
      uint64_t v32 = v31[1];
      long long v37 = *(_OWORD *)(*(void *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        sub_21C602600(v37, *((unint64_t *)&v37 + 1));
      }
      sub_21C60A740();
      sub_21C60A5E0();
      uint64_t result = sub_21C60A760();
      uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v17 == v27;
          if (v17 == v27) {
            unint64_t v17 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v12 + 8 * v17);
        }
        while (v29 == -1);
        unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
      }
      *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t v19 = 16 * v18;
      unint64_t v20 = (void *)(*(void *)(v8 + 48) + v19);
      void *v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(void *)(v8 + 56) + v19) = v37;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v8;
  return result;
}

void sub_21C601E38(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = sub_21C60A650();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v6);
        uint64_t v11 = sub_21C60A610();

        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            uint64_t v15 = *(void *)(a2 + 48);
            unint64_t v16 = (void *)(v15 + 8 * v3);
            unint64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1) {
              void *v16 = *v17;
            }
            uint64_t v18 = *(void *)(a2 + 56);
            uint64_t v19 = (void *)(v18 + 8 * v3);
            unint64_t v20 = (void *)(v18 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v19 >= v20 + 1))
            {
              *uint64_t v19 = *v20;
              int64_t v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << a1) - 1;
  }
  *unint64_t v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

unint64_t sub_21C601FEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_21C60237C(0, (unint64_t *)&qword_267C8AFA0);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_21C60A620();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_21C60A620();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_21C602108(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_21C60A720() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_21C60A720() & 1) == 0);
    }
  }
  return v6;
}

id sub_21C6021EC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C8AFC8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21C60A6C0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    if (!v21) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }
  int64_t v22 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_21C60237C(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_21C6023B8()
{
  unint64_t result = qword_267C8AFB0;
  if (!qword_267C8AFB0)
  {
    sub_21C60237C(255, (unint64_t *)&qword_267C8AFA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C8AFB0);
  }
  return result;
}

id sub_21C602414()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C8AFC0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21C60A6C0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_21C602600(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

void *sub_21C602658()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C8AFB8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21C60A6C0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v24 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    int64_t v20 = (void *)(*(void *)(v4 + 48) + v16);
    void *v20 = v19;
    v20[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v24;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)sub_21C602600(v24, *((unint64_t *)&v24 + 1));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t static Interpolatable.interpolate(start:end:fraction:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>)
{
  uint64_t v32 = a4;
  uint64_t v33 = a5;
  uint64_t v10 = *(void *)(a3 - 8);
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  char v31 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)&v30 - v13;
  uint64_t v15 = sub_21C60A630();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v17 = MEMORY[0x270FA5388](TupleTypeMetadata2 - 8);
  uint64_t v19 = (char *)&v30 - v18;
  int64_t v20 = (char *)&v30 + *(int *)(v17 + 56) - v18;
  int64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
  v21((char *)&v30 - v18, a1, v15);
  v21(v20, a2, v15);
  unint64_t v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  LODWORD(a2) = v22(v19, 1, a3);
  int v23 = v22(v20, 1, a3);
  if (a2 != 1)
  {
    uint64_t v26 = *(void (**)(uint64_t, char *, uint64_t))(v10 + 32);
    if (v23 == 1)
    {
      uint64_t v25 = v33;
      v26(v33, v19, a3);
    }
    else
    {
      v26((uint64_t)v14, v19, a3);
      unint64_t v27 = v31;
      v26((uint64_t)v31, v20, a3);
      uint64_t v25 = v33;
      (*(void (**)(char *, char *, uint64_t, double))(v32 + 8))(v14, v27, a3, a6);
      BOOL v28 = *(void (**)(char *, uint64_t))(v10 + 8);
      v28(v27, a3);
      v28(v14, a3);
    }
    goto LABEL_8;
  }
  if (v23 != 1)
  {
    uint64_t v25 = v33;
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v33, v20, a3);
LABEL_8:
    uint64_t v24 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v25, v24, 1, a3);
  }
  uint64_t v24 = 1;
  uint64_t v25 = v33;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v25, v24, 1, a3);
}

uint64_t static Interpolatable.trilinearInterpolation(a:b:c:x:y:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>, double a7@<D0>, double a8@<D1>)
{
  uint64_t v16 = sub_21C60A630();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  int64_t v20 = (char *)&v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  unint64_t v22 = (char *)&v25 - v21;
  static Interpolatable.interpolate(start:end:fraction:)(a1, a2, a4, a5, (uint64_t)&v25 - v21, a7);
  static Interpolatable.interpolate(start:end:fraction:)(a2, a3, a4, a5, (uint64_t)v20, a7);
  static Interpolatable.interpolate(start:end:fraction:)((uint64_t)v22, (uint64_t)v20, a4, a5, a6, a8);
  int v23 = *(void (**)(char *, uint64_t))(v17 + 8);
  v23(v20, v16);
  return ((uint64_t (*)(char *, uint64_t))v23)(v22, v16);
}

uint64_t static CGSize.interpolate(start:end:fraction:)()
{
  return sub_21C602CF0((uint64_t (*)(void))CLKInterpolateBetweenSizes);
}

void sub_21C602CC0(double *a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
}

uint64_t static CGPoint.interpolate(start:end:fraction:)()
{
  return sub_21C602CF0((uint64_t (*)(void))CLKInterpolateBetweenPoints);
}

uint64_t sub_21C602CF0(uint64_t (*a1)(void))
{
  return a1();
}

void sub_21C602CF8(double *a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
}

void sub_21C602D10(double *a1@<X0>, double *a2@<X1>, double (*a3)(double, double, double, double, double)@<X4>, uint64_t a4@<X8>, double a5@<D0>)
{
  *(double *)a4 = a3(*a1, a1[1], *a2, a2[1], a5);
  *(void *)(a4 + _Block_object_dispose(&a9, 8) = v6;
}

void sub_21C602D4C(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>, double a4@<D0>)
{
  *a3 = CLKInterpolateBetweenFloatsClipped(*a1, *a2, a4);
}

id static UIColor.interpolate(start:end:fraction:)(void *a1, void *a2, double a3)
{
  v13[1] = *(double *)MEMORY[0x263EF8340];
  double v12 = 0.0;
  v13[0] = 0.0;
  double v10 = 0.0;
  double v11 = 0.0;
  objc_msgSend(a1, sel_getRed_green_blue_alpha_, v13, &v12, &v11, &v10);
  double v8 = 0.0;
  double v9 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  objc_msgSend(a2, sel_getRed_green_blue_alpha_, &v9, &v8, &v7, &v6);
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithRed_green_blue_alpha_, (1.0 - a3) * v13[0] + v9 * a3, (1.0 - a3) * v12 + v8 * a3, (1.0 - a3) * v11 + v7 * a3, (1.0 - a3) * v10 + v6 * a3);
}

id sub_21C602EB8@<X0>(void **a1@<X0>, void **a2@<X1>, void *a3@<X8>, double a4@<D0>)
{
  id result = static UIColor.interpolate(start:end:fraction:)(*a1, *a2, a4);
  *a3 = result;
  return result;
}

uint64_t dispatch thunk of static Interpolatable.interpolate(start:end:fraction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

NSArray *sub_21C602F00@<X0>(NSArray **a1@<X8>)
{
  id result = _sSo21CLKComplicationFamilyV8ClockKitE8allCasesSayABGvgZ_0();
  *a1 = result;
  return result;
}

uint64_t static CLKWidgetConstants.Redaction.firstLineLength.getter()
{
  return 16;
}

uint64_t static CLKWidgetConstants.Redaction.secondLineLength.getter()
{
  return 11;
}

uint64_t static CLKWidgetConstants.Redaction.shortFirstLineLength.getter()
{
  return 11;
}

uint64_t static CLKWidgetConstants.Redaction.shortSecondLineLength.getter()
{
  return 7;
}

char *sub_21C602F48(char *a1, int64_t a2, char a3)
{
  id result = sub_21C605ADC(a1, a2, a3, *v3);
  uint64_t *v3 = result;
  return result;
}

NSArray *_sSo21CLKComplicationFamilyV8ClockKitE8allCasesSayABGvgZ_0()
{
  id result = CLKAllComplicationFamilies();
  if (!result) {
    goto LABEL_17;
  }
  uint64_t v1 = result;
  sub_21C6031C4();
  unint64_t v2 = sub_21C60A5F0();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_21C60A6B0();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_4;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    return (NSArray *)MEMORY[0x263F8EE78];
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3) {
    goto LABEL_14;
  }
LABEL_4:
  uint64_t v11 = MEMORY[0x263F8EE78];
  id result = (NSArray *)sub_21C602F48(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = 0;
    uint64_t v5 = v11;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x21D4AA330](v4, v2);
      }
      else {
        id v6 = *(id *)(v2 + 8 * v4 + 32);
      }
      double v7 = v6;
      id v8 = objc_msgSend(v6, sel_integerValue);

      unint64_t v10 = *(void *)(v11 + 16);
      unint64_t v9 = *(void *)(v11 + 24);
      if (v10 >= v9 >> 1) {
        sub_21C602F48((char *)(v9 > 1), v10 + 1, 1);
      }
      ++v4;
      *(void *)(v11 + 16) = v10 + 1;
      *(void *)(v11 + 8 * v10 + 32) = v8;
    }
    while (v3 != v4);
    swift_bridgeObjectRelease();
    return (NSArray *)v5;
  }
  __break(1u);
LABEL_17:
  __break(1u);
  return result;
}

unint64_t sub_21C603100()
{
  unint64_t result = qword_267C8AFD0;
  if (!qword_267C8AFD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267C8AFD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C8AFD0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CLKWidgetConstants()
{
  return &type metadata for CLKWidgetConstants;
}

ValueMetadata *type metadata accessor for CLKWidgetConstants.Redaction()
{
  return &type metadata for CLKWidgetConstants.Redaction;
}

unint64_t sub_21C6031C4()
{
  unint64_t result = qword_267C8AFA0;
  if (!qword_267C8AFA0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267C8AFA0);
  }
  return result;
}

uint64_t KeyedHashingEncoder.requiresSecureCoding.getter()
{
  return 0;
}

Swift::Void __swiftcall KeyedHashingEncoder.finishEncoding()()
{
  *(unsigned char *)(v0 + OBJC_IVAR___CLKKeyedHashingEncoder_state) = 1;
}

uint64_t KeyedHashingEncoder.encodedData.getter()
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v36 = sub_21C60A540();
  uint64_t v35 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  uint64_t v34 = (char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_21C60A570();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  *(unsigned char *)(v0 + OBJC_IVAR___CLKKeyedHashingEncoder_state) = 1;
  uint64_t v44 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C60A560();
  uint64_t v5 = (uint64_t *)(v0 + OBJC_IVAR___CLKKeyedHashingEncoder_keyValuePairs);
  swift_beginAccess();
  uint64_t v6 = *v5;
  swift_bridgeObjectRetain_n();
  double v7 = sub_21C605D68(v6);
  swift_bridgeObjectRelease();
  v46[0] = v7;
  sub_21C605CFC(v46);
  uint64_t v32 = 0;
  uint64_t v33 = v3;
  swift_bridgeObjectRelease();
  long long v37 = v46[0];
  uint64_t v8 = v46[0][2];
  if (v8)
  {
    uint64_t v9 = sub_21C60A5D0();
    uint64_t v42 = v9;
    uint64_t v10 = *(void *)(v9 - 8);
    uint64_t v41 = *(void *)(v10 + 64);
    unint64_t v40 = (void (**)(char *, uint64_t))(v10 + 8);
    uint64_t v11 = v37 + 7;
    while (1)
    {
      uint64_t v43 = v8;
      uint64_t v12 = v2;
      uint64_t v13 = *(v11 - 1);
      unint64_t v14 = *v11;
      MEMORY[0x270FA5388](v9);
      uint64_t v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      swift_bridgeObjectRetain();
      sub_21C602600(v13, v14);
      sub_21C60A5C0();
      uint64_t v17 = sub_21C60A5B0();
      unint64_t v19 = v18;
      swift_bridgeObjectRelease();
      (*v40)(v16, v42);
      if (v19 >> 60 == 15) {
        goto LABEL_38;
      }
      unint64_t v20 = v14 >> 62;
      v11 += 4;
      switch(v19 >> 62)
      {
        case 1uLL:
          uint64_t v39 = v11;
          if (v17 >> 32 < (int)v17)
          {
            __break(1u);
LABEL_31:
            __break(1u);
LABEL_32:
            __break(1u);
LABEL_33:
            __break(1u);
LABEL_34:
            __break(1u);
LABEL_35:
            __break(1u);
LABEL_36:
            __break(1u);
LABEL_37:
            __break(1u);
LABEL_38:
            __break(1u);
          }
          sub_21C602600(v17, v19);
          if (sub_21C60A490() && __OFSUB__((int)v17, sub_21C60A4B0())) {
            goto LABEL_36;
          }
          sub_21C60A4A0();
          sub_21C605E64();
          sub_21C60A510();
          sub_21C605EBC(v17, v19);
          sub_21C605EBC(v17, v19);
          unint64_t v20 = v14 >> 62;
          uint64_t v11 = v39;
LABEL_19:
          switch((int)v20)
          {
            case 1:
              if (v13 >> 32 < (int)v13) {
                goto LABEL_32;
              }
              sub_21C602600(v13, v14);
              if (sub_21C60A490() && __OFSUB__((int)v13, sub_21C60A4B0())) {
                goto LABEL_37;
              }
              sub_21C60A4A0();
              sub_21C605E64();
LABEL_4:
              sub_21C60A510();
              break;
            case 2:
              uint64_t v23 = *(void *)(v13 + 16);
              uint64_t v24 = *(void *)(v13 + 24);
              sub_21C602600(v13, v14);
              swift_retain();
              swift_retain();
              if (sub_21C60A490() && __OFSUB__(v23, sub_21C60A4B0())) {
                goto LABEL_35;
              }
              if (__OFSUB__(v24, v23)) {
                goto LABEL_33;
              }
              sub_21C60A4A0();
              sub_21C605E64();
              sub_21C60A510();
              swift_release();
              swift_release();
              break;
            case 3:
              sub_21C605E64();
              memset(v46, 0, 14);
              goto LABEL_4;
            default:
              v46[0] = (void *)v13;
              LOWORD(v46[1]) = v14;
              BYTE2(v46[1]) = BYTE2(v14);
              BYTE3(v46[1]) = BYTE3(v14);
              BYTE4(v46[1]) = BYTE4(v14);
              BYTE5(v46[1]) = BYTE5(v14);
              sub_21C605E64();
              goto LABEL_4;
          }
          sub_21C605ED0(v13, v14);
          uint64_t v9 = sub_21C605ED0(v13, v14);
          uint64_t v8 = v43 - 1;
          if (v43 == 1) {
            goto LABEL_29;
          }
          break;
        case 2uLL:
          uint64_t v22 = *(void *)(v17 + 16);
          uint64_t v21 = *(unint64_t **)(v17 + 24);
          unint64_t v38 = v14 >> 62;
          uint64_t v39 = v21;
          sub_21C605E50(v17, v19);
          swift_retain();
          swift_retain();
          if (sub_21C60A490() && __OFSUB__(v22, sub_21C60A4B0())) {
            goto LABEL_34;
          }
          if (__OFSUB__(v39, v22)) {
            goto LABEL_31;
          }
          sub_21C60A4A0();
          sub_21C605E64();
          uint64_t v2 = v12;
          sub_21C60A510();
          swift_release();
          swift_release();
          sub_21C605EBC(v17, v19);
          sub_21C605EBC(v17, v19);
          LODWORD(v20) = v38;
          goto LABEL_19;
        case 3uLL:
          sub_21C605E64();
          memset(v46, 0, 14);
          goto LABEL_14;
        default:
          v46[0] = (void *)v17;
          LOWORD(v46[1]) = v19;
          BYTE2(v46[1]) = BYTE2(v19);
          BYTE3(v46[1]) = BYTE3(v19);
          BYTE4(v46[1]) = BYTE4(v19);
          BYTE5(v46[1]) = BYTE5(v19);
          sub_21C605E64();
LABEL_14:
          sub_21C60A510();
          sub_21C605EBC(v17, v19);
          sub_21C605EBC(v17, v19);
          goto LABEL_19;
      }
    }
  }
LABEL_29:
  swift_release();
  uint64_t v25 = v34;
  uint64_t v26 = v44;
  sub_21C60A550();
  uint64_t v27 = v36;
  uint64_t v47 = v36;
  unint64_t v48 = sub_21C605F28();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)v46);
  uint64_t v29 = v35;
  (*(void (**)(uint64_t *, char *, uint64_t))(v35 + 16))(boxed_opaque_existential_1, v25, v27);
  __swift_project_boxed_opaque_existential_0(v46, v47);
  sub_21C60A4D0();
  uint64_t v30 = v45;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v46);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v25, v27);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v26, v2);
  return v30;
}

BOOL sub_21C603BD0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21C603BE8()
{
  return sub_21C60A760();
}

uint64_t sub_21C603C30()
{
  return sub_21C60A750();
}

uint64_t sub_21C603C5C()
{
  return sub_21C60A760();
}

unint64_t sub_21C603CA0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C8AFB8);
  uint64_t v2 = (void *)sub_21C60A6F0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v7 = *(v4 - 1);
    unint64_t v8 = *v4;
    swift_bridgeObjectRetain();
    sub_21C602600(v7, v8);
    unint64_t result = sub_21C60152C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (uint64_t *)(v2[7] + 16 * result);
    uint64_t *v12 = v7;
    v12[1] = v8;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t KeyedHashingEncoder.isFinished.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___CLKKeyedHashingEncoder_state);
}

void KeyedHashingEncoder.encodeValue(ofObjCType:at:)()
{
  uint64_t v0 = (void *)*MEMORY[0x263F08168];
  id v1 = objc_allocWithZone(MEMORY[0x263EFF940]);
  id v2 = v0;
  uint64_t v3 = (void *)sub_21C60A590();
  id v4 = objc_msgSend(v1, sel_initWithName_reason_userInfo_, v2, v3, 0);

  objc_msgSend(v4, sel_raise);
  abort();
}

void KeyedHashingEncoder.encode(_:)()
{
  uint64_t v0 = (void *)*MEMORY[0x263F08168];
  id v1 = objc_allocWithZone(MEMORY[0x263EFF940]);
  id v2 = v0;
  uint64_t v3 = (void *)sub_21C60A590();
  id v4 = objc_msgSend(v1, sel_initWithName_reason_userInfo_, v2, v3, 0);

  objc_msgSend(v4, sel_raise);
  abort();
}

{
  void *v0;
  id v1;
  id v2;
  void *v3;
  id v4;

  uint64_t v0 = (void *)*MEMORY[0x263F08168];
  id v1 = objc_allocWithZone(MEMORY[0x263EFF940]);
  id v2 = v0;
  uint64_t v3 = (void *)sub_21C60A590();
  id v4 = objc_msgSend(v1, sel_initWithName_reason_userInfo_, v2, v3, 0);

  objc_msgSend(v4, sel_raise);
  abort();
}

uint64_t KeyedHashingEncoder.encodeRootObject(_:)(uint64_t a1)
{
  sub_21C606050(a1, (uint64_t)v2);
  KeyedHashingEncoder.encode(_:forKey:)((uint64_t)v2, 0xD000000000000021, 0x800000021C618EF0);
  return sub_21C6060AC((uint64_t)v2);
}

uint64_t KeyedHashingEncoder.encode(_:forKey:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t ObjectType = swift_getObjectType();
  if (*(unsigned char *)(v3 + OBJC_IVAR___CLKKeyedHashingEncoder_state))
  {
    uint64_t v25 = (void *)sub_21C60A590();
    id v26 = objc_allocWithZone(MEMORY[0x263EFF940]);
LABEL_13:
    uint64_t v27 = (void *)sub_21C60A590();
    id v28 = objc_msgSend(v26, sel_initWithName_reason_userInfo_, v25, v27, 0);

    objc_msgSend(v28, sel_raise);
    abort();
  }
  uint64_t v9 = (objc_class *)ObjectType;
  sub_21C60610C(a1, (uint64_t)&v30);
  if (!v31)
  {
    sub_21C6060AC((uint64_t)&v30);
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_21C606FEC(byte_26CCC40A0, 16);
    uint64_t v15 = v14;
    uint64_t v16 = (void *)(v4 + OBJC_IVAR___CLKKeyedHashingEncoder_keyValuePairs);
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v30 = *v16;
    void *v16 = 0x8000000000000000;
    sub_21C605954(v13, v15, a2, a3, isUniquelyReferenced_nonNull_native);
    void *v16 = v30;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
  sub_21C6070A0(&v30, v32);
  char v10 = objc_msgSend(objc_allocWithZone(v9), sel_init);
  sub_21C606050((uint64_t)v32, (uint64_t)&v30);
  unint64_t v11 = sub_21C6070B0();
  if (!swift_dynamicCast()) {
    goto LABEL_11;
  }
  uint64_t v12 = (void *)v29;
  if (objc_msgSend((id)v29, sel_replacementObjectForCoder_, v10))
  {
    sub_21C60A640();
    swift_unknownObjectRelease();
    sub_21C6070A0(&v29, &v30);
  }
  else
  {
    unint64_t v31 = v11;
    *(void *)&long long v30 = v29;
    id v19 = (id)v29;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C8B010);
  if (!swift_dynamicCast())
  {
LABEL_11:
    uint64_t v25 = (void *)sub_21C60A590();
    id v26 = objc_allocWithZone(MEMORY[0x263EFF940]);
    goto LABEL_13;
  }
  objc_msgSend((id)v29, sel_encodeWithCoder_, v10);
  v10[OBJC_IVAR___CLKKeyedHashingEncoder_state] = 1;
  swift_bridgeObjectRetain();
  uint64_t v20 = KeyedHashingEncoder.encodedData.getter();
  uint64_t v22 = v21;
  uint64_t v23 = (void *)(v4 + OBJC_IVAR___CLKKeyedHashingEncoder_keyValuePairs);
  swift_beginAccess();
  char v24 = swift_isUniquelyReferenced_nonNull_native();
  *(void *)&long long v29 = *v23;
  *uint64_t v23 = 0x8000000000000000;
  sub_21C605954(v20, v22, a2, a3, v24);
  *uint64_t v23 = v29;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
}

uint64_t KeyedHashingEncoder.allowsKeyedCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall KeyedHashingEncoder.encode(_:forKey:)(Swift::Bool _, Swift::String forKey)
{
  if (*(unsigned char *)(v2 + OBJC_IVAR___CLKKeyedHashingEncoder_state))
  {
    unint64_t v8 = (void *)sub_21C60A590();
    id v9 = objc_allocWithZone(MEMORY[0x263EFF940]);
    char v10 = (void *)sub_21C60A590();
    id v11 = objc_msgSend(v9, sel_initWithName_reason_userInfo_, v8, v10, 0);

    objc_msgSend(v11, sel_raise);
    abort();
  }
  object = forKey._object;
  uint64_t countAndFlagsBits = forKey._countAndFlagsBits;
  uint64_t v6 = (uint64_t *)(v2 + OBJC_IVAR___CLKKeyedHashingEncoder_keyValuePairs);
  swift_bridgeObjectRetain();
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v12 = *v6;
  uint64_t *v6 = 0x8000000000000000;
  sub_21C605954(_, 0x1000000000000, countAndFlagsBits, (uint64_t)object, isUniquelyReferenced_nonNull_native);
  uint64_t *v6 = v12;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
}

uint64_t _s8ClockKit19KeyedHashingEncoderC10encodeCInt_6forKeyys5Int32V_SStF_0(unsigned int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(v3 + OBJC_IVAR___CLKKeyedHashingEncoder_state))
  {
    uint64_t v12 = (void *)sub_21C60A590();
    id v13 = objc_allocWithZone(MEMORY[0x263EFF940]);
    uint64_t v14 = (void *)sub_21C60A590();
    id v15 = objc_msgSend(v13, sel_initWithName_reason_userInfo_, v12, v14, 0);

    objc_msgSend(v15, sel_raise);
    abort();
  }
  unsigned int __src = bswap32(a1);
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_21C606F28(&__src, v18);
  uint64_t v8 = v7 & 0xFFFFFFFFFFFFFFLL;
  id v9 = (uint64_t *)(v3 + OBJC_IVAR___CLKKeyedHashingEncoder_keyValuePairs);
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = *v9;
  *id v9 = 0x8000000000000000;
  sub_21C605954(v6, v8, a2, a3, isUniquelyReferenced_nonNull_native);
  *id v9 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_21C604AEC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(v3 + OBJC_IVAR___CLKKeyedHashingEncoder_state))
  {
    uint64_t v12 = (void *)sub_21C60A590();
    id v13 = objc_allocWithZone(MEMORY[0x263EFF940]);
    uint64_t v14 = (void *)sub_21C60A590();
    id v15 = objc_msgSend(v13, sel_initWithName_reason_userInfo_, v12, v14, 0);

    objc_msgSend(v15, sel_raise);
    abort();
  }
  unint64_t __src = bswap64(a1);
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_21C606F28(&__src, v18);
  uint64_t v8 = v7 & 0xFFFFFFFFFFFFFFLL;
  id v9 = (uint64_t *)(v3 + OBJC_IVAR___CLKKeyedHashingEncoder_keyValuePairs);
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = *v9;
  *id v9 = 0x8000000000000000;
  sub_21C605954(v6, v8, a2, a3, isUniquelyReferenced_nonNull_native);
  *id v9 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

Swift::Void __swiftcall KeyedHashingEncoder.encode(_:forKey:)(Swift::Int _, Swift::String forKey)
{
}

Swift::Void __swiftcall KeyedHashingEncoder.encode(_:forKey:)(Swift::Float _, Swift::String forKey)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(v2 + OBJC_IVAR___CLKKeyedHashingEncoder_state))
  {
    char v10 = (void *)sub_21C60A590();
    id v11 = objc_allocWithZone(MEMORY[0x263EFF940]);
    uint64_t v12 = (void *)sub_21C60A590();
    id v13 = objc_msgSend(v11, sel_initWithName_reason_userInfo_, v10, v12, 0);

    objc_msgSend(v13, sel_raise);
    abort();
  }
  object = forKey._object;
  uint64_t countAndFlagsBits = forKey._countAndFlagsBits;
  Swift::Float __src = _;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_21C606F28(&__src, v16);
  uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v8 = (uint64_t *)(v2 + OBJC_IVAR___CLKKeyedHashingEncoder_keyValuePairs);
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v14 = *v8;
  *uint64_t v8 = 0x8000000000000000;
  sub_21C605954(v5, v7, countAndFlagsBits, (uint64_t)object, isUniquelyReferenced_nonNull_native);
  *uint64_t v8 = v14;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
}

Swift::Void __swiftcall KeyedHashingEncoder.encode(_:forKey:)(Swift::Double _, Swift::String forKey)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(v2 + OBJC_IVAR___CLKKeyedHashingEncoder_state))
  {
    char v10 = (void *)sub_21C60A590();
    id v11 = objc_allocWithZone(MEMORY[0x263EFF940]);
    uint64_t v12 = (void *)sub_21C60A590();
    id v13 = objc_msgSend(v11, sel_initWithName_reason_userInfo_, v10, v12, 0);

    objc_msgSend(v13, sel_raise);
    abort();
  }
  object = forKey._object;
  uint64_t countAndFlagsBits = forKey._countAndFlagsBits;
  Swift::Double __src = _;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_21C606F28(&__src, v16);
  uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v8 = (uint64_t *)(v2 + OBJC_IVAR___CLKKeyedHashingEncoder_keyValuePairs);
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v14 = *v8;
  *uint64_t v8 = 0x8000000000000000;
  sub_21C605954(v5, v7, countAndFlagsBits, (uint64_t)object, isUniquelyReferenced_nonNull_native);
  *uint64_t v8 = v14;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
}

uint64_t KeyedHashingEncoder.encodeBytes(_:length:forKey:)(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v9 = sub_21C60A570();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_21C60A540();
  uint64_t result = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v4 + OBJC_IVAR___CLKKeyedHashingEncoder_state))
  {
LABEL_14:
    long long v29 = (void *)sub_21C60A590();
    id v30 = objc_allocWithZone(MEMORY[0x263EFF940]);
    unint64_t v31 = (void *)sub_21C60A590();
    id v32 = objc_msgSend(v30, sel_initWithName_reason_userInfo_, v29, v31, 0);

    objc_msgSend(v32, sel_raise);
    abort();
  }
  if (!a1) {
    return result;
  }
  uint64_t v34 = v4;
  uint64_t v35 = v15;
  uint64_t v36 = a3;
  uint64_t v18 = sub_21C606FEC(a1, a2);
  unint64_t v20 = v19;
  sub_21C605E64();
  sub_21C60A530();
  uint64_t v37 = a4;
  switch(v20 >> 62)
  {
    case 1uLL:
      if (v18 >> 32 < (int)v18)
      {
        __break(1u);
        goto LABEL_14;
      }
      unint64_t v33 = v20 & 0x3FFFFFFFFFFFFFFFLL;
      sub_21C602600(v18, v20);
      sub_21C606E64((int)v18, v18 >> 32);
LABEL_8:
      sub_21C605ED0(v18, v20);
LABEL_11:
      sub_21C60A520();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      uint64_t v41 = v13;
      unint64_t v42 = sub_21C605F28();
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v40);
      uint64_t v23 = v35;
      (*(void (**)(uint64_t *, char *, uint64_t))(v35 + 16))(boxed_opaque_existential_1, v17, v13);
      __swift_project_boxed_opaque_existential_0(v40, v41);
      uint64_t v24 = v37;
      swift_bridgeObjectRetain();
      sub_21C60A4D0();
      uint64_t v25 = v38;
      uint64_t v26 = v39;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v40);
      uint64_t v27 = (uint64_t *)(v34 + OBJC_IVAR___CLKKeyedHashingEncoder_keyValuePairs);
      swift_beginAccess();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v38 = *v27;
      *uint64_t v27 = 0x8000000000000000;
      sub_21C605954(v25, v26, v36, v24, isUniquelyReferenced_nonNull_native);
      *uint64_t v27 = v38;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      sub_21C605ED0(v18, v20);
      return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v17, v13);
    case 2uLL:
      uint64_t v21 = *(void *)(v18 + 16);
      unint64_t v33 = *(void *)(v18 + 24);
      sub_21C602600(v18, v20);
      swift_retain();
      swift_retain();
      sub_21C606E64(v21, v33);
      swift_release();
      swift_release();
      goto LABEL_8;
    case 3uLL:
      memset(v40, 0, 14);
      goto LABEL_10;
    default:
      v40[0] = v18;
      LOWORD(v40[1]) = v20;
      BYTE2(v40[1]) = BYTE2(v20);
      BYTE3(v40[1]) = BYTE3(v20);
      BYTE4(v40[1]) = BYTE4(v20);
      BYTE5(v40[1]) = BYTE5(v20);
LABEL_10:
      sub_21C60A510();
      sub_21C605ED0(v18, v20);
      goto LABEL_11;
  }
}

void KeyedHashingEncoder.encodeConditionalObject(_:forKey:)()
{
  uint64_t v0 = (void *)*MEMORY[0x263F08168];
  id v1 = objc_allocWithZone(MEMORY[0x263EFF940]);
  id v2 = v0;
  uint64_t v3 = (void *)sub_21C60A590();
  id v4 = objc_msgSend(v1, sel_initWithName_reason_userInfo_, v2, v3, 0);

  objc_msgSend(v4, sel_raise);
  abort();
}

id KeyedHashingEncoder.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21C605954(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_21C60152C(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_21C602658();
LABEL_7:
    unint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7] + 16 * v14;
      uint64_t result = sub_21C605ED0(*(void *)v21, *(void *)(v21 + 8));
      *(void *)uint64_t v21 = a1;
      *(void *)(v21 + _Block_object_dispose(&a9, 8) = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_21C601B28(v17, a5 & 1);
  unint64_t v23 = sub_21C60152C(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_21C60A730();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  unint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  uint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  uint64_t *v25 = a3;
  v25[1] = a4;
  uint64_t v26 = (void *)(v20[7] + 16 * v14);
  *uint64_t v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;

  return swift_bridgeObjectRetain();
}

char *sub_21C605ADC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C8B038);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  char v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

void *sub_21C605BD8(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C8B020);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[4 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 32 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C8B028);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_21C605CFC(void **a1)
{
  objc_super v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    objc_super v2 = sub_21C606F14(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  uint64_t result = sub_21C606174(v5);
  *a1 = v2;
  return result;
}

void *sub_21C605D68(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C8B020);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 1;
  }
  _OWORD v3[2] = v1;
  v3[3] = 2 * (v5 >> 5);
  unint64_t v6 = sub_21C606C38(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_21C607424();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_21C605E50(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_21C602600(a1, a2);
  }
  return a1;
}

unint64_t sub_21C605E64()
{
  unint64_t result = qword_267C8AFF0;
  if (!qword_267C8AFF0)
  {
    sub_21C60A570();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C8AFF0);
  }
  return result;
}

uint64_t sub_21C605EBC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_21C605ED0(a1, a2);
  }
  return a1;
}

uint64_t sub_21C605ED0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

unint64_t sub_21C605F28()
{
  unint64_t result = qword_267C8AFF8;
  if (!qword_267C8AFF8)
  {
    sub_21C60A540();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C8AFF8);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unsigned char *sub_21C605FD8@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    unint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    unint64_t result = (unsigned char *)sub_21C606F28(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    unint64_t result = (unsigned char *)sub_21C607324((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    unint64_t result = (unsigned char *)sub_21C6073A0((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_21C606050(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21C6060AC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C8B000);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21C60610C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C8B000);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21C606174(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_21C60A700();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_21C606824(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_151;
  }
  uint64_t v103 = result;
  v100 = a1;
  if (v3 <= 1)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    v106 = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v11 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v10 = MEMORY[0x263F8EE78];
LABEL_117:
      uint64_t result = v10;
      uint64_t v102 = v7;
      if (v11 >= 2)
      {
        uint64_t v92 = *v100;
        do
        {
          unint64_t v93 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_146;
          }
          if (!v92) {
            goto LABEL_159;
          }
          uint64_t v94 = result;
          uint64_t v95 = *(void *)(result + 32 + 16 * v93);
          uint64_t v96 = *(void *)(result + 32 + 16 * (v11 - 1) + 8);
          uint64_t result = sub_21C6068F8((char *)(v92 + 32 * v95), (char *)(v92 + 32 * *(void *)(result + 32 + 16 * (v11 - 1))), v92 + 32 * v96, v106);
          if (v1) {
            break;
          }
          if (v96 < v95) {
            goto LABEL_147;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_21C606C24(v94);
            uint64_t v94 = result;
          }
          if (v93 >= *(void *)(v94 + 16)) {
            goto LABEL_148;
          }
          v97 = (void *)(v94 + 32 + 16 * v93);
          void *v97 = v95;
          v97[1] = v96;
          unint64_t v98 = *(void *)(v94 + 16);
          if (v11 > v98) {
            goto LABEL_149;
          }
          memmove((void *)(v94 + 32 + 16 * (v11 - 1)), (const void *)(v94 + 32 + 16 * v11), 16 * (v98 - v11));
          uint64_t result = v94;
          *(void *)(v94 + 16) = v98 - 1;
          unint64_t v11 = v98 - 1;
        }
        while (v98 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(void *)(v102 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v102 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C8B028);
    uint64_t result = sub_21C60A600();
    *(void *)(result + 16) = v6;
    uint64_t v102 = result;
    v106 = (char *)(result + 32);
  }
  uint64_t v8 = 0;
  uint64_t v9 = *a1;
  uint64_t v101 = *a1 + 8;
  uint64_t v99 = *a1 - 32;
  uint64_t v10 = MEMORY[0x263F8EE78];
  uint64_t v104 = v3;
  uint64_t v105 = v9;
  while (1)
  {
    uint64_t v12 = v8++;
    if (v8 >= v3) {
      goto LABEL_45;
    }
    char v13 = (uint64_t *)(v9 + 32 * v8);
    uint64_t result = *v13;
    uint64_t v14 = v13[1];
    uint64_t v15 = (void *)(v9 + 32 * v12);
    if (result == *v15 && v14 == v15[1])
    {
      uint64_t v18 = v12 + 2;
      if (v12 + 2 >= v3) {
        goto LABEL_44;
      }
      int v17 = 0;
    }
    else
    {
      uint64_t result = sub_21C60A720();
      int v17 = result;
      uint64_t v18 = v12 + 2;
      if (v12 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v19 = (void *)(v101 + 32 * v18);
    do
    {
      uint64_t result = *(v19 - 1);
      uint64_t v21 = (void *)(v9 + 32 * v8);
      if (result == *v21 && *v19 == v21[1])
      {
        if (v17) {
          goto LABEL_37;
        }
      }
      else
      {
        uint64_t result = sub_21C60A720();
        if ((v17 ^ result)) {
          goto LABEL_36;
        }
      }
      v19 += 4;
      uint64_t v20 = v18 + 1;
      uint64_t v8 = v18;
      uint64_t v18 = v20;
    }
    while (v20 < v3);
    uint64_t v18 = v20;
LABEL_36:
    uint64_t v8 = v18;
    if (v17)
    {
LABEL_37:
      if (v18 < v12) {
        goto LABEL_155;
      }
      if (v12 < v18)
      {
        uint64_t v23 = 32 * v18;
        uint64_t v24 = 32 * v12;
        uint64_t v25 = v18;
        uint64_t v26 = v12;
        do
        {
          if (v26 != --v25)
          {
            if (!v9) {
              goto LABEL_158;
            }
            uint64_t v27 = (_OWORD *)(v9 + v24);
            uint64_t v28 = v9 + v23;
            uint64_t v29 = *(void *)(v9 + v24);
            uint64_t v30 = *(void *)(v9 + v24 + 8);
            long long v31 = *(_OWORD *)(v9 + v24 + 16);
            long long v32 = *(_OWORD *)(v9 + v23 - 16);
            *uint64_t v27 = *(_OWORD *)(v9 + v23 - 32);
            v27[1] = v32;
            *(void *)(v28 - 32) = v29;
            *(void *)(v28 - 24) = v30;
            *(_OWORD *)(v28 - 16) = v31;
          }
          ++v26;
          v23 -= 32;
          v24 += 32;
        }
        while (v26 < v25);
      }
LABEL_44:
      uint64_t v8 = v18;
    }
LABEL_45:
    if (v8 < v3)
    {
      if (__OFSUB__(v8, v12)) {
        goto LABEL_150;
      }
      if (v8 - v12 < v103) {
        break;
      }
    }
LABEL_66:
    if (v8 < v12) {
      goto LABEL_145;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_21C606B28(0, *(void *)(v10 + 16) + 1, 1, (char *)v10);
      uint64_t v10 = result;
    }
    unint64_t v43 = *(void *)(v10 + 16);
    unint64_t v42 = *(void *)(v10 + 24);
    unint64_t v11 = v43 + 1;
    if (v43 >= v42 >> 1)
    {
      uint64_t result = (uint64_t)sub_21C606B28((char *)(v42 > 1), v43 + 1, 1, (char *)v10);
      uint64_t v10 = result;
    }
    *(void *)(v10 + 16) = v11;
    uint64_t v44 = v10 + 32;
    uint64_t v45 = (uint64_t *)(v10 + 32 + 16 * v43);
    *uint64_t v45 = v12;
    v45[1] = v8;
    if (v43)
    {
      uint64_t v9 = v105;
      while (1)
      {
        unint64_t v46 = v11 - 1;
        if (v11 >= 4)
        {
          unint64_t v51 = v44 + 16 * v11;
          uint64_t v52 = *(void *)(v51 - 64);
          uint64_t v53 = *(void *)(v51 - 56);
          BOOL v57 = __OFSUB__(v53, v52);
          uint64_t v54 = v53 - v52;
          if (v57) {
            goto LABEL_134;
          }
          uint64_t v56 = *(void *)(v51 - 48);
          uint64_t v55 = *(void *)(v51 - 40);
          BOOL v57 = __OFSUB__(v55, v56);
          uint64_t v49 = v55 - v56;
          char v50 = v57;
          if (v57) {
            goto LABEL_135;
          }
          unint64_t v58 = v11 - 2;
          v59 = (uint64_t *)(v44 + 16 * (v11 - 2));
          uint64_t v61 = *v59;
          uint64_t v60 = v59[1];
          BOOL v57 = __OFSUB__(v60, v61);
          uint64_t v62 = v60 - v61;
          if (v57) {
            goto LABEL_136;
          }
          BOOL v57 = __OFADD__(v49, v62);
          uint64_t v63 = v49 + v62;
          if (v57) {
            goto LABEL_138;
          }
          if (v63 >= v54)
          {
            v81 = (uint64_t *)(v44 + 16 * v46);
            uint64_t v83 = *v81;
            uint64_t v82 = v81[1];
            BOOL v57 = __OFSUB__(v82, v83);
            uint64_t v84 = v82 - v83;
            if (v57) {
              goto LABEL_144;
            }
            BOOL v74 = v49 < v84;
            goto LABEL_104;
          }
        }
        else
        {
          if (v11 != 3)
          {
            uint64_t v75 = *(void *)(v10 + 32);
            uint64_t v76 = *(void *)(v10 + 40);
            BOOL v57 = __OFSUB__(v76, v75);
            uint64_t v68 = v76 - v75;
            char v69 = v57;
            goto LABEL_98;
          }
          uint64_t v48 = *(void *)(v10 + 32);
          uint64_t v47 = *(void *)(v10 + 40);
          BOOL v57 = __OFSUB__(v47, v48);
          uint64_t v49 = v47 - v48;
          char v50 = v57;
        }
        if (v50) {
          goto LABEL_137;
        }
        unint64_t v58 = v11 - 2;
        v64 = (uint64_t *)(v44 + 16 * (v11 - 2));
        uint64_t v66 = *v64;
        uint64_t v65 = v64[1];
        BOOL v67 = __OFSUB__(v65, v66);
        uint64_t v68 = v65 - v66;
        char v69 = v67;
        if (v67) {
          goto LABEL_139;
        }
        v70 = (uint64_t *)(v44 + 16 * v46);
        uint64_t v72 = *v70;
        uint64_t v71 = v70[1];
        BOOL v57 = __OFSUB__(v71, v72);
        uint64_t v73 = v71 - v72;
        if (v57) {
          goto LABEL_141;
        }
        if (__OFADD__(v68, v73)) {
          goto LABEL_143;
        }
        if (v68 + v73 >= v49)
        {
          BOOL v74 = v49 < v73;
LABEL_104:
          if (v74) {
            unint64_t v46 = v58;
          }
          goto LABEL_106;
        }
LABEL_98:
        if (v69) {
          goto LABEL_140;
        }
        v77 = (uint64_t *)(v44 + 16 * v46);
        uint64_t v79 = *v77;
        uint64_t v78 = v77[1];
        BOOL v57 = __OFSUB__(v78, v79);
        uint64_t v80 = v78 - v79;
        if (v57) {
          goto LABEL_142;
        }
        if (v80 < v68) {
          goto LABEL_15;
        }
LABEL_106:
        unint64_t v85 = v46 - 1;
        if (v46 - 1 >= v11)
        {
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        if (!v9) {
          goto LABEL_157;
        }
        uint64_t v86 = v9;
        v87 = (uint64_t *)(v44 + 16 * v85);
        uint64_t v88 = *v87;
        v89 = (void *)(v44 + 16 * v46);
        uint64_t v90 = v89[1];
        uint64_t result = sub_21C6068F8((char *)(v86 + 32 * *v87), (char *)(v86 + 32 * *v89), v86 + 32 * v90, v106);
        if (v1) {
          goto LABEL_114;
        }
        if (v90 < v88) {
          goto LABEL_131;
        }
        if (v46 > *(void *)(v10 + 16)) {
          goto LABEL_132;
        }
        uint64_t *v87 = v88;
        *(void *)(v44 + 16 * v85 + _Block_object_dispose(&a9, 8) = v90;
        unint64_t v91 = *(void *)(v10 + 16);
        if (v46 >= v91) {
          goto LABEL_133;
        }
        unint64_t v11 = v91 - 1;
        uint64_t result = (uint64_t)memmove((void *)(v44 + 16 * v46), v89 + 2, 16 * (v91 - 1 - v46));
        *(void *)(v10 + 16) = v91 - 1;
        BOOL v74 = v91 > 2;
        uint64_t v9 = v105;
        if (!v74) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v11 = 1;
    uint64_t v9 = v105;
LABEL_15:
    uint64_t v3 = v104;
    if (v8 >= v104)
    {
      uint64_t v7 = v102;
      goto LABEL_117;
    }
  }
  if (__OFADD__(v12, v103)) {
    goto LABEL_153;
  }
  if (v12 + v103 >= v3) {
    uint64_t v33 = v3;
  }
  else {
    uint64_t v33 = v12 + v103;
  }
  if (v33 >= v12)
  {
    if (v8 != v33)
    {
      uint64_t v34 = v99 + 32 * v8;
      do
      {
        uint64_t v35 = (uint64_t *)(v9 + 32 * v8);
        uint64_t result = *v35;
        uint64_t v36 = v35[1];
        uint64_t v37 = v12;
        uint64_t v38 = v34;
        do
        {
          if (result == *(void *)v38 && v36 == *(void *)(v38 + 8)) {
            break;
          }
          uint64_t result = sub_21C60A720();
          if ((result & 1) == 0) {
            break;
          }
          if (!v9) {
            goto LABEL_156;
          }
          uint64_t result = *(void *)(v38 + 32);
          uint64_t v36 = *(void *)(v38 + 40);
          long long v40 = *(_OWORD *)(v38 + 48);
          long long v41 = *(_OWORD *)(v38 + 16);
          *(_OWORD *)(v38 + 32) = *(_OWORD *)v38;
          *(_OWORD *)(v38 + 4_Block_object_dispose(&a9, 8) = v41;
          *(void *)uint64_t v38 = result;
          *(void *)(v38 + _Block_object_dispose(&a9, 8) = v36;
          *(_OWORD *)(v38 + 16) = v40;
          v38 -= 32;
          ++v37;
        }
        while (v8 != v37);
        ++v8;
        v34 += 32;
      }
      while (v8 != v33);
      uint64_t v8 = v33;
    }
    goto LABEL_66;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
  return result;
}

uint64_t sub_21C606824(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 32 * a3 - 32;
LABEL_5:
    uint64_t v9 = (uint64_t *)(v7 + 32 * v4);
    uint64_t result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    uint64_t v12 = v8;
    while (1)
    {
      BOOL v13 = result == *(void *)v12 && v10 == *(void *)(v12 + 8);
      if (v13 || (uint64_t result = sub_21C60A720(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 32;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t result = *(void *)(v12 + 32);
      uint64_t v10 = *(void *)(v12 + 40);
      long long v14 = *(_OWORD *)(v12 + 48);
      long long v15 = *(_OWORD *)(v12 + 16);
      *(_OWORD *)(v12 + 32) = *(_OWORD *)v12;
      *(_OWORD *)(v12 + 4_Block_object_dispose(&a9, 8) = v15;
      *(void *)uint64_t v12 = result;
      *(void *)(v12 + _Block_object_dispose(&a9, 8) = v10;
      *(_OWORD *)(v12 + 16) = v14;
      v12 -= 32;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_21C6068F8(char *__dst, char *__src, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = __src - __dst;
  int64_t v9 = __src - __dst + 31;
  if (__src - __dst >= 0) {
    int64_t v9 = __src - __dst;
  }
  uint64_t v10 = v9 >> 5;
  uint64_t v11 = a3 - (void)__src;
  uint64_t v12 = a3 - (void)__src + 31;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v12 = a3 - (void)__src;
  }
  uint64_t v13 = v12 >> 5;
  if (v10 >= v12 >> 5)
  {
    if (a4 != __src || &__src[32 * v13] <= a4) {
      memmove(a4, __src, 32 * v13);
    }
    long long v14 = &v4[32 * v13];
    if (v7 >= v6 || v11 < 32) {
      goto LABEL_48;
    }
    uint64_t v18 = (char *)(a3 - 32);
    while (1)
    {
      uint64_t v19 = v18 + 32;
      uint64_t v20 = v6 - 32;
      BOOL v21 = *((void *)v14 - 4) == *((void *)v6 - 4) && *((void *)v14 - 3) == *((void *)v6 - 3);
      if (v21 || (sub_21C60A720() & 1) == 0)
      {
        uint64_t v20 = v14 - 32;
        if (v19 != v14)
        {
          v14 -= 32;
LABEL_45:
          long long v23 = *((_OWORD *)v20 + 1);
          *(_OWORD *)uint64_t v18 = *(_OWORD *)v20;
          *((_OWORD *)v18 + 1) = v23;
          goto LABEL_46;
        }
        BOOL v22 = v18 >= v14;
        v14 -= 32;
        if (v22) {
          goto LABEL_45;
        }
      }
      else
      {
        if (v19 != v6)
        {
          v6 -= 32;
          goto LABEL_45;
        }
        BOOL v22 = v18 >= v6;
        v6 -= 32;
        if (v22) {
          goto LABEL_45;
        }
      }
LABEL_46:
      if (v6 > v7)
      {
        v18 -= 32;
        if (v14 > v4) {
          continue;
        }
      }
      goto LABEL_48;
    }
  }
  if (a4 != __dst || &__dst[32 * v10] <= a4) {
    memmove(a4, __dst, 32 * v10);
  }
  long long v14 = &v4[32 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 32)
  {
    while (1)
    {
      BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
      if (v15 || (sub_21C60A720() & 1) == 0) {
        break;
      }
      BOOL v16 = v6;
      BOOL v15 = v7 == v6;
      v6 += 32;
      if (!v15) {
        goto LABEL_20;
      }
LABEL_21:
      v7 += 32;
      if (v4 >= v14 || (unint64_t)v6 >= a3) {
        goto LABEL_23;
      }
    }
    BOOL v16 = v4;
    BOOL v15 = v7 == v4;
    v4 += 32;
    if (v15) {
      goto LABEL_21;
    }
LABEL_20:
    long long v17 = *((_OWORD *)v16 + 1);
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v16;
    *((_OWORD *)v7 + 1) = v17;
    goto LABEL_21;
  }
LABEL_23:
  uint64_t v6 = v7;
LABEL_48:
  if (v6 != v4 || v6 >= &v4[(v14 - v4 + (v14 - v4 < 0 ? 0x1FuLL : 0)) & 0xFFFFFFFFFFFFFFE0]) {
    memmove(v6, v4, 32 * ((v14 - v4) / 32));
  }
  return 1;
}

char *sub_21C606B28(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C8B030);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  long long v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_21C606C24(uint64_t a1)
{
  return sub_21C606B28(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_21C606C38(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a4 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v7 = ~(-1 << -(char)v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v11 = 0;
    uint64_t v9 = 0;
LABEL_39:
    *uint64_t result = a4;
    result[1] = v5;
    result[2] = ~v6;
    result[3] = v11;
    result[4] = v8;
    return (void *)v9;
  }
  uint64_t v9 = a3;
  if (!a3)
  {
    int64_t v11 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v10 = a2;
  uint64_t v25 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v26 = result;
  int64_t v11 = 0;
  uint64_t v12 = 0;
  int64_t v13 = (unint64_t)(63 - v6) >> 6;
  if (!v8) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v14 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  unint64_t v15 = v14 | (v11 << 6);
  while (1)
  {
    ++v12;
    uint64_t v19 = 16 * v15;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v15);
    uint64_t v21 = v20[1];
    BOOL v22 = (uint64_t *)(*(void *)(a4 + 56) + v19);
    uint64_t v24 = *v22;
    unint64_t v23 = v22[1];
    *uint64_t v10 = *v20;
    v10[1] = v21;
    v10[2] = v24;
    v10[3] = v23;
    if (v12 == v9)
    {
      swift_bridgeObjectRetain();
      sub_21C602600(v24, v23);
      goto LABEL_38;
    }
    v10 += 4;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)sub_21C602600(v24, v23);
    if (v8) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v16 >= v13) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v5 + 8 * v16);
    if (!v17)
    {
      v11 += 2;
      if (v16 + 1 >= v13)
      {
        unint64_t v8 = 0;
        int64_t v11 = v16;
      }
      else
      {
        unint64_t v17 = *(void *)(v5 + 8 * v11);
        if (v17) {
          goto LABEL_14;
        }
        int64_t v18 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v5 + 8 * v18);
        if (v17)
        {
LABEL_17:
          int64_t v16 = v18;
          goto LABEL_18;
        }
        int64_t v11 = v16 + 3;
        if (v16 + 3 < v13)
        {
          unint64_t v17 = *(void *)(v5 + 8 * v11);
          if (v17)
          {
LABEL_14:
            int64_t v16 = v11;
            goto LABEL_18;
          }
          int64_t v18 = v16 + 4;
          if (v16 + 4 >= v13)
          {
LABEL_33:
            unint64_t v8 = 0;
            goto LABEL_37;
          }
          unint64_t v17 = *(void *)(v5 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              int64_t v16 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_42;
              }
              if (v16 >= v13)
              {
                unint64_t v8 = 0;
                int64_t v11 = v13 - 1;
                goto LABEL_37;
              }
              unint64_t v17 = *(void *)(v5 + 8 * v16);
              ++v18;
              if (v17) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v8 = 0;
        int64_t v11 = v16 + 2;
      }
LABEL_37:
      uint64_t v9 = v12;
LABEL_38:
      uint64_t v6 = v25;
      uint64_t result = v26;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v11 = v16;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_21C606E64(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_21C60A490();
  if (!result || (uint64_t result = sub_21C60A4B0(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_21C60A4A0();
      sub_21C60A570();
      sub_21C605E64();
      return sub_21C60A510();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void *sub_21C606F14(void *a1)
{
  return sub_21C605BD8(0, a1[2], 0, a1);
}

uint64_t sub_21C606F28(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_21C606FEC(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return sub_21C606F28(__src, &__src[a2]);
  }
  sub_21C60A4C0();
  swift_allocObject();
  sub_21C60A480();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  sub_21C60A4E0();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

_OWORD *sub_21C6070A0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_21C6070B0()
{
  unint64_t result = qword_267C8B008;
  if (!qword_267C8B008)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267C8B008);
  }
  return result;
}

uint64_t type metadata accessor for KeyedHashingEncoder()
{
  return self;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for KeyedHashingEncoder.State(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for KeyedHashingEncoder.State(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x21C60727CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_21C6072A4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21C6072B0(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for KeyedHashingEncoder.State()
{
  return &type metadata for KeyedHashingEncoder.State;
}

unint64_t sub_21C6072D0()
{
  unint64_t result = qword_267C8B018;
  if (!qword_267C8B018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C8B018);
  }
  return result;
}

uint64_t sub_21C607324(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_21C60A4C0();
  swift_allocObject();
  uint64_t result = sub_21C60A480();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_21C60A4E0();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_21C6073A0(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_21C60A4C0();
  swift_allocObject();
  uint64_t result = sub_21C60A480();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_21C607424()
{
  return swift_release();
}

void CLKPIDIsBeingDebugged_cold_1()
{
  __assert_rtn("CLKPIDIsBeingDebugged", "CLKDefines.m", 428, "junk == 0");
}

uint64_t __getNPSDomainAccessorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getNPSManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getNPSManagerClass_block_invoke_cold_1()
{
  int v0 = abort_report_np();
  return [(CLKIntentReference *)v0 initWithIntent:v2];
}

void _ValidateTemplate_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = CLKStringForComplicationFamily(a1);
  unsigned int v6 = CLKStringForComplicationFamily([a2 compatibleFamily]);
  int v7 = 138412546;
  int v8 = v5;
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_21C599000, a3, OS_LOG_TYPE_FAULT, "Data handler called with incompatible template for complication family. Expected template for '%@', but received one for '%@'.", (uint8_t *)&v7, 0x16u);
}

uint64_t __getAVSynchronizedLayerClass_block_invoke_cold_1()
{
  return __getAVPlayerLayerClass_block_invoke_cold_1();
}

uint64_t __getAVPlayerLayerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAVAudioSessionClass_block_invoke_cold_1(v0);
}

uint64_t __getAVAudioSessionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAVQueuePlayerClass_block_invoke_cold_1(v0);
}

uint64_t __getAVQueuePlayerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAVURLAssetClass_block_invoke_cold_1(v0);
}

uint64_t __getAVURLAssetClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAVPlayerItemClass_block_invoke_cold_1(v0);
}

uint64_t __getAVPlayerItemClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[CLKTimeIntervalTextProvider _validate](v0);
}

void CLKRequestConcreteImplementation_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_21C599000, log, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
}

void _CLKGenerateSimulatedCrash_cold_2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = [a1 UTF8String];
  _os_log_error_impl(&dword_21C599000, a2, OS_LOG_TYPE_ERROR, "Simulated exception: %s", (uint8_t *)&v3, 0xCu);
}

uint64_t sub_21C60A460()
{
  return MEMORY[0x270EE0C98]();
}

uint64_t sub_21C60A470()
{
  return MEMORY[0x270EE0D40]();
}

uint64_t sub_21C60A480()
{
  return MEMORY[0x270EEE630]();
}

uint64_t sub_21C60A490()
{
  return MEMORY[0x270EEE640]();
}

uint64_t sub_21C60A4A0()
{
  return MEMORY[0x270EEE660]();
}

uint64_t sub_21C60A4B0()
{
  return MEMORY[0x270EEE668]();
}

uint64_t sub_21C60A4C0()
{
  return MEMORY[0x270EEE690]();
}

uint64_t sub_21C60A4D0()
{
  return MEMORY[0x270EEEA58]();
}

uint64_t sub_21C60A4E0()
{
  return MEMORY[0x270EF0068]();
}

uint64_t sub_21C60A4F0()
{
  return MEMORY[0x270EF0128]();
}

uint64_t sub_21C60A500()
{
  return MEMORY[0x270EF0170]();
}

uint64_t sub_21C60A510()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_21C60A520()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t sub_21C60A530()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t sub_21C60A540()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_21C60A550()
{
  return MEMORY[0x270EEB078]();
}

uint64_t sub_21C60A560()
{
  return MEMORY[0x270EEB088]();
}

uint64_t sub_21C60A570()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_21C60A580()
{
  return MEMORY[0x270EF1810]();
}

uint64_t sub_21C60A590()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_21C60A5A0()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_21C60A5B0()
{
  return MEMORY[0x270EF1A00]();
}

uint64_t sub_21C60A5C0()
{
  return MEMORY[0x270EF1AA0]();
}

uint64_t sub_21C60A5D0()
{
  return MEMORY[0x270EF1AD8]();
}

uint64_t sub_21C60A5E0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21C60A5F0()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_21C60A600()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_21C60A610()
{
  return MEMORY[0x270FA1178]();
}

uint64_t sub_21C60A620()
{
  return MEMORY[0x270FA1188]();
}

uint64_t sub_21C60A630()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_21C60A640()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_21C60A650()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_21C60A660()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21C60A670()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_21C60A680()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_21C60A690()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_21C60A6A0()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_21C60A6B0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21C60A6C0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_21C60A6D0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_21C60A6E0()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t sub_21C60A6F0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_21C60A700()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_21C60A710()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_21C60A720()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21C60A730()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_21C60A740()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21C60A750()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21C60A760()
{
  return MEMORY[0x270F9FC90]();
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x270EE4870](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterGetFormat(CFDateFormatterRef formatter)
{
  return (CFStringRef)MEMORY[0x270EE48A8](formatter);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x270EE5148](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CTFontSymbolicTraits CTFontGetSymbolicTraits(CTFontRef font)
{
  return MEMORY[0x270EE9C60](font);
}

unsigned int CTFontGetUnitsPerEm(CTFontRef font)
{
  return MEMORY[0x270EE9C88](font);
}

uint64_t INIntentWithTypedIntent()
{
  return MEMORY[0x270EF5248]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

uint64_t NRWatchOSVersionForRemoteDevice()
{
  return MEMORY[0x270F4D8C0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x270EF2BB8]();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F82BC8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

uint64_t UIPointRoundToScale()
{
  return MEMORY[0x270F82E48]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x270F82E70]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x270F82E88]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x270F82E98]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F82EB8]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x270F82F18]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFLocaleCopyAsIfCurrent()
{
  return MEMORY[0x270EE5638]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x270F97D88]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x270F97DF0]();
}

uint64_t archive_read_extract()
{
  return MEMORY[0x270F97ED0]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x270F97EE0]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x270F97EF0]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x270F97EF8]();
}

uint64_t archive_read_open_filename()
{
  return MEMORY[0x270F97F20]();
}

uint64_t archive_read_support_filter_gzip()
{
  return MEMORY[0x270F97F60]();
}

uint64_t archive_read_support_format_zip()
{
  return MEMORY[0x270F97F78]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

uint64_t xpc_copy_entitlements_for_self()
{
  return MEMORY[0x270EDBF58]();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}