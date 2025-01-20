@interface SGMIFeatureVector
- (BOOL)hasHashedMessageId;
- (NSString)mailboxId;
- (NSString)messageId;
- (SGMIFeatureVector)initWithMessageId:(id)a3 hasHashedMessageId:(BOOL)a4 simpleMailMessage:(id)a5 senderConnectionScore:(id)a6 biomeMessageSummary:(id)a7 mailClientUtil:(id)a8 store:(id)a9 preLoadedFeatureNames:(id)a10;
- (SGMIFeatureVector)initWithMessageId:(id)a3 hasHashedMessageId:(BOOL)a4 simpleMailMessage:(id)a5 senderConnectionScore:(id)a6 biomeMessageSummary:(id)a7 store:(id)a8 preLoadedFeatureNames:(id)a9;
- (SGMIFeatureVector)initWithMessageId:(id)a3 hasHashedMessageId:(BOOL)a4 simpleMailMessage:(id)a5 spotlightIdentifier:(id)a6 senderConnectionScore:(id)a7 biomeMessageSummary:(id)a8 mailClientUtil:(id)a9 store:(id)a10 preLoadedFeatureNames:(id)a11;
- (SGMIFeatureVector)initWithMessageId:(id)a3 hasHashedMessageId:(BOOL)a4 simpleMailMessage:(id)a5 spotlightIdentifier:(id)a6 senderConnectionScore:(id)a7 biomeMessageSummary:(id)a8 store:(id)a9 preLoadedFeatureNames:(id)a10;
- (SGSimpleMailMessage)mailMessage;
- (SGSqlEntityStore)store;
- (id)cachedFeature:(int64_t)a3;
- (id)defaultSaliencyOnError;
- (id)defaultSaliencyOnOverrideFor:(int64_t)a3;
- (id)description;
- (id)feature:(int64_t)a3;
- (id)features;
- (id)flatVectorForFeatureNames:(id)a3;
- (id)saliencyWithScore:(id)a3 isSalient:(BOOL)a4;
- (id)saliencyWithScore:(id)a3 isSalient:(BOOL)a4 gteSaliency:(int64_t)a5 isCounted:(BOOL)a6;
- (int64_t)estimateGroundTruth;
- (int64_t)estimateGroundTruthWithConfig:(id)a3;
- (int64_t)evaluateFirstMatchAmong:(id)a3 defaultValue:(int64_t)a4;
- (void)ingestFeatures:(id)a3;
- (void)logOrStageWithSaliency:(id)a3;
- (void)setFeatureToNumberArrayValue:(id)a3 forName:(int64_t)a4;
- (void)setFeatureToNumberValue:(id)a3 forName:(int64_t)a4;
- (void)setFeatureToStringArrayValue:(id)a3 forName:(int64_t)a4;
- (void)setFeatureToStringValue:(id)a3 forName:(int64_t)a4;
@end

@implementation SGMIFeatureVector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_spotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_senderConnectionScore, 0);
  objc_storeStrong((id *)&self->_biomeMessageSummary, 0);
  objc_storeStrong((id *)&self->_mailClientUtil, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_mailMessage, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
}

- (SGSqlEntityStore)store
{
  return self->_store;
}

- (SGSimpleMailMessage)mailMessage
{
  return self->_mailMessage;
}

- (BOOL)hasHashedMessageId
{
  return self->_hasHashedMessageId;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (void)logOrStageWithSaliency:(id)a3
{
  id v4 = a3;
  if (self->_hasHashedMessageId)
  {
    v5 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "SGMIFeatureVector: PET logging skipped (hashed messageId)", buf, 2u);
    }
  }
  else
  {
    v5 = dispatch_get_global_queue(9, 0);
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__SGMIFeatureVector_logOrStageWithSaliency___block_invoke;
    v6[3] = &unk_1E65BB450;
    objc_copyWeak(&v8, (id *)buf);
    id v7 = v4;
    dispatch_async(v5, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

uint64_t __44__SGMIFeatureVector_logOrStageWithSaliency___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v68 = WeakRetained;
    v3 = [WeakRetained[10] mailIntelligenceStagedLogsForMessageId:WeakRetained[1]];
    if (([v3 isLogged] & 1) == 0)
    {
      id v4 = [v3 log];
      uint64_t v5 = [*(id *)(a1 + 32) gteSaliency];
      if (([v4 hasLocale] & 1) == 0)
      {
        v6 = [MEMORY[0x1E4F1CA20] currentLocale];
        id v7 = [v6 localeIdentifier];
        [v4 setLocale:v7];

        id v8 = v68;
        id v9 = v68[2];
        if (v9)
        {
          v10 = [v9 date];

          id v8 = v68;
          if (v10)
          {
            v11 = [v68[2] date];
            [v11 timeIntervalSinceNow];
            [v4 setTimeDifferenceFromReceptionToSaliencyInferenceInSeconds:-v12];

            id v8 = v68;
          }
        }
        [v8[6] floatValue];
        objc_msgSend(v4, "setSenderConnectionScore:");
      }
      v13 = [v4 active];
      v14 = [v13 submodelsProbabilities];

      if (([v14 hasPersonFromSenderProbability] & 1) == 0)
      {
        v15 = [v68[3] objectForKeyedSubscript:&unk_1F2536228];

        if (v15 || v5 != 2)
        {
          v16 = [v68 feature:1000];
          [v16 floatValue];
          objc_msgSend(v14, "setPersonFromSenderProbability:");
        }
      }
      if (([v14 hasPersonFromSenderInDyadicConversationProbability] & 1) == 0)
      {
        v17 = [v68[3] objectForKeyedSubscript:&unk_1F2536240];

        if (v17 || v5 != 2)
        {
          v18 = [v68 feature:1005];
          [v18 floatValue];
          objc_msgSend(v14, "setPersonFromSenderInDyadicConversationProbability:");
        }
      }
      if (([v14 hasSubjectContentProbability] & 1) == 0)
      {
        v19 = [v68[3] objectForKeyedSubscript:&unk_1F2536258];

        if (v19 || v5 != 2)
        {
          v20 = [v68 feature:1003];
          [v20 floatValue];
          objc_msgSend(v14, "setSubjectContentProbability:");
        }
      }
      if (([v14 hasPersonToRecipientsProbability] & 1) == 0)
      {
        v21 = [v68[3] objectForKeyedSubscript:&unk_1F2536270];

        if (v21 || v5 != 2)
        {
          v22 = [v68 feature:1001];
          [v22 floatValue];
          objc_msgSend(v14, "setPersonToRecipientsProbability:");
        }
      }
      if (([v14 hasPersonCCRecipientsProbability] & 1) == 0)
      {
        v23 = [v68[3] objectForKeyedSubscript:&unk_1F2536288];

        if (v23 || v5 != 2)
        {
          v24 = [v68 feature:1002];
          [v24 floatValue];
          objc_msgSend(v14, "setPersonCCRecipientsProbability:");
        }
      }
      if (([v14 hasDomainFromSenderProbability] & 1) == 0)
      {
        v25 = [v68[3] objectForKeyedSubscript:&unk_1F25362A0];

        if (v25 || v5 != 2)
        {
          v26 = [v68 feature:1004];
          [v26 floatValue];
          objc_msgSend(v14, "setDomainFromSenderProbability:");
        }
      }
      if (([v14 hasConversationProbability] & 1) == 0)
      {
        v27 = [v68[3] objectForKeyedSubscript:&unk_1F25362B8];

        if (v27 || v5 != 2)
        {
          v28 = [v68 feature:1008];
          [v28 floatValue];
          objc_msgSend(v14, "setConversationProbability:");
        }
      }
      if (([v14 hasListIdProbability] & 1) == 0)
      {
        v29 = [v68[3] objectForKeyedSubscript:&unk_1F25362D0];

        if (v29 || v5 != 2)
        {
          v30 = [v68 feature:1007];
          [v30 floatValue];
          objc_msgSend(v14, "setListIdProbability:");
        }
      }
      if (([v4 hasNbCharactersInMailSubject] & 1) == 0)
      {
        v31 = [v68[3] objectForKeyedSubscript:&unk_1F25362E8];

        if (v31 || v5 != 2)
        {
          v32 = [v68 feature:1];
          objc_msgSend(v4, "setNbCharactersInMailSubject:", objc_msgSend(v32, "intValue"));
        }
      }
      if (([v4 hasNbTokensInMailSubject] & 1) == 0)
      {
        v33 = [v68[3] objectForKeyedSubscript:&unk_1F25362E8];

        if (v33 || v5 != 2)
        {
          v34 = [v68 feature:2];
          objc_msgSend(v4, "setNbTokensInMailSubject:", objc_msgSend(v34, "intValue"));
        }
      }
      if (([v4 hasNbTokensInMailSubject] & 1) == 0)
      {
        v35 = [v68[3] objectForKeyedSubscript:&unk_1F25362E8];

        if (v35 || v5 != 2)
        {
          v36 = [v68 feature:2];
          objc_msgSend(v4, "setNbTokensInMailSubject:", objc_msgSend(v36, "intValue"));
        }
      }
      if ([*(id *)(a1 + 32) isSalient]) {
        uint64_t v37 = 1;
      }
      else {
        uint64_t v37 = 3;
      }
      v38 = [v4 active];
      [v38 setPredictedSaliency:v37];

      v39 = [*(id *)(a1 + 32) score];
      [v39 floatValue];
      int v41 = v40;
      v42 = [v4 active];
      LODWORD(v43) = v41;
      [v42 setPredictedSaliencyScore:v43];

      v44 = [v4 active];
      v45 = [v44 missingAttachments];
      uint64_t v46 = [v45 count];

      if (v5 == 2)
      {
        if (!v46)
        {
          v61 = [v68 feature:2012];
          v62 = objc_opt_new();
          LODWORD(v63) = -1.0;
          [v62 setPredictedMissingElementScore:v63];
          v64 = [v61 stringArrayValue];
          objc_msgSend(v62, "setFoundMatchingElement:", objc_msgSend(v64, "count") != 0);

          v65 = [v4 active];
          v66 = [v65 missingAttachments];
          [v66 addObject:v62];
        }
        [v68[10] setMailIntelligenceStagedLogs:v4 forMessageId:v68[1]];
      }
      else
      {
        if (v46)
        {
          v47 = +[SGMIConfig defaultConfig];
          if ([v47 shouldAnalyzeBody])
          {
            v48 = [v68 feature:2102];
            v49 = [v48 stringValue];
            [v4 setLang:v49];

            v50 = [v4 active];
            v51 = [v50 missingAttachments];
            v52 = [v51 firstObject];

            v53 = [v68 feature:1100];
            [v53 floatValue];
            objc_msgSend(v52, "setPredictedMissingElementScore:");
          }
        }
        v54 = objc_opt_new();
        v55 = [v54 trialMetadata];
        v56 = [v4 active];
        [v56 setTrialMetadata:v55];

        BOOL v57 = [*(id *)(a1 + 32) gteSaliency] == 1;
        v58 = [v4 active];
        [v58 setEstimatedGroundTruth:v57];

        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        [v4 setHoursSinceReference:(v59 / 3600.0)];
        v60 = [MEMORY[0x1E4F93728] sharedInstance];
        [v60 logMessage:v4];

        [v68[10] markMailIntelligenceStagedLogsAsLoggedAndClearLogPayloadForMessageId:v68[1]];
      }
    }
  }
  return MEMORY[0x1F41817F8]();
}

- (id)saliencyWithScore:(id)a3 isSalient:(BOOL)a4 gteSaliency:(int64_t)a5 isCounted:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  v10 = (objc_class *)MEMORY[0x1E4F5DA80];
  id v11 = a3;
  id v12 = [v10 alloc];
  v13 = [(SGMIFeatureVector *)self messageId];
  v14 = [(SGMIFeatureVector *)self mailboxId];
  mailMessage = self->_mailMessage;
  if (mailMessage) {
    [(SGMessage *)mailMessage date];
  }
  else {
  v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
  }
  v17 = (void *)[v12 initWithMessageId:v13 mailboxId:v14 score:v11 isSalient:v8 gteSaliency:a5 isCounted:v6 creationDate:v16];

  return v17;
}

- (id)saliencyWithScore:(id)a3 isSalient:(BOOL)a4
{
  return [(SGMIFeatureVector *)self saliencyWithScore:a3 isSalient:a4 gteSaliency:2 isCounted:0];
}

- (id)defaultSaliencyOnOverrideFor:(int64_t)a3
{
  if (a3 == 1)
  {
    v3 = &unk_1F25366A8;
    uint64_t v4 = 1;
  }
  else
  {
    v3 = &unk_1F2536698;
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(SGMIFeatureVector *)self saliencyWithScore:v3 isSalient:v4];
  return v5;
}

- (id)defaultSaliencyOnError
{
  return [(SGMIFeatureVector *)self saliencyWithScore:&unk_1F2536698 isSalient:0];
}

- (NSString)mailboxId
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(SGSimpleMailMessage *)self->_mailMessage mailboxIdentifiers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    BOOL v6 = @"<unassigned_mailbox>";
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 containsString:@"://"])
        {
          BOOL v6 = v8;
          goto LABEL_12;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v6 = @"<unassigned_mailbox>";
  }
LABEL_12:

  return (NSString *)v6;
}

- (int64_t)estimateGroundTruthWithConfig:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v6 = objc_msgSend(v4, "groundTruthEstimatorRules", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      int64_t v10 = 2;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) featureName];
          long long v13 = -[SGMIFeatureVector cachedFeature:](self, "cachedFeature:", (int)[v12 intValue]);

          if (v13)
          {

            BOOL v6 = [v5 groundTruthEstimatorRules];
            int64_t v10 = [(SGMIFeatureVector *)self evaluateFirstMatchAmong:v6 defaultValue:0];
            goto LABEL_14;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      int64_t v10 = 2;
    }
LABEL_14:
  }
  else
  {
    int64_t v10 = 2;
  }

  return v10;
}

- (int64_t)estimateGroundTruth
{
  uint64_t v3 = +[SGMISaliencyModelConfig defaultConfig];
  int64_t v4 = [(SGMIFeatureVector *)self estimateGroundTruthWithConfig:v3];

  return v4;
}

- (int64_t)evaluateFirstMatchAmong:(id)a3 defaultValue:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v12 = objc_msgSend(v11, "featureName", (void)v23);
        long long v13 = -[SGMIFeatureVector feature:](self, "feature:", (int)[v12 intValue]);
        [v13 doubleValue];
        double v15 = v14;

        long long v16 = [v11 strictLowerBound];
        [v16 doubleValue];
        if (v17 >= v15)
        {
        }
        else
        {
          long long v18 = [v11 strictUpperBound];
          [v18 doubleValue];
          double v20 = v19;

          if (v15 < v20)
          {
            v21 = [v11 output];
            a4 = [v21 BOOLValue];

            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }
LABEL_12:

  return a4;
}

- (void)ingestFeatures:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        features = self->_features;
        long long v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "featureName"));
        [(NSMutableDictionary *)features setObject:v9 forKeyedSubscript:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)setFeatureToNumberArrayValue:(id)a3 forName:(int64_t)a4
{
  id v6 = a3;
  uint64_t v9 = [[SGMIFeature alloc] initWithFeatureName:a4 numberArrayValue:v6];

  features = self->_features;
  uint64_t v8 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)features setObject:v9 forKeyedSubscript:v8];
}

- (void)setFeatureToNumberValue:(id)a3 forName:(int64_t)a4
{
  id v6 = a3;
  uint64_t v9 = [[SGMIFeature alloc] initWithFeatureName:a4 numberValue:v6];

  features = self->_features;
  uint64_t v8 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)features setObject:v9 forKeyedSubscript:v8];
}

- (void)setFeatureToStringArrayValue:(id)a3 forName:(int64_t)a4
{
  id v6 = a3;
  uint64_t v9 = [[SGMIFeature alloc] initWithFeatureName:a4 stringArrayValue:v6];

  features = self->_features;
  uint64_t v8 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)features setObject:v9 forKeyedSubscript:v8];
}

- (void)setFeatureToStringValue:(id)a3 forName:(int64_t)a4
{
  id v6 = a3;
  uint64_t v9 = [[SGMIFeature alloc] initWithFeatureName:a4 stringValue:v6];

  features = self->_features;
  uint64_t v8 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)features setObject:v9 forKeyedSubscript:v8];
}

- (id)feature:(int64_t)a3
{
  id v4 = self;
  v275[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = -[SGMIFeatureVector cachedFeature:](self, "cachedFeature:");
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    v266[0] = MEMORY[0x1E4F143A8];
    v266[1] = 3221225472;
    v266[2] = __29__SGMIFeatureVector_feature___block_invoke;
    v266[3] = &unk_1E65BEF88;
    v266[4] = v4;
    uint64_t v7 = (void (**)(void))MEMORY[0x1CB79B4C0](v266);
    uint64_t v8 = [NSNumber numberWithInteger:a3];
    uint64_t v9 = (void *)v8;
    int64_t v10 = 0;
    if (a3 <= 1999)
    {
      if ((unint64_t)a3 > 0x7CF)
      {
        switch(a3)
        {
          case 1000:
            long long v16 = [(SGMIFeatureVector *)v4 feature:2003];
            uint64_t v17 = [v16 stringValue];

            store = v4->_store;
            v275[0] = v17;
            double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v275 count:1];
            [(SGSqlEntityStore *)store naiveBayesModelQueryResultForFeature:1000 unigramTokens:v19 bigramTokens:MEMORY[0x1E4F1CBF0]];
            v21 = double v20 = v9;

            v22 = [SGMIFeature alloc];
            long long v23 = [v21 inferProbability];
            long long v24 = v22;
            uint64_t v25 = 1000;
            goto LABEL_133;
          case 1001:
            [(SGMIFeatureVector *)v4 feature:2004];
            v155 = v154 = v7;
            uint64_t v17 = [v155 stringArrayValue];

            v156 = [(SGMIFeatureVector *)v4 feature:2005];
            v39 = [v156 stringArrayValue];

            v157 = [(SGSqlEntityStore *)v4->_store naiveBayesModelQueryResultForFeature:1001 unigramTokens:v17 bigramTokens:v39];
            v158 = [SGMIFeature alloc];
            [v157 inferProbability];
            v160 = v159 = v9;
            v161 = v158;
            uint64_t v162 = 1001;
            goto LABEL_125;
          case 1002:
            [(SGMIFeatureVector *)v4 feature:2006];
            v163 = v154 = v7;
            uint64_t v17 = [v163 stringArrayValue];

            v164 = [(SGMIFeatureVector *)v4 feature:2007];
            v39 = [v164 stringArrayValue];

            v157 = [(SGSqlEntityStore *)v4->_store naiveBayesModelQueryResultForFeature:1002 unigramTokens:v17 bigramTokens:v39];
            v165 = [SGMIFeature alloc];
            [v157 inferProbability];
            v160 = v159 = v9;
            v161 = v165;
            uint64_t v162 = 1002;
LABEL_125:
            int64_t v10 = [(SGMIFeature *)v161 initWithFeatureName:v162 numberValue:v160];

            uint64_t v9 = v159;
            uint64_t v7 = v154;
            goto LABEL_138;
          case 1003:
            v166 = [(SGMIFeatureVector *)v4 feature:2001];
            uint64_t v17 = [v166 stringArrayValue];

            v39 = [(SGSqlEntityStore *)v4->_store naiveBayesModelQueryResultForFeature:1003 unigramTokens:v17 bigramTokens:MEMORY[0x1E4F1CBF0]];
            v167 = [SGMIFeature alloc];
            [v39 inferProbability];
            v169 = v168 = v9;
            int64_t v10 = [(SGMIFeature *)v167 initWithFeatureName:1003 numberValue:v169];

            uint64_t v9 = v168;
            goto LABEL_138;
          case 1004:
            v170 = [(SGMIFeatureVector *)v4 feature:2010];
            uint64_t v17 = [v170 stringValue];

            v171 = v4->_store;
            v271 = v17;
            v172 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v271 count:1];
            [(SGSqlEntityStore *)v171 naiveBayesModelQueryResultForFeature:1004 unigramTokens:v172 bigramTokens:MEMORY[0x1E4F1CBF0]];
            v21 = double v20 = v9;

            v173 = [SGMIFeature alloc];
            long long v23 = [v21 inferProbability];
            long long v24 = v173;
            uint64_t v25 = 1004;
            goto LABEL_133;
          case 1005:
            v174 = [(SGMIFeatureVector *)v4 feature:2011];
            uint64_t v17 = [v174 stringValue];

            v175 = v4->_store;
            v270 = v17;
            v176 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v270 count:1];
            [(SGSqlEntityStore *)v175 naiveBayesModelQueryResultForFeature:1005 unigramTokens:v176 bigramTokens:MEMORY[0x1E4F1CBF0]];
            v21 = double v20 = v9;

            v177 = [SGMIFeature alloc];
            long long v23 = [v21 inferProbability];
            long long v24 = v177;
            uint64_t v25 = 1005;
            goto LABEL_133;
          case 1006:
            [(SGMIFeatureVector *)v4 feature:2012];
            v179 = v178 = v7;
            uint64_t v17 = [v179 stringArrayValue];

            v180 = [(SGSqlEntityStore *)v4->_store naiveBayesModelQueryResultForFeature:1006 unigramTokens:v17 bigramTokens:MEMORY[0x1E4F1CBF0]];
            v181 = [SGMIFeature alloc];
            v182 = [v180 inferProbability];
            int64_t v10 = [(SGMIFeature *)v181 initWithFeatureName:1006 numberValue:v182];

            uint64_t v7 = v178;
            goto LABEL_227;
          case 1007:
            v183 = [(SGMIFeatureVector *)v4 feature:2015];
            uint64_t v17 = [v183 stringValue];

            v184 = v4->_store;
            v273 = v17;
            v185 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v273 count:1];
            [(SGSqlEntityStore *)v184 naiveBayesModelQueryResultForFeature:1007 unigramTokens:v185 bigramTokens:MEMORY[0x1E4F1CBF0]];
            v21 = double v20 = v9;

            v186 = [SGMIFeature alloc];
            long long v23 = [v21 inferProbability];
            long long v24 = v186;
            uint64_t v25 = 1007;
            goto LABEL_133;
          case 1008:
            v187 = [(SGMIFeatureVector *)v4 feature:2016];
            uint64_t v17 = [v187 stringValue];

            v188 = v4->_store;
            v274 = v17;
            v189 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v274 count:1];
            [(SGSqlEntityStore *)v188 naiveBayesModelQueryResultForFeature:1008 unigramTokens:v189 bigramTokens:MEMORY[0x1E4F1CBF0]];
            v21 = double v20 = v9;

            v190 = [SGMIFeature alloc];
            long long v23 = [v21 inferProbability];
            long long v24 = v190;
            uint64_t v25 = 1008;
            goto LABEL_133;
          default:
            goto LABEL_228;
        }
      }
      switch(a3)
      {
        case 0:
          v32 = [[SGMIFeature alloc] initWithFeatureName:0];
          goto LABEL_213;
        case 1:
          uint64_t v17 = [(SGMIFeatureVector *)v4 feature:2000];
          v191 = [SGMIFeature alloc];
          v192 = NSNumber;
          [(__CFString *)v17 stringValue];
          v21 = double v20 = v9;
          long long v23 = objc_msgSend(v192, "numberWithUnsignedInteger:", objc_msgSend(v21, "length"));
          long long v24 = v191;
          uint64_t v25 = 1;
LABEL_133:
          int64_t v10 = [(SGMIFeature *)v24 initWithFeatureName:v25 numberValue:v23];

          goto LABEL_134;
        case 2:
          uint64_t v17 = [(SGMIFeatureVector *)v4 feature:2001];
          v193 = [(__CFString *)v17 stringArrayValue];
          unint64_t v194 = [v193 count];

          unint64_t v195 = (v194 & 1) + (v194 >> 1);
          v196 = [SGMIFeature alloc];
          [NSNumber numberWithUnsignedInteger:v195];
          v21 = double v20 = v9;
          int64_t v10 = [(SGMIFeature *)v196 initWithFeatureName:2 numberValue:v21];
LABEL_134:

          uint64_t v9 = v20;
          goto LABEL_227;
        case 3:
          uint64_t v17 = [(SGMIFeatureVector *)v4 feature:2003];
          v197 = [(SGMailClientUtil *)v4->_mailClientUtil allVIPEmailAddresses];
          v198 = [(__CFString *)v17 stringValue];
          v199 = v9;
          uint64_t v200 = [v197 containsObject:v198];

          v201 = [SGMIFeature alloc];
          uint64_t v202 = v200;
          uint64_t v9 = v199;
          v39 = [NSNumber numberWithBool:v202];
          uint64_t v40 = [(SGMIFeature *)v201 initWithFeatureName:3 numberValue:v39];
LABEL_137:
          int64_t v10 = (SGMIFeature *)v40;
LABEL_138:

          goto LABEL_227;
        case 4:
          v81 = (void *)v8;
          v203 = objc_opt_new();
          v204 = v7;
          v7[2](v7);
          long long v256 = 0u;
          long long v257 = 0u;
          long long v254 = 0u;
          long long v255 = 0u;
          v205 = [(SGMessage *)v4->_mailMessage attachments];
          uint64_t v206 = [v205 countByEnumeratingWithState:&v254 objects:v268 count:16];
          if (v206)
          {
            uint64_t v207 = v206;
            uint64_t v208 = *(void *)v255;
            do
            {
              for (uint64_t i = 0; i != v207; ++i)
              {
                if (*(void *)v255 != v208) {
                  objc_enumerationMutation(v205);
                }
                v210 = *(void **)(*((void *)&v254 + 1) + 8 * i);
                if ([v210 isMediaMimeType]) {
                  objc_msgSend(v203, "bucketizeWithSize:", objc_msgSend(v210, "size"));
                }
              }
              uint64_t v207 = [v205 countByEnumeratingWithState:&v254 objects:v268 count:16];
            }
            while (v207);
          }

          v211 = [SGMIFeature alloc];
          v212 = [v203 numberArray];
          v213 = v211;
          uint64_t v214 = 4;
          goto LABEL_169;
        case 5:
          v81 = (void *)v8;
          v203 = objc_opt_new();
          v204 = v7;
          v7[2](v7);
          long long v260 = 0u;
          long long v261 = 0u;
          long long v258 = 0u;
          long long v259 = 0u;
          v215 = [(SGMessage *)v4->_mailMessage attachments];
          uint64_t v216 = [v215 countByEnumeratingWithState:&v258 objects:v269 count:16];
          if (v216)
          {
            uint64_t v217 = v216;
            uint64_t v218 = *(void *)v259;
            do
            {
              for (uint64_t j = 0; j != v217; ++j)
              {
                if (*(void *)v259 != v218) {
                  objc_enumerationMutation(v215);
                }
                v220 = *(void **)(*((void *)&v258 + 1) + 8 * j);
                if ([v220 isApplicationMimeType]) {
                  objc_msgSend(v203, "bucketizeWithSize:", objc_msgSend(v220, "size"));
                }
              }
              uint64_t v217 = [v215 countByEnumeratingWithState:&v258 objects:v269 count:16];
            }
            while (v217);
          }

          v221 = [SGMIFeature alloc];
          v212 = [v203 numberArray];
          v213 = v221;
          uint64_t v214 = 5;
          goto LABEL_169;
        case 6:
          v81 = (void *)v8;
          v203 = objc_opt_new();
          v204 = v7;
          v7[2](v7);
          long long v252 = 0u;
          long long v253 = 0u;
          long long v250 = 0u;
          long long v251 = 0u;
          v222 = [(SGMessage *)v4->_mailMessage attachments];
          uint64_t v223 = [v222 countByEnumeratingWithState:&v250 objects:v267 count:16];
          if (v223)
          {
            uint64_t v224 = v223;
            uint64_t v225 = *(void *)v251;
            do
            {
              for (uint64_t k = 0; k != v224; ++k)
              {
                if (*(void *)v251 != v225) {
                  objc_enumerationMutation(v222);
                }
                v227 = *(void **)(*((void *)&v250 + 1) + 8 * k);
                if ([v227 isOthersMimeType]) {
                  objc_msgSend(v203, "bucketizeWithSize:", objc_msgSend(v227, "size"));
                }
              }
              uint64_t v224 = [v222 countByEnumeratingWithState:&v250 objects:v267 count:16];
            }
            while (v224);
          }

          v228 = [SGMIFeature alloc];
          v212 = [v203 numberArray];
          v213 = v228;
          uint64_t v214 = 6;
LABEL_169:
          int64_t v10 = [(SGMIFeature *)v213 initWithFeatureName:v214 numberArrayValue:v212];

          uint64_t v7 = v204;
LABEL_170:
          uint64_t v9 = v81;
          goto LABEL_228;
        case 7:
          long long v15 = [SGMIFeature alloc];
          senderConnectionScore = v4->_senderConnectionScore;
          uint64_t v229 = 7;
          goto LABEL_212;
        case 8:
          mailMessage = v4->_mailMessage;
          if (mailMessage)
          {
            v231 = v7;
            v232 = [(SGMessage *)mailMessage date];

            if (v232)
            {
              v233 = NSNumber;
              v234 = [(SGMessage *)v4->_mailMessage date];
              [v234 timeIntervalSinceNow];
              uint64_t v17 = [v233 numberWithDouble:v235 / -86400.0];
            }
            else
            {
              uint64_t v17 = (__CFString *)&unk_1F25361E0;
            }
            uint64_t v7 = v231;
          }
          else
          {
            uint64_t v17 = (__CFString *)&unk_1F25361E0;
          }
          v122 = [SGMIFeature alloc];
          uint64_t v123 = 8;
LABEL_225:
          uint64_t v241 = [(SGMIFeature *)v122 initWithFeatureName:v123 numberValue:v17];
          goto LABEL_226;
        default:
          JUMPOUT(0);
      }
    }
    if (a3 <= 2999)
    {
      switch(a3)
      {
        case 2000:
          uint64_t v37 = [SGMIFeature alloc];
          v38 = v4->_mailMessage;
          if (!v38)
          {
            v32 = [(SGMIFeature *)v37 initWithFeatureName:2000 stringValue:&stru_1F24EEF20];
            goto LABEL_213;
          }
          uint64_t v17 = [(SGMessage *)v38 subject];
          if (v17)
          {
            v39 = [(SGMessage *)v4->_mailMessage subject];
            uint64_t v40 = [(SGMIFeature *)v37 initWithFeatureName:2000 stringValue:v39];
            goto LABEL_137;
          }
          v110 = &stru_1F24EEF20;
          v35 = v37;
          uint64_t v36 = 2000;
          goto LABEL_221;
        case 2001:
          v245 = (void *)v8;
          v247 = [(SGMIFeatureVector *)v4 feature:2000];
          int v41 = [v247 stringValue];
          v42 = +[SGTokenizer tokenize:v41];

          double v43 = objc_opt_new();
          if ((unint64_t)[v42 count] >= 2)
          {
            unint64_t v44 = 1;
            do
            {
              id v45 = [NSString alloc];
              uint64_t v46 = [v42 objectAtIndexedSubscript:v44 - 1];
              v47 = [v42 objectAtIndexedSubscript:v44];
              v48 = (void *)[v45 initWithFormat:@"%@_%@", v46, v47];
              [v43 addObject:v48];

              ++v44;
            }
            while ([v42 count] > v44);
          }
          v49 = [v42 arrayByAddingObjectsFromArray:v43];
          int64_t v10 = [[SGMIFeature alloc] initWithFeatureName:2001 stringArrayValue:v49];

          uint64_t v9 = v245;
          goto LABEL_228;
        case 2002:
        case 2008:
        case 2009:
        case 2013:
        case 2014:
          goto LABEL_228;
        case 2003:
        case 2010:
          long long v26 = v4->_mailMessage;
          if (v26)
          {
            v27 = v9;
            uint64_t v28 = [(SGSimpleMailMessage *)v26 from];

            if (v28)
            {
              v29 = [(SGSimpleMailMessage *)v4->_mailMessage from];
              v30 = [v29 emailAddress];
              v31 = [v30 lowercaseString];

              goto LABEL_179;
            }
          }
          else
          {
            v27 = v9;
          }
          v31 = @"nil@nil.invalid";
LABEL_179:
          [(SGMIFeatureVector *)v4 setFeatureToStringValue:v31 forName:2003];
          v236 = emailAddressDomain(v31);
          [(SGMIFeatureVector *)v4 setFeatureToStringValue:v236 forName:2010];
          features = v4->_features;
          v238 = [NSNumber numberWithInteger:a3];
          int64_t v10 = [(NSMutableDictionary *)features objectForKeyedSubscript:v238];

          uint64_t v9 = v27;
          goto LABEL_228;
        case 2004:
          v50 = v4->_mailMessage;
          if (v50)
          {
            v51 = [(SGSimpleMailMessage *)v50 to];

            if (v51)
            {
              v52 = [(SGSimpleMailMessage *)v4->_mailMessage to];
              objc_msgSend(v52, "_pas_mappedArrayWithTransform:", &__block_literal_global_28951);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

              v53 = [SGMIFeature alloc];
              v39 = [(__CFString *)v17 sortedArrayUsingSelector:sel_compare_];
              uint64_t v40 = [(SGMIFeature *)v53 initWithFeatureName:2004 stringArrayValue:v39];
              goto LABEL_137;
            }
          }
          v239 = [SGMIFeature alloc];
          v32 = [(SGMIFeature *)v239 initWithFeatureName:2004 stringArrayValue:MEMORY[0x1E4F1CBF0]];
          goto LABEL_213;
        case 2005:
          v244 = v7;
          v246 = (void *)v8;
          v243 = v4;
          v54 = [(SGMIFeatureVector *)v4 feature:2004];
          v55 = [v54 stringArrayValue];

          v56 = objc_opt_new();
          if ([v55 count])
          {
            uint64_t v57 = 0;
            uint64_t v58 = 1;
            do
            {
              unint64_t v248 = v57 + 1;
              if ([v55 count] > (unint64_t)(v57 + 1))
              {
                unint64_t v59 = v58;
                do
                {
                  id v60 = [NSString alloc];
                  v61 = [v55 objectAtIndexedSubscript:v57];
                  v62 = [v55 objectAtIndexedSubscript:v59];
                  double v63 = (void *)[v60 initWithFormat:@"%@_%@", v61, v62];
                  [v56 addObject:v63];

                  ++v59;
                }
                while ([v55 count] > v59);
              }
              ++v58;
              ++v57;
            }
            while ([v55 count] > v248);
          }
          v64 = [SGMIFeature alloc];
          uint64_t v65 = 2005;
          goto LABEL_51;
        case 2006:
          v66 = v7;
          v67 = v4->_mailMessage;
          if (v67
            && ([(SGSimpleMailMessage *)v67 cc],
                v68 = objc_claimAutoreleasedReturnValue(),
                v68,
                v68))
          {
            v69 = [(SGSimpleMailMessage *)v4->_mailMessage cc];
            v70 = objc_msgSend(v69, "_pas_mappedArrayWithTransform:", &__block_literal_global_69_28952);

            v71 = [SGMIFeature alloc];
            v72 = [v70 sortedArrayUsingSelector:sel_compare_];
            int64_t v10 = [(SGMIFeature *)v71 initWithFeatureName:2006 stringArrayValue:v72];
          }
          else
          {
            v240 = [SGMIFeature alloc];
            int64_t v10 = [(SGMIFeature *)v240 initWithFeatureName:2006 stringArrayValue:MEMORY[0x1E4F1CBF0]];
          }
LABEL_182:
          uint64_t v7 = v66;
          goto LABEL_228;
        case 2007:
          v244 = v7;
          v246 = (void *)v8;
          v243 = v4;
          v73 = [(SGMIFeatureVector *)v4 feature:2006];
          v55 = [v73 stringArrayValue];

          v56 = objc_opt_new();
          if ([v55 count])
          {
            uint64_t v74 = 0;
            uint64_t v75 = 1;
            do
            {
              unint64_t v249 = v74 + 1;
              if ([v55 count] > (unint64_t)(v74 + 1))
              {
                unint64_t v76 = v75;
                do
                {
                  id v77 = [NSString alloc];
                  v78 = [v55 objectAtIndexedSubscript:v74];
                  v79 = [v55 objectAtIndexedSubscript:v76];
                  v80 = (void *)[v77 initWithFormat:@"%@_%@", v78, v79];
                  [v56 addObject:v80];

                  ++v76;
                }
                while ([v55 count] > v76);
              }
              ++v75;
              ++v74;
            }
            while ([v55 count] > v249);
          }
          v64 = [SGMIFeature alloc];
          uint64_t v65 = 2007;
LABEL_51:
          int64_t v10 = [(SGMIFeature *)v64 initWithFeatureName:v65 stringArrayValue:v56];

          id v4 = v243;
          goto LABEL_193;
        case 2011:
          v81 = (void *)v8;
          v82 = [(SGMIFeatureVector *)v4 feature:2003];
          v83 = [v82 stringValue];

          v84 = [(SGMIFeatureVector *)v4 feature:2004];
          v85 = [v84 stringArrayValue];

          v86 = [(SGMIFeatureVector *)v4 feature:2006];
          v87 = [v86 stringArrayValue];

          v88 = @"<non_dyadic_conversation>";
          if ([v85 count] == 1 && !objc_msgSend(v87, "count")) {
            v88 = v83;
          }
          v89 = v88;
          int64_t v10 = [[SGMIFeature alloc] initWithFeatureName:2011 stringValue:v89];

          goto LABEL_170;
        case 2012:
          [(SGMIFeatureVector *)v4 feature:5];
          v91 = v90 = v7;
          uint64_t v17 = [v91 numberArrayValue];

          v92 = [(SGMIFeatureVector *)v4 feature:4];
          v39 = [v92 numberArrayValue];

          v93 = [(SGMIFeatureVector *)v4 feature:6];
          [v93 numberArrayValue];
          v95 = v94 = v9;

          v96 = objc_opt_new();
          __29__SGMIFeatureVector_feature___block_invoke_4(v17, @"App", v96);
          __29__SGMIFeatureVector_feature___block_invoke_4(v39, @"Media", v96);
          __29__SGMIFeatureVector_feature___block_invoke_4(v95, @"Others", v96);
          int64_t v10 = [[SGMIFeature alloc] initWithFeatureName:2012 stringArrayValue:v96];

          uint64_t v7 = v90;
          uint64_t v9 = v94;
          goto LABEL_138;
        case 2015:
          v244 = v7;
          v246 = (void *)v8;
          long long v264 = 0u;
          long long v265 = 0u;
          long long v262 = 0u;
          long long v263 = 0u;
          v97 = [(SGSimpleMailMessage *)v4->_mailMessage headers];
          uint64_t v98 = [v97 countByEnumeratingWithState:&v262 objects:v272 count:16];
          if (v98)
          {
            uint64_t v99 = v98;
            uint64_t v100 = *(void *)v263;
            v101 = &stru_1F24EEF20;
            do
            {
              for (uint64_t m = 0; m != v99; ++m)
              {
                if (*(void *)v263 != v100) {
                  objc_enumerationMutation(v97);
                }
                v103 = *(void **)(*((void *)&v262 + 1) + 8 * m);
                v104 = [v103 key];
                int v105 = [v104 isEqualToString:@"list-id"];

                if (v105)
                {
                  uint64_t v106 = [v103 value];

                  v101 = (__CFString *)v106;
                }
              }
              uint64_t v99 = [v97 countByEnumeratingWithState:&v262 objects:v272 count:16];
            }
            while (v99);
          }
          else
          {
            v101 = &stru_1F24EEF20;
          }

          int64_t v10 = [[SGMIFeature alloc] initWithFeatureName:2015 stringValue:v101];
LABEL_193:
          uint64_t v7 = v244;
          uint64_t v9 = v246;
          goto LABEL_228;
        case 2016:
          uint64_t v107 = [(SGMessage *)v4->_mailMessage mailConversationIdentifier];
          v108 = (void *)v107;
          v109 = &stru_1F24EEF20;
          if (v107) {
            v109 = (__CFString *)v107;
          }
          uint64_t v17 = v109;

          v35 = [SGMIFeature alloc];
          uint64_t v36 = 2016;
          goto LABEL_70;
        default:
          if (a3 == 2101)
          {
            if (v4->_mailMessage)
            {
              v7[2](v7);
              uint64_t v17 = [(SGSimpleMailMessage *)v4->_mailMessage textContent];
            }
            else
            {
              uint64_t v17 = 0;
            }
            v35 = [SGMIFeature alloc];
            if (v17) {
              v110 = v17;
            }
            else {
              v110 = &stru_1F24EEF20;
            }
            uint64_t v36 = 2101;
          }
          else
          {
            if (a3 != 2102) {
              goto LABEL_228;
            }
            id v33 = [(SGMIFeatureVector *)v4 feature:2101];
            v34 = [SGMIFeature alloc];
            uint64_t v17 = [(SGMessage *)v4->_mailMessage textContentLanguageIdentifier];
            v35 = v34;
            uint64_t v36 = 2102;
LABEL_70:
            v110 = v17;
          }
LABEL_221:
          uint64_t v241 = [(SGMIFeature *)v35 initWithFeatureName:v36 stringValue:v110];
          break;
      }
LABEL_226:
      int64_t v10 = (SGMIFeature *)v241;
LABEL_227:
    }
    else
    {
      switch(a3)
      {
        case 3000:
          biomeMessageSummary = v4->_biomeMessageSummary;
          if (biomeMessageSummary
            && [(SGMIBiomeReducedMessageEvents *)biomeMessageSummary messageViewCount])
          {
            long long v12 = v7;
            long long v13 = [SGMIFeature alloc];
            if ([(SGMIBiomeReducedMessageEvents *)v4->_biomeMessageSummary scrolledToEnd]) {
              senderConnectionScore = (NSNumber *)&unk_1F2536210;
            }
            else {
              senderConnectionScore = (NSNumber *)&unk_1F25361F8;
            }
            long long v15 = v13;
            uint64_t v7 = v12;
          }
          else
          {
            long long v15 = [SGMIFeature alloc];
            senderConnectionScore = (NSNumber *)MEMORY[0x1E4F1CC28];
          }
          uint64_t v229 = 3000;
          break;
        case 3001:
          v111 = v4->_biomeMessageSummary;
          v112 = [SGMIFeature alloc];
          if (v111)
          {
            if ([(SGMIBiomeReducedMessageEvents *)v4->_biomeMessageSummary userReplied]) {
              senderConnectionScore = (NSNumber *)&unk_1F2536210;
            }
            else {
              senderConnectionScore = (NSNumber *)&unk_1F25361F8;
            }
          }
          else
          {
            senderConnectionScore = (NSNumber *)MEMORY[0x1E4F1CC28];
          }
          long long v15 = v112;
          uint64_t v229 = 3001;
          break;
        case 3002:
          v113 = v4->_biomeMessageSummary;
          long long v15 = [SGMIFeature alloc];
          v114 = v15;
          if (v113)
          {
            v66 = v7;
            v115 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SGMIBiomeReducedMessageEvents numberOfMailsViewedBeforeSinceAvailable](v4->_biomeMessageSummary, "numberOfMailsViewedBeforeSinceAvailable"));
            v116 = v114;
            uint64_t v117 = 3002;
            goto LABEL_82;
          }
          senderConnectionScore = (NSNumber *)&unk_1F25361C8;
          uint64_t v229 = 3002;
          break;
        case 3003:
          v118 = v4->_biomeMessageSummary;
          if (v118 && [(SGMIBiomeReducedMessageEvents *)v118 messageViewCount])
          {
            v119 = v7;
            v120 = [SGMIFeature alloc];
            v121 = NSNumber;
            [(SGMIBiomeReducedMessageEvents *)v4->_biomeMessageSummary timeBeforeViewStartSinceAvailable];
            objc_msgSend(v121, "numberWithDouble:");
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v122 = v120;
            uint64_t v7 = v119;
            uint64_t v123 = 3003;
            goto LABEL_225;
          }
          long long v15 = [SGMIFeature alloc];
          senderConnectionScore = (NSNumber *)&unk_1F25361C8;
          uint64_t v229 = 3003;
          break;
        case 3004:
          v124 = v4->_biomeMessageSummary;
          long long v15 = [SGMIFeature alloc];
          v125 = v15;
          if (!v124)
          {
            senderConnectionScore = (NSNumber *)&unk_1F25361F8;
            uint64_t v229 = 3004;
            break;
          }
          v66 = v7;
          v115 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SGMIBiomeReducedMessageEvents messageViewCount](v4->_biomeMessageSummary, "messageViewCount"));
          v116 = v125;
          uint64_t v117 = 3004;
LABEL_82:
          int64_t v10 = [(SGMIFeature *)v116 initWithFeatureName:v117 numberValue:v115];

          goto LABEL_182;
        case 3005:
          v126 = v4->_biomeMessageSummary;
          if (v126 && [(SGMIBiomeReducedMessageEvents *)v126 messageViewCount])
          {
            v127 = v7;
            v128 = [SGMIFeature alloc];
            v129 = NSNumber;
            [(SGMIBiomeReducedMessageEvents *)v4->_biomeMessageSummary messageViewMaxDwellTime];
            objc_msgSend(v129, "numberWithDouble:");
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v122 = v128;
            uint64_t v7 = v127;
            uint64_t v123 = 3005;
            goto LABEL_225;
          }
          long long v15 = [SGMIFeature alloc];
          senderConnectionScore = (NSNumber *)&unk_1F25361C8;
          uint64_t v229 = 3005;
          break;
        case 3006:
          v130 = v4->_biomeMessageSummary;
          if (v130 && [(SGMIBiomeReducedMessageEvents *)v130 messageViewCount])
          {
            v131 = v7;
            v132 = [SGMIFeature alloc];
            v133 = NSNumber;
            [(SGMIBiomeReducedMessageEvents *)v4->_biomeMessageSummary messageViewTotalDwellTime];
            objc_msgSend(v133, "numberWithDouble:");
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v122 = v132;
            uint64_t v7 = v131;
            uint64_t v123 = 3006;
            goto LABEL_225;
          }
          long long v15 = [SGMIFeature alloc];
          senderConnectionScore = (NSNumber *)&unk_1F25361C8;
          uint64_t v229 = 3006;
          break;
        case 3007:
          v134 = v4->_biomeMessageSummary;
          if (v134 && [(SGMIBiomeReducedMessageEvents *)v134 messageViewCount])
          {
            v135 = v7;
            v136 = [SGMIFeature alloc];
            objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SGMIBiomeReducedMessageEvents numberOfUnreadMessageAtFirstViewTime](v4->_biomeMessageSummary, "numberOfUnreadMessageAtFirstViewTime"));
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v122 = v136;
            uint64_t v7 = v135;
            uint64_t v123 = 3007;
            goto LABEL_225;
          }
          long long v15 = [SGMIFeature alloc];
          senderConnectionScore = (NSNumber *)&unk_1F25361C8;
          uint64_t v229 = 3007;
          break;
        case 3008:
          v137 = v4->_biomeMessageSummary;
          if (v137 && [(SGMIBiomeReducedMessageEvents *)v137 messageViewCount])
          {
            v138 = v7;
            v139 = [SGMIFeature alloc];
            objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SGMIBiomeReducedMessageEvents numberOfMoreRecentUnreadMessageAtFirstViewTime](v4->_biomeMessageSummary, "numberOfMoreRecentUnreadMessageAtFirstViewTime"));
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v122 = v139;
            uint64_t v7 = v138;
            uint64_t v123 = 3008;
            goto LABEL_225;
          }
          long long v15 = [SGMIFeature alloc];
          senderConnectionScore = (NSNumber *)&unk_1F25361C8;
          uint64_t v229 = 3008;
          break;
        case 3009:
          v140 = v4->_biomeMessageSummary;
          v141 = [SGMIFeature alloc];
          if (v140)
          {
            if ([(SGMIBiomeReducedMessageEvents *)v4->_biomeMessageSummary markedAsRead]) {
              senderConnectionScore = (NSNumber *)&unk_1F2536210;
            }
            else {
              senderConnectionScore = (NSNumber *)&unk_1F25361F8;
            }
          }
          else
          {
            senderConnectionScore = (NSNumber *)MEMORY[0x1E4F1CC28];
          }
          long long v15 = v141;
          uint64_t v229 = 3009;
          break;
        case 3010:
          v142 = v4->_biomeMessageSummary;
          v143 = [SGMIFeature alloc];
          if (v142)
          {
            if ([(SGMIBiomeReducedMessageEvents *)v4->_biomeMessageSummary markedAsUnread]) {
              senderConnectionScore = (NSNumber *)&unk_1F2536210;
            }
            else {
              senderConnectionScore = (NSNumber *)&unk_1F25361F8;
            }
          }
          else
          {
            senderConnectionScore = (NSNumber *)MEMORY[0x1E4F1CC28];
          }
          long long v15 = v143;
          uint64_t v229 = 3010;
          break;
        case 3011:
          v144 = v4->_biomeMessageSummary;
          v145 = [SGMIFeature alloc];
          if (v144)
          {
            if ([(SGMIBiomeReducedMessageEvents *)v4->_biomeMessageSummary mailGotFlagged]) {
              senderConnectionScore = (NSNumber *)&unk_1F2536210;
            }
            else {
              senderConnectionScore = (NSNumber *)&unk_1F25361F8;
            }
          }
          else
          {
            senderConnectionScore = (NSNumber *)MEMORY[0x1E4F1CC28];
          }
          long long v15 = v145;
          uint64_t v229 = 3011;
          break;
        case 3012:
          v146 = v4->_biomeMessageSummary;
          v147 = [SGMIFeature alloc];
          if (v146)
          {
            if ([(SGMIBiomeReducedMessageEvents *)v4->_biomeMessageSummary replyDraftStarted]) {
              senderConnectionScore = (NSNumber *)&unk_1F2536210;
            }
            else {
              senderConnectionScore = (NSNumber *)&unk_1F25361F8;
            }
          }
          else
          {
            senderConnectionScore = (NSNumber *)MEMORY[0x1E4F1CC28];
          }
          long long v15 = v147;
          uint64_t v229 = 3012;
          break;
        case 3013:
          v148 = v4->_biomeMessageSummary;
          v149 = [SGMIFeature alloc];
          if (v148)
          {
            if ([(SGMIBiomeReducedMessageEvents *)v4->_biomeMessageSummary forwardDraftStarted]) {
              senderConnectionScore = (NSNumber *)&unk_1F2536210;
            }
            else {
              senderConnectionScore = (NSNumber *)&unk_1F25361F8;
            }
          }
          else
          {
            senderConnectionScore = (NSNumber *)MEMORY[0x1E4F1CC28];
          }
          long long v15 = v149;
          uint64_t v229 = 3013;
          break;
        case 3014:
          v150 = v4->_biomeMessageSummary;
          v151 = [SGMIFeature alloc];
          if (v150)
          {
            if ([(SGMIBiomeReducedMessageEvents *)v4->_biomeMessageSummary markedAsJunk]) {
              senderConnectionScore = (NSNumber *)&unk_1F2536210;
            }
            else {
              senderConnectionScore = (NSNumber *)&unk_1F25361F8;
            }
          }
          else
          {
            senderConnectionScore = (NSNumber *)MEMORY[0x1E4F1CC28];
          }
          long long v15 = v151;
          uint64_t v229 = 3014;
          break;
        case 3015:
          v152 = v4->_biomeMessageSummary;
          v153 = [SGMIFeature alloc];
          if (v152)
          {
            if ([(SGMIBiomeReducedMessageEvents *)v4->_biomeMessageSummary linkClicked]) {
              senderConnectionScore = (NSNumber *)&unk_1F2536210;
            }
            else {
              senderConnectionScore = (NSNumber *)&unk_1F25361F8;
            }
          }
          else
          {
            senderConnectionScore = (NSNumber *)MEMORY[0x1E4F1CC28];
          }
          long long v15 = v153;
          uint64_t v229 = 3015;
          break;
        default:
          goto LABEL_228;
      }
LABEL_212:
      v32 = [(SGMIFeature *)v15 initWithFeatureName:v229 numberValue:senderConnectionScore];
LABEL_213:
      int64_t v10 = v32;
    }
LABEL_228:
    [(NSMutableDictionary *)v4->_features setObject:v10 forKeyedSubscript:v9];
    id v6 = v10;
  }
  return v6;
}

void __29__SGMIFeatureVector_feature___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 56))
  {
    uint64_t v3 = *(void **)(v1 + 64);
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void **)(v1 + 64);
      *(void *)(v1 + 64) = v4;
    }
    else
    {
      uint64_t v6 = [*(id *)(v1 + 80) spotlightUniqueIdentifierForBundleIdentifier:*MEMORY[0x1E4F5DC28] messageId:*(void *)(v1 + 8)];
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v5 = *(void **)(v7 + 64);
      *(void *)(v7 + 64) = v6;
    }

    uint64_t v1 = *(void *)(a1 + 32);
    if (*(void *)(v1 + 64))
    {
      uint64_t v8 = +[SGMailClientUtil sharedInstance];
      uint64_t v9 = [v8 emailDaemon];
      uint64_t v36 = [v9 messageRepository];

      int64_t v10 = [v36 messageForSearchableItemIdentifier:*(void *)(*(void *)(a1 + 32) + 64)];
      long long v11 = [v10 result];

      long long v12 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
        *(_DWORD *)buf = 138740227;
        *(void *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEFAULT, "Follow Up. [SGMIFeatureVector] emMessage %{sensitive}@ loaded for messageId %@.", buf, 0x16u);
      }

      if (v11)
      {
        v35 = [MEMORY[0x1E4F60250] optionsWithRequestedRepresentationType:*MEMORY[0x1E4F5FCA0] networkUsage:0 includeSuggestions:2];
        dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v51 = __Block_byref_object_copy__28961;
        v52 = __Block_byref_object_dispose__28962;
        id v53 = 0;
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __29__SGMIFeatureVector_feature___block_invoke_44;
        v42[3] = &unk_1E65BB3B8;
        unint64_t v44 = buf;
        long long v15 = v14;
        double v43 = v15;
        id v16 = (id)[v11 requestRepresentationWithOptions:v35 completionHandler:v42];
        v34 = v15;
        dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
        uint64_t v17 = [*(id *)(*(void *)&buf[8] + 40) searchableItem];
        long long v18 = sgMailIntelligenceLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
          *(_DWORD *)uint64_t v46 = 138412546;
          *(void *)&v46[4] = v17;
          *(_WORD *)&v46[12] = 2112;
          *(void *)&v46[14] = v19;
          _os_log_impl(&dword_1CA650000, v18, OS_LOG_TYPE_DEFAULT, "Follow Up. [SGMIFeatureVector] searchableItem %@ loaded for messageId %@.", v46, 0x16u);
        }

        if (v17)
        {
          double v20 = [[SGSimpleMailMessage alloc] initWithSearchableItem:v17];
          uint64_t v21 = *(void *)(a1 + 32);
          v22 = *(void **)(v21 + 16);
          *(void *)(v21 + 16) = v20;

          *(void *)uint64_t v46 = 0;
          *(void *)&v46[8] = v46;
          *(void *)&v46[16] = 0x3032000000;
          v47 = __Block_byref_object_copy__28961;
          v48 = __Block_byref_object_dispose__28962;
          id v49 = 0;
          id v49 = (id)objc_opt_new();
          long long v23 = [*(id *)(*(void *)&buf[8] + 40) relatedContentItems];
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __29__SGMIFeatureVector_feature___block_invoke_47;
          v41[3] = &unk_1E65BB3E0;
          v41[4] = v46;
          [v23 enumerateObjectsUsingBlock:v41];

          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v24 = [*(id *)(*(void *)(a1 + 32) + 16) attachments];
          uint64_t v25 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v25)
          {
            uint64_t v26 = *(void *)v38;
            do
            {
              for (uint64_t i = 0; i != v25; ++i)
              {
                if (*(void *)v38 != v26) {
                  objc_enumerationMutation(v24);
                }
                uint64_t v28 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                v29 = *(void **)(*(void *)&v46[8] + 40);
                v30 = [v28 filename];
                v31 = [v29 objectForKeyedSubscript:v30];
                objc_msgSend(v28, "setSize:", objc_msgSend(v31, "integerValue"));
              }
              uint64_t v25 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
            }
            while (v25);
          }

          _Block_object_dispose(v46, 8);
        }
        else
        {
          v32 = sgMailIntelligenceLogHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
          {
            uint64_t v33 = *(void *)(*(void *)(a1 + 32) + 8);
            *(_DWORD *)uint64_t v46 = 138412290;
            *(void *)&v46[4] = v33;
            _os_log_fault_impl(&dword_1CA650000, v32, OS_LOG_TYPE_FAULT, "Error accessing the searchable item associated with messageId: %@", v46, 0xCu);
          }
        }
        _Block_object_dispose(buf, 8);
      }
      uint64_t v1 = *(void *)(a1 + 32);
    }
  }
  *(unsigned char *)(v1 + 56) = 1;
}

void __29__SGMIFeatureVector_feature___block_invoke_4(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__28961;
  v14[4] = __Block_byref_object_dispose__28962;
  id v15 = 0;
  id v15 = +[SGMIAttachmentSizeHistogram bucketsNames];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __29__SGMIFeatureVector_feature___block_invoke_5;
  v10[3] = &unk_1E65BB428;
  id v8 = v7;
  id v11 = v8;
  id v9 = v6;
  id v12 = v9;
  uint64_t v13 = v14;
  [v5 enumerateObjectsUsingBlock:v10];

  _Block_object_dispose(v14, 8);
}

void __29__SGMIFeatureVector_feature___block_invoke_5(void *a1, void *a2, uint64_t a3)
{
  id v17 = a2;
  int v5 = [v17 intValue];
  if ((v5 - 5) < 5)
  {
    id v12 = (void *)a1[4];
    id v13 = [NSString alloc];
    uint64_t v14 = a1[5];
    uint64_t v15 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectAtIndexedSubscript:a3];
    id v9 = (void *)v15;
    id v16 = @"5to9";
LABEL_5:
    int64_t v10 = (void *)[v13 initWithFormat:@"%@-size%@-count%@", v14, v15, v16];
    [v12 addObject:v10];
    goto LABEL_6;
  }
  if ((v5 - 1) < 4)
  {
    id v6 = (void *)a1[4];
    id v7 = [NSString alloc];
    uint64_t v8 = a1[5];
    id v9 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectAtIndexedSubscript:a3];
    int64_t v10 = [v17 stringValue];
    id v11 = (void *)[v7 initWithFormat:@"%@-size%@-count%@", v8, v9, v10];
    [v6 addObject:v11];

LABEL_6:
    goto LABEL_7;
  }
  if (v5)
  {
    id v12 = (void *)a1[4];
    id v13 = [NSString alloc];
    uint64_t v14 = a1[5];
    uint64_t v15 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectAtIndexedSubscript:a3];
    id v9 = (void *)v15;
    id v16 = @"10+";
    goto LABEL_5;
  }
LABEL_7:
}

id __29__SGMIFeatureVector_feature___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 emailAddress];
  uint64_t v3 = [v2 lowercaseString];

  return v3;
}

id __29__SGMIFeatureVector_feature___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 emailAddress];
  uint64_t v3 = [v2 lowercaseString];

  return v3;
}

void __29__SGMIFeatureVector_feature___block_invoke_44(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __29__SGMIFeatureVector_feature___block_invoke_47(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 displayName];

  if (v3)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "dataTransferByteCount"));
    int v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v6 = [v7 displayName];
    [v5 setObject:v4 forKeyedSubscript:v6];
  }
}

- (id)cachedFeature:(int64_t)a3
{
  features = self->_features;
  id v4 = [NSNumber numberWithInteger:a3];
  int v5 = [(NSMutableDictionary *)features objectForKeyedSubscript:v4];

  return v5;
}

- (id)features
{
  return (id)[(NSMutableDictionary *)self->_features allValues];
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  id v4 = (void *)[[NSString alloc] initWithFormat:@"FeatureVector for messageId %@: (%ld features)", self->_messageId, -[NSMutableDictionary count](self->_features, "count")];
  [v3 appendString:v4];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v5 = [(NSMutableDictionary *)self->_features allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        int64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [NSString alloc];
        id v12 = [v10 description];
        id v13 = (void *)[v11 initWithFormat:@"\n%@", v12];
        [v3 appendString:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)flatVectorForFeatureNames:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    SEL v23 = a2;
    int64_t v10 = 0;
    uint64_t v11 = *(void *)v25;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        id v13 = v10;
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = [*(id *)(*((void *)&v24 + 1) + 8 * i) integerValue];
        int64_t v15 = +[SGMIFeature featureTypeForName:v14];
        if ((unint64_t)(v15 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v22 = [MEMORY[0x1E4F28B00] currentHandler];
          [v22 handleFailureInMethod:v23, self, @"SGMIFeatureVector.m", 210, @"Invalid parameter not satisfying: %@", @"featureType == SGMIFeatureType_Number || featureType == SGMIFeatureType_NumberArray" object file lineNumber description];
        }
        int64_t v10 = [(SGMIFeatureVector *)self feature:v14];

        if (!v10) {
          goto LABEL_12;
        }
        if (v15 == 1)
        {
          long long v16 = [v10 numberValue];

          if (v16)
          {
            long long v17 = NSNumber;
            long long v18 = [v10 numberValue];
            [v18 doubleValue];
            uint64_t v19 = objc_msgSend(v17, "numberWithDouble:");
            [v6 addObject:v19];

            continue;
          }
LABEL_12:
          [v6 addObject:&unk_1F25361F8];
          continue;
        }
        uint64_t v20 = [v10 numberArrayValue];
        [v6 addObjectsFromArray:v20];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (!v9)
      {

        break;
      }
    }
  }

  return v6;
}

- (SGMIFeatureVector)initWithMessageId:(id)a3 hasHashedMessageId:(BOOL)a4 simpleMailMessage:(id)a5 senderConnectionScore:(id)a6 biomeMessageSummary:(id)a7 store:(id)a8 preLoadedFeatureNames:(id)a9
{
  BOOL v13 = a4;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a3;
  v22 = +[SGMailClientUtil sharedInstance];
  SEL v23 = [(SGMIFeatureVector *)self initWithMessageId:v21 hasHashedMessageId:v13 simpleMailMessage:v20 senderConnectionScore:v19 biomeMessageSummary:v18 mailClientUtil:v22 store:v17 preLoadedFeatureNames:v16];

  return v23;
}

- (SGMIFeatureVector)initWithMessageId:(id)a3 hasHashedMessageId:(BOOL)a4 simpleMailMessage:(id)a5 senderConnectionScore:(id)a6 biomeMessageSummary:(id)a7 mailClientUtil:(id)a8 store:(id)a9 preLoadedFeatureNames:(id)a10
{
  return [(SGMIFeatureVector *)self initWithMessageId:a3 hasHashedMessageId:a4 simpleMailMessage:a5 spotlightIdentifier:0 senderConnectionScore:a6 biomeMessageSummary:a7 mailClientUtil:a8 store:a9 preLoadedFeatureNames:a10];
}

- (SGMIFeatureVector)initWithMessageId:(id)a3 hasHashedMessageId:(BOOL)a4 simpleMailMessage:(id)a5 spotlightIdentifier:(id)a6 senderConnectionScore:(id)a7 biomeMessageSummary:(id)a8 store:(id)a9 preLoadedFeatureNames:(id)a10
{
  BOOL v14 = a4;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a3;
  long long v24 = +[SGMailClientUtil sharedInstance];
  long long v25 = [(SGMIFeatureVector *)self initWithMessageId:v23 hasHashedMessageId:v14 simpleMailMessage:v22 spotlightIdentifier:v21 senderConnectionScore:v20 biomeMessageSummary:v19 mailClientUtil:v24 store:v18 preLoadedFeatureNames:v17];

  return v25;
}

- (SGMIFeatureVector)initWithMessageId:(id)a3 hasHashedMessageId:(BOOL)a4 simpleMailMessage:(id)a5 spotlightIdentifier:(id)a6 senderConnectionScore:(id)a7 biomeMessageSummary:(id)a8 mailClientUtil:(id)a9 store:(id)a10 preLoadedFeatureNames:(id)a11
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  id v32 = a8;
  id v31 = a9;
  id v30 = a10;
  id v18 = a11;
  v41.receiver = self;
  v41.super_class = (Class)SGMIFeatureVector;
  id v19 = [(SGMIFeatureVector *)&v41 init];
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_messageId, a3);
    v20->_hasHashedMessageId = a4;
    objc_storeStrong((id *)&v20->_mailMessage, a5);
    uint64_t v21 = objc_opt_new();
    features = v20->_features;
    v20->_features = (NSMutableDictionary *)v21;

    objc_storeStrong((id *)&v20->_store, a10);
    objc_storeStrong((id *)&v20->_mailClientUtil, a9);
    objc_storeStrong((id *)&v20->_biomeMessageSummary, a8);
    objc_storeStrong((id *)&v20->_senderConnectionScore, a7);
    v20->_filledWithInformationRetrievedThroughMaild = 0;
    objc_storeStrong((id *)&v20->_spotlightIdentifier, a6);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v23 = v18;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v38 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = -[SGMIFeatureVector feature:](v20, "feature:", [*(id *)(*((void *)&v37 + 1) + 8 * i) integerValue]);
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v25);
    }
  }
  return v20;
}

@end