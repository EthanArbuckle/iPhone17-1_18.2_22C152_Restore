@interface NSError(FSKitAdditions)
+ (id)_fskit_errorWithFSKitCode:()FSKitAdditions itemURL:debugDescription:message:;
+ (id)_fskit_errorWithFSKitCode:()FSKitAdditions variant:;
+ (id)fskit_errorWithPOSIXCode:()FSKitAdditions description:;
+ (uint64_t)fskit_errorWithFSKitCode:()FSKitAdditions;
+ (uint64_t)fskit_errorWithPOSIXCode:()FSKitAdditions itemURL:debugDescription:;
+ (void)fskit_initLocalizationStrings;
- (id)fskit_userInfoValueForKey:()FSKitAdditions;
- (uint64_t)fs_posixCode;
- (uint64_t)fskit_isFSKitError:()FSKitAdditions;
@end

@implementation NSError(FSKitAdditions)

+ (void)fskit_initLocalizationStrings
{
  if (fskit_initLocalizationStrings_pred != -1) {
    dispatch_once(&fskit_initLocalizationStrings_pred, &__block_literal_global_7);
  }
}

+ (id)_fskit_errorWithFSKitCode:()FSKitAdditions itemURL:debugDescription:message:
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  objc_msgSend(a1, "fskit_initLocalizationStrings");
  v13 = [MEMORY[0x263EFF9A0] dictionary];
  [v13 setObject:v12 forKeyedSubscript:*MEMORY[0x263F08590]];

  [v13 setObject:v11 forKeyedSubscript:*MEMORY[0x263F07F80]];
  if (v10) {
    [v13 setObject:v10 forKeyedSubscript:*MEMORY[0x263EFFC48]];
  }
  v14 = [MEMORY[0x263F087E8] errorWithDomain:@"FSKitErrorDomain" code:a3 userInfo:v13];

  return v14;
}

+ (id)_fskit_errorWithFSKitCode:()FSKitAdditions variant:
{
  id v6 = a4;
  objc_msgSend(a1, "fskit_initLocalizationStrings");
  v7 = [MEMORY[0x263EFF9A0] dictionary];
  [v7 setObject:v6 forKeyedSubscript:@"FSKitErrorVariantKey"];

  v8 = [MEMORY[0x263F087E8] errorWithDomain:@"FSKitErrorDomain" code:a3 userInfo:v7];

  return v8;
}

+ (uint64_t)fskit_errorWithFSKitCode:()FSKitAdditions
{
  return objc_msgSend(a1, "_fskit_errorWithFSKitCode:itemURL:debugDescription:message:", a3, 0, 0, 0);
}

+ (id)fskit_errorWithPOSIXCode:()FSKitAdditions description:
{
  id v11 = (objc_class *)NSString;
  id v12 = a4;
  v13 = (void *)[[v11 alloc] initWithFormat:v12 arguments:&a9];

  v14 = objc_msgSend(a1, "_fskit_errorWithFSKitCode:itemURL:debugDescription:message:", a3, 0, 0, v13);

  return v14;
}

+ (uint64_t)fskit_errorWithPOSIXCode:()FSKitAdditions itemURL:debugDescription:
{
  return objc_msgSend(a1, "_fskit_errorWithFSKitCode:itemURL:debugDescription:message:", a3, a4, a5, 0);
}

- (uint64_t)fskit_isFSKitError:()FSKitAdditions
{
  v5 = [a1 domain];
  if ([v5 isEqualToString:@"FSKitErrorDomain"])
  {
    uint64_t v6 = [a1 code];

    if (v6 == a3) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (id)fskit_userInfoValueForKey:()FSKitAdditions
{
  id v4 = a3;
  v5 = [a1 domain];
  int v6 = [v5 isEqualToString:@"FSKitErrorDomain"];

  if (!v6)
  {
    id v10 = 0;
    goto LABEL_13;
  }
  v7 = [a1 userInfo];
  v8 = [v7 objectForKeyedSubscript:@"FSKitErrorVariantKey"];

  if ([v4 isEqualToString:*MEMORY[0x263F08320]])
  {
    v9 = &stru_26FFF08C0;
  }
  else if ([v4 isEqualToString:*MEMORY[0x263F08338]])
  {
    v9 = @"-C";
  }
  else
  {
    if (![v4 isEqualToString:*MEMORY[0x263F08348]])
    {
LABEL_11:
      id v10 = 0;
      goto LABEL_12;
    }
    v9 = @"-R";
  }
  uint64_t v11 = [a1 code];
  if ((unint64_t)(v11 - 4500) > 5) {
    goto LABEL_11;
  }
  id v10 = FSKitLocalizedStringWithKeyAndVariant(v11, off_26530B650[v11 - 4500], v9, v8, v12, v13, v14, v15, v17);
LABEL_12:

LABEL_13:
  return v10;
}

- (uint64_t)fs_posixCode
{
  v2 = [a1 domain];
  int v3 = [v2 isEqualToString:*MEMORY[0x263F08438]];

  if (!v3)
  {
    v5 = [a1 domain];
    int v6 = [v5 isEqualToString:*MEMORY[0x263F07F70]];

    if (!v6) {
      return 22;
    }
    uint64_t v7 = [a1 code];
    if (v7 <= 639)
    {
      if (v7 > 512)
      {
        if (v7 != 513)
        {
          if (v7 == 516) {
            return 17;
          }
          return 22;
        }
      }
      else
      {
        if (v7 == 4) {
          return 2;
        }
        if (v7 != 257) {
          return 22;
        }
      }
      return 13;
    }
    if (v7 > 3071)
    {
      if (v7 == 3072) {
        return 89;
      }
      if (v7 == 3328) {
        return 45;
      }
    }
    else
    {
      if (v7 == 640) {
        return 28;
      }
      if (v7 == 642) {
        return 30;
      }
    }
    return 22;
  }
  return [a1 code];
}

@end