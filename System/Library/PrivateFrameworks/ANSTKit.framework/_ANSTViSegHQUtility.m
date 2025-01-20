@interface _ANSTViSegHQUtility
+ (id)makeHiddenTensorDescriptorForConfiguration:(id)a3 name:(id)a4;
+ (id)makeInputImagePixelBufferDescriptorForConfiguration:(id)a3 name:(id)a4 error:(id *)a5;
+ (id)makeKeyTensorDescriptorForConfiguration:(id)a3 name:(id)a4;
+ (id)makeMaskPixelBufferDescriptorForConfiguration:(id)a3 name:(id)a4 error:(id *)a5;
+ (id)makeMattingTensorDescriptorForConfiguration:(id)a3 name:(id)a4;
+ (id)makeProbTensorDescriptorForConfiguration:(id)a3 name:(id)a4;
+ (id)makeValueTensorDescriptorForConfiguration:(id)a3 name:(id)a4;
+ (unint64_t)_tensorDataTypeForConfiguration:(id)a3;
@end

@implementation _ANSTViSegHQUtility

+ (unint64_t)_tensorDataTypeForConfiguration:(id)a3
{
  if (objc_msgSend_useE5(a3, a2, (uint64_t)a3)) {
    return 104;
  }
  else {
    return 102;
  }
}

+ (id)makeProbTensorDescriptorForConfiguration:(id)a3 name:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  switch(objc_msgSend_resolution(v5, v7, v8, 0, 0, 0, 0))
  {
    case 0:
      *(void *)&long long v21 = 1;
      long long v9 = xmmword_246D9ED90;
      goto LABEL_9;
    case 1:
      *(void *)&long long v21 = 1;
      long long v9 = xmmword_246D9ED80;
      goto LABEL_9;
    case 2:
      *(void *)&long long v21 = 1;
      long long v9 = xmmword_246D9ED70;
      goto LABEL_9;
    case 3:
      *(void *)&long long v21 = 1;
      long long v9 = xmmword_246D9ED60;
LABEL_9:
      *((void *)&v21 + 1) = 1;
      long long v22 = v9;
      v13 = [ANSTTensorDescriptor alloc];
      uint64_t v15 = objc_msgSend__tensorDataTypeForConfiguration_(_ANSTViSegHQUtility, v14, (uint64_t)v5, v21, v22);
      if (objc_msgSend_useE5(v5, v16, v17)) {
        uint64_t v19 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v13, v18, (uint64_t)v6, v15, 4, &v21, 64, 0);
      }
      else {
        uint64_t v19 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v13, v18, (uint64_t)v6, v15, 4, &v21, 1, 0);
      }
      v12 = (void *)v19;
      break;
    default:
      _ANSTLoggingGetOSLogForCategoryANSTKit();
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_FAULT)) {
        sub_246D98E4C(v5, v10, v11);
      }

      v12 = 0;
      break;
  }

  return v12;
}

+ (id)makeHiddenTensorDescriptorForConfiguration:(id)a3 name:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  switch(objc_msgSend_resolution(v5, v7, v8, 0, 0, 0, 0))
  {
    case 0:
      *(void *)&long long v21 = 1;
      long long v9 = xmmword_246D9EDD0;
      goto LABEL_9;
    case 1:
      *(void *)&long long v21 = 1;
      long long v9 = xmmword_246D9EDC0;
      goto LABEL_9;
    case 2:
      *(void *)&long long v21 = 1;
      long long v9 = xmmword_246D9EDB0;
      goto LABEL_9;
    case 3:
      *(void *)&long long v21 = 1;
      long long v9 = xmmword_246D9EDA0;
LABEL_9:
      *((void *)&v21 + 1) = 64;
      long long v22 = v9;
      v13 = [ANSTTensorDescriptor alloc];
      uint64_t v15 = objc_msgSend__tensorDataTypeForConfiguration_(_ANSTViSegHQUtility, v14, (uint64_t)v5, v21, v22);
      if (objc_msgSend_useE5(v5, v16, v17)) {
        uint64_t v19 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v13, v18, (uint64_t)v6, v15, 4, &v21, 64, 0);
      }
      else {
        uint64_t v19 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v13, v18, (uint64_t)v6, v15, 4, &v21, 1, 0);
      }
      v12 = (void *)v19;
      break;
    default:
      _ANSTLoggingGetOSLogForCategoryANSTKit();
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_FAULT)) {
        sub_246D98ED0(v5, v10, v11);
      }

      v12 = 0;
      break;
  }

  return v12;
}

+ (id)makeKeyTensorDescriptorForConfiguration:(id)a3 name:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  unint64_t v9 = objc_msgSend_resolution(v5, v7, v8, 0, 0, 0, 0);
  if (v9 >= 4)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    uint64_t v19 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_FAULT)) {
      sub_246D98F54(v5, v19, v20);
    }

    v18 = 0;
  }
  else
  {
    uint64_t v10 = qword_246D9EE00[v9];
    *(void *)&long long v22 = 1;
    *((void *)&v22 + 1) = v10;
    uint64_t v11 = [ANSTTensorDescriptor alloc];
    uint64_t v13 = objc_msgSend__tensorDataTypeForConfiguration_(_ANSTViSegHQUtility, v12, (uint64_t)v5, v22, xmmword_246D9EDE0);
    if (objc_msgSend_useE5(v5, v14, v15)) {
      uint64_t v17 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v11, v16, (uint64_t)v6, v13, 4, &v22, 64, 0);
    }
    else {
      uint64_t v17 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v11, v16, (uint64_t)v6, v13, 4, &v22, 1, 0);
    }
    v18 = (void *)v17;
  }

  return v18;
}

+ (id)makeValueTensorDescriptorForConfiguration:(id)a3 name:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  unint64_t v9 = objc_msgSend_resolution(v5, v7, v8, 0, 0, 0, 0);
  if (v9 >= 4)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    uint64_t v19 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_FAULT)) {
      sub_246D98FD8(v5, v19, v20);
    }

    v18 = 0;
  }
  else
  {
    uint64_t v10 = qword_246D9EE00[v9];
    *(void *)&long long v23 = 1;
    *((void *)&v23 + 1) = v10;
    uint64_t v11 = [ANSTTensorDescriptor alloc];
    uint64_t v13 = objc_msgSend__tensorDataTypeForConfiguration_(_ANSTViSegHQUtility, v12, (uint64_t)v5, xmmword_246D9EDF0, v23);
    if (objc_msgSend_useE5(v5, v14, v15)) {
      uint64_t v17 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v11, v16, (uint64_t)v6, v13, 4, &v22, 64, 0);
    }
    else {
      uint64_t v17 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v11, v16, (uint64_t)v6, v13, 4, &v22, 1, 0);
    }
    v18 = (void *)v17;
  }

  return v18;
}

+ (id)makeMattingTensorDescriptorForConfiguration:(id)a3 name:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  switch(objc_msgSend_resolution(v5, v7, v8, 0, 0, 0, 0))
  {
    case 0:
      *(void *)&long long v21 = 1;
      long long v9 = xmmword_246D9ED90;
      goto LABEL_9;
    case 1:
      *(void *)&long long v21 = 1;
      long long v9 = xmmword_246D9ED80;
      goto LABEL_9;
    case 2:
      *(void *)&long long v21 = 1;
      long long v9 = xmmword_246D9ED70;
      goto LABEL_9;
    case 3:
      *(void *)&long long v21 = 1;
      long long v9 = xmmword_246D9ED60;
LABEL_9:
      *((void *)&v21 + 1) = 1;
      long long v22 = v9;
      uint64_t v13 = [ANSTTensorDescriptor alloc];
      uint64_t v15 = objc_msgSend__tensorDataTypeForConfiguration_(_ANSTViSegHQUtility, v14, (uint64_t)v5, v21, v22);
      if (objc_msgSend_useE5(v5, v16, v17)) {
        uint64_t v19 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v13, v18, (uint64_t)v6, v15, 4, &v21, 64, 0);
      }
      else {
        uint64_t v19 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v13, v18, (uint64_t)v6, v15, 4, &v21, 1, 0);
      }
      v12 = (void *)v19;
      break;
    default:
      _ANSTLoggingGetOSLogForCategoryANSTKit();
      uint64_t v10 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_FAULT)) {
        sub_246D9905C(v5, v10, v11);
      }

      v12 = 0;
      break;
  }

  return v12;
}

+ (id)makeInputImagePixelBufferDescriptorForConfiguration:(id)a3 name:(id)a4 error:(id *)a5
{
  v34[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  unint64_t v11 = objc_msgSend_resolution(v7, v9, v10);
  if (v11 < 4)
  {
    uint64_t v13 = qword_246D9EE40[v11];
    uint64_t v14 = qword_246D9EE20[v11];
    v31[0] = *MEMORY[0x263F04240];
    uint64_t v15 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v12, v14);
    v32[0] = v15;
    v31[1] = *MEMORY[0x263F04118];
    uint64_t v17 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v16, v13);
    uint64_t v18 = *MEMORY[0x263F04180];
    v32[1] = v17;
    v32[2] = &unk_26FB49950;
    uint64_t v19 = *MEMORY[0x263F04130];
    v31[2] = v18;
    v31[3] = v19;
    v32[3] = MEMORY[0x263EFFA78];
    long long v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v20, (uint64_t)v32, v31, 4);

    long long v22 = [ANSTPixelBufferDescriptor alloc];
    uint64_t v24 = objc_msgSend_initWithName_pixelBufferAttributes_error_(v22, v23, (uint64_t)v8, v21, a5);
LABEL_7:

    goto LABEL_8;
  }
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v25 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_FAULT)) {
    sub_246D990E0(v7, v25, v26);
  }

  if (a5)
  {
    v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F07F80];
    v34[0] = @"Unexpected resolution";
    long long v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)v34, &v33, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v28, v29, @"ANSTErrorDomain", 2, v21);
    uint64_t v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  uint64_t v24 = 0;
LABEL_8:

  return v24;
}

+ (id)makeMaskPixelBufferDescriptorForConfiguration:(id)a3 name:(id)a4 error:(id *)a5
{
  v34[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  unint64_t v11 = objc_msgSend_resolution(v7, v9, v10);
  if (v11 < 4)
  {
    uint64_t v13 = qword_246D9EE20[v11];
    uint64_t v14 = qword_246D9EE40[v11];
    v31[0] = *MEMORY[0x263F04240];
    uint64_t v15 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v12, v13);
    v32[0] = v15;
    v31[1] = *MEMORY[0x263F04118];
    uint64_t v17 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v16, v14);
    v32[1] = v17;
    v31[2] = *MEMORY[0x263F04180];
    uint64_t v19 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v18, 1278226536);
    v31[3] = *MEMORY[0x263F04130];
    v32[2] = v19;
    v32[3] = MEMORY[0x263EFFA78];
    long long v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v20, (uint64_t)v32, v31, 4);

    long long v22 = [ANSTPixelBufferDescriptor alloc];
    uint64_t v24 = objc_msgSend_initWithName_pixelBufferAttributes_error_(v22, v23, (uint64_t)v8, v21, a5);
LABEL_7:

    goto LABEL_8;
  }
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v25 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_FAULT)) {
    sub_246D99164(v7, v25, v26);
  }

  if (a5)
  {
    v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F07F80];
    v34[0] = @"Unexpected resolution";
    long long v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)v34, &v33, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v28, v29, @"ANSTErrorDomain", 2, v21);
    uint64_t v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  uint64_t v24 = 0;
LABEL_8:

  return v24;
}

@end