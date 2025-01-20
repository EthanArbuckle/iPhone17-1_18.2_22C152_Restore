@interface CHE5MLUtilities
+ (__IOSurface)createInputSurfaceForMultiArray:(id)a3;
+ (id)createInputSurfacesForFeatureProvider:(id)a3;
+ (id)featureProviderForE5RTOutputs:(id)a3 functionDescriptor:(id)a4 dataType:(int64_t)a5 error:(id *)a6;
+ (id)multiArrayForOutput:(id)a3 inNamedObjects:(id)a4 functionDescriptor:(id)a5 dataType:(int64_t)a6 error:(id *)a7;
+ (id)newE5RTExecutionOutputsForFunctionDescriptor:(id)a3 error:(id *)a4;
+ (id)newInputsForFunctionDescriptor:(id)a3 surfaces:(id)a4 error:(id *)a5;
@end

@implementation CHE5MLUtilities

+ (__IOSurface)createInputSurfaceForMultiArray:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (objc_msgSend_dataType(v3, v4, v5, v6, v7, v8) != 65568)
  {
    if (qword_1EA3CA000 == -1)
    {
      v14 = (id)qword_1EA3C9F90[0];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
LABEL_5:

        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      v14 = (id)qword_1EA3C9F90[0];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        goto LABEL_5;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v14, OS_LOG_TYPE_FAULT, "Only MLMultiArrayDataTypeFloat32 inputs are supported.", buf, 2u);
    goto LABEL_5;
  }
LABEL_6:
  uint64_t v15 = objc_msgSend_count(v3, v9, v10, v11, v12, v13);
  v18 = CHCreateIOSurface(v15, (const char *)1, 2, 2 * v15, v16, v17);
  uint64_t v23 = IOSurfaceLock(v18, 0, 0);
  if (v23)
  {
    if (qword_1EA3CA000 == -1)
    {
      v24 = (id)qword_1EA3C9F90[0];
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
LABEL_14:

        v18 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      v24 = (id)qword_1EA3C9F90[0];
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
    }
    v29 = objc_msgSend_numberWithInt_(NSNumber, v25, v23, v26, v27, v28);
    *(_DWORD *)buf = 134218242;
    v39 = v18;
    __int16 v40 = 2112;
    v41 = v29;
    _os_log_impl(&dword_1C492D000, v24, OS_LOG_TYPE_ERROR, "Could not lock IOSurfaceRef %p (%@)", buf, 0x16u);

    goto LABEL_14;
  }
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = sub_1C4BDC230;
  v37[3] = &unk_1E64E4E70;
  v37[4] = 4 * v15;
  v37[5] = v18;
  v37[6] = v15;
  objc_msgSend_getBytesWithHandler_(v3, v19, (uint64_t)v37, v20, v21, v22);
  uint64_t v30 = IOSurfaceUnlock(v18, 0, 0);
  if (v30)
  {
    if (qword_1EA3CA000 == -1)
    {
      v24 = (id)qword_1EA3C9F90[0];
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      v24 = (id)qword_1EA3C9F90[0];
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
    }
    v35 = objc_msgSend_numberWithInt_(NSNumber, v31, v30, v32, v33, v34);
    *(_DWORD *)buf = 134218242;
    v39 = v18;
    __int16 v40 = 2112;
    v41 = v35;
    _os_log_impl(&dword_1C492D000, v24, OS_LOG_TYPE_ERROR, "Could not unlock IOSurfaceRef %p (%@)", buf, 0x16u);

    goto LABEL_14;
  }
LABEL_15:

  return v18;
}

+ (id)createInputSurfacesForFeatureProvider:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v9 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v4, v5, v6, v7, v8);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  objc_msgSend_featureNames(v3, v10, v11, v12, v13, v14);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v53, (uint64_t)v57, 16, v16);
  if (v21)
  {
    uint64_t v22 = *(void *)v54;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v54 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v53 + 1) + 8 * i);
        v25 = objc_msgSend_featureValueForName_(v3, v17, v24, v18, v19, v20);
        v31 = objc_msgSend_multiArrayValue(v25, v26, v27, v28, v29, v30);

        uint64_t InputSurfaceForMultiArray = objc_msgSend_createInputSurfaceForMultiArray_(CHE5MLUtilities, v32, (uint64_t)v31, v33, v34, v35);
        if (!InputSurfaceForMultiArray)
        {

          v50 = 0;
          goto LABEL_11;
        }
        v41 = objc_msgSend_valueWithPointer_(MEMORY[0x1E4F29238], v36, InputSurfaceForMultiArray, v38, v39, v40);
        objc_msgSend_setObject_forKeyedSubscript_(v9, v42, (uint64_t)v41, v24, v43, v44);
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v53, (uint64_t)v57, 16, v20);
      if (v21) {
        continue;
      }
      break;
    }
  }

  v50 = objc_msgSend_copy(v9, v45, v46, v47, v48, v49);
LABEL_11:

  return v50;
}

+ (id)newInputsForFunctionDescriptor:(id)a3 surfaces:(id)a4 error:(id *)a5
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v98 = a4;
  v93 = v6;
  id v97 = objc_alloc_init(MEMORY[0x1E4FB3ED8]);
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  uint64_t v12 = objc_msgSend_allInputs(v6, v7, v8, v9, v10, v11);
  id obj = v12;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v99, (uint64_t)v109, 16, v14);
  if (v20)
  {
    uint64_t v95 = *(void *)v100;
    while (2)
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v100 != v95) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void **)(*((void *)&v99 + 1) + 8 * v21);
        uint64_t v23 = objc_msgSend_name(v22, v15, v16, v17, v18, v19);
        uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v98, v24, (uint64_t)v23, v25, v26, v27);
        uint64_t v34 = (__IOSurface *)objc_msgSend_pointerValue(v28, v29, v30, v31, v32, v33);

        size_t Height = IOSurfaceGetHeight(v34);
        size_t BytesPerRow = IOSurfaceGetBytesPerRow(v34);
        objc_msgSend_strides(v22, v37, v38, v39, v40, v41);
        id v42 = objc_claimAutoreleasedReturnValue();
        size_t v48 = BytesPerRow * Height;
        LOBYTE(BytesPerRow) = BytesPerRow * Height == *objc_msgSend_byteOffsets(v42, v43, v44, v45, v46, v47);

        if ((BytesPerRow & 1) == 0)
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          long long v54 = (id)qword_1EA3C9F90[0];
          if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend_strides(v22, v55, v56, v57, v58, v59);
            id v60 = objc_claimAutoreleasedReturnValue();
            uint64_t v66 = *objc_msgSend_byteOffsets(v60, v61, v62, v63, v64, v65);
            *(_DWORD *)buf = 134218240;
            size_t v104 = v48;
            __int16 v105 = 2048;
            uint64_t v106 = v66;
            _os_log_impl(&dword_1C492D000, v54, OS_LOG_TYPE_FAULT, "Size mismatch! IOSurface bytes: %ld, input descriptor bytes: %ld", buf, 0x16u);
          }
        }
        unint64_t v67 = 0;
        uint64_t v68 = 1;
        while (1)
        {
          v69 = objc_msgSend_shape(v22, v49, v50, v51, v52, v53);
          BOOL v75 = v67 < objc_msgSend_rank(v69, v70, v71, v72, v73, v74);

          if (!v75) {
            break;
          }
          objc_msgSend_shape(v22, v76, v77, v78, v79, v80);
          id v81 = objc_claimAutoreleasedReturnValue();
          uint64_t v87 = *(void *)(objc_msgSend_sizes(v81, v82, v83, v84, v85, v86) + 8 * v67);

          v68 *= v87;
          ++v67;
        }
        if (v48 != 2 * v68)
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          v88 = (id)qword_1EA3C9F90[0];
          if (os_log_type_enabled(v88, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134218498;
            size_t v104 = v48;
            __int16 v105 = 2048;
            uint64_t v106 = v68;
            __int16 v107 = 2112;
            v108 = v23;
            _os_log_impl(&dword_1C492D000, v88, OS_LOG_TYPE_FAULT, "Size mismatch! IOSurface bytes: %ld does not match tensor descriptor shape product %zu*2 for input %@", buf, 0x20u);
          }
        }
        int v89 = objc_msgSend_assignSurface_toName_error_(v97, v76, (uint64_t)v34, (uint64_t)v23, (uint64_t)a5, v80);

        if (!v89)
        {

          id v91 = 0;
          v90 = v97;
          goto LABEL_26;
        }
        ++v21;
      }
      while (v21 != v20);
      uint64_t v12 = obj;
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v99, (uint64_t)v109, 16, v19);
      if (v20) {
        continue;
      }
      break;
    }
  }

  v90 = v97;
  id v91 = v97;
LABEL_26:

  return v91;
}

+ (id)multiArrayForOutput:(id)a3 inNamedObjects:(id)a4 functionDescriptor:(id)a5 dataType:(int64_t)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v17 = v13;
  if (a6 == 65568)
  {
    uint64_t v18 = objc_msgSend_outputNamed_error_(v13, v14, (uint64_t)v11, (uint64_t)a7, v15, v16);
    uint64_t v24 = v18;
    if (v18)
    {
      uint64_t v51 = objc_msgSend_shape(v18, v19, v20, v21, v22, v23);
      uint64_t v30 = objc_msgSend_strides(v24, v25, v26, v27, v28, v29);
      uint64_t v36 = objc_msgSend_dataType(v24, v31, v32, v33, v34, v35);
      uint64_t v57 = 0;
      uint64_t v58 = &v57;
      uint64_t v59 = 0x3032000000;
      id v60 = sub_1C4BDCD68;
      v61 = sub_1C4BDCD78;
      id v62 = 0;
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = sub_1C4BDCD80;
      v52[3] = &unk_1E64E4EB8;
      uint64_t v56 = v36;
      id v37 = v51;
      id v53 = v37;
      id v38 = v30;
      id v54 = v38;
      long long v55 = &v57;
      uint64_t v39 = (void *)MEMORY[0x1C8786E90](v52);
      uint64_t v45 = objc_msgSend_name(v24, v40, v41, v42, v43, v44);
      char OnlyDataForName_usingBlock_error = objc_msgSend_accessReadOnlyDataForName_usingBlock_error_(v12, v46, (uint64_t)v45, (uint64_t)v39, (uint64_t)a7, v47);

      if (OnlyDataForName_usingBlock_error) {
        id v49 = (id)v58[5];
      }
      else {
        id v49 = 0;
      }

      _Block_object_dispose(&v57, 8);
    }
    else
    {
      id v49 = 0;
    }
  }
  else
  {
    id v49 = 0;
  }

  return v49;
}

+ (id)featureProviderForE5RTOutputs:(id)a3 functionDescriptor:(id)a4 dataType:(int64_t)a5 error:(id *)a6
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  id v61 = a4;
  uint64_t v14 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v9, v10, v11, v12, v13);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v20 = objc_msgSend_allOutputs(v61, v15, v16, v17, v18, v19);
  id obj = v20;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v62, (uint64_t)v66, 16, v22);
  if (v28)
  {
    uint64_t v30 = *(void *)v63;
    *(void *)&long long v29 = 138412290;
    long long v58 = v29;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v63 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = objc_msgSend_name(*(void **)(*((void *)&v62 + 1) + 8 * i), v23, v24, v25, v26, v27, v58);
        uint64_t v34 = objc_msgSend_multiArrayForOutput_inNamedObjects_functionDescriptor_dataType_error_(CHE5MLUtilities, v33, (uint64_t)v32, (uint64_t)v60, (uint64_t)v61, a5, a6);
        objc_msgSend_setObject_forKeyedSubscript_(v14, v35, (uint64_t)v34, (uint64_t)v32, v36, v37);
        id v38 = v34;
        uint64_t v44 = objc_msgSend_dataPointer(v38, v39, v40, v41, v42, v43);
        uint64_t v50 = objc_msgSend_count(v38, v45, v46, v47, v48, v49);
        if (v50)
        {
          uint64_t v51 = 4 * v50;
          do
          {
            v44 += 4;
            v51 -= 4;
          }
          while (v51);
        }
      }
      uint64_t v20 = obj;
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v62, (uint64_t)v66, 16, v27);
    }
    while (v28);
  }

  id v52 = objc_alloc(MEMORY[0x1E4F1E930]);
  uint64_t v56 = objc_msgSend_initWithDictionary_error_(v52, v53, (uint64_t)v14, 0, v54, v55);

  return v56;
}

+ (id)newE5RTExecutionOutputsForFunctionDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB3ED8]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v12 = objc_msgSend_allOutputs(v5, v7, v8, v9, v10, v11, 0);
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v23, (uint64_t)v27, 16, v14);
  if (v18)
  {
    uint64_t v19 = *(void *)v24;
    while (2)
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v12);
        }
        if ((objc_msgSend_E5RTExecutionContextAssignNewTensorInstanceToNamedObjects_error_(*(void **)(*((void *)&v23 + 1) + 8 * v20), v15, (uint64_t)v6, (uint64_t)a4, v16, v17) & 1) == 0)
        {

          id v21 = 0;
          goto LABEL_11;
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v23, (uint64_t)v27, 16, v17);
      if (v18) {
        continue;
      }
      break;
    }
  }

  id v21 = v6;
LABEL_11:

  return v21;
}

@end