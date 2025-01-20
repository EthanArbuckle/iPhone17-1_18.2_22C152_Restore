@interface NSError(HMError)
+ (__CFString)hmStringFromErrorCode:()HMError;
+ (id)_hmUserInfoForDescription:()HMError reason:suggestion:underlyingError:;
+ (id)hmErrorWithCode:()HMError description:reason:suggestion:underlyingError:;
+ (id)hmInternalErrorWithCode:()HMError description:reason:suggestion:underlyingError:;
+ (id)hmInternalErrorWithCode:()HMError underlyingError:;
+ (id)hmPrivateErrorWithCode:()HMError description:underlyingError:;
+ (uint64_t)hmErrorWithCode:()HMError;
+ (uint64_t)hmErrorWithCode:()HMError description:reason:suggestion:;
+ (uint64_t)hmErrorWithCode:()HMError userInfo:;
+ (uint64_t)hmInternalErrorWithCode:()HMError;
+ (uint64_t)hmInternalErrorWithCode:()HMError description:reason:suggestion:;
+ (uint64_t)hmInternalErrorWithCode:()HMError userInfo:;
+ (uint64_t)hmInternallErrorWithCode:()HMError userInfo:;
+ (uint64_t)hmPrivateErrorWithCode:()HMError;
+ (uint64_t)hmPrivateErrorWithCode:()HMError underlyingError:;
+ (uint64_t)hmPrivateErrorWithCode:()HMError userInfo:;
- (id)hmPublicError;
- (uint64_t)isHMError;
@end

@implementation NSError(HMError)

+ (uint64_t)hmErrorWithCode:()HMError userInfo:
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:a3 userInfo:a4];
}

+ (uint64_t)hmErrorWithCode:()HMError
{
  return [MEMORY[0x1E4F28C58] hmErrorWithCode:a3 userInfo:0];
}

- (id)hmPublicError
{
  if ([a1 isHMError])
  {
    switch([a1 code])
    {
      case 1001:
      case 1002:
      case 1003:
      case 1004:
      case 1005:
      case 1006:
      case 1007:
      case 1008:
      case 1009:
      case 1010:
        v2 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v3 = -1;
        break;
      case 1011:
        v2 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v3 = 12;
        break;
      case 1012:
      case 1013:
      case 1014:
      case 1015:
      case 1016:
      case 1017:
      case 1020:
      case 1021:
      case 1022:
      case 1023:
      case 1024:
      case 1025:
      case 1026:
      case 1027:
      case 1028:
      case 1029:
      case 1030:
      case 1031:
      case 1032:
      case 1035:
      case 1036:
      case 1041:
      case 1045:
      case 1046:
      case 1047:
        v2 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v3 = 54;
        break;
      case 1018:
      case 1019:
        v2 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v3 = 14;
        break;
      case 1033:
      case 1034:
        v2 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v3 = 4;
        break;
      case 1037:
      case 1038:
      case 1040:
      case 1042:
      case 1043:
      case 1044:
        v2 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v3 = 50;
        break;
      case 1039:
        v2 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v3 = 3;
        break;
      case 1048:
      case 1049:
        v2 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v3 = 23;
        break;
      default:
        goto LABEL_4;
    }
    id v4 = [v2 hmErrorWithCode:v3];
  }
  else
  {
LABEL_4:
    id v4 = a1;
  }

  return v4;
}

- (uint64_t)isHMError
{
  v1 = [a1 domain];
  uint64_t v2 = [v1 isEqualToString:@"HMErrorDomain"];

  return v2;
}

+ (id)hmInternalErrorWithCode:()HMError underlyingError:
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    v11[0] = v5;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    v7 = 0;
  }
  v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:a3 userInfo:v7];

  return v8;
}

+ (uint64_t)hmInternalErrorWithCode:()HMError
{
  return [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:a3 underlyingError:0];
}

+ (id)hmPrivateErrorWithCode:()HMError description:underlyingError:
{
  unint64_t v7 = a4;
  unint64_t v8 = a5;
  if (v7 | v8)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    if (v7)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B50] mainBundle];
      v11 = [v10 localizedStringForKey:v7 value:&stru_1EEE9DD88 table:0];
      [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F28568]];
    }
    if (v8) {
      [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    }
  }
  else
  {
    v9 = 0;
  }
  v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:a3 userInfo:v9];

  return v12;
}

+ (uint64_t)hmPrivateErrorWithCode:()HMError underlyingError:
{
  return [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:a3 description:0 underlyingError:a4];
}

+ (uint64_t)hmInternalErrorWithCode:()HMError userInfo:
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:a3 userInfo:a4];
}

+ (uint64_t)hmPrivateErrorWithCode:()HMError userInfo:
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:a3 userInfo:a4];
}

+ (uint64_t)hmPrivateErrorWithCode:()HMError
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:a3 userInfo:0];
}

+ (uint64_t)hmInternallErrorWithCode:()HMError userInfo:
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:a3 userInfo:a4];
}

+ (uint64_t)hmInternalErrorWithCode:()HMError description:reason:suggestion:
{
  return [a1 hmInternalErrorWithCode:a3 description:a4 reason:a5 suggestion:a6 underlyingError:0];
}

+ (uint64_t)hmErrorWithCode:()HMError description:reason:suggestion:
{
  return [a1 hmErrorWithCode:a3 description:a4 reason:a5 suggestion:a6 underlyingError:0];
}

+ (id)hmInternalErrorWithCode:()HMError description:reason:suggestion:underlyingError:
{
  unint64_t v8 = [MEMORY[0x1E4F28C58] _hmUserInfoForDescription:a4 reason:a5 suggestion:a6 underlyingError:a7];
  v9 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:a3 userInfo:v8];

  return v9;
}

+ (id)hmErrorWithCode:()HMError description:reason:suggestion:underlyingError:
{
  unint64_t v8 = [MEMORY[0x1E4F28C58] _hmUserInfoForDescription:a4 reason:a5 suggestion:a6 underlyingError:a7];
  v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:a3 userInfo:v8];

  return v9;
}

+ (id)_hmUserInfoForDescription:()HMError reason:suggestion:underlyingError:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = v12;
  if (v9 || v10 || v11 || v12)
  {
    v14 = [MEMORY[0x1E4F1CA60] dictionary];
    if (v9)
    {
      v15 = [MEMORY[0x1E4F28B50] mainBundle];
      v16 = [v15 localizedStringForKey:v9 value:&stru_1EEE9DD88 table:0];
      [v14 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F28568]];
    }
    if (v10)
    {
      v17 = [MEMORY[0x1E4F28B50] mainBundle];
      v18 = [v17 localizedStringForKey:v10 value:&stru_1EEE9DD88 table:0];
      [v14 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F28588]];
    }
    if (v11)
    {
      v19 = [MEMORY[0x1E4F28B50] mainBundle];
      v20 = [v19 localizedStringForKey:v11 value:&stru_1EEE9DD88 table:0];
      [v14 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F285A0]];
    }
    if (v13) {
      [v14 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (__CFString)hmStringFromErrorCode:()HMError
{
  if (a3 > 1000)
  {
    if (a3 > 2200)
    {
      if (a3 > 2999)
      {
        switch(a3)
        {
          case 3000:
            id v4 = @"User did not respond for trigger execution";
            break;
          case 3001:
            id v4 = @"Did not execute trigger as user declined";
            break;
          case 3002:
            id v4 = @"End event cancelled the restore";
            break;
          case 3003:
            id v4 = @"Event trigger execution session was deallocated";
            break;
          case 3005:
            id v4 = @"Trigger failed to execute due to recurrence mismatch";
            break;
          case 3006:
            id v4 = @"Event trigger evaluation condition evalutated to false";
            break;
          case 3007:
            id v4 = @"Did not find compatible resident to send the permission to confirm the trigger execution";
            break;
          default:
            goto LABEL_407;
        }
      }
      else if (a3 <= 2404)
      {
        switch(a3)
        {
          case 2201:
            id v4 = @"Weak password";
            break;
          case 2300:
            id v4 = @"Voice Shortcut with similar name exists";
            break;
          case 2404:
            id v4 = @"The requested operation has started";
            break;
          default:
LABEL_407:
            objc_msgSend(NSString, "stringWithFormat:", @"Unknown error code %ld", a3);
            id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_408:
            break;
        }
      }
      else
      {
        switch(a3)
        {
          case 2500:
            id v4 = @"kResetConfigRequestKey";
            break;
          case 2501:
            id v4 = @"HomeUIService terminated";
            break;
          case 2502:
            id v4 = @"HomeUIService backgrounded";
            break;
          case 2503:
            id v4 = @"No clients";
            break;
          case 2504:
            id v4 = @"Accessory Browser stopped";
            break;
          default:
            if (a3 != 2405) {
              goto LABEL_407;
            }
            id v4 = @"Accessory is calibrating";
            break;
        }
      }
    }
    else if (a3 > 2000)
    {
      switch(a3)
      {
        case 2001:
          id v4 = @"Operation canceled by user.";
          return v4;
        case 2002:
          id v4 = @"Incorrect setup code.";
          return v4;
        case 2003:
          id v4 = @"Secure access Denied.";
          return v4;
        case 2004:
          id v4 = @"Unsupported setup payload.";
          return v4;
        case 2005:
          id v4 = @"Media remote error";
          return v4;
        case 2006:
          goto LABEL_407;
        case 2007:
          id v4 = @"Cloud photo library not enabled";
          return v4;
        default:
          if (a3 == 2100)
          {
            id v4 = @"No Target Accessory";
          }
          else
          {
            if (a3 != 2200) {
              goto LABEL_407;
            }
            id v4 = @"Invalid characters";
          }
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 1001:
          id v4 = @"Error parsing HAP metadata";
          break;
        case 1002:
          id v4 = @"Error serializing HAP metadata";
          break;
        case 1003:
          id v4 = @"Metadata version older than client version";
          break;
        case 1004:
          id v4 = @"Metadata schema version incompatible";
          break;
        case 1005:
          id v4 = @"Failed to create remote view service";
          break;
        case 1006:
          id v4 = @"Invitation has expired";
          break;
        case 1007:
          id v4 = @"Invitation has already been accepted";
          break;
        case 1008:
          id v4 = @"Invitation has already been declined";
          break;
        case 1009:
          id v4 = @"Request was not handled";
          break;
        default:
          goto LABEL_407;
      }
    }
  }
  else
  {
    id v4 = @"Unexpected error";
    switch(a3)
    {
      case -1:
        goto LABEL_408;
      case 1:
        id v4 = @"Object already exists";
        break;
      case 2:
        id v4 = @"Object not found";
        break;
      case 3:
        id v4 = @"Invalid parameter";
        break;
      case 4:
        id v4 = @"Accessory not reachable";
        break;
      case 5:
        id v4 = @"Read only characteristic";
        break;
      case 6:
        id v4 = @"Write only characteristic";
        break;
      case 7:
        id v4 = @"Notification not supported";
        break;
      case 8:
        id v4 = @"Operation timed out";
        break;
      case 9:
        id v4 = @"Accessory powered off";
        break;
      case 10:
        id v4 = @"Access denied";
        break;
      case 11:
        id v4 = @"Object associated with another home";
        break;
      case 12:
        id v4 = @"Object not associated with a home";
        break;
      case 13:
        id v4 = @"Object already associated to home";
        break;
      case 14:
        id v4 = @"Accessory busy";
        break;
      case 15:
        id v4 = @"Operation in progress";
        break;
      case 16:
        id v4 = @"Accessory out of resources";
        break;
      case 17:
        id v4 = @"Insufficient privileges";
        break;
      case 18:
        id v4 = @"Accessory pairing failed";
        break;
      case 19:
        id v4 = @"Invalid data format";
        break;
      case 20:
        id v4 = @"Nil parameter";
        break;
      case 21:
        id v4 = @"Unconfigured parameter";
        break;
      case 22:
        id v4 = @"Parameter of invalid class";
        break;
      case 23:
        id v4 = @"Operation cancelled";
        break;
      case 24:
        id v4 = @"Room for home cannot be added to a zone";
        break;
      case 25:
        id v4 = @"No actions in Action set";
        break;
      case 26:
        id v4 = @"No registered Action sets for trigger";
        break;
      case 27:
        id v4 = @"Missing parameter";
        break;
      case 28:
        id v4 = @"FireDate in past";
        break;
      case 29:
        id v4 = @"Room For home cannot be updated";
        break;
      case 30:
        id v4 = @"Action already associated with another Action set";
        break;
      case 31:
        id v4 = @"Object with similar name exists in home";
        break;
      case 32:
        id v4 = @"Home with similar name exists";
        break;
      case 33:
        id v4 = @"Cannot rename to similar name";
        break;
      case 34:
        id v4 = @"Cannot remove non-bridge accessory";
        break;
      case 35:
        id v4 = @"Name contains prohibited characters";
        break;
      case 36:
        id v4 = @"Name does not start with valid characters";
        break;
      case 37:
        id v4 = @"UserID is not an email address";
        break;
      case 38:
        id v4 = @"Confirmation to add user was declined";
        break;
      case 39:
        id v4 = @"Confirmation to remove user was declined";
        break;
      case 40:
        id v4 = @"User declined invite to access home";
        break;
      case 41:
        id v4 = @"User management failed";
        break;
      case 42:
        id v4 = @"Recurrence too small";
        break;
      case 43:
        id v4 = @"Invalid value type";
        break;
      case 44:
        id v4 = @"Value lower than minimum";
        break;
      case 45:
        id v4 = @"Value higher than maximum";
        break;
      case 46:
        id v4 = @"String longer than maximum length";
        break;
      case 47:
        id v4 = @"Access to home data is not authorized";
        break;
      case 48:
        id v4 = @"Operation is not supported";
        break;
      case 49:
        id v4 = @"Maximum number of objects of requested type already exist";
        break;
      case 50:
        id v4 = @"Accessory sent an invalid response";
        break;
      case 51:
        id v4 = @"String shorter than the minimum length";
        break;
      case 52:
        id v4 = @"An unknown error occurred";
        break;
      case 53:
        id v4 = @"Security check failed or action not allowed";
        break;
      case 54:
        id v4 = @"Network or other communication failure occurred";
        break;
      case 55:
        id v4 = @"Authentication failed";
        break;
      case 56:
        id v4 = @"Invalid message size";
        break;
      case 57:
        id v4 = @"Accessory discovery failed";
        break;
      case 58:
        id v4 = @"Client request error when communicating with accessory";
        break;
      case 59:
        id v4 = @"Accessory response error when communicating with accessory";
        break;
      case 60:
        id v4 = @"Name does not end with valid characters";
        break;
      case 61:
        id v4 = @"Accessory is blocked";
        break;
      case 62:
        id v4 = @"Invalid associated service type";
        break;
      case 63:
        id v4 = @"Action set execution failed";
        break;
      case 64:
        id v4 = @"Action set execution partially succeeded";
        break;
      case 65:
        id v4 = @"Action set being executed";
        break;
      case 66:
        id v4 = @"Accessory out of compliance";
        break;
      case 67:
        id v4 = @"Data reset failed";
        break;
      case 68:
        id v4 = @"Characteristic notification already enabled";
        break;
      case 69:
        id v4 = @"Timer trigger recurrence must be on specified boundaries";
        break;
      case 70:
        id v4 = @"Timer trigger fire date must be on specified boundaries";
        break;
      case 71:
        id v4 = @"Cannot activate a timer trigger that is too far in the future";
        break;
      case 72:
        id v4 = @"Recurrence too large";
        break;
      case 73:
        id v4 = @"Read/Write operation partially succeeded";
        break;
      case 74:
        id v4 = @"Read/Write operation failed";
        break;
      case 75:
        id v4 = @"User is not signed into iCloud";
        break;
      case 76:
        id v4 = @"User does not have iCloud Keychain sync enabled";
        break;
      case 77:
        id v4 = @"Cloud data sync is in progress";
        break;
      case 78:
        id v4 = @"Network Unavailable";
        break;
      case 79:
        id v4 = @"Add accessory failed";
        break;
      case 80:
        id v4 = @"Missing entitlement for API/SPI";
        break;
      case 81:
        id v4 = @"Cannot unblock bridged accessories: only bridges may be unblocked";
        break;
      case 82:
        id v4 = @"Device locked";
        break;
      case 83:
        id v4 = @"Cannot remove builtin action set";
        break;
      case 84:
        id v4 = @"Location Services for Home is disabled";
        break;
      case 85:
        id v4 = @"Not Authorized for Location Services";
        break;
      case 86:
        id v4 = @"Refer to User Manual";
        break;
      case 87:
        id v4 = @"Missing or invalid authorization data";
        break;
      case 88:
        id v4 = @"Bridged Accessory not reachable";
        break;
      case 89:
        id v4 = @"Not Authorized for Microphone Access";
        break;
      case 90:
        id v4 = @"Incompatible network.";
        break;
      case 91:
        id v4 = @"No HomeHub";
        break;
      case 92:
        id v4 = @"No Compatible HomeHub.";
        break;
      case 93:
        id v4 = @"Incompatible Accessory";
        break;
      case 95:
        id v4 = @"Object with similar name exists";
        break;
      case 96:
        id v4 = @"Ownership code did not match.";
        break;
      case 97:
        id v4 = @"Maximum accessories of the type in home";
        break;
      case 98:
        id v4 = @"WiFi credential generation failed";
        break;
      case 103:
        id v4 = @"Accessory is suspended";
        break;
      default:
        goto LABEL_407;
    }
  }
  return v4;
}

@end