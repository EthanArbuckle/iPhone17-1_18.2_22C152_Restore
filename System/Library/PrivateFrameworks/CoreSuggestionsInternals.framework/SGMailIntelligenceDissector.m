@interface SGMailIntelligenceDissector
+ (float)computeContactConnectionScoreFromEmailAddress:(id)a3 usingEntityStore:(id)a4;
+ (id)getContactIdentifierForEmail:(id)a3 usingEntityStore:(id)a4;
- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5;
@end

@implementation SGMailIntelligenceDissector

+ (id)getContactIdentifierForEmail:(id)a3 usingEntityStore:(id)a4
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v8 = +[SGContactStoreFactory contactStore];
  uint64_t v9 = *MEMORY[0x1E4F1ADC8];
  v28[0] = *MEMORY[0x1E4F1AE08];
  v28[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  id v27 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __77__SGMailIntelligenceDissector_getContactIdentifierForEmail_usingEntityStore___block_invoke;
  v25[3] = &unk_1E65BE608;
  id v11 = v7;
  id v26 = v11;
  +[SGContactsInterface enumerateContactsMatchingEmailAddress:v5 withKeysToFetch:v10 usingContactStore:v8 error:&v27 usingBlock:v25];
  id v12 = v27;

  if ([v11 count])
  {
    v13 = [v11 firstObject];
    v14 = [v13 identifier];
  }
  else
  {
    v13 = [v6 suggestContactMatchesByEmailAddress:v5 isMaybe:0 onlySignificant:0];
    char v24 = 0;
    if ([v13 count])
    {
      id v22 = v12;
      uint64_t v16 = 0;
      while (1)
      {
        v17 = [v13 objectAtIndexedSubscript:v16];
        v18 = [v17 contact];
        v19 = [v18 recordId];
        v20 = [v6 cnContactMatchesForRecordId:v19 found:&v24];

        if ([v20 count]) {
          break;
        }

        if (++v16 >= (unint64_t)[v13 count])
        {
          v14 = 0;
          id v12 = v22;
          goto LABEL_3;
        }
      }
      v21 = sgMailIntelligenceLogHandle();
      id v12 = v22;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA650000, v21, OS_LOG_TYPE_DEFAULT, "SGMailIntelligenceDissector: Fuzzy contact match succeeded.", buf, 2u);
      }

      v14 = [v20 firstObject];
    }
    else
    {
      v14 = 0;
    }
  }
LABEL_3:

  return v14;
}

uint64_t __77__SGMailIntelligenceDissector_getContactIdentifierForEmail_usingEntityStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (float)computeContactConnectionScoreFromEmailAddress:(id)a3 usingEntityStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v28 = 0;
    _os_log_debug_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEBUG, "SGMailIntelligenceDissector: Searching for contact matching provided e-mail address.", v28, 2u);
  }

  uint64_t v9 = [v6 emailAddress];
  v10 = [a1 getContactIdentifierForEmail:v9 usingEntityStore:v7];

  if (v10)
  {
    id v11 = objc_opt_new();
    id v12 = (void *)MEMORY[0x1CB79B230]();
    v13 = (void *)MEMORY[0x1CB79B230]();
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F2536360, &unk_1F2536378, &unk_1F2536390, &unk_1F25363A8, &unk_1F25363C0, 0);
    v15 = (void *)[v14 mutableCopy];

    uint64_t v16 = (void *)MEMORY[0x1CB79B230]();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObject:v10];
    v18 = (void *)MEMORY[0x1CB79B230]();
    v19 = [MEMORY[0x1E4F1C9C8] now];
    v20 = [v11 computeContactPriorsForContactIdentifiers:v17 withTimeConstant:259200 withInteractionMechanisms:v15 asOf:v19 overLookbackOf:28];

    v21 = [v20 objectForKey:v10];

    if (v21)
    {
      id v22 = [v20 objectForKeyedSubscript:v10];
      [v22 priorScore];
      float v24 = v23;
    }
    else
    {
      id v22 = sgMailIntelligenceLogHandle();
      float v24 = 0.0;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v26 = 0;
        _os_log_impl(&dword_1CA650000, v22, OS_LOG_TYPE_DEFAULT, "SGMailIntelligenceDissector: No interactions with contact found.", v26, 2u);
      }
    }
  }
  else
  {
    id v11 = sgMailIntelligenceLogHandle();
    float v24 = 0.0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEFAULT, "SGMailIntelligenceDissector: Could not map e-mail address to contact.", buf, 2u);
    }
  }

  return v24;
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a5 serviceContext];
  v8 = [v7 store];

  if (+[SGMIEnablementConfig detectSalientMails])
  {
    uint64_t v9 = [v6 messageId];

    v10 = sgMailIntelligenceLogHandle();
    id v11 = v10;
    if (v9)
    {
      os_signpost_id_t v12 = os_signpost_id_generate(v10);

      v13 = sgMailIntelligenceLogHandle();
      v14 = v13;
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA650000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Dissector.SocialConnectionScore", " enableTelemetry=YES ", buf, 2u);
      }

      id v11 = [v6 from];
      if (v11)
      {
        [(id)objc_opt_class() computeContactConnectionScoreFromEmailAddress:v11 usingEntityStore:v8];
        float v16 = v15;
      }
      else
      {
        float v16 = 0.0;
      }
      v17 = sgMailIntelligenceLogHandle();
      v18 = v17;
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA650000, v18, OS_SIGNPOST_INTERVAL_END, v12, "Dissector.SocialConnectionScore", " enableTelemetry=YES ", buf, 2u);
      }

      v19 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v35 = v16;
        _os_log_impl(&dword_1CA650000, v19, OS_LOG_TYPE_DEFAULT, "SGMailIntelligenceDissector: computed sender connection score of %f", buf, 0xCu);
      }

      v20 = [v6 messageId];
      v21 = [v6 spotlightBundleIdentifier];
      id v22 = [v6 spotlightDomainIdentifier];
      float v23 = [v6 spotlightUniqueIdentifier];
      [v8 commitSpotlightMapping:v20 bundleIdentifier:v21 domainIdentifier:v22 uniqueIdentifier:v23];

      float v24 = sgMailIntelligenceLogHandle();
      os_signpost_id_t v25 = os_signpost_id_generate(v24);

      id v26 = sgMailIntelligenceLogHandle();
      id v27 = v26;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA650000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "Dissector.SaliencyScore", " enableTelemetry=YES ", buf, 2u);
      }

      *(float *)&double v28 = v16;
      v29 = [NSNumber numberWithFloat:v28];
      uint64_t v33 = 0;
      id v30 = +[SGMISaliencyAnalyzer analyzeSimpleMailMessage:v6 senderConnectionScore:v29 store:v8 logOrStageSaliency:1 commitSaliency:1 error:&v33];

      v31 = sgMailIntelligenceLogHandle();
      v32 = v31;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA650000, v32, OS_SIGNPOST_INTERVAL_END, v25, "Dissector.SaliencyScore", " enableTelemetry=YES ", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEBUG, "SGMailIntelligenceDissector: a nil message ID, skipping", buf, 2u);
    }
  }
  else
  {
    id v11 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEFAULT, "SGMailIntelligenceDissector: Mail saliency inference is off", buf, 2u);
    }
  }
}

@end