@interface RichLinkPluginDataSource
+ (BOOL)supportsIndividualPreviewSummaries;
+ (BOOL)supportsURL:(id)a3;
+ (id)individualPreviewSummaryForPluginPayload:(id)a3;
- (BOOL)canProvideSize;
- (BOOL)hasPendingFetch;
- (BOOL)isCollaborationLink;
- (BOOL)isFromMe;
- (BOOL)metadataHasContent;
- (BOOL)metadataIsLikelyFinal;
- (BOOL)metadataIsViableForDisplay;
- (BOOL)wantsStatusItem;
- (CGSize)sizeThatFits:(CGSize)a3;
- (LPMessagesPayload)richLink;
- (NSString)storeIdentifier;
- (NSURL)originalURL;
- (RichLinkPluginDataSource)initWithPluginPayload:(id)a3;
- (id)_linkView:(id)a3 overrideURLForOpeningURL:(id)a4;
- (id)balloonMaskIncludingTail:(BOOL)a3 userInterfaceStyle:(int64_t)a4;
- (id)createEmptyMetadataWithOriginalURL;
- (id)createRichLinkView;
- (id)individualPreviewSummary;
- (id)metadataForDisplay;
- (id)payloadWithOutOfLineAttachments:(id *)a3;
- (id)richLinkMetadata;
- (id)sizingView;
- (id)statusAttributedString;
- (id)statusTransformer;
- (void)_didFetchMetadata:(id)a3 error:(id)a4;
- (void)_startFetchingMetadata;
- (void)addClient:(id)a3;
- (void)didTapStatusItem;
- (void)dispatchMetadataUpdateToAllClients;
- (void)ensureValidCollaborationState;
- (void)linkView:(id)a3 didFetchMetadata:(id)a4;
- (void)needsResize;
- (void)payloadWillEnterShelf;
- (void)payloadWillSendFromShelf;
- (void)pluginPayloadDidChange:(unint64_t)a3;
- (void)postProcessMetadataUpgradedByCompleteRefetch:(id)a3 originalMetadata:(id)a4;
- (void)prepareCollaborationLink:(id)a3;
- (void)richLinkViewDidMoveToSuperview:(id)a3;
- (void)setFlattenedMetadataForSending:(id)a3;
- (void)setRichLink:(id)a3;
- (void)startUpdateWatchdogIfNeeded;
- (void)statusTransformerDidUpdate:(id)a3;
- (void)tapToLoadDidFetchMetadata:(id)a3;
- (void)updateRichLinkWithFetchedMetadata:(id)a3;
- (void)updateSidednessForLinkView:(id)a3;
@end

@implementation RichLinkPluginDataSource

- (RichLinkPluginDataSource)initWithPluginPayload:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)RichLinkPluginDataSource;
  v5 = [(RichLinkPluginDataSource *)&v25 initWithPluginPayload:v4];
  if (v5)
  {
    uint64_t v6 = [v4 url];
    originalURL = v5->_originalURL;
    v5->_originalURL = (NSURL *)v6;

    v8 = [v4 data];
    v5->_hasReceivedAnyPayload = v8 != 0;

    v9 = [v4 data];

    if (v9)
    {
      v10 = [v4 data];
      v11 = [v4 attachments];
      uint64_t v12 = +[LPMessagesPayload linkWithDataRepresentation:v10 attachments:v11];
      richLink = v5->_richLink;
      v5->_richLink = (LPMessagesPayload *)v12;
    }
    if (!v5->_richLink)
    {
      v14 = (LPMessagesPayload *)objc_alloc_init((Class)LPMessagesPayload);
      v15 = v5->_richLink;
      v5->_richLink = v14;

      v5->_shouldFetchWhenSent = [v4 supportsCollaboration] ^ 1;
    }
    v16 = LPLogChannelPlugin();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = [(RichLinkPluginDataSource *)v5 messageGUID];
      v19 = [v4 data];
      id v20 = [v19 length];
      v21 = [v4 attachments];
      id v22 = [v21 count];
      unsigned int v23 = [(LPMessagesPayload *)v5->_richLink isPlaceholder];
      *(_DWORD *)buf = 138413058;
      v27 = v18;
      __int16 v28 = 2048;
      id v29 = v20;
      __int16 v30 = 2048;
      id v31 = v22;
      __int16 v32 = 1024;
      unsigned int v33 = v23;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "RichLinkPluginDataSource<%@>: initialized (payload=%lu, attachments=%lu, placeholder=%d)", buf, 0x26u);
    }
    [(RichLinkPluginDataSource *)v5 startUpdateWatchdogIfNeeded];
  }

  return v5;
}

+ (BOOL)supportsURL:(id)a3
{
  id v3 = a3;
  if ((objc_msgSend(v3, "_lp_isHTTPFamilyURL") & 1) != 0
    || objc_msgSend(v3, "_lp_hasAllowedNonHTTPScheme"))
  {
    id v4 = [v3 host];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasPendingFetch
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pendingMetadataProvider);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (id)richLinkMetadata
{
  BOOL v3 = [(RichLinkPluginDataSource *)self richLink];
  id v4 = [v3 metadata];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(RichLinkPluginDataSource *)self createEmptyMetadataWithOriginalURL];
  }
  v7 = v6;

  return v7;
}

- (BOOL)metadataIsLikelyFinal
{
  if ([(RichLinkPluginDataSource *)self isFromMe])
  {
    BOOL v3 = [(RichLinkPluginDataSource *)self pluginPayload];
    if ([v3 supportsCollaboration])
    {
      BOOL hasReceivedAnyPayload = self->_hasReceivedAnyPayload;

      if (!hasReceivedAnyPayload) {
        return 0;
      }
    }
    else
    {
    }
    return ![(RichLinkPluginDataSource *)self hasPendingFetch];
  }
  else
  {
    if (!self->_hasReceivedAnyPayload) {
      return 1;
    }
    id v6 = [(LPMessagesPayload *)self->_richLink metadata];

    if (!v6) {
      return 1;
    }
    if (![(LPMessagesPayload *)self->_richLink isPlaceholder]) {
      return 1;
    }
    v7 = [(RichLinkPluginDataSource *)self imMessage];
    v8 = [v7 time];
    v9 = [v8 dateByAddingTimeInterval:15.0];
    v10 = +[NSDate date];
    id v11 = [v9 compare:v10];

    return v11 == (id)-1 || self->_updateWatchdogDidFire;
  }
}

- (BOOL)isFromMe
{
  if ([(RichLinkPluginDataSource *)self payloadInShelf]) {
    return 1;
  }
  id v4 = [(RichLinkPluginDataSource *)self imMessage];
  if ([v4 isFromMe])
  {
    BOOL v3 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)RichLinkPluginDataSource;
    BOOL v3 = [(RichLinkPluginDataSource *)&v6 isFromMe];
  }

  return v3;
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  clients = self->_clients;
  id v8 = v4;
  if (!clients)
  {
    objc_super v6 = +[NSHashTable weakObjectsHashTable];
    v7 = self->_clients;
    self->_clients = v6;

    id v4 = v8;
    clients = self->_clients;
  }
  [(NSHashTable *)clients addObject:v4];
}

- (void)dispatchMetadataUpdateToAllClients
{
  BOOL v3 = [(RichLinkPluginDataSource *)self metadataForDisplay];
  BOOL v4 = [(RichLinkPluginDataSource *)self metadataIsLikelyFinal];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v5 = self->_clients;
  id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "rendererForRichLinkPluginDataSource:", self, (void)v12);
        [v10 _setMetadata:v3 isFinal:v4];
        if ([(RichLinkPluginDataSource *)self isCollaborationLink]) {
          [(RichLinkPluginDataSource *)self prepareCollaborationLink:v10];
        }
      }
      id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  statusTransformer = self->_statusTransformer;
  if (statusTransformer) {
    [(LPLinkMetadataStatusTransformer *)statusTransformer setMetadata:v3];
  }
  -[LPLinkView _setMetadata:isFinal:](self->_temporarySizingView, "_setMetadata:isFinal:", v3, v4, (void)v12);
  if ([(RichLinkPluginDataSource *)self isCollaborationLink]) {
    [(RichLinkPluginDataSource *)self prepareCollaborationLink:self->_temporarySizingView];
  }
}

- (void)startUpdateWatchdogIfNeeded
{
  if (![(RichLinkPluginDataSource *)self metadataIsLikelyFinal]
    && !self->_didStartUpdateWatchdog)
  {
    self->_didStartUpdateWatchdog = 1;
    BOOL v3 = [(RichLinkPluginDataSource *)self imMessage];
    BOOL v4 = [v3 time];
    BOOL v5 = [v4 dateByAddingTimeInterval:15.0];

    id v6 = +[NSDate date];
    [v5 timeIntervalSinceDate:v6];
    double v8 = v7;

    double v9 = 0.0;
    if (v8 >= 0.0) {
      double v9 = v8;
    }
    double v10 = fmin(v9, 15.0);
    id v11 = LPLogChannelPlugin();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_6ED0(v11, self, v10);
    }
    dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_3E40;
    block[3] = &unk_C3A8;
    block[4] = self;
    dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_startFetchingMetadata
{
  p_pendingMetadataProvider = &self->_pendingMetadataProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pendingMetadataProvider);

  if (!WeakRetained)
  {
    id v5 = objc_alloc_init((Class)LPMetadataProvider);
    objc_storeWeak((id *)p_pendingMetadataProvider, v5);
    id v6 = +[NSMutableURLRequest requestWithURL:self->_originalURL];
    [v6 setAttribution:1];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_4038;
    v7[3] = &unk_C420;
    v7[4] = self;
    [v5 startFetchingMetadataForRequest:v6 completionHandler:v7];
    [(RichLinkPluginDataSource *)self dispatchMetadataUpdateToAllClients];
  }
}

- (void)postProcessMetadataUpgradedByCompleteRefetch:(id)a3 originalMetadata:(id)a4
{
  id v15 = a3;
  id v5 = a4;
  id v6 = [v5 specialization];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = [v15 specialization];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_9;
    }
    id v6 = [v5 specialization];
    double v9 = [v15 specialization];
    uint64_t v10 = [v6 name];
    if (v10)
    {
      id v11 = (void *)v10;
      dispatch_time_t v12 = [v6 searchQuery];
      if (v12 || ([v9 name], (dispatch_time_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
      {
      }
      else
      {
        long long v13 = [v9 searchQuery];

        if (v13)
        {
          long long v14 = [v9 searchQuery];
          [v9 setName:v14];

          [v9 setSearchQuery:0];
        }
      }
    }
  }
LABEL_9:
}

- (void)payloadWillEnterShelf
{
  if (self->_shouldFetchWhenSent)
  {
    [(RichLinkPluginDataSource *)self _startFetchingMetadata];
  }
  else if (([(LPMessagesPayload *)self->_richLink needsSubresourceFetch] & 1) != 0 {
         || [(LPMessagesPayload *)self->_richLink needsCompleteFetch])
  }
  {
    unsigned int v3 = [(LPMessagesPayload *)self->_richLink needsCompleteFetch];
    [(LPMessagesPayload *)self->_richLink setNeedsSubresourceFetch:0];
    [(LPMessagesPayload *)self->_richLink setNeedsCompleteFetch:0];
    id v4 = objc_alloc_init((Class)LPMetadataProvider);
    id v5 = [(LPMessagesPayload *)self->_richLink metadata];
    id v6 = [v5 copy];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_46D8;
    v14[3] = &unk_C470;
    v14[4] = self;
    char v16 = v3;
    id v7 = v6;
    id v15 = v7;
    double v8 = objc_retainBlock(v14);
    if (v3)
    {
      double v9 = [(LPMessagesPayload *)self->_richLink metadata];
      uint64_t v10 = [v9 originalURL];
      if (v10)
      {
        id v11 = +[NSMutableURLRequest requestWithURL:v10];
      }
      else
      {
        dispatch_time_t v12 = [(LPMessagesPayload *)self->_richLink metadata];
        long long v13 = [v12 URL];
        id v11 = +[NSMutableURLRequest requestWithURL:v13];
      }
      [v11 setAttribution:1];
      [v4 startFetchingMetadataForRequest:v11 completionHandler:v8];
    }
    else
    {
      [v4 _startFetchingSubresourcesForPartialMetadata:v7 isNonAppInitiated:1 completionHandler:v8];
    }
    objc_storeWeak((id *)&self->_pendingMetadataProvider, v4);
    [(RichLinkPluginDataSource *)self dispatchMetadataUpdateToAllClients];
  }
}

- (id)createEmptyMetadataWithOriginalURL
{
  id v3 = objc_alloc_init((Class)LPLinkMetadata);
  [v3 setOriginalURL:self->_originalURL];

  return v3;
}

- (void)updateRichLinkWithFetchedMetadata:(id)a3
{
  id v6 = a3;
  [(LPMessagesPayload *)self->_richLink setPlaceholder:0];
  [(LPMessagesPayload *)self->_richLink setNeedsCompleteFetch:0];
  if (v6)
  {
    [(LPMessagesPayload *)self->_richLink setMetadata:v6];
  }
  else
  {
    id v4 = [(RichLinkPluginDataSource *)self createEmptyMetadataWithOriginalURL];
    [(LPMessagesPayload *)self->_richLink setMetadata:v4];
  }
  id v5 = [(LPMessagesPayload *)self->_richLink metadata];
  [v5 _resetIncompleteState];
}

- (void)setFlattenedMetadataForSending:(id)a3
{
  [(RichLinkPluginDataSource *)self updateRichLinkWithFetchedMetadata:a3];
  id v6 = 0;
  id v4 = [(RichLinkPluginDataSource *)self payloadWithOutOfLineAttachments:&v6];
  id v5 = v6;
  [(RichLinkPluginDataSource *)self setPayload:v4 attachments:v5];
}

- (BOOL)metadataHasContent
{
  v2 = [(LPMessagesPayload *)self->_richLink metadata];
  id v3 = [v2 title];
  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    id v5 = [v2 icon];
    if (v5)
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      id v6 = [v2 image];
      if (v6)
      {
        LOBYTE(v4) = 1;
      }
      else
      {
        id v7 = [v2 video];
        if (v7)
        {
          LOBYTE(v4) = 1;
        }
        else
        {
          double v8 = [v2 specialization];
          if (v8)
          {
            LOBYTE(v4) = 1;
          }
          else
          {
            id v9 = objc_alloc_init((Class)LPLinkMetadata);
            unsigned int v4 = [v2 _isEqualIgnoringURLs:v9] ^ 1;
          }
        }
      }
    }
  }
  return v4;
}

- (id)payloadWithOutOfLineAttachments:(id *)a3
{
  if ([(RichLinkPluginDataSource *)self metadataHasContent])
  {
    id v5 = [(LPMessagesPayload *)self->_richLink dataRepresentationWithOutOfLineAttachments:a3];
  }
  else
  {
    id v5 = 0;
    *a3 = 0;
  }

  return v5;
}

- (void)payloadWillSendFromShelf
{
  v15.receiver = self;
  v15.super_class = (Class)RichLinkPluginDataSource;
  [(RichLinkPluginDataSource *)&v15 payloadWillSendFromShelf];
  self->_didSendPayload = 1;
  id v3 = self->_richLink;
  unsigned int v4 = [(LPMessagesPayload *)v3 metadata];

  if (!v4)
  {
    id v5 = [(RichLinkPluginDataSource *)self createEmptyMetadataWithOriginalURL];
    [(LPMessagesPayload *)v3 setMetadata:v5];

    [(LPMessagesPayload *)v3 setPlaceholder:1];
  }
  if ([(RichLinkPluginDataSource *)self isCollaborationLink]) {
    [(RichLinkPluginDataSource *)self ensureValidCollaborationState];
  }
  id v14 = 0;
  id v6 = [(RichLinkPluginDataSource *)self payloadWithOutOfLineAttachments:&v14];
  id v7 = v14;
  double v8 = LPLogChannelPlugin();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    uint64_t v10 = [(RichLinkPluginDataSource *)self messageGUID];
    id v11 = [v6 length];
    id v12 = [v7 count];
    unsigned int v13 = [(LPMessagesPayload *)v3 isPlaceholder];
    *(_DWORD *)buf = 138413058;
    v17 = v10;
    __int16 v18 = 2048;
    id v19 = v11;
    __int16 v20 = 2048;
    id v21 = v12;
    __int16 v22 = 1024;
    unsigned int v23 = v13;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "RichLinkPluginDataSource<%@>: initial send (payload=%lu, attachments=%lu, placeholder=%d)", buf, 0x26u);
  }
  [(RichLinkPluginDataSource *)self setPayload:v6 attachments:v7];
  [(LPLinkView *)self->_temporarySizingView _setDisablePlaybackControls:0];
}

- (void)_didFetchMetadata:(id)a3 error:(id)a4
{
  -[RichLinkPluginDataSource updateRichLinkWithFetchedMetadata:](self, "updateRichLinkWithFetchedMetadata:", a3, a4);
  [(RichLinkPluginDataSource *)self dispatchMetadataUpdateToAllClients];
  id v14 = 0;
  id v5 = [(RichLinkPluginDataSource *)self payloadWithOutOfLineAttachments:&v14];
  id v6 = v14;
  BOOL didSendPayload = self->_didSendPayload;
  double v8 = LPLogChannelPlugin();
  id v9 = v8;
  if (didSendPayload)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v9;
      id v11 = [(RichLinkPluginDataSource *)self messageGUID];
      id v12 = [v5 length];
      id v13 = [v6 count];
      *(_DWORD *)buf = 138412802;
      char v16 = v11;
      __int16 v17 = 2048;
      id v18 = v12;
      __int16 v19 = 2048;
      id v20 = v13;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "RichLinkPluginDataSource<%@>: fetched metadata, sending update (payload=%lu, attachments=%lu)", buf, 0x20u);
    }
    [(RichLinkPluginDataSource *)self sendPayload:v5 attachments:v6];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_6F90(v9, self);
    }
    [(RichLinkPluginDataSource *)self setPayload:v5 attachments:v6];
  }
}

- (void)pluginPayloadDidChange:(unint64_t)a3
{
  char v3 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RichLinkPluginDataSource;
  -[RichLinkPluginDataSource pluginPayloadDidChange:](&v22, "pluginPayloadDidChange:");
  if (!self->_didSendPayload && (v3 & 3) != 0 && !self->_didTapToLoad)
  {
    id v5 = [(RichLinkPluginDataSource *)self payload];
    self->_hasReceivedAnyPayload |= v5 != 0;

    id v6 = [(RichLinkPluginDataSource *)self pluginPayload];
    id v7 = [v6 data];
    double v8 = [(RichLinkPluginDataSource *)self pluginPayload];
    id v9 = [v8 attachments];
    uint64_t v10 = +[LPMessagesPayload linkWithDataRepresentation:v7 attachments:v9];
    richLink = self->_richLink;
    self->_richLink = v10;

    id v12 = LPLogChannelPlugin();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      id v14 = [(RichLinkPluginDataSource *)self messageGUID];
      objc_super v15 = [(RichLinkPluginDataSource *)self pluginPayload];
      char v16 = [v15 data];
      id v17 = [v16 length];
      id v18 = [(RichLinkPluginDataSource *)self pluginPayload];
      __int16 v19 = [v18 attachments];
      id v20 = [v19 count];
      unsigned int v21 = [(LPMessagesPayload *)self->_richLink isPlaceholder];
      *(_DWORD *)buf = 138413058;
      v24 = v14;
      __int16 v25 = 2048;
      id v26 = v17;
      __int16 v27 = 2048;
      id v28 = v20;
      __int16 v29 = 1024;
      unsigned int v30 = v21;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "RichLinkPluginDataSource<%@>: received payload change (payload=%lu, attachments=%lu, placeholder=%d)", buf, 0x26u);
    }
    [(RichLinkPluginDataSource *)self dispatchMetadataUpdateToAllClients];
    [(RichLinkPluginDataSource *)self startUpdateWatchdogIfNeeded];
  }
}

- (BOOL)canProvideSize
{
  return 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  id v5 = +[UIScreen mainScreen];
  [v5 bounds];
  double v7 = v6;

  double v8 = +[UIApplication sharedApplication];
  id v9 = [v8 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

  if (IsAccessibilityCategory)
  {
    id v11 = +[UIScreen mainScreen];
    [v11 bounds];
    double v7 = v12 + v12;
  }
  id v13 = [(RichLinkPluginDataSource *)self sizingView];
  [(RichLinkPluginDataSource *)self updateSidednessForLinkView:v13];
  objc_msgSend(v13, "sizeThatFits:", width, v7);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  id v18 = LPLogChannelPlugin();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v21 = v18;
    objc_super v22 = [(RichLinkPluginDataSource *)self messageGUID];
    v32.double width = width;
    v32.height = v7;
    unsigned int v23 = NSStringFromCGSize(v32);
    v33.double width = v15;
    v33.height = v17;
    v24 = NSStringFromCGSize(v33);
    *(_DWORD *)buf = 138412802;
    __int16 v27 = v22;
    __int16 v28 = 2112;
    __int16 v29 = v23;
    __int16 v30 = 2112;
    id v31 = v24;
    _os_log_debug_impl(&dword_0, v21, OS_LOG_TYPE_DEBUG, "RichLinkPluginDataSource<%@>: size that fits %@ -> %@", buf, 0x20u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5384;
  block[3] = &unk_C3A8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  double v19 = v15;
  double v20 = v17;
  result.height = v20;
  result.double width = v19;
  return result;
}

- (id)sizingView
{
  temporarySizingView = self->_temporarySizingView;
  if (temporarySizingView)
  {
    char v3 = temporarySizingView;
  }
  else
  {
    id v5 = [(NSHashTable *)self->_clients anyObject];
    double v6 = [v5 rendererForRichLinkPluginDataSource:self];

    double v7 = v6;
    if (!v6)
    {
      double v8 = [(RichLinkPluginDataSource *)self createRichLinkView];
      id v9 = self->_temporarySizingView;
      self->_temporarySizingView = v8;

      double v7 = self->_temporarySizingView;
    }
    char v3 = v7;
  }

  return v3;
}

- (id)createRichLinkView
{
  temporarySizingView = self->_temporarySizingView;
  if (temporarySizingView)
  {
    unsigned int v4 = temporarySizingView;
    id v5 = self->_temporarySizingView;
    self->_temporarySizingView = 0;
  }
  else
  {
    double v6 = [RichLinkView alloc];
    double v7 = [(RichLinkPluginDataSource *)self originalURL];
    unsigned int v4 = [(RichLinkView *)v6 initWithURL:v7];

    double v8 = [(RichLinkPluginDataSource *)self originalURL];
    [(RichLinkView *)v4 _setOverrideURL:v8];

    [(RichLinkView *)v4 setDataSource:self];
    [(RichLinkView *)v4 setDelegate:self];
    [(RichLinkView *)v4 _setDisablePreviewGesture:1];
    [(RichLinkView *)v4 _setDisableHighlightGesture:0];
    [(RichLinkView *)v4 _setUsesDeferredLayout:1];
    [(RichLinkView *)v4 _setApplyCornerRadius:0];
    [(RichLinkView *)v4 _setAllowsSkinnyWidth:1];
    [(RichLinkView *)v4 _setAllowsTapToLoad:[(RichLinkPluginDataSource *)self isFromMe] ^ 1];
    id v9 = [(RichLinkPluginDataSource *)self metadataForDisplay];
    [(RichLinkView *)v4 _setMetadata:v9 isFinal:[(RichLinkPluginDataSource *)self metadataIsLikelyFinal]];

    [(RichLinkPluginDataSource *)self updateSidednessForLinkView:v4];
    if ([(RichLinkPluginDataSource *)self isCollaborationLink]) {
      [(RichLinkPluginDataSource *)self prepareCollaborationLink:v4];
    }
  }

  return v4;
}

- (void)richLinkViewDidMoveToSuperview:(id)a3
{
  id v4 = a3;
  if (self->_hasDeferredResize)
  {
    id v6 = v4;
    id v5 = [v4 superview];

    id v4 = v6;
    if (v5)
    {
      self->_hasDeferredResize = 0;
      [(RichLinkPluginDataSource *)self needsResize];
      id v4 = v6;
    }
  }
}

- (void)updateSidednessForLinkView:(id)a3
{
  id v38 = a3;
  BOOL v4 = [(RichLinkPluginDataSource *)self isFromMe];
  id v5 = [(RichLinkPluginDataSource *)self payloadInShelf];
  uint64_t disableAnimations = self->_disableAnimations;
  uint64_t v7 = v5 ^ 1;
  if (!self->_disableAnimations && ((v5 ^ 1) & 1) == 0)
  {
    double v8 = [(RichLinkPluginDataSource *)self pluginPayload];
    unsigned int v9 = [v8 supportsCollaboration];

    uint64_t disableAnimations = v9 ^ 1;
  }
  [v38 _setDisableAnimations:disableAnimations];
  if (v4)
  {
    uint64_t v10 = [(RichLinkPluginDataSource *)self pluginPayload];
    unsigned int v11 = [v10 supportsCollaboration];

    if (v11) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  [v38 _setAnimationOrigin:v12];
  [v38 _setNeedsMessagesTranscriptPushCounterAnimation:v7];
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  int v17 = _os_feature_enabled_impl();
  id v18 = +[CKUIBehavior sharedBehaviors];
  double v19 = v18;
  double v37 = bottom;
  if (v17 || (v5 & 1) == 0)
  {
    [v18 pluginBalloonInsetsForMessageFromMe:v4];
    double v25 = v26;
    double v36 = v27;
    double bottom = v28;
    double v30 = v29;

    double v23 = right;
    double v24 = left;
    double right = v30;
    double top = UIEdgeInsetsZero.top;
    double left = v36;
  }
  else
  {
    [v18 entryViewLinkViewDiscardButtonDiameter];
    double v21 = v20;

    id v22 = [v38 effectiveUserInterfaceLayoutDirection];
    if (v22) {
      double v23 = right;
    }
    else {
      double v23 = v21;
    }
    if (v22) {
      double v24 = v21;
    }
    else {
      double v24 = left;
    }
    double v25 = UIEdgeInsetsZero.top;
  }
  objc_msgSend(v38, "setContentInset:", v25, left, bottom, right);
  objc_msgSend(v38, "_setTextSafeAreaInset:", top, v24, v37, v23);
  [v38 _setForceFlexibleWidth:1];
  [v38 _setInComposeContext:v5];
  [v38 _setInSenderContext:v4];
  [v38 _setDisableTapGesture:v5];
  [v38 _setDisableHighlightGesture:v5];
  id v31 = [v38 traitCollection];
  CGSize v32 = -[RichLinkPluginDataSource balloonMaskIncludingTail:userInterfaceStyle:](self, "balloonMaskIncludingTail:userInterfaceStyle:", v7, [v31 userInterfaceStyle]);

  [v38 _setMaskImage:v32];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(RichLinkPluginDataSource *)self isDeferredSend] & 1) != 0)
  {
    CGSize v33 = +[UIColor clearColor];
    [v38 _setOverrideBackgroundColor:v33];

    uint64_t v34 = 1;
  }
  else
  {
    [v38 _setOverrideBackgroundColor:0];
    uint64_t v34 = 0;
  }
  id v35 = objc_alloc_init((Class)LPLinkRendererSizeClassParameters);
  [v35 setUseDominantColorForText:v34];
  [v35 setNeedsSpaceAffordanceForDeleteButton:1];
  [v38 _setSizeClassParameters:v35];
}

- (id)balloonMaskIncludingTail:(BOOL)a3 userInterfaceStyle:(int64_t)a4
{
  BOOL v4 = CKResizableBalloonMask();

  return v4;
}

- (void)needsResize
{
  char v3 = LPLogChannelPlugin();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_7028(v3, self);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v4 = self->_clients;
  id v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) rendererForRichLinkPluginDataSource:self];
        unsigned int v11 = [v10 superview];
        v7 |= v11 != 0;
      }
      id v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);

    if (v7)
    {
      v12.receiver = self;
      v12.super_class = (Class)RichLinkPluginDataSource;
      [(RichLinkPluginDataSource *)&v12 needsResize];
      return;
    }
  }
  else
  {
  }
  self->_hasDeferredResize = 1;
}

- (NSURL)originalURL
{
  originalURL = self->_originalURL;
  if (originalURL)
  {
    char v3 = originalURL;
    goto LABEL_8;
  }
  id v5 = [(LPMessagesPayload *)self->_richLink metadata];
  id v6 = [v5 originalURL];

  char v7 = [(LPMessagesPayload *)self->_richLink metadata];
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v7 originalURL];
LABEL_7:
    char v3 = (NSURL *)v9;

    goto LABEL_8;
  }
  uint64_t v10 = [v7 URL];

  if (v10)
  {
    uint64_t v8 = [(LPMessagesPayload *)self->_richLink metadata];
    uint64_t v9 = [v8 URL];
    goto LABEL_7;
  }
  char v3 = 0;
LABEL_8:

  return v3;
}

- (NSString)storeIdentifier
{
  id v3 = objc_alloc((Class)LPLinkMetadataStoreTransformer);
  BOOL v4 = [(RichLinkPluginDataSource *)self metadataForDisplay];
  id v5 = [(RichLinkPluginDataSource *)self originalURL];
  id v6 = [v3 initWithMetadata:v4 URL:v5];

  char v7 = [v6 storeIdentifier];

  return (NSString *)v7;
}

- (id)_linkView:(id)a3 overrideURLForOpeningURL:(id)a4
{
  id v5 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(RichLinkPluginDataSource *)self overrideURLForOpeningURL:v5];
  }
  else
  {
    id v6 = v5;
  }
  char v7 = v6;

  return v7;
}

- (BOOL)metadataIsViableForDisplay
{
  id v3 = [(LPMessagesPayload *)self->_richLink metadata];

  if (!v3)
  {
LABEL_5:
    LOBYTE(v4) = 0;
    return v4;
  }
  BOOL v4 = [(RichLinkPluginDataSource *)self metadataHasContent];
  if (v4)
  {
    if (![(RichLinkPluginDataSource *)self payloadInShelf]
      || (id WeakRetained = objc_loadWeakRetained((id *)&self->_pendingMetadataProvider),
          WeakRetained,
          !WeakRetained))
    {
      LOBYTE(v4) = 1;
      return v4;
    }
    goto LABEL_5;
  }
  return v4;
}

- (id)metadataForDisplay
{
  if ([(RichLinkPluginDataSource *)self metadataIsViableForDisplay])
  {
    id v3 = [(LPMessagesPayload *)self->_richLink metadata];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)linkView:(id)a3 didFetchMetadata:(id)a4
{
}

- (void)tapToLoadDidFetchMetadata:(id)a3
{
  self->_didTapToLoad = 1;
  id v4 = a3;
  [(RichLinkPluginDataSource *)self updateRichLinkWithFetchedMetadata:v4];
  [(LPLinkView *)self->_temporarySizingView _setAllowsTapToLoad:0];
  [(LPLinkView *)self->_temporarySizingView _setMetadata:v4 isFinal:1];

  id v12 = 0;
  id v5 = [(RichLinkPluginDataSource *)self payloadWithOutOfLineAttachments:&v12];
  id v6 = v12;
  char v7 = LPLogChannelPlugin();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    uint64_t v9 = [(RichLinkPluginDataSource *)self messageGUID];
    id v10 = [v5 length];
    id v11 = [v6 count];
    *(_DWORD *)buf = 138412802;
    long long v14 = v9;
    __int16 v15 = 2048;
    id v16 = v10;
    __int16 v17 = 2048;
    id v18 = v11;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "RichLinkPluginDataSource<%@>: tap-to-load complete (payload=%lu, attachments=%lu)", buf, 0x20u);
  }
  [(RichLinkPluginDataSource *)self updatePayload:v5 attachments:v6];
}

+ (BOOL)supportsIndividualPreviewSummaries
{
  return 1;
}

- (id)individualPreviewSummary
{
  id v3 = objc_alloc((Class)LPLinkMetadataPreviewTransformer);
  id v4 = [(RichLinkPluginDataSource *)self metadataForDisplay];
  id v5 = [(RichLinkPluginDataSource *)self originalURL];
  id v6 = [v3 initWithMetadata:v4 URL:v5];

  char v7 = [v6 previewSummary];

  return v7;
}

+ (id)individualPreviewSummaryForPluginPayload:(id)a3
{
  id v3 = a3;
  id v4 = [v3 data];

  if (v4)
  {
    id v5 = [v3 data];
    id v6 = [v3 attachments];
    char v7 = +[LPMessagesPayload linkWithDataRepresentation:v5 attachments:v6];

    uint64_t v8 = [v3 url];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v12 = [v7 metadata];
      long long v13 = [v12 originalURL];
      long long v14 = v13;
      if (v13)
      {
        id v10 = v13;
      }
      else
      {
        __int16 v15 = [v7 metadata];
        id v10 = [v15 URL];
      }
    }

    id v16 = objc_alloc((Class)LPLinkMetadataPreviewTransformer);
    __int16 v17 = [v7 metadata];
    id v18 = [v16 initWithMetadata:v17 URL:v10];

    id v11 = [v18 previewSummary];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)isCollaborationLink
{
  v2 = [(RichLinkPluginDataSource *)self pluginPayload];
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v3 = [v2 isCollaboration];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      BOOL v4 = 0;
      goto LABEL_7;
    }
    unsigned __int8 v3 = [v2 supportsCollaboration];
  }
  BOOL v4 = v3;
LABEL_7:

  return v4;
}

- (void)prepareCollaborationLink:(id)a3
{
  id v4 = a3;
  if ([(RichLinkPluginDataSource *)self payloadInShelf] && self->_hasReceivedAnyPayload)
  {
    [v4 _setCollaborative:1];
    id v5 = [(RichLinkPluginDataSource *)self pluginPayload];
    v44 = [v5 collaborationMetadata];

    id v6 = [(RichLinkPluginDataSource *)self pluginPayload];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      uint64_t v8 = [(RichLinkPluginDataSource *)self pluginPayload];
      v43 = [v8 collaborationOptionsSummary];
    }
    else
    {
      v43 = sub_33C8(@"Share Options");
    }
    id v9 = [objc_alloc((Class)SLCollaborationFooterViewModel) initWithMetadata:v44];
    [v9 setOptionsSummary:v43];
    id v10 = [(RichLinkPluginDataSource *)self pluginPayload];
    id v11 = (char *)[v10 payloadCollaborationType];

    if (v11 == (unsigned char *)&dword_0 + 2)
    {
      id v12 = objc_alloc_init((Class)NSTextAttachment);
      long long v13 = +[UIImage systemImageNamed:@"person.2.fill"];
      long long v14 = [v13 imageWithRenderingMode:2];
      [v12 setImage:v14];

      __int16 v15 = +[NSAttributedString attributedStringWithAttachment:v12];
      id v16 = [v15 mutableCopy];

      id v17 = [objc_alloc((Class)NSAttributedString) initWithString:@" "];
      [v16 appendAttributedString:v17];

      id v18 = objc_alloc((Class)NSAttributedString);
      double v19 = sub_33C8(@"Collaboration");
      id v20 = [v18 initWithString:v19];
      [v16 appendAttributedString:v20];

      [v4 _setOverrideSubtitle:v16];
      goto LABEL_14;
    }
    objc_initWeak(&location, v4);
    v42 = sub_33C8(@"Collaborate");
    v41 = sub_33C8(@"Send Copy");
    id v21 = objc_alloc((Class)LPImage);
    id v22 = +[UIImage systemImageNamed:@"person.2"];
    id v23 = [v21 initWithPlatformImage:v22];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_69B0;
    v48[3] = &unk_C498;
    v48[4] = self;
    v40 = &v50;
    objc_copyWeak(&v50, &location);
    id v49 = v9;
    double v24 = +[LPButtonAction actionWithTitle:v42 image:v23 handler:v48];

    id v25 = objc_alloc((Class)LPImage);
    double v26 = +[UIImage systemImageNamed:@"person.2.fill"];
    id v27 = [v25 initWithPlatformImage:v26];
    [v24 setVisibleImage:v27];

    id v28 = objc_alloc((Class)LPImage);
    double v29 = +[UIImage systemImageNamed:@"doc"];
    id v30 = [v28 initWithPlatformImage:v29];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_6A74;
    v46[3] = &unk_C4C0;
    v46[4] = self;
    objc_copyWeak(&v47, &location);
    id v31 = +[LPButtonAction actionWithTitle:v41 image:v30 handler:v46];

    id v32 = objc_alloc((Class)LPImage);
    CGSize v33 = +[UIImage systemImageNamed:@"doc.fill"];
    id v34 = [v32 initWithPlatformImage:v33];
    [v31 setVisibleImage:v34];

    id v35 = [(RichLinkPluginDataSource *)self pluginPayload];
    if (objc_opt_respondsToSelector())
    {
      double v36 = [(RichLinkPluginDataSource *)self pluginPayload];
      unsigned int v37 = [v36 sendAsCopy];

      if (v37)
      {
        [v31 setSelected:1];
        char v38 = 0;
        goto LABEL_13;
      }
    }
    else
    {
    }
    char v38 = 1;
    objc_msgSend(v24, "setSelected:", 1, v40);
LABEL_13:
    v52[0] = v24;
    v52[1] = v31;
    v39 = +[NSArray arrayWithObjects:v52 count:2];
    [v4 _setButtonActions:v39];

    objc_destroyWeak(&v47);
    objc_destroyWeak(v40);

    objc_destroyWeak(&location);
    if ((v38 & 1) == 0)
    {
LABEL_15:

      goto LABEL_16;
    }
LABEL_14:
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_6AF8;
    v45[3] = &unk_C3A8;
    v45[4] = self;
    [v4 _setCollaborationFooterViewModel:v9 action:v45];
    goto LABEL_15;
  }
LABEL_16:
}

- (void)ensureValidCollaborationState
{
  id v7 = [(LPMessagesPayload *)self->_richLink metadata];
  unsigned __int8 v3 = [v7 specialization];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [v7 specialization];
    id v6 = [(RichLinkPluginDataSource *)self pluginPayload];
    objc_msgSend(v5, "setIsCollaboration:", objc_msgSend(v6, "sendAsCopy") ^ 1);
  }
}

- (id)statusTransformer
{
  statusTransformer = self->_statusTransformer;
  if (!statusTransformer)
  {
    id v4 = objc_alloc((Class)LPLinkMetadataStatusTransformer);
    id v5 = [(RichLinkPluginDataSource *)self metadataForDisplay];
    id v6 = [(RichLinkPluginDataSource *)self originalURL];
    id v7 = (LPLinkMetadataStatusTransformer *)[v4 initWithMetadata:v5 URL:v6];
    uint64_t v8 = self->_statusTransformer;
    self->_statusTransformer = v7;

    [(LPLinkMetadataStatusTransformer *)self->_statusTransformer setDelegate:self];
    statusTransformer = self->_statusTransformer;
  }

  return statusTransformer;
}

- (BOOL)wantsStatusItem
{
  v2 = [(RichLinkPluginDataSource *)self statusTransformer];
  unsigned __int8 v3 = [v2 statusText];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)statusAttributedString
{
  v2 = [(RichLinkPluginDataSource *)self statusTransformer];
  unsigned __int8 v3 = [v2 statusText];

  return v3;
}

- (void)didTapStatusItem
{
  id v4 = [(RichLinkPluginDataSource *)self statusTransformer];
  v2 = +[UIApplication sharedApplication];
  unsigned __int8 v3 = [v4 actionURL];
  [v2 openURL:v3 options:&__NSDictionary0__struct completionHandler:0];
}

- (void)statusTransformerDidUpdate:(id)a3
{
}

- (LPMessagesPayload)richLink
{
  return self->_richLink;
}

- (void)setRichLink:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richLink, 0);
  objc_storeStrong((id *)&self->_statusTransformer, 0);
  objc_storeStrong((id *)&self->_temporarySizingView, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong((id *)&self->_clients, 0);

  objc_destroyWeak((id *)&self->_pendingMetadataProvider);
}

@end