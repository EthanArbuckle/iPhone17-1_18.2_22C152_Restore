@interface NSDictionary(ExtensionKitAdditions)
+ (id)_EX_dictionaryWithSignedURL:()ExtensionKitAdditions error:;
- (id)_EX_arrayForKey:()ExtensionKitAdditions;
- (id)_EX_arrayForKeys:()ExtensionKitAdditions;
- (id)_EX_dictionaryByRemovingObjectForKey:()ExtensionKitAdditions;
- (id)_EX_dictionaryBySettingObject:()ExtensionKitAdditions forKey:;
- (id)_EX_dictionaryBySettingValuesForKeysWithDictionary:()ExtensionKitAdditions;
- (id)_EX_dictionaryForKey:()ExtensionKitAdditions;
- (id)_EX_dictionaryForKeys:()ExtensionKitAdditions;
- (id)_EX_objectForKey:()ExtensionKitAdditions ofClass:;
- (id)_EX_objectForKeys:()ExtensionKitAdditions ofClass:;
- (id)_EX_stringForKey:()ExtensionKitAdditions;
- (id)_EX_stringForKeys:()ExtensionKitAdditions;
- (uint64_t)_EX_BOOLForKey:()ExtensionKitAdditions;
- (uint64_t)_EX_BOOLForKey:()ExtensionKitAdditions defaultValue:;
- (uint64_t)_EX_integerForKey:()ExtensionKitAdditions;
@end

@implementation NSDictionary(ExtensionKitAdditions)

- (id)_EX_dictionaryForKey:()ExtensionKitAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_EX_objectForKey:ofClass:", v4, objc_opt_class());

  return v5;
}

- (id)_EX_stringForKey:()ExtensionKitAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_EX_objectForKey:ofClass:", v4, objc_opt_class());

  return v5;
}

- (uint64_t)_EX_BOOLForKey:()ExtensionKitAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_EX_objectForKey:ofClass:", v4, objc_opt_class());

  uint64_t v6 = [v5 BOOLValue];
  return v6;
}

- (id)_EX_objectForKey:()ExtensionKitAdditions ofClass:
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)_EX_dictionaryBySettingObject:()ExtensionKitAdditions forKey:
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[a1 mutableCopy];
  [v8 setObject:v7 forKey:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = (id)[v8 copy];
  }
  v10 = v9;

  return v10;
}

- (uint64_t)_EX_BOOLForKey:()ExtensionKitAdditions defaultValue:
{
  id v6 = a3;
  id v7 = objc_msgSend(a1, "_EX_objectForKey:ofClass:", v6, objc_opt_class());

  if (v7) {
    a4 = [v7 BOOLValue];
  }

  return a4;
}

- (id)_EX_arrayForKey:()ExtensionKitAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_EX_objectForKey:ofClass:", v4, objc_opt_class());

  return v5;
}

+ (id)_EX_dictionaryWithSignedURL:()ExtensionKitAdditions error:
{
  kern_return_t v72;
  uint64_t v73;
  void *v74;
  uint64_t *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  mach_port_t v79;
  id v80;
  kern_return_t v81;
  int v82;
  void *v83;
  id v84;
  uint64_t v85;
  void *v86;
  io_object_t objecta[2];
  io_object_t object;
  void *v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  CFDictionaryRef information;
  SecStaticCodeRef staticCode;
  io_connect_t connect;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t input[2];
  long long buf;
  void v107[3];

  v107[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _EXAuditTokenForCurrentProcess();
  objc_opt_class();
  id v7 = _EXAuditTokenGetEntitlementValue(v6, @"com.apple.private.amfi.can-check-trust-cache");
  int v8 = [v7 BOOLValue];

  if (!v8)
  {
    v11 = _EXDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_191F29000, v11, OS_LOG_TYPE_DEFAULT, "Unable to check trust cache due to missing entitlement", (uint8_t *)&buf, 2u);
    }
    v18 = 0;
    id v19 = 0;
    goto LABEL_8;
  }
  id v9 = [v5 URLByAppendingPathExtension:@"sig"];
  CFURLRef v10 = (const __CFURL *)v5;
  v11 = v9;
  information = 0;
  staticCode = 0;
  OSStatus v12 = SecStaticCodeCreateWithPath(v10, 0, &staticCode);
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    input[0] = *MEMORY[0x1E4F28568];
    v14 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to create SecStaticCodeRef [%ld]", v12);
    *(void *)&buf = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:input count:1];
    id v16 = [v13 errorWithDomain:@"com.apple.extensionKit.errorDomain" code:12 userInfo:v15];
LABEL_4:
    v17 = 0;
LABEL_26:

    CFDictionaryRef v53 = 0;
    id v54 = 0;
LABEL_27:
    if (staticCode) {
      CFRelease(staticCode);
    }
    v18 = 0;
    goto LABEL_30;
  }
  v93 = 0;
  v17 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v11 options:0 error:&v93];
  id v29 = v93;
  if (!v17)
  {
    v46 = (void *)MEMORY[0x1E4F28C58];
    input[0] = *MEMORY[0x1E4F28568];
    v47 = NSString;
    v14 = [v11 path];
    v15 = [v47 stringWithFormat:@"Unable to read detached signature from %@", v14];
    input[1] = *MEMORY[0x1E4F28A50];
    *(void *)&buf = v15;
    *((void *)&buf + 1) = v29;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:input count:2];
    id v48 = v5;
    v50 = v49 = a4;
    id v16 = [v46 errorWithDomain:@"com.apple.extensionKit.errorDomain" code:12 userInfo:v50];

    a4 = v49;
    id v5 = v48;
    goto LABEL_4;
  }
  int v30 = SecCodeSetDetachedSignature();
  if (v30)
  {
    v31 = (void *)MEMORY[0x1E4F28C58];
    id v32 = v5;
    v33 = a4;
    input[0] = *MEMORY[0x1E4F28568];
    objc_msgSend(NSString, "stringWithFormat:", @"Failed to set detached signature [%ld]", v30);
    v14 = LABEL_25:;
    *(void *)&buf = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:input count:1];
    a4 = v33;
    id v5 = v32;
    id v16 = [v31 errorWithDomain:@"com.apple.extensionKit.errorDomain" code:12 userInfo:v15];

    goto LABEL_26;
  }
  OSStatus v51 = SecStaticCodeCheckValidity(staticCode, 6u, 0);
  if (v51 != -66996 && v51)
  {
    v31 = (void *)MEMORY[0x1E4F28C58];
    id v32 = v5;
    v33 = a4;
    input[0] = *MEMORY[0x1E4F28568];
    objc_msgSend(NSString, "stringWithFormat:", @"Failed to verify code directory [%ld]", v51);
    goto LABEL_25;
  }
  OSStatus v52 = SecCodeCopySigningInformation(staticCode, 0, &information);
  if (v52)
  {
    v31 = (void *)MEMORY[0x1E4F28C58];
    id v32 = v5;
    v33 = a4;
    input[0] = *MEMORY[0x1E4F28568];
    objc_msgSend(NSString, "stringWithFormat:", @"Failed to get code signing information [%ld]", v52);
    goto LABEL_25;
  }
  CFDictionaryRef v53 = information;
  information = 0;
  id v54 = [(__CFDictionary *)v53 objectForKeyedSubscript:*MEMORY[0x1E4F3B9D0]];
  connect = 0;
  mach_port_t v69 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v70 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(v69, v70);
  v90 = a4;
  object = MatchingService;
  if (!MatchingService)
  {
    v76 = (void *)MEMORY[0x1E4F28C58];
    input[0] = *MEMORY[0x1E4F28568];
    *(void *)&buf = @"Unable to find AMFI";
    v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:input count:1];
    v78 = [v76 errorWithDomain:@"com.apple.extensionKit.errorDomain" code:12 userInfo:v77];
LABEL_59:
    v82 = 0;
    goto LABEL_60;
  }
  v72 = IOServiceOpen(MatchingService, *MEMORY[0x1E4F14960], 0, &connect);
  if (v72)
  {
    v86 = (void *)MEMORY[0x1E4F28C58];
    input[0] = *MEMORY[0x1E4F28568];
    v73 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to connect to AMFI [%ld]", v72);
    *(void *)&buf = v73;
    v74 = (void *)MEMORY[0x1E4F1C9E8];
    v75 = input;
LABEL_58:
    v83 = [v74 dictionaryWithObjects:&buf forKeys:v75 count:1];
    v78 = [v86 errorWithDomain:@"com.apple.extensionKit.errorDomain" code:12 userInfo:v83];

    v77 = v73;
    goto LABEL_59;
  }
  input[0] = 1;
  v79 = connect;
  v80 = v54;
  v81 = IOConnectCallMethod(v79, 6u, input, 1u, (const void *)[v80 bytes], objc_msgSend(v80, "length"), 0, 0, 0, 0);
  if (v81 == -536870160)
  {
    v86 = (void *)MEMORY[0x1E4F28C58];
    v107[0] = *MEMORY[0x1E4F28568];
    [NSString stringWithFormat:@"cdhash: %@ is not in trust cache", v80, v85];
    v73 = LABEL_57:;
    *(void *)&buf = v73;
    v74 = (void *)MEMORY[0x1E4F1C9E8];
    v75 = v107;
    goto LABEL_58;
  }
  if (v81)
  {
    v86 = (void *)MEMORY[0x1E4F28C58];
    v107[0] = *MEMORY[0x1E4F28568];
    [NSString stringWithFormat:@"Unknown error (%ld) checking cdhash %@", v81, v80];
    goto LABEL_57;
  }
  v77 = _EXDefaultLog();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v80;
    _os_log_impl(&dword_191F29000, v77, OS_LOG_TYPE_DEFAULT, "cdhash: %@ is trusted", (uint8_t *)&buf, 0xCu);
  }
  v78 = 0;
  v82 = 1;
LABEL_60:

  if (connect) {
    IOServiceClose(connect);
  }
  if (object) {
    IOObjectRelease(object);
  }
  if (v78)
  {
    v84 = v78;
  }
  else
  {
    v84 = v29;
    if ((v82 & 1) == 0) {
      +[NSDictionary(ExtensionKitAdditions) _EX_dictionaryWithSignedURL:error:]();
    }
  }

  id v16 = v84;
  if (!v82)
  {
    a4 = v90;
    goto LABEL_27;
  }
  v18 = staticCode;
  staticCode = 0;
  a4 = v90;
LABEL_30:
  if (information) {
    CFRelease(information);
  }
  if (v16) {
    id v55 = v16;
  }

  id v19 = v16;
  if (!v18)
  {
    if (!a4) {
      +[NSDictionary(ExtensionKitAdditions) _EX_dictionaryWithSignedURL:error:]();
    }
    goto LABEL_38;
  }
  OSStatus v56 = SecCodeMapMemory(v18, 0);
  if (v56)
  {
    v57 = (void *)MEMORY[0x1E4F28C58];
    v103 = *MEMORY[0x1E4F28568];
    v58 = NSString;
    uint64_t v59 = v56;
    v60 = [(__CFURL *)v10 path];
    [v11 path];
    *(void *)objecta = v11;
    id v61 = v5;
    v63 = v62 = a4;
    v64 = [v58 stringWithFormat:@"Unable to push signature to kernel [%ld]: plist: %@ signature: %@", v59, v60, v63];
    v104 = v64;
    v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
    uint64_t v66 = [v57 errorWithDomain:@"com.apple.extensionKit.errorDomain" code:12 userInfo:v65];

    a4 = v62;
    id v5 = v61;
    v11 = *(NSObject **)objecta;

    id v19 = (id)v66;
LABEL_38:

    goto LABEL_39;
  }
LABEL_8:

  v92 = v19;
  v20 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v5 options:8 error:&v92];
  id v21 = v92;

  if (!v20)
  {
    v24 = (void *)MEMORY[0x1E4F28C58];
    v101 = *MEMORY[0x1E4F28568];
    v25 = NSString;
    v26 = [v5 path];
    v27 = [v25 stringWithFormat:@"Unable to read plist at %@", v26];
    v102 = v27;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
    id v19 = [v24 errorWithDomain:@"com.apple.extensionKit.errorDomain" code:12 userInfo:v28];

LABEL_39:
    id v22 = 0;
    v20 = 0;
    v23 = 0;
    goto LABEL_40;
  }
  v91 = 0;
  id v22 = [MEMORY[0x1E4F28F98] propertyListWithData:v20 options:0 format:0 error:&v91];
  id v19 = v91;

  if (v22)
  {
    v89 = a4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v22 = v22;
      v23 = v22;
    }
    else
    {
      v40 = (void *)MEMORY[0x1E4F28C58];
      v97 = *MEMORY[0x1E4F28568];
      v41 = NSString;
      v42 = [v5 path];
      v43 = [v41 stringWithFormat:@"Extension cache at path [%@] not a dictionary: %@", v42, v22];
      v98 = v43;
      v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
      uint64_t v45 = [v40 errorWithDomain:@"com.apple.extensionKit.errorDomain" code:12 userInfo:v44];

      v23 = 0;
      id v19 = (id)v45;
    }
    a4 = v89;
  }
  else
  {
    v34 = (void *)MEMORY[0x1E4F28C58];
    v99 = *MEMORY[0x1E4F28568];
    v35 = NSString;
    v36 = [v5 path];
    v37 = [v35 stringWithFormat:@"Unable to deserialize %@", v36];
    v100 = v37;
    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
    uint64_t v39 = [v34 errorWithDomain:@"com.apple.extensionKit.errorDomain" code:12 userInfo:v38];

    id v22 = 0;
    v23 = 0;
    id v19 = (id)v39;
  }
LABEL_40:
  if (v18) {
    CFRelease(v18);
  }
  if (a4 && v19) {
    *a4 = v19;
  }
  id v67 = v23;

  return v67;
}

- (id)_EX_objectForKeys:()ExtensionKitAdditions ofClass:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = objc_msgSend(a1, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v8), (void)v11);
      if (objc_opt_isKindOfClass()) {
        break;
      }

      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v9 = 0;
  }

  return v9;
}

- (id)_EX_dictionaryForKeys:()ExtensionKitAdditions
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "_EX_objectForKeys:ofClass:", v4, objc_opt_class());

  return v5;
}

- (id)_EX_arrayForKeys:()ExtensionKitAdditions
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "_EX_objectForKeys:ofClass:", v4, objc_opt_class());

  return v5;
}

- (id)_EX_stringForKeys:()ExtensionKitAdditions
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "_EX_objectForKeys:ofClass:", v4, objc_opt_class());

  return v5;
}

- (uint64_t)_EX_integerForKey:()ExtensionKitAdditions
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "_EX_objectForKey:ofClass:", v4, objc_opt_class());

  uint64_t v6 = [v5 integerValue];
  return v6;
}

- (id)_EX_dictionaryByRemovingObjectForKey:()ExtensionKitAdditions
{
  id v4 = a3;
  uint64_t v5 = (void *)[a1 mutableCopy];
  [v5 removeObjectForKey:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = (id)[v5 copy];
  }
  uint64_t v7 = v6;

  return v7;
}

- (id)_EX_dictionaryBySettingValuesForKeysWithDictionary:()ExtensionKitAdditions
{
  id v4 = a3;
  uint64_t v5 = (void *)[a1 mutableCopy];
  [v5 setValuesForKeysWithDictionary:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = (id)[v5 copy];
  }
  uint64_t v7 = v6;

  return v7;
}

+ (void)_EX_dictionaryWithSignedURL:()ExtensionKitAdditions error:.cold.1()
{
}

@end