@interface HMDelegateCaller
+ (id)delegateCallerWithOperationQueue:(id)a3;
- (HMDelegateCaller)init;
- (HMDelegateCaller)initWithQueue:(id)a3;
- (id)_localizedError:(id)a3;
- (void)callCompletion:(id)a3 actionSet:(id)a4 error:(id)a5;
- (void)callCompletion:(id)a3 array:(id)a4;
- (void)callCompletion:(id)a3 array:(id)a4 additionalAccessoryInfo:(id)a5 error:(id)a6;
- (void)callCompletion:(id)a3 error:(id)a4;
- (void)callCompletion:(id)a3 error:(id)a4 BOOLValue:(BOOL)a5 array:(id)a6;
- (void)callCompletion:(id)a3 error:(id)a4 array:(id)a5;
- (void)callCompletion:(id)a3 error:(id)a4 dictionary:(id)a5;
- (void)callCompletion:(id)a3 error:(id)a4 mediaSystem:(id)a5;
- (void)callCompletion:(id)a3 error:(id)a4 obj:(id)a5;
- (void)callCompletion:(id)a3 error:(id)a4 proxiedDevice:(id)a5;
- (void)callCompletion:(id)a3 error:(id)a4 snapshot:(id)a5;
- (void)callCompletion:(id)a3 errorString:(id)a4;
- (void)callCompletion:(id)a3 eventTrigger:(id)a4 error:(id)a5;
- (void)callCompletion:(id)a3 home:(id)a4 error:(id)a5;
- (void)callCompletion:(id)a3 invitations:(id)a4 error:(id)a5;
- (void)callCompletion:(id)a3 isUsingHomeKit:(BOOL)a4 isUsingCloudServices:(BOOL)a5 error:(id)a6;
- (void)callCompletion:(id)a3 obj:(id)a4 error:(id)a5;
- (void)callCompletion:(id)a3 room:(id)a4 error:(id)a5;
- (void)callCompletion:(id)a3 service:(id)a4 error:(id)a5;
- (void)callCompletion:(id)a3 serviceGroup:(id)a4 error:(id)a5;
- (void)callCompletion:(id)a3 timerTrigger:(id)a4 error:(id)a5;
- (void)callCompletion:(id)a3 user:(id)a4 error:(id)a5;
- (void)callCompletion:(id)a3 value:(BOOL)a4 conflictName:(id)a5 error:(id)a6;
- (void)callCompletion:(id)a3 value:(BOOL)a4 error:(id)a5;
- (void)callCompletion:(id)a3 zone:(id)a4 error:(id)a5;
- (void)invokeBlock:(id)a3;
@end

@implementation HMDelegateCaller

- (void)callCompletion:(id)a3 array:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__HMDelegateCaller_callCompletion_array___block_invoke;
  v10[3] = &unk_1E59454E8;
  id v11 = v7;
  id v12 = v6;
  id v8 = v7;
  id v9 = v6;
  [(HMDelegateCaller *)self invokeBlock:v10];
}

- (void)callCompletion:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__HMDelegateCaller_callCompletion_error___block_invoke;
  v10[3] = &unk_1E5945138;
  id v11 = v7;
  id v12 = v6;
  void v10[4] = self;
  id v8 = v7;
  id v9 = v6;
  [(HMDelegateCaller *)self invokeBlock:v10];
}

- (HMDelegateCaller)initWithQueue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    if (v4) {
      id v6 = [[__HMQueueDelegateCaller alloc] initWithQueue:v4];
    }
    else {
      id v6 = objc_alloc_init(__HMMainThreadDelegateCaller);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HMDelegateCaller;
    id v6 = [(HMDelegateCaller *)&v9 init];
    self = &v6->super;
  }
  p_super = &v6->super;

  return p_super;
}

- (HMDelegateCaller)init
{
  return [(HMDelegateCaller *)self initWithQueue:0];
}

uint64_t __41__HMDelegateCaller_callCompletion_array___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)callCompletion:(id)a3 obj:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__HMDelegateCaller_callCompletion_obj_error___block_invoke;
  v14[3] = &unk_1E5944360;
  id v15 = v9;
  v16 = self;
  id v17 = v10;
  id v18 = v8;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(HMDelegateCaller *)self invokeBlock:v14];
}

void __41__HMDelegateCaller_callCompletion_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) _localizedError:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

void __45__HMDelegateCaller_callCompletion_obj_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) _localizedError:*(void *)(a1 + 48)];
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
  }
}

- (id)_localizedError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v7 = 0;
    goto LABEL_137;
  }
  id v5 = v3;
  if (![v5 isHMError])
  {
LABEL_131:
    id v6 = @"UNKNOWN_ERROR_CODE";
    goto LABEL_132;
  }
  id v6 = @"UNEXPECTED_ERROR";
  switch([v5 code])
  {
    case -1:
      goto LABEL_132;
    case 1:
      id v6 = @"ALREADY_EXISTS";
      goto LABEL_132;
    case 2:
      id v6 = @"NOT_FOUND";
      goto LABEL_132;
    case 3:
      id v6 = @"INVALID_PARAMETER";
      goto LABEL_132;
    case 4:
      id v6 = @"ACCESSORY_NOT_REACHABLE";
      goto LABEL_132;
    case 5:
      id v6 = @"READ_ONLY_CHARACTERISTIC";
      goto LABEL_132;
    case 6:
      id v6 = @"WRITE_ONLY_CHARACTERISTIC";
      goto LABEL_132;
    case 7:
      id v6 = @"NOTIFICATION_NOT_SUPPORTED";
      goto LABEL_132;
    case 8:
      id v6 = @"OPERATION_TIMED_OUT";
      goto LABEL_132;
    case 9:
      id v6 = @"ACCESSORY_POWERED_OFF";
      goto LABEL_132;
    case 10:
      id v6 = @"ACCESS_DENIED";
      goto LABEL_132;
    case 11:
      id v6 = @"OBJECT_ASSOCIATED_TO_ANOTHER_HOME";
      goto LABEL_132;
    case 12:
      id v6 = @"OBJECT_NOT_ASSOCIATED_TO_ANY_HOME";
      goto LABEL_132;
    case 13:
      id v6 = @"OBJECT_ALREADY_ASSOCIATED_TO_HOME";
      goto LABEL_132;
    case 14:
      id v6 = @"ACCESSORY_IS_BUSY";
      goto LABEL_132;
    case 15:
      id v6 = @"OPERATION_IN_PROGRESS";
      goto LABEL_132;
    case 16:
      id v6 = @"ACCESSORY_OUT_OF_RESOURCES";
      goto LABEL_132;
    case 17:
      id v6 = @"INSUFFICIENT_PRIVILEGES";
      goto LABEL_132;
    case 18:
      id v6 = @"ACCESSORY_PAIRING_FAILED";
      goto LABEL_132;
    case 19:
      id v6 = @"INVALID_DATA_FORMAT_SPECIFIED";
      goto LABEL_132;
    case 20:
      id v6 = @"NIL_PARAMETER";
      goto LABEL_132;
    case 21:
      id v6 = @"UNCONFIGURED_PARAMETER";
      goto LABEL_132;
    case 22:
      id v6 = @"INVALID_CLASS";
      goto LABEL_132;
    case 23:
      id v6 = @"OPERATION_CANCELLED";
      goto LABEL_132;
    case 24:
      id v6 = @"ROOM_FOR_HOME_CANNOT_BE_IN_ZONE";
      goto LABEL_132;
    case 25:
      id v6 = @"NO_ACTIONS_IN_ACTION_SET";
      goto LABEL_132;
    case 26:
      id v6 = @"NO_REGISTERED_ACTION_SETS";
      goto LABEL_132;
    case 27:
      id v6 = @"MISSING_PARAMETER";
      goto LABEL_132;
    case 28:
      id v6 = @"FIRE_DATE_IN_PAST";
      goto LABEL_132;
    case 29:
      id v6 = @"ROOM_FOR_HOME_CANNOT_BE_UPDATED";
      goto LABEL_132;
    case 30:
      id v6 = @"ACTION_IN_ANOTHER_ACTION_SET";
      goto LABEL_132;
    case 31:
      id v6 = @"OBJECT_WITH_SIMILAR_NAME_EXISTS_IN_HOME";
      goto LABEL_132;
    case 32:
      id v6 = @"HOME_WITH_SIMILAR_NAME_EXISTS";
      goto LABEL_132;
    case 33:
      id v6 = @"RENAME_WITH_SIMILAR_NAME";
      goto LABEL_132;
    case 34:
      id v6 = @"CANNOT_REMOVE_NON_BRIDGE_ACCESSORY";
      goto LABEL_132;
    case 35:
      id v6 = @"NAME_CONTAINS_PROHIBITED_CHARACTERS";
      goto LABEL_132;
    case 36:
      id v6 = @"NAME_DOES_NOT_START_WITH_VALID_CHARACTERS";
      goto LABEL_132;
    case 37:
      id v6 = @"USER_ID_NOT_EMAIL_ADDRESS";
      goto LABEL_132;
    case 38:
      id v6 = @"USER_DECLINED_ADDING_USER";
      goto LABEL_132;
    case 39:
      id v6 = @"USER_DECLINED_REMOVING_USER";
      goto LABEL_132;
    case 40:
      id v6 = @"USER_DECLINED_INVITE";
      goto LABEL_132;
    case 41:
      id v6 = @"USER_MANAGEMENT_FAILED";
      goto LABEL_132;
    case 42:
      id v6 = @"RECURRENCE_TOO_SMALL";
      goto LABEL_132;
    case 43:
      id v6 = @"INVALID_VALUE_TYPE";
      goto LABEL_132;
    case 44:
      id v6 = @"VALUE_LOWER_THAN_MINIMUM";
      goto LABEL_132;
    case 45:
      id v6 = @"VALUE_HIGHER_THAN_MAXIMUM";
      goto LABEL_132;
    case 46:
      id v6 = @"STRING_LONGER_THAN_MAXIMUM";
      goto LABEL_132;
    case 47:
      id v6 = @"HOME_ACCESS_NOT_AUTHORIZED";
      goto LABEL_132;
    case 48:
      id v6 = @"OPERATION_NOT_SUPPORTED";
      goto LABEL_132;
    case 49:
      id v6 = @"MAXIMUM_OBJECT_LIMIT_REACHED";
      goto LABEL_132;
    case 50:
      id v6 = @"ACCESSORY_SENT_INVALID_RESPONSE";
      goto LABEL_132;
    case 51:
      id v6 = @"STRING_SHORTER_THAN_MINIMUM";
      goto LABEL_132;
    case 52:
      id v6 = @"GENERIC_ERROR";
      goto LABEL_132;
    case 53:
      id v6 = @"SECURITY_FAILURE";
      goto LABEL_132;
    case 54:
      id v6 = @"COMMUNICATION_FAILURE";
      goto LABEL_132;
    case 55:
      id v6 = @"MESSAGE_AUTHENTICATION_FAILED";
      goto LABEL_132;
    case 56:
      id v6 = @"INVALID_MESSAGE_SIZE";
      goto LABEL_132;
    case 57:
      id v6 = @"ACCESSORY_DISCOVERY_FAILED";
      goto LABEL_132;
    case 58:
      id v6 = @"CLIENT_REQUEST_ERROR";
      goto LABEL_132;
    case 59:
      id v6 = @"ACCESSORY_RESPONSE_ERROR";
      goto LABEL_132;
    case 60:
      id v6 = @"NAME_DOES_NOT_END_WITH_VALID_CHARACTERS";
      goto LABEL_132;
    case 61:
      id v6 = @"ACCESSORY_IS_BLOCKED";
      goto LABEL_132;
    case 62:
      id v6 = @"INVALID_ASSOCIATED_SERVICE_TYPE";
      goto LABEL_132;
    case 63:
      id v6 = @"ACTION_SET_EXECUTION_FAILED";
      goto LABEL_132;
    case 64:
      id v6 = @"ACTION_SET_EXECUTION_PARTIAL_SUCCESS";
      goto LABEL_132;
    case 65:
      id v6 = @"ACTION_SET_EXECUTION_IN_PROGRESS";
      goto LABEL_132;
    case 66:
      id v6 = @"ACCESSORY_OUT_OF_COMPLIANCE";
      goto LABEL_132;
    case 67:
      id v6 = @"DATA_RESET_FAILURE";
      goto LABEL_132;
    case 68:
      id v6 = @"NOTIFICATION_ALREADY_ENABLED";
      goto LABEL_132;
    case 69:
      id v6 = @"RECURRENCE_MUST_BE_ON_SPECIFIED_BOUNDARIES";
      goto LABEL_132;
    case 70:
      id v6 = @"DATE_MUST_BE_ON_SPECIFIED_BOUNDARIES";
      goto LABEL_132;
    case 71:
      id v6 = @"CANNOT_ACTIVATE_TRIGGER_TOO_FAR_IN_FUTURE";
      goto LABEL_132;
    case 72:
      id v6 = @"RECURRENCE_TOO_LARGE";
      goto LABEL_132;
    case 73:
      id v6 = @"READ_WRITE_PARTIAL_SUCCESS";
      goto LABEL_132;
    case 74:
      id v6 = @"READ_WRITE_FAILURE";
      goto LABEL_132;
    case 75:
      id v6 = @"NOT_SIGNED_INTO_ICLOUD";
      goto LABEL_132;
    case 76:
      id v6 = @"KEYCHAIN_SYNC_NOT_ENABLED";
      goto LABEL_132;
    case 77:
      id v6 = @"CLOUD_DATA_SYNC_IN_PROGRESS";
      goto LABEL_132;
    case 78:
      id v6 = @"NETWORK_UNAVAILABLE";
      goto LABEL_132;
    case 79:
      id v6 = @"ADD_ACCESSORY_FAILED";
      goto LABEL_132;
    case 80:
      id v6 = @"MISSING_ENTITLEMENT";
      goto LABEL_132;
    case 81:
      id v6 = @"CANNOT_UNBLOCK_NON_BRIDGE_ACCESSORY";
      goto LABEL_132;
    case 82:
      id v6 = @"DEVICE_LOCKED";
      goto LABEL_132;
    case 83:
      id v6 = @"CANNOT_REMOVE_BUILTIN_ACTION_SET";
      goto LABEL_132;
    case 84:
      id v6 = @"LOCATION_FOR_HOME_DISABLED";
      goto LABEL_132;
    case 85:
      id v6 = @"NOT_AUTHORIZED_FOR_LOCATION_SERVICES";
      goto LABEL_132;
    case 86:
      id v6 = @"REFER_TO_USER_MANUAL";
      goto LABEL_132;
    case 87:
      id v6 = @"MISSING_OR_INVALID_AUTHORIZATION_DATA";
      goto LABEL_132;
    case 88:
      id v6 = @"BRIDGED_ACCESSORY_NOT_REACHABLE";
      goto LABEL_132;
    case 89:
      id v6 = @"NOT_AUTHORIZED_FOR_MICROPHONE_ACCESS";
      goto LABEL_132;
    case 90:
      id v6 = @"INCOMPATIBLE_WIFI_NETWORK";
      goto LABEL_132;
    case 91:
      id v6 = @"NO_HOME_HUB";
      goto LABEL_132;
    case 92:
      id v6 = @"NO_COMPATIBLE_HOME_HUB";
      goto LABEL_132;
    case 93:
      id v6 = @"INCOMPATIBLE_ACCESSORY";
      goto LABEL_132;
    case 95:
      id v6 = @"OBJECT_WITH_SIMILAR_NAME_EXISTS";
      goto LABEL_132;
    case 96:
      id v6 = @"OWNERSHIP_FAILURE";
      goto LABEL_132;
    case 97:
      id v6 = @"MAXIMUM_ACCESSORIES_OF_TYPE_IN_HOME";
      goto LABEL_132;
    case 98:
      id v6 = @"WIFI_CREDENTIAL_GENERATION_FAILED";
      goto LABEL_132;
    default:
      uint64_t v8 = [v5 code];
      if (v8 > 2299)
      {
        if (v8 > 2499)
        {
          switch(v8)
          {
            case 2500:
              id v6 = @"CONFIG_RESET";
              break;
            case 2501:
              id v6 = @"HOME_UI_SERVICE_TERMINATED";
              break;
            case 2502:
              id v6 = @"HOME_UI_SERVICE_BACKGROUNDED";
              break;
            case 2503:
              id v6 = @"NO_CLIENTS";
              break;
            case 2504:
              id v6 = @"ACCESSORY_BROWSER_STOPPED";
              break;
            default:
              goto LABEL_129;
          }
          goto LABEL_132;
        }
        switch(v8)
        {
          case 2300:
            id v6 = @"VOICE_SHORTCUT_WITH_SIMILAR_NAME_EXISTS";
            goto LABEL_132;
          case 2404:
            id v6 = @"OPERATION_STARTED";
            goto LABEL_132;
          case 2405:
            id v6 = @"ACCESSORY_IS_CALIBRATING";
            goto LABEL_132;
        }
LABEL_129:
        uint64_t v9 = [v5 code];
        if ((unint64_t)(v9 - 1001) > 8) {
          goto LABEL_131;
        }
        id v6 = off_1E593ED78[v9 - 1001];
        goto LABEL_132;
      }
      if (v8 <= 2099)
      {
        id v6 = @"OPERATION_CANCELED_BY_USER";
        switch(v8)
        {
          case 2001:
            goto LABEL_132;
          case 2002:
            id v6 = @"INCORRECT_SETUP_CODE";
            break;
          case 2003:
            id v6 = @"SECURE_ACCESS_DENIED";
            break;
          case 2004:
            id v6 = @"UNSUPPORTED_SETUP_PAYLOAD";
            break;
          case 2005:
            id v6 = @"MEDIA_REMOTE_ERROR";
            break;
          case 2007:
            id v6 = @"CLOUD_PHOTO_LIBRARY_NOT_ENABLED";
            break;
          default:
            goto LABEL_129;
        }
        goto LABEL_132;
      }
      if (v8 == 2100)
      {
        id v6 = @"NO_TARGET_ACCESSORY";
        goto LABEL_132;
      }
      if (v8 == 2200)
      {
        id v6 = @"INVALID_CHARACTERS";
        goto LABEL_132;
      }
      if (v8 != 2201) {
        goto LABEL_129;
      }
      id v6 = @"PASSWORD_WEAK";
LABEL_132:

      id v10 = v6;
      id v11 = +[HMLocalization sharedManager];
      id v12 = [v11 getLocalizedString:v10];

      if ([(__CFString *)v10 isEqualToString:@"UNKNOWN_ERROR_CODE"])
      {
        id v13 = NSString;
        v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "code"));
        uint64_t v15 = [v13 stringWithValidatedFormat:v12, @"%@", 0, v14 validFormatSpecifiers error];

        id v12 = (void *)v15;
      }
      v16 = [v5 userInfo];
      id v17 = (void *)[v16 mutableCopy];

      if (!v17)
      {
        id v17 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      [v17 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F28568]];
      id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
      v19 = [v5 domain];
      uint64_t v20 = [v5 code];
      v21 = (void *)[v17 copy];
      id v7 = (void *)[v18 initWithDomain:v19 code:v20 userInfo:v21];

LABEL_137:
      return v7;
  }
}

+ (id)delegateCallerWithOperationQueue:(id)a3
{
  id v3 = a3;
  id v4 = [[__HMOperationQueueDelegateCaller alloc] initWithOperationQueue:v3];

  return v4;
}

- (void)callCompletion:(id)a3 service:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__HMDelegateCaller_callCompletion_service_error___block_invoke;
  v14[3] = &unk_1E5945138;
  id v16 = v10;
  id v17 = v8;
  id v15 = v9;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(HMDelegateCaller *)self invokeBlock:v14];
}

uint64_t __49__HMDelegateCaller_callCompletion_service_error___block_invoke(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)callCompletion:(id)a3 value:(BOOL)a4 conflictName:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__HMDelegateCaller_callCompletion_value_conflictName_error___block_invoke;
  v16[3] = &unk_1E5941750;
  id v18 = v12;
  id v19 = v10;
  BOOL v20 = a4;
  id v17 = v11;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(HMDelegateCaller *)self invokeBlock:v16];
}

uint64_t __60__HMDelegateCaller_callCompletion_value_conflictName_error___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  return result;
}

- (void)callCompletion:(id)a3 error:(id)a4 mediaSystem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__HMDelegateCaller_callCompletion_error_mediaSystem___block_invoke;
  v14[3] = &unk_1E5944360;
  void v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v17 = v8;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(HMDelegateCaller *)self invokeBlock:v14];
}

void __53__HMDelegateCaller_callCompletion_error_mediaSystem___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    id v3 = [*(id *)(a1 + 32) _localizedError:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v3, *(void *)(a1 + 48));
  }
}

- (void)callCompletion:(id)a3 error:(id)a4 proxiedDevice:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__HMDelegateCaller_callCompletion_error_proxiedDevice___block_invoke;
  v14[3] = &unk_1E5944360;
  void v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v17 = v8;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(HMDelegateCaller *)self invokeBlock:v14];
}

void __55__HMDelegateCaller_callCompletion_error_proxiedDevice___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    id v3 = [*(id *)(a1 + 32) _localizedError:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v3, *(void *)(a1 + 48));
  }
}

- (void)callCompletion:(id)a3 error:(id)a4 snapshot:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__HMDelegateCaller_callCompletion_error_snapshot___block_invoke;
  v14[3] = &unk_1E5944360;
  id v15 = v10;
  id v16 = self;
  id v17 = v9;
  id v18 = v8;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  [(HMDelegateCaller *)self invokeBlock:v14];
}

void __50__HMDelegateCaller_callCompletion_error_snapshot___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) _localizedError:*(void *)(a1 + 48)];
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
  }
}

- (void)callCompletion:(id)a3 user:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__HMDelegateCaller_callCompletion_user_error___block_invoke;
  v14[3] = &unk_1E5944360;
  id v15 = v9;
  id v16 = self;
  id v17 = v10;
  id v18 = v8;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(HMDelegateCaller *)self invokeBlock:v14];
}

void __46__HMDelegateCaller_callCompletion_user_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) _localizedError:*(void *)(a1 + 48)];
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
  }
}

- (void)callCompletion:(id)a3 invitations:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__HMDelegateCaller_callCompletion_invitations_error___block_invoke;
  v14[3] = &unk_1E5944360;
  id v15 = v9;
  id v16 = self;
  id v17 = v10;
  id v18 = v8;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(HMDelegateCaller *)self invokeBlock:v14];
}

void __53__HMDelegateCaller_callCompletion_invitations_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) _localizedError:*(void *)(a1 + 48)];
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
  }
}

- (void)callCompletion:(id)a3 array:(id)a4 additionalAccessoryInfo:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71__HMDelegateCaller_callCompletion_array_additionalAccessoryInfo_error___block_invoke;
  v18[3] = &unk_1E5944900;
  id v22 = v13;
  id v23 = v10;
  id v19 = v11;
  id v20 = v12;
  v21 = self;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(HMDelegateCaller *)self invokeBlock:v18];
}

void __71__HMDelegateCaller_callCompletion_array_additionalAccessoryInfo_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [*(id *)(a1 + 48) _localizedError:*(void *)(a1 + 56)];
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3, v4);
  }
}

- (void)callCompletion:(id)a3 error:(id)a4 array:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__HMDelegateCaller_callCompletion_error_array___block_invoke;
  v14[3] = &unk_1E5944360;
  void v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v17 = v8;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(HMDelegateCaller *)self invokeBlock:v14];
}

void __47__HMDelegateCaller_callCompletion_error_array___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    id v3 = [*(id *)(a1 + 32) _localizedError:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v3, *(void *)(a1 + 48));
  }
}

- (void)callCompletion:(id)a3 error:(id)a4 BOOLValue:(BOOL)a5 array:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__HMDelegateCaller_callCompletion_error_BOOLValue_array___block_invoke;
  v16[3] = &unk_1E5941F40;
  void v16[4] = self;
  id v17 = v11;
  BOOL v20 = a5;
  id v18 = v12;
  id v19 = v10;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(HMDelegateCaller *)self invokeBlock:v16];
}

void __57__HMDelegateCaller_callCompletion_error_BOOLValue_array___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    id v3 = [*(id *)(a1 + 32) _localizedError:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, id, void, void))(v1 + 16))(v1, v3, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 48));
  }
}

- (void)callCompletion:(id)a3 timerTrigger:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__HMDelegateCaller_callCompletion_timerTrigger_error___block_invoke;
  v14[3] = &unk_1E5944360;
  id v15 = v9;
  id v16 = self;
  id v17 = v10;
  id v18 = v8;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(HMDelegateCaller *)self invokeBlock:v14];
}

void __54__HMDelegateCaller_callCompletion_timerTrigger_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) _localizedError:*(void *)(a1 + 48)];
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
  }
}

- (void)callCompletion:(id)a3 eventTrigger:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__HMDelegateCaller_callCompletion_eventTrigger_error___block_invoke;
  v14[3] = &unk_1E5944360;
  id v15 = v9;
  id v16 = self;
  id v17 = v10;
  id v18 = v8;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(HMDelegateCaller *)self invokeBlock:v14];
}

void __54__HMDelegateCaller_callCompletion_eventTrigger_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) _localizedError:*(void *)(a1 + 48)];
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
  }
}

- (void)callCompletion:(id)a3 actionSet:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__HMDelegateCaller_callCompletion_actionSet_error___block_invoke;
  v14[3] = &unk_1E5944360;
  id v15 = v9;
  id v16 = self;
  id v17 = v10;
  id v18 = v8;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(HMDelegateCaller *)self invokeBlock:v14];
}

void __51__HMDelegateCaller_callCompletion_actionSet_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) _localizedError:*(void *)(a1 + 48)];
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
  }
}

- (void)callCompletion:(id)a3 serviceGroup:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__HMDelegateCaller_callCompletion_serviceGroup_error___block_invoke;
  v14[3] = &unk_1E5944360;
  id v15 = v9;
  id v16 = self;
  id v17 = v10;
  id v18 = v8;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(HMDelegateCaller *)self invokeBlock:v14];
}

void __54__HMDelegateCaller_callCompletion_serviceGroup_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) _localizedError:*(void *)(a1 + 48)];
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
  }
}

- (void)callCompletion:(id)a3 zone:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__HMDelegateCaller_callCompletion_zone_error___block_invoke;
  v14[3] = &unk_1E5944360;
  id v15 = v9;
  id v16 = self;
  id v17 = v10;
  id v18 = v8;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(HMDelegateCaller *)self invokeBlock:v14];
}

void __46__HMDelegateCaller_callCompletion_zone_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) _localizedError:*(void *)(a1 + 48)];
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
  }
}

- (void)callCompletion:(id)a3 room:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__HMDelegateCaller_callCompletion_room_error___block_invoke;
  v14[3] = &unk_1E5944360;
  id v15 = v9;
  id v16 = self;
  id v17 = v10;
  id v18 = v8;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(HMDelegateCaller *)self invokeBlock:v14];
}

void __46__HMDelegateCaller_callCompletion_room_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) _localizedError:*(void *)(a1 + 48)];
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
  }
}

- (void)callCompletion:(id)a3 home:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__HMDelegateCaller_callCompletion_home_error___block_invoke;
  v14[3] = &unk_1E5944360;
  id v15 = v9;
  id v16 = self;
  id v17 = v10;
  id v18 = v8;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(HMDelegateCaller *)self invokeBlock:v14];
}

void __46__HMDelegateCaller_callCompletion_home_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) _localizedError:*(void *)(a1 + 48)];
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
  }
}

- (void)callCompletion:(id)a3 isUsingHomeKit:(BOOL)a4 isUsingCloudServices:(BOOL)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__HMDelegateCaller_callCompletion_isUsingHomeKit_isUsingCloudServices_error___block_invoke;
  v14[3] = &unk_1E593EA28;
  id v15 = v11;
  id v16 = v10;
  BOOL v17 = a4;
  BOOL v18 = a5;
  void v14[4] = self;
  id v12 = v11;
  id v13 = v10;
  [(HMDelegateCaller *)self invokeBlock:v14];
}

void __77__HMDelegateCaller_callCompletion_isUsingHomeKit_isUsingCloudServices_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (v1)
  {
    uint64_t v2 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v3 = *(unsigned __int8 *)(a1 + 57);
    id v4 = [*(id *)(a1 + 32) _localizedError:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3, v4);
  }
}

- (void)callCompletion:(id)a3 error:(id)a4 dictionary:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__HMDelegateCaller_callCompletion_error_dictionary___block_invoke;
  v14[3] = &unk_1E5944360;
  void v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v17 = v8;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(HMDelegateCaller *)self invokeBlock:v14];
}

void __52__HMDelegateCaller_callCompletion_error_dictionary___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    id v3 = [*(id *)(a1 + 32) _localizedError:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v3, *(void *)(a1 + 48));
  }
}

- (void)callCompletion:(id)a3 errorString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__HMDelegateCaller_callCompletion_errorString___block_invoke;
  v10[3] = &unk_1E59454E8;
  id v11 = v7;
  id v12 = v6;
  id v8 = v7;
  id v9 = v6;
  [(HMDelegateCaller *)self invokeBlock:v10];
}

uint64_t __47__HMDelegateCaller_callCompletion_errorString___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)callCompletion:(id)a3 value:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__HMDelegateCaller_callCompletion_value_error___block_invoke;
  v12[3] = &unk_1E5941750;
  id v13 = v9;
  id v14 = v8;
  BOOL v15 = a4;
  v12[4] = self;
  id v10 = v9;
  id v11 = v8;
  [(HMDelegateCaller *)self invokeBlock:v12];
}

void __47__HMDelegateCaller_callCompletion_value_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (v1)
  {
    uint64_t v2 = *(unsigned __int8 *)(a1 + 56);
    id v3 = [*(id *)(a1 + 32) _localizedError:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
  }
}

- (void)callCompletion:(id)a3 error:(id)a4 obj:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__HMDelegateCaller_callCompletion_error_obj___block_invoke;
  v14[3] = &unk_1E5944360;
  void v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v17 = v8;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(HMDelegateCaller *)self invokeBlock:v14];
}

void __45__HMDelegateCaller_callCompletion_error_obj___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    id v3 = [*(id *)(a1 + 32) _localizedError:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v3, *(void *)(a1 + 48));
  }
}

- (void)invokeBlock:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

@end