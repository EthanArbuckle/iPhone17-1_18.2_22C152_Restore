@interface IMTranscriptionUtilities
+ (id)localizedSeparatorString;
+ (id)transcoderBundle;
+ (void)commitTranscriptionWithString:(id)a3 confidenceSum:(double)a4 numberOfSegments:(unint64_t)a5 completion:(id)a6;
+ (void)transcribeAudioForAudioTransferURL:(id)a3 withCompletion:(id)a4;
@end

@implementation IMTranscriptionUtilities

+ (void)transcribeAudioForAudioTransferURL:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F17BA0]);
    if (objc_msgSend_supportsOnDeviceRecognition(v7, v8, v9, v10, v11, v12, v13))
    {
      objc_msgSend_setDefaultTaskHint_(v7, v14, 1, v15, v16, v17, v18);
      if (objc_msgSend_isAvailable(v7, v19, v20, v21, v22, v23, v24))
      {
        id v25 = objc_alloc(MEMORY[0x263F17BA8]);
        v31 = objc_msgSend_initWithURL_(v25, v26, (uint64_t)v5, v27, v28, v29, v30);
        objc_msgSend_setRequiresOnDeviceRecognition_(v31, v32, 1, v33, v34, v35, v36);
        objc_msgSend_setAddsPunctuation_(v31, v37, 1, v38, v39, v40, v41);
        objc_msgSend_setShouldReportPartialResults_(v31, v42, 0, v43, v44, v45, v46);
        *(void *)buf = 0;
        v75 = buf;
        uint64_t v76 = 0x3032000000;
        v77 = sub_22B295298;
        v78 = sub_22B2952A8;
        v79 = &stru_26DE87A58;
        v73[0] = 0;
        v73[1] = v73;
        v73[2] = 0x2020000000;
        v73[3] = 0;
        v72[0] = 0;
        v72[1] = v72;
        v72[2] = 0x2020000000;
        v72[3] = 0;
        v67[0] = MEMORY[0x263EF8330];
        v67[1] = 3221225472;
        v67[2] = sub_22B2952B0;
        v67[3] = &unk_26488EA58;
        id v68 = v6;
        v69 = buf;
        v70 = v73;
        v71 = v72;
        id v51 = (id)objc_msgSend_recognitionTaskWithRequest_resultHandler_(v7, v47, (uint64_t)v31, (uint64_t)v67, v48, v49, v50);

        _Block_object_dispose(v72, 8);
        _Block_object_dispose(v73, 8);
        _Block_object_dispose(buf, 8);

LABEL_17:
        goto LABEL_18;
      }
      if (IMOSLoggingEnabled())
      {
        v62 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v62, OS_LOG_TYPE_INFO, "Speech recognizer is not available.", buf, 2u);
        }
      }
      id v63 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v61 = objc_msgSend_initWithDomain_code_userInfo_(v63, v64, @"__kIMTranscriptionGenerationErrorDomain", 2, 0, v65, v66);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v56 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v56, OS_LOG_TYPE_INFO, "Speech recognizer does not support on device recognition. There are likely missing assets.", buf, 2u);
        }
      }
      id v57 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v61 = objc_msgSend_initWithDomain_code_userInfo_(v57, v58, @"__kIMTranscriptionGenerationErrorDomain", 1, 0, v59, v60);
    }
    v31 = (void *)v61;
    (*((void (**)(id, void, uint64_t))v6 + 2))(v6, 0, v61);
    goto LABEL_17;
  }
  id v52 = objc_alloc(MEMORY[0x263F087E8]);
  id v7 = (id)objc_msgSend_initWithDomain_code_userInfo_(v52, v53, @"__kIMTranscriptionGenerationErrorDomain", 0, 0, v54, v55);
  (*((void (**)(id, void, id))v6 + 2))(v6, 0, v7);
LABEL_18:
}

+ (id)localizedSeparatorString
{
  id v7 = objc_msgSend_transcoderBundle(IMTranscriptionUtilities, a2, v2, v3, v4, v5, v6);
  v14 = objc_msgSend_autoupdatingCurrentLocale(MEMORY[0x263EFF960], v8, v9, v10, v11, v12, v13);
  uint64_t v21 = objc_msgSend_localeIdentifier(v14, v15, v16, v17, v18, v19, v20);

  uint64_t v22 = (void *)MEMORY[0x263F086E0];
  uint64_t v29 = objc_msgSend_localizations(v7, v23, v24, v25, v26, v27, v28);
  uint64_t v36 = objc_msgSend_preferredLanguages(MEMORY[0x263EFF960], v30, v31, v32, v33, v34, v35);
  uint64_t v41 = objc_msgSend_preferredLocalizationsFromArray_forPreferences_(v22, v37, (uint64_t)v29, (uint64_t)v36, v38, v39, v40);
  uint64_t v48 = objc_msgSend_firstObject(v41, v42, v43, v44, v45, v46, v47);

  if (v48) {
    objc_msgSend_localizedStringForKey_value_table_localization_(v7, v49, @"SPEECH_PAUSE_SEPARATOR_BETWEEN_2_PARTS_OF_SENTENCE", 0, @"TranscriptionStrings", (uint64_t)v48, v50);
  }
  else {
  id v51 = objc_msgSend_localizedStringForKey_value_table_localization_(v7, v49, @"SPEECH_PAUSE_SEPARATOR_BETWEEN_2_PARTS_OF_SENTENCE", 0, @"TranscriptionStrings", (uint64_t)v21, v50);
  }

  return v51;
}

+ (id)transcoderBundle
{
  if (qword_2683E9580 != -1) {
    dispatch_once(&qword_2683E9580, &unk_26DE875D8);
  }
  uint64_t v2 = (void *)qword_2683E9578;
  return v2;
}

+ (void)commitTranscriptionWithString:(id)a3 confidenceSum:(double)a4 numberOfSegments:(unint64_t)a5 completion:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v9 = a3;
  uint64_t v16 = (void (**)(id, id, void))a6;
  if (a5)
  {
    if (objc_msgSend_length(v9, v10, v11, v12, v13, v14, v15))
    {
      if (a4 / (double)a5 >= 0.6)
      {
        v16[2](v16, v9, 0);
        goto LABEL_20;
      }
      id v17 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v21 = objc_msgSend_initWithDomain_code_userInfo_(v17, v18, @"__kIMTranscriptionGenerationErrorDomain", 4, 0, v19, v20);
      if (IMOSLoggingEnabled())
      {
        uint64_t v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          int v33 = 138412290;
          uint64_t v34 = v21;
          _os_log_impl(&dword_22B280000, v22, OS_LOG_TYPE_INFO, "The transcription has a low confidence score, it is likely the audio was in a different language to the system language: %@", (uint8_t *)&v33, 0xCu);
        }
      }
    }
    else
    {
      id v28 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v21 = objc_msgSend_initWithDomain_code_userInfo_(v28, v29, @"__kIMTranscriptionGenerationErrorDomain", 3, 0, v30, v31);
      if (IMOSLoggingEnabled())
      {
        uint64_t v32 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          int v33 = 138412290;
          uint64_t v34 = v21;
          _os_log_impl(&dword_22B280000, v32, OS_LOG_TYPE_INFO, "The transcription has no text: %@", (uint8_t *)&v33, 0xCu);
        }
      }
    }
  }
  else
  {
    id v23 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v21 = objc_msgSend_initWithDomain_code_userInfo_(v23, v24, @"__kIMTranscriptionGenerationErrorDomain", 5, 0, v25, v26);
    if (IMOSLoggingEnabled())
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        int v33 = 138412290;
        uint64_t v34 = v21;
        _os_log_impl(&dword_22B280000, v27, OS_LOG_TYPE_INFO, "There are no segments to transcribe: %@", (uint8_t *)&v33, 0xCu);
      }
    }
  }
  ((void (**)(id, id, void *))v16)[2](v16, 0, v21);

LABEL_20:
}

@end