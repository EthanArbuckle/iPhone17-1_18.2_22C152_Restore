@interface NSError(FPFSAdditions)
+ (id)fp_errorForDataProtectionClass:()FPFSAdditions;
+ (id)fp_nonEvictableChildrenErrorWithFD:()FPFSAdditions trashIno:busyIno:;
+ (id)purgeabilityErrorForReason:()FPFSAdditions atURL:;
- (id)fp_protectionClassBehindError;
@end

@implementation NSError(FPFSAdditions)

+ (id)purgeabilityErrorForReason:()FPFSAdditions atURL:
{
  id v5 = a4;
  switch(a3)
  {
    case 1:
      uint64_t v6 = objc_msgSend(MEMORY[0x263F087E8], "fp_errorWithPOSIXCode:itemURL:debugDescription:", *__error(), v5, @"Unable to stat(2) item after eviction attempt");
      goto LABEL_8;
    case 2:
      uint64_t v6 = FPEvictionWithUnsyncedEditsError();
      goto LABEL_8;
    case 3:
      uint64_t v6 = FPEvictionOnBusyItemError();
      goto LABEL_8;
    case 4:
      uint64_t v6 = FPEvictionOnItemWithHardlinkError();
      goto LABEL_8;
    case 5:
      uint64_t v6 = FPMissingAllowsEvictingCapabilitiesError();
LABEL_8:
      v7 = (void *)v6;
      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

+ (id)fp_nonEvictableChildrenErrorWithFD:()FPFSAdditions trashIno:busyIno:
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  bzero(v6, 0x400uLL);
  fpfs_fgetpath();
  v0 = [NSURL fileURLWithFileSystemRepresentation:v6 isDirectory:1 relativeToURL:0];
  id v5 = objc_opt_new();
  id v1 = v5;
  id v2 = v0;
  fpfs_fopendir();
  v3 = FPNonEvictableChildrenError();

  return v3;
}

- (id)fp_protectionClassBehindError
{
  if ((objc_msgSend(a1, "fp_isCocoaErrorCode:", 257) & 1) != 0
    || objc_msgSend(a1, "fp_isPOSIXErrorCode:", 1))
  {
    id v2 = [a1 userInfo];
    v3 = [v2 objectForKeyedSubscript:@"dataProtectionClass"];

    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v4 = v3;
      v3 = v4;
    }
    else
    {
      id v5 = [a1 userInfo];
      uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F08590]];

      if (v6)
      {
        id v10 = 0;
        int v7 = [v6 getResourceValue:&v10 forKey:*MEMORY[0x263EFF650] error:0];
        id v8 = v10;

        if (v7)
        {
          id v4 = v8;
          v3 = v4;
        }
        else
        {
          id v4 = 0;
          v3 = v8;
        }
      }
      else
      {
        id v4 = 0;
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)fp_errorForDataProtectionClass:()FPFSAdditions
{
  v12[1] = *MEMORY[0x263EF8340];
  if (a3 == 2)
  {
    v9 = @"dataProtectionClass";
    uint64_t v10 = *MEMORY[0x263EFF640];
    v3 = NSDictionary;
    id v4 = &v10;
    id v5 = &v9;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v11 = @"dataProtectionClass";
    v12[0] = *MEMORY[0x263EFF638];
    v3 = NSDictionary;
    id v4 = v12;
    id v5 = &v11;
LABEL_5:
    uint64_t v6 = [v3 dictionaryWithObjects:v4 forKeys:v5 count:1];
    goto LABEL_7;
  }
  uint64_t v6 = 0;
LABEL_7:
  int v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:1 userInfo:v6];

  return v7;
}

@end