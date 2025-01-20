@interface AVQueuePlayer
+ (AVQueuePlayer)queuePlayerWithItems:(NSArray *)items;
+ (void)initialize;
- (AVQueuePlayer)init;
- (AVQueuePlayer)initWithItems:(NSArray *)items;
- (BOOL)canInsertItem:(AVPlayerItem *)item afterItem:(AVPlayerItem *)afterItem;
- (BOOL)canOverlapPlaybackFromPlayerItem:(id)a3 toPlayerItem:(id)a4;
- (int64_t)_defaultActionAtItemEnd;
- (void)_canOverlapPlaybackConditionsChanged;
- (void)dealloc;
- (void)insertItem:(AVPlayerItem *)item afterItem:(AVPlayerItem *)afterItem;
- (void)setActionAtItemEnd:(int64_t)a3;
@end

@implementation AVQueuePlayer

- (AVQueuePlayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVQueuePlayer;
  v2 = [(AVPlayer *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(AVQueuePlayerInternal);
    v2->_queuePlayer = v3;
    if (v3)
    {
      [(AVQueuePlayer *)v2 setActionAtItemEnd:0];
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)insertItem:(AVPlayerItem *)item afterItem:(AVPlayerItem *)afterItem
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Item must be a non-nil instance of AVPlayerItem.", v8, v9, v10, v11, v12, v14), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  [(AVPlayer *)self _insertItem:item afterItem:afterItem];
}

+ (void)initialize
{
}

- (void)setActionAtItemEnd:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AVQueuePlayer;
  [(AVPlayer *)&v3 _setActionAtItemEnd:a3 allowingAdvance:1];
}

- (void)_canOverlapPlaybackConditionsChanged
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"AVQueuePlayerCanOverlapPlaybackConditionsDidChangeNotification" object:self];
}

+ (AVQueuePlayer)queuePlayerWithItems:(NSArray *)items
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithItems:items];
  return (AVQueuePlayer *)v3;
}

- (AVQueuePlayer)initWithItems:(NSArray *)items
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = [(AVQueuePlayer *)self init];
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = [(NSArray *)items countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(items);
          }
          [(AVQueuePlayer *)v4 insertItem:*(void *)(*((void *)&v10 + 1) + 8 * v8++) afterItem:0];
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)items countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  return v4;
}

- (void)dealloc
{
  queuePlayer = self->_queuePlayer;
  if (queuePlayer) {

  }
  v4.receiver = self;
  v4.super_class = (Class)AVQueuePlayer;
  [(AVPlayer *)&v4 dealloc];
}

- (int64_t)_defaultActionAtItemEnd
{
  return 0;
}

- (BOOL)canInsertItem:(AVPlayerItem *)item afterItem:(AVPlayerItem *)afterItem
{
  id v6 = [(AVPlayer *)self _items];
  char v7 = [v6 containsObject:item];
  if (afterItem) {
    char v8 = [v6 containsObject:afterItem];
  }
  else {
    char v8 = 1;
  }
  return v8 & ~v7;
}

- (BOOL)canOverlapPlaybackFromPlayerItem:(id)a3 toPlayerItem:(id)a4
{
  if ([(AVPlayer *)self actionAtItemEnd]
    || (char v7 = [(AVPlayer *)self multichannelAudioStrategy],
        [(NSString *)v7 isEqualToString:@"PreferExclusivePassthrough"])
    || [(NSString *)v7 isEqualToString:@"PreferAC3ViaExclusivePassthrough"]
    || [(AVPlayer *)self isExternalPlaybackActive]
    && [(AVPlayer *)self externalPlaybackType] == 1
    || [(AVPlayer *)self _isBufferedAirPlayActive]
    || (uint64_t v9 = (void *)[a3 asset],
        long long v10 = (void *)[a4 asset],
        ![(AVPlayer *)self _supportsAdvanceTimeForOverlappedPlayback])
    && (_os_feature_enabled_impl() & 1) == 0
    && (([v9 _isStreaming] & 1) != 0 || (objc_msgSend(v10, "_isStreaming") & 1) != 0)
    || ([v9 _isStreaming] & 1) == 0 && objc_msgSend((id)objc_msgSend(v9, "tracks"), "count") != 1
    || ([v10 _isStreaming] & 1) == 0 && objc_msgSend((id)objc_msgSend(v10, "tracks"), "count") != 1)
  {
    LOBYTE(v8) = 0;
  }
  else if (([v9 _isStreaming] & 1) != 0 {
         || (int v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "tracks"), "firstObject"), "mediaType"), "isEqual:", @"soun")) != 0)
  }
  {
    if ([v10 _isStreaming])
    {
      LOBYTE(v8) = 1;
    }
    else
    {
      long long v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "tracks"), "firstObject"), "mediaType");
      LOBYTE(v8) = [v11 isEqual:@"soun"];
    }
  }
  return v8;
}

@end