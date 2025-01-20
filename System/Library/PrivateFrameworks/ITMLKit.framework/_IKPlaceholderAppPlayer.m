@interface _IKPlaceholderAppPlayer
- (BOOL)interactiveOverlayDismissable;
- (BOOL)muted;
- (BOOL)showsResumeMenu;
- (IKAppDocument)interactiveOverlayDocument;
- (IKAppDocument)overlayDocument;
- (IKAppMediaItem)currentMediaItem;
- (IKAppMediaItem)nextMediaItem;
- (IKAppMediaItem)previousMediaItem;
- (IKAppPlayerBridge)bridge;
- (IKAppPlaylist)playlist;
- (NSArray)currentMediaItemAccessLogs;
- (NSArray)currentMediaItemErrorLogs;
- (NSDate)currentMediaItemDate;
- (NSDictionary)contextMenuData;
- (NSDictionary)userInfo;
- (NSNumber)currentMediaItemDuration;
- (double)scanRate;
- (int64_t)state;
- (void)setContextMenuData:(id)a3;
- (void)setInteractiveOverlayDismissable:(BOOL)a3;
- (void)setInteractiveOverlayDocument:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setOverlayDocument:(id)a3;
- (void)setPlaylist:(id)a3;
- (void)setShowsResumeMenu:(BOOL)a3;
- (void)setUserInfo:(id)a3;
- (void)startObservingEvent:(id)a3 extraInfo:(id)a4;
- (void)stopObservingEvent:(id)a3;
- (void)transferValuesToAppPlayer:(id)a3;
@end

@implementation _IKPlaceholderAppPlayer

- (void)transferValuesToAppPlayer:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_IKPlaceholderAppPlayer *)self playlist];
  [v4 setPlaylist:v5];

  objc_msgSend(v4, "setMuted:", -[_IKPlaceholderAppPlayer muted](self, "muted"));
  objc_msgSend(v4, "setShowsResumeMenu:", -[_IKPlaceholderAppPlayer showsResumeMenu](self, "showsResumeMenu"));
  v6 = [(_IKPlaceholderAppPlayer *)self overlayDocument];
  [v4 setOverlayDocument:v6];

  v7 = [(_IKPlaceholderAppPlayer *)self interactiveOverlayDocument];
  [v4 setInteractiveOverlayDocument:v7];

  objc_msgSend(v4, "setInteractiveOverlayDismissable:", -[_IKPlaceholderAppPlayer interactiveOverlayDismissable](self, "interactiveOverlayDismissable"));
  v8 = [(_IKPlaceholderAppPlayer *)self contextMenuData];
  [v4 setContextMenuData:v8];

  v9 = [(_IKPlaceholderAppPlayer *)self userInfo];
  [v4 setUserInfo:v9];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v10 = [(NSMutableDictionary *)self->_eventExtraInfoByEvent allKeys];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v16 = [(NSMutableDictionary *)self->_eventExtraInfoByEvent objectForKeyedSubscript:v15];
        v17 = [MEMORY[0x1E4F1CA98] null];
        if (v16 == v17) {
          v18 = 0;
        }
        else {
          v18 = v16;
        }
        [v4 startObservingEvent:v15 extraInfo:v18];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)startObservingEvent:(id)a3 extraInfo:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = v6;
  if (self->_eventExtraInfoByEvent)
  {
    if (v6)
    {
LABEL_3:
      [(NSMutableDictionary *)self->_eventExtraInfoByEvent setObject:v7 forKeyedSubscript:v11];
      goto LABEL_6;
    }
  }
  else
  {
    v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    eventExtraInfoByEvent = self->_eventExtraInfoByEvent;
    self->_eventExtraInfoByEvent = v8;

    if (v7) {
      goto LABEL_3;
    }
  }
  v10 = [MEMORY[0x1E4F1CA98] null];
  [(NSMutableDictionary *)self->_eventExtraInfoByEvent setObject:v10 forKeyedSubscript:v11];

LABEL_6:
}

- (void)stopObservingEvent:(id)a3
{
}

- (IKAppPlayerBridge)bridge
{
  return self->bridge;
}

- (int64_t)state
{
  return self->state;
}

- (IKAppPlaylist)playlist
{
  return self->playlist;
}

- (void)setPlaylist:(id)a3
{
}

- (NSNumber)currentMediaItemDuration
{
  return self->currentMediaItemDuration;
}

- (NSDate)currentMediaItemDate
{
  return self->currentMediaItemDate;
}

- (IKAppMediaItem)currentMediaItem
{
  return self->currentMediaItem;
}

- (double)scanRate
{
  return self->scanRate;
}

- (BOOL)muted
{
  return self->muted;
}

- (void)setMuted:(BOOL)a3
{
  self->muted = a3;
}

- (BOOL)showsResumeMenu
{
  return self->showsResumeMenu;
}

- (void)setShowsResumeMenu:(BOOL)a3
{
  self->showsResumeMenu = a3;
}

- (IKAppMediaItem)nextMediaItem
{
  return self->nextMediaItem;
}

- (IKAppMediaItem)previousMediaItem
{
  return self->previousMediaItem;
}

- (IKAppDocument)overlayDocument
{
  return self->overlayDocument;
}

- (void)setOverlayDocument:(id)a3
{
}

- (IKAppDocument)interactiveOverlayDocument
{
  return self->interactiveOverlayDocument;
}

- (void)setInteractiveOverlayDocument:(id)a3
{
}

- (BOOL)interactiveOverlayDismissable
{
  return self->interactiveOverlayDismissable;
}

- (void)setInteractiveOverlayDismissable:(BOOL)a3
{
  self->interactiveOverlayDismissable = a3;
}

- (NSArray)currentMediaItemAccessLogs
{
  return self->currentMediaItemAccessLogs;
}

- (NSArray)currentMediaItemErrorLogs
{
  return self->currentMediaItemErrorLogs;
}

- (NSDictionary)contextMenuData
{
  return self->contextMenuData;
}

- (void)setContextMenuData:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->userInfo, 0);
  objc_storeStrong((id *)&self->contextMenuData, 0);
  objc_storeStrong((id *)&self->currentMediaItemErrorLogs, 0);
  objc_storeStrong((id *)&self->currentMediaItemAccessLogs, 0);
  objc_storeStrong((id *)&self->interactiveOverlayDocument, 0);
  objc_storeStrong((id *)&self->overlayDocument, 0);
  objc_storeStrong((id *)&self->previousMediaItem, 0);
  objc_storeStrong((id *)&self->nextMediaItem, 0);
  objc_storeStrong((id *)&self->currentMediaItem, 0);
  objc_storeStrong((id *)&self->currentMediaItemDate, 0);
  objc_storeStrong((id *)&self->currentMediaItemDuration, 0);
  objc_storeStrong((id *)&self->playlist, 0);
  objc_storeStrong((id *)&self->bridge, 0);
  objc_storeStrong((id *)&self->_eventExtraInfoByEvent, 0);
}

@end