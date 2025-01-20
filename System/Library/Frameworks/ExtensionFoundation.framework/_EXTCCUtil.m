@interface _EXTCCUtil
+ (BOOL)photoServiceAuthorizationStatusWithExtensionUUID:(id)a3 error:(id *)a4;
@end

@implementation _EXTCCUtil

+ (BOOL)photoServiceAuthorizationStatusWithExtensionUUID:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithUUID:v5 error:0];
  v7 = [v6 containingBundleRecord];
  if (v7
    && (CFAllocatorRef Default = CFAllocatorGetDefault(), (v9 = CFBundleCreate(Default, (CFURLRef)[v7 URL])) != 0))
  {
    CFBundleRef v10 = v9;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v11 = (id)TCCAccessCopyInformationForBundle();
    v12 = (void *)[v11 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v12)
    {
      v25 = v10;
      v26 = v6;
      v27 = a4;
      id v28 = v5;
      uint64_t v13 = *(void *)v30;
      v14 = (void *)MEMORY[0x1E4FA9A00];
      v15 = (void *)MEMORY[0x1E4FA9AE0];
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v11);
          }
          v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v18 = [v17 objectForKey:*v14];
          int v19 = [v18 isEqualToString:*v15];

          if (v19)
          {
            v23 = [v17 objectForKey:*MEMORY[0x1E4FA99E8]];
            LOBYTE(v12) = [v23 BOOLValue];

            goto LABEL_14;
          }
        }
        v12 = (void *)[v11 countByEnumeratingWithState:&v29 objects:v35 count:16];
        if (v12) {
          continue;
        }
        break;
      }
LABEL_14:
      a4 = v27;
      id v5 = v28;
      CFBundleRef v10 = v25;
      v6 = v26;
    }

    CFRelease(v10);
    v22 = 0;
  }
  else
  {
    uint64_t v33 = *MEMORY[0x1E4F28568];
    v20 = NSString;
    v21 = [v5 UUIDString];
    v12 = [v20 stringWithFormat:@"Unable to resolve plugin for UUID %@", v21];
    v34 = v12;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];

    v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.extensionKit.errorDomain" code:5 userInfo:v11];
    LOBYTE(v12) = 0;
  }

  if (a4) {
    *a4 = v22;
  }

  return (char)v12;
}

@end