@interface SGMIFeatureVectorCollator
- (SGMIFeatureVectorCollator)initWithMessagesFromDaysAgo:(unint64_t)a3 throughDaysAgo:(unint64_t)a4 limit:(unint64_t)a5 withBiomeData:(BOOL)a6 store:(id)a7 useSpotlightDataForMissingBiomeData:(BOOL)a8 preLoadedFeatureNames:(id)a9;
- (SGMIFeatureVectorCollator)initWithMessagesFromDaysAgo:(unint64_t)a3 throughDaysAgo:(unint64_t)a4 limit:(unint64_t)a5 withBiomeData:(BOOL)a6 store:(id)a7 useSpotlightDataForMissingBiomeData:(BOOL)a8 preLoadedFeatureNames:(id)a9 simulatedCSSIs:(id)a10;
- (void)forEach:(id)a3;
@end

@implementation SGMIFeatureVectorCollator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatedCSSIs, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_featureNames, 0);
}

- (void)forEach:(id)a3
{
  id v4 = a3;
  if (self->_withBiomeData)
  {
    v5 = +[SGMIBiomeUtility summarizeStreamByMessageStartingFromDaysAgo:self->_startInDaysAgo];
    v6 = [v5 biomeSummaryByMessage];
    v7 = [v5 biomeMessageIdByPersistentId];
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self->_store;
  BOOL useSpotlightDataForMissingBiomeData = self->_useSpotlightDataForMissingBiomeData;
  v10 = self->_featureNames;
  BOOL v11 = self->_simulatedCSSIs != 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __37__SGMIFeatureVectorCollator_forEach___block_invoke;
  v18[3] = &unk_1E65BB7E0;
  BOOL v25 = v11;
  v12 = v8;
  v19 = v12;
  id v13 = v7;
  id v20 = v13;
  v24 = v27;
  id v14 = v6;
  id v21 = v14;
  v15 = v10;
  v22 = v15;
  BOOL v26 = useSpotlightDataForMissingBiomeData;
  id v16 = v4;
  id v23 = v16;
  v17 = (void *)MEMORY[0x1CB79B4C0](v18);
  +[SGMISpotlightUtility queryFromDaysAgo:self->_startInDaysAgo throughDaysAgo:self->_endInDaysAgo limit:self->_limit withError:0 simulatedCSSIs:self->_simulatedCSSIs handler:v17];

  _Block_object_dispose(v27, 8);
}

void __37__SGMIFeatureVectorCollator_forEach___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = [[SGSimpleMailMessage alloc] initWithSearchableItem:v5];
  v7 = v6;
  if (!*(unsigned char *)(a1 + 80))
  {
    v8 = *(void **)(a1 + 32);
    v9 = [(SGSimpleMailMessage *)v6 spotlightBundleIdentifier];
    v10 = [(SGSimpleMailMessage *)v7 spotlightUniqueIdentifier];
    BOOL v11 = [v8 messageIdForBundleIdentifier:v9 uniqueIdentifier:v10];

    if (v11)
    {
      v12 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v11;
        id v13 = "SGMIFeatureVectorCollator: message ID %@ was mapped via spotlight mapping table.";
LABEL_29:
        _os_log_debug_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEBUG, v13, buf, 0xCu);
      }
    }
    else
    {
      id v14 = *(void **)(a1 + 40);
      v15 = [(SGSimpleMailMessage *)v7 spotlightUniqueIdentifier];
      BOOL v11 = [v14 objectForKeyedSubscript:v15];

      if (!v11)
      {
        BOOL v11 = [(SGSimpleMailMessage *)v7 spotlightUniqueIdentifier];
        char v28 = sgMailIntelligenceLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v11;
          _os_log_debug_impl(&dword_1CA650000, v28, OS_LOG_TYPE_DEBUG, "SGMIFeatureVectorCollator: No mapping found, creating SGSimpleMailMessage with hashed message ID: %@", buf, 0xCu);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
        goto LABEL_8;
      }
      v12 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v11;
        id v13 = "SGMIFeatureVectorCollator: message ID %@ was mapped with Biome stream.";
        goto LABEL_29;
      }
    }

LABEL_8:
    [(SGSimpleMailMessage *)v7 setMessageId:v11];
  }
  id v16 = [SGMIFeatureVector alloc];
  v17 = [(SGSimpleMailMessage *)v7 messageId];
  uint64_t v18 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  v19 = *(void **)(a1 + 48);
  id v20 = [(SGSimpleMailMessage *)v7 messageId];
  id v21 = [v19 objectForKeyedSubscript:v20];
  v22 = [(SGMIFeatureVector *)v16 initWithMessageId:v17 hasHashedMessageId:v18 simpleMailMessage:v7 senderConnectionScore:&unk_1F25361C8 biomeMessageSummary:v21 store:*(void *)(a1 + 32) preLoadedFeatureNames:*(void *)(a1 + 56)];

  if (*(unsigned char *)(a1 + 81))
  {
    id v23 = [v5 attributeSet];
    v24 = [v23 attributeForKey:@"com_apple_mail_repliedTo"];
    int v25 = [v24 isEqual:&unk_1F2536300];

    if (v25)
    {
      BOOL v26 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v29 = *(void **)(a1 + 48);
        v37 = [(SGSimpleMailMessage *)v7 messageId];
        objc_msgSend(v29, "objectForKeyedSubscript:");
        v36 = v30 = @" not";
        if (v36) {
          v31 = &stru_1F24EEF20;
        }
        else {
          v31 = @" not";
        }
        v32 = *(void **)(a1 + 48);
        v33 = [(SGSimpleMailMessage *)v7 messageId];
        v34 = [v32 objectForKeyedSubscript:v33];
        if (v34)
        {
          v35 = [(SGMIFeatureVector *)v22 cachedFeature:3001];
          if (v35) {
            v30 = &stru_1F24EEF20;
          }
        }
        *(_DWORD *)buf = 138412546;
        v39 = v31;
        __int16 v40 = 2112;
        v41 = v30;
        _os_log_debug_impl(&dword_1CA650000, v26, OS_LOG_TYPE_DEBUG, "SGMIFeatureVectorCollator: Use the CSSI's repliedTo attribute to set the UserReplied feature, biome information was%@ available and UserReplied was%@ already set.", buf, 0x16u);
        if (v34) {
      }
        }
      v27 = [NSNumber numberWithBool:1];
      [(SGMIFeatureVector *)v22 setFeatureToNumberValue:v27 forName:3001];
    }
  }
  buf[0] = 0;
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  if (buf[0]) {
    *a3 = 1;
  }
}

- (SGMIFeatureVectorCollator)initWithMessagesFromDaysAgo:(unint64_t)a3 throughDaysAgo:(unint64_t)a4 limit:(unint64_t)a5 withBiomeData:(BOOL)a6 store:(id)a7 useSpotlightDataForMissingBiomeData:(BOOL)a8 preLoadedFeatureNames:(id)a9 simulatedCSSIs:(id)a10
{
  id v22 = a7;
  id v16 = a9;
  id v17 = a10;
  v23.receiver = self;
  v23.super_class = (Class)SGMIFeatureVectorCollator;
  uint64_t v18 = [(SGMIFeatureVectorCollator *)&v23 init];
  v19 = v18;
  if (v18)
  {
    v18->_startInDaysAgo = a3;
    v18->_endInDaysAgo = a4;
    v18->_limit = a5;
    v18->_withBiomeData = a6;
    objc_storeStrong((id *)&v18->_store, a7);
    v19->_BOOL useSpotlightDataForMissingBiomeData = a8;
    objc_storeStrong((id *)&v19->_featureNames, a9);
    objc_storeStrong((id *)&v19->_simulatedCSSIs, a10);
  }

  return v19;
}

- (SGMIFeatureVectorCollator)initWithMessagesFromDaysAgo:(unint64_t)a3 throughDaysAgo:(unint64_t)a4 limit:(unint64_t)a5 withBiomeData:(BOOL)a6 store:(id)a7 useSpotlightDataForMissingBiomeData:(BOOL)a8 preLoadedFeatureNames:(id)a9
{
  return [(SGMIFeatureVectorCollator *)self initWithMessagesFromDaysAgo:a3 throughDaysAgo:a4 limit:a5 withBiomeData:a6 store:a7 useSpotlightDataForMissingBiomeData:a8 preLoadedFeatureNames:a9 simulatedCSSIs:0];
}

@end