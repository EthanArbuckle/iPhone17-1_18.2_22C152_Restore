@interface MRRMultimodalMentionResolver
+ (id)name;
+ (id)sharedManager;
- (BOOL)resolveCandidatesForUtterance:(id)a3 entities:(id)a4 maximumCandidates:(unint64_t)a5 status:(id *)a6 completionBlock:(id)a7;
- (BOOL)resolveCandidatesForUtterance:(id)a3 mentions:(id)a4 entities:(id)a5 maximumCandidates:(unint64_t)a6 status:(id *)a7 completionBlock:(id)a8;
- (BOOL)resolveCandidatesForUtterance:(id)a3 status:(id *)a4 completionBlock:(id)a5;
- (BOOL)resolveCandidatesForUtterance:(id)a3 utteranceTokens:(id)a4 tokenEmbeddings:(id)a5 entities:(id)a6 maximumCandidates:(unint64_t)a7 status:(id *)a8 completionBlock:(id)a9;
- (BOOL)resolveCandidatesForUtterance:(id)a3 utteranceTokens:(id)a4 tokenEmbeddings:(id)a5 mentions:(id)a6 entities:(id)a7 maximumCandidates:(unint64_t)a8 status:(id *)a9 completionBlock:(id)a10;
- (MRRMultimodalMentionResolver)initWithAssets:(id)a3 forLocale:(id)a4 status:(id *)a5;
- (id).cxx_construct;
- (id)resolveCandidatesForUtterance:(id)a3 entities:(id)a4 maximumCandidates:(unint64_t)a5 status:(id *)a6;
- (id)resolveCandidatesForUtterance:(id)a3 utteranceTokens:(id)a4 tokenEmbeddings:(id)a5 entities:(id)a6 maximumCandidates:(unint64_t)a7 status:(id *)a8;
- (id)resolveMentionsInUtterance:(id)a3 mentions:(id)a4 entities:(id)a5 maximumCandidates:(unint64_t)a6 status:(id *)a7;
- (id)resolveMentionsInUtterance:(id)a3 status:(id *)a4;
- (id)resolveMentionsInUtterance:(id)a3 utteranceTokens:(id)a4 tokenEmbeddings:(id)a5 mentions:(id)a6 entities:(id)a7 maximumCandidates:(unint64_t)a8 status:(id *)a9;
- (id)resolveReferencesInUtteranceImpl:(id)a3 status:(id *)a4;
@end

@implementation MRRMultimodalMentionResolver

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  value = self->_mrOrchestrator.__ptr_.__value_;
  self->_mrOrchestrator.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(MROrchestrator *))(*(void *)value + 16))(value);
  }
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (BOOL)resolveCandidatesForUtterance:(id)a3 utteranceTokens:(id)a4 tokenEmbeddings:(id)a5 mentions:(id)a6 entities:(id)a7 maximumCandidates:(unint64_t)a8 status:(id *)a9 completionBlock:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v33 = a10;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy_;
  v56 = __Block_byref_object_dispose_;
  id v57 = (id)objc_opt_new();
  [(id)v53[5] setUtterance:v16];
  [(id)v53[5] setRequestId:0];
  [(id)v53[5] setNluRequestId:0];
  [(id)v53[5] setResultCandidateId:0];
  v21 = objc_opt_new();
  [(id)v53[5] setTokenChain:v21];

  locale = self->_locale;
  v23 = [(id)v53[5] tokenChain];
  [v23 setLocale:locale];

  v24 = [(id)v53[5] tokenChain];
  [v24 setStringValue:v16];

  v25 = [MEMORY[0x1E4F1CA48] arrayWithArray:v17];
  v26 = [(id)v53[5] tokenChain];
  [v26 setTokens:v25];

  [(id)v53[5] setEmbeddingTensor:v18];
  v27 = [MEMORY[0x1E4F1CA48] arrayWithArray:v19];
  [(id)v53[5] setDetectedMentions:v27];

  v28 = [MEMORY[0x1E4F1CA48] arrayWithArray:v20];
  [(id)v53[5] setEntityCandidates:v28];

  [(id)v53[5] setMaxCandidates:a8];
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy_;
  v50[4] = __Block_byref_object_dispose_;
  id v51 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy_;
  v44 = __Block_byref_object_dispose_;
  id v45 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __153__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_utteranceTokens_tokenEmbeddings_mentions_entities_maximumCandidates_status_completionBlock___block_invoke;
  block[3] = &unk_1E6599C90;
  v36 = v50;
  block[4] = self;
  v37 = &v52;
  v38 = &v40;
  v39 = &v46;
  id v30 = v33;
  id v35 = v30;
  dispatch_async(dispatchQueue, block);
  if (a9) {
    *a9 = (id) v41[5];
  }
  char v31 = *((unsigned char *)v47 + 24);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(v50, 8);

  _Block_object_dispose(&v52, 8);
  return v31;
}

void __153__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_utteranceTokens_tokenEmbeddings_mentions_entities_maximumCandidates_status_completionBlock___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(*(void *)(a1[7] + 8) + 40);
  uint64_t v4 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 resolveReferencesInUtteranceImpl:v3 status:&obj];
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

- (BOOL)resolveCandidatesForUtterance:(id)a3 mentions:(id)a4 entities:(id)a5 maximumCandidates:(unint64_t)a6 status:(id *)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = __Block_byref_object_copy_;
  v47 = __Block_byref_object_dispose_;
  id v48 = (id)objc_opt_new();
  [(id)v44[5] setUtterance:v14];
  [(id)v44[5] setRequestId:0];
  [(id)v44[5] setNluRequestId:0];
  [(id)v44[5] setResultCandidateId:0];
  [(id)v44[5] setTokenChain:0];
  [(id)v44[5] setEmbeddingTensor:0];
  id v18 = [MEMORY[0x1E4F1CA48] arrayWithArray:v15];
  [(id)v44[5] setDetectedMentions:v18];

  id v19 = [MEMORY[0x1E4F1CA48] arrayWithArray:v16];
  [(id)v44[5] setEntityCandidates:v19];

  [(id)v44[5] setMaxCandidates:a6];
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy_;
  v41[4] = __Block_byref_object_dispose_;
  id v42 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  id v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __121__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_mentions_entities_maximumCandidates_status_completionBlock___block_invoke;
  block[3] = &unk_1E6599CE0;
  v26 = v41;
  block[4] = self;
  v27 = &v43;
  v28 = &v31;
  v29 = &v37;
  id v30 = a7;
  id v21 = v17;
  id v25 = v21;
  dispatch_async(dispatchQueue, block);
  if (a7) {
    *a7 = (id) v32[5];
  }
  char v22 = *((unsigned char *)v38 + 24);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(&v43, 8);
  return v22;
}

void __121__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_mentions_entities_maximumCandidates_status_completionBlock___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(*(void *)(a1[7] + 8) + 40);
  uint64_t v4 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 resolveReferencesInUtteranceImpl:v3 status:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (a1[10])
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

- (BOOL)resolveCandidatesForUtterance:(id)a3 utteranceTokens:(id)a4 tokenEmbeddings:(id)a5 entities:(id)a6 maximumCandidates:(unint64_t)a7 status:(id *)a8 completionBlock:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v30 = a9;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  uint64_t v52 = __Block_byref_object_copy_;
  v53 = __Block_byref_object_dispose_;
  id v54 = (id)objc_opt_new();
  [(id)v50[5] setUtterance:v15];
  [(id)v50[5] setRequestId:0];
  [(id)v50[5] setNluRequestId:0];
  [(id)v50[5] setResultCandidateId:0];
  id v19 = objc_opt_new();
  [(id)v50[5] setTokenChain:v19];

  locale = self->_locale;
  id v21 = [(id)v50[5] tokenChain];
  [v21 setLocale:locale];

  char v22 = [(id)v50[5] tokenChain];
  [v22 setStringValue:v15];

  v23 = [MEMORY[0x1E4F1CA48] arrayWithArray:v16];
  v24 = [(id)v50[5] tokenChain];
  [v24 setTokens:v23];

  [(id)v50[5] setEmbeddingTensor:v17];
  [(id)v50[5] setDetectedMentions:0];
  id v25 = [MEMORY[0x1E4F1CA48] arrayWithArray:v18];
  [(id)v50[5] setEntityCandidates:v25];

  [(id)v50[5] setMaxCandidates:a7];
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy_;
  v47[4] = __Block_byref_object_dispose_;
  id v48 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  char v40 = __Block_byref_object_copy_;
  v41 = __Block_byref_object_dispose_;
  id v42 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __144__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_utteranceTokens_tokenEmbeddings_entities_maximumCandidates_status_completionBlock___block_invoke;
  block[3] = &unk_1E6599C90;
  uint64_t v33 = v47;
  block[4] = self;
  v34 = &v49;
  id v35 = &v37;
  id v36 = &v43;
  id v27 = v30;
  id v32 = v27;
  dispatch_async(dispatchQueue, block);
  if (a8) {
    *a8 = (id) v38[5];
  }
  char v28 = *((unsigned char *)v44 + 24);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(v47, 8);

  _Block_object_dispose(&v49, 8);
  return v28;
}

void __144__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_utteranceTokens_tokenEmbeddings_entities_maximumCandidates_status_completionBlock___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(*(void *)(a1[7] + 8) + 40);
  uint64_t v4 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 resolveReferencesInUtteranceImpl:v3 status:&obj];
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

- (BOOL)resolveCandidatesForUtterance:(id)a3 entities:(id)a4 maximumCandidates:(unint64_t)a5 status:(id *)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  id v42 = __Block_byref_object_dispose_;
  id v43 = (id)objc_opt_new();
  [(id)v39[5] setUtterance:v12];
  [(id)v39[5] setRequestId:0];
  [(id)v39[5] setNluRequestId:0];
  [(id)v39[5] setResultCandidateId:0];
  [(id)v39[5] setTokenChain:0];
  [(id)v39[5] setEmbeddingTensor:0];
  [(id)v39[5] setDetectedMentions:0];
  id v15 = [MEMORY[0x1E4F1CA48] arrayWithArray:v13];
  [(id)v39[5] setEntityCandidates:v15];

  [(id)v39[5] setMaxCandidates:a5];
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy_;
  v36[4] = __Block_byref_object_dispose_;
  id v37 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  id v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  dispatchQueue = self->_dispatchQueue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __112__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_entities_maximumCandidates_status_completionBlock___block_invoke;
  v20[3] = &unk_1E6599C90;
  char v22 = v36;
  v20[4] = self;
  v23 = &v38;
  v24 = &v26;
  id v25 = &v32;
  id v17 = v14;
  id v21 = v17;
  dispatch_async(dispatchQueue, v20);
  if (a6) {
    *a6 = (id) v27[5];
  }
  char v18 = *((unsigned char *)v33 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(&v38, 8);
  return v18;
}

void __112__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_entities_maximumCandidates_status_completionBlock___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(*(void *)(a1[7] + 8) + 40);
  uint64_t v4 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 resolveReferencesInUtteranceImpl:v3 status:&obj];
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

- (id)resolveMentionsInUtterance:(id)a3 utteranceTokens:(id)a4 tokenEmbeddings:(id)a5 mentions:(id)a6 entities:(id)a7 maximumCandidates:(unint64_t)a8 status:(id *)a9
{
  id v15 = a3;
  id v31 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  id v42 = __Block_byref_object_copy_;
  id v43 = __Block_byref_object_dispose_;
  id v44 = (id)objc_opt_new();
  [(id)v40[5] setUtterance:v15];
  [(id)v40[5] setRequestId:0];
  [(id)v40[5] setNluRequestId:0];
  [(id)v40[5] setResultCandidateId:0];
  id v19 = objc_opt_new();
  [(id)v40[5] setTokenChain:v19];

  locale = self->_locale;
  id v21 = [(id)v40[5] tokenChain];
  [v21 setLocale:locale];

  char v22 = [(id)v40[5] tokenChain];
  [v22 setStringValue:v15];

  v23 = [MEMORY[0x1E4F1CA48] arrayWithArray:v31];
  v24 = [(id)v40[5] tokenChain];
  [v24 setTokens:v23];

  [(id)v40[5] setEmbeddingTensor:v16];
  id v25 = [MEMORY[0x1E4F1CA48] arrayWithArray:v17];
  [(id)v40[5] setDetectedMentions:v25];

  uint64_t v26 = [MEMORY[0x1E4F1CA48] arrayWithArray:v18];
  [(id)v40[5] setEntityCandidates:v26];

  [(id)v40[5] setMaxCandidates:a8];
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy_;
  id v37 = __Block_byref_object_dispose_;
  id v38 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __134__MRRMultimodalMentionResolver_resolveMentionsInUtterance_utteranceTokens_tokenEmbeddings_mentions_entities_maximumCandidates_status___block_invoke;
  block[3] = &unk_1E6599CB8;
  block[4] = self;
  void block[5] = &v33;
  block[6] = &v39;
  block[7] = a9;
  dispatch_sync(dispatchQueue, block);
  uint64_t v28 = (void *)v34[5];
  if (v28)
  {
    v29 = [v28 mentions];
  }
  else
  {
    v29 = 0;
  }
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  return v29;
}

uint64_t __134__MRRMultimodalMentionResolver_resolveMentionsInUtterance_utteranceTokens_tokenEmbeddings_mentions_entities_maximumCandidates_status___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) resolveReferencesInUtteranceImpl:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) status:*(void *)(a1 + 56)];
  return MEMORY[0x1F41817F8]();
}

- (id)resolveMentionsInUtterance:(id)a3 mentions:(id)a4 entities:(id)a5 maximumCandidates:(unint64_t)a6 status:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy_;
  uint64_t v32 = __Block_byref_object_dispose_;
  id v33 = (id)objc_opt_new();
  [(id)v29[5] setUtterance:v12];
  [(id)v29[5] setRequestId:0];
  [(id)v29[5] setNluRequestId:0];
  [(id)v29[5] setResultCandidateId:0];
  [(id)v29[5] setTokenChain:0];
  [(id)v29[5] setEmbeddingTensor:0];
  id v15 = [MEMORY[0x1E4F1CA48] arrayWithArray:v13];
  [(id)v29[5] setDetectedMentions:v15];

  id v16 = [MEMORY[0x1E4F1CA48] arrayWithArray:v14];
  [(id)v29[5] setEntityCandidates:v16];

  [(id)v29[5] setMaxCandidates:a6];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  dispatchQueue = self->_dispatchQueue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __102__MRRMultimodalMentionResolver_resolveMentionsInUtterance_mentions_entities_maximumCandidates_status___block_invoke;
  v21[3] = &unk_1E6599CB8;
  v21[4] = self;
  v21[5] = &v22;
  v21[6] = &v28;
  v21[7] = a7;
  dispatch_sync(dispatchQueue, v21);
  id v18 = (void *)v23[5];
  if (v18)
  {
    id v19 = [v18 mentions];
  }
  else
  {
    id v19 = 0;
  }
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v19;
}

uint64_t __102__MRRMultimodalMentionResolver_resolveMentionsInUtterance_mentions_entities_maximumCandidates_status___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) resolveReferencesInUtteranceImpl:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) status:*(void *)(a1 + 56)];
  return MEMORY[0x1F41817F8]();
}

- (id)resolveCandidatesForUtterance:(id)a3 utteranceTokens:(id)a4 tokenEmbeddings:(id)a5 entities:(id)a6 maximumCandidates:(unint64_t)a7 status:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy_;
  uint64_t v40 = __Block_byref_object_dispose_;
  id v41 = (id)objc_opt_new();
  [(id)v37[5] setUtterance:v14];
  [(id)v37[5] setRequestId:0];
  [(id)v37[5] setNluRequestId:0];
  [(id)v37[5] setResultCandidateId:0];
  id v18 = objc_opt_new();
  [(id)v37[5] setTokenChain:v18];

  locale = self->_locale;
  id v20 = [(id)v37[5] tokenChain];
  [v20 setLocale:locale];

  id v21 = [(id)v37[5] tokenChain];
  [v21 setStringValue:v14];

  uint64_t v22 = [MEMORY[0x1E4F1CA48] arrayWithArray:v15];
  v23 = [(id)v37[5] tokenChain];
  [v23 setTokens:v22];

  [(id)v37[5] setEmbeddingTensor:v16];
  [(id)v37[5] setDetectedMentions:0];
  uint64_t v24 = [MEMORY[0x1E4F1CA48] arrayWithArray:v17];
  [(id)v37[5] setEntityCandidates:v24];

  [(id)v37[5] setMaxCandidates:a7];
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy_;
  uint64_t v34 = __Block_byref_object_dispose_;
  id v35 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __128__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_utteranceTokens_tokenEmbeddings_entities_maximumCandidates_status___block_invoke;
  block[3] = &unk_1E6599CB8;
  block[4] = self;
  void block[5] = &v30;
  block[6] = &v36;
  block[7] = a8;
  dispatch_sync(dispatchQueue, block);
  uint64_t v26 = (void *)v31[5];
  if (v26)
  {
    id v27 = [v26 mentions];
  }
  else
  {
    id v27 = 0;
  }
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v27;
}

uint64_t __128__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_utteranceTokens_tokenEmbeddings_entities_maximumCandidates_status___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) resolveReferencesInUtteranceImpl:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) status:*(void *)(a1 + 56)];
  return MEMORY[0x1F41817F8]();
}

- (id)resolveCandidatesForUtterance:(id)a3 entities:(id)a4 maximumCandidates:(unint64_t)a5 status:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy_;
  uint64_t v28 = __Block_byref_object_dispose_;
  id v29 = (id)objc_opt_new();
  [(id)v25[5] setUtterance:v10];
  [(id)v25[5] setRequestId:0];
  [(id)v25[5] setNluRequestId:0];
  [(id)v25[5] setResultCandidateId:0];
  [(id)v25[5] setTokenChain:0];
  [(id)v25[5] setEmbeddingTensor:0];
  [(id)v25[5] setDetectedMentions:0];
  id v12 = [MEMORY[0x1E4F1CA48] arrayWithArray:v11];
  [(id)v25[5] setEntityCandidates:v12];

  [(id)v25[5] setMaxCandidates:a5];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  dispatchQueue = self->_dispatchQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __96__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_entities_maximumCandidates_status___block_invoke;
  v17[3] = &unk_1E6599CB8;
  v17[4] = self;
  v17[5] = &v18;
  v17[6] = &v24;
  v17[7] = a6;
  dispatch_sync(dispatchQueue, v17);
  id v14 = (void *)v19[5];
  if (v14)
  {
    id v15 = [v14 mentions];
  }
  else
  {
    id v15 = 0;
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v15;
}

uint64_t __96__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_entities_maximumCandidates_status___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) resolveReferencesInUtteranceImpl:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) status:*(void *)(a1 + 56)];
  return MEMORY[0x1F41817F8]();
}

- (BOOL)resolveCandidatesForUtterance:(id)a3 status:(id *)a4 completionBlock:(id)a5
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
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy_;
  id v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_status_completionBlock___block_invoke;
  v15[3] = &unk_1E6599C68;
  uint64_t v18 = v31;
  v15[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v19 = &v21;
  uint64_t v20 = &v27;
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

uint64_t __85__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_status_completionBlock___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 resolveReferencesInUtteranceImpl:v3 status:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(a1[8] + 8) + 40)) {
    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (id)resolveMentionsInUtterance:(id)a3 status:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  id v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__MRRMultimodalMentionResolver_resolveMentionsInUtterance_status___block_invoke;
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

uint64_t __66__MRRMultimodalMentionResolver_resolveMentionsInUtterance_status___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) resolveReferencesInUtteranceImpl:*(void *)(a1 + 40) status:*(void *)(a1 + 56)];
  return MEMORY[0x1F41817F8]();
}

- (id)resolveReferencesInUtteranceImpl:(id)a3 status:(id *)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = MRRLoggerForCategory(3);
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = MRRLoggerForCategory(3);
  id v9 = v8;
  os_signpost_id_t spid = v7;
  unint64_t v57 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9555000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "MRExecuteRequest", "", buf, 2u);
  }

  id v10 = MRRLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9555000, v10, OS_LOG_TYPE_INFO, "BEGIN \"MRExecuteRequest\"", buf, 2u);
  }

  id v11 = [v5 requestId];
  BOOL v12 = v11 == 0;

  if (v12)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4FA29C8]);
    [v5 setRequestId:v13];
  }
  id v14 = [v5 nluRequestId];
  BOOL v15 = v14 == 0;

  if (v15)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4FA29C8]);
    [v5 setNluRequestId:v16];
  }
  uint64_t v17 = [v5 resultCandidateId];
  BOOL v18 = v17 == 0;

  if (v18) {
    [v5 setResultCandidateId:&stru_1F23C7F28];
  }
  id v19 = [v5 tokenChain];
  if (v19)
  {
    id v20 = [v5 tokenChain];
    [v20 tokens];
  }
  [v5 embeddingTensor];

  [v5 detectedMentions];
  uint64_t v21 = [v5 detectedMentions];
  if ([v21 count]) {
    goto LABEL_17;
  }
  uint64_t v22 = [v5 matchingSpans];
  if ([v22 count])
  {

LABEL_17:
    goto LABEL_18;
  }
  id v43 = [v5 contextualSpans];
  BOOL v44 = [v43 count] == 0;

  if (!v44)
  {
LABEL_18:
    uint64_t v23 = [v5 entityCandidates];
    if ([v23 count])
    {

LABEL_21:
      if (![v5 maxCandidates]) {
        [v5 setMaxCandidates:0x7FFFFFFFLL];
      }
      if (!self->_locale)
      {
        id v26 = [MEMORY[0x1E4F1CA20] preferredLanguages];
        uint64_t v27 = [v26 objectAtIndex:0];
        locale = self->_locale;
        self->_locale = v27;
      }
      uint64_t v29 = MRRLoggerForCategory(3);
      os_signpost_id_t v30 = os_signpost_id_generate(v29);

      id v31 = MRRLoggerForCategory(3);
      id v32 = v31;
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C9555000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "MRObjCToCPPRequest", "", buf, 2u);
      }

      id v33 = MRRLoggerForCategory(0);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9555000, v33, OS_LOG_TYPE_INFO, "BEGIN \"MRObjCToCPPRequest\"", buf, 2u);
      }

      +[ConverterUtils convertMentionResolverRequestFromObjCToCpp:v5];
      uint64_t v34 = MRRLoggerForCategory(3);
      id v35 = v34;
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C9555000, v35, OS_SIGNPOST_INTERVAL_END, v30, "MRObjCToCPPRequest", " enableTelemetry=YES ", buf, 2u);
      }

      uint64_t v36 = MRRLoggerForCategory(0);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9555000, v36, OS_LOG_TYPE_INFO, "END \"MRObjCToCPPRequest\"", buf, 2u);
      }

      id v37 = self;
      objc_sync_enter(v37);
      value = v37->_mrOrchestrator.__ptr_.__value_;
      if (value)
      {
        (**(void (***)(uint8_t *__return_ptr, MROrchestrator *))value)(buf, v37->_mrOrchestrator.__ptr_.__value_);
        operator new();
      }
      uint64_t v39 = MRRLoggerForCategory(3);
      uint64_t v40 = v39;
      if (v57 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C9555000, v40, OS_SIGNPOST_INTERVAL_END, spid, "MRExecuteRequest", " enableTelemetry=YES ", buf, 2u);
      }

      id v41 = MRRLoggerForCategory(0);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9555000, v41, OS_LOG_TYPE_INFO, "END \"MRExecuteRequest\"", buf, 2u);
      }

      objc_sync_exit(v37);
      id v42 = 0;

      if (v59) {
        (*(void (**)())(*(void *)v59 + 8))();
      }
      goto LABEL_65;
    }
    uint64_t v24 = [v5 contextualSpans];
    BOOL v25 = [v24 count] == 0;

    if (!v25) {
      goto LABEL_21;
    }
    v50 = +[MRRMultimodalMentionResolver name];
    +[PredictorUtils reportPredictStatusWithPredictorName:v50 domain:@"com.apple.siri.marrs.rr" code:0 locale:self->_locale];

    if (a4)
    {
      uint64_t v51 = +[MRRMultimodalMentionResolver name];
      *a4 = +[PredictorUtils getPredictStatusWithPredictorName:v51 domain:@"com.apple.siri.marrs.rr" code:0];
    }
    uint64_t v52 = MRRLoggerForCategory(2);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9555000, v52, OS_LOG_TYPE_INFO, "there are no entities in entity pool and no contextual spans, there is nothing to resolve. Return early", buf, 2u);
    }

    v53 = MRRLoggerForCategory(3);
    id v54 = v53;
    if (v57 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9555000, v54, OS_SIGNPOST_INTERVAL_END, spid, "MRExecuteRequest", " enableTelemetry=YES ", buf, 2u);
    }

    id v42 = MRRLoggerForCategory(0);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      goto LABEL_62;
    }
    goto LABEL_65;
  }
  uint64_t v45 = +[MRRMultimodalMentionResolver name];
  +[PredictorUtils reportPredictStatusWithPredictorName:v45 domain:@"com.apple.siri.marrs.rr" code:0 locale:self->_locale];

  if (a4)
  {
    char v46 = +[MRRMultimodalMentionResolver name];
    *a4 = +[PredictorUtils getPredictStatusWithPredictorName:v46 domain:@"com.apple.siri.marrs.rr" code:0];
  }
  v47 = MRRLoggerForCategory(2);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9555000, v47, OS_LOG_TYPE_INFO, "there is no mention, matching span, nor contextual span detected in the utterance, so there is nothing to resolve. Return early", buf, 2u);
  }

  id v48 = MRRLoggerForCategory(3);
  uint64_t v49 = v48;
  if (v57 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9555000, v49, OS_SIGNPOST_INTERVAL_END, spid, "MRExecuteRequest", " enableTelemetry=YES ", buf, 2u);
  }

  id v42 = MRRLoggerForCategory(0);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
LABEL_62:
    _os_log_impl(&dword_1C9555000, v42, OS_LOG_TYPE_INFO, "END \"MRExecuteRequest\"", buf, 2u);
  }
LABEL_65:

  return 0;
}

- (MRRMultimodalMentionResolver)initWithAssets:(id)a3 forLocale:(id)a4 status:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
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
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9555000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "MRInitialization", "", buf, 2u);
  }

  id v10 = MRRLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9555000, v10, OS_LOG_TYPE_INFO, "BEGIN \"MRInitialization\"", buf, 2u);
  }

  v35.receiver = self;
  v35.super_class = (Class)MRRMultimodalMentionResolver;
  uint64_t v34 = [(MRRMultimodalMentionResolver *)&v35 init];
  uint64_t v11 = [[NSString alloc] initWithString:v32];
  locale = v34->_locale;
  v34->_locale = (NSString *)v11;

  dispatch_queue_t v13 = dispatch_queue_create("com.apple.sirinl.marrs", 0);
  dispatchQueue = v34->_dispatchQueue;
  v34->_dispatchQueue = (OS_dispatch_queue *)v13;

  BOOL v15 = v34->_dispatchQueue;
  id v16 = dispatch_get_global_queue(25, 0);
  dispatch_set_target_queue(v15, v16);

  uint64_t v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  LODWORD(v16) = [v17 fileExistsAtPath:v31];

  BOOL v18 = v34;
  objc_sync_enter(v18);
  if (v16)
  {
    [v31 UTF8String];
    [v32 UTF8String];
    operator new();
  }
  value = v18->_mrOrchestrator.__ptr_.__value_;
  v18->_mrOrchestrator.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(MROrchestrator *))(*(void *)value + 16))(value);
  }
  id v20 = MRRLoggerForCategory(2);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v31;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v32;
    _os_log_impl(&dword_1C9555000, v20, OS_LOG_TYPE_INFO, "Failed initializing MR with asset path - %@, locale - %@", buf, 0x16u);
  }

  objc_sync_exit(v18);
  uint64_t v21 = +[MRRMultimodalMentionResolver name];
  +[PredictorUtils reportInitStatusWithPredictorName:v21 domain:@"com.apple.siri.marrs.rr" code:0 locale:v32];

  if (a5)
  {
    uint64_t v22 = +[MRRMultimodalMentionResolver name];
    *a5 = +[PredictorUtils getInitStatusWithPredictorName:v22 domain:@"com.apple.siri.marrs.rr" code:0];
  }
  uint64_t v23 = MRRLoggerForCategory(2);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v36 = 0;
    _os_log_impl(&dword_1C9555000, v23, OS_LOG_TYPE_INFO, "successfully initialized Marrs MR", v36, 2u);
  }

  uint64_t v24 = MRRLoggerForCategory(3);
  BOOL v25 = v24;
  if (v29 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)uint64_t v36 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9555000, v25, OS_SIGNPOST_INTERVAL_END, spid, "MRInitialization", " enableTelemetry=YES ", v36, 2u);
  }

  id v26 = MRRLoggerForCategory(0);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v36 = 0;
    _os_log_impl(&dword_1C9555000, v26, OS_LOG_TYPE_INFO, "END \"MRInitialization\"", v36, 2u);
  }

  return v34;
}

+ (id)sharedManager
{
  if (+[MRRMultimodalMentionResolver sharedManager]::onceToken != -1) {
    dispatch_once(&+[MRRMultimodalMentionResolver sharedManager]::onceToken, &__block_literal_global_56);
  }
  v2 = (void *)+[MRRMultimodalMentionResolver sharedManager]::singletonMentionResolver;
  return v2;
}

uint64_t __45__MRRMultimodalMentionResolver_sharedManager__block_invoke()
{
  +[MRRMultimodalMentionResolver sharedManager]::singletonMentionResolver = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (id)name
{
  return @"MRRMultimodalMentionResolver";
}

@end