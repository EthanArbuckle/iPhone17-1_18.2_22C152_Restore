@interface IDSLogFormatter
+ (id)descriptionForArray:(id)a3 options:(unint64_t)a4;
+ (id)descriptionForArray:(id)a3 options:(unint64_t)a4 level:(int64_t)a5;
+ (id)descriptionForData:(id)a3 options:(unint64_t)a4;
+ (id)descriptionForDictionary:(id)a3 options:(unint64_t)a4;
+ (id)descriptionForDictionary:(id)a3 options:(unint64_t)a4 level:(int64_t)a5;
+ (id)descriptionForObject:(id)a3 options:(unint64_t)a4;
+ (id)descriptionForObject:(id)a3 options:(unint64_t)a4 level:(int64_t)a5;
+ (id)descriptionForString:(id)a3 options:(unint64_t)a4;
@end

@implementation IDSLogFormatter

+ (id)descriptionForString:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v5 = a3;
  v9 = v5;
  if ((v4 & 8) != 0 && (unint64_t)objc_msgSend_length(v5, v6, v7, v8) >= 0x65)
  {
    v10 = NSString;
    v11 = objc_msgSend__md5Hash(v9, v6, v7, v8);
    objc_msgSend_stringWithFormat_(v10, v12, @"-> %@", v13, v11);
LABEL_7:
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if ((v4 & 4) != 0 && (unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 0x33)
  {
    v16 = NSString;
    v11 = objc_msgSend_substringToIndex_(v9, v14, 20, v15);
    objc_msgSend_stringWithFormat_(v16, v17, @"%@ <...>", v18, v11);
    goto LABEL_7;
  }
  id v19 = v9;
LABEL_9:

  return v19;
}

+ (id)descriptionForData:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v5 = a3;
  v9 = v5;
  if ((v4 & 2) != 0 && (unint64_t)objc_msgSend_length(v5, v6, v7, v8) >= 0x65)
  {
    v10 = NSString;
    v11 = objc_msgSend_SHA1HexString(v9, v6, v7, v8);
    v14 = objc_msgSend_stringWithFormat_(v10, v12, @"-> %@", v13, v11);
  }
  else
  {
    if ((v4 & 1) != 0 && (unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 0x33)
    {
      uint64_t v15 = objc_msgSend_truncatedDescription(v9, v6, v7, v8);
    }
    else
    {
      uint64_t v15 = objc_msgSend_description(v9, v6, v7, v8);
    }
    v14 = (void *)v15;
  }

  return v14;
}

+ (id)descriptionForArray:(id)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend_descriptionForArray_options_level_(a1, a2, (uint64_t)a3, v4, a4, 0);
}

+ (id)descriptionForArray:(id)a3 options:(unint64_t)a4 level:(int64_t)a5
{
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend_appendString_(v9, v10, @"("), v11;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_19DB66BA0;
  v21[3] = &unk_1E5975BE0;
  unint64_t v24 = a4;
  id v12 = v9;
  id v22 = v12;
  int64_t v25 = a5;
  id v26 = a1;
  id v13 = v8;
  id v23 = v13;
  objc_msgSend_enumerateObjectsUsingBlock_(v13, v14, (uint64_t)v21, v15);
  if ((a4 & 0x10) != 0 && a5 >= 1)
  {
    do
    {
      objc_msgSend_appendString_(v12, v16, @"  ", v17);
      --a5;
    }
    while (a5);
  }
  objc_msgSend_appendString_(v12, v16, @""), v17);
  double v18 = v23;
  id v19 = v12;

  return v19;
}

+ (id)descriptionForDictionary:(id)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend_descriptionForDictionary_options_level_(a1, a2, (uint64_t)a3, v4, a4, 0);
}

+ (id)descriptionForDictionary:(id)a3 options:(unint64_t)a4 level:(int64_t)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend_appendString_(v9, v10, @"{\n", v11);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v8;
  uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v36, v13, v40, 16);
  if (v34)
  {
    uint64_t v33 = *(void *)v37;
    int64_t v16 = a5 + 1;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v37 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        int64_t v19 = v16;
        int64_t v20 = a5;
        if ((a5 & 0x8000000000000000) == 0)
        {
          do
          {
            objc_msgSend_appendString_(v9, v14, @"  ", v15);
            --v19;
          }
          while (v19);
        }
        v21 = objc_msgSend_descriptionForObject_options_level_(a1, v14, v18, v15, a4, v16);
        unint64_t v24 = objc_msgSend_objectForKey_(obj, v22, v18, v23);
        v27 = objc_msgSend_descriptionForObject_options_level_(a1, v25, (uint64_t)v24, v26, a4, v16);
        objc_msgSend_appendFormat_(v9, v28, @"%@ : %@\n", v29, v21, v27);

        a5 = v20;
      }
      uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v36, v15, v40, 16);
    }
    while (v34);
  }

  if (a5 >= 1)
  {
    do
    {
      objc_msgSend_appendString_(v9, v30, @"  ", v31);
      --a5;
    }
    while (a5);
  }
  objc_msgSend_appendString_(v9, v30, @"}", v31);

  return v9;
}

+ (id)descriptionForObject:(id)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend_descriptionForObject_options_level_(a1, a2, (uint64_t)a3, v4, a4, 0);
}

+ (id)descriptionForObject:(id)a3 options:(unint64_t)a4 level:(int64_t)a5
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend_descriptionForString_options_(a1, v9, (uint64_t)v8, v10, a4);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = objc_msgSend_descriptionForData_options_(a1, v12, (uint64_t)v8, v13, a4);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = objc_msgSend_descriptionForArray_options_level_(a1, v14, (uint64_t)v8, v15, a4, a5);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend_descriptionForDictionary_options_level_(a1, v16, (uint64_t)v8, v18, a4, a5);
        }
        else {
        uint64_t v11 = objc_msgSend_description(v8, v16, v17, v18);
        }
      }
    }
  }
  int64_t v19 = (void *)v11;

  return v19;
}

@end