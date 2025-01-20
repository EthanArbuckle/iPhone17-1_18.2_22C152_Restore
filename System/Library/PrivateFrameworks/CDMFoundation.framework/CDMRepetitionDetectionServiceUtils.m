@interface CDMRepetitionDetectionServiceUtils
+ (id)asrHypothesis2QRUtterance:(id)a3;
+ (id)asrToken2QRToken:(id)a3;
+ (id)buildRDRequestWithPrevTurn:(id)a3 curTurn:(id)a4 nluRequestId:(id)a5 resultCandidateId:(id)a6 cdmRequestId:(id)a7;
@end

@implementation CDMRepetitionDetectionServiceUtils

+ (id)asrHypothesis2QRUtterance:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263EFF980]);
  v5 = [v3 asrTokens];
  v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v7 = objc_msgSend(v3, "asrTokens", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = +[CDMRepetitionDetectionServiceUtils asrToken2QRToken:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  id v13 = objc_alloc_init(MEMORY[0x263F71ED0]);
  id v14 = objc_alloc_init(MEMORY[0x263F71D78]);
  [v13 setAsrId:v14];

  v15 = [v3 utterance];
  [v13 setUtterance:v15];

  v16 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  [v13 setNluInternalTokens:v16];

  v17 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v6];
  [v13 setAsrUtteranceTokens:v17];

  [v3 probability];
  objc_msgSend(v13, "setConfidence:");

  return v13;
}

+ (id)asrToken2QRToken:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F71EC8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v4 postItnText];
  [v5 setValue:v6];

  objc_msgSend(v5, "setStartIndex:", objc_msgSend(v4, "beginIndex"));
  objc_msgSend(v5, "setEndIndex:", objc_msgSend(v4, "endIndex"));
  [v4 confidenceScore];
  objc_msgSend(v5, "setAsrConfidence:");
  v7 = [v4 phoneSequence];
  [v5 setPhoneSequence:v7];

  uint64_t v8 = [v4 removeSpaceAfter];
  [v5 setRemoveSpaceAfter:v8];
  return v5;
}

+ (id)buildRDRequestWithPrevTurn:(id)a3 curTurn:(id)a4 nluRequestId:(id)a5 resultCandidateId:(id)a6 cdmRequestId:(id)a7
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v47 = "+[CDMRepetitionDetectionServiceUtils buildRDRequestWithPrevTurn:curTurn:nluRequestId:resultCandidateId:cdmRequestId:]";
    _os_log_debug_impl(&dword_2263A0000, v16, OS_LOG_TYPE_DEBUG, "%s Preparing Repetition Detection Reqeust", buf, 0xCu);
  }

  if (!v11)
  {
LABEL_12:
    long long v21 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "+[CDMRepetitionDetectionServiceUtils buildRDRequestWithPrevTurn:curTurn:nluRequestId:resultCandidateId:cdmRequestId:]";
      long long v22 = "%s Invalid Inputs for Repetition Detection";
      goto LABEL_19;
    }
LABEL_13:
    id v23 = 0;
    goto LABEL_14;
  }
  v17 = [v11 asrOutputs];
  uint64_t v18 = [v17 count];
  if (!v12 || !v18)
  {

    goto LABEL_12;
  }
  long long v19 = [v12 asrOutputs];
  uint64_t v20 = [v19 count];

  if (!v20) {
    goto LABEL_12;
  }
  if (([v12 tapToEdit] & 1) != 0 || objc_msgSend(v11, "tapToEdit"))
  {
    long long v21 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "+[CDMRepetitionDetectionServiceUtils buildRDRequestWithPrevTurn:curTurn:nluRequestId:resultCandidateId:cdmRequestId:]";
      long long v22 = "%s Current Turn or Previous Turn is Tap2Edit, skipping RD call";
LABEL_19:
      _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, v22, buf, 0xCu);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  v25 = [v11 asrOutputs];
  v26 = [v25 firstObject];
  long long v21 = +[CDMRepetitionDetectionServiceUtils asrHypothesis2QRUtterance:v26];

  id v27 = objc_alloc_init(MEMORY[0x263F71EC0]);
  v45 = v21;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
  v29 = (void *)[v28 copy];
  [v27 setOriginalUtterances:v29];

  v30 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  [v27 setSiriResponses:v30];

  v31 = [v11 locale];
  [v27 setLocale:v31];

  objc_msgSend(v27, "setTap2edit:", objc_msgSend(v11, "tapToEdit"));
  v41 = v27;
  objc_msgSend(v27, "setStartTimestamp:", objc_msgSend(v11, "startTimestamp"));
  v32 = [v12 asrOutputs];
  v33 = [v32 firstObject];
  v42 = +[CDMRepetitionDetectionServiceUtils asrHypothesis2QRUtterance:v33];

  id v34 = objc_alloc_init(MEMORY[0x263F71EC0]);
  v44 = v42;
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
  v36 = (void *)[v35 copy];
  [v34 setOriginalUtterances:v36];

  v37 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  [v34 setSiriResponses:v37];

  v38 = [v12 locale];
  [v34 setLocale:v38];

  objc_msgSend(v34, "setTap2edit:", objc_msgSend(v12, "tapToEdit"));
  objc_msgSend(v34, "setStartTimestamp:", objc_msgSend(v12, "startTimestamp"));
  id v23 = objc_alloc_init(MEMORY[0x263F71EA8]);
  [v23 setResultCandidateId:v14];
  [v23 setNluRequestId:v13];
  v43[0] = v27;
  v43[1] = v34;
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
  v40 = (void *)[v39 mutableCopy];
  [v23 setOriginalInteractions:v40];

  [v23 setCdmRequestId:v15];
LABEL_14:

  return v23;
}

@end