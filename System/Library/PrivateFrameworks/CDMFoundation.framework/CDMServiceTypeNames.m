@interface CDMServiceTypeNames
+ (id)getNameStringToEnumDict;
+ (id)getServiceTypeNames;
@end

@implementation CDMServiceTypeNames

+ (id)getNameStringToEnumDict
{
  if (getNameStringToEnumDict_onceToken_7627 != -1) {
    dispatch_once(&getNameStringToEnumDict_onceToken_7627, &__block_literal_global_7628);
  }
  v2 = (void *)getNameStringToEnumDict_serviceTypeNameStringToEnum;
  return v2;
}

+ (id)getServiceTypeNames
{
  if (getServiceTypeNames_onceToken != -1) {
    dispatch_once(&getServiceTypeNames_onceToken, &__block_literal_global_67);
  }
  v2 = (void *)getServiceTypeNames_serviceTypeNames;
  return v2;
}

void __42__CDMServiceTypeNames_getServiceTypeNames__block_invoke()
{
  v2[22] = *MEMORY[0x263EF8340];
  v2[0] = @"CDMComposerService";
  v2[1] = @"CDMContextUpdateService";
  v2[2] = @"CDMTokenizerProtoService";
  v2[3] = @"CDMEmbeddingProtoService";
  v2[4] = @"CDMShortcutService";
  v2[5] = @"CDMSNLCProtoService";
  v2[6] = @"CDMCATIProtoService";
  v2[7] = @"CDMNLv4ProtoService";
  v2[8] = @"CDMOverridesProtoService";
  v2[9] = @"CDMRepetitionDetectionService";
  v2[10] = @"CDMUaaPNLProtoService";
  v2[11] = @"CDMPSCService";
  v2[12] = @"CDMCcqrAerCbRService";
  v2[13] = @"CDMMentionDetectorService";
  v2[14] = @"CDMMentionResolverService";
  v2[15] = @"CDMContextualSpanMatcherService";
  v2[16] = @"CDMLVCService";
  v2[17] = @"CDMSSUService";
  v2[18] = @"CDMDateTimeSpanMatchService";
  v2[19] = @"CDMRegexSpanMatchService";
  v2[20] = @"CDMSiriVocabularySpanMatchService";
  v2[21] = @"CDMVocSpanMatchService";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:22];
  v1 = (void *)getServiceTypeNames_serviceTypeNames;
  getServiceTypeNames_serviceTypeNames = v0;
}

void __46__CDMServiceTypeNames_getNameStringToEnumDict__block_invoke()
{
  v25[22] = *MEMORY[0x263EF8340];
  v24[0] = @"CDMComposerService";
  v23 = (void *)[objc_alloc(NSNumber) initWithInt:21];
  v25[0] = v23;
  v24[1] = @"CDMContextUpdateService";
  v22 = (void *)[objc_alloc(NSNumber) initWithInt:18];
  v25[1] = v22;
  v24[2] = @"CDMTokenizerProtoService";
  v21 = (void *)[objc_alloc(NSNumber) initWithInt:11];
  v25[2] = v21;
  v24[3] = @"CDMEmbeddingProtoService";
  v20 = (void *)[objc_alloc(NSNumber) initWithInt:4];
  v25[3] = v20;
  v24[4] = @"CDMShortcutService";
  v19 = (void *)[objc_alloc(NSNumber) initWithInt:14];
  v25[4] = v19;
  v24[5] = @"CDMSNLCProtoService";
  v18 = (void *)[objc_alloc(NSNumber) initWithInt:2];
  v25[5] = v18;
  v24[6] = @"CDMCATIProtoService";
  v17 = (void *)[objc_alloc(NSNumber) initWithInt:10];
  v25[6] = v17;
  v24[7] = @"CDMNLv4ProtoService";
  v16 = (void *)[objc_alloc(NSNumber) initWithInt:1];
  v25[7] = v16;
  v24[8] = @"CDMOverridesProtoService";
  v15 = (void *)[objc_alloc(NSNumber) initWithInt:13];
  v25[8] = v15;
  v24[9] = @"CDMRepetitionDetectionService";
  v14 = (void *)[objc_alloc(NSNumber) initWithInt:15];
  v25[9] = v14;
  v24[10] = @"CDMUaaPNLProtoService";
  v13 = (void *)[objc_alloc(NSNumber) initWithInt:8];
  v25[10] = v13;
  v24[11] = @"CDMPSCService";
  v12 = (void *)[objc_alloc(NSNumber) initWithInt:3];
  v25[11] = v12;
  v24[12] = @"CDMCcqrAerCbRService";
  uint64_t v0 = (void *)[objc_alloc(NSNumber) initWithInt:6];
  v25[12] = v0;
  v24[13] = @"CDMMentionDetectorService";
  v1 = (void *)[objc_alloc(NSNumber) initWithInt:16];
  v25[13] = v1;
  v24[14] = @"CDMMentionResolverService";
  v2 = (void *)[objc_alloc(NSNumber) initWithInt:17];
  v25[14] = v2;
  v24[15] = @"CDMContextualSpanMatcherService";
  v3 = (void *)[objc_alloc(NSNumber) initWithInt:19];
  v25[15] = v3;
  v24[16] = @"CDMLVCService";
  v4 = (void *)[objc_alloc(NSNumber) initWithInt:22];
  v25[16] = v4;
  v24[17] = @"CDMSSUService";
  v5 = (void *)[objc_alloc(NSNumber) initWithInt:23];
  v25[17] = v5;
  v24[18] = @"CDMDateTimeSpanMatchService";
  v6 = (void *)[objc_alloc(NSNumber) initWithInt:24];
  v25[18] = v6;
  v24[19] = @"CDMRegexSpanMatchService";
  v7 = (void *)[objc_alloc(NSNumber) initWithInt:25];
  v25[19] = v7;
  v24[20] = @"CDMSiriVocabularySpanMatchService";
  v8 = (void *)[objc_alloc(NSNumber) initWithInt:26];
  v25[20] = v8;
  v24[21] = @"CDMVocSpanMatchService";
  v9 = (void *)[objc_alloc(NSNumber) initWithInt:27];
  v25[21] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:22];
  v11 = (void *)getNameStringToEnumDict_serviceTypeNameStringToEnum;
  getNameStringToEnumDict_serviceTypeNameStringToEnum = v10;
}

@end