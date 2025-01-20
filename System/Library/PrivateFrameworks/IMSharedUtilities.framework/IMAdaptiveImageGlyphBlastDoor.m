@interface IMAdaptiveImageGlyphBlastDoor
+ (id)generateEmojiImageAssetFromSourceURL:(id)a3 senderContext:(id)a4;
+ (id)logger;
@end

@implementation IMAdaptiveImageGlyphBlastDoor

+ (id)logger
{
  if (qword_1EB4A62F8 != -1) {
    dispatch_once(&qword_1EB4A62F8, &unk_1EF2BF180);
  }
  v2 = (void *)qword_1EB4A62E8;

  return v2;
}

+ (id)generateEmojiImageAssetFromSourceURL:(id)a3 senderContext:(id)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v7 startTimingForKey:@"IMAdaptiveImageGlyphBlastDoor_PreviewGenerationTime"];
  [v7 startTimingForKey:@"IMAdaptiveImageGlyphBlastDoor_PreviewGenerationTime_MetadataOnly"];
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = sub_1A07777CC;
  v69 = sub_1A07776CC;
  id v70 = 0;
  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = sub_1A07B4EC0;
  v62[3] = &unk_1E5A10768;
  v64 = &v65;
  v9 = v8;
  v63 = v9;
  +[IMAttachmentBlastdoor getMetadataForEmojiImageWithFileURL:v5 senderContext:v6 maxStrikeCount:20 withCompletionBlock:v62];
  dispatch_time_t v10 = dispatch_time(0, 1000000000);
  v57 = v7;
  if (dispatch_group_wait(v9, v10))
  {
    v11 = +[IMAdaptiveImageGlyphBlastDoor logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1A09EF480(v11, v12, v13, v14, v15, v16, v17, v18);
    }
LABEL_4:
    v19 = 0;
    goto LABEL_28;
  }
  if (!v66[5])
  {
    v11 = +[IMAdaptiveImageGlyphBlastDoor logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1A09EF410(v11, v33, v34, v35, v36, v37, v38, v39);
    }
    goto LABEL_4;
  }
  [v7 stopTimingForKey:@"IMAdaptiveImageGlyphBlastDoor_PreviewGenerationTime_MetadataOnly"];
  uint64_t v56 = [(id)v66[5] imageStrikeCount];
  v11 = [(id)v66[5] contentIdentifier];
  uint64_t v20 = [(id)v66[5] shortDescription];
  v21 = (void *)v20;
  v22 = @"Emoji";
  if (v20) {
    v22 = (__CFString *)v20;
  }
  v53 = v22;

  uint64_t v23 = [(id)v66[5] imageCredit];
  uint64_t v24 = [(id)v66[5] digitalSourceType];
  v51 = (void *)v23;
  v52 = (void *)v24;
  if ([v11 length])
  {
    v54 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v54 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F2FB70]];
    [v54 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F2FBA0]];
    id v55 = [v54 copy];
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v56)
    {
      uint64_t v27 = 0;
      *(void *)&long long v26 = 134217984;
      long long v50 = v26;
      while (1)
      {
        v28 = dispatch_group_create();
        dispatch_group_enter(v28);
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = sub_1A07B4F54;
        v58[3] = &unk_1E5A10790;
        id v59 = v55;
        id v60 = v25;
        v29 = v28;
        v61 = v29;
        +[IMAttachmentBlastdoor generateEmojiImagePreview:v5 senderContext:v6 frameIndex:v27 maxPixelDimension:v58 withCompletionBlock:1025.0];
        dispatch_time_t v30 = dispatch_time(0, 5000000000);
        intptr_t v31 = dispatch_group_wait(v29, v30);
        if (v31)
        {
          v32 = +[IMAdaptiveImageGlyphBlastDoor logger];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v50;
            uint64_t v72 = v27;
            _os_log_error_impl(&dword_1A0772000, v32, OS_LOG_TYPE_ERROR, "Timed out generating frame %ld", buf, 0xCu);
          }
        }
        else
        {
          v32 = +[IMAdaptiveImageGlyphBlastDoor logger];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v50;
            uint64_t v72 = v27;
            _os_log_debug_impl(&dword_1A0772000, v32, OS_LOG_TYPE_DEBUG, "Succesfully generated frame %ld.", buf, 0xCu);
          }
        }

        if (v31) {
          break;
        }
        if (v56 == ++v27) {
          goto LABEL_21;
        }
      }
      v19 = 0;
    }
    else
    {
LABEL_21:
      v40 = objc_msgSend(v25, "copy", v50, v51, v24);
      v19 = (void *)[objc_alloc(MEMORY[0x1E4F42658]) initWithContentIdentifier:v11 shortDescription:v53 strikeImages:v40];
    }
  }
  else
  {
    v41 = +[IMAdaptiveImageGlyphBlastDoor logger];
    v54 = v41;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_1A09EF448(v41, v42, v43, v44, v45, v46, v47, v48);
    }
    v19 = 0;
  }

LABEL_28:
  _Block_object_dispose(&v65, 8);

  return v19;
}

@end