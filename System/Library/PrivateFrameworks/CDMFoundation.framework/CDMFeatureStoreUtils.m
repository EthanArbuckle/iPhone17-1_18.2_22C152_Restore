@interface CDMFeatureStoreUtils
+ (BOOL)checkFeatureStoreEnabledForExternalBuilds:(id)a3;
+ (BOOL)insertJsonStringToFeatureStore:(id)a3 interactionId:(id)a4 streamId:(id)a5;
+ (BOOL)insertLVCRequestToFeatureStore:(id)a3 interactionId:(id)a4;
+ (BOOL)insertLVCResponseToFeatureStore:(id)a3 interactionId:(id)a4;
+ (BOOL)insertMDRequestToFeatureStore:(id)a3 interactionId:(id)a4;
+ (BOOL)insertMDResponseToFeatureStore:(id)a3 interactionId:(id)a4;
+ (BOOL)insertMRRequestToFeatureStore:(id)a3 interactionId:(id)a4;
+ (BOOL)insertMRResponseToFeatureStore:(id)a3 interactionId:(id)a4;
+ (BOOL)insertNLv4ParserRequestToFeatureStore:(id)a3 interactionId:(id)a4;
+ (BOOL)insertNLv4ParserResponseToFeatureStore:(id)a3 interactionId:(id)a4;
+ (BOOL)insertPSCRequestToFeatureStore:(id)a3 interactionId:(id)a4;
+ (BOOL)insertPSCResponseToFeatureStore:(id)a3 interactionId:(id)a4;
+ (BOOL)insertPreprocessingWrapperToFeatureStore:(id)a3 interactionId:(id)a4;
+ (BOOL)insertRequestToFeatureStoreAsJson:(id)a3;
+ (BOOL)insertResponseToFeatureStoreAsJson:(id)a3;
+ (BOOL)insertSNLCRequestToFeatureStore:(id)a3 interactionId:(id)a4;
+ (BOOL)insertSNLCResponseToFeatureStore:(id)a3 interactionId:(id)a4;
+ (BOOL)insertSpanMatchResponseToFeatureStore:(id)a3 interactionId:(id)a4;
+ (BOOL)insertTokenizerResponseToFeatureStore:(id)a3 interactionId:(id)a4;
+ (BOOL)insertUaaPParserRequestToFeatureStore:(id)a3 interactionId:(id)a4;
+ (BOOL)insertUaaPParserResponseToFeatureStore:(id)a3 interactionId:(id)a4;
+ (BOOL)platformSupportedAndEnabled;
+ (id)allowedFSMessagesOnExternalBuilds;
@end

@implementation CDMFeatureStoreUtils

+ (BOOL)insertPreprocessingWrapperToFeatureStore:(id)a3 interactionId:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315138;
    v15 = "+[CDMFeatureStoreUtils insertPreprocessingWrapperToFeatureStore:interactionId:]";
    _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s CDMFeatureStoreUtils insertPreprocessingWrapperToFeatureStore", (uint8_t *)&v14, 0xCu);
  }

  if (([a1 platformSupportedAndEnabled] & 1) == 0)
  {
    v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v12 = NSStringFromSelector(a2);
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertPreprocessingWrapperToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_10;
  }
  if (!+[CDMPlatformUtils isInternalInstall])
  {
    v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315138;
      v15 = "+[CDMFeatureStoreUtils insertPreprocessingWrapperToFeatureStore:interactionId:]";
      _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s Device not on internal build. Not inserting PreprocessingWrapper to FeatureStore.", (uint8_t *)&v14, 0xCu);
    }
LABEL_10:
    BOOL v11 = 0;
    goto LABEL_11;
  }
  v10 = +[CDMProtobufConverter serializePreprocessingWrapperWithWrapper:v7 formatType:@"json"];
  BOOL v11 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:v10 interactionId:v8 streamId:@"PreprocessingWrapper"];
LABEL_11:

  return v11;
}

+ (BOOL)insertUaaPParserResponseToFeatureStore:(id)a3 interactionId:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (([a1 platformSupportedAndEnabled] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertUaaPParserResponseToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_8;
  }
  if (([a1 checkFeatureStoreEnabledForExternalBuilds:@"NLv4Response"] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertUaaPParserResponseToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = @"NLv4Response";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    BOOL v10 = 0;
    goto LABEL_9;
  }
  v9 = +[CDMProtobufConverter serializeUaaPParserResponseWithResponse:v7 formatType:@"json"];
  BOOL v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:v9 interactionId:v8 streamId:@"NLv4Response"];

LABEL_9:
  return v10;
}

+ (BOOL)insertUaaPParserRequestToFeatureStore:(id)a3 interactionId:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (([a1 platformSupportedAndEnabled] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertUaaPParserRequestToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_8;
  }
  if (([a1 checkFeatureStoreEnabledForExternalBuilds:@"NLv4Request"] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertUaaPParserRequestToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = @"NLv4Request";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    BOOL v10 = 0;
    goto LABEL_9;
  }
  v9 = +[CDMProtobufConverter serializeUaaPParserRequestWithRequest:v7 formatType:@"json"];
  BOOL v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:v9 interactionId:v8 streamId:@"NLv4Request"];

LABEL_9:
  return v10;
}

+ (BOOL)insertNLv4ParserResponseToFeatureStore:(id)a3 interactionId:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (([a1 platformSupportedAndEnabled] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertNLv4ParserResponseToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_8;
  }
  if (([a1 checkFeatureStoreEnabledForExternalBuilds:@"NLv4Response"] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertNLv4ParserResponseToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = @"NLv4Response";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    BOOL v10 = 0;
    goto LABEL_9;
  }
  v9 = +[CDMProtobufConverter serializeNlv4ParserResponseWithResponse:v7 formatType:@"json"];
  BOOL v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:v9 interactionId:v8 streamId:@"NLv4Response"];

LABEL_9:
  return v10;
}

+ (BOOL)insertNLv4ParserRequestToFeatureStore:(id)a3 interactionId:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (([a1 platformSupportedAndEnabled] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertNLv4ParserRequestToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_8;
  }
  if (([a1 checkFeatureStoreEnabledForExternalBuilds:@"NLv4Request"] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertNLv4ParserRequestToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = @"NLv4Request";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    BOOL v10 = 0;
    goto LABEL_9;
  }
  v9 = +[CDMProtobufConverter serializeNlv4ParserRequestWithRequest:v7 formatType:@"json"];
  BOOL v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:v9 interactionId:v8 streamId:@"NLv4Request"];

LABEL_9:
  return v10;
}

+ (BOOL)insertMRResponseToFeatureStore:(id)a3 interactionId:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (([a1 platformSupportedAndEnabled] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertMRResponseToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_8;
  }
  if (([a1 checkFeatureStoreEnabledForExternalBuilds:@"MRResponse"] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertMRResponseToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = @"MRResponse";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    BOOL v10 = 0;
    goto LABEL_9;
  }
  v9 = +[CDMProtobufConverter serializeMRResponseWithResponse:v7 formatType:@"json"];
  BOOL v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:v9 interactionId:v8 streamId:@"MRResponse"];

LABEL_9:
  return v10;
}

+ (BOOL)insertMRRequestToFeatureStore:(id)a3 interactionId:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (([a1 platformSupportedAndEnabled] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertMRRequestToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_8;
  }
  if (([a1 checkFeatureStoreEnabledForExternalBuilds:@"MRRequest"] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertMRRequestToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = @"MRRequest";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    BOOL v10 = 0;
    goto LABEL_9;
  }
  v9 = +[CDMProtobufConverter serializeMRRequestWithRequest:v7 formatType:@"json"];
  BOOL v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:v9 interactionId:v8 streamId:@"MRRequest"];

LABEL_9:
  return v10;
}

+ (BOOL)insertMDResponseToFeatureStore:(id)a3 interactionId:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (([a1 platformSupportedAndEnabled] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertMDResponseToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_8;
  }
  if (([a1 checkFeatureStoreEnabledForExternalBuilds:@"MDResponse"] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertMDResponseToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = @"MDResponse";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    BOOL v10 = 0;
    goto LABEL_9;
  }
  v9 = +[CDMProtobufConverter serializeMDResponseWithResponse:v7 formatType:@"json"];
  BOOL v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:v9 interactionId:v8 streamId:@"MDResponse"];

LABEL_9:
  return v10;
}

+ (BOOL)insertMDRequestToFeatureStore:(id)a3 interactionId:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (([a1 platformSupportedAndEnabled] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertMDRequestToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_8;
  }
  if (([a1 checkFeatureStoreEnabledForExternalBuilds:@"MDRequest"] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertMDRequestToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = @"MDRequest";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    BOOL v10 = 0;
    goto LABEL_9;
  }
  v9 = +[CDMProtobufConverter serializeMDRequestWithRequest:v7 formatType:@"json"];
  BOOL v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:v9 interactionId:v8 streamId:@"MDRequest"];

LABEL_9:
  return v10;
}

+ (BOOL)insertLVCResponseToFeatureStore:(id)a3 interactionId:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (([a1 platformSupportedAndEnabled] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertLVCResponseToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_8;
  }
  if (([a1 checkFeatureStoreEnabledForExternalBuilds:@"LVCResponse"] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertLVCResponseToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = @"LVCResponse";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    BOOL v10 = 0;
    goto LABEL_9;
  }
  v9 = +[CDMProtobufConverter serializeITFMParserResponseWithResponse:v7 formatType:@"json"];
  BOOL v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:v9 interactionId:v8 streamId:@"LVCResponse"];

LABEL_9:
  return v10;
}

+ (BOOL)insertLVCRequestToFeatureStore:(id)a3 interactionId:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (([a1 platformSupportedAndEnabled] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertLVCRequestToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_8;
  }
  if (([a1 checkFeatureStoreEnabledForExternalBuilds:@"LVCRequest"] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertLVCRequestToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = @"LVCRequest";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    BOOL v10 = 0;
    goto LABEL_9;
  }
  v9 = +[CDMProtobufConverter serializeITFMParserRequestWithRequest:v7 formatType:@"json"];
  BOOL v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:v9 interactionId:v8 streamId:@"LVCRequest"];

LABEL_9:
  return v10;
}

+ (BOOL)insertPSCResponseToFeatureStore:(id)a3 interactionId:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (([a1 platformSupportedAndEnabled] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertPSCResponseToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_8;
  }
  if (([a1 checkFeatureStoreEnabledForExternalBuilds:@"PSCResponse"] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertPSCResponseToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = @"PSCResponse";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    BOOL v10 = 0;
    goto LABEL_9;
  }
  v9 = +[CDMProtobufConverter serializeITFMParserResponseWithResponse:v7 formatType:@"json"];
  BOOL v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:v9 interactionId:v8 streamId:@"PSCResponse"];

LABEL_9:
  return v10;
}

+ (BOOL)insertPSCRequestToFeatureStore:(id)a3 interactionId:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (([a1 platformSupportedAndEnabled] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertPSCRequestToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_8;
  }
  if (([a1 checkFeatureStoreEnabledForExternalBuilds:@"PSCRequest"] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertPSCRequestToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = @"PSCRequest";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    BOOL v10 = 0;
    goto LABEL_9;
  }
  v9 = +[CDMProtobufConverter serializeITFMParserRequestWithRequest:v7 formatType:@"json"];
  BOOL v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:v9 interactionId:v8 streamId:@"PSCRequest"];

LABEL_9:
  return v10;
}

+ (BOOL)insertSNLCResponseToFeatureStore:(id)a3 interactionId:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (([a1 platformSupportedAndEnabled] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertSNLCResponseToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_8;
  }
  if (([a1 checkFeatureStoreEnabledForExternalBuilds:@"SNLCITFMResponse"] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertSNLCResponseToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = @"SNLCITFMResponse";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    BOOL v10 = 0;
    goto LABEL_9;
  }
  v9 = +[CDMProtobufConverter serializeITFMParserResponseWithResponse:v7 formatType:@"json"];
  BOOL v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:v9 interactionId:v8 streamId:@"SNLCITFMResponse"];

LABEL_9:
  return v10;
}

+ (BOOL)insertSNLCRequestToFeatureStore:(id)a3 interactionId:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (([a1 platformSupportedAndEnabled] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertSNLCRequestToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_8;
  }
  if (([a1 checkFeatureStoreEnabledForExternalBuilds:@"SNLCITFMRequest"] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertSNLCRequestToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = @"SNLCITFMRequest";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    BOOL v10 = 0;
    goto LABEL_9;
  }
  v9 = +[CDMProtobufConverter serializeITFMParserRequestWithRequest:v7 formatType:@"json"];
  BOOL v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:v9 interactionId:v8 streamId:@"SNLCITFMRequest"];

LABEL_9:
  return v10;
}

+ (BOOL)insertSpanMatchResponseToFeatureStore:(id)a3 interactionId:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (([a1 platformSupportedAndEnabled] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertSpanMatchResponseToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_8;
  }
  if (([a1 checkFeatureStoreEnabledForExternalBuilds:@"SpanMatchResponse"] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertSpanMatchResponseToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = @"SpanMatchResponse";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    BOOL v10 = 0;
    goto LABEL_9;
  }
  v9 = +[CDMProtobufConverter serializeSpanMatchResponseWithResponse:v7 formatType:@"json"];
  BOOL v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:v9 interactionId:v8 streamId:@"SpanMatchResponse"];

LABEL_9:
  return v10;
}

+ (BOOL)insertTokenizerResponseToFeatureStore:(id)a3 interactionId:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (([a1 platformSupportedAndEnabled] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertTokenizerResponseToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_8;
  }
  if (([a1 checkFeatureStoreEnabledForExternalBuilds:@"TokenizerResponse"] & 1) == 0)
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertTokenizerResponseToFeatureStore:interactionId:]";
      __int16 v16 = 2112;
      v17 = @"TokenizerResponse";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    BOOL v10 = 0;
    goto LABEL_9;
  }
  v9 = +[CDMProtobufConverter serializeTokenizerResponseWithResponse:v7 formatType:@"json"];
  BOOL v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:v9 interactionId:v8 streamId:@"TokenizerResponse"];

LABEL_9:
  return v10;
}

+ (BOOL)insertJsonStringToFeatureStore:(id)a3 interactionId:(id)a4 streamId:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (([a1 platformSupportedAndEnabled] & 1) == 0)
  {
    v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 136315394;
      v25 = "+[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:]";
      __int16 v26 = 2112;
      id v27 = v18;
      _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", buf, 0x16u);
    }
    goto LABEL_21;
  }
  if (([a1 checkFeatureStoreEnabledForExternalBuilds:v11] & 1) == 0)
  {
    v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "+[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:]";
      __int16 v26 = 2112;
      id v27 = v11;
      _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", buf, 0x16u);
    }
    goto LABEL_21;
  }
  if (!v10)
  {
    v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "+[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:]";
      __int16 v26 = 2112;
      id v27 = v11;
      v19 = "%s [WARN]: A nil interaction ID was passed in for streamId=%@. Skip saving to FeatureStore";
      v20 = v13;
      uint32_t v21 = 22;
LABEL_20:
      _os_log_impl(&dword_2263A0000, v20, OS_LOG_TYPE_INFO, v19, buf, v21);
    }
LABEL_21:
    char v15 = 0;
    goto LABEL_22;
  }
  v12 = CDMOSLoggerForCategory(0);
  v13 = v12;
  if (!v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v25 = "+[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:]";
      __int16 v26 = 2112;
      id v27 = v10;
      __int16 v28 = 2112;
      id v29 = v11;
      v19 = "%s [WARN]: The passed in Feature is nil with interactionId=%@ for streamId=%@. Skip saving to FeatureStore";
      v20 = v13;
      uint32_t v21 = 32;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "+[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:]";
    __int16 v26 = 2112;
    id v27 = v10;
    __int16 v28 = 2112;
    id v29 = v11;
    _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s interactionId=%@, streamId=%@", buf, 0x20u);
  }

  v13 = [MEMORY[0x263F3C0C0] getWithStreamId:v11];
  int v14 = (void *)[objc_alloc(MEMORY[0x263F3C0B8]) initWithJsonStr:v9 interactionId:v10 dataVersion:1];
  id v23 = 0;
  char v15 = [v13 insert:v14 error:&v23];
  id v16 = v23;
  if (v16)
  {
    v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v25 = "+[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:]";
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 2112;
      id v29 = v16;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s [WARN]: Error while inserting into FeatureStore for streamId=%@: %@", buf, 0x20u);
    }
  }
LABEL_22:

  return v15;
}

+ (BOOL)insertResponseToFeatureStoreAsJson:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315138;
    char v15 = "+[CDMFeatureStoreUtils insertResponseToFeatureStoreAsJson:]";
    _os_log_debug_impl(&dword_2263A0000, v6, OS_LOG_TYPE_DEBUG, "%s CDMFeatureStoreUtils insertResponseToFeatureStoreAsJson", (uint8_t *)&v14, 0xCu);
  }

  if (([a1 platformSupportedAndEnabled] & 1) == 0)
  {
    id v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v14 = 136315394;
      char v15 = "+[CDMFeatureStoreUtils insertResponseToFeatureStoreAsJson:]";
      __int16 v16 = 2112;
      v17 = v10;
      _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_12;
  }
  if (([a1 checkFeatureStoreEnabledForExternalBuilds:@"SiriNluResponseAsJson"] & 1) == 0)
  {
    id v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      char v15 = "+[CDMFeatureStoreUtils insertResponseToFeatureStoreAsJson:]";
      __int16 v16 = 2112;
      v17 = @"SiriNluResponseAsJson";
      _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_12:
    BOOL v11 = 0;
    goto LABEL_17;
  }
  if (v5 && ([v5 requestId], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    id v8 = [v5 requestId];
    id v9 = [v8 idA];
  }
  else
  {
    id v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      char v15 = "+[CDMFeatureStoreUtils insertResponseToFeatureStoreAsJson:]";
      _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s [WARN]: The response or requestId within the response is nil. Cannot extract interactionId!", (uint8_t *)&v14, 0xCu);
    }
    id v9 = 0;
  }

  v12 = +[CDMProtobufConverter serializeExternalNluResponseWithResponse:v5 formatType:@"json"];
  BOOL v11 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:v12 interactionId:v9 streamId:@"SiriNluResponseAsJson"];

LABEL_17:
  return v11;
}

+ (BOOL)insertRequestToFeatureStoreAsJson:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315138;
    char v15 = "+[CDMFeatureStoreUtils insertRequestToFeatureStoreAsJson:]";
    _os_log_debug_impl(&dword_2263A0000, v6, OS_LOG_TYPE_DEBUG, "%s CDMFeatureStoreUtils insertRequestToFeatureStoreAsJson", (uint8_t *)&v14, 0xCu);
  }

  if (([a1 platformSupportedAndEnabled] & 1) == 0)
  {
    id v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v14 = 136315394;
      char v15 = "+[CDMFeatureStoreUtils insertRequestToFeatureStoreAsJson:]";
      __int16 v16 = 2112;
      v17 = v10;
      _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_12;
  }
  if (([a1 checkFeatureStoreEnabledForExternalBuilds:@"SiriNluRequestAsJson"] & 1) == 0)
  {
    id v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      char v15 = "+[CDMFeatureStoreUtils insertRequestToFeatureStoreAsJson:]";
      __int16 v16 = 2112;
      v17 = @"SiriNluRequestAsJson";
      _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_12:
    BOOL v11 = 0;
    goto LABEL_17;
  }
  if (v5 && ([v5 requestId], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    id v8 = [v5 requestId];
    id v9 = [v8 idA];
  }
  else
  {
    id v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      char v15 = "+[CDMFeatureStoreUtils insertRequestToFeatureStoreAsJson:]";
      _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s [WARN]: The request or requestId within the request is nil. Cannot extract interactionId!", (uint8_t *)&v14, 0xCu);
    }
    id v9 = 0;
  }

  v12 = +[CDMProtobufConverter serializeExternalNluRequestWithRequest:v5 formatType:@"json"];
  BOOL v11 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:v12 interactionId:v9 streamId:@"SiriNluRequestAsJson"];

LABEL_17:
  return v11;
}

+ (BOOL)checkFeatureStoreEnabledForExternalBuilds:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[CDMPlatformUtils isInternalInstall])
  {
    char v5 = 1;
  }
  else if (+[CDMFeatureFlags isFeatureStoreEnabledForExternalBuilds])
  {
    v6 = [a1 allowedFSMessagesOnExternalBuilds];
    char v5 = [v6 containsObject:v4];
  }
  else
  {
    id v7 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315138;
      id v10 = "+[CDMFeatureStoreUtils checkFeatureStoreEnabledForExternalBuilds:]";
      _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s FeatureFlag SiriNL/SiriMiniFeatureStoreEnabledForExternalBuilds disabled, skip inserting into FeatureStore", (uint8_t *)&v9, 0xCu);
    }

    char v5 = 0;
  }

  return v5;
}

+ (BOOL)platformSupportedAndEnabled
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (!+[CDMFeatureFlags isFeatureStoreEnabled])
  {
    v3 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    int v5 = 136315138;
    v6 = "+[CDMFeatureStoreUtils platformSupportedAndEnabled]";
    id v4 = "%s FeatureFlag SiriNL/SiriMiniFeatureStoreEnabled disabled, skip inserting into FeatureStore";
LABEL_10:
    _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, v4, (uint8_t *)&v5, 0xCu);
    goto LABEL_7;
  }
  if ([MEMORY[0x263F3C0C8] isSupportedUser]) {
    return 1;
  }
  v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    v6 = "+[CDMFeatureStoreUtils platformSupportedAndEnabled]";
    id v4 = "%s Current user is not a FeatureStore-supported user, skip inserting into FeatureStore";
    goto LABEL_10;
  }
LABEL_7:

  return 0;
}

+ (id)allowedFSMessagesOnExternalBuilds
{
  if (allowedFSMessagesOnExternalBuilds_onceToken != -1) {
    dispatch_once(&allowedFSMessagesOnExternalBuilds_onceToken, &__block_literal_global_4300);
  }
  v2 = (void *)allowedFSMessagesOnExternalBuilds_allowedFSMessagesOnExternalBuilds;
  return v2;
}

uint64_t __57__CDMFeatureStoreUtils_allowedFSMessagesOnExternalBuilds__block_invoke()
{
  allowedFSMessagesOnExternalBuilds_allowedFSMessagesOnExternalBuilds = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"SiriNluRequestAsJson", @"SiriNluResponseAsJson", @"MDRequest", @"MDResponse", @"MRRequest", @"MRResponse", @"SpanMatchResponse", 0);
  return MEMORY[0x270F9A758]();
}

@end