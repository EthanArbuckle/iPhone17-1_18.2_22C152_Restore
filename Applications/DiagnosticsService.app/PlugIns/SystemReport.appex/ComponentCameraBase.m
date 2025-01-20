@interface ComponentCameraBase
- (BOOL)isPresent;
- (id)IORegClassName;
- (id)biometricKitFdrValidationStatus;
- (id)illuminatorSerialNumber;
- (id)illuminatorSerialNumberComponentPropertyKey;
- (id)ioRegFdrValidationStatus;
- (id)retrieveDataSerialNumberWithComponentName:(id)a3;
- (id)retrieveSerialNumberWithComponentName:(id)a3;
- (id)serialNumber;
- (id)serialNumberComponentPropertyKey;
- (id)zhuGeFDRLabelForCategory:(id)a3;
- (id)zhuGeFDRStatus:(id)a3;
- (int64_t)cameraModuleType;
- (void)populateAttributes:(id)a3;
- (void)populateFdrValidationStatus:(id)a3;
@end

@implementation ComponentCameraBase

- (void)populateAttributes:(id)a3
{
  id v13 = a3;
  v4 = [(ComponentCameraBase *)self serialNumber];
  v5 = stringOrNull(v4);
  [v13 setObject:v5 forKeyedSubscript:@"serialNumber"];

  [(ComponentCameraBase *)self populateFdrValidationStatus:v13];
  v6 = [(ComponentCameraBase *)self illuminatorSerialNumber];
  v7 = stringOrNull(v6);

  v8 = +[NSNull null];
  unsigned __int8 v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    [v13 setObject:v7 forKeyedSubscript:@"illuminatorSerialNumber"];
    v10 = [(ComponentCameraBase *)self zhuGeFDRStatus:v7];
    if ([v10 count] == (id)2)
    {
      v11 = [v10 objectAtIndexedSubscript:0];
      [v13 setObject:v11 forKeyedSubscript:@"illuminatorFdrValidationStatus"];

      v12 = [v10 objectAtIndexedSubscript:1];
      [v13 setObject:v12 forKeyedSubscript:@"zhuGeIlluminatorValidationStatus"];
    }
  }
}

- (id)IORegClassName
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [&off_1000B6E68 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(&off_1000B6E68);
        }
        id v6 = *(id *)(*((void *)&v10 + 1) + 8 * (void)v5);
        CFDictionaryRef v7 = IOServiceMatching((const char *)[v6 UTF8String]);
        io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v7);
        if (MatchingService)
        {
          IOObjectRelease(MatchingService);
          id v2 = v6;
          goto LABEL_11;
        }
        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v2 = [&off_1000B6E68 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v3 = v2;
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

- (BOOL)isPresent
{
  id v3 = [(ComponentCameraBase *)self IORegClassName];
  if (v3)
  {
    uint64_t v4 = [(ComponentCameraBase *)self serialNumber];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)retrieveSerialNumberWithComponentName:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ComponentCameraBase *)self IORegClassName];
  id v6 = v5;
  id v7 = 0;
  if (v4 && v5)
  {
    v8 = +[DAComponentUtil getIOregData:property:length:optionalKey:](DAComponentUtil, "getIOregData:property:length:optionalKey:", [v5 UTF8String], v4, 17, 0);
    if (v8) {
      id v7 = [objc_alloc((Class)NSString) initWithData:v8 encoding:4];
    }
    else {
      id v7 = 0;
    }
  }
  if (isValidSerialNumber(v7)) {
    unsigned __int8 v9 = v7;
  }
  else {
    unsigned __int8 v9 = 0;
  }
  id v10 = v9;

  return v10;
}

- (id)retrieveDataSerialNumberWithComponentName:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSMutableString string];
  id v6 = v4;
  if (v6)
  {
    id v7 = [(ComponentCameraBase *)self IORegClassName];
    v8 = +[DAComponentUtil getIOregData:property:length:optionalKey:](DAComponentUtil, "getIOregData:property:length:optionalKey:", [v7 UTF8String], v6, 11, 0);

    if (v8)
    {
      id v9 = v8;
      id v10 = (unsigned __int8 *)[v9 bytes];
      if ([v9 length])
      {
        unint64_t v11 = 0;
        do
          [v5 appendFormat:@"%02X", v10[v11++]];
        while ((unint64_t)[v9 length] > v11);
      }
    }
  }
  if (isValidSerialNumber(v5)) {
    long long v12 = v5;
  }
  else {
    long long v12 = 0;
  }
  id v13 = v12;

  return v13;
}

- (id)serialNumber
{
  id v3 = [(ComponentCameraBase *)self serialNumberComponentPropertyKey];
  id v4 = [(ComponentCameraBase *)self retrieveSerialNumberWithComponentName:v3];

  return v4;
}

- (id)serialNumberComponentPropertyKey
{
  return 0;
}

- (id)illuminatorSerialNumber
{
  id v3 = [(ComponentCameraBase *)self illuminatorSerialNumberComponentPropertyKey];
  id v4 = [(ComponentCameraBase *)self retrieveDataSerialNumberWithComponentName:v3];

  return v4;
}

- (id)illuminatorSerialNumberComponentPropertyKey
{
  return 0;
}

- (int64_t)cameraModuleType
{
  id v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "Camera component does not define camera module type! This is used to determine source of FDR validation status.", v4, 2u);
  }

  return 0;
}

- (void)populateFdrValidationStatus:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ComponentCameraBase *)self cameraModuleType];
  if (v5 == 3)
  {
    uint64_t v7 = [(ComponentCameraBase *)self biometricKitFdrValidationStatus];
    goto LABEL_5;
  }
  int64_t v6 = v5;
  if (v5 == 1)
  {
    uint64_t v7 = [(ComponentCameraBase *)self ioRegFdrValidationStatus];
LABEL_5:
    v8 = (void *)v7;
    goto LABEL_9;
  }
  id v9 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    int64_t v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Camera with module type %ld does not support FDR validation", (uint8_t *)&v13, 0xCu);
  }

  v8 = 0;
LABEL_9:
  id v10 = stringOrNull(v8);

  if (v10)
  {
    unint64_t v11 = +[NSNull null];
    if ([v10 isEqual:v11])
    {
    }
    else
    {
      unsigned __int8 v12 = [v10 isEqualToString:&stru_1000A3028];

      if ((v12 & 1) == 0) {
        [v4 setObject:v10 forKeyedSubscript:@"fdrValidationStatus"];
      }
    }
  }
}

- (id)ioRegFdrValidationStatus
{
  id v2 = [(ComponentCameraBase *)self IORegClassName];
  if (v2)
  {
    id v3 = +[DAComponentUtil getIORegistryClass:v2 property:@"CmClValidationStatus" optionalKey:0 classValidator:0];
    if (v3) {
      id v4 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];
    }
    else {
      id v4 = 0;
    }
    int64_t v5 = stringOrNull(v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)biometricKitFdrValidationStatus
{
  id v2 = +[NSFileManager defaultManager];
  unsigned int v3 = [v2 fileExistsAtPath:@"/private/var/tmp/biokit_hw_issue_notification"];

  if (v3) {
    id v4 = @"Fail";
  }
  else {
    id v4 = @"Pass";
  }

  return v4;
}

- (id)zhuGeFDRStatus:(id)a3
{
  id v4 = a3;
  if (qword_1000BE0B8 != -1) {
    dispatch_once(&qword_1000BE0B8, &stru_100084AA0);
  }
  v26[0] = @"FailureData";
  v26[1] = @"FailureProperties";
  v26[2] = @"DataFailedtoReport";
  v26[3] = @"VerifiedData";
  v26[4] = @"VerifiedProperties";
  int64_t v5 = +[NSArray arrayWithObjects:v26 count:5];
  int64_t v6 = v5;
  if (v4 && [v5 count])
  {
    v22 = self;
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    p_opt_class_meths = &OBJC_PROTOCOL___NSObject.opt_class_meths;
    v24 = v6;
    do
    {
      id v10 = [v6 objectAtIndexedSubscript:v8];
      unint64_t v11 = [(__objc2_meth_list *)p_opt_class_meths[22] objectForKey:v10];
      if (v11)
      {
        unint64_t v23 = v8;
        unint64_t v12 = 0;
        while ((unint64_t)[v11 count] > v12)
        {
          int v13 = [v11 objectAtIndexedSubscript:v12];
          int64_t v14 = [v13 allValues];
          v15 = [v14 firstObject];

          v16 = [v15 objectForKey:@"LiveInstance"];
          unsigned int v17 = [v16 containsString:v4];
          if (v17)
          {
            id v18 = v10;

            uint64_t v7 = v18;
          }

          ++v12;
          if (v17)
          {

            int64_t v6 = v24;
            goto LABEL_17;
          }
        }
        unint64_t v8 = v23;
        int64_t v6 = v24;
        p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSObject + 48);
      }

      ++v8;
    }
    while ((unint64_t)[v6 count] > v8);
LABEL_17:
    if (v7)
    {
      v20 = [(ComponentCameraBase *)v22 zhuGeFDRLabelForCategory:v7];
      v25[0] = v20;
      v25[1] = v7;
      v19 = +[NSArray arrayWithObjects:v25 count:2];
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
    uint64_t v7 = 0;
  }

  return v19;
}

- (id)zhuGeFDRLabelForCategory:(id)a3
{
  if (a3)
  {
    v10[0] = @"VerifiedData";
    v10[1] = @"VerifiedProperties";
    id v3 = a3;
    id v4 = +[NSArray arrayWithObjects:v10 count:2];
    int64_t v5 = +[NSSet setWithArray:v4];
    unsigned int v6 = [v5 containsObject:v3];

    uint64_t v7 = @"Fail";
    if (v6) {
      uint64_t v7 = @"Pass";
    }
    unint64_t v8 = v7;
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

@end