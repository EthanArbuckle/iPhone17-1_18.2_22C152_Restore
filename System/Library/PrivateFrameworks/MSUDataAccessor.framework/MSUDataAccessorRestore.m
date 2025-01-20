@interface MSUDataAccessorRestore
- (id)copyMountPointForVolumeType:(int)a3 error:(id *)a4;
- (id)copyPathForPersonalizedData:(int)a3 error:(id *)a4;
- (id)findVolumesWithRole:(int)a3;
- (id)getVolumeWithUUID:(id)a3;
- (id)specialCaseAPTicketForRamdiskWithError:(id *)a3;
@end

@implementation MSUDataAccessorRestore

- (id)copyMountPointForVolumeType:(int)a3 error:(id *)a4
{
  if (a3)
  {
    if (a3 != 1)
    {
      +[MSUDataAccessor buildErrorForRef:a4 code:6000 description:@"Unknown volume type"];
      return 0;
    }
    uint64_t v5 = 13;
  }
  else
  {
    uint64_t v5 = 6;
  }
  id v6 = [(MSUDataAccessorRestore *)self findVolumesWithRole:v5];
  if ([v6 count] == 1)
  {
    id v7 = (id)[v6 objectAtIndex:0];
    id v8 = (id)[v7 mountPoint];
    v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      +[MSUDataAccessor buildErrorForRef:a4 code:6003 description:@"Volume not mounted"];
    }
  }
  else
  {
    if ((unint64_t)[v6 count] < 2) {
      v11 = @"Missing volume";
    }
    else {
      v11 = @"Too many volumes";
    }
    +[MSUDataAccessor buildErrorForRef:a4 code:6003 description:v11];
    v9 = 0;
  }

  return v9;
}

- (id)specialCaseAPTicketForRamdiskWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = (id)[MEMORY[0x263F08850] defaultManager];
  int v5 = [v4 fileExistsAtPath:@"/private/var/Keychains/apticket.der"];

  if (v5)
  {
    if (a3) {
      *a3 = 0;
    }
    id v6 = (id)[MEMORY[0x263EFF8F8] dataWithContentsOfFile:@"/private/var/Keychains/apticket.der" options:0 error:a3];
    if (v6)
    {
      id v7 = (void *)MGCopyAnswer();
      if (v7)
      {
        id v8 = v7;
        CFTypeID v9 = CFGetTypeID(v7);
        if (v9 == CFDataGetTypeID())
        {
          id v10 = (__CFString *)MGCopyAnswer();
          if (v10)
          {
            v11 = v10;
            CFTypeID v12 = CFGetTypeID(v10);
            if (v12 != CFStringGetTypeID())
            {
              CFRelease(v11);
              +[MSUDataAccessor buildErrorForRef:a3 code:6005 description:@"Bad type in response to crypto hash method query"];
              v13 = 0;
LABEL_27:

              goto LABEL_15;
            }
          }
          else
          {
            v11 = @"sha1";
          }
          long long v23 = 0u;
          long long v24 = 0u;
          *(_OWORD *)md = 0u;
          if ([(__CFString *)v11 isEqualToString:@"sha1"])
          {
            id v16 = v6;
            CC_SHA1((const void *)[v16 bytes], objc_msgSend(v16, "length"), md);
            uint64_t v17 = 20;
          }
          else
          {
            if (![(__CFString *)v11 isEqualToString:@"sha2-384"])
            {
              id v21 = (id)[NSString stringWithFormat:@"Unsupported crypto hash method %@", v11];
              +[MSUDataAccessor buildErrorForRef:a3 code:6005 description:v21];

              v13 = 0;
LABEL_26:

              goto LABEL_27;
            }
            id v18 = v6;
            CC_SHA384((const void *)[v18 bytes], objc_msgSend(v18, "length"), md);
            uint64_t v17 = 48;
          }
          id v19 = (id)[MEMORY[0x263EFF8F8] dataWithBytesNoCopy:md length:v17 freeWhenDone:0];
          v13 = @"/private/var/Keychains/apticket.der";
          if (([v19 isEqualToData:v8] & 1) == 0)
          {
            id v20 = (id)[NSString stringWithFormat:@"Found apticket at %@ but it does not match the boot manifest hash", @"/private/var/Keychains/apticket.der"];
            +[MSUDataAccessor buildErrorForRef:a3 code:6006 description:v20];

            v13 = 0;
          }

          goto LABEL_26;
        }
        CFRelease(v8);
        v14 = @"Bad type in response to boot manifest hash query";
      }
      else
      {
        v14 = @"Failed to boot manifest hash";
      }
      +[MSUDataAccessor buildErrorForRef:a3 code:6005 description:v14];
    }
    v13 = 0;
LABEL_15:

    return v13;
  }
  return 0;
}

- (id)copyPathForPersonalizedData:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  if (a3 != 2
    || (id result = [(MSUDataAccessorRestore *)self specialCaseAPTicketForRamdiskWithError:a4]) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)MSUDataAccessorRestore;
    return [(MSUDataAccessor *)&v8 copyPathForPersonalizedData:v5 error:a4];
  }
  return result;
}

- (id)getVolumeWithUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = (id)[MEMORY[0x263F8C700] allMedia];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        CFTypeID v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          id v11 = (id)objc_msgSend(v10, "mediaUUID", (void)v14);
          char v12 = [v11 isEqualToString:v3];

          if (v12) {
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  id v10 = 0;
LABEL_12:

  return v10;
}

- (id)findVolumesWithRole:(int)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (id)[MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_msgSend(MEMORY[0x263F8C700], "allMedia", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          if ([v11 role] == a3) {
            [v4 addObject:v11];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

@end