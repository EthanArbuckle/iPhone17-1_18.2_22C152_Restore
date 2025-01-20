@interface CDMServiceNodeNames
+ (id)getNameStringToEnumDict;
@end

@implementation CDMServiceNodeNames

+ (id)getNameStringToEnumDict
{
  if (getNameStringToEnumDict_onceToken != -1) {
    dispatch_once(&getNameStringToEnumDict_onceToken, &__block_literal_global_5574);
  }
  v2 = (void *)getNameStringToEnumDict_serviceNodeNameStringToEnum;
  return v2;
}

void __46__CDMServiceNodeNames_getNameStringToEnumDict__block_invoke()
{
  v31[28] = *MEMORY[0x263EF8340];
  v30[0] = @"doContextUpdate";
  v29 = (void *)[objc_alloc(NSNumber) initWithInt:3];
  v31[0] = v29;
  v30[1] = @"doCurrentTokenize";
  v28 = (void *)[objc_alloc(NSNumber) initWithInt:1];
  v31[1] = v28;
  v30[2] = @"doPreviousTurnsTokenize";
  v27 = (void *)[objc_alloc(NSNumber) initWithInt:2];
  v31[2] = v27;
  v30[3] = @"doEmbedding";
  v26 = (void *)[objc_alloc(NSNumber) initWithInt:4];
  v31[3] = v26;
  v30[4] = @"doSpanization";
  v25 = (void *)[objc_alloc(NSNumber) initWithInt:5];
  v31[4] = v25;
  v30[5] = @"doSpanizationDateTime";
  v24 = (void *)[objc_alloc(NSNumber) initWithInt:28];
  v31[5] = v24;
  v30[6] = @"doSpanizationRegex";
  v23 = (void *)[objc_alloc(NSNumber) initWithInt:29];
  v31[6] = v23;
  v30[7] = @"doSpanizationSiriVocabulary";
  v22 = (void *)[objc_alloc(NSNumber) initWithInt:30];
  v31[7] = v22;
  v30[8] = @"doSpanizationVoc";
  v21 = (void *)[objc_alloc(NSNumber) initWithInt:31];
  v31[8] = v21;
  v30[9] = @"doShortcutParse";
  v20 = (void *)[objc_alloc(NSNumber) initWithInt:6];
  v31[9] = v20;
  v30[10] = @"doSNLCInference";
  v19 = (void *)[objc_alloc(NSNumber) initWithInt:7];
  v31[10] = v19;
  v30[11] = @"doCATIInference";
  v18 = (void *)[objc_alloc(NSNumber) initWithInt:9];
  v31[11] = v18;
  v30[12] = @"doNLv4Inference";
  v17 = (void *)[objc_alloc(NSNumber) initWithInt:10];
  v31[12] = v17;
  v30[13] = @"doOverridesProto";
  v16 = (void *)[objc_alloc(NSNumber) initWithInt:11];
  v31[13] = v16;
  v30[14] = @"doRepetitionDetection";
  v15 = (void *)[objc_alloc(NSNumber) initWithInt:12];
  v31[14] = v15;
  v30[15] = @"doPostProcess";
  v14 = (void *)[objc_alloc(NSNumber) initWithInt:13];
  v31[15] = v14;
  v30[16] = @"endNode";
  v13 = (void *)[objc_alloc(NSNumber) initWithInt:14];
  v31[16] = v13;
  v30[17] = @"doCorrectedUtteranceTokenize";
  v12 = (void *)[objc_alloc(NSNumber) initWithInt:15];
  v31[17] = v12;
  v30[18] = @"doUaaPNLInference";
  v0 = (void *)[objc_alloc(NSNumber) initWithInt:17];
  v31[18] = v0;
  v30[19] = @"doPSCInference";
  v1 = (void *)[objc_alloc(NSNumber) initWithInt:18];
  v31[19] = v1;
  v30[20] = @"doLVCInference";
  v2 = (void *)[objc_alloc(NSNumber) initWithInt:26];
  v31[20] = v2;
  v30[21] = @"doCcqrAerCbRInference";
  v3 = (void *)[objc_alloc(NSNumber) initWithInt:20];
  v31[21] = v3;
  v30[22] = @"doMentionDetection";
  v4 = (void *)[objc_alloc(NSNumber) initWithInt:21];
  v31[22] = v4;
  v30[23] = @"doMentionResolving";
  v5 = (void *)[objc_alloc(NSNumber) initWithInt:22];
  v31[23] = v5;
  v30[24] = @"doSpanMerging";
  v6 = (void *)[objc_alloc(NSNumber) initWithInt:23];
  v31[24] = v6;
  v30[25] = @"doContextualSpanMatching";
  v7 = (void *)[objc_alloc(NSNumber) initWithInt:24];
  v31[25] = v7;
  v30[26] = @"doSSUMatching";
  v8 = (void *)[objc_alloc(NSNumber) initWithInt:27];
  v31[26] = v8;
  v30[27] = @"doNLv4SNLCMerging";
  v9 = (void *)[objc_alloc(NSNumber) initWithInt:32];
  v31[27] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:28];
  v11 = (void *)getNameStringToEnumDict_serviceNodeNameStringToEnum;
  getNameStringToEnumDict_serviceNodeNameStringToEnum = v10;
}

@end