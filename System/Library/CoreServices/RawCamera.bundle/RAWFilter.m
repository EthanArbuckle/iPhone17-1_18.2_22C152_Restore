@interface RAWFilter
+ (id)filterWithDefaultsForClass:(Class)a3;
+ (id)filterWithDefaultsForName:(id)a3;
+ (id)filterWithName:(id)a3;
- (RAWFilter)initWithCoder:(id)a3;
- (id)apply:(id)a3 image:(id)a4 arguments:(id)a5 inoutSpace:(CGColorSpace *)a6 isPremultiplied:(BOOL)a7;
- (id)apply:(id)a3 image:(id)a4 arguments:(id)a5 inoutSpace:(CGColorSpace *)a6 isPremultiplied:(BOOL)a7 isAlphaOne:(BOOL)a8;
- (id)apply:(id)a3 image:(id)a4 extent:(CGRect)a5 roiCallback:(id)a6 arguments:(id)a7 inoutSpace:(CGColorSpace *)a8;
- (id)apply:(id)a3 image:(id)a4 extent:(CGRect)a5 roiCallback:(id)a6 arguments:(id)a7 inoutSpace:(CGColorSpace *)a8 isAlphaOne:(BOOL)a9;
- (id)applyMatrixToImage:(id)a3 vectorR:(id)a4 vectorG:(id)a5 vectorB:(id)a6 vectorBias:(id)a7 inSpace:(CGColorSpace *)a8 outSpace:(CGColorSpace *)a9;
- (void)encodeWithCoder:(id)a3;
- (void)setPrimitiveNumberValue:(id)a3 inVariable:(id *)a4 forKey:(id)a5;
- (void)takeAttributesFromDictionary:(id)a3;
- (void)takeAttributesFromDictionary:(id)a3 forKeys:(id)a4;
@end

@implementation RAWFilter

+ (id)filterWithName:(id)a3
{
  v3 = (NSString *)a3;
  if (objc_msgSend_hasPrefix_(v3, v4, @"RAW", v5, v6))
  {
    NSClassFromString(v3);
    v7 = objc_opt_new();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)takeAttributesFromDictionary:(id)a3
{
  id v11 = a3;
  v8 = objc_msgSend_inputKeys(self, v4, v5, v6, v7);
  objc_msgSend_takeAttributesFromDictionary_forKeys_(self, v9, (uint64_t)v11, (uint64_t)v8, v10);
}

- (void)takeAttributesFromDictionary:(id)a3 forKeys:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = a4;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ((objc_msgSend_isEqualToString_(v13, v7, @"inputImage", v8, v9) & 1) == 0)
        {
          objc_msgSend_objectForKeyedSubscript_(v23, v7, @"valueBlock", v8, v9);
          v17 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = objc_msgSend_stringByReplacingCharactersInRange_withString_(v13, v14, 0, 5, (uint64_t)&stru_1F398F7F8);
            v19 = (objc_class *)objc_opt_class();
            v20 = NSStringFromClass(v19);
            v21 = ((void (**)(void, void *, void *))v17)[2](v17, v20, v18);

            if (v21) {
              goto LABEL_10;
            }
          }
          v21 = objc_msgSend_objectForKeyedSubscript_(v23, v14, (uint64_t)v13, v15, v16);
          if (v21) {
LABEL_10:
          }
            objc_msgSend_setValue_forKey_(self, v14, (uint64_t)v21, (uint64_t)v13, v16);
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v10);
  }
}

+ (id)filterWithDefaultsForName:(id)a3
{
  uint64_t v5 = objc_msgSend_filterWithName_(MEMORY[0x1E4F1E040], a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setDefaults(v5, v6, v7, v8, v9);

  return v5;
}

+ (id)filterWithDefaultsForClass:(Class)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1E040];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v9 = objc_msgSend_filterWithName_(v3, v6, (uint64_t)v5, v7, v8);

  objc_msgSend_setDefaults(v9, v10, v11, v12, v13);

  return v9;
}

- (void)setPrimitiveNumberValue:(id)a3 inVariable:(id *)a4 forKey:(id)a5
{
  id obj = a3;
  id v8 = a5;
  if (*a4 != obj)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = NSNumber;
      objc_msgSend_doubleValue(obj, v9, v10, v11, v12);
      uint64_t v18 = objc_msgSend_numberWithDouble_(v13, v14, v15, v16, v17);

      id obj = (id)v18;
    }
    if (!*a4 || (objc_msgSend_isEqualToNumber_(obj, v9, (uint64_t)*a4, v11, v12) & 1) == 0)
    {
      objc_msgSend_willChangeValueForKey_(self, v9, (uint64_t)v8, v11, v12);
      objc_storeStrong(a4, obj);
      objc_msgSend_didChangeValueForKey_(self, v19, (uint64_t)v8, v20, v21);
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v41 = a3;
  if (objc_msgSend_allowsKeyedCoding(v41, v4, v5, v6, v7))
  {
    uint64_t v12 = objc_msgSend_inputKeys(self, v8, v9, v10, v11);
    uint64_t v20 = objc_msgSend_count(v12, v13, v14, v15, v16);
    if (v20)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        v22 = objc_msgSend_objectAtIndexedSubscript_(v12, v17, i, v18, v19);
        long long v26 = objc_msgSend_valueForKey_(self, v23, (uint64_t)v22, v24, v25);
        if (v26)
        {
          id v27 = [NSString alloc];
          v31 = objc_msgSend_initWithFormat_(v27, v28, @"CI_%@", v29, v30, v22);
          CFTypeID TypeID = CGColorSpaceGetTypeID();
          if (TypeID == CFGetTypeID(v26)
            && ((CFTypeRef v35 = sub_1DDBEE9BC(), v36 = CFEqual(v26, v35), v37 = (CFDataRef)@"Adobe RGB Linear", v36)
             || (CFDataRef v37 = CGColorSpaceCopyICCData((CGColorSpaceRef)v26)) != 0))
          {
            CFDataRef v38 = v37;

            long long v26 = v38;
            objc_msgSend_encodeObject_forKey_(v41, v39, (uint64_t)v38, (uint64_t)v31, v40);
          }
          else
          {
            CFDataRef v38 = 0;
            objc_msgSend_encodeObject_forKey_(v41, v33, (uint64_t)v26, (uint64_t)v31, v34);
          }
        }
      }
    }
  }
  else
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v8, @"CIRequiresKeyedArchiver", @"CoreImage doesn't support old-style archiving", v11);
  }
}

- (RAWFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend_allowsKeyedCoding(v4, v5, v6, v7, v8) & 1) == 0)
  {
    uint64_t v18 = 0;
    goto LABEL_27;
  }
  uint64_t v13 = (RAWFilter *)objc_msgSend_init(self, v9, v10, v11, v12);
  uint64_t v18 = v13;
  if (!v13)
  {
    self = 0;
    goto LABEL_27;
  }
  uint64_t v19 = objc_msgSend_inputKeys(v13, v14, v15, v16, v17);
  uint64_t v27 = objc_msgSend_count(v19, v20, v21, v22, v23);
  if (!v27) {
    goto LABEL_24;
  }
  v56 = v18;
  uint64_t v28 = 0;
  id v29 = 0;
  uint64_t v30 = 0;
  v31 = 0;
  do
  {
    v32 = v31;
    v33 = v30;
    v31 = objc_msgSend_objectAtIndexedSubscript_(v19, v24, v28, v25, v26);

    id v34 = [NSString alloc];
    uint64_t v30 = objc_msgSend_initWithFormat_(v34, v35, @"CI_%@", v36, v37, v31);

    if (!objc_msgSend_containsValueForKey_(v4, v38, (uint64_t)v30, v39, v40))
    {

      id v29 = 0;
      goto LABEL_22;
    }
    v44 = objc_msgSend_decodeObjectForKey_(v4, v41, (uint64_t)v30, v42, v43);

    id v29 = v44;
    if (!v29) {
      goto LABEL_22;
    }
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v29) && CFEqual(v29, @"Adobe RGB Linear"))
    {
      CFTypeRef v46 = sub_1DDBEE9BC();
    }
    else
    {
      CFTypeID v51 = CFDataGetTypeID();
      id v50 = v29;
      if (v51 != CFGetTypeID(v29)) {
        goto LABEL_20;
      }
      id v50 = v29;
      if ((unint64_t)CFDataGetLength((CFDataRef)v29) < 0xFB) {
        goto LABEL_20;
      }
      BytePtr = CFDataGetBytePtr((CFDataRef)v29);
      id v50 = v29;
      if (!BytePtr) {
        goto LABEL_20;
      }
      id v50 = v29;
      if (*((_DWORD *)BytePtr + 9) != 1886610273) {
        goto LABEL_20;
      }
      id v50 = v29;
      if (*((_DWORD *)BytePtr + 4) != 541214546) {
        goto LABEL_20;
      }
      v53 = (CGDataProvider *)CGDataProviderCreateWithCopyOfData();
      id v50 = v29;
      if (!v53) {
        goto LABEL_20;
      }
      CGColorSpaceRef ICCBased = CGColorSpaceCreateICCBased(3uLL, 0, v53, 0);
      CGDataProviderRelease(v53);
      CFTypeRef v46 = CFAutorelease(ICCBased);
    }
    v47 = (void *)v46;

    if (v47)
    {
      id v50 = v47;
LABEL_20:

      id v29 = v50;
    }
    objc_msgSend_setValue_forKey_(v56, v48, (uint64_t)v29, (uint64_t)v31, v49);
LABEL_22:
    ++v28;
  }
  while (v27 != v28);

  uint64_t v18 = v56;
LABEL_24:
  self = v18;

  uint64_t v18 = self;
LABEL_27:

  return v18;
}

- (id)apply:(id)a3 image:(id)a4 extent:(CGRect)a5 roiCallback:(id)a6 arguments:(id)a7 inoutSpace:(CGColorSpace *)a8
{
  uint64_t v8 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a6, a7, a8, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);

  return v8;
}

- (id)apply:(id)a3 image:(id)a4 extent:(CGRect)a5 roiCallback:(id)a6 arguments:(id)a7 inoutSpace:(CGColorSpace *)a8 isAlphaOne:(BOOL)a9
{
  BOOL v9 = a9;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v59 = a3;
  id v18 = a4;
  id v60 = a6;
  id v19 = a7;
  v58 = v18;
  uint64_t v24 = objc_msgSend_count(v19, v20, v21, v22, v23);
  uint64_t v25 = sub_1DDA49F48(v24 + 1);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v67 = v18;
  uint64_t v28 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v26, (uint64_t)&v67, 1, v27);
  v32 = v28;
  if (v19) {
    objc_msgSend_arrayByAddingObjectsFromArray_(v28, v29, (uint64_t)v19, v30, v31);
  }
  else {
  v33 = objc_msgSend_arrayByAddingObjectsFromArray_(v28, v29, MEMORY[0x1E4F1CBF0], v30, v31);
  }

  CFDataRef v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v61, (uint64_t)v68, 16);
  if (v38)
  {
    uint64_t v39 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v38; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v62 != v39) {
          objc_enumerationMutation(v33);
        }
        id v41 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        if (a8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          uint64_t v42 = objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v41, v35, (uint64_t)a8, v36, v37);
          objc_msgSend_addObject_(v25, v43, (uint64_t)v42, v44, v45);
        }
        else
        {
          objc_msgSend_addObject_(v25, v35, (uint64_t)v41, v36, v37);
        }
      }
      CFDataRef v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v35, (uint64_t)&v61, (uint64_t)v68, 16);
    }
    while (v38);
  }

  if (v9)
  {
    uint64_t v65 = *MEMORY[0x1E4F1E328];
    CFDataRef v38 = objc_msgSend_numberWithBool_(NSNumber, v46, 1, v47, v48);
    v66 = v38;
    id v50 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v49, (uint64_t)&v66, (uint64_t)&v65, 1);
    objc_msgSend_applyWithExtent_roiCallback_arguments_options_(v59, v51, (uint64_t)v60, (uint64_t)v25, (uint64_t)v50, x, y, width, height);
  }
  else
  {
    id v50 = 0;
    objc_msgSend_applyWithExtent_roiCallback_arguments_options_(v59, v46, (uint64_t)v60, (uint64_t)v25, 0, x, y, width, height);
  v55 = };
  if (v9)
  {
  }
  if (a8)
  {
    uint64_t v56 = objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v55, v52, (uint64_t)a8, v53, v54);

    v55 = (void *)v56;
  }

  return v55;
}

- (id)apply:(id)a3 image:(id)a4 arguments:(id)a5 inoutSpace:(CGColorSpace *)a6 isPremultiplied:(BOOL)a7
{
  uint64_t v7 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_isAlphaOne_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, 0);

  return v7;
}

- (id)apply:(id)a3 image:(id)a4 arguments:(id)a5 inoutSpace:(CGColorSpace *)a6 isPremultiplied:(BOOL)a7 isAlphaOne:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v84 = a4;
  id v14 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v81 = v8;
    BOOL v82 = v9;
    id v83 = v13;
    uint64_t v23 = objc_msgSend_count(v14, v19, v20, v21, v22);
    uint64_t v24 = sub_1DDA49F48(v23 + 1);
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v91 = v84;
    uint64_t v27 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v25, (uint64_t)&v91, 1, v26);
    uint64_t v31 = v27;
    if (v14) {
      objc_msgSend_arrayByAddingObjectsFromArray_(v27, v28, (uint64_t)v14, v29, v30);
    }
    else {
    v32 = objc_msgSend_arrayByAddingObjectsFromArray_(v27, v28, MEMORY[0x1E4F1CBF0], v29, v30);
    }

    uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v85, (uint64_t)v92, 16);
    if (v37)
    {
      uint64_t v38 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v86 != v38) {
            objc_enumerationMutation(v32);
          }
          uint64_t v40 = *(void **)(*((void *)&v85 + 1) + 8 * i);
          if (a6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v41 = objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v40, v34, (uint64_t)a6, v35, v36);
            objc_msgSend_addObject_(v24, v42, (uint64_t)v41, v43, v44);
          }
          else
          {
            objc_msgSend_addObject_(v24, v34, (uint64_t)v40, v35, v36);
          }
        }
        uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v34, (uint64_t)&v85, (uint64_t)v92, 16);
      }
      while (v37);
    }

    if (v82)
    {
      v32 = objc_msgSend_objectAtIndexedSubscript_(v24, v45, 0, v47, v48);
      uint64_t v53 = objc_msgSend_imageByUnpremultiplyingAlpha(v32, v49, v50, v51, v52);

      objc_msgSend_setObject_atIndexedSubscript_(v24, v54, (uint64_t)v53, 0, v55);
    }
    objc_msgSend_extent(v84, v45, v46, v47, v48);
    double v63 = v59;
    double v64 = v60;
    double v65 = v61;
    double v66 = v62;
    if (v81)
    {
      uint64_t v89 = *MEMORY[0x1E4F1E328];
      v32 = objc_msgSend_numberWithBool_(NSNumber, v56, 1, v57, v58);
      v90 = v32;
      v68 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v67, (uint64_t)&v90, (uint64_t)&v89, 1);
      objc_msgSend_applyWithExtent_arguments_options_(v83, v69, (uint64_t)v24, (uint64_t)v68, v70, v63, v64, v65, v66);
    }
    else
    {
      v68 = 0;
      objc_msgSend_applyWithExtent_arguments_options_(v83, v56, (uint64_t)v24, 0, v58, v59, v60, v61, v62);
    v77 = };
    if (v81)
    {
    }
    if (v82)
    {
      uint64_t v78 = objc_msgSend_imageByPremultiplyingAlpha(v77, v73, v74, v75, v76);

      v77 = (void *)v78;
    }
    if (a6)
    {
      uint64_t v79 = objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v77, v73, (uint64_t)a6, v75, v76);

      v77 = (void *)v79;
    }
    id v72 = v77;
  }
  else
  {
    v71 = objc_msgSend_name(v13, v15, v16, v17, v18);
    NSLog(&cfstr_KernelShouldBe.isa, v71);

    id v72 = 0;
  }

  return v72;
}

- (id)applyMatrixToImage:(id)a3 vectorR:(id)a4 vectorG:(id)a5 vectorB:(id)a6 vectorBias:(id)a7 inSpace:(CGColorSpace *)a8 outSpace:(CGColorSpace *)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  objc_msgSend_W(v15, v19, v20, v21, v22);
  if (v27 == 0.0
    && (objc_msgSend_W(v16, v23, v24, v25, v26), v32 == 0.0)
    && (objc_msgSend_W(v17, v28, v29, v30, v31), v37 == 0.0)
    && (objc_msgSend_W(v18, v33, v34, v35, v36), v42 == 0.0))
  {
    if (a8)
    {
      uint64_t v45 = objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v14, v38, (uint64_t)a8, v40, v41);

      id v14 = (id)v45;
    }
    uint64_t v50 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v38, v39, v40, v41, 0.0, 0.0, 0.0, 1.0);
    uint64_t v51 = v18;
    if (!v18)
    {
      uint64_t v51 = objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E4F1E080], v46, v47, v48, v49, 0.0, 0.0, 0.0);
    }
    uint64_t v52 = objc_msgSend_filteredImage_keysAndValues_(v14, v46, @"CIColorMatrix", @"inputRVector", v49, v15, @"inputGVector", v16, @"inputBVector", v17, @"inputAVector", v50, @"inputBiasVector", v51, 0);

    if (!v18) {
    if (a9)
    }
    {
      uint64_t v56 = objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v52, v53, (uint64_t)a9, v54, v55);

      id v14 = (id)v56;
    }
    else
    {
      id v14 = v52;
    }
  }
  else
  {
    NSLog(&cfstr_VectorsOfRGBBi.isa);
  }
  id v43 = v14;

  return v43;
}

@end