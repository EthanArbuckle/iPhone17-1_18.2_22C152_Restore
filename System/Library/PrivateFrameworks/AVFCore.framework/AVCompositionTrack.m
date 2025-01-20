@interface AVCompositionTrack
- (AVCompositionTrackSegment)segmentForTrackTime:(CMTime *)trackTime;
- (BOOL)isEnabled;
- (NSArray)formatDescriptionReplacements;
- (NSArray)segments;
- (OpaqueFigMutableComposition)_mutableComposition;
- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5;
- (id)description;
- (void)dealloc;
@end

@implementation AVCompositionTrack

- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)AVCompositionTrack;
  v6 = [(AVAssetTrack *)&v10 _initWithAsset:a3 trackID:*(void *)&a4 trackIndex:a5];
  if (v6)
  {
    v7 = objc_alloc_init(AVCompositionTrackInternal);
    v6[2] = v7;
    if (v7)
    {
      *(void *)(v6[2] + 8) = [a3 _mutableComposition];
      v8 = *(const void **)(v6[2] + 8);
      if (v8) {
        CFRetain(v8);
      }
    }
  }
  return v6;
}

- (void)dealloc
{
  priv = self->_priv;
  if (priv)
  {
    mutableComposition = priv->mutableComposition;
    if (mutableComposition)
    {
      CFRelease(mutableComposition);
      self->_priv->mutableComposition = 0;
      priv = self->_priv;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AVCompositionTrack;
  [(AVAssetTrack *)&v5 dealloc];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p trackID = %d, mediaType = %@, editCount = %d>", NSStringFromClass(v4), self, -[AVAssetTrack trackID](self, "trackID"), -[AVAssetTrack mediaType](self, "mediaType"), -[NSArray count](-[AVCompositionTrack segments](self, "segments"), "count")];
}

- (OpaqueFigMutableComposition)_mutableComposition
{
  return self->_priv->mutableComposition;
}

- (BOOL)isEnabled
{
  CFTypeRef cf = 0;
  v3 = [(AVCompositionTrack *)self _mutableComposition];
  uint64_t v4 = [(AVAssetTrack *)self trackID];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = *(uint64_t (**)(OpaqueFigMutableComposition *, uint64_t, void, void, CFTypeRef *))(v6 + 72);
  if (!v7) {
    return 1;
  }
  int v8 = v7(v3, v4, *MEMORY[0x1E4F330C0], *MEMORY[0x1E4F1CF80], &cf);
  CFTypeRef v9 = cf;
  if (v8)
  {
    BOOL v12 = 1;
    if (!cf) {
      return v12;
    }
    goto LABEL_11;
  }
  if (!cf) {
    return 1;
  }
  CFTypeID v10 = CFGetTypeID(cf);
  CFTypeID TypeID = CFBooleanGetTypeID();
  CFTypeRef v9 = cf;
  BOOL v12 = 1;
  if (v10 == TypeID && cf)
  {
    BOOL v12 = CFBooleanGetValue((CFBooleanRef)cf) != 0;
    CFTypeRef v9 = cf;
  }
  if (v9) {
LABEL_11:
  }
    CFRelease(v9);
  return v12;
}

- (NSArray)segments
{
  v3.receiver = self;
  v3.super_class = (Class)AVCompositionTrack;
  return [(AVAssetTrack *)&v3 segments];
}

- (AVCompositionTrackSegment)segmentForTrackTime:(CMTime *)trackTime
{
  v5.receiver = self;
  v5.super_class = (Class)AVCompositionTrack;
  CMTime v4 = *trackTime;
  return (AVCompositionTrackSegment *)[(AVAssetTrack *)&v5 segmentForTrackTime:&v4];
}

- (NSArray)formatDescriptionReplacements
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  CFArrayRef theArray = 0;
  objc_super v3 = [(AVCompositionTrack *)self _mutableComposition];
  uint64_t v4 = [(AVAssetTrack *)self trackID];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = *(unsigned __int16 (**)(OpaqueFigMutableComposition *, uint64_t, void, void, CFArrayRef *))(v6 + 72);
  if (!v7) {
    return (NSArray *)[MEMORY[0x1E4F1C978] array];
  }
  int v8 = v7(v3, v4, *MEMORY[0x1E4F330C8], *MEMORY[0x1E4F1CF80], &theArray);
  CFArrayRef v9 = theArray;
  if (v8) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = theArray == 0;
  }
  if (v10 || (Count = CFArrayGetCount(theArray), CFArrayRef v9 = theArray, !Count))
  {
    if (v9) {
      CFRelease(v9);
    }
    return (NSArray *)[MEMORY[0x1E4F1C978] array];
  }
  BOOL v12 = (NSArray *)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[__CFArray count](theArray, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  CFArrayRef v13 = theArray;
  uint64_t v14 = [(__CFArray *)theArray countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
    uint64_t v17 = *MEMORY[0x1E4F33090];
    uint64_t v18 = *MEMORY[0x1E4F33088];
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v21 = [v20 objectForKey:v17];
        uint64_t v22 = [v20 objectForKey:v18];
        if (v21) {
          BOOL v23 = v22 == 0;
        }
        else {
          BOOL v23 = 1;
        }
        if (!v23)
        {
          v24 = [[AVCompositionTrackFormatDescriptionReplacement alloc] initWithOriginalFormatDescription:v21 andReplacementFormatDescription:v22];
          [(NSArray *)v12 addObject:v24];
        }
      }
      uint64_t v15 = [(__CFArray *)v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v15);
  }
  if (theArray) {
    CFRelease(theArray);
  }
  return v12;
}

@end