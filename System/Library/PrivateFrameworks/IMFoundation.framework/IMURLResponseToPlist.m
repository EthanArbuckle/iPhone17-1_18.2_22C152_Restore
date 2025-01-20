@interface IMURLResponseToPlist
+ (void)generate:(id)a3 data:(id)a4 toFilePath:(id)a5;
@end

@implementation IMURLResponseToPlist

+ (void)generate:(id)a3 data:(id)a4 toFilePath:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  v8 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v12 = objc_msgSend_URL(v6, v9, v10, v11);
  objc_msgSend_absoluteString(v12, v13, v14, v15);
  v16 = (const void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend_allHeaderFields(v6, v17, v18, v19);
  if (v20) {
    CFDictionarySetValue(v8, @"headers", v20);
  }

  v21 = NSNumber;
  uint64_t v25 = objc_msgSend_statusCode(v6, v22, v23, v24);
  v28 = objc_msgSend_numberWithInteger_(v21, v26, v25, v27);
  if (v28) {
    CFDictionarySetValue(v8, @"statusCode", v28);
  }

  if (v16) {
    CFDictionarySetValue(v8, @"url", v16);
  }
  v52 = (void *)v16;
  id v29 = [NSString alloc];
  v31 = objc_msgSend_initWithData_encoding_(v29, v30, (uint64_t)v7, 4);
  v34 = objc_msgSend_dataUsingEncoding_(v31, v32, 4, v33);
  id v54 = 0;
  v36 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E4F28F98], v35, (uint64_t)v34, 0, 0, &v54);
  id v37 = v54;
  if (v37)
  {
    v38 = v7;
    if (!v7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v38 = v36;
  if (v36) {
LABEL_9:
  }
    CFDictionarySetValue(v8, @"body", v38);
LABEL_10:

  uint64_t v53 = 0;
  v40 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E4F28F98], v39, (uint64_t)v8, 100, 0, &v53);
  if (v53) {
    NSLog(&cfstr_CanTSerializeD.isa, v53, v8);
  }
  id v41 = [NSString alloc];
  v43 = objc_msgSend_initWithData_encoding_(v41, v42, (uint64_t)v40, 4);
  v47 = objc_msgSend_URL(v6, v44, v45, v46);
  v51 = objc_msgSend_absoluteString(v47, v48, v49, v50);
  NSLog(&cfstr_FullplistForUr.isa, v51, v43);
}

@end