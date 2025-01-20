@interface CKPluginDisplayContainer
+ (BOOL)supportsSecureCoding;
+ (id)pluginDisplayContainerWithPluginPayload:(id)a3 composeImage:(id)a4;
+ (id)unarchiveFromData:(id)a3 error:(id *)a4;
- (CKPluginDisplayContainer)initWithCoder:(id)a3;
- (IMPluginPayload)pluginPayload;
- (UIImage)composeImage;
- (id)pasteboardItemProvider;
- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4;
- (id)urlForPayload:(id)a3;
- (void)_registerItemProvider:(id)a3 forURL:(id)a4 withPluginPayload:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setComposeImage:(id)a3;
- (void)setPluginPayload:(id)a3;
@end

@implementation CKPluginDisplayContainer

+ (id)pluginDisplayContainerWithPluginPayload:(id)a3 composeImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = objc_alloc_init(CKPluginDisplayContainer);
    [(CKPluginDisplayContainer *)v7 setPluginPayload:v5];
    [(CKPluginDisplayContainer *)v7 setComposeImage:v6];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "can't create a CKPluginDisplayContainer with a nil payload", v10, 2u);
      }
    }
    v7 = 0;
  }

  return v7;
}

- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  v7 = [(CKPluginDisplayContainer *)self pluginPayload];
  v8 = [(CKPluginDisplayContainer *)self composeImage];
  if (v7
    && ([v7 pluginBundleID],
        v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isEqualToString:*MEMORY[0x1E4F6CC10]],
        v9,
        v10))
  {
    v11 = [v7 url];

    if (v11)
    {
      v12 = [v7 url];
      v13 = [v12 absoluteString];

      id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
      v15 = v14;
      if (v5)
      {
        v16 = [NSString stringWithValidatedFormat:v5, @"%@", 0, v13 validFormatSpecifiers error];
        v17 = (void *)[v15 initWithString:v16];
        [v6 addObject:v17];
      }
      else
      {
        v16 = (void *)[v14 initWithString:v13];
        [v6 addObject:v16];
      }
    }
  }
  else if (v8)
  {
    id v18 = objc_alloc(MEMORY[0x1E4FB0870]);
    v19 = UIImagePNGRepresentation(v8);
    v20 = (void *)[v18 initWithData:v19 ofType:*MEMORY[0x1E4F22678]];

    v21 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v20];
    v22 = (void *)[v21 mutableCopy];

    if (v7)
    {
      id v28 = 0;
      v23 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v28];
      id v24 = v28;
      if (v23)
      {
        objc_msgSend(v22, "addAttribute:value:range:", @"com.apple.MobileSMS.PluginPayload", v23, 0, objc_msgSend(v22, "length"));
      }
      else if (IMOSLoggingEnabled())
      {
        v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = [v24 localizedDescription];
          *(_DWORD *)buf = 138412290;
          v30 = v26;
          _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Failed to archive plugin display container on copy with error: %@", buf, 0xCu);
        }
      }
    }
    [v6 addObject:v22];
  }

  return v6;
}

- (id)urlForPayload:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F6BC10]) initWithPluginPayload:v3];
  if ([MEMORY[0x1E4F6BC10] isPayloadServiceManatee:v3])
  {
    id v5 = (void *)MEMORY[0x1E4F6BC10];
    id v6 = [v3 url];
    v7 = (void *)MEMORY[0x1E4F6BC10];
    v8 = [v4 chat];
    v9 = [v7 lastAddressedHandleIDFromChat:v8];
    int v10 = [v5 URLForDugongShareURL:v6 handle:v9 payload:v3];
  }
  else
  {
    int v10 = [v3 url];
  }

  return v10;
}

- (void)_registerItemProvider:(id)a3 forURL:(id)a4 withPluginPayload:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v11 = [v10 isRichLinkImprovementsEnabled];

  if (v9)
  {
    if (v11)
    {
      v12 = [v9 data];

      if (v12)
      {
        v13 = (void *)MEMORY[0x1E4F30AA8];
        id v14 = [v9 data];
        v15 = [v9 attachments];
        v16 = [v13 linkWithDataRepresentation:v14 attachments:v15];

        v17 = [v16 metadata];
        uint64_t v18 = *MEMORY[0x1E4F309D0];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __75__CKPluginDisplayContainer__registerItemProvider_forURL_withPluginPayload___block_invoke;
        v28[3] = &unk_1E5621A58;
        id v29 = v17;
        id v19 = v17;
        [v7 registerDataRepresentationForTypeIdentifier:v18 visibility:0 loadHandler:v28];
      }
    }
  }
  uint64_t v20 = *MEMORY[0x1E4F226F8];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __75__CKPluginDisplayContainer__registerItemProvider_forURL_withPluginPayload___block_invoke_2;
  v26[3] = &unk_1E5621A58;
  id v21 = v8;
  id v27 = v21;
  [v7 registerDataRepresentationForTypeIdentifier:v20 visibility:0 loadHandler:v26];
  uint64_t v22 = *MEMORY[0x1E4F22708];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __75__CKPluginDisplayContainer__registerItemProvider_forURL_withPluginPayload___block_invoke_3;
  v24[3] = &unk_1E5621A58;
  id v25 = v21;
  id v23 = v21;
  [v7 registerDataRepresentationForTypeIdentifier:v22 visibility:0 loadHandler:v24];
}

uint64_t __75__CKPluginDisplayContainer__registerItemProvider_forURL_withPluginPayload___block_invoke(uint64_t a1, void (**a2)(void, void, void))
{
  id v3 = *(void **)(a1 + 32);
  v4 = a2;
  id v5 = [v3 dataRepresentation];
  ((void (**)(void, void *, void))a2)[2](v4, v5, 0);

  return 0;
}

uint64_t __75__CKPluginDisplayContainer__registerItemProvider_forURL_withPluginPayload___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 dataRepresentation];
  v3[2](v3, v4, 0);

  return 0;
}

uint64_t __75__CKPluginDisplayContainer__registerItemProvider_forURL_withPluginPayload___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 absoluteString];
  id v5 = [v4 dataUsingEncoding:4];
  v3[2](v3, v5, 0);

  return 0;
}

- (id)pasteboardItemProvider
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKPluginDisplayContainer *)self pluginPayload];
  v4 = v3;
  if (!v3)
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "plugin payload is unexpectedly nil, failed to create item provider", buf, 2u);
      }
    }
    id v6 = 0;
    goto LABEL_16;
  }
  id v5 = [v3 pluginBundleID];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  if (![v5 isEqualToString:*MEMORY[0x1E4F6CC10]])
  {
    id v9 = [(CKPluginDisplayContainer *)self composeImage];
    p_super = &v9->super;
    if (v9)
    {
      int v11 = UIImagePNGRepresentation(v9);
      if (v11)
      {
        v12 = CKFrameworkBundle();
        v13 = [v12 localizedStringForKey:@"DROPPED_PLUGIN_PREVIEW_FILE_NAME" value:&stru_1EDE4CA38 table:@"ChatKit"];
        [v6 setSuggestedName:v13];

        uint64_t v14 = *MEMORY[0x1E4F22678];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __50__CKPluginDisplayContainer_pasteboardItemProvider__block_invoke;
        v27[3] = &unk_1E5621A58;
        id v28 = v11;
        id v15 = v11;
        [v6 registerDataRepresentationForTypeIdentifier:v14 visibility:0 loadHandler:v27];

        id v26 = 0;
        v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v26];
        id v17 = v26;
        uint64_t v18 = v17;
        if (v16 && !v17)
        {
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __50__CKPluginDisplayContainer_pasteboardItemProvider__block_invoke_60;
          v24[3] = &unk_1E5621A58;
          id v25 = v16;
          id v19 = v16;
          [v6 registerDataRepresentationForTypeIdentifier:@"com.apple.MobileSMS.PluginPayload" visibility:0 loadHandler:v24];

          goto LABEL_15;
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v18;
            _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Failed to archive the plugin display container with error: %@", buf, 0xCu);
          }
        }
        goto LABEL_35;
      }
      if (IMOSLoggingEnabled())
      {
        id v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "Failed to create snapshot image NSData", buf, 2u);
        }
LABEL_28:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      id v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "plugin snapshot image is unexpectedly nil, failed to create item provider", buf, 2u);
      }
      goto LABEL_28;
    }
LABEL_20:

    goto LABEL_35;
  }
  id v7 = [(CKPluginDisplayContainer *)self urlForPayload:v4];
  if (v7)
  {
    [(CKPluginDisplayContainer *)self _registerItemProvider:v6 forURL:v7 withPluginPayload:v4];

LABEL_15:
LABEL_16:
    id v6 = v6;
    uint64_t v20 = v6;
    goto LABEL_36;
  }
  if (IMOSLoggingEnabled())
  {
    p_super = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, p_super, OS_LOG_TYPE_INFO, "Unable to determine URL from rich links plugin", buf, 2u);
    }
    goto LABEL_20;
  }
LABEL_35:

  uint64_t v20 = 0;
LABEL_36:

  return v20;
}

uint64_t __50__CKPluginDisplayContainer_pasteboardItemProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t __50__CKPluginDisplayContainer_pasteboardItemProvider__block_invoke_60(uint64_t a1, uint64_t a2)
{
  return 0;
}

+ (id)unarchiveFromData:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    if (unarchiveFromData_error__onceToken != -1) {
      dispatch_once(&unarchiveFromData_error__onceToken, &__block_literal_global_212);
    }
    id v19 = 0;
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:&v19];
    id v7 = v19;
    id v8 = v7;
    if (!v6 || v7)
    {
      if (a4) {
        *a4 = v7;
      }
      if (IMOSLoggingEnabled())
      {
        v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = [v8 localizedDescription];
          *(_DWORD *)buf = 138412290;
          id v21 = v14;
          _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "failed to unarchive plugin display controller: failed to create unarchiver %@", buf, 0xCu);
        }
      }
      int v10 = 0;
    }
    else
    {
      id v9 = [v6 decodeObjectOfClasses:unarchiveFromData_error__allowlistedClasses forKey:*MEMORY[0x1E4F284E8]];
      int v10 = v9;
      if (v9)
      {
        id v11 = v9;
        id v8 = 0;
      }
      else
      {
        id v15 = [v6 error];
        id v8 = v15;
        if (a4) {
          *a4 = v15;
        }
        if (IMOSLoggingEnabled())
        {
          v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            id v17 = [v8 localizedDescription];
            *(_DWORD *)buf = 138412290;
            id v21 = v17;
            _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "failed to unarchive plugin display controller: failed to decode object with error: %@", buf, 0xCu);
          }
        }
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "failed to unarchive plugin display controller: data was nil", buf, 2u);
      }
    }
    int v10 = 0;
  }

  return v10;
}

void __52__CKPluginDisplayContainer_unarchiveFromData_error___block_invoke()
{
  v0 = IMExtensionPayloadUnarchivingClasses();
  v1 = (void *)[v0 mutableCopy];

  [v1 addObject:objc_opt_class()];
  v2 = (void *)unarchiveFromData_error__allowlistedClasses;
  unarchiveFromData_error__allowlistedClasses = (uint64_t)v1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKPluginDisplayContainer)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKPluginDisplayContainer;
  id v5 = [(CKPluginDisplayContainer *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CKPLUGINDISPLAYCONTAINER_PLUGINGPAYLOAD_KEY"];
    [(CKPluginDisplayContainer *)v5 setPluginPayload:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CKPLUGINDISPLAYCONTAINER_COMPOSEIMAGE_KEY"];
    [(CKPluginDisplayContainer *)v5 setComposeImage:v7];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CKPluginDisplayContainer *)self pluginPayload];
  [v4 encodeObject:v5 forKey:@"CKPLUGINDISPLAYCONTAINER_PLUGINGPAYLOAD_KEY"];

  id v6 = [(CKPluginDisplayContainer *)self composeImage];
  [v4 encodeObject:v6 forKey:@"CKPLUGINDISPLAYCONTAINER_COMPOSEIMAGE_KEY"];
}

- (IMPluginPayload)pluginPayload
{
  return self->_pluginPayload;
}

- (void)setPluginPayload:(id)a3
{
}

- (UIImage)composeImage
{
  return self->_composeImage;
}

- (void)setComposeImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeImage, 0);

  objc_storeStrong((id *)&self->_pluginPayload, 0);
}

@end