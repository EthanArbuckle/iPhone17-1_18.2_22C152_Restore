@interface MDMRequestPlayLostModeSoundCommand
+ (id)request;
+ (id)requestType;
+ (unint64_t)requiredAccessRights;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)processRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation MDMRequestPlayLostModeSoundCommand

+ (id)requestType
{
  return @"PlayLostModeSound";
}

+ (unint64_t)requiredAccessRights
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MDMRequestPlayLostModeSoundCommand;
  return (unint64_t)objc_msgSendSuper2(&v3, sel_requiredAccessRights);
}

+ (id)request
{
  v2 = objc_opt_new();
  return v2;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  objc_super v3 = objc_opt_new();
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MDMRequestPlayLostModeSoundCommand;
  return [(RMModelPayloadBase *)&v4 copyWithZone:a3];
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__9;
  v32 = __Block_byref_object_dispose__9;
  id v33 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__9;
  v26 = __Block_byref_object_dispose__9;
  id v27 = 0;
  v7 = [MEMORY[0x263F3CC60] sharedInstance];
  char v8 = [v7 isManagedLostModeActive];

  if (v8)
  {
    v9 = [MEMORY[0x263F3CC60] sharedInstance];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __80__MDMRequestPlayLostModeSoundCommand_Handler__processRequest_completionHandler___block_invoke;
    v17[3] = &unk_264B9E158;
    v19 = &v22;
    v20 = &v28;
    id v18 = v6;
    [v9 playSoundWithOptions:0 completion:v17];
  }
  else
  {
    v10 = (void *)MEMORY[0x263F087E8];
    v11 = DMCErrorArray();
    uint64_t v12 = objc_msgSend(v10, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x263F38B10], 12067, v11, *MEMORY[0x263F38A40], 0);
    v13 = (void *)v23[5];
    v23[5] = v12;

    v14 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v14, OS_LOG_TYPE_ERROR, "Could not play sound in MDM Lost Mode: Device is not in lost mode.", buf, 2u);
    }
    uint64_t v15 = +[MDMAbstractTunnelParser responseWithError:v23[5]];
    v16 = (void *)v29[5];
    v29[5] = v15;

    (*((void (**)(id, uint64_t))v6 + 2))(v6, v29[5]);
  }
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
}

uint64_t __80__MDMRequestPlayLostModeSoundCommand_Handler__processRequest_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a2)
  {
    objc_super v3 = (void *)MEMORY[0x263F087E8];
    uint64_t v4 = *MEMORY[0x263F38B10];
    id v5 = a2;
    id v6 = DMCErrorArray();
    uint64_t v7 = objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 12080, v6, v5, *MEMORY[0x263F38A40], 0);

    uint64_t v8 = *(void *)(a1[5] + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    v10 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(void **)(*(void *)(a1[5] + 8) + 40);
      uint64_t v12 = v10;
      v13 = [v11 DMCVerboseDescription];
      *(_DWORD *)buf = 138543362;
      v19 = v13;
      _os_log_impl(&dword_230A49000, v12, OS_LOG_TYPE_ERROR, "Could not to enable MDM Lost Mode: %{public}@", buf, 0xCu);
    }
    uint64_t v14 = +[MDMAbstractTunnelParser responseWithError:*(void *)(*(void *)(a1[5] + 8) + 40)];
    uint64_t v15 = *(void *)(a1[6] + 8);
    v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

@end