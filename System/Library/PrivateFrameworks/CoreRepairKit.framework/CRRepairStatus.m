@interface CRRepairStatus
+ (BOOL)hasHadAuthorizedRepair;
+ (BOOL)hasHadAuthorizedRepairForComponent:(unint64_t)a3;
+ (BOOL)isDeviceStagedSealed;
+ (BOOL)isVeridianFWUpdateRequired;
+ (BOOL)isVeridianFWUpdateRequiredLite;
+ (id)_wasRepaired;
+ (id)_wasRepairedWithCombinedDataClass:(id)a3;
+ (id)_wasRepairedWithDataClass:(id)a3;
+ (id)_wasRepairedWithSysCfg:(id)a3;
+ (id)getLocalSealingManifest;
+ (id)getSsrBootIntentWithError:(id *)a3;
+ (id)getVeridianFWVersionInfo;
+ (id)isServicePartWithError:(id *)a3;
@end

@implementation CRRepairStatus

+ (BOOL)hasHadAuthorizedRepair
{
  v4 = objc_msgSend__wasRepaired(CRRepairStatus, a2, v2, v3);
  v8 = v4;
  if (v4) {
    BOOL v9 = objc_msgSend_intValue(v4, v5, v6, v7) != 0;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)hasHadAuthorizedRepairForComponent:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      v5 = @"vcrt";
      if (objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E4F5CD58], a2, @"vcrt", v3)) {
        goto LABEL_14;
      }
      v5 = @"bcrt";
      char isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E4F5CD58], v6, @"bcrt", v7);
      goto LABEL_13;
    case 1uLL:
      v5 = @"tcrt";
      char isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E4F5CD58], a2, @"tcrt", v3);
      goto LABEL_13;
    case 2uLL:
      v5 = @"CmCl";
      char isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E4F5CD58], a2, @"CmCl", v3);
      goto LABEL_13;
    case 5uLL:
      v5 = @"psd2";
      if (objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E4F5CD58], a2, @"psd2", v3)) {
        goto LABEL_14;
      }
      v5 = @"prpc";
      char isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E4F5CD58], v6, @"prpc", v7);
LABEL_13:
      if ((isFDRDataClassSupported & 1) == 0)
      {
LABEL_17:
        v16 = handleForCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1D9673F7C(a3, v16, v17, v18, v19, v20, v21, v22);
        }
        BOOL v23 = 0;
        goto LABEL_26;
      }
LABEL_14:
      int isEqualToString = objc_msgSend_isEqualToString_(v5, v6, @"CmCl", v7);
LABEL_15:
      if (isEqualToString)
      {
        uint64_t v12 = objc_msgSend__wasRepairedWithCombinedDataClass_(CRRepairStatus, v10, (uint64_t)v5, v11);
      }
      else
      {
        if (objc_msgSend_isEqualToString_(v5, v10, @"SrvP", v11))
        {
          v26 = objc_msgSend_isServicePartWithError_(CRRepairStatus, v24, 0, v25);
          v29 = v26;
          v30 = NSNumber;
          if (v26)
          {
            uint64_t isEqual = objc_msgSend_isEqual_(v26, v27, @"0", v28);
            objc_msgSend_numberWithBool_(v30, v32, isEqual, v33);
          }
          else
          {
            objc_msgSend_numberWithBool_(NSNumber, v27, 0, v28);
          v16 = };

          if (v16) {
            goto LABEL_25;
          }
          return 0;
        }
        uint64_t v12 = objc_msgSend__wasRepairedWithDataClass_(CRRepairStatus, v24, (uint64_t)v5, v25);
      }
      v16 = v12;
      if (v12)
      {
LABEL_25:
        BOOL v23 = objc_msgSend_intValue(v16, v13, v14, v15) != 0;
LABEL_26:

        return v23;
      }
      return 0;
    case 6uLL:
      v5 = @"hop0";
      char isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E4F5CD58], a2, @"hop0", v3);
      goto LABEL_13;
    case 9uLL:
      v5 = @"bCfg";
      char isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E4F5CD58], a2, @"bCfg", v3);
      goto LABEL_13;
    case 0xBuLL:
      v5 = @"NBCl";
      char isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E4F5CD58], a2, @"NBCl", v3);
      goto LABEL_13;
    default:
      if (a3 - 7 > 1) {
        goto LABEL_17;
      }
      v5 = @"SrvP";
      int isEqualToString = objc_msgSend_isEqualToString_(@"SrvP", a2, @"CmCl", v3);
      goto LABEL_15;
  }
}

+ (id)getLocalSealingManifest
{
  return (id)objc_msgSend_getLocalSealingManifest(CRFDRUtils, a2, v2, v3);
}

+ (id)_wasRepairedWithSysCfg:(id)a3
{
  id v3 = a3;
  CFTypeRef cf = 0;
  v5 = (void *)ZhuGeCopyValue();
  if (v5) {
    BOOL v6 = cf == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
    uint64_t v7 = handleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1D9673FE8((uint64_t)&cf, v7, v8, v9, v10, v11, v12, v13);
    }
    uint64_t isEqual = 0;
    uint64_t v15 = 0;
    v16 = 0;
    id v17 = 0;
    goto LABEL_20;
  }
  id v53 = 0;
  uint64_t v7 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v4, (uint64_t)v5, 4, &v53);
  id v17 = v53;
  if (!v7)
  {
    uint64_t v7 = handleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1D9674058(v7, v38, v39, v40, v41, v42, v43, v44);
    }
    goto LABEL_30;
  }
  uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v7, v18, (uint64_t)v3, v19);
  if (!v20)
  {
    v45 = handleForCategory();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_1D9674090((uint64_t)v3, v45, v46, v47, v48, v49, v50, v51);
    }

LABEL_30:
    uint64_t isEqual = 0;
    uint64_t v15 = 0;
    v16 = 0;
    goto LABEL_20;
  }
  v16 = (void *)v20;
  uint64_t v21 = (void *)MGCopyAnswer();
  uint64_t v25 = v21;
  if (v21)
  {
    uint64_t v15 = objc_msgSend_SHA256DigestString(v21, v22, v23, v24);
  }
  else
  {
    v26 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v22, (uint64_t)&stru_1F338B938, 0);
    uint64_t v15 = objc_msgSend_SHA256DigestString(v26, v27, v28, v29);
  }
  v30 = handleForCategory();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
    sub_1D96740FC((uint64_t)v15, (uint64_t)v16, v30);
  }

  uint64_t isEqual = objc_msgSend_isEqual_(v15, v31, (uint64_t)v16, v32);
  if (isEqual)
  {
    uint64_t v33 = handleForCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v52 = 0;
      _os_log_impl(&dword_1D9666000, v33, OS_LOG_TYPE_DEFAULT, "Repair status exist and digest match current", v52, 2u);
    }
  }
LABEL_20:

  if (cf) {
    CFRelease(cf);
  }
  v36 = objc_msgSend_numberWithBool_(NSNumber, v34, isEqual, v35);

  return v36;
}

+ (id)_wasRepairedWithCombinedDataClass:(id)a3
{
  uint64_t v8 = 0;
  uint64_t isDcSignedCombinedDataClass_error = objc_msgSend_isDcSignedCombinedDataClass_error_(CRFDRUtils, a2, (uint64_t)a3, (uint64_t)&v8);
  BOOL v6 = 0;
  if (!v8)
  {
    BOOL v6 = objc_msgSend_numberWithBool_(NSNumber, v3, isDcSignedCombinedDataClass_error, v5);
  }
  return v6;
}

+ (id)_wasRepairedWithDataClass:(id)a3
{
  uint64_t v8 = 0;
  uint64_t isDcSignedDataClass_error = objc_msgSend_isDcSignedDataClass_error_(CRFDRUtils, a2, (uint64_t)a3, (uint64_t)&v8);
  BOOL v6 = 0;
  if (!v8)
  {
    BOOL v6 = objc_msgSend_numberWithBool_(NSNumber, v3, isDcSignedDataClass_error, v5);
  }
  return v6;
}

+ (id)_wasRepaired
{
  uint64_t v8 = 0;
  uint64_t isDcSignedSealingManifest = objc_msgSend_isDcSignedSealingManifest_(CRFDRUtils, a2, (uint64_t)&v8, v2);
  BOOL v6 = 0;
  if (!v8)
  {
    BOOL v6 = objc_msgSend_numberWithBool_(NSNumber, v3, isDcSignedSealingManifest, v5);
  }
  return v6;
}

+ (BOOL)isVeridianFWUpdateRequired
{
  return ((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1F4181798])(CRRepairStatusLite, sel_isVeridianFWUpdateRequired);
}

+ (BOOL)isVeridianFWUpdateRequiredLite
{
  return ((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1F4181798])(CRRepairStatusLite, sel_isVeridianFWUpdateRequiredLite);
}

+ (id)isServicePartWithError:(id *)a3
{
  return (id)objc_msgSend_isServicePartWithError_(CRFDRUtils, a2, (uint64_t)a3, v3);
}

+ (id)getVeridianFWVersionInfo
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  if (!MEMORY[0x1E4FBD3A8] || BC__getInfo())
  {
    uint64_t v19 = handleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1D9674184(v19, v20, v21, v22, v23, v24, v25, v26);
    }
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = objc_opt_new();
    uint64_t v5 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v3, v30, v4);
    objc_msgSend_setObject_forKeyedSubscript_(v2, v6, (uint64_t)v5, @"Firmware");

    uint64_t v9 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v7, DWORD1(v30), v8);
    objc_msgSend_setObject_forKeyedSubscript_(v2, v10, (uint64_t)v9, @"Configuration");

    uint64_t v13 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v11, DWORD2(v30), v12);
    objc_msgSend_setObject_forKeyedSubscript_(v2, v14, (uint64_t)v13, @"DNVDSector1");

    id v17 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v15, HIDWORD(v30), v16);
    objc_msgSend_setObject_forKeyedSubscript_(v2, v18, (uint64_t)v17, @"DNVDSector2");

    uint64_t v19 = handleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412290;
      uint64_t v29 = v2;
      _os_log_impl(&dword_1D9666000, v19, OS_LOG_TYPE_DEFAULT, " versiondict is:%@", (uint8_t *)&v28, 0xCu);
    }
  }

  return v2;
}

+ (id)getSsrBootIntentWithError:(id *)a3
{
  return (id)((uint64_t (*)(__objc2_class *, char *, id *))MEMORY[0x1F4181798])(CRRepairStatusLite, sel_getSsrBootIntentWithError_, a3);
}

+ (BOOL)isDeviceStagedSealed
{
  return ((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1F4181798])(CRRepairStatusLite, sel_isDeviceStagedSealed);
}

@end