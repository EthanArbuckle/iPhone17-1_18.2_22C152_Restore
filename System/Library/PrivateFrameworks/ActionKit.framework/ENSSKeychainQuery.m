@interface ENSSKeychainQuery
+ (BOOL)isSynchronizationAvailable;
+ (id)errorWithCode:(int)a3;
- (BOOL)deleteItem:(id *)a3;
- (BOOL)fetch:(id *)a3;
- (BOOL)save:(id *)a3;
- (NSCoding)passwordObject;
- (NSData)passwordData;
- (NSString)accessGroup;
- (NSString)account;
- (NSString)label;
- (NSString)password;
- (NSString)service;
- (id)fetchAll:(id *)a3;
- (id)query;
- (unint64_t)synchronizationMode;
- (void)setAccessGroup:(id)a3;
- (void)setAccount:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordData:(id)a3;
- (void)setPasswordObject:(id)a3;
- (void)setService:(id)a3;
- (void)setSynchronizationMode:(unint64_t)a3;
@end

@implementation ENSSKeychainQuery

+ (id)errorWithCode:(int)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  if (a3 <= -1002)
  {
    switch(a3)
    {
      case -25300:
        v4 = [MEMORY[0x263F086E0] mainBundle];
        v5 = v4;
        v6 = @"errSecItemNotFound";
        goto LABEL_23;
      case -25299:
        v4 = [MEMORY[0x263F086E0] mainBundle];
        v5 = v4;
        v6 = @"errSecDuplicateItem";
        goto LABEL_23;
      case -25298:
      case -25297:
      case -25296:
      case -25295:
      case -25294:
      case -25292:
        goto LABEL_15;
      case -25293:
        v4 = [MEMORY[0x263F086E0] mainBundle];
        v5 = v4;
        v6 = @"errSecAuthFailed";
        goto LABEL_23;
      case -25291:
        v4 = [MEMORY[0x263F086E0] mainBundle];
        v5 = v4;
        v6 = @"errSecNotAvailable";
        goto LABEL_23;
      default:
        if (a3 == -26275)
        {
          v4 = [MEMORY[0x263F086E0] mainBundle];
          v5 = v4;
          v6 = @"errSecDecode";
        }
        else
        {
          if (a3 != -25308) {
            goto LABEL_15;
          }
          v4 = [MEMORY[0x263F086E0] mainBundle];
          v5 = v4;
          v6 = @"errSecInteractionNotAllowed";
        }
        break;
    }
    goto LABEL_23;
  }
  if (a3 <= -51)
  {
    if (a3 == -1001)
    {
      v4 = [MEMORY[0x263F086E0] mainBundle];
      v5 = v4;
      v6 = @"ENSSKeychainErrorBadArguments";
      goto LABEL_23;
    }
    if (a3 == -108)
    {
      v4 = [MEMORY[0x263F086E0] mainBundle];
      v5 = v4;
      v6 = @"errSecAllocate";
LABEL_23:
      v8 = [v4 localizedStringForKey:v6 value:&stru_26F008428 table:@"ENSSKeychain"];

      if (v8)
      {
        uint64_t v11 = *MEMORY[0x263F08320];
        v12[0] = v8;
        v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
      }
      else
      {
        v9 = 0;
      }
      v7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.samsoffes.ENSSKeychain" code:a3 userInfo:v9];

      goto LABEL_27;
    }
LABEL_15:
    v4 = [MEMORY[0x263F086E0] mainBundle];
    v5 = v4;
    v6 = @"errSecDefault";
    goto LABEL_23;
  }
  if (a3 == -50)
  {
    v4 = [MEMORY[0x263F086E0] mainBundle];
    v5 = v4;
    v6 = @"errSecParam";
    goto LABEL_23;
  }
  if (a3 == -4)
  {
    v4 = [MEMORY[0x263F086E0] mainBundle];
    v5 = v4;
    v6 = @"errSecUnimplemented";
    goto LABEL_23;
  }
  if (a3) {
    goto LABEL_15;
  }
  v7 = 0;
LABEL_27:
  return v7;
}

+ (BOOL)isSynchronizationAvailable
{
  return floor(*MEMORY[0x263F080F8]) > 993.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_passwordData, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)setSynchronizationMode:(unint64_t)a3
{
  self->_synchronizationMode = a3;
}

- (unint64_t)synchronizationMode
{
  return self->_synchronizationMode;
}

- (void)setAccessGroup:(id)a3
{
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (void)setPasswordData:(id)a3
{
}

- (NSData)passwordData
{
  return self->_passwordData;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setService:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setAccount:(id)a3
{
}

- (NSString)account
{
  return self->_account;
}

- (id)query
{
  v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  [v3 setObject:*MEMORY[0x263F171C8] forKey:*MEMORY[0x263F171B8]];
  v4 = [(ENSSKeychainQuery *)self service];

  if (v4)
  {
    v5 = [(ENSSKeychainQuery *)self service];
    [v3 setObject:v5 forKey:*MEMORY[0x263F17090]];
  }
  v6 = [(ENSSKeychainQuery *)self account];

  if (v6)
  {
    v7 = [(ENSSKeychainQuery *)self account];
    [v3 setObject:v7 forKey:*MEMORY[0x263F16ED8]];
  }
  v8 = [(ENSSKeychainQuery *)self accessGroup];

  if (v8)
  {
    v9 = [(ENSSKeychainQuery *)self accessGroup];
    [v3 setObject:v9 forKey:*MEMORY[0x263F16E80]];
  }
  if ([(id)objc_opt_class() isSynchronizationAvailable])
  {
    unint64_t v10 = [(ENSSKeychainQuery *)self synchronizationMode];
    if (v10)
    {
      uint64_t v11 = (void *)MEMORY[0x263EFFA80];
      if (v10 != 1) {
        uint64_t v11 = 0;
      }
      if (v10 == 2) {
        id v12 = (id)MEMORY[0x263EFFA88];
      }
      else {
        id v12 = v11;
      }
    }
    else
    {
      id v12 = (id)*MEMORY[0x263F170B8];
    }
    [v3 setObject:v12 forKey:*MEMORY[0x263F170B0]];
  }
  return v3;
}

- (NSString)password
{
  v3 = [(ENSSKeychainQuery *)self passwordData];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = [NSString alloc];
    v6 = [(ENSSKeychainQuery *)self passwordData];
    v7 = (void *)[v5 initWithData:v6 encoding:4];
  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (void)setPassword:(id)a3
{
  id v4 = [a3 dataUsingEncoding:4];
  [(ENSSKeychainQuery *)self setPasswordData:v4];
}

- (NSCoding)passwordObject
{
  v3 = [(ENSSKeychainQuery *)self passwordData];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x263F08928];
    v6 = [(ENSSKeychainQuery *)self passwordData];
    v7 = [v5 unarchiveObjectWithData:v6];
  }
  else
  {
    v7 = 0;
  }
  return (NSCoding *)v7;
}

- (void)setPasswordObject:(id)a3
{
  id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3];
  [(ENSSKeychainQuery *)self setPasswordData:v4];
}

- (BOOL)fetch:(id *)a3
{
  uint64_t v5 = [(ENSSKeychainQuery *)self service];
  if (v5
    && (v6 = (void *)v5,
        [(ENSSKeychainQuery *)self account],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    CFTypeRef result = 0;
    v8 = [(ENSSKeychainQuery *)self query];
    [v8 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F17520]];
    [v8 setObject:*MEMORY[0x263F17410] forKey:*MEMORY[0x263F17400]];
    uint64_t v9 = SecItemCopyMatching((CFDictionaryRef)v8, &result);
    BOOL v10 = v9 == 0;
    if (v9)
    {
      if (a3)
      {
        *a3 = [(id)objc_opt_class() errorWithCode:v9];
      }
    }
    else
    {
      uint64_t v11 = (void *)result;
      [(ENSSKeychainQuery *)self setPasswordData:result];
    }
  }
  else if (a3)
  {
    [(id)objc_opt_class() errorWithCode:4294966295];
    BOOL v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v10;
}

- (id)fetchAll:(id *)a3
{
  id v4 = [(ENSSKeychainQuery *)self query];
  [v4 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F17518]];
  [v4 setObject:*MEMORY[0x263F17408] forKey:*MEMORY[0x263F17400]];
  CFTypeRef result = 0;
  uint64_t v5 = SecItemCopyMatching((CFDictionaryRef)v4, &result);
  if (a3 && v5)
  {
    [(id)objc_opt_class() errorWithCode:v5];
    v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)result;
  }

  return v6;
}

- (BOOL)deleteItem:(id *)a3
{
  uint64_t v5 = [(ENSSKeychainQuery *)self service];
  if (v5
    && (v6 = (void *)v5,
        [(ENSSKeychainQuery *)self account],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    CFDictionaryRef v8 = [(ENSSKeychainQuery *)self query];
    uint64_t v9 = SecItemDelete(v8);
    int v10 = v9;
    if (a3 && v9)
    {
      *a3 = [(id)objc_opt_class() errorWithCode:v9];
    }
    BOOL v11 = v10 == 0;
  }
  else if (a3)
  {
    [(id)objc_opt_class() errorWithCode:4294966295];
    BOOL v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v11;
}

- (BOOL)save:(id *)a3
{
  uint64_t v5 = [(ENSSKeychainQuery *)self service];
  if (!v5) {
    goto LABEL_13;
  }
  v6 = (void *)v5;
  uint64_t v7 = [(ENSSKeychainQuery *)self account];
  if (!v7)
  {

LABEL_13:
    if (!a3) {
      return 0;
    }
    [(id)objc_opt_class() errorWithCode:4294966295];
    BOOL v17 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return v17;
  }
  CFDictionaryRef v8 = (void *)v7;
  uint64_t v9 = [(ENSSKeychainQuery *)self passwordData];

  if (!v9) {
    goto LABEL_13;
  }
  [(ENSSKeychainQuery *)self deleteItem:0];
  int v10 = [(ENSSKeychainQuery *)self query];
  BOOL v11 = [(ENSSKeychainQuery *)self passwordData];
  [v10 setObject:v11 forKey:*MEMORY[0x263F175A8]];

  id v12 = [(ENSSKeychainQuery *)self label];

  if (v12)
  {
    v13 = [(ENSSKeychainQuery *)self label];
    [v10 setObject:v13 forKey:*MEMORY[0x263F17000]];
  }
  v14 = +[ENSSKeychain accessibilityType];
  if (v14) {
    [v10 setObject:v14 forKey:*MEMORY[0x263F16E90]];
  }
  uint64_t v15 = SecItemAdd((CFDictionaryRef)v10, 0);
  int v16 = v15;
  if (a3 && v15)
  {
    *a3 = [(id)objc_opt_class() errorWithCode:v15];
  }
  BOOL v17 = v16 == 0;

  return v17;
}

@end