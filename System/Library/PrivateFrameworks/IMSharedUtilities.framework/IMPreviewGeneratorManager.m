@interface IMPreviewGeneratorManager
+ (id)sharedInstance;
- (BOOL)generateAndPersistContactCardPreviewFromSourceURL:(id)a3 previewURL:(id)a4 senderContext:(id)a5 size:(CGSize *)a6 previewConstraints:(IMPreviewConstraints *)a7 error:(id *)a8;
- (BOOL)generateAndPersistMapPreviewFromSourceURL:(id)a3 previewURL:(id)a4 senderContext:(id)a5 size:(CGSize *)a6 previewConstraints:(IMPreviewConstraints *)a7 error:(id *)a8;
- (BOOL)generateAndPersistMetadataFromSourceURL:(id)a3 destinationURL:(id)a4 senderContext:(id)a5 size:(CGSize *)a6 constraints:(IMPreviewConstraints *)a7 error:(id *)a8;
- (BOOL)generateAndPersistPreviewFromSourceURL:(id)a3 previewURL:(id)a4 senderContext:(id)a5 size:(CGSize *)a6 balloonBundleID:(id)a7 previewConstraints:(IMPreviewConstraints *)a8 error:(id *)a9;
- (BOOL)imageIsMultiFrameAtFileURL:(id)a3;
- (BOOL)movePreviewToDiskCache:(id)a3 previewURL:(id)a4 error:(id *)a5;
- (BOOL)persistPreviewToDiskCache:(CGImage *)a3 previewURL:(id)a4 error:(id *)a5;
- (CGImage)newPreviewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6;
- (Class)_previewGeneratorClassForSourceURL:(id)a3 previewConstraints:(IMPreviewConstraints *)a4;
- (Class)previewGeneratorClassForUTIType:(id)a3;
- (IMPreviewGeneratorManager)init;
- (NSDictionary)UTITypes;
- (NSDictionary)dynamicTypes;
- (void)setDynamicTypes:(id)a3;
- (void)setUTITypes:(id)a3;
@end

@implementation IMPreviewGeneratorManager

- (IMPreviewGeneratorManager)init
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)IMPreviewGeneratorManager;
  v26 = [(IMPreviewGeneratorManager *)&v41 init];
  if (!v26) {
    return v26;
  }
  v2 = IMPreviewGeneratorClasses();
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v2;
  uint64_t v29 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (!v29) {
    goto LABEL_33;
  }
  uint64_t v28 = *(void *)v38;
  CFStringRef inTagClass = (const __CFString *)*MEMORY[0x1E4F224F8];
  do
  {
    uint64_t v4 = 0;
    do
    {
      if (*(void *)v38 != v28)
      {
        uint64_t v5 = v4;
        objc_enumerationMutation(obj);
        uint64_t v4 = v5;
      }
      uint64_t v30 = v4;
      v6 = *(__CFString **)(*((void *)&v37 + 1) + 8 * v4);
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v7 = [(__CFString *)v6 UTITypes];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v48 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v34;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v34 != v9) {
              objc_enumerationMutation(v7);
            }
            v11 = *(__CFString **)(*((void *)&v33 + 1) + 8 * v10);
            v12 = [v3 objectForKey:v11];
            BOOL v13 = v12 == 0;

            if (v13)
            {
              [v3 setObject:v6 forKey:v11];
              if (!IMUTTypeIsDynamic(v11, v16)) {
                goto LABEL_27;
              }
              v17 = (__CFString *)UTTypeCopyPreferredTagWithClass(v11, inTagClass);
              v14 = [(__CFString *)v17 lowercaseString];
              if (v14)
              {
                v18 = [v31 objectForKey:v14];
                BOOL v19 = v18 == 0;

                if (v19)
                {
                  [v31 setObject:v11 forKey:v14];
                }
                else if (IMOSLoggingEnabled())
                {
                  v20 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v21 = [v31 objectForKey:v14];
                    *(_DWORD *)buf = 138412802;
                    id v43 = v14;
                    __int16 v44 = 2112;
                    v45 = v11;
                    __int16 v46 = 2112;
                    uint64_t v47 = v21;
                    v22 = (void *)v21;
                    _os_log_impl(&dword_1A0772000, v20, OS_LOG_TYPE_INFO, "Can't register extension %@ for UTIType %@. It is already registered for %@. Please file a bug.", buf, 0x20u);
                  }
                }
              }
              if (v17) {
                CFRelease(v17);
              }
            }
            else
            {
              if (!IMOSLoggingEnabled()) {
                goto LABEL_27;
              }
              v14 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                v15 = [v3 objectForKey:v11];
                *(_DWORD *)buf = 138412802;
                id v43 = v11;
                __int16 v44 = 2112;
                v45 = v6;
                __int16 v46 = 2112;
                uint64_t v47 = (uint64_t)v15;
                _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "Can't register UTIType %@ for class %@. It is already registered for %@. Please file a bug.", buf, 0x20u);
              }
            }

LABEL_27:
            ++v10;
          }
          while (v8 != v10);
          uint64_t v23 = [v7 countByEnumeratingWithState:&v33 objects:v48 count:16];
          uint64_t v8 = v23;
        }
        while (v23);
      }

      uint64_t v4 = v30 + 1;
    }
    while (v30 + 1 != v29);
    uint64_t v29 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
  }
  while (v29);
LABEL_33:

  [(IMPreviewGeneratorManager *)v26 setUTITypes:v3];
  [(IMPreviewGeneratorManager *)v26 setDynamicTypes:v31];
  if (IMOSLoggingEnabled())
  {
    v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v3;
      _os_log_impl(&dword_1A0772000, v24, OS_LOG_TYPE_INFO, "The generated UTI type class mapping is: %@", buf, 0xCu);
    }
  }
  return v26;
}

+ (id)sharedInstance
{
  if (qword_1EB4A6188 != -1) {
    dispatch_once(&qword_1EB4A6188, &unk_1EF2BF4C0);
  }
  v2 = (void *)qword_1EB4A60C8;

  return v2;
}

- (BOOL)generateAndPersistPreviewFromSourceURL:(id)a3 previewURL:(id)a4 senderContext:(id)a5 size:(CGSize *)a6 balloonBundleID:(id)a7 previewConstraints:(IMPreviewConstraints *)a8 error:(id *)a9
{
  v80[2] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v69 = a5;
  id v68 = a7;
  long long v17 = *(_OWORD *)&a8->var1.height;
  *(_OWORD *)buf = *(_OWORD *)&a8->var0;
  *(_OWORD *)&buf[16] = v17;
  v80[0] = *(void *)&a8->var3;
  v18 = [(IMPreviewGeneratorManager *)self _previewGeneratorClassForSourceURL:v15 previewConstraints:buf];
  if (IMOSLoggingEnabled())
  {
    BOOL v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v18;
      _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_INFO, "Generating preview for source %@ with class %@", buf, 0x16u);
    }
  }
  if ([(objc_class *)v18 isEqual:objc_opt_class()])
  {
    if (IMOSLoggingEnabled())
    {
      v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v20, OS_LOG_TYPE_INFO, "Going down map generation path", buf, 2u);
      }
    }
    long long v21 = *(_OWORD *)&a8->var1.height;
    *(_OWORD *)buf = *(_OWORD *)&a8->var0;
    *(_OWORD *)&buf[16] = v21;
    v80[0] = *(void *)&a8->var3;
    BOOL v22 = [(IMPreviewGeneratorManager *)self generateAndPersistMapPreviewFromSourceURL:v15 previewURL:v16 senderContext:v69 size:a6 previewConstraints:buf error:a9];
LABEL_17:
    LOBYTE(v25) = v22;
    id v26 = 0;
    goto LABEL_18;
  }
  if ([(objc_class *)v18 isEqual:objc_opt_class()])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v23, OS_LOG_TYPE_INFO, "Going down contact card generation path", buf, 2u);
      }
    }
    long long v24 = *(_OWORD *)&a8->var1.height;
    *(_OWORD *)buf = *(_OWORD *)&a8->var0;
    *(_OWORD *)&buf[16] = v24;
    v80[0] = *(void *)&a8->var3;
    BOOL v22 = [(IMPreviewGeneratorManager *)self generateAndPersistContactCardPreviewFromSourceURL:v15 previewURL:v16 senderContext:v69 size:a6 previewConstraints:buf error:a9];
    goto LABEL_17;
  }
  int v25 = [(objc_class *)v18 generatesPreview];
  if (v25)
  {
    if ([(objc_class *)v18 writesToDisk])
    {
      CGSize v75 = (CGSize)0;
      id v74 = 0;
      long long v28 = *(_OWORD *)&a8->var1.height;
      *(_OWORD *)buf = *(_OWORD *)&a8->var0;
      *(_OWORD *)&buf[16] = v28;
      v80[0] = *(void *)&a8->var3;
      v64 = [(objc_class *)v18 generateAndPersistPreviewFromSourceURL:v15 senderContext:v69 balloonBundleID:v68 withPreviewConstraints:buf outSize:&v75 error:&v74];
      id v29 = v74;
      id v26 = v29;
      BOOL v66 = 0;
      if (v64 && !v29)
      {
        id v73 = 0;
        BOOL v66 = [(IMPreviewGeneratorManager *)self movePreviewToDiskCache:v64 previewURL:v16 error:&v73];
        id v26 = v73;
        if (IMOSLoggingEnabled())
        {
          uint64_t v30 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            *(CGFloat *)&uint8_t buf[4] = v75.width;
            *(_WORD *)&buf[12] = 2048;
            *(CGFloat *)&buf[14] = v75.height;
            _os_log_impl(&dword_1A0772000, v30, OS_LOG_TYPE_INFO, "Size for persisted preview is %f-%f", buf, 0x16u);
          }
        }
        if (a6) {
          *a6 = v75;
        }
        id v31 = [v64 URLByDeletingPathExtension];
        v62 = [v31 URLByAppendingPathExtension:@"plist"];

        v32 = [v16 URLByDeletingPathExtension];
        long long v33 = [v32 URLByAppendingPathExtension:@"plist"];

        if ([(IMPreviewGeneratorManager *)self movePreviewToDiskCache:v62 previewURL:v33 error:0]&& IMOSLoggingEnabled())
        {
          long long v34 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A0772000, v34, OS_LOG_TYPE_INFO, "Successfully moved preview metadata", buf, 2u);
          }
        }
      }
      if (IMOSLoggingEnabled())
      {
        long long v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          long long v36 = @"YES";
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v64;
          if (!v66) {
            long long v36 = @"NO";
          }
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v16;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&buf[24] = v36;
          LOWORD(v80[0]) = 2112;
          *(void *)((char *)v80 + 2) = v26;
          _os_log_impl(&dword_1A0772000, v35, OS_LOG_TYPE_INFO, "Moving preview from %@ to %@ success %@ error %@", buf, 0x2Au);
        }
      }
    }
    else
    {
      id v77 = 0;
      long long v37 = *(_OWORD *)&a8->var1.height;
      *(_OWORD *)buf = *(_OWORD *)&a8->var0;
      *(_OWORD *)&buf[16] = v37;
      v80[0] = *(void *)&a8->var3;
      long long v38 = (CGImage *)[(objc_class *)v18 newPreviewFromSourceURL:v15 senderContext:v69 withPreviewConstraints:buf error:&v77];
      id v39 = v77;
      id v26 = v39;
      if (!v38 || v39)
      {
        if (!v38)
        {
          LOBYTE(v25) = 0;
          goto LABEL_85;
        }
        BOOL v66 = 0;
      }
      else
      {
        if (a6)
        {
          size_t Width = CGImageGetWidth(v38);
          size_t Height = CGImageGetHeight(v38);
          a6->width = (double)Width;
          a6->height = (double)Height;
        }
        id v76 = 0;
        BOOL v66 = [(IMPreviewGeneratorManager *)self persistPreviewToDiskCache:v38 previewURL:v16 error:&v76];
        id v26 = v76;
      }
      CFRelease(v38);
    }
    if (!v66)
    {
      LOBYTE(v25) = 0;
      goto LABEL_85;
    }
  }
  else
  {
    id v26 = 0;
  }
  if (a8->var4 && [(objc_class *)v18 generatesMetadata])
  {
    if (IMOSLoggingEnabled())
    {
      v42 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v42, OS_LOG_TYPE_INFO, "Going down metadata generation path", buf, 2u);
      }
    }
    v65 = [v16 lastPathComponent];
    id v72 = 0;
    IMAttachmentFileNameAndExtension(v65, (uint64_t *)&v72, 0);
    id v63 = v72;
    id v43 = [(objc_class *)v18 metadataExtension];
    v61 = [v63 stringByAppendingFormat:@"-metadata.%@", v43];

    __int16 v44 = [v16 URLByDeletingLastPathComponent];
    v45 = [v44 path];
    v78[0] = v45;
    v78[1] = v61;
    v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:2];

    v59 = [NSString pathWithComponents:v60];
    v67 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v59 isDirectory:0];
    if (v67)
    {
      __int16 v46 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v47 = [v67 URLByDeletingLastPathComponent];
      char v48 = [v46 createDirectoryAtURL:v47 withIntermediateDirectories:1 attributes:0 error:0];

      if (v48)
      {
LABEL_72:
        id v71 = v26;
        long long v53 = *(_OWORD *)&a8->var1.height;
        *(_OWORD *)buf = *(_OWORD *)&a8->var0;
        *(_OWORD *)&buf[16] = v53;
        v80[0] = *(void *)&a8->var3;
        v54 = [(objc_class *)v18 generateAndPersistMetadataFromSourceURL:v15 senderContext:v69 withPreviewConstraints:buf error:&v71];
        id v55 = v71;

        BOOL v56 = v67 == 0;
        if (!v54) {
          BOOL v56 = 1;
        }
        if (v56 || v55)
        {
          id v26 = v55;
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            v57 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
            {
              v58 = @"NO";
              *(_DWORD *)buf = 138413058;
              *(void *)&uint8_t buf[4] = v54;
              *(_WORD *)&buf[12] = 2112;
              if (v25) {
                v58 = @"YES";
              }
              *(void *)&buf[14] = v67;
              *(_WORD *)&buf[22] = 2112;
              *(void *)&buf[24] = v58;
              LOWORD(v80[0]) = 2112;
              *(void *)((char *)v80 + 2) = 0;
              _os_log_impl(&dword_1A0772000, v57, OS_LOG_TYPE_INFO, "Moving preview metadata from %@ to %@ success %@ error %@", buf, 0x2Au);
            }
          }
          id v70 = 0;
          LOBYTE(v25) = [(IMPreviewGeneratorManager *)self movePreviewToDiskCache:v54 previewURL:v67 error:&v70];
          id v26 = v70;
        }

        goto LABEL_85;
      }
      if (IMOSLoggingEnabled())
      {
        v49 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A0772000, v49, OS_LOG_TYPE_INFO, "Failed to create metadata destination directory", buf, 2u);
        }
      }
      uint64_t v50 = 9;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v51 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A0772000, v51, OS_LOG_TYPE_INFO, "Failed to generate preview metadata URL", buf, 2u);
        }
      }
      uint64_t v50 = 6;
    }
    uint64_t v52 = [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:v50 userInfo:0];

    int v25 = 0;
    id v26 = (id)v52;
    goto LABEL_72;
  }
LABEL_85:
  if (a9)
  {
    id v26 = v26;
    *a9 = v26;
  }
LABEL_18:

  return v25;
}

- (BOOL)generateAndPersistMapPreviewFromSourceURL:(id)a3 previewURL:(id)a4 senderContext:(id)a5 size:(CGSize *)a6 previewConstraints:(IMPreviewConstraints *)a7 error:(id *)a8
{
  v51[2] = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v36 = a4;
  id v39 = a5;
  v12 = [NSNumber numberWithInteger:1];
  v51[0] = v12;
  BOOL v13 = [NSNumber numberWithInteger:2];
  v51[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v14;
  uint64_t v15 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v45;
    LOBYTE(v17) = 1;
LABEL_3:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v45 != v16) {
        objc_enumerationMutation(obj);
      }
      if ((v17 & 1) == 0)
      {
        BOOL v31 = 0;
        id v32 = obj;
        goto LABEL_37;
      }
      uint64_t v19 = [*(id *)(*((void *)&v44 + 1) + 8 * v18) integerValue];
      id v43 = 0;
      long long v20 = *(_OWORD *)&a7->var1.height;
      *(_OWORD *)buf = *(_OWORD *)&a7->var0;
      *(_OWORD *)&buf[16] = v20;
      uint64_t v49 = *(void *)&a7->var3;
      long long v21 = +[IMMapPreviewGenerator newPreviewFromSourceURL:v38 senderContext:v39 withPreviewConstraints:buf interfaceStyle:v19 error:&v43];
      id v22 = v43;
      if (IMOSLoggingEnabled())
      {
        uint64_t v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v21;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v22;
          *(_WORD *)&buf[22] = 2048;
          *(void *)&buf[24] = v19;
          _os_log_impl(&dword_1A0772000, v23, OS_LOG_TYPE_INFO, "Got map preview %@ error %@ style %ld", buf, 0x20u);
        }
      }
      if (v21) {
        BOOL v24 = v22 == 0;
      }
      else {
        BOOL v24 = 0;
      }
      if (!v24) {
        goto LABEL_24;
      }
      if (a6)
      {
        size_t Width = CGImageGetWidth(v21);
        size_t Height = CGImageGetHeight(v21);
        a6->width = (double)Width;
        a6->height = (double)Height;
      }
      v27 = objc_msgSend(NSString, "stringWithFormat:", @"%zd", v19);
      long long v28 = IMAttachmentPreviewFileURLFromURLWithSuffix(v36, (uint64_t)v27);
      if (IMOSLoggingEnabled())
      {
        id v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v21;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v28;
          _os_log_impl(&dword_1A0772000, v29, OS_LOG_TYPE_INFO, "Persisting map preview %@ to %@", buf, 0x16u);
        }
      }
      id v42 = 0;
      BOOL v30 = [(IMPreviewGeneratorManager *)self persistPreviewToDiskCache:v21 previewURL:v28 error:&v42];
      id v22 = v42;

      if (v30)
      {
        int v17 = 1;
      }
      else
      {
LABEL_24:
        if (a8) {
          *a8 = v22;
        }
        int v17 = 0;
        if (!v21) {
          goto LABEL_28;
        }
      }
      CFRelease(v21);
LABEL_28:

      if (v15 == ++v18)
      {
        uint64_t v15 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
        if (v15) {
          goto LABEL_3;
        }

        if (!v17)
        {
          BOOL v31 = 0;
          goto LABEL_38;
        }
        goto LABEL_34;
      }
    }
  }

LABEL_34:
  id v41 = 0;
  id v33 = +[IMContactCardPreviewGenerator generateContactPlistFrom:v38 previewURL:v36 senderContext:v39 error:&v41];
  id v32 = v41;
  BOOL v31 = v32 == 0;
  if (a8 && v32)
  {
    id v32 = v32;
    BOOL v31 = 0;
    *a8 = v32;
  }
LABEL_37:

LABEL_38:
  return v31;
}

- (BOOL)generateAndPersistContactCardPreviewFromSourceURL:(id)a3 previewURL:(id)a4 senderContext:(id)a5 size:(CGSize *)a6 previewConstraints:(IMPreviewConstraints *)a7 error:(id *)a8
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v29 = 0;
  long long v17 = *(_OWORD *)&a7->var1.height;
  *(_OWORD *)buf = *(_OWORD *)&a7->var0;
  *(_OWORD *)&buf[16] = v17;
  uint64_t v31 = *(void *)&a7->var3;
  uint64_t v18 = +[IMContactCardPreviewGenerator newPreviewFromSourceURL:v14 previewURL:v15 senderContext:v16 withPreviewConstraints:buf error:&v29];
  id v19 = v29;
  if (v18) {
    BOOL v20 = v19 == 0;
  }
  else {
    BOOL v20 = 0;
  }
  if (!v20)
  {
    id v21 = v19;
    BOOL v22 = 0;
    if (!a8) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (a6)
  {
    size_t Width = CGImageGetWidth(v18);
    size_t Height = CGImageGetHeight(v18);
    a6->width = (double)Width;
    a6->height = (double)Height;
  }
  id v28 = 0;
  BOOL v22 = [(IMPreviewGeneratorManager *)self persistPreviewToDiskCache:v18 previewURL:v15 error:&v28];
  id v21 = v28;
  if (a8)
  {
LABEL_10:
    if (!v22) {
      *a8 = v21;
    }
  }
LABEL_12:
  if (IMOSLoggingEnabled())
  {
    int v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      id v26 = @"NO";
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      if (v22) {
        id v26 = @"YES";
      }
      *(void *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v26;
      _os_log_impl(&dword_1A0772000, v25, OS_LOG_TYPE_INFO, "Got contact card preview %@ error %@ success %@", buf, 0x20u);
    }
  }
  if (v18) {
    CFRelease(v18);
  }

  return v22;
}

- (BOOL)generateAndPersistMetadataFromSourceURL:(id)a3 destinationURL:(id)a4 senderContext:(id)a5 size:(CGSize *)a6 constraints:(IMPreviewConstraints *)a7 error:(id *)a8
{
  v34[3] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  long long v16 = *(_OWORD *)&a7->var1.height;
  *(_OWORD *)buf = *(_OWORD *)&a7->var0;
  *(_OWORD *)&buf[16] = v16;
  v34[0] = *(void *)&a7->var3;
  long long v17 = [(IMPreviewGeneratorManager *)self _previewGeneratorClassForSourceURL:v13 previewConstraints:buf];
  if (IMOSLoggingEnabled())
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      _os_log_impl(&dword_1A0772000, v18, OS_LOG_TYPE_INFO, "Generating metadata for source %@ with class %@", buf, 0x16u);
    }
  }
  if ([(objc_class *)v17 generatesMetadata])
  {
    id v32 = 0;
    long long v19 = *(_OWORD *)&a7->var1.height;
    *(_OWORD *)buf = *(_OWORD *)&a7->var0;
    *(_OWORD *)&buf[16] = v19;
    v34[0] = *(void *)&a7->var3;
    BOOL v20 = [(objc_class *)v17 generateAndPersistMetadataFromSourceURL:v13 senderContext:v15 withPreviewConstraints:buf error:&v32];
    id v21 = v32;
    id v22 = v21;
    if (v20) {
      BOOL v23 = v21 == 0;
    }
    else {
      BOOL v23 = 0;
    }
    int v24 = v23;
    int v25 = IMOSLoggingEnabled();
    if (v24)
    {
      if (v25)
      {
        id v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v20;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v14;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&buf[24] = @"NO";
          LOWORD(v34[0]) = 2112;
          *(void *)((char *)v34 + 2) = 0;
          _os_log_impl(&dword_1A0772000, v26, OS_LOG_TYPE_INFO, "Moving preview metadata from %@ to %@ success %@ error %@", buf, 0x2Au);
        }
      }
      id v31 = 0;
      BOOL v27 = [(IMPreviewGeneratorManager *)self movePreviewToDiskCache:v20 previewURL:v14 error:&v31];
      id v22 = v31;
    }
    else
    {
      if (v25)
      {
        id v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v13;
          _os_log_impl(&dword_1A0772000, v29, OS_LOG_TYPE_INFO, "Preview generation failed for: %@", buf, 0xCu);
        }
      }
      BOOL v27 = 0;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v17;
        _os_log_impl(&dword_1A0772000, v28, OS_LOG_TYPE_INFO, "Preview generator does not support metadata: %@", buf, 0xCu);
      }
    }
    id v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:2 userInfo:0];
    BOOL v27 = 0;
  }
  if (a8) {
    *a8 = v22;
  }

  return v27;
}

- (CGImage)newPreviewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  long long v12 = *(_OWORD *)&a5->var1.height;
  long long v18 = *(_OWORD *)&a5->var0;
  long long v19 = v12;
  uint64_t v20 = *(void *)&a5->var3;
  id v13 = [(IMPreviewGeneratorManager *)self _previewGeneratorClassForSourceURL:v10 previewConstraints:&v18];
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LODWORD(v18) = 138412290;
      *(void *)((char *)&v18 + 4) = v13;
      _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "Generate Preview for class: %@", (uint8_t *)&v18, 0xCu);
    }
  }
  long long v15 = *(_OWORD *)&a5->var1.height;
  long long v18 = *(_OWORD *)&a5->var0;
  long long v19 = v15;
  uint64_t v20 = *(void *)&a5->var3;
  long long v16 = (CGImage *)[(objc_class *)v13 newPreviewFromSourceURL:v10 senderContext:v11 withPreviewConstraints:&v18 error:a6];

  return v16;
}

- (BOOL)persistPreviewToDiskCache:(CGImage *)a3 previewURL:(id)a4 error:(id *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Persisting preview to disk @ %@", (uint8_t *)&v13, 0xCu);
    }
  }
  if (IMSupportsASTC())
  {
    uint64_t v9 = IMCreateASTCImageDataFromCGImageRef(a3);
    id v10 = v9;
    if (v9) {
      BOOL v11 = IMFreeSpaceWriteDataToURL(v9, (uint64_t)v7, 1);
    }
    else {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = +[IMImageUtilities persistCPBitmapWithImage:a3 url:v7];
  }
  if (a5 && !v11)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:9 userInfo:0];
  }

  return v11;
}

- (BOOL)movePreviewToDiskCache:(id)a3 previewURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7 && v8)
  {
    id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v10 removeItemAtURL:v9 error:0];

    BOOL v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v12 = [v11 moveItemAtURL:v7 toURL:v9 error:a5];
  }
  else
  {
    int v13 = IMLogHandleForCategory("IMPreviewGeneratorManager");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1A09F0508((uint64_t)v7, (uint64_t)v9, v13);
    }

    char v12 = 0;
  }

  return v12;
}

- (Class)_previewGeneratorClassForSourceURL:(id)a3 previewConstraints:(IMPreviewConstraints *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4->var5)
  {
    id v8 = (objc_class *)objc_opt_class();
  }
  else
  {
    uint64_t v9 = [v6 lastPathComponent];
    id v10 = IMUTITypeForFilename(v9);

    id v8 = [(IMPreviewGeneratorManager *)self previewGeneratorClassForUTIType:v10];
    if ([(objc_class *)v8 isEqual:objc_opt_class()]
      && [(IMPreviewGeneratorManager *)self imageIsMultiFrameAtFileURL:v7])
    {
      id v8 = (objc_class *)objc_opt_class();
    }
  }
  BOOL v11 = v8;

  return v11;
}

- (Class)previewGeneratorClassForUTIType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IMPreviewGeneratorManager *)self UTITypes];
  id v6 = (id)[v5 objectForKey:v4];

  if (!v6)
  {
    id v6 = (id)objc_opt_class();
    id v7 = [(IMPreviewGeneratorManager *)self dynamicTypes];
    id v8 = [v4 lowercaseString];
    uint64_t v9 = [v7 objectForKey:v8];

    id v10 = [(IMPreviewGeneratorManager *)self UTITypes];
    id v11 = (id)[v10 objectForKey:v9];

    if (v11) {
      id v6 = v11;
    }
  }
  char v12 = (objc_class *)v6;

  return v12;
}

- (NSDictionary)UTITypes
{
  return self->_UTITypes;
}

- (void)setUTITypes:(id)a3
{
}

- (NSDictionary)dynamicTypes
{
  return self->_dynamicTypes;
}

- (void)setDynamicTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicTypes, 0);

  objc_storeStrong((id *)&self->_UTITypes, 0);
}

- (BOOL)imageIsMultiFrameAtFileURL:(id)a3
{
  uint64_t v3 = sub_1A09F33A8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  id v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A09F3358();
  char v7 = sub_1A0896BA4((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7 & 1;
}

@end