uint64_t ENCloneFileToTemporaryDirectory(int a1, uint64_t a2, void *a3)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  int v12;
  void (**v13)(void);
  void (**v14)(void);
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  const char *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  int v23;
  void v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  void v30[4];
  int v31;

  v6 = objc_alloc(NSURL);
  v7 = NSTemporaryDirectory();
  v8 = (void *)[v6 initFileURLWithPath:v7 isDirectory:1];

  v9 = [MEMORY[0x263F08850] defaultManager];
  v10 = [v9 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:a3];

  if (!v10) {
    goto LABEL_30;
  }
  v11 = v8;
  v12 = open((const char *)[v11 fileSystemRepresentation], 0);
  if ((v12 & 0x80000000) == 0 || *__error() && !*__error())
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __ENCloneFileToTemporaryDirectory_block_invoke;
    v30[3] = &__block_descriptor_36_e5_v8__0l;
    v31 = v12;
    v13 = (void (**)(void))MEMORY[0x2166BC8A0](v30);
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = -1;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __ENCloneFileToTemporaryDirectory_block_invoke_2;
    v25[3] = &unk_264244568;
    v25[4] = &v26;
    v14 = (void (**)(void))MEMORY[0x2166BC8A0](v25);
    if (a2)
    {
      v15 = sandbox_extension_consume();
      v27[3] = v15;
      if (v15 == -1 && (!*__error() || *__error()))
      {
        if (a3)
        {
          ENErrorF(2);
          v22 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }
        goto LABEL_26;
      }
    }
    v16 = [MEMORY[0x263F08C38] UUID];
    v17 = [v16 UUIDString];

    v18 = v17;
    v19 = (const char *)[v18 UTF8String];
    v20 = [v11 URLByAppendingPathComponent:v18];
    v21 = (const char *)[v20 fileSystemRepresentation];
    if (fclonefileat(a1, v12, v19, 0) && (!*__error() || *__error()))
    {
      if (a3) {
        goto LABEL_23;
      }
    }
    else
    {
      v22 = open(v21, 0);
      if ((v22 & 0x80000000) == 0)
      {
        unlink(v21);
LABEL_25:

LABEL_26:
        v14[2](v14);

        _Block_object_dispose(&v26, 8);
        v13[2](v13);

        goto LABEL_27;
      }
      if (*__error())
      {
        v23 = *__error();
        unlink(v21);
        if (!v23) {
          goto LABEL_25;
        }
      }
      else
      {
        unlink(v21);
      }
      if (a3)
      {
LABEL_23:
        ENErrorF(2);
        v22 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
    }
    v22 = 0;
    goto LABEL_25;
  }
  if (!a3)
  {
LABEL_30:
    v22 = 0;
    goto LABEL_27;
  }
  ENErrorF(2);
  v22 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

  return v22;
}

void sub_21548E218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  (*(void (**)(uint64_t))(v8 + 16))(v8);
  _Unwind_Resume(a1);
}

id ENErrorF(uint64_t a1)
{
  v12[3] = *MEMORY[0x263EF8340];
  if ((unint64_t)(a1 - 1) > 0xF) {
    v2 = "?";
  }
  else {
    v2 = off_2642445A8[a1 - 1];
  }
  NSPrintV();
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v2;
  v4 = NSPrintF();
  id v5 = objc_alloc(MEMORY[0x263F087E8]);
  v11[0] = @"cuErrorDesc";
  v11[1] = @"cuErrorMsg";
  if (v3) {
    v6 = v3;
  }
  else {
    v6 = &stru_26C604128;
  }
  v12[0] = v4;
  v12[1] = v6;
  v11[2] = *MEMORY[0x263F07F80];
  v12[2] = v4;
  v7 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 3, v10, v3);
  uint64_t v8 = (void *)[v5 initWithDomain:@"ENErrorDomain" code:a1 userInfo:v7];

  return v8;
}

uint64_t __ENCloneFileToTemporaryDirectory_block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

uint64_t __ENCloneFileToTemporaryDirectory_block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (result != -1) {
    return MEMORY[0x270EDB2D8]();
  }
  return result;
}

uint64_t ENCompareDiagnosisReportTypes(int a1, int a2)
{
  if ((a1 - 1) > 4) {
    unsigned int v2 = 0;
  }
  else {
    unsigned int v2 = dword_2154C22A0[a1 - 1];
  }
  if ((a2 - 1) > 4) {
    unsigned int v3 = 0;
  }
  else {
    unsigned int v3 = dword_2154C22A0[a2 - 1];
  }
  BOOL v4 = v2 > v3;
  if (v2 >= v3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = -1;
  }
  if (v4) {
    return 1;
  }
  else {
    return v5;
  }
}

SecKeyRef ENCopyPublicKeyFromBase64String(void *a1, void *a2)
{
  v18[3] = *MEMORY[0x263EF8340];
  id v3 = a1;
  BOOL v4 = v3;
  if (!v3)
  {
    if (a2)
    {
      uint64_t v15 = 2;
LABEL_14:
      ENErrorF(v15);
      SecKeyRef v11 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_15:
    SecKeyRef v11 = 0;
    goto LABEL_9;
  }
  if ((unint64_t)[v3 length] <= 0x41)
  {
    if (a2)
    {
      uint64_t v15 = 15;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v4 options:1];
  objc_msgSend(v5, "subdataWithRange:", objc_msgSend(v5, "length") - 65, 65);
  CFDataRef v6 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  CFErrorRef v16 = 0;
  uint64_t v7 = *MEMORY[0x263F16FB0];
  uint64_t v8 = *MEMORY[0x263F16F68];
  v17[0] = *MEMORY[0x263F16FA8];
  v17[1] = v8;
  uint64_t v9 = *MEMORY[0x263F16F80];
  v18[0] = v7;
  v18[1] = v9;
  v17[2] = *MEMORY[0x263F16F98];
  v18[2] = &unk_26C60D180;
  CFDictionaryRef v10 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
  SecKeyRef v11 = SecKeyCreateWithData(v6, v10, &v16);
  CFErrorRef v12 = v16;
  if (v11) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = a2 == 0;
  }
  if (!v13)
  {
    ENNestedErrorF(v16, 15);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_9:
  return v11;
}

id ENNestedErrorF(void *a1, uint64_t a2)
{
  v17[4] = *MEMORY[0x263EF8340];
  id v3 = a1;
  if ((unint64_t)(a2 - 1) > 0xF) {
    BOOL v4 = "?";
  }
  else {
    BOOL v4 = off_2642445A8[a2 - 1];
  }
  NSPrintV();
  uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = v4;
  CFDataRef v6 = NSPrintF();
  id v7 = objc_alloc(MEMORY[0x263F087E8]);
  v16[0] = @"cuErrorDesc";
  v16[1] = @"cuErrorMsg";
  uint64_t v8 = &stru_26C604128;
  if (v5) {
    uint64_t v8 = v5;
  }
  v17[0] = v6;
  v17[1] = v8;
  uint64_t v9 = *MEMORY[0x263F07F80];
  v17[2] = v6;
  uint64_t v10 = *MEMORY[0x263F08608];
  v16[2] = v9;
  v16[3] = v10;
  SecKeyRef v11 = v3;
  if (!v3)
  {
    SecKeyRef v11 = NSErrorF();
  }
  void v17[3] = v11;
  CFErrorRef v12 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 4, v15, v5);
  BOOL v13 = (void *)[v7 initWithDomain:@"ENErrorDomain" code:a2 userInfo:v12];

  if (!v3) {

  }
  return v13;
}

id ENDataVaultPath()
{
  v0 = NSHomeDirectory();
  v1 = [v0 stringByAppendingPathComponent:@"Library/ExposureNotification"];

  return v1;
}

id ENDataVaultURL()
{
  v0 = NSURL;
  v1 = ENDataVaultPath();
  unsigned int v2 = [v0 fileURLWithPath:v1 isDirectory:1];

  return v2;
}

uint64_t ENDaemonBundle()
{
  return [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.ExposureNotificationDaemon"];
}

id ENDefaultExpirationDate(void *a1)
{
  id v1 = a1;
  unsigned int v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = [MEMORY[0x263EFF910] date];
  }
  BOOL v4 = v3;
  uint64_t v5 = [v3 dateByAddingTimeInterval:1209600.0];

  return v5;
}

const char *ENErrorMetricTypeToString(int a1)
{
  if (a1 > 3999)
  {
    switch(a1)
    {
      case 6000:
        uint64_t result = "ConfigurationManagerUnknownNetworkError";
        break;
      case 6001:
        uint64_t result = "ConfigurationManagerSigValidationFailure";
        break;
      case 6002:
        uint64_t result = "ConfigurationManagerBadResponseFormat";
        break;
      case 6003:
        uint64_t result = "ConfigurationManagerStoreFailure";
        break;
      case 6004:
        uint64_t result = "ConfigurationManagerInvalidResponse";
        break;
      default:
        switch(a1)
        {
          case 4000:
            uint64_t result = "ExposureDatabaseCorruption";
            break;
          case 4001:
            uint64_t result = "ExposureDatabaseUnknownError";
            break;
          case 4002:
            uint64_t result = "ExposureDatabaseDiskFull";
            break;
          case 4003:
            uint64_t result = "ExposureDatabaseMigrationFailure";
            break;
          default:
LABEL_30:
            if ((a1 - 10000) >= 0x3E8) {
              unsigned int v2 = "?";
            }
            else {
              unsigned int v2 = "ConfigurationManagerHTTPErrorStatus";
            }
            if ((a1 - 9000) >= 0x3E8) {
              id v3 = v2;
            }
            else {
              id v3 = "DownloadManagerKeyFileHTTPErrorStatus";
            }
            if ((a1 - 8000) >= 0x3E8) {
              uint64_t result = v3;
            }
            else {
              uint64_t result = "DownloadManagerIndexFileHTTPErrorStatus";
            }
            break;
        }
        break;
    }
  }
  else if (a1 <= 1999)
  {
    switch(a1)
    {
      case 1000:
        uint64_t result = "AdvertisementDatabaseCorruption";
        break;
      case 1001:
        uint64_t result = "AdvertisementDatabaseUnknownError";
        break;
      case 1002:
        uint64_t result = "AdvertisementDatabaseDiskFull";
        break;
      case 1003:
        uint64_t result = "AdvertisementDatabaseFailedToOpenAllStores";
        break;
      case 1004:
        uint64_t result = "AdvertisementDatabaseUnauthorized";
        break;
      case 1005:
        uint64_t result = "AdvertisementDatabaseTempStoreLimit";
        break;
      case 1006:
        uint64_t result = "AdvertisementDatabaseAEMDecryptionFailure";
        break;
      default:
        if (a1) {
          goto LABEL_30;
        }
        uint64_t result = "Unknown";
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 3000:
        uint64_t result = "ExposureDetectionManagerBadArchive";
        break;
      case 3001:
        uint64_t result = "ExposureDetectionManagerUnableToOpenSigFile";
        break;
      case 3002:
        uint64_t result = "ExposureDetectionManagerUnableToOpenKeyFile";
        break;
      case 3003:
        uint64_t result = "ExposureDetectionManagerSigValidationFailure";
        break;
      case 3004:
        uint64_t result = "ExposureDetectionManagerKeyFileProcessingFailure";
        break;
      default:
        goto LABEL_30;
    }
  }
  return result;
}

id ENFrameworkBundle()
{
  if (ENFrameworkBundle_sOnce != -1) {
    dispatch_once(&ENFrameworkBundle_sOnce, &__block_literal_global);
  }
  v0 = (void *)ENFrameworkBundle_sBundle;

  return v0;
}

void __ENFrameworkBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.ExposureNotification"];
  id v1 = (void *)ENFrameworkBundle_sBundle;
  ENFrameworkBundle_sBundle = v0;

  if (!ENFrameworkBundle_sBundle)
  {
    uint64_t v2 = [objc_alloc(NSURL) initFileURLWithPath:@"/System/Library/Frameworks/ExposureNotification.framework" isDirectory:1];
    uint64_t v3 = v2;
    if (v2)
    {
      uint64_t v6 = v2;
      uint64_t v4 = [MEMORY[0x263F086E0] bundleWithURL:v2];
      uint64_t v5 = (void *)ENFrameworkBundle_sBundle;
      ENFrameworkBundle_sBundle = v4;

      uint64_t v3 = v6;
    }
    MEMORY[0x270F9A758](v2, v3);
  }
}

id ENLocalizedString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = ENFrameworkBundle();
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 localizations];
    uint64_t v5 = [MEMORY[0x263EFF960] preferredLanguages];
    uint64_t v6 = (void *)v5;
    if (v4)
    {
      if (v5)
      {
        id v7 = [MEMORY[0x263F086E0] preferredLocalizationsFromArray:v4 forPreferences:v5];
        uint64_t v8 = [v7 firstObject];

        if (v8)
        {
          uint64_t v9 = [v3 pathForResource:@"Localizable" ofType:@"strings" inDirectory:@"." forLocalization:v8];
          if (v9)
          {
            uint64_t v10 = (void *)v9;
            SecKeyRef v11 = (void *)[objc_alloc(NSDictionary) initWithContentsOfFile:v9];
            id v12 = [v11 objectForKeyedSubscript:v1];

            if (v12)
            {
LABEL_10:

              goto LABEL_11;
            }
          }
          else
          {
          }
        }
      }
    }
    id v12 = [v3 localizedStringForKey:v1 value:&stru_26C604128 table:@"Localizable"];
    goto LABEL_10;
  }
  id v12 = v1;
LABEL_11:

  return v12;
}

BOOL ENValidateRegionCodeISO(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    BOOL v9 = 0;
    goto LABEL_7;
  }
  uint64_t v2 = (void *)MEMORY[0x2166BC6F0]();
  id v3 = v1;
  if ([v3 containsString:@"-"])
  {
    uint64_t v4 = [v3 componentsSeparatedByString:@"-"];
    if ([v4 count] != 2)
    {
      BOOL v9 = 0;
      goto LABEL_6;
    }
    uint64_t v5 = [v4 firstObject];

    id v3 = (id)v5;
  }
  uint64_t v4 = [NSDictionary dictionaryWithContentsOfFile:@"/System/Library/Carrier Bundles/iPhone/Default.bundle/ISO2MCC.plist"];
  uint64_t v6 = [v3 lowercaseString];
  id v7 = [v4 objectForKey:v6];

  uint64_t v8 = [v7 firstObject];
  BOOL v9 = v8 != 0;

LABEL_6:
LABEL_7:

  return v9;
}

void ENWriteTemporaryExposureKeysCSV(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = a2;
  FPrintF();
  FPrintF();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "keyData", v11);
        uint64_t v9 = [v7 rollingStartNumber];
        unsigned int v10 = [v7 transmissionRiskLevel];
        uint64_t v15 = [v7 rollingPeriod];
        FPrintF();

        if (objc_msgSend(v7, "daysSinceOnsetOfSymptoms", v8, v9, v10, v15) != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v12 = [v7 daysSinceOnsetOfSymptoms];
          FPrintF();
        }
        uint64_t v13 = objc_msgSend(v7, "diagnosisReportType", v12);
        FPrintF();
        uint64_t v14 = objc_msgSend(v7, "vaccinated", v13);
        FPrintF();
        uint64_t v11 = objc_msgSend(v7, "variantOfConcernType", v14);
        FPrintF();
        FPrintF();
      }
      uint64_t v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16, v11);
    }
    while (v4);
  }

  [obj count];
  FPrintF();
}

id ENXPCDecodeSecureObject(void *a1, const char *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  if (MEMORY[0x2166BCD00]() == MEMORY[0x263EF8708])
  {
    uint64_t v8 = xpc_dictionary_get_value(v7, a2);
    uint64_t v9 = (void *)v8;
    if (v8)
    {
      if (MEMORY[0x2166BCD00](v8) != MEMORY[0x263EF86F8])
      {
        if (a4)
        {
          uint64_t v17 = 2;
LABEL_24:
          ENErrorF(v17);
          id v15 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
        goto LABEL_25;
      }
      size_t length = 0;
      data = xpc_dictionary_get_data(v7, a2, &length);
      if (data)
      {
        if (length)
        {
          uint64_t v11 = data;
          id v12 = objc_alloc(MEMORY[0x263EFF8F8]);
          uint64_t v13 = (void *)[v12 initWithBytesNoCopy:v11 length:length freeWhenDone:0];
          uint64_t v14 = [MEMORY[0x263F08928] unarchivedObjectOfClass:a3 fromData:v13 error:a4];
          if (v14)
          {
            if (objc_opt_isKindOfClass())
            {
              id v15 = v14;
LABEL_9:

LABEL_10:
              goto LABEL_11;
            }
            if (a4)
            {
              ENErrorF(15);
              id v15 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_9;
            }
          }
          id v15 = 0;
          goto LABEL_9;
        }
        if (a4) {
          goto LABEL_23;
        }
LABEL_25:
        id v15 = 0;
        goto LABEL_10;
      }
      if (!a4) {
        goto LABEL_25;
      }
    }
    else if (!a4)
    {
      goto LABEL_25;
    }
LABEL_23:
    uint64_t v17 = 15;
    goto LABEL_24;
  }
  if (a4)
  {
    ENErrorF(2);
    id v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = 0;
  }
LABEL_11:

  return v15;
}

id ENXPCDecodeSecureObjectIfPresent(void *a1, const char *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  if (MEMORY[0x2166BCD00]() == MEMORY[0x263EF8708])
  {
    uint64_t v8 = xpc_dictionary_get_value(v7, a2);
    if (v8)
    {
      uint64_t v9 = ENXPCDecodeSecureObject(v7, a2, a3, a4);
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else if (a4)
  {
    ENErrorF(2);
    uint64_t v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

BOOL ENXPCEncodeSecureObject(void *a1, const char *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a3;
  if (MEMORY[0x2166BCD00](v7) != MEMORY[0x263EF8708])
  {
    if (a4) {
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (!v8)
  {
    if (a4)
    {
LABEL_10:
      ENErrorF(2);
      BOOL v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_11:
    BOOL v11 = 0;
    goto LABEL_6;
  }
  uint64_t v9 = [MEMORY[0x263F08910] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:a4];
  unsigned int v10 = v9;
  BOOL v11 = v9 != 0;
  if (v9)
  {
    id v12 = v9;
    xpc_dictionary_set_data(v7, a2, (const void *)[v12 bytes], objc_msgSend(v12, "length"));
  }

LABEL_6:
  return v11;
}

uint64_t ENXPCGetNextClientID()
{
  if (ENXPCGetNextClientID_sOnce != -1) {
    dispatch_once(&ENXPCGetNextClientID_sOnce, &__block_literal_global_139);
  }
  return atomic_fetch_add((atomic_uint *volatile)&ENXPCGetNextClientID_sNext, 1u) + 1;
}

uint64_t __ENXPCGetNextClientID_block_invoke()
{
  uint64_t result = RandomBytes();
  ENXPCGetNextClientID_sNext = (unsigned __int16)word_26786B1EA << 16;
  return result;
}

unsigned char *ENAEMCrypt()
{
  ccaes_ctr_crypt_mode();
  uint64_t result = (unsigned char *)ccctr_one_shot();
  if (result)
  {
    id v1 = (unsigned char *)FatalErrorF();
    return ENRPIMetadataDeserialize(v1, v2);
  }
  return result;
}

unsigned char *ENRPIMetadataDeserialize(unsigned char *result, unsigned __int8 *a2)
{
  unsigned int v2 = *a2;
  unsigned int v3 = a2[1];
  if (v3 >= 4) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  int v5 = (v2 >> 4) & 3;
  if (v5) {
    BOOL v6 = v2 > 0x3F;
  }
  else {
    BOOL v6 = 0;
  }
  *uint64_t result = *a2 >> 6;
  result[1] = v5;
  if (v6) {
    char v7 = (v2 >> 2) & 3;
  }
  else {
    char v7 = v4;
  }
  result[2] = v3;
  result[3] = v7;
  return result;
}

unsigned char *ENRPIMetadataSerialize(unsigned char *result, uint64_t a2)
{
  *(unsigned char *)a2 = (*result << 6) | (16 * (result[1] & 3)) | (4 * (result[3] & 3));
  *(unsigned char *)(a2 + 1) = result[2];
  *(_WORD *)(a2 + 2) = 0;
  return result;
}

uint64_t ENAEMKDerive()
{
  ccsha256_di();
  uint64_t result = cchkdf();
  if (result)
  {
    uint64_t v1 = FatalErrorF();
    return ENRPIDerive(v1);
  }
  return result;
}

uint64_t ENRPIDerive()
{
  ccaes_ecb_encrypt_mode();
  uint64_t result = ccecb_one_shot();
  if (result) {
    FatalErrorF();
  }
  return result;
}

uint64_t ENRPIDeriveBatch(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  v12[1] = *MEMORY[0x263EF8340];
  MEMORY[0x270FA5388]();
  char v7 = &v12[-2 * v6];
  bzero(v7, v8);
  if (a4)
  {
    uint64_t v9 = a4;
    unsigned int v10 = v7;
    do
    {
      *((_WORD *)v10 + 2) = 18768;
      *(_DWORD *)unsigned int v10 = 1378700869;
      *(_DWORD *)((char *)v10 + 6) = 0;
      *((_WORD *)v10 + 5) = 0;
      *((_DWORD *)v10 + 3) = a3;
      v10 += 2;
      ++a3;
      --v9;
    }
    while (v9);
  }
  ccaes_ecb_encrypt_mode();
  uint64_t result = ccecb_one_shot();
  if (result) {
    FatalErrorF();
  }
  return result;
}

uint64_t ENRPIKDerive()
{
  ccsha256_di();
  uint64_t result = cchkdf();
  if (result)
  {
    uint64_t v1 = FatalErrorF();
    return ENTEKGenerate(v1);
  }
  return result;
}

ENExposureDetectionHistoryCheck *ENTEKGenerate(uint64_t a1)
{
  unsigned int v2 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))ccrng();
  uint64_t v3 = ccrng();
  uint64_t result = (ENExposureDetectionHistoryCheck *)v2(v3, 16, a1);
  if (result)
  {
    int v5 = (ENExposureDetectionHistoryCheck *)FatalErrorF();
    return [(ENExposureDetectionHistoryCheck *)v5 init];
  }
  return result;
}

void sub_21549440C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_2154952EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215496CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21549802C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void LogInvalidValueForKey(void *a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = objc_msgSend(a1, "objectForKeyedSubscript:");
  if (v3)
  {
    if (gLogCategory__ENRegionServerConfiguration <= 10
      && (gLogCategory__ENRegionServerConfiguration != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF_safe();
    }
  }
  else if (gLogCategory__ENRegionServerConfiguration <= 10 {
         && (gLogCategory__ENRegionServerConfiguration != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
}

BOOL UInt64NumIsInRange(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  BOOL v2 = (objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v1 unsignedLongLongValue] < 0x10000;

  return v2;
}

void sub_21549FFD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2154A13DC(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_2154A15C0(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_2154A1A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  (*(void (**)(uint64_t))(v26 + 16))(v26);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_2154A2A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2154A302C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_2154A349C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2154A3880(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2154A4C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_2154A6094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_2154A8A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2154A90B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  (*(void (**)(uint64_t))(v8 + 16))(v8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2154AA824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2154AC1E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2154ACB8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  (*(void (**)(uint64_t))(v12 + 16))(v12);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  (*(void (**)(void))(a11 + 16))();
  _Block_object_dispose((const void *)(v14 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_2154AD7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2154ADDB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2154B46B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void -[ENManager setInvalidationHandler:](ENManager *self, SEL a2, dispatch_block_t invalidationHandler)
{
}

void __DefaultDispatchQueue_block_invoke()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v5 = objc_claimAutoreleasedReturnValue();
  uint64_t v1 = (const char *)[v5 UTF8String];
  BOOL v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v3 = dispatch_queue_create(v1, v2);
  id v4 = (void *)DefaultDispatchQueue_defaultQueue;
  DefaultDispatchQueue_defaultQueue = (uint64_t)v3;
}

void sub_2154B7AA8(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_2154B7E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class ENUICreateRemotePresentationController()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!HealthExposureNotificationUILibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __HealthExposureNotificationUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2642452E0;
    uint64_t v5 = 0;
    HealthExposureNotificationUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!HealthExposureNotificationUILibraryCore_frameworkLibrary) {
    ENUICreateRemotePresentationController_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class v0 = NSClassFromString(&cfstr_Enuipresentati.isa);
  if (v0)
  {
    uint64_t v1 = v0;
    if ([(objc_class *)v0 conformsToProtocol:&unk_26C616D60]) {
      Class v0 = (Class)objc_alloc_init(v1);
    }
    else {
      Class v0 = 0;
    }
  }

  return v0;
}

uint64_t __HealthExposureNotificationUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HealthExposureNotificationUILibraryCore_frameworkLibrary = result;
  return result;
}

void sub_2154B9AD8(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_2154B9FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_2154BA434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ENUIHostViewControllerInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C616DC0];
}

id ENUIRemoteViewControllerInterface()
{
  Class v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C616E20];
  uint64_t v1 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v1 forSelector:sel_setPresentationRequest_ argumentIndex:0 ofReply:0];

  return v0;
}

void sub_2154BCC6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void _responseCallback(uint64_t a1, uint64_t a2)
{
  pthread_mutex_lock(&gENUserAlertMutex);
  long long v4 = (void *)gENUserAlertMap;
  uint64_t v5 = [NSNumber numberWithLong:a1];
  id v6 = [v4 objectForKeyedSubscript:v5];

  pthread_mutex_unlock(&gENUserAlertMutex);
  [v6 _responseCallback:a1 responseFlags:a2];
}

void ENUICreateRemotePresentationController_cold_1(void *a1)
{
  BOOL v2 = [MEMORY[0x263F08690] currentHandler];
  dispatch_queue_t v3 = [NSString stringWithUTF8String:"void *HealthExposureNotificationUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ENRemotePresentationController.m", 12, @"%s", *a1);

  __break(1u);
  CFArrayGetTypeID();
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x270F23D58]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x270F23D70]();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return MEMORY[0x270F23D78]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x270F23D80]();
}

uint64_t CFPrefs_GetInt64()
{
  return MEMORY[0x270F23E88]();
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x270EE54B8](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE54D0](allocator, userNotification, callout, order);
}

uint64_t CUPrintDateCF()
{
  return MEMORY[0x270F23F88]();
}

uint64_t CUPrintDurationDouble()
{
  return MEMORY[0x270F23F90]();
}

uint64_t CUPrintFlags32()
{
  return MEMORY[0x270F23FA8]();
}

uint64_t CUPrintNSError()
{
  return MEMORY[0x270F23FD0]();
}

uint64_t CUPrintXPC()
{
  return MEMORY[0x270F23FF8]();
}

uint64_t CUXPCDecodeBool()
{
  return MEMORY[0x270F24008]();
}

uint64_t CUXPCDecodeDouble()
{
  return MEMORY[0x270F24010]();
}

uint64_t CUXPCDecodeNSArrayOfInteger()
{
  return MEMORY[0x270F24020]();
}

uint64_t CUXPCDecodeNSData()
{
  return MEMORY[0x270F24030]();
}

uint64_t CUXPCDecodeNSDataOfLength()
{
  return MEMORY[0x270F24038]();
}

uint64_t CUXPCDecodeNSErrorIfNeeded()
{
  return MEMORY[0x270F24048]();
}

uint64_t CUXPCDecodeNSString()
{
  return MEMORY[0x270F24050]();
}

uint64_t CUXPCDecodeNSUUID()
{
  return MEMORY[0x270F24058]();
}

uint64_t CUXPCDecodeSInt64RangedEx()
{
  return MEMORY[0x270F24068]();
}

uint64_t CUXPCDecodeUInt64RangedEx()
{
  return MEMORY[0x270F24070]();
}

uint64_t CUXPCEncodeNSArrayOfNSNumber()
{
  return MEMORY[0x270F24078]();
}

uint64_t CUXPCGetNextClientID()
{
  return MEMORY[0x270F240A0]();
}

uint64_t FPrintF()
{
  return MEMORY[0x270F24168]();
}

uint64_t FatalErrorF()
{
  return MEMORY[0x270F24178]();
}

uint64_t LogPrintF_safe()
{
  return MEMORY[0x270F24400]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x270F24450]();
}

uint64_t NSAppendPrintF_safe()
{
  return MEMORY[0x270F24458]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t NSDecodeNSArrayOfClassIfPresent()
{
  return MEMORY[0x270F24460]();
}

uint64_t NSDecodeSInt64RangedIfPresent()
{
  return MEMORY[0x270F24470]();
}

uint64_t NSDictionaryGetNSArrayOfClass()
{
  return MEMORY[0x270F24480]();
}

uint64_t NSDictionaryGetNSNumber()
{
  return MEMORY[0x270F24488]();
}

uint64_t NSErrorF()
{
  return MEMORY[0x270F24490]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x270F244C8]();
}

uint64_t NSPrintV()
{
  return MEMORY[0x270F244E0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x270F24630]();
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA60](keyData, attributes, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x270EFDAC8](key, algorithm, signedData, signature, error);
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x270F795F8]();
}

uint64_t TCCAccessRestricted()
{
  return MEMORY[0x270F79648]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x270EE57A8]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x270F24858]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x270F97D88]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x270F97E58]();
}

uint64_t archive_read_data()
{
  return MEMORY[0x270F97E80]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x270F97EE0]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x270F97EF0]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x270F97EF8]();
}

uint64_t archive_read_open_FILE()
{
  return MEMORY[0x270F97F10]();
}

uint64_t archive_read_support_format_zip()
{
  return MEMORY[0x270F97F78]();
}

uint64_t atoll(const char *a1)
{
  return MEMORY[0x270ED86F8](a1);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccaes_ctr_crypt_mode()
{
  return MEMORY[0x270ED87F0]();
}

uint64_t ccaes_ecb_encrypt_mode()
{
  return MEMORY[0x270ED87F8]();
}

uint64_t ccctr_one_shot()
{
  return MEMORY[0x270ED8858]();
}

uint64_t ccdigest()
{
  return MEMORY[0x270ED8A40]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x270ED8A48]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x270ED8A50]();
}

uint64_t ccecb_one_shot()
{
  return MEMORY[0x270ED8B30]();
}

uint64_t cchkdf()
{
  return MEMORY[0x270ED8BA8]();
}

uint64_t ccrng()
{
  return MEMORY[0x270ED8C90]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x270ED8D70]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

int fclonefileat(int a1, int a2, const char *a3, uint32_t a4)
{
  return MEMORY[0x270ED98C0](*(void *)&a1, *(void *)&a2, a3, *(void *)&a4);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x270ED98E8](*(void *)&a1, a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x270ED9910](a1);
}

int fgetpos(FILE *a1, fpos_t *a2)
{
  return MEMORY[0x270ED9960](a1, a2);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270ED9978](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x270ED9AC8](__stream, a2, *(void *)&__whence);
}

int fsetpos(FILE *a1, const fpos_t *a2)
{
  return MEMORY[0x270ED9AD8](a1, a2);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x270EDB170](a1, a2);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x270EDB2C8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x270EDBE40](name, targetq);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x270EDBE48](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x270EDBF48]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC040](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC078](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x270EDC080](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

uint64_t xpc_dictionary_set_cf_object()
{
  return MEMORY[0x270F24920]();
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_fd_create(int fd)
{
  return (xpc_object_t)MEMORY[0x270EDC1C8](*(void *)&fd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x270EDC218](xint);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}