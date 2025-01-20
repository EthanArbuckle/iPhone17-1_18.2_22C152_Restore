@interface CRDaemonController
+ (BOOL)doLaunchControl:(id)a3 action:(id)a4;
+ (id)getAllowedListFromEntitlements:(id)a3;
+ (id)safeGetStringParam:(id)a3 key:(id)a4;
+ (void)controlWithParameters:(id)a3 withReply:(id)a4;
+ (void)getLibXPCInternalWithSymbol:(const char *)a3;
@end

@implementation CRDaemonController

+ (id)getAllowedListFromEntitlements:(id)a3
{
  v3 = (void *)MEMORY[0x263F08D68];
  id v4 = a3;
  v8 = objc_msgSend_currentConnection(v3, v5, v6, v7);
  v11 = objc_msgSend_valueForEntitlement_(v8, v9, (uint64_t)v4, v10);

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = (id)MEMORY[0x263EFFA68];
  }

  return v12;
}

+ (void)controlWithParameters:(id)a3 withReply:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  v8 = handleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v47 = 136315394;
    v48 = "+[CRDaemonController controlWithParameters:withReply:]";
    __int16 v49 = 2112;
    id v50 = v6;
    _os_log_impl(&dword_21FBF2000, v8, OS_LOG_TYPE_DEFAULT, "[%s] parameters: %@", (uint8_t *)&v47, 0x16u);
  }

  uint64_t v10 = objc_msgSend_safeGetStringParam_key_(a1, v9, (uint64_t)v6, @"action");
  v13 = v10;
  if (v10)
  {
    if ((objc_msgSend_isEqual_(v10, v11, @"load", v12) & 1) != 0
      || objc_msgSend_isEqual_(v13, v14, @"unload", v15))
    {
      v16 = objc_msgSend_getAllowedListFromEntitlements_(a1, v14, @"com.apple.private.corerepair.allow-job-control", v15);
      v20 = objc_msgSend_safeGetStringParam_key_(a1, v17, (uint64_t)v6, @"name");
      if (v20)
      {
        if (objc_msgSend_containsObject_(v16, v18, (uint64_t)v20, v19))
        {
          uint64_t v22 = objc_msgSend_doLaunchControl_action_(a1, v21, (uint64_t)v20, (uint64_t)v13);
LABEL_9:

          goto LABEL_10;
        }
        v45 = handleForCategory(0);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          sub_21FC62194();
        }
      }
      else
      {
        v45 = handleForCategory(0);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          sub_21FC62160();
        }
      }

      uint64_t v22 = 0;
      goto LABEL_9;
    }
    if (!objc_msgSend_isEqual_(v13, v14, @"writeDefaults", v15))
    {
      uint64_t v22 = 0;
      if (!v7) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    v16 = objc_msgSend_getAllowedListFromEntitlements_(a1, v23, @"com.apple.private.corerepair.allow-pref-access", v24);
    v20 = objc_msgSend_safeGetStringParam_key_(a1, v25, (uint64_t)v6, @"name");
    v27 = objc_msgSend_safeGetStringParam_key_(a1, v26, (uint64_t)v6, @"prefKey");
    v32 = objc_msgSend_objectForKeyedSubscript_(v6, v28, @"prefValue", v29);
    if (v20)
    {
      if (objc_msgSend_containsObject_(v16, v30, (uint64_t)v20, v31))
      {
        if (v27)
        {
          if (v32)
          {
            v36 = objc_msgSend_null(MEMORY[0x263EFF9D0], v33, v34, v35);

            if (v32 == v36)
            {

              v32 = 0;
            }
            id v37 = objc_alloc(MEMORY[0x263EFFA40]);
            v40 = objc_msgSend_initWithSuiteName_(v37, v38, (uint64_t)v20, v39);
            objc_msgSend_setObject_forKey_(v40, v41, (uint64_t)v32, (uint64_t)v27);
            objc_msgSend_synchronize(v40, v42, v43, v44);

            uint64_t v22 = 1;
            v32 = v40;
            goto LABEL_21;
          }
          v32 = handleForCategory(0);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            sub_21FC62264();
          }
LABEL_41:
          uint64_t v22 = 0;
LABEL_21:

          goto LABEL_9;
        }
        v46 = handleForCategory(0);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          sub_21FC62230();
        }
      }
      else
      {
        v46 = handleForCategory(0);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          sub_21FC62298();
        }
      }
    }
    else
    {
      v46 = handleForCategory(0);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_21FC621FC();
      }
    }

    goto LABEL_41;
  }
  v16 = handleForCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_21FC6212C();
  }
  uint64_t v22 = 0;
LABEL_10:

  if (v7) {
LABEL_11:
  }
    v7[2](v7, v22, 0);
LABEL_12:
}

+ (BOOL)doLaunchControl:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  uint64_t v10 = objc_msgSend_stringWithFormat_(NSString, v8, @"/System/Library/LaunchDaemons/%@.plist", v9, v6);
  LibXPCInternalWithSymbol = (void (*)(uint64_t, xpc_object_t, id *))objc_msgSend_getLibXPCInternalWithSymbol_(a1, v11, (uint64_t)"_xpc_domain_routine", v12);
  uint64_t v16 = objc_msgSend_getLibXPCInternalWithSymbol_(a1, v14, (uint64_t)"xpc_release", v15);
  if (!LibXPCInternalWithSymbol || (uint64_t v19 = (void (*)(id))v16) == 0)
  {
    uint64_t v35 = handleForCategory(0);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_21FC62300();
    }
    goto LABEL_17;
  }
  char isEqualToString = objc_msgSend_isEqualToString_(v7, v17, @"load", v18);
  if (isEqualToString)
  {
    uint64_t v23 = 800;
    uint64_t v24 = "enable";
    goto LABEL_7;
  }
  if ((objc_msgSend_isEqualToString_(v7, v20, @"unload", v21) & 1) == 0)
  {
    uint64_t v35 = handleForCategory(0);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_21FC62334();
    }
LABEL_17:

    uint64_t v34 = 0;
    xpc_object_t v26 = 0;
    xpc_object_t v25 = 0;
    id v32 = 0;
    goto LABEL_18;
  }
  uint64_t v23 = 801;
  uint64_t v24 = "disable";
LABEL_7:
  xpc_object_t v25 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v25, "type", 7uLL);
  xpc_dictionary_set_uint64(v25, "handle", 0);
  xpc_dictionary_set_BOOL(v25, v24, 0);
  xpc_dictionary_set_BOOL(v25, "legacy-load", 1);
  xpc_dictionary_set_BOOL(v25, "force", 1);
  xpc_dictionary_set_BOOL(v25, "by-cli", 1);
  xpc_object_t v26 = xpc_array_create(0, 0);
  id v27 = v10;
  uint64_t v31 = (const char *)objc_msgSend_UTF8String(v27, v28, v29, v30);
  xpc_array_set_string(v26, 0xFFFFFFFFFFFFFFFFLL, v31);
  xpc_dictionary_set_value(v25, "paths", v26);
  if ((isEqualToString & 1) == 0) {
    xpc_dictionary_set_BOOL(v25, "no-einprogress", 1);
  }
  id v40 = 0;
  LibXPCInternalWithSymbol(v23, v25, &v40);
  id v32 = v40;
  v33 = xpc_dictionary_get_dictionary(v32, "errors");
  uint64_t v34 = v33;
  if (v33 && xpc_dictionary_get_count(v33))
  {
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = sub_21FC2709C;
    applier[3] = &unk_26452AA88;
    applier[4] = &v41;
    char v39 = isEqualToString;
    xpc_dictionary_apply(v34, applier);
    if (!v32) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  *((unsigned char *)v42 + 24) = 1;
  if (v32) {
LABEL_14:
  }
    v19(v32);
LABEL_18:
  char v36 = *((unsigned char *)v42 + 24);

  _Block_object_dispose(&v41, 8);
  return v36;
}

+ (void)getLibXPCInternalWithSymbol:(const char *)a3
{
  if (qword_267EF81F0 != -1) {
    dispatch_once(&qword_267EF81F0, &unk_26D157888);
  }
  if (qword_267EF81F8)
  {
    result = dlsym((void *)qword_267EF81F8, a3);
    if (result) {
      return result;
    }
    v5 = handleForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_21FC624A0();
    }
  }
  else
  {
    v5 = handleForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_21FC6246C();
    }
  }

  return 0;
}

+ (id)safeGetStringParam:(id)a3 key:(id)a4
{
  id v4 = 0;
  if (a3)
  {
    if (a4)
    {
      id v4 = objc_msgSend_objectForKeyedSubscript_(a3, a2, (uint64_t)a4, (uint64_t)a4);
      if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || !objc_msgSend_length(v4, v5, v6, v7))
      {

        id v4 = 0;
      }
    }
  }
  return v4;
}

@end