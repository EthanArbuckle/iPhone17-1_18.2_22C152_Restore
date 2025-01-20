@interface HDSDeviceActivation
+ (OS_os_log)signpostLog;
- (id)_setupUserAgent;
- (unint64_t)signpostID;
- (void)_mae_activateWithData:(id)a3 headers:(id)a4 completion:(id)a5;
- (void)_mae_createActivationWithData:(id)a3 completion:(id)a4;
- (void)_mae_createSessionWithCompletion:(id)a3;
- (void)_mae_getActivationStateWithCompletion:(id)a3;
- (void)performActivationStep:(id)a3 completion:(id)a4;
@end

@implementation HDSDeviceActivation

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__HDSDeviceActivation_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_169 != -1) {
    dispatch_once(&signpostLog_onceToken_169, block);
  }
  v2 = (void *)signpostLog_log_168;
  return (OS_os_log *)v2;
}

void __34__HDSDeviceActivation_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.HomeDeviceSetup.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_168;
  signpostLog_log_168 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (void)_mae_getActivationStateWithCompletion:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  os_signpost_id_t v4 = (void (**)(id, void, void *))a3;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = [(id)objc_opt_class() signpostLog];
  unint64_t v6 = [(HDSDeviceActivation *)self signpostID];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "DeviceActivationStepCheckState", "", buf, 2u);
    }
  }

  v8 = (void *)MAEGetActivationStateWithError();
  int v9 = [v8 isEqualToString:*MEMORY[0x263F55850]];
  v10 = [(id)objc_opt_class() signpostLog];
  unint64_t v11 = [(HDSDeviceActivation *)self signpostID];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v12 = v11;
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v10, OS_SIGNPOST_INTERVAL_END, v12, "DeviceActivationStepCheckState", "", buf, 2u);
    }
  }

  v16 = @"a";
  v13 = [NSNumber numberWithBool:v9 ^ 1u];
  v17[0] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  v4[2](v4, 0, v14);
}

- (void)performActivationStep:(id)a3 completion:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    v13 = "-[HDSDeviceActivation performActivationStep:completion:]";
    LogPrintF();
  }
  v8 = objc_msgSend(v14, "objectForKeyedSubscript:", @"s", v13);
  if (!v8)
  {
    os_signpost_id_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"HDSDeviceActivation.m" lineNumber:321 description:@"missing activation step"];
  }
  switch([v8 integerValue])
  {
    case 0:
      [(HDSDeviceActivation *)self _mae_getActivationStateWithCompletion:v7];
      break;
    case 1:
      [(HDSDeviceActivation *)self _mae_createSessionWithCompletion:v7];
      break;
    case 2:
      v10 = [v14 objectForKeyedSubscript:@"d"];
      [(HDSDeviceActivation *)self _mae_createActivationWithData:v10 completion:v7];
      goto LABEL_13;
    case 3:
      v10 = [v14 objectForKeyedSubscript:@"d"];
      unint64_t v11 = [v14 objectForKeyedSubscript:@"h"];
      [(HDSDeviceActivation *)self _mae_activateWithData:v10 headers:v11 completion:v7];

LABEL_13:
      break;
    default:
      int v9 = [MEMORY[0x263F08690] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"HDSDeviceActivation.m" lineNumber:341 description:@"invalid activation step"];

      break;
  }
}

- (void)_mae_createSessionWithCompletion:(id)a3
{
  id v4 = a3;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__HDSDeviceActivation__mae_createSessionWithCompletion___block_invoke;
  block[3] = &unk_26503F830;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

void __56__HDSDeviceActivation__mae_createSessionWithCompletion___block_invoke(uint64_t a1)
{
  v27[1] = *MEMORY[0x263EF8340];
  v2 = [(id)objc_opt_class() signpostLog];
  uint64_t v3 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "DeviceActivationStepCreateSession", "", buf, 2u);
    }
  }

  uint64_t v23 = 0;
  uint64_t v24 = 0;
  char v5 = MAECreateSessionRequestWithError();
  id v6 = 0;
  id v7 = 0;
  if (v5)
  {
    id v8 = (objc_class *)MEMORY[0x263F08910];
    id v9 = v6;
    v10 = (void *)[[v8 alloc] initRequiringSecureCoding:1];
    [v10 encodeObject:v9 forKey:@"request"];

    [v10 finishEncoding];
    unint64_t v11 = [v10 encodedData];

    v26 = @"r";
    v27[0] = v11;
    os_signpost_id_t v12 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
  }
  else
  {
    if (gLogCategory_HDSDeviceActivation <= 40
      && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    os_signpost_id_t v12 = 0;
  }
  v13 = [(id)objc_opt_class() signpostLog];
  uint64_t v14 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v15 = v14;
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v13, OS_SIGNPOST_INTERVAL_END, v15, "DeviceActivationStepCreateSession", "", buf, 2u);
    }
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__HDSDeviceActivation__mae_createSessionWithCompletion___block_invoke_181;
  block[3] = &unk_2650402B0;
  id v16 = *(id *)(a1 + 40);
  id v21 = v12;
  id v22 = v16;
  id v20 = v7;
  id v17 = v12;
  id v18 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __56__HDSDeviceActivation__mae_createSessionWithCompletion___block_invoke_181(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_mae_createActivationWithData:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v9 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__HDSDeviceActivation__mae_createActivationWithData_completion___block_invoke;
  block[3] = &unk_2650402D8;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __64__HDSDeviceActivation__mae_createActivationWithData_completion___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  v2 = [(id)objc_opt_class() signpostLog];
  uint64_t v3 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "DeviceActivationStepCreateActivation", "", buf, 2u);
    }
  }

  uint64_t v47 = 0;
  uint64_t v48 = 0;
  char v5 = MAECreateActivationRequestWithError();
  id v6 = 0;
  id v7 = 0;
  if (v5)
  {
    id v8 = [v6 valueForHTTPHeaderField:@"User-Agent"];
    if (!v8)
    {
      v36 = [MEMORY[0x263F08690] currentHandler];
      [v36 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"HDSDeviceActivation.m" lineNumber:395 description:@"missing user-agent header"];
    }
    id v9 = [*(id *)(a1 + 32) _setupUserAgent];
    id v10 = [v9 stringByAppendingFormat:@" %@", v8];
    [v6 setValue:v10 forHTTPHeaderField:@"User-Agent"];
    id v11 = [MEMORY[0x263EFF960] preferredLanguages];
    os_signpost_id_t v12 = [v11 firstObject];
    [v6 setValue:v12 forHTTPHeaderField:@"Accept-Language"];

    if (IsAppleInternalBuild())
    {
      id v13 = [v6 URL];
      id v14 = [v13 absoluteString];
      int v15 = [v14 hasSuffix:@"/deviceActivation"];

      if (v15)
      {
        v37 = v10;
        v38 = v9;
        id v16 = [MEMORY[0x263EFFA40] standardUserDefaults];
        id v17 = [v16 dictionaryForKey:@"CustomActivationHeaders"];

        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v18 = v17;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v44;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v44 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = *(void *)(*((void *)&v43 + 1) + 8 * i);
              uint64_t v24 = [v18 objectForKeyedSubscript:v23];
              [v6 setValue:v24 forHTTPHeaderField:v23];
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v43 objects:v52 count:16];
          }
          while (v20);
        }

        id v10 = v37;
        id v9 = v38;
      }
    }
    v25 = (objc_class *)MEMORY[0x263F08910];
    id v26 = v6;
    v27 = (void *)[[v25 alloc] initRequiringSecureCoding:1];
    [v27 encodeObject:v26 forKey:@"request"];

    [v27 finishEncoding];
    v28 = [v27 encodedData];

    v50 = @"r";
    v51 = v28;
    v29 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
  }
  else
  {
    if (gLogCategory_HDSDeviceActivation <= 40
      && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v29 = 0;
  }
  v30 = [(id)objc_opt_class() signpostLog];
  uint64_t v31 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v32 = v31;
    if (os_signpost_enabled(v30))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v30, OS_SIGNPOST_INTERVAL_END, v32, "DeviceActivationStepCreateActivation", "", buf, 2u);
    }
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__HDSDeviceActivation__mae_createActivationWithData_completion___block_invoke_203;
  block[3] = &unk_2650402B0;
  id v33 = *(id *)(a1 + 48);
  id v41 = v29;
  id v42 = v33;
  id v40 = v7;
  id v34 = v29;
  id v35 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __64__HDSDeviceActivation__mae_createActivationWithData_completion___block_invoke_203(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_mae_activateWithData:(id)a3 headers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v11 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__HDSDeviceActivation__mae_activateWithData_headers_completion___block_invoke;
  block[3] = &unk_265040300;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, block);
}

void __64__HDSDeviceActivation__mae_activateWithData_headers_completion___block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v17 = *MEMORY[0x263F55858];
    v18[0] = v2;
    uint64_t v3 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  }
  else
  {
    uint64_t v3 = 0;
  }
  os_signpost_id_t v4 = [(id)objc_opt_class() signpostLog];
  uint64_t v5 = [*(id *)(a1 + 40) signpostID];
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "DeviceActivationStepActivate", "", buf, 2u);
    }
  }

  uint64_t v7 = MAEActivateDeviceWithError();
  id v8 = 0;
  int v15 = @"a";
  id v9 = [NSNumber numberWithBool:v7];
  id v16 = v9;
  id v10 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

  id v11 = [(id)objc_opt_class() signpostLog];
  uint64_t v12 = [*(id *)(a1 + 40) signpostID];
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v11, OS_SIGNPOST_INTERVAL_END, v13, "DeviceActivationStepActivate", "", buf, 2u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)_setupUserAgent
{
  if (_setupUserAgent_onceToken != -1) {
    dispatch_once(&_setupUserAgent_onceToken, &__block_literal_global_5);
  }
  uint64_t v2 = (void *)_setupUserAgent___userAgent;
  return v2;
}

void __38__HDSDeviceActivation__setupUserAgent__block_invoke()
{
  uint64_t v5 = (__CFString *)MGCopyAnswer();
  v0 = (__CFString *)MGCopyAnswer();
  os_log_t v1 = (__CFString *)MGCopyAnswer();
  if (![(__CFString *)v5 length])
  {

    uint64_t v5 = @"1.0";
  }
  if (![(__CFString *)v0 length])
  {

    v0 = @"1A001a";
  }
  if (![(__CFString *)v1 length])
  {

    os_log_t v1 = &stru_26F254F18;
  }
  uint64_t v2 = [NSString stringWithFormat:@"iOS %@ %@ %@ Setup Assistant", v5, v0, v1];
  uint64_t v3 = [v2 copy];
  os_signpost_id_t v4 = (void *)_setupUserAgent___userAgent;
  _setupUserAgent___userAgent = v3;

  if (gLogCategory_HDSDeviceActivation <= 40
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

@end