@interface HMDAssistantIntent
+ (id)logCategory;
- (HMDAssistantIntent)initWithIntent:(id)a3;
- (INControlHomeIntent)intent;
- (NSArray)homeKitObjects;
- (id)_getObjectsWithUUID;
- (void)_handleActionSetForConfirmation:(id)a3 message:(id)a4;
- (void)_handleActionSetForExecution:(id)a3 message:(id)a4;
- (void)_handleIntentRequestMessage:(id)a3;
- (void)performWithGather:(id)a3 message:(id)a4;
- (void)setHomeKitObjects:(id)a3;
- (void)setIntent:(id)a3;
@end

@implementation HMDAssistantIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_homeKitObjects, 0);
}

- (void)setIntent:(id)a3
{
}

- (INControlHomeIntent)intent
{
  return self->_intent;
}

- (void)setHomeKitObjects:(id)a3
{
}

- (NSArray)homeKitObjects
{
  return self->_homeKitObjects;
}

- (void)_handleActionSetForExecution:(id)a3 message:(id)a4
{
  v15[3] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = actionSetFromObject(a3);
  v15[0] = &unk_26E472340;
  v14[0] = @"sourceType";
  v14[1] = @"kActionUUID";
  v7 = [v6 uuid];
  v8 = [v7 UUIDString];
  v15[1] = v8;
  v14[2] = @"kApplyDeviceUnlockKey";
  v9 = [NSNumber numberWithInt:!isPasscodeEnabledOnThisDevice()];
  v15[2] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  v11 = (void *)MEMORY[0x263F42568];
  v12 = [v5 responseHandler];

  v13 = [v11 internalMessageWithName:@"kExecuteActionSetRequestKey" messagePayload:v10 responseHandler:v12];

  [v6 execute:v13];
}

- (void)_handleActionSetForConfirmation:(id)a3 message:(id)a4
{
  v16[2] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = actionSetFromObject(a3);
  BOOL v7 = isPasscodeEnabledOnThisDevice();
  v15[1] = @"kApplyDeviceUnlockKey";
  v16[0] = &unk_26E472340;
  v15[0] = @"sourceType";
  v8 = [NSNumber numberWithInt:!v7];
  v16[1] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  v10 = [MEMORY[0x263F42568] messageWithMessage:v5 messagePayload:v9];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__HMDAssistantIntent__handleActionSetForConfirmation_message___block_invoke;
  v12[3] = &unk_264A22690;
  BOOL v14 = v7;
  id v13 = v5;
  id v11 = v5;
  [v6 isAccessValidForExecutionWithMessage:v10 completion:v12];
}

void __62__HMDAssistantIntent__handleActionSetForConfirmation_message___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if ((a2 & 1) == 0)
  {
    id v8 = v5;
    if ([v5 code] != 82)
    {
      id v6 = v8;
      if (v8) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    id v6 = v8;
    if (!v8 || !*(unsigned char *)(a1 + 40))
    {
LABEL_7:
      uint64_t v7 = [MEMORY[0x263F087E8] hmErrorWithCode:10];

      id v6 = (id)v7;
    }
  }
LABEL_8:
  id v9 = v6;
  [*(id *)(a1 + 32) respondWithPayload:0 error:v6];
}

- (id)_getObjectsWithUUID
{
  v3 = [(HMDAssistantIntent *)self intent];
  v4 = [v3 contents];
  id v5 = [v4 firstObject];

  id v6 = [v5 filter];
  uint64_t v7 = [v6 entityIdentifiers];
  id v8 = [v7 firstObject];

  id v9 = [(HMDAssistantIntent *)self homeKitObjects];
  v10 = v9;
  if (v9 && [v9 count])
  {
    id v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K =[d] %@", @"objectSPIIdentifier", v8];
    uint64_t v12 = [v10 filteredArrayUsingPredicate:v11];

    v10 = (void *)v12;
  }
  id v13 = [v10 firstObject];

  return v13;
}

- (void)_handleIntentRequestMessage:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAssistantIntent *)self intent];
  id v6 = [v5 contents];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = [(HMDAssistantIntent *)self intent];
    id v9 = [v8 contents];
    v10 = [v9 firstObject];

    id v11 = [v10 filter];
    uint64_t v12 = [v11 entityType];

    switch(v12)
    {
      case 0:
        id v13 = @"INHomeEntityTypeUnknown";
        goto LABEL_22;
      case 1:
        id v13 = @"INHomeEntityTypeHome";
        goto LABEL_22;
      case 2:
        id v13 = @"INHomeEntityTypeZone";
        goto LABEL_22;
      case 3:
        id v13 = @"INHomeEntityTypeRoom";
        goto LABEL_22;
      case 4:
        id v13 = @"INHomeEntityTypeGroup";
        goto LABEL_22;
      case 5:
        v18 = [(HMDAssistantIntent *)self _getObjectsWithUUID];
        if (v18)
        {
          v19 = [v4 numberForKey:*MEMORY[0x263F0EB98]];
          if (v19)
          {
            v20 = v19;
            uint64_t v21 = [v19 unsignedIntegerValue];
            if (v21 == 1)
            {
              [(HMDAssistantIntent *)self _handleActionSetForExecution:v18 message:v4];
            }
            else if (!v21)
            {
              [(HMDAssistantIntent *)self _handleActionSetForConfirmation:v18 message:v4];
            }

LABEL_33:
            goto LABEL_25;
          }
          v31 = (void *)MEMORY[0x263F087E8];
          uint64_t v32 = 3;
        }
        else
        {
          v27 = (void *)MEMORY[0x230FBD990]();
          v28 = self;
          v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v30 = HMFGetLogIdentifier();
            int v34 = 138543362;
            v35 = v30;
            _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@The actionSet provided by the intent does not exist.", (uint8_t *)&v34, 0xCu);
          }
          v31 = (void *)MEMORY[0x263F087E8];
          uint64_t v32 = 2;
        }
        v33 = [v31 hmErrorWithCode:v32];
        [v4 respondWithError:v33];

        goto LABEL_33;
      case 6:
        id v13 = @"INHomeEntityTypeTrigger";
        goto LABEL_22;
      case 7:
        id v13 = @"INHomeEntityTypeDevice";
        goto LABEL_22;
      case 8:
        id v13 = @"INHomeEntityTypeServiceGroup";
        goto LABEL_22;
      case 9:
        id v13 = @"INHomeEntityTypeAccessory";
        goto LABEL_22;
      case 10:
        id v13 = @"INHomeEntityTypeService";
        goto LABEL_22;
      default:
        id v13 = 0;
LABEL_22:
        v22 = (void *)MEMORY[0x230FBD990]();
        v23 = self;
        v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = HMFGetLogIdentifier();
          int v34 = 138543618;
          v35 = v25;
          __int16 v36 = 2112;
          v37 = v13;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Intent execution with entityType %@ is not yet supported.", (uint8_t *)&v34, 0x16u);
        }
        v26 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
        [v4 respondWithError:v26];

        goto LABEL_25;
    }
  }
  BOOL v14 = (void *)MEMORY[0x230FBD990]();
  v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = HMFGetLogIdentifier();
    int v34 = 138543362;
    v35 = v17;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Error - There is no content in intent to handle.", (uint8_t *)&v34, 0xCu);
  }
  v10 = [MEMORY[0x263F087E8] hmErrorWithCode:58];
  [v4 respondWithError:v10];
LABEL_25:
}

- (void)performWithGather:(id)a3 message:(id)a4
{
  id v7 = a4;
  id v6 = [a3 homeKitObjects];
  [(HMDAssistantIntent *)self setHomeKitObjects:v6];

  [(HMDAssistantIntent *)self _handleIntentRequestMessage:v7];
}

- (HMDAssistantIntent)initWithIntent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDAssistantIntent;
  id v6 = [(HMDAssistantIntent *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_intent, a3);
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_158398 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_158398, &__block_literal_global_158399);
  }
  v2 = (void *)logCategory__hmf_once_v4_158400;
  return v2;
}

void __33__HMDAssistantIntent_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v4_158400;
  logCategory__hmf_once_v4_158400 = v0;
}

@end