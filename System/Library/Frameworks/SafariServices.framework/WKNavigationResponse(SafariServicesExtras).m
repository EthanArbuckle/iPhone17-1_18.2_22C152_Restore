@interface WKNavigationResponse(SafariServicesExtras)
- (id)_sf_explicitSuggestedFilename;
- (id)_sf_suggestedFilename;
- (uint64_t)_sf_allowReloadingInMainFrame;
- (uint64_t)_sf_responsePolicy:()SafariServicesExtras uti:;
@end

@implementation WKNavigationResponse(SafariServicesExtras)

- (id)_sf_suggestedFilename
{
  v2 = objc_msgSend(a1, "_sf_explicitSuggestedFilename");
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = [a1 response];
    v6 = [v5 suggestedFilename];
    objc_msgSend(v6, "safari_filenameByFixingIllegalCharacters");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)_sf_explicitSuggestedFilename
{
  v2 = [a1 response];
  if (objc_msgSend(v2, "_sf_hasAttachmentWithFilename"))
  {
    v3 = [v2 suggestedFilename];
LABEL_4:
    id v4 = objc_msgSend(v3, "safari_filenameByFixingIllegalCharacters");
    goto LABEL_6;
  }
  v3 = [a1 _downloadAttribute];
  if ([v3 length]) {
    goto LABEL_4;
  }
  id v4 = 0;
LABEL_6:

  return v4;
}

- (uint64_t)_sf_allowReloadingInMainFrame
{
  v2 = [a1 response];
  v3 = [v2 URL];
  int v4 = objc_msgSend(v3, "safari_isDataURL");

  if (!v4)
  {
    v7 = [a1 _request];
    v8 = [v7 HTTPMethod];
    int v9 = objc_msgSend(v8, "safari_isCaseInsensitiveEqualToString:", @"GET");

    if (v9)
    {
      v10 = [a1 response];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [v10 allHeaderFields];
        v12 = objc_msgSend(v11, "safari_stringForKey:", @"Accept-Ranges");
        int v13 = objc_msgSend(v12, "safari_isCaseInsensitiveEqualToString:", @"bytes");

        if (v13)
        {
          v14 = WBS_LOG_CHANNEL_PREFIXDownloads();
          uint64_t v6 = 1;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v20 = 0;
          }
          goto LABEL_16;
        }
      }
      else
      {
      }
      v15 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        __int16 v19 = 0;
        v16 = "Assuming reload-in-main-frame is not supported";
        v17 = (uint8_t *)&v19;
        goto LABEL_14;
      }
    }
    else
    {
      v15 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        __int16 v21 = 0;
        v16 = "Not allowing reload-in-main-frame because the request was not a GET request";
        v17 = (uint8_t *)&v21;
LABEL_14:
        _os_log_impl(&dword_1A690B000, v15, OS_LOG_TYPE_INFO, v16, v17, 2u);
      }
    }
    uint64_t v6 = 0;
LABEL_16:

    return v6;
  }
  v5 = WBS_LOG_CHANNEL_PREFIXDownloads();
  uint64_t v6 = 1;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A690B000, v5, OS_LOG_TYPE_INFO, "Allowing reload-in-main-frame for a data: URL", buf, 2u);
  }
  return v6;
}

- (uint64_t)_sf_responsePolicy:()SafariServicesExtras uti:
{
  *a3 = 0;
  v7 = [a1 response];
  v8 = [v7 MIMEType];
  typeIdentifierForDownloadFromResponse(v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  *a4 = v9;
  uint64_t v10 = _SFDownloadingFileTypeFromUTIAndMIMEType(v9, v8);
  *a3 = v10;
  id v11 = *a4;
  id v12 = v8;
  int v13 = v12;
  uint64_t v14 = 0;
  if ((v10 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    if (([v12 isEqualToString:@"application/pdf"] & 1) != 0
      || ([v13 isEqualToString:@"text/pdf"] & 1) != 0)
    {
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x2020000000;
      v15 = (void (*)(void))getQLPreviewGetSupportedMIMETypesSymbolLoc_ptr;
      v30 = getQLPreviewGetSupportedMIMETypesSymbolLoc_ptr;
      if (!getQLPreviewGetSupportedMIMETypesSymbolLoc_ptr)
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __getQLPreviewGetSupportedMIMETypesSymbolLoc_block_invoke;
        v26[3] = &unk_1E5C723B0;
        v26[4] = &v27;
        __getQLPreviewGetSupportedMIMETypesSymbolLoc_block_invoke((uint64_t)v26);
        v15 = (void (*)(void))v28[3];
      }
      _Block_object_dispose(&v27, 8);
      if (!v15)
      {
        v25 = (_Unwind_Exception *)-[SFDefaultBrowserListView productDetailsUserDidInteractWithApp:interactionType:]();
        _Block_object_dispose(&v27, 8);
        _Unwind_Resume(v25);
      }
      v16 = v15();
      int v17 = [v16 containsObject:v13];

      if (v17) {
        uint64_t v14 = 2;
      }
      else {
        uint64_t v14 = 3;
      }
    }
  }

  uint64_t v18 = [a1 isForMainFrame];
  if (objc_msgSend(v7, "sf_shouldDownloadDueToContentDisposition:", v18))
  {
    BOOL v19 = 1;
  }
  else
  {
    v20 = [a1 _downloadAttribute];
    BOOL v19 = v20 != 0;
  }
  if (v14 == 1)
  {
    uint64_t v21 = v19 & (v18 ^ 1);
    goto LABEL_37;
  }
  v22 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  int v23 = [v22 BOOLForKey:*MEMORY[0x1E4F788E0]];

  if (!v14) {
    goto LABEL_36;
  }
  if (v14 != 2)
  {
    if (([a1 canShowMIMEType] ^ 1 | v19) != 1)
    {
      uint64_t v21 = 0;
      goto LABEL_37;
    }
    if ([a1 canShowMIMEType]
      && (objc_msgSend(v7, "_sf_allowedToOverrideContentDispositionAttachment") & v23) == 1)
    {
      if (v18) {
        goto LABEL_28;
      }
      if (objc_msgSend(a1, "_sf_allowReloadingInMainFrame"))
      {
        uint64_t v21 = 4;
        goto LABEL_37;
      }
    }
LABEL_36:
    uint64_t v21 = 1;
    goto LABEL_37;
  }
  if ((v23 & 1) == 0)
  {
    uint64_t v21 = v19;
    goto LABEL_37;
  }
  if ((v18 | !v19))
  {
    if ((v18 & 1) == 0)
    {
      if (_os_feature_enabled_impl()) {
        uint64_t v21 = 3;
      }
      else {
        uint64_t v21 = 0;
      }
      goto LABEL_37;
    }
LABEL_28:
    uint64_t v21 = 3;
    goto LABEL_37;
  }
  if (objc_msgSend(a1, "_sf_allowReloadingInMainFrame")) {
    uint64_t v21 = 4;
  }
  else {
    uint64_t v21 = 1;
  }
LABEL_37:

  return v21;
}

@end