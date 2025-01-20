@interface SGDetectedAttributeMetrics
+ (id)instance;
+ (id)nameForDataDetectorMatch:(id)a3 withValue:(id)a4;
+ (id)tokenizeMessageContent:(id)a3;
+ (void)_recordExtractionEventFromSource:(SGMDocumentType_)a3 foundInSignature:(BOOL)a4 isDDSignature:(BOOL)a5 detailType:(SGMContactDetailType_)a6 outcome:(SGMContactDetailExtractionOutcome_)a7 foundInCNContact:(SGMContactDetailOwner_)a8 modelVersion:(id)a9 isUnlikelyPhone:(BOOL)a10 sigSource:(SGMContactDetailExtractionSignatureSource_)a11;
+ (void)_recordExtractionOutcome:(SGMContactDetailExtractionOutcome_)a3 detailType:(SGMContactDetailType_)a4 fromMessage:(id)a5 foundInSignature:(BOOL)a6 isDDSignature:(BOOL)a7 detailType:(unint64_t)a8 detailValue:(id)a9 modelVersion:(id)a10 isUnlikelyPhone:(BOOL)a11;
+ (void)recordBirthdayExtractionAccuracy:(unsigned __int8)a3 withOffset:(id)a4 withModelVersion:(id)a5 isFromCongratulation:(unsigned __int8)a6 didRegexTrigger:(unsigned __int8)a7 didResponseKitTrigger:(unsigned __int8)a8;
+ (void)recordExtractionOutcome:(SGMContactDetailExtractionOutcome_)a3 forDetectionsInMessage:(id)a4 signatureRange:(_NSRange)a5 isDDSignature:(BOOL)a6;
+ (void)recordExtractionOutcome:(SGMContactDetailExtractionOutcome_)a3 fromMessage:(id)a4 foundInSignature:(BOOL)a5 isDDSignature:(BOOL)a6 detection:(id)a7;
+ (void)recordExtractionOutcome:(SGMContactDetailExtractionOutcome_)a3 fromMessage:(id)a4 foundInSignature:(BOOL)a5 isDDSignature:(BOOL)a6 match:(id)a7 foundInCNContact:(SGMContactDetailOwner_)a8 modelVersion:(id)a9 isUnlikelyPhone:(BOOL)a10;
+ (void)recordExtractionOutcome:(SGMContactDetailExtractionOutcome_)a3 fromMessage:(id)a4 foundInSignature:(BOOL)a5 isDDSignature:(BOOL)a6 match:(id)a7 modelVersion:(id)a8 isUnlikelyPhone:(BOOL)a9;
+ (void)recordSelfIdModelScore:(BOOL)a3 model:(int)a4 supervision:(int)a5;
+ (void)recordSentContactDetailWithMessage:(id)a3 match:(id)a4 found:(SGMContactDetailFoundIn_)a5;
- (PETEventTracker2)pet2Tracker;
- (SGDetectedAttributeMetrics)initWithTracker:(id)a3;
- (void)setPet2Tracker:(id)a3;
@end

@implementation SGDetectedAttributeMetrics

- (void).cxx_destruct
{
}

- (void)setPet2Tracker:(id)a3
{
}

- (PETEventTracker2)pet2Tracker
{
  return self->_pet2Tracker;
}

- (SGDetectedAttributeMetrics)initWithTracker:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SGDetectedAttributeMetrics;
  v5 = [(SGDetectedAttributeMetrics *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SGDetectedAttributeMetrics *)v5 setPet2Tracker:v4];
  }

  return v6;
}

+ (void)recordSentContactDetailWithMessage:(id)a3 match:(id)a4 found:(SGMContactDetailFoundIn_)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 senderIsAccountOwner])
  {
    v10 = [v8 textContent];
    uint64_t v11 = [v9 valueRange];
    v13 = objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", v11, v12, @"DDMATCH");

    v14 = [a1 tokenizeMessageContent:v13];
    uint64_t v15 = [v14 count];
    v16 = (uint64_t *)MEMORY[0x1E4F5DE10];
    switch(v15)
    {
      case 0:
        goto LABEL_28;
      case 1:
        goto LABEL_6;
      case 2:
        v16 = (uint64_t *)MEMORY[0x1E4F5DE18];
        goto LABEL_6;
      case 3:
      case 4:
        v16 = (uint64_t *)MEMORY[0x1E4F5DE20];
        goto LABEL_6;
      default:
        v16 = (uint64_t *)MEMORY[0x1E4F5DE28];
LABEL_6:
        uint64_t v41 = *v16;
        uint64_t v17 = *MEMORY[0x1E4F5DE88];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v18 = v14;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (!v19) {
          goto LABEL_17;
        }
        uint64_t v20 = v19;
        id v38 = a1;
        uint64_t v39 = v17;
        v37 = v13;
        uint64_t v21 = *(void *)v43;
        break;
    }
LABEL_8:
    uint64_t v22 = 0;
    while (1)
    {
      if (*(void *)v43 != v21) {
        objc_enumerationMutation(v18);
      }
      v23 = *(void **)(*((void *)&v42 + 1) + 8 * v22);
      if ([v23 isEqualToString:@"DDMATCH"]) {
        goto LABEL_15;
      }
      if ((+[SGNames attributesForNameWord:v23] & 4) != 0) {
        break;
      }
      if (v20 == ++v22)
      {
        uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v20) {
          goto LABEL_8;
        }
LABEL_15:
        v13 = v37;
        a1 = v38;
        uint64_t v17 = v39;
        goto LABEL_17;
      }
    }
    uint64_t v17 = *MEMORY[0x1E4F5DE90];
    v13 = v37;
    a1 = v38;
LABEL_17:

    if (*MEMORY[0x1E4F5DCE8] == a5.var0)
    {
      v24 = (void *)MEMORY[0x1CB79B230]();
      v25 = [v9 valueString];
      v26 = v25;
      if (v25)
      {
        id v27 = v25;
      }
      else
      {
        [v8 textContent];
        v28 = uint64_t v40 = v17;
        uint64_t v29 = [v9 valueRange];
        objc_msgSend(v28, "substringWithRange:", v29, v30);
        id v27 = (id)objc_claimAutoreleasedReturnValue();

        uint64_t v17 = v40;
      }

      v31 = [a1 nameForDataDetectorMatch:v9 withValue:v27];
      if (v31) {
        a5.var0 = *MEMORY[0x1E4F5DD00];
      }
    }
    v32 = objc_opt_new();
    [v32 setSource:*MEMORY[0x1E4F5DDA8]];
    unsigned int v33 = [v9 matchType];
    if (v33 > 2) {
      v34 = (unsigned int *)MEMORY[0x1E4F5DD30];
    }
    else {
      v34 = (unsigned int *)qword_1E65B5BC0[v33];
    }
    [v32 setDetail:*v34];
    [v32 setFoundIn:a5.var0];
    [v32 setHasName:v17 != 0];
    [v32 setTokens:v41];
    v35 = [a1 instance];
    v36 = [v35 pet2Tracker];
    [v36 trackScalarForMessage:v32];

LABEL_28:
  }
}

+ (id)tokenizeMessageContent:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 length];
  uint64_t v6 = *MEMORY[0x1E4F28528];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__SGDetectedAttributeMetrics_tokenizeMessageContent___block_invoke;
  v12[3] = &unk_1E65B5B80;
  id v7 = v4;
  id v13 = v7;
  id v14 = v3;
  id v8 = v3;
  objc_msgSend(v8, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", 0, v5, v6, 6, 0, v12);
  id v9 = v14;
  id v10 = v7;

  return v10;
}

void __53__SGDetectedAttributeMetrics_tokenizeMessageContent___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v10 = a2;
  id v7 = *(void **)(a1 + 32);
  id v8 = (void *)MEMORY[0x1CB79B230]();
  id v9 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a3, a4);
  [v7 addObject:v9];
}

+ (id)nameForDataDetectorMatch:(id)a3 withValue:(id)a4
{
  id v5 = a4;
  int v6 = [a3 matchType];
  if (v6 == 2)
  {
    id v7 = SGNormalizeEmailAddress();
    uint64_t v8 = 1;
    goto LABEL_5;
  }
  if (!v6)
  {
    id v7 = SGNormalizePhoneNumber();
    uint64_t v8 = 0;
LABEL_5:
    id v9 = +[SGSqlEntityStore defaultHarvestStore];
    id v10 = [v9 kvCacheManager];
    uint64_t v11 = [v10 cacheOfType:v8];

    uint64_t v12 = [v11 valueForKey:v7];

    goto LABEL_7;
  }
  uint64_t v12 = 0;
LABEL_7:

  return v12;
}

+ (void)recordSelfIdModelScore:(BOOL)a3 model:(int)a4 supervision:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  BOOL v7 = a3;
  id v16 = (id)objc_opt_new();
  [v16 setModel:v6];
  [v16 setResult:v7];
  [v16 setSupervision:v5];
  id v9 = [a1 instance];
  id v10 = [v9 pet2Tracker];
  [v10 trackScalarForMessage:v16];

  id v11 = [NSString alloc];
  uint64_t v12 = *MEMORY[0x1E4F5DEE8];
  id v13 = [v16 key];
  id v14 = (void *)[v11 initWithFormat:@"%@.%@", v12, v13];

  uint64_t v15 = [v16 dictionaryRepresentation];
  AnalyticsSendEvent();
}

+ (void)recordBirthdayExtractionAccuracy:(unsigned __int8)a3 withOffset:(id)a4 withModelVersion:(id)a5 isFromCongratulation:(unsigned __int8)a6 didRegexTrigger:(unsigned __int8)a7 didResponseKitTrigger:(unsigned __int8)a8
{
  int v8 = a8;
  int v9 = a7;
  int v10 = a6;
  int v12 = a3;
  id v22 = a5;
  id v14 = a4;
  uint64_t v15 = objc_opt_new();
  [v15 setDateIsCorrect:v12 != 0];
  [v15 setIsFromCongratulation:v10 != 0];
  uint64_t v16 = [v15 StringAsOffset:v14];

  [v15 setOffset:v16];
  [v15 setDidRegexTrigger:v9 != 0];
  if (v22) {
    objc_msgSend(v15, "setModelVersion:", objc_msgSend(v22, "unsignedIntValue"));
  }
  [v15 setDidResponseKitTrigger:v8 != 0];
  uint64_t v17 = [a1 instance];
  id v18 = [v17 pet2Tracker];
  [v18 trackScalarForMessage:v15];

  id v19 = [NSString alloc];
  uint64_t v20 = (void *)[v19 initWithFormat:@"%@.%@", *MEMORY[0x1E4F5DEE8], @"birthdaySupervision"];
  uint64_t v21 = [v15 dictionaryRepresentation];
  AnalyticsSendEvent();
}

+ (void)recordExtractionOutcome:(SGMContactDetailExtractionOutcome_)a3 forDetectionsInMessage:(id)a4 signatureRange:(_NSRange)a5 isDDSignature:(BOOL)a6
{
  BOOL v22 = a6;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  [v8 plainTextDetectedData];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v20 = v26 = 0u;
  int v9 = [v20 reverseObjectEnumerator];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    int v12 = (void *)MEMORY[0x1E4F5DD30];
    uint64_t v13 = *(void *)v24;
    uint64_t v14 = *MEMORY[0x1E4F5DD30];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        unsigned int v17 = [v16 matchType];
        id v18 = v12;
        if (v17 <= 2) {
          id v18 = (void *)qword_1E65B5BC0[v17];
        }
        if (*v18 != v14)
        {
          v29.location = [v16 range];
          LOBYTE(v19) = 0;
          objc_msgSend(a1, "recordExtractionOutcome:fromMessage:foundInSignature:isDDSignature:match:modelVersion:isUnlikelyPhone:", a3.var0, v8, NSIntersectionRange(v29, a5).length != 0, v22, v16, &unk_1F25356E8, v19);
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }
}

+ (void)recordExtractionOutcome:(SGMContactDetailExtractionOutcome_)a3 fromMessage:(id)a4 foundInSignature:(BOOL)a5 isDDSignature:(BOOL)a6 match:(id)a7 foundInCNContact:(SGMContactDetailOwner_)a8 modelVersion:(id)a9 isUnlikelyPhone:(BOOL)a10
{
  BOOL v12 = a6;
  BOOL v13 = a5;
  id v24 = a9;
  id v17 = a7;
  uint64_t v18 = _sgmDocumentTypeOfMessage(a4);
  unsigned int v19 = [v17 matchType];

  if (v19 > 2) {
    uint64_t v20 = (uint64_t *)MEMORY[0x1E4F5DD30];
  }
  else {
    uint64_t v20 = (uint64_t *)qword_1E65B5BC0[v19];
  }
  uint64_t v21 = *v20;
  BOOL v22 = (void *)MEMORY[0x1E4F5DCD0];
  if (!v12) {
    BOOL v22 = (void *)MEMORY[0x1E4F5DCD8];
  }
  if (!v13) {
    BOOL v22 = (void *)MEMORY[0x1E4F5DCE0];
  }
  LOBYTE(v23) = a10;
  [a1 _recordExtractionEventFromSource:v18 foundInSignature:v13 isDDSignature:v12 detailType:v21 outcome:a3.var0 foundInCNContact:a8.var0 modelVersion:v24 isUnlikelyPhone:v23 sigSource:*v22];
}

+ (void)recordExtractionOutcome:(SGMContactDetailExtractionOutcome_)a3 fromMessage:(id)a4 foundInSignature:(BOOL)a5 isDDSignature:(BOOL)a6 match:(id)a7 modelVersion:(id)a8 isUnlikelyPhone:(BOOL)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v34 = a4;
  id v15 = a7;
  id v16 = a8;
  id v17 = [v15 valueString];
  if (v17)
  {
    uint64_t v18 = [v15 valueString];
  }
  else
  {
    id v33 = a1;
    unint64_t var0 = a3.var0;
    BOOL v20 = v12;
    BOOL v21 = v11;
    uint64_t v22 = MEMORY[0x1CB79B230]();
    uint64_t v23 = [v34 textContent];
    uint64_t v24 = [v15 valueRange];
    uint64_t v18 = objc_msgSend(v23, "substringWithRange:", v24, v25);

    long long v26 = (void *)v22;
    BOOL v11 = v21;
    BOOL v12 = v20;
    a3.unint64_t var0 = var0;
    a1 = v33;
  }

  unsigned int v27 = [v15 matchType];
  if (v27 > 2) {
    uint64_t v28 = (uint64_t *)MEMORY[0x1E4F5DD30];
  }
  else {
    uint64_t v28 = (uint64_t *)qword_1E65B5BC0[v27];
  }
  uint64_t v29 = *v28;
  unsigned int v30 = [v15 matchType];
  if (v30 >= 3) {
    uint64_t v31 = -1;
  }
  else {
    uint64_t v31 = v30;
  }
  LOBYTE(v32) = a9;
  [a1 _recordExtractionOutcome:a3.var0 detailType:v29 fromMessage:v34 foundInSignature:v12 isDDSignature:v11 detailType:v31 detailValue:v18 modelVersion:v16 isUnlikelyPhone:v32];
}

+ (void)recordExtractionOutcome:(SGMContactDetailExtractionOutcome_)a3 fromMessage:(id)a4 foundInSignature:(BOOL)a5 isDDSignature:(BOOL)a6 detection:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  id v22 = a7;
  id v12 = a4;
  unsigned int v13 = [v22 type];
  if (v13 > 3) {
    uint64_t v14 = (uint64_t *)MEMORY[0x1E4F5DD30];
  }
  else {
    uint64_t v14 = (uint64_t *)qword_1E65B5BA0[v13];
  }
  uint64_t v15 = *v14;
  unsigned int v16 = [v22 type];
  if (v16 > 3) {
    uint64_t v17 = -1;
  }
  else {
    uint64_t v17 = qword_1CA8CB5A0[v16];
  }
  uint64_t v18 = [v22 extraction];
  unsigned int v19 = [v22 extractionInfo];
  BOOL v20 = [v19 modelVersion];
  LOBYTE(v21) = [v22 isUnlikelyPhone];
  [a1 _recordExtractionOutcome:a3.var0 detailType:v15 fromMessage:v12 foundInSignature:v8 isDDSignature:v7 detailType:v17 detailValue:v18 modelVersion:v20 isUnlikelyPhone:v21];
}

+ (void)_recordExtractionOutcome:(SGMContactDetailExtractionOutcome_)a3 detailType:(SGMContactDetailType_)a4 fromMessage:(id)a5 foundInSignature:(BOOL)a6 isDDSignature:(BOOL)a7 detailType:(unint64_t)a8 detailValue:(id)a9 modelVersion:(id)a10 isUnlikelyPhone:(BOOL)a11
{
  BOOL v12 = a7;
  BOOL v13 = a6;
  id v40 = a5;
  id v16 = a9;
  id v17 = a10;
  if (![v16 length]) {
    goto LABEL_17;
  }
  unint64_t var0 = a4.var0;
  unint64_t v38 = a3.var0;
  uint64_t v18 = *MEMORY[0x1E4F5DD08];
  unsigned int v19 = [v40 author];
  BOOL v20 = [v19 displayName];
  if (v20)
  {
  }
  else
  {
    uint64_t v21 = [v40 author];
    id v22 = [v21 handles];
    uint64_t v23 = [v22 count];

    if (!v23)
    {
      uint64_t v25 = 0;
      goto LABEL_11;
    }
  }
  uint64_t v24 = +[SGContactPipelineHelper findContactsForDetailType:a8 andValue:v16];
  uint64_t v25 = v24;
  if (v24 && [v24 count])
  {
    long long v26 = [v40 author];
    unsigned int v27 = [v26 displayName];
    uint64_t v28 = [v40 author];
    uint64_t v29 = [v28 handles];
    unsigned int v30 = [v29 firstObject];
    BOOL v36 = +[SGContactPipelineHelper personExistsInContacts:v25 name:v27 handle:v30];

    uint64_t v31 = v40;
    uint64_t v32 = (uint64_t *)MEMORY[0x1E4F5DD18];
    if (!v36) {
      uint64_t v32 = (uint64_t *)MEMORY[0x1E4F5DD10];
    }
    uint64_t v18 = *v32;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v31 = v40;
LABEL_12:
  uint64_t v33 = _sgmDocumentTypeOfMessage(v31);
  id v34 = (void *)MEMORY[0x1E4F5DCD0];
  if (!v12) {
    id v34 = (void *)MEMORY[0x1E4F5DCD8];
  }
  if (!v13) {
    id v34 = (void *)MEMORY[0x1E4F5DCE0];
  }
  LOBYTE(v35) = a11;
  [a1 _recordExtractionEventFromSource:v33 foundInSignature:v13 isDDSignature:v12 detailType:var0 outcome:v38 foundInCNContact:v18 modelVersion:v17 isUnlikelyPhone:v35 sigSource:*v34];

LABEL_17:
}

+ (void)_recordExtractionEventFromSource:(SGMDocumentType_)a3 foundInSignature:(BOOL)a4 isDDSignature:(BOOL)a5 detailType:(SGMContactDetailType_)a6 outcome:(SGMContactDetailExtractionOutcome_)a7 foundInCNContact:(SGMContactDetailOwner_)a8 modelVersion:(id)a9 isUnlikelyPhone:(BOOL)a10 sigSource:(SGMContactDetailExtractionSignatureSource_)a11
{
  BOOL v14 = a4;
  id v17 = a9;
  id v26 = (id)objc_opt_new();
  [v26 setSource:a3.var0];
  [v26 setSignature:v14];
  [v26 setDetail:a6.var0];
  [v26 setOutcome:a7.var0];
  [v26 setFoundInSenderCNContact:a8.var0];
  uint64_t v18 = [v17 unsignedShortValue];

  [v26 setExtractionModelVersion:v18];
  [v26 setIsUnlikelyPhone:a10];
  [v26 setExtractionSignatureSource:LODWORD(a11.var0)];
  unsigned int v19 = [a1 instance];
  BOOL v20 = [v19 pet2Tracker];
  [v20 trackScalarForMessage:v26];

  id v21 = [NSString alloc];
  uint64_t v22 = *MEMORY[0x1E4F5DEE8];
  uint64_t v23 = [v26 key];
  uint64_t v24 = (void *)[v21 initWithFormat:@"%@.%@", v22, v23];

  uint64_t v25 = [v26 dictionaryRepresentation];
  AnalyticsSendEvent();
}

+ (id)instance
{
  if (instance_onceToken != -1) {
    dispatch_once(&instance_onceToken, &__block_literal_global_3550);
  }
  v2 = (void *)instance__instance;
  return v2;
}

void __38__SGDetectedAttributeMetrics_instance__block_invoke()
{
  v0 = [SGDetectedAttributeMetrics alloc];
  id v3 = [MEMORY[0x1E4F93728] sharedInstance];
  uint64_t v1 = [(SGDetectedAttributeMetrics *)v0 initWithTracker:v3];
  v2 = (void *)instance__instance;
  instance__instance = v1;
}

@end