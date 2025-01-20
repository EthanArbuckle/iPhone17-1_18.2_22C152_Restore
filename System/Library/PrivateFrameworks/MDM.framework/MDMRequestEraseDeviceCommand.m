@interface MDMRequestEraseDeviceCommand
+ (id)requestType;
+ (id)requestWithPreserveDataPlan:(id)a3 disallowProximitySetup:(id)a4 PIN:(id)a5 obliterationBehavior:(id)a6 returnToService:(id)a7;
+ (unint64_t)requiredAccessRights;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (MDMRequestEraseDeviceCommand_ReturnToService)commandReturnToService;
- (NSNumber)commandDisallowProximitySetup;
- (NSNumber)commandPreserveDataPlan;
- (NSString)commandObliterationBehavior;
- (NSString)commandPIN;
- (id)_eraseDeviceActivationLockIsOnError;
- (id)_eraseDeviceContainsMDMPayloadError;
- (id)_eraseDeviceFailedToEraseErrorWithUnderlayingError:(id)a3;
- (id)_eraseDeviceInvalidMDMProfileErrorWithUnderlayingError:(id)a3;
- (id)_eraseDeviceInvalidWiFiProfileErrorWithUnderlayingError:(id)a3;
- (id)_eraseDeviceMissingMDMProfileError;
- (id)_eraseDeviceNotSupporttedError;
- (id)_eraseDeviceNotSupporttedOnSharedIPadError;
- (id)_eraseDeviceNotTeslaEnrolledError;
- (id)_eraseDeviceProvisionallyEnrolledError;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)processRequest:(id)a3 completionHandler:(id)a4;
- (void)setCommandDisallowProximitySetup:(id)a3;
- (void)setCommandObliterationBehavior:(id)a3;
- (void)setCommandPIN:(id)a3;
- (void)setCommandPreserveDataPlan:(id)a3;
- (void)setCommandReturnToService:(id)a3;
@end

@implementation MDMRequestEraseDeviceCommand

+ (id)requestType
{
  return @"EraseDevice";
}

+ (unint64_t)requiredAccessRights
{
  return 8;
}

+ (id)requestWithPreserveDataPlan:(id)a3 disallowProximitySetup:(id)a4 PIN:(id)a5 obliterationBehavior:(id)a6 returnToService:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_opt_new();
  v17 = v16;
  v18 = (void *)MEMORY[0x263EFFA80];
  if (v15) {
    id v19 = v15;
  }
  else {
    id v19 = (id)MEMORY[0x263EFFA80];
  }
  [v16 setCommandPreserveDataPlan:v19];

  if (v14) {
    id v20 = v14;
  }
  else {
    id v20 = v18;
  }
  [v17 setCommandDisallowProximitySetup:v20];

  [v17 setCommandPIN:v13];
  [v17 setCommandObliterationBehavior:v12];

  [v17 setCommandReturnToService:v11];
  return v17;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  BOOL v9 = 0;
  if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"PreserveDataPlan" forKeyPath:@"commandPreserveDataPlan" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
  {
    BOOL v9 = 0;
    if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"DisallowProximitySetup" forKeyPath:@"commandDisallowProximitySetup" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
    {
      BOOL v9 = 0;
      if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"PIN" forKeyPath:@"commandPIN" isRequired:0 defaultValue:0 error:a5])
      {
        BOOL v9 = 0;
        if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"ObliterationBehavior" forKeyPath:@"commandObliterationBehavior" isRequired:0 defaultValue:0 error:a5])
        {
          LOWORD(v11) = a4;
          BOOL v9 = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"ReturnToService" forKeyPath:@"commandReturnToService" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v11 error:a5];
        }
      }
    }
  }

  return v9;
}

- (id)serializeWithType:(signed __int16)a3
{
  v5 = objc_opt_new();
  v6 = [(MDMRequestEraseDeviceCommand *)self commandPreserveDataPlan];
  uint64_t v7 = MEMORY[0x263EFFA80];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"PreserveDataPlan" value:v6 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  id v8 = [(MDMRequestEraseDeviceCommand *)self commandDisallowProximitySetup];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"DisallowProximitySetup" value:v8 isRequired:0 defaultValue:v7];

  BOOL v9 = [(MDMRequestEraseDeviceCommand *)self commandPIN];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"PIN" value:v9 isRequired:0 defaultValue:0];

  v10 = [(MDMRequestEraseDeviceCommand *)self commandObliterationBehavior];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"ObliterationBehavior" value:v10 isRequired:0 defaultValue:0];

  uint64_t v11 = [(MDMRequestEraseDeviceCommand *)self commandReturnToService];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__MDMRequestEraseDeviceCommand_serializeWithType___block_invoke;
  v14[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v15 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"ReturnToService" value:v11 dictSerializer:v14 isRequired:0 defaultValue:0];

  id v12 = (void *)[v5 copy];
  return v12;
}

uint64_t __50__MDMRequestEraseDeviceCommand_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)MDMRequestEraseDeviceCommand;
  v4 = [(RMModelPayloadBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_commandPreserveDataPlan copy];
  v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSNumber *)self->_commandDisallowProximitySetup copy];
  id v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSString *)self->_commandPIN copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  uint64_t v11 = [(NSString *)self->_commandObliterationBehavior copy];
  id v12 = (void *)v4[9];
  v4[9] = v11;

  uint64_t v13 = [(MDMRequestEraseDeviceCommand_ReturnToService *)self->_commandReturnToService copy];
  id v14 = (void *)v4[10];
  v4[10] = v13;

  return v4;
}

- (NSNumber)commandPreserveDataPlan
{
  return self->_commandPreserveDataPlan;
}

- (void)setCommandPreserveDataPlan:(id)a3
{
}

- (NSNumber)commandDisallowProximitySetup
{
  return self->_commandDisallowProximitySetup;
}

- (void)setCommandDisallowProximitySetup:(id)a3
{
}

- (NSString)commandPIN
{
  return self->_commandPIN;
}

- (void)setCommandPIN:(id)a3
{
}

- (NSString)commandObliterationBehavior
{
  return self->_commandObliterationBehavior;
}

- (void)setCommandObliterationBehavior:(id)a3
{
}

- (MDMRequestEraseDeviceCommand_ReturnToService)commandReturnToService
{
  return self->_commandReturnToService;
}

- (void)setCommandReturnToService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandReturnToService, 0);
  objc_storeStrong((id *)&self->_commandObliterationBehavior, 0);
  objc_storeStrong((id *)&self->_commandPIN, 0);
  objc_storeStrong((id *)&self->_commandDisallowProximitySetup, 0);
  objc_storeStrong((id *)&self->_commandPreserveDataPlan, 0);
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v75 = a3;
  v6 = (void (**)(id, void *))a4;
  uint64_t v7 = [(MDMRequestEraseDeviceCommand *)self commandPreserveDataPlan];
  int v8 = [v7 BOOLValue];

  uint64_t v9 = [(MDMRequestEraseDeviceCommand *)self commandDisallowProximitySetup];
  uint64_t v10 = [v9 BOOLValue];

  uint64_t v11 = [(MDMRequestEraseDeviceCommand *)self commandReturnToService];
  id v12 = [v11 commandEnabled];
  int v13 = [v12 BOOLValue];

  if (!v13)
  {
    id v21 = 0;
LABEL_10:
    v22 = [(MDMRequestBase *)self delegate];
    v23 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
    [v22 willTerminateProcess:v23];

    dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v83 = 0x3032000000;
    v84 = __Block_byref_object_copy__7;
    v85 = __Block_byref_object_dispose__7;
    id v86 = 0;
    id v25 = objc_alloc_init(MEMORY[0x263F3B438]);
    [v25 setHideProgress:1];
    [v25 setEraseDataPlan:v8 ^ 1u];
    [v25 setDisallowProximitySetup:v10];
    if (v13)
    {
      v26 = [v21 generateExclusionPaths];
      [v25 setExclusionPaths:v26];
    }
    v27 = (void *)[objc_alloc(MEMORY[0x263F3B440]) initWithMode:4 options:v25 reason:@"mdmd erase device command"];
    v28 = [MEMORY[0x263F3B448] sharedInstance];
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = __74__MDMRequestEraseDeviceCommand_Handler__processRequest_completionHandler___block_invoke;
    v76[3] = &unk_264B9E1E8;
    p_long long buf = &buf;
    v76[4] = self;
    v29 = v24;
    v77 = v29;
    [v28 resetWithRequest:v27 completion:v76];

    dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
    v30 = +[MDMAbstractTunnelParser responseWithError:*(void *)(*((void *)&buf + 1) + 40)];
    v6[2](v6, v30);

    _Block_object_dispose(&buf, 8);
    goto LABEL_18;
  }
  id v14 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_230A49000, v14, OS_LOG_TYPE_DEFAULT, "ReturnToService option is selected", (uint8_t *)&buf, 2u);
  }
  signed __int16 v15 = [MEMORY[0x263F52808] sharedConfiguration];
  objc_super v16 = [v15 enrollmentServerInfo];
  if (v16)
  {
    v17 = [MEMORY[0x263EFB210] defaultStore];
    v18 = objc_msgSend(v17, "dmc_visibleRemoteManagementAccounts");
    BOOL v19 = [v18 count] == 0;

    if (!v19)
    {
      id v20 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_230A49000, v20, OS_LOG_TYPE_ERROR, "Device is enrolled with Apple Bussiness Essentials.", (uint8_t *)&buf, 2u);
      }
LABEL_17:
      id v21 = [(MDMRequestEraseDeviceCommand *)self _eraseDeviceNotSupporttedError];
      v29 = +[MDMAbstractTunnelParser responseWithError:v21];
      v6[2](v6, v29);
      goto LABEL_18;
    }
  }
  else
  {
  }
  v31 = [MEMORY[0x263F52810] sharedConfiguration];
  v32 = [v31 personaID];
  BOOL v33 = v32 == 0;

  if (!v33)
  {
    v34 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_230A49000, v34, OS_LOG_TYPE_ERROR, "Device has enterprise persona.", (uint8_t *)&buf, 2u);
    }
    goto LABEL_17;
  }
  v35 = [MEMORY[0x263F52808] sharedConfiguration];
  if ([v35 isSupervised])
  {
  }
  else
  {
    BOOL v36 = +[MDMFindMyUtilities isActivationLockOn];

    if (v36)
    {
      v37 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_230A49000, v37, OS_LOG_TYPE_ERROR, "Failed to trigger return to service since activation lock is on", (uint8_t *)&buf, 2u);
      }
      id v21 = [(MDMRequestEraseDeviceCommand *)self _eraseDeviceActivationLockIsOnError];
      v29 = +[MDMAbstractTunnelParser responseWithError:v21];
      v6[2](v6, v29);
      goto LABEL_18;
    }
  }
  v38 = [(MDMRequestEraseDeviceCommand *)self commandReturnToService];
  v39 = [v38 commandWiFiProfileData];
  BOOL v40 = v39 == 0;

  if (!v40)
  {
    v41 = (void *)MEMORY[0x263F53C48];
    v42 = [(MDMRequestEraseDeviceCommand *)self commandReturnToService];
    v43 = [v42 commandWiFiProfileData];
    id v81 = 0;
    v29 = [v41 profileWithData:v43 outError:&v81];
    id v21 = v81;

    if (v21 || ([v29 containsPayloadOfClass:objc_opt_class()] & 1) != 0)
    {
      v44 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v21;
        _os_log_impl(&dword_230A49000, v44, OS_LOG_TYPE_ERROR, "Invalid WiFi profile: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      if (!v21)
      {
        id v21 = [(MDMRequestEraseDeviceCommand *)self _eraseDeviceContainsMDMPayloadError];
      }
      v45 = [(MDMRequestEraseDeviceCommand *)self _eraseDeviceInvalidWiFiProfileErrorWithUnderlayingError:v21];
      v46 = +[MDMAbstractTunnelParser responseWithError:v45];
      v6[2](v6, v46);

      goto LABEL_18;
    }
  }
  v47 = [(MDMRequestEraseDeviceCommand *)self commandReturnToService];
  v48 = [v47 commandMDMProfileData];
  BOOL v49 = v48 == 0;

  if (v49)
  {
    v53 = [MEMORY[0x263F52808] sharedConfiguration];
    int v54 = [v53 isSupervised];

    if (v54)
    {
      v55 = [MEMORY[0x263F52808] sharedConfiguration];
      char v56 = [v55 isTeslaEnrolled];

      if (v56)
      {
        v57 = [MEMORY[0x263F52808] sharedConfiguration];
        v58 = [v57 details];
        v59 = [v58 objectForKeyedSubscript:*MEMORY[0x263F38958]];
        BOOL v60 = v59 == 0;

        if (v60)
        {
LABEL_47:
          v63 = (void *)MEMORY[0x263F389D0];
          v64 = [(MDMRequestEraseDeviceCommand *)self commandReturnToService];
          v74 = [v64 commandMDMProfileData];
          v65 = [(MDMRequestEraseDeviceCommand *)self commandReturnToService];
          v66 = [v65 commandWiFiProfileData];
          id v79 = 0;
          id v21 = [v63 preseveReturnToServiceDataWithMDMProfileData:v74 wifiProfileData:v66 error:&v79];
          v29 = v79;

          if (v29)
          {
            v67 = *(NSObject **)DMCLogObjects();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(void *)((char *)&buf + 4) = v29;
              _os_log_impl(&dword_230A49000, v67, OS_LOG_TYPE_ERROR, "Failed to preserve data with error: %{public}@", (uint8_t *)&buf, 0xCu);
            }
            [v21 clear];
            v68 = [(MDMRequestEraseDeviceCommand *)self _eraseDeviceFailedToEraseErrorWithUnderlayingError:v29];
            v69 = +[MDMAbstractTunnelParser responseWithError:v68];
            v6[2](v6, v69);

            goto LABEL_18;
          }
          goto LABEL_10;
        }
        v61 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_230A49000, v61, OS_LOG_TYPE_ERROR, "MDM profile is required for cloud configuration with ConfigurationWebURL.", (uint8_t *)&buf, 2u);
        }
      }
      else
      {
        v73 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_230A49000, v73, OS_LOG_TYPE_ERROR, "MDM profile is required for non-ADE enrolled supervised device.", (uint8_t *)&buf, 2u);
        }
      }
    }
    else
    {
      v62 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_230A49000, v62, OS_LOG_TYPE_ERROR, "MDM profile is required for unsupervised device.", (uint8_t *)&buf, 2u);
      }
    }
    id v21 = [(MDMRequestEraseDeviceCommand *)self _eraseDeviceMissingMDMProfileError];
    v29 = +[MDMAbstractTunnelParser responseWithError:v21];
    v6[2](v6, v29);
    goto LABEL_18;
  }
  v50 = (void *)MEMORY[0x263F53C48];
  v51 = [(MDMRequestEraseDeviceCommand *)self commandReturnToService];
  v52 = [v51 commandMDMProfileData];
  id v80 = 0;
  v29 = [v50 profileWithData:v52 outError:&v80];
  id v21 = v80;

  if (!v21)
  {
    if ([v29 containsPayloadOfClass:objc_opt_class()])
    {

      goto LABEL_47;
    }
    id v21 = [(MDMRequestEraseDeviceCommand *)self _eraseDeviceMissingMDMProfileError];
  }
  v70 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v21;
    _os_log_impl(&dword_230A49000, v70, OS_LOG_TYPE_ERROR, "Invalid MDM profile: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  v71 = [(MDMRequestEraseDeviceCommand *)self _eraseDeviceInvalidMDMProfileErrorWithUnderlayingError:v21];
  v72 = +[MDMAbstractTunnelParser responseWithError:v71];
  v6[2](v6, v72);

LABEL_18:
}

intptr_t __74__MDMRequestEraseDeviceCommand_Handler__processRequest_completionHandler___block_invoke(intptr_t result, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a2)
  {
    intptr_t v2 = result;
    uint64_t v3 = [*(id *)(result + 32) _eraseDeviceFailedToEraseErrorWithUnderlayingError:a2];
    uint64_t v4 = *(void *)(*(void *)(v2 + 48) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void **)(*(void *)(*(void *)(v2 + 48) + 8) + 40);
      int v8 = v6;
      uint64_t v9 = [v7 DMCVerboseDescription];
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_230A49000, v8, OS_LOG_TYPE_ERROR, "Could not erase device: %{public}@", (uint8_t *)&v10, 0xCu);
    }
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 40));
  }
  return result;
}

- (id)_eraseDeviceActivationLockIsOnError
{
  intptr_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38B10];
  uint64_t v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12089, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

- (id)_eraseDeviceInvalidWiFiProfileErrorWithUnderlayingError:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F38B10];
  id v5 = a3;
  v6 = [@"MDM_ERROR_COULD_NOT_RETURN_TO_SERVICE_INVAID_WIFI_PROFILE" DMCAppendGreenteaSuffix];
  uint64_t v7 = DMCUnformattedErrorArray();
  int v8 = objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 12089, v7, v5, *MEMORY[0x263F38A40], 0);

  return v8;
}

- (id)_eraseDeviceInvalidMDMProfileErrorWithUnderlayingError:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F38B10];
  id v5 = a3;
  v6 = DMCErrorArray();
  uint64_t v7 = objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 12089, v6, v5, *MEMORY[0x263F38A40], 0);

  return v7;
}

- (id)_eraseDeviceContainsMDMPayloadError
{
  intptr_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38B10];
  uint64_t v4 = DMCErrorArray();
  id v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12089, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

- (id)_eraseDeviceMissingMDMProfileError
{
  intptr_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38B10];
  uint64_t v4 = DMCErrorArray();
  id v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12089, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

- (id)_eraseDeviceProvisionallyEnrolledError
{
  intptr_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38B10];
  uint64_t v4 = DMCErrorArray();
  id v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12089, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

- (id)_eraseDeviceNotSupporttedError
{
  intptr_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38B10];
  uint64_t v4 = DMCErrorArray();
  id v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12089, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

- (id)_eraseDeviceNotSupporttedOnSharedIPadError
{
  intptr_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38B10];
  uint64_t v4 = DMCErrorArray();
  id v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12089, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

- (id)_eraseDeviceNotTeslaEnrolledError
{
  intptr_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38B10];
  uint64_t v4 = DMCErrorArray();
  id v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12089, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

- (id)_eraseDeviceFailedToEraseErrorWithUnderlayingError:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F38B10];
  id v5 = a3;
  v6 = DMCErrorArray();
  uint64_t v7 = objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 12089, v6, v5, *MEMORY[0x263F38A40], 0);

  return v7;
}

@end