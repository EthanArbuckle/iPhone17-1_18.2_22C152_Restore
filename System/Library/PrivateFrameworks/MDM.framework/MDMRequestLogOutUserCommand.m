@interface MDMRequestLogOutUserCommand
+ (id)request;
+ (id)requestType;
+ (unint64_t)requiredAccessRights;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (BOOL)shouldBlockUserSwitch;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)processRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation MDMRequestLogOutUserCommand

+ (id)requestType
{
  return @"LogOutUser";
}

+ (unint64_t)requiredAccessRights
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MDMRequestLogOutUserCommand;
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
  v4.super_class = (Class)MDMRequestLogOutUserCommand;
  return [(RMModelPayloadBase *)&v4 copyWithZone:a3];
}

- (BOOL)shouldBlockUserSwitch
{
  return 0;
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__8;
  v31 = __Block_byref_object_dispose__8;
  id v32 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__8;
  v25 = __Block_byref_object_dispose__8;
  id v26 = 0;
  v8 = [MEMORY[0x263F841B0] sharedManager];
  v9 = [v8 currentUser];
  int v10 = [v9 isLoginUser];

  if (v10)
  {
    v11 = (void *)MEMORY[0x263F087E8];
    v12 = DMCErrorArray();
    uint64_t v13 = objc_msgSend(v11, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", *MEMORY[0x263F38B10], 12125, v12, 0, *MEMORY[0x263F38A40], 0);
    v14 = (void *)v22[5];
    v22[5] = v13;

    uint64_t v15 = +[MDMAbstractTunnelParser responseWithError:v22[5]];
    v16 = (void *)v28[5];
    v28[5] = v15;

    v7[2](v7, v28[5]);
  }
  else
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __73__MDMRequestLogOutUserCommand_Handler__processRequest_completionHandler___block_invoke;
    v17[3] = &unk_264B9E210;
    v19 = &v21;
    v20 = &v27;
    v17[4] = self;
    v18 = v7;
    [v8 switchToLoginUserWithCompletionHandler:v17];
  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
}

void __73__MDMRequestLogOutUserCommand_Handler__processRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  if (v12)
  {
    objc_super v3 = (void *)MEMORY[0x263F087E8];
    uint64_t v4 = *MEMORY[0x263F38B10];
    v5 = DMCErrorArray();
    uint64_t v6 = objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 12124, v5, v12, *MEMORY[0x263F38A40], 0);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = +[MDMAbstractTunnelParser responseWithError:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    v11 = [*(id *)(a1 + 32) delegate];
    [v11 didInitiateSwitchUser];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end