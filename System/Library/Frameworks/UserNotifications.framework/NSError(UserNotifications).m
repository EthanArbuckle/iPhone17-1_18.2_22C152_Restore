@interface NSError(UserNotifications)
+ (__CFString)_un_descriptionForUNErrorCode:()UserNotifications;
+ (__CFString)_un_descriptionForUNPrivateErrorCode:()UserNotifications;
+ (id)_updateUserInfo:()UserNotifications withLocalizedDescription:;
+ (id)un_errorWithUNErrorCode:()UserNotifications userInfo:;
+ (id)un_errorWithUNPrivateErrorCode:()UserNotifications userInfo:;
@end

@implementation NSError(UserNotifications)

+ (id)un_errorWithUNErrorCode:()UserNotifications userInfo:
{
  id v6 = a4;
  v7 = objc_msgSend(a1, "_un_descriptionForUNErrorCode:", a3);
  v8 = [a1 _updateUserInfo:v6 withLocalizedDescription:v7];

  v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UNErrorDomain" code:a3 userInfo:v8];

  return v9;
}

+ (id)un_errorWithUNPrivateErrorCode:()UserNotifications userInfo:
{
  id v6 = a4;
  v7 = objc_msgSend(a1, "_un_descriptionForUNPrivateErrorCode:", a3);
  v8 = [a1 _updateUserInfo:v6 withLocalizedDescription:v7];

  v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UNErrorDomain" code:a3 userInfo:v8];

  return v9;
}

+ (__CFString)_un_descriptionForUNErrorCode:()UserNotifications
{
  result = @"Notifications are not allowed for this application";
  if (a3 > 1399)
  {
    v4 = @"Content providing object not allowed";
    v5 = @"Content providing object is invalid";
    id v6 = @"Badge count is invalid";
    if (a3 != 1600) {
      id v6 = @"Notifications are not allowed for this application";
    }
    if (a3 != 1501) {
      v5 = v6;
    }
    if (a3 != 1500) {
      v4 = v5;
    }
    v7 = @"Notification has no date";
    v8 = @"Notification has no user visible content";
    if (a3 != 1401) {
      v8 = @"Notifications are not allowed for this application";
    }
    if (a3 != 1400) {
      v7 = v8;
    }
    if (a3 <= 1499) {
      return v7;
    }
    else {
      return v4;
    }
  }
  else
  {
    switch(a3)
    {
      case 'd':
        result = @"Invalid attachment file URL";
        break;
      case 'e':
        result = @"Unrecognized attachment file type";
        break;
      case 'f':
        result = @"Invalid attachment file size";
        break;
      case 'g':
        result = @"Attachment is not in the data store";
        break;
      case 'h':
        result = @"Failed to move attachment file into data store";
        break;
      case 'i':
        result = @"Attachment is corrupt";
        break;
      default:
        return result;
    }
  }
  return result;
}

+ (__CFString)_un_descriptionForUNPrivateErrorCode:()UserNotifications
{
  switch(a3)
  {
    case 1901:
      result = @"Service extension time expired";
      break;
    case 1902:
      result = @"Invalid context";
      break;
    case 1903:
      result = @"Service extension encountered an unknown error";
      break;
    case 1904:
      result = @"Unknown application";
      break;
    default:
      if (a3 == 2000) {
        result = @"Repository could not save notification due to mismatched revision numbers";
      }
      else {
        result = @"Service extension failed to start";
      }
      break;
  }
  return result;
}

+ (id)_updateUserInfo:()UserNotifications withLocalizedDescription:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8 = [v5 objectForKey:*MEMORY[0x1E4F28568]];

  if (!v8)
  {
    v9 = (void *)[v5 mutableCopy];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    }
    v12 = v11;

    [v12 setObject:v6 forKey:v7];
    uint64_t v13 = [v12 copy];

    id v5 = (id)v13;
  }

  return v5;
}

@end