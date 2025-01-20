@interface IKJSPlayer
- (BOOL)_timedMetadataDidChangeWithExtraInfo:(id)a3;
- (BOOL)dispatchEvent:(id)a3 userInfo:(id)a4;
- (BOOL)interactiveOverlayDismissable;
- (BOOL)muted;
- (BOOL)showsResumeMenu;
- (IKAppPlayerBridge)bridge;
- (IKDOMDocument)interactiveOverlayDocument;
- (IKDOMDocument)overlayDocument;
- (IKJSMediaItem)currentMediaItem;
- (IKJSMediaItem)nextMediaItem;
- (IKJSMediaItem)previousMediaItem;
- (IKJSPlayer)init;
- (IKJSPlayer)initWithAppContext:(id)a3 bridge:(id)a4;
- (IKJSPlaylist)playlist;
- (NSArray)currentMediaItemAccessLogs;
- (NSArray)currentMediaItemErrorLogs;
- (NSDate)currentMediaItemDate;
- (NSDictionary)contextMenuData;
- (NSDictionary)userInfo;
- (NSNumber)currentMediaItemDuration;
- (NSString)playbackState;
- (double)playbackRate;
- (int64_t)state;
- (void)_addManagedReference;
- (void)_removeManagedReference;
- (void)addEventListener:(id)a3 :(id)a4 :(id)a5;
- (void)changeToMediaAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)next;
- (void)pause;
- (void)play;
- (void)present;
- (void)previous;
- (void)removeEventListener:(id)a3 :(id)a4;
- (void)seekToTime:(double)a3;
- (void)setContextMenuData:(id)a3;
- (void)setInteractiveOverlayDismissable:(BOOL)a3;
- (void)setInteractiveOverlayDocument:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setOverlayDocument:(id)a3;
- (void)setPlaybackRate:(double)a3;
- (void)setPlaylist:(id)a3;
- (void)setShowsResumeMenu:(BOOL)a3;
- (void)setUserInfo:(id)a3;
- (void)stop;
@end

@implementation IKJSPlayer

- (IKJSPlayer)init
{
  v3 = +[IKAppContext currentAppContext];
  v14.receiver = self;
  v14.super_class = (Class)IKJSPlayer;
  v4 = [(IKJSObject *)&v14 initWithAppContext:v3];

  if (v4)
  {
    v5 = [IKAppPlayerBridge alloc];
    v6 = [(IKJSObject *)v4 appContext];
    uint64_t v7 = [(IKAppPlayerBridge *)v5 initWithAppContext:v6 jsPlayer:v4];
    bridge = v4->_bridge;
    v4->_bridge = (IKAppPlayerBridge *)v7;

    v4->_playerState = 0;
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    timeListeners = v4->_timeListeners;
    v4->_timeListeners = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    boundaryListeners = v4->_boundaryListeners;
    v4->_boundaryListeners = (NSMutableDictionary *)v11;

    [(IKAppPlayerBridge *)v4->_bridge startObservingEvent:@"stateDidChange" extraInfo:0];
  }
  return v4;
}

- (IKJSPlayer)initWithAppContext:(id)a3 bridge:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IKJSPlayer;
  v8 = [(IKJSObject *)&v15 initWithAppContext:a3];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bridge, a4);
    v9->_playerState = 0;
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    timeListeners = v9->_timeListeners;
    v9->_timeListeners = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    boundaryListeners = v9->_boundaryListeners;
    v9->_boundaryListeners = (NSMutableDictionary *)v12;
  }
  return v9;
}

- (void)dealloc
{
  [(IKAppPlayerBridge *)self->_bridge cleanup];
  v3.receiver = self;
  v3.super_class = (Class)IKJSPlayer;
  [(IKJSPlayer *)&v3 dealloc];
}

- (BOOL)dispatchEvent:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 properties];
  if ([v6 isEqualToString:@"timedMetadata"])
  {
    LOBYTE(v9) = [(IKJSPlayer *)self _timedMetadataDidChangeWithExtraInfo:v8];
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"timeDidChange"])
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:@"interval"];
    [v10 doubleValue];
    double v12 = v11;

    v13 = objc_msgSend(@"timeDidChange", "stringByAppendingFormat:", @"_%lu", (unint64_t)v12);
    objc_super v14 = [(IKJSEventListenerObject *)self _eventInformationForType:v6 extraInfo:v8];
    v30.receiver = self;
    v30.super_class = (Class)IKJSPlayer;
    unsigned __int8 v15 = [(IKJSEventListenerObject *)&v30 invokeListeners:v13 extraInfo:v14];
LABEL_7:
    LOBYTE(v9) = v15;

LABEL_8:
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"timeBoundaryDidCross"])
  {
    v16 = [v8 objectForKeyedSubscript:@"boundary"];
    [v16 doubleValue];
    uint64_t v18 = v17;

    v19 = objc_msgSend(NSString, "stringWithFormat:", @"%.3f", v18);
    v13 = [@"timeBoundaryDidCross" stringByAppendingFormat:@"_%@", v19];

    objc_super v14 = [(IKJSEventListenerObject *)self _eventInformationForType:v6 extraInfo:v8];
    v29.receiver = self;
    v29.super_class = (Class)IKJSPlayer;
    unsigned __int8 v15 = [(IKJSEventListenerObject *)&v29 invokeListeners:v13 extraInfo:v14];
    goto LABEL_7;
  }
  char v22 = objc_opt_respondsToSelector();
  v13 = [(IKJSEventListenerObject *)self _eventInformationForType:v6 extraInfo:v8];
  if ((v22 & 1) == 0)
  {
    v26.receiver = self;
    v26.super_class = (Class)IKJSPlayer;
    LOBYTE(v9) = [(IKJSEventListenerObject *)&v26 invokeListeners:v6 extraInfo:v13];
    goto LABEL_8;
  }
  v27.receiver = self;
  v27.super_class = (Class)IKJSPlayer;
  id v28 = 0;
  BOOL v9 = [(IKJSEventListenerObject *)&v27 invokeSingleListener:v6 extraInfo:v13 return:&v28];
  id v23 = v28;

  if (v9)
  {
    v24 = [(IKJSObject *)self appContext];
    v25 = [v24 jsContext];
    [v7 processReturnJSValue:v23 inContext:v25];
  }
LABEL_9:
  if ([v6 isEqualToString:@"stateDidChange"])
  {
    v20 = [v8 objectForKeyedSubscript:@"state"];
    self->_playerState = +[IKPlayerStateChangeEventUserInfo stateForStateName:v20];

    if (self->_playerState == 8) {
      [(IKJSPlayer *)self _removeManagedReference];
    }
  }

  return v9;
}

- (void)setOverlayDocument:(id)a3
{
}

- (IKDOMDocument)overlayDocument
{
  return [(IKAppPlayerBridge *)self->_bridge overlayDocument];
}

- (BOOL)interactiveOverlayDismissable
{
  return [(IKAppPlayerBridge *)self->_bridge interactiveOverlayDismissable];
}

- (void)setInteractiveOverlayDismissable:(BOOL)a3
{
}

- (void)setInteractiveOverlayDocument:(id)a3
{
}

- (IKDOMDocument)interactiveOverlayDocument
{
  return [(IKAppPlayerBridge *)self->_bridge interactiveOverlayDocument];
}

- (IKJSPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
  v4 = (IKJSPlaylist *)a3;
  v5 = [(IKJSObject *)self appContext];
  id v12 = [v5 jsContext];

  if (self->_playlist)
  {
    id v6 = [v12 virtualMachine];
    [v6 removeManagedReference:self->_playlist withOwner:self];
  }
  playlist = self->_playlist;
  self->_playlist = v4;
  v8 = v4;

  bridge = self->_bridge;
  uint64_t v10 = [(IKJSPlaylist *)v8 bridge];
  [(IKAppPlayerBridge *)bridge setPlaylist:v10];

  double v11 = [v12 virtualMachine];
  [v11 addManagedReference:self->_playlist withOwner:self];
}

- (NSDictionary)userInfo
{
  return [(IKAppPlayerBridge *)self->_bridge userInfo];
}

- (void)setUserInfo:(id)a3
{
}

- (void)seekToTime:(double)a3
{
}

- (NSDate)currentMediaItemDate
{
  return [(IKAppPlayerBridge *)self->_bridge currentMediaItemDate];
}

- (NSNumber)currentMediaItemDuration
{
  return [(IKAppPlayerBridge *)self->_bridge currentMediaItemDuration];
}

- (IKJSMediaItem)currentMediaItem
{
  v2 = [(IKAppPlayerBridge *)self->_bridge currentMediaItem];
  objc_super v3 = v2;
  if (v2)
  {
    v4 = [v2 jsMediaItem];
  }
  else
  {
    v4 = 0;
  }

  return (IKJSMediaItem *)v4;
}

- (IKJSMediaItem)nextMediaItem
{
  v2 = [(IKAppPlayerBridge *)self->_bridge nextMediaItem];
  objc_super v3 = v2;
  if (v2)
  {
    v4 = [v2 jsMediaItem];
  }
  else
  {
    v4 = 0;
  }

  return (IKJSMediaItem *)v4;
}

- (IKJSMediaItem)previousMediaItem
{
  v2 = [(IKAppPlayerBridge *)self->_bridge previousMediaItem];
  objc_super v3 = v2;
  if (v2)
  {
    v4 = [v2 jsMediaItem];
  }
  else
  {
    v4 = 0;
  }

  return (IKJSMediaItem *)v4;
}

- (NSArray)currentMediaItemAccessLogs
{
  return [(IKAppPlayerBridge *)self->_bridge currentMediaItemAccessLogs];
}

- (NSArray)currentMediaItemErrorLogs
{
  return [(IKAppPlayerBridge *)self->_bridge currentMediaItemErrorLogs];
}

- (BOOL)showsResumeMenu
{
  return [(IKAppPlayerBridge *)self->_bridge showsResumeMenu];
}

- (void)setShowsResumeMenu:(BOOL)a3
{
}

- (BOOL)muted
{
  return [(IKAppPlayerBridge *)self->_bridge muted];
}

- (void)setMuted:(BOOL)a3
{
}

- (NSDictionary)contextMenuData
{
  return [(IKAppPlayerBridge *)self->_bridge contextMenuData];
}

- (void)setContextMenuData:(id)a3
{
}

- (int64_t)state
{
  return self->_playerState;
}

- (void)present
{
  [(IKAppPlayerBridge *)self->_bridge present];
  [(IKJSPlayer *)self _addManagedReference];
}

- (void)play
{
  [(IKAppPlayerBridge *)self->_bridge play];
  [(IKJSPlayer *)self _addManagedReference];
}

- (void)pause
{
}

- (void)stop
{
}

- (void)next
{
}

- (void)previous
{
}

- (void)changeToMediaAtIndex:(unint64_t)a3
{
}

- (double)playbackRate
{
  [(IKAppPlayerBridge *)self->_bridge scanRate];
  return result;
}

- (void)setPlaybackRate:(double)a3
{
}

- (NSString)playbackState
{
  return (NSString *)+[IKPlayerStateChangeEventUserInfo stateNameForState:self->_playerState];
}

- (void)addEventListener:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 isEqualToString:@"timeDidChange"])
  {
    uint64_t v10 = [v9 objectForKeyedSubscript:@"interval"];
    double v11 = [v10 toNumber];

    if (!v8 || ![v11 unsignedIntegerValue]) {
      goto LABEL_52;
    }
    id v77 = v9;
    id v70 = v7;
    uint64_t v82 = objc_msgSend(@"timeDidChange", "stringByAppendingFormat:", @"_%lu", objc_msgSend(v11, "unsignedIntegerValue"));
    timeListeners = self->_timeListeners;
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "unsignedIntegerValue"));
    uint64_t v14 = [(NSMutableDictionary *)timeListeners objectForKey:v13];

    unsigned __int8 v15 = (void *)v14;
    if (!v14)
    {
      unsigned __int8 v15 = [MEMORY[0x1E4F1CA80] set];
      v16 = self->_timeListeners;
      uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "unsignedIntegerValue"));
      [(NSMutableDictionary *)v16 setObject:v15 forKey:v17];
    }
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id v18 = v15;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v105 objects:v119 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v106;
LABEL_8:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v106 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = [*(id *)(*((void *)&v105 + 1) + 8 * v22) value];
        char v24 = [v23 isEqual:v8];

        if (v24) {
          break;
        }
        if (v20 == ++v22)
        {
          uint64_t v20 = [v18 countByEnumeratingWithState:&v105 objects:v119 count:16];
          if (v20) {
            goto LABEL_8;
          }
          goto LABEL_14;
        }
      }

      objc_super v26 = (void *)v82;
      if (v14) {
        goto LABEL_51;
      }
    }
    else
    {
LABEL_14:

      v25 = [MEMORY[0x1E4F30928] managedValueWithValue:v8 andOwner:self];
      [v18 addObject:v25];

      v104.receiver = self;
      v104.super_class = (Class)IKJSPlayer;
      objc_super v26 = (void *)v82;
      [(IKJSEventListenerObject *)&v104 addEventListener:v82 :v8 :v77];
      if (v14)
      {
LABEL_51:

        id v7 = v70;
        id v9 = v77;
LABEL_52:

        goto LABEL_53;
      }
    }
    bridge = self->_bridge;
    v117 = @"intervals";
    v49 = [(NSMutableDictionary *)self->_timeListeners allKeys];
    v118 = v49;
    v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
    [(IKAppPlayerBridge *)bridge startObservingEvent:v70 extraInfo:v50];

    goto LABEL_51;
  }
  if (![v7 isEqualToString:@"timeBoundaryDidCross"])
  {
    if (![v7 isEqualToString:@"timedMetadata"])
    {
      v85.receiver = self;
      v85.super_class = (Class)IKJSPlayer;
      [(IKJSEventListenerObject *)&v85 addEventListener:v7 :v8 :v9];
      v46 = self->_bridge;
      if ([v9 isObject])
      {
        v47 = [v9 toObject];
        [(IKAppPlayerBridge *)v46 startObservingEvent:v7 extraInfo:v47];
      }
      else
      {
        [(IKAppPlayerBridge *)v46 startObservingEvent:v7 extraInfo:0];
      }
      goto LABEL_53;
    }
    if (([v9 isArray] & 1) == 0
      && ([v9 isNull] & 1) == 0
      && ![v9 isUndefined])
    {
      goto LABEL_53;
    }
    if ([v9 isArray])
    {
      v45 = [v9 toArray];
    }
    else
    {
      v45 = 0;
    }
    if (!self->_timedMetadataListeners)
    {
      v51 = [MEMORY[0x1E4F1CA60] dictionary];
      timedMetadataListeners = self->_timedMetadataListeners;
      self->_timedMetadataListeners = v51;
    }
    if (!v45)
    {
      v45 = [MEMORY[0x1E4F1C978] arrayWithObject:@"all"];
    }
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v53 = v45;
    uint64_t v54 = [v53 countByEnumeratingWithState:&v91 objects:v112 count:16];
    id obja = v53;
    if (v54)
    {
      uint64_t v55 = v54;
      id v72 = v7;
      char v74 = 0;
      id v79 = v9;
      uint64_t v81 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v55; ++i)
        {
          if (*(void *)v92 != v81) {
            objc_enumerationMutation(obja);
          }
          uint64_t v57 = *(void *)(*((void *)&v91 + 1) + 8 * i);
          v58 = [@"timedMetadata" stringByAppendingFormat:@"_%@", v57];
          v59 = [(NSMutableDictionary *)self->_timedMetadataListeners objectForKey:v57];
          if (!v59)
          {
            v59 = [MEMORY[0x1E4F1CA80] set];
            [(NSMutableDictionary *)self->_timedMetadataListeners setObject:v59 forKey:v57];
            char v74 = 1;
          }
          long long v89 = 0u;
          long long v90 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          id v60 = v59;
          uint64_t v61 = [v60 countByEnumeratingWithState:&v87 objects:v111 count:16];
          if (v61)
          {
            uint64_t v62 = v61;
            uint64_t v63 = *(void *)v88;
            while (2)
            {
              for (uint64_t j = 0; j != v62; ++j)
              {
                if (*(void *)v88 != v63) {
                  objc_enumerationMutation(v60);
                }
                v65 = [*(id *)(*((void *)&v87 + 1) + 8 * j) value];
                char v66 = [v65 isEqual:v8];

                if (v66)
                {

                  goto LABEL_77;
                }
              }
              uint64_t v62 = [v60 countByEnumeratingWithState:&v87 objects:v111 count:16];
              if (v62) {
                continue;
              }
              break;
            }
          }

          v67 = [MEMORY[0x1E4F30928] managedValueWithValue:v8 andOwner:self];
          [v60 addObject:v67];

          v86.receiver = self;
          v86.super_class = (Class)IKJSPlayer;
          [(IKJSEventListenerObject *)&v86 addEventListener:v58 :v8 :v79];
LABEL_77:
        }
        uint64_t v55 = [obja countByEnumeratingWithState:&v91 objects:v112 count:16];
      }
      while (v55);

      id v7 = v72;
      id v9 = v79;
      if ((v74 & 1) == 0) {
        goto LABEL_82;
      }
      v68 = self->_bridge;
      v109 = @"keys";
      id v53 = [(NSMutableDictionary *)self->_timedMetadataListeners allKeys];
      id v110 = v53;
      v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
      [(IKAppPlayerBridge *)v68 startObservingEvent:v72 extraInfo:v69];
    }
LABEL_82:

    goto LABEL_53;
  }
  objc_super v27 = [v9 toArray];
  if (v8)
  {
    if (v27)
    {
      long long v102 = 0u;
      long long v103 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      obuint64_t j = v27;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v100 objects:v116 count:16];
      objc_super v27 = obj;
      uint64_t v83 = v28;
      if (v28)
      {
        id v71 = v7;
        char v73 = 0;
        id v78 = v9;
        uint64_t v80 = *(void *)v101;
        do
        {
          uint64_t v29 = 0;
          do
          {
            if (*(void *)v101 != v80) {
              objc_enumerationMutation(obj);
            }
            objc_super v30 = *(void **)(*((void *)&v100 + 1) + 8 * v29);
            [v30 doubleValue];
            v32 = objc_msgSend(@"timeBoundaryDidCross", "stringByAppendingFormat:", @"_%.3f", v31);
            v33 = [(NSMutableDictionary *)self->_boundaryListeners objectForKey:v30];
            if (!v33)
            {
              v33 = [MEMORY[0x1E4F1CA80] set];
              [(NSMutableDictionary *)self->_boundaryListeners setObject:v33 forKey:v30];
              char v73 = 1;
            }
            long long v98 = 0u;
            long long v99 = 0u;
            long long v96 = 0u;
            long long v97 = 0u;
            id v34 = v33;
            uint64_t v35 = [v34 countByEnumeratingWithState:&v96 objects:v115 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v97;
              while (2)
              {
                for (uint64_t k = 0; k != v36; ++k)
                {
                  if (*(void *)v97 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  v39 = [*(id *)(*((void *)&v96 + 1) + 8 * k) value];
                  char v40 = [v39 isEqual:v8];

                  if (v40)
                  {

                    goto LABEL_36;
                  }
                }
                uint64_t v36 = [v34 countByEnumeratingWithState:&v96 objects:v115 count:16];
                if (v36) {
                  continue;
                }
                break;
              }
            }

            v41 = [MEMORY[0x1E4F30928] managedValueWithValue:v8 andOwner:self];
            [v34 addObject:v41];

            v95.receiver = self;
            v95.super_class = (Class)IKJSPlayer;
            [(IKJSEventListenerObject *)&v95 addEventListener:v32 :v8 :v78];
LABEL_36:

            ++v29;
          }
          while (v29 != v83);
          uint64_t v83 = [obj countByEnumeratingWithState:&v100 objects:v116 count:16];
        }
        while (v83);
        id v7 = v71;
        objc_super v27 = obj;
        id v9 = v78;
        if (v73)
        {
          v42 = self->_bridge;
          v113 = @"boundaries";
          v43 = [(NSMutableDictionary *)self->_boundaryListeners allKeys];
          v114 = v43;
          v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
          [(IKAppPlayerBridge *)v42 startObservingEvent:v71 extraInfo:v44];

          objc_super v27 = obj;
        }
      }
    }
  }

LABEL_53:
}

- (void)removeEventListener:(id)a3 :(id)a4
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v85 = self;
  if ([v6 isEqualToString:@"timeDidChange"])
  {
    id v70 = v6;
    char v73 = [MEMORY[0x1E4F1CA48] array];
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    obuint64_t j = [(NSMutableDictionary *)self->_timeListeners allKeys];
    uint64_t v82 = [obj countByEnumeratingWithState:&v121 objects:v139 count:16];
    if (v82)
    {
      uint64_t v79 = *(void *)v122;
      do
      {
        for (uint64_t i = 0; i != v82; ++i)
        {
          if (*(void *)v122 != v79) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v121 + 1) + 8 * i);
          uint64_t v10 = [(NSMutableDictionary *)self->_timeListeners objectForKey:v9];
          long long v117 = 0u;
          long long v118 = 0u;
          long long v119 = 0u;
          long long v120 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v117 objects:v138 count:16];
          id v13 = v11;
          if (v12)
          {
            uint64_t v14 = v12;
            uint64_t v15 = *(void *)v118;
LABEL_9:
            uint64_t v16 = 0;
            while (1)
            {
              if (*(void *)v118 != v15) {
                objc_enumerationMutation(v11);
              }
              uint64_t v17 = *(void **)(*((void *)&v117 + 1) + 8 * v16);
              id v18 = [v17 value];
              char v19 = [v18 isEqual:v7];

              if (v19) {
                break;
              }
              if (v14 == ++v16)
              {
                uint64_t v14 = [v11 countByEnumeratingWithState:&v117 objects:v138 count:16];
                if (v14) {
                  goto LABEL_9;
                }
                id v13 = v11;
                self = v85;
                goto LABEL_20;
              }
            }
            id v13 = v17;

            self = v85;
            if (!v13) {
              goto LABEL_21;
            }
            [v11 removeObject:v13];
            uint64_t v20 = objc_msgSend(@"timeDidChange", "stringByAppendingFormat:", @"_%lu", objc_msgSend(v9, "unsignedIntegerValue"));
            v116.receiver = v85;
            v116.super_class = (Class)IKJSPlayer;
            [(IKJSEventListenerObject *)&v116 removeEventListener:v20 :v7];
            if (![v11 count]) {
              [v73 addObject:v9];
            }
          }
LABEL_20:

LABEL_21:
        }
        uint64_t v82 = [obj countByEnumeratingWithState:&v121 objects:v139 count:16];
      }
      while (v82);
    }

    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    uint64_t v21 = v73;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v112 objects:v137 count:16];
    id v6 = v70;
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v113;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v113 != v24) {
            objc_enumerationMutation(v21);
          }
          [(NSMutableDictionary *)self->_timeListeners removeObjectForKey:*(void *)(*((void *)&v112 + 1) + 8 * j)];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v112 objects:v137 count:16];
      }
      while (v23);
    }

    if (![v21 count]) {
      goto LABEL_103;
    }
    uint64_t v26 = [(NSMutableDictionary *)self->_timeListeners count];
    bridge = self->_bridge;
    if (v26)
    {
      v135 = @"intervals";
      uint64_t v28 = [(NSMutableDictionary *)self->_timeListeners allKeys];
      v136 = v28;
      uint64_t v29 = (void *)MEMORY[0x1E4F1C9E8];
      objc_super v30 = &v136;
      uint64_t v31 = &v135;
LABEL_67:
      v49 = [v29 dictionaryWithObjects:v30 forKeys:v31 count:1];
      [(IKAppPlayerBridge *)bridge startObservingEvent:v6 extraInfo:v49];

LABEL_103:
      goto LABEL_104;
    }
    goto LABEL_99;
  }
  if ([v6 isEqualToString:@"timeBoundaryDidCross"])
  {
    id v71 = v6;
    char v74 = [MEMORY[0x1E4F1CA48] array];
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id obja = [(NSMutableDictionary *)self->_boundaryListeners allKeys];
    uint64_t v83 = [obja countByEnumeratingWithState:&v108 objects:v134 count:16];
    if (v83)
    {
      uint64_t v80 = *(void *)v109;
      do
      {
        for (uint64_t k = 0; k != v83; ++k)
        {
          if (*(void *)v109 != v80) {
            objc_enumerationMutation(obja);
          }
          v33 = *(void **)(*((void *)&v108 + 1) + 8 * k);
          id v34 = [(NSMutableDictionary *)self->_boundaryListeners objectForKey:v33];
          long long v104 = 0u;
          long long v105 = 0u;
          long long v106 = 0u;
          long long v107 = 0u;
          id v35 = v34;
          id v36 = (id)[v35 countByEnumeratingWithState:&v104 objects:v133 count:16];
          if (v36)
          {
            uint64_t v37 = *(void *)v105;
LABEL_41:
            uint64_t v38 = 0;
            while (1)
            {
              if (*(void *)v105 != v37) {
                objc_enumerationMutation(v35);
              }
              v39 = *(void **)(*((void *)&v104 + 1) + 8 * v38);
              char v40 = [v39 value];
              char v41 = [v40 isEqual:v7];

              if (v41) {
                break;
              }
              if (v36 == (id)++v38)
              {
                id v36 = (id)[v35 countByEnumeratingWithState:&v104 objects:v133 count:16];
                if (v36) {
                  goto LABEL_41;
                }
                v42 = v35;
                self = v85;
                goto LABEL_51;
              }
            }
            id v36 = v39;

            if (v36)
            {
              [v35 removeObject:v36];
              [v33 doubleValue];
              v42 = objc_msgSend(@"timeBoundaryDidCross", "stringByAppendingFormat:", @"_%.3f", v43);
              self = v85;
              v103.receiver = v85;
              v103.super_class = (Class)IKJSPlayer;
              [(IKJSEventListenerObject *)&v103 removeEventListener:v42 :v7];
              goto LABEL_51;
            }
            self = v85;
          }
          else
          {
            v42 = v35;
LABEL_51:
          }
          if (![v35 count]) {
            [v74 addObject:v33];
          }
        }
        uint64_t v83 = [obja countByEnumeratingWithState:&v108 objects:v134 count:16];
      }
      while (v83);
    }

    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    uint64_t v21 = v74;
    uint64_t v44 = [v21 countByEnumeratingWithState:&v99 objects:v132 count:16];
    id v6 = v71;
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v100;
      do
      {
        for (uint64_t m = 0; m != v45; ++m)
        {
          if (*(void *)v100 != v46) {
            objc_enumerationMutation(v21);
          }
          [(NSMutableDictionary *)self->_boundaryListeners removeObjectForKey:*(void *)(*((void *)&v99 + 1) + 8 * m)];
        }
        uint64_t v45 = [v21 countByEnumeratingWithState:&v99 objects:v132 count:16];
      }
      while (v45);
    }

    if (![v21 count]) {
      goto LABEL_103;
    }
    uint64_t v48 = [(NSMutableDictionary *)self->_boundaryListeners count];
    bridge = self->_bridge;
    if (v48)
    {
      v130 = @"boundaries";
      uint64_t v28 = [(NSMutableDictionary *)self->_boundaryListeners allKeys];
      v131 = v28;
      uint64_t v29 = (void *)MEMORY[0x1E4F1C9E8];
      objc_super v30 = &v131;
      uint64_t v31 = &v130;
      goto LABEL_67;
    }
LABEL_99:
    [(IKAppPlayerBridge *)bridge stopObservingEvent:v6];
    goto LABEL_103;
  }
  if ([v6 isEqualToString:@"timedMetadata"])
  {
    id v72 = v6;
    v75 = [MEMORY[0x1E4F1CA48] array];
    [(NSMutableDictionary *)self->_timedMetadataListeners allKeys];
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id objb = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v84 = [objb countByEnumeratingWithState:&v95 objects:v129 count:16];
    if (v84)
    {
      uint64_t v81 = *(void *)v96;
      do
      {
        for (uint64_t n = 0; n != v84; ++n)
        {
          if (*(void *)v96 != v81) {
            objc_enumerationMutation(objb);
          }
          uint64_t v51 = *(void *)(*((void *)&v95 + 1) + 8 * n);
          v52 = [(NSMutableDictionary *)self->_timedMetadataListeners objectForKey:v51];
          long long v91 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          id v53 = v52;
          uint64_t v54 = [v53 countByEnumeratingWithState:&v91 objects:v128 count:16];
          if (v54)
          {
            uint64_t v55 = v54;
            uint64_t v56 = *(void *)v92;
            while (2)
            {
              for (iuint64_t i = 0; ii != v55; ++ii)
              {
                if (*(void *)v92 != v56) {
                  objc_enumerationMutation(v53);
                }
                v58 = *(void **)(*((void *)&v91 + 1) + 8 * ii);
                v59 = [v58 value];
                char v60 = [v59 isEqual:v7];

                if (v60)
                {
                  id v61 = v58;

                  if (v61) {
                    [v53 removeObject:v61];
                  }
                  goto LABEL_85;
                }
              }
              uint64_t v55 = [v53 countByEnumeratingWithState:&v91 objects:v128 count:16];
              if (v55) {
                continue;
              }
              break;
            }
          }

          id v61 = 0;
LABEL_85:
          self = v85;
          if (![v53 count]) {
            [v75 addObject:v51];
          }
        }
        uint64_t v84 = [objb countByEnumeratingWithState:&v95 objects:v129 count:16];
      }
      while (v84);
    }
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    uint64_t v21 = v75;
    uint64_t v62 = [v21 countByEnumeratingWithState:&v87 objects:v127 count:16];
    id v6 = v72;
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v88;
      do
      {
        for (juint64_t j = 0; jj != v63; ++jj)
        {
          if (*(void *)v88 != v64) {
            objc_enumerationMutation(v21);
          }
          [(NSMutableDictionary *)self->_timedMetadataListeners removeObjectForKey:*(void *)(*((void *)&v87 + 1) + 8 * jj)];
        }
        uint64_t v63 = [v21 countByEnumeratingWithState:&v87 objects:v127 count:16];
      }
      while (v63);
    }

    if ([v21 count])
    {
      uint64_t v66 = [(NSMutableDictionary *)self->_timedMetadataListeners count];
      v67 = self->_bridge;
      if (v66)
      {
        v125 = @"keys";
        v68 = [(NSMutableDictionary *)self->_timedMetadataListeners allKeys];
        v126 = v68;
        v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v126 forKeys:&v125 count:1];
        [(IKAppPlayerBridge *)v67 startObservingEvent:v72 extraInfo:v69];
      }
      else
      {
        [(IKAppPlayerBridge *)self->_bridge stopObservingEvent:v72];
      }
    }

    goto LABEL_103;
  }
  v86.receiver = self;
  v86.super_class = (Class)IKJSPlayer;
  [(IKJSEventListenerObject *)&v86 removeEventListener:v6 :v7];
  [(IKAppPlayerBridge *)self->_bridge stopObservingEvent:v6];
LABEL_104:
}

- (void)_addManagedReference
{
  if (!self->_holdingSelfReference)
  {
    self->_holdingSelfReference = 1;
    objc_super v3 = [(IKJSObject *)self appContext];
    id v8 = [v3 jsContext];

    v4 = [v8 virtualMachine];
    v5 = [(IKJSObject *)self appContext];
    id v6 = [v5 jsContext];
    id v7 = [v6 objectForKeyedSubscript:@"App"];
    [v4 addManagedReference:self withOwner:v7];
  }
}

- (void)_removeManagedReference
{
  if (self->_holdingSelfReference)
  {
    self->_holdingSelfReference = 0;
    objc_super v3 = [(IKJSObject *)self appContext];
    id v8 = [v3 jsContext];

    v4 = [v8 virtualMachine];
    v5 = [(IKJSObject *)self appContext];
    id v6 = [v5 jsContext];
    id v7 = [v6 objectForKeyedSubscript:@"App"];
    [v4 removeManagedReference:self withOwner:v7];
  }
}

- (BOOL)_timedMetadataDidChangeWithExtraInfo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  timedMetadataListeners = self->_timedMetadataListeners;
  id v6 = [v4 objectForKeyedSubscript:@"key"];
  id v7 = [(NSMutableDictionary *)timedMetadataListeners objectForKey:v6];
  id v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = [(NSMutableDictionary *)self->_timedMetadataListeners objectForKey:@"all"];
  uint64_t v21 = (void *)v9;
  if (v9)
  {
    uint64_t v10 = v9;
    if (!v8)
    {
      id v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", 1, v9);
    }
    objc_msgSend(v8, "unionSet:", v10, v21);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "value", v21);
        uint64_t v16 = [(IKJSEventListenerObject *)self _eventInformationForType:@"timedMetadata" extraInfo:v4];
        objc_super v27 = v16;
        uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
        id v18 = (id)[v15 callWithArguments:v17];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v12);
  }

  BOOL v19 = [obj count] != 0;
  return v19;
}

- (IKAppPlayerBridge)bridge
{
  return self->_bridge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridge, 0);
  objc_storeStrong((id *)&self->_boundaryListeners, 0);
  objc_storeStrong((id *)&self->_timeListeners, 0);
  objc_storeStrong((id *)&self->_timedMetadataListeners, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
}

@end