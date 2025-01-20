@interface CRFDRUtils
+ (BOOL)isDataClassSupported:(id)a3;
+ (BOOL)isDcSignedCombinedDataClass:(id)a3 error:(id *)a4;
+ (BOOL)isDcSignedComponent:(int)a3 error:(id *)a4;
+ (BOOL)isDcSignedDataClass:(id)a3 error:(id *)a4;
+ (BOOL)isDcSignedSealingManifest:(id *)a3;
+ (BOOL)queryDeviceStagedSealedFromEAN:(BOOL)a3 error:(id *)a4;
+ (__AMFDR)_createFDRLocal;
+ (id)_getDataClassesFromSealingManifest;
+ (id)_getDataClassesFromSealingMap;
+ (id)_getManifestForDataClass:(id)a3;
+ (id)extractComponentsAndIdentifiers:(id)a3;
+ (id)findUnsealedDataWithError:(id *)a3;
+ (id)findUnsealedDataWithKey:(id)a3 error:(id *)a4;
+ (id)getData:(id)a3 instance:(id)a4;
+ (id)getDataPayload:(id)a3 instance:(id)a4;
+ (id)getLocalSealingManifest;
+ (id)getStringFromCert:(id)a3 WithTag:(unint64_t)a4 AndOID:(id)a5;
+ (id)isServicePartWithError:(id *)a3;
+ (id)localManifestProperties;
+ (void)fixUpPseudoMSRk:(id)a3 mesaWithSCKey:(BOOL)a4;
@end

@implementation CRFDRUtils

+ (__AMFDR)_createFDRLocal
{
  v6[1] = *MEMORY[0x263EF8340];
  v5 = @"DataStore";
  v6[0] = @"Local";
  v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  v3 = (__AMFDR *)AMFDRCreateWithOptions();

  return v3;
}

+ (id)getLocalSealingManifest
{
  [a1 _createFDRLocal];
  v7 = 0;
  uint64_t v8 = 0;
  v2 = sub_23993FC14(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_239937000, v2, OS_LOG_TYPE_DEFAULT, "Getting local sealing manifest", v6, 2u);
  }

  if (AMFDRSealingMapPopulateSealingManifest())
  {
    v3 = v7;
  }
  else
  {
    v4 = sub_23993FC14(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_2399415F0();
    }

    v3 = 0;
  }
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v3;
}

+ (id)getStringFromCert:(id)a3 WithTag:(unint64_t)a4 AndOID:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  $203840463D15D3E17BD93E376D41ABE6 v25 = a3;
  id v6 = a5;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  v24[0] = 0;
  v24[1] = 0;
  uint64_t v21 = 0;
  unint64_t v22 = 0;
  uint64_t v23 = 0;
  memset(v20, 0, sizeof(v20));
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  while (!sub_23993FF30((unint64_t *)&v25, v20))
  {
    v9 = [MEMORY[0x263F08D40] valueWithBytes:v20 objCType:"{?=Q{?=*Q}}"];
    [v7 addObject:v9];
  }
  if ([v7 count])
  {
    char v11 = 0;
    *(void *)&long long v10 = 138412290;
    long long v19 = v10;
    while (1)
    {
      v12 = objc_msgSend(v7, "objectAtIndex:", 0, v19);
      [v12 getValue:&v21];
      id v13 = objc_alloc(MEMORY[0x263EFF8F8]);
      v14 = (void *)[v13 initWithBytes:v22 length:v23];
      if (v21 != a4 || ([v6 isEqual:v14] & 1) == 0) {
        break;
      }
      char v11 = 1;
LABEL_15:
      [v7 removeObjectAtIndex:0];

      if (![v7 count]) {
        goto LABEL_20;
      }
    }
    if (v11)
    {
      v15 = [[NSString alloc] initWithData:v14 encoding:4];
      [v8 addObject:v15];
    }
    else
    {
      if (!sub_23993FF04(&v22, v24))
      {
        while (!sub_23993FF30(v24, v20))
        {
          v16 = [MEMORY[0x263F08D40] valueWithBytes:v20 objCType:"{?=Q{?=*Q}}"];
          [v7 addObject:v16];
        }
        goto LABEL_14;
      }
      v15 = sub_23993FC14(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v19;
        v27 = v14;
        _os_log_error_impl(&dword_239937000, v15, OS_LOG_TYPE_ERROR, "Failed to parse node in cert chain data = %@", buf, 0xCu);
      }
    }

LABEL_14:
    char v11 = 0;
    goto LABEL_15;
  }
LABEL_20:
  v17 = (void *)[v8 copy];

  return v17;
}

+ (id)getData:(id)a3 instance:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, @"VerifyData", (const void *)*MEMORY[0x263EFFB40]);
  if (v6) {
    uint64_t v8 = AMFDRSealingMapCopyLocalData();
  }
  else {
    uint64_t v8 = AMFDRSealingManifestCopyLocalDataForClass();
  }
  v9 = (void *)v8;
  if (v8)
  {
    CFDictionarySetValue(Mutable, @"VerifyData", (const void *)*MEMORY[0x263EFFB38]);
    if (v6) {
      uint64_t v10 = AMFDRSealingMapCopyLocalData();
    }
    else {
      uint64_t v10 = AMFDRSealingManifestCopyLocalDataForClass();
    }
    char v11 = (void *)v10;
  }
  else
  {

    id v13 = sub_23993FC14(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_239941658();
    }

    char v11 = 0;
  }
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  return v11;
}

+ (id)getDataPayload:(id)a3 instance:(id)a4
{
  id v6 = a3;
  id v7 = [a1 getData:v6 instance:a4];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    int v10 = Img4DecodeInit();
    if (v10)
    {
      int v15 = v10;
      v16 = sub_23993FC14(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_239941810(v15, v16);
      }
    }
    else
    {
      int Payload = Img4DecodeGetPayload();
      if (!Payload)
      {
        v12 = [MEMORY[0x263EFF8F8] dataWithBytes:0 length:0];
        goto LABEL_5;
      }
      int v17 = Payload;
      v16 = sub_23993FC14(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_239941798(v17, v16);
      }
    }
  }
  else
  {
    v14 = sub_23993FC14(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_239941730();
    }
  }
  v12 = 0;
LABEL_5:

  return v12;
}

+ (BOOL)isDataClassSupported:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23993CFB0;
  block[3] = &unk_264DB3718;
  block[4] = a1;
  uint64_t v3 = qword_268A059F8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_268A059F8, block);
  }
  char v5 = [(id)qword_268A059F0 containsObject:v4];

  return v5;
}

+ (id)_getDataClassesFromSealingManifest
{
  id v13 = 0;
  v2 = objc_msgSend(a1, "getLocalSealingManifest", 0);
  if (v2)
  {
    int v3 = AMFDRSealingManifestCopyDataClassesInstancesAndProperties();
    AMSupportSafeRelease();
    AMSupportSafeRelease();
    if (v3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v4 = [MEMORY[0x263EFFA08] setWithArray:0];
        char v5 = [v4 setByAddingObject:@"seal"];
        goto LABEL_13;
      }
      id v4 = sub_23993FC14(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_2399418BC();
      }
    }
    else
    {
      id v4 = sub_23993FC14(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_2399418F0(&v13, v4, v6, v7, v8, v9, v10, v11);
      }
    }
    char v5 = 0;
  }
  else
  {
    id v4 = sub_23993FC14(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_239941888();
    }
    char v5 = 0;
  }
LABEL_13:

  return v5;
}

+ (id)_getDataClassesFromSealingMap
{
  v12 = 0;
  if (AMFDRSealingMapCopyDataClassesWithAttribute()) {
    BOOL v2 = v12 == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v3 = [MEMORY[0x263EFFA08] setWithArray:0];
      uint64_t v10 = [v3 setByAddingObject:@"seal"];
      goto LABEL_12;
    }
    int v3 = sub_23993FC14(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_2399418BC();
    }
  }
  else
  {
    int v3 = sub_23993FC14(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_23994196C(&v12, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  uint64_t v10 = 0;
LABEL_12:

  return v10;
}

+ (id)_getManifestForDataClass:(id)a3
{
  id v4 = a3;
  [a1 _createFDRLocal];
  if (!v4)
  {
    uint64_t v9 = sub_23993FC14(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_2399419E8();
    }
    goto LABEL_14;
  }
  uint64_t v5 = AMFDRSealingManifestCopyInstanceForClass();
  if (!v5)
  {
    uint64_t v9 = sub_23993FC14(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_239941A1C();
    }
LABEL_14:

    uint64_t v6 = 0;
    goto LABEL_7;
  }
  uint64_t v6 = (void *)v5;
  if ((AMFDRDataCopyManifest() & 1) == 0)
  {
    uint64_t v7 = sub_23993FC14(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_239941A84();
    }
  }
LABEL_7:
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  return 0;
}

+ (BOOL)isDcSignedSealingManifest:(id *)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v45 = 0;
  memset(v44, 0, sizeof(v44));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  unint64_t v20 = 0;
  uint64_t v21 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&unk_239942BE0 length:3];
  uint64_t v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF MATCHES %@", @"FDR-SS-DC.*"];
  uint64_t v6 = +[CRFDRUtils getLocalSealingManifest];
  uint64_t v7 = v6;
  if (!v6)
  {
    v12 = 0;
    v16 = @"Cannot copy sealing manifest from device";
    goto LABEL_16;
  }
  id v8 = v6;
  [v8 bytes];
  [v8 length];
  uint64_t inited = Img4DecodeInitManifest();
  if (inited)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Failed to parse cert as img4; stat: %d", inited);
LABEL_14:
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    if (!v16)
    {
      LOBYTE(a3) = 0;
      v12 = 0;
      goto LABEL_9;
    }
    v12 = 0;
    goto LABEL_16;
  }
  uint64_t v10 = sub_23993FF04((unint64_t *)v44 + 1, &v20);
  if (v10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Failed to parse cert chain; stat: %d", v10);
    goto LABEL_14;
  }
  uint64_t v11 = +[CRFDRUtils getStringFromCert:WithTag:AndOID:](CRFDRUtils, "getStringFromCert:WithTag:AndOID:", v20, v21, 6, v4);
  v12 = v11;
  if (v11 && [v11 count])
  {
    sub_23993FC14(0);
    a3 = (id *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      $203840463D15D3E17BD93E376D41ABE6 v25 = v12;
      _os_log_impl(&dword_239937000, (os_log_t)a3, OS_LOG_TYPE_DEFAULT, "Parsed the following common names from cert in seal: %@", buf, 0xCu);
    }

    id v13 = [v12 filteredArrayUsingPredicate:v5];

    v14 = 0;
    LOBYTE(a3) = [v13 count] != 0;
    v12 = v13;
    goto LABEL_9;
  }
  v16 = @"Failed to parse cert common name from cert chain";
LABEL_16:
  int v17 = sub_23993FC14(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_239941AEC();
  }

  if (a3)
  {
    v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F08320];
    uint64_t v23 = v16;
    long long v19 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    *a3 = [v18 errorWithDomain:@"com.apple.corerepair" code:-42 userInfo:v19];

    LOBYTE(a3) = 0;
  }
  v14 = v16;
LABEL_9:

  return (char)a3;
}

+ (BOOL)isDcSignedDataClass:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v52 = 0;
  memset(v51, 0, sizeof(v51));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  unint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&unk_239942BE0 length:3];
  uint64_t v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF MATCHES %@", @"FDR-CA\\d{1,4}-ROOT-DC.*"];
  id v8 = +[CRFDRUtils getData:v5 instance:0];
  uint64_t v9 = v8;
  if (!v8)
  {
    [NSString stringWithFormat:@"Cannot copy %@ data from device", v5];
LABEL_15:
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    if (!v18)
    {
      LOBYTE(a4) = 0;
      v14 = 0;
      goto LABEL_9;
    }
    v14 = 0;
    goto LABEL_17;
  }
  id v10 = v8;
  [v10 bytes];
  [v10 length];
  uint64_t v11 = Img4DecodeInit();
  if (v11)
  {
    long long v19 = NSString;
    uint64_t v24 = v11;
    unint64_t v20 = @"Failed to parse cert as img4; stat: %d";
LABEL_14:
    objc_msgSend(v19, "stringWithFormat:", v20, v24);
    goto LABEL_15;
  }
  v12 = sub_23993FF04((unint64_t *)v51 + 1, &v25);
  if (v12)
  {
    long long v19 = NSString;
    uint64_t v24 = (uint64_t)v12;
    unint64_t v20 = @"Failed to parse cert chain; stat: %d";
    goto LABEL_14;
  }
  id v13 = +[CRFDRUtils getStringFromCert:WithTag:AndOID:](CRFDRUtils, "getStringFromCert:WithTag:AndOID:", v25, v26, 6, v6);
  v14 = v13;
  if (v13 && [v13 count])
  {
    sub_23993FC14(0);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v5;
      __int16 v31 = 2112;
      long long v32 = v14;
      _os_log_impl(&dword_239937000, (os_log_t)a4, OS_LOG_TYPE_DEFAULT, "Parsed the following common names from cert in %@: %@", buf, 0x16u);
    }

    int v15 = [v14 filteredArrayUsingPredicate:v7];

    v16 = 0;
    LOBYTE(a4) = [v15 count] != 0;
    v14 = v15;
    goto LABEL_9;
  }
  v18 = @"Failed to parse cert common name from cert chain";
LABEL_17:
  uint64_t v21 = sub_23993FC14(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_239941AEC();
  }

  if (a4)
  {
    uint64_t v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = *MEMORY[0x263F08320];
    long long v28 = v18;
    uint64_t v23 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    *a4 = [v22 errorWithDomain:@"com.apple.corerepair" code:-42 userInfo:v23];

    LOBYTE(a4) = 0;
  }
  v16 = v18;
LABEL_9:

  return (char)a4;
}

+ (BOOL)isDcSignedCombinedDataClass:(id)a3 error:(id *)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v53 = 0;
  memset(v52, 0, sizeof(v52));
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  unint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&unk_239942BE0 length:3];
  id v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF MATCHES %@", @"FDR-CA\\d{1,4}-ROOT-DC.*"];
  uint64_t v9 = [a1 _getManifestForDataClass:v6];
  id v10 = v9;
  if (!v9)
  {
    [NSString stringWithFormat:@"Cannot copy %@ manifest from device", v6];
LABEL_15:
    long long v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v17 = 0;
    if (!v19)
    {
      LOBYTE(a4) = 0;
      int v15 = 0;
      goto LABEL_9;
    }
    int v15 = 0;
    goto LABEL_17;
  }
  id v11 = v9;
  [v11 bytes];
  [v11 length];
  uint64_t inited = Img4DecodeInitManifest();
  if (inited)
  {
    unint64_t v20 = NSString;
    uint64_t v25 = inited;
    uint64_t v21 = @"Failed to parse cert as img4; stat: %d";
LABEL_14:
    objc_msgSend(v20, "stringWithFormat:", v21, v25);
    goto LABEL_15;
  }
  id v13 = sub_23993FF04((unint64_t *)v52 + 1, &v26);
  if (v13)
  {
    unint64_t v20 = NSString;
    uint64_t v25 = (uint64_t)v13;
    uint64_t v21 = @"Failed to parse cert chain; stat: %d";
    goto LABEL_14;
  }
  v14 = +[CRFDRUtils getStringFromCert:WithTag:AndOID:](CRFDRUtils, "getStringFromCert:WithTag:AndOID:", v26, v27, 6, v7);
  int v15 = v14;
  if (v14 && [v14 count])
  {
    sub_23993FC14(0);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v6;
      __int16 v32 = 2112;
      long long v33 = v15;
      _os_log_impl(&dword_239937000, (os_log_t)a4, OS_LOG_TYPE_DEFAULT, "Parsed the following common names from cert in %@: %@", buf, 0x16u);
    }

    v16 = [v15 filteredArrayUsingPredicate:v8];

    int v17 = 0;
    LOBYTE(a4) = [v16 count] != 0;
    int v15 = v16;
    goto LABEL_9;
  }
  long long v19 = @"Failed to parse cert common name from cert chain";
LABEL_17:
  uint64_t v22 = sub_23993FC14(0);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_239941AEC();
  }

  if (a4)
  {
    uint64_t v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F08320];
    long long v29 = v19;
    uint64_t v24 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    *a4 = [v23 errorWithDomain:@"com.apple.corerepair" code:-42 userInfo:v24];

    LOBYTE(a4) = 0;
  }
  int v17 = v19;
LABEL_9:

  return (char)a4;
}

+ (BOOL)isDcSignedComponent:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = @"SrvP";
  switch(a3)
  {
    case 1024:
      id v6 = @"vcrt";
      if (+[CRFDRUtils isDataClassSupported:@"vcrt"]) {
        goto LABEL_15;
      }
      id v6 = @"bcrt";
      goto LABEL_14;
    case 1025:
      id v6 = @"tcrt";
      goto LABEL_14;
    case 1026:
      id v6 = @"CmCl";
      goto LABEL_14;
    case 1027:
      id v6 = @"psd2";
      if (+[CRFDRUtils isDataClassSupported:@"psd2"]) {
        goto LABEL_15;
      }
      id v6 = @"prpc";
LABEL_14:
      if (+[CRFDRUtils isDataClassSupported:v6])
      {
LABEL_15:
        if ([(__CFString *)v6 isEqualToString:@"CmCl"])
        {
          BOOL v12 = +[CRFDRUtils isDcSignedCombinedDataClass:v6 error:a4];
        }
        else
        {
          if ([(__CFString *)v6 isEqualToString:@"SrvP"])
          {
            id v13 = +[CRFDRUtils isServicePartWithError:a4];
            v14 = v13;
            if (v13) {
              char v11 = [v13 isEqual:@"0"];
            }
            else {
              char v11 = 0;
            }

            goto LABEL_24;
          }
          BOOL v12 = +[CRFDRUtils isDcSignedDataClass:v6 error:a4];
        }
        char v11 = v12;
LABEL_24:
        id v10 = 0;
        goto LABEL_25;
      }
LABEL_10:
      uint64_t v7 = (void *)MEMORY[0x263F087E8];
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Component %d is not supported for authorized repair for this device", v5, *MEMORY[0x263F08320]);
      v17[0] = v8;
      uint64_t v9 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
      id v10 = [v7 errorWithDomain:@"com.apple.corerepair" code:-72 userInfo:v9];

      char v11 = 0;
      if (a4 && v10)
      {
        id v10 = v10;
        char v11 = 0;
        *a4 = v10;
      }
LABEL_25:

      return v11;
    case 1028:
      id v6 = @"hop0";
      goto LABEL_14;
    case 1029:
      goto LABEL_15;
    case 1030:
      id v6 = @"bCfg";
      if (!+[CRFDRUtils isDataClassSupported:@"bCfg"]) {
        goto LABEL_10;
      }
      goto LABEL_15;
    case 1032:
      id v6 = @"NBCl";
      goto LABEL_14;
    default:
      goto LABEL_10;
  }
}

+ (id)isServicePartWithError:(id *)a3
{
  v32[1] = *MEMORY[0x263EF8340];
  uint64_t v27 = 0;
  id v28 = 0;
  uint64_t v25 = 0;
  id v26 = 0;
  uint64_t v24 = 0;
  id v4 = objc_opt_new();
  uint64_t v5 = 0;
  id v6 = 0;
  uint64_t v7 = 0;
  id v8 = 0;
  uint64_t v9 = 0;
  if ([v4 isEANSupported])
  {
    if ([v4 readFDRDataFromEANWithDataClass:@"seal" outData:&v28 stripPadding:1])
    {
      if (v28)
      {
        id v10 = sub_23993FC14(0);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v23 = 0;
          _os_log_impl(&dword_239937000, v10, OS_LOG_TYPE_DEFAULT, "Local Sealing manifest fetch sucessful", v23, 2u);
        }

        int v11 = AMFDRSealingManifestCopyDataClassesInstancesAndProperties();
        id v8 = 0;
        uint64_t v5 = v24;
        if (v11 && (BOOL v12 = v27) != 0 && v26)
        {
          uint64_t v7 = 0;
          id v6 = 0;
          if (v25)
          {
            uint64_t v7 = v25;
            id v8 = v26;
            uint64_t v13 = [v26 count];
            if (v13 == [v7 count] && objc_msgSend(v12, "count"))
            {
              uint64_t v9 = [v12 objectForKeyedSubscript:@"SrvP"];
              id v6 = v12;
              goto LABEL_27;
            }
            id v6 = v12;
          }
        }
        else
        {
          uint64_t v7 = 0;
          id v6 = 0;
        }
        v18 = sub_23993FC14(1uLL);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_239941B88();
        }

        if (!v5)
        {
          long long v19 = (void *)MEMORY[0x263F087E8];
          uint64_t v29 = *MEMORY[0x263F08320];
          id v30 = @"DataInstances and Classes count mismatch";
          unint64_t v20 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
          uint64_t v5 = [v19 errorWithDomain:@"com.apple.corerepair" code:-28 userInfo:v20];
        }
        goto LABEL_26;
      }
      int v15 = sub_23993FC14(1uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_239941B54();
      }

      uint64_t v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = *MEMORY[0x263F08320];
      v32[0] = @"Local Sealing manifest fetch failed";
      int v17 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
      uint64_t v5 = [v16 errorWithDomain:@"com.apple.corerepair" code:-28 userInfo:v17];
    }
    else
    {
      v14 = sub_23993FC14(1uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_239941BBC();
      }

      uint64_t v5 = 0;
    }
    id v6 = 0;
    uint64_t v7 = 0;
    id v8 = 0;
LABEL_26:
    uint64_t v9 = 0;
  }
LABEL_27:
  if (a3) {
    *a3 = v5;
  }
  id v21 = v9;

  return v21;
}

+ (id)findUnsealedDataWithError:(id *)a3
{
  v33[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v22 = [MEMORY[0x263EFF9C0] set];
  id v23 = [MEMORY[0x263EFF9A0] dictionary];
  if (+[CRFDRUtils isDataClassSupported:@"FSCl"])
  {
    __int16 v32 = @"QueryPath";
    v33[0] = @"QueryPath_Straight";
    id v6 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
    uint64_t v7 = (void *)ZhuGeCopyValue();
    if (([v7 isEqualToString:@"ProvisionedUnknownKey"] & 1) != 0
      || [v7 isEqualToString:@"ProvisionedLockedUnknownKey"])
    {
      int v8 = [v7 isEqualToString:@"ProvisionedUnknownKey"];
      uint64_t v9 = sub_23993FC14(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = v8;
        _os_log_impl(&dword_239937000, v9, OS_LOG_TYPE_DEFAULT, "Skip reading unknown Mesa: %d", buf, 8u);
      }

      [v5 setObject:&unk_26ED1C2F8 forKey:@"SkipRecoverDataClasses"];
      [v22 addObjectsFromArray:&unk_26ED1C2F8];
    }
  }
  uint64_t v21 = [a1 getLocalSealingManifest];
  if (v21)
  {
    id v10 = 0;
    if (AMFDRSealingManifestCopyDataClassesInstancesAndProperties())
    {
      int v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v26 = *MEMORY[0x263F08320];
      uint64_t v27 = @"Number of data classes and instances mismatches";
      id v10 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      id v16 = [v15 errorWithDomain:@"com.apple.corerepair" code:-42 userInfo:v10];
    }
    else
    {
      BOOL v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = *MEMORY[0x263F08320];
      uint64_t v13 = [NSString stringWithFormat:@"Failed to decode sealing manifest: %@", 0];
      uint64_t v29 = v13;
      v14 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      id v16 = [v12 errorWithDomain:@"com.apple.corerepair" code:-28 userInfo:v14];
    }
  }
  else
  {
    int v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    uint64_t v31 = @"Failed to get local sealing manifest";
    id v10 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v16 = [v11 errorWithDomain:@"com.apple.corerepair" code:-28 userInfo:v10];
  }

  if (v16)
  {
    int v17 = sub_23993FC14(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_239941BF0(v16, v17);
    }

    v18 = (void *)v21;
    if (a3)
    {
      id v16 = v16;
      *a3 = v16;
    }
  }
  else
  {
    v18 = (void *)v21;
  }
  long long v19 = sub_23993FC14(0);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v23;
    _os_log_impl(&dword_239937000, v19, OS_LOG_TYPE_DEFAULT, "Unsealed: %@", buf, 0xCu);
  }

  AMSupportSafeRelease();
  return v23;
}

+ (id)findUnsealedDataWithKey:(id)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [MEMORY[0x263EFF8C0] array];
  [a1 _createFDRLocal];
  if (![&unk_26ED1C2E0 containsObject:v5])
  {
    uint64_t v7 = (void *)AMFDRSealingMapCopyMultiInstanceForClass();
    if (v7)
    {
      int v8 = AMFDRSealingManifestCopyMultiInstanceForClass();
      if (v8)
      {
        BOOL v12 = [MEMORY[0x263EFF9C0] setWithArray:v7];
        int v15 = [MEMORY[0x263EFF9C0] setWithArray:v8];
        goto LABEL_8;
      }
      v18 = sub_23993FC14(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_239941F1C();
      }
    }
    else
    {
      int v8 = sub_23993FC14(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_239941F90();
      }
    }
LABEL_22:

    BOOL v12 = 0;
    int v15 = 0;
    goto LABEL_23;
  }
  uint64_t v7 = (void *)AMFDRSealingMapCopyPropertyWithTag();
  if (!v7)
  {
    int v8 = sub_23993FC14(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_239941EA8();
    }
    goto LABEL_22;
  }
  int v8 = [a1 localManifestProperties];
  uint64_t v9 = [v8 objectForKeyedSubscript:v5];
  if (!v9)
  {
    int v17 = sub_23993FC14(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_239941E34();
    }

    goto LABEL_22;
  }
  id v10 = (void *)MEMORY[0x263EFF9C0];
  v25[0] = v7;
  int v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
  BOOL v12 = [v10 setWithArray:v11];

  uint64_t v13 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v24 = v9;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
  int v15 = [v13 setWithArray:v14];

LABEL_8:
  [v12 minusSet:v15];
  if (![v12 count]) {
    goto LABEL_24;
  }
  id v16 = sub_23993FC14(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v5;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl(&dword_239937000, v16, OS_LOG_TYPE_DEFAULT, "Unsealed %@: %@", buf, 0x16u);
  }

  [v12 allObjects];
  id v6 = v7 = v6;
LABEL_23:

LABEL_24:
  return v6;
}

+ (void)fixUpPseudoMSRk:(id)a3 mesaWithSCKey:(BOOL)a4
{
  BOOL v4 = a4;
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!+[CRFDRUtils isDataClassSupported:@"FSCl"]) {
    goto LABEL_15;
  }
  if (v4)
  {
    id v6 = sub_23993FC14(0);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    LOWORD(v18[0]) = 0;
    uint64_t v7 = "mesa unpaired";
  }
  else
  {
    int v8 = [v5 objectForKey:@"FSCl"];

    if (!v8) {
      goto LABEL_15;
    }
    id v6 = sub_23993FC14(0);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    LOWORD(v18[0]) = 0;
    uint64_t v7 = "mesa unsealed";
  }
  _os_log_impl(&dword_239937000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)v18, 2u);
LABEL_9:

  v18[0] = 0;
  uint64_t v9 = ZhuGeCopyValue();
  id v10 = (void *)v9;
  if (!v9 || v18[0])
  {
    int v11 = sub_23993FC14(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_239942004(v18, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  else
  {
    v19[0] = v9;
    int v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    [v5 setObject:v11 forKeyedSubscript:@"MSRk"];
  }

LABEL_15:
}

+ (BOOL)queryDeviceStagedSealedFromEAN:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v15 = 0;
  id v6 = objc_opt_new();
  uint64_t v7 = v6;
  if (v5)
  {
    if (([v6 isEANSupported] & 1) == 0)
    {
      uint64_t v9 = sub_23993FC14(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_239942150();
      }
      goto LABEL_25;
    }
    if ([v7 readFDRDataFromEANWithDataClass:@"seal" outData:&v15 stripPadding:1])BOOL v8 = v15 == 0; {
    else
    }
      BOOL v8 = 1;
    if (v8)
    {
      uint64_t v9 = sub_23993FC14(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_23994211C();
      }
      goto LABEL_25;
    }
  }
  else
  {
    id v15 = +[CRFDRUtils getLocalSealingManifest];
    if (!v15)
    {
      uint64_t v9 = sub_23993FC14(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_23994211C();
      }
      goto LABEL_25;
    }
  }
  if (AMFDRCreateTypeWithOptions())
  {
    AMFDRSetOption();
    char v10 = AMFDRDataCopySealingManifestProperty();
    int v11 = sub_23993FC14(0);
    uint64_t v9 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = 0;
        _os_log_impl(&dword_239937000, v9, OS_LOG_TYPE_DEFAULT, "SrvT: %@", buf, 0xCu);
      }

      goto LABEL_27;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_2399420E8();
    }
  }
  else
  {
    uint64_t v9 = sub_23993FC14(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_239942080();
    }
  }
LABEL_25:

  if (a4)
  {
    uint64_t v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F08320];
    uint64_t v17 = @"Query staged state failed";
    uint64_t v13 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    *a4 = [v12 errorWithDomain:@"com.apple.corerepair" code:-42 userInfo:v13];
  }
LABEL_27:
  AMSupportSafeRelease();

  return 0;
}

+ (id)localManifestProperties
{
  if ([a1 _createFDRLocal])
  {
    BOOL v2 = (void *)AMFDRSealingMapCopyManifestProperties();
    if (v2) {
      goto LABEL_9;
    }
    int v3 = sub_23993FC14(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_2399421B8();
    }
  }
  else
  {
    int v3 = sub_23993FC14(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_239942184();
    }
    BOOL v2 = 0;
  }

LABEL_9:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v2;
}

+ (id)extractComponentsAndIdentifiers:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v28 = (id)objc_opt_new();
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"([a-zA-Z0-9#]{4})-(.*$)" options:0 error:0];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    uint64_t v27 = v4;
    do
    {
      uint64_t v9 = 0;
      uint64_t v29 = v7;
      do
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v30 + 1) + 8 * v9);
        int v11 = objc_msgSend(v4, "firstMatchInString:options:range:", v10, 0, 0, objc_msgSend(v10, "length"));
        uint64_t v12 = sub_23993FC14(0);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = [v11 numberOfRanges];
          *(_DWORD *)buf = 134217984;
          uint64_t v35 = v13;
          _os_log_impl(&dword_239937000, v12, OS_LOG_TYPE_DEFAULT, "number of ranges:%ld", buf, 0xCu);
        }

        if (v11 && (unint64_t)[v11 numberOfRanges] >= 2)
        {
          uint64_t v14 = [v11 rangeAtIndex:1];
          uint64_t v16 = objc_msgSend(v10, "substringWithRange:", v14, v15);
          uint64_t v17 = [v11 rangeAtIndex:2];
          uint64_t v19 = objc_msgSend(v10, "substringWithRange:", v17, v18);
          uint64_t v20 = (void *)v19;
          if (v16) {
            BOOL v21 = v19 == 0;
          }
          else {
            BOOL v21 = 1;
          }
          if (!v21)
          {
            id v22 = v16;
            id v23 = objc_opt_new();
            uint64_t v24 = [v28 objectForKeyedSubscript:v22];
            [v23 addObjectsFromArray:v24];

            [v23 addObject:v20];
            id v25 = (void *)[v23 copy];
            [v28 setObject:v25 forKeyedSubscript:v22];

            BOOL v4 = v27;
            uint64_t v7 = v29;
          }
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v7);
  }

  return v28;
}

@end