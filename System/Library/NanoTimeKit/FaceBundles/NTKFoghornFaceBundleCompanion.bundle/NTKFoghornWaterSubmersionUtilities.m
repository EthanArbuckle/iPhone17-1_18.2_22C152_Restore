@interface NTKFoghornWaterSubmersionUtilities
+ (double)lastDiveMaxDepth;
@end

@implementation NTKFoghornWaterSubmersionUtilities

+ (double)lastDiveMaxDepth
{
  v3 = (void *)CFPreferencesCopyAppValue(@"lastDive", @"com.apple.Depth");
  if (v3)
  {
    id v39 = 0;
    v4 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v2, (uint64_t)v3, 0, &v39);
    id v8 = v39;
    if (v8)
    {
      v9 = objc_msgSend_logObject(NTKFoghornFaceBundle, v5, v6, v7);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_246B1FCBC((uint64_t)v8, v9);
      }
    }
    objc_opt_class();
    double v12 = 0.0;
    if (objc_opt_isKindOfClass())
    {
      v13 = objc_msgSend_objectForKeyedSubscript_(v4, v10, @"maxDepth", v11);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v13;
        v19 = objc_msgSend_objectForKeyedSubscript_(v14, v15, @"nominal", v16);
        if (!v19)
        {
          v19 = objc_msgSend_objectForKeyedSubscript_(v14, v17, @"shallow", v18);
          if (!v19)
          {
            v19 = objc_msgSend_objectForKeyedSubscript_(v14, v20, @"depthExceedingNominalRange", v21);
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v25 = objc_msgSend_allValues(v19, v22, v23, v24);
          v29 = objc_msgSend_firstObject(v25, v26, v27, v28);

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v32 = objc_msgSend_objectForKeyedSubscript_(v29, v30, @"canonicalValue", v31);
            if (v32)
            {
              v36 = v32;
              objc_msgSend_doubleValue(v32, v33, v34, v35);
              double v12 = v37;
            }
          }
        }
      }
    }
  }
  else
  {
    double v12 = 0.0;
  }

  return v12;
}

@end