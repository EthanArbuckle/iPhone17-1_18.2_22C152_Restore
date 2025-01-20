@interface CKBrowserItemPayload
+ (BOOL)supportsSecureCoding;
+ (id)browserItemFromSticker:(id)a3;
+ (id)browserItemPayloadForCollaborationWithURL:(id)a3 collaborationType:(int64_t)a4;
+ (id)browserItemPayloadFromIMPluginPayload:(id)a3;
+ (id)createBrowserItemPayloadWithRichLinkMetadata:(id)a3;
+ (id)createBrowserItemPayloadWithURL:(id)a3 data:(id)a4;
- (BOOL)isEqualToPluginPayload:(id)a3;
- (BOOL)requiresValidation;
- (BOOL)shouldSendAsMediaObject;
- (BOOL)shouldSendAsRichLink;
- (BOOL)shouldSendAsText;
- (BOOL)shouldStageAsEmbeddedTextAttachment;
- (BOOL)supportsSendLater;
- (BOOL)useDirectSend;
- (CKBrowserItemPayload)initWithCoder:(id)a3;
- (CKMediaObject)mediaObject;
- (CKPluginEntryViewController)photoShelfViewController;
- (NSDictionary)attributionInfo;
- (NSString)filename;
- (NSURL)fileURL;
- (NSURL)videoComplementFileURL;
- (id)__ck_urlFromTextBodyForRichLink;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mediaObjectFromPayload;
- (id)mediaObjectFromPayloadWithKeyToTrasferGUIDMap:(id)a3;
- (id)transcoderUserInfo;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributionInfo:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setFilename:(id)a3;
- (void)setMediaObject:(id)a3;
- (void)setPhotoShelfViewController:(id)a3;
- (void)setRequiresValidation:(BOOL)a3;
- (void)setUseDirectSend:(BOOL)a3;
- (void)setVideoComplementFileURL:(id)a3;
@end

@implementation CKBrowserItemPayload

- (BOOL)shouldStageAsEmbeddedTextAttachment
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v4 = [v3 isRichLinkImprovementsEnabled];

  if (v4)
  {
    v5 = [(CKBrowserItemPayload *)self pluginBundleID];
    char v6 = [v5 isEqualToString:*MEMORY[0x1E4F6CC10]];

    if (v6)
    {
      if ([(CKBrowserItemPayload *)self shouldSendAsText])
      {
        int v7 = IMOSLoggingEnabled();
        if (v7)
        {
          v8 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Payload should send as text. Do not stage plugin as text attachment.", (uint8_t *)&v14, 2u);
          }
LABEL_15:

LABEL_16:
          LOBYTE(v7) = 0;
        }
      }
      else
      {
        v9 = [(CKBrowserItemPayload *)self url];

        if (!v9)
        {
          int v7 = IMOSLoggingEnabled();
          if (!v7) {
            return v7;
          }
          v8 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Payload URL is nil. Do not stage plugin as text attachment.", (uint8_t *)&v14, 2u);
          }
          goto LABEL_15;
        }
        v10 = [(CKBrowserItemPayload *)self collaborationMetadata];

        if (v10)
        {
          int v7 = IMOSLoggingEnabled();
          if (!v7) {
            return v7;
          }
          v8 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Payload collaborationMetadata indicates collaboration context. Do not stage plugin as text attachment.", (uint8_t *)&v14, 2u);
          }
          goto LABEL_15;
        }
        if ([(CKBrowserItemPayload *)self payloadCollaborationType])
        {
          int v7 = IMOSLoggingEnabled();
          if (!v7) {
            return v7;
          }
          v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            int v14 = 134217984;
            uint64_t v15 = [(CKBrowserItemPayload *)self payloadCollaborationType];
            _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Payload payloadCollaborationType (%ld) is indicative of collaboration. Do not stage plugin as text attachment.", (uint8_t *)&v14, 0xCu);
          }

          goto LABEL_16;
        }
        v12 = [(CKBrowserItemPayload *)self cloudKitShare];

        if (v12)
        {
          int v7 = IMOSLoggingEnabled();
          if (!v7) {
            return v7;
          }
          v8 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Payload cloudKitShare indicates that we should not stage as a text attachment.", (uint8_t *)&v14, 2u);
          }
          goto LABEL_15;
        }
        LOBYTE(v7) = 1;
      }
    }
    else
    {
      int v7 = IMOSLoggingEnabled();
      if (v7)
      {
        v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Payload is not a rich link. Do not stage plugin as text attachment.", (uint8_t *)&v14, 2u);
        }
        goto LABEL_15;
      }
    }
  }
  else
  {
    int v7 = IMOSLoggingEnabled();
    if (v7)
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Feature flag is disabled.", (uint8_t *)&v14, 2u);
      }
      goto LABEL_15;
    }
  }
  return v7;
}

+ (id)browserItemPayloadFromIMPluginPayload:(id)a3
{
  id v3 = a3;
  char v4 = objc_alloc_init(CKBrowserItemPayload);
  if (v4)
  {
    v5 = [v3 text];
    [(CKBrowserItemPayload *)v4 setText:v5];

    char v6 = [v3 data];
    [(CKBrowserItemPayload *)v4 setData:v6];

    int v7 = [v3 url];
    [(CKBrowserItemPayload *)v4 setUrl:v7];

    v8 = [v3 breadcrumbText];
    [(CKBrowserItemPayload *)v4 setBreadcrumbText:v8];

    v9 = [v3 statusText];
    [(CKBrowserItemPayload *)v4 setStatusText:v9];

    -[CKBrowserItemPayload setUpdate:](v4, "setUpdate:", [v3 isUpdate]);
    -[CKBrowserItemPayload setSticker:](v4, "setSticker:", [v3 isSticker]);
    -[CKBrowserItemPayload setShouldExpire:](v4, "setShouldExpire:", [v3 shouldExpire]);
    v10 = [v3 consumedSessionPayloads];
    [(CKBrowserItemPayload *)v4 setConsumedSessionPayloads:v10];

    v11 = [v3 messageGUID];
    [(CKBrowserItemPayload *)v4 setMessageGUID:v11];

    v12 = [v3 associatedMessageGUID];
    [(CKBrowserItemPayload *)v4 setAssociatedMessageGUID:v12];

    v13 = [v3 pluginSessionGUID];
    [(CKBrowserItemPayload *)v4 setPluginSessionGUID:v13];

    int v14 = [v3 pluginBundleID];
    [(CKBrowserItemPayload *)v4 setPluginBundleID:v14];

    uint64_t v15 = [v3 dataDetectedResult];
    [(CKBrowserItemPayload *)v4 setDataDetectedResult:v15];

    uint64_t v16 = [v3 attachments];
    [(CKBrowserItemPayload *)v4 setAttachments:v16];

    v17 = [v3 datasource];
    [(CKBrowserItemPayload *)v4 setDatasource:v17];

    -[CKBrowserItemPayload setIsFromMe:](v4, "setIsFromMe:", [v3 isFromMe]);
    -[CKBrowserItemPayload setIsPlayed:](v4, "setIsPlayed:", [v3 isPlayed]);
    v18 = [v3 sender];
    [(CKBrowserItemPayload *)v4 setSender:v18];

    -[CKBrowserItemPayload setSendAsCopy:](v4, "setSendAsCopy:", [v3 sendAsCopy]);
  }

  return v4;
}

+ (id)createBrowserItemPayloadWithURL:(id)a3 data:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = objc_alloc_init(CKBrowserItemPayload);
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F30A78]);
    [v8 setURL:v5];
    id v9 = objc_alloc_init(MEMORY[0x1E4F30AA8]);
    [v9 setMetadata:v8];
    if (v6)
    {
      [(CKBrowserItemPayload *)v7 setData:v6];
    }
    else
    {
      v10 = [v9 dataRepresentationWithOutOfLineAttachments:0];
      [(CKBrowserItemPayload *)v7 setData:v10];
    }
    [(CKBrowserItemPayload *)v7 setUrl:v5];
    [(CKBrowserItemPayload *)v7 setPluginBundleID:*MEMORY[0x1E4F6CC10]];
  }

  return v7;
}

+ (id)createBrowserItemPayloadWithRichLinkMetadata:(id)a3
{
  id v3 = a3;
  char v4 = objc_alloc_init(CKBrowserItemPayload);
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F30AA8]);
    [v5 setMetadata:v3];
    id v6 = [v5 dataRepresentationWithOutOfLineAttachments:0];
    [(CKBrowserItemPayload *)v4 setData:v6];

    int v7 = [v3 URL];
    [(CKBrowserItemPayload *)v4 setUrl:v7];

    [(CKBrowserItemPayload *)v4 setPluginBundleID:*MEMORY[0x1E4F6CC10]];
  }

  return v4;
}

+ (id)browserItemPayloadForCollaborationWithURL:(id)a3 collaborationType:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(CKBrowserItemPayload);
  int v7 = [NSString stringGUID];
  [(CKBrowserItemPayload *)v6 setMessageGUID:v7];

  [(CKBrowserItemPayload *)v6 setPluginBundleID:*MEMORY[0x1E4F6CC10]];
  [(CKBrowserItemPayload *)v6 setPayloadCollaborationType:a4];
  [(CKBrowserItemPayload *)v6 setUrl:v5];

  return v6;
}

- (BOOL)isEqualToPluginPayload:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CKBrowserItemPayload;
  if (![(CKBrowserItemPayload *)&v22 isEqualToPluginPayload:v4]) {
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(CKBrowserItemPayload *)self videoComplementFileURL];
    int v7 = [v5 videoComplementFileURL];
    int v8 = CKIsEqual(v6, v7);

    if (!v8) {
      goto LABEL_8;
    }
    id v9 = [(CKBrowserItemPayload *)self fileURL];
    v10 = [v5 fileURL];
    int v11 = CKIsEqual(v9, v10);

    if (!v11) {
      goto LABEL_8;
    }
    v12 = [(CKBrowserItemPayload *)self mediaObject];
    v13 = [v12 transferGUID];
    int v14 = [v5 mediaObject];
    uint64_t v15 = [v14 transferGUID];
    int v16 = CKIsEqual(v13, v15);

    if (v16)
    {
      v17 = [(CKBrowserItemPayload *)self photoShelfViewController];
      v18 = [v5 photoShelfViewController];
      int v19 = CKIsEqual(v17, v18);

      if (v19) {
        goto LABEL_7;
      }
    }
    else
    {
LABEL_8:
    }
LABEL_9:
    BOOL v20 = 0;
    goto LABEL_10;
  }
LABEL_7:
  BOOL v20 = 1;
LABEL_10:

  return v20;
}

- (CKBrowserItemPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  int v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v19.receiver = self;
  v19.super_class = (Class)CKBrowserItemPayload;
  int v8 = [(CKBrowserItemPayload *)&v19 initWithCoder:v4 additionalAllowedClasses:v7];

  if (v8)
  {
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CKBROWSERITEM_VIDEOCOMPLEMENFILETURL_KEY"];
    [(CKBrowserItemPayload *)v8 setVideoComplementFileURL:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CKBROWSERITEM_FILEURL_KEY"];
    [(CKBrowserItemPayload *)v8 setFileURL:v10];

    int v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CKBROWSERITEM_FILENAME_KEY"];
    [(CKBrowserItemPayload *)v8 setFilename:v11];

    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    int v16 = [v4 decodeDictionaryWithKeysOfClasses:v12 objectsOfClasses:v15 forKey:@"CKPLUGIN_ATTRIBUTIONINFO"];
    [(CKBrowserItemPayload *)v8 setAttributionInfo:v16];

    -[CKBrowserItemPayload setRequiresValidation:](v8, "setRequiresValidation:", [v4 decodeBoolForKey:@"CKBROWSERITEM_REQUIRESVALIDATION_KEY"]);
    -[CKBrowserItemPayload setUseDirectSend:](v8, "setUseDirectSend:", [v4 decodeBoolForKey:@"CKBROWSERITEM_USEDIRECTSEND_KEY"]);
    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CKBROWSERITEM_MEDIAOBJECT_KEY"];
    [(CKBrowserItemPayload *)v8 setMediaObject:v17];
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKBrowserItemPayload;
  [(CKBrowserItemPayload *)&v10 encodeWithCoder:v4];
  id v5 = [(CKBrowserItemPayload *)self videoComplementFileURL];
  [v4 encodeObject:v5 forKey:@"CKBROWSERITEM_VIDEOCOMPLEMENFILETURL_KEY"];

  uint64_t v6 = [(CKBrowserItemPayload *)self fileURL];
  [v4 encodeObject:v6 forKey:@"CKBROWSERITEM_FILEURL_KEY"];

  int v7 = [(CKBrowserItemPayload *)self filename];
  [v4 encodeObject:v7 forKey:@"CKBROWSERITEM_FILENAME_KEY"];

  int v8 = [(CKBrowserItemPayload *)self attributionInfo];
  [v4 encodeObject:v8 forKey:@"CKPLUGIN_ATTRIBUTIONINFO"];

  objc_msgSend(v4, "encodeBool:forKey:", -[CKBrowserItemPayload requiresValidation](self, "requiresValidation"), @"CKBROWSERITEM_REQUIRESVALIDATION_KEY");
  objc_msgSend(v4, "encodeBool:forKey:", -[CKBrowserItemPayload useDirectSend](self, "useDirectSend"), @"CKBROWSERITEM_USEDIRECTSEND_KEY");
  id v9 = [(CKBrowserItemPayload *)self mediaObject];
  [v4 encodeObject:v9 forKey:@"CKBROWSERITEM_MEDIAOBJECT_KEY"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CKBrowserItemPayload;
  id v4 = [(CKBrowserItemPayload *)&v12 copyWithZone:a3];
  if (v4)
  {
    id v5 = [(CKBrowserItemPayload *)self videoComplementFileURL];
    [v4 setVideoComplementFileURL:v5];

    uint64_t v6 = [(CKBrowserItemPayload *)self fileURL];
    [v4 setFileURL:v6];

    int v7 = [(CKBrowserItemPayload *)self filename];
    [v4 setFilename:v7];

    int v8 = [(CKBrowserItemPayload *)self attributionInfo];
    [v4 setAttributionInfo:v8];

    id v9 = [(CKBrowserItemPayload *)self mediaObject];
    [v4 setMediaObject:v9];

    objc_super v10 = [(CKBrowserItemPayload *)self photoShelfViewController];
    [v4 setPhotoShelfViewController:v10];

    objc_msgSend(v4, "setRequiresValidation:", -[CKBrowserItemPayload requiresValidation](self, "requiresValidation"));
    objc_msgSend(v4, "setUseDirectSend:", -[CKBrowserItemPayload useDirectSend](self, "useDirectSend"));
  }
  return v4;
}

- (BOOL)requiresValidation
{
  return self->_requiresValidation;
}

- (void)setRequiresValidation:(BOOL)a3
{
  self->_requiresValidation = a3;
}

- (BOOL)useDirectSend
{
  return self->_useDirectSend;
}

- (void)setUseDirectSend:(BOOL)a3
{
  self->_useDirectSend = a3;
}

- (NSURL)videoComplementFileURL
{
  return self->_videoComplementFileURL;
}

- (void)setVideoComplementFileURL:(id)a3
{
}

- (CKPluginEntryViewController)photoShelfViewController
{
  return self->_photoShelfViewController;
}

- (void)setPhotoShelfViewController:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (NSDictionary)attributionInfo
{
  return self->_attributionInfo;
}

- (void)setAttributionInfo:(id)a3
{
}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (void)setMediaObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaObject, 0);
  objc_storeStrong((id *)&self->_attributionInfo, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_photoShelfViewController, 0);

  objc_storeStrong((id *)&self->_videoComplementFileURL, 0);
}

- (BOOL)supportsSendLater
{
  if (![(CKBrowserItemPayload *)self supportsCollaboration]
    || (int v3 = [(CKBrowserItemPayload *)self sendAsCopy]) != 0)
  {
    id v4 = [(CKBrowserItemPayload *)self photoShelfViewController];
    if (v4
      || [(CKBrowserItemPayload *)self shouldSendAsMediaObject]
      || [(CKBrowserItemPayload *)self shouldSendAsText]
      || [(CKBrowserItemPayload *)self shouldSendAsRichLink])
    {

LABEL_8:
      LOBYTE(v3) = 1;
      return v3;
    }
    id v5 = [(CKBrowserItemPayload *)self __ck_urlFromTextBodyForRichLink];

    if (v5) {
      goto LABEL_8;
    }
    v7.receiver = self;
    v7.super_class = (Class)CKBrowserItemPayload;
    LOBYTE(v3) = [(CKBrowserItemPayload *)&v7 supportsSendLater];
  }
  return v3;
}

- (BOOL)shouldSendAsMediaObject
{
  if (([(CKBrowserItemPayload *)self supportsCollaboration] & 1) == 0)
  {
    if ([(CKBrowserItemPayload *)self isSticker]) {
      return 1;
    }
    uint64_t v6 = [(CKBrowserItemPayload *)self attachments];
    uint64_t v7 = [v6 count];
    if (v7)
    {
      int v8 = 0;
    }
    else
    {
      v2 = [(CKBrowserItemPayload *)self fileURL];
      if (v2)
      {
        int v8 = 0;
      }
      else
      {
        uint64_t v12 = [(CKBrowserItemPayload *)self url];
        if (!v12)
        {
          BOOL v5 = 0;
          goto LABEL_13;
        }
        int v3 = (void *)v12;
        int v8 = 1;
      }
    }
    id v9 = [(CKBrowserItemPayload *)self text];
    if (v9)
    {

      BOOL v5 = 0;
      if (!v8) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v11 = [(CKBrowserItemPayload *)self data];
      BOOL v5 = v11 == 0;

      if ((v8 & 1) == 0)
      {
LABEL_12:
        if (v7)
        {
LABEL_14:

          return v5;
        }
LABEL_13:

        goto LABEL_14;
      }
    }

    goto LABEL_12;
  }
  return 0;
}

- (BOOL)shouldSendAsText
{
  int v3 = [(CKBrowserItemPayload *)self text];
  if (v3)
  {
    id v4 = [(CKBrowserItemPayload *)self fileURL];
    if (v4)
    {
      BOOL v5 = 0;
    }
    else
    {
      uint64_t v6 = [(CKBrowserItemPayload *)self data];
      if (v6)
      {
        BOOL v5 = 0;
      }
      else
      {
        uint64_t v7 = [(CKBrowserItemPayload *)self url];
        if (v7)
        {
          BOOL v5 = 0;
        }
        else
        {
          int v8 = [(CKBrowserItemPayload *)self breadcrumbText];
          if (v8)
          {
            BOOL v5 = 0;
          }
          else
          {
            id v9 = [(CKBrowserItemPayload *)self statusText];
            if (v9)
            {
              BOOL v5 = 0;
            }
            else
            {
              objc_super v10 = [(CKBrowserItemPayload *)self attachments];
              BOOL v5 = [v10 count] == 0;
            }
          }
        }
      }
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)shouldSendAsRichLink
{
  int v3 = [(CKBrowserItemPayload *)self pluginBundleID];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F6CC10]];

  uint64_t v5 = [(CKBrowserItemPayload *)self url];
  uint64_t v6 = (void *)v5;
  if (v4)
  {
    BOOL v7 = v5 != 0;
  }
  else if (v5)
  {
    int v8 = [(CKBrowserItemPayload *)self data];
    BOOL v7 = [v8 length] == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)transcoderUserInfo
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v2 = [(CKBrowserItemPayload *)self userInfo];
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  int v4 = [v2 allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v33;
    uint64_t v26 = *MEMORY[0x1E4F6D388];
    uint64_t v27 = *MEMORY[0x1E4F6D3B8];
    uint64_t v28 = *MEMORY[0x1E4F6D3A8];
    uint64_t v7 = *MEMORY[0x1E4F6D370];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([v9 isEqualToString:@"CKPhotoBrowserItemAVTranscodeOptionAssetURI"])
        {
          objc_super v10 = [v2 objectForKey:v9];
          [v3 setObject:v10 forKey:v7];
        }
        else if ([v9 isEqualToString:@"CKPhotoBrowserItemAVTranscodeOptionMetadataDictionary"])
        {
          objc_super v10 = [v2 objectForKey:v9];
          [v3 setObject:v10 forKey:v28];
        }
        else if ([v9 isEqualToString:@"CKPhotoBrowserItemAVTranscodeOptionStartTime"])
        {
          objc_super v10 = [v2 objectForKey:v9];
          [v3 setObject:v10 forKey:v27];
        }
        else
        {
          if (![v9 isEqualToString:@"CKPhotoBrowserItemAVTranscodeOptionEndTime"]) {
            continue;
          }
          objc_super v10 = [v2 objectForKey:v9];
          [v3 setObject:v10 forKey:v26];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v5);
  }

  uint64_t v11 = [(CKBrowserItemPayload *)self fileURL];

  if (v11)
  {
    uint64_t v12 = [(CKBrowserItemPayload *)self fileURL];
    v13 = [v12 lastPathComponent];
    uint64_t v14 = IMUTITypeForFilename();

    uint64_t v15 = +[CKMediaObjectManager sharedInstance];
    LODWORD(v13) = objc_msgSend((id)objc_msgSend(v15, "classForUTIType:", v14), "isSubclassOfClass:", objc_opt_class());

    if (v13)
    {
      int v16 = [(CKBrowserItemPayload *)self fileURL];
      v17 = CKAVURLAssetForURL(v16);

      id v30 = 0;
      id v31 = 0;
      int v18 = [MEMORY[0x1E4F8CE38] readMetadataType:4 fromAVAsset:v17 value:&v31 error:&v30];
      id v19 = v31;
      id v20 = v30;
      if (v19) {
        int v21 = v18;
      }
      else {
        int v21 = 0;
      }
      if (v21 == 1 && (int v22 = [v19 intValue]) != 0 && v22 != 3)
      {
        [v3 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F6D398]];
      }
      else if (IMIsHEVCWithAlphaVideo())
      {
        [v3 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F6D390]];
      }
      else if (IMOSLoggingEnabled())
      {
        v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "Failed to load video playback style", buf, 2u);
        }
      }
    }
  }

  return v3;
}

- (id)mediaObjectFromPayload
{
  return [(CKBrowserItemPayload *)self mediaObjectFromPayloadWithKeyToTrasferGUIDMap:0];
}

- (id)mediaObjectFromPayloadWithKeyToTrasferGUIDMap:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  mediaObject = self->_mediaObject;
  if (mediaObject)
  {
    uint64_t v6 = mediaObject;
  }
  else
  {
    uint64_t v7 = [(CKBrowserItemPayload *)self transcoderUserInfo];
    int v8 = [(CKBrowserItemPayload *)self fileURL];
    char v9 = IMIsImageURLAScreenshot();

    objc_super v10 = +[CKMediaObjectManager sharedInstance];
    uint64_t v11 = [(CKBrowserItemPayload *)self fileURL];
    uint64_t v12 = [(CKBrowserItemPayload *)self filename];
    v13 = [(CKBrowserItemPayload *)self attributionInfo];
    BYTE1(v32) = v9;
    LOBYTE(v32) = [(CKBrowserItemPayload *)self shouldHideAttachments];
    objc_msgSend(v10, "mediaObjectWithFileURL:filename:fileIsResolved:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:", v11, v12, 0, v7, v13, 0, 0, v32);
    uint64_t v6 = (CKMediaObject *)objc_claimAutoreleasedReturnValue();

    uint64_t v14 = [(CKMediaObject *)v6 previewCacheKeyWithOrientation:1];
    uint64_t v15 = [(CKBrowserItemPayload *)self fileURL];
    int v16 = [v4 objectForKey:v15];

    v17 = 0;
    if (([v16 isEqualToString:v14] & 1) == 0 && v16)
    {
      int v18 = +[CKPreviewDispatchCache transcriptPreviewCache];
      v17 = [v18 cachedPreviewForKey:v16];
      if (v17)
      {
        [v18 setCachedPreview:v17 key:v14];
        [v18 setCachedPreview:0 key:v16];
      }
    }
    if (v6)
    {
      id v19 = [(CKBrowserItemPayload *)self videoComplementFileURL];

      if (v19)
      {
        id v20 = [(CKBrowserItemPayload *)self videoComplementFileURL];
        int v21 = [(CKMediaObject *)v6 fileURL];
        int v22 = CKGetTmpPathForAppendedVideoURL(v20, v21);

        v23 = [v22 URLByResolvingSymlinksInPath];

        v24 = [(CKMediaObject *)v6 transferGUID];
        CKLinkAndCreateAppendedVideoTransfer(v23, v20, v24);
      }
      v25 = [(CKBrowserItemPayload *)self generativePlaygroundRecipeData];

      if (v25)
      {
        uint64_t v26 = [(CKBrowserItemPayload *)self generativePlaygroundRecipeData];
        [(CKMediaObject *)v6 setGenerativePlaygroundRecipeData:v26];
      }
      [(CKBrowserItemPayload *)self setMediaObject:v6];
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = [(CKBrowserItemPayload *)self fileURL];
        *(_DWORD *)buf = 138412290;
        long long v34 = v28;
        _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "CKChatInputController. Could not create media object from file: %@", buf, 0xCu);
      }
    }
    v29 = [(CKMediaObject *)v6 previewFilenameExtension];
    id v30 = [(CKMediaObject *)v6 previewCachesFileURLWithOrientation:1 extension:v29 generateIntermediaries:0 transferGUID:v14];

    [(CKMediaObject *)v6 savePreview:v17 toURL:v30 forOrientation:1];
  }

  return v6;
}

- (id)__ck_urlFromTextBodyForRichLink
{
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__77;
  int v21 = __Block_byref_object_dispose__77;
  id v22 = 0;
  if ([(CKBrowserItemPayload *)self shouldSendAsText])
  {
    int v3 = [(CKBrowserItemPayload *)self text];
    id v4 = (void *)[v3 mutableCopy];

    if (![MEMORY[0x1E4F6E730] supportsDataDetectors]) {
      goto LABEL_6;
    }
    uint64_t v5 = [(CKBrowserItemPayload *)self text];
    uint64_t v6 = [v5 string];
    uint64_t v7 = [NSString stringGUID];
    int v8 = [MEMORY[0x1E4F1C9C8] date];
    char v9 = IMDDScanAttributedStringWithContext();

    if (v9)
    {
      uint64_t v10 = [v4 length];
      uint64_t v11 = *MEMORY[0x1E4F6C1D0];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __79__CKBrowserItemPayload_CKCompositionAdditions____ck_urlFromTextBodyForRichLink__block_invoke;
      v14[3] = &unk_1E562C830;
      id v15 = v4;
      int v16 = &v17;
      objc_msgSend(v15, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v10, 0, v14);
      id v12 = (id)v18[5];
    }
    else
    {
LABEL_6:
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }
  _Block_object_dispose(&v17, 8);

  return v12;
}

void __79__CKBrowserItemPayload_CKCompositionAdditions____ck_urlFromTextBodyForRichLink__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v11 = a2;
  if (v11)
  {
    if (a4 == [*(id *)(a1 + 32) length])
    {
      char v9 = [MEMORY[0x1E4F6BC18] sharedInstance];
      uint64_t v10 = (void *)[v9 dataSourceClassForBundleID:*MEMORY[0x1E4F6CC10]];

      if ([v10 supportsURL:v11]) {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      }
    }
  }
  *a5 = 1;
}

+ (id)browserItemFromSticker:(id)a3
{
  id v3 = a3;
  id v4 = +[CKMediaObjectManager sharedInstance];
  uint64_t v5 = [v4 mediaObjectWithSticker:v3 stickerUserInfo:0];

  if (v5)
  {
    uint64_t v6 = objc_alloc_init(CKBrowserItemPayload);
    uint64_t v7 = [v3 stickerPackGUID];
    [(CKBrowserItemPayload *)v6 setPluginBundleID:v7];

    [(CKBrowserItemPayload *)v6 setMediaObject:v5];
    [(CKBrowserItemPayload *)v6 setSticker:1];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

@end