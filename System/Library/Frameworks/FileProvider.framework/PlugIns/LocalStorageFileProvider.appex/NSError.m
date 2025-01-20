@interface NSError
+ (id)fp_GSInvalidStorageError;
+ (id)fp_errorForDataProtectionClass:(int)a3;
+ (id)fp_nonEvictableChildrenErrorWithFD:(int)a3 trashIno:(unint64_t)a4 busyIno:(unint64_t)a5;
+ (id)purgeabilityErrorForReason:(unint64_t)a3 atURL:(id)a4;
- (BOOL)fp_isGSErrorWithCode:(int)a3;
- (BOOL)fp_isGSInvalidStorageError;
- (id)fp_protectionClassBehindError;
@end

@implementation NSError

+ (id)purgeabilityErrorForReason:(unint64_t)a3 atURL:(id)a4
{
  id v5 = a4;
  switch(a3)
  {
    case 1uLL:
      uint64_t v6 = +[NSError fp_errorWithPOSIXCode:*__error() itemURL:v5 debugDescription:@"Unable to stat(2) item after eviction attempt"];
      goto LABEL_8;
    case 2uLL:
      uint64_t v6 = FPEvictionWithUnsyncedEditsError();
      goto LABEL_8;
    case 3uLL:
      uint64_t v6 = FPEvictionOnBusyItemError();
      goto LABEL_8;
    case 4uLL:
      uint64_t v6 = FPEvictionOnItemWithHardlinkError();
      goto LABEL_8;
    case 5uLL:
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

+ (id)fp_nonEvictableChildrenErrorWithFD:(int)a3 trashIno:(unint64_t)a4 busyIno:(unint64_t)a5
{
  bzero(v11, 0x400uLL);
  fpfs_fgetpath();
  id v5 = +[NSURL fileURLWithFileSystemRepresentation:v11 isDirectory:1 relativeToURL:0];
  v10 = objc_opt_new();
  id v6 = v10;
  id v7 = v5;
  fpfs_fopendir();
  v8 = FPNonEvictableChildrenError();

  return v8;
}

- (id)fp_protectionClassBehindError
{
  if (([(NSError *)self fp_isCocoaErrorCode:257] & 1) != 0
    || [(NSError *)self fp_isPOSIXErrorCode:1])
  {
    v3 = [(NSError *)self userInfo];
    v4 = [v3 objectForKeyedSubscript:@"dataProtectionClass"];

    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v5 = v4;
      v4 = v5;
    }
    else
    {
      id v6 = [(NSError *)self userInfo];
      id v7 = [v6 objectForKeyedSubscript:NSURLErrorKey];

      if (v7)
      {
        id v11 = 0;
        unsigned int v8 = [v7 getResourceValue:&v11 forKey:NSURLFileProtectionKey error:0];
        id v9 = v11;

        if (v8)
        {
          id v5 = v9;
          v4 = v5;
        }
        else
        {
          id v5 = 0;
          v4 = v9;
        }
      }
      else
      {
        id v5 = 0;
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)fp_errorForDataProtectionClass:(int)a3
{
  if (a3 == 2)
  {
    CFStringRef v8 = @"dataProtectionClass";
    NSURLFileProtectionType v9 = NSURLFileProtectionCompleteUnlessOpen;
    v3 = &v9;
    v4 = &v8;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    CFStringRef v10 = @"dataProtectionClass";
    NSURLFileProtectionType v11 = NSURLFileProtectionComplete;
    v3 = &v11;
    v4 = &v10;
LABEL_5:
    id v5 = +[NSDictionary dictionaryWithObjects:v3 forKeys:v4 count:1];
    goto LABEL_7;
  }
  id v5 = 0;
LABEL_7:
  id v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:v5];

  return v6;
}

- (BOOL)fp_isGSErrorWithCode:(int)a3
{
  id v5 = (void *)kGSLibraryErrorDomain;
  id v6 = [(NSError *)self domain];
  if ([v5 isEqualToString:v6]) {
    BOOL v7 = (id)[(NSError *)self code] == (id)a3;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)fp_isGSInvalidStorageError
{
  return [(NSError *)self fp_isGSErrorWithCode:7];
}

+ (id)fp_GSInvalidStorageError
{
  return +[NSError errorWithDomain:kGSLibraryErrorDomain code:7 userInfo:0];
}

@end