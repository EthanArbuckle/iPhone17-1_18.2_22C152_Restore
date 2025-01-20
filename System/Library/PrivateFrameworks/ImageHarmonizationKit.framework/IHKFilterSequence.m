@interface IHKFilterSequence
+ (id)breakPascalCaseIntoWords:(id)a3;
+ (id)getScalarInputsForCIFilterNamed:(id)a3;
+ (id)paramToInputName:(id)a3;
+ (id)parseFilterSequenceSpec:(id)a3;
+ (id)uiNameForCIFilter:(id)a3 paramName:(id)a4;
+ (id)uiNameForCIFilterName:(id)a3;
+ (id)uiNameForParamName:(id)a3;
- (IHKFilterSequence)initWithFilterSpec:(id)a3;
- (NSArray)filterSeq;
- (NSArray)sliderOrder;
- (NSDictionary)sliderSpecs;
- (id)applySliders:(id)a3 image:(id)a4 error:(id *)a5;
- (id)packageSliderValues:(id)a3;
- (void)setFilterSeq:(id)a3;
- (void)setSliderOrder:(id)a3;
- (void)setSliderSpecs:(id)a3;
@end

@implementation IHKFilterSequence

+ (id)getScalarInputsForCIFilterNamed:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v39 = a3;
  id v40 = (id)objc_opt_new();
  v6 = objc_msgSend_filterWithName_(MEMORY[0x263F00640], v3, (uint64_t)v39, v4, v5);
  v11 = v6;
  if (v6)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    objc_msgSend_inputKeys(v6, v7, v8, v9, v10);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v42, (uint64_t)v46, 16);
    if (v17)
    {
      uint64_t v18 = *(void *)v43;
      uint64_t v19 = *MEMORY[0x263F006F0];
      uint64_t v20 = *MEMORY[0x263F00750];
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v43 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          v23 = objc_msgSend_attributes(v11, v13, v14, v15, v16);
          v27 = objc_msgSend_objectForKeyedSubscript_(v23, v24, v22, v25, v26);
          v31 = objc_msgSend_objectForKeyedSubscript_(v27, v28, v19, v29, v30);

          if (objc_msgSend_isEqualToString_(v31, v32, v20, v33, v34)) {
            objc_msgSend_addObject_(v40, v35, v22, v36, v37);
          }
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v42, (uint64_t)v46, 16);
      }
      while (v17);
    }
  }
  else
  {
    NSLog(&cfstr_CouldNotFindFi.isa, v39);
  }

  return v40;
}

+ (id)paramToInputName:(id)a3
{
  id v3 = a3;
  uint64_t v8 = v3;
  if (v3 && objc_msgSend_length(v3, v4, v5, v6, v7))
  {
    unint64_t v13 = 0;
    uint64_t v14 = @"input";
    do
    {
      uint64_t v15 = 0;
      do
      {
        uint64_t v16 = v15;
        if (v13 + v15 + 1 >= objc_msgSend_length(v8, v9, v10, v11, v12)) {
          break;
        }
        id v17 = v8;
        uint64_t v22 = objc_msgSend_UTF8String(v17, v18, v19, v20, v21);
        uint64_t v15 = v16 + 1;
      }
      while (*(unsigned char *)(v22 + v13 + v16 + 1) != 95);
      v23 = objc_msgSend_substringWithRange_(v8, v9, v13, v16 + 1, v12);
      v27 = objc_msgSend_substringToIndex_(v23, v24, 1, v25, v26);
      v31 = objc_msgSend_substringFromIndex_(v23, v28, 1, v29, v30);
      v32 = NSString;
      uint64_t v37 = objc_msgSend_uppercaseString(v27, v33, v34, v35, v36);
      objc_msgSend_stringWithFormat_(v32, v38, @"%@%@%@", v39, v40, v14, v37, v31);
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v13 += v16 + 2;
      uint64_t v14 = v41;
    }
    while (v13 < objc_msgSend_length(v8, v42, v43, v44, v45));
  }
  else
  {
    v41 = 0;
  }

  return v41;
}

+ (id)breakPascalCaseIntoWords:(id)a3
{
  id v7 = a3;
  unint64_t v8 = 0;
  uint64_t v9 = &stru_2702DDB30;
  uint64_t v10 = &stru_2702DDB30;
  do
  {
    uint64_t v11 = 0;
    do
    {
      uint64_t v12 = v11;
      if (v8 + v11 + 1 >= objc_msgSend_length(v7, v3, v4, v5, v6)) {
        break;
      }
      id v13 = v7;
      __darwin_ct_rune_t v18 = *(char *)(objc_msgSend_UTF8String(v13, v14, v15, v16, v17) + v8 + v12 + 1);
      __darwin_ct_rune_t v19 = __toupper(v18);
      id v20 = v13;
      __darwin_ct_rune_t v25 = *(char *)(objc_msgSend_UTF8String(v20, v21, v22, v23, v24) + v8 + v12);
      __darwin_ct_rune_t v26 = __toupper(v25);
      uint64_t v11 = v12 + 1;
    }
    while (v19 != v18 || v26 == v25);
    v28 = objc_msgSend_substringWithRange_(v7, v3, v8, v12 + 1, v6);
    objc_msgSend_stringWithFormat_(NSString, v29, @"%@%@%@", v30, v31, v10, v9, v28);
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v8 += v12 + 1;
    uint64_t v9 = @" ";
    uint64_t v10 = v32;
  }
  while (v8 < objc_msgSend_length(v7, v33, v34, v35, v36));

  return v32;
}

+ (id)uiNameForParamName:(id)a3
{
  id v3 = a3;
  uint64_t v8 = objc_msgSend_length(@"input", v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_substringFromIndex_(v3, v9, v8, v10, v11);

  uint64_t v16 = objc_msgSend_breakPascalCaseIntoWords_(IHKFilterSequence, v13, (uint64_t)v12, v14, v15);

  return v16;
}

+ (id)uiNameForCIFilterName:(id)a3
{
  id v7 = a3;
  for (unint64_t i = 0; i < objc_msgSend_length(v7, v3, v4, v5, v6); ++i)
  {
    id v9 = v7;
    uint64_t v14 = objc_msgSend_UTF8String(v9, v10, v11, v12, v13);
    __darwin_ct_rune_t v15 = __tolower(*(char *)(v14 + i));
    id v16 = v9;
    if (v15 == *(char *)(objc_msgSend_UTF8String(v16, v17, v18, v19, v20) + i)) {
      break;
    }
  }
  if ((int)i <= 1) {
    int v21 = 1;
  }
  else {
    int v21 = i;
  }
  uint64_t v22 = objc_msgSend_length(v7, v3, v4, v5, v6);
  if (objc_msgSend_hasSuffix_(v7, v23, @"Filter", v24, v25)) {
    v22 -= objc_msgSend_length(@"Filter", v26, v27, v28, v29);
  }
  uint64_t v30 = objc_msgSend_substringWithRange_(v7, v26, (v21 - 1), v22 - (v21 - 1), v29);

  uint64_t v34 = objc_msgSend_breakPascalCaseIntoWords_(IHKFilterSequence, v31, (uint64_t)v30, v32, v33);

  return v34;
}

+ (id)uiNameForCIFilter:(id)a3 paramName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v10 = objc_msgSend_stringWithFormat_(NSString, v7, @"%@.%@", v8, v9, v5, v6);
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(&unk_2702E1D58, v11, (uint64_t)v10, v12, v13);

  if (!v14)
  {
    if (objc_msgSend_isEqualToString_(v6, v15, @"inputStrength", v16, v17)) {
      objc_msgSend_uiNameForCIFilterName_(IHKFilterSequence, v18, (uint64_t)v5, v19, v20);
    }
    else {
    uint64_t v14 = objc_msgSend_uiNameForParamName_(IHKFilterSequence, v18, (uint64_t)v6, v19, v20);
    }
  }

  return v14;
}

+ (id)parseFilterSequenceSpec:(id)a3
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v63 = a3;
  id v66 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_msgSend_componentsSeparatedByString_(v63, v4, @"->", v5, v6);
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v73, (uint64_t)v80, 16);
  if (v8)
  {
    uint64_t v65 = *(void *)v74;
    do
    {
      uint64_t v12 = 0;
      uint64_t v67 = v8;
      do
      {
        if (*(void *)v74 != v65) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v73 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend_rangeOfString_(v13, v9, @"[", v10, v11);
        uint64_t v16 = v15;
        uint64_t v19 = objc_msgSend_rangeOfString_(v13, v15, @"]", v17, v18);
        uint64_t v21 = v20;
        id v22 = v13;
        __darwin_ct_rune_t v26 = objc_opt_new();
        if (v16) {
          BOOL v27 = v21 == 0;
        }
        else {
          BOOL v27 = 1;
        }
        v68 = v22;
        if (v27)
        {
          uint64_t v33 = objc_msgSend_getScalarInputsForCIFilterNamed_(a1, v23, (uint64_t)v22, v24, v25);
          uint64_t v32 = v26;
          __darwin_ct_rune_t v26 = objc_msgSend_mutableCopy(v33, v28, v29, v30, v31);
        }
        else
        {
          uint64_t v33 = objc_msgSend_substringWithRange_(v22, v23, v14 + 1, v19 + ~v14, v25);
          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          uint64_t v37 = objc_msgSend_componentsSeparatedByString_(v33, v34, @",", v35, v36);
          uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v69, (uint64_t)v79, 16);
          uint64_t v43 = v39;
          if (v39)
          {
            uint64_t v44 = *(void *)v70;
            do
            {
              uint64_t v45 = 0;
              do
              {
                if (*(void *)v70 != v44) {
                  objc_enumerationMutation(v37);
                }
                v46 = objc_msgSend_paramToInputName_(a1, v40, *(void *)(*((void *)&v69 + 1) + 8 * v45), v41, v42);
                objc_msgSend_addObject_(v26, v47, (uint64_t)v46, v48, v49);

                ++v45;
              }
              while (v43 != v45);
              uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v69, (uint64_t)v79, 16);
            }
            while (v43);
          }

          uint64_t v32 = v68;
          v68 = objc_msgSend_substringToIndex_(v68, v50, v14, v51, v52);
        }

        v56 = objc_msgSend_sortedArrayUsingSelector_(v26, v53, (uint64_t)sel_compare_, v54, v55);
        v77[0] = @"filterName";
        v77[1] = @"inputNames";
        v78[0] = v68;
        v78[1] = v56;
        v58 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v57, (uint64_t)v78, (uint64_t)v77, 2);
        objc_msgSend_addObject_(v66, v59, (uint64_t)v58, v60, v61);

        ++v12;
      }
      while (v12 != v67);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v73, (uint64_t)v80, 16);
    }
    while (v8);
  }

  return v66;
}

- (IHKFilterSequence)initWithFilterSpec:(id)a3
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  id v111 = a3;
  v131.receiver = self;
  v131.super_class = (Class)IHKFilterSequence;
  v112 = [(IHKFilterSequence *)&v131 init];
  if (v112)
  {
    id v7 = objc_msgSend_parseFilterSequenceSpec_(IHKFilterSequence, v4, (uint64_t)v111, v5, v6);
    objc_msgSend_setFilterSeq_(v112, v8, (uint64_t)v7, v9, v10);

    v121 = objc_opt_new();
    v120 = objc_opt_new();
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    objc_msgSend_filterSeq(v112, v11, v12, v13, v14);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v127, (uint64_t)v133, 16);
    if (v115)
    {
      uint64_t v114 = *(void *)v128;
      uint64_t v118 = *MEMORY[0x263F006C8];
      uint64_t v119 = *MEMORY[0x263F006D0];
      uint64_t v19 = *MEMORY[0x263F006C0];
      do
      {
        for (uint64_t i = 0; i != v115; ++i)
        {
          if (*(void *)v128 != v114) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void **)(*((void *)&v127 + 1) + 8 * i);
          v122 = objc_msgSend_objectForKeyedSubscript_(v20, v16, @"filterName", v17, v18);
          uint64_t v24 = objc_msgSend_filterWithName_(MEMORY[0x263F00640], v21, (uint64_t)v122, v22, v23);
          long long v125 = 0u;
          long long v126 = 0u;
          long long v123 = 0u;
          long long v124 = 0u;
          objc_msgSend_objectForKeyedSubscript_(v20, v25, @"inputNames", v26, v27);
          id v117 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v117, v28, (uint64_t)&v123, (uint64_t)v132, 16);
          if (v31)
          {
            uint64_t v32 = *(void *)v124;
            do
            {
              for (uint64_t j = 0; j != v31; ++j)
              {
                if (*(void *)v124 != v32) {
                  objc_enumerationMutation(v117);
                }
                uint64_t v34 = *(void *)(*((void *)&v123 + 1) + 8 * j);
                uint64_t v35 = objc_msgSend_uiNameForCIFilter_paramName_(IHKFilterSequence, v29, (uint64_t)v122, v34, v30);
                objc_msgSend_addObject_(v121, v36, (uint64_t)v35, v37, v38);
                uint64_t v43 = objc_msgSend_attributes(v24, v39, v40, v41, v42);
                uint64_t v47 = objc_msgSend_objectForKeyedSubscript_(v43, v44, v34, v45, v46);
                uint64_t v51 = objc_msgSend_objectForKeyedSubscript_(v47, v48, v119, v49, v50);
                objc_msgSend_doubleValue(v51, v52, v53, v54, v55);
                double v57 = v56;

                v62 = objc_msgSend_attributes(v24, v58, v59, v60, v61);
                id v66 = objc_msgSend_objectForKeyedSubscript_(v62, v63, v34, v64, v65);
                long long v70 = objc_msgSend_objectForKeyedSubscript_(v66, v67, v118, v68, v69);
                objc_msgSend_doubleValue(v70, v71, v72, v73, v74);
                double v76 = v75;

                uint64_t v81 = objc_msgSend_attributes(v24, v77, v78, v79, v80);
                v85 = objc_msgSend_objectForKeyedSubscript_(v81, v82, v34, v83, v84);
                v89 = objc_msgSend_objectForKeyedSubscript_(v85, v86, v19, v87, v88);
                objc_msgSend_doubleValue(v89, v90, v91, v92, v93);
                double v95 = v94;

                v96 = [IHKSliderSpec alloc];
                v101 = objc_msgSend_initWithMin_max_identity_(v96, v97, v98, v99, v100, v57, v76, v95);
                objc_msgSend_setObject_forKeyedSubscript_(v120, v102, (uint64_t)v101, (uint64_t)v35, v103);
              }
              uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v117, v29, (uint64_t)&v123, (uint64_t)v132, 16);
            }
            while (v31);
          }
        }
        uint64_t v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v127, (uint64_t)v133, 16);
      }
      while (v115);
    }

    objc_msgSend_setSliderOrder_(v112, v104, (uint64_t)v121, v105, v106);
    objc_msgSend_setSliderSpecs_(v112, v107, (uint64_t)v120, v108, v109);
  }
  return v112;
}

- (id)packageSliderValues:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v54 = a3;
  id v46 = (id)objc_opt_new();
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  objc_msgSend_filterSeq(self, v4, v5, v6, v7);
  uint64_t v47 = self;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v64, (uint64_t)v70, 16);
  if (v43)
  {
    uint64_t v44 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v65 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v51 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v51, v9, @"filterName", v10, v11);
        uint64_t v55 = objc_opt_new();
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        objc_msgSend_sliderOrder(v47, v13, v14, v15, v16);
        id v49 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v17, (uint64_t)&v60, (uint64_t)v69, 16);
        if (v52)
        {
          uint64_t v50 = *(void *)v61;
          do
          {
            for (uint64_t j = 0; j != v52; ++j)
            {
              if (*(void *)v61 != v50) {
                objc_enumerationMutation(v49);
              }
              uint64_t v21 = *(void **)(*((void *)&v60 + 1) + 8 * j);
              long long v56 = 0u;
              long long v57 = 0u;
              long long v58 = 0u;
              long long v59 = 0u;
              uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v51, v18, @"inputNames", v19, v20);
              uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v56, (uint64_t)v68, 16);
              if (v26)
              {
                uint64_t v27 = *(void *)v57;
                do
                {
                  for (uint64_t k = 0; k != v26; ++k)
                  {
                    if (*(void *)v57 != v27) {
                      objc_enumerationMutation(v22);
                    }
                    uint64_t v29 = *(void *)(*((void *)&v56 + 1) + 8 * k);
                    uint64_t v30 = objc_msgSend_uiNameForCIFilter_paramName_(IHKFilterSequence, v24, (uint64_t)v12, v29, v25);
                    if (objc_msgSend_isEqualToString_(v21, v31, (uint64_t)v30, v32, v33))
                    {
                      uint64_t v37 = objc_msgSend_objectForKeyedSubscript_(v54, v34, (uint64_t)v21, v35, v36);
                      objc_msgSend_setObject_forKeyedSubscript_(v55, v38, (uint64_t)v37, v29, v39);
                    }
                  }
                  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v24, (uint64_t)&v56, (uint64_t)v68, 16);
                }
                while (v26);
              }
            }
            uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v18, (uint64_t)&v60, (uint64_t)v69, 16);
          }
          while (v52);
        }

        objc_msgSend_setObject_forKeyedSubscript_(v46, v40, (uint64_t)v55, (uint64_t)v12, v41);
      }
      uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v64, (uint64_t)v70, 16);
    }
    while (v43);
  }

  return v46;
}

- (id)applySliders:(id)a3 image:(id)a4 error:(id *)a5
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v14 = objc_msgSend_count(v8, v10, v11, v12, v13);
  uint64_t v19 = objc_msgSend_sliderOrder(self, v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend_count(v19, v20, v21, v22, v23);

  if (v14 == v24)
  {
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    objc_msgSend_filterSeq(self, v25, v26, v27, v28);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v112, (uint64_t)v117, 16);
    if (v30)
    {
      uint64_t v34 = 0;
      uint64_t v100 = v30;
      uint64_t v101 = *(void *)v113;
      v102 = a5;
      while (2)
      {
        uint64_t v104 = 0;
        id v35 = v9;
        do
        {
          uint64_t v103 = v35;
          if (*(void *)v113 != v101) {
            objc_enumerationMutation(obj);
          }
          uint64_t v36 = *(void **)(*((void *)&v112 + 1) + 8 * v104);
          uint64_t v105 = objc_msgSend_objectForKeyedSubscript_(v36, v31, @"filterName", v32, v33);
          uint64_t v37 = objc_opt_new();
          long long v110 = 0u;
          long long v111 = 0u;
          long long v108 = 0u;
          long long v109 = 0u;
          objc_msgSend_objectForKeyedSubscript_(v36, v38, @"inputNames", v39, v40);
          id v107 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v107, v41, (uint64_t)&v108, (uint64_t)v116, 16);
          if (v46)
          {
            uint64_t v47 = *(void *)v109;
            while (2)
            {
              uint64_t v48 = 0;
              uint64_t v49 = v34;
              do
              {
                if (*(void *)v109 != v47) {
                  objc_enumerationMutation(v107);
                }
                uint64_t v50 = *(void *)(*((void *)&v108 + 1) + 8 * v48);
                uint64_t v51 = objc_msgSend_sliderOrder(self, v42, v43, v44, v45);
                uint64_t v55 = objc_msgSend_objectAtIndexedSubscript_(v51, v52, v49 + v48, v53, v54);

                long long v59 = objc_msgSend_objectForKeyedSubscript_(v8, v56, (uint64_t)v55, v57, v58);
                LODWORD(v51) = v59 == 0;

                if (v51)
                {
                  if (v102)
                  {
                    double v94 = objc_msgSend_stringWithFormat_(NSString, v60, @"No value for slider named %@ in sliders dictionary.", v61, v62, v55);
                    objc_msgSend_errorWithCode_message_(IHKError, v95, 6, (uint64_t)v94, v96);
                    id *v102 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  goto LABEL_25;
                }
                long long v63 = objc_msgSend_objectForKeyedSubscript_(v8, v60, (uint64_t)v55, v61, v62);
                objc_msgSend_setObject_forKeyedSubscript_(v37, v64, (uint64_t)v63, v50, v65);

                ++v48;
              }
              while (v46 != v48);
              uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v107, v42, (uint64_t)&v108, (uint64_t)v116, 16);
              uint64_t v34 = v49 + v48;
              if (v46) {
                continue;
              }
              break;
            }
            uint64_t v34 = v49 + v48;
          }

          objc_msgSend_setObject_forKeyedSubscript_(v37, v66, (uint64_t)v103, @"inputImage", v67);
          long long v70 = objc_msgSend_filterWithName_withInputParameters_(MEMORY[0x263F00640], v68, (uint64_t)v105, (uint64_t)v37, v69);
          id v107 = v70;
          if (!v70)
          {
            if (v102)
            {
              uint64_t v55 = objc_msgSend_stringWithFormat_(NSString, v71, @"Could not find filter named %@.", v73, v74, v105);
              objc_msgSend_errorWithCode_message_(IHKError, v98, 5, (uint64_t)v55, v99);
              id *v102 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
            }
            double v75 = 0;
            id v9 = v103;
            goto LABEL_27;
          }
          objc_msgSend_outputImage(v70, v71, v72, v73, v74);
          id v9 = (id)objc_claimAutoreleasedReturnValue();

          id v35 = v9;
          ++v104;
        }
        while (v104 != v100);
        uint64_t v100 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v112, (uint64_t)v117, 16);
        if (v100) {
          continue;
        }
        break;
      }
    }

    id v9 = v9;
    double v75 = v9;
  }
  else
  {
    if (a5)
    {
      double v76 = NSString;
      uint64_t v77 = objc_msgSend_count(v8, v25, v26, v27, v28);
      v82 = objc_msgSend_sliderOrder(self, v78, v79, v80, v81);
      uint64_t v87 = objc_msgSend_count(v82, v83, v84, v85, v86);
      uint64_t v91 = objc_msgSend_stringWithFormat_(v76, v88, @"Number of sliders does not match number of sliders in filter sequence (given: %lu != expected: %lu).", v89, v90, v77, v87);

      objc_msgSend_errorWithCode_message_(IHKError, v92, 7, (uint64_t)v91, v93);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    double v75 = 0;
  }
LABEL_27:

  return v75;
}

- (NSArray)filterSeq
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFilterSeq:(id)a3
{
}

- (NSArray)sliderOrder
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSliderOrder:(id)a3
{
}

- (NSDictionary)sliderSpecs
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSliderSpecs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliderSpecs, 0);
  objc_storeStrong((id *)&self->_sliderOrder, 0);

  objc_storeStrong((id *)&self->_filterSeq, 0);
}

@end