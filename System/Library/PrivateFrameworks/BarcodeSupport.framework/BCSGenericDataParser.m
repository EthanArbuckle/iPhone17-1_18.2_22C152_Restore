@interface BCSGenericDataParser
+ (id)_parsedDataFromDDResult:(__DDResult *)a3 decodedString:(id)a4;
+ (id)parseString:(id)a3;
@end

@implementation BCSGenericDataParser

+ (id)parseString:(id)a3
{
  id v4 = a3;
  BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v5) {
    +[BCSGenericDataParser parseString:].cold.9(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  v13 = getDDScannerCreateSymbolLoc_ptr;
  v71 = getDDScannerCreateSymbolLoc_ptr;
  if (!getDDScannerCreateSymbolLoc_ptr)
  {
    v14 = (void *)DataDetectorsCoreLibrary();
    v69[3] = (uint64_t)dlsym(v14, "DDScannerCreate");
    getDDScannerCreateSymbolLoc_ptr = (_UNKNOWN *)v69[3];
    v13 = (void *)v69[3];
  }
  _Block_object_dispose(&v68, 8);
  if (!v13) {
    +[BCSGenericDataParser parseString:]();
  }
  uint64_t v15 = ((uint64_t (*)(void, void, void))v13)(0, 0, 0);
  if (!v15)
  {
    BOOL v35 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v35) {
      +[BCSGenericDataParser parseString:](v35, v36, v37, v38, v39, v40, v41, v42);
    }
    goto LABEL_35;
  }
  v16 = (const void *)v15;
  uint64_t v17 = [v4 length];
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  v18 = getDDScanQueryCreateFromStringSymbolLoc_ptr;
  v71 = getDDScanQueryCreateFromStringSymbolLoc_ptr;
  if (!getDDScanQueryCreateFromStringSymbolLoc_ptr)
  {
    v19 = (void *)DataDetectorsCoreLibrary();
    v69[3] = (uint64_t)dlsym(v19, "DDScanQueryCreateFromString");
    getDDScanQueryCreateFromStringSymbolLoc_ptr = (_UNKNOWN *)v69[3];
    v18 = (void *)v69[3];
  }
  _Block_object_dispose(&v68, 8);
  if (!v18) {
    +[BCSGenericDataParser parseString:]();
  }
  uint64_t v20 = ((uint64_t (*)(void, id, void, uint64_t))v18)(0, v4, 0, v17);
  if (!v20)
  {
    BOOL v43 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v43) {
      +[BCSGenericDataParser parseString:].cold.4(v43, v44, v45, v46, v47, v48, v49, v50);
    }
    goto LABEL_34;
  }
  v21 = (const void *)v20;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  v22 = (unsigned int (*)(const void *, const void *))getDDScannerScanQuerySymbolLoc_ptr;
  v71 = getDDScannerScanQuerySymbolLoc_ptr;
  if (!getDDScannerScanQuerySymbolLoc_ptr)
  {
    v23 = (void *)DataDetectorsCoreLibrary();
    v69[3] = (uint64_t)dlsym(v23, "DDScannerScanQuery");
    getDDScannerScanQuerySymbolLoc_ptr = (_UNKNOWN *)v69[3];
    v22 = (unsigned int (*)(const void *, const void *))v69[3];
  }
  _Block_object_dispose(&v68, 8);
  if (!v22) {
    +[BCSGenericDataParser parseString:].cold.5();
  }
  if (!v22(v16, v21))
  {
    BOOL v51 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v51) {
      +[BCSGenericDataParser parseString:].cold.6(v51, v52, v53, v54, v55, v56, v57, v58);
    }
    CFRelease(v21);
LABEL_34:
    CFRelease(v16);
LABEL_35:
    id v31 = 0;
    goto LABEL_40;
  }
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  v24 = (uint64_t (*)(const void *, uint64_t))getDDScannerCopyResultsWithOptionsSymbolLoc_ptr;
  v71 = getDDScannerCopyResultsWithOptionsSymbolLoc_ptr;
  if (!getDDScannerCopyResultsWithOptionsSymbolLoc_ptr)
  {
    v25 = (void *)DataDetectorsCoreLibrary();
    v69[3] = (uint64_t)dlsym(v25, "DDScannerCopyResultsWithOptions");
    getDDScannerCopyResultsWithOptionsSymbolLoc_ptr = (_UNKNOWN *)v69[3];
    v24 = (uint64_t (*)(const void *, uint64_t))v69[3];
  }
  _Block_object_dispose(&v68, 8);
  if (!v24) {
    +[BCSGenericDataParser parseString:].cold.7();
  }
  v26 = (void *)v24(v16, 1);
  v27 = v26;
  if (!v26)
  {
    BOOL v59 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v59) {
      +[BCSGenericDataParser parseString:].cold.8(v59, v60, v61, v62, v63, v64, v65, v66);
    }
    goto LABEL_38;
  }
  uint64_t v28 = [v26 count];
  if (!v28)
  {
LABEL_38:
    id v31 = 0;
    goto LABEL_39;
  }
  uint64_t v29 = v28;
  uint64_t v30 = 0;
  id v31 = 0;
  while (1)
  {
    v32 = [v27 objectAtIndexedSubscript:v30];

    v33 = [a1 _parsedDataFromDDResult:v32 decodedString:v4];
    v34 = v33;
    if (v33) {
      break;
    }
LABEL_25:

    if (v29 == ++v30) {
      goto LABEL_39;
    }
  }
  if ([v33 type] != 1)
  {
    if (!v31) {
      id v31 = v34;
    }
    goto LABEL_25;
  }

  id v31 = v34;
LABEL_39:
  CFRelease(v21);
  CFRelease(v16);

LABEL_40:
  return v31;
}

+ (id)_parsedDataFromDDResult:(__DDResult *)a3 decodedString:(id)a4
{
  id v5 = a4;
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v6 = (uint64_t (*)(__DDResult *))getDDResultGetRangeSymbolLoc_ptr;
  uint64_t v47 = getDDResultGetRangeSymbolLoc_ptr;
  if (!getDDResultGetRangeSymbolLoc_ptr)
  {
    uint64_t v7 = (void *)DataDetectorsCoreLibrary();
    v45[3] = (uint64_t)dlsym(v7, "DDResultGetRange");
    getDDResultGetRangeSymbolLoc_ptr = (_UNKNOWN *)v45[3];
    uint64_t v6 = (uint64_t (*)(__DDResult *))v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v6) {
    +[BCSGenericDataParser _parsedDataFromDDResult:decodedString:]();
  }
  id v9 = v5;
  if (!v6(a3))
  {
    if (v8 == [v5 length]) {
      id v9 = 0;
    }
    else {
      id v9 = v5;
    }
  }
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v10 = (uint64_t (*)(__DDResult *))getDDResultGetCategorySymbolLoc_ptr;
  uint64_t v47 = getDDResultGetCategorySymbolLoc_ptr;
  if (!getDDResultGetCategorySymbolLoc_ptr)
  {
    uint64_t v11 = (void *)DataDetectorsCoreLibrary();
    v45[3] = (uint64_t)dlsym(v11, "DDResultGetCategory");
    getDDResultGetCategorySymbolLoc_ptr = (_UNKNOWN *)v45[3];
    uint64_t v10 = (uint64_t (*)(__DDResult *))v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v10) {
    +[BCSGenericDataParser _parsedDataFromDDResult:decodedString:]();
  }
  int v12 = v10(a3);
  if ((v12 - 1) >= 2)
  {
    if (v12 != 3)
    {
      v26 = 0;
      goto LABEL_31;
    }
    v14 = [getDDScannerResultClass() resultFromCoreResult:a3];
    if (v14)
    {
      BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v18) {
        +[BCSGenericDataParser _parsedDataFromDDResult:decodedString:].cold.5(v18, v19, v20, v21, v22, v23, v24, v25);
      }
      v26 = [[BCSDataDetectorsScannerResultData alloc] initWithScannerResult:v14 type:6 extraPreviewText:v9];
      goto LABEL_30;
    }
    BOOL v35 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v35) {
      +[BCSGenericDataParser _parsedDataFromDDResult:decodedString:].cold.4(v35, v36, v37, v38, v39, v40, v41, v42);
    }
  }
  else
  {
    v13 = _bcs_urlFromDDResult((uint64_t)a3);
    v14 = v13;
    if (v13)
    {
      uint64_t v15 = [v13 scheme];
      v16 = [v15 lowercaseString];

      if ([v16 isEqualToString:@"mailto"])
      {
        uint64_t v17 = 3;
      }
      else if ([v16 isEqualToString:@"tel"])
      {
        uint64_t v17 = 4;
      }
      else
      {
        uint64_t v17 = 1;
      }
      BOOL v27 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v27) {
        +[BCSGenericDataParser _parsedDataFromDDResult:decodedString:](v27, v28, v29, v30, v31, v32, v33, v34);
      }
      v26 = [[BCSParsedURLData alloc] initWithURL:v14 type:v17 extraPreviewText:v9];

      goto LABEL_30;
    }
  }
  v26 = 0;
LABEL_30:

LABEL_31:
  return v26;
}

+ (void)parseString:.cold.1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "DDScannerRef _DDScannerCreate(DDScannerType, DDScannerOptions, CFErrorRef *)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BCSGenericDataParser.m", 20, @"%s", dlerror());

  __break(1u);
}

+ (void)parseString:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:.cold.3()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "DDScanQueryRef _DDScanQueryCreateFromString(CFAllocatorRef, CFStringRef, CFRange)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BCSGenericDataParser.m", 18, @"%s", dlerror());

  __break(1u);
}

+ (void)parseString:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:.cold.5()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "Boolean _DDScannerScanQuery(DDScannerRef, DDScanQueryRef)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BCSGenericDataParser.m", 21, @"%s", dlerror());

  __break(1u);
}

+ (void)parseString:(uint64_t)a3 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:.cold.7()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "CFArrayRef _DDScannerCopyResultsWithOptions(DDScannerRef, DDScannerCopyResultsOptions)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BCSGenericDataParser.m", 19, @"%s", dlerror());

  __break(1u);
}

+ (void)parseString:(uint64_t)a3 .cold.8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:(uint64_t)a3 .cold.9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_parsedDataFromDDResult:decodedString:.cold.1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"CFRange _DDResultGetRange(DDResultRef)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BCSGenericDataParser.m", 17, @"%s", dlerror());

  __break(1u);
}

+ (void)_parsedDataFromDDResult:decodedString:.cold.2()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"DDResultCategory _DDResultGetCategory(DDResultRef)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BCSGenericDataParser.m", 16, @"%s", dlerror());

  __break(1u);
}

+ (void)_parsedDataFromDDResult:(uint64_t)a3 decodedString:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_parsedDataFromDDResult:(uint64_t)a3 decodedString:(uint64_t)a4 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_parsedDataFromDDResult:(uint64_t)a3 decodedString:(uint64_t)a4 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end