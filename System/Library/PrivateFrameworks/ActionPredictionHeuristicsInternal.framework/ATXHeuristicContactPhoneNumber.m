@interface ATXHeuristicContactPhoneNumber
- (BOOL)_containsPhonePunctuation:(id)a3;
- (id)heuristicResultWithEnvironment:(id)a3;
- (id)permanentRefreshTriggers;
- (id)phonesFromDataDetectorResults:(id)a3;
@end

@implementation ATXHeuristicContactPhoneNumber

- (id)permanentRefreshTriggers
{
  v2 = [[ATXInformationHeuristicRefreshNotitifcationTrigger alloc] initWithNotification:@"ATXLocalPasteboardDidChangeNotification" type:0];
  v3 = (void *)MEMORY[0x1D25F43D0]();
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v2, 0);

  return v4;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [ATXHeuristicClipboardUtilities alloc];
  v6 = [v4 heuristicDevice];

  v7 = [(ATXHeuristicClipboardUtilities *)v5 initWithDevice:v6];
  [(ATXHeuristicClipboardUtilities *)v7 fetchContents];
  v8 = [(ATXHeuristicClipboardUtilities *)v7 dataDetectors];
  v9 = objc_opt_new();
  if ([v9 telephonyCapability])
  {
    v10 = [(ATXHeuristicContactPhoneNumber *)self phonesFromDataDetectorResults:v8];
    v11 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = (uint64_t)v10;
      _os_log_impl(&dword_1D0F43000, v11, OS_LOG_TYPE_DEFAULT, "heuristicResultWithEnvironment: phones:%@", buf, 0xCu);
    }

    if ([v10 count] == 1)
    {
      v12 = [v10 firstObject];
      v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v36 = v8;
      v14 = NSString;
      v15 = v13;
      v16 = [v13 localizedStringForKey:@"CALL_CLIPBOARD_NUMBER_TITLE" value:&stru_1F2719D20 table:0];
      objc_msgSend(v14, "localizedStringWithFormat:", v16, v12);
      v17 = v35 = v10;

      v18 = NSString;
      v19 = v15;
      v34 = v15;
      v20 = [v15 localizedStringForKey:@"MESSAGE_CLIPBOARD_NUMBER_TITLE" value:&stru_1F2719D20 table:0];
      v21 = objc_msgSend(v18, "localizedStringWithFormat:", v20, v12);

      v22 = NSString;
      v23 = [v19 localizedStringForKey:@"CLIPBOARD_NUMBER_SUBTITLE" value:&stru_1F2719D20 table:0];
      v24 = [(ATXHeuristicClipboardUtilities *)v7 appName];
      v25 = objc_msgSend(v22, "localizedStringWithFormat:", v23, v24);

      v26 = objc_msgSend(MEMORY[0x1E4F4AE38], "atx_startAudioCallActionWithTitle:subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:", v17, v25, 0, v12, @"phone", 0, 0, @"contactPhoneNumber");
      v27 = objc_msgSend(MEMORY[0x1E4F4AE38], "atx_sendMessageActionWithTitle:subtitle:recipientName:recipientHandle:text:contactIdentifier:conversationIdentifier:eventIdentifier:heuristicName:", v21, v25, 0, v12, 0, 0, 0, 0, @"contactPhoneNumber");
      v37[0] = v26;
      v37[1] = v27;
      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
      v29 = [(ATXHeuristicClipboardUtilities *)v7 resultWithActions:v28 predictionReasons:0x10000000];

      v8 = v36;
      v10 = v35;
    }
    else
    {
      v31 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = [v10 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v39 = v32;
        _os_log_impl(&dword_1D0F43000, v31, OS_LOG_TYPE_DEFAULT, "heuristicResultWithEnvironment: Required exactly 1 phone number, but found %lu numbers.", buf, 0xCu);
      }

      v29 = objc_opt_new();
    }
  }
  else
  {
    v30 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v30, OS_LOG_TYPE_DEFAULT, "heuristicResultWithEnvironment: Suppressing prediction to contact copied phone number because device does not support telephony.", buf, 2u);
    }

    v29 = objc_opt_new();
  }

  return v29;
}

- (id)phonesFromDataDetectorResults:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v14 = (id)objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "objectForKeyedSubscript:", @"value", v14);
        v11 = [v9 objectForKeyedSubscript:@"type"];
        if ([v11 isEqualToString:@"PhoneNumber"])
        {
          BOOL v12 = [(ATXHeuristicContactPhoneNumber *)self _containsPhonePunctuation:v10];

          if (v12) {
            [v14 addObject:v10];
          }
        }
        else
        {
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v14;
}

- (BOOL)_containsPhonePunctuation:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  uint64_t v5 = [v3 characterSetWithCharactersInString:@" (),-."];
  uint64_t v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  uint64_t v7 = [v6 count];
  return v7 > 2;
}

@end