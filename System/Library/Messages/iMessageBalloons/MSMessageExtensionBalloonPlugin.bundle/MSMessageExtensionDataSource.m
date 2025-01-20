@interface MSMessageExtensionDataSource
+ (id)_payloadDataFromMessagePayload:(id)a3 appIconData:(id)a4 appName:(id)a5 adamID:(id)a6 allowDataPayloads:(BOOL)a7;
+ (id)messagePayloadFromPluginPayload:(id)a3;
+ (id)pluginPayloadFromMediaPayload:(id)a3;
+ (id)pluginPayloadFromMessagePayload:(id)a3 appIconData:(id)a4 appName:(id)a5 adamID:(id)a6 allowDataPayloads:(BOOL)a7;
- (BOOL)supportsDynamicSize;
- (BOOL)wantsInteractiveContentView;
- (BOOL)wantsReplyFromContentView;
- (BOOL)wantsStatusItem;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MSMessage)message;
- (MSMessageExtensionDataSource)initWithPluginPayload:(id)a3;
- (MSMessageExtensionDataSourceDelegate)balloonControllerDelegate;
- (MSMessageExtensionDataSourceDelegate)delegate;
- (id)propertyProvider;
- (id)statusString;
- (id)url;
- (void)dealloc;
- (void)payloadWillEnterShelf;
- (void)payloadWillSendFromShelf;
- (void)pluginEnabledStateChanged:(id)a3;
- (void)pluginInstalled:(id)a3;
- (void)pluginPayloadDidChange:(unint64_t)a3;
- (void)setBalloonControllerDelegate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MSMessageExtensionDataSource

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MSMessageExtensionDataSource;
  [(MSMessageExtensionDataSource *)&v4 dealloc];
}

- (MSMessageExtensionDataSource)initWithPluginPayload:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MSMessageExtensionDataSource;
  v3 = [(MSMessageExtensionDataSource *)&v7 initWithPluginPayload:a3];
  if (v3)
  {
    objc_super v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"pluginEnabledStateChanged:" name:IMBalloonPluginEnabledStateChangedNotification object:0];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v3 selector:"pluginInstalled:" name:IMBalloonPluginManagerInstalledAppsChangedNotification object:0];
  }
  return v3;
}

- (BOOL)wantsReplyFromContentView
{
  return 1;
}

- (BOOL)wantsInteractiveContentView
{
  v2 = [(MSMessageExtensionDataSource *)self message];
  v3 = [v2 layout];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)pluginPayloadDidChange:(unint64_t)a3
{
  if (a3)
  {
    message = self->_message;
    self->_message = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 datasourcePayloadDidChange:self updateFlags:a3];
    }
    id v9 = objc_loadWeakRetained((id *)&self->_balloonControllerDelegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_balloonControllerDelegate);
      [v11 datasourcePayloadDidChange:self updateFlags:a3];
    }
  }
}

+ (id)_payloadDataFromMessagePayload:(id)a3 appIconData:(id)a4 appName:(id)a5 adamID:(id)a6 allowDataPayloads:(BOOL)a7
{
  return _[a3 _payloadDataFromAppIconData:a4 appName:a5 adamID:a6 allowDataPayloads:a7];
}

+ (id)messagePayloadFromPluginPayload:(id)a3
{
  id v3 = a3;
  v65 = IMExtensionPayloadUnarchivingClasses();
  if (objc_opt_respondsToSelector())
  {
    objc_super v4 = [v3 data];
    id v71 = 0;
    v5 = +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:v65 fromData:v4 error:&v71];
    id v63 = v71;

    v6 = ms_defaultLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    id v74 = v63;
    char v7 = "strict-decoding 016 exception/error after _strictlyUnarchivedObjectOfClasses: [%@]";
  }
  else
  {
    id v8 = [v3 data];
    id v70 = 0;
    v5 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v65 fromData:v8 error:&v70];
    id v63 = v70;

    v6 = ms_defaultLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    id v74 = v63;
    char v7 = "strict-decoding 016 exception/error after unarchivedObjectOfClasses: [%@]";
  }
  _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
LABEL_7:

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v64 = [v5 objectForKeyedSubscript:IMExtensionPayloadUserSessionIdentifier];
    v62 = [v5 objectForKeyedSubscript:IMExtensionPayloadURLKey];
    id v9 = +[IMBalloonPluginManager sharedInstance];
    char v10 = [v3 pluginBundleID];
    v61 = [v9 balloonPluginForBundleID:v10];

    id v11 = [v61 identifier];
    v12 = IMBalloonExtensionIDWithSuffix();
    LODWORD(v10) = [v11 isEqualToString:v12];

    if (v10)
    {
      id v13 = [v5 objectForKeyedSubscript:IMExtensionPayloadDataKey];
      if (!v13)
      {
        v59 = [v5 objectForKeyedSubscript:IMExtensionPayloadDataFilePathKey];
        if ([v59 length])
        {
          id v14 = [objc_alloc((Class)NSString) initWithData:v59 encoding:4];
          if (IMOSLoggingEnabled())
          {
            v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v74 = v14;
              _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Trying to load legacy Mac extension payload data on iOS: %@", buf, 0xCu);
            }
          }
          id v13 = 0;
        }
        else
        {
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          id v14 = [v3 attachments];
          id v13 = [v14 countByEnumeratingWithState:&v66 objects:v72 count:16];
          if (v13)
          {
            uint64_t v18 = *(void *)v67;
            uint64_t v19 = IMFileTransferPluginPayloadAttachmentExtension;
            while (2)
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (*(void *)v67 != v18) {
                  objc_enumerationMutation(v14);
                }
                v21 = *(void **)(*((void *)&v66 + 1) + 8 * i);
                v22 = [v21 pathExtension];
                unsigned int v23 = [v22 isEqualToString:v19];

                if (v23)
                {
                  id v13 = +[NSData dataWithContentsOfURL:v21];
                  goto LABEL_32;
                }
              }
              id v13 = [v14 countByEnumeratingWithState:&v66 objects:v72 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }
        }
LABEL_32:
      }
    }
    else
    {
      id v13 = 0;
    }
    aClassName = [v5 objectForKeyedSubscript:IMExtensionPayloadBalloonLayoutClassKey];
    objc_opt_class();
    v57 = v13;
    if (objc_opt_isKindOfClass())
    {
      id v24 = v64;
      id v64 = [objc_alloc((Class)NSUUID) initWithUUIDString:v24];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = v62;
      v62 = +[NSURL URLWithString:v25];
    }
    v60 = [v5 objectForKeyedSubscript:IMExtensionPayloadBalloonLayoutInfoKey];
    v56 = [v5 objectForKeyedSubscript:IMExtensionPayloadAccessibilityLableKey];
    Class v26 = NSClassFromString(aClassName);
    if (v26 == (Class)objc_opt_class())
    {
      id v27 = objc_alloc_init((Class)MSMessageTemplateLayout);
      v28 = [v60 objectForKeyedSubscript:IMBalloonLayoutInfoCaptionKey];
      [v27 setCaption:v28];

      v29 = [v60 objectForKeyedSubscript:IMBalloonLayoutInfoSubcaptionKey];
      [v27 setSubcaption:v29];

      v30 = [v60 objectForKeyedSubscript:IMBalloonLayoutInfoSecondarySubcaptionKey];
      [v27 setTrailingCaption:v30];

      v31 = [v60 objectForKeyedSubscript:IMBalloonLayoutInfoTertiarySubcaptionKey];
      [v27 setTrailingSubcaption:v31];

      v32 = [v60 objectForKeyedSubscript:IMBalloonLayoutInfoImageTitleKey];
      [v27 setImageTitle:v32];

      v33 = [v60 objectForKeyedSubscript:IMBalloonLayoutInfoImageSubTitleKey];
      [v27 setImageSubtitle:v33];

      v34 = [v3 attachments];
      v35 = [v34 firstObject];
      [v27 setMediaFileURL:v35];
    }
    else
    {
      id v27 = 0;
    }
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
    unsigned int v37 = [v61 isEnabled];
    objc_opt_class();
    char v38 = objc_opt_isKindOfClass();
    v39 = [v5 objectForKeyedSubscript:IMExtensionPayloadBalloonLiveLayoutInfoKey];
    if ((CKShouldShowSURF() & 1) == 0)
    {
      v40 = [v61 identifier];
      if ([v40 hasSuffix:IMBalloonPluginIdentifierSurf])
      {

LABEL_44:
        unsigned int v37 = 0;
        goto LABEL_45;
      }
      v41 = [v61 identifier];
      unsigned int v42 = [v41 hasSuffix:IMBalloonPluginIdentifierSurfDeprecated];

      if (v42) {
        goto LABEL_44;
      }
    }
LABEL_45:
    if ((v38 & 1) != 0 && v39 && ((isKindOfClass ^ 1) & 1) == 0 && v37)
    {
      id v43 = [objc_alloc((Class)MSMessageLiveLayout) initWithAlternateLayout:v27];
      v44 = IMBalloonPluginRequiredCapabilitiesWithPayloadDictionary();
      [v43 setRequiredCapabilities:v44];

      if (!v43) {
        goto LABEL_52;
      }
    }
    else
    {
      id v43 = v27;
      if (!v27) {
LABEL_52:
      }
        id v43 = objc_alloc_init((Class)MSMessageTemplateLayout);
    }
    if (v64)
    {
      id v45 = [objc_alloc((Class)MSSession) initWithIdentifier:v64];
      id v46 = [objc_alloc((Class)MSMessage) initWithSession:v45];
    }
    else
    {
      id v46 = objc_alloc_init((Class)MSMessage);
      id v45 = 0;
    }
    v17 = v46;
    [v46 setURL:v62];
    objc_msgSend(v17, "set_data:", v57);
    [v17 setLayout:v43];
    v47 = [v3 statusText];
    [v17 setStatusText:v47];

    objc_msgSend(v17, "setShouldExpire:", objc_msgSend(v3, "shouldExpire"));
    [v17 setAccessibilityLabel:v56];
    objc_msgSend(v17, "setIsFromMe:", objc_msgSend(v3, "isFromMe"));
    v48 = [v5 objectForKeyedSubscript:IMExtensionPayloadLocalizedDescriptionTextKey];
    [v17 setSummaryText:v48];

    v49 = [v17 statusText];
    LODWORD(v48) = v49 == 0;

    if (v48)
    {
      v50 = [v5 objectForKeyedSubscript:IMExtensionPayloadStatusTextKey];
      [v17 setStatusText:v50];
    }
    if ([v3 isFromMe])
    {
      v51 = +[IMBalloonPluginManager sharedInstance];
      v52 = [v3 pluginBundleID];
      v53 = [v3 sender];
      [v51 localParticipantIdentifierForAppID:v52 conversationID:v53];
    }
    else
    {
      v51 = +[IMBalloonPluginManager sharedInstance];
      v52 = [v3 sender];
      v53 = [v3 pluginBundleID];
      [v51 recipientIDForRecipient:v52 appID:v53];
    v54 = };
    [v17 setSenderParticipantIdentifier:v54];

    goto LABEL_62;
  }
  if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v74 = v63;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Failed unarchiving payload. Error %@", buf, 0xCu);
    }
  }
  v17 = 0;
LABEL_62:

  return v17;
}

+ (id)pluginPayloadFromMessagePayload:(id)a3 appIconData:(id)a4 appName:(id)a5 adamID:(id)a6 allowDataPayloads:(BOOL)a7
{
  return _[a3 _pluginPayloadWithAppIconData:a4 appName:a5 adamID:a6 allowDataPayloads:a7];
}

+ (id)pluginPayloadFromMediaPayload:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)CKBrowserItemPayload);
  v5 = [v3 mediaURL];

  if (v5)
  {
    v6 = [v3 mediaURL];
    [v4 setFileURL:v6];

    char v7 = [v3 mediaFilename];
    [v4 setFilename:v7];

    id v8 = [v3 generativePlaygroundRecipeData];
    [v4 setGenerativePlaygroundRecipeData:v8];
  }
  if ([v3 isSticker]
    && ([v3 accessibilityLabel], id v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    id v10 = objc_alloc((Class)NSAttributedString);
    uint64_t v11 = [v3 accessibilityLabel];
  }
  else
  {
    v12 = [v3 text];

    if (!v12) {
      goto LABEL_9;
    }
    id v10 = objc_alloc((Class)NSAttributedString);
    uint64_t v11 = [v3 text];
  }
  id v13 = (void *)v11;
  id v14 = [v10 initWithString:v11];
  [v4 setText:v14];

LABEL_9:
  v15 = [v3 attributionInfo];
  [v4 setAttributionInfo:v15];

  objc_msgSend(v4, "setSticker:", objc_msgSend(v3, "isSticker"));

  return v4;
}

- (id)propertyProvider
{
  id v3 = objc_alloc_init((Class)LPAppLinkPresentationProperties);
  id v4 = [(MSMessageExtensionDataSource *)self message];
  v5 = [v4 layout];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    char v7 = [v6 imageTitle];
    id v8 = [(MSMessageExtensionDataSource *)self _replaceHandleWithContactNameInString:v7];
    [v6 setImageTitle:v8];

    id v9 = [v6 imageSubtitle];
    id v10 = [(MSMessageExtensionDataSource *)self _replaceHandleWithContactNameInString:v9];
    [v6 setImageSubtitle:v10];

    uint64_t v11 = [v6 caption];
    v12 = [(MSMessageExtensionDataSource *)self _replaceHandleWithContactNameInString:v11];
    [v6 setCaption:v12];

    id v13 = [v6 trailingCaption];
    id v14 = [(MSMessageExtensionDataSource *)self _replaceHandleWithContactNameInString:v13];
    [v6 setTrailingCaption:v14];

    v15 = [v6 subcaption];
    v16 = [(MSMessageExtensionDataSource *)self _replaceHandleWithContactNameInString:v15];
    [v6 setSubcaption:v16];

    v17 = [v6 trailingSubcaption];
    uint64_t v18 = [(MSMessageExtensionDataSource *)self _replaceHandleWithContactNameInString:v17];
    [v6 setTrailingSubcaption:v18];

    uint64_t v19 = [v6 mediaFileURL];
    if (!v19
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || ([(MSMessageExtensionDataSource *)self parentChatHasAllUnknownRecipients] & 1) != 0)
    {
LABEL_11:
      unsigned int v23 = [v6 caption];
      if (![v23 length])
      {
        id v24 = [v6 trailingCaption];
        if (![v24 length])
        {
          id v25 = [v6 subcaption];
          if (![v25 length])
          {
            v50 = [v6 trailingSubcaption];
            id v51 = [v50 length];

            if (!v51)
            {
LABEL_18:
              v39 = [v6 imageTitle];
              if ([v39 length])
              {
              }
              else
              {
                v40 = [v6 imageSubtitle];
                id v41 = [v40 length];

                if (!v41)
                {
LABEL_22:

                  goto LABEL_23;
                }
              }
              id v42 = objc_alloc_init((Class)LPCaptionBarPresentationProperties);
              id v43 = [v6 imageTitle];
              v44 = [v42 top];
              id v45 = [v44 leading];
              [v45 setText:v43];

              id v46 = [v6 imageSubtitle];
              v47 = [v42 bottom];
              v48 = [v47 leading];
              [v48 setText:v46];

              [v3 setMediaBottomCaptionBar:v42];
              goto LABEL_22;
            }
LABEL_17:
            id v26 = objc_alloc_init((Class)LPCaptionBarPresentationProperties);
            id v27 = [v6 caption];
            v28 = [v26 top];
            v29 = [v28 leading];
            [v29 setText:v27];

            v30 = [v6 trailingCaption];
            v31 = [v26 top];
            v32 = [v31 trailing];
            [v32 setText:v30];

            v33 = [v6 subcaption];
            v34 = [v26 bottom];
            v35 = [v34 leading];
            [v35 setText:v33];

            v36 = [v6 trailingSubcaption];
            unsigned int v37 = [v26 bottom];
            char v38 = [v37 trailing];
            [v38 setText:v36];

            [v3 setCaptionBar:v26];
            goto LABEL_18;
          }
        }
      }

      goto LABEL_17;
    }
    PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (CFStringRef)[v19 pathExtension], 0);
    v21 = (__CFString *)UTTypeCopyPreferredTagWithClass(PreferredIdentifierForTag, kUTTagClassMIMEType);
    if (UTTypeConformsTo(PreferredIdentifierForTag, kUTTypeImage))
    {
      id v22 = [objc_alloc((Class)LPImage) initByReferencingFileURL:v19 MIMEType:v21];
      [v3 setImage:v22];
    }
    else
    {
      if (!UTTypeConformsTo(PreferredIdentifierForTag, kUTTypeMovie))
      {
LABEL_10:

        goto LABEL_11;
      }
      id v22 = [objc_alloc((Class)LPVideo) initByReferencingFileURL:v19 MIMEType:v21 hasAudio:1];
      [v3 setVideo:v22];
    }

    goto LABEL_10;
  }
LABEL_23:

  return v3;
}

- (MSMessage)message
{
  message = self->_message;
  if (!message)
  {
    id v4 = [(MSMessageExtensionDataSource *)self pluginPayload];
    v5 = +[MSMessageExtensionDataSource messagePayloadFromPluginPayload:v4];
    id v6 = self->_message;
    self->_message = v5;

    message = self->_message;
  }

  return message;
}

- (id)url
{
  v2 = [(MSMessageExtensionDataSource *)self message];
  id v3 = [v2 URL];

  return v3;
}

- (BOOL)supportsDynamicSize
{
  uint64_t v2 = [(MSMessageExtensionDataSource *)self message];
  id v3 = [(id)v2 layout];

  objc_opt_class();
  LOBYTE(v2) = objc_opt_isKindOfClass();

  return v2 & 1;
}

- (void)payloadWillSendFromShelf
{
  p_balloonControllerDelegate = &self->_balloonControllerDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_balloonControllerDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_balloonControllerDelegate);
    [v6 datasource:self didMoveToShelf:0];
  }
}

- (void)payloadWillEnterShelf
{
  p_balloonControllerDelegate = &self->_balloonControllerDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_balloonControllerDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_balloonControllerDelegate);
    [v6 datasource:self didMoveToShelf:1];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (qword_46F38 != -1) {
    dispatch_once(&qword_46F38, &stru_3D3B0);
  }
  id v6 = [(MSMessageExtensionDataSource *)self message];
  char v7 = [v6 layout];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [(MSMessageExtensionDataSource *)self balloonControllerDelegate];
    if (!v8)
    {
      id v9 = IMLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_25E38(v9);
      }
    }
    objc_msgSend(v8, "sizeThatFits:datasource:", self, width, height);
    double width = v10;
    double height = v11;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend((id)qword_46F30, "setIsInShelf:", -[MSMessageExtensionDataSource payloadInShelf](self, "payloadInShelf"));
      if (objc_opt_respondsToSelector()) {
        [(id)qword_46F30 dataSourcePluginPayloadDidChange:self didUpdateData:0 forceReloadData:1];
      }
      else {
        [(id)qword_46F30 dataSourcePluginPayloadDidChange:self didUpdateData:0];
      }
      [(id)qword_46F30 layoutSubviews];
      objc_msgSend((id)qword_46F30, "sizeThatFits:", width, height);
      double width = v12;
      double height = v13;
    }
  }

  double v14 = width;
  double v15 = height;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (BOOL)wantsStatusItem
{
  uint64_t v2 = [(MSMessageExtensionDataSource *)self message];
  id v3 = [v2 statusText];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (id)statusString
{
  uint64_t v2 = [(MSMessageExtensionDataSource *)self message];
  id v3 = [v2 statusText];

  return v3;
}

- (void)pluginEnabledStateChanged:(id)a3
{
  message = self->_message;
  self->_message = 0;

  [(MSMessageExtensionDataSource *)self needsResize];
}

- (void)pluginInstalled:(id)a3
{
  message = self->_message;
  self->_message = 0;

  [(MSMessageExtensionDataSource *)self needsResize];
}

- (MSMessageExtensionDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MSMessageExtensionDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MSMessageExtensionDataSourceDelegate)balloonControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_balloonControllerDelegate);

  return (MSMessageExtensionDataSourceDelegate *)WeakRetained;
}

- (void)setBalloonControllerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_balloonControllerDelegate);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_message, 0);
}

@end