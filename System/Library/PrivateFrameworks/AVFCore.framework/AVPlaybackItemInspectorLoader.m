@interface AVPlaybackItemInspectorLoader
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- (AVPlaybackItemInspectorLoader)initWithURL:(id)a3 playbackItem:(OpaqueFigPlaybackItem *)a4 trackIDs:(id)a5 dynamicBehavior:(BOOL)a6;
- (BOOL)_inspectionRequiresAFormatReader;
- (BOOL)isEqual:(id)a3;
- (Class)_classForTrackInspectors;
- (OpaqueFigFormatReader)_copyFormatReaderFromFigObjectWithFigErrorCode:(int *)a3;
- (OpaqueFigPlaybackItem)_playbackItem;
- (id)_dictionaryOfSpecialGettersForKeyValueStatus;
- (id)_loadValuesUsingDefaultLoadingMethodWhileMutexLockedForKeys:(id)a3;
- (id)_playbackItemPropertiesForKeys:(id)a3;
- (id)assetInspector;
- (unint64_t)hash;
- (void)_addFigObjectNotifications;
- (void)_removeFigObjectNotifications;
- (void)cancelLoading;
- (void)dealloc;
@end

@implementation AVPlaybackItemInspectorLoader

- (AVPlaybackItemInspectorLoader)initWithURL:(id)a3 playbackItem:(OpaqueFigPlaybackItem *)a4 trackIDs:(id)a5 dynamicBehavior:(BOOL)a6
{
  v13.receiver = self;
  v13.super_class = (Class)AVPlaybackItemInspectorLoader;
  v9 = [(AVAssetMakeReadyForInspectionLoader *)&v13 initWithURL:a3];
  v10 = v9;
  if (v9)
  {
    if (a4)
    {
      v9->_playbackItem = (OpaqueFigPlaybackItem *)CFRetain(a4);
      v10->_trackIDs = (NSArray *)a5;
      v10->_shouldCacheDuration = !a6;
      v11 = (_OWORD *)MEMORY[0x1E4F1F9F8];
      *(void *)&v10->_cachedDuration.flags = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      *(_OWORD *)(&v10->_shouldCacheDuration + 4) = *v11;
      [(AVPlaybackItemInspectorLoader *)v10 _addFigObjectNotifications];
    }
    else
    {

      return 0;
    }
  }
  return v10;
}

- (void)_addFigObjectNotifications
{
  id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  v4 = [(AVAssetInspectorLoader *)self _weakReference];
  CFRetain(v4);
  [v3 addListenerWithWeakReference:v4 callback:handlePlaybackItemNotification name:*MEMORY[0x1E4F33640] object:self->_playbackItem flags:0];
  uint64_t v5 = *MEMORY[0x1E4F33590];
  playbackItem = self->_playbackItem;
  [v3 addListenerWithWeakReference:v4 callback:handlePlaybackItemNotification name:v5 object:playbackItem flags:0];
}

- (void)_removeFigObjectNotifications
{
  if (self->_playbackItem)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    v4 = [(AVAssetInspectorLoader *)self _weakReference];
    [v3 removeListenerWithWeakReference:v4 callback:handlePlaybackItemNotification name:*MEMORY[0x1E4F33640] object:self->_playbackItem];
    [v3 removeListenerWithWeakReference:v4 callback:handlePlaybackItemNotification name:*MEMORY[0x1E4F33590] object:self->_playbackItem];
    CFRelease(v4);
  }
}

- (void)dealloc
{
  [(AVPlaybackItemInspectorLoader *)self _removeFigObjectNotifications];

  playbackItem = self->_playbackItem;
  if (playbackItem) {
    CFRelease(playbackItem);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlaybackItemInspectorLoader;
  [(AVAssetMakeReadyForInspectionLoader *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(AVPlaybackItemInspectorLoader *)self _playbackItem];
  uint64_t v6 = [a3 _playbackItem];
  if (v5 == (OpaqueFigPlaybackItem *)v6) {
    return 1;
  }
  v7 = (const void *)v6;
  BOOL result = 0;
  if (v5)
  {
    if (v7) {
      return CFEqual(v5, v7) != 0;
    }
  }
  return result;
}

- (unint64_t)hash
{
  id v3 = [(AVPlaybackItemInspectorLoader *)self _playbackItem];
  if (v3)
  {
    return CFHash(v3);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AVPlaybackItemInspectorLoader;
    return [(AVPlaybackItemInspectorLoader *)&v5 hash];
  }
}

- (id)assetInspector
{
  id result = self->super._assetInspector;
  if (!result)
  {
    id result = [[AVPlaybackItemInspector alloc] initWithPlaybackItem:self->_playbackItem trackIDs:self->_trackIDs];
    self->super._assetInspector = (AVAssetInspector *)result;
  }
  return result;
}

- (void)cancelLoading
{
  [(AVPlaybackItemInspectorLoader *)self _removeFigObjectNotifications];
  playbackItem = self->_playbackItem;
  if (playbackItem)
  {
    CFRelease(playbackItem);
    self->_playbackItem = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlaybackItemInspectorLoader;
  [(AVAssetMakeReadyForInspectionLoader *)&v4 cancelLoading];
}

- (OpaqueFigPlaybackItem)_playbackItem
{
  return self->_playbackItem;
}

- (Class)_classForTrackInspectors
{
  return (Class)objc_opt_class();
}

- (OpaqueFigFormatReader)_copyFormatReaderFromFigObjectWithFigErrorCode:(int *)a3
{
  v10 = 0;
  playbackItem = self->_playbackItem;
  if (playbackItem)
  {
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    v8 = *(uint64_t (**)(OpaqueFigPlaybackItem *, OpaqueFigFormatReader **))(v6 + 120);
    if (v8) {
      int v7 = v8(playbackItem, &v10);
    }
    else {
      int v7 = -12782;
    }
  }
  else
  {
    int v7 = 0;
  }
  if (a3) {
    *a3 = v7;
  }
  return v10;
}

- (BOOL)_inspectionRequiresAFormatReader
{
  return 0;
}

- (id)_dictionaryOfSpecialGettersForKeyValueStatus
{
  if (getDictionaryOfSpecialPlaybackItemGettersForKeyValueStatus_onceToken != -1) {
    dispatch_once(&getDictionaryOfSpecialPlaybackItemGettersForKeyValueStatus_onceToken, &__block_literal_global_321);
  }
  return (id)getDictionaryOfSpecialPlaybackItemGettersForKeyValueStatus_sSpecialPlaybackItemGettersForKeyValueStatus;
}

- (id)_playbackItemPropertiesForKeys:(id)a3
{
  uint64_t v3 = objc_msgSend(0, "objectsForKeys:notFoundMarker:", a3, objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
  objc_super v4 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:v3];
  objc_msgSend(v4, "removeObject:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
  id result = (id)[v4 count];
  if (result)
  {
    return (id)[v4 allObjects];
  }
  return result;
}

- (id)_loadValuesUsingDefaultLoadingMethodWhileMutexLockedForKeys:(id)a3
{
  id v5 = -[AVPlaybackItemInspectorLoader _playbackItemPropertiesForKeys:](self, "_playbackItemPropertiesForKeys:");
  char v14 = 0;
  playbackItem = self->_playbackItem;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = *(uint64_t (**)(OpaqueFigPlaybackItem *, id, char *))(v8 + 48);
  if (v9)
  {
    uint64_t v10 = v9(playbackItem, v5, &v14);
    uint64_t v11 = 3;
    if (!v10) {
      uint64_t v11 = 1;
    }
    if (v14) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = v11;
    }
  }
  else
  {
    uint64_t v10 = 4294954514;
    uint64_t v12 = 3;
  }
  [(AVAssetMakeReadyForInspectionLoader *)self _updateStatusWhileMutexLocked:v12 figErrorCode:v10];
  if (v14) {
    return a3;
  }
  else {
    return 0;
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  uint64_t v3 = self;
  if (LOBYTE(self[3].var3) && (self[4].var1 & 1) != 0)
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[3].var3 + 4);
    retstr->var3 = *(void *)&self[4].var2;
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
    self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)self assetInspector];
    if (self)
    {
      self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)self duration];
    }
    else
    {
      retstr->var0 = 0;
      *(void *)&retstr->var1 = 0;
      retstr->var3 = 0;
    }
    if (LOBYTE(v3[3].var3))
    {
      *(_OWORD *)((char *)&v3[3].var3 + 4) = *(_OWORD *)&retstr->var0;
      *(void *)&v3[4].var2 = retstr->var3;
    }
  }
  return self;
}

@end