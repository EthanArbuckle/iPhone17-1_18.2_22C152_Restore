@interface IMiMessageAppPayloadDecoder
+ (id)decodeiMessageAppPayload:(id)a3 senderContext:(id)a4 bundleID:(id)a5 outAttachmentURLs:(id *)a6 error:(id *)a7;
@end

@implementation IMiMessageAppPayloadDecoder

+ (id)decodeiMessageAppPayload:(id)a3 senderContext:(id)a4 bundleID:(id)a5 outAttachmentURLs:(id *)a6 error:(id *)a7
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v49 = a4;
  id v51 = a5;
  int v11 = IMOSLoggingEnabled();
  v50 = v10;
  if (v10 && v51 && a6 && a7)
  {
    if (v11)
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Invoking Blastdoor for payload data", buf, 2u);
      }
    }
    *(void *)buf = 0;
    v75 = buf;
    uint64_t v76 = 0x3032000000;
    v77 = sub_1A077783C;
    v78 = sub_1A077770C;
    id v79 = 0;
    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x3032000000;
    v71 = sub_1A077783C;
    v72 = sub_1A077770C;
    id v73 = 0;
    uint64_t v62 = 0;
    v63 = &v62;
    uint64_t v64 = 0x3032000000;
    v65 = sub_1A077783C;
    v66 = sub_1A077770C;
    id v67 = 0;
    id v61 = 0;
    v13 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v10 options:1 error:&v61];
    id v46 = v61;
    v47 = [v13 _FTOptionallyDecompressData];

    if ([v47 length])
    {
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = sub_1A07F44E8;
      v60[3] = &unk_1E5A121B8;
      v60[4] = &v62;
      v60[5] = buf;
      v60[6] = &v68;
      +[IMAttachmentBlastdoor sendBalloonPluginPayloadData:v47 senderContext:v49 withBundleIdentifier:v51 completionBlock:v60];
      v14 = (void *)*((void *)v75 + 5);
      if (v14 && !v63[5])
      {
        id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [(id)v69[5] contents];
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = [obj countByEnumeratingWithState:&v56 objects:v80 count:16];
        if (v19)
        {
          uint64_t v54 = *(void *)v57;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v57 != v54) {
                objc_enumerationMutation(obj);
              }
              v21 = *(void **)(*((void *)&v56 + 1) + 8 * i);
              v22 = [NSString stringGUID];
              v23 = [v22 stringByAppendingPathExtension:@"pluginPayloadAttachment"];

              v24 = [MEMORY[0x1E4F28CB8] defaultManager];
              objc_msgSend(v24, "im_randomTemporaryFileURLWithFileName:", v23);
              CFURLRef v25 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

              v26 = [v21 content];
              uint64_t v27 = [v26 type];

              if (v27)
              {
                if (v27 == 1)
                {
                  v28 = [v21 content];
                  uint64_t v29 = [v28 other];
                  v30 = [(id)v29 data];

                  id v55 = 0;
                  LOBYTE(v29) = [v30 writeToURL:v25 options:1 error:&v55];
                  CFURLRef v31 = (const __CFURL *)v55;
                  if ((v29 & 1) == 0 && IMOSLoggingEnabled())
                  {
                    v32 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)v81 = 138412290;
                      CFURLRef v82 = v31;
                      _os_log_impl(&dword_1A0772000, v32, OS_LOG_TYPE_INFO, "IMiMessageAppPayloadDecoder Failed writing attachment to disk on incoming: %@", v81, 0xCu);
                    }
                  }
                  [v53 addObject:v25];
                }
                else
                {
                  CFURLRef v31 = 0;
                }
              }
              else
              {
                if (IMOSLoggingEnabled())
                {
                  v33 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)v81 = 0;
                    _os_log_impl(&dword_1A0772000, v33, OS_LOG_TYPE_INFO, "Writing image plugin payload attachment to disk.", v81, 2u);
                  }
                }
                v34 = [v21 content];
                v35 = [v34 astc];
                v36 = [v35 image];
                v37 = (CGImage *)[v36 cgImage];

                v38 = [v21 content];
                v39 = [v38 astc];
                v40 = [v39 originalUTIType];
                v41 = CGImageDestinationCreateWithURL(v25, v40, 1uLL, 0);

                if (v41)
                {
                  CGImageDestinationAddImage(v41, v37, 0);
                  if (CGImageDestinationFinalize(v41))
                  {
                    CFURLRef v31 = 0;
                  }
                  else
                  {
                    CFURLRef v31 = (const __CFURL *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMPreviewGenerationErrorDomain" code:9 userInfo:0];
                    if (IMOSLoggingEnabled())
                    {
                      v43 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)v81 = 138412290;
                        CFURLRef v82 = v31;
                        _os_log_impl(&dword_1A0772000, v43, OS_LOG_TYPE_INFO, "IMiMessageAppPayloadDecoder Failed writing astc encoded image attachment to disk on incoming:%@", v81, 0xCu);
                      }
                    }
                  }
                  CFRelease(v41);
                }
                else
                {
                  CFURLRef v31 = (const __CFURL *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMPreviewGenerationErrorDomain" code:9 userInfo:0];
                  if (IMOSLoggingEnabled())
                  {
                    v42 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)v81 = 138412290;
                      CFURLRef v82 = v25;
                      _os_log_impl(&dword_1A0772000, v42, OS_LOG_TYPE_INFO, "IMiMessageAppPayloadDecoder Failed to create CGImageDestination for %@", v81, 0xCu);
                    }
                  }
                }
                [v53 addObject:v25];
              }
            }
            uint64_t v19 = [obj countByEnumeratingWithState:&v56 objects:v80 count:16];
          }
          while (v19);
        }

        id v44 = v53;
        *a6 = v44;
      }
      else
      {
        *((void *)v75 + 5) = 0;

        v15 = (void *)v63[5];
        if (v15) {
          *a7 = v15;
        }
      }
      id v17 = *((id *)v75 + 5);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v81 = 138412546;
          CFURLRef v82 = (const __CFURL *)v10;
          __int16 v83 = 2112;
          id v84 = v46;
          _os_log_impl(&dword_1A0772000, v18, OS_LOG_TYPE_INFO, "Data loaded from sourceURL was nil: %@ with error: %@", v81, 0x16u);
        }
      }
      id v17 = 0;
      *a7 = v46;
    }

    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v68, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (v11)
    {
      v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "Invalid parameters", buf, 2u);
      }
    }
    id v17 = 0;
  }

  return v17;
}

@end