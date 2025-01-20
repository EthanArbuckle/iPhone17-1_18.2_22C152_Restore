@interface SFCalendarEventDetector
@end

@implementation SFCalendarEventDetector

void __76___SFCalendarEventDetector_containsCalendarEventForPageWithSchemaOrgMarkup___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _containsCalendarEventForPageWithSchemaOrgMarkup:*(unsigned __int8 *)(a1 + 40)];
}

void __77___SFCalendarEventDetector__containsCalendarEventForPageWithSchemaOrgMarkup___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F5DB70] serviceForEvents];
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77___SFCalendarEventDetector__containsCalendarEventForPageWithSchemaOrgMarkup___block_invoke_2;
  v9[3] = &unk_1E5C75120;
  id v10 = v3;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v2;
  id v8 = v2;
  [v8 isEventCandidateForURL:v10 andTitle:v4 containsSchemaOrg:v5 withCompletion:v9];
}

void __77___SFCalendarEventDetector__containsCalendarEventForPageWithSchemaOrgMarkup___block_invoke_2(uint64_t a1, char a2)
{
  if (a2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __77___SFCalendarEventDetector__containsCalendarEventForPageWithSchemaOrgMarkup___block_invoke_1;
    v6[3] = &unk_1E5C726F0;
    v3 = *(void **)(a1 + 56);
    v6[4] = *(void *)(a1 + 48);
    id v7 = v3;
    id v8 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
  else
  {
    uint64_t v4 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A690B000, v4, OS_LOG_TYPE_INFO, "Page was not a candidate for event extraction", buf, 2u);
    }
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __77___SFCalendarEventDetector__containsCalendarEventForPageWithSchemaOrgMarkup___block_invoke_2_cold_1(a1, v5);
    }
  }
}

uint64_t __77___SFCalendarEventDetector__containsCalendarEventForPageWithSchemaOrgMarkup___block_invoke_1(uint64_t a1)
{
  return [*(id *)(a1 + 32) _service:*(void *)(a1 + 40) didFindEventCandidateForURL:*(void *)(a1 + 48) pageTitle:*(void *)(a1 + 56)];
}

void __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [v5 bytes];
    if (v7)
    {
      uint64_t v9 = a1[4];
      id v8 = (void *)a1[5];
      uint64_t v10 = a1[6];
      id v11 = [NSString stringWithUTF8String:v7];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke_4;
      v17[3] = &unk_1E5C75170;
      v17[4] = a1[7];
      [v8 suggestionsFromURL:v9 title:v10 HTMLPayload:v11 withCompletion:v17];
    }
    else
    {
      v14 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke_cold_3(v14, v6);
      }
      v15 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = a1[4];
        *(_DWORD *)buf = 138739971;
        uint64_t v19 = v16;
        _os_log_impl(&dword_1A690B000, v15, OS_LOG_TYPE_INFO, "Page URL: %{sensitive}@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v12 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke_cold_2(v12, v6);
    }
    id v13 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke_cold_1((uint64_t)a1, v13);
    }
  }
}

void __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke_4_cold_1(v7, v6);
    }
  }
  else if ([v5 count])
  {
    [*(id *)(a1 + 32) _foundCalendarEvents:v5];
  }
}

void __77___SFCalendarEventDetector__containsCalendarEventForPageWithSchemaOrgMarkup___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138478083;
  uint64_t v5 = v2;
  __int16 v6 = 2113;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_1A690B000, a2, OS_LOG_TYPE_DEBUG, "Page URL: %{private}@ and title: '%{private}@'", (uint8_t *)&v4, 0x16u);
}

void __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A690B000, a2, OS_LOG_TYPE_DEBUG, "Page URL: %{private}@", (uint8_t *)&v3, 0xCu);
}

void __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke_cold_2(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v5, v6, "Unable to get the source code for the page with error: %{public}@", v7, v8, v9, v10, v11);
}

void __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke_cold_3(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v5, v6, "Unable to get bytes of source code for the page with error: %{public}@", v7, v8, v9, v10, v11);
}

void __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke_4_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v5, v6, "Unable to detect calendar events: %{public}@", v7, v8, v9, v10, v11);
}

@end