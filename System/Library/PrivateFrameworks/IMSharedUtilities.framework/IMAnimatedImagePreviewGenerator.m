@interface IMAnimatedImagePreviewGenerator
+ (BOOL)writesToDisk;
+ (id)UTITypes;
+ (id)generateAndPersistPreviewFromSourceURL:(id)a3 senderContext:(id)a4 balloonBundleID:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 outSize:(CGSize *)a7 error:(id *)a8;
@end

@implementation IMAnimatedImagePreviewGenerator

+ (id)UTITypes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F225D8];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (id)generateAndPersistPreviewFromSourceURL:(id)a3 senderContext:(id)a4 balloonBundleID:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 outSize:(CGSize *)a7 error:(id *)a8
{
  v110[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v80 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v81 = _os_activity_create(&dword_1A0772000, "com.apple.messages.AttachmentGeneratePreviewAnimatedImage", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v81, &state);
  if (!v13)
  {
    if (IMOSLoggingEnabled())
    {
      v38 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v39 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v39;
        id v40 = v39;
        _os_log_impl(&dword_1A0772000, v38, OS_LOG_TYPE_INFO, "%@ - sourceURL is nil", buf, 0xCu);
      }
    }
    if (a8)
    {
      id v41 = [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:5 userInfo:0];
LABEL_53:
      id v37 = 0;
LABEL_54:
      *a8 = v41;
      goto LABEL_71;
    }
    goto LABEL_70;
  }
  v15 = +[IMFeatureFlags sharedFeatureFlags];
  int v16 = [v15 isSessionAnimatedImageUnpackerEnabled];

  if (v16)
  {
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = a1;
        _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "%@ generate animated preview using session BlastDoor.", buf, 0xCu);
      }
    }
    v18 = (void *)MEMORY[0x1E4F1CB10];
    v19 = IMSafeTemporaryDirectory();
    v20 = [v19 path];
    v110[0] = v20;
    v110[1] = @"IMAnimatedImagePreviewGeneratorPreview";
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:2];
    v79 = [v18 fileURLWithPathComponents:v21];

    v22 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v22 createDirectoryAtURL:v79 withIntermediateDirectories:1 attributes:0 error:0];

    v23 = [NSString stringGUID];
    v24 = [v79 URLByAppendingPathComponent:v23 isDirectory:0];
    v25 = IMPreviewExtension();
    uint64_t v26 = [v24 URLByAppendingPathExtension:v25];

    id v27 = v14;
    id v28 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
    [v28 startTimingForKey:@"IMAnimatedImagePreviewGenerator_PreviewGenerationTime"];
    uint64_t v93 = 0;
    v94 = &v93;
    uint64_t v95 = 0x2020000000;
    char v96 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v107 = sub_1A07778EC;
    v108 = sub_1A0777764;
    id v109 = 0;
    uint64_t v88 = 0;
    v89 = (double *)&v88;
    uint64_t v90 = 0x3010000000;
    v91 = &unk_1A0A86C2F;
    long long v92 = *MEMORY[0x1E4F1DB30];
    v29 = dispatch_group_create();
    dispatch_group_enter(v29);
    double var0 = a6->var0;
    double var2 = a6->var2;
    BOOL var3 = a6->var3;
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = sub_1A084BF94;
    v83[3] = &unk_1E5A139F8;
    v85 = &v93;
    v86 = &v88;
    v87 = buf;
    v33 = v29;
    v84 = v33;
    v34 = (void *)v26;
    +[IMAttachmentBlastdoor generateAnimatedImagePreview:v13 senderContext:v27 destinationFileURL:v26 maxPixelDimension:200 scale:var3 maxFrameCount:v83 isSticker:var0 withCompletionBlock:var2];
    dispatch_time_t v35 = dispatch_time(0, 5000000000);
    if (dispatch_group_wait(v33, v35))
    {
      if (!IMOSLoggingEnabled())
      {
        id v37 = 0;
        id v14 = v27;
        goto LABEL_57;
      }
      id v14 = v27;
      v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v98 = 0;
        _os_log_impl(&dword_1A0772000, v36, OS_LOG_TYPE_INFO, "Timed out generating animated image preview.", v98, 2u);
      }
    }
    else
    {
      double v54 = a6->var2;
      double v55 = v54 * v89[4];
      double v56 = v54 * v89[5];
      if (a7)
      {
        a7->width = v55;
        a7->height = v56;
      }
      objc_msgSend(v28, "stopTimingForKey:", @"IMAnimatedImagePreviewGenerator_PreviewGenerationTime", a8);
      id v14 = v27;
      if (IMOSLoggingEnabled())
      {
        v57 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          int v58 = *((unsigned __int8 *)v94 + 24);
          uint64_t v59 = *(void *)(*(void *)&buf[8] + 40);
          v112.width = v55;
          v112.height = v56;
          uint64_t v60 = NSStringFromSize(v112);
          v61 = (void *)v60;
          v62 = @"YES";
          *(_DWORD *)v98 = 138413058;
          if (!v58) {
            v62 = @"NO";
          }
          v99 = v62;
          __int16 v100 = 2112;
          uint64_t v101 = v59;
          __int16 v102 = 2112;
          uint64_t v103 = v60;
          __int16 v104 = 2112;
          id v105 = v28;
          _os_log_impl(&dword_1A0772000, v57, OS_LOG_TYPE_INFO, "Cache miss on animated image preview generation with success: (%@), error: (%@), outSize: %@ and timing: %@", v98, 0x2Au);

          id v14 = v27;
        }
      }
      v63 = +[IMMetricsCollector sharedInstance];
      [v63 trackEvent:@"com.apple.Messages.IMMetricsCollectorEventPreviewCacheMiss"];

      if (*((unsigned char *)v94 + 24))
      {
        id v37 = v34;
        goto LABEL_57;
      }
      if (v77)
      {
        id v37 = 0;
        void *v77 = *(id *)(*(void *)&buf[8] + 40);
        goto LABEL_57;
      }
    }
    id v37 = 0;
LABEL_57:

    _Block_object_dispose(&v88, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v93, 8);
    goto LABEL_71;
  }
  if (IMOSLoggingEnabled())
  {
    v42 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = a1;
      _os_log_impl(&dword_1A0772000, v42, OS_LOG_TYPE_INFO, "%@ generate animated preview using inefficient BlastDoor.", buf, 0xCu);
    }
  }
  v43 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1A6227910](@"CKAnimatedImage", @"ChatKit");
  v44 = (objc_class *)MEMORY[0x1A6227910](@"CKAnimatedImageMediaObject", @"ChatKit");
  v45 = v44;
  if (!v44 || !v43)
  {
    if (IMOSLoggingEnabled())
    {
      v51 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        v52 = objc_opt_class();
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v52;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v45;
        *(_WORD *)&buf[22] = 2112;
        v107 = v43;
        id v53 = v52;
        _os_log_impl(&dword_1A0772000, v51, OS_LOG_TYPE_INFO, "%@ failed to weak link CKAnimatedImageMediaObjectClass - %@ CKAnimatedImageClass - %@", buf, 0x20u);
      }
    }
    if (a8) {
      goto LABEL_52;
    }
    goto LABEL_70;
  }
  double v46 = a6->var0;
  double v47 = a6->var2;
  if (![(objc_class *)v44 conformsToProtocol:&unk_1EF343A50])
  {
    if (IMOSLoggingEnabled())
    {
      v64 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        v65 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v65;
        id v66 = v65;
        _os_log_impl(&dword_1A0772000, v64, OS_LOG_TYPE_INFO, "%@ CKAnimatedImageMediaObject not conforming to appropriate protocols", buf, 0xCu);
      }
    }
    if (a8)
    {
LABEL_52:
      id v41 = [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:10 userInfo:0];
      goto LABEL_53;
    }
LABEL_70:
    id v37 = 0;
    goto LABEL_71;
  }
  id v48 = objc_alloc_init(v45);
  v49 = [NSString stringGUID];
  id v37 = [v48 generateAndPersistAnimatedPreviewFromSourceURL:v13 senderContext:v14 forWidth:v49 withTransferGUID:a6->var3 isSticker:v46 / v47];

  if ([v43 conformsToProtocol:&unk_1EF343CB0])
  {
    if (a7)
    {
      if (v37)
      {
        uint64_t v82 = 0;
        v50 = [v43 animatedImageFromOptimizedBitmapAtFileURL:v37 error:&v82];
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          v70 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A0772000, v70, OS_LOG_TYPE_INFO, "Could not create CKAnimatedImage - previewURL is nil.", buf, 2u);
          }
        }
        v50 = 0;
      }
      [v50 size];
      double v72 = v71;
      double v74 = v73;
      [v50 scale];
      a7->width = v72 * v75;
      a7->height = v74 * v75;
    }
    goto LABEL_71;
  }
  if (IMOSLoggingEnabled())
  {
    v67 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
    {
      v68 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v68;
      id v69 = v68;
      _os_log_impl(&dword_1A0772000, v67, OS_LOG_TYPE_INFO, "%@ CKAnimatedImageMediaObject not conforming to appropriate protocols", buf, 0xCu);
    }
  }
  if (a8)
  {
    id v41 = [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:10 userInfo:0];
    goto LABEL_54;
  }
LABEL_71:
  os_activity_scope_leave(&state);

  return v37;
}

+ (BOOL)writesToDisk
{
  return 1;
}

@end