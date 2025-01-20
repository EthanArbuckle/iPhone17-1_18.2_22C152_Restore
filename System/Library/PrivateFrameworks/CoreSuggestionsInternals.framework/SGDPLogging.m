@interface SGDPLogging
+ (id)_BOOLMaskVectorForTokens:(id)a3;
+ (id)_loggableTitleSequence:(id)a3 withMask:(id)a4;
+ (id)_loggableUnknownTokenSequence:(id)a3 withMask:(id)a4;
+ (id)_tokenizeTitle:(id)a3;
+ (void)_logReminderTitleSequence:(id)a3 recorderKey:(id)a4;
+ (void)_logReminderTitleUnknownTokens:(id)a3 recorderKey:(id)a4;
+ (void)logActionVerb:(id)a3 actionType:(unsigned __int16)a4;
+ (void)logReminder:(id)a3 actionType:(unsigned __int16)a4;
+ (void)logReminderTitle:(id)a3 actionType:(unsigned __int16)a4;
+ (void)logUserCreatedReminderTitle:(id)a3;
@end

@implementation SGDPLogging

+ (id)_loggableUnknownTokenSequence:(id)a3 withMask:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__SGDPLogging__loggableUnknownTokenSequence_withMask___block_invoke;
  v9[3] = &unk_1E65C02A0;
  id v10 = v5;
  id v6 = v5;
  v7 = objc_msgSend(a3, "_pas_mappedArrayWithIndexedTransform:", v9);

  return v7;
}

id __54__SGDPLogging__loggableUnknownTokenSequence_withMask___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) objectAtIndex:a3];
  LOBYTE(a1) = [v6 BOOLValue];

  if (a1)
  {
    v7 = 0;
  }
  else
  {
    v7 = [v5 text];
  }

  return v7;
}

+ (id)_loggableTitleSequence:(id)a3 withMask:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__SGDPLogging__loggableTitleSequence_withMask___block_invoke;
  v9[3] = &unk_1E65C02A0;
  id v10 = v5;
  id v6 = v5;
  v7 = objc_msgSend(a3, "_pas_mappedArrayWithIndexedTransform:", v9);

  return v7;
}

__CFString *__47__SGDPLogging__loggableTitleSequence_withMask___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) objectAtIndex:a3];
  LODWORD(a1) = [v6 BOOLValue];

  if (a1)
  {
    v7 = [v5 text];
  }
  else
  {
    v8 = [v5 tags];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      id v10 = [v5 tags];
      v7 = [v10 objectAtIndex:0];
    }
    else
    {
      v7 = @"unk";
    }
  }

  return v7;
}

+ (id)_BOOLMaskVectorForTokens:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F5F478];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithTableClassName:@"_DPHuffmanTable_Reminders_Title_en_US" maxOutputBitLength:10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__SGDPLogging__BOOLMaskVectorForTokens___block_invoke;
  v9[3] = &unk_1E65C0278;
  id v10 = v5;
  id v6 = v5;
  v7 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v9);

  return v7;
}

id __40__SGDPLogging__BOOLMaskVectorForTokens___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1CB79B230]();
  id v5 = NSNumber;
  id v6 = *(void **)(a1 + 32);
  v7 = [v3 text];
  v8 = objc_msgSend(v5, "numberWithBool:", objc_msgSend(v6, "tokenExist:", v7));

  return v8;
}

+ (id)_tokenizeTitle:(id)a3
{
  id v3 = a3;
  id v4 = +[SGPOSTagger sharedInstance];
  id v5 = [v4 tokenizeTextContent:v3 languageHint:@"en"];

  id v6 = objc_msgSend(v5, "_pas_filteredArrayWithTest:", &__block_literal_global_41531);

  return v6;
}

BOOL __30__SGDPLogging__tokenizeTitle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 annotationType] == 2;
}

+ (void)logUserCreatedReminderTitle:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F5DFA0] defaultLanguage];
  if ([v5 isEqualToString:@"en"])
  {
    id v6 = [a1 _tokenizeTitle:v4];
    v7 = [a1 _BOOLMaskVectorForTokens:v6];
    v8 = [a1 _loggableTitleSequence:v6 withMask:v7];
    uint64_t v9 = [a1 _loggableUnknownTokenSequence:v6 withMask:v7];
    [a1 _logReminderTitleSequence:v8 recorderKey:@"com.apple.suggestions.reminders.en_US.ReminderTitleCreated"];
    [a1 _logReminderTitleUnknownTokens:v9 recorderKey:@"com.apple.suggestions.reminders.en_US.ReminderTitleCreatedWithUnknowns"];
  }
  else
  {
    id v10 = sgRemindersLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412290;
      v12 = v5;
      _os_log_debug_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEBUG, "SGDPLogging: Found unsupported device language %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

+ (void)logReminderTitle:(id)a3 actionType:(unsigned __int16)a4
{
  int v4 = a4;
  id v6 = a3;
  v7 = v6;
  v8 = @"com.apple.suggestions.reminders.en_US.TitleSuggested";
  uint64_t v9 = @"com.apple.suggestions.reminders.en_US.UnknownTokenSuggested";
  switch(v4)
  {
    case 0:
    case 2:
    case 3:
    case 4:
    case 5:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
      break;
    case 1:
      goto LABEL_7;
    case 6:
      v8 = @"com.apple.suggestions.reminders.en_US.TitleConfirmed";
      uint64_t v9 = @"com.apple.suggestions.reminders.en_US.UnknownTokenConfirmed";
      goto LABEL_7;
    case 7:
      v8 = @"com.apple.suggestions.reminders.en_US.TitleRejected";
      uint64_t v9 = @"com.apple.suggestions.reminders.en_US.UnknownTokenRejected";
LABEL_7:
      int v11 = [v6 title];
      v12 = [a1 _tokenizeTitle:v11];

      uint64_t v13 = [a1 _BOOLMaskVectorForTokens:v12];
      v14 = [a1 _loggableTitleSequence:v12 withMask:v13];
      v15 = [a1 _loggableUnknownTokenSequence:v12 withMask:v13];
      [a1 _logReminderTitleSequence:v14 recorderKey:v8];
      [a1 _logReminderTitleUnknownTokens:v15 recorderKey:v9];

      break;
    default:
      id v10 = sgRemindersLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_error_impl(&dword_1CA650000, v10, OS_LOG_TYPE_ERROR, "SGDPLogging: No recorder key for reminder title log", v16, 2u);
      }

      break;
  }
}

+ (void)_logReminderTitleUnknownTokens:(id)a3 recorderKey:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F5F488]) initWithKey:v6];
  int v8 = [v7 record:v5];
  uint64_t v9 = sgRemindersLogHandle();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138740227;
      id v12 = v5;
      __int16 v13 = 2117;
      id v14 = v6;
      _os_log_debug_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEBUG, "SGDPLogging: Logged unknown reminder title tokens %{sensitive}@ to DP with key %{sensitive}@", (uint8_t *)&v11, 0x16u);
    }

    id v10 = sgRemindersLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_INFO, "SGDPLogging: Logged unknown reminder title tokens to DP", (uint8_t *)&v11, 2u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v11) = 0;
    _os_log_error_impl(&dword_1CA650000, v10, OS_LOG_TYPE_ERROR, "SGDPLogging: Unable to log unknown reminder title tokens for reminder", (uint8_t *)&v11, 2u);
  }
}

+ (void)_logReminderTitleSequence:(id)a3 recorderKey:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v20 = a4;
  v22 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    uint64_t v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v12 = (void *)MEMORY[0x1CB79B230]();
        __int16 v13 = (void *)MEMORY[0x1E4F5F490];
        id v14 = [NSNumber numberWithUnsignedInteger:v9 + i];
        uint64_t v15 = [v13 word:v11 atPosition:v14];
        [v22 addObject:v15];
      }
      v9 += i;
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v7);
  }

  v16 = (void *)[objc_alloc(MEMORY[0x1E4F5F498]) initWithKey:v20];
  int v17 = [v16 record:v22];
  v18 = sgRemindersLogHandle();
  v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138740227;
      id v28 = obj;
      __int16 v29 = 2117;
      id v30 = v20;
      _os_log_debug_impl(&dword_1CA650000, v19, OS_LOG_TYPE_DEBUG, "SGDPLogging: Logged suggested reminder title sequence %{sensitive}@ to DP with key %{sensitive}@", buf, 0x16u);
    }

    v19 = sgRemindersLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v19, OS_LOG_TYPE_INFO, "SGDPLogging: Logged suggested reminder title to DP", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA650000, v19, OS_LOG_TYPE_ERROR, "SGDPLogging: Unable to log suggested reminder title sequence for reminder", buf, 2u);
  }
}

+ (void)logActionVerb:(id)a3 actionType:(unsigned __int16)a4
{
  int v4 = a4;
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = @"com.apple.suggestions.ReminderSuggested";
  switch(v4)
  {
    case 0:
    case 2:
    case 3:
    case 4:
    case 5:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
      goto LABEL_17;
    case 1:
      goto LABEL_6;
    case 6:
      uint64_t v6 = @"com.apple.suggestions.ReminderConfirmed";
      goto LABEL_6;
    case 7:
      uint64_t v6 = @"com.apple.suggestions.ReminderRejected";
LABEL_6:
      uint64_t v8 = +[SGReminderExtractionModel sharedInstance];
      uint64_t v9 = [v5 title];
      uint64_t v7 = [v8 whitelistedVerbInContent:v9];

      if (v7)
      {
        id v10 = [objc_alloc(MEMORY[0x1E4F5F488]) initWithKey:v6];
        v16[0] = v7;
        uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
        int v12 = [v10 record:v11];

        __int16 v13 = sgRemindersLogHandle();
        id v14 = v13;
        if (v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)uint64_t v15 = 0;
            _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_INFO, "SGDPLogging: Logged actionVerb to DP for reminder", v15, 2u);
          }
        }
        else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v15 = 0;
          _os_log_error_impl(&dword_1CA650000, v14, OS_LOG_TYPE_ERROR, "SGDPLogging: Unable to log actionVerb for reminder", v15, 2u);
        }
      }
      else
      {
        id v10 = sgRemindersLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v15 = 0;
          _os_log_error_impl(&dword_1CA650000, v10, OS_LOG_TYPE_ERROR, "SGDPLogging: No actionVerb found in Reminder", v15, 2u);
        }
      }

      break;
    default:
      uint64_t v7 = sgRemindersLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "SGDPLogging: No recorder key for reminders log", v15, 2u);
      }
      break;
  }

LABEL_17:
}

+ (void)logReminder:(id)a3 actionType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v5 = [MEMORY[0x1E4F5DFA0] defaultLanguage];
  if ([v5 isEqualToString:@"en"])
  {
    +[SGDPLogging logActionVerb:v6 actionType:v4];
    +[SGDPLogging logReminderTitle:v6 actionType:v4];
  }
}

@end