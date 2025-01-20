@interface EKEvent
@end

@implementation EKEvent

void __55__EKEvent_Saving__fixInvalidatedVirtualConferenceURLs___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v7)
  {
    v11 = +[CUIKLogSubsystem editingContext];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __55__EKEvent_Saving__fixInvalidatedVirtualConferenceURLs___block_invoke_cold_1(a1);
    }
    goto LABEL_7;
  }
  int v10 = [v7 isEqual:*(void *)(a1 + 32)];
  v11 = +[CUIKLogSubsystem editingContext];
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v13;
      _os_log_impl(&dword_1BDF08000, v11, OS_LOG_TYPE_INFO, "URL %@ is still valid.", buf, 0xCu);
    }
LABEL_7:

    goto LABEL_11;
  }
  if (v12)
  {
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v23 = v14;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_1BDF08000, v11, OS_LOG_TYPE_INFO, "Will replace URL %@ with %@.", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__EKEvent_Saving__fixInvalidatedVirtualConferenceURLs___block_invoke_279;
  block[3] = &unk_1E636A658;
  block[4] = *(void *)(a1 + 40);
  id v18 = v8;
  id v15 = v7;
  uint64_t v16 = *(void *)(a1 + 48);
  id v19 = v15;
  uint64_t v21 = v16;
  id v20 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);

LABEL_11:
}

void __55__EKEvent_Saving__fixInvalidatedVirtualConferenceURLs___block_invoke_279(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) eventStore];
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 32)];
  int v4 = [v2 objectsHaveChangesToCommit:v3];

  v5 = [*(id *)(a1 + 32) shallowCopyWithoutChanges];
  v6 = [v5 virtualConference];
  id v7 = (void *)[v6 copy];
  if ([(id)objc_opt_class() updateVirtualConference:v7 replacing:*(void *)(a1 + 40) with:*(void *)(a1 + 48)])
  {
    [v5 setVirtualConference:v7];
    id v8 = [*(id *)(a1 + 32) eventStore];
    uint64_t v9 = *(void *)(a1 + 64);
    id v20 = 0;
    char v10 = [v8 saveEvent:v5 span:v9 commit:v4 ^ 1u error:&v20];
    id v11 = v20;

    if (v10)
    {
      [*(id *)(a1 + 32) postModifiedNotification];
    }
    else
    {
      uint64_t v16 = +[CUIKLogSubsystem editingContext];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __55__EKEvent_Saving__fixInvalidatedVirtualConferenceURLs___block_invoke_279_cold_1();
      }

      v17 = (void *)MEMORY[0x1E4F25510];
      uint64_t v18 = *(void *)(a1 + 48);
      id v19 = [*(id *)(a1 + 32) eventStore];
      [v17 invalidateConferenceURLIfNeeded:v18 inEventStore:v19];
    }
  }
  else
  {
    BOOL v12 = +[CUIKLogSubsystem editingContext];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v13;
      _os_log_impl(&dword_1BDF08000, v12, OS_LOG_TYPE_INFO, "Didn't find old URL %@ to update on event; just invalidating the new URL",
        buf,
        0xCu);
    }

    uint64_t v14 = (void *)MEMORY[0x1E4F25510];
    uint64_t v15 = *(void *)(a1 + 48);
    id v11 = [*(id *)(a1 + 32) eventStore];
    [v14 invalidateConferenceURLIfNeeded:v15 inEventStore:v11];
  }
}

void __55__EKEvent_Saving__fixInvalidatedVirtualConferenceURLs___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_1(&dword_1BDF08000, v1, v2, "Failed to create valid URL for old URL %@: %@", (void)v3, DWORD2(v3));
}

void __55__EKEvent_Saving__fixInvalidatedVirtualConferenceURLs___block_invoke_279_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BDF08000, v0, OS_LOG_TYPE_ERROR, "Error saving revalidated URL: %@", v1, 0xCu);
}

@end