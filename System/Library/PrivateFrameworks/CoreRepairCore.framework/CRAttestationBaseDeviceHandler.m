@interface CRAttestationBaseDeviceHandler
+ (id)getDeviceHandlerForProductType:(int)a3;
- (CRAttestationBaseDeviceHandler)init;
- (NSMutableDictionary)componentsMapping;
- (id)copyWithZone:(_NSZone *)a3;
- (void)challengeComponentsWith:(id)a3 withReply:(id)a4;
- (void)getStrongComponentsWithReply:(id)a3;
- (void)setComponentsMapping:(id)a3;
@end

@implementation CRAttestationBaseDeviceHandler

- (CRAttestationBaseDeviceHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRAttestationBaseDeviceHandler;
  v2 = [(CRAttestationBaseDeviceHandler *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    componentsMapping = v2->componentsMapping;
    v2->componentsMapping = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)challengeComponentsWith:(id)a3 withReply:(id)a4
{
  v45[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void, void *, void *))a4;
  dispatch_get_global_queue(21, 0);
  dispatch_queue_t queue = (dispatch_queue_t)objc_claimAutoreleasedReturnValue();
  dispatch_group_t group = dispatch_group_create();
  v37 = objc_opt_new();
  dispatch_queue_t v34 = dispatch_queue_create("serialQueues", 0);
  v11 = objc_msgSend_allKeys(self->componentsMapping, v8, v9, v10);
  v16 = objc_msgSend_getLocalSealingManifest(CRFDRUtils, v12, v13, v14);
  if (!v16)
  {
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v44 = *MEMORY[0x263F08320];
    v45[0] = @"Failed to get local sealing manifest";
    v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v15, (uint64_t)v45, (uint64_t)&v44, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v19, v20, @"com.apple.corerepair", -28, v31);
    v33 = LABEL_9:;
    goto LABEL_11;
  }
  CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!AMFDRCreateWithOptions())
  {
    v21 = handleForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_21FC682F4(v21);
    }

    v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v42 = *MEMORY[0x263F08320];
    v43 = @"Failed to create FDR object";
    v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)&v43, (uint64_t)&v42, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v22, v24, @"com.apple.corerepair", -32, v31);
    goto LABEL_9;
  }
  if (AMFDRSealingManifestCopyDataClassesInstancesAndProperties())
  {
    v30 = (void *)MEMORY[0x263F087E8];
    uint64_t v38 = *MEMORY[0x263F08320];
    v39 = @"Number of data classes and instances mismatches";
    v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v17, (uint64_t)&v39, (uint64_t)&v38, 1);
    v33 = objc_msgSend_errorWithDomain_code_userInfo_(v30, v32, @"com.apple.corerepair", -42, v31);
  }
  else
  {
    v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v40 = *MEMORY[0x263F08320];
    v26 = objc_msgSend_stringWithFormat_(NSString, v17, @"Failed to decode sealing manifest: %@", v18, 0);
    v41 = v26;
    v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)&v41, (uint64_t)&v40, 1);
    v33 = objc_msgSend_errorWithDomain_code_userInfo_(v25, v29, @"com.apple.corerepair", -28, v28);

    v31 = 0;
  }
LABEL_11:

  v7[2](v7, 0, v37, v33);
}

- (void)getStrongComponentsWithReply:(id)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, uint64_t, void *, void *))a3;
  v56 = objc_opt_new();
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v5 = self->componentsMapping;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v57, (uint64_t)v65, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v58;
    v54 = v4;
    obj = v5;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v58 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(self->componentsMapping, v8, v13, v9);
        uint64_t v18 = objc_msgSend_identifierBase64(v14, v15, v16, v17);
        if (!v18)
        {

LABEL_14:
          v46 = handleForCategory(0);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            sub_21FC68464(v13, v46);
          }

          v47 = (void *)MEMORY[0x263F087E8];
          uint64_t v63 = *MEMORY[0x263F08320];
          v50 = objc_msgSend_stringWithFormat_(NSString, v48, @"unable to get identifier:%@", v49, v13);
          v64 = v50;
          v52 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v51, (uint64_t)&v64, (uint64_t)&v63, 1);
          uint64_t v44 = objc_msgSend_errorWithDomain_code_userInfo_(v47, v53, @"com.apple.corerepair", -32, v52);

          uint64_t v45 = 0;
          v4 = v54;
          p_super = &obj->super.super;
          goto LABEL_17;
        }
        v21 = (void *)v18;
        v22 = objc_msgSend_objectForKeyedSubscript_(self->componentsMapping, v19, v13, v20);
        v26 = objc_msgSend_identifierBase64(v22, v23, v24, v25);
        uint64_t v30 = objc_msgSend_length(v26, v27, v28, v29);

        if (!v30) {
          goto LABEL_14;
        }
        v31 = [CRStrongComponent alloc];
        dispatch_queue_t v34 = objc_msgSend_objectForKeyedSubscript_(self->componentsMapping, v32, v13, v33);
        uint64_t v38 = objc_msgSend_identifierBase64(v34, v35, v36, v37);
        uint64_t v40 = objc_msgSend_initWithComponentType_identifier_fwVersion_(v31, v39, v13, (uint64_t)v38, 0);

        objc_msgSend_addObject_(v56, v41, (uint64_t)v40, v42);
      }
      v5 = obj;
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v57, (uint64_t)v65, 16);
      v4 = v54;
      if (v10) {
        continue;
      }
      break;
    }
  }

  p_super = handleForCategory(0);
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v62 = v56;
    _os_log_impl(&dword_21FBF2000, p_super, OS_LOG_TYPE_DEFAULT, "Stong Components:%@", buf, 0xCu);
  }
  uint64_t v44 = 0;
  uint64_t v45 = 1;
LABEL_17:

  v4[2](v4, v45, v56, v44);
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRAttestationBaseDeviceHandler);
}

- (NSMutableDictionary)componentsMapping
{
  return self->componentsMapping;
}

- (void)setComponentsMapping:(id)a3
{
}

- (void).cxx_destruct
{
}

@end