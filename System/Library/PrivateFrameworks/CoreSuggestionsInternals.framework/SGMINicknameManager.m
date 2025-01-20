@interface SGMINicknameManager
+ (void)lookForNicknamesInSentMailsAndStore:(id)a3 shouldContinue:(id)a4;
@end

@implementation SGMINicknameManager

+ (void)lookForNicknamesInSentMailsAndStore:(id)a3 shouldContinue:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (uint64_t (**)(void))a4;
  v22 = +[SGMIConfig defaultConfig];
  v23 = [v22 objectForKeyedSubscript:@"en"];
  v7 = [v5 sgmiFeatureStore];
  v8 = [v7 getNSDateForKey:@"lastSGMINicknameProcessingDate"];

  v21 = v8;
  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-10368000.0];
  }
  v20 = v9;
  [v9 timeIntervalSinceNow];
  unint64_t v11 = (unint64_t)fmax(v10 / -86400.0 + 1.0, 0.0);
  if (v11)
  {
    while (1)
    {
      v12 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v30 = v11;
        _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEFAULT, "SGMINicknameManager: Processing mails sent %tu days ago", buf, 0xCu);
      }

      unint64_t v13 = v11 - 1;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __74__SGMINicknameManager_lookForNicknamesInSentMailsAndStore_shouldContinue___block_invoke;
      v24[3] = &unk_1E65BB220;
      id v25 = v23;
      unint64_t v28 = v11;
      id v14 = v5;
      id v26 = v14;
      v15 = v6;
      id v27 = v15;
      +[SGMISpotlightUtility querySentMailsForNicknameMatchingFromDaysAgo:v11 throughDaysAgo:v11 - 1 limit:100 handler:v24];
      v16 = [v14 sgmiFeatureStore];
      v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)v11 * 24.0 * -3600.0];
      [v16 setNSDate:v17 forKey:@"lastSGMINicknameProcessingDate"];

      if ((v6[2](v15) & 1) == 0) {
        break;
      }

      --v11;
      if (!v13) {
        goto LABEL_13;
      }
    }
    v18 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v30 = v11;
      _os_log_impl(&dword_1CA650000, v18, OS_LOG_TYPE_DEFAULT, "SGMINicknameManager received signal to not continue after processing mails sent %tu days ago", buf, 0xCu);
    }
  }
LABEL_13:
  v19 = [v5 sgmiFeatureStore];
  [v19 purgeOldNicknameMappingRecords];
}

void __74__SGMINicknameManager_lookForNicknamesInSentMailsAndStore_shouldContinue___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = [v5 attributeSet];
  uint64_t v7 = [v6 attributeForKey:*MEMORY[0x1E4F233C8]];
  v8 = (void *)v7;
  id v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v7) {
    double v10 = (void *)v7;
  }
  else {
    double v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v11 = v10;

  v12 = [v5 attributeSet];
  uint64_t v13 = [v12 attributeForKey:*MEMORY[0x1E4F22A38]];
  id v14 = (void *)v13;
  if (v13) {
    v15 = (void *)v13;
  }
  else {
    v15 = v9;
  }
  id v16 = v15;

  v17 = [v5 attributeSet];
  v18 = [v17 attributeForKey:*MEMORY[0x1E4F23598]];

  v19 = [v5 attributeSet];

  v20 = [v19 contentCreationDate];

  if (v20 && v18 && [v11 count] == 1 && !objc_msgSend(v16, "count"))
  {
    v21 = objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:options:range:", @" ", @"\n", 2, 0, objc_msgSend(v18, "length"));

    v22 = [*(id *)(a1 + 32) nickname];
    v23 = [v22 body];
    v24 = [v23 matchForString:v21];

    if (v24)
    {
      uint64_t v25 = [v24 coreRange];
      id v27 = objc_msgSend(v21, "substringWithRange:", v25, v26);
      unint64_t v28 = [v11 firstObject];
      v29 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = *(void *)(a1 + 56);
        int v32 = 134218499;
        uint64_t v33 = v30;
        __int16 v34 = 2117;
        v35 = v27;
        __int16 v36 = 2117;
        v37 = v28;
        _os_log_impl(&dword_1CA650000, v29, OS_LOG_TYPE_DEFAULT, "SGMINicknameManager: A match got identified in a mail from ~%tu days ago: %{sensitive}@ -> %{sensitive}@.", (uint8_t *)&v32, 0x20u);
      }

      uint64_t v31 = [*(id *)(a1 + 40) sgmiFeatureStore];
      [v31 recordMappingFromNickname:v27 toEmailAddress:v28 withDateOfMatch:v20];
    }
  }
  else
  {
    v21 = v18;
  }
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))() & 1) == 0) {
    *a3 = 1;
  }
}

@end