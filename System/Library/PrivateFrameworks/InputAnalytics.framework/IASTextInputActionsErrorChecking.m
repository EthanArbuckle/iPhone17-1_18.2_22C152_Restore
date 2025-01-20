@interface IASTextInputActionsErrorChecking
+ (id)validateLanguage:(id)a3;
+ (id)validateLanguageHelper:(id)a3;
+ (id)validateRegion:(id)a3;
+ (id)validateRegionHelper:(id)a3;
@end

@implementation IASTextInputActionsErrorChecking

+ (id)validateLanguageHelper:(id)a3
{
  id v3 = a3;
  v6 = objc_msgSend_setWithObjects_(MEMORY[0x263EFFA08], v4, @"emoji", v5, @"dictation", 0);
  v12 = 0;
  if ((objc_msgSend_containsObject_(v6, v7, (uint64_t)v3, v8) & 1) == 0)
  {
    if (objc_msgSend_length(v3, v9, v10, v11) != 2
      && objc_msgSend_length(v3, v13, v14, v15) != 3
      && objc_msgSend_length(v3, v13, v14, v15) != 7
      && objc_msgSend_length(v3, v13, v14, v15) != 8)
    {
      goto LABEL_9;
    }
    if (qword_26B2300C8 != -1) {
      dispatch_once(&qword_26B2300C8, &unk_2702E3848);
    }
    v16 = (void *)qword_26B2300B0;
    uint64_t v17 = objc_msgSend_length(v3, v13, v14, v15);
    uint64_t v19 = objc_msgSend_numberOfMatchesInString_options_range_(v16, v18, (uint64_t)v3, 0, 0, v17);
    v12 = 0;
    if (v19 != 1) {
LABEL_9:
    }
      v12 = @"L";
  }

  return v12;
}

+ (id)validateLanguage:(id)a3
{
  id v3 = a3;
  v7 = v3;
  if (v3 && objc_msgSend_length(v3, v4, v5, v6))
  {
    if (qword_26B2300A8 != -1) {
      dispatch_once(&qword_26B2300A8, &unk_2702E3768);
    }
    v13 = objc_msgSend_objectForKey_((void *)qword_26B2300C0, v8, (uint64_t)v7, v9);
    if (v13)
    {
      uint64_t v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v10, v11, v12);
      char isEqual = objc_msgSend_isEqual_(v13, v15, (uint64_t)v14, v16);

      if (isEqual) {
        id v18 = 0;
      }
      else {
        id v18 = v13;
      }
    }
    else
    {
      objc_msgSend_validateLanguageHelper_(IASTextInputActionsErrorChecking, v10, (uint64_t)v7, v12);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      v22 = (void *)qword_26B2300C0;
      if (v18)
      {
        objc_msgSend_setObject_forKey_((void *)qword_26B2300C0, v19, (uint64_t)v18, (uint64_t)v7);
      }
      else
      {
        v23 = objc_msgSend_null(MEMORY[0x263EFF9D0], v19, v20, v21);
        objc_msgSend_setObject_forKey_(v22, v24, (uint64_t)v23, (uint64_t)v7);
      }
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

+ (id)validateRegionHelper:(id)a3
{
  id v3 = a3;
  if ((unint64_t)objc_msgSend_length(v3, v4, v5, v6) < 2
    || (unint64_t)objc_msgSend_length(v3, v7, v8, v9) > 4)
  {
    goto LABEL_6;
  }
  if (qword_26B2300D8 != -1) {
    dispatch_once(&qword_26B2300D8, &unk_2702E39C8);
  }
  v13 = (void *)qword_26B2300E0;
  uint64_t v14 = objc_msgSend_length(v3, v10, v11, v12);
  uint64_t v16 = objc_msgSend_numberOfMatchesInString_options_range_(v13, v15, (uint64_t)v3, 0, 0, v14);
  uint64_t v17 = 0;
  if (v16 != 1) {
LABEL_6:
  }
    uint64_t v17 = @"R";

  return v17;
}

+ (id)validateRegion:(id)a3
{
  id v3 = a3;
  v7 = v3;
  if (v3 && objc_msgSend_length(v3, v4, v5, v6))
  {
    if (qword_26B2300B8 != -1) {
      dispatch_once(&qword_26B2300B8, &unk_2702E39E8);
    }
    v13 = objc_msgSend_objectForKey_((void *)qword_26B2300D0, v8, (uint64_t)v7, v9);
    if (v13)
    {
      uint64_t v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v10, v11, v12);
      char isEqual = objc_msgSend_isEqual_(v13, v15, (uint64_t)v14, v16);

      if (isEqual) {
        id v18 = 0;
      }
      else {
        id v18 = v13;
      }
    }
    else
    {
      objc_msgSend_validateRegionHelper_(IASTextInputActionsErrorChecking, v10, (uint64_t)v7, v12);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      v22 = (void *)qword_26B2300D0;
      if (v18)
      {
        objc_msgSend_setObject_forKey_((void *)qword_26B2300D0, v19, (uint64_t)v18, (uint64_t)v7);
      }
      else
      {
        v23 = objc_msgSend_null(MEMORY[0x263EFF9D0], v19, v20, v21);
        objc_msgSend_setObject_forKey_(v22, v24, (uint64_t)v23, (uint64_t)v7);
      }
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

@end