@interface AVPlaybackItemInspector
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- (AVPlaybackItemInspector)initWithPlaybackItem:(OpaqueFigPlaybackItem *)a3 trackIDs:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)providesPreciseDurationAndTiming;
- (CGSize)naturalSize;
- (OpaqueFigPlaybackItem)_playbackItem;
- (id)availableMetadataFormats;
- (id)commonMetadata;
- (id)compatibleTrackForCompositionTrack:(id)a3;
- (id)lyrics;
- (id)metadataForFormat:(id)a3;
- (id)trackIDs;
- (int64_t)trackCount;
- (unint64_t)hash;
- (void)_setPlaybackItem:(OpaqueFigPlaybackItem *)a3;
- (void)_valueAsCFTypeForProperty:(__CFString *)a3;
- (void)dealloc;
@end

@implementation AVPlaybackItemInspector

- (AVPlaybackItemInspector)initWithPlaybackItem:(OpaqueFigPlaybackItem *)a3 trackIDs:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVPlaybackItemInspector;
  v6 = [(AVPlaybackItemInspector *)&v9 init];
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      [(AVPlaybackItemInspector *)v6 _setPlaybackItem:a3];
      v7->_trackIDs = (NSArray *)a4;
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  [(AVPlaybackItemInspector *)self _setPlaybackItem:0];
  v3.receiver = self;
  v3.super_class = (Class)AVPlaybackItemInspector;
  [(AVPlaybackItemInspector *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = [(AVPlaybackItemInspector *)self _playbackItem];
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
  objc_super v3 = [(AVPlaybackItemInspector *)self _playbackItem];
  if (v3)
  {
    return CFHash(v3);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AVPlaybackItemInspector;
    return [(AVPlaybackItemInspector *)&v5 hash];
  }
}

- (void)_setPlaybackItem:(OpaqueFigPlaybackItem *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  playbackItem = self->_playbackItem;
  if (playbackItem) {
    CFRelease(playbackItem);
  }
  self->_playbackItem = a3;
}

- (OpaqueFigPlaybackItem)_playbackItem
{
  return self->_playbackItem;
}

- (void)_valueAsCFTypeForProperty:(__CFString *)a3
{
  objc_super v9 = 0;
  BOOL result = [(AVPlaybackItemInspector *)self _playbackItem];
  if (result)
  {
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    v8 = *(void (**)(uint64_t, __CFString *, void, void **))(v7 + 48);
    if (v8)
    {
      v8(FigBaseObject, a3, *MEMORY[0x1E4F1CF80], &v9);
      return v9;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA48];
  BOOL result = [(AVPlaybackItemInspector *)self _playbackItem];
  if (result)
  {
    objc_super v5 = result;
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v8 = *(void *)(VTable + 16);
    BOOL result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(VTable + 16);
    uint64_t v7 = v8;
    uint64_t v9 = v8 ? v7 : 0;
    v10 = *(uint64_t (**)($3CC8671D27C23BF42ADDB32F2B5E48AE *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(v9 + 16);
    if (v10)
    {
      return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)v10(v5, retstr);
    }
  }
  return result;
}

- (CGSize)naturalSize
{
  v2 = [(AVPlaybackItemInspector *)self _playbackItem];
  uint64_t v10 = 0;
  double v3 = 0.0;
  if (v2
    && ((v4 = v2, (v5 = *(void *)(CMBaseObjectGetVTable() + 16)) == 0) ? (uint64_t v6 = 0) : (uint64_t v6 = v5),
        (uint64_t v7 = *(void (**)(OpaqueFigPlaybackItem *, char *, uint64_t *, double))(v6 + 8)) != 0))
  {
    v7(v4, (char *)&v10 + 4, &v10, 0.0);
    double v8 = *((float *)&v10 + 1);
    double v3 = *(float *)&v10;
  }
  else
  {
    double v8 = 0.0;
  }
  double v9 = v3;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)providesPreciseDurationAndTiming
{
  return 0;
}

- (int64_t)trackCount
{
  if (self->_trackIDs) {
    trackIDs = self->_trackIDs;
  }
  else {
    trackIDs = [(AVFigObjectInspector *)self _arrayForProperty:*MEMORY[0x1E4F33C08]];
  }
  return [(NSArray *)trackIDs count];
}

- (id)trackIDs
{
  return self->_trackIDs;
}

- (id)lyrics
{
  return [(AVFigObjectInspector *)self _stringForProperty:*MEMORY[0x1E4F33A48]];
}

- (id)commonMetadata
{
  return (id)[MEMORY[0x1E4F1C978] array];
}

- (id)availableMetadataFormats
{
  return (id)[MEMORY[0x1E4F1C978] array];
}

- (id)metadataForFormat:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "array", a3);
}

- (id)compatibleTrackForCompositionTrack:(id)a3
{
  return 0;
}

@end