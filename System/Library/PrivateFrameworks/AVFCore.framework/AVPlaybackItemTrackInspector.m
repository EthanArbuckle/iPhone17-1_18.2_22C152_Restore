@interface AVPlaybackItemTrackInspector
- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)samplePresentationTimeForTrackTime:(SEL)a3;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (CGAffineTransform)preferredTransform;
- (CGSize)dimensions;
- (CGSize)naturalSize;
- (OpaqueFigPlaybackItem)_playbackItem;
- (float)estimatedDataRate;
- (float)peakDataRate;
- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5;
- (id)asset;
- (id)formatDescriptions;
- (id)mediaType;
- (int)trackID;
- (unint64_t)hash;
- (unsigned)_figMediaType;
- (void)_valueAsCFTypeForProperty:(__CFString *)a3;
- (void)dealloc;
@end

@implementation AVPlaybackItemTrackInspector

- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5
{
  int v6 = a4;
  int valuePtr = a4;
  v20.receiver = self;
  v20.super_class = (Class)AVPlaybackItemTrackInspector;
  v8 = -[AVAssetTrackInspector _initWithAsset:trackID:trackIndex:](&v20, sel__initWithAsset_trackID_trackIndex_);
  if (v8)
  {
    uint64_t v9 = [a3 _playbackItem];
    if (v9)
    {
      v10 = (const void *)v9;
      if ((a5 & 0x8000000000000000) == 0 && !v6)
      {
        CFTypeRef cf = 0;
        uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
        uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v12) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = 0;
        }
        v14 = *(void (**)(uint64_t, void, void, CFTypeRef *))(v13 + 48);
        if (v14)
        {
          v14(FigBaseObject, *MEMORY[0x1E4F33C08], *MEMORY[0x1E4F1CF80], &cf);
          v15 = (void *)cf;
        }
        else
        {
          v15 = 0;
        }
        if (objc_msgSend(v15, "count", cf) > (unint64_t)a5)
        {
          CFNumberRef v16 = (const __CFNumber *)[(id)cf objectAtIndex:a5];
          if (v16) {
            CFNumberGetValue(v16, kCFNumberSInt32Type, &valuePtr);
          }
        }
        if (cf) {
          CFRelease(cf);
        }
      }
      CFRetain(v10);
      v8[4] = v10;
      *((_DWORD *)v8 + 10) = valuePtr;
      v8[6] = (id)[a3 _weakReference];
      *((_DWORD *)v8 + 11) = [v8 _SInt32ForProperty:*MEMORY[0x1E4F33DE8]];
      int v6 = valuePtr;
    }
    if (v8[4]) {
      BOOL v17 = v6 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    if (v17 || !*((_DWORD *)v8 + 11))
    {

      return 0;
    }
  }
  return v8;
}

- (void)dealloc
{
  playbackItem = self->_playbackItem;
  if (playbackItem) {
    CFRelease(playbackItem);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlaybackItemTrackInspector;
  [(AVAssetTrackInspector *)&v4 dealloc];
}

- (id)asset
{
  return [(AVWeakReference *)self->_weakReferenceToAsset referencedObject];
}

- (int)trackID
{
  return self->_trackID;
}

- (unsigned)_figMediaType
{
  return self->_mediaType;
}

- (id)mediaType
{
  int v2 = bswap32(self->_mediaType);
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", (char)v2, ((__int16)v2 >> 8), (v2 << 8 >> 24), (v2 >> 24));
}

- (OpaqueFigPlaybackItem)_playbackItem
{
  return self->_playbackItem;
}

- (void)_valueAsCFTypeForProperty:(__CFString *)a3
{
  v10 = 0;
  playbackItem = self->_playbackItem;
  uint64_t trackID = self->_trackID;
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, __CFString *, void, void **))(v7 + 40);
  if (!v8) {
    return 0;
  }
  v8(playbackItem, trackID, a3, *MEMORY[0x1E4F1CF80], &v10);
  return v10;
}

- (id)formatDescriptions
{
  return [(AVFigObjectInspector *)self _nonNilArrayForProperty:*MEMORY[0x1E4F33DD0]];
}

- (BOOL)isEnabled
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F33DB0]] != 0;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange
{
  CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F0];
  CMTime v4 = start;
  return ($1CE2C3FC342086196D07C2B4E8C70800 *)CMTimeRangeMake((CMTimeRange *)retstr, &start, &v4);
}

- (float)estimatedDataRate
{
  [(AVFigObjectInspector *)self _floatForProperty:*MEMORY[0x1E4F33DB8]];
  return v2 * 8.0;
}

- (float)peakDataRate
{
  return 0.0;
}

- (CGSize)naturalSize
{
  [(AVFigObjectInspector *)self _sizeForProperty:*MEMORY[0x1E4F33D98]];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)dimensions
{
  [(AVFigObjectInspector *)self _sizeForProperty:*MEMORY[0x1E4F33D98]];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGAffineTransform)preferredTransform
{
  if (self) {
    return (CGAffineTransform *)[(CGAffineTransform *)self _affineTransformForProperty:*MEMORY[0x1E4F33DE0]];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)samplePresentationTimeForTrackTime:(SEL)a3
{
  *retstr = *a4;
  return self;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(AVPlaybackItemTrackInspector *)self _playbackItem];
    uint64_t v6 = (OpaqueFigPlaybackItem *)[a3 _playbackItem];
    LOBYTE(v7) = 0;
    if (v5)
    {
      if (v6)
      {
        if (v5 == v6 || (int v7 = CFEqual(v5, v6)) != 0)
        {
          int v8 = [(AVPlaybackItemTrackInspector *)self trackID];
          LOBYTE(v7) = v8 == [a3 trackID];
        }
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (unint64_t)hash
{
  double v3 = [(AVPlaybackItemTrackInspector *)self _playbackItem];
  if (v3)
  {
    return CFHash(v3);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AVPlaybackItemTrackInspector;
    return [(AVPlaybackItemTrackInspector *)&v5 hash];
  }
}

@end