@interface MRRMultimodalMentionDetector
+ (id)name;
+ (id)sharedManager;
- (BOOL)detectMentionsInUtterance:(id)a3 maximumCandidates:(unint64_t)a4 status:(id *)a5 completionBlock:(id)a6;
- (BOOL)detectMentionsInUtterance:(id)a3 status:(id *)a4 completionBlock:(id)a5;
- (BOOL)detectMentionsInUtterance:(id)a3 utteranceTokens:(id)a4 tokenEmbeddings:(id)a5 maximumCandidates:(unint64_t)a6 status:(id *)a7 completionBlock:(id)a8;
- (MRRMultimodalMentionDetector)initWithAssets:(id)a3 forLocale:(id)a4 status:(id *)a5;
- (id).cxx_construct;
- (id)detectMentionsInUtterance:(id)a3 maximumCandidates:(unint64_t)a4 status:(id *)a5;
- (id)detectMentionsInUtterance:(id)a3 status:(id *)a4;
- (id)detectMentionsInUtterance:(id)a3 utteranceTokens:(id)a4 tokenEmbeddings:(id)a5 maximumCandidates:(unint64_t)a6 status:(id *)a7;
- (id)detectMentionsInUtteranceImpl:(id)a3 status:(id *)a4;
- (id)detectMentionsInUtteranceRequest:(id)a3 status:(id *)a4;
@end

@implementation MRRMultimodalMentionDetector

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  value = self->_mentionDetector.__ptr_.__value_;
  self->_mentionDetector.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(MRRMentionDetectorInterface *))(*(void *)value + 16))(value);
  }
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (BOOL)detectMentionsInUtterance:(id)a3 utteranceTokens:(id)a4 tokenEmbeddings:(id)a5 maximumCandidates:(unint64_t)a6 status:(id *)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v18 = objc_opt_new();
  [v18 setUtterance:v14];
  [v18 setRequestId:0];
  [v18 setNluRequestId:0];
  [v18 setResultCandidateId:0];
  v19 = objc_opt_new();
  [v18 setTokenChain:v19];

  locale = self->_locale;
  v21 = [v18 tokenChain];
  [v21 setLocale:locale];

  v22 = [v18 tokenChain];
  [v22 setStringValue:v14];

  v23 = [MEMORY[0x1E4F1CA48] arrayWithArray:v15];
  v24 = [v18 tokenChain];
  [v24 setTokens:v23];

  [v18 setEmbeddingTensor:v16];
  [v18 setMaxCandidates:a6];
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy_;
  v46[4] = __Block_byref_object_dispose_;
  id v47 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy_;
  v40 = __Block_byref_object_dispose_;
  id v41 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __131__MRRMultimodalMentionDetector_detectMentionsInUtterance_utteranceTokens_tokenEmbeddings_maximumCandidates_status_completionBlock___block_invoke;
  block[3] = &unk_1E6599C68;
  v33 = v46;
  block[4] = self;
  id v26 = v18;
  id v31 = v26;
  v34 = &v36;
  v35 = &v42;
  id v27 = v17;
  id v32 = v27;
  dispatch_async(dispatchQueue, block);
  if (a7) {
    *a7 = (id) v37[5];
  }
  char v28 = *((unsigned char *)v43 + 24);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(v46, 8);

  return v28;
}

void __131__MRRMultimodalMentionDetector_detectMentionsInUtterance_utteranceTokens_tokenEmbeddings_maximumCandidates_status_completionBlock___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 detectMentionsInUtteranceImpl:v3 status:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(a1[8] + 8) + 40))
  {
    v8 = 0;
    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
  }
  else
  {
    v9 = *(void **)(*(void *)(a1[7] + 8) + 40);
    if (v9)
    {
      v8 = [v9 mentions];
    }
    else
    {
      v8 = 0;
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (BOOL)detectMentionsInUtterance:(id)a3 maximumCandidates:(unint64_t)a4 status:(id *)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  uint64_t v38 = __Block_byref_object_dispose_;
  id v39 = (id)objc_opt_new();
  [(id)v35[5] setUtterance:v10];
  [(id)v35[5] setRequestId:0];
  [(id)v35[5] setNluRequestId:0];
  [(id)v35[5] setResultCandidateId:0];
  [(id)v35[5] setTokenChain:0];
  [(id)v35[5] setEmbeddingTensor:0];
  [(id)v35[5] setMaxCandidates:a4];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy_;
  v32[4] = __Block_byref_object_dispose_;
  id v33 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  dispatchQueue = self->_dispatchQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __99__MRRMultimodalMentionDetector_detectMentionsInUtterance_maximumCandidates_status_completionBlock___block_invoke;
  v16[3] = &unk_1E6599C90;
  v18 = v32;
  v16[4] = self;
  v19 = &v34;
  v20 = &v22;
  v21 = &v28;
  id v13 = v11;
  id v17 = v13;
  dispatch_async(dispatchQueue, v16);
  if (a5) {
    *a5 = (id) v23[5];
  }
  char v14 = *((unsigned char *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(&v34, 8);
  return v14;
}

void __99__MRRMultimodalMentionDetector_detectMentionsInUtterance_maximumCandidates_status_completionBlock___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(*(void *)(a1[7] + 8) + 40);
  uint64_t v4 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 detectMentionsInUtteranceImpl:v3 status:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(a1[8] + 8) + 40))
  {
    v8 = 0;
    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
  }
  else
  {
    v9 = *(void **)(*(void *)(a1[6] + 8) + 40);
    if (v9)
    {
      v8 = [v9 mentions];
    }
    else
    {
      v8 = 0;
    }
  }
  (*(void (**)(void))(a1[5] + 16))();
}

- (id)detectMentionsInUtterance:(id)a3 utteranceTokens:(id)a4 tokenEmbeddings:(id)a5 maximumCandidates:(unint64_t)a6 status:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = objc_opt_new();
  [v15 setUtterance:v12];
  [v15 setRequestId:0];
  [v15 setNluRequestId:0];
  [v15 setResultCandidateId:0];
  id v16 = objc_opt_new();
  [v15 setTokenChain:v16];

  locale = self->_locale;
  v18 = [v15 tokenChain];
  [v18 setLocale:locale];

  v19 = [v15 tokenChain];
  [v19 setStringValue:v12];

  v20 = [MEMORY[0x1E4F1CA48] arrayWithArray:v13];
  v21 = [v15 tokenChain];
  [v21 setTokens:v20];

  [v15 setEmbeddingTensor:v14];
  [v15 setMaxCandidates:a6];
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy_;
  id v39 = __Block_byref_object_dispose_;
  id v40 = 0;
  dispatchQueue = self->_dispatchQueue;
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = __115__MRRMultimodalMentionDetector_detectMentionsInUtterance_utteranceTokens_tokenEmbeddings_maximumCandidates_status___block_invoke;
  uint64_t v30 = &unk_1E6599C40;
  id v33 = &v35;
  char v31 = self;
  id v23 = v15;
  id v32 = v23;
  uint64_t v34 = a7;
  dispatch_sync(dispatchQueue, &v27);
  uint64_t v24 = (void *)v36[5];
  if (v24)
  {
    v25 = objc_msgSend(v24, "mentions", v27, v28, v29, v30, v31);
  }
  else
  {
    v25 = 0;
  }

  _Block_object_dispose(&v35, 8);
  return v25;
}

uint64_t __115__MRRMultimodalMentionDetector_detectMentionsInUtterance_utteranceTokens_tokenEmbeddings_maximumCandidates_status___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) detectMentionsInUtteranceImpl:*(void *)(a1 + 40) status:*(void *)(a1 + 56)];
  return MEMORY[0x1F41817F8]();
}

- (id)detectMentionsInUtterance:(id)a3 maximumCandidates:(unint64_t)a4 status:(id *)a5
{
  id v8 = a3;
  v9 = objc_opt_new();
  [v9 setUtterance:v8];
  [v9 setRequestId:0];
  [v9 setNluRequestId:0];
  [v9 setResultCandidateId:0];
  [v9 setTokenChain:0];
  [v9 setEmbeddingTensor:0];
  [v9 setMaxCandidates:a4];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy_;
  uint64_t v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  dispatchQueue = self->_dispatchQueue;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __83__MRRMultimodalMentionDetector_detectMentionsInUtterance_maximumCandidates_status___block_invoke;
  v18 = &unk_1E6599C40;
  v21 = &v23;
  v19 = self;
  id v11 = v9;
  id v20 = v11;
  uint64_t v22 = a5;
  dispatch_sync(dispatchQueue, &v15);
  id v12 = (void *)v24[5];
  if (v12)
  {
    id v13 = objc_msgSend(v12, "mentions", v15, v16, v17, v18, v19);
  }
  else
  {
    id v13 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v13;
}

uint64_t __83__MRRMultimodalMentionDetector_detectMentionsInUtterance_maximumCandidates_status___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) detectMentionsInUtteranceImpl:*(void *)(a1 + 40) status:*(void *)(a1 + 56)];
  return MEMORY[0x1F41817F8]();
}

- (BOOL)detectMentionsInUtterance:(id)a3 status:(id *)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy_;
  v31[4] = __Block_byref_object_dispose_;
  id v32 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy_;
  uint64_t v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__MRRMultimodalMentionDetector_detectMentionsInUtterance_status_completionBlock___block_invoke;
  v15[3] = &unk_1E6599C68;
  v18 = v31;
  v15[4] = self;
  id v11 = v8;
  id v16 = v11;
  v19 = &v21;
  id v20 = &v27;
  id v12 = v9;
  id v17 = v12;
  dispatch_async(dispatchQueue, v15);
  if (a4) {
    *a4 = (id) v22[5];
  }
  char v13 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(v31, 8);

  return v13;
}

uint64_t __81__MRRMultimodalMentionDetector_detectMentionsInUtterance_status_completionBlock___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 detectMentionsInUtteranceImpl:v3 status:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(a1[8] + 8) + 40)) {
    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (id)detectMentionsInUtteranceRequest:(id)a3 status:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__MRRMultimodalMentionDetector_detectMentionsInUtteranceRequest_status___block_invoke;
  v11[3] = &unk_1E6599C40;
  v11[4] = self;
  id v12 = v6;
  char v13 = &v15;
  id v14 = a4;
  id v8 = v6;
  dispatch_sync(dispatchQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __72__MRRMultimodalMentionDetector_detectMentionsInUtteranceRequest_status___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) detectMentionsInUtteranceImpl:*(void *)(a1 + 40) status:*(void *)(a1 + 56)];
  return MEMORY[0x1F41817F8]();
}

- (id)detectMentionsInUtterance:(id)a3 status:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__MRRMultimodalMentionDetector_detectMentionsInUtterance_status___block_invoke;
  v11[3] = &unk_1E6599C40;
  v11[4] = self;
  id v12 = v6;
  char v13 = &v15;
  id v14 = a4;
  id v8 = v6;
  dispatch_sync(dispatchQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __65__MRRMultimodalMentionDetector_detectMentionsInUtterance_status___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) detectMentionsInUtteranceImpl:*(void *)(a1 + 40) status:*(void *)(a1 + 56)];
  return MEMORY[0x1F41817F8]();
}

- (id)detectMentionsInUtteranceImpl:(id)a3 status:(id *)a4
{
  id v5 = a3;
  id v6 = MRRLoggerForCategory(3);
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = MRRLoggerForCategory(3);
  id v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9555000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "MDExecuteRequest", "", buf, 2u);
  }

  id v10 = MRRLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9555000, v10, OS_LOG_TYPE_INFO, "BEGIN \"MDExecuteRequest\"", buf, 2u);
  }

  id v11 = [v5 requestId];

  if (!v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4FA29C8]);
    [v5 setRequestId:v12];
  }
  char v13 = [v5 nluRequestId];

  if (!v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4FA29C8]);
    [v5 setNluRequestId:v14];
  }
  uint64_t v15 = [v5 resultCandidateId];

  if (!v15) {
    [v5 setResultCandidateId:&stru_1F23C7F28];
  }
  id v16 = [v5 tokenChain];
  if (v16)
  {
    uint64_t v17 = [v5 tokenChain];
    [v17 tokens];
  }
  [v5 embeddingTensor];

  if (![v5 maxCandidates]) {
    [v5 setMaxCandidates:0x7FFFFFFFLL];
  }
  if (!self->_locale)
  {
    v18 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    v19 = [v18 objectAtIndex:0];
    locale = self->_locale;
    self->_locale = v19;
  }
  +[ConverterUtils convertMentionDetectorRequestFromObjCToCpp:v5];
  value = self->_mentionDetector.__ptr_.__value_;
  if (value)
  {
    (**(void (***)(uint8_t *__return_ptr, MRRMentionDetectorInterface *, uint64_t))value)(buf, self->_mentionDetector.__ptr_.__value_, v31);
    operator new();
  }
  uint64_t v22 = +[MRRMultimodalMentionDetector name];
  *a4 = +[PredictorUtils getPredictStatusWithPredictorName:v22 domain:@"com.apple.siri.marrs.rr" code:137];

  uint64_t v23 = MRRLoggerForCategory(1);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9555000, v23, OS_LOG_TYPE_DEBUG, "Mention detector not loaded succesfully, likely issue related to asset. Skipped emitting MentionDetectorEvaluated events", buf, 2u);
  }

  uint64_t v24 = MRRLoggerForCategory(3);
  uint64_t v25 = v24;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9555000, v25, OS_SIGNPOST_INTERVAL_END, v7, "MDExecuteRequest", " enableTelemetry=YES ", buf, 2u);
  }

  id v26 = MRRLoggerForCategory(0);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9555000, v26, OS_LOG_TYPE_INFO, "END \"MDExecuteRequest\"", buf, 2u);
  }

  uint64_t v27 = v31;
  uint64_t v31 = 0;
  if (v27) {
    (*(void (**)(uint64_t))(*(void *)v27 + 8))(v27);
  }

  return 0;
}

- (MRRMultimodalMentionDetector)initWithAssets:(id)a3 forLocale:(id)a4 status:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v32 = a4;
  id v6 = MRRLoggerForCategory(3);
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = MRRLoggerForCategory(3);
  id v9 = v8;
  os_signpost_id_t spid = v7;
  unint64_t v29 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9555000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "MDInitialization", "", (uint8_t *)&buf, 2u);
  }

  id v10 = MRRLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1C9555000, v10, OS_LOG_TYPE_INFO, "BEGIN \"MDInitialization\"", (uint8_t *)&buf, 2u);
  }

  id v11 = MRRLoggerForCategory(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int buf = 138412546;
    *(void *)buf_4 = v31;
    __int16 v38 = 2112;
    id v39 = v32;
    _os_log_impl(&dword_1C9555000, v11, OS_LOG_TYPE_INFO, "initializing MD with asset path - %@, locale - %@", (uint8_t *)&buf, 0x16u);
  }

  v35.receiver = self;
  v35.super_class = (Class)MRRMultimodalMentionDetector;
  uint64_t v34 = [(MRRMultimodalMentionDetector *)&v35 init];
  uint64_t v12 = [[NSString alloc] initWithString:v32];
  locale = v34->_locale;
  v34->_locale = (NSString *)v12;

  dispatch_queue_t v14 = dispatch_queue_create("com.apple.sirinl.marrs", 0);
  dispatchQueue = v34->_dispatchQueue;
  v34->_dispatchQueue = (OS_dispatch_queue *)v14;

  id v16 = v34->_dispatchQueue;
  uint64_t v17 = dispatch_get_global_queue(25, 0);
  dispatch_set_target_queue(v16, v17);

  v18 = [MEMORY[0x1E4F28CB8] defaultManager];
  LODWORD(v17) = [v18 fileExistsAtPath:v31];

  if (v17)
  {
    [v31 UTF8String];
    operator new();
  }
  value = v34->_mentionDetector.__ptr_.__value_;
  v34->_mentionDetector.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(MRRMentionDetectorInterface *))(*(void *)value + 16))(value);
  }
  id v20 = MRRLoggerForCategory(1);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    int buf = 138412546;
    *(void *)buf_4 = v31;
    __int16 v38 = 2112;
    id v39 = v32;
    _os_log_impl(&dword_1C9555000, v20, OS_LOG_TYPE_INFO, "Failed initializing MD with asset path - %@, locale - %@", (uint8_t *)&buf, 0x16u);
  }

  uint64_t v21 = +[MRRMultimodalMentionDetector name];
  +[PredictorUtils reportInitStatusWithPredictorName:v21 domain:@"com.apple.siri.marrs.rr" code:0 locale:v32];

  if (a5)
  {
    uint64_t v22 = +[MRRMultimodalMentionDetector name];
    *a5 = +[PredictorUtils getInitStatusWithPredictorName:v22 domain:@"com.apple.siri.marrs.rr" code:0];
  }
  uint64_t v23 = MRRLoggerForCategory(1);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1C9555000, v23, OS_LOG_TYPE_INFO, "successfully initialized MD", (uint8_t *)&buf, 2u);
  }

  uint64_t v24 = MRRLoggerForCategory(3);
  uint64_t v25 = v24;
  if (v29 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9555000, v25, OS_SIGNPOST_INTERVAL_END, spid, "MDInitialization", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  id v26 = MRRLoggerForCategory(0);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1C9555000, v26, OS_LOG_TYPE_INFO, "END \"MDInitialization\"", (uint8_t *)&buf, 2u);
  }

  return v34;
}

+ (id)sharedManager
{
  if (+[MRRMultimodalMentionDetector sharedManager]::onceToken != -1) {
    dispatch_once(&+[MRRMultimodalMentionDetector sharedManager]::onceToken, &__block_literal_global_643);
  }
  v2 = (void *)+[MRRMultimodalMentionDetector sharedManager]::singletonMentionDetector;
  return v2;
}

uint64_t __45__MRRMultimodalMentionDetector_sharedManager__block_invoke()
{
  +[MRRMultimodalMentionDetector sharedManager]::singletonMentionDetector = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (id)name
{
  return @"MRRMultimodalMentionDetector";
}

@end