uint64_t sub_217F27098()
{
  uint64_t vars8;

  qword_26AC13670 = objc_alloc_init(IMTranscodeController);
  return MEMORY[0x270F9A758]();
}

void sub_217F27374(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (MEMORY[0x21D45C930]() != MEMORY[0x263EF8720]) {
    goto LABEL_2;
  }
  if (v3 == (id)MEMORY[0x263EF86A0])
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_2;
    }
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217F26000, v6, OS_LOG_TYPE_INFO, "Transcoder service interrupted", buf, 2u);
    }
    goto LABEL_8;
  }
  id v4 = (id)MEMORY[0x263EF86A8];
  int v5 = IMOSLoggingEnabled();
  if (v3 != v4)
  {
    if (!v5) {
      goto LABEL_2;
    }
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
      *(_DWORD *)buf = 136315138;
      v11 = string;
      _os_log_impl(&dword_217F26000, v6, OS_LOG_TYPE_INFO, "Unexpected error for transcoder service: %s", buf, 0xCu);
    }
LABEL_8:

    goto LABEL_2;
  }
  if (v5)
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217F26000, v8, OS_LOG_TYPE_INFO, "Transcoder service invalid", buf, 2u);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_217F275C4;
  block[3] = &unk_2642F1928;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
LABEL_2:
}

uint64_t sub_217F275C4(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__disconnected);
}

void sub_217F27A74(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v10 = *(void *)(a1 + 32);
  id v22 = 0;
  char v11 = [v9 removeItemAtURL:v10 error:&v22];
  id v12 = v22;

  if (v11)
  {
    if (a2)
    {
      v13 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v14 = *(void *)(a1 + 32);
      id v21 = v12;
      char v15 = [v13 moveItemAtURL:v7 toURL:v14 error:&v21];
      id v16 = v21;

      if ((v15 & 1) == 0 && IMOSLoggingEnabled())
      {
        v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138412802;
          id v24 = v7;
          __int16 v25 = 2112;
          id v26 = v20;
          __int16 v27 = 2112;
          id v28 = v16;
          _os_log_impl(&dword_217F26000, v19, OS_LOG_TYPE_INFO, "Error moving safe transfer (%@) to original transfer path (%@) with error: %@", buf, 0x20u);
        }
      }
      id v12 = v16;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v24 = v18;
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_impl(&dword_217F26000, v17, OS_LOG_TYPE_INFO, "Error removing original transfer (%@) error: %@", buf, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_217F27F8C(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x21D45C930]();
  if (v4 != MEMORY[0x263EF8720])
  {
    if (v4 == MEMORY[0x263EF8708])
    {
      uint64_t v18 = IMGetXPCBoolFromDictionary();
      IMGetXPCCodableFromDictionaryWithStandardAllowlist();
      v17 = (char *)objc_claimAutoreleasedReturnValue();
      id v16 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
      v19 = (char *)MEMORY[0x21D45C900](v3);
      if (IMOSLoggingEnabled())
      {
        v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138413058;
          uint64_t v29 = v21;
          __int16 v30 = 2112;
          v31 = v17;
          __int16 v32 = 2080;
          v33 = v19;
          __int16 v34 = 2112;
          v35 = v16;
          _os_log_impl(&dword_217F26000, v20, OS_LOG_TYPE_INFO, "received reply for GenerateSafeRender for %@, previewURL: %@ reply: %s error: %@", buf, 0x2Au);
        }
      }
      free(v19);
      goto LABEL_25;
    }
    if (IMOSLoggingEnabled())
    {
      int v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
        *(_DWORD *)buf = 138412546;
        uint64_t v29 = v6;
        __int16 v30 = 2080;
        v31 = string;
        _os_log_impl(&dword_217F26000, v5, OS_LOG_TYPE_INFO, "received unknown error for GenerateSafeRender for %@: %s", buf, 0x16u);
      }
    }
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMTranscodeErrorDomain" code:-1 userInfo:0];
LABEL_24:
    id v16 = (void *)v8;
    v17 = 0;
    uint64_t v18 = 0;
LABEL_25:
    uint64_t v25 = *(void *)(a1 + 48);
    if (v25) {
      (*(void (**)(uint64_t, uint64_t, char *, void *))(v25 + 16))(v25, v18, v17, v16);
    }
    goto LABEL_27;
  }
  int v9 = *(_DWORD *)(a1 + 96);
  int v10 = IMOSLoggingEnabled();
  if (v9 > 4)
  {
    if (v10)
    {
      id v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = *(void *)(a1 + 32);
        id v24 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
        *(_DWORD *)buf = 138412546;
        uint64_t v29 = v23;
        __int16 v30 = 2080;
        v31 = v24;
        _os_log_impl(&dword_217F26000, v22, OS_LOG_TYPE_INFO, "received error (final) for GenerateSafeRender for %@: %s", buf, 0x16u);
      }
    }
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMTranscodeErrorDomain" code:-8 userInfo:0];
    goto LABEL_24;
  }
  if (v10)
  {
    char v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(int *)(a1 + 96);
      v13 = *(const char **)(a1 + 32);
      uint64_t v14 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
      *(_DWORD *)buf = 134218498;
      uint64_t v29 = v12;
      __int16 v30 = 2112;
      v31 = v13;
      __int16 v32 = 2080;
      v33 = v14;
      _os_log_impl(&dword_217F26000, v11, OS_LOG_TYPE_INFO, "received error (retry %lu) for GenerateSafeRender for %@: %s, retrying", buf, 0x20u);
    }
  }
  int8x16_t v26 = *(int8x16_t *)(a1 + 32);
  id v15 = (id)v26.i64[0];
  id v27 = *(id *)(a1 + 48);
  im_dispatch_after();

  id v16 = 0;
  v17 = 0;
LABEL_27:
}

void sub_217F283E4(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x217F28350);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_217F28444(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = (*(_DWORD *)(a1 + 96) + 1);
  uint64_t v4 = *(void *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 72);
  v7[0] = *(_OWORD *)(a1 + 56);
  v7[1] = v5;
  uint64_t v8 = *(void *)(a1 + 88);
  return [v2 _generateSafeRender:v1 constraints:v7 retries:v3 completionBlock:v4];
}

void sub_217F28D20(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v20 = a2;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  os_activity_scope_leave((os_activity_scope_state_t)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
  uint64_t v19 = *(void *)(a1 + 32);
  if (v19) {
    (*(void (**)(uint64_t, id, id, id, id, uint64_t, uint64_t, id))(v19 + 16))(v19, v20, v15, v16, v17, a6, a7, v18);
  }
}

void sub_217F28E04(uint64_t a1, void *a2)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  xpc_object_t xdict = a2;
  uint64_t v3 = MEMORY[0x21D45C930]();
  uint64_t v60 = a1;
  if (v3 != MEMORY[0x263EF8720])
  {
    if (v3 != MEMORY[0x263EF8708])
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v4 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          long long v5 = *(void **)(a1 + 32);
          string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86B0]);
          *(_DWORD *)buf = 138412546;
          v87 = v5;
          __int16 v88 = 2080;
          id v89 = (id)string;
          _os_log_impl(&dword_217F26000, v4, OS_LOG_TYPE_INFO, "received unknown error for TranscodeFile for %@: %s", buf, 0x16u);
        }
      }
      v59 = IMSingleObjectArray();
      uint64_t v7 = *(void *)(a1 + 96);
      uint64_t v8 = *(void *)(a1 + 32);
      v58 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMTranscodeErrorDomain" code:-1 userInfo:0];
      (*(void (**)(uint64_t, uint64_t, void *, void, void *, void, void, void))(v7 + 16))(v7, v8, v59, 0, v58, 0, 0, 0);
      goto LABEL_43;
    }
    HIDWORD(v54) = IMGetXPCBoolFromDictionary();
    v59 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    id v22 = (char *)MEMORY[0x21D45C900](xdict);
    if (IMOSLoggingEnabled())
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        id v24 = *(void **)(a1 + 32);
        uint64_t v25 = @"NO";
        *(_DWORD *)buf = 138413058;
        if (HIDWORD(v54)) {
          uint64_t v25 = @"YES";
        }
        v87 = v24;
        __int16 v88 = 2112;
        id v89 = v25;
        __int16 v90 = 2080;
        v91 = v22;
        __int16 v92 = 2112;
        v93 = v59;
        _os_log_impl(&dword_217F26000, v23, OS_LOG_TYPE_INFO, "received reply for TranscodeFile for %@, success: %@ reply: %s error: %@", buf, 0x2Au);
      }
    }
    free(v22);
    LODWORD(v54) = IMGetXPCBoolFromDictionary();
    v58 = IMGetXPCStringFromDictionary();
    v57 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    v56 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    v55 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    id v26 = [MEMORY[0x263F4A840] sharedInstance];
    if ([v26 isInternalInstall])
    {
      int v27 = IMGetCachedDomainBoolForKey();

      if (!v27)
      {
LABEL_34:
        uint64_t v39 = *(void *)(v60 + 96);
        if (v58)
        {
          v40 = objc_msgSend(NSURL, "fileURLWithPath:");
          (*(void (**)(uint64_t, void *, void *, void *, void *, void, void, void *))(v39 + 16))(v39, v40, v57, v56, v59, HIDWORD(v54), v54, v55);
        }
        else
        {
          (*(void (**)(uint64_t, void, void *, void *, void *, void, void, void *))(v39 + 16))(v39, 0, v57, v56, v59, HIDWORD(v54), v54, v55);
        }

LABEL_43:
        if (*(void *)(v60 + 88))
        {
          if (IMOSLoggingEnabled())
          {
            v46 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              v47 = *(void **)(v60 + 88);
              *(_DWORD *)buf = 138412290;
              v87 = v47;
              _os_log_impl(&dword_217F26000, v46, OS_LOG_TYPE_INFO, "Removing the link we created before: %@", buf, 0xCu);
            }
          }
          v48 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", v54);
          uint64_t v49 = *(void *)(v60 + 88);
          id v63 = 0;
          char v50 = [v48 removeItemAtURL:v49 error:&v63];
          id v51 = v63;

          if ((v50 & 1) == 0 && IMOSLoggingEnabled())
          {
            v52 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              v53 = *(void **)(v60 + 88);
              *(_DWORD *)buf = 138412546;
              v87 = v53;
              __int16 v88 = 2112;
              id v89 = v51;
              _os_log_impl(&dword_217F26000, v52, OS_LOG_TYPE_INFO, "Unlink of %@ failed! error: %@", buf, 0x16u);
            }
          }
        }
        goto LABEL_54;
      }
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v26 = v57;
      uint64_t v28 = [v26 countByEnumeratingWithState:&v64 objects:v85 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v65 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            __int16 v32 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", v54);
            v33 = [v31 path];
            __int16 v34 = [v33 lastPathComponent];
            v35 = [v32 _randomTemporaryPathWithFileName:v34];

            if (IMOSLoggingEnabled())
            {
              uint64_t v36 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v87 = v31;
                __int16 v88 = 2112;
                id v89 = v35;
                _os_log_impl(&dword_217F26000, v36, OS_LOG_TYPE_INFO, "Stashing aside transcoded URL: %@ to %@", buf, 0x16u);
              }
            }
            v37 = [MEMORY[0x263F08850] defaultManager];
            v38 = [v31 path];
            [v37 copyItemAtPath:v38 toPath:v35 error:0];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v64 objects:v85 count:16];
        }
        while (v28);
      }
    }

    goto LABEL_34;
  }
  int v9 = *(_DWORD *)(a1 + 128);
  int v10 = IMOSLoggingEnabled();
  if (v9 > 4)
  {
    if (v10)
    {
      v41 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v42 = *(void **)(a1 + 32);
        v43 = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86B0]);
        *(_DWORD *)buf = 138412546;
        v87 = v42;
        __int16 v88 = 2080;
        id v89 = (id)v43;
        _os_log_impl(&dword_217F26000, v41, OS_LOG_TYPE_INFO, "received error (final) for TranscodeFile for %@: %s", buf, 0x16u);
      }
    }
    v59 = IMSingleObjectArray();
    uint64_t v44 = *(void *)(a1 + 96);
    uint64_t v45 = *(void *)(a1 + 32);
    v58 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMTranscodeErrorDomain" code:-8 userInfo:0];
    (*(void (**)(uint64_t, uint64_t, void *, void, void *, void, void, void))(v44 + 16))(v44, v45, v59, 0, v58, 0, 0, 0);
    goto LABEL_43;
  }
  if (v10)
  {
    char v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = (void *)*(int *)(a1 + 128);
      v13 = *(void **)(a1 + 32);
      uint64_t v14 = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86B0]);
      *(_DWORD *)buf = 134218498;
      v87 = v12;
      __int16 v88 = 2112;
      id v89 = v13;
      __int16 v90 = 2080;
      v91 = v14;
      _os_log_impl(&dword_217F26000, v11, OS_LOG_TYPE_INFO, "received error (retry %lu) for TranscodeFile for %@: %s, retrying", buf, 0x20u);
    }
  }
  uint64_t v68 = MEMORY[0x263EF8330];
  uint64_t v69 = 3221225472;
  v70 = sub_217F29828;
  v71 = &unk_2642F1A18;
  int8x16_t v62 = *(int8x16_t *)(a1 + 32);
  id v15 = (id)v62.i64[0];
  int8x16_t v72 = vextq_s8(v62, v62, 8uLL);
  id v73 = *(id *)(a1 + 48);
  char v83 = *(unsigned char *)(a1 + 132);
  id v16 = *(id *)(a1 + 56);
  uint64_t v17 = *(void *)(a1 + 104);
  id v74 = v16;
  uint64_t v79 = v17;
  id v75 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 72);
  uint64_t v19 = *(void *)(a1 + 112);
  id v76 = v18;
  uint64_t v80 = v19;
  id v20 = *(id *)(a1 + 80);
  uint64_t v21 = *(void *)(a1 + 120);
  id v77 = v20;
  uint64_t v81 = v21;
  __int16 v84 = *(_WORD *)(a1 + 133);
  int v82 = *(_DWORD *)(a1 + 128);
  id v78 = *(id *)(a1 + 96);
  im_dispatch_after();

LABEL_54:
}

void sub_217F297A0(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x217F2956CLL);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_217F29828(uint64_t a1)
{
  LOBYTE(v3) = *(unsigned char *)(a1 + 126);
  HIDWORD(v2) = *(_DWORD *)(a1 + 120) + 1;
  LOBYTE(v2) = *(unsigned char *)(a1 + 125);
  return objc_msgSend(*(id *)(a1 + 32), "_transcodeFileTransferContents:utiType:isSticker:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimension:transcoderUserInfo:representations:fallBack:retries:isLQMEnabled:completionBlock:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 124), *(void *)(a1 + 56), *(void *)(a1 + 96), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 104), *(void *)(a1 + 80), *(void *)(a1 + 112), v2, v3, *(void *)(a1 + 88));
}

void sub_217F29D34(uint64_t a1, void *a2)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  xpc_object_t xdict = a2;
  uint64_t v3 = MEMORY[0x21D45C930]();
  if (v3 != MEMORY[0x263EF8720])
  {
    if (v3 != MEMORY[0x263EF8708])
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v4 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          long long v5 = *(void **)(a1 + 32);
          string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86B0]);
          *(_DWORD *)buf = 138412546;
          long long v66 = v5;
          __int16 v67 = 2080;
          uint64_t v68 = (void *)string;
          _os_log_impl(&dword_217F26000, v4, OS_LOG_TYPE_INFO, "received unknown error for TranscodePayloadData for %@: %s", buf, 0x16u);
        }
      }
      uint64_t v7 = *(void *)(a1 + 64);
      if (v7)
      {
        uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMTranscodeErrorDomain" code:-1 userInfo:0];
        (*(void (**)(uint64_t, void, void, void *, void, void))(v7 + 16))(v7, 0, 0, v8, 0, 0);
      }
      goto LABEL_44;
    }
    uint64_t v44 = a1;
    unsigned int v43 = IMGetXPCBoolFromDictionary();
    v47 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    uint64_t v19 = (char *)MEMORY[0x21D45C900](xdict);
    if (IMOSLoggingEnabled())
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = *(void **)(v44 + 32);
        id v22 = @"NO";
        *(_DWORD *)buf = 138413058;
        if (v43) {
          id v22 = @"YES";
        }
        long long v66 = v21;
        __int16 v67 = 2112;
        uint64_t v68 = v22;
        __int16 v69 = 2080;
        v70 = v19;
        __int16 v71 = 2112;
        int8x16_t v72 = v47;
        _os_log_impl(&dword_217F26000, v20, OS_LOG_TYPE_INFO, "received reply for TranscodePayloadData for %@, success: %@ reply: %s error: %@", buf, 0x2Au);
      }
    }
    free(v19);
    v46 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    uint64_t v45 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    unsigned int v42 = IMGetXPCBoolFromDictionary();
    id v23 = [MEMORY[0x263F4A840] sharedInstance];
    if ([v23 isInternalInstall])
    {
      int v24 = IMGetCachedDomainBoolForKey();

      if (!v24)
      {
LABEL_35:
        uint64_t v36 = *(void *)(v44 + 64);
        if (v36) {
          (*(void (**)(uint64_t, void *, void *, void *, void, void))(v36 + 16))(v36, v46, v45, v47, v43, v42);
        }

        goto LABEL_44;
      }
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v23 = v46;
      uint64_t v25 = [v23 countByEnumeratingWithState:&v49 objects:v64 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v50 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v28 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            uint64_t v29 = [MEMORY[0x263F08850] defaultManager];
            __int16 v30 = [v28 path];
            v31 = [v30 lastPathComponent];
            __int16 v32 = [v29 _randomTemporaryPathWithFileName:v31];

            if (IMOSLoggingEnabled())
            {
              v33 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                long long v66 = v28;
                __int16 v67 = 2112;
                uint64_t v68 = v32;
                _os_log_impl(&dword_217F26000, v33, OS_LOG_TYPE_INFO, "Stashing aside transcoded URL: %@ to %@", buf, 0x16u);
              }
            }
            __int16 v34 = [MEMORY[0x263F08850] defaultManager];
            v35 = [v28 path];
            [v34 copyItemAtPath:v35 toPath:v32 error:0];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v49 objects:v64 count:16];
        }
        while (v25);
      }
    }

    goto LABEL_35;
  }
  unint64_t v9 = *(void *)(a1 + 72);
  int v10 = IMOSLoggingEnabled();
  if (v9 > 4)
  {
    if (v10)
    {
      v37 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = *(void **)(a1 + 32);
        uint64_t v39 = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86B0]);
        *(_DWORD *)buf = 138412546;
        long long v66 = v38;
        __int16 v67 = 2080;
        uint64_t v68 = (void *)v39;
        _os_log_impl(&dword_217F26000, v37, OS_LOG_TYPE_INFO, "received error (final) for TranscodePayloadData for %@: %s", buf, 0x16u);
      }
    }
    uint64_t v40 = *(void *)(a1 + 64);
    if (v40)
    {
      v41 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMTranscodeErrorDomain" code:-8 userInfo:0];
      (*(void (**)(uint64_t, void, void, void *, void, void))(v40 + 16))(v40, 0, 0, v41, 0, 0);
    }
  }
  else
  {
    if (v10)
    {
      char v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = *(void **)(a1 + 72);
        v13 = *(void **)(a1 + 32);
        uint64_t v14 = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86B0]);
        *(_DWORD *)buf = 134218498;
        long long v66 = v12;
        __int16 v67 = 2112;
        uint64_t v68 = v13;
        __int16 v69 = 2080;
        v70 = v14;
        _os_log_impl(&dword_217F26000, v11, OS_LOG_TYPE_INFO, "received error (retry %lu) for TranscodePayloadData for %@: %s, retrying", buf, 0x20u);
      }
    }
    uint64_t v53 = MEMORY[0x263EF8330];
    uint64_t v54 = 3221225472;
    v55 = sub_217F2A4C0;
    v56 = &unk_2642F1A68;
    id v15 = *(void **)(a1 + 48);
    uint64_t v57 = *(void *)(a1 + 40);
    id v58 = v15;
    id v59 = *(id *)(a1 + 32);
    id v16 = *(id *)(a1 + 56);
    id v18 = *(void **)(a1 + 64);
    uint64_t v17 = *(void *)(a1 + 72);
    id v60 = v16;
    uint64_t v62 = v17;
    char v63 = *(unsigned char *)(a1 + 80);
    id v61 = v18;
    im_dispatch_after();
  }
LABEL_44:
}

void sub_217F2A460(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x217F2A3C4);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_217F2A4C0(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__transcodeFileTransferPayloadData_balloonBundleID_attachments_retries_fallBack_completionBlock_);
}

void sub_217F2A8E8(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x21D45C930]();
  if (v4 == MEMORY[0x263EF8720])
  {
    if (IMOSLoggingEnabled())
    {
      int v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
        int v20 = 138412546;
        uint64_t v21 = v11;
        __int16 v22 = 2080;
        id v23 = (void *)string;
        _os_log_impl(&dword_217F26000, v10, OS_LOG_TYPE_INFO, "received error for GenerateSnapshot for %@: %s", (uint8_t *)&v20, 0x16u);
      }
    }
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13)
    {
      unint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMTranscodeErrorDomain" code:-8 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v9);
      goto LABEL_23;
    }
  }
  else
  {
    if (v4 == MEMORY[0x263EF8708])
    {
      uint64_t v14 = IMGetXPCBoolFromDictionary();
      unint64_t v9 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
      id v15 = (void *)MEMORY[0x21D45C900](v3);
      if (IMOSLoggingEnabled())
      {
        id v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          uint64_t v17 = *(void *)(a1 + 32);
          id v18 = @"NO";
          int v20 = 138413058;
          if (v14) {
            id v18 = @"YES";
          }
          uint64_t v21 = v17;
          __int16 v22 = 2112;
          id v23 = v18;
          __int16 v24 = 2080;
          uint64_t v25 = v15;
          __int16 v26 = 2112;
          int v27 = v9;
          _os_log_impl(&dword_217F26000, v16, OS_LOG_TYPE_INFO, "received reply for GenerateSnapshot for %@, success: %@ reply: %s error: %@", (uint8_t *)&v20, 0x2Au);
        }
      }
      free(v15);
      uint64_t v19 = *(void *)(a1 + 40);
      if (v19) {
        (*(void (**)(uint64_t, uint64_t, void *))(v19 + 16))(v19, v14, v9);
      }
      goto LABEL_23;
    }
    if (IMOSLoggingEnabled())
    {
      long long v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v7 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
        int v20 = 138412546;
        uint64_t v21 = v6;
        __int16 v22 = 2080;
        id v23 = (void *)v7;
        _os_log_impl(&dword_217F26000, v5, OS_LOG_TYPE_INFO, "received unknown error for GenerateSnapshot for %@: %s", (uint8_t *)&v20, 0x16u);
      }
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      unint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMTranscodeErrorDomain" code:-1 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
LABEL_23:
    }
  }
}

void sub_217F2AC18(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x217F2AA98);
  }
  _Unwind_Resume(a1);
}

void sub_217F2ADE0(uint64_t a1, uint64_t a2, void *a3, double a4, double a5)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  if (*(void *)(a1 + 32))
  {
    int v10 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)(a1 + 32);
    if (a2)
    {
      uint64_t v19 = @"__kIMPreviewGenerationSucceededNotificationSizeUserInfoKey";
      *(double *)id v16 = a4;
      *(double *)&v16[1] = a5;
      uint64_t v13 = [MEMORY[0x263F08D40] valueWithBytes:v16 objCType:"{CGSize=dd}"];
      v20[0] = v13;
      uint64_t v14 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      [v11 postNotificationName:@"__kIMPreviewGenerationSucceededNotificationName" object:v12 userInfo:v14];
    }
    else
    {
      if (!v9)
      {
        [v10 postNotificationName:@"__kIMPreviewGenerationFailedNotificationName" object:*(void *)(a1 + 32) userInfo:0];
        goto LABEL_7;
      }
      uint64_t v17 = @"__kIMPreviewGenerationFailedNotificationErrorUserInfoKey";
      id v18 = v9;
      uint64_t v13 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      [v11 postNotificationName:@"__kIMPreviewGenerationFailedNotificationName" object:v12 userInfo:v13];
    }

LABEL_7:
  }
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(uint64_t, uint64_t, id, double, double))(v15 + 16))(v15, a2, v9, a4, a5);
  }
}

void sub_217F2B4D4(uint64_t a1, void *a2)
{
  v46[3] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x21D45C930]();
  if (v4 == MEMORY[0x263EF8720])
  {
    if (*(void *)(a1 + 88))
    {
      uint64_t v12 = [MEMORY[0x263F4AFD0] sharedInstance];
      uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"IMPreviewGeneratorDomain" code:2 userInfo:0];
      [v12 forceAutoBugCaptureWithSubType:@"Transcoder Preview Generation Failure" errorPayload:v13];

      if (IMOSLoggingEnabled())
      {
        uint64_t v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          uint64_t v15 = *(void *)(a1 + 32);
          string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v15;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = string;
          _os_log_impl(&dword_217F26000, v14, OS_LOG_TYPE_INFO, "received error (final) for GeneratePreview for %@: %s", buf, 0x16u);
        }
      }
      uint64_t v17 = *(void *)(a1 + 80);
      if (v17)
      {
        id v18 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMTranscodeErrorDomain" code:-8 userInfo:0];
        (*(void (**)(uint64_t, void, void *, double, double))(v17 + 16))(v17, 0, v18, 0.0, 0.0);
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          uint64_t v30 = *(void *)(a1 + 88);
          uint64_t v31 = *(void *)(a1 + 32);
          __int16 v32 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
          *(_DWORD *)buf = 134218498;
          *(void *)&uint8_t buf[4] = v30;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v31;
          *(_WORD *)&buf[22] = 2080;
          *(void *)&buf[24] = v32;
          _os_log_impl(&dword_217F26000, v29, OS_LOG_TYPE_INFO, "received error (retry %lu) for GeneratePreview for %@: %s, retrying", buf, 0x20u);
        }
      }
      uint64_t v34 = *(void *)(a1 + 32);
      v33 = *(void **)(a1 + 40);
      uint64_t v35 = *(void *)(a1 + 48);
      uint64_t v36 = *(void *)(a1 + 56);
      uint64_t v37 = *(void *)(a1 + 80);
      uint64_t v38 = *(void *)(a1 + 88) + 1;
      uint64_t v39 = *(void *)(a1 + 64);
      uint64_t v40 = *(void *)(a1 + 72);
      char v41 = *(unsigned char *)(a1 + 136);
      long long v42 = *(_OWORD *)(a1 + 112);
      *(_OWORD *)buf = *(_OWORD *)(a1 + 96);
      *(_OWORD *)&buf[16] = v42;
      v46[0] = *(void *)(a1 + 128);
      LOBYTE(v44) = v41;
      [v33 _generatePreview:v34 previewURL:v35 senderContext:v36 constraints:buf retries:v38 balloonBundleID:v39 transferGUID:v40 completionBlock:v37 blockUntilReply:v44];
    }
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v19 = IMGetXPCBoolFromDictionary();
    int v20 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    uint64_t v21 = (void *)MEMORY[0x21D45C900](v3);
    if (IMOSLoggingEnabled())
    {
      __int16 v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = *(void *)(a1 + 32);
        __int16 v24 = @"NO";
        *(_DWORD *)buf = 138413058;
        if (v19) {
          __int16 v24 = @"YES";
        }
        *(void *)&uint8_t buf[4] = v23;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v24;
        *(_WORD *)&buf[22] = 2080;
        *(void *)&buf[24] = v21;
        LOWORD(v46[0]) = 2112;
        *(void *)((char *)v46 + 2) = v20;
        _os_log_impl(&dword_217F26000, v22, OS_LOG_TYPE_INFO, "received reply for GeneratePreview for %@, success: %@ reply: %s error: %@", buf, 0x2Au);
      }
    }
    free(v21);
    objc_opt_class();
    uint64_t v25 = IMGetXPCKeyedCodableFromDictionaryWithSecureCoding();
    uint64_t v28 = v25;
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    if (v25)
    {
      [v25 getValue:buf size:16];
      v26.n128_u64[0] = *(void *)buf;
      v27.n128_u64[0] = *(void *)&buf[8];
    }
    else
    {
      v27.n128_u64[0] = 0;
      v26.n128_u64[0] = 0;
    }
    uint64_t v43 = *(void *)(a1 + 80);
    if (v43) {
      (*(void (**)(uint64_t, uint64_t, void *, __n128, __n128))(v43 + 16))(v43, v19, v20, v26, v27);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v7 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v6;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v7;
        _os_log_impl(&dword_217F26000, v5, OS_LOG_TYPE_INFO, "received unknown error for GeneratePreview for %@: %s", buf, 0x16u);
      }
    }
    uint64_t v8 = [MEMORY[0x263F4AFD0] sharedInstance];
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"IMPreviewGeneratorDomain" code:1 userInfo:0];
    [v8 forceAutoBugCaptureWithSubType:@"Transcoder Preview Generation Failure" errorPayload:v9];

    uint64_t v10 = *(void *)(a1 + 80);
    if (v10)
    {
      uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMTranscodeErrorDomain" code:-1 userInfo:0];
      (*(void (**)(uint64_t, void, void *, double, double))(v10 + 16))(v10, 0, v11, 0.0, 0.0);
    }
  }
}

void sub_217F2B9E8(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x217F2B948);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_217F2BBB4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  long long v6 = *(_OWORD *)(a1 + 88);
  v9[0] = *(_OWORD *)(a1 + 72);
  v9[1] = v6;
  uint64_t v10 = *(void *)(a1 + 104);
  LOBYTE(v8) = 0;
  return [v2 _generateMetadata:v1 metadataURL:v3 senderContext:v4 constraints:v9 retries:0 completionBlock:v5 blockUntilReply:v8];
}

void sub_217F2C114(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x21D45C930]();
  if (v4 == MEMORY[0x263EF8720])
  {
    if (*(void *)(a1 + 72) > 4uLL)
    {
      __n128 v27 = [MEMORY[0x263F4AFD0] sharedInstance];
      uint64_t v28 = [MEMORY[0x263F087E8] errorWithDomain:@"IMPreviewGeneratorDomain" code:2 userInfo:0];
      [v27 forceAutoBugCaptureWithSubType:@"Transcoder Preview Generation Failure" errorPayload:v28];

      if (IMOSLoggingEnabled())
      {
        uint64_t v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          uint64_t v30 = *(void *)(a1 + 32);
          string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v30;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = string;
          _os_log_impl(&dword_217F26000, v29, OS_LOG_TYPE_INFO, "received error (final) for GenerateMetadata for %@: %s", buf, 0x16u);
        }
      }
      uint64_t v32 = *(void *)(a1 + 64);
      if (v32)
      {
        v33 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMTranscodeErrorDomain" code:-8 userInfo:0];
        (*(void (**)(uint64_t, void, void *, double, double))(v32 + 16))(v32, 0, v33, 0.0, 0.0);
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = *(void *)(a1 + 72);
          uint64_t v14 = *(void *)(a1 + 32);
          uint64_t v15 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
          *(_DWORD *)buf = 134218498;
          *(void *)&uint8_t buf[4] = v13;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v14;
          __int16 v40 = 2080;
          char v41 = v15;
          _os_log_impl(&dword_217F26000, v12, OS_LOG_TYPE_INFO, "received error (retry %lu) for GenerateMetadata for %@: %s, retrying", buf, 0x20u);
        }
      }
      int8x16_t v35 = *(int8x16_t *)(a1 + 32);
      id v16 = (id)v35.i64[0];
      id v36 = *(id *)(a1 + 48);
      id v37 = *(id *)(a1 + 56);
      id v38 = *(id *)(a1 + 64);
      im_dispatch_after();
    }
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v17 = IMGetXPCBoolFromDictionary();
    id v18 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    uint64_t v19 = (char *)MEMORY[0x21D45C900](v3);
    if (IMOSLoggingEnabled())
    {
      int v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = *(void *)(a1 + 32);
        __int16 v22 = @"NO";
        *(_DWORD *)buf = 138413058;
        if (v17) {
          __int16 v22 = @"YES";
        }
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v22;
        __int16 v40 = 2080;
        char v41 = v19;
        __int16 v42 = 2112;
        uint64_t v43 = v18;
        _os_log_impl(&dword_217F26000, v20, OS_LOG_TYPE_INFO, "received reply for GenerateMetadata for %@, success: %@ reply: %s error: %@", buf, 0x2Au);
      }
    }
    free(v19);
    objc_opt_class();
    uint64_t v23 = IMGetXPCKeyedCodableFromDictionaryWithSecureCoding();
    __n128 v26 = v23;
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    if (v23)
    {
      [v23 getValue:buf size:16];
      v24.n128_u64[0] = *(void *)buf;
      v25.n128_u64[0] = *(void *)&buf[8];
    }
    else
    {
      v25.n128_u64[0] = 0;
      v24.n128_u64[0] = 0;
    }
    uint64_t v34 = *(void *)(a1 + 64);
    if (v34) {
      (*(void (**)(uint64_t, uint64_t, void *, __n128, __n128))(v34 + 16))(v34, v17, v18, v24, v25);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v7 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v6;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v7;
        _os_log_impl(&dword_217F26000, v5, OS_LOG_TYPE_INFO, "received unknown error for GenerateMetadata for %@: %s", buf, 0x16u);
      }
    }
    uint64_t v8 = [MEMORY[0x263F4AFD0] sharedInstance];
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"IMPreviewGeneratorDomain" code:1 userInfo:0];
    [v8 forceAutoBugCaptureWithSubType:@"Transcoder Preview Generation Failure" errorPayload:v9];

    uint64_t v10 = *(void *)(a1 + 64);
    if (v10)
    {
      uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMTranscodeErrorDomain" code:-1 userInfo:0];
      (*(void (**)(uint64_t, void, void *, double, double))(v10 + 16))(v10, 0, v11, 0.0, 0.0);
    }
  }
}

void sub_217F2C6DC(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x217F2C620);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_217F2C73C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 104);
  uint64_t v6 = *(void *)(a1 + 112) + 1;
  uint64_t v7 = *(void *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 88);
  char v9 = *(unsigned char *)(a1 + 120);
  v12[0] = *(_OWORD *)(a1 + 72);
  v12[1] = v8;
  uint64_t v13 = v5;
  LOBYTE(v11) = v9;
  return [v2 _generateMetadata:v1 metadataURL:v3 senderContext:v4 constraints:v12 retries:v6 completionBlock:v7 blockUntilReply:v11];
}

void sub_217F2CBEC(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x21D45C930]();
  if (v4 == MEMORY[0x263EF8720])
  {
    if (*(void *)(a1 + 72) > 4uLL)
    {
      uint64_t v29 = [MEMORY[0x263F4AFD0] sharedInstance];
      uint64_t v30 = [MEMORY[0x263F087E8] errorWithDomain:@"IMiMessageAppDecodeDomain" code:2 userInfo:0];
      [v29 forceAutoBugCaptureWithSubType:@"Transcoder Preview Generation Failure" errorPayload:v30];

      if (IMOSLoggingEnabled())
      {
        uint64_t v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          uint64_t v33 = *(void *)(a1 + 32);
          uint64_t v32 = *(void *)(a1 + 40);
          string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
          *(_DWORD *)buf = 138412802;
          uint64_t v42 = v33;
          __int16 v43 = 2112;
          uint64_t v44 = v32;
          __int16 v45 = 2080;
          v46 = (void *)string;
          _os_log_impl(&dword_217F26000, v31, OS_LOG_TYPE_INFO, "received error (final) for DecodeiMessageAppPayload for %@ bundleID %@: %s", buf, 0x20u);
        }
      }
      uint64_t v35 = *(void *)(a1 + 64);
      if (v35)
      {
        id v36 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMTranscodeErrorDomain" code:-8 userInfo:0];
        (*(void (**)(uint64_t, void, void, void, void *))(v35 + 16))(v35, 0, 0, 0, v36);
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = *(void *)(a1 + 72);
          uint64_t v16 = *(void *)(a1 + 32);
          uint64_t v15 = *(void **)(a1 + 40);
          uint64_t v17 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
          *(_DWORD *)buf = 134218754;
          uint64_t v42 = v14;
          __int16 v43 = 2112;
          uint64_t v44 = v16;
          __int16 v45 = 2112;
          v46 = v15;
          __int16 v47 = 2080;
          v48 = v17;
          _os_log_impl(&dword_217F26000, v13, OS_LOG_TYPE_INFO, "received error (retry %lu) for DecodeiMessageAppPayload for %@ bundleID %@: %s, retrying", buf, 0x2Au);
        }
      }
      id v37 = *(id *)(a1 + 32);
      id v38 = *(id *)(a1 + 56);
      id v39 = *(id *)(a1 + 40);
      id v40 = *(id *)(a1 + 64);
      im_dispatch_after();
    }
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v18 = IMGetXPCBoolFromDictionary();
    uint64_t v19 = (char *)MEMORY[0x21D45C900](v3);
    int v20 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    if (IMOSLoggingEnabled())
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        uint64_t v23 = *(void *)(a1 + 40);
        __n128 v24 = @"NO";
        if (v18) {
          __n128 v24 = @"YES";
        }
        *(_DWORD *)buf = 138413314;
        uint64_t v42 = v22;
        __int16 v43 = 2112;
        uint64_t v44 = v23;
        __int16 v45 = 2112;
        v46 = v24;
        __int16 v47 = 2080;
        v48 = v19;
        __int16 v49 = 2112;
        long long v50 = v20;
        _os_log_impl(&dword_217F26000, v21, OS_LOG_TYPE_INFO, "received reply for DecodeiMessageAppPayload for %@ bundleID %@, success: %@ reply: %s error: %@", buf, 0x34u);
      }
    }
    free(v19);
    __n128 v25 = IMGetXPCDataFromDictionary();
    __n128 v26 = IMGetXPCArrayFromDictionary();
    __n128 v27 = objc_msgSend(v26, "__imArrayByApplyingBlock:", &unk_26C8F0108);
    uint64_t v28 = *(void *)(a1 + 64);
    if (v28) {
      (*(void (**)(uint64_t, uint64_t, void *, void *, void *))(v28 + 16))(v28, v18, v25, v27, v20);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v6 = *(void *)(a1 + 40);
        long long v8 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
        *(_DWORD *)buf = 138412802;
        uint64_t v42 = v7;
        __int16 v43 = 2112;
        uint64_t v44 = v6;
        __int16 v45 = 2080;
        v46 = (void *)v8;
        _os_log_impl(&dword_217F26000, v5, OS_LOG_TYPE_INFO, "received unknown error for DecodeiMessageAppPayload for %@ bundleID %@: %s", buf, 0x20u);
      }
    }
    char v9 = [MEMORY[0x263F4AFD0] sharedInstance];
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:@"IMiMessageAppDecodeDomain" code:1 userInfo:0];
    [v9 forceAutoBugCaptureWithSubType:@"Transcoder Preview Generation Failure" errorPayload:v10];

    uint64_t v11 = *(void *)(a1 + 64);
    if (v11)
    {
      uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMTranscodeErrorDomain" code:-1 userInfo:0];
      (*(void (**)(uint64_t, void, void, void, void *))(v11 + 16))(v11, 0, 0, 0, v12);
    }
  }
}

void sub_217F2D1C4(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x217F2D138);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_217F2D224(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__decodeiMessageAppPayload_senderContext_bundleID_retries_completionBlock_blockUntilReply_);
}

uint64_t sub_217F2D240()
{
  return MEMORY[0x270F9A6D0](NSURL, sel_URLWithString_);
}

void sub_217F2D3C4(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x21D45C930]();
  if (v4 == MEMORY[0x263EF8720])
  {
    uint64_t v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_217F2D5F8(a1, v3, v5);
    }
    goto LABEL_7;
  }
  if (v4 != MEMORY[0x263EF8708])
  {
    uint64_t v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_217F2D6A8(v3, v5);
    }
LABEL_7:
    uint64_t v6 = 0;
    goto LABEL_13;
  }
  uint64_t v5 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      _os_log_impl(&dword_217F26000, v7, OS_LOG_TYPE_INFO, "received reply for AudioTranscription for transferURL %@, error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v6 = IMGetXPCStringFromDictionary();
LABEL_13:

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_217F2D5F8(uint64_t a1, xpc_object_t xdict, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86B0]);
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2080;
  int v9 = string;
  _os_log_error_impl(&dword_217F26000, a3, OS_LOG_TYPE_ERROR, "received error for AudioTranscription for transferURL: %@, %s", (uint8_t *)&v6, 0x16u);
}

void sub_217F2D6A8(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x263EF86B0]);
  int v4 = 136315138;
  uint64_t v5 = string;
  _os_log_error_impl(&dword_217F26000, a2, OS_LOG_TYPE_ERROR, "received unknown error for AudioTranscription %s", (uint8_t *)&v4, 0xCu);
}

uint64_t IMCachesDirectoryURL()
{
  return MEMORY[0x270F3D010]();
}

uint64_t IMClientPreviewConstraints()
{
  return MEMORY[0x270F3D030]();
}

uint64_t IMGetCachedDomainBoolForKey()
{
  return MEMORY[0x270F3CD18]();
}

uint64_t IMGetXPCArrayFromDictionary()
{
  return MEMORY[0x270F3CD40]();
}

uint64_t IMGetXPCBoolFromDictionary()
{
  return MEMORY[0x270F3CD48]();
}

uint64_t IMGetXPCCodableFromDictionaryWithStandardAllowlist()
{
  return MEMORY[0x270F3CD50]();
}

uint64_t IMGetXPCDataFromDictionary()
{
  return MEMORY[0x270F3CD58]();
}

uint64_t IMGetXPCKeyedCodableFromDictionaryWithSecureCoding()
{
  return MEMORY[0x270F3CD70]();
}

uint64_t IMGetXPCStringFromDictionary()
{
  return MEMORY[0x270F3CD78]();
}

uint64_t IMInsertArraysToXPCDictionary()
{
  return MEMORY[0x270F3CD88]();
}

uint64_t IMInsertBoolsToXPCDictionary()
{
  return MEMORY[0x270F3CD90]();
}

uint64_t IMInsertCodableObjectsToXPCDictionary()
{
  return MEMORY[0x270F3CD98]();
}

uint64_t IMInsertDatasToXPCDictionary()
{
  return MEMORY[0x270F3CDA0]();
}

uint64_t IMInsertDictionariesToXPCDictionary()
{
  return MEMORY[0x270F3CDA8]();
}

uint64_t IMInsertIntsToXPCDictionary()
{
  return MEMORY[0x270F3CDB0]();
}

uint64_t IMInsertKeyedCodableObjectsToXPCDictionary()
{
  return MEMORY[0x270F3CDB8]();
}

uint64_t IMInsertStringsToXPCDictionary()
{
  return MEMORY[0x270F3CDC8]();
}

uint64_t IMLogHandleForCategory()
{
  return MEMORY[0x270F3D080]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x270F3CE08]();
}

uint64_t IMPreviewConstraintsDictionaryFromConstraint()
{
  return MEMORY[0x270F3D0A0]();
}

uint64_t IMSingleObjectArray()
{
  return MEMORY[0x270F3CE58]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x270F3CF00]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

uint64_t im_dispatch_after()
{
  return MEMORY[0x270F3CFC8]();
}

uint64_t im_primary_queue()
{
  return MEMORY[0x270F3CFD8]();
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x270EDB2C0]();
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x270EDBE40](name, targetq);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}