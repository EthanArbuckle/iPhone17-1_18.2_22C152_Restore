@interface CDMNluLogUtil
+ (BOOL)saveCLIResult:(id)a3 protobufFile:(id)a4 preprocess:(BOOL)a5 saveBinary:(BOOL)a6 error:(id *)a7;
+ (BOOL)saveCdmPlannerResponseJson:(id)a3 toFile:(id)a4 error:(id *)a5;
+ (BOOL)savePreprocessingWrapperJson:(id)a3 toFile:(id)a4 error:(id *)a5;
+ (BOOL)saveProtoFile:(id)a3 protobufFile:(id)a4 error:(id *)a5;
+ (BOOL)saveResponseToProtobuf2:(id)a3 protobufFile:(id)a4 error:(id *)a5;
+ (BOOL)saveResponseToProtobuf:(id)a3 protobufFile:(id)a4 error:(id *)a5;
+ (BOOL)saveSpanMatchResponseToProtobuf:(id)a3 protobufFile:(id)a4 error:(id *)a5;
+ (BOOL)saveString:(id)a3 toFile:(id)a4 error:(id *)a5;
+ (BOOL)saveSubwordEmbeddingResponseJson:(id)a3 toFile:(id)a4 error:(id *)a5;
+ (id)getLogBasePath;
+ (id)loadCdmPlannerRequestFromProtobuf2File:(id)a3 error:(id *)a4;
+ (id)loadDataFromProtobuf2File:(id)a3 error:(id *)a4;
+ (id)loadOverrideSpansFromProtobuf2File:(id)a3 error:(id *)a4;
+ (id)loadRequestFromProtobuf2File:(id)a3 error:(id *)a4;
+ (id)loadSubwordEmbeddingRequestFromProtobuf2File:(id)a3 error:(id *)a4;
+ (id)prettyPrintProtoResponse:(id)a3;
+ (id)prettyPrintResponse:(id)a3;
+ (id)writeLVCRequestToDisk:(id)a3 error:(id *)a4;
+ (id)writeLVCResponseToDisk:(id)a3 error:(id *)a4;
+ (id)writeMDRequestToDisk:(id)a3 error:(id *)a4;
+ (id)writeMDResponseToDisk:(id)a3 error:(id *)a4;
+ (id)writeMRRequestToDisk:(id)a3 error:(id *)a4;
+ (id)writeMRResponseToDisk:(id)a3 error:(id *)a4;
+ (id)writeNlv4RequestToDisk:(id)a3 error:(id *)a4;
+ (id)writeNlv4ResponseToDisk:(id)a3 error:(id *)a4;
+ (id)writePSCRequestToDisk:(id)a3 error:(id *)a4;
+ (id)writePSCResponseToDisk:(id)a3 error:(id *)a4;
+ (id)writeSNLCRequestToDisk:(id)a3 error:(id *)a4;
+ (id)writeSNLCResponseToDisk:(id)a3 error:(id *)a4;
+ (id)writeSSURequestToDisk:(id)a3 error:(id *)a4;
+ (id)writeSSUResponseToDisk:(id)a3 error:(id *)a4;
+ (id)writeUaaPRequestToDisk:(id)a3 error:(id *)a4;
+ (id)writeUaaPResponseToDisk:(id)a3 error:(id *)a4;
+ (void)populateErrorWithUserInfo:(id *)a3 errorMessage:(id)a4 errorCode:(int64_t)a5;
@end

@implementation CDMNluLogUtil

+ (BOOL)saveCLIResult:(id)a3 protobufFile:(id)a4 preprocess:(BOOL)a5 saveBinary:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a4;
  if (v8)
  {
    if (v9)
    {
      v13 = [v11 preprocessingWrapper];
    }
    else
    {
      v21 = (void *)MEMORY[0x263F71F48];
      v22 = [v11 nluResponse];
      v13 = [v21 convertFromNluResponse:v22];
    }
    v23 = [v13 data];

    char v24 = [v23 writeToFile:v12 atomically:1];
    if (v24)
    {
      printf("%s saved\n", (const char *)[v12 UTF8String]);
    }
    else
    {
      id v35 = [NSString stringWithFormat:@"Failed to save %@", v12];
      puts((const char *)[v35 UTF8String]);
      +[CDMNluLogUtil populateErrorWithUserInfo:a7 errorMessage:v35 errorCode:-4];
    }
    id v19 = 0;
  }
  else
  {
    if (v9)
    {
      v14 = [v11 preprocessingWrapper];
      v15 = +[CDMProtobufConverter serializePreprocessingWrapperWithWrapper:v14 formatType:@"json"];

      v16 = +[CDMPlatformUtils prettyPrintJson:v15];
      id v17 = v12;
      v18 = (const char *)[v17 UTF8String];
      id v19 = v16;
      printf("%s result:%s\n", v18, (const char *)[v19 UTF8String]);
      uint64_t v38 = 0;
      v20 = (id *)&v38;
      +[CDMNluLogUtil saveString:v19 toFile:v17 error:&v38];
    }
    else
    {
      v25 = [v11 nluResponse];
      v26 = [v25 description];

      id v27 = v12;
      v28 = (const char *)[v27 UTF8String];
      id v19 = v26;
      printf("%s result:%s\n", v28, (const char *)[v19 UTF8String]);
      v15 = [v11 nluResponse];
      uint64_t v37 = 0;
      v20 = (id *)&v37;
      +[CDMNluLogUtil saveResponseToProtobuf:v15 protobufFile:v27 error:&v37];
    }
    id v29 = *v20;

    if (v29)
    {
      v30 = (const char *)[v12 UTF8String];
      id v31 = [v29 localizedDescription];
      printf("Error save %s:%s\n", v30, (const char *)[v31 UTF8String]);

      v32 = NSDictionary;
      v33 = [v29 localizedDescription];
      v34 = [v32 dictionaryWithObject:v33 forKey:*MEMORY[0x263F08320]];

      *a7 = [MEMORY[0x263F087E8] errorWithDomain:@"CDMNluLogUtil" code:-4 userInfo:v34];

      char v24 = 0;
    }
    else
    {
      char v24 = 1;
    }
  }

  return v24;
}

+ (BOOL)saveCdmPlannerResponseJson:(id)a3 toFile:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v7 = (__CFString *)a4;
  BOOL v8 = +[CDMProtobufConverter serializeExternalCdmPlannerResponseWithResponse:a3 formatType:@"json"];
  BOOL v9 = v8;
  if (!v8)
  {
    v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "+[CDMNluLogUtil saveCdmPlannerResponseJson:toFile:error:]";
      __int16 v20 = 2112;
      v21 = @"Nil content when CdmPlannerResponse(proto) was serialized";
      _os_log_error_impl(&dword_2263A0000, v13, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    if (a5) {
      +[CDMNluLogUtil populateErrorWithUserInfo:a5 errorMessage:@"Nil content when CdmPlannerResponse(proto) was serialized" errorCode:-1];
    }
    id v11 = 0;
    goto LABEL_15;
  }
  id v17 = 0;
  char v10 = [v8 writeToFile:v7 atomically:1 encoding:4 error:&v17];
  id v11 = (__CFString *)v17;
  if (v10)
  {
    id v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "+[CDMNluLogUtil saveCdmPlannerResponseJson:toFile:error:]";
      __int16 v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, "%s CdmPlannerResponse(proto) logged to: %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  v14 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v19 = "+[CDMNluLogUtil saveCdmPlannerResponseJson:toFile:error:]";
    __int16 v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_2263A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: error writing (response proto) file: %@", buf, 0x16u);
  }

  if (!a5)
  {
LABEL_15:
    char v10 = 0;
    goto LABEL_16;
  }
  v15 = (void *)MEMORY[0x263F087E8];
  id v12 = [(__CFString *)v11 userInfo];
  *a5 = [v15 errorWithDomain:@"CDMNluLogUtil" code:-4 userInfo:v12];
LABEL_14:

LABEL_16:
  return v10;
}

+ (BOOL)saveSubwordEmbeddingResponseJson:(id)a3 toFile:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v7 = (__CFString *)a4;
  BOOL v8 = +[CDMProtobufConverter serializeExternalSubwordEmbeddingResponseWithResponse:a3 formatType:@"json"];
  BOOL v9 = v8;
  if (!v8)
  {
    v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "+[CDMNluLogUtil saveSubwordEmbeddingResponseJson:toFile:error:]";
      __int16 v20 = 2112;
      v21 = @"Nil content when SubwordEmbeddingResponse(proto) was serialized";
      _os_log_error_impl(&dword_2263A0000, v13, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    if (a5) {
      +[CDMNluLogUtil populateErrorWithUserInfo:a5 errorMessage:@"Nil content when SubwordEmbeddingResponse(proto) was serialized" errorCode:-1];
    }
    id v11 = 0;
    goto LABEL_15;
  }
  id v17 = 0;
  char v10 = [v8 writeToFile:v7 atomically:1 encoding:4 error:&v17];
  id v11 = (__CFString *)v17;
  if (v10)
  {
    id v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "+[CDMNluLogUtil saveSubwordEmbeddingResponseJson:toFile:error:]";
      __int16 v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, "%s SubwordEmbeddingResponse(proto) logged to: %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  v14 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v19 = "+[CDMNluLogUtil saveSubwordEmbeddingResponseJson:toFile:error:]";
    __int16 v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_2263A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: error writing (response proto) file: %@", buf, 0x16u);
  }

  if (!a5)
  {
LABEL_15:
    char v10 = 0;
    goto LABEL_16;
  }
  v15 = (void *)MEMORY[0x263F087E8];
  id v12 = [(__CFString *)v11 userInfo];
  *a5 = [v15 errorWithDomain:@"CDMNluLogUtil" code:-4 userInfo:v12];
LABEL_14:

LABEL_16:
  return v10;
}

+ (BOOL)savePreprocessingWrapperJson:(id)a3 toFile:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v7 = (__CFString *)a4;
  BOOL v8 = +[CDMProtobufConverter serializePreprocessingWrapperWithWrapper:a3 formatType:@"json"];
  BOOL v9 = v8;
  if (!v8)
  {
    v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "+[CDMNluLogUtil savePreprocessingWrapperJson:toFile:error:]";
      __int16 v20 = 2112;
      v21 = @"Nil content when PreprocessingWrapper(proto) was serialized";
      _os_log_error_impl(&dword_2263A0000, v13, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    if (a5) {
      +[CDMNluLogUtil populateErrorWithUserInfo:a5 errorMessage:@"Nil content when PreprocessingWrapper(proto) was serialized" errorCode:-1];
    }
    id v11 = 0;
    goto LABEL_15;
  }
  id v17 = 0;
  char v10 = [v8 writeToFile:v7 atomically:1 encoding:4 error:&v17];
  id v11 = (__CFString *)v17;
  if (v10)
  {
    id v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "+[CDMNluLogUtil savePreprocessingWrapperJson:toFile:error:]";
      __int16 v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, "%s CDMPreprocessingWrapper(proto) logged to: %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  v14 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v19 = "+[CDMNluLogUtil savePreprocessingWrapperJson:toFile:error:]";
    __int16 v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_2263A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: error writing (response proto) file: %@", buf, 0x16u);
  }

  if (!a5)
  {
LABEL_15:
    char v10 = 0;
    goto LABEL_16;
  }
  v15 = (void *)MEMORY[0x263F087E8];
  id v12 = [(__CFString *)v11 userInfo];
  *a5 = [v15 errorWithDomain:@"CDMNluLogUtil" code:-4 userInfo:v12];
LABEL_14:

LABEL_16:
  return v10;
}

+ (BOOL)saveString:(id)a3 toFile:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    char v10 = NSString;
    id v11 = [MEMORY[0x263EFF910] date];
    [v11 timeIntervalSince1970];
    v13 = objc_msgSend(v10, "stringWithFormat:", @"CDMNluResponse-%f.json", v12);

    v14 = [a1 getLogBasePath];
    id v9 = [v14 stringByAppendingPathComponent:v13];
  }
  id v21 = 0;
  char v15 = [v8 writeToFile:v9 atomically:1 encoding:4 error:&v21];
  id v16 = v21;
  if (v15)
  {
    id v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "+[CDMNluLogUtil saveString:toFile:error:]";
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s CDMNluResponse(proto) logged to: %@", buf, 0x16u);
    }
    goto LABEL_10;
  }
  v18 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "+[CDMNluLogUtil saveString:toFile:error:]";
    __int16 v24 = 2112;
    id v25 = v16;
    _os_log_impl(&dword_2263A0000, v18, OS_LOG_TYPE_INFO, "%s [WARN]: error writing (response proto) file: %@", buf, 0x16u);
  }

  if (a5)
  {
    id v19 = (void *)MEMORY[0x263F087E8];
    id v17 = [v16 userInfo];
    *a5 = [v19 errorWithDomain:@"CDMNluLogUtil" code:-4 userInfo:v17];
LABEL_10:
  }
  return v15;
}

+ (BOOL)saveProtoFile:(id)a3 protobufFile:(id)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v15 = 0;
  char v9 = [v7 writeToFile:v8 atomically:1 encoding:4 error:&v15];
  id v10 = v15;
  if (v9)
  {
    id v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v17 = "+[CDMNluLogUtil saveProtoFile:protobufFile:error:]";
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl(&dword_2263A0000, v11, OS_LOG_TYPE_INFO, "%s Successfully logged protobuf to: %@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  uint64_t v12 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v17 = "+[CDMNluLogUtil saveProtoFile:protobufFile:error:]";
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, "%s [WARN]: error writing proto file: %@", buf, 0x16u);
  }

  if (a5)
  {
    v13 = (void *)MEMORY[0x263F087E8];
    id v11 = [v10 userInfo];
    *a5 = [v13 errorWithDomain:@"CDMNluLogUtil" code:-4 userInfo:v11];
LABEL_8:
  }
  return v9;
}

+ (BOOL)saveResponseToProtobuf2:(id)a3 protobufFile:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v10 = NSString;
    id v11 = [MEMORY[0x263EFF910] date];
    [v11 timeIntervalSince1970];
    v13 = objc_msgSend(v10, "stringWithFormat:", @"CDMSIRINLUEXTERNALCDMNluResponse-%f.json", v12);

    v14 = [a1 getLogBasePath];
    id v9 = [v14 stringByAppendingPathComponent:v13];
  }
  id v15 = [v9 pathExtension];
  id v16 = +[CDMProtobufConverter nluResponseFromSIRINLUEXTERNALCDMNluResponseWithResponse:v8 formatType:v15];

  id v23 = 0;
  char v17 = [v16 writeToFile:v9 atomically:1 encoding:4 error:&v23];
  id v18 = v23;
  if (v17)
  {
    id v19 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v25 = "+[CDMNluLogUtil saveResponseToProtobuf2:protobufFile:error:]";
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl(&dword_2263A0000, v19, OS_LOG_TYPE_INFO, "%s CDMNluResponse(proto) logged to: %@", buf, 0x16u);
    }
    goto LABEL_10;
  }
  uint64_t v20 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v25 = "+[CDMNluLogUtil saveResponseToProtobuf2:protobufFile:error:]";
    __int16 v26 = 2112;
    id v27 = v18;
    _os_log_impl(&dword_2263A0000, v20, OS_LOG_TYPE_INFO, "%s [WARN]: error writing (response proto) file: %@", buf, 0x16u);
  }

  if (a5)
  {
    id v21 = (void *)MEMORY[0x263F087E8];
    id v19 = [v18 userInfo];
    *a5 = [v21 errorWithDomain:@"CDMNluLogUtil" code:-4 userInfo:v19];
LABEL_10:
  }
  return v17;
}

+ (BOOL)saveResponseToProtobuf:(id)a3 protobufFile:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v10 = NSString;
    id v11 = [MEMORY[0x263EFF910] date];
    [v11 timeIntervalSince1970];
    v13 = objc_msgSend(v10, "stringWithFormat:", @"CDMNluResponse-%f.json", v12);

    v14 = [a1 getLogBasePath];
    id v9 = [v14 stringByAppendingPathComponent:v13];
  }
  id v15 = [v9 pathExtension];
  id v16 = +[CDMProtobufConverter nluResponseFromSIRINLUWithResponse:v8 formatType:v15];

  id v23 = 0;
  char v17 = [v16 writeToFile:v9 atomically:1 encoding:4 error:&v23];
  id v18 = v23;
  if (v17)
  {
    id v19 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v25 = "+[CDMNluLogUtil saveResponseToProtobuf:protobufFile:error:]";
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl(&dword_2263A0000, v19, OS_LOG_TYPE_INFO, "%s CDMNluResponse(proto) logged to: %@", buf, 0x16u);
    }
    goto LABEL_10;
  }
  uint64_t v20 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v25 = "+[CDMNluLogUtil saveResponseToProtobuf:protobufFile:error:]";
    __int16 v26 = 2112;
    id v27 = v18;
    _os_log_impl(&dword_2263A0000, v20, OS_LOG_TYPE_INFO, "%s [WARN]: error writing (response proto) file: %@", buf, 0x16u);
  }

  if (a5)
  {
    id v21 = (void *)MEMORY[0x263F087E8];
    id v19 = [v18 userInfo];
    *a5 = [v21 errorWithDomain:@"CDMNluLogUtil" code:-4 userInfo:v19];
LABEL_10:
  }
  return v17;
}

+ (BOOL)saveSpanMatchResponseToProtobuf:(id)a3 protobufFile:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v10 = NSString;
    id v11 = [MEMORY[0x263EFF910] date];
    [v11 timeIntervalSince1970];
    v13 = objc_msgSend(v10, "stringWithFormat:", @"CDMSpanMatchResponse-%f.json", v12);

    v14 = [a1 getLogBasePath];
    id v9 = [v14 stringByAppendingPathComponent:v13];
  }
  id v15 = [v9 pathExtension];
  id v16 = +[CDMProtobufConverter serializeSpanMatchResponseWithResponse:v8 formatType:v15];

  if (v16)
  {
    id v24 = 0;
    char v17 = [v16 writeToFile:v9 atomically:1 encoding:4 error:&v24];
    id v18 = v24;
    if (v17)
    {
      id v19 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v26 = "+[CDMNluLogUtil saveSpanMatchResponseToProtobuf:protobufFile:error:]";
        __int16 v27 = 2112;
        id v28 = v9;
        _os_log_impl(&dword_2263A0000, v19, OS_LOG_TYPE_INFO, "%s CDMNluResponse(proto) logged to: %@", buf, 0x16u);
      }
    }
    else
    {
      id v21 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v26 = "+[CDMNluLogUtil saveSpanMatchResponseToProtobuf:protobufFile:error:]";
        __int16 v27 = 2112;
        id v28 = v18;
        _os_log_impl(&dword_2263A0000, v21, OS_LOG_TYPE_INFO, "%s [WARN]: error writing (response proto) file: %@", buf, 0x16u);
      }

      if (!a5) {
        goto LABEL_13;
      }
      uint64_t v22 = (void *)MEMORY[0x263F087E8];
      id v19 = [v18 userInfo];
      *a5 = [v22 errorWithDomain:@"CDMNluLogUtil" code:-4 userInfo:v19];
    }

LABEL_13:
    goto LABEL_14;
  }
  uint64_t v20 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"nil file data. Not saving file.", @"errorDescription", 0);
  *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"CDMNluLogUtil" code:-4 userInfo:v20];

  char v17 = 0;
LABEL_14:

  return v17;
}

+ (id)loadOverrideSpansFromProtobuf2File:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v25 = a3;
  id v24 = +[CDMNluLogUtil loadDataFromProtobuf2File:error:](CDMNluLogUtil, "loadDataFromProtobuf2File:error:");
  if (!v24)
  {
    id v27 = 0;
    goto LABEL_34;
  }
  id v23 = [v25 pathExtension];
  if ([v23 isEqualToString:@"json"])
  {
    v5 = [MEMORY[0x263F08900] JSONObjectWithData:v24 options:4 error:a4];
    if (v5)
    {
      id v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count", v5));
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id obj = v5;
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v29 != v7) {
              objc_enumerationMutation(obj);
            }
            id v9 = a4;
            id v10 = [MEMORY[0x263F08900] dataWithJSONObject:*(void *)(*((void *)&v28 + 1) + 8 * i) options:0 error:a4];
            id v11 = (void *)[[NSString alloc] initWithData:v10 encoding:4];
            uint64_t v12 = +[CDMProtobufConverter siriInternalMatchingSpanJsonToObjWithProto2Json:v11];
            if (v12)
            {
              [v27 addObject:v12];
            }
            else
            {
              v13 = CDMOSLoggerForCategory(0);
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                v33 = "+[CDMNluLogUtil loadOverrideSpansFromProtobuf2File:error:]";
                _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to parse a MatchingSpan from JSON for SiriVocabMatcher override but was unable to do so!", buf, 0xCu);
              }
            }
            a4 = v9;
          }
          uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v6);
      }
      v14 = a4;

      if (v27) {
        goto LABEL_33;
      }
    }
    else
    {
      v14 = a4;
      id v18 = objc_msgSend(NSString, "stringWithFormat:", @"error serializing array of MatchingSpans from JSON", 0);
      id v19 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "+[CDMNluLogUtil loadOverrideSpansFromProtobuf2File:error:]";
        __int16 v34 = 2112;
        id v35 = v18;
        _os_log_error_impl(&dword_2263A0000, v19, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
      }

      if (v14)
      {
        uint64_t v20 = [NSDictionary dictionaryWithObject:v18 forKey:*MEMORY[0x263F08320]];
        id *v14 = [MEMORY[0x263F087E8] errorWithDomain:@"CDMNluLogUtil" code:-3 userInfo:v20];
      }
    }
    id v16 = [NSString stringWithFormat:@"error decoding SIRINLUMatchingSpan objects"];
    id v21 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "+[CDMNluLogUtil loadOverrideSpansFromProtobuf2File:error:]";
      __int16 v34 = 2112;
      id v35 = v16;
      _os_log_error_impl(&dword_2263A0000, v21, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    if (v14) {
      +[CDMNluLogUtil populateErrorWithUserInfo:v14 errorMessage:v16 errorCode:-3];
    }
  }
  else
  {
    id v15 = a4;
    id v16 = [NSString stringWithFormat:@"unhandled path extension"];
    char v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "+[CDMNluLogUtil loadOverrideSpansFromProtobuf2File:error:]";
      __int16 v34 = 2112;
      id v35 = v16;
      _os_log_error_impl(&dword_2263A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    if (v15) {
      +[CDMNluLogUtil populateErrorWithUserInfo:v15 errorMessage:v16 errorCode:-2];
    }
  }

  id v27 = 0;
LABEL_33:

LABEL_34:
  return v27;
}

+ (id)loadCdmPlannerRequestFromProtobuf2File:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = +[CDMNluLogUtil loadDataFromProtobuf2File:v5 error:a4];
  if (!v6)
  {
    id v10 = 0;
    goto LABEL_16;
  }
  uint64_t v7 = [v5 pathExtension];
  if ([v7 isEqualToString:@"json"])
  {
    id v8 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
    uint64_t v9 = +[CDMProtobufConverter siriExternalCdmPlannerRequestJsonToObjWithProto2Json:v8];
  }
  else
  {
    if ([v7 isEqualToString:@"pb"])
    {
      id v10 = (void *)[objc_alloc(MEMORY[0x263F71CB8]) initWithData:v6];
      goto LABEL_15;
    }
    if (![v7 isEqualToString:@"base64"])
    {
      id v11 = [NSString stringWithFormat:@"unhandled path extension"];
      uint64_t v12 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136315394;
        id v15 = "+[CDMNluLogUtil loadCdmPlannerRequestFromProtobuf2File:error:]";
        __int16 v16 = 2112;
        char v17 = v11;
        _os_log_error_impl(&dword_2263A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&v14, 0x16u);
      }

      if (a4) {
        +[CDMNluLogUtil populateErrorWithUserInfo:a4 errorMessage:v11 errorCode:-2];
      }

      id v10 = 0;
      goto LABEL_15;
    }
    id v8 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedData:v6 options:1];
    uint64_t v9 = [objc_alloc(MEMORY[0x263F71CB8]) initWithData:v8];
  }
  id v10 = (void *)v9;

LABEL_15:
LABEL_16:

  return v10;
}

+ (id)loadSubwordEmbeddingRequestFromProtobuf2File:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = +[CDMNluLogUtil loadDataFromProtobuf2File:v5 error:a4];
  if (!v6)
  {
    id v10 = 0;
    goto LABEL_21;
  }
  uint64_t v7 = [v5 pathExtension];
  if ([v7 isEqualToString:@"json"])
  {
    id v8 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
    uint64_t v9 = +[CDMProtobufConverter siriExternalSubwordEmbeddingRequestJsonToObjWithProto2Json:v8];
    goto LABEL_4;
  }
  if (![v7 isEqualToString:@"pb"])
  {
    if (![v7 isEqualToString:@"base64"])
    {
      id v11 = [NSString stringWithFormat:@"unhandled path extension"];
      v13 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136315394;
        __int16 v16 = "+[CDMNluLogUtil loadSubwordEmbeddingRequestFromProtobuf2File:error:]";
        __int16 v17 = 2112;
        uint64_t v18 = v11;
        _os_log_error_impl(&dword_2263A0000, v13, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&v15, 0x16u);
      }

      if (a4) {
        +[CDMNluLogUtil populateErrorWithUserInfo:a4 errorMessage:v11 errorCode:-2];
      }
      goto LABEL_19;
    }
    id v8 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedData:v6 options:1];
    uint64_t v9 = [objc_alloc(MEMORY[0x263F71D40]) initWithData:v8];
LABEL_4:
    id v10 = (void *)v9;

    if (!v10) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x263F71D40]) initWithData:v6];
  if (!v10)
  {
LABEL_9:
    id v11 = [NSString stringWithFormat:@"error decoding SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingRequest object"];
    uint64_t v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      __int16 v16 = "+[CDMNluLogUtil loadSubwordEmbeddingRequestFromProtobuf2File:error:]";
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      _os_log_error_impl(&dword_2263A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&v15, 0x16u);
    }

    if (a4) {
      +[CDMNluLogUtil populateErrorWithUserInfo:a4 errorMessage:v11 errorCode:-3];
    }
LABEL_19:

    id v10 = 0;
  }
LABEL_20:

LABEL_21:
  return v10;
}

+ (id)loadRequestFromProtobuf2File:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = +[CDMNluLogUtil loadDataFromProtobuf2File:v5 error:a4];
  if (!v6)
  {
    id v10 = 0;
    goto LABEL_21;
  }
  uint64_t v7 = [v5 pathExtension];
  if ([v7 isEqualToString:@"json"])
  {
    id v8 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
    uint64_t v9 = +[CDMProtobufConverter siriExternalNluRequestJsonToObjWithProto2Json:v8];
    goto LABEL_4;
  }
  if (![v7 isEqualToString:@"pb"])
  {
    if (![v7 isEqualToString:@"base64"])
    {
      id v11 = [NSString stringWithFormat:@"unhandled path extension"];
      v13 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136315394;
        __int16 v16 = "+[CDMNluLogUtil loadRequestFromProtobuf2File:error:]";
        __int16 v17 = 2112;
        uint64_t v18 = v11;
        _os_log_error_impl(&dword_2263A0000, v13, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&v15, 0x16u);
      }

      if (a4) {
        +[CDMNluLogUtil populateErrorWithUserInfo:a4 errorMessage:v11 errorCode:-2];
      }
      goto LABEL_19;
    }
    id v8 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedData:v6 options:1];
    uint64_t v9 = [objc_alloc(MEMORY[0x263F71CA8]) initWithData:v8];
LABEL_4:
    id v10 = (void *)v9;

    if (!v10) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x263F71CA8]) initWithData:v6];
  if (!v10)
  {
LABEL_9:
    id v11 = [NSString stringWithFormat:@"error decoding SIRINLUEXTERNALCDMNluRequest object"];
    uint64_t v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      __int16 v16 = "+[CDMNluLogUtil loadRequestFromProtobuf2File:error:]";
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      _os_log_error_impl(&dword_2263A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&v15, 0x16u);
    }

    if (a4) {
      +[CDMNluLogUtil populateErrorWithUserInfo:a4 errorMessage:v11 errorCode:-3];
    }
LABEL_19:

    id v10 = 0;
  }
LABEL_20:

LABEL_21:
  return v10;
}

+ (id)loadDataFromProtobuf2File:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v5];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    uint64_t v9 = [NSString stringWithFormat:@"error reading file: %@", v5];
    id v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "+[CDMNluLogUtil loadDataFromProtobuf2File:error:]";
      __int16 v14 = 2112;
      int v15 = v9;
      _os_log_error_impl(&dword_2263A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    if (a4) {
      +[CDMNluLogUtil populateErrorWithUserInfo:a4 errorMessage:v9 errorCode:-1];
    }
  }
  return v7;
}

+ (void)populateErrorWithUserInfo:(id *)a3 errorMessage:(id)a4 errorCode:(int64_t)a5
{
  id v8 = a4;
  uint64_t v7 = objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:");
  *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"CDMNluLogUtil" code:a5 userInfo:v7];
}

+ (id)prettyPrintProtoResponse:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v3 = a3;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v53);
  v39 = v3;
  v4 = [v3 requestId];
  id v5 = [v4 idA];
  uint64_t v6 = (const char *)[v5 UTF8String];
  size_t v7 = strlen(v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v54, (uint64_t)v6, v7);
  std::ios_base::getloc((const std::ios_base *)((char *)v54 + *(void *)(v54[0] - 24)));
  id v8 = std::locale::use_facet((const std::locale *)v57, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v8->__vftable[2].~facet_0)(v8, 10);
  std::locale::~locale((std::locale *)v57);
  std::ostream::put();
  std::ostream::flush();

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v9 = [v39 parses];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v49 objects:v62 count:16];
  if (!v10) {
    goto LABEL_54;
  }
  int v11 = 0;
  uint64_t v12 = *(void *)v50;
  uint64_t v40 = *(void *)(MEMORY[0x263F8C2C8] + 24);
  uint64_t v41 = *MEMORY[0x263F8C2C8];
  v42 = v9;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v50 != v12) {
        objc_enumerationMutation(v9);
      }
      __int16 v14 = *(void **)(*((void *)&v49 + 1) + 8 * v13);
      int v15 = [v14 userDialogActs];
      BOOL v16 = [v15 count] == 0;

      if (v16) {
        goto LABEL_47;
      }
      __int16 v17 = [v14 userDialogActs];
      uint64_t v18 = [v17 firstObject];

      if ([v18 hasAccepted])
      {
        uint64_t v19 = [v18 accepted];
        uint64_t v20 = [v19 reference];
LABEL_23:
        id v21 = (void *)v20;

        if (!v21) {
          goto LABEL_48;
        }
        uint64_t v22 = [MEMORY[0x263F71F90] convertUsoGraph:v21];
        SharedUsoVocabManager = (uint64_t *)siri::ontology::getSharedUsoVocabManager(v22);
        uint64_t v24 = *SharedUsoVocabManager;
        id v25 = (std::__shared_weak_count *)SharedUsoVocabManager[1];
        if (v25)
        {
          atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
          v47 = v25;
          atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        else
        {
          v47 = 0;
        }
        uint64_t v46 = v24;
        if (v22) {
          [(siri::ontology *)v22 toCppUsoGraph:&v46 withError:0];
        }
        else {
          uint64_t v48 = 0;
        }
        if (v47) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v47);
        }
        std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v57);
        siri::ontology::UsoGraph::prettyPrint();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v54, (uint64_t)"Parse ", 6);
        __int16 v26 = (void *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)":", 1);
        std::ios_base::getloc((const std::ios_base *)((char *)v26 + *(void *)(*v26 - 24)));
        id v27 = std::locale::use_facet(&v43, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v27->__vftable[2].~facet_0)(v27, 10);
        std::locale::~locale(&v43);
        std::ostream::put();
        std::ostream::flush();
        std::stringbuf::str();
        if ((v45 & 0x80u) == 0) {
          locale = &v43;
        }
        else {
          locale = v43.__locale_;
        }
        if ((v45 & 0x80u) == 0) {
          uint64_t v29 = v45;
        }
        else {
          uint64_t v29 = v44;
        }
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)locale, v29);
        uint64_t v9 = v42;
        if ((char)v45 < 0) {
          operator delete(v43.__locale_);
        }
        *(void *)v57 = v41;
        *(void *)&v57[*(void *)(v41 - 24)] = v40;
        *(void *)&v57[8] = MEMORY[0x263F8C318] + 16;
        if (v60 < 0) {
          operator delete(__p);
        }
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        MEMORY[0x22A656890](&v61);
        uint64_t v30 = v48;
        uint64_t v48 = 0;
        if (v30)
        {
          uint64_t v31 = MEMORY[0x22A656490]();
          MEMORY[0x22A6568D0](v31, 0x10A0C403D23BABBLL);
        }
        if (v25) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v25);
        }

LABEL_47:
        ++v11;
        goto LABEL_48;
      }
      if ([v18 hasRejected])
      {
        uint64_t v19 = [v18 rejected];
        uint64_t v20 = [v19 reference];
        goto LABEL_23;
      }
      if ([v18 hasCancelled])
      {
        uint64_t v19 = [v18 cancelled];
        uint64_t v20 = [v19 reference];
        goto LABEL_23;
      }
      if ([v18 hasUserStatedTask])
      {
        uint64_t v19 = [v18 userStatedTask];
        uint64_t v20 = [v19 task];
        goto LABEL_23;
      }
      if ([v18 hasWantedToRepeat])
      {
        uint64_t v19 = [v18 wantedToRepeat];
        uint64_t v20 = [v19 reference];
        goto LABEL_23;
      }
      if ([v18 hasAcknowledged])
      {
        uint64_t v19 = [v18 acknowledged];
        uint64_t v20 = [v19 reference];
        goto LABEL_23;
      }
      if ([v18 hasWantedToProceed])
      {
        uint64_t v19 = [v18 wantedToProceed];
        uint64_t v20 = [v19 reference];
        goto LABEL_23;
      }
      if ([v18 hasWantedToPause])
      {
        uint64_t v19 = [v18 wantedToPause];
        uint64_t v20 = [v19 reference];
        goto LABEL_23;
      }
      v32 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v57 = 136315394;
        *(void *)&v57[4] = "+[CDMNluLogUtil prettyPrintProtoResponse:]";
        *(_WORD *)&v57[12] = 2112;
        *(void *)&v57[14] = v18;
        _os_log_error_impl(&dword_2263A0000, v32, OS_LOG_TYPE_ERROR, "%s [ERR]: Unhandled SIRINLUExternalUserDialogAct type: %@", v57, 0x16u);
      }

LABEL_48:
      ++v13;
    }
    while (v10 != v13);
    uint64_t v33 = [v9 countByEnumeratingWithState:&v49 objects:v62 count:16];
    uint64_t v10 = v33;
  }
  while (v33);
LABEL_54:

  __int16 v34 = NSString;
  std::stringbuf::str();
  if (v58 >= 0) {
    id v35 = v57;
  }
  else {
    id v35 = *(unsigned char **)v57;
  }
  v36 = [v34 stringWithCString:v35 encoding:4];
  if (v58 < 0) {
    operator delete(*(void **)v57);
  }
  v53[0] = *MEMORY[0x263F8C2B8];
  uint64_t v37 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v53 + *(void *)(v53[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v54[0] = v37;
  v54[1] = MEMORY[0x263F8C318] + 16;
  if (v55 < 0) {
    operator delete((void *)v54[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x22A656890](&v56);

  return v36;
}

+ (id)prettyPrintResponse:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v3 = a3;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v52);
  uint64_t v38 = v3;
  v4 = [v3 requestId];
  id v5 = [v4 idAsString];
  uint64_t v6 = (const char *)[v5 UTF8String];
  size_t v7 = strlen(v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v53, (uint64_t)v6, v7);
  std::ios_base::getloc((const std::ios_base *)((char *)v53 + *(void *)(v53[0] - 24)));
  id v8 = std::locale::use_facet((const std::locale *)v56, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v8->__vftable[2].~facet_0)(v8, 10);
  std::locale::~locale((std::locale *)v56);
  std::ostream::put();
  std::ostream::flush();

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [v38 parses];
  uint64_t v9 = [obj countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (!v9) {
    goto LABEL_50;
  }
  int v10 = 0;
  uint64_t v11 = *(void *)v49;
  uint64_t v40 = *MEMORY[0x263F8C2C8];
  uint64_t v39 = *(void *)(MEMORY[0x263F8C2C8] + 24);
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v49 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void **)(*((void *)&v48 + 1) + 8 * v12);
      __int16 v14 = [v13 userDialogActs];
      BOOL v15 = [v14 count] == 0;

      if (v15) {
        goto LABEL_41;
      }
      BOOL v16 = [v13 userDialogActs];
      __int16 v17 = [v16 firstObject];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v18 = [v17 reference];
LABEL_20:
        uint64_t v19 = (void *)v18;

        if (!v19) {
          goto LABEL_42;
        }
        SharedUsoVocabManager = (uint64_t *)siri::ontology::getSharedUsoVocabManager(v20);
        uint64_t v22 = *SharedUsoVocabManager;
        id v23 = (std::__shared_weak_count *)SharedUsoVocabManager[1];
        if (v23)
        {
          atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
          uint64_t v46 = v23;
          atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        else
        {
          uint64_t v46 = 0;
        }
        uint64_t v45 = v22;
        [v19 toCppUsoGraph:&v45 withError:0];
        if (v46) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v46);
        }
        std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v56);
        siri::ontology::UsoGraph::prettyPrint();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v53, (uint64_t)"Parse ", 6);
        uint64_t v24 = (void *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)":", 1);
        std::ios_base::getloc((const std::ios_base *)((char *)v24 + *(void *)(*v24 - 24)));
        id v25 = std::locale::use_facet(&v42, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v25->__vftable[2].~facet_0)(v25, 10);
        std::locale::~locale(&v42);
        std::ostream::put();
        std::ostream::flush();
        std::stringbuf::str();
        if ((v44 & 0x80u) == 0) {
          locale = &v42;
        }
        else {
          locale = v42.__locale_;
        }
        if ((v44 & 0x80u) == 0) {
          uint64_t v27 = v44;
        }
        else {
          uint64_t v27 = v43;
        }
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)locale, v27);
        if ((char)v44 < 0) {
          operator delete(v42.__locale_);
        }
        *(void *)uint64_t v56 = v40;
        *(void *)&v56[*(void *)(v40 - 24)] = v39;
        *(void *)&v56[8] = MEMORY[0x263F8C318] + 16;
        if (v59 < 0) {
          operator delete(__p);
        }
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        MEMORY[0x22A656890](&v60);
        uint64_t v28 = v47;
        uint64_t v47 = 0;
        if (v28)
        {
          uint64_t v29 = MEMORY[0x22A656490]();
          MEMORY[0x22A6568D0](v29, 0x10A0C403D23BABBLL);
        }
        if (v23) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v23);
        }

LABEL_41:
        ++v10;
        goto LABEL_42;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v18 = [v17 task];
        goto LABEL_20;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v30 = v17;
        id v35 = [v30 description];

        goto LABEL_55;
      }
      uint64_t v31 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v56 = 136315394;
        *(void *)&v56[4] = "+[CDMNluLogUtil prettyPrintResponse:]";
        *(_WORD *)&v56[12] = 2112;
        *(void *)&v56[14] = v17;
        _os_log_error_impl(&dword_2263A0000, v31, OS_LOG_TYPE_ERROR, "%s [ERR]: Unhandled SIRINLUUserDialogAct type: %@", v56, 0x16u);
      }

LABEL_42:
      ++v12;
    }
    while (v9 != v12);
    uint64_t v32 = [obj countByEnumeratingWithState:&v48 objects:v61 count:16];
    uint64_t v9 = v32;
  }
  while (v32);
LABEL_50:

  uint64_t v33 = NSString;
  std::stringbuf::str();
  if (v57 >= 0) {
    __int16 v34 = v56;
  }
  else {
    __int16 v34 = *(unsigned char **)v56;
  }
  id v35 = [v33 stringWithCString:v34 encoding:4];
  if (v57 < 0) {
    operator delete(*(void **)v56);
  }
LABEL_55:
  v52[0] = *MEMORY[0x263F8C2B8];
  uint64_t v36 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v52 + *(void *)(v52[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v53[0] = v36;
  v53[1] = MEMORY[0x263F8C318] + 16;
  if (v54 < 0) {
    operator delete((void *)v53[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x22A656890](&v55);

  return v35;
}

+ (id)writeUaaPResponseToDisk:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  size_t v7 = NSString;
  id v8 = [MEMORY[0x263EFF910] date];
  [v8 timeIntervalSince1970];
  int v10 = objc_msgSend(v7, "stringWithFormat:", @"UaaPResponse-%f.json", v9);

  uint64_t v11 = [a1 getLogBasePath];
  uint64_t v12 = [v11 stringByAppendingPathComponent:v10];

  uint64_t v13 = [v12 pathExtension];
  __int16 v14 = +[CDMProtobufConverter serializeUaaPParserResponseWithResponse:v6 formatType:v13];

  id v21 = 0;
  BOOL v15 = +[CDMNluLogUtil saveProtoFile:v14 protobufFile:v12 error:&v21];
  id v16 = v21;
  if (v15)
  {
    __int16 v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v23 = "+[CDMNluLogUtil writeUaaPResponseToDisk:error:]";
      __int16 v24 = 2112;
      id v25 = v12;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s UaaPResponse logged to: %@", buf, 0x16u);
    }

    id v18 = v12;
  }
  else
  {
    uint64_t v19 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v23 = "+[CDMNluLogUtil writeUaaPResponseToDisk:error:]";
      __int16 v24 = 2112;
      id v25 = v16;
      _os_log_impl(&dword_2263A0000, v19, OS_LOG_TYPE_INFO, "%s [WARN]: error writing file: %@", buf, 0x16u);
    }

    id v18 = 0;
    if (a4) {
      *a4 = v16;
    }
  }

  return v18;
}

+ (id)writeUaaPRequestToDisk:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  size_t v7 = NSString;
  id v8 = [MEMORY[0x263EFF910] date];
  [v8 timeIntervalSince1970];
  int v10 = objc_msgSend(v7, "stringWithFormat:", @"UaaPRequest-%f.json", v9);

  uint64_t v11 = [a1 getLogBasePath];
  uint64_t v12 = [v11 stringByAppendingPathComponent:v10];

  uint64_t v13 = [v12 pathExtension];
  __int16 v14 = +[CDMProtobufConverter serializeUaaPParserRequestWithRequest:v6 formatType:v13];

  id v21 = 0;
  BOOL v15 = +[CDMNluLogUtil saveProtoFile:v14 protobufFile:v12 error:&v21];
  id v16 = v21;
  if (v15)
  {
    __int16 v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v23 = "+[CDMNluLogUtil writeUaaPRequestToDisk:error:]";
      __int16 v24 = 2112;
      id v25 = v12;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s UaaPRequest logged to: %@", buf, 0x16u);
    }

    id v18 = v12;
  }
  else
  {
    uint64_t v19 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v23 = "+[CDMNluLogUtil writeUaaPRequestToDisk:error:]";
      __int16 v24 = 2112;
      id v25 = v16;
      _os_log_impl(&dword_2263A0000, v19, OS_LOG_TYPE_INFO, "%s [WARN]: error writing file: %@", buf, 0x16u);
    }

    id v18 = 0;
    if (a4) {
      *a4 = v16;
    }
  }

  return v18;
}

+ (id)writeSSUResponseToDisk:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  size_t v7 = NSString;
  id v8 = [MEMORY[0x263EFF910] date];
  [v8 timeIntervalSince1970];
  int v10 = objc_msgSend(v7, "stringWithFormat:", @"SSUResponse-%f.json", v9);

  uint64_t v11 = [a1 getLogBasePath];
  uint64_t v12 = [v11 stringByAppendingPathComponent:v10];

  uint64_t v13 = [v12 pathExtension];
  __int16 v14 = +[CDMProtobufConverter serializeSSUResponseWithResponse:v6 formatType:v13];

  if (+[CDMNluLogUtil saveProtoFile:v14 protobufFile:v12 error:a4])
  {
    BOOL v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeSSUResponseToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s SSUResponse logged to: %@", buf, 0x16u);
    }

    id v16 = v12;
  }
  else
  {
    __int16 v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = *a4;
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeSSUResponseToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v18;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s [WARN]: Error writing SSU response to file: %@", buf, 0x16u);
    }

    id v16 = 0;
  }

  return v16;
}

+ (id)writeSSURequestToDisk:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  size_t v7 = NSString;
  id v8 = [MEMORY[0x263EFF910] date];
  [v8 timeIntervalSince1970];
  int v10 = objc_msgSend(v7, "stringWithFormat:", @"SSURequest-%f.json", v9);

  uint64_t v11 = [a1 getLogBasePath];
  uint64_t v12 = [v11 stringByAppendingPathComponent:v10];

  uint64_t v13 = [v12 pathExtension];
  __int16 v14 = +[CDMProtobufConverter serializeSSURequestWithRequest:v6 formatType:v13];

  if (+[CDMNluLogUtil saveProtoFile:v14 protobufFile:v12 error:a4])
  {
    BOOL v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeSSURequestToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s SSURequest logged to: %@", buf, 0x16u);
    }

    id v16 = v12;
  }
  else
  {
    __int16 v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = *a4;
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeSSURequestToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v18;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s [WARN]: Error writing SSU request to file: %@", buf, 0x16u);
    }

    id v16 = 0;
  }

  return v16;
}

+ (id)writeLVCResponseToDisk:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  size_t v7 = NSString;
  id v8 = [MEMORY[0x263EFF910] date];
  [v8 timeIntervalSince1970];
  int v10 = objc_msgSend(v7, "stringWithFormat:", @"LVCResponse-%f.json", v9);

  uint64_t v11 = [a1 getLogBasePath];
  uint64_t v12 = [v11 stringByAppendingPathComponent:v10];

  uint64_t v13 = [v12 pathExtension];
  __int16 v14 = +[CDMProtobufConverter serializeITFMParserResponseWithResponse:v6 formatType:v13];

  if (+[CDMNluLogUtil saveProtoFile:v14 protobufFile:v12 error:a4])
  {
    BOOL v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeLVCResponseToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s LVCResponse logged to: %@", buf, 0x16u);
    }

    id v16 = v12;
  }
  else
  {
    __int16 v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = *a4;
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeLVCResponseToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v18;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s [WARN]: Error writing LVC response to file: %@", buf, 0x16u);
    }

    id v16 = 0;
  }

  return v16;
}

+ (id)writeLVCRequestToDisk:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  size_t v7 = NSString;
  id v8 = [MEMORY[0x263EFF910] date];
  [v8 timeIntervalSince1970];
  int v10 = objc_msgSend(v7, "stringWithFormat:", @"LVCRequest-%f.json", v9);

  uint64_t v11 = [a1 getLogBasePath];
  uint64_t v12 = [v11 stringByAppendingPathComponent:v10];

  uint64_t v13 = [v12 pathExtension];
  __int16 v14 = +[CDMProtobufConverter serializeITFMParserRequestWithRequest:v6 formatType:v13];

  if (+[CDMNluLogUtil saveProtoFile:v14 protobufFile:v12 error:a4])
  {
    BOOL v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeLVCRequestToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s LVCRequest logged to: %@", buf, 0x16u);
    }

    id v16 = v12;
  }
  else
  {
    __int16 v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = *a4;
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeLVCRequestToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v18;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s [WARN]: Error writing LVC request to file: %@", buf, 0x16u);
    }

    id v16 = 0;
  }

  return v16;
}

+ (id)writePSCResponseToDisk:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  size_t v7 = NSString;
  id v8 = [MEMORY[0x263EFF910] date];
  [v8 timeIntervalSince1970];
  int v10 = objc_msgSend(v7, "stringWithFormat:", @"PSCResponse-%f.json", v9);

  uint64_t v11 = [a1 getLogBasePath];
  uint64_t v12 = [v11 stringByAppendingPathComponent:v10];

  uint64_t v13 = [v12 pathExtension];
  __int16 v14 = +[CDMProtobufConverter serializePSCParserResponseWithResponse:v6 formatType:v13];

  if (+[CDMNluLogUtil saveProtoFile:v14 protobufFile:v12 error:a4])
  {
    BOOL v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writePSCResponseToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s PSCResponse logged to: %@", buf, 0x16u);
    }

    id v16 = v12;
  }
  else
  {
    __int16 v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = *a4;
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writePSCResponseToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v18;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s [WARN]: error writing file: %@", buf, 0x16u);
    }

    id v16 = 0;
  }

  return v16;
}

+ (id)writePSCRequestToDisk:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  size_t v7 = NSString;
  id v8 = [MEMORY[0x263EFF910] date];
  [v8 timeIntervalSince1970];
  int v10 = objc_msgSend(v7, "stringWithFormat:", @"PSCRequest-%f.json", v9);

  uint64_t v11 = [a1 getLogBasePath];
  uint64_t v12 = [v11 stringByAppendingPathComponent:v10];

  uint64_t v13 = [v12 pathExtension];
  __int16 v14 = +[CDMProtobufConverter serializePSCParserRequestWithRequest:v6 formatType:v13];

  if (+[CDMNluLogUtil saveProtoFile:v14 protobufFile:v12 error:a4])
  {
    BOOL v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writePSCRequestToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s PSCRequest logged to: %@", buf, 0x16u);
    }

    id v16 = v12;
  }
  else
  {
    __int16 v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = *a4;
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writePSCRequestToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v18;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s [WARN]: error writing file: %@", buf, 0x16u);
    }

    id v16 = 0;
  }

  return v16;
}

+ (id)writeSNLCResponseToDisk:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  size_t v7 = NSString;
  id v8 = [MEMORY[0x263EFF910] date];
  [v8 timeIntervalSince1970];
  int v10 = objc_msgSend(v7, "stringWithFormat:", @"SNLCResponse-%f.json", v9);

  uint64_t v11 = [a1 getLogBasePath];
  uint64_t v12 = [v11 stringByAppendingPathComponent:v10];

  uint64_t v13 = [v12 pathExtension];
  __int16 v14 = +[CDMProtobufConverter serializeITFMParserResponseWithResponse:v6 formatType:v13];

  if (+[CDMNluLogUtil saveProtoFile:v14 protobufFile:v12 error:a4])
  {
    BOOL v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeSNLCResponseToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s SNLCResponse logged to: %@", buf, 0x16u);
    }

    id v16 = v12;
  }
  else
  {
    __int16 v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = *a4;
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeSNLCResponseToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v18;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s [WARN]: error writing file: %@", buf, 0x16u);
    }

    id v16 = 0;
  }

  return v16;
}

+ (id)writeSNLCRequestToDisk:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  size_t v7 = NSString;
  id v8 = [MEMORY[0x263EFF910] date];
  [v8 timeIntervalSince1970];
  int v10 = objc_msgSend(v7, "stringWithFormat:", @"SNLCRequest-%f.json", v9);

  uint64_t v11 = [a1 getLogBasePath];
  uint64_t v12 = [v11 stringByAppendingPathComponent:v10];

  uint64_t v13 = [v12 pathExtension];
  __int16 v14 = +[CDMProtobufConverter serializeITFMParserRequestWithRequest:v6 formatType:v13];

  if (+[CDMNluLogUtil saveProtoFile:v14 protobufFile:v12 error:a4])
  {
    BOOL v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeSNLCRequestToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s SNLCRequest logged to: %@", buf, 0x16u);
    }

    id v16 = v12;
  }
  else
  {
    __int16 v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = *a4;
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeSNLCRequestToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v18;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s [WARN]: error writing file: %@", buf, 0x16u);
    }

    id v16 = 0;
  }

  return v16;
}

+ (id)writeMRResponseToDisk:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  size_t v7 = NSString;
  id v8 = [MEMORY[0x263EFF910] date];
  [v8 timeIntervalSince1970];
  int v10 = objc_msgSend(v7, "stringWithFormat:", @"MRResponse-%f.json", v9);

  uint64_t v11 = [a1 getLogBasePath];
  uint64_t v12 = [v11 stringByAppendingPathComponent:v10];

  uint64_t v13 = [v12 pathExtension];
  __int16 v14 = +[CDMProtobufConverter serializeMRResponseWithResponse:v6 formatType:v13];

  if (+[CDMNluLogUtil saveProtoFile:v14 protobufFile:v12 error:a4])
  {
    BOOL v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeMRResponseToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s MR Response logged to: %@", buf, 0x16u);
    }

    id v16 = v12;
  }
  else
  {
    __int16 v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = *a4;
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeMRResponseToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v18;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s [WARN]: error writing file: %@", buf, 0x16u);
    }

    id v16 = 0;
  }

  return v16;
}

+ (id)writeMRRequestToDisk:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  size_t v7 = NSString;
  id v8 = [MEMORY[0x263EFF910] date];
  [v8 timeIntervalSince1970];
  int v10 = objc_msgSend(v7, "stringWithFormat:", @"MRRequest-%f.json", v9);

  uint64_t v11 = [a1 getLogBasePath];
  uint64_t v12 = [v11 stringByAppendingPathComponent:v10];

  uint64_t v13 = [v12 pathExtension];
  __int16 v14 = +[CDMProtobufConverter serializeMRRequestWithRequest:v6 formatType:v13];

  if (+[CDMNluLogUtil saveProtoFile:v14 protobufFile:v12 error:a4])
  {
    BOOL v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeMRRequestToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s MR Request logged to: %@", buf, 0x16u);
    }

    id v16 = v12;
  }
  else
  {
    __int16 v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = *a4;
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeMRRequestToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v18;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s [WARN]: error writing file: %@", buf, 0x16u);
    }

    id v16 = 0;
  }

  return v16;
}

+ (id)writeMDResponseToDisk:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  size_t v7 = NSString;
  id v8 = [MEMORY[0x263EFF910] date];
  [v8 timeIntervalSince1970];
  int v10 = objc_msgSend(v7, "stringWithFormat:", @"MDResponse-%f.json", v9);

  uint64_t v11 = [a1 getLogBasePath];
  uint64_t v12 = [v11 stringByAppendingPathComponent:v10];

  uint64_t v13 = [v12 pathExtension];
  __int16 v14 = +[CDMProtobufConverter serializeMDResponseWithResponse:v6 formatType:v13];

  if (+[CDMNluLogUtil saveProtoFile:v14 protobufFile:v12 error:a4])
  {
    BOOL v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeMDResponseToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s MD Response logged to: %@", buf, 0x16u);
    }

    id v16 = v12;
  }
  else
  {
    __int16 v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = *a4;
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeMDResponseToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v18;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s [WARN]: error writing file: %@", buf, 0x16u);
    }

    id v16 = 0;
  }

  return v16;
}

+ (id)writeMDRequestToDisk:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  size_t v7 = NSString;
  id v8 = [MEMORY[0x263EFF910] date];
  [v8 timeIntervalSince1970];
  int v10 = objc_msgSend(v7, "stringWithFormat:", @"MDRequest-%f.json", v9);

  uint64_t v11 = [a1 getLogBasePath];
  uint64_t v12 = [v11 stringByAppendingPathComponent:v10];

  uint64_t v13 = [v12 pathExtension];
  __int16 v14 = +[CDMProtobufConverter serializeMDRequestWithRequest:v6 formatType:v13];

  if (+[CDMNluLogUtil saveProtoFile:v14 protobufFile:v12 error:a4])
  {
    BOOL v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeMDRequestToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s MD Request logged to: %@", buf, 0x16u);
    }

    id v16 = v12;
  }
  else
  {
    __int16 v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = *a4;
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeMDRequestToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v18;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s [WARN]: error writing file: %@", buf, 0x16u);
    }

    id v16 = 0;
  }

  return v16;
}

+ (id)writeNlv4ResponseToDisk:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  size_t v7 = NSString;
  id v8 = [MEMORY[0x263EFF910] date];
  [v8 timeIntervalSince1970];
  int v10 = objc_msgSend(v7, "stringWithFormat:", @"Nlv4Response-%f.json", v9);

  uint64_t v11 = [a1 getLogBasePath];
  uint64_t v12 = [v11 stringByAppendingPathComponent:v10];

  uint64_t v13 = [v12 pathExtension];
  __int16 v14 = +[CDMProtobufConverter serializeNlv4ParserResponseWithResponse:v6 formatType:v13];

  if (+[CDMNluLogUtil saveProtoFile:v14 protobufFile:v12 error:a4])
  {
    BOOL v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeNlv4ResponseToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s NLv4Response logged to: %@", buf, 0x16u);
    }

    id v16 = v12;
  }
  else
  {
    __int16 v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = *a4;
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeNlv4ResponseToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v18;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s [WARN]: error writing file: %@", buf, 0x16u);
    }

    id v16 = 0;
  }

  return v16;
}

+ (id)writeNlv4RequestToDisk:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  size_t v7 = NSString;
  id v8 = [MEMORY[0x263EFF910] date];
  [v8 timeIntervalSince1970];
  int v10 = objc_msgSend(v7, "stringWithFormat:", @"Nlv4Request-%f.json", v9);

  uint64_t v11 = [a1 getLogBasePath];
  uint64_t v12 = [v11 stringByAppendingPathComponent:v10];

  uint64_t v13 = [v12 pathExtension];
  __int16 v14 = +[CDMProtobufConverter serializeNlv4ParserRequestWithRequest:v6 formatType:v13];

  if (+[CDMNluLogUtil saveProtoFile:v14 protobufFile:v12 error:a4])
  {
    BOOL v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeNlv4RequestToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s NLv4Request logged to: %@", buf, 0x16u);
    }

    id v16 = v12;
  }
  else
  {
    __int16 v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = *a4;
      *(_DWORD *)buf = 136315394;
      id v21 = "+[CDMNluLogUtil writeNlv4RequestToDisk:error:]";
      __int16 v22 = 2112;
      id v23 = v18;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s [WARN]: error writing file: %@", buf, 0x16u);
    }

    id v16 = 0;
  }

  return v16;
}

+ (id)getLogBasePath
{
  if (+[CDMNluLogUtil getLogBasePath]::onceToken != -1) {
    dispatch_once(&+[CDMNluLogUtil getLogBasePath]::onceToken, &__block_literal_global_4433);
  }
  v2 = (void *)+[CDMNluLogUtil getLogBasePath]::value;
  return v2;
}

uint64_t __31__CDMNluLogUtil_getLogBasePath__block_invoke()
{
  +[CDMNluLogUtil getLogBasePath]::value = +[CDMUserDefaultsUtils readCustomLogPath];
  return MEMORY[0x270F9A758]();
}

@end