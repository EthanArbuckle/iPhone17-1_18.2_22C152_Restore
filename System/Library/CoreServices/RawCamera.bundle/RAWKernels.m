@interface RAWKernels
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)kernelWithName:(id)a3;
+ (id)kernelWithName:(id)a3 group:(id)a4;
+ (id)sharedKernels;
- (RAWKernels)init;
- (id)kernelSourceForGroup:(id)a3;
- (id)kernelWithName:(id)a3 group:(id)a4;
- (id)loadKernelsForGroup:(id)a3;
@end

@implementation RAWKernels

- (RAWKernels)init
{
  v6.receiver = self;
  v6.super_class = (Class)RAWKernels;
  v2 = [(RAWKernels *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    priv = v2->priv;
    v2->priv = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)kernelSourceForGroup:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"default", v5, v6))
  {
    uInt v10 = 1319;
    v11 = &unk_1DDBFFBF1;
    objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v7, 4836, v8, v9);
    goto LABEL_8;
  }
  if (objc_msgSend_isEqualToString_(v3, v7, @"NR", v8, v9))
  {
    uInt v10 = 10736;
    v11 = &unk_1DDC00118;
    unsigned __int16 v15 = -28642;
LABEL_5:
    objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v12, v15 | 0x10000u, v13, v14);
    goto LABEL_8;
  }
  if (objc_msgSend_isEqualToString_(v3, v12, @"LC", v13, v14))
  {
    uInt v10 = 1246;
    v11 = &unk_1DDC02B08;
    objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v16, 8217, v17, v18);
  }
  else
  {
    if (objc_msgSend_isEqualToString_(v3, v16, @"DM", v17, v18))
    {
      uInt v10 = 13404;
      v11 = &unk_1DDC02FE6;
      unsigned __int16 v15 = 32099;
      goto LABEL_5;
    }
    if (objc_msgSend_isEqualToString_(v3, v12, @"DeFringe", v13, v14))
    {
      uInt v10 = 3299;
      v11 = &unk_1DDC06442;
      objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v35, 21373, v36, v37);
    }
    else if (objc_msgSend_isEqualToString_(v3, v35, @"GM", v36, v37))
    {
      uInt v10 = 1089;
      v11 = &unk_1DDC07125;
      objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v38, 5164, v39, v40);
    }
    else if (objc_msgSend_isEqualToString_(v3, v38, @"HM", v39, v40))
    {
      uInt v10 = 345;
      v11 = &unk_1DDC07566;
      objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v41, 1925, v42, v43);
    }
    else if (objc_msgSend_isEqualToString_(v3, v41, @"Boost", v42, v43))
    {
      uInt v10 = 2121;
      v11 = &unk_1DDC076BF;
      objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v44, 16155, v45, v46);
    }
    else if (objc_msgSend_isEqualToString_(v3, v44, @"GainMap", v45, v46))
    {
      uInt v10 = 524;
      v11 = &unk_1DDC07F08;
      objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v47, 1410, v48, v49);
    }
    else if (objc_msgSend_isEqualToString_(v3, v47, @"V8LNR", v48, v49))
    {
      uInt v10 = 5068;
      v11 = &unk_1DDC08114;
      objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v50, 31647, v51, v52);
    }
    else
    {
      if (objc_msgSend_isEqualToString_(v3, v50, @"V8CNR", v51, v52))
      {
        uInt v10 = 5080;
        v11 = &unk_1DDC094E0;
        unsigned __int16 v15 = 21654;
        goto LABEL_5;
      }
      if (objc_msgSend_isEqualToString_(v3, v12, @"V8VIEW", v13, v14))
      {
        uInt v10 = 954;
        v11 = &unk_1DDC0A8B8;
        objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v53, 5477, v54, v55);
      }
      else
      {
        if (!objc_msgSend_isEqualToString_(v3, v53, @"LTM", v54, v55))
        {
          v33 = 0;
          goto LABEL_14;
        }
        uInt v10 = 605;
        v11 = &unk_1DDC0AC72;
        objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v56, 1764, v57, v58);
      }
    }
  }
  v19 = LABEL_8:;
  memset(&v59.zalloc, 0, 24);
  v59.avail_in = v10;
  v59.avail_out = objc_msgSend_length(v19, v20, v21, v22, v23, v11, *(void *)&v59.avail_in);
  id v24 = v19;
  v59.next_out = (Bytef *)objc_msgSend_mutableBytes(v24, v25, v26, v27, v28);
  if (inflateInit_(&v59, "1.2.12", 112) || (int v29 = inflate(&v59, 0), v29 == -2) || (inflateEnd(&v59), v29 != 1))
  {
    v33 = 0;
  }
  else
  {
    id v30 = [NSString alloc];
    v33 = objc_msgSend_initWithData_encoding_(v30, v31, (uint64_t)v24, 4, v32);
  }

LABEL_14:

  return v33;
}

- (id)loadKernelsForGroup:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5->priv, v6, (uint64_t)v4, v7, v8);

  if (v9)
  {
    uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v5->priv, v10, (uint64_t)v4, v11, v12);
  }
  else
  {
    uint64_t v46 = objc_msgSend_kernelSourceForGroup_(v5, v10, (uint64_t)v4, v11, v12);
    v16 = objc_msgSend_kernelsWithString_messageLog_(MEMORY[0x1E4F1E058], v14, (uint64_t)v46, 0, v15);
    uint64_t v21 = objc_msgSend_count(v16, v17, v18, v19, v20);
    id v22 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v26 = objc_msgSend_initWithCapacity_(v22, v23, v21, v24, v25);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v27 = v16;
    uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v47, (uint64_t)v51, 16);
    if (v33)
    {
      uint64_t v34 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v48 != v34) {
            objc_enumerationMutation(v27);
          }
          uint64_t v36 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          uint64_t v37 = objc_msgSend_name(v36, v29, v30, v31, v32);
          objc_msgSend_setObject_forKeyedSubscript_(v26, v38, (uint64_t)v36, (uint64_t)v37, v39);
        }
        uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v29, (uint64_t)&v47, (uint64_t)v51, 16);
      }
      while (v33);
    }

    uint64_t v13 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E4F1C9E8], v40, (uint64_t)v26, v41, v42);
    objc_msgSend_setObject_forKeyedSubscript_(v5->priv, v43, (uint64_t)v13, (uint64_t)v4, v44);
  }
  objc_sync_exit(v5);

  return v13;
}

+ (id)sharedKernels
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!qword_1EAB91278) {

  }
  objc_sync_exit(v2);
  id v3 = (void *)qword_1EAB91278;

  return v3;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v4 = a1;
  objc_sync_enter(v4);
  if (qword_1EAB91278)
  {
    id v5 = 0;
  }
  else
  {
    v9.receiver = v4;
    v9.super_class = (Class)&OBJC_METACLASS___RAWKernels;
    id v6 = objc_msgSendSuper2(&v9, sel_allocWithZone_, a3);
    uint64_t v7 = (void *)qword_1EAB91278;
    qword_1EAB91278 = (uint64_t)v6;

    id v5 = (id)qword_1EAB91278;
  }
  objc_sync_exit(v4);

  return v5;
}

- (id)kernelWithName:(id)a3 group:(id)a4
{
  id v6 = a3;
  uInt v10 = objc_msgSend_loadKernelsForGroup_(self, v7, (uint64_t)a4, v8, v9);
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v6, v12, v13);

  return v14;
}

+ (id)kernelWithName:(id)a3
{
  id v3 = a3;
  uint64_t v8 = objc_msgSend_sharedKernels(RAWKernels, v4, v5, v6, v7);
  uint64_t v11 = objc_msgSend_kernelWithName_group_(v8, v9, (uint64_t)v3, @"default", v10);

  return v11;
}

+ (id)kernelWithName:(id)a3 group:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v11 = objc_msgSend_sharedKernels(RAWKernels, v7, v8, v9, v10);
  uint64_t v14 = objc_msgSend_kernelWithName_group_(v11, v12, (uint64_t)v5, (uint64_t)v6, v13);

  return v14;
}

- (void).cxx_destruct
{
}

@end