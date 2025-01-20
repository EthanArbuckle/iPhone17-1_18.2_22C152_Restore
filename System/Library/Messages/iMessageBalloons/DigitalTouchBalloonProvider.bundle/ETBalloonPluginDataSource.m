@interface ETBalloonPluginDataSource
+ (id)previewSummary;
- (BOOL)canProvideSize;
- (BOOL)hasMediaPayload;
- (BOOL)sessionHasMultipleMessages;
- (BOOL)wantsReplyFromContentView;
- (CGSize)sizeThatFits:(CGSize)a3;
- (ETBalloonPluginDataSource)initWithPluginPayload:(id)a3;
- (ETBalloonPluginDataSourceDelegate)delegate;
- (NSArray)createSessionMessages;
- (NSURL)mediaURL;
- (id)_unarchiveMessageFromData:(id)a3 withAttachments:(id)a4;
- (unint64_t)playbackType;
- (void)playbackWithCompletionBlock:(id)a3;
- (void)pluginPayloadDidChange:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)stopPlayback;
@end

@implementation ETBalloonPluginDataSource

+ (id)previewSummary
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"TRANSCRIPT_PREVIEW_SUMMARY" value:&stru_24D60 table:@"DigitalTouchBalloonProvider-Localizable"];

  return v3;
}

- (ETBalloonPluginDataSource)initWithPluginPayload:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ETBalloonPluginDataSource;
  v5 = [(ETBalloonPluginDataSource *)&v12 initWithPluginPayload:v4];
  v6 = v5;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
    unsigned int v8 = [WeakRetained dataSourceShouldUseDemoHook:v6];

    if (v8)
    {
      v9 = [(ETBalloonPluginDataSource *)v6 mediaURL];
      v6->_hasMediaPayload = v9 != 0;
    }
    else
    {
      v9 = [v4 data];
      v10 = +[ETMessage unarchive:v9];
      v6->_hasMediaPayload = [v10 messageType] == 8;
    }
  }

  return v6;
}

- (BOOL)canProvideSize
{
  return 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  UIRoundToViewScale();
  double v5 = v4;
  UIRoundToViewScale();
  double v7 = v6;
  unsigned int v8 = +[UIApplication sharedApplication];
  v9 = [v8 statusBar];
  [v9 size];
  double v11 = v10;

  objc_super v12 = +[UIScreen mainScreen];
  [v12 bounds];
  double v14 = v13;

  double v15 = v14 - v11 + -32.0 + -44.0;
  if (height < v15) {
    double v15 = height;
  }
  double v16 = v15 + -12.0;
  if (v7 <= v15 + -12.0)
  {
    double v16 = v7;
  }
  else
  {
    UIRoundToViewScale();
    double v5 = v17;
  }
  double v18 = v5;
  double v19 = v16;
  result.double height = v19;
  result.width = v18;
  return result;
}

- (BOOL)wantsReplyFromContentView
{
  return 1;
}

- (NSArray)createSessionMessages
{
  v3 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v4 = [(ETBalloonPluginDataSource *)self allPayloads];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        double v10 = [(ETBalloonPluginDataSource *)self pluginPayload];
        double v11 = [v10 attachments];
        objc_super v12 = [(ETBalloonPluginDataSource *)self _unarchiveMessageFromData:v9 withAttachments:v11];

        if (v12) {
          [v3 addObject:v12];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  self->_sessionHasMultipleMessages = (unint64_t)[v3 count] > 1;

  return (NSArray *)v3;
}

- (id)_unarchiveMessageFromData:(id)a3 withAttachments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = +[ETMessage unarchive:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v19 = v8;
  [WeakRetained dataSource:self addDemoHookToMessage:&v19];
  id v10 = v19;

  if ([v10 messageType] == 8)
  {
    if ([v7 count])
    {
      double v11 = [v7 objectAtIndex:0];
      if (IMOSLoggingEnabled())
      {
        objc_super v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v11;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Setting attachment: %@", buf, 0xCu);
        }
      }
      if ([v10 messageType] == 8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v10 setMediaURL:v11];
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            double v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              long long v14 = [v10 identifier];
              long long v15 = objc_opt_class();
              *(_DWORD *)buf = 138412546;
              v21 = v14;
              __int16 v22 = 2112;
              v23 = v15;
              id v16 = v15;
              _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Media message with ID: %@ has attachment of class %@ instead of NSURL.", buf, 0x16u);
            }
          }

          id v10 = 0;
        }
      }
    }
    else
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_20;
      }
      double v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Missing attachment with video message payload!", buf, 2u);
      }
    }
  }
LABEL_20:
  id v17 = v10;

  return v17;
}

- (void)pluginPayloadDidChange:(unint64_t)a3
{
  char v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ETBalloonPluginDataSource;
  -[ETBalloonPluginDataSource pluginPayloadDidChange:](&v15, "pluginPayloadDidChange:");
  id v5 = [(ETBalloonPluginDataSource *)self pluginPayload];
  id v6 = [v5 data];
  id v7 = [v5 attachments];
  unsigned int v8 = v7;
  if (v3)
  {
    uint64_t v9 = [(ETBalloonPluginDataSource *)self _unarchiveMessageFromData:v6 withAttachments:v7];
    self->_hasMediaPayload = [v9 messageType] == 8;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dataSource:self didReceiveSessionMessage:v9];
LABEL_8:

    goto LABEL_9;
  }
  if ((v3 & 2) == 0)
  {
LABEL_9:
    uint64_t v9 = [(ETBalloonPluginDataSource *)self allPayloads];
    self->_sessionHasMultipleMessages = (unint64_t)[v9 count] > 1;
    goto LABEL_10;
  }
  if ([v7 count])
  {
    uint64_t v9 = [v8 objectAtIndexedSubscript:0];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_10:

      goto LABEL_11;
    }
    id WeakRetained = +[ETMessageHeaderReader identifierInArchive:v6];
    if (+[ETMessageHeaderReader messageTypeInArchive:v6] == 8)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 dataSource:self didUpdateAttachmentURL:v9 forMessageWithIdentifier:WeakRetained];
    }
    else if (IMOSLoggingEnabled())
    {
      objc_super v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = [v6 length];
        long long v14 = [v5 messageGUID];
        *(_DWORD *)buf = 134218498;
        id v17 = v13;
        __int16 v18 = 2112;
        id v19 = v14;
        __int16 v20 = 2112;
        v21 = v8;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Attachment update for non-attachment message. Please file a radar! pluginPayload data length: %lu, pluginPayload messageGUID: '%@', pluginPayload attachments: %@", buf, 0x20u);
      }
    }
    goto LABEL_8;
  }
LABEL_11:
}

- (BOOL)hasMediaPayload
{
  return self->_hasMediaPayload;
}

- (NSURL)mediaURL
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned int v4 = [WeakRetained dataSourceShouldUseDemoHook:self];

  if (v4)
  {
    id v5 = [(ETBalloonPluginDataSource *)self payload];
    id v6 = [(ETBalloonPluginDataSource *)self pluginPayload];
    id v7 = [v6 attachments];
    unsigned int v8 = [(ETBalloonPluginDataSource *)self _unarchiveMessageFromData:v5 withAttachments:v7];

    if ([v8 messageType] == 8)
    {
      id v9 = [v8 mediaURL];
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v10 = [(ETBalloonPluginDataSource *)self pluginPayload];
  unsigned int v8 = [v10 attachments];

  if (![v8 count])
  {
LABEL_8:
    id v9 = 0;
    goto LABEL_9;
  }
  id v11 = [v8 objectAtIndexedSubscript:0];
  objc_opt_class();
  id v9 = 0;
  if (objc_opt_isKindOfClass()) {
    id v9 = v11;
  }

LABEL_9:

  return (NSURL *)v9;
}

- (unint64_t)playbackType
{
  return 1;
}

- (void)playbackWithCompletionBlock:(id)a3
{
  id v7 = (void (**)(id, void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned int v5 = [WeakRetained dataSourceViewIsMostlyVisible:self];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 dataSource:self startPlaybackWithCompletion:v7];
  }
  else if (v7)
  {
    v7[2](v7, 0);
  }
}

- (void)stopPlayback
{
  id v3 = [(ETBalloonPluginDataSource *)self delegate];
  [v3 dataSourceStopPlayback:self];
}

- (ETBalloonPluginDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ETBalloonPluginDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)sessionHasMultipleMessages
{
  return self->_sessionHasMultipleMessages;
}

- (void).cxx_destruct
{
}

@end