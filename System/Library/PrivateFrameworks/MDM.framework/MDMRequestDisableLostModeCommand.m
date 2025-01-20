@interface MDMRequestDisableLostModeCommand
+ (id)request;
+ (id)requestType;
+ (unint64_t)requiredAccessRights;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)processRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation MDMRequestDisableLostModeCommand

+ (id)requestType
{
  return @"DisableLostMode";
}

+ (unint64_t)requiredAccessRights
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MDMRequestDisableLostModeCommand;
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
  v4.super_class = (Class)MDMRequestDisableLostModeCommand;
  return [(RMModelPayloadBase *)&v4 copyWithZone:a3];
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  id v26 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__6;
  v19[4] = __Block_byref_object_dispose__6;
  id v20 = 0;
  v7 = [MEMORY[0x263F3CC60] sharedInstance];
  char v8 = [v7 isManagedLostModeActive];

  if (v8)
  {
    v9 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v9, OS_LOG_TYPE_DEFAULT, "Disabling lost mode...", buf, 2u);
    }
    v10 = objc_alloc_init(MDMLostDeviceLocationManager);
    v11 = [(MDMLostDeviceLocationManager *)v10 lastLocationRequestedDateMessage];
    if (v11)
    {
      v12 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v11;
        _os_log_impl(&dword_230A49000, v12, OS_LOG_TYPE_DEFAULT, "Device was located while in lost mode. Alerting user with message “%{public}@”", buf, 0xCu);
      }
    }
    v13 = [MEMORY[0x263F3CC60] sharedInstance];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __78__MDMRequestDisableLostModeCommand_Handler__processRequest_completionHandler___block_invoke;
    v15[3] = &unk_264B9E158;
    v17 = v19;
    v18 = &v21;
    id v16 = v6;
    [v13 disableManagedLostModeWithLocatedMessage:v11 completion:v15];
  }
  else
  {
    v14 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v14, OS_LOG_TYPE_DEFAULT, "Device is not in lost mode. Reporting success regardless.", buf, 2u);
    }
    (*((void (**)(id, uint64_t))v6 + 2))(v6, v22[5]);
  }
  _Block_object_dispose(v19, 8);

  _Block_object_dispose(&v21, 8);
}

uint64_t __78__MDMRequestDisableLostModeCommand_Handler__processRequest_completionHandler___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a2)
  {
    objc_super v3 = (void *)MEMORY[0x263F087E8];
    uint64_t v4 = *MEMORY[0x263F38B10];
    id v5 = DMCErrorArray();
    uint64_t v6 = objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 12069, v5, *MEMORY[0x263F38A40], 0);
    uint64_t v7 = *(void *)(a1[5] + 8);
    char v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    v9 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(*(void *)(a1[5] + 8) + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v10;
      _os_log_impl(&dword_230A49000, v9, OS_LOG_TYPE_ERROR, "Could not disable lost mode: %{public}@", buf, 0xCu);
    }
    uint64_t v11 = +[MDMAbstractTunnelParser responseWithError:*(void *)(*(void *)(a1[5] + 8) + 40)];
    uint64_t v12 = *(void *)(a1[6] + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

@end