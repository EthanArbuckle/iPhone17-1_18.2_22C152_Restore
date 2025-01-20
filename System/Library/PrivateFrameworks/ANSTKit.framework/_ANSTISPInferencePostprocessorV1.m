@interface _ANSTISPInferencePostprocessorV1
+ (id)_semanticCategories;
+ (id)_semanticSegmentationMaskDescriptorNameOfCategory:(id)a3;
+ (id)_semanticSegmentationMaskDescriptorsForInferenceDescriptor:(id)a3 maskPixelFormatType:(unsigned int)a4;
- (BOOL)_getInputImageAcOrientation:(int *)a3 withError:(id *)a4;
- (BOOL)_populateAcANSTNetOutput:(int)a3 intoSegmanticSegmentationMask:(id)a4 withError:(id *)a5;
- (BOOL)processWithError:(id *)a3;
- (_ANSTISPInferencePostprocessorV1)initWithInferenceDescriptor:(id)a3 error:(id *)a4;
- (_ANSTISPInferencePostprocessorV1)initWithInferenceInputDescriptors:(id)a3 inferenceOutputDescriptors:(id)a4 processedOutputDescriptors:(id)a5 error:(id *)a6;
- (float)smudgeConfidence;
- (id)semanticSegmentationMaskDescriptorOfCategory:(id)a3;
- (id)trackedObjectsOfCategory:(id)a3;
- (void)dealloc;
@end

@implementation _ANSTISPInferencePostprocessorV1

- (_ANSTISPInferencePostprocessorV1)initWithInferenceInputDescriptors:(id)a3 inferenceOutputDescriptors:(id)a4 processedOutputDescriptors:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  result = (_ANSTISPInferencePostprocessorV1 *)objc_msgSend_doesNotRecognizeSelector_(self, v13, (uint64_t)a2);
  __break(1u);
  return result;
}

- (_ANSTISPInferencePostprocessorV1)initWithInferenceDescriptor:(id)a3 error:(id *)a4
{
  v70[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v9 = objc_msgSend_configuration(v6, v7, v8);
  if (objc_msgSend_useE5(v9, v10, v11)) {
    uint64_t v12 = 1278226536;
  }
  else {
    uint64_t v12 = 1278226488;
  }

  v15 = objc_msgSend_inputImageDescriptor(v6, v13, v14);
  v70[0] = v15;
  v17 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v16, (uint64_t)v70, 1);
  v20 = objc_msgSend_outputDescriptors(v6, v18, v19);
  v21 = objc_opt_class();
  v23 = objc_msgSend__semanticSegmentationMaskDescriptorsForInferenceDescriptor_maskPixelFormatType_(v21, v22, (uint64_t)v6, v12);
  v67.receiver = self;
  v67.super_class = (Class)_ANSTISPInferencePostprocessorV1;
  v24 = [(ANSTInferencePostprocessor *)&v67 initWithInferenceInputDescriptors:v17 inferenceOutputDescriptors:v20 processedOutputDescriptors:v23 error:a4];

  if (!v24) {
    goto LABEL_15;
  }
  v27 = objc_msgSend_configuration(v6, v25, v26);
  uint64_t v30 = objc_msgSend_copy(v27, v28, v29);
  v31 = (void *)*((void *)v24 + 8);
  *((void *)v24 + 8) = v30;

  v34 = objc_msgSend_inputImageDescriptor(v6, v32, v33);
  uint64_t v37 = objc_msgSend_name(v34, v35, v36);
  v38 = (void *)*((void *)v24 + 9);
  *((void *)v24 + 9) = v37;

  v41 = objc_msgSend_inputImageDescriptor(v6, v39, v40);
  *((void *)v24 + 10) = objc_msgSend_width(v41, v42, v43);

  v46 = objc_msgSend_inputImageDescriptor(v6, v44, v45);
  *((void *)v24 + 11) = objc_msgSend_height(v46, v47, v48);

  v51 = objc_msgSend_outputDescriptors(v6, v49, v50);
  v52 = NSStringFromSelector(sel_name);
  uint64_t v54 = objc_msgSend_valueForKey_(v51, v53, (uint64_t)v52);
  v55 = (void *)*((void *)v24 + 12);
  *((void *)v24 + 12) = v54;

  char v66 = 0;
  v56 = (uint64_t **)(v24 + 104);
  uint64_t v58 = AcANSTCreate((uint64_t)(v24 + 104), (uint64_t)&v66);
  if (v58
    || (uint64_t v58 = AcANSTStart(*v56, (uint64_t)(v24 + 2512)), v58)
    || (uint64_t v58 = AcANSTGetParams(*v56, (_DWORD *)v24 + 628, (uint64_t)(v24 + 112)), v58)
    || (uint64_t v58 = AcANSTUseLowThresholds(*v56), v58)
    || (uint64_t v58 = AcANSTSetRunSaliency(*v56, 1), v58)
    || (uint64_t v58 = AcANSTSetRunSaliencyObjectDetection(*v56, 1), v58)
    || (uint64_t v58 = AcANSTSetRunViSeg(*v56, 1), v58))
  {
    if (a4)
    {
      v59 = (void *)MEMORY[0x263F087E8];
      v68[0] = *MEMORY[0x263F07F80];
      v68[1] = @"AcReturn";
      v69[0] = @"Failed to set up AcANST for post-processing.";
      v60 = objc_msgSend_numberWithInt_(NSNumber, v57, v58);
      v69[1] = v60;
      v62 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v61, (uint64_t)v69, v68, 2);
      objc_msgSend_errorWithDomain_code_userInfo_(v59, v63, @"ANSTErrorDomain", 3, v62);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v64 = 0;
  }
  else
  {
LABEL_15:
    v64 = v24;
  }

  return v64;
}

- (void)dealloc
{
  det = self->_det;
  if (det)
  {
    AcANSTStop(det);
    AcANSTDestroy((uint64_t)self->_det);
  }
  v4.receiver = self;
  v4.super_class = (Class)_ANSTISPInferencePostprocessorV1;
  [(_ANSTISPInferencePostprocessorV1 *)&v4 dealloc];
}

- (BOOL)_getInputImageAcOrientation:(int *)a3 withError:(id *)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  v7 = objc_msgSend_inputPixelBufferForDescriptorNamed_(self, a2, (uint64_t)self->_inferenceInputImageDescriptorName);
  id v10 = v7;
  if (v7)
  {
    switch(objc_msgSend_orientation(v7, v8, v9))
    {
      case 1u:
        *a3 = 0;
        goto LABEL_15;
      case 2u:
      case 4u:
      case 5u:
      case 7u:
        if (!a4) {
          goto LABEL_8;
        }
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v11, @"ANSTErrorDomain", 17, 0);
        goto LABEL_5;
      case 3u:
        int v18 = 2;
        goto LABEL_14;
      case 6u:
        int v18 = 3;
LABEL_14:
        *a3 = v18;
LABEL_15:
        BOOL v12 = 1;
        break;
      case 8u:
        BOOL v12 = 1;
        *a3 = 1;
        break;
      default:
        if (!a4) {
          goto LABEL_8;
        }
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v11, @"ANSTErrorDomain", 16, 0);
LABEL_5:
        BOOL v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  else
  {
    if (a4)
    {
      v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = objc_msgSend_stringWithFormat_(NSString, v8, @"Missing input pixel buffer for descriptor named: %@", self->_inferenceInputImageDescriptorName, *MEMORY[0x263F07F80]);
      v21[0] = v14;
      v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v15, (uint64_t)v21, &v20, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v13, v17, @"ANSTErrorDomain", 15, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_8:
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_populateAcANSTNetOutput:(int)a3 intoSegmanticSegmentationMask:(id)a4 withError:(id *)a5
{
  v78[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v10 = objc_msgSend_objectAtIndex_(self->_inferenceOutputTensorDescriptorNames, v9, a3);
  BOOL v12 = objc_msgSend_inputTensorDataForDescriptorNamed_(self, v11, (uint64_t)v10);
  v15 = v12;
  if (v12)
  {
    v16 = objc_msgSend_tensorDescriptor(v12, v13, v14);
    uint64_t v19 = objc_msgSend_dataType(v16, v17, v18);
    if (objc_msgSend_useE5(self->_configuration, v20, v21)) {
      uint64_t v24 = 104;
    }
    else {
      uint64_t v24 = 102;
    }
    unint64_t v25 = objc_msgSend_numberOfDimensions(v16, v22, v23);
    if (v19 == v24)
    {
      unint64_t v28 = v25;
      uint64_t v29 = v25 - 2;
      if (v25 < 2) {
        goto LABEL_30;
      }
      if (v25 == 2) {
        goto LABEL_21;
      }
      uint64_t v30 = 0;
      BOOL v31 = 1;
      do
      {
        while (!v31)
        {
          BOOL v31 = 0;
          if (++v30 == v29) {
            goto LABEL_30;
          }
        }
        uint64_t v32 = objc_msgSend_lengthOfDimensionAt_(v16, v26, v30);
        BOOL v31 = v32 == 1;
        ++v30;
      }
      while (v30 != v29);
      if (v32 == 1)
      {
LABEL_21:
        uint64_t v41 = objc_msgSend_lengthOfDimensionAt_(v16, v26, v29);
        uint64_t v43 = objc_msgSend_lengthOfDimensionAt_(v16, v42, v28 - 1);
        if (objc_msgSend_useE5(self->_configuration, v44, v45)) {
          int v48 = 1278226536;
        }
        else {
          int v48 = 1278226488;
        }
        v49 = (__CVBuffer *)objc_msgSend_pixelBuffer(v8, v46, v47);
        if (v41 == CVPixelBufferGetHeight(v49)
          && v43 == CVPixelBufferGetWidth(v49)
          && v48 == CVPixelBufferGetPixelFormatType(v49))
        {
          if (!CVPixelBufferLockBaseAddress(v49, 0))
          {
            v67[0] = MEMORY[0x263EF8330];
            v67[1] = 3221225472;
            v67[2] = sub_246D72838;
            v67[3] = &unk_265203068;
            v67[4] = v16;
            v67[5] = v28;
            int v68 = v48;
            v67[6] = v49;
            v67[7] = v41;
            v67[8] = v43;
            LOBYTE(a5) = objc_msgSend_performDataAccessWithOptions_usingBlock_error_(v15, v52, 0, v67, a5);
            CVPixelBufferUnlockBaseAddress(v49, 0);
            goto LABEL_36;
          }
          if (a5)
          {
            v53 = (void *)MEMORY[0x263F087E8];
            uint64_t v69 = *MEMORY[0x263F07F80];
            v70 = @"Unable to lock pixel CVPixelBuffer for writing.";
            v35 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v52, (uint64_t)&v70, &v69, 1);
            objc_msgSend_errorWithDomain_code_userInfo_(v53, v54, @"ANSTErrorDomain", 19, v35);
            goto LABEL_16;
          }
LABEL_36:

          goto LABEL_37;
        }
        if (!a5) {
          goto LABEL_36;
        }
        v55 = (void *)MEMORY[0x263F087E8];
        uint64_t v71 = *MEMORY[0x263F07F80];
        v61 = NSString;
        v57 = objc_msgSend_name(v16, v50, v51);
        v59 = objc_msgSend_stringWithFormat_(v61, v62, @"Invalid tensor shape for descriptor named: %@", v57);
        v72 = v59;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v63, (uint64_t)&v72, &v71, 1);
      }
      else
      {
LABEL_30:
        if (!a5) {
          goto LABEL_36;
        }
        v55 = (void *)MEMORY[0x263F087E8];
        uint64_t v73 = *MEMORY[0x263F07F80];
        v56 = NSString;
        v57 = objc_msgSend_name(v16, v26, v27);
        v59 = objc_msgSend_stringWithFormat_(v56, v58, @"Invalid tensor shape for descriptor named: %@", v57);
        v74 = v59;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v60, (uint64_t)&v74, &v73, 1);
      v64 = };
      objc_msgSend_errorWithDomain_code_userInfo_(v55, v65, @"ANSTErrorDomain", 11, v64);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_35;
    }
    if (a5)
    {
      uint64_t v37 = (void *)MEMORY[0x263F087E8];
      uint64_t v75 = *MEMORY[0x263F07F80];
      v35 = objc_msgSend_stringWithFormat_(NSString, v26, @"Invalid tensor data type for descriptor named: %@", v10);
      v76 = v35;
      v39 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v38, (uint64_t)&v76, &v75, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v37, v40, @"ANSTErrorDomain", 11, v39);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }
    goto LABEL_36;
  }
  if (a5)
  {
    uint64_t v33 = (void *)MEMORY[0x263F087E8];
    uint64_t v77 = *MEMORY[0x263F07F80];
    v16 = objc_msgSend_stringWithFormat_(NSString, v13, @"Missing input tensor data for descriptor named: %@", v10);
    v78[0] = v16;
    v35 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v34, (uint64_t)v78, &v77, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v33, v36, @"ANSTErrorDomain", 15, v35);
LABEL_16:
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_35:
    LOBYTE(a5) = 0;
    goto LABEL_36;
  }
LABEL_37:

  return (char)a5;
}

- (BOOL)processWithError:(id *)a3
{
  v3 = (void **)MEMORY[0x270FA5388](self, a2);
  v142[1] = *MEMORY[0x263EF8340];
  long long v121 = 0uLL;
  float32x2_t v122 = 0;
  unsigned int v4 = *((_DWORD *)v3 + 22);
  LODWORD(v120) = *((_DWORD *)v3 + 20);
  *(void *)((char *)&v120 + 4) = __PAIR64__(v120, v4);
  HIDWORD(v120) = v4;
  v110 = v5;
  v111 = v3;
  if (!objc_msgSend__getInputImageAcOrientation_withError_(v3, v6, (uint64_t)&v121)) {
    return 0;
  }
  BYTE5(v121) = objc_msgSend_frameRate(v111[8], v7, v8) == 1;
  *((void *)&v121 + 1) = 0;
  float32x2_t v122 = vcvt_f32_u32(*(uint32x2_t *)&v120);
  uint64_t v135 = 0;
  v136 = &v135;
  uint64_t v137 = 0x524810000000;
  v138 = &unk_246DA7831;
  bzero(&v139, 0x5228uLL);
  if (!objc_msgSend_isObjectTrackingEnabled(v111[8], v9, v10)) {
    goto LABEL_43;
  }
  id v13 = objc_alloc(MEMORY[0x263EFF980]);
  v109 = objc_msgSend_initWithCapacity_(v13, v14, 25);
  for (uint64_t i = 0; i != 25; ++i)
  {
    v17 = objc_msgSend_objectAtIndex_(v111[12], v15, i);
    uint64_t v19 = objc_msgSend_inputTensorDataForDescriptorNamed_(v111, v18, (uint64_t)v17);
    v22 = v19;
    if (!v19)
    {
      if (v110)
      {
        v65 = (void *)MEMORY[0x263F087E8];
        uint64_t v132 = *MEMORY[0x263F07F80];
        char v66 = objc_msgSend_stringWithFormat_(NSString, v20, @"Missing input tensor data for descriptor named: %@", v17);
        v133 = v66;
        int v68 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v67, (uint64_t)&v133, &v132, 1);
        objc_msgSend_errorWithDomain_code_userInfo_(v65, v69, @"ANSTErrorDomain", 15, v68);
        void *v110 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_41;
    }
    uint64_t v23 = objc_msgSend_tensorDescriptor(v19, v20, v21);
    uint64_t v26 = objc_msgSend_dataType(v23, v24, v25);
    unint64_t v29 = objc_msgSend_numberOfDimensions(v23, v27, v28);
    unint64_t v32 = v29;
    BOOL v34 = v26 == 104 || v26 == 102;
    uint64_t v35 = v29 - 1;
    BOOL v36 = v34 && v29 > 1;
    if (v34 && (unint64_t v37 = v29 - 3, v29 >= 3))
    {
      int v38 = objc_msgSend_lengthOfDimensionAt_(v23, v30, v29 - 3);
      if (v32 != 3)
      {
        v108 = v17;
        uint64_t v39 = 0;
        do
          BOOL v36 = v36 && objc_msgSend_lengthOfDimensionAt_(v23, v30, v39++) == 1;
        while (v37 != v39);
        v17 = v108;
      }
    }
    else
    {
      int v38 = 1;
    }
    if (!v36)
    {
      if (v110)
      {
        v70 = (void *)MEMORY[0x263F087E8];
        v142[0] = *MEMORY[0x263F07F80];
        uint64_t v71 = NSString;
        v72 = objc_msgSend_name(v23, v30, v31);
        v74 = objc_msgSend_stringWithFormat_(v71, v73, @"Invalid tensor shape for descriptor named: %@", v72);
        v128 = v74;
        v76 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v75, (uint64_t)&v128, v142, 1);
        v78 = objc_msgSend_errorWithDomain_code_userInfo_(v70, v77, @"ANSTErrorDomain", 11, v76);
        goto LABEL_39;
      }
LABEL_40:

LABEL_41:
      BOOL v64 = 0;
      id v48 = v109;
      goto LABEL_62;
    }
    v134[3 * i] = 0;
    LODWORD(v134[3 * i + 1]) = objc_msgSend_lengthOfDimensionAt_(v23, v30, v32 - 2) * v38;
    HIDWORD(v134[3 * i + 1]) = objc_msgSend_lengthOfDimensionAt_(v23, v40, v35);
    LODWORD(v134[3 * i + 2]) = objc_msgSend_strideOfDimensionAt_(v23, v41, v32 - 2);
    if (v26 == 102)
    {
      int v44 = 6;
    }
    else
    {
      if (v26 != 104)
      {
        if (v110)
        {
          v79 = (void *)MEMORY[0x263F087E8];
          uint64_t v140 = *MEMORY[0x263F07F80];
          v80 = NSString;
          v72 = objc_msgSend_name(v23, v42, v43);
          v74 = objc_msgSend_stringWithFormat_(v80, v81, @"Invalid tensor data type for descriptor named: %@", v72);
          v141 = v74;
          v76 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v82, (uint64_t)&v141, &v140, 1);
          v78 = objc_msgSend_errorWithDomain_code_userInfo_(v79, v83, @"ANSTErrorDomain", 11, v76);
LABEL_39:
          void *v110 = v78;
        }
        goto LABEL_40;
      }
      int v44 = 7;
    }
    HIDWORD(v134[3 * i + 2]) = v44;

    objc_msgSend_addObject_(v109, v45, (uint64_t)v22);
  }
  v128 = 0;
  v129 = &v128;
  uint64_t v130 = 0x2020000000;
  int v131 = 0;
  v116[0] = MEMORY[0x263EF8330];
  v116[1] = 3221225472;
  v116[2] = sub_246D732C8;
  v116[3] = &unk_265203090;
  v116[5] = &v128;
  v116[4] = v111;
  long long v117 = v120;
  long long v118 = v121;
  float32x2_t v119 = v122;
  v116[6] = &v135;
  v116[7] = v134;
  v46 = (objc_class *)MEMORY[0x263F08A88];
  uint64_t v47 = v116;
  id v48 = v109;
  id v49 = [v46 alloc];
  uint64_t v51 = objc_msgSend_initWithOptions_(v49, v50, 258);
  uint64_t v54 = objc_msgSend_objectEnumerator(v48, v52, v53);
  id v55 = v48;

  char v56 = sub_246D739B4(v54, 0, v51, v47, v110);
  if (v56)
  {
    uint64_t v58 = *((unsigned int *)v129 + 6);
    if (v58)
    {
      if (v110)
      {
        v59 = (void *)MEMORY[0x263F087E8];
        v126[0] = *MEMORY[0x263F07F80];
        v126[1] = @"AcReturn";
        v127[0] = @"Failed to perform AcANST post-processing.";
        v60 = objc_msgSend_numberWithInt_(NSNumber, v57, v58);
        v127[1] = v60;
        v62 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v61, (uint64_t)v127, v126, 2);
        objc_msgSend_errorWithDomain_code_userInfo_(v59, v63, @"ANSTErrorDomain", 18, v62);
        void *v110 = (id)objc_claimAutoreleasedReturnValue();

        id v48 = v55;
      }
      goto LABEL_31;
    }
    _Block_object_dispose(&v128, 8);

LABEL_43:
    if (objc_msgSend_isSegmentationEnabled(v111[8], v11, v12))
    {
      v124[0] = @"Person";
      v124[1] = @"SalientPerson";
      v125[0] = &unk_26FB499C8;
      v125[1] = &unk_26FB499E0;
      v124[2] = @"Skin";
      v124[3] = @"Hair";
      v125[2] = &unk_26FB499F8;
      v125[3] = &unk_26FB49A10;
      v124[4] = @"Sky";
      v125[4] = &unk_26FB49A28;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v84, (uint64_t)v125, v124, 5);
      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      id v48 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v85, (uint64_t)&v112, v123, 16);
      if (v86)
      {
        uint64_t v87 = *(void *)v113;
        while (2)
        {
          for (uint64_t j = 0; j != v86; ++j)
          {
            if (*(void *)v113 != v87) {
              objc_enumerationMutation(v48);
            }
            uint64_t v89 = *(void *)(*((void *)&v112 + 1) + 8 * j);
            v90 = objc_opt_class();
            v93 = objc_msgSend__semanticSegmentationMaskDescriptorNameOfCategory_(v90, v91, v89);
            if (v93)
            {
              v95 = objc_msgSend_outputPixelBufferForDescriptorNamed_(v111, v92, (uint64_t)v93);
              if (v95)
              {
                v96 = objc_msgSend_objectForKeyedSubscript_(v48, v94, v89);
                uint64_t v99 = objc_msgSend_intValue(v96, v97, v98);
                int v101 = objc_msgSend__populateAcANSTNetOutput_intoSegmanticSegmentationMask_withError_(v111, v100, v99, v95, v110);

                if (!v101)
                {

                  goto LABEL_61;
                }
              }
            }
          }
          uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v92, (uint64_t)&v112, v123, 16);
          if (v86) {
            continue;
          }
          break;
        }
      }
    }
    v102 = [ANSTISPAlgorithmResult alloc];
    if (objc_msgSend_isObjectTrackingEnabled(v111[8], v103, v104)) {
      uint64_t v106 = objc_msgSend_initWithAcResult_personMask_salientPersonMask_skinMask_hairMask_skyMask_saliencyMask_(v102, v105, (uint64_t)(v136 + 4), 0, 0, 0, 0, 0, 0);
    }
    else {
      uint64_t v106 = objc_msgSend_initWithAcResult_personMask_salientPersonMask_skinMask_hairMask_skyMask_saliencyMask_(v102, v105, 0, 0, 0, 0, 0, 0, 0);
    }
    id v48 = v111[25616];
    v111[25616] = (void *)v106;
    BOOL v64 = 1;
  }
  else
  {
LABEL_31:
    _Block_object_dispose(&v128, 8);
LABEL_61:
    BOOL v64 = 0;
  }
LABEL_62:

  _Block_object_dispose(&v135, 8);
  return v64;
}

- (float)smudgeConfidence
{
  v3 = self->_result;
  if (!v3) {
    return NAN;
  }
  int v4 = objc_msgSend_smudgeConfidence(v3, a2, v2);
  int v5 = v4 & ~(v4 >> 31);
  if (v5 >= 0x3E8) {
    int v5 = 1000;
  }
  return (float)v5 / 1000.0;
}

- (id)trackedObjectsOfCategory:(id)a3
{
  v3 = self->_result;
  if (v3)
  {
    v3 = objc_msgSend_detectedObjectsForCategory_(v3, a2, (uint64_t)a3);
  }
  return v3;
}

- (id)semanticSegmentationMaskDescriptorOfCategory:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = objc_opt_class();
  v7 = objc_msgSend__semanticSegmentationMaskDescriptorNameOfCategory_(v5, v6, (uint64_t)v4);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = objc_msgSend_processedOutputPixelBufferDescriptors(self, v8, v9, 0);
  id v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v22, v26, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v10);
        }
        v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend_name(v17, v12, v13);
        char isEqualToString = objc_msgSend_isEqualToString_(v18, v19, (uint64_t)v7);

        if (isEqualToString)
        {
          id v14 = v17;
          goto LABEL_11;
        }
      }
      id v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v22, v26, 16);
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v14;
}

+ (id)_semanticSegmentationMaskDescriptorNameOfCategory:(id)a3
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"$postprocessed$%@", a3);
}

+ (id)_semanticSegmentationMaskDescriptorsForInferenceDescriptor:(id)a3 maskPixelFormatType:(unsigned int)a4
{
  v60[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_configuration(v5, v6, v7);
  int isSegmentationEnabled = objc_msgSend_isSegmentationEnabled(v8, v9, v10);

  if (isSegmentationEnabled)
  {
    id v14 = objc_msgSend_inputImageDescriptor(v5, v12, v13);
    unint64_t v17 = objc_msgSend_width(v14, v15, v16);

    id v51 = v5;
    uint64_t v20 = objc_msgSend_inputImageDescriptor(v5, v18, v19);
    unint64_t v23 = objc_msgSend_height(v20, v21, v22);

    uint64_t v59 = *MEMORY[0x263F04130];
    v60[0] = MEMORY[0x263EFFA78];
    long long v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v24, (uint64_t)v60, &v59, 1);
    id v26 = objc_alloc(MEMORY[0x263EFF980]);
    unint64_t v29 = objc_msgSend__semanticCategories(a1, v27, v28);
    uint64_t v32 = objc_msgSend_count(v29, v30, v31);
    BOOL v34 = objc_msgSend_initWithCapacity_(v26, v33, v32);

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    objc_msgSend__semanticCategories(a1, v35, v36);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v54, v58, 16);
    if (v38)
    {
      uint64_t v40 = v38;
      unint64_t v41 = v17 >> 1;
      unint64_t v42 = v23 >> 1;
      uint64_t v43 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v55 != v43) {
            objc_enumerationMutation(obj);
          }
          uint64_t v45 = objc_msgSend__semanticSegmentationMaskDescriptorNameOfCategory_(a1, v39, *(void *)(*((void *)&v54 + 1) + 8 * i));
          v46 = [ANSTPixelBufferDescriptor alloc];
          id v48 = objc_msgSend_initWithName_width_height_pixelFormatType_pixelBufferAttributes_error_(v46, v47, (uint64_t)v45, v41, v42, a4, v25, 0);
          objc_msgSend_addObject_(v34, v49, (uint64_t)v48);
        }
        uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v54, v58, 16);
      }
      while (v40);
    }

    id v5 = v51;
  }
  else
  {
    BOOL v34 = (void *)MEMORY[0x263EFFA68];
  }

  return v34;
}

+ (id)_semanticCategories
{
  v4[5] = *MEMORY[0x263EF8340];
  v4[0] = @"Person";
  v4[1] = @"SalientPerson";
  v4[2] = @"Skin";
  v4[3] = @"Hair";
  v4[4] = @"Sky";
  uint64_t v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v4, 5);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_inferenceOutputTensorDescriptorNames, 0);
  objc_storeStrong((id *)&self->_inferenceInputImageDescriptorName, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end