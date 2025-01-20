@interface RepairInputs
- (BOOL)allowSelfService;
- (BOOL)allowUsedPart;
- (BOOL)doSeal;
- (BOOL)enableProxy;
- (BOOL)enableStagedSeal;
- (BOOL)ignoreStagedData;
- (BOOL)skipStageEAN;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateUpdateProperties:(id)a3;
- (NSArray)patchItems;
- (NSDictionary)updateProperties;
- (NSMutableSet)partSPC;
- (NSNumber)SOCKSPort;
- (NSNumber)displayMaxDuration;
- (NSNumber)timeoutPeriod;
- (NSString)FDRCAURL;
- (NSString)FDRDSURL;
- (NSString)FDRSealingURL;
- (NSString)KBBSerialNumber;
- (NSString)KGBSerialNumber;
- (NSString)SOCKSHost;
- (NSString)keyBlob;
- (NSString)mountPath;
- (NSString)trustObjectURL;
@end

@implementation RepairInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v5 = a3;
  char v110 = 0;
  v6 = [v5 NSStringFromKey:@"CAURL" defaultValue:@"https://gg.apple.com" failed:&v110];
  FDRCAURL = self->FDRCAURL;
  self->FDRCAURL = v6;

  v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->FDRCAURL;
    *(_DWORD *)buf = 138412290;
    v112 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FDR CA URL: %@", buf, 0xCu);
  }

  v10 = +[NSURL URLWithString:self->FDRCAURL];
  v11 = v10;
  if (v10)
  {
    v12 = [v10 scheme];
    id v13 = [v12 caseInsensitiveCompare:@"http"];
    if (v13
      || ([v11 scheme],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v3 caseInsensitiveCompare:@"https"]))
    {
      v14 = [v11 host];

      if (!v13) {
      if (v14)
      }
        goto LABEL_14;
    }
    else
    {
    }
  }
  v15 = handleForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_100005EEC();
  }

  char v110 = 1;
LABEL_14:
  v16 = [v5 NSStringFromKey:@"TrustObjectURL" defaultValue:@"http://gg.apple.com/fdrtrustobject" failed:&v110];
  trustObjectURL = self->trustObjectURL;
  self->trustObjectURL = v16;

  v18 = handleForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = self->trustObjectURL;
    *(_DWORD *)buf = 138412290;
    v112 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "FDR Trust Object URL: %@", buf, 0xCu);
  }

  v20 = +[NSURL URLWithString:self->trustObjectURL];

  if (!v20) {
    goto LABEL_20;
  }
  v21 = [v20 scheme];
  if ([v21 caseInsensitiveCompare:@"http"])
  {

    goto LABEL_23;
  }
  v22 = [v20 scheme];
  id v23 = [v22 caseInsensitiveCompare:@"https"];

  if (!v23)
  {
LABEL_20:
    v24 = handleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100005EB8();
    }

    char v110 = 1;
  }
LABEL_23:
  v25 = [v5 NSStringFromKey:@"DSURL" defaultValue:@"https://skl.apple.com" failed:&v110];
  FDRDSURL = self->FDRDSURL;
  self->FDRDSURL = v25;

  v27 = handleForCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = self->FDRDSURL;
    *(_DWORD *)buf = 138412290;
    v112 = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "FDR DS URL: %@", buf, 0xCu);
  }

  v29 = +[NSURL URLWithString:self->FDRDSURL];

  if (!v29) {
    goto LABEL_29;
  }
  v30 = [v29 scheme];
  if (![v30 caseInsensitiveCompare:@"http"])
  {
    v31 = [v29 scheme];
    id v32 = [v31 caseInsensitiveCompare:@"https"];

    if (v32) {
      goto LABEL_32;
    }
LABEL_29:
    v33 = handleForCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_100005E84();
    }

    char v110 = 1;
    goto LABEL_32;
  }

LABEL_32:
  v34 = [v5 NSStringFromKey:@"SealingURL" defaultValue:@"https://ig.apple.com" failed:&v110];
  FDRSealingURL = self->FDRSealingURL;
  self->FDRSealingURL = v34;

  v36 = handleForCategory();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = self->FDRSealingURL;
    *(_DWORD *)buf = 138412290;
    v112 = v37;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "FDR Sealing URL: %@", buf, 0xCu);
  }

  v38 = +[NSURL URLWithString:self->FDRSealingURL];

  if (!v38) {
    goto LABEL_38;
  }
  v39 = [v38 scheme];
  if ([v39 caseInsensitiveCompare:@"http"])
  {

    goto LABEL_41;
  }
  v40 = [v38 scheme];
  id v41 = [v40 caseInsensitiveCompare:@"https"];

  if (!v41)
  {
LABEL_38:
    v42 = handleForCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_100005E50();
    }

    char v110 = 1;
  }
LABEL_41:
  v43 = [v5 NSStringFromRequiredKey:@"partSPC" maxLength:128 failed:&v110];
  v44 = handleForCategory();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v112 = v43;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "partSPC is %@", buf, 0xCu);
  }

  if ((unint64_t)[v43 length] <= 2)
  {
    v45 = handleForCategory();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_100005DCC(v43, v45);
    }

    char v110 = 1;
  }
  v46 = +[NSMutableCharacterSet characterSetWithCharactersInString:@","];
  v47 = [v43 stringByTrimmingCharactersInSet:v46];
  v48 = [v47 componentsSeparatedByString:@","];
  v49 = +[NSMutableSet setWithArray:v48];
  partSPC = self->partSPC;
  self->partSPC = v49;

  if (![(NSMutableSet *)self->partSPC count])
  {
    v51 = handleForCategory();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      sub_100005D44((id *)&self->partSPC, v51);
    }

    char v110 = 1;
  }
  self->doSeal = [v5 BOOLFromKey:@"doSeal" defaultValue:1 failed:&v110];
  v52 = handleForCategory();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    if (self->doSeal) {
      CFStringRef v53 = @"YES";
    }
    else {
      CFStringRef v53 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v112 = (void *)v53;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Do seal: %@", buf, 0xCu);
  }

  self->enableProxy = [v5 BOOLFromKey:@"enableProxy" defaultValue:0 failed:&v110];
  v54 = handleForCategory();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    if (self->enableProxy) {
      CFStringRef v55 = @"YES";
    }
    else {
      CFStringRef v55 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v112 = (void *)v55;
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Enable Proxy : %@", buf, 0xCu);
  }

  v56 = [v5 NSNumberFromKey:@"timeoutPeriod" lowerBound:&off_100008930 upperBound:&off_100008948 defaultValue:&off_100008960 failed:&v110];
  timeoutPeriod = self->timeoutPeriod;
  self->timeoutPeriod = v56;

  v58 = handleForCategory();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    v59 = self->timeoutPeriod;
    *(_DWORD *)buf = 138412290;
    v112 = v59;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Timeout period : %@ s", buf, 0xCu);
  }

  v60 = objc_opt_new();
  v61 = [v5 NSDictionaryFromKey:@"updateProperties" defaultValue:v60 failed:&v110];
  updateProperties = self->updateProperties;
  self->updateProperties = v61;

  v63 = handleForCategory();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    v64 = self->updateProperties;
    *(_DWORD *)buf = 138412290;
    v112 = v64;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "UpdateProperties:%@", buf, 0xCu);
  }

  if (![(RepairInputs *)self validateUpdateProperties:self->updateProperties])
  {
    v65 = handleForCategory();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
      sub_100005D10();
    }

    char v110 = 1;
  }
  v66 = [v5 NSStringFromKey:@"KBBSerialNumber" defaultValue:0 failed:0];
  KBBSerialNumber = self->KBBSerialNumber;
  self->KBBSerialNumber = v66;

  v68 = handleForCategory();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    v69 = self->KBBSerialNumber;
    *(_DWORD *)buf = 138412290;
    v112 = v69;
    _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "KBBSerialNumber is %@", buf, 0xCu);
  }

  v70 = [v5 NSStringFromKey:@"KGBSerialNumber" defaultValue:0 failed:0];
  KGBSerialNumber = self->KGBSerialNumber;
  self->KGBSerialNumber = v70;

  v72 = handleForCategory();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    v73 = self->KGBSerialNumber;
    *(_DWORD *)buf = 138412290;
    v112 = v73;
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "KGBSerialNumber is %@", buf, 0xCu);
  }

  v74 = [v5 NSStringFromKey:@"MountPath" defaultValue:0 failed:0];
  mountPath = self->mountPath;
  self->mountPath = v74;

  v76 = handleForCategory();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
  {
    v77 = self->mountPath;
    *(_DWORD *)buf = 138412290;
    v112 = v77;
    _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "PDI mountPath is %@", buf, 0xCu);
  }

  v78 = [v5 NSNumberFromKey:@"displayMaxDuration" lowerBound:&off_100008978 upperBound:&off_100008990 defaultValue:&off_1000089A8 failed:&v110];
  displayMaxDuration = self->displayMaxDuration;
  self->displayMaxDuration = v78;

  v80 = handleForCategory();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
  {
    v81 = self->displayMaxDuration;
    *(_DWORD *)buf = 138412290;
    v112 = v81;
    _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "Display max duration : %@ days", buf, 0xCu);
  }

  v82 = +[NSSet setWithObject:objc_opt_class()];
  v83 = [v5 NSArrayFromKey:@"patchItems" types:v82 maxLength:32 defaultValue:0 failed:&v110];
  patchItems = self->patchItems;
  self->patchItems = v83;

  v85 = handleForCategory();
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
  {
    v86 = self->patchItems;
    *(_DWORD *)buf = 138412290;
    v112 = v86;
    _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "patchItems is %@", buf, 0xCu);
  }

  v87 = [v5 NSStringFromKey:@"SOCKSHost" defaultValue:0 failed:&v110];
  SOCKSHost = self->SOCKSHost;
  self->SOCKSHost = v87;

  v89 = [v5 NSNumberFromKey:@"SOCKSPort" lowerBound:&off_1000089C0 upperBound:&off_1000089D8 defaultValue:0 failed:&v110];
  SOCKSPort = self->SOCKSPort;
  self->SOCKSPort = v89;

  v91 = handleForCategory();
  if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
  {
    v92 = self->SOCKSHost;
    v93 = self->SOCKSPort;
    *(_DWORD *)buf = 138412546;
    v112 = v92;
    __int16 v113 = 2112;
    v114 = v93;
    _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "SOCKS Host: %@, SOCKS Port: %@", buf, 0x16u);
  }

  self->enableStagedSeal = [v5 BOOLFromKey:@"enableStagedSeal" defaultValue:0 failed:0];
  v94 = handleForCategory();
  if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
  {
    if (self->enableStagedSeal) {
      CFStringRef v95 = @"YES";
    }
    else {
      CFStringRef v95 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v112 = (void *)v95;
    _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "enableStagedSeal is %@", buf, 0xCu);
  }

  self->ignoreStagedData = [v5 BOOLFromKey:@"ignoreStagedData" defaultValue:0 failed:0];
  v96 = handleForCategory();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
  {
    if (self->ignoreStagedData) {
      CFStringRef v97 = @"YES";
    }
    else {
      CFStringRef v97 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v112 = (void *)v97;
    _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "ignoreStagedData is %@", buf, 0xCu);
  }

  self->skipStageEAN = [v5 BOOLFromKey:@"skipStageEAN" defaultValue:0 failed:0];
  v98 = handleForCategory();
  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
  {
    if (self->skipStageEAN) {
      CFStringRef v99 = @"YES";
    }
    else {
      CFStringRef v99 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v112 = (void *)v99;
    _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "skipStageEAN is %@", buf, 0xCu);
  }

  v100 = [v5 NSStringFromKey:@"keyBlob" defaultValue:0 failed:0];
  keyBlob = self->keyBlob;
  self->keyBlob = v100;

  v102 = handleForCategory();
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
  {
    v103 = self->keyBlob;
    *(_DWORD *)buf = 138412290;
    v112 = v103;
    _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "keyBlob: %@", buf, 0xCu);
  }

  self->allowSelfService = [v5 BOOLFromKey:@"allowSelfService" defaultValue:0 failed:0];
  v104 = handleForCategory();
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
  {
    if (self->allowSelfService) {
      CFStringRef v105 = @"YES";
    }
    else {
      CFStringRef v105 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v112 = (void *)v105;
    _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "allowSelfService: %@", buf, 0xCu);
  }

  self->allowUsedPart = [v5 BOOLFromKey:@"allowUsedPart" defaultValue:0 failed:0];
  v106 = handleForCategory();
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
  {
    if (self->allowUsedPart) {
      CFStringRef v107 = @"YES";
    }
    else {
      CFStringRef v107 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v112 = (void *)v107;
    _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "allowUsedPart: %@", buf, 0xCu);
  }

  BOOL v108 = v110 == 0;
  return v108;
}

- (BOOL)validateUpdateProperties:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"PrCL"];

    if (v5)
    {
      v6 = [v4 objectForKeyedSubscript:@"PrCL"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v8 = [v4 objectForKeyedSubscript:@"PrCL"];
        id v9 = [objc_alloc((Class)NSRegularExpression) initWithPattern:@"^[a-fA-F0-9]{512}+$" options:0 error:0];
        v10 = [v9 firstMatchInString:v8 options:0 range:[v8 length]];
        v11 = handleForCategory();
        v12 = v11;
        if (v10)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 138412290;
            v19 = v8;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "matched property:%@", (uint8_t *)&v18, 0xCu);
          }

          BOOL v13 = 1;
          goto LABEL_15;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100005F20((uint64_t)v8, v12, v16);
        }
      }
      else
      {
        v8 = handleForCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_100005F90(v8, v14, v15);
        }
      }
      BOOL v13 = 0;
LABEL_15:

      goto LABEL_16;
    }
  }
  BOOL v13 = 1;
LABEL_16:

  return v13;
}

- (NSString)FDRCAURL
{
  return self->FDRCAURL;
}

- (NSString)trustObjectURL
{
  return self->trustObjectURL;
}

- (NSString)FDRDSURL
{
  return self->FDRDSURL;
}

- (NSString)FDRSealingURL
{
  return self->FDRSealingURL;
}

- (NSString)KGBSerialNumber
{
  return self->KGBSerialNumber;
}

- (NSString)KBBSerialNumber
{
  return self->KBBSerialNumber;
}

- (NSArray)patchItems
{
  return self->patchItems;
}

- (NSString)SOCKSHost
{
  return self->SOCKSHost;
}

- (NSNumber)SOCKSPort
{
  return self->SOCKSPort;
}

- (NSMutableSet)partSPC
{
  return self->partSPC;
}

- (NSDictionary)updateProperties
{
  return self->updateProperties;
}

- (BOOL)doSeal
{
  return self->doSeal;
}

- (NSString)mountPath
{
  return self->mountPath;
}

- (NSNumber)timeoutPeriod
{
  return self->timeoutPeriod;
}

- (BOOL)enableProxy
{
  return self->enableProxy;
}

- (NSNumber)displayMaxDuration
{
  return self->displayMaxDuration;
}

- (BOOL)enableStagedSeal
{
  return self->enableStagedSeal;
}

- (BOOL)ignoreStagedData
{
  return self->ignoreStagedData;
}

- (BOOL)skipStageEAN
{
  return self->skipStageEAN;
}

- (NSString)keyBlob
{
  return self->keyBlob;
}

- (BOOL)allowSelfService
{
  return self->allowSelfService;
}

- (BOOL)allowUsedPart
{
  return self->allowUsedPart;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->keyBlob, 0);
  objc_storeStrong((id *)&self->displayMaxDuration, 0);
  objc_storeStrong((id *)&self->timeoutPeriod, 0);
  objc_storeStrong((id *)&self->mountPath, 0);
  objc_storeStrong((id *)&self->updateProperties, 0);
  objc_storeStrong((id *)&self->partSPC, 0);
  objc_storeStrong((id *)&self->SOCKSPort, 0);
  objc_storeStrong((id *)&self->SOCKSHost, 0);
  objc_storeStrong((id *)&self->patchItems, 0);
  objc_storeStrong((id *)&self->KBBSerialNumber, 0);
  objc_storeStrong((id *)&self->KGBSerialNumber, 0);
  objc_storeStrong((id *)&self->FDRSealingURL, 0);
  objc_storeStrong((id *)&self->FDRDSURL, 0);
  objc_storeStrong((id *)&self->trustObjectURL, 0);

  objc_storeStrong((id *)&self->FDRCAURL, 0);
}

@end