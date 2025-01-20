@interface CRPatchUtils
+ (id)decodePatchItems:(id)a3;
+ (id)encodePatchItems:(id)a3 dataInstance:(id)a4 subCCDict:(id)a5;
@end

@implementation CRPatchUtils

+ (id)encodePatchItems:(id)a3 dataInstance:(id)a4 subCCDict:(id)a5
{
  v23[1] = *MEMORY[0x263EF8340];
  id v7 = a5;
  v10 = objc_msgSend_stringWithFormat_(NSString, v8, @"%@-%@", v9, a3, a4);
  v22 = v10;
  v23[0] = v7;
  v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, (uint64_t)v23, (uint64_t)&v22, 1);
  id v21 = 0;
  v14 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x263F08AC0], v13, (uint64_t)v12, 100, 0, &v21);
  id v17 = v21;
  if (v17)
  {
    v18 = handleForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_21FC61EA4((uint64_t)v17, v18);
    }

    v19 = 0;
  }
  else
  {
    v19 = objc_msgSend_base64EncodedStringWithOptions_(v14, v15, 0, v16);
  }

  return v19;
}

+ (id)decodePatchItems:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = v3;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v32, (uint64_t)v38, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    id obj = v5;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        id v12 = objc_alloc(MEMORY[0x263EFF8F8]);
        uint64_t v14 = objc_msgSend_initWithBase64EncodedString_options_(v12, v13, v11, 0);
        if (!v14)
        {
          uint64_t v16 = handleForCategory(0);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_21FC61F1C(v16);
          }
          goto LABEL_20;
        }
        uint64_t v16 = v14;
        id v31 = 0;
        id v17 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x263F08AC0], v15, v14, 0, 0, &v31);
        id v18 = v31;
        v19 = v18;
        if (v17) {
          BOOL v20 = v18 == 0;
        }
        else {
          BOOL v20 = 0;
        }
        if (!v20)
        {
          v25 = handleForCategory(0);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v37 = v19;
            _os_log_error_impl(&dword_21FBF2000, v25, OS_LOG_TYPE_ERROR, "Invalid patch info, failed to get patch info dictionary, error: %@", buf, 0xCu);
          }

LABEL_20:
          id v5 = obj;

          id v24 = 0;
          goto LABEL_21;
        }
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = sub_21FC25490;
        v29[3] = &unk_26452AA60;
        id v30 = v4;
        objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v17, v21, (uint64_t)v29, v22);
      }
      id v5 = obj;
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v32, (uint64_t)v38, 16);
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v24 = v4;
LABEL_21:

  return v24;
}

@end