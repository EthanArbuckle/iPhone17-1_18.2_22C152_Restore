@interface CESRSpeechItemRanker_Contact
- (BOOL)addSet:(id)a3;
- (BOOL)enumerateRankedItemsWithError:(id *)a3 usingBlock:(id)a4;
- (CESRSpeechItemRanker_Contact)initWithInstance:(id)a3 speechProfileSite:(id)a4 categoryGroup:(id)a5;
- (CESRSpeechItemRanker_Contact)initWithInstance:(id)a3 speechProfileSite:(id)a4 categoryGroup:(id)a5 priorRetriever:(id)a6;
- (id)getActivatedCodepathIds;
- (id)getAllCodepathIds;
- (void)_activateEnrolledTrialExperiments;
@end

@implementation CESRSpeechItemRanker_Contact

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codepathIds, 0);
  objc_storeStrong((id *)&self->_trialContactRankingStrategy, 0);

  objc_storeStrong((id *)&self->_priorRetriever, 0);
}

- (BOOL)enumerateRankedItemsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(CESRSpeechItemRanker *)self calculateItemLimit];
  if ([(NSString *)self->_trialContactRankingStrategy isEqualToString:@"PeopleSuggesterTop20"])
  {
    v8 = [(CESRPriorRetriever *)self->_priorRetriever allPriorInfoWithThreshold:v7];
    v9 = *MEMORY[0x1E4F4E380];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[CESRSpeechItemRanker_Contact enumerateRankedItemsWithError:usingBlock:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = @"PeopleSuggesterTop20";
LABEL_7:
    _os_log_impl(&dword_1B8CCB000, v9, OS_LOG_TYPE_INFO, "%s Active ASR A/B trial experiment for Contact Boosting. Treatment = %@", buf, 0x16u);
    goto LABEL_13;
  }
  if ([(NSString *)self->_trialContactRankingStrategy isEqualToString:@"MegadomeContactTop20"])
  {
    v8 = [(CESRPriorRetriever *)self->_priorRetriever allPriorInfoWithThreshold:v7];
    v9 = *MEMORY[0x1E4F4E380];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[CESRSpeechItemRanker_Contact enumerateRankedItemsWithError:usingBlock:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = @"MegadomeContactTop20";
    goto LABEL_7;
  }
  if ([(NSString *)self->_trialContactRankingStrategy isEqualToString:@"NoBoosting"])
  {
    v10 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[CESRSpeechItemRanker_Contact enumerateRankedItemsWithError:usingBlock:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = @"NoBoosting";
      _os_log_impl(&dword_1B8CCB000, v10, OS_LOG_TYPE_INFO, "%s Active ASR A/B trial experiment for Contact Boosting. Treatment = %@. Disabling priors.", buf, 0x16u);
    }
    v8 = 0;
  }
  else
  {
    v8 = [(CESRPriorRetriever *)self->_priorRetriever allPriorInfoWithThreshold:v7];
  }
LABEL_13:
  unsigned int v11 = [v8 count];
  unsigned int v12 = v11;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  int v35 = 0;
  if (!v11)
  {
    v15 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v26 = 136315138;
      v27 = "-[CESRSpeechItemRanker_Contact enumerateRankedItemsWithError:usingBlock:]";
      _os_log_error_impl(&dword_1B8CCB000, v15, OS_LOG_TYPE_ERROR, "%s No priors available. Disabling filter", v26, 0xCu);
    }
    goto LABEL_20;
  }
  int v13 = v7 - v11;
  if (v7 < v11)
  {
    v14 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v26 = 136315394;
      v27 = "-[CESRSpeechItemRanker_Contact enumerateRankedItemsWithError:usingBlock:]";
      __int16 v28 = 1024;
      unsigned int v29 = v12;
      _os_log_error_impl(&dword_1B8CCB000, v14, OS_LOG_TYPE_ERROR, "%s Unexpected prior count (%u) Disabling filter", v26, 0x12u);
    }
LABEL_20:

    v8 = 0;
    goto LABEL_21;
  }
  int v35 = v7 - v11;
  v20 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v26 = 136315906;
    v27 = "-[CESRSpeechItemRanker_Contact enumerateRankedItemsWithError:usingBlock:]";
    __int16 v28 = 1024;
    unsigned int v29 = v12;
    __int16 v30 = 1024;
    int v31 = v7;
    __int16 v32 = 1024;
    int v33 = v13;
    _os_log_impl(&dword_1B8CCB000, v20, OS_LOG_TYPE_INFO, "%s Received priors for %u contacts with limit: %u allowance: %u", v26, 0x1Eu);
  }
LABEL_21:
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __73__CESRSpeechItemRanker_Contact_enumerateRankedItemsWithError_usingBlock___block_invoke;
  v22[3] = &unk_1E61C2AB0;
  id v16 = v8;
  id v23 = v16;
  id v17 = v6;
  id v24 = v17;
  v25 = buf;
  v21.receiver = self;
  v21.super_class = (Class)CESRSpeechItemRanker_Contact;
  BOOL v18 = [(CESRSpeechItemRanker *)&v21 enumerateRankedItemsWithError:a3 usingBlock:v22];

  _Block_object_dispose(buf, 8);
  return v18;
}

- (BOOL)addSet:(id)a3
{
  id v4 = a3;
  if ([v4 itemType] == 19668)
  {
    v7.receiver = self;
    v7.super_class = (Class)CESRSpeechItemRanker_Contact;
    BOOL v5 = [(CESRSpeechItemRanker *)&v7 addSet:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)getActivatedCodepathIds
{
  v7.receiver = self;
  v7.super_class = (Class)CESRSpeechItemRanker_Contact;
  if ([(CESRSpeechItemRanker *)&v7 enumeratedItemCount] >= 1) {
    [(NSMutableSet *)self->_codepathIds addObject:@"043fda7b-2fc0-489e-8cce-319c22dcf3ba"];
  }
  v6.receiver = self;
  v6.super_class = (Class)CESRSpeechItemRanker_Contact;
  id v3 = [(CESRSpeechItemRanker *)&v6 enumeratedItemCount];
  if ((uint64_t)v3 >= [(CESRSpeechItemRanker *)self calculateItemLimit]) {
    [(NSMutableSet *)self->_codepathIds addObject:@"502484ea-7a73-454a-8e1f-9f04983d6358"];
  }
  codepathIds = self->_codepathIds;

  return codepathIds;
}

- (id)getAllCodepathIds
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"043fda7b-2fc0-489e-8cce-319c22dcf3ba", @"502484ea-7a73-454a-8e1f-9f04983d6358", 0);
}

- (void)_activateEnrolledTrialExperiments
{
  id v6 = [MEMORY[0x1E4FB0098] clientWithIdentifier:111];
  id v3 = [v6 levelForFactor:@"contact_boosting_strategy" withNamespaceName:@"SIRI_SPEECH_SV_SPEECH_PROFILE"];
  id v4 = [v3 stringValue];
  trialContactRankingStrategy = self->_trialContactRankingStrategy;
  self->_trialContactRankingStrategy = v4;

  self->_didFetchExperiments = 1;
}

- (CESRSpeechItemRanker_Contact)initWithInstance:(id)a3 speechProfileSite:(id)a4 categoryGroup:(id)a5 priorRetriever:(id)a6
{
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CESRSpeechItemRanker_Contact;
  unsigned int v12 = [(CESRSpeechItemRanker *)&v17 initWithInstance:a3 speechProfileSite:a4 categoryGroup:a5];
  int v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_priorRetriever, a6);
    uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
    codepathIds = v13->_codepathIds;
    v13->_codepathIds = (NSMutableSet *)v14;

    if (!v13->_didFetchExperiments) {
      [(CESRSpeechItemRanker_Contact *)v13 _activateEnrolledTrialExperiments];
    }
  }

  return v13;
}

- (CESRSpeechItemRanker_Contact)initWithInstance:(id)a3 speechProfileSite:(id)a4 categoryGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  trialContactRankingStrategy = self->_trialContactRankingStrategy;
  self->_trialContactRankingStrategy = 0;

  [(CESRSpeechItemRanker_Contact *)self _activateEnrolledTrialExperiments];
  unsigned int v12 = objc_alloc_init(CESRPeopleSuggesterPriorRetriever);
  if ([(NSString *)self->_trialContactRankingStrategy isEqualToString:@"MegadomeContactTop20"])
  {
    int v13 = objc_alloc_init(CESRMegadomeContactPriorRetriever);

    unsigned int v12 = (CESRPeopleSuggesterPriorRetriever *)v13;
  }
  uint64_t v14 = [(CESRSpeechItemRanker_Contact *)self initWithInstance:v8 speechProfileSite:v9 categoryGroup:v10 priorRetriever:v12];

  return v14;
}

@end