@interface CRChassisController
- (BOOL)checkRepairEnvironment;
- (BOOL)shouldIgnorePatching:(id)a3;
- (id)diffWithSealed:(id)a3 live:(id)a4;
- (id)getAndVerifyDataInstance:(id)a3;
- (id)getDataPayloadDictWithClass:(id)a3 instance:(id)a4;
- (id)getLiveChMf;
- (id)getOSEnvironment;
- (id)overrideFromNVRam:(id)a3;
- (id)overrideParameters:(id)a3;
- (void)replyWithError:(id)a3 reply:(id)a4;
- (void)replyWithMessage:(id)a3 status:(id)a4 results:(id)a5 reply:(id)a6;
- (void)seal:(id)a3 withReply:(id)a4;
@end

@implementation CRChassisController

- (void)seal:(id)a3 withReply:(id)a4
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_checkRepairEnvironment(self, v8, v9, v10))
  {
    v13 = objc_msgSend_overrideParameters_(self, v11, (uint64_t)v6, v12);
    v17 = objc_msgSend_mutableCopy(v13, v14, v15, v16);

    uint64_t v20 = objc_msgSend_getAndVerifyDataInstance_(self, v18, @"ChMf", v19);
    if (v20)
    {
      v22 = (void *)v20;
      uint64_t v23 = objc_msgSend_getDataPayloadDictWithClass_instance_(self, v21, @"ChMf", v20);
      if (v23)
      {
        v25 = (void *)v23;
        v26 = handleForCategory(0);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v73 = v25;
          _os_log_impl(&dword_21FBF2000, v26, OS_LOG_TYPE_DEFAULT, "Sealed system manifest %@", buf, 0xCu);
        }

        uint64_t v30 = objc_msgSend_getLiveChMf(self, v27, v28, v29);
        if (v30)
        {
          v32 = (void *)v30;
          v33 = handleForCategory(0);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v73 = v32;
            _os_log_impl(&dword_21FBF2000, v33, OS_LOG_TYPE_DEFAULT, "Live system manifest %@", buf, 0xCu);
          }

          v35 = objc_msgSend_diffWithSealed_live_(self, v34, (uint64_t)v25, (uint64_t)v32);
          v39 = v35;
          if (v35 && objc_msgSend_count(v35, v36, v37, v38))
          {
            v40 = (void *)MGCopyAnswer();
            objc_msgSend_setObject_forKeyedSubscript_(v17, v41, (uint64_t)v40, @"KGBSerialNumber");

            objc_msgSend_setObject_forKeyedSubscript_(v17, v42, (uint64_t)&unk_26D1633E0, @"patchDataClasses");
            v71 = v22;
            v44 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v43, (uint64_t)&v71, 1);
            objc_msgSend_setObject_forKeyedSubscript_(v17, v45, (uint64_t)v44, @"patchDataInstances");

            v70 = v39;
            v47 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v46, (uint64_t)&v70, 1);
            objc_msgSend_setObject_forKeyedSubscript_(v17, v48, (uint64_t)v47, @"patchValues");

            objc_msgSend_setObject_forKeyedSubscript_(v17, v49, MEMORY[0x263EFFA88], @"doSeal");
            id v50 = objc_alloc(MEMORY[0x263F08D68]);
            v52 = objc_msgSend_initWithMachServiceName_options_(v50, v51, @"com.apple.corerepair", 0);
            v55 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v53, (uint64_t)&unk_26D168200, v54);
            objc_msgSend_setRemoteObjectInterface_(v52, v56, (uint64_t)v55, v57);

            objc_msgSend_resume(v52, v58, v59, v60);
            v64 = objc_msgSend_remoteObjectProxy(v52, v61, v62, v63);
            v67[0] = MEMORY[0x263EF8330];
            v67[1] = 3221225472;
            v67[2] = sub_21FBF44EC;
            v67[3] = &unk_26452A520;
            v67[4] = self;
            id v68 = v52;
            id v69 = v7;
            id v65 = v52;
            objc_msgSend_seal_withReply_(v64, v66, (uint64_t)v17, (uint64_t)v67);
          }
          else
          {
            objc_msgSend_replyWithMessage_status_results_reply_(self, v36, @"Nothing to patch", (uint64_t)&unk_26D1631B8, 0, v7);
          }
        }
        else
        {
          objc_msgSend_replyWithError_reply_(self, v31, @"Failed to get live system manifest", (uint64_t)v7);
        }
      }
      else
      {
        objc_msgSend_replyWithError_reply_(self, v24, @"Failed to get sealed system manifest", (uint64_t)v7);
      }
    }
    else
    {
      objc_msgSend_replyWithError_reply_(self, v21, @"Failed to get data instance", (uint64_t)v7);
    }
  }
  else
  {
    objc_msgSend_replyWithError_reply_(self, v11, @"Not supported under current environment", (uint64_t)v7);
  }
}

- (void)replyWithError:(id)a3 reply:(id)a4
{
}

- (void)replyWithMessage:(id)a3 status:(id)a4 results:(id)a5 reply:(id)a6
{
  v21[3] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v15 = (void (**)(id, void *))a6;
  v20[0] = @"status";
  uint64_t v16 = v10;
  if (!v10)
  {
    uint64_t v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v13, v14);
  }
  v21[0] = v16;
  v20[1] = @"description";
  v17 = v9;
  if (!v9)
  {
    v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v13, v14);
  }
  v21[1] = v17;
  v20[2] = @"results";
  v18 = v11;
  if (!v11)
  {
    v18 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v13, v14);
  }
  v21[2] = v18;
  uint64_t v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)v21, (uint64_t)v20, 3);
  v15[2](v15, v19);

  if (v11)
  {
    if (v9) {
      goto LABEL_9;
    }
LABEL_12:

    if (v10) {
      goto LABEL_10;
    }
LABEL_13:

    goto LABEL_10;
  }

  if (!v9) {
    goto LABEL_12;
  }
LABEL_9:
  if (!v10) {
    goto LABEL_13;
  }
LABEL_10:
}

- (id)overrideParameters:(id)a3
{
  id v4 = a3;
  v8 = v4;
  if (v4)
  {
    id v9 = objc_msgSend_mutableCopy(v4, v5, v6, v7);
  }
  else
  {
    id v9 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v5, v6, v7);
  }
  uint64_t v12 = v9;
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"CAURL", v11);

  if (!v13) {
    objc_msgSend_setObject_forKeyedSubscript_(v12, v14, @"https://gg.apple.com", @"CAURL");
  }
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v12, v14, @"DSURL", v15);

  if (!v16) {
    objc_msgSend_setObject_forKeyedSubscript_(v12, v17, @"https://skl.apple.com", @"DSURL");
  }
  uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v12, v17, @"TrustObjectURL", v18);

  if (!v19) {
    objc_msgSend_setObject_forKeyedSubscript_(v12, v20, @"http://gg.apple.com/fdrtrustobject", @"TrustObjectURL");
  }
  v22 = objc_msgSend_objectForKeyedSubscript_(v12, v20, @"SealingURL", v21);

  if (!v22) {
    objc_msgSend_setObject_forKeyedSubscript_(v12, v23, @"https://ig.apple.com", @"SealingURL");
  }
  if (os_variant_has_internal_content())
  {
    objc_msgSend_overrideFromNVRam_(self, v24, (uint64_t)v12, v25);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v26 = v12;
  }
  v27 = v26;

  return v27;
}

- (id)overrideFromNVRam:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v45 = 0;
  v5 = objc_msgSend_readNVRAMValueForKey_error_(CRNVRAMController, v4, @"corerepair-override", (uint64_t)&v45);
  id v6 = v45;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    id v44 = 0;
    uint64_t v12 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v7, (uint64_t)v5, 4, &v44);
    id v13 = v44;
    id v9 = v13;
    if (v12) {
      BOOL v14 = v13 == 0;
    }
    else {
      BOOL v14 = 0;
    }
    if (!v14)
    {
      uint64_t v15 = handleForCategory(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_21FC5B834((uint64_t)v9, v15);
      }
    }
    uint64_t v16 = handleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v12;
      _os_log_impl(&dword_21FBF2000, v16, OS_LOG_TYPE_DEFAULT, "nvram overriede: %@", buf, 0xCu);
    }

    if (v3)
    {
      uint64_t v20 = objc_msgSend_mutableCopy(v3, v17, v18, v19);
    }
    else
    {
      uint64_t v20 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v17, v18, v19);
    }
    id v11 = (id)v20;
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v12, v21, @"CAURL", v22);

    if (v23)
    {
      id v26 = objc_msgSend_objectForKeyedSubscript_(v12, v24, @"CAURL", v25);
      objc_msgSend_setObject_forKeyedSubscript_(v11, v27, (uint64_t)v26, @"CAURL");
    }
    uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v12, v24, @"DSURL", v25);

    if (v28)
    {
      v31 = objc_msgSend_objectForKeyedSubscript_(v12, v29, @"DSURL", v30);
      objc_msgSend_setObject_forKeyedSubscript_(v11, v32, (uint64_t)v31, @"DSURL");
    }
    v33 = objc_msgSend_objectForKeyedSubscript_(v12, v29, @"TrustObjectURL", v30);

    if (v33)
    {
      v36 = objc_msgSend_objectForKeyedSubscript_(v12, v34, @"TrustObjectURL", v35);
      objc_msgSend_setObject_forKeyedSubscript_(v11, v37, (uint64_t)v36, @"TrustObjectURL");
    }
    uint64_t v38 = objc_msgSend_objectForKeyedSubscript_(v12, v34, @"SealingURL", v35);

    if (v38)
    {
      v41 = objc_msgSend_objectForKeyedSubscript_(v12, v39, @"SealingURL", v40);
      objc_msgSend_setObject_forKeyedSubscript_(v11, v42, (uint64_t)v41, @"SealingURL");
    }
  }
  else
  {
    id v9 = v6;
    id v10 = handleForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v9;
      _os_log_impl(&dword_21FBF2000, v10, OS_LOG_TYPE_DEFAULT, "No nvram override: %@", buf, 0xCu);
    }

    id v11 = v3;
  }

  return v11;
}

- (id)diffWithSealed:(id)a3 live:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v7, v8, v9);
  id v35 = (id)objc_claimAutoreleasedReturnValue();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v10 = v5;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v37, (uint64_t)v45, 16);
  if (v12)
  {
    uint64_t v15 = v12;
    uint64_t v16 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(v10);
        }
        uint64_t v18 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v10, v13, v18, v14);
        uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v6, v20, v18, v21);
        if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            if (objc_msgSend_isEqualToData_(v19, v23, (uint64_t)v22, v24)) {
              goto LABEL_23;
            }
            uint64_t v25 = handleForCategory(0);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v42 = v18;
              _os_log_impl(&dword_21FBF2000, v25, OS_LOG_TYPE_DEFAULT, "Found diff values of %@", buf, 0xCu);
            }

            if (objc_msgSend_shouldIgnorePatching_(self, v26, v18, v27))
            {
              uint64_t v30 = handleForCategory(0);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v42 = v18;
                _os_log_impl(&dword_21FBF2000, v30, OS_LOG_TYPE_DEFAULT, "Ignore %@", buf, 0xCu);
              }
            }
            else
            {
              uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v6, v28, v18, v29);
              objc_msgSend_setObject_forKeyedSubscript_(v35, v33, (uint64_t)v30, v18);
            }
          }
          else
          {
            uint64_t v30 = handleForCategory(0);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v42 = v18;
              __int16 v43 = 2112;
              id v44 = v22;
              v31 = v30;
              v32 = "Invalid type of %@ in live data: %@";
              goto LABEL_20;
            }
          }
        }
        else
        {
          uint64_t v30 = handleForCategory(0);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v42 = v18;
            __int16 v43 = 2112;
            id v44 = v19;
            v31 = v30;
            v32 = "Invalid type of %@ in sealed data: %@";
LABEL_20:
            _os_log_error_impl(&dword_21FBF2000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x16u);
          }
        }

LABEL_23:
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v37, (uint64_t)v45, 16);
    }
    while (v15);
  }

  return v35;
}

- (BOOL)shouldIgnorePatching:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v12 = -1281988531;
  BOOL v10 = MGIsDeviceOfType()
     && ((objc_msgSend_isEqualToString_(v3, v4, @"BM05", v5, 0xD4C83437A3FD0C4FLL, 0x2B927B663C22D954, v12, v13) & 1) != 0|| objc_msgSend_hasPrefix_(v3, v6, @"N", v7)&& (objc_msgSend_hasSuffix_(v3, v8, @"4", v9) & 1) != 0);

  return v10;
}

- (id)getLiveChMf
{
  if (copyFdrBlob())
  {
    v2 = handleForCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_21FC5B8AC(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 0;
}

- (id)getAndVerifyDataInstance:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = (void *)AMFDRSealingMapCopyInstanceForClass();
  uint64_t v5 = handleForCategory(0);
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v3;
      __int16 v26 = 2112;
      uint64_t v27 = v4;
      _os_log_impl(&dword_21FBF2000, v6, OS_LOG_TYPE_DEFAULT, "Instance of %@ from sealing map: %@", buf, 0x16u);
    }

    uint64_t v7 = (void *)AMFDRSealingManifestCopyInstanceForClass();
    uint64_t v8 = handleForCategory(0);
    uint64_t v6 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v25 = v3;
        __int16 v26 = 2112;
        uint64_t v27 = v7;
        _os_log_impl(&dword_21FBF2000, v6, OS_LOG_TYPE_DEFAULT, "Instance of %@ from sealing manifest: %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      sub_21FC5B91C(v6, v17, v18, v19, v20, v21, v22, v23);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_21FC5B8E4(v6, v10, v11, v12, v13, v14, v15, v16);
    }
    uint64_t v7 = 0;
  }

  AMSupportSafeRelease();
  return v7;
}

- (id)getDataPayloadDictWithClass:(id)a3 instance:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  uint64_t v16 = @"DataStore";
  v17[0] = @"Local";
  uint64_t v5 = NSDictionary;
  id v6 = a4;
  id v7 = a3;
  uint64_t v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v5, v8, (uint64_t)v17, (uint64_t)&v16, 1);
  uint64_t v10 = (void *)AMFDRSealingMapCopyLocalDict();

  if (v10) {
    BOOL v11 = v15 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    uint64_t v13 = handleForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_21FC5B954(&v15, v13);
    }
  }
  AMSupportSafeRelease();

  return v10;
}

- (BOOL)checkRepairEnvironment
{
  uint64_t v4 = objc_msgSend_getOSEnvironment(self, a2, v2, v3);
  char isEqualToString = objc_msgSend_isEqualToString_(v4, v5, @"repair", v6);

  return isEqualToString;
}

- (id)getOSEnvironment
{
  io_registry_entry_t v2 = IORegistryEntryFromPath(*MEMORY[0x263F0EC88], "IODeviceTree:/chosen");
  if (v2)
  {
    io_object_t v3 = v2;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v2, @"osenvironment", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    uint64_t v5 = CFProperty;
    if (CFProperty)
    {
      id v6 = CFProperty;
      uint64_t v10 = (const char *)objc_msgSend_bytes(v6, v7, v8, v9);
      size_t v14 = objc_msgSend_length(v6, v11, v12, v13);
      size_t v15 = strnlen(v10, v14);
      id v16 = [NSString alloc];
      id v17 = v6;
      uint64_t v21 = objc_msgSend_bytes(v17, v18, v19, v20);
      uint64_t v23 = objc_msgSend_initWithBytes_length_encoding_(v16, v22, v21, v15, 1);
    }
    else
    {
      uint64_t v23 = 0;
    }
    IOObjectRelease(v3);
  }
  else
  {
    uint64_t v23 = 0;
  }
  return v23;
}

@end