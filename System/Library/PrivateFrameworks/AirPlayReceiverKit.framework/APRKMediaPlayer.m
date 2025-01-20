@interface APRKMediaPlayer
- (APRKMediaPlayer)initWithP2PWiFiSupport:(BOOL)a3 isInterstitialPlayer:(BOOL)a4 playerSessionID:(int)a5;
- (APRKMediaPlayerMessagingDelegate)messagingDelegate;
- (APRKMetadata)currentItemMetadata;
- (AVPlayerItem)currentItem;
- (AVQueuePlayer)backingAVQueuePlayer;
- (BOOL)_attemptToSetSelectedMediaArray:(id)a3;
- (BOOL)_ensureFairPlayHelper;
- (BOOL)_shouldIgnoreSeekCompletionForSeekID:(int)a3 forItem:(id)a4;
- (BOOL)isInterstitialPlayer;
- (BOOL)shouldDelegateToInterstitialPlayerForMessageAndID:(id)a3 sessionID:(int)a4;
- (id)_SSLPropertiesforTLSInfo:(id)a3;
- (id)_currentPlaybackInfoDictionary;
- (id)_figPlaybackStateStringFrom:(int64_t)a3;
- (id)_fixedIPContentLocationFromURLString:(id)a3 error:(id *)a4;
- (id)_frontPlayerItem;
- (id)_getPropertyWithDictionary:(id)a3;
- (id)_playerItemForUUID:(id)a3;
- (id)_processAuthorizeItemWithDictionary:(id)a3;
- (id)_processMessageWithDictionaryInternal:(id)a3;
- (id)_processPlaybackInfoRequestWithDictionary:(id)a3;
- (id)_seekRequestMessageForSeekID:(int)a3 forItem:(id)a4;
- (id)_serializeTimeRanges:(id)a3;
- (id)_timedMetadataFromAVTimedMetadata:(id)a3;
- (id)processMessageWithIDAndDictionarySync:(id)a3 messageSessionID:(int)a4;
- (id)selectedMediaArrayForItem:(id)a3;
- (int)playerSessionID;
- (void)_addPendingSeekID:(int)a3 withMessage:(id)a4 forItem:(id)a5 ignoreSeekCompletion:(BOOL)a6;
- (void)_ensureInterstitialPlayerFor:(int)a3;
- (void)_handleCurrentItemChangedNotification:(id)a3;
- (void)_handleCurrentItemFailedToPlayToEndNotification:(id)a3;
- (void)_handleCurrentItemPlaybackStalledNotification:(id)a3;
- (void)_handleCurrentItemPlayedToEndNotification:(id)a3;
- (void)_handleCurrentPlayerItemMediaSelectionDidChangeNotification:(id)a3;
- (void)_handleCurrentPlayerItemNewAccessLogEntryNotification:(id)a3;
- (void)_handleCurrentPlayerItemReachedTimeToPauseBufferingNotification:(id)a3;
- (void)_handleCurrentPlayerItemReachedTimeToPausePlaybackNotification:(id)a3;
- (void)_handleSeekDidCompleteNotification:(id)a3;
- (void)_handleTimeJumpedNotification:(id)a3;
- (void)_insertPlayQueueItemWithDictionary:(id)a3;
- (void)_pausePlayerIfNeededForState:(int64_t)a3;
- (void)_processStreamingKeyWithDictionary:(id)a3;
- (void)_processUnhandledURLWithDictionary:(id)a3;
- (void)_registerNotificationHandlersAndInsertPlayerItem:(id)a3 afterItem:(id)a4;
- (void)_registerNotificationHandlersForPlayer;
- (void)_removePendingSeekID:(int)a3 forItem:(id)a4;
- (void)_removePlayQueueItemWithDictionary:(id)a3;
- (void)_seekWithDictionary:(id)a3;
- (void)_sendUpstreamErrorMessageWithError:(id)a3;
- (void)_sendUpstreamMessageWithDictionary:(id)a3;
- (void)_sendUpstreamPlaybackStateMessageWithPlaybackStateString:(id)a3 stoppedBecauseInterrupted:(BOOL)a4;
- (void)_setPropertyWithDictionary:(id)a3;
- (void)_setRateWithDictionary:(id)a3;
- (void)_stopWithDictionary:(id)a3;
- (void)_unregisterNotificationHandlersAndRemovePlayerItem:(id)a3;
- (void)_unregisterNotificationHandlersForPlayer;
- (void)_updateAudioSessionMode:(id)a3;
- (void)_updatePlaybackStateWithState:(int64_t)a3 stoppedBecauseInterrupted:(BOOL)a4 shouldSendUpstreamMessage:(BOOL)a5;
- (void)addDateRangeCollectorToItem:(id)a3;
- (void)contentKeyHelper:(id)a3 didGenerateSecureStopRecordPayload:(id)a4;
- (void)contentKeyHelper:(id)a3 wantsToPerformContentKeyRequestWithDictionary:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)metadataCollector:(id)a3 didCollectDateRangeMetadataGroups:(id)a4 indexesOfNewGroups:(id)a5 indexesOfModifiedGroups:(id)a6;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)processMessageWithIDAndDictionaryAsync:(id)a3 messageSessionID:(int)a4;
- (void)processTLSInfoDictionary:(id)a3;
- (void)resourceLoaderHelper:(id)a3 wantsToPerformUnhandledURLRequestWithDictionary:(id)a4 forRequestID:(id)a5;
- (void)setCurrentItemMetadata:(id)a3;
- (void)setMessagingDelegate:(id)a3;
- (void)setReceiverNetworkClock:(OpaqueAPSNetworkClock *)a3;
- (void)setSessionReceiverAddress:(OpaqueAPSNetworkAddress *)a3;
- (void)stopWithCompletionBlock:(id)a3;
@end

@implementation APRKMediaPlayer

- (APRKMediaPlayer)initWithP2PWiFiSupport:(BOOL)a3 isInterstitialPlayer:(BOOL)a4 playerSessionID:(int)a5
{
  v23.receiver = self;
  v23.super_class = (Class)APRKMediaPlayer;
  v8 = [(APRKMediaPlayer *)&v23 init];
  v9 = v8;
  if (v8)
  {
    v8->_stallCount = 0;
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.APRKMediaPlayer.messageQueue", 0);
    messageQueue = v9->_messageQueue;
    v9->_messageQueue = (OS_dispatch_queue *)v10;

    v12 = (AVQueuePlayer *)objc_alloc_init(MEMORY[0x263EFA860]);
    player = v9->_player;
    v9->_player = v12;

    [(AVQueuePlayer *)v9->_player setAllowsExternalPlayback:0];
    [(APRKMediaPlayer *)v9 _registerNotificationHandlersForPlayer];
    previousItemUUID = v9->_previousItemUUID;
    v9->_previousItemUUID = 0;

    currentItemUUID = v9->_currentItemUUID;
    v9->_currentItemUUID = 0;

    v16 = objc_alloc_init(APRKResourceLoaderHelper);
    resourceLoaderHelper = v9->_resourceLoaderHelper;
    v9->_resourceLoaderHelper = v16;

    [(APRKResourceLoaderHelper *)v9->_resourceLoaderHelper setDelegate:v9];
    v18 = objc_alloc_init(APRKContentKeyHelper);
    contentKeyHelper = v9->_contentKeyHelper;
    v9->_contentKeyHelper = v18;

    [(APRKContentKeyHelper *)v9->_contentKeyHelper setDelegate:v9];
    v9->_isP2PWiFiSession = a3;
    v9->_isInterstitialPlayer = a4;
    v9->_playerSessionID = a5;
    v9->_receiverNetworkClock = 0;
    *(_DWORD *)&v9->_isFirstSetRateReceived = 0;
    uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];
    pendingSenderSeekMessages = v9->_pendingSenderSeekMessages;
    v9->_pendingSenderSeekMessages = (NSMutableDictionary *)v20;

    v9->_fpHelper = 0;
  }
  return v9;
}

- (void)dealloc
{
  if (self->_fpHelper)
  {
    APReceiverFairPlayHelperRemoveAllFPSessions();
    fpHelper = self->_fpHelper;
    if (fpHelper) {
      CFRelease(fpHelper);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)APRKMediaPlayer;
  [(APRKMediaPlayer *)&v4 dealloc];
}

- (void)invalidate
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__APRKMediaPlayer_invalidate__block_invoke;
  block[3] = &unk_264EA1AE8;
  block[4] = self;
  dispatch_async(messageQueue, block);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__APRKMediaPlayer_invalidate__block_invoke_2;
  v4[3] = &unk_264EA1AE8;
  v4[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

void __29__APRKMediaPlayer_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 88) setDelegate:0];
  [*(id *)(*(void *)(a1 + 32) + 96) setDelegate:0];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(const void **)(v2 + 128);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(*(void *)(a1 + 32) + 128) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_super v4 = *(const void **)(v2 + 120);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(*(void *)(a1 + 32) + 120) = 0;
  }
}

void __29__APRKMediaPlayer_invalidate__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 138) = 1;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) items];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 32) _unregisterNotificationHandlersAndRemovePlayerItem:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
  [*(id *)(a1 + 32) _unregisterNotificationHandlersForPlayer];
}

- (AVQueuePlayer)backingAVQueuePlayer
{
  return self->_player;
}

- (AVPlayerItem)currentItem
{
  return (AVPlayerItem *)[(AVQueuePlayer *)self->_player currentItem];
}

- (void)stopWithCompletionBlock:(id)a3
{
  id v4 = a3;
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__APRKMediaPlayer_stopWithCompletionBlock___block_invoke;
  block[3] = &unk_264EA1AE8;
  block[4] = self;
  dispatch_sync(messageQueue, block);
  uint64_t v6 = self->_messageQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__APRKMediaPlayer_stopWithCompletionBlock___block_invoke_2;
  v8[3] = &unk_264EA1B10;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __43__APRKMediaPlayer_stopWithCompletionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePlaybackStateWithState:3 stoppedBecauseInterrupted:1 shouldSendUpstreamMessage:0];
}

void __43__APRKMediaPlayer_stopWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updatePlaybackStateWithState:3 stoppedBecauseInterrupted:1 shouldSendUpstreamMessage:1];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 176);
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 176);
    *(void *)(v4 + 176) = 0;

    [v3 setMessagingDelegate:0];
    [*(id *)(*(void *)(a1 + 32) + 8) _setInterstitialPlayer:0];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __43__APRKMediaPlayer_stopWithCompletionBlock___block_invoke_3;
    v9[3] = &unk_264EA1B10;
    id v10 = v3;
    id v11 = *(id *)(a1 + 40);
    id v6 = v3;
    [v6 stopWithCompletionBlock:v9];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      long long v8 = *(void (**)(void))(v7 + 16);
      v8();
    }
  }
}

uint64_t __43__APRKMediaPlayer_stopWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)setMessagingDelegate:(id)a3
{
}

- (APRKMediaPlayerMessagingDelegate)messagingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messagingDelegate);
  return (APRKMediaPlayerMessagingDelegate *)WeakRetained;
}

- (void)setSessionReceiverAddress:(OpaqueAPSNetworkAddress *)a3
{
  sessionReceiverAddr = self->_sessionReceiverAddr;
  self->_sessionReceiverAddr = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (sessionReceiverAddr)
  {
    CFRelease(sessionReceiverAddr);
  }
}

- (void)setReceiverNetworkClock:(OpaqueAPSNetworkClock *)a3
{
  receiverNetworkClock = self->_receiverNetworkClock;
  self->_receiverNetworkClock = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (receiverNetworkClock)
  {
    CFRelease(receiverNetworkClock);
  }
}

- (BOOL)shouldDelegateToInterstitialPlayerForMessageAndID:(id)a3 sessionID:(int)a4
{
  if (self->_isInterstitialPlayer) {
    return 0;
  }
  uint64_t v4 = *(void *)&a4;
  id v6 = [a3 objectForKey:*MEMORY[0x263F01308]];
  int v7 = [v6 BOOLValue];

  if (!v7) {
    return 0;
  }
  if (!self->_interstitialPlayer) {
    [(APRKMediaPlayer *)self _ensureInterstitialPlayerFor:v4];
  }
  return 1;
}

- (void)_ensureInterstitialPlayerFor:(int)a3
{
  if (!self->_interstitialPlayer)
  {
    uint64_t v4 = [[APRKMediaPlayer alloc] initWithP2PWiFiSupport:self->_isP2PWiFiSession isInterstitialPlayer:1 playerSessionID:*(void *)&a3];
    interstitialPlayer = self->_interstitialPlayer;
    self->_interstitialPlayer = v4;

    id v6 = self->_interstitialPlayer;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_messagingDelegate);
    [(APRKMediaPlayer *)v6 setMessagingDelegate:WeakRetained];

    [(APRKMediaPlayer *)self->_interstitialPlayer setSessionReceiverAddress:self->_sessionReceiverAddr];
    id v11 = self->_player;
    long long v8 = [(APRKMediaPlayer *)self->_interstitialPlayer backingAVQueuePlayer];
    if (v11 && v8)
    {
      [(AVQueuePlayer *)v11 _setInterstitialPlayer:v8];
      interstitialEvents = self->_interstitialEvents;
      if (interstitialEvents)
      {
        id v10 = [(AVQueuePlayer *)v11 currentItem];
        [(AVQueuePlayer *)v11 _noteRemoteInterstitialEvents:interstitialEvents forItem:v10];
      }
      if (self->_currentInterstitialEventID) {
        -[AVQueuePlayer _noteCurrentRemoteInterstitialEvent:](v11, "_noteCurrentRemoteInterstitialEvent:");
      }
    }
  }
}

- (void)processMessageWithIDAndDictionaryAsync:(id)a3 messageSessionID:(int)a4
{
  id v6 = a3;
  int v7 = v6;
  if (self->_playerSessionID == a4)
  {
    messageQueue = self->_messageQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__APRKMediaPlayer_processMessageWithIDAndDictionaryAsync_messageSessionID___block_invoke;
    block[3] = &unk_264EA1B38;
    block[4] = self;
    id v10 = v6;
    int v11 = a4;
    dispatch_async(messageQueue, block);
  }
  else if (gLogCategory_AirPlayReceiverKit <= 30 {
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

uint64_t __75__APRKMediaPlayer_processMessageWithIDAndDictionaryAsync_messageSessionID___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) shouldDelegateToInterstitialPlayerForMessageAndID:*(void *)(a1 + 40) sessionID:*(unsigned int *)(a1 + 48)];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = (void *)v3[22];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(unsigned int *)(a1 + 48);
    return [v4 processMessageWithIDAndDictionaryAsync:v5 messageSessionID:v6];
  }
  else
  {
    uint64_t v8 = [v3 _processMessageWithDictionaryInternal:*(void *)(a1 + 40)];
    if (v8) {
      [*(id *)(a1 + 32) _sendUpstreamMessageWithDictionary:v8];
    }
    return MEMORY[0x270F9A758]();
  }
}

- (id)processMessageWithIDAndDictionarySync:(id)a3 messageSessionID:(int)a4
{
  id v6 = a3;
  int v7 = v6;
  uint64_t v8 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  if (self->_playerSessionID == a4)
  {
    messageQueue = self->_messageQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __74__APRKMediaPlayer_processMessageWithIDAndDictionarySync_messageSessionID___block_invoke;
    v12[3] = &unk_264EA1B60;
    v12[4] = self;
    int v15 = a4;
    id v13 = v6;
    v14 = &v16;
    dispatch_sync(messageQueue, v12);

    uint64_t v8 = (void *)v17[5];
  }
  id v10 = v8;
  _Block_object_dispose(&v16, 8);

  return v10;
}

void __74__APRKMediaPlayer_processMessageWithIDAndDictionarySync_messageSessionID___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) shouldDelegateToInterstitialPlayerForMessageAndID:*(void *)(a1 + 40) sessionID:*(unsigned int *)(a1 + 56)];
  id v3 = *(id **)(a1 + 32);
  if (v2) {
    [v3[22] processMessageWithIDAndDictionarySync:*(void *)(a1 + 40) messageSessionID:*(unsigned int *)(a1 + 56)];
  }
  else {
  uint64_t v4 = [v3 _processMessageWithDictionaryInternal:*(void *)(a1 + 40)];
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (gLogCategory_AirPlayReceiverKit <= 10
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    int v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKey:@"type"];
    LogPrintF();
  }
}

- (id)_processMessageWithDictionaryInternal:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
LABEL_20:
    uint64_t v8 = 0;
    id v6 = 0;
    goto LABEL_36;
  }
  id v6 = [v4 objectForKey:@"type"];
  if (gLogCategory_AirPlayReceiverKit <= 10
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!v6)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_20;
  }
  if (![v6 isEqualToString:@"unhandledURL"])
  {
    if ([v6 isEqualToString:@"playbackInfo"])
    {
      uint64_t v7 = [(APRKMediaPlayer *)self _processPlaybackInfoRequestWithDictionary:v5];
    }
    else
    {
      if ([v6 isEqualToString:@"setProperty"])
      {
        [(APRKMediaPlayer *)self _setPropertyWithDictionary:v5];
        goto LABEL_35;
      }
      if ([v6 isEqualToString:@"property"])
      {
        uint64_t v7 = [(APRKMediaPlayer *)self _getPropertyWithDictionary:v5];
      }
      else
      {
        if ([v6 isEqualToString:@"insertPlayQueueItem"])
        {
          [(APRKMediaPlayer *)self _insertPlayQueueItemWithDictionary:v5];
          goto LABEL_35;
        }
        if ([v6 isEqualToString:@"removePlayQueueItem"])
        {
          [(APRKMediaPlayer *)self _removePlayQueueItemWithDictionary:v5];
          goto LABEL_35;
        }
        if ([v6 isEqualToString:@"setRate"])
        {
          [(APRKMediaPlayer *)self _setRateWithDictionary:v5];
          goto LABEL_35;
        }
        if ([v6 isEqualToString:@"seek"])
        {
          [(APRKMediaPlayer *)self _seekWithDictionary:v5];
          goto LABEL_35;
        }
        if ([v6 isEqualToString:@"streamingKey"])
        {
          [(APRKMediaPlayer *)self _processStreamingKeyWithDictionary:v5];
          goto LABEL_35;
        }
        if ([v6 isEqualToString:@"stop"])
        {
          [(APRKMediaPlayer *)self _stopWithDictionary:v5];
          goto LABEL_35;
        }
        if (![v6 isEqualToString:@"authorizeItem"]) {
          goto LABEL_35;
        }
        uint64_t v7 = [(APRKMediaPlayer *)self _processAuthorizeItemWithDictionary:v5];
      }
    }
    uint64_t v8 = (void *)v7;
    goto LABEL_36;
  }
  [(APRKMediaPlayer *)self _processUnhandledURLWithDictionary:v5];
LABEL_35:
  uint64_t v8 = 0;
LABEL_36:

  return v8;
}

- (id)_serializeTimeRanges:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x263EFF980] array];
    id v18 = v3;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v24;
      uint64_t v8 = *MEMORY[0x263F01498];
      uint64_t v9 = *MEMORY[0x263F01490];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(obj);
          }
          int v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          memset(v22, 0, sizeof(v22));
          long long v21 = 0u;
          if (v11) {
            [v11 CMTimeRangeValue];
          }
          id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          *(_OWORD *)&time.value = v21;
          time.epoch = *(void *)&v22[0];
          CFDictionaryRef v13 = CMTimeCopyAsDictionary(&time, 0);
          if (v13)
          {
            CFDictionaryRef v14 = v13;
            [v12 setObject:v13 forKey:v8];
          }
          CMTime time = *(CMTime *)((char *)v22 + 8);
          CFDictionaryRef v15 = CMTimeCopyAsDictionary(&time, 0);
          if (v15)
          {
            CFDictionaryRef v16 = v15;
            [v12 setObject:v15 forKey:v9];
          }
          objc_msgSend(v4, "addObject:", v12, v18);
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v6);
    }

    id v3 = v18;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_currentPlaybackInfoDictionary
{
  v43[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(AVQueuePlayer *)self->_player currentItem];
  uint64_t v5 = v4;
  if (!v4)
  {
    if (self->_isInterstitialPlayer) {
      goto LABEL_32;
    }
    v32 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F08410];
    uint64_t v40 = *MEMORY[0x263F08320];
    v41 = @"Sender requested playbackInfo while AVPlayer on Receiver side did not have a current playerItem.";
    v34 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    uint64_t v7 = [v32 errorWithDomain:v33 code:-6707 userInfo:v34];

    id v10 = +[APRKUtilities dictionaryForError:v7];
    [v3 setObject:v10 forKey:@"error"];
    goto LABEL_30;
  }
  v42 = @"uuid";
  uint64_t v6 = [v4 UUIDString];
  v43[0] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v43 forKeys:&v42 count:1];

  [v3 setObject:v7 forKey:@"item"];
  uint64_t v8 = [v5 status];
  uint64_t v9 = [NSNumber numberWithBool:v8 == 1];
  [v3 setObject:v9 forKey:*MEMORY[0x263F013F8]];

  if (v8 == 1)
  {
    id v10 = [v5 currentDate];
    if (v10)
    {
      [v3 setObject:v10 forKey:*MEMORY[0x263F013A8]];
      int v11 = NSNumber;
      [v10 timeIntervalSinceReferenceDate];
      id v12 = objc_msgSend(v11, "numberWithDouble:");
      [v3 setObject:v12 forKey:*MEMORY[0x263F013A0]];
    }
    [v5 duration];
    CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDictionaryRef v14 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x263EFFB08]);
    [v3 setObject:v14 forKey:*MEMORY[0x263F013B0]];

    if (!self->_isInTrickPlay)
    {
      [v5 currentTime];
      CFDictionaryRef v15 = CMTimeCopyAsDictionary(&v38, v13);
      [v3 setObject:v15 forKey:*MEMORY[0x263F013E8]];
    }
    uint64_t v16 = [(AVQueuePlayer *)self->_player timeControlStatus];
    double v17 = 0.0;
    if (v16 == 2) {
      [(AVQueuePlayer *)self->_player rate];
    }
    if (!self->_isInTrickPlay)
    {
      id v18 = [NSNumber numberWithFloat:v17];
      [v3 setObject:v18 forKey:*MEMORY[0x263F013F0]];
    }
    -[APRKMediaPlayer _pausePlayerIfNeededForState:](self, "_pausePlayerIfNeededForState:", self->_internalPlaybackState, v17);
    v19 = [(APRKMediaPlayer *)self _figPlaybackStateStringFrom:self->_internalPlaybackState];
    if (v19) {
      [v3 setObject:v19 forKey:@"playbackState"];
    }
    if (self->_isWaitingToSetRateFromSenderAfterSeek) {
      [v3 setObject:MEMORY[0x263EFFA88] forKey:@"isWaitingToSetRateFromSenderAfterSeek"];
    }
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isPlaybackLikelyToKeepUp"));
    [v3 setObject:v20 forKey:*MEMORY[0x263F013E0]];

    long long v21 = [v5 currentEstimatedDate];
    if (v21) {
      [v3 setObject:v21 forKey:*MEMORY[0x263F013B8]];
    }
    v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isPlaybackBufferFull"));
    [v3 setObject:v22 forKey:*MEMORY[0x263F013D8]];

    long long v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isPlaybackBufferEmpty"));
    [v3 setObject:v23 forKey:*MEMORY[0x263F013D0]];

    long long v24 = [v5 seekableTimeRanges];
    long long v25 = [(APRKMediaPlayer *)self _serializeTimeRanges:v24];

    if (v25) {
      [v3 setObject:v25 forKey:*MEMORY[0x263F01400]];
    }
    long long v26 = [v5 loadedTimeRanges];
    v27 = [(APRKMediaPlayer *)self _serializeTimeRanges:v26];

    if (v27) {
      [v3 setObject:v27 forKey:*MEMORY[0x263F013C8]];
    }
    uint64_t v28 = [NSNumber numberWithInteger:self->_stallCount];
    [v3 setObject:v28 forKey:*MEMORY[0x263F01408]];

    interstitialPlayer = self->_interstitialPlayer;
    if (interstitialPlayer)
    {
      v30 = [(APRKMediaPlayer *)interstitialPlayer _currentPlaybackInfoDictionary];
      [v3 setObject:v30 forKey:*MEMORY[0x263F013C0]];
    }
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      v31 = [v5 UUIDString];
      [v5 duration];
      CMTimeGetSeconds(&v37);
      [v5 currentTime];
      CMTimeGetSeconds(&v36);
      LogPrintF();
    }
LABEL_30:
  }
LABEL_32:

  return v3;
}

- (id)_playerItemForUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(AVQueuePlayer *)self->_player items];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(id *)(*((void *)&v14 + 1) + 8 * v9);
      int v11 = [v10 UUIDString];
      char v12 = [v4 isEqualToString:v11];

      if (v12) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v10 = 0;
  }

  return v10;
}

- (id)_frontPlayerItem
{
  int v2 = [(AVQueuePlayer *)self->_player items];
  id v3 = [v2 firstObject];

  return v3;
}

- (void)processTLSInfoDictionary:(id)a3
{
  self->_cachedSSLProperties = [(APRKMediaPlayer *)self _SSLPropertiesforTLSInfo:a3];
  MEMORY[0x270F9A758]();
}

- (id)_SSLPropertiesforTLSInfo:(id)a3
{
  v12[3] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v3 = a3;
    id v4 = [v3 objectForKey:@"tlsPSKClientIdentity"];
    uint64_t v5 = [v3 objectForKey:@"tlsPSK"];

    uint64_t v6 = 0;
    if (v4 && v5)
    {
      __int16 v10 = 174;
      uint64_t v7 = [MEMORY[0x263EFF8F8] dataWithBytes:&v10 length:2];
      uint64_t v8 = *MEMORY[0x263EFC858];
      v11[0] = *MEMORY[0x263EFC850];
      v11[1] = v8;
      v12[0] = v4;
      v12[1] = v5;
      v11[2] = *MEMORY[0x263EFC838];
      v12[2] = v7;
      uint64_t v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (BOOL)_ensureFairPlayHelper
{
  if (self->_fpHelper
    || (id v3 = (OpaqueAPReceiverFairPlayHelper *)APReceiverFairPlayHelperCreate(), (self->_fpHelper = v3) != 0))
  {
    LOBYTE(v4) = 1;
    return v4;
  }
  if (gLogCategory_AirPlayReceiverKit > 90) {
    goto LABEL_8;
  }
  if (gLogCategory_AirPlayReceiverKit != -1 || (int v4 = _LogCategory_Initialize()) != 0)
  {
    LogPrintF();
LABEL_8:
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)_updateAudioSessionMode:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = v5;
  p_audioSessionMode = &self->_audioSessionMode;
  audioSessionMode = self->_audioSessionMode;
  if (audioSessionMode)
  {
    if (!v5) {
      goto LABEL_10;
    }
  }
  else
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_audioSessionMode, (id)*MEMORY[0x263F01250]);
    if (!v6) {
      goto LABEL_10;
    }
  }
  if (([v6 isEqualToString:*p_audioSessionMode] & 1) == 0)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      char v12 = *p_audioSessionMode;
      long long v14 = v6;
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_audioSessionMode, a3);
    goto LABEL_21;
  }
LABEL_10:
  if (audioSessionMode)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_26;
  }
LABEL_21:
  uint64_t v9 = *p_audioSessionMode;
  long long v15 = @"audioMode";
  v16[0] = v9;
  __int16 v10 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, &v15, 1, v12, v14);
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    CFAllocatorRef v13 = v10;
    LogPrintF();
  }
  int v11 = [(APRKMediaPlayer *)self messagingDelegate];
  [v11 mediaPlayer:self wantsToPostNotification:@"updateAudioMode" withPayload:v10];

LABEL_26:
}

- (void)_insertPlayQueueItemWithDictionary:(id)a3
{
  v64[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v56 = *MEMORY[0x263F010E0];
  *(_OWORD *)&v62.value = *MEMORY[0x263F010E0];
  CMTimeEpoch v6 = *(void *)(MEMORY[0x263F010E0] + 16);
  v62.epoch = v6;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    id v49 = v4;
    LogPrintF();
  }
  uint64_t v7 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v8 = objc_msgSend(v4, "objectForKey:", @"item", v49);
  uint64_t v9 = [v7 dictionaryWithDictionary:v8];

  if (v9)
  {
    uint64_t v10 = *MEMORY[0x263F01348];
    int v11 = [v9 objectForKey:*MEMORY[0x263F01348]];

    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x263EFA8A8]);
      CFAllocatorRef v13 = [v9 objectForKey:v10];
      long long v14 = (void *)[v12 initWithSpecifiedName:v13];

      if (v14) {
        [(AVQueuePlayer *)self->_player setLoggingIdentifier:v14];
      }
    }
    long long v15 = [v9 objectForKey:@"IsTLSEnabled"];
    int v16 = [v15 BOOLValue];

    if (v16)
    {
      long long v17 = [(APRKMediaPlayer *)self messagingDelegate];
      [v17 mediaPlayerNeedsTLSInfo:self];

      if (gLogCategory_AirPlayReceiverKit <= 10
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        cachedSSLProperties = self->_cachedSSLProperties;
        LogPrintF();
      }
      uint64_t v19 = self->_cachedSSLProperties;
      if (v19) {
        [v5 setObject:v19 forKey:*MEMORY[0x263EFA2B0]];
      }
      if (self->_isP2PWiFiSession)
      {
        uint64_t v20 = [NSNumber numberWithBool:1];
        [v5 setObject:v20 forKey:*MEMORY[0x263EFA2C0]];
      }
      uint64_t v21 = *MEMORY[0x263F012F8];
      v22 = objc_msgSend(v9, "objectForKey:", *MEMORY[0x263F012F8], cachedSSLProperties);
      uint64_t v61 = 0;
      long long v23 = [(APRKMediaPlayer *)self _fixedIPContentLocationFromURLString:v22 error:&v61];
      if (v23) {
        [v9 setObject:v23 forKey:v21];
      }
    }
    else
    {
      id v18 = self->_cachedSSLProperties;
      self->_cachedSSLProperties = 0;
    }
    long long v24 = [v9 objectForKey:@"Play-Info"];
    if (v24)
    {
      uint64_t v25 = APReceiverFairPlayHelperProcessFPInfo();
      if (v25)
      {
        long long v26 = (void *)v25;
        v27 = v24;
        if (gLogCategory_AirPlayReceiverKit <= 30
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          cachedSSLProperties = v26;
          LogPrintF();
        }
        uint64_t v28 = (void *)MEMORY[0x263F087E8];
        uint64_t v29 = *MEMORY[0x263F08410];
        uint64_t v63 = *MEMORY[0x263F08320];
        v64[0] = @"Failed to process FP Info";
        v30 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v64, &v63, 1, cachedSSLProperties);
        v31 = [v28 errorWithDomain:v29 code:(int)v26 userInfo:v30];
        [(APRKMediaPlayer *)self _sendUpstreamErrorMessageWithError:v31];

        long long v24 = v27;
      }
      v32 = [v9 objectForKey:@"fpSessionID"];
      id v33 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [v33 setObject:v32 forKey:*MEMORY[0x263EF97D8]];
      if ([v24 length])
      {
        [v33 setObject:v24 forKey:*MEMORY[0x263EF97D0]];
      }
      else if (gLogCategory_AirPlayReceiverKit <= 30 {
             && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF();
      }
      [v5 setObject:v33 forKey:*MEMORY[0x263EFA1C8]];
    }
    v34 = (void *)MEMORY[0x263EFF9A0];
    v35 = [v9 objectForKey:*MEMORY[0x263F012D0]];
    CMTime v36 = [v34 dictionaryWithDictionary:v35];

    if (v36)
    {
      [v5 setObject:v36 forKey:*MEMORY[0x263EFA1F8]];
    }
    else if (gLogCategory_AirPlayReceiverKit <= 30 {
           && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
    CMTime v37 = [[APRKPlayerItem alloc] initWithDictionary:v9 resourceLoaderHelper:self->_resourceLoaderHelper contentKeyHelper:self->_contentKeyHelper options:v5];
    if (!v37)
    {
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_78;
    }
    v53 = v36;
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      cachedSSLProperties = [(APRKPlayerItem *)v37 UUIDString];
      LogPrintF();
    }
    id v55 = v5;
    *(_OWORD *)&v62.value = v56;
    v62.epoch = v6;
    uint64_t v38 = objc_msgSend(v9, "objectForKey:", @"Start-Date", cachedSSLProperties);
    if (v38) {
      [(APRKPlayerItem *)v37 setStartDate:v38];
    }
    CFDictionaryRef v39 = [v9 objectForKey:@"Start-Position"];
    CFDictionaryRef v40 = v39;
    if (v39)
    {
      CMTimeMakeFromDictionary(&v62, v39);
      CMTime v60 = v62;
      [(APRKPlayerItem *)v37 setStartPosition:&v60];
    }
    v52 = (void *)v38;
    id v57 = v4;
    v41 = [v4 objectForKey:@"itemAfter"];
    v42 = v41;
    if (v41)
    {
      v43 = [v41 objectForKey:@"uuid"];
      v51 = [(APRKMediaPlayer *)self _playerItemForUUID:v43];
      if (v43)
      {
LABEL_64:
        CFDictionaryRef v44 = [v9 objectForKey:@"timeToPauseBuffering"];
        memset(&v60, 0, sizeof(v60));
        CMTimeMakeFromDictionary(&v60, v44);
        if ((v60.flags & 0x1D) == 1)
        {
          CMTime v59 = v60;
          [(APRKPlayerItem *)v37 setTimeToPauseBuffering:&v59];
        }
        CFDictionaryRef v45 = [v9 objectForKey:@"timeToPausePlayback"];
        memset(&v59, 0, sizeof(v59));
        CMTimeMakeFromDictionary(&v59, v45);
        if ((v59.flags & 0x1D) == 1)
        {
          CMTime v58 = v59;
          [(APRKPlayerItem *)v37 setTimeToPausePlayback:&v58];
        }
        v54 = v24;
        v46 = [v9 objectForKey:@"snapTimeToPausePlayback"];
        v47 = v46;
        if (v46) {
          -[APRKPlayerItem setSnapTimeToPausePlayback:](v37, "setSnapTimeToPausePlayback:", [v46 BOOLValue]);
        }
        [(APRKPlayerItem *)v37 setAutomaticallyHandlesInterstitialEvents:0];
        v48 = [v9 objectForKey:*MEMORY[0x263F01410]];
        if (v48
          && gLogCategory_AirPlayReceiverKit <= 30
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (self->_isInterestedInDateRange) {
          [(APRKMediaPlayer *)self addDateRangeCollectorToItem:v37];
        }
        [(APRKMediaPlayer *)self _registerNotificationHandlersAndInsertPlayerItem:v37 afterItem:v51];

        id v5 = v55;
        id v4 = v57;
        CMTime v36 = v53;
        long long v24 = v54;
LABEL_78:

        goto LABEL_79;
      }
    }
    else
    {
      v51 = 0;
    }
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v43 = 0;
    goto LABEL_64;
  }
LABEL_79:
}

- (void)_removePlayQueueItemWithDictionary:(id)a3
{
  id v4 = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    id v13 = v4;
    LogPrintF();
  }
  id v5 = objc_msgSend(v4, "objectForKey:", @"item", v13);
  if (v5)
  {
    CMTimeEpoch v6 = [v4 objectForKey:@"item"];
    uint64_t v7 = [v6 objectForKey:@"uuid"];
    uint64_t v8 = [(APRKMediaPlayer *)self _playerItemForUUID:v7];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        long long v14 = [v9 UUIDString];
        LogPrintF();
      }
      int v11 = [(AVQueuePlayer *)self->_player items];
      uint64_t v12 = [v11 count];

      if (v12 == 1)
      {
        [(APRKResourceLoaderHelper *)self->_resourceLoaderHelper forgetAllActiveResourceLoadingRequests];
        [(APRKContentKeyHelper *)self->_contentKeyHelper forgetAllActiveContentKeyRequests];
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __54__APRKMediaPlayer__removePlayQueueItemWithDictionary___block_invoke;
      block[3] = &unk_264EA1B88;
      id v10 = v9;
      id v16 = v10;
      long long v17 = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v10 = 0;
    }
  }
  else
  {
    CMTimeEpoch v6 = 0;
    id v10 = 0;
    uint64_t v7 = 0;
  }
}

void __54__APRKMediaPlayer__removePlayQueueItemWithDictionary___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) asset];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v2 = *(void **)(*(void *)(a1 + 40) + 88);
    id v3 = v4;
    [v2 unregisterAVURLAsset:v3];
    [*(id *)(*(void *)(a1 + 40) + 96) unregisterAVURLAsset:v3];
  }
  [*(id *)(a1 + 40) _unregisterNotificationHandlersAndRemovePlayerItem:*(void *)(a1 + 32)];
}

- (void)_setRateWithDictionary:(id)a3
{
  id v4 = a3;
  CMTime v26 = *(CMTime *)*(void *)&MEMORY[0x263F01090];
  CMTime v25 = v26;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    id v14 = v4;
    LogPrintF();
  }
  id v5 = objc_msgSend(v4, "objectForKey:", @"rate", v14);
  [v5 floatValue];
  int v7 = v6;

  int CMTimeIfPresent = FigCFDictionaryGetCMTimeIfPresent();
  cachedSetRateAndAnchor = self->_cachedSetRateAndAnchor;
  self->_cachedSetRateAndAnchor = 0;

  if (CFDictionaryGetValue((CFDictionaryRef)v4, @"networkClockTime"))
  {
    uint64_t hostTime = 0;
    long long v22 = *MEMORY[0x263F24A78];
    uint64_t v23 = *(void *)(MEMORY[0x263F24A78] + 16);
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    APSNetworkTimeMakeFromDictionary();
    receiverNetworkClock = self->_receiverNetworkClock;
    if (receiverNetworkClock)
    {
      long long v20 = v22;
      uint64_t v21 = v23;
      uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v11) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      id v13 = *(unsigned int (**)(OpaqueAPSNetworkClock *, long long *, uint64_t *))(v12 + 24);
      if (v13)
      {
        long long v27 = v20;
        uint64_t v28 = v21;
        if (!v13(receiverNetworkClock, &v27, &hostTime))
        {
          CMClockMakeHostTimeFromSystemUnits(&v26, hostTime);
          goto LABEL_26;
        }
      }
      if (gLogCategory_AirPlayReceiverKit <= 90
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_21;
      }
    }
    else if (gLogCategory_AirPlayReceiverKit <= 90 {
           && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    }
    {
LABEL_21:
      LogPrintF();
    }
  }
LABEL_26:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__APRKMediaPlayer__setRateWithDictionary___block_invoke;
  block[3] = &unk_264EA1BB0;
  void block[4] = self;
  int v16 = v7;
  BOOL v19 = CMTimeIfPresent != 0;
  CMTime v17 = v25;
  CMTime v18 = v26;
  dispatch_sync(MEMORY[0x263EF83A0], block);
}

void __42__APRKMediaPlayer__setRateWithDictionary___block_invoke(uint64_t a1, double a2)
{
  v21[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 137))
  {
    *(unsigned char *)(v3 + 137) = 1;
    uint64_t v3 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v3 + 140) = 0;
  if (*(float *)(a1 + 40) != 0.0) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setDefaultRate:");
  }
  if (*(unsigned char *)(a1 + 92))
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) currentItem];
    id v5 = (void *)v4;
    int v6 = (_OWORD *)(a1 + 44);
    if ((*(unsigned char *)(a1 + 56) & 1) != 0 && v4)
    {
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        *(_OWORD *)&time.value = *v6;
        time.epoch = *(void *)(a1 + 60);
        CMTimeGetSeconds(&time);
        CMTime time = *(CMTime *)(a1 + 68);
        CMTimeGetSeconds(&time);
        LogPrintF();
      }
      id v8 = objc_alloc_init(MEMORY[0x263EFA858]);
      [v8 setPreferCoordinatedPlaybackBehavior:1];
      if ([*(id *)(*(void *)(a1 + 32) + 8) status] == 1)
      {
        id v10 = *(void **)(*(void *)(a1 + 32) + 8);
        LODWORD(v9) = *(_DWORD *)(a1 + 40);
        *(_OWORD *)&time.value = *v6;
        time.epoch = *(void *)(a1 + 60);
        long long v17 = *(_OWORD *)(a1 + 68);
        uint64_t v18 = *(void *)(a1 + 84);
        [v10 setRate:&time time:&v17 atHostTime:v8 options:v9];
      }
      else
      {
        v20[0] = @"rate";
        LODWORD(v9) = *(_DWORD *)(a1 + 40);
        uint64_t v11 = [NSNumber numberWithFloat:v9];
        v21[0] = v11;
        v20[1] = @"time";
        *(_OWORD *)&time.value = *v6;
        time.epoch = *(void *)(a1 + 60);
        uint64_t v12 = [MEMORY[0x263F08D40] valueWithCMTime:&time];
        v21[1] = v12;
        v20[2] = @"hostTime";
        CMTime time = *(CMTime *)(a1 + 68);
        id v13 = [MEMORY[0x263F08D40] valueWithCMTime:&time];
        v20[3] = @"options";
        v21[2] = v13;
        v21[3] = v8;
        uint64_t v14 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];
        uint64_t v15 = *(void *)(a1 + 32);
        int v16 = *(void **)(v15 + 72);
        *(void *)(v15 + 72) = v14;
      }
    }
    else if (gLogCategory_AirPlayReceiverKit <= 90 {
           && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    }
    {
      *(_OWORD *)&time.value = *v6;
      time.epoch = *(void *)(a1 + 60);
      CMTimeGetSeconds(&time);
      CMTime time = *(CMTime *)(a1 + 68);
      CMTimeGetSeconds(&time);
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v7 = *(void **)(*(void *)(a1 + 32) + 8);
    LODWORD(a2) = *(_DWORD *)(a1 + 40);
    [v7 setRate:a2];
  }
}

- (void)_addPendingSeekID:(int)a3 withMessage:(id)a4 forItem:(id)a5 ignoreSeekCompletion:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a3;
  id v21 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 UUIDString];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v8);
    pendingSenderSeekMessages = self->_pendingSenderSeekMessages;
    uint64_t v15 = [v10 UUIDString];
    int v16 = [(NSMutableDictionary *)pendingSenderSeekMessages objectForKeyedSubscript:v15];

    if (!v16)
    {
      int v16 = [MEMORY[0x263EFF9A0] dictionary];
    }
    long long v17 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v18 = [NSNumber numberWithBool:v6];
    [v17 setObject:v18 forKeyedSubscript:@"ignoreSeekCompletion"];

    if (v21) {
      [v17 setObject:v21 forKeyedSubscript:@"message"];
    }
    [v16 setObject:v17 forKeyedSubscript:v13];
    BOOL v19 = self->_pendingSenderSeekMessages;
    long long v20 = [v10 UUIDString];
    [(NSMutableDictionary *)v19 setObject:v16 forKeyedSubscript:v20];

    goto LABEL_7;
  }
  if (gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    id v13 = [v10 UUIDString];
    LogPrintF();
LABEL_7:
  }
}

- (void)_removePendingSeekID:(int)a3 forItem:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v14 = a4;
  BOOL v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v4);
  pendingSenderSeekMessages = self->_pendingSenderSeekMessages;
  uint64_t v8 = [v14 UUIDString];
  double v9 = [(NSMutableDictionary *)pendingSenderSeekMessages objectForKeyedSubscript:v8];

  [v9 removeObjectForKey:v6];
  id v10 = [v9 allKeys];
  uint64_t v11 = [v10 count];

  if (!v11)
  {
    uint64_t v12 = self->_pendingSenderSeekMessages;
    id v13 = [v14 UUIDString];
    [(NSMutableDictionary *)v12 removeObjectForKey:v13];
  }
}

- (BOOL)_shouldIgnoreSeekCompletionForSeekID:(int)a3 forItem:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  BOOL v6 = NSString;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v6, "stringWithFormat:", @"%d", v4);
  pendingSenderSeekMessages = self->_pendingSenderSeekMessages;
  id v10 = [v7 UUIDString];

  uint64_t v11 = [(NSMutableDictionary *)pendingSenderSeekMessages objectForKeyedSubscript:v10];
  uint64_t v12 = [v11 objectForKeyedSubscript:v8];
  id v13 = [v12 objectForKeyedSubscript:@"ignoreSeekCompletion"];
  char v14 = [v13 BOOLValue];

  return v14;
}

- (id)_seekRequestMessageForSeekID:(int)a3 forItem:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  BOOL v6 = NSString;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v6, "stringWithFormat:", @"%d", v4);
  pendingSenderSeekMessages = self->_pendingSenderSeekMessages;
  id v10 = [v7 UUIDString];

  uint64_t v11 = [(NSMutableDictionary *)pendingSenderSeekMessages objectForKeyedSubscript:v10];
  uint64_t v12 = [v11 objectForKeyedSubscript:v8];
  id v13 = [v12 objectForKeyedSubscript:@"message"];

  return v13;
}

- (void)_seekWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v44 = 0;
  CFDictionaryRef v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy_;
  v48 = __Block_byref_object_dispose_;
  id v49 = 0;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    id v21 = v4;
    LogPrintF();
  }
  id v5 = objc_msgSend(v4, "objectForKey:", @"item", v21);
  BOOL v6 = +[APRKPlayerItem UUIDFromItemDictionary:v5];
  id v7 = v6;
  if (v6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__APRKMediaPlayer__seekWithDictionary___block_invoke;
    block[3] = &unk_264EA1BD8;
    v43 = &v44;
    void block[4] = self;
    id v42 = v6;
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
  if (v45[5])
  {
    uint64_t v8 = [v4 objectForKey:*MEMORY[0x263F01430]];
    uint64_t v9 = [(APRKMediaPlayer *)self _frontPlayerItem];
    id v10 = (void *)v9;
    if (v8)
    {
      if (self->_disableAutoResumeAfterSeek && v9 == v45[5])
      {
        self->_isWaitingToSetRateFromSenderAfterSeek = 1;
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __39__APRKMediaPlayer__seekWithDictionary___block_invoke_2;
        v38[3] = &unk_264EA1C00;
        v38[4] = self;
        CFDictionaryRef v40 = &v44;
        id v39 = v8;
        dispatch_async(MEMORY[0x263EF83A0], v38);
        uint64_t v11 = v39;
      }
      else
      {
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __39__APRKMediaPlayer__seekWithDictionary___block_invoke_3;
        v35[3] = &unk_264EA1C28;
        CMTime v37 = &v44;
        id v36 = v8;
        dispatch_async(MEMORY[0x263EF83A0], v35);
        uint64_t v11 = v36;
      }
    }
    CFDictionaryRef v12 = [v4 objectForKey:@"time"];

    if (v12)
    {
      memset(&v34, 0, sizeof(v34));
      CMTimeMakeFromDictionary(&v34, v12);
      if ((v34.flags & 0x11) == 1)
      {
        if (gLogCategory_AirPlayReceiverKit <= 90
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          CMTime time = v34;
          Float64 Seconds = CMTimeGetSeconds(&time);
          uint64_t v23 = [(id)v45[5] UUIDString];
          Float64 v22 = Seconds;
          LogPrintF();
        }
        char v14 = (void *)v45[5];
        CMTime time = v34;
        objc_msgSend(v14, "setStartPosition:", &time, *(void *)&v22, v23);
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __39__APRKMediaPlayer__seekWithDictionary___block_invoke_4;
        aBlock[3] = &unk_264EA1C50;
        v31 = &v44;
        aBlock[4] = self;
        id v15 = v4;
        CMTime v32 = v34;
        id v30 = v15;
        int v16 = _Block_copy(aBlock);
        long long v17 = v16;
        if (self->_disableAutoResumeAfterSeek && v10 == (void *)v45[5])
        {
          self->_isWaitingToSetRateFromSenderAfterSeek = 1;
          v27[0] = MEMORY[0x263EF8330];
          v27[1] = 3221225472;
          v27[2] = __39__APRKMediaPlayer__seekWithDictionary___block_invoke_5;
          v27[3] = &unk_264EA1B10;
          v27[4] = self;
          uint64_t v28 = v16;
          id v20 = v16;
          dispatch_async(MEMORY[0x263EF83A0], v27);
          BOOL v19 = v28;
        }
        else
        {
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __39__APRKMediaPlayer__seekWithDictionary___block_invoke_6;
          v25[3] = &unk_264EA1C78;
          CMTime v26 = v16;
          id v18 = v16;
          dispatch_async(MEMORY[0x263EF83A0], v25);
          BOOL v19 = v26;
        }
      }
      else if (gLogCategory_AirPlayReceiverKit <= 90 {
             && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      }
      {
        long long v24 = [(id)v45[5] UUIDString];
        LogPrintF();
      }
    }
  }
  _Block_object_dispose(&v44, 8);
}

uint64_t __39__APRKMediaPlayer__seekWithDictionary___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _playerItemForUUID:*(void *)(a1 + 40)];
  return MEMORY[0x270F9A758]();
}

uint64_t __39__APRKMediaPlayer__seekWithDictionary___block_invoke_2(void *a1)
{
  [*(id *)(a1[4] + 8) rate];
  if (v2 != 0.0)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [*(id *)(a1[4] + 8) setRate:0.0];
  }
  uint64_t v3 = a1[5];
  id v4 = *(void **)(*(void *)(a1[6] + 8) + 40);
  return [v4 seekToDate:v3 completionHandler:0];
}

uint64_t __39__APRKMediaPlayer__seekWithDictionary___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) seekToDate:*(void *)(a1 + 32) completionHandler:0];
}

uint64_t __39__APRKMediaPlayer__seekWithDictionary___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) makeSeekID];
  [*(id *)(a1 + 32) _addPendingSeekID:v2 withMessage:*(void *)(a1 + 40) forItem:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) ignoreSeekCompletion:0];
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  long long v9 = *(_OWORD *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 72);
  long long v7 = *MEMORY[0x263F010E0];
  uint64_t v8 = *(void *)(MEMORY[0x263F010E0] + 16);
  long long v5 = v7;
  uint64_t v6 = v8;
  return [v3 seekToTime:&v9 toleranceBefore:&v7 toleranceAfter:&v5 seekID:v2];
}

uint64_t __39__APRKMediaPlayer__seekWithDictionary___block_invoke_5(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) rate];
  if (v2 != 0.0)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [*(id *)(*(void *)(a1 + 32) + 8) setRate:0.0];
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

uint64_t __39__APRKMediaPlayer__seekWithDictionary___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)metadataCollector:(id)a3 didCollectDateRangeMetadataGroups:(id)a4 indexesOfNewGroups:(id)a5 indexesOfModifiedGroups:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(APRKMediaPlayer *)self _frontPlayerItem];
  uint64_t v11 = [v10 mediaDataCollectors];
  int v12 = [v11 containsObject:v8];

  if (v12)
  {
    id v13 = [MEMORY[0x263EFF980] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          BOOL v19 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v18), "propertyList", (void)v25);
          [(NSArray *)v13 addObject:v19];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v16);
    }

    lastReportedDateRanges = self->_lastReportedDateRanges;
    self->_lastReportedDateRanges = v13;
    id v21 = v13;

    id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v22 setObject:@"notification" forKey:@"type"];
    [v22 setObject:*MEMORY[0x263F01288] forKey:@"name"];
    [v22 setObject:v21 forKey:*MEMORY[0x263F01300]];
    uint64_t v29 = @"uuid";
    uint64_t v23 = [v10 UUIDString];
    id v30 = v23;
    long long v24 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];

    [v22 setObject:v24 forKey:@"item"];
    [(APRKMediaPlayer *)self _sendUpstreamMessageWithDictionary:v22];
  }
}

- (void)addDateRangeCollectorToItem:(id)a3
{
  id v7 = a3;
  id v4 = [v7 mediaDataCollectors];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFA818]) initWithIdentifiers:0 classifyingLabels:0];
    [v6 setDelegate:self queue:MEMORY[0x263EF83A0]];
    [v7 addMediaDataCollector:v6];
  }
}

- (void)_setPropertyWithDictionary:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    if (gLogCategory_AirPlayReceiverKit > 30
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_32;
    }
LABEL_11:
    LogPrintF();
LABEL_32:
    uint64_t v18 = 0;
    BOOL v19 = 0;
    id v7 = 0;
    id v20 = 0;
    goto LABEL_59;
  }
  uint64_t v6 = [v4 objectForKey:@"property"];
  if (!v6)
  {
    if (gLogCategory_AirPlayReceiverKit > 30
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_32;
    }
    goto LABEL_11;
  }
  id v7 = (void *)v6;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v47 = v7;
    LogPrintF();
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x263F01460], v47))
  {
    id v8 = [v5 objectForKey:@"value"];
    char v9 = [v8 BOOLValue];

    objc_initWeak((id *)&location, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__APRKMediaPlayer__setPropertyWithDictionary___block_invoke;
    block[3] = &unk_264EA1CA0;
    objc_copyWeak(&v56, (id *)&location);
    char v57 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v56);
    objc_destroyWeak((id *)&location);
    goto LABEL_35;
  }
  if ([v7 isEqualToString:*MEMORY[0x263F01458]])
  {
    uint64_t v10 = [v5 objectForKey:@"value"];
    self->_isInterestedInDateRange = [v10 BOOLValue];

    if (!self->_isInterestedInDateRange) {
      goto LABEL_35;
    }
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v11 = [(AVQueuePlayer *)self->_player items];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v51 objects:v58 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v52 != v14) {
            objc_enumerationMutation(v11);
          }
          [(APRKMediaPlayer *)self addDateRangeCollectorToItem:*(void *)(*((void *)&v51 + 1) + 8 * i)];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v51 objects:v58 count:16];
      }
      while (v13);
    }
  }
  else
  {
    if (![v7 isEqualToString:@"metadata"]) {
      goto LABEL_35;
    }
    uint64_t v11 = [v5 objectForKey:@"value"];
    if (v11)
    {
      uint64_t v16 = [(APRKMediaPlayer *)self currentItemMetadata];

      if (v16)
      {
        [(APRKMediaPlayer *)self willChangeValueForKey:@"currentItemMetadata"];
        uint64_t v17 = [(APRKMediaPlayer *)self currentItemMetadata];
        [v17 updateMedatataWithDictionary:v11];

        [(APRKMediaPlayer *)self didChangeValueForKey:@"currentItemMetadata"];
      }
      else
      {
        id v21 = [[APRKMetadata alloc] initWithDictionary:v11];
        [(APRKMediaPlayer *)self setCurrentItemMetadata:v21];
      }
    }
  }

LABEL_35:
  BOOL v19 = [(APRKMediaPlayer *)self _frontPlayerItem];
  id v20 = [v5 objectForKey:@"item"];
  if (v20)
  {
    uint64_t v18 = +[APRKPlayerItem UUIDFromItemDictionary:v20];
    uint64_t v22 = [(APRKMediaPlayer *)self _playerItemForUUID:v18];

    BOOL v19 = (void *)v22;
  }
  else
  {
    uint64_t v18 = 0;
  }
  if ([v7 isEqualToString:*MEMORY[0x263F01418]])
  {
    uint64_t v23 = [v5 objectForKey:@"value"];
    uint64_t v24 = [v23 integerValue];

    [(AVQueuePlayer *)self->_player setActionAtItemEnd:v24];
    goto LABEL_59;
  }
  if (![v7 isEqualToString:*MEMORY[0x263F01440]])
  {
    if ([v7 isEqualToString:*MEMORY[0x263F01448]])
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_59;
      }
      CFDictionaryRef v31 = [v5 objectForKey:@"value"];
      memset(&location, 0, sizeof(location));
      CMTimeMakeFromDictionary(&location, v31);
      CMTime time = location;
      [v19 setForwardPlaybackEndTime:&time];
    }
    else if ([v7 isEqualToString:*MEMORY[0x263F01478]])
    {
      CFDictionaryRef v31 = [v5 objectForKey:@"value"];
      memset(&location, 0, sizeof(location));
      CMTimeMakeFromDictionary(&location, v31);
      if (location.flags)
      {
        CMTime time = location;
        [v19 setReversePlaybackEndTime:&time];
      }
    }
    else
    {
      if ([v7 isEqualToString:*MEMORY[0x263F01480]])
      {
        uint64_t v32 = [v5 objectForKey:@"value"];
        cachedSelectedMediaArray = self->_cachedSelectedMediaArray;
        self->_cachedSelectedMediaArray = v32;

        if (gLogCategory_AirPlayReceiverKit <= 30
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          Float64 Seconds = *(double *)&self->_cachedSelectedMediaArray;
          LogPrintF();
        }
        if (-[APRKMediaPlayer _attemptToSetSelectedMediaArray:](self, "_attemptToSetSelectedMediaArray:", self->_cachedSelectedMediaArray, *(void *)&Seconds))
        {
          id v39 = self->_cachedSelectedMediaArray;
          self->_cachedSelectedMediaArray = 0;
        }
        goto LABEL_59;
      }
      if ([v7 isEqualToString:*MEMORY[0x263F01488]])
      {
        CFDictionaryRef v31 = [v5 objectForKey:@"value"];
        [v19 setTextStyleRulesUsingArray:v31];
      }
      else
      {
        if ([v7 isEqualToString:*MEMORY[0x263F01428]])
        {
          CMTime v34 = [v5 objectForKey:@"value"];
          currentInterstitialEventID = self->_currentInterstitialEventID;
          self->_currentInterstitialEventID = v34;

          if (self->_currentInterstitialEventID) {
            -[AVQueuePlayer _noteCurrentRemoteInterstitialEvent:](self->_player, "_noteCurrentRemoteInterstitialEvent:");
          }
          goto LABEL_59;
        }
        if ([v7 isEqualToString:*MEMORY[0x263F01450]])
        {
          id v36 = [v5 objectForKey:@"value"];
          interstitialEvents = self->_interstitialEvents;
          self->_interstitialEvents = v36;

          uint64_t v38 = self->_interstitialEvents;
          if (v38) {
            [(AVQueuePlayer *)self->_player _noteRemoteInterstitialEvents:v38 forItem:v19];
          }
          goto LABEL_59;
        }
        if ([v7 isEqualToString:*MEMORY[0x263F01380]])
        {
          CFDictionaryRef v31 = [v5 objectForKey:@"value"];
          memset(&location, 0, sizeof(location));
          CMTimeMakeFromDictionary(&location, v31);
          if (gLogCategory_AirPlayReceiverKit <= 30
            && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
          {
            CMTime time = location;
            Float64 Seconds = CMTimeGetSeconds(&time);
            LogPrintF();
          }
          CMTime time = location;
          objc_msgSend(v19, "setTimeToPauseBuffering:", &time, *(void *)&Seconds);
        }
        else
        {
          if (![v7 isEqualToString:*MEMORY[0x263F01388]])
          {
            if ([v7 isEqualToString:*MEMORY[0x263F01368]])
            {
              CFDictionaryRef v40 = [v5 objectForKey:@"value"];
              uint64_t v41 = [v40 BOOLValue];

              [v19 setSnapTimeToPausePlayback:v41];
              goto LABEL_59;
            }
            id v42 = [NSString stringWithUTF8String:"audioMode"];
            int v43 = [v7 isEqualToString:v42];

            if (v43)
            {
              if (gLogCategory_AirPlayReceiverKit <= 30
                && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
              {
                goto LABEL_48;
              }
            }
            else if ([v7 isEqualToString:*MEMORY[0x263F01438]])
            {
              uint64_t v44 = [v5 objectForKey:@"value"];
              self->_disableAutoResumeAfterSeek = [v44 BOOLValue];
            }
            else if ([v7 isEqualToString:*MEMORY[0x263F01340]])
            {
              CFDictionaryRef v45 = [v5 objectForKey:@"value"];
              uint64_t v46 = [v45 integerValue];

              if (gLogCategory_AirPlayReceiverKit <= 30
                && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
              {
                Float64 Seconds = *(double *)&v46;
                LogPrintF();
              }
              objc_msgSend(v19, "setRestrictions:", v46, *(void *)&Seconds);
            }
            goto LABEL_59;
          }
          CFDictionaryRef v31 = [v5 objectForKey:@"value"];
          memset(&location, 0, sizeof(location));
          CMTimeMakeFromDictionary(&location, v31);
          if (gLogCategory_AirPlayReceiverKit <= 30
            && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
          {
            CMTime time = location;
            Float64 Seconds = CMTimeGetSeconds(&time);
            LogPrintF();
          }
          CMTime time = location;
          objc_msgSend(v19, "setTimeToPausePlayback:", &time, *(void *)&Seconds);
        }
      }
    }

    goto LABEL_59;
  }
  long long v25 = [v5 valueForKey:@"trackID"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    long long v27 = [v5 objectForKey:@"trackID"];
    uint64_t v28 = [v27 intValue];

    uint64_t v29 = [v5 objectForKey:@"value"];
    uint64_t v30 = [v29 BOOLValue];

    [v19 setEnabledState:v30 forTrackWithID:v28];
    goto LABEL_59;
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
LABEL_48:
    LogPrintF();
  }
LABEL_59:
}

void __46__APRKMediaPlayer__setPropertyWithDictionary___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained[1] setMuted:*(unsigned __int8 *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (id)_timedMetadataFromAVTimedMetadata:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v21 = [MEMORY[0x263EFF980] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v20 = *(void *)v24;
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v8 = [MEMORY[0x263EFF9A0] dictionary];
        char v9 = [v7 key];
        uint64_t v10 = [v7 keySpace];
        uint64_t v11 = [v7 locale];
        if (v7) {
          [v7 time];
        }
        else {
          memset(&time, 0, sizeof(time));
        }
        CFDictionaryRef v12 = CMTimeCopyAsDictionary(&time, allocator);
        uint64_t v13 = [v7 value];
        uint64_t v14 = [v7 extraAttributes];
        if (v9) {
          [v8 setObject:v9 forKeyedSubscript:@"key"];
        }
        if (v10) {
          [v8 setObject:v10 forKeyedSubscript:@"keyspace"];
        }
        uint64_t v15 = [v11 localeIdentifier];

        if (v15)
        {
          uint64_t v16 = [v11 localeIdentifier];
          [v8 setObject:v16 forKeyedSubscript:@"locale"];
        }
        if (v12)
        {
          [v8 setObject:v12 forKeyedSubscript:@"timestamp"];
          CFRelease(v12);
        }
        if (v13) {
          [v8 setObject:v13 forKeyedSubscript:@"value"];
        }
        if (v14) {
          [v8 addEntriesFromDictionary:v14];
        }
        [v21 addObject:v8];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }

  return v21;
}

- (id)_getPropertyWithDictionary:(id)a3
{
  v42[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"property"];
  if (!v5)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v13 = 0;
    uint64_t v10 = 0;
    uint64_t v16 = 0;
    uint64_t v11 = 0;
    goto LABEL_29;
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    CFDictionaryRef v31 = v5;
    LogPrintF();
  }
  uint64_t v6 = -[APRKMediaPlayer _playerItemForUUID:](self, "_playerItemForUUID:", self->_currentItemUUID, v31);
  if ([v5 isEqualToString:@"playbackErrorLog"])
  {
    uint64_t v7 = [v6 playbackErrorLog];
LABEL_13:
    id v8 = (void *)v7;
    char v9 = (void *)MEMORY[0x263EFFA68];
    if (v7) {
      char v9 = (void *)v7;
    }
    uint64_t v10 = v9;

    uint64_t v11 = 0;
    goto LABEL_16;
  }
  if ([v5 isEqualToString:@"playbackAccessLog"])
  {
    uint64_t v7 = [v6 playbackAccessLog];
    goto LABEL_13;
  }
  uint64_t v11 = [v4 objectForKey:@"item"];
  if (v11)
  {
    uint64_t v18 = +[APRKPlayerItem UUIDFromItemDictionary:v11];
    uint64_t v19 = [(APRKMediaPlayer *)self _playerItemForUUID:v18];

    uint64_t v6 = (void *)v19;
  }
  if (!v6)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      uint64_t v32 = v5;
      LogPrintF();
    }
    uint64_t v16 = +[APRKUtilities baseDictionaryForResponseToRequestWithDictionary:](APRKUtilities, "baseDictionaryForResponseToRequestWithDictionary:", v4, v32);
    uint64_t v13 = 0;
    uint64_t v10 = 0;
LABEL_29:
    uint64_t v6 = 0;
    goto LABEL_55;
  }
  if ([v5 isEqualToString:*MEMORY[0x263F01440]])
  {
    uint64_t v20 = [v4 valueForKey:@"trackID"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v10 = (uint64_t)&unk_26F13DBA8;
      goto LABEL_16;
    }
    uint64_t v22 = [v4 objectForKey:@"trackID"];
    uint64_t v23 = [v22 intValue];

    uint64_t v33 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "enabledStateForTrackWithID:", v23));
    goto LABEL_48;
  }
  if ([v5 isEqualToString:*MEMORY[0x263F01470]])
  {
    uint64_t v24 = [v6 playbackErrorLog];
LABEL_37:
    uint64_t v10 = v24;
    uint64_t v13 = 0;
    goto LABEL_49;
  }
  if ([v5 isEqualToString:*MEMORY[0x263F01468]])
  {
    uint64_t v24 = [v6 playbackAccessLog];
    goto LABEL_37;
  }
  if ([v5 isEqualToString:*MEMORY[0x263F013C8]])
  {
    long long v25 = [v6 loadedTimeRanges];
    uint64_t v33 = [(APRKMediaPlayer *)self _serializeTimeRanges:v25];
LABEL_47:

LABEL_48:
    uint64_t v13 = 0;
    uint64_t v10 = v33;
    goto LABEL_49;
  }
  if ([v5 isEqualToString:*MEMORY[0x263F01400]])
  {
    long long v25 = [v6 seekableTimeRanges];
    uint64_t v33 = [(APRKMediaPlayer *)self _serializeTimeRanges:v25];
    goto LABEL_47;
  }
  if ([v5 isEqualToString:*MEMORY[0x263F01480]])
  {
    cachedSelectedMediaArray = self->_cachedSelectedMediaArray;
    if (!cachedSelectedMediaArray)
    {
      uint64_t v10 = [(APRKMediaPlayer *)self selectedMediaArrayForItem:v6];
      if (!v10)
      {
        uint64_t v29 = (void *)MEMORY[0x263F087E8];
        uint64_t v41 = *MEMORY[0x263F08320];
        v42[0] = @"Sender requested selectedMediaArray while mediaSelection is still loading at the receiver.";
        uint64_t v30 = [NSDictionary dictionaryWithObjects:v42 forKeys:&v41 count:1];
        uint64_t v13 = [v29 errorWithDomain:*MEMORY[0x263F08410] code:-6707 userInfo:v30];

        goto LABEL_69;
      }
LABEL_16:
      BOOL v12 = 0;
      uint64_t v13 = 0;
      BOOL v14 = v10 != 0;
      goto LABEL_17;
    }
LABEL_65:
    uint64_t v10 = cachedSelectedMediaArray;
    goto LABEL_16;
  }
  if ([v5 isEqualToString:*MEMORY[0x263F01300]])
  {
    cachedSelectedMediaArray = self->_lastReportedDateRanges;
    if (!cachedSelectedMediaArray) {
      cachedSelectedMediaArray = (NSArray *)MEMORY[0x263EFFA68];
    }
    goto LABEL_65;
  }
  if ([v5 isEqualToString:@"timedMetadataArray"])
  {
    uint64_t v35 = 0;
    id v36 = &v35;
    uint64_t v37 = 0x3032000000;
    uint64_t v38 = __Block_byref_object_copy_;
    id v39 = __Block_byref_object_dispose_;
    id v40 = 0;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__APRKMediaPlayer__getPropertyWithDictionary___block_invoke;
    block[3] = &unk_264EA1C28;
    void block[4] = self;
    void block[5] = &v35;
    dispatch_sync(MEMORY[0x263EF83A0], block);
    uint64_t v33 = [(APRKMediaPlayer *)self _timedMetadataFromAVTimedMetadata:v36[5]];
    _Block_object_dispose(&v35, 8);

    goto LABEL_48;
  }
  uint64_t v13 = 0;
LABEL_69:
  uint64_t v10 = 0;
LABEL_49:
  BOOL v14 = v10 != 0;
  BOOL v12 = v13 != 0;
  if (v10 | v13)
  {
LABEL_17:
    uint64_t v15 = +[APRKUtilities baseDictionaryForResponseToRequestWithDictionary:v4];
    uint64_t v16 = v15;
    if (v14)
    {
      [v15 setObject:v10 forKey:@"value"];
    }
    else if (v12)
    {
      uint64_t v17 = +[APRKUtilities dictionaryForError:v13];
      [v16 setObject:v17 forKey:@"error"];
    }
    goto LABEL_51;
  }
  uint64_t v10 = 0;
  uint64_t v13 = 0;
  uint64_t v16 = 0;
LABEL_51:
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_55:
  id v26 = v16;

  return v26;
}

void __46__APRKMediaPlayer__getPropertyWithDictionary___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) currentItem];
  uint64_t v2 = [v5 timedMetadata];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_processStreamingKeyWithDictionary:(id)a3
{
  id v4 = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  contentKeyHelper = self->_contentKeyHelper;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__APRKMediaPlayer__processStreamingKeyWithDictionary___block_invoke;
  v7[3] = &unk_264EA1CC8;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  [(APRKContentKeyHelper *)contentKeyHelper processStreamingKeyRequestWithDictionary:v6 withCompletionBlock:v7];
}

void __54__APRKMediaPlayer__processStreamingKeyWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = +[APRKUtilities baseDictionaryForResponseToRequestWithDictionary:*(void *)(a1 + 32)];
  if (v5)
  {
    uint64_t v7 = +[APRKUtilities dictionaryForError:v5];
    id v8 = @"error";
  }
  else
  {
    if (!v9) {
      goto LABEL_6;
    }
    uint64_t v7 = [v9 base64EncodedStringWithOptions:0];
    id v8 = @"key";
  }
  [v6 setObject:v7 forKey:v8];

LABEL_6:
  [*(id *)(a1 + 40) _sendUpstreamMessageWithDictionary:v6];
}

- (void)_processUnhandledURLWithDictionary:(id)a3
{
  id v4 = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    id v12 = v4;
    LogPrintF();
  }
  id v5 = objc_msgSend(v4, "objectForKey:", @"response", v12);
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectForKey:*MEMORY[0x263F01158]];
    if ([(APRKContentKeyHelper *)self->_contentKeyHelper isHandlingContentKeyRequestWithURLString:v7])
    {
      contentKeyHelper = self->_contentKeyHelper;
      uint64_t v14 = 0;
      id v9 = (id *)&v14;
      uint64_t v10 = &v14;
    }
    else
    {
      contentKeyHelper = self->_resourceLoaderHelper;
      uint64_t v13 = 0;
      id v9 = (id *)&v13;
      uint64_t v10 = &v13;
    }
    [contentKeyHelper processUnhandledURLResponseWithDictionary:v6 error:v10];
    id v11 = *v9;
    if (v11
      && gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    id v11 = 0;
    uint64_t v7 = 0;
  }
}

- (void)_stopWithDictionary:(id)a3
{
  id v4 = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__APRKMediaPlayer__stopWithDictionary___block_invoke;
  block[3] = &unk_264EA1AE8;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __39__APRKMediaPlayer__stopWithDictionary___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setRate:0.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  LODWORD(v3) = 1.0;
  return [v2 setDefaultRate:v3];
}

- (id)_processPlaybackInfoRequestWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(APRKMediaPlayer *)self _currentPlaybackInfoDictionary];
  if (v5)
  {
    id v6 = +[APRKUtilities baseDictionaryForResponseToRequestWithDictionary:v4];
    [v6 setObject:v5 forKey:@"info"];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_processAuthorizeItemWithDictionary:(id)a3
{
  id v4 = (__CFString *)a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    uint64_t v10 = v4;
    LogPrintF();
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if ([(APRKMediaPlayer *)self _ensureFairPlayHelper])
  {
    id v5 = [(__CFString *)v4 objectForKey:@"item"];
    id v6 = +[APRKPlayerItem UUIDFromItemDictionary:v5];

    if (APReceiverFairPlayHelperCopyAuthorizeItemResponseIntoDictionary())
    {
      if (gLogCategory_AirPlayReceiverKit > 90
        || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_22;
      }
    }
    else
    {
      if (gLogCategory_AirPlayReceiverKit > 10
        || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_22;
      }
      uint64_t v10 = (__CFString *)Mutable;
    }
    LogPrintF();
LABEL_22:

    goto LABEL_23;
  }
  if (gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    uint64_t v10 = @"authorizeItem";
    LogPrintF();
  }
LABEL_23:
  uint64_t v7 = +[APRKUtilities baseDictionaryForResponseToRequestWithDictionary:](APRKUtilities, "baseDictionaryForResponseToRequestWithDictionary:", v4, v10);
  id v8 = [(__CFString *)v4 objectForKey:@"item"];
  [v7 setObject:v8 forKey:@"item"];

  [v7 addEntriesFromDictionary:Mutable];
  return v7;
}

- (void)_sendUpstreamMessageWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    if (self->_isInterstitialPlayer)
    {
      id v6 = v4;
      objc_opt_class();
      id v5 = v6;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v5 = (void *)[v6 mutableCopy];
      }
      [v5 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F01258]];
    }
    messageQueue = self->_messageQueue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __54__APRKMediaPlayer__sendUpstreamMessageWithDictionary___block_invoke;
    v9[3] = &unk_264EA1B88;
    id v10 = v5;
    id v11 = self;
    id v8 = v5;
    dispatch_async(messageQueue, v9);
  }
  else if (gLogCategory_AirPlayReceiverKit <= 30 {
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __54__APRKMediaPlayer__sendUpstreamMessageWithDictionary___block_invoke(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverKit <= 10
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"type"];
    uint64_t v3 = *(void *)(a1 + 32);
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 40), "messagingDelegate", v2, v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 mediaPlayer:*(void *)(a1 + 40) wantsToSendUpstreamMessageWithDictionary:*(void *)(a1 + 32)];
}

- (void)_sendUpstreamErrorMessageWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    id v5 = +[APRKUtilities baseDictionaryForUpstreamMessageWithType:@"error"];
    id v6 = +[APRKUtilities dictionaryForError:v7];
    [v5 setObject:v6 forKey:@"error"];

    [(APRKMediaPlayer *)self _sendUpstreamMessageWithDictionary:v5];
  }
  else if (gLogCategory_AirPlayReceiverKit <= 50 {
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  MEMORY[0x270F9A790]();
}

- (void)_sendUpstreamPlaybackStateMessageWithPlaybackStateString:(id)a3 stoppedBecauseInterrupted:(BOOL)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    BOOL v4 = a4;
    id v6 = a3;
    id v7 = +[APRKUtilities baseDictionaryForUpstreamMessageWithType:@"playbackState"];
    [v7 setObject:v6 forKey:@"name"];

    int64_t internalPlaybackState = self->_internalPlaybackState;
    if (internalPlaybackState == 3)
    {
      if (v4) {
        id v11 = @"interrupted";
      }
      else {
        id v11 = (__CFString *)*MEMORY[0x263F014A0];
      }
      [v7 setObject:v11 forKey:*MEMORY[0x263F01260]];
    }
    else if (internalPlaybackState == 2)
    {
      currentItemUUID = self->_currentItemUUID;
      if (currentItemUUID)
      {
        id v10 = currentItemUUID;
      }
      else
      {
        id v12 = [(AVQueuePlayer *)self->_player currentItem];
        id v10 = [v12 UUIDString];

        if (!v10)
        {
          if (gLogCategory_AirPlayReceiverKit <= 30
            && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          goto LABEL_13;
        }
      }
      uint64_t v15 = @"uuid";
      v16[0] = v10;
      uint64_t v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      [v7 setObject:v13 forKey:@"item"];
      uint64_t v14 = [(APRKMediaPlayer *)self _currentPlaybackInfoDictionary];
      [v7 setObject:v14 forKey:@"params"];
    }
    [(APRKMediaPlayer *)self _sendUpstreamMessageWithDictionary:v7];
LABEL_13:
  }
}

- (BOOL)_attemptToSetSelectedMediaArray:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    if (gLogCategory_AirPlayReceiverKit > 50
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_26;
    }
LABEL_22:
    LogPrintF();
LABEL_26:
    BOOL v18 = 0;
    goto LABEL_27;
  }
  id v5 = [(AVQueuePlayer *)self->_player currentItem];
  uint64_t v6 = [v5 status];

  if (v6 != 1)
  {
    if (gLogCategory_AirPlayReceiverKit > 50
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_26;
    }
    goto LABEL_22;
  }
  id v7 = [(AVQueuePlayer *)self->_player currentItem];
  id v8 = [v7 asset];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v22 = v4;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v23 = 0;
        uint64_t v15 = objc_msgSend(v8, "mediaSelectionGroupForPropertyList:mediaSelectionOption:", v14, &v23, v20, v21);
        id v16 = v23;
        if (gLogCategory_AirPlayReceiverKit <= 50
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          id v20 = v16;
          id v21 = v15;
          LogPrintF();
        }
        if (v15)
        {
          uint64_t v17 = [(AVQueuePlayer *)self->_player currentItem];
          [v17 selectMediaOption:v16 inMediaSelectionGroup:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  BOOL v18 = 1;
  id v4 = v22;
LABEL_27:

  return v18;
}

- (id)selectedMediaArrayForItem:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  BOOL v18 = v3;
  id v5 = [v3 asset];
  if ([v5 statusOfValueForKey:@"availableMediaCharacteristicsWithMediaSelectionOptions" error:0] == 2)
  {
    uint64_t v6 = [v5 availableMediaCharacteristicsWithMediaSelectionOptions];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [v5 mediaSelectionGroupForMediaCharacteristic:*(void *)(*((void *)&v19 + 1) + 8 * i)];
          if (v11)
          {
            uint64_t v12 = [v18 currentMediaSelection];
            uint64_t v13 = [v12 selectedMediaOptionInMediaSelectionGroup:v11];
            uint64_t v14 = [v13 propertyList];
            if (v14) {
              [v4 addObject:v14];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }
    id v15 = v4;
  }
  else
  {
    id v16 = [MEMORY[0x263EFF8C0] arrayWithObject:@"availableMediaCharacteristicsWithMediaSelectionOptions"];
    [v5 loadValuesAsynchronouslyForKeys:v16 completionHandler:&__block_literal_global_0];

    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v15 = 0;
  }

  return v15;
}

- (void)_pausePlayerIfNeededForState:(int64_t)a3
{
  if (a3 == 2)
  {
    void block[5] = v3;
    void block[6] = v4;
    if (self->_isWaitingToSetRateFromSenderAfterSeek)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __48__APRKMediaPlayer__pausePlayerIfNeededForState___block_invoke;
      block[3] = &unk_264EA1AE8;
      void block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __48__APRKMediaPlayer__pausePlayerIfNeededForState___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) rate];
  if (v3 != 0.0)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
    return [v4 setRate:0.0];
  }
  return result;
}

- (id)_figPlaybackStateStringFrom:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    int64_t v3 = a3;
  }
  else {
    int64_t v3 = 1;
  }
  if (self->_isWaitingToSetRateFromSenderAfterSeek) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = a3;
  }
  if (v4 > 3) {
    id v5 = 0;
  }
  else {
    id v5 = **((id **)&unk_264EA1D60 + v4);
  }
  return v5;
}

- (void)_updatePlaybackStateWithState:(int64_t)a3 stoppedBecauseInterrupted:(BOOL)a4 shouldSendUpstreamMessage:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  -[APRKMediaPlayer _pausePlayerIfNeededForState:](self, "_pausePlayerIfNeededForState:");
  uint64_t v9 = [(APRKMediaPlayer *)self _figPlaybackStateStringFrom:a3];
  uint64_t v10 = v9;
  self->_int64_t internalPlaybackState = a3;
  if (self->_isFirstSetRateReceived && v5)
  {
    uint64_t v12 = v9;
    uint64_t v9 = [(APRKMediaPlayer *)self _sendUpstreamPlaybackStateMessageWithPlaybackStateString:v9 stoppedBecauseInterrupted:v6];
    uint64_t v10 = v12;
  }
  MEMORY[0x270F9A758](v9, v10);
}

- (id)_fixedIPContentLocationFromURLString:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = [NSURL URLWithString:v5];
    uint64_t v7 = [v6 absoluteString];
    id v8 = [v6 host];
    [v8 cStringUsingEncoding:4];
    int v9 = StringToSockAddr();
    if (v9)
    {
      if (a4)
      {
        *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08570] code:v9 userInfo:0];
        if (gLogCategory_AirPlayReceiverKit > 10) {
          goto LABEL_8;
        }
        if (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()) {
          LogPrintF();
        }
      }
    }
    else
    {
      APSNetworkAddressGetSocketAddr();
    }
  }
  else
  {
    uint64_t v7 = 0;
    id v8 = 0;
    BOOL v6 = 0;
  }
  if (gLogCategory_AirPlayReceiverKit <= 10
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_8:

  return v7;
}

- (void)_registerNotificationHandlersForPlayer
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__APRKMediaPlayer__registerNotificationHandlersForPlayer__block_invoke;
  block[3] = &unk_264EA1AE8;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __57__APRKMediaPlayer__registerNotificationHandlersForPlayer__block_invoke(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    LogPrintF();
  }
  uint64_t v2 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v6);
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__handleCurrentItemChangedNotification_ name:*MEMORY[0x263EFA040] object:*(void *)(*(void *)(a1 + 32) + 8)];

  int64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:*(void *)(a1 + 32) selector:sel__handleCurrentItemPlaybackStalledNotification_ name:*MEMORY[0x263EFA0B8] object:*(void *)(*(void *)(a1 + 32) + 8)];

  [*(id *)(*(void *)(a1 + 32) + 8) addObserver:*(void *)(a1 + 32) forKeyPath:@"timeControlStatus" options:1 context:APRKMediaPlayerObservationContextPlayerTimeControlStatus];
  [*(id *)(*(void *)(a1 + 32) + 8) addObserver:*(void *)(a1 + 32) forKeyPath:@"rate" options:3 context:APRKMediaPlayerObservationContextPlayerRate];
  unint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  return objc_msgSend(v4, "addObserver:forKeyPath:options:context:");
}

- (void)_unregisterNotificationHandlersForPlayer
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__APRKMediaPlayer__unregisterNotificationHandlersForPlayer__block_invoke;
  block[3] = &unk_264EA1AE8;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __59__APRKMediaPlayer__unregisterNotificationHandlersForPlayer__block_invoke(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    LogPrintF();
  }
  uint64_t v2 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v6);
  [v2 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x263EFA0B8] object:*(void *)(*(void *)(a1 + 32) + 8)];

  int64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x263EFA040] object:*(void *)(*(void *)(a1 + 32) + 8)];

  [*(id *)(*(void *)(a1 + 32) + 8) removeObserver:*(void *)(a1 + 32) forKeyPath:@"timeControlStatus" context:APRKMediaPlayerObservationContextPlayerTimeControlStatus];
  [*(id *)(*(void *)(a1 + 32) + 8) removeObserver:*(void *)(a1 + 32) forKeyPath:@"rate" context:APRKMediaPlayerObservationContextPlayerRate];
  [*(id *)(*(void *)(a1 + 32) + 8) removeObserver:*(void *)(a1 + 32) forKeyPath:@"status" context:APRKMediaPlayerObservationContextPlayerStatus];
  unint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v4 pause];
}

- (void)_registerNotificationHandlersAndInsertPlayerItem:(id)a3 afterItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__APRKMediaPlayer__registerNotificationHandlersAndInsertPlayerItem_afterItem___block_invoke;
  block[3] = &unk_264EA1CF0;
  id v11 = v6;
  uint64_t v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_sync(MEMORY[0x263EF83A0], block);
}

uint64_t __78__APRKMediaPlayer__registerNotificationHandlersAndInsertPlayerItem_afterItem___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (gLogCategory_AirPlayReceiverKit <= 30)
  {
    if (gLogCategory_AirPlayReceiverKit != -1 || (uint64_t result = _LogCategory_Initialize(), result))
    {
      uint64_t v17 = *(void *)(v1 + 32);
      uint64_t result = LogPrintF();
    }
  }
  if (*(unsigned char *)(*(void *)(v1 + 40) + 138))
  {
    if (gLogCategory_AirPlayReceiverKit <= 30)
    {
      if (gLogCategory_AirPlayReceiverKit != -1) {
        return LogPrintF();
      }
      uint64_t result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08A00] defaultCenter];
    [v2 addObserver:*(void *)(v1 + 40) selector:sel__handleTimeJumpedNotification_ name:*MEMORY[0x263EFA0E0] object:*(void *)(v1 + 32)];

    int64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:*(void *)(v1 + 40) selector:sel__handleCurrentItemPlayedToEndNotification_ name:*MEMORY[0x263EFA050] object:*(void *)(v1 + 32)];

    unint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:*(void *)(v1 + 40) selector:sel__handleCurrentItemFailedToPlayToEndNotification_ name:*MEMORY[0x263EFA060] object:*(void *)(v1 + 32)];

    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:*(void *)(v1 + 40) selector:sel__handleCurrentPlayerItemReachedTimeToPauseBufferingNotification_ name:*MEMORY[0x263EFA0C0] object:*(void *)(v1 + 32)];

    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:*(void *)(v1 + 40) selector:sel__handleCurrentPlayerItemReachedTimeToPausePlaybackNotification_ name:*MEMORY[0x263EFA0C8] object:*(void *)(v1 + 32)];

    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:*(void *)(v1 + 40) selector:sel__handleCurrentPlayerItemMediaSelectionDidChangeNotification_ name:*MEMORY[0x263EFA090] object:*(void *)(v1 + 32)];

    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:*(void *)(v1 + 40) selector:sel__handleCurrentPlayerItemNewAccessLogEntryNotification_ name:*MEMORY[0x263EFA098] object:*(void *)(v1 + 32)];

    id v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:*(void *)(v1 + 40) selector:sel__handleSeekDidCompleteNotification_ name:*MEMORY[0x263EFA0D8] object:*(void *)(v1 + 32)];

    uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:*(void *)(v1 + 40) selector:sel__handleSeekDidCompleteNotification_ name:*MEMORY[0x263EFA0D0] object:*(void *)(v1 + 32)];

    [*(id *)(v1 + 32) addObserver:*(void *)(v1 + 40) forKeyPath:@"timedMetadata" options:1 context:APRKMediaPlayerObservationContextTimedMetadata];
    [*(id *)(v1 + 32) addObserver:*(void *)(v1 + 40) forKeyPath:@"playbackBufferEmpty" options:1 context:APRKMediaPlayerObservationContextPlaybackBufferEmpty];
    [*(id *)(v1 + 32) addObserver:*(void *)(v1 + 40) forKeyPath:@"playbackBufferFull" options:1 context:APRKMediaPlayerObservationContextPlaybackBufferFull];
    [*(id *)(v1 + 32) addObserver:*(void *)(v1 + 40) forKeyPath:@"playbackLikelyToKeepUp" options:1 context:APRKMediaPlayerObservationContextPlaybackBufferLikelyToKeepUp];
    [*(id *)(v1 + 32) addObserver:*(void *)(v1 + 40) forKeyPath:@"status" options:1 context:APRKMediaPlayerObservationContextCurrentItemStatus];
    [*(id *)(v1 + 32) addObserver:*(void *)(v1 + 40) forKeyPath:@"loadedTimeRanges" options:1 context:APRKMediaPlayerObservationContextCurrentItemLoadableTimeRanges];
    [*(id *)(v1 + 32) addObserver:*(void *)(v1 + 40) forKeyPath:@"seekableTimeRanges" options:1 context:APRKMediaPlayerObservationContextCurrentItemSeekableTimeRanges];
    id v11 = [*(id *)(v1 + 32) startDate];

    if (v11)
    {
      uint64_t v12 = *(void **)(v1 + 32);
      id v13 = [v12 startDate];
      [v12 setInitialDate:v13];
    }
    else
    {
      long long v26 = 0uLL;
      uint64_t v27 = 0;
      uint64_t v14 = *(void **)(v1 + 32);
      if (v14 && ([v14 startPosition], (BYTE12(v26) & 0x11) == 1))
      {
        uint64_t v15 = [*(id *)(v1 + 32) makeSeekID];
        [*(id *)(v1 + 40) _addPendingSeekID:v15 withMessage:0 forItem:*(void *)(v1 + 32) ignoreSeekCompletion:1];
        id v16 = *(void **)(v1 + 32);
        long long v24 = v26;
        uint64_t v25 = v27;
        long long v22 = *MEMORY[0x263F010E0];
        uint64_t v23 = *(void *)(MEMORY[0x263F010E0] + 16);
        long long v20 = v22;
        uint64_t v21 = v23;
        [v16 seekToTime:&v24 toleranceBefore:&v22 toleranceAfter:&v20 seekID:v15];
      }
      else if (gLogCategory_AirPlayReceiverKit <= 30 {
             && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      }
      {
        objc_msgSend(*(id *)(v1 + 32), "UUIDString", v17);
        v19 = BOOL v18 = (~HIDWORD(v26) & 0x11) == 0;
        uint64_t v17 = (BYTE12(v26) & 1) == 0;
        LogPrintF();
      }
    }
    return objc_msgSend(*(id *)(*(void *)(v1 + 40) + 8), "insertItem:afterItem:", *(void *)(v1 + 32), *(void *)(v1 + 48), v17, v18, v19);
  }
  return result;
}

- (void)_unregisterNotificationHandlersAndRemovePlayerItem:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__APRKMediaPlayer__unregisterNotificationHandlersAndRemovePlayerItem___block_invoke;
  v6[3] = &unk_264EA1B88;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __70__APRKMediaPlayer__unregisterNotificationHandlersAndRemovePlayerItem___block_invoke(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    LogPrintF();
  }
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "items", v15);
  char v3 = [v2 containsObject:*(void *)(a1 + 32)];

  if (v3)
  {
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:*(void *)(a1 + 40) name:*MEMORY[0x263EFA0E0] object:*(void *)(a1 + 32)];

    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 removeObserver:*(void *)(a1 + 40) name:*MEMORY[0x263EFA050] object:*(void *)(a1 + 32)];

    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 removeObserver:*(void *)(a1 + 40) name:*MEMORY[0x263EFA060] object:*(void *)(a1 + 32)];

    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 removeObserver:*(void *)(a1 + 40) name:*MEMORY[0x263EFA0C0] object:*(void *)(a1 + 32)];

    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 removeObserver:*(void *)(a1 + 40) name:*MEMORY[0x263EFA0C8] object:*(void *)(a1 + 32)];

    id v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 removeObserver:*(void *)(a1 + 40) name:*MEMORY[0x263EFA090] object:*(void *)(a1 + 32)];

    uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 removeObserver:*(void *)(a1 + 40) name:*MEMORY[0x263EFA098] object:*(void *)(a1 + 32)];

    id v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 removeObserver:*(void *)(a1 + 40) name:*MEMORY[0x263EFA0D8] object:*(void *)(a1 + 32)];

    uint64_t v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 removeObserver:*(void *)(a1 + 40) name:*MEMORY[0x263EFA0D0] object:*(void *)(a1 + 32)];

    [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40) forKeyPath:@"timedMetadata" context:APRKMediaPlayerObservationContextTimedMetadata];
    [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40) forKeyPath:@"playbackBufferEmpty" context:APRKMediaPlayerObservationContextPlaybackBufferEmpty];
    [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40) forKeyPath:@"playbackBufferFull" context:APRKMediaPlayerObservationContextPlaybackBufferFull];
    [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40) forKeyPath:@"playbackLikelyToKeepUp" context:APRKMediaPlayerObservationContextPlaybackBufferLikelyToKeepUp];
    [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40) forKeyPath:@"status" context:APRKMediaPlayerObservationContextCurrentItemStatus];
    [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40) forKeyPath:@"loadedTimeRanges" context:APRKMediaPlayerObservationContextCurrentItemLoadableTimeRanges];
    [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40) forKeyPath:@"seekableTimeRanges" context:APRKMediaPlayerObservationContextCurrentItemSeekableTimeRanges];
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(*(void *)(a1 + 40) + 8);
    [v14 removeItem:v13];
  }
  else if (gLogCategory_AirPlayReceiverKit <= 30 {
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_handleTimeJumpedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  if (v5)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      id v6 = [v4 name];
      LogPrintF();
    }
    messageQueue = self->_messageQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__APRKMediaPlayer__handleTimeJumpedNotification___block_invoke;
    block[3] = &unk_264EA1B88;
    void block[4] = self;
    id v9 = v5;
    dispatch_async(messageQueue, block);
  }
  else if (gLogCategory_AirPlayReceiverKit <= 30 {
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __49__APRKMediaPlayer__handleTimeJumpedNotification___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x263EF8340];
  if (!*(void *)(*(void *)(a1 + 32) + 176)) {
    goto LABEL_9;
  }
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2) {
    [v2 timeToPausePlayback];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double v3 = floor(CMTimeGetSeconds(&time));
  id v4 = *(void **)(a1 + 40);
  if (v4) {
    [v4 currentTime];
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  if (v3 != floor(CMTimeGetSeconds(&v11)))
  {
LABEL_9:
    id v5 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    [v5 setObject:@"notification" forKey:@"type"];
    [v5 setObject:*MEMORY[0x263F012B0] forKey:@"name"];
    id v6 = *(void **)(a1 + 40);
    if (v6) {
      [v6 currentTime];
    }
    else {
      memset(&v10, 0, sizeof(v10));
    }
    CFDictionaryRef v7 = CMTimeCopyAsDictionary(&v10, (CFAllocatorRef)*MEMORY[0x263EFFB08]);
    [v5 setObject:v7 forKey:*MEMORY[0x263F013E8]];

    uint64_t v13 = @"uuid";
    id v8 = [*(id *)(a1 + 40) UUIDString];
    v14[0] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];

    [v5 setObject:v9 forKey:@"item"];
    [*(id *)(a1 + 32) _sendUpstreamMessageWithDictionary:v5];
  }
}

- (void)_handleCurrentItemChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(AVQueuePlayer *)self->_player currentItem];
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    id v6 = [v4 name];
    LogPrintF();
  }
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__APRKMediaPlayer__handleCurrentItemChangedNotification___block_invoke;
  block[3] = &unk_264EA1CF0;
  void block[4] = self;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  dispatch_async(messageQueue, block);
}

void __57__APRKMediaPlayer__handleCurrentItemChangedNotification___block_invoke(id *a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  *((void *)a1[4] + 5) = 0;
  [a1[4] _updatePlaybackStateWithState:1 stoppedBecauseInterrupted:0 shouldSendUpstreamMessage:1];
  objc_storeStrong((id *)a1[4] + 2, *((id *)a1[4] + 3));
  uint64_t v2 = [a1[5] UUIDString];
  double v3 = a1[4];
  id v4 = (void *)v3[3];
  v3[3] = v2;

  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v5 setObject:@"notification" forKey:@"type"];
  [v5 setObject:*MEMORY[0x263F01280] forKey:@"name"];
  id v6 = a1[4];
  uint64_t v7 = *((void *)v6 + 2);
  if (v7)
  {
    uint64_t v15 = @"uuid";
    v16[0] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    [v5 setObject:v8 forKey:@"itemBefore"];

    id v6 = a1[4];
  }
  uint64_t v9 = *((void *)v6 + 3);
  if (v9)
  {
    uint64_t v13 = @"uuid";
    uint64_t v14 = v9;
    CMTime v10 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [v5 setObject:v10 forKey:@"itemCurrent"];

    id v6 = a1[4];
  }
  objc_msgSend(*((id *)v6 + 12), "setForwardsFPSSecureStopData:", objc_msgSend(a1[5], "expectsSecureStop"));
  id v11 = [a1[6] userInfo];
  id v12 = [v11 objectForKey:*MEMORY[0x263EFA048]];

  [v5 setObject:v12 forKey:@"reason"];
  [a1[4] _sendUpstreamMessageWithDictionary:v5];
}

- (void)_handleCurrentItemPlayedToEndNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  if (v5)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      id v6 = [v4 name];
      LogPrintF();
    }
    messageQueue = self->_messageQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__APRKMediaPlayer__handleCurrentItemPlayedToEndNotification___block_invoke;
    block[3] = &unk_264EA1B88;
    id v9 = v5;
    CMTime v10 = self;
    dispatch_async(messageQueue, block);
  }
  else if (gLogCategory_AirPlayReceiverKit <= 30 {
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __61__APRKMediaPlayer__handleCurrentItemPlayedToEndNotification___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  [v2 setObject:@"notification" forKey:@"type"];
  [v2 setObject:*MEMORY[0x263F01290] forKey:@"name"];
  id v5 = @"uuid";
  double v3 = [*(id *)(a1 + 32) UUIDString];
  v6[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  [v2 setObject:v4 forKey:@"uuid"];
  [*(id *)(a1 + 40) _sendUpstreamMessageWithDictionary:v2];
  [*(id *)(a1 + 40) _updatePlaybackStateWithState:3 stoppedBecauseInterrupted:0 shouldSendUpstreamMessage:1];
}

- (void)_handleCurrentItemFailedToPlayToEndNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  if (v5)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      id v6 = [v4 name];
      LogPrintF();
    }
    messageQueue = self->_messageQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__APRKMediaPlayer__handleCurrentItemFailedToPlayToEndNotification___block_invoke;
    block[3] = &unk_264EA1B88;
    id v9 = v4;
    CMTime v10 = self;
    dispatch_async(messageQueue, block);
  }
  else if (gLogCategory_AirPlayReceiverKit <= 30 {
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __67__APRKMediaPlayer__handleCurrentItemFailedToPlayToEndNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  id v9 = [v2 objectForKey:*MEMORY[0x263EFA058]];

  double v3 = *(void **)(a1 + 40);
  id v4 = (void *)MEMORY[0x263F087E8];
  id v5 = [v9 domain];
  uint64_t v6 = [v9 code];
  uint64_t v7 = [v9 userInfo];
  id v8 = [v4 errorWithDomain:v5 code:v6 userInfo:v7];
  [v3 _sendUpstreamErrorMessageWithError:v8];

  [*(id *)(a1 + 40) _updatePlaybackStateWithState:3 stoppedBecauseInterrupted:0 shouldSendUpstreamMessage:1];
}

- (void)_handleCurrentItemPlaybackStalledNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(APRKMediaPlayer *)self _playerItemForUUID:self->_currentItemUUID];
  if (v5)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      uint64_t v6 = [v4 name];
      LogPrintF();
    }
    messageQueue = self->_messageQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__APRKMediaPlayer__handleCurrentItemPlaybackStalledNotification___block_invoke;
    block[3] = &unk_264EA1B88;
    void block[4] = self;
    id v9 = v5;
    dispatch_async(messageQueue, block);
  }
  else if (gLogCategory_AirPlayReceiverKit <= 30 {
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __65__APRKMediaPlayer__handleCurrentItemPlaybackStalledNotification___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  ++*(void *)(*(void *)(a1 + 32) + 40);
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  [v2 setObject:@"notification" forKey:@"type"];
  [v2 setObject:@"stallCountChanged" forKey:@"name"];
  uint64_t v6 = @"uuid";
  double v3 = [*(id *)(a1 + 40) UUIDString];
  v7[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  [v2 setObject:v4 forKey:@"uuid"];
  id v5 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 32) + 40)];
  [v2 setObject:v5 forKey:@"value"];

  [*(id *)(a1 + 32) _sendUpstreamMessageWithDictionary:v2];
}

- (void)_handleCurrentPlayerItemReachedTimeToPauseBufferingNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  if (v5)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      uint64_t v6 = [v4 name];
      LogPrintF();
    }
    messageQueue = self->_messageQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__APRKMediaPlayer__handleCurrentPlayerItemReachedTimeToPauseBufferingNotification___block_invoke;
    block[3] = &unk_264EA1B88;
    void block[4] = self;
    id v9 = v5;
    dispatch_async(messageQueue, block);
  }
  else if (gLogCategory_AirPlayReceiverKit <= 30 {
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __83__APRKMediaPlayer__handleCurrentPlayerItemReachedTimeToPauseBufferingNotification___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = +[APRKUtilities baseDictionaryForUpstreamMessageWithType:@"notification"];
  [v2 setObject:@"loadedTimeRangesChanged" forKey:@"name"];
  double v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) loadedTimeRanges];
  id v5 = [v3 _serializeTimeRanges:v4];

  [v2 setObject:v5 forKey:*MEMORY[0x263F013C8]];
  id v9 = @"uuid";
  uint64_t v6 = [*(id *)(a1 + 40) UUIDString];
  v10[0] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  [v2 setObject:v7 forKey:@"item"];
  [*(id *)(a1 + 32) _sendUpstreamMessageWithDictionary:v2];
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v8 setObject:@"notification" forKey:@"type"];
  [v8 setObject:*MEMORY[0x263F01298] forKey:@"name"];
  [v8 setObject:v7 forKey:@"item"];
  [*(id *)(a1 + 32) _sendUpstreamMessageWithDictionary:v8];
}

- (void)_handleCurrentPlayerItemReachedTimeToPausePlaybackNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  if (v5)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      uint64_t v6 = [v4 name];
      LogPrintF();
    }
    messageQueue = self->_messageQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__APRKMediaPlayer__handleCurrentPlayerItemReachedTimeToPausePlaybackNotification___block_invoke;
    block[3] = &unk_264EA1CF0;
    id v9 = v5;
    id v10 = v4;
    id v11 = self;
    dispatch_async(messageQueue, block);
  }
  else if (gLogCategory_AirPlayReceiverKit <= 30 {
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __82__APRKMediaPlayer__handleCurrentPlayerItemReachedTimeToPausePlaybackNotification___block_invoke(id *a1)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v2 setObject:@"notification" forKey:@"type"];
  [v2 setObject:*MEMORY[0x263F012A0] forKey:@"name"];
  uint64_t v14 = @"uuid";
  double v3 = [a1[4] UUIDString];
  v15[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];

  [v2 setObject:v4 forKey:@"item"];
  id v5 = [a1[5] userInfo];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x263EFA0F0]];

  uint64_t v7 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (!v6)
  {
    id v8 = a1[4];
    if (v8) {
      [v8 currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    uint64_t v6 = CMTimeCopyAsDictionary(&time, *v7);
  }
  [v2 setObject:v6 forKey:@"timeToPausePlayback"];
  id v9 = a1[4];
  if (v9) {
    [v9 timeToPausePlayback];
  }
  else {
    memset(&v12, 0, sizeof(v12));
  }
  CFDictionaryRef v10 = CMTimeCopyAsDictionary(&v12, *v7);
  if (v10) {
    [v2 setObject:v10 forKey:*MEMORY[0x263F01350]];
  }
  id v11 = [a1[4] currentDate];
  if (v11) {
    [v2 setObject:v11 forKey:*MEMORY[0x263F013A8]];
  }
  [a1[6] _sendUpstreamMessageWithDictionary:v2];
}

- (void)_handleSeekDidCompleteNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  if (v5)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      uint64_t v6 = [v4 name];
      LogPrintF();
    }
    messageQueue = self->_messageQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__APRKMediaPlayer__handleSeekDidCompleteNotification___block_invoke;
    block[3] = &unk_264EA1CF0;
    id v9 = v4;
    CFDictionaryRef v10 = self;
    id v11 = v5;
    dispatch_async(messageQueue, block);
  }
  else if (gLogCategory_AirPlayReceiverKit <= 30 {
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __54__APRKMediaPlayer__handleSeekDidCompleteNotification___block_invoke(id *a1)
{
  v28[1] = *MEMORY[0x263EF8340];
  id v2 = [a1[4] userInfo];
  double v3 = [v2 objectForKeyedSubscript:@"AVPlayerItemSeekIDKey"];
  uint64_t v4 = [v3 intValue];

  if (![a1[5] _shouldIgnoreSeekCompletionForSeekID:v4 forItem:a1[6]])
  {
    id v5 = [a1[5] _seekRequestMessageForSeekID:v4 forItem:a1[6]];
    uint64_t v6 = [a1[4] name];
    int v7 = [v6 isEqualToString:*MEMORY[0x263EFA0D8]];

    id v8 = a1[5];
    if (v8[139]) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9 && v5 == 0)
    {
      v8[140] = 1;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __54__APRKMediaPlayer__handleSeekDidCompleteNotification___block_invoke_2;
      block[3] = &unk_264EA1AE8;
      void block[4] = a1[5];
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else if (v5)
    {
      id v11 = +[APRKUtilities baseDictionaryForResponseToRequestWithDictionary:v5];
      id v12 = a1[6];
      if (v12) {
        [v12 currentTime];
      }
      else {
        memset(&v24, 0, sizeof(v24));
      }
      CFDictionaryRef v21 = CMTimeCopyAsDictionary(&v24, (CFAllocatorRef)*MEMORY[0x263EFFB08]);
      [v11 setObject:v21 forKey:*MEMORY[0x263F013E8]];

      LODWORD(v22) = *((_DWORD *)a1[5] + 38);
      uint64_t v23 = [NSNumber numberWithFloat:v22];
      [v11 setObject:v23 forKey:*MEMORY[0x263F013F0]];

      [a1[5] _sendUpstreamMessageWithDictionary:v11];
      goto LABEL_27;
    }
    if (!v7)
    {
LABEL_28:
      [a1[5] _removePendingSeekID:v4 forItem:a1[6]];

      return;
    }
    id v11 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    [v11 setObject:@"notification" forKey:@"type"];
    [v11 setObject:@"didSeek" forKey:@"name"];
    id v13 = a1[6];
    if (v13) {
      [v13 currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    CFDictionaryRef v16 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x263EFFB08]);
    [v11 setObject:v16 forKey:*MEMORY[0x263F013E8]];

    LODWORD(v17) = *((_DWORD *)a1[5] + 38);
    BOOL v18 = [NSNumber numberWithFloat:v17];
    [v11 setObject:v18 forKey:*MEMORY[0x263F013F0]];

    uint64_t v27 = @"uuid";
    long long v19 = [a1[6] UUIDString];
    v28[0] = v19;
    long long v20 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];

    [v11 setObject:v20 forKey:@"item"];
    [a1[5] _sendUpstreamMessageWithDictionary:v11];

LABEL_27:
    goto LABEL_28;
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v14 = a1[5];
  id v15 = a1[6];
  [v14 _removePendingSeekID:v4 forItem:v15];
}

uint64_t __54__APRKMediaPlayer__handleSeekDidCompleteNotification___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) rate];
  if (v3 != 0.0)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
    return [v4 setRate:0.0];
  }
  return result;
}

- (void)_handleCurrentPlayerItemMediaSelectionDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  if (v5)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      uint64_t v6 = [v4 name];
      LogPrintF();
    }
    messageQueue = self->_messageQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__APRKMediaPlayer__handleCurrentPlayerItemMediaSelectionDidChangeNotification___block_invoke;
    block[3] = &unk_264EA1B88;
    id v9 = v5;
    CFDictionaryRef v10 = self;
    dispatch_async(messageQueue, block);
  }
  else if (gLogCategory_AirPlayReceiverKit <= 30 {
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __79__APRKMediaPlayer__handleCurrentPlayerItemMediaSelectionDidChangeNotification___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v2 setObject:@"notification" forKey:@"type"];
  [v2 setObject:*MEMORY[0x263F012A8] forKey:@"name"];
  id v5 = @"uuid";
  float v3 = [*(id *)(a1 + 32) UUIDString];
  v6[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  [v2 setObject:v4 forKey:@"item"];
  [*(id *)(a1 + 40) _sendUpstreamMessageWithDictionary:v2];
}

- (void)_handleCurrentPlayerItemNewAccessLogEntryNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = [v4 name];
    LogPrintF();
  }
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__APRKMediaPlayer__handleCurrentPlayerItemNewAccessLogEntryNotification___block_invoke;
  block[3] = &unk_264EA1B88;
  id v10 = v5;
  id v11 = self;
  id v8 = v5;
  dispatch_async(messageQueue, block);
}

void __73__APRKMediaPlayer__handleCurrentPlayerItemNewAccessLogEntryNotification___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v2 setObject:@"notification" forKey:@"type"];
  [v2 setObject:*MEMORY[0x263F01278] forKey:@"name"];
  id v5 = @"uuid";
  float v3 = [*(id *)(a1 + 32) UUIDString];
  v6[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  [v2 setObject:v4 forKey:@"item"];
  [*(id *)(a1 + 40) _sendUpstreamMessageWithDictionary:v2];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(APRKMediaPlayer *)self _playerItemForUUID:self->_currentItemUUID];
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__APRKMediaPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_264EA1D40;
  void block[4] = self;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v23 = v10;
  CMTime v24 = a6;
  id v15 = v10;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(messageQueue, block);
}

void __66__APRKMediaPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v75[1] = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 112) != 3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v2 = *(void *)(a1 + 72);
      if (v2 == APRKMediaPlayerObservationContextPlayerTimeControlStatus)
      {
        *(double *)&unint64_t v14 = COERCE_DOUBLE([*(id *)(*(void *)(a1 + 32) + 8) timeControlStatus]);
        if (gLogCategory_AirPlayReceiverKit <= 30
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          double v50 = *(double *)&v14;
          LogPrintF();
        }
        if (v14 >= 3) {
          uint64_t v31 = 3;
        }
        else {
          uint64_t v31 = v14;
        }
        objc_msgSend(*(id *)(a1 + 32), "_updatePlaybackStateWithState:stoppedBecauseInterrupted:shouldSendUpstreamMessage:", v31, 0, 1, *(void *)&v50);
      }
      else if (v2 == APRKMediaPlayerObservationContextPlayerRate)
      {
        id v15 = [*(id *)(a1 + 48) objectForKey:*MEMORY[0x263F081C8]];
        [v15 floatValue];
        float v17 = v16;

        id v18 = [*(id *)(a1 + 48) objectForKey:*MEMORY[0x263F081B8]];
        [v18 floatValue];
        float v20 = v19;

        if (gLogCategory_AirPlayReceiverKit <= 30
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          uint64_t v21 = *(void *)(a1 + 32);
          double v53 = *(float *)(v21 + 152);
          uint64_t v52 = *(unsigned __int8 *)(v21 + 156);
          double v50 = v17;
          double v51 = v20;
          LogPrintF();
        }
        if (v20 != 0.0) {
          *(float *)(*(void *)(a1 + 32) + 152) = v20;
        }
        id v5 = 0;
        uint64_t v32 = *(void *)(a1 + 32);
        if (!*(unsigned char *)(v32 + 139) || v17 == v20) {
          goto LABEL_44;
        }
        if (*(unsigned char *)(v32 + 156))
        {
          if (v20 == *(float *)(v32 + 160))
          {
            if (gLogCategory_AirPlayReceiverKit <= 30
              && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
            {
              double v50 = v20;
              LogPrintF();
            }
            *(unsigned char *)(*(void *)(a1 + 32) + 156) = 0;
            *(_DWORD *)(*(void *)(a1 + 32) + 160) = 0;
            *(unsigned char *)(*(void *)(a1 + 32) + 140) = 1;
            v58[0] = MEMORY[0x263EF8330];
            v58[1] = 3221225472;
            v58[2] = __66__APRKMediaPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
            v58[3] = &unk_264EA1D18;
            float v59 = v20;
            v58[4] = *(void *)(a1 + 32);
            dispatch_async(MEMORY[0x263EF83A0], v58);
            double v42 = COERCE_DOUBLE([objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3]);
            [*(id *)&v42 setObject:@"notification" forKey:@"type"];
            [*(id *)&v42 setObject:@"didSeek" forKey:@"name"];
            int v43 = *(void **)(*(void *)(a1 + 32) + 8);
            if (v43) {
              [v43 currentTime];
            }
            else {
              memset(&time, 0, sizeof(time));
            }
            CFDictionaryRef v44 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x263EFFB08]);
            [*(id *)&v42 setObject:v44 forKey:*MEMORY[0x263F013E8]];

            *(float *)&double v45 = v20;
            uint64_t v46 = [NSNumber numberWithFloat:v45];
            [*(id *)&v42 setObject:v46 forKey:*MEMORY[0x263F013F0]];

            v74 = @"uuid";
            v47 = [*(id *)(*(void *)(a1 + 32) + 8) currentItem];
            v48 = [v47 UUIDString];
            v75[0] = v48;
            id v49 = [NSDictionary dictionaryWithObjects:v75 forKeys:&v74 count:1];

            [*(id *)&v42 setObject:v49 forKey:@"item"];
            if (gLogCategory_AirPlayReceiverKit <= 30
              && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
            {
              double v50 = v42;
              LogPrintF();
            }
            objc_msgSend(*(id *)(a1 + 32), "_sendUpstreamMessageWithDictionary:", *(void *)&v42, *(void *)&v50, *(void *)&v51, v52, *(void *)&v53);
          }
        }
        else if (v20 >= 2.0 || v20 <= -1.0)
        {
          if (gLogCategory_AirPlayReceiverKit <= 30
            && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          id v5 = 0;
          *(unsigned char *)(*(void *)(a1 + 32) + 156) = 1;
          *(float *)(*(void *)(a1 + 32) + 160) = v17;
          goto LABEL_44;
        }
      }
      else if (v2 == APRKMediaPlayerObservationContextPlayerStatus)
      {
        uint64_t v3 = *(void *)(a1 + 32);
        if (*(void *)(v3 + 72))
        {
          if ([*(id *)(v3 + 8) status] == 1)
          {
            if (gLogCategory_AirPlayReceiverKit <= 30
              && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __66__APRKMediaPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
            block[3] = &unk_264EA1AE8;
            void block[4] = *(void *)(a1 + 32);
            dispatch_sync(MEMORY[0x263EF83A0], block);
            uint64_t v40 = *(void *)(a1 + 32);
            uint64_t v41 = *(void **)(v40 + 72);
            *(void *)(v40 + 72) = 0;
          }
        }
      }
      goto LABEL_43;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (*(void *)(a1 + 56))
      {
        id v4 = +[APRKUtilities baseDictionaryForUpstreamMessageWithType:@"notification"];
        id v5 = v4;
        uint64_t v6 = *(void *)(a1 + 72);
        if (v6 == APRKMediaPlayerObservationContextTimedMetadata)
        {
          v72 = @"uuid";
          id v22 = [*(id *)(a1 + 56) UUIDString];
          v73 = v22;
          id v23 = [NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];

          [v5 setObject:v23 forKey:@"item"];
          CMTime v24 = (void *)*MEMORY[0x263F012B8];
          uint64_t v25 = @"name";
          long long v26 = v5;
        }
        else
        {
          if (v6 == APRKMediaPlayerObservationContextPlaybackBufferEmpty)
          {
            [v4 setObject:*MEMORY[0x263F013D0] forKey:@"name"];
            v70 = @"uuid";
            uint64_t v27 = [*(id *)(a1 + 56) UUIDString];
            v71 = v27;
            uint64_t v28 = NSDictionary;
            uint64_t v29 = &v71;
            uint64_t v30 = &v70;
          }
          else if (v6 == APRKMediaPlayerObservationContextPlaybackBufferFull)
          {
            [v4 setObject:*MEMORY[0x263F013D8] forKey:@"name"];
            v68 = @"uuid";
            uint64_t v27 = [*(id *)(a1 + 56) UUIDString];
            v69 = v27;
            uint64_t v28 = NSDictionary;
            uint64_t v29 = &v69;
            uint64_t v30 = &v68;
          }
          else if (v6 == APRKMediaPlayerObservationContextPlaybackBufferLikelyToKeepUp)
          {
            [v4 setObject:*MEMORY[0x263F013E0] forKey:@"name"];
            CMTime v34 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 56), "isPlaybackLikelyToKeepUp"));
            [v5 setObject:v34 forKey:@"value"];

            v66 = @"uuid";
            uint64_t v27 = [*(id *)(a1 + 56) UUIDString];
            v67 = v27;
            uint64_t v28 = NSDictionary;
            uint64_t v29 = &v67;
            uint64_t v30 = &v66;
          }
          else
          {
            if (v6 == APRKMediaPlayerObservationContextCurrentItemStatus)
            {
              if ([*(id *)(a1 + 56) status] != 1) {
                goto LABEL_44;
              }
              [v5 setObject:*MEMORY[0x263F013F8] forKey:@"name"];
              v64 = @"uuid";
              uint64_t v35 = [*(id *)(a1 + 56) UUIDString];
              v65 = v35;
              id v36 = [NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];

              [v5 setObject:v36 forKey:@"item"];
              uint64_t v37 = *(void **)(a1 + 32);
              if (v37[8] && objc_msgSend(v37, "_attemptToSetSelectedMediaArray:"))
              {
                uint64_t v38 = *(void *)(a1 + 32);
                id v39 = *(void **)(v38 + 64);
                *(void *)(v38 + 64) = 0;
              }
LABEL_87:
              if (v5) {
                [*(id *)(a1 + 32) _sendUpstreamMessageWithDictionary:v5];
              }
              goto LABEL_44;
            }
            if (v6 == APRKMediaPlayerObservationContextCurrentItemLoadableTimeRanges)
            {
              [v4 setObject:@"loadedTimeRangesChanged" forKey:@"name"];
              CMTime v62 = @"uuid";
              uint64_t v27 = [*(id *)(a1 + 56) UUIDString];
              uint64_t v63 = v27;
              uint64_t v28 = NSDictionary;
              uint64_t v29 = &v63;
              uint64_t v30 = &v62;
            }
            else
            {
              if (v6 != APRKMediaPlayerObservationContextCurrentItemSeekableTimeRanges)
              {
                uint64_t v7 = *(void *)(a1 + 64);
                uint64_t v8 = *(void *)(a1 + 40);
                uint64_t v9 = *(void *)(a1 + 48);
                v55.receiver = *(id *)(a1 + 32);
                v55.super_class = (Class)APRKMediaPlayer;
                objc_msgSendSuper2(&v55, sel_observeValueForKeyPath_ofObject_change_context_, v7, v8, v9);
                goto LABEL_87;
              }
              [v4 setObject:@"seekableTimeRangesChanged" forKey:@"name"];
              CMTime v60 = @"uuid";
              uint64_t v27 = [*(id *)(a1 + 56) UUIDString];
              uint64_t v61 = v27;
              uint64_t v28 = NSDictionary;
              uint64_t v29 = &v61;
              uint64_t v30 = &v60;
            }
          }
          id v23 = [v28 dictionaryWithObjects:v29 forKeys:v30 count:1];

          uint64_t v25 = @"item";
          long long v26 = v5;
          CMTime v24 = v23;
        }
        [v26 setObject:v24 forKey:v25];

        goto LABEL_87;
      }
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 64);
      uint64_t v13 = *(void *)(a1 + 72);
      v54.receiver = *(id *)(a1 + 32);
      v54.super_class = (Class)APRKMediaPlayer;
      objc_msgSendSuper2(&v54, sel_observeValueForKeyPath_ofObject_change_context_, v12, v10, v11, v13);
    }
LABEL_43:
    id v5 = 0;
LABEL_44:

    return;
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __66__APRKMediaPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t result)
{
  if (*(float *)(result + 40) != 0.0)
  {
    uint64_t v1 = result;
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v2 = *(void **)(*(void *)(v1 + 32) + 8);
    return [v2 setRate:0.0];
  }
  return result;
}

void __66__APRKMediaPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  id v4 = [*(id *)(v2 + 72) objectForKeyedSubscript:@"rate"];
  [v4 floatValue];
  int v6 = v5;
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:@"time"];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 CMTimeValue];
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
  }
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:@"hostTime"];
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 CMTimeValue];
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  uint64_t v11 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "objectForKeyedSubscript:", @"options", v13, v14, v15, v16, v17, v18);
  LODWORD(v12) = v6;
  [v3 setRate:&v16 time:&v13 atHostTime:v11 options:v12];
}

- (void)contentKeyHelper:(id)a3 wantsToPerformContentKeyRequestWithDictionary:(id)a4
{
  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = @"type";
  v8[1] = @"kind";
  v9[0] = @"unhandledURL";
  v9[1] = @"request";
  v8[2] = *MEMORY[0x263F014A8];
  v9[2] = a4;
  int v5 = NSDictionary;
  id v6 = a4;
  uint64_t v7 = [v5 dictionaryWithObjects:v9 forKeys:v8 count:3];

  [(APRKMediaPlayer *)self _sendUpstreamMessageWithDictionary:v7];
}

- (void)contentKeyHelper:(id)a3 didGenerateSecureStopRecordPayload:(id)a4
{
  p_messagingDelegate = &self->_messagingDelegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_messagingDelegate);
  [WeakRetained mediaPlayer:self didGenerateFPSSecureStopRecordPayload:v6];
}

- (void)resourceLoaderHelper:(id)a3 wantsToPerformUnhandledURLRequestWithDictionary:(id)a4 forRequestID:(id)a5
{
  void v12[4] = *MEMORY[0x263EF8340];
  v12[0] = @"unhandledURL";
  v12[1] = @"request";
  uint64_t v7 = NSString;
  id v8 = a4;
  uint64_t v9 = objc_msgSend(v7, "stringWithFormat:", @"%lu", objc_msgSend(a5, "integerValue"), @"type", @"kind", @"messageID");
  void v11[3] = *MEMORY[0x263F014A8];
  v12[2] = v9;
  v12[3] = v8;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  [(APRKMediaPlayer *)self _sendUpstreamMessageWithDictionary:v10];
}

- (APRKMetadata)currentItemMetadata
{
  return self->_currentItemMetadata;
}

- (void)setCurrentItemMetadata:(id)a3
{
}

- (BOOL)isInterstitialPlayer
{
  return self->_isInterstitialPlayer;
}

- (int)playerSessionID
{
  return self->_playerSessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentItemMetadata, 0);
  objc_storeStrong((id *)&self->_audioSessionMode, 0);
  objc_storeStrong((id *)&self->_lastReportedDateRanges, 0);
  objc_storeStrong((id *)&self->_currentInterstitialEventID, 0);
  objc_storeStrong((id *)&self->_interstitialEvents, 0);
  objc_storeStrong((id *)&self->_interstitialPlayer, 0);
  objc_storeStrong((id *)&self->_pendingSenderSeekMessages, 0);
  objc_storeStrong((id *)&self->_contentKeyHelper, 0);
  objc_storeStrong((id *)&self->_resourceLoaderHelper, 0);
  objc_storeStrong((id *)&self->_cachedSSLProperties, 0);
  objc_storeStrong((id *)&self->_cachedSetRateAndAnchor, 0);
  objc_storeStrong((id *)&self->_cachedSelectedMediaArray, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_destroyWeak((id *)&self->_messagingDelegate);
  objc_storeStrong((id *)&self->_currentItemUUID, 0);
  objc_storeStrong((id *)&self->_previousItemUUID, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end