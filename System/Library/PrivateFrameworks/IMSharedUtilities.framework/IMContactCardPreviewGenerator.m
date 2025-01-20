@interface IMContactCardPreviewGenerator
+ (BOOL)supportsBlastDoor;
+ (CGImage)monogramForFirstName:(id)a3 lastName:(id)a4;
+ (CGImage)newContactCardPreviewFrom:(id)a3 previewURL:(id)a4 senderContext:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 error:(id *)a7;
+ (CGImage)newMonogramImageForData:(id)a3 constraints:(IMPreviewConstraints *)a4;
+ (CGImage)newPreviewFromSourceURL:(id)a3 previewURL:(id)a4 senderContext:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 error:(id *)a7;
+ (CGImage)newPreviewFromSourceURL:(id)a3 withPreviewConstraints:(IMPreviewConstraints *)a4 error:(id *)a5;
+ (double)contactMonogramDiameter;
+ (id)UTITypes;
+ (id)contactCardPreviewPayloadFileURLFrom:(id)a3 previewURL:(id)a4 withFileExtension:(id)a5;
+ (id)contactCardPreviewPayloadsDirectoryFrom:(id)a3 previewURL:(id)a4;
+ (id)generateContactPlistFrom:(id)a3 previewURL:(id)a4 senderContext:(id)a5 error:(id *)a6;
+ (id)vCardDataForURL:(id)a3;
@end

@implementation IMContactCardPreviewGenerator

+ (id)UTITypes
{
  return &unk_1EF305EC8;
}

+ (CGImage)newPreviewFromSourceURL:(id)a3 withPreviewConstraints:(IMPreviewConstraints *)a4 error:(id *)a5
{
  v7 = objc_msgSend(a1, "vCardDataForURL:", a3, a4, a5);
  long long v8 = *(_OWORD *)&a4->var1.height;
  v11[0] = *(_OWORD *)&a4->var0;
  v11[1] = v8;
  uint64_t v12 = *(void *)&a4->var3;
  v9 = (CGImage *)[a1 newMonogramImageForData:v7 constraints:v11];

  return v9;
}

+ (id)vCardDataForURL:(id)a3
{
  if (a3)
  {
    v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:8 error:0];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (CGImage)newMonogramImageForData:(id)a3 constraints:(IMPreviewConstraints *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
LABEL_24:
    v16 = 0;
    goto LABEL_25;
  }
  v6 = (void *)MEMORY[0x1A6227910](@"CNContactVCardSerialization", @"Contacts");
  if (!v6)
  {
    if (IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v18, OS_LOG_TYPE_INFO, "IMContactCardPreviewGenerator - Unable to weaklink CNContactVCardSerialization", buf, 2u);
      }
    }
    goto LABEL_24;
  }
  id v21 = 0;
  v7 = [v6 contactsWithData:v5 error:&v21];
  id v8 = v21;
  if (v8 || !v7 || ![v7 count])
  {
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v8;
        _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "IMContactCardPreviewGenerator - Unable to extract contact for data. Error %@", buf, 0xCu);
      }
    }
    goto LABEL_24;
  }
  v9 = [v7 firstObject];
  v10 = (objc_class *)MEMORY[0x1A6227910](@"CNMonogrammer", @"ContactsUI");
  if (!v10)
  {
    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_INFO, "IMContactCardPreviewGenerator -- Unable to weaklink CNMonogrammer", buf, 2u);
      }
    }
    goto LABEL_24;
  }
  id v11 = [v10 alloc];
  [a1 contactMonogramDiameter];
  uint64_t v12 = objc_msgSend(v11, "initWithStyle:diameter:", 1);
  v13 = [v9 givenName];
  v14 = [v9 familyName];
  v15 = [v12 monogramForPersonWithFirstName:v13 lastName:v14];
  v16 = (const void *)[v15 CGImage];

  if (v16) {
    CFRetain(v16);
  }

LABEL_25:
  return (CGImage *)v16;
}

+ (BOOL)supportsBlastDoor
{
  return 1;
}

+ (CGImage)newPreviewFromSourceURL:(id)a3 previewURL:(id)a4 senderContext:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 error:(id *)a7
{
  v34[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = [NSNumber numberWithDouble:a6->var1.width];
      v17 = [NSNumber numberWithDouble:a6->var1.height];
      v18 = [NSNumber numberWithDouble:a6->var0];
      *(_DWORD *)v33 = 138413058;
      *(void *)&v33[4] = v12;
      *(_WORD *)&v33[12] = 2112;
      *(void *)&v33[14] = v16;
      *(_WORD *)&v33[22] = 2112;
      *(void *)&v33[24] = v17;
      LOWORD(v34[0]) = 2112;
      *(void *)((char *)v34 + 2) = v18;
      _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "Generating preview image for vcard %@ with constraints min size width %@ size height %@ max width %@", v33, 0x2Au);
    }
  }
  if (!v12)
  {
    if (IMOSLoggingEnabled())
    {
      v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = objc_opt_class();
        *(_DWORD *)v33 = 138412290;
        *(void *)&v33[4] = v30;
        id v31 = v30;
        _os_log_impl(&dword_1A0772000, v29, OS_LOG_TYPE_INFO, "%@ - sourceURL is nil", v33, 0xCu);
      }
    }
    if (a7)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:5 userInfo:0];
      v28 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_14:
    v28 = 0;
    goto LABEL_15;
  }
  long long v19 = *(_OWORD *)&a6->var1.height;
  *(_OWORD *)v33 = *(_OWORD *)&a6->var0;
  *(_OWORD *)&v33[16] = v19;
  v34[0] = *(void *)&a6->var3;
  v20 = (CGImage *)[a1 newContactCardPreviewFrom:v12 previewURL:v13 senderContext:v14 withPreviewConstraints:v33 error:a7];
  id v21 = v20;
  if (!v20) {
    goto LABEL_14;
  }
  size_t Width = CGImageGetWidth(v20);
  double Height = (double)CGImageGetHeight(v21);
  objc_msgSend(a1, "thumbnailFillSizeForWidth:imageSize:scale:", a6->var0, (double)Width, Height, a6->var2);
  double v26 = fmax(v24 / (double)Width, v25 / Height);
  long long v27 = *(_OWORD *)&a6->var1.height;
  *(_OWORD *)v33 = *(_OWORD *)&a6->var0;
  *(_OWORD *)&v33[16] = v27;
  v34[0] = *(void *)&a6->var3;
  v28 = (CGImage *)objc_msgSend(a1, "newCroppedAndRescaledImageFromImage:constraints:targetPxSize:", v21, v33, ceil(v26 * (double)Width), ceil(v26 * Height));
  CGImageRelease(v21);
LABEL_15:

  return v28;
}

+ (id)contactCardPreviewPayloadsDirectoryFrom:(id)a3 previewURL:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 URLByDeletingLastPathComponent];
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v9 = [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:0];

  if ((v9 & 1) == 0 && IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = (id)objc_opt_class();
      id v12 = [v7 path];
      int v14 = 138412546;
      id v15 = v11;
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "%@ - Failed to create the preview directory: %@!", (uint8_t *)&v14, 0x16u);
    }
  }

  return v7;
}

+ (id)contactCardPreviewPayloadFileURLFrom:(id)a3 previewURL:(id)a4 withFileExtension:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [a1 contactCardPreviewPayloadsDirectoryFrom:v9 previewURL:a4];
  id v11 = [v9 lastPathComponent];

  id v12 = [v10 URLByAppendingPathComponent:v11 isDirectory:0];
  id v13 = [v12 URLByAppendingPathExtension:v8];

  return v13;
}

+ (double)contactMonogramDiameter
{
  return 32.0;
}

+ (CGImage)monogramForFirstName:(id)a3 lastName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (objc_class *)MEMORY[0x1A6227910](@"CNMonogrammer", @"ContactsUI");
  if (v8)
  {
    id v9 = [v8 alloc];
    [a1 contactMonogramDiameter];
    v10 = objc_msgSend(v9, "initWithStyle:diameter:", 1);
    id v11 = [v10 monogramForPersonWithFirstName:v6 lastName:v7];
    id v12 = (CGImage *)[v11 CGImage];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v15 = 0;
        _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "IMContactCardPreviewGenerator -- Unable to weaklink CNMonogrammer", v15, 2u);
      }
    }
    id v12 = 0;
  }

  return v12;
}

+ (id)generateContactPlistFrom:(id)a3 previewURL:(id)a4 senderContext:(id)a5 error:(id *)a6
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = _os_activity_create(&dword_1A0772000, "com.apple.messages.AttachmentGeneratePreviewContact", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  if ([a1 supportsBlastDoor])
  {
    uint64_t v14 = [a1 vCardDataForURL:v10];
    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x3032000000;
    v57 = sub_1A077790C;
    v58 = sub_1A0777774;
    id v59 = 0;
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x3032000000;
    v51 = sub_1A077790C;
    v52 = sub_1A0777774;
    dispatch_semaphore_t v53 = 0;
    dispatch_semaphore_t v53 = dispatch_semaphore_create(0);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = sub_1A085C454;
    v47[3] = &unk_1E5A14870;
    v47[4] = &v54;
    v47[5] = &v48;
    v45 = (void *)v14;
    +[IMAttachmentBlastdoor sendData:v14 senderContext:v12 forPreviewType:1 withCompletionBlock:v47];
    dispatch_semaphore_wait((dispatch_semaphore_t)v49[5], 0xFFFFFFFFFFFFFFFFLL);
    v44 = a6;
    if (v55[5])
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (IMOSLoggingEnabled())
      {
        __int16 v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "Received contactObj from BlastDoor!", buf, 2u);
        }
      }
      MEMORY[0x1A6227910](@"BlastDoorContactMessage", @"BlastDoor");
      if (objc_opt_isKindOfClass()) {
        v17 = (void *)v55[5];
      }
      else {
        v17 = 0;
      }
      id v21 = v17;
      v22 = [v21 contactInfo];
      id v23 = [v22 givenName];
      [v15 setObject:v23 forKeyedSubscript:qword_1E94F8438];

      double v24 = [v21 contactInfo];
      double v25 = [v24 familyName];
      [v15 setObject:v25 forKeyedSubscript:qword_1E94F8440];

      double v26 = [v21 contactInfo];
      long long v27 = [v26 organizationNameTitle];
      [v15 setObject:v27 forKeyedSubscript:qword_1E94F8448];

      v28 = [v21 contactInfo];
      v29 = [v28 contactFormatterTitle];
      [v15 setObject:v29 forKeyedSubscript:qword_1E94F8450];

      v30 = [v21 contactInfo];
      id v31 = [v30 contactNameTitle];
      [v15 setObject:v31 forKeyedSubscript:qword_1E94F8458];

      v32 = [v21 contactInfo];
      v33 = [v32 organizationNameSubtitle];
      [v15 setObject:v33 forKeyedSubscript:qword_1E94F8460];

      v34 = [v21 contactInfo];
      uint64_t v35 = [v34 contactNameSubtitle];
      [v15 setObject:v35 forKeyedSubscript:qword_1E94F8468];

      v36 = [(id)objc_opt_class() contactCardPreviewPayloadFileURLFrom:v10 previewURL:v11 withFileExtension:@"plist"];
      id v46 = 0;
      LOBYTE(v35) = [v15 writeToURL:v36 error:&v46];
      id v37 = v46;
      if (v35)
      {
        if (IMOSLoggingEnabled())
        {
          v38 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            v39 = [v36 path];
            *(_DWORD *)buf = 138412290;
            id v62 = v39;
            _os_log_impl(&dword_1A0772000, v38, OS_LOG_TYPE_INFO, "Successfully written the contact card plist at: %@", buf, 0xCu);
          }
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          v40 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            id v43 = (id)objc_opt_class();
            v41 = [v36 path];
            *(_DWORD *)buf = 138412802;
            id v62 = v43;
            __int16 v63 = 2112;
            v64 = v41;
            __int16 v65 = 2112;
            id v66 = v37;
            _os_log_impl(&dword_1A0772000, v40, OS_LOG_TYPE_INFO, "%@ - Failed to write to %@ with error %@!", buf, 0x20u);
          }
        }
        if (v44)
        {
          id *v44 = [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:9 userInfo:0];
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          long long v19 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          id v62 = v19;
          id v20 = v19;
          _os_log_impl(&dword_1A0772000, v18, OS_LOG_TYPE_INFO, "%@ - BlastDoor returned null contactObj!", buf, 0xCu);
        }
      }
      if (a6)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:11 userInfo:0];
        id v15 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v15 = 0;
      }
    }
    _Block_object_dispose(&v48, 8);

    _Block_object_dispose(&v54, 8);
  }
  else
  {
    id v15 = 0;
  }
  os_activity_scope_leave(&state);

  return v15;
}

+ (CGImage)newContactCardPreviewFrom:(id)a3 previewURL:(id)a4 senderContext:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 error:(id *)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if ([a1 supportsBlastDoor])
  {
    id v15 = [a1 generateContactPlistFrom:v12 previewURL:v13 senderContext:v14 error:a7];
    __int16 v16 = v15;
    if (v15)
    {
      v17 = [v15 objectForKeyedSubscript:qword_1E94F8438];
      uint64_t v18 = [v16 objectForKeyedSubscript:qword_1E94F8440];
      long long v19 = (void *)[a1 monogramForFirstName:v17 lastName:v18];

      if (v19) {
        CFRetain(v19);
      }
      id v20 = IMCreateASTCImageDataFromCGImageRef((CGImage *)v19);
      if (v20)
      {
        uint64_t v21 = [(id)objc_opt_class() contactCardPreviewPayloadFileURLFrom:v12 previewURL:v13 withFileExtension:@"ktx"];
        v22 = [(id)v21 path];
        v34 = (void *)v21;
        LOBYTE(v21) = [(__CFData *)v20 writeToFile:v22 atomically:1];

        int v23 = IMOSLoggingEnabled();
        if (v21)
        {
          double v24 = v34;
          if (v23)
          {
            double v25 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              double v26 = [v34 path];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v26;
              _os_log_impl(&dword_1A0772000, v25, OS_LOG_TYPE_INFO, "Successfully written the avatar preview image at: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          double v24 = v34;
          if (v23)
          {
            v30 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              id v33 = (id)objc_opt_class();
              id v31 = [v34 path];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v33;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v31;
              _os_log_impl(&dword_1A0772000, v30, OS_LOG_TYPE_INFO, "%@ - Failed to write to %@", buf, 0x16u);
            }
          }
          if (a7)
          {
            *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:9 userInfo:0];
          }
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          v28 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = objc_opt_class();
            id v29 = *(id *)&buf[4];
            _os_log_impl(&dword_1A0772000, v28, OS_LOG_TYPE_INFO, "%@ - Failed to generate the avatar image!", buf, 0xCu);
          }
        }
        if (a7)
        {
          *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:3 userInfo:0];
        }
      }
    }
    else
    {
      long long v19 = 0;
    }
  }
  else
  {
    long long v27 = *(_OWORD *)&a6->var1.height;
    *(_OWORD *)buf = *(_OWORD *)&a6->var0;
    *(_OWORD *)&buf[16] = v27;
    uint64_t v36 = *(void *)&a6->var3;
    long long v19 = (void *)[a1 newPreviewFromSourceURL:v12 withPreviewConstraints:buf error:a7];
  }

  return (CGImage *)v19;
}

@end