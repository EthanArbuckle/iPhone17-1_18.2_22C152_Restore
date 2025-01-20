@interface IMDBaseSpotlightIndexController
- (IMDBaseSpotlightIndexControllerDelegate)delegate;
- (id)_createErrorFromSyncError:(id)a3;
- (id)dataForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 error:(id *)a6;
- (id)errorAnalyzer;
- (id)fileURLForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 allowDownload:(BOOL)a6 error:(id *)a7;
- (id)fileURLForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 inPlace:(BOOL)a6 allowDownload:(BOOL)a7 error:(id *)a8;
- (id)fileURLForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 inPlace:(BOOL)a6 error:(id *)a7;
- (id)fileURLForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 error:(id *)a7;
- (id)fileURLsForSearchableIndex:(id)a3 itemIdentifiers:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 error:(id *)a7;
- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
- (void)searchableItemsDidUpdate:(id)a3 mask:(int64_t)a4;
- (void)setDelegate:(id)a3;
@end

@implementation IMDBaseSpotlightIndexController

- (id)errorAnalyzer
{
  return (id)[MEMORY[0x1E4F6EA68] sharedInstance];
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(void))a4;
  int v7 = [MEMORY[0x1E4F6E700] needsIndexing];
  v8 = sub_1AFBA6414();
  if (v8)
  {
    v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceDate:v8];
    double v11 = fabs(v10);

    if (v11 < 10800.0)
    {

      int v12 = 1;
      goto LABEL_13;
    }
  }

  if (v7)
  {
    int v12 = 0;
LABEL_13:
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = sub_1AFBA6414();
        v19 = (void *)v18;
        v20 = @"NO";
        if (v12) {
          v21 = @"YES";
        }
        else {
          v21 = @"NO";
        }
        *(_DWORD *)v23 = 138412802;
        if (v7) {
          v20 = @"YES";
        }
        *(void *)&v23[4] = v20;
        __int16 v24 = 2112;
        v25 = v21;
        __int16 v26 = 2112;
        uint64_t v27 = v18;
        _os_log_impl(&dword_1AFB53000, v17, OS_LOG_TYPE_INFO, "Spotlight requesting full reindex, scheduling deferred indexing. Index in progress %@ rerequestWithinInterval %@ lastRequestDate %@", v23, 0x20u);
      }
    }
    v22 = +[IMSpotlightEventNotifier sharedNotifier];
    [v22 deferredReindexScheduled];

    sub_1AFBA6398(2);
    [MEMORY[0x1E4F6E700] setNeedsDeferredIndexing];
    goto LABEL_23;
  }
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, "Spotlight requesting full reindex, fullfilling request", v23, 2u);
    }
  }
  sub_1AFBA6398(1);
  IMDCoreSpotlightSetNeedsMessageReindex(6, 0);
  v14 = [MEMORY[0x1E4F1C9C8] date];
  CFStringRef v15 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  CFStringRef v16 = v15;
  if (v15)
  {
    CFPreferencesAppSynchronize(v15);
    CFPreferencesSetAppValue(@"IMDCoreSpotlightLastFullReindexRequestTime", v14, v16);
    CFRelease(v16);
  }

LABEL_23:
  if (v6) {
    v6[2](v6);
  }
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(void))a5;
  if (IMOSLoggingEnabled())
  {
    double v10 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v16 = 134217984;
      uint64_t v17 = [v8 count];
      _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "Got the callback for reindexSearchableItemsWithIdentifiers with %lu identifiers", (uint8_t *)&v16, 0xCu);
    }
  }
  BOOL v11 = [v8 count] == 0;
  int v12 = IMOSLoggingEnabled();
  if (v11)
  {
    if (v12)
    {
      CFStringRef v15 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1AFB53000, v15, OS_LOG_TYPE_INFO, "Not reindexing, we were asked to index 0 items", (uint8_t *)&v16, 2u);
      }
    }
  }
  else
  {
    if (v12)
    {
      v13 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = [v8 count];
        int v16 = 134217984;
        uint64_t v17 = v14;
        _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, "Spotlight requesting reindexing of %lu identifiers, fullfilling request", (uint8_t *)&v16, 0xCu);
      }
    }
    IMDCoreSpotlightReindexMessages(v8, 7, 0);
  }
  if (v9) {
    v9[2](v9);
  }
}

- (id)fileURLForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 allowDownload:(BOOL)a6 error:(id *)a7
{
  return (id)MEMORY[0x1F4181798](self, sel_fileURLForSearchableIndex_itemIdentifier_typeIdentifier_options_error_);
}

- (id)fileURLForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 inPlace:(BOOL)a6 error:(id *)a7
{
  return (id)MEMORY[0x1F4181798](self, sel_fileURLForSearchableIndex_itemIdentifier_typeIdentifier_options_error_);
}

- (id)fileURLForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 inPlace:(BOOL)a6 allowDownload:(BOOL)a7 error:(id *)a8
{
  return (id)MEMORY[0x1F4181798](self, sel_fileURLForSearchableIndex_itemIdentifier_typeIdentifier_options_error_);
}

- (id)_createErrorFromSyncError:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(IMDBaseSpotlightIndexController *)self errorAnalyzer];
    id v15 = &unk_1F0864EF0;
    uint64_t v6 = [v5 responseForError:v4 attempt:0 retryInterval:&v15];
    id v7 = v15;

    uint64_t v8 = *MEMORY[0x1E4F28A50];
    v16[0] = *MEMORY[0x1E4F6CC50];
    v16[1] = v8;
    v17[0] = v7;
    v9 = (void *)MEMORY[0x1E4F28C58];
    double v10 = [v4 domain];
    BOOL v11 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(v4, "code"), 0);
    v17[1] = v11;
    int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

    v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.messages.IndexRequestHandler" code:v6 userInfo:v12];
  }
  else
  {
    int v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1AFC67DC0(v12);
    }
    v13 = 0;
  }

  return v13;
}

- (id)fileURLForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 error:(id *)a7
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v59 = a3;
  id v12 = a4;
  id v13 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "Spotlight requesting fileURL for item identifier %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v107 = 0x3032000000;
  v108 = sub_1AFBA7438;
  v109 = sub_1AFBA7448;
  id v110 = 0;
  id v15 = v12;
  id v110 = v15;
  uint64_t v90 = 0;
  v91 = &v90;
  uint64_t v92 = 0x3032000000;
  v93 = sub_1AFBA7438;
  v94 = sub_1AFBA7448;
  id v95 = 0;
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x3032000000;
  v87 = sub_1AFBA7438;
  v88 = sub_1AFBA7448;
  id v89 = 0;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x3032000000;
  v81 = sub_1AFBA7438;
  v82 = sub_1AFBA7448;
  id v83 = 0;
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x3032000000;
  v75 = sub_1AFBA7438;
  v76 = sub_1AFBA7448;
  id v77 = 0;
  if (IMOSLoggingEnabled())
  {
    int v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v99 = 138412290;
      uint64_t v100 = v17;
      _os_log_impl(&dword_1AFB53000, v16, OS_LOG_TYPE_INFO, "Starting download of file transfer with GUID %@", v99, 0xCu);
    }
  }
  uint64_t v18 = dispatch_group_create();
  dispatch_group_enter(v18);
  v19 = [(IMDBaseSpotlightIndexController *)self delegate];
  uint64_t v105 = *(void *)(*((void *)&buf + 1) + 40);
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v105 count:1];
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = sub_1AFBA7450;
  v65[3] = &unk_1E5F94F98;
  v68 = &v72;
  v69 = &v84;
  v70 = &v90;
  v71 = &v78;
  p_long long buf = &buf;
  v65[4] = self;
  v21 = v18;
  v66 = v21;
  [v19 retrieveLocalFileURLForFileTransferWithGUIDs:v20 options:a6 completion:v65];

  if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v99 = 0;
      _os_log_impl(&dword_1AFB53000, v22, OS_LOG_TYPE_INFO, "Beginning blocking index extension on file transfer download.", v99, 2u);
    }
  }
  dispatch_time_t v23 = dispatch_time(0, 180000000000);
  intptr_t v24 = dispatch_group_wait(v21, v23);
  if (IMOSLoggingEnabled())
  {
    v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v99 = 0;
      _os_log_impl(&dword_1AFB53000, v25, OS_LOG_TYPE_INFO, "Finished blocking index extension on file transfer download.", v99, 2u);
    }
  }
  uint64_t v26 = v85[5];
  if (v26 || !v24)
  {
    if (!v26 && v91[5] && (objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "isEqualToString:") & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        v37 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          uint64_t v38 = *(void *)(*((void *)&buf + 1) + 40);
          uint64_t v39 = v91[5];
          *(_DWORD *)v99 = 138412546;
          uint64_t v100 = v38;
          __int16 v101 = 2112;
          uint64_t v102 = v39;
          _os_log_impl(&dword_1AFB53000, v37, OS_LOG_TYPE_INFO, "Requested download of file transfer with GUID %@ failed, but was able to derive a suggested retry GUID %@", v99, 0x16u);
        }
      }
      v40 = dispatch_group_create();
      dispatch_group_enter(v40);
      v41 = [(IMDBaseSpotlightIndexController *)self delegate];
      uint64_t v98 = v91[5];
      v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:1];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = sub_1AFBA7778;
      v60[3] = &unk_1E5F94FC0;
      v62 = &v90;
      v63 = &v72;
      v64 = &v84;
      v43 = v40;
      v61 = v43;
      [v41 retrieveLocalFileURLForFileTransferWithGUIDs:v42 options:a6 completion:v60];

      if (IMOSLoggingEnabled())
      {
        v44 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v99 = 0;
          _os_log_impl(&dword_1AFB53000, v44, OS_LOG_TYPE_INFO, "Beginning blocking index extension on secondary file transfer download.", v99, 2u);
        }
      }
      dispatch_time_t v45 = dispatch_time(0, 180000000000);
      dispatch_group_wait(v43, v45);
      if (IMOSLoggingEnabled())
      {
        v46 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v99 = 0;
          _os_log_impl(&dword_1AFB53000, v46, OS_LOG_TYPE_INFO, "Finished blocking index extension on secondary file transfer download.", v99, 2u);
        }
      }
    }
    v36 = (void *)v85[5];
    if (v36
      || a7 && (v47 = (void *)v79[5]) != 0 && (*a7 = v47, (v36 = (void *)v85[5]) != 0))
    {
      if (!IMUTITypeIsSupportedByPhotos())
      {
        v49 = (void *)MEMORY[0x1E4F28C58];
        v96[0] = *MEMORY[0x1E4F28568];
        v50 = [MEMORY[0x1E4F28B50] mainBundle];
        v51 = [v50 localizedStringForKey:@"File URL fetch operation was unsuccessful." value:&stru_1F084E970 table:0];
        v97[0] = v51;
        v96[1] = *MEMORY[0x1E4F28588];
        v52 = [NSString stringWithFormat:@"File transfer had an unsupported UTI %@", v73[5], v59];
        v97[1] = v52;
        v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:2];
        v54 = [v49 errorWithDomain:*MEMORY[0x1E4F6EB18] code:256 userInfo:v53];

        if (a7) {
          *a7 = v54;
        }
        if (IMOSLoggingEnabled())
        {
          v55 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            uint64_t v56 = *(void *)(*((void *)&buf + 1) + 40);
            uint64_t v57 = v73[5];
            *(_DWORD *)v99 = 138412546;
            uint64_t v100 = v56;
            __int16 v101 = 2112;
            uint64_t v102 = v57;
            _os_log_impl(&dword_1AFB53000, v55, OS_LOG_TYPE_INFO, "File transfer with GUID %@ had unsupported UTI type %@", v99, 0x16u);
          }
        }
        goto LABEL_56;
      }
      v36 = (void *)v85[5];
    }
    id v48 = v36;
    goto LABEL_57;
  }
  uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
  v103[0] = *MEMORY[0x1E4F28568];
  uint64_t v28 = [MEMORY[0x1E4F28B50] mainBundle];
  v29 = [v28 localizedStringForKey:@"File URL fetch operation was unsuccessful." value:&stru_1F084E970 table:0];
  v104[0] = v29;
  v103[1] = *MEMORY[0x1E4F28588];
  v30 = [MEMORY[0x1E4F28B50] mainBundle];
  v31 = [v30 localizedStringForKey:@"Timed out while downloading file transfer." value:&stru_1F084E970 table:0];
  v104[1] = v31;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:v103 count:2];
  v33 = [v27 errorWithDomain:*MEMORY[0x1E4F6EB18] code:257 userInfo:v32];

  if (a7) {
    *a7 = v33;
  }
  if (IMOSLoggingEnabled())
  {
    v34 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      uint64_t v35 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v99 = 138412290;
      uint64_t v100 = v35;
      _os_log_impl(&dword_1AFB53000, v34, OS_LOG_TYPE_INFO, "Timed out while downloading file transfer with GUID %@", v99, 0xCu);
    }
  }
LABEL_56:
  id v48 = 0;
LABEL_57:

  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v78, 8);

  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(&v90, 8);

  _Block_object_dispose(&buf, 8);
  return v48;
}

- (id)fileURLsForSearchableIndex:(id)a3 itemIdentifiers:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 error:(id *)a7
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id v77 = a3;
  id v79 = a4;
  id v78 = a5;
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v79;
      _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "Spotlight requesting fileURL for item identifiers %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if ([v79 count])
  {
    uint64_t v80 = (__CFString *)v79;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v149 = 0x3032000000;
    v150 = sub_1AFBA7438;
    v151 = sub_1AFBA7448;
    id v152 = 0;
    id v152 = (id)objc_opt_new();
    uint64_t v131 = 0;
    v132 = &v131;
    uint64_t v133 = 0x3032000000;
    v134 = sub_1AFBA7438;
    v135 = sub_1AFBA7448;
    id v136 = 0;
    id v136 = (id)objc_opt_new();
    uint64_t v125 = 0;
    v126 = &v125;
    uint64_t v127 = 0x3032000000;
    v128 = sub_1AFBA7438;
    v129 = sub_1AFBA7448;
    id v130 = 0;
    id v130 = (id)objc_opt_new();
    uint64_t v119 = 0;
    v120 = &v119;
    uint64_t v121 = 0x3032000000;
    v122 = sub_1AFBA7438;
    v123 = sub_1AFBA7448;
    id v124 = 0;
    id v124 = (id)objc_opt_new();
    uint64_t v113 = 0;
    v114 = &v113;
    uint64_t v115 = 0x3032000000;
    v116 = sub_1AFBA7438;
    v117 = sub_1AFBA7448;
    id v118 = 0;
    id v118 = (id)objc_opt_new();
    if (IMOSLoggingEnabled())
    {
      double v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v144 = 138412290;
        v145 = v80;
        _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "Starting download of file transfer with GUIDs %@", v144, 0xCu);
      }
    }
    BOOL v11 = dispatch_group_create();
    for (unint64_t i = 0; i < [(__CFString *)v80 count]; ++i)
      dispatch_group_enter(v11);
    id v13 = [(IMDBaseSpotlightIndexController *)self delegate];
    v106[0] = MEMORY[0x1E4F143A8];
    v106[1] = 3221225472;
    v106[2] = sub_1AFBA8B44;
    v106[3] = &unk_1E5F94FE8;
    v109 = &v131;
    p_long long buf = &buf;
    v108 = &v119;
    v106[4] = self;
    uint64_t v111 = &v125;
    v112 = &v113;
    dispatch_group_t group = v11;
    dispatch_group_t v107 = group;
    [v13 retrieveLocalFileURLForFileTransferWithGUIDs:v80 options:a6 completion:v106];

    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v144 = 0;
        _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "Beginning blocking index extension on file transfer download.", v144, 2u);
      }
    }
    dispatch_time_t v15 = dispatch_time(0, 180000000000);
    intptr_t v16 = dispatch_group_wait(group, v15);
    if (IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v144 = 0;
        _os_log_impl(&dword_1AFB53000, v17, OS_LOG_TYPE_INFO, "Finished blocking index extension on file transfer download.", v144, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = @"YES";
        if (!v16) {
          v19 = @"NO";
        }
        *(_DWORD *)v144 = 138412546;
        v145 = v19;
        __int16 v146 = 2112;
        v147 = v80;
        _os_log_impl(&dword_1AFB53000, v18, OS_LOG_TYPE_INFO, "Timed out: [%@] while downloading file transfer with GUIDs %@", v144, 0x16u);
      }
    }
    if (v16)
    {
      v20 = (void *)MEMORY[0x1E4F28C58];
      v142[0] = *MEMORY[0x1E4F28568];
      v21 = [MEMORY[0x1E4F28B50] mainBundle];
      v22 = [v21 localizedStringForKey:@"File URL fetch operation was unsuccessful." value:&stru_1F084E970 table:0];
      v143[0] = v22;
      v142[1] = *MEMORY[0x1E4F28588];
      dispatch_time_t v23 = [MEMORY[0x1E4F28B50] mainBundle];
      intptr_t v24 = [v23 localizedStringForKey:@"Timed out while downloading file transfer." value:&stru_1F084E970 table:0];
      v143[1] = v24;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v143 forKeys:v142 count:2];
      uint64_t v26 = [v20 errorWithDomain:*MEMORY[0x1E4F6EB18] code:257 userInfo:v25];

      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      uint64_t v27 = v80;
      uint64_t v28 = [(__CFString *)v27 countByEnumeratingWithState:&v102 objects:v141 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v103;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v103 != v29) {
              objc_enumerationMutation(v27);
            }
            v31 = *(__CFString **)(*((void *)&v102 + 1) + 8 * j);
            if (([(id)v114[5] containsObject:v31] & 1) == 0)
            {
              v32 = [(id)v132[5] objectForKeyedSubscript:v31];
              BOOL v33 = v32 == 0;

              if (v33)
              {
                if (IMOSLoggingEnabled())
                {
                  v34 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)v144 = 138412290;
                    v145 = v31;
                    _os_log_impl(&dword_1AFB53000, v34, OS_LOG_TYPE_INFO, "Timed out while downloading file transfer with GUID %@", v144, 0xCu);
                  }
                }
                [(id)v126[5] setObject:v26 forKeyedSubscript:v31];
              }
            }
          }
          uint64_t v28 = [(__CFString *)v27 countByEnumeratingWithState:&v102 objects:v141 count:16];
        }
        while (v28);
      }

      if (IMOSLoggingEnabled())
      {
        uint64_t v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v144 = 138412290;
          v145 = v26;
          _os_log_impl(&dword_1AFB53000, v35, OS_LOG_TYPE_INFO, "Timed out while downloading file transfers, error %@", v144, 0xCu);
        }
      }
      if (a7) {
        *a7 = v26;
      }
    }
    uint64_t v86 = objc_opt_new();
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v36 = (id)v132[5];
    uint64_t v37 = [v36 countByEnumeratingWithState:&v98 objects:v140 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v99;
      do
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v99 != v38) {
            objc_enumerationMutation(v36);
          }
          v40 = *(__CFString **)(*((void *)&v98 + 1) + 8 * k);
          v41 = [*(id *)(*((void *)&buf + 1) + 40) objectForKeyedSubscript:v40];
          v42 = [(id)v132[5] objectForKeyedSubscript:v40];
          if (v42) {
            BOOL v43 = 1;
          }
          else {
            BOOL v43 = v41 == 0;
          }
          if (v43)
          {
          }
          else
          {
            char v44 = [(__CFString *)v40 isEqualToString:v41];
            if ((v44 & 1) == 0)
            {
              if (IMOSLoggingEnabled())
              {
                dispatch_time_t v45 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v144 = 138412546;
                  v145 = v40;
                  __int16 v146 = 2112;
                  v147 = v41;
                  _os_log_impl(&dword_1AFB53000, v45, OS_LOG_TYPE_INFO, "Requested download of file transfer with GUID %@ failed, but was able to derive a suggested retry GUID %@", v144, 0x16u);
                }
              }
              [v86 addObject:v41];
            }
          }
        }
        uint64_t v37 = [v36 countByEnumeratingWithState:&v98 objects:v140 count:16];
      }
      while (v37);
    }

    if ([v86 count])
    {
      v46 = dispatch_group_create();
      for (unint64_t m = 0; m < [v86 count]; ++m)
        dispatch_group_enter(v46);
      id v48 = [(IMDBaseSpotlightIndexController *)self delegate];
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = sub_1AFBA8EB4;
      v94[3] = &unk_1E5F95010;
      v96 = &v119;
      v97 = &v131;
      v49 = v46;
      id v95 = v49;
      [v48 retrieveLocalFileURLForFileTransferWithGUIDs:v86 options:a6 completion:v94];

      if (IMOSLoggingEnabled())
      {
        v50 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v144 = 0;
          _os_log_impl(&dword_1AFB53000, v50, OS_LOG_TYPE_INFO, "Beginning blocking index extension on secondary file transfer download.", v144, 2u);
        }
      }
      dispatch_time_t v51 = dispatch_time(0, 180000000000);
      dispatch_group_wait(v49, v51);
      if (IMOSLoggingEnabled())
      {
        v52 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v144 = 0;
          _os_log_impl(&dword_1AFB53000, v52, OS_LOG_TYPE_INFO, "Finished blocking index extension on secondary file transfer download.", v144, 2u);
        }
      }
    }
    if (NSClassFromString(&cfstr_Csfileurlbatch.isa))
    {
      id v89 = objc_opt_new();
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      obja = v80;
      uint64_t v53 = [(__CFString *)obja countByEnumeratingWithState:&v90 objects:v139 count:16];
      if (v53)
      {
        uint64_t v54 = *(void *)v91;
        uint64_t v81 = *MEMORY[0x1E4F6EB18];
        uint64_t v84 = *MEMORY[0x1E4F28568];
        uint64_t v82 = *MEMORY[0x1E4F28588];
        do
        {
          for (uint64_t n = 0; n != v53; ++n)
          {
            if (*(void *)v91 != v54) {
              objc_enumerationMutation(obja);
            }
            uint64_t v56 = *(__CFString **)(*((void *)&v90 + 1) + 8 * n);
            uint64_t v57 = [(id)v132[5] objectForKeyedSubscript:v56];

            if (v57)
            {
              v58 = [(id)v120[5] objectForKeyedSubscript:v56];
              char IsSupportedByPhotos = IMUTITypeIsSupportedByPhotos();

              if ((IsSupportedByPhotos & 1) == 0)
              {
                v60 = (void *)MEMORY[0x1E4F28C58];
                v137[0] = v84;
                v61 = [MEMORY[0x1E4F28B50] mainBundle];
                v62 = [v61 localizedStringForKey:@"File URL fetch operation was unsuccessful." value:&stru_1F084E970 table:0];
                v138[0] = v62;
                v137[1] = v82;
                v63 = NSString;
                v64 = [(id)v120[5] objectForKeyedSubscript:v56];
                v65 = [v63 stringWithFormat:@"File transfer had an unsupported UTI %@", v64];
                v138[1] = v65;
                v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v138 forKeys:v137 count:2];
                v67 = [v60 errorWithDomain:v81 code:256 userInfo:v66];

                [(id)v126[5] setObject:v67 forKeyedSubscript:v56];
                if (IMOSLoggingEnabled())
                {
                  v68 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
                  {
                    v69 = [(id)v120[5] objectForKeyedSubscript:v56];
                    *(_DWORD *)v144 = 138412546;
                    v145 = v56;
                    __int16 v146 = 2112;
                    v147 = v69;
                    _os_log_impl(&dword_1AFB53000, v68, OS_LOG_TYPE_INFO, "File transfer with GUID %@ had unsupported UTI type %@", v144, 0x16u);
                  }
                }
              }
            }
            id v70 = objc_alloc(MEMORY[0x1E4F237D8]);
            v71 = [(id)v132[5] objectForKeyedSubscript:v56];
            uint64_t v72 = [(id)v126[5] objectForKeyedSubscript:v56];
            v73 = (void *)[v70 initWithFileURL:v71 andError:v72];

            if (v73) {
              [v89 addObject:v73];
            }
          }
          uint64_t v53 = [(__CFString *)obja countByEnumeratingWithState:&v90 objects:v139 count:16];
        }
        while (v53);
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v74 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v144 = 0;
          _os_log_impl(&dword_1AFB53000, v74, OS_LOG_TYPE_INFO, "class CSFileURLBatchResult not found!", v144, 2u);
        }
      }
      id v89 = 0;
    }

    _Block_object_dispose(&v113, 8);
    _Block_object_dispose(&v119, 8);

    _Block_object_dispose(&v125, 8);
    _Block_object_dispose(&v131, 8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v89 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v89;
}

- (id)dataForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412546;
      id v19 = v10;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "Spotlight requesting data for item %@ and type %@", (uint8_t *)&v18, 0x16u);
    }
  }
  id v13 = v10;
  if ([v13 length])
  {
    uint64_t v14 = +[IMDSpotlightDataProvider dataProviderForIdentifier:v11];
    if (v14)
    {
      dispatch_time_t v15 = (void *)MEMORY[0x1B3E8A120]();
      intptr_t v16 = [v14 dataForGUID:v13 error:a6];
    }
    else
    {
      intptr_t v16 = 0;
    }
  }
  else
  {
    intptr_t v16 = 0;
  }

  return v16;
}

- (void)searchableItemsDidUpdate:(id)a3 mask:(int64_t)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([MEMORY[0x1E4F6E790] messageSummarizationEnabled])
  {
    if ((a4 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        id v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 134217984;
          int64_t v50 = a4;
          _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "searchableItemsDidUpdate called with reason other than summaries (%ld), returning early.", buf, 0xCu);
        }
      }
      goto LABEL_62;
    }
    v41 = self;
    uint64_t v9 = [v6 count];
    int v10 = IMOSLoggingEnabled();
    if (v9)
    {
      id v42 = v6;
      if (v10)
      {
        id v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 134217984;
          int64_t v50 = [v6 count];
          _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "Received searchableItemsDidUpdate callback with %llu items", buf, 0xCu);
        }
      }
      id v44 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      obuint64_t j = v6;
      uint64_t v12 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v46;
LABEL_17:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v46 != v13) {
            objc_enumerationMutation(obj);
          }
          dispatch_time_t v15 = *(void **)(*((void *)&v45 + 1) + 8 * v14);
          intptr_t v16 = [v15 uniqueIdentifier];
          uint64_t v17 = [v15 attributeSet];
          int v18 = [v17 domainIdentifier];
          int v19 = [v18 isEqualToString:@"attachmentDomain"];

          if (v19)
          {
            __int16 v20 = [v15 attributeSet];
            uint64_t v21 = [v20 ownerIdentifier];

            intptr_t v16 = (void *)v21;
          }
          if (![v16 length])
          {
            uint64_t v39 = IMLogHandleForCategory();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
              sub_1AFC67E44((uint64_t)v15, v39);
            }

            goto LABEL_57;
          }
          uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F6E868]) initWithEncodedMessagePartGUID:v16];
          dispatch_time_t v23 = [v22 messageGUID];

          if (v23)
          {
            uint64_t v24 = [v22 messageGUID];

            intptr_t v16 = (void *)v24;
          }
          v25 = [v15 attributeSet];
          BOOL v26 = [v25 summarizationStatus] == 1;

          if (!v26)
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v35 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                id v36 = [v15 attributeSet];
                int v37 = [v36 summarizationStatus];
                *(_DWORD *)long long buf = 138412546;
                int64_t v50 = (int64_t)v16;
                __int16 v51 = 1024;
                int v52 = v37;
                _os_log_impl(&dword_1AFB53000, v35, OS_LOG_TYPE_INFO, "Item with identifier %@ has unsuccessful summarization status (%d). Will delete old summary.", buf, 0x12u);
              }
            }
            id v28 = objc_alloc_init(MEMORY[0x1E4F28B18]);
            [v44 setObject:v28 forKey:v16];
            goto LABEL_48;
          }
          uint64_t v27 = [v15 attributeSet];
          id v28 = [v27 summarizationContentTopic];

          uint64_t v29 = [v15 attributeSet];
          v30 = [v29 summarizationContentTopLine];

          v31 = [v15 attributeSet];
          v32 = [v31 summarizationContentSynopsis];

          if (v30)
          {
            BOOL v33 = v30;
            if (IMOSLoggingEnabled())
            {
              v34 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138412290;
                int64_t v50 = (int64_t)v16;
                _os_log_impl(&dword_1AFB53000, v34, OS_LOG_TYPE_INFO, "Using topLine as summary for item with GUID %@.", buf, 0xCu);
              }
LABEL_45:
            }
          }
          else if (v32)
          {
            BOOL v33 = v32;
            if (IMOSLoggingEnabled())
            {
              v34 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138412290;
                int64_t v50 = (int64_t)v16;
                _os_log_impl(&dword_1AFB53000, v34, OS_LOG_TYPE_INFO, "Using synopsis as summary for item with GUID %@.", buf, 0xCu);
              }
              goto LABEL_45;
            }
          }
          else
          {
            if (!v28)
            {
              BOOL v33 = IMLogHandleForCategory();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412290;
                int64_t v50 = (int64_t)v16;
                _os_log_error_impl(&dword_1AFB53000, v33, OS_LOG_TYPE_ERROR, "Unexpectedly received nil summary for item with identifier (%@) while summarization status was successful.", buf, 0xCu);
              }
              goto LABEL_47;
            }
            BOOL v33 = v28;
            if (IMOSLoggingEnabled())
            {
              v34 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138412290;
                int64_t v50 = (int64_t)v16;
                _os_log_impl(&dword_1AFB53000, v34, OS_LOG_TYPE_INFO, "Using topic as summary for item with GUID %@.", buf, 0xCu);
              }
              goto LABEL_45;
            }
          }
          [v44 setObject:v33 forKey:v16];
LABEL_47:

LABEL_48:
          if (v12 == ++v14)
          {
            uint64_t v38 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
            uint64_t v12 = v38;
            if (v38) {
              goto LABEL_17;
            }
            break;
          }
        }
      }

      obuint64_t j = [(IMDBaseSpotlightIndexController *)v41 delegate];
      [obj updateChatsUsingMessageGUIDsAndSummaries:v44];
LABEL_57:

      id v6 = v42;
    }
    else if (v10)
    {
      v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1AFB53000, v40, OS_LOG_TYPE_INFO, "searchableItemsDidUpdate called with no updated items, returning early.", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1AFC67EBC(v8);
    }
  }
LABEL_62:
}

- (IMDBaseSpotlightIndexControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IMDBaseSpotlightIndexControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end