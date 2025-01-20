@interface IMDCollaborationNoticeTypeGenerator
+ (id)sharedGenerator;
- (IMDCollaborationNoticeTypeGenerator)init;
- (SWHighlightCenter)highlightCenter;
- (int64_t)processMentionForPersonHandle:(id)a3;
- (int64_t)processMentionForPersonIdentity:(id)a3 highlightURL:(id)a4;
- (int64_t)typeForHighlightEvent:(id)a3;
@end

@implementation IMDCollaborationNoticeTypeGenerator

+ (id)sharedGenerator
{
  if (qword_1EA8CA408 != -1) {
    dispatch_once(&qword_1EA8CA408, &unk_1F3390720);
  }
  v2 = (void *)qword_1EA8CA400;

  return v2;
}

- (IMDCollaborationNoticeTypeGenerator)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMDCollaborationNoticeTypeGenerator;
  v2 = [(IMDCollaborationNoticeTypeGenerator *)&v6 init];
  if (v2)
  {
    v3 = (SWHighlightCenter *)objc_alloc_init((Class)MEMORY[0x1E0169C30](@"SWHighlightCenter", @"SharedWithYou"));
    highlightCenter = v2->_highlightCenter;
    v2->_highlightCenter = v3;
  }
  return v2;
}

- (int64_t)typeForHighlightEvent:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v4 changeEventType];
    if (v5 == 2) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = -1;
    }
    if (v5 == 1) {
      int64_t v7 = 1;
    }
    else {
      int64_t v7 = v6;
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0
        && ([v4 mentionedPersonHandle],
            v10 = objc_claimAutoreleasedReturnValue(),
            uint64_t v11 = [v10 length],
            v10,
            v11))
      {
        v12 = [v4 mentionedPersonHandle];
        int64_t v7 = [(IMDCollaborationNoticeTypeGenerator *)self processMentionForPersonHandle:v12];
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
        {
          if (objc_opt_respondsToSelector())
          {
            uint64_t v14 = [v4 persistenceEventType];
            if ((unint64_t)(v14 - 1) >= 4) {
              int64_t v7 = -1;
            }
            else {
              int64_t v7 = v14 + 3;
            }
          }
          else
          {
            int64_t v7 = -1;
          }
          goto LABEL_26;
        }
        v12 = [v4 mentionedPersonIdentity];
        v13 = [v4 highlightURL];
        int64_t v7 = [(IMDCollaborationNoticeTypeGenerator *)self processMentionForPersonIdentity:v12 highlightURL:v13];
      }
      goto LABEL_26;
    }
    uint64_t v8 = [v4 membershipEventType];
    uint64_t v9 = 9;
    if (v8 != 2) {
      uint64_t v9 = -1;
    }
    if (v8 == 1) {
      int64_t v7 = 8;
    }
    else {
      int64_t v7 = v9;
    }
  }
LABEL_26:

  return v7;
}

- (int64_t)processMentionForPersonHandle:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = +[IMDAccountController sharedAccountController];
    uint64_t v6 = [v5 activeAliases];
    int64_t v7 = [v4 setWithArray:v6];

    if ([v7 containsObject:v3])
    {
      int64_t v8 = 3;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v12 = 138412290;
          id v13 = v3;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Received a mention for a handle not associated with local account: %@", (uint8_t *)&v12, 0xCu);
        }
      }
      int64_t v8 = -1;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = 0;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Received a mention for a handle not associated with local account: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    int64_t v8 = -1;
  }

  return v8;
}

- (int64_t)processMentionForPersonIdentity:(id)a3 highlightURL:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v33 = a4;
  uint64_t v6 = [(IMDCollaborationNoticeTypeGenerator *)self highlightCenter];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int64_t v8 = [(IMDCollaborationNoticeTypeGenerator *)self highlightCenter];
    id v44 = 0;
    v32 = [v8 collaborationHighlightForURL:v33 error:&v44];
    id v31 = v44;

    if (v31) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v32 == 0;
    }
    char v10 = !v9;
    int v11 = IMOSLoggingEnabled();
    if (v10)
    {
      if (v11)
      {
        int v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          id v13 = [v32 stringIdentifier];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v13;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Received a mention with a person identity for highlight: %@. Attempting to find the handle for the mentioned identity.", (uint8_t *)&buf, 0xCu);
        }
      }
      uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
      v15 = +[IMDAccountController sharedAccountController];
      v16 = [v15 activeAliases];
      v34 = [v14 setWithArray:v16];

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v49 = 0x2020000000;
      uint64_t v50 = -1;
      v17 = [(IMDCollaborationNoticeTypeGenerator *)self highlightCenter];
      v30 = [v17 fetchAttributionsForHighlight:v32];

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v18 = [v30 attributions];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v47 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v41;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v41 != v20) {
              objc_enumerationMutation(v18);
            }
            v22 = [*(id *)(*((void *)&v40 + 1) + 8 * v21) collaborationMetadata];
            if (objc_opt_respondsToSelector())
            {
              v23 = [v22 handleToIdentityMap];
              v36[0] = MEMORY[0x1E4F143A8];
              v36[1] = 3221225472;
              v36[2] = sub_1D96B61C0;
              v36[3] = &unk_1E6B734D0;
              id v37 = v35;
              id v38 = v34;
              p_long long buf = &buf;
              [v23 enumerateKeysAndObjectsUsingBlock:v36];
            }
            ++v21;
          }
          while (v19 != v21);
          uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v47 count:16];
        }
        while (v19);
      }

      if (*(void *)(*((void *)&buf + 1) + 24) == 3) {
        v24 = @"IMCollaborationNoticeTypeMentionedMe";
      }
      else {
        v24 = @"IMCollaborationNoticeTypeInvalid";
      }
      v25 = v24;
      if (IMOSLoggingEnabled())
      {
        v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v45 = 138412290;
          v46 = v25;
          _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "processMentionForPersonIdentity returning: %@", v45, 0xCu);
        }
      }
      int64_t v27 = *(void *)(*((void *)&buf + 1) + 24);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if (v11)
      {
        v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v31;
          _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Received a notice for a URL without a tracked highlight, returning invalid for this notice. error: %@", (uint8_t *)&buf, 0xCu);
        }
      }
      int64_t v27 = -1;
    }
  }
  else
  {
    int64_t v27 = -1;
  }

  return v27;
}

- (SWHighlightCenter)highlightCenter
{
  return self->_highlightCenter;
}

- (void).cxx_destruct
{
}

@end