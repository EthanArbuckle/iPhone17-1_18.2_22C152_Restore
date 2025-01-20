@interface BLUtilities
+ (BOOL)isAudioBookFromBuyParameters:(id)a3;
+ (BOOL)isPreOrderFromBuyParameters:(id)a3;
+ (id)buyParametersValueForKey:(id)a3 fromBuyParams:(id)a4;
+ (id)storeIDFromBuyParameters:(id)a3;
@end

@implementation BLUtilities

+ (id)buyParametersValueForKey:(id)a3 fromBuyParams:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_msgSend_componentsSeparatedByString_(a4, v6, @"&", v7);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v34, (uint64_t)v38, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v14 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v8);
        }
        v16 = objc_msgSend_componentsSeparatedByString_(*(void **)(*((void *)&v34 + 1) + 8 * i), v11, @"=", v12, (void)v34);
        if (objc_msgSend_count(v16, v17, v18, v19) == 2)
        {
          v22 = objc_msgSend_objectAtIndexedSubscript_(v16, v20, 0, v21);
          int isEqualToString = objc_msgSend_isEqualToString_(v22, v23, (uint64_t)v5, v24);

          if (isEqualToString)
          {
            v28 = objc_msgSend_objectAtIndexedSubscript_(v16, v26, 1, v27);

            goto LABEL_12;
          }
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v34, (uint64_t)v38, 16);
      if (v13) {
        continue;
      }
      break;
    }
  }
  v28 = 0;
LABEL_12:

  v32 = objc_msgSend_stringByRemovingPercentEncoding(v28, v29, v30, v31);

  return v32;
}

+ (id)storeIDFromBuyParameters:(id)a3
{
  if (a3)
  {
    v6 = objc_msgSend_buyParametersValueForKey_fromBuyParams_(BLUtilities, a2, @"salableAdamId", (uint64_t)a3);
  }
  else
  {
    uint64_t v7 = BLUtilitiesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_21DFE3000, v7, OS_LOG_TYPE_ERROR, "storeIDFromBuyParameters: cannot retrieve storeID from nil buyParameters", v14, 2u);
    }

    v6 = 0;
  }
  id v8 = NSNumber;
  uint64_t v9 = objc_msgSend_longLongValue(v6, v3, v4, v5);
  uint64_t v12 = objc_msgSend_numberWithLongLong_(v8, v10, v9, v11);

  return v12;
}

+ (BOOL)isPreOrderFromBuyParameters:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_msgSend_buyParametersValueForKey_fromBuyParams_(BLUtilities, v3, @"isPreorder", (uint64_t)v4);
    uint64_t v7 = objc_msgSend_buyParametersValueForKey_fromBuyParams_(BLUtilities, v6, @"pricingParameters", (uint64_t)v4);
    char hasSuffix = objc_msgSend_hasSuffix_(v7, v8, @"PRE", v9);
    if (v5) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = hasSuffix;
    }
  }
  else
  {
    uint64_t v12 = BLDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_21DFE3000, v12, OS_LOG_TYPE_ERROR, "isPreOrderFromBuyParameters: cannot retrieve isPreOrder key from nil buyParameters", v14, 2u);
    }

    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)isAudioBookFromBuyParameters:(id)a3
{
  if (a3)
  {
    v3 = objc_msgSend_buyParametersValueForKey_fromBuyParams_(BLUtilities, a2, @"productType", (uint64_t)a3);
    v6 = v3;
    if (v3) {
      char isEqualToString = objc_msgSend_isEqualToString_(v3, v4, @"P", v5);
    }
    else {
      char isEqualToString = 0;
    }
  }
  else
  {
    id v8 = BLDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_ERROR, "isAudioBookFromBuyParameters: cannot retrieve productType key from nil buyParameters", v10, 2u);
    }

    return 0;
  }
  return isEqualToString;
}

@end