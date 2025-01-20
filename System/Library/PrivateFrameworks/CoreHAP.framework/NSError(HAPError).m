@interface NSError(HAPError)
+ (id)_userInfoWithDescription:()HAPError reason:suggestion:underlyingError:;
+ (id)errorWithHMErrorCode:()HAPError reason:underlyingError:;
+ (id)errorWithOSStatus:()HAPError;
+ (id)hapErrorWithCode:()HAPError description:reason:suggestion:underlyingError:;
+ (uint64_t)errorWithHMErrorCode:()HAPError;
+ (uint64_t)errorWithHMErrorCode:()HAPError userInfo:;
+ (uint64_t)hapErrorWithCode:()HAPError;
- (uint64_t)isHAPError;
@end

@implementation NSError(HAPError)

- (uint64_t)isHAPError
{
  v1 = [a1 domain];
  uint64_t v2 = [v1 isEqualToString:@"HAPErrorDomain"];

  return v2;
}

+ (uint64_t)errorWithHMErrorCode:()HAPError userInfo:
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:a3 userInfo:a4];
}

+ (id)errorWithHMErrorCode:()HAPError reason:underlyingError:
{
  v6 = 0;
  if (a3 > 1000)
  {
    v7 = @"Accessory is calibrating";
    v8 = @"Unknown error code 3202";
    if (a3 != 3202) {
      v8 = 0;
    }
    if (a3 != 2405) {
      v7 = v8;
    }
    v9 = @"Error parsing HAP metadata";
    v10 = @"Metadata schema version incompatible";
    if (a3 != 1004) {
      v10 = 0;
    }
    if (a3 != 1001) {
      v9 = v10;
    }
    if (a3 <= 2404) {
      v6 = v9;
    }
    else {
      v6 = v7;
    }
  }
  else
  {
    switch(a3)
    {
      case 2:
        v6 = @"Object not found";
        break;
      case 3:
        v6 = @"Invalid parameter";
        break;
      case 4:
        v6 = @"Accessory not reachable";
        break;
      case 5:
        v6 = @"Read only characteristic";
        break;
      case 6:
        v6 = @"Write only characteristic";
        break;
      case 7:
        v6 = @"Notification not supported";
        break;
      case 8:
        v6 = @"Operation timed out";
        break;
      case 10:
        v6 = @"Access denied";
        break;
      case 11:
        v6 = @"Object associated with another home";
        break;
      case 14:
        v6 = @"Accessory busy";
        break;
      case 15:
        v6 = @"Operation in progress";
        break;
      case 16:
        v6 = @"Accessory out of resources";
        break;
      case 17:
        v6 = @"Insufficient privileges";
        break;
      case 18:
        v6 = @"Accessory pairing failed";
        break;
      case 20:
        v6 = @"Nil parameter";
        break;
      case 23:
        v6 = @"Operation cancelled";
        break;
      case 27:
        v6 = @"Missing parameter";
        break;
      case 43:
        v6 = @"Invalid value type";
        break;
      case 44:
        v6 = @"Value lower than minimum";
        break;
      case 45:
        v6 = @"Value higher than maximum";
        break;
      case 46:
        v6 = @"String longer than maximum length";
        break;
      case 48:
        v6 = @"Operation is not supported";
        break;
      case 49:
        v6 = @"Maximum number of objects of requested type already exist";
        break;
      case 50:
        v6 = @"Accessory sent an invalid response";
        break;
      case 51:
        v6 = @"String shorter than the minimum length";
        break;
      case 52:
        v6 = @"An unknown error occurred";
        break;
      case 53:
        v6 = @"Security check failed or action not allowed";
        break;
      case 54:
        v6 = @"Network or other communication failure occurred";
        break;
      case 55:
        v6 = @"Authentication failed";
        break;
      case 56:
        v6 = @"Invalid message size";
        break;
      case 57:
        v6 = @"Accessory discovery failed";
        break;
      case 58:
        v6 = @"Client request error when communicating with accessory";
        break;
      case 59:
        v6 = @"Accessory response error when communicating with accessory";
        break;
      case 66:
        v6 = @"Accessory out of compliance";
        break;
      case 79:
        v6 = @"Add accessory failed";
        break;
      case 87:
        v6 = @"Missing or invalid authorization data";
        break;
      case 88:
        v6 = @"Bridged Accessory not reachable";
        break;
      case 96:
        v6 = @"Ownership code did not match.";
        break;
      default:
        break;
    }
  }
  v11 = [MEMORY[0x1E4F28C58] _userInfoWithDescription:v6 reason:a4 suggestion:0 underlyingError:a5];
  v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:a3 userInfo:v11];

  return v12;
}

+ (uint64_t)errorWithHMErrorCode:()HAPError
{
  return [MEMORY[0x1E4F28C58] errorWithHMErrorCode:a3 reason:0 underlyingError:0];
}

+ (uint64_t)hapErrorWithCode:()HAPError
{
  v4 = objc_opt_class();

  return [v4 hapErrorWithCode:a3 description:0 reason:0 suggestion:0 underlyingError:0];
}

+ (id)errorWithOSStatus:()HAPError
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v5 = *MEMORY[0x1E4F28760];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    uint64_t v6 = [NSString stringWithUTF8String:DebugGetErrorString()];
    v7 = (void *)v6;
    v8 = @"?";
    if (v6) {
      v8 = (__CFString *)v6;
    }
    v13[0] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v10 = (void *)[v4 initWithDomain:v5 code:a3 userInfo:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)hapErrorWithCode:()HAPError description:reason:suggestion:underlyingError:
{
  v8 = [MEMORY[0x1E4F28C58] _userInfoWithDescription:a4 reason:a5 suggestion:a6 underlyingError:a7];
  v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:a3 userInfo:v8];

  return v9;
}

+ (id)_userInfoWithDescription:()HAPError reason:suggestion:underlyingError:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = v12;
  if (v9 || v10 || v11 || v12)
  {
    v15 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
    if (v9)
    {
      v16 = [MEMORY[0x1E4F28B50] mainBundle];
      v17 = [v16 localizedStringForKey:v9 value:&stru_1F2C4E778 table:0];
      [v15 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F28568]];
    }
    if (v10)
    {
      v18 = [MEMORY[0x1E4F28B50] mainBundle];
      v19 = [v18 localizedStringForKey:v10 value:&stru_1F2C4E778 table:0];
      [v15 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F28588]];
    }
    if (v11)
    {
      v20 = [MEMORY[0x1E4F28B50] mainBundle];
      v21 = [v20 localizedStringForKey:v11 value:&stru_1F2C4E778 table:0];
      [v15 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F285A0]];
    }
    if (v13) {
      [v15 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    }
    v14 = (void *)[v15 copy];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end