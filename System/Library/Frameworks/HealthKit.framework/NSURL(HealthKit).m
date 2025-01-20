@interface NSURL(HealthKit)
+ (id)hk_safeURLWithString:()HealthKit;
+ (id)hk_tapToRadarURLForBundleID:()HealthKit component:title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:collaborationContactHandles:diagnosticExtensionOptions:;
+ (uint64_t)hk_tapToHealthRadarURLForComponent:()HealthKit title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:;
+ (uint64_t)hk_tapToHealthRadarURLForComponent:()HealthKit title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:collaborationContactHandles:;
+ (uint64_t)hk_tapToHealthRadarURLWithTitle:()HealthKit description:classification:reproducibility:keywords:autoDiagnostics:attachments:;
+ (uint64_t)hk_tapToRadarURLForBundleID:()HealthKit component:title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:;
+ (uint64_t)hk_tapToRadarURLForBundleID:()HealthKit component:title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:collaborationContactHandles:;
- (id)hk_fileSizeWithError:()HealthKit;
- (id)hk_valueForFirstInstanceOfParameterNamed:()HealthKit;
- (uint64_t)hk_isRewrittenEUDigitalCOVIDCertificateQRCodeURL;
- (uint64_t)hk_isRewrittenHealthCardQRCodeURL;
- (uint64_t)hk_isValidSafariViewControllerURL;
@end

@implementation NSURL(HealthKit)

- (id)hk_valueForFirstInstanceOfParameterNamed:()HealthKit
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:1];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = objc_msgSend(v5, "queryItems", 0);
  v7 = (void *)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 name];
        char v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          v7 = [v10 value];
          goto LABEL_11;
        }
      }
      v7 = (void *)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (uint64_t)hk_isValidSafariViewControllerURL
{
  v1 = [a1 scheme];
  v2 = [v1 lowercaseString];
  uint64_t v3 = [v2 hasPrefix:@"http"];

  return v3;
}

- (uint64_t)hk_isRewrittenHealthCardQRCodeURL
{
  uint64_t v3 = [a1 pathComponents];
  id v4 = [a1 scheme];
  if (![v4 caseInsensitiveCompare:@"https"])
  {
    v6 = [a1 host];
    if ([v6 caseInsensitiveCompare:@"redirect.health.apple.com"])
    {
LABEL_4:
      uint64_t v5 = 0;
LABEL_5:

      goto LABEL_6;
    }
    unint64_t v8 = [v3 count];
    if (v8 > 2) {
      goto LABEL_10;
    }
    if ([v3 count] != 2) {
      goto LABEL_4;
    }
    v1 = [a1 fragment];
    if (v1)
    {
LABEL_10:
      v9 = [v3 objectAtIndexedSubscript:1];
      uint64_t v5 = [v9 isEqualToString:@"SMARTHealthCard"];

      if (v8 > 2) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }

    goto LABEL_5;
  }
  uint64_t v5 = 0;
LABEL_6:

  return v5;
}

- (uint64_t)hk_isRewrittenEUDigitalCOVIDCertificateQRCodeURL
{
  v2 = [a1 pathComponents];
  uint64_t v3 = [a1 scheme];
  if ([v3 caseInsensitiveCompare:@"https"])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = [a1 host];
    if ([v5 caseInsensitiveCompare:@"redirect.health.apple.com"]
      || [v2 count] != 2)
    {
      uint64_t v4 = 0;
    }
    else
    {
      v6 = [a1 fragment];
      if (v6)
      {
        v7 = [v2 objectAtIndexedSubscript:1];
        uint64_t v4 = [v7 isEqualToString:@"EU-DCC"];
      }
      else
      {
        uint64_t v4 = 0;
      }
    }
  }

  return v4;
}

- (id)hk_fileSizeWithError:()HealthKit
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (([a1 isFileURL] & 1) == 0)
  {
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"NSURL+HealthKit.m", 158, @"Invalid parameter not satisfying: %@", @"self.isFileURL" object file lineNumber description];
  }
  memset(&v18, 0, sizeof(v18));
  id v6 = a1;
  if (stat((const char *)[v6 fileSystemRepresentation], &v18))
  {
    v7 = __error();
    unint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    if (*v7 == 2)
    {
      uint64_t v9 = *MEMORY[0x1E4F281F8];
      uint64_t v19 = *MEMORY[0x1E4F289D0];
      v20[0] = v6;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      id v11 = [v8 errorWithDomain:v9 code:4 userInfo:v10];
      char v12 = v11;
      if (v11)
      {
        if (a3) {
          *a3 = v11;
        }
        else {
          _HKLogDroppedError(v11);
        }
      }
    }
    else
    {
      long long v14 = __error();
      long long v15 = strerror(*v14);
      objc_msgSend(v8, "hk_assignError:code:format:", a3, 102, @"Failed to retrieve size for file at '%@': %s", v6, v15, *(void *)&v18.st_dev, v18.st_ino, *(void *)&v18.st_uid, *(void *)&v18.st_rdev, v18.st_atimespec.tv_sec, v18.st_atimespec.tv_nsec, v18.st_mtimespec.tv_sec, v18.st_mtimespec.tv_nsec, v18.st_ctimespec.tv_sec, v18.st_ctimespec.tv_nsec, v18.st_birthtimespec.tv_sec, v18.st_birthtimespec.tv_nsec);
    }
    v13 = 0;
  }
  else
  {
    v13 = [NSNumber numberWithLongLong:v18.st_size];
  }

  return v13;
}

+ (id)hk_safeURLWithString:()HealthKit
{
  if (a3)
  {
    uint64_t v4 = objc_msgSend(a1, "URLWithString:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

+ (uint64_t)hk_tapToHealthRadarURLWithTitle:()HealthKit description:classification:reproducibility:keywords:autoDiagnostics:attachments:
{
  return objc_msgSend(MEMORY[0x1E4F1CB10], "hk_tapToRadarURLForBundleID:component:title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:", @"com.apple.Health", 0, a3, a4, a5, a6, a7, a8, a9);
}

+ (uint64_t)hk_tapToHealthRadarURLForComponent:()HealthKit title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:
{
  return objc_msgSend(MEMORY[0x1E4F1CB10], "hk_tapToRadarURLForBundleID:component:title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:", 0, a3, a4, a5, a6, a7, a8, a9, a10);
}

+ (uint64_t)hk_tapToHealthRadarURLForComponent:()HealthKit title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:collaborationContactHandles:
{
  return objc_msgSend(MEMORY[0x1E4F1CB10], "hk_tapToRadarURLForBundleID:component:title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:collaborationContactHandles:", 0, a3, a4, a5, a6, a7, a8, a9, a10);
}

+ (uint64_t)hk_tapToRadarURLForBundleID:()HealthKit component:title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:
{
  return objc_msgSend(MEMORY[0x1E4F1CB10], "hk_tapToRadarURLForBundleID:component:title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:collaborationContactHandles:", a9, a10, 0);
}

+ (uint64_t)hk_tapToRadarURLForBundleID:()HealthKit component:title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:collaborationContactHandles:
{
  return objc_msgSend(MEMORY[0x1E4F1CB10], "hk_tapToRadarURLForBundleID:component:title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:collaborationContactHandles:diagnosticExtensionOptions:", a9, a10, a11, 0);
}

+ (id)hk_tapToRadarURLForBundleID:()HealthKit component:title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:collaborationContactHandles:diagnosticExtensionOptions:
{
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a9;
  id v63 = a11;
  id v64 = a12;
  if ((v18 || !a4) && (!v18 || a4))
  {
    v59 = [MEMORY[0x1E4F28B00] currentHandler];
    [v59 handleFailureInMethod:a2, a1, @"NSURL+HealthKit.m", 302, @"Invalid parameter not satisfying: %@", @"(bundleID == nil && componentID > 0) || (bundleID != nil && componentID == 0)" object file lineNumber description];
  }
  v22 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  v23 = (void *)[v22 mutableCopy];

  [v23 removeCharactersInString:@"=,&"];
  v24 = [MEMORY[0x1E4F28E78] stringWithFormat:@"tap-to-radar://new"];
  if (v18)
  {
    v25 = +[_HKBehavior sharedBehavior];
    int v26 = [v25 isiPad];

    if (v26)
    {
      v27 = [&unk_1EECE3D88 stringValue];
      v28 = [v27 stringByAddingPercentEncodingWithAllowedCharacters:v23];
      [v24 appendFormat:@"?ComponentID=%@", v28];

      v29 = [@"Health App" stringByAddingPercentEncodingWithAllowedCharacters:v23];
      [v24 appendFormat:@"&ComponentName=%@", v29];

      v30 = [@"Stanley LiveOn" stringByAddingPercentEncodingWithAllowedCharacters:v23];
      [v24 appendFormat:@"&ComponentVersion=%@", v30];
    }
    else
    {
      v30 = [v18 stringByAddingPercentEncodingWithAllowedCharacters:v23];
      [v24 appendFormat:@"?BundleID=%@", v30];
    }
  }
  if (a4)
  {
    id v60 = v18;
    if (a4 > 1330751)
    {
      if (a4 > 1568146)
      {
        if (a4 > 1633563)
        {
          if (a4 == 1633564)
          {
            id v31 = v20;
            id v32 = v19;
            v33 = @"Data";
          }
          else
          {
            if (a4 != 1634542) {
              goto LABEL_52;
            }
            id v31 = v20;
            id v32 = v19;
            v33 = @"All Bugs";
          }
          v34 = @"Lavender Live On";
          goto LABEL_51;
        }
        if (a4 != 1568147)
        {
          if (a4 != 1609569) {
            goto LABEL_52;
          }
          id v31 = v20;
          id v32 = v19;
          v33 = @"Stanley LiveOn";
          goto LABEL_48;
        }
        id v31 = v20;
        id v32 = v19;
        v33 = @"All";
        v34 = @"Health Yodel Test";
      }
      else
      {
        if (a4 > 1397973)
        {
          if (a4 != 1397974)
          {
            if (a4 != 1495802) {
              goto LABEL_52;
            }
            id v31 = v20;
            id v32 = v19;
            v33 = @"LiveOn";
            v34 = @"Health Chamomile";
            goto LABEL_51;
          }
          id v31 = v20;
          id v32 = v19;
          v33 = @"iOS";
        }
        else
        {
          if (a4 != 1330752)
          {
            if (a4 != 1332846) {
              goto LABEL_52;
            }
            id v31 = v20;
            id v32 = v19;
            v33 = @"Stanley";
LABEL_48:
            v34 = @"Health App";
            goto LABEL_51;
          }
          id v31 = v20;
          id v32 = v19;
          v33 = @"Secure Dropbox";
        }
        v34 = @"Health Medications";
      }
LABEL_51:
      v35 = [NSNumber numberWithUnsignedInteger:a4];
      v36 = [v35 stringValue];
      v37 = [v36 stringByAddingPercentEncodingWithAllowedCharacters:v23];
      [v24 appendFormat:@"?ComponentID=%@", v37];

      v38 = [(__CFString *)v34 stringByAddingPercentEncodingWithAllowedCharacters:v23];
      [v24 appendFormat:@"&ComponentName=%@", v38];

      v39 = [(__CFString *)v33 stringByAddingPercentEncodingWithAllowedCharacters:v23];
      [v24 appendFormat:@"&ComponentVersion=%@", v39];

      id v19 = v32;
      id v20 = v31;
      id v18 = v60;
      goto LABEL_52;
    }
    if (a4 <= 1076586)
    {
      if (a4 != 616513)
      {
        if (a4 == 748570)
        {
          id v31 = v20;
          id v32 = v19;
          v33 = @"Restricted";
          v34 = @"Health";
        }
        else
        {
          if (a4 != 938492) {
            goto LABEL_52;
          }
          id v31 = v20;
          id v32 = v19;
          v33 = @"Dropbox";
          v34 = @"Health Medical Records";
        }
        goto LABEL_51;
      }
      id v31 = v20;
      id v32 = v19;
      v33 = @"All";
    }
    else
    {
      if (a4 > 1259111)
      {
        if (a4 != 1259112)
        {
          if (a4 != 1318138) {
            goto LABEL_52;
          }
          id v31 = v20;
          id v32 = v19;
          v33 = @"All";
          v34 = @"Health Cardio Recovery";
          goto LABEL_51;
        }
        id v31 = v20;
        id v32 = v19;
        v33 = @"Sharing";
        goto LABEL_48;
      }
      if (a4 == 1076587)
      {
        id v31 = v20;
        id v32 = v19;
        v33 = @"All";
        v34 = @"Health Sleep";
        goto LABEL_51;
      }
      if (a4 != 1109271) {
        goto LABEL_52;
      }
      id v31 = v20;
      id v32 = v19;
      v33 = @"watchOS";
    }
    v34 = @"Health Medical ID";
    goto LABEL_51;
  }
LABEL_52:
  v40 = [v19 stringByAddingPercentEncodingWithAllowedCharacters:v23];
  [v24 appendFormat:@"&Title=%@", v40];

  if (v20)
  {
    v41 = [v20 stringByAddingPercentEncodingWithAllowedCharacters:v23];
    [v24 appendFormat:@"&Description=%@", v41];
  }
  if ((unint64_t)(a7 - 1) <= 9)
  {
    v42 = [(__CFString *)*(&off_1E58C1098 + a7 - 1) stringByAddingPercentEncodingWithAllowedCharacters:v23];
    [v24 appendFormat:@"&Classification=%@", v42];
  }
  if ((unint64_t)(a8 - 1) <= 5)
  {
    v43 = [(__CFString *)*(&off_1E58C10E8 + a8 - 1) stringByAddingPercentEncodingWithAllowedCharacters:v23];
    [v24 appendFormat:@"&Reproducibility=%@", v43];
  }
  if (v21 && [v21 count])
  {
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __199__NSURL_HealthKit__hk_tapToRadarURLForBundleID_component_title_description_classification_reproducibility_keywords_autoDiagnostics_attachments_collaborationContactHandles_diagnosticExtensionOptions___block_invoke;
    v65[3] = &unk_1E58BEC00;
    id v66 = v23;
    v44 = objc_msgSend(v21, "hk_map:", v65);
    v45 = [v44 componentsJoinedByString:@","];
    [v24 appendFormat:@"&Keywords=%@", v45];
  }
  if ((unint64_t)(a10 - 1) > 2) {
    v46 = @"-1";
  }
  else {
    v46 = *(&off_1E58C1118 + a10 - 1);
  }
  v47 = [(__CFString *)v46 stringByAddingPercentEncodingWithAllowedCharacters:v23];
  [v24 appendFormat:@"&AutoDiagnostics=%@", v47];

  id v48 = v63;
  v49 = v48;
  v50 = v48;
  if (!v48) {
    goto LABEL_68;
  }
  v50 = v48;
  if (![v48 count]) {
    goto LABEL_68;
  }
  v50 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1EEC60288];
  objc_msgSend(v50, "hk_appendComponentsJoinedByString:container:componentGenerator:", @",", v49, &__block_literal_global_39);

  if (v50)
  {
    v51 = [v50 stringByAddingPercentEncodingWithAllowedCharacters:v23];
    [v24 appendFormat:@"&Attachments=%@", v51];

LABEL_68:
  }
  id v52 = v64;
  v53 = v52;
  v54 = v52;
  if (v52)
  {
    v54 = v52;
    if ([v52 count])
    {
      v54 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1EEC60288];
      objc_msgSend(v54, "hk_appendComponentsJoinedByString:container:componentGenerator:", @",", v53, &__block_literal_global_243);

      if (!v54) {
        goto LABEL_74;
      }
      v55 = [v54 stringByAddingPercentEncodingWithAllowedCharacters:v23];
      [v24 appendFormat:@"&CollaborationContactHandles=%@", v55];
    }
  }

LABEL_74:
  if (a13)
  {
    v56 = [@"com.apple.HealthKit.HealthDiagnosticExtension" stringByAddingPercentEncodingWithAllowedCharacters:v23];
    [v24 appendFormat:@"&ExtensionIdentifiers=%@", v56];
  }
  v57 = [MEMORY[0x1E4F1CB10] URLWithString:v24];

  return v57;
}

@end