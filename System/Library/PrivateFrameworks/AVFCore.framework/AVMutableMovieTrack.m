@interface AVMutableMovieTrack
+ (AVMutableMovieTrack)trackWithTrackID:(int)a3 forMovie:(id)a4;
+ (BOOL)expectsPropertyRevisedNotifications;
- ($1CE2C3FC342086196D07C2B4E8C70800)mediaDecodeTimeRange;
- ($1CE2C3FC342086196D07C2B4E8C70800)mediaPresentationTimeRange;
- (AVMediaDataStorage)mediaDataStorage;
- (AVMutableMovieTrack)initWithTrackID:(int)a3 forMovie:(id)a4;
- (BOOL)appendMediaData:(id)a3 dataOffset:(int64_t *)a4;
- (BOOL)appendSampleBuffer:(CMSampleBufferRef)sampleBuffer decodeTime:(CMTime *)outDecodeTime presentationTime:(CMTime *)outPresentationTime error:(NSError *)outError;
- (BOOL)hasProtectedContent;
- (BOOL)insertMediaTimeRange:(CMTimeRange *)mediaTimeRange intoTimeRange:(CMTimeRange *)trackTimeRange;
- (BOOL)insertTimeRange:(CMTimeRange *)timeRange ofTrack:(AVAssetTrack *)track atTime:(CMTime *)startTime copySampleData:(BOOL)copySampleData error:(NSError *)outError;
- (BOOL)isCompatibleWithFormatDescription:(opaqueCMFormatDescription *)a3;
- (BOOL)isEnabled;
- (BOOL)isModified;
- (CGAffineTransform)preferredTransform;
- (CGSize)_sizeForProperty:(__CFString *)a3;
- (CGSize)cleanApertureDimensions;
- (CGSize)dimensions;
- (CGSize)encodedPixelsDimensions;
- (CGSize)naturalSize;
- (CGSize)productionApertureDimensions;
- (CMTime)preferredMediaChunkDuration;
- (CMTimeScale)timescale;
- (NSArray)formatDescriptions;
- (NSArray)metadata;
- (NSArray)metadataForFormat:(AVMetadataFormat)format;
- (NSInteger)alternateGroupID;
- (NSInteger)layer;
- (NSInteger)preferredMediaChunkAlignment;
- (NSInteger)preferredMediaChunkSize;
- (NSString)extendedLanguageTag;
- (NSString)languageCode;
- (NSURL)sampleReferenceBaseURL;
- (OpaqueFigAssetTrack)_figAssetTrack;
- (OpaqueFigMutableMovie)_figMutableMovie;
- (float)preferredVolume;
- (id)_stringForProperty:(__CFString *)a3;
- (id)availableMetadataFormats;
- (id)description;
- (id)locale;
- (int)trackID;
- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4;
- (void)_addFigAssetTrackNotifications;
- (void)_removeFigAssetTrackNotifications;
- (void)_setSize:(CGSize)a3 forProperty:(__CFString *)a4;
- (void)_setString:(id)a3 forProperty:(__CFString *)a4;
- (void)_signalMetadataUpdated;
- (void)addTrackAssociationToTrack:(AVMovieTrack *)movieTrack type:(AVTrackAssociationType)trackAssociationType;
- (void)dealloc;
- (void)insertEmptyTimeRange:(CMTimeRange *)timeRange;
- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4;
- (void)removeTimeRange:(CMTimeRange *)timeRange;
- (void)removeTrackAssociationToTrack:(AVMovieTrack *)movieTrack type:(AVTrackAssociationType)trackAssociationType;
- (void)replaceFormatDescription:(CMFormatDescriptionRef)formatDescription withFormatDescription:(CMFormatDescriptionRef)newFormatDescription;
- (void)scaleTimeRange:(CMTimeRange *)timeRange toDuration:(CMTime *)duration;
- (void)setAlternateGroupID:(NSInteger)alternateGroupID;
- (void)setCleanApertureDimensions:(CGSize)cleanApertureDimensions;
- (void)setEnabled:(BOOL)enabled;
- (void)setEncodedPixelsDimensions:(CGSize)encodedPixelsDimensions;
- (void)setExtendedLanguageTag:(NSString *)extendedLanguageTag;
- (void)setLanguageCode:(NSString *)languageCode;
- (void)setLayer:(NSInteger)layer;
- (void)setMediaDataStorage:(AVMediaDataStorage *)mediaDataStorage;
- (void)setMetadata:(NSArray *)metadata;
- (void)setModified:(BOOL)modified;
- (void)setNaturalSize:(CGSize)naturalSize;
- (void)setPreferredMediaChunkAlignment:(NSInteger)preferredMediaChunkAlignment;
- (void)setPreferredMediaChunkDuration:(CMTime *)preferredMediaChunkDuration;
- (void)setPreferredMediaChunkSize:(NSInteger)preferredMediaChunkSize;
- (void)setPreferredTransform:(CGAffineTransform *)preferredTransform;
- (void)setPreferredVolume:(float)preferredVolume;
- (void)setProductionApertureDimensions:(CGSize)productionApertureDimensions;
- (void)setSampleReferenceBaseURL:(NSURL *)sampleReferenceBaseURL;
- (void)setTimescale:(CMTimeScale)timescale;
@end

@implementation AVMutableMovieTrack

+ (AVMutableMovieTrack)trackWithTrackID:(int)a3 forMovie:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTrackID:v4 forMovie:v5];

  return (AVMutableMovieTrack *)v6;
}

- (AVMutableMovieTrack)initWithTrackID:(int)a3 forMovie:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = objc_alloc_init(AVMutableMovieTrackInternal);
  mutableMovieTrackInternal = self->_mutableMovieTrackInternal;
  self->_mutableMovieTrackInternal = v7;

  if (!self->_mutableMovieTrackInternal) {
    goto LABEL_13;
  }
  v9 = (AVMutableMovieTrack *)[v6 _figAsset];
  if (!v9) {
    goto LABEL_56;
  }
  v10 = self->_mutableMovieTrackInternal;
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  v13 = *(void (**)(AVMutableMovieTrack *, uint64_t, OpaqueFigAssetTrack **))(v12 + 40);
  if (v13) {
    v13(v9, v4, &v10->figAssetTrack);
  }
  if (!self->_mutableMovieTrackInternal->figAssetTrack)
  {
LABEL_13:
    v9 = 0;
    goto LABEL_56;
  }
  v45.receiver = self;
  v45.super_class = (Class)AVMutableMovieTrack;
  v14 = [(AVAssetTrack *)&v45 _initWithAsset:v6 trackID:v4 trackIndex:-1];
  if (v14)
  {
    *(void *)(v14[3] + 8) = CFRetain((CFTypeRef)[v6 _figMutableMovie]);
    *(_DWORD *)(v14[3] + 16) = v4;
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    uint64_t v16 = v14[3];
    v17 = *(void **)(v16 + 32);
    *(void *)(v16 + 32) = v15;

    if (*(void *)(v14[3] + 32))
    {
      CFTypeRef cf = 0;
      uint64_t CMBaseObject = FigAssetTrackGetCMBaseObject();
      uint64_t VTable = CMBaseObjectGetVTable();
      uint64_t v20 = *MEMORY[0x1E4F1CF80];
      if (*(void *)(VTable + 8)) {
        uint64_t v21 = *(void *)(VTable + 8);
      }
      else {
        uint64_t v21 = 0;
      }
      v22 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v21 + 48);
      if (v22) {
        v22(CMBaseObject, *MEMORY[0x1E4F348F8], v20, &cf);
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      uint64_t v23 = FigAssetTrackGetCMBaseObject();
      uint64_t v24 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v24) {
        uint64_t v25 = v24;
      }
      else {
        uint64_t v25 = 0;
      }
      v26 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v25 + 48);
      if (v26) {
        v26(v23, *MEMORY[0x1E4F32478], v20, &cf);
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      uint64_t v27 = FigAssetTrackGetCMBaseObject();
      uint64_t v28 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v28) {
        uint64_t v29 = v28;
      }
      else {
        uint64_t v29 = 0;
      }
      v30 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v29 + 48);
      if (v30) {
        v30(v27, *MEMORY[0x1E4F324D8], v20, &cf);
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      uint64_t v31 = FigAssetTrackGetCMBaseObject();
      uint64_t v32 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v32) {
        uint64_t v33 = v32;
      }
      else {
        uint64_t v33 = 0;
      }
      v34 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v33 + 48);
      if (v34) {
        v34(v31, *MEMORY[0x1E4F324C8], v20, &cf);
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      uint64_t v35 = FigAssetTrackGetCMBaseObject();
      uint64_t v36 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v36) {
        uint64_t v37 = v36;
      }
      else {
        uint64_t v37 = 0;
      }
      v38 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v37 + 48);
      if (v38) {
        v38(v35, *MEMORY[0x1E4F324D0], v20, &cf);
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      uint64_t v39 = FigAssetTrackGetCMBaseObject();
      uint64_t v40 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v40) {
        uint64_t v41 = v40;
      }
      else {
        uint64_t v41 = 0;
      }
      v42 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v41 + 48);
      if (v42) {
        v42(v39, *MEMORY[0x1E4F32498], v20, &cf);
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      [v14 _addFigAssetTrackNotifications];
    }
  }
  self = v14;
  v9 = self;
LABEL_56:

  return v9;
}

- (void)dealloc
{
  if (self->_mutableMovieTrackInternal)
  {
    [(AVMutableMovieTrack *)self _removeFigAssetTrackNotifications];
    mutableMovieTrackInternal = self->_mutableMovieTrackInternal;
    figMutableMovie = mutableMovieTrackInternal->figMutableMovie;
    if (figMutableMovie)
    {
      CFRelease(figMutableMovie);
      mutableMovieTrackInternal = self->_mutableMovieTrackInternal;
    }
    figAssetTrack = mutableMovieTrackInternal->figAssetTrack;
    if (figAssetTrack) {
      CFRelease(figAssetTrack);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)AVMutableMovieTrack;
  [(AVAssetTrack *)&v6 dealloc];
}

- (OpaqueFigAssetTrack)_figAssetTrack
{
  return self->_mutableMovieTrackInternal->figAssetTrack;
}

- (void)_signalMetadataUpdated
{
}

- (void)_addFigAssetTrackNotifications
{
  v3 = [(AVMutableMovieTrack *)self _figAssetTrack];
  uint64_t v4 = [(AVAssetTrack *)self _weakReference];
  if (v3 && v4)
  {
    id obj = v4;
    id v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    self->_mutableMovieTrackInternal->figAssetTrackNotificationSource = (OpaqueFigAssetTrack *)CFRetain(v3);
    objc_storeStrong((id *)&self->_mutableMovieTrackInternal->figAssetTrackNotificationListenerWeakReference, obj);
    [v5 addListenerWithWeakReference:self->_mutableMovieTrackInternal->figAssetTrackNotificationListenerWeakReference callback:mutableMovieTrackNotificationHandler name:*MEMORY[0x1E4F32468] object:self->_mutableMovieTrackInternal->figAssetTrackNotificationSource flags:0];

    uint64_t v4 = obj;
  }
}

- (void)_removeFigAssetTrackNotifications
{
  mutableMovieTrackInternal = self->_mutableMovieTrackInternal;
  figAssetTrackNotificationSource = mutableMovieTrackInternal->figAssetTrackNotificationSource;
  if (figAssetTrackNotificationSource)
  {
    if (!mutableMovieTrackInternal->figAssetTrackNotificationListenerWeakReference
      || (+[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), id v5 = objc_claimAutoreleasedReturnValue(), [v5 removeListenerWithWeakReference:self->_mutableMovieTrackInternal->figAssetTrackNotificationListenerWeakReference callback:mutableMovieTrackNotificationHandler name:*MEMORY[0x1E4F32468] object:self->_mutableMovieTrackInternal->figAssetTrackNotificationSource], v5, mutableMovieTrackInternal = self->_mutableMovieTrackInternal, (figAssetTrackNotificationSource = mutableMovieTrackInternal->figAssetTrackNotificationSource) != 0))
    {
      CFRelease(figAssetTrackNotificationSource);
      mutableMovieTrackInternal = self->_mutableMovieTrackInternal;
    }
  }
  figAssetTrackNotificationListenerWeakReference = mutableMovieTrackInternal->figAssetTrackNotificationListenerWeakReference;
  mutableMovieTrackInternal->figAssetTrackNotificationListenerWeakReference = 0;

  self->_mutableMovieTrackInternal->figAssetTrackNotificationSource = 0;
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  return 2;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  uint64_t v4 = (void (**)(void))a4;
  if (v4) {
    v4[2]();
  }
}

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 1;
}

- (OpaqueFigMutableMovie)_figMutableMovie
{
  return self->_mutableMovieTrackInternal->figMutableMovie;
}

- (int)trackID
{
  return self->_mutableMovieTrackInternal->trackID;
}

- (NSString)languageCode
{
  return (NSString *)[(AVMutableMovieTrack *)self _stringForProperty:*MEMORY[0x1E4F33190]];
}

- (NSString)extendedLanguageTag
{
  return (NSString *)[(AVMutableMovieTrack *)self _stringForProperty:*MEMORY[0x1E4F33178]];
}

- (id)locale
{
  v3 = [(AVMutableMovieTrack *)self extendedLanguageTag];
  if (v3
    || ([(AVMutableMovieTrack *)self languageCode],
        (v3 = (__CFString *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    CFLocaleRef v4 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v3);
    if (v4) {
      CFLocaleRef v5 = v4;
    }
    else {
      CFLocaleRef v5 = 0;
    }
  }
  else
  {
    CFLocaleRef v5 = 0;
  }

  return v5;
}

- (CGSize)naturalSize
{
  [(AVMutableMovieTrack *)self _sizeForProperty:*MEMORY[0x1E4F33168]];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)dimensions
{
  [(AVMutableMovieTrack *)self _sizeForProperty:*MEMORY[0x1E4F33168]];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGAffineTransform)preferredTransform
{
  uint64_t v21 = 0;
  uint64_t v5 = MEMORY[0x1E4F1DAB8];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  v7 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v8 = [(AVMutableMovieTrack *)self trackID];
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v12 = *(void *)(VTable + 16);
  CGSize result = (CGAffineTransform *)(VTable + 16);
  uint64_t v11 = v12;
  if (v12) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = 0;
  }
  v14 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, void, void, CGAffineTransform **))(v13 + 48);
  if (v14)
  {
    int v15 = v14(v7, v8, *MEMORY[0x1E4F331F8], *MEMORY[0x1E4F1CF80], &v21);
    CGSize result = v21;
    if (!v15)
    {
      if (!v21) {
        return result;
      }
      CFTypeID v16 = CFGetTypeID(v21);
      CFTypeID TypeID = CFArrayGetTypeID();
      CGSize result = v21;
      if (v16 == TypeID)
      {
        FigGetCGAffineTransformFrom3x3MatrixArray();
        *(_OWORD *)&retstr->a = v18;
        *(_OWORD *)&retstr->c = v19;
        *(_OWORD *)&retstr->tx = v20;
        CGSize result = v21;
      }
    }
    if (result) {
      CFRelease(result);
    }
  }
  return result;
}

- (NSInteger)layer
{
  CFTypeRef cf = 0;
  __int16 valuePtr = -1;
  double v3 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v4 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, void, void, CFTypeRef *))(v6 + 48);
  if (v7)
  {
    int v8 = v7(v3, v4, *MEMORY[0x1E4F33198], *MEMORY[0x1E4F1CF80], &cf);
    CFTypeRef v9 = cf;
    if (!v8)
    {
      if (!cf) {
        return valuePtr;
      }
      CFTypeID v10 = CFGetTypeID(cf);
      CFTypeID TypeID = CFNumberGetTypeID();
      CFTypeRef v9 = cf;
      if (v10 == TypeID)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt16Type, &valuePtr);
        CFTypeRef v9 = cf;
      }
    }
    if (v9) {
      CFRelease(v9);
    }
  }
  return valuePtr;
}

- (CMTimeScale)timescale
{
  CFTypeRef cf = 0;
  CMTimeScale valuePtr = 0;
  double v3 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v4 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, void, void, CFTypeRef *))(v6 + 48);
  if (v7)
  {
    int v8 = v7(v3, v4, *MEMORY[0x1E4F331B8], *MEMORY[0x1E4F1CF80], &cf);
    CFTypeRef v9 = cf;
    if (!v8)
    {
      if (!cf) {
        return valuePtr;
      }
      CFTypeID v10 = CFGetTypeID(cf);
      CFTypeID TypeID = CFNumberGetTypeID();
      CFTypeRef v9 = cf;
      if (v10 == TypeID)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &valuePtr);
        CFTypeRef v9 = cf;
      }
    }
    if (v9) {
      CFRelease(v9);
    }
  }
  return valuePtr;
}

- (float)preferredVolume
{
  CFTypeRef cf = 0;
  float valuePtr = 1.0;
  double v3 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v4 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, void, void, CFTypeRef *))(v6 + 48);
  if (v7)
  {
    int v8 = v7(v3, v4, *MEMORY[0x1E4F33200], *MEMORY[0x1E4F1CF80], &cf);
    CFTypeRef v9 = cf;
    if (!v8)
    {
      if (!cf) {
        return valuePtr;
      }
      CFTypeID v10 = CFGetTypeID(cf);
      CFTypeID TypeID = CFNumberGetTypeID();
      CFTypeRef v9 = cf;
      if (v10 == TypeID)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberFloat32Type, &valuePtr);
        CFTypeRef v9 = cf;
      }
    }
    if (v9) {
      CFRelease(v9);
    }
  }
  return valuePtr;
}

- (CGSize)cleanApertureDimensions
{
  [(AVMutableMovieTrack *)self _sizeForProperty:*MEMORY[0x1E4F33160]];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)productionApertureDimensions
{
  [(AVMutableMovieTrack *)self _sizeForProperty:*MEMORY[0x1E4F331E8]];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)encodedPixelsDimensions
{
  [(AVMutableMovieTrack *)self _sizeForProperty:*MEMORY[0x1E4F33170]];
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)isEnabled
{
  CFTypeRef cf = 0;
  double v3 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v4 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, void, void, CFTypeRef *))(v6 + 48);
  if (!v7) {
    return 0;
  }
  int v8 = v7(v3, v4, *MEMORY[0x1E4F33188], *MEMORY[0x1E4F1CF80], &cf);
  CFTypeRef v9 = cf;
  if (v8) {
    goto LABEL_12;
  }
  if (!cf) {
    return 0;
  }
  CFTypeID v10 = CFGetTypeID(cf);
  CFTypeID TypeID = CFBooleanGetTypeID();
  CFTypeRef v9 = cf;
  if (v10 != TypeID)
  {
LABEL_12:
    BOOL v12 = 0;
    if (!v9) {
      return v12;
    }
    goto LABEL_9;
  }
  BOOL v12 = CFBooleanGetValue((CFBooleanRef)cf) != 0;
  CFTypeRef v9 = cf;
  if (cf) {
LABEL_9:
  }
    CFRelease(v9);
  return v12;
}

- (BOOL)isModified
{
  CFTypeRef cf = 0;
  double v3 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v4 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, void, void, CFTypeRef *))(v6 + 48);
  if (!v7) {
    return 0;
  }
  int v8 = v7(v3, v4, *MEMORY[0x1E4F331C8], *MEMORY[0x1E4F1CF80], &cf);
  CFTypeRef v9 = cf;
  if (v8) {
    goto LABEL_12;
  }
  if (!cf) {
    return 0;
  }
  CFTypeID v10 = CFGetTypeID(cf);
  CFTypeID TypeID = CFBooleanGetTypeID();
  CFTypeRef v9 = cf;
  if (v10 != TypeID)
  {
LABEL_12:
    BOOL v12 = 0;
    if (!v9) {
      return v12;
    }
    goto LABEL_9;
  }
  BOOL v12 = CFBooleanGetValue((CFBooleanRef)cf) != 0;
  CFTypeRef v9 = cf;
  if (cf) {
LABEL_9:
  }
    CFRelease(v9);
  return v12;
}

- (BOOL)hasProtectedContent
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableMovieTrack;
  return [(AVAssetTrack *)&v3 hasProtectedContent];
}

- (NSInteger)preferredMediaChunkSize
{
  CFTypeRef cf = 0;
  unsigned int valuePtr = 0;
  objc_super v3 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v4 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, void, void, CFTypeRef *))(v6 + 48);
  if (v7)
  {
    int v8 = v7(v3, v4, *MEMORY[0x1E4F331E0], *MEMORY[0x1E4F1CF80], &cf);
    CFTypeRef v9 = cf;
    if (!v8)
    {
      if (!cf) {
        return valuePtr;
      }
      CFTypeID v10 = CFGetTypeID(cf);
      CFTypeID TypeID = CFNumberGetTypeID();
      CFTypeRef v9 = cf;
      if (v10 == TypeID)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &valuePtr);
        CFTypeRef v9 = cf;
      }
    }
    if (v9) {
      CFRelease(v9);
    }
  }
  return valuePtr;
}

- (CMTime)preferredMediaChunkDuration
{
  CFTypeRef cf = 0;
  *retstr = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  uint64_t v5 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v6 = [(AVMutableMovieTrack *)self trackID];
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v10 = *(void *)(VTable + 16);
  CGSize result = (CMTime *)(VTable + 16);
  uint64_t v9 = v10;
  if (v10) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = 0;
  }
  BOOL v12 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, void, void, CFTypeRef *))(v11 + 48);
  if (v12)
  {
    int v13 = v12(v5, v6, *MEMORY[0x1E4F331D8], *MEMORY[0x1E4F1CF80], &cf);
    CGSize result = (CMTime *)cf;
    if (!v13)
    {
      if (!cf) {
        return result;
      }
      CFTypeID v14 = CFGetTypeID(cf);
      CFTypeID TypeID = CFDictionaryGetTypeID();
      CGSize result = (CMTime *)cf;
      if (v14 == TypeID)
      {
        CMTimeMakeFromDictionary(&v16, (CFDictionaryRef)cf);
        *(_OWORD *)&retstr->value = *(_OWORD *)&v16.value;
        CGSize result = (CMTime *)cf;
        retstr->epoch = v16.epoch;
      }
    }
    if (result) {
      CFRelease(result);
    }
  }
  return result;
}

- (NSInteger)preferredMediaChunkAlignment
{
  CFTypeRef cf = 0;
  unsigned int valuePtr = 0;
  objc_super v3 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v4 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, void, void, CFTypeRef *))(v6 + 48);
  if (v7)
  {
    int v8 = v7(v3, v4, *MEMORY[0x1E4F331D0], *MEMORY[0x1E4F1CF80], &cf);
    CFTypeRef v9 = cf;
    if (!v8)
    {
      if (!cf) {
        return valuePtr;
      }
      CFTypeID v10 = CFGetTypeID(cf);
      CFTypeID TypeID = CFNumberGetTypeID();
      CFTypeRef v9 = cf;
      if (v10 == TypeID)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &valuePtr);
        CFTypeRef v9 = cf;
      }
    }
    if (v9) {
      CFRelease(v9);
    }
  }
  return valuePtr;
}

- (CGSize)_sizeForProperty:(__CFString *)a3
{
  CGSize size = (CGSize)*MEMORY[0x1E4F1DB30];
  CFTypeRef cf = 0;
  uint64_t v5 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v6 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  CFTypeRef v9 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, __CFString *, void, CFTypeRef *))(v8 + 48);
  if (v9)
  {
    int v10 = v9(v5, v6, a3, *MEMORY[0x1E4F1CF80], &cf);
    CFTypeRef v11 = cf;
    if (!v10)
    {
      if (!cf) {
        goto LABEL_11;
      }
      CFTypeID v12 = CFGetTypeID(cf);
      CFTypeID TypeID = CFDictionaryGetTypeID();
      CFTypeRef v11 = cf;
      if (v12 == TypeID)
      {
        CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)cf, &size);
        CFTypeRef v11 = cf;
      }
    }
    if (v11) {
      CFRelease(v11);
    }
  }
LABEL_11:
  double width = size.width;
  double height = size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setSize:(CGSize)a3 forProperty:(__CFString *)a4
{
  CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(a3);
  if (DictionaryRepresentation)
  {
    CFDictionaryRef v7 = DictionaryRepresentation;
    uint64_t v8 = [(AVMutableMovieTrack *)self _figMutableMovie];
    uint64_t v9 = [(AVMutableMovieTrack *)self trackID];
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    CFTypeID v12 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, __CFString *, CFDictionaryRef))(v11 + 56);
    if (v12) {
      v12(v8, v9, a4, v7);
    }
    CFRelease(v7);
  }
}

- (id)_stringForProperty:(__CFString *)a3
{
  CFTypeRef cf = 0;
  uint64_t v5 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v6 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, __CFString *, void, CFTypeRef *))(v8 + 48);
  if (!v9) {
    goto LABEL_11;
  }
  int v10 = v9(v5, v6, a3, *MEMORY[0x1E4F1CF80], &cf);
  uint64_t v11 = (void *)cf;
  if (!v10)
  {
    if (!cf) {
      goto LABEL_12;
    }
    CFTypeID v12 = CFGetTypeID(cf);
    CFTypeID TypeID = CFStringGetTypeID();
    uint64_t v11 = (void *)cf;
    if (v12 == TypeID)
    {
      CFTypeRef cf = 0;
      goto LABEL_12;
    }
  }
  if (v11)
  {
    CFRelease(v11);
LABEL_11:
    uint64_t v11 = 0;
  }
LABEL_12:
  return v11;
}

- (void)_setString:(id)a3 forProperty:(__CFString *)a4
{
  id v11 = a3;
  uint64_t v6 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v7 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  int v10 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, __CFString *, id))(v9 + 56);
  if (v10) {
    v10(v6, v7, a4, v11);
  }
}

- ($1CE2C3FC342086196D07C2B4E8C70800)mediaPresentationTimeRange
{
  long long v20 = 0;
  uint64_t v5 = MEMORY[0x1E4F1FA20];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&retstr->var0.var3 = v6;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v5 + 32);
  uint64_t v7 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v8 = [(AVMutableMovieTrack *)self trackID];
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v12 = *(void *)(VTable + 16);
  CGSize result = ($1CE2C3FC342086196D07C2B4E8C70800 *)(VTable + 16);
  uint64_t v11 = v12;
  if (v12) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = 0;
  }
  CFTypeID v14 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, void, void, $1CE2C3FC342086196D07C2B4E8C70800 **))(v13 + 48);
  if (v14)
  {
    int v15 = v14(v7, v8, *MEMORY[0x1E4F331B0], *MEMORY[0x1E4F1CF80], &v20);
    CGSize result = v20;
    if (!v15)
    {
      if (!v20) {
        return result;
      }
      CFTypeID v16 = CFGetTypeID(v20);
      CFTypeID TypeID = CFDictionaryGetTypeID();
      CGSize result = v20;
      if (v16 == TypeID)
      {
        CMTimeRangeMakeFromDictionary(&v19, (CFDictionaryRef)v20);
        long long v18 = *(_OWORD *)&v19.start.epoch;
        *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v19.start.value;
        *(_OWORD *)&retstr->var0.var3 = v18;
        *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&v19.duration.timescale;
        CGSize result = v20;
      }
    }
    if (result) {
      CFRelease(result);
    }
  }
  return result;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)mediaDecodeTimeRange
{
  long long v20 = 0;
  uint64_t v5 = MEMORY[0x1E4F1FA20];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&retstr->var0.var3 = v6;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v5 + 32);
  uint64_t v7 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v8 = [(AVMutableMovieTrack *)self trackID];
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v12 = *(void *)(VTable + 16);
  CGSize result = ($1CE2C3FC342086196D07C2B4E8C70800 *)(VTable + 16);
  uint64_t v11 = v12;
  if (v12) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = 0;
  }
  CFTypeID v14 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, void, void, $1CE2C3FC342086196D07C2B4E8C70800 **))(v13 + 48);
  if (v14)
  {
    int v15 = v14(v7, v8, *MEMORY[0x1E4F331A8], *MEMORY[0x1E4F1CF80], &v20);
    CGSize result = v20;
    if (!v15)
    {
      if (!v20) {
        return result;
      }
      CFTypeID v16 = CFGetTypeID(v20);
      CFTypeID TypeID = CFDictionaryGetTypeID();
      CGSize result = v20;
      if (v16 == TypeID)
      {
        CMTimeRangeMakeFromDictionary(&v19, (CFDictionaryRef)v20);
        long long v18 = *(_OWORD *)&v19.start.epoch;
        *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v19.start.value;
        *(_OWORD *)&retstr->var0.var3 = v18;
        *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&v19.duration.timescale;
        CGSize result = v20;
      }
    }
    if (result) {
      CFRelease(result);
    }
  }
  return result;
}

- (NSInteger)alternateGroupID
{
  CFTypeRef cf = 0;
  __int16 valuePtr = -1;
  objc_super v3 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v4 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, void, void, CFTypeRef *))(v6 + 48);
  if (v7)
  {
    int v8 = v7(v3, v4, *MEMORY[0x1E4F33150], *MEMORY[0x1E4F1CF80], &cf);
    CFTypeRef v9 = cf;
    if (!v8)
    {
      if (!cf) {
        return valuePtr;
      }
      CFTypeID v10 = CFGetTypeID(cf);
      CFTypeID TypeID = CFNumberGetTypeID();
      CFTypeRef v9 = cf;
      if (v10 == TypeID)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt16Type, &valuePtr);
        CFTypeRef v9 = cf;
      }
    }
    if (v9) {
      CFRelease(v9);
    }
  }
  return valuePtr;
}

- (NSURL)sampleReferenceBaseURL
{
  CFTypeRef cf = 0;
  objc_super v3 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v4 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, void, void, CFTypeRef *))(v6 + 48);
  if (!v7) {
    goto LABEL_11;
  }
  int v8 = v7(v3, v4, *MEMORY[0x1E4F331F0], *MEMORY[0x1E4F1CF80], &cf);
  CFTypeRef v9 = (void *)cf;
  if (!v8)
  {
    if (!cf) {
      goto LABEL_12;
    }
    CFTypeID v10 = CFGetTypeID(cf);
    CFTypeID v11 = CFURLGetTypeID();
    CFTypeRef v9 = (void *)cf;
    if (v10 == v11)
    {
      CFTypeRef cf = 0;
      goto LABEL_12;
    }
  }
  if (v9)
  {
    CFRelease(v9);
LABEL_11:
    CFTypeRef v9 = 0;
  }
LABEL_12:
  return (NSURL *)v9;
}

- (void)setSampleReferenceBaseURL:(NSURL *)sampleReferenceBaseURL
{
  CFTypeRef v9 = sampleReferenceBaseURL;
  uint64_t v4 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v5 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  int v8 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, void, NSURL *))(v7 + 56);
  if (v8) {
    v8(v4, v5, *MEMORY[0x1E4F331F0], v9);
  }
}

- (AVMediaDataStorage)mediaDataStorage
{
  CFTypeRef cf = 0;
  objc_super v3 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v4 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(unsigned int (**)(OpaqueFigMutableMovie *, uint64_t, void, void, CFTypeRef *))(v6 + 48);
  if (!v7 || v7(v3, v4, *MEMORY[0x1E4F331A0], *MEMORY[0x1E4F1CF80], &cf)) {
    goto LABEL_9;
  }
  if (!cf)
  {
    CFTypeID v10 = 0;
    goto LABEL_12;
  }
  CFTypeID v8 = CFGetTypeID(cf);
  if (v8 == CFURLGetTypeID())
  {
    CFTypeRef v9 = [AVMediaDataStorage alloc];
    CFTypeID v10 = [(AVMediaDataStorage *)v9 initWithURL:cf options:0];
  }
  else
  {
LABEL_9:
    CFTypeID v10 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
LABEL_12:
  return v10;
}

- (void)setMediaDataStorage:(AVMediaDataStorage *)mediaDataStorage
{
  CFTypeID v10 = mediaDataStorage;
  uint64_t v4 = [(AVMediaDataStorage *)v10 URL];
  uint64_t v5 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v6 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  CFTypeRef v9 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, void, void *))(v8 + 56);
  if (v9) {
    v9(v5, v6, *MEMORY[0x1E4F331A0], v4);
  }
}

- (void)setLanguageCode:(NSString *)languageCode
{
}

- (void)setExtendedLanguageTag:(NSString *)extendedLanguageTag
{
}

- (void)setNaturalSize:(CGSize)naturalSize
{
}

- (void)setPreferredVolume:(float)preferredVolume
{
  uint64_t v5 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v6 = [(AVMutableMovieTrack *)self trackID];
  *(float *)&double v7 = preferredVolume;
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithFloat:v7];
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  CFTypeID v11 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  if (v11)
  {
    uint64_t v12 = *MEMORY[0x1E4F33200];
    v11(v5, v6, v12, v8);
  }
}

- (void)setPreferredTransform:(CGAffineTransform *)preferredTransform
{
  CGAffineTransform v11 = *preferredTransform;
  uint64_t v4 = FigCreate3x3MatrixArrayFromCGAffineTransform();
  if (v4)
  {
    uint64_t v5 = (const void *)v4;
    uint64_t v6 = [(AVMutableMovieTrack *)self _figMutableMovie];
    uint64_t v7 = [(AVMutableMovieTrack *)self trackID];
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, void, const void *))(v9 + 56);
    if (v10) {
      v10(v6, v7, *MEMORY[0x1E4F331F8], v5);
    }
    CFRelease(v5);
  }
}

- (void)setTimescale:(CMTimeScale)timescale
{
  uint64_t v3 = *(void *)&timescale;
  uint64_t v5 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v6 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInt:v3];
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  if (v10)
  {
    uint64_t v11 = *MEMORY[0x1E4F331B8];
    v10(v5, v6, v11, v7);
  }
}

- (void)setCleanApertureDimensions:(CGSize)cleanApertureDimensions
{
}

- (void)setProductionApertureDimensions:(CGSize)productionApertureDimensions
{
}

- (void)setEncodedPixelsDimensions:(CGSize)encodedPixelsDimensions
{
}

- (void)setLayer:(NSInteger)layer
{
  __int16 valuePtr = layer;
  if (layer < 0x8000)
  {
    CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt16Type, &valuePtr);
    if (v4)
    {
      CFNumberRef v5 = v4;
      uint64_t v6 = [(AVMutableMovieTrack *)self _figMutableMovie];
      uint64_t v7 = [(AVMutableMovieTrack *)self trackID];
      uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v8) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
      uint64_t v10 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, void, CFNumberRef))(v9 + 56);
      if (v10) {
        v10(v6, v7, *MEMORY[0x1E4F33198], v5);
      }
      CFRelease(v5);
    }
  }
}

- (void)setAlternateGroupID:(NSInteger)alternateGroupID
{
  __int16 valuePtr = alternateGroupID;
  if (alternateGroupID < 0x8000)
  {
    CFNumberRef v4 = [(AVAssetTrack *)self asset];
    [v4 willChangeValueForKey:@"trackGroups"];

    CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt16Type, &valuePtr);
    if (v5)
    {
      CFNumberRef v6 = v5;
      uint64_t v7 = [(AVMutableMovieTrack *)self _figMutableMovie];
      uint64_t v8 = [(AVMutableMovieTrack *)self trackID];
      uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v9) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      uint64_t v11 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, void, CFNumberRef))(v10 + 56);
      if (v11) {
        v11(v7, v8, *MEMORY[0x1E4F33150], v6);
      }
      uint64_t v12 = [(AVAssetTrack *)self asset];
      [v12 didChangeValueForKey:@"trackGroups"];

      CFRelease(v6);
    }
  }
}

- (void)setEnabled:(BOOL)enabled
{
  BOOL v3 = enabled;
  CFNumberRef v5 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v6 = [(AVMutableMovieTrack *)self trackID];
  if (v3) {
    uint64_t v7 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v7 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  if (v10)
  {
    uint64_t v11 = *MEMORY[0x1E4F33188];
    uint64_t v12 = *v7;
    v10(v5, v6, v11, v12);
  }
}

- (void)setModified:(BOOL)modified
{
  BOOL v3 = modified;
  CFNumberRef v5 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v6 = [(AVMutableMovieTrack *)self trackID];
  if (v3) {
    uint64_t v7 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v7 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  if (v10)
  {
    uint64_t v11 = *MEMORY[0x1E4F331C8];
    uint64_t v12 = *v7;
    v10(v5, v6, v11, v12);
  }
}

- (void)setPreferredMediaChunkSize:(NSInteger)preferredMediaChunkSize
{
  CFNumberRef v5 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v6 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:preferredMediaChunkSize];
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  if (v10)
  {
    uint64_t v11 = *MEMORY[0x1E4F331E0];
    v10(v5, v6, v11, v7);
  }
}

- (void)setPreferredMediaChunkDuration:(CMTime *)preferredMediaChunkDuration
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTime v11 = *preferredMediaChunkDuration;
  CFDictionaryRef v5 = CMTimeCopyAsDictionary(&v11, v4);
  uint64_t v6 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v7 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, void, CFDictionaryRef))(v9 + 56);
  if (v10) {
    v10(v6, v7, *MEMORY[0x1E4F331D8], v5);
  }
  if (v5) {
    CFRelease(v5);
  }
}

- (void)setPreferredMediaChunkAlignment:(NSInteger)preferredMediaChunkAlignment
{
  CFDictionaryRef v5 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v6 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:preferredMediaChunkAlignment];
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  if (v10)
  {
    uint64_t v11 = *MEMORY[0x1E4F331D0];
    v10(v5, v6, v11, v7);
  }
}

- (id)description
{
  BOOL v3 = [(AVMutableMovieTrack *)self sampleReferenceBaseURL];
  CFAllocatorRef v4 = NSString;
  CFDictionaryRef v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  if (v3)
  {
    uint64_t v7 = [(AVMutableMovieTrack *)self trackID];
    uint64_t v8 = [(AVAssetTrack *)self mediaType];
    uint64_t v9 = [(AVMutableMovieTrack *)self sampleReferenceBaseURL];
    uint64_t v10 = [v4 stringWithFormat:@"<%@: %p, trackID = %d, mediaType = %@, sampleReferenceBaseURL = %@>", v6, self, v7, v8, v9];
  }
  else
  {
    uint64_t v11 = [(AVMutableMovieTrack *)self trackID];
    uint64_t v8 = [(AVAssetTrack *)self mediaType];
    uint64_t v10 = [v4 stringWithFormat:@"<%@: %p, trackID = %d, mediaType = %@>", v6, self, v11, v8];
  }

  return v10;
}

- (void).cxx_destruct
{
}

- (void)replaceFormatDescription:(CMFormatDescriptionRef)formatDescription withFormatDescription:(CMFormatDescriptionRef)newFormatDescription
{
  v37[2] = *MEMORY[0x1E4F143B8];
  if (!formatDescription)
  {
    uint64_t v29 = (void *)MEMORY[0x1E4F1CA00];
    v30 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)newFormatDescription, v4, v5, v6, v7, (uint64_t)"formatDescription != NULL");
    id v31 = [v29 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v30 userInfo:0];
    goto LABEL_22;
  }
  if (!newFormatDescription)
  {
    uint64_t v32 = (void *)MEMORY[0x1E4F1CA00];
    v30 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", 0, v4, v5, v6, v7, (uint64_t)"newFormatDescription != NULL");
    id v31 = [v32 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v30 userInfo:0];
    goto LABEL_22;
  }
  if (formatDescription == newFormatDescription) {
    return;
  }
  CMMediaType MediaType = CMFormatDescriptionGetMediaType(formatDescription);
  if (MediaType != CMFormatDescriptionGetMediaType(newFormatDescription))
  {
    uint64_t v33 = (void *)MEMORY[0x1E4F1CA00];
    v30 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Media type of the new format description must match that of the existing format description", v13, v14, v15, v16, v17, v35);
    id v31 = [v33 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v30 userInfo:0];
LABEL_22:
    v34 = v31;

    objc_exception_throw(v34);
  }
  uint64_t v36 = [(AVMutableMovieTrack *)self formatDescriptions];
  if ([v36 containsObject:formatDescription])
  {
    long long v18 = [MEMORY[0x1E4F1CA48] arrayWithArray:v36];
    unint64_t v19 = 0;
    uint64_t v20 = *MEMORY[0x1E4F1EE58];
    uint64_t v21 = *MEMORY[0x1E4F1EE50];
    while (v19 < [v18 count])
    {
      v22 = (const opaqueCMFormatDescription *)[v18 objectAtIndex:v19];
      v37[0] = v20;
      v37[1] = v21;
      uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
      if (CMFormatDescriptionEqualIgnoringExtensionKeys(v22, formatDescription, v23, 0)) {
        [v18 replaceObjectAtIndex:v19 withObject:newFormatDescription];
      }

      ++v19;
    }
    uint64_t v24 = [(AVMutableMovieTrack *)self _figMutableMovie];
    uint64_t v25 = [(AVMutableMovieTrack *)self trackID];
    uint64_t v26 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v26) {
      uint64_t v27 = v26;
    }
    else {
      uint64_t v27 = 0;
    }
    uint64_t v28 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, void, void *))(v27 + 56);
    if (v28) {
      v28(v24, v25, *MEMORY[0x1E4F33180], v18);
    }
  }
}

- (NSArray)formatDescriptions
{
  CFTypeRef cf = 0;
  BOOL v3 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v4 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, void, void, CFTypeRef *))(v6 + 48);
  if (v7)
  {
    int v8 = v7(v3, v4, *MEMORY[0x1E4F33180], *MEMORY[0x1E4F1CF80], &cf);
    uint64_t v9 = (void *)cf;
    if (v8)
    {
LABEL_13:
      if (v9) {
        CFRelease(v9);
      }
      goto LABEL_9;
    }
    if (cf)
    {
      CFTypeID v10 = CFGetTypeID(cf);
      CFTypeID TypeID = CFArrayGetTypeID();
      uint64_t v9 = (void *)cf;
      if (v10 == TypeID)
      {
        CFTypeRef cf = 0;
        if (v9) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
      goto LABEL_13;
    }
  }
LABEL_9:
  uint64_t v9 = [MEMORY[0x1E4F1C978] array];
LABEL_10:
  return (NSArray *)v9;
}

- (BOOL)isCompatibleWithFormatDescription:(opaqueCMFormatDescription *)a3
{
  uint64_t v5 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v6 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(unsigned int (**)(OpaqueFigMutableMovie *, uint64_t, opaqueCMFormatDescription *))(v8 + 96);
  return v9 && v9(v5, v6, a3) != 0;
}

- (BOOL)insertTimeRange:(CMTimeRange *)timeRange ofTrack:(AVAssetTrack *)track atTime:(CMTime *)startTime copySampleData:(BOOL)copySampleData error:(NSError *)outError
{
  LODWORD(v8) = copySampleData;
  v44[1] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = track;
  uint64_t v13 = [(AVAssetTrack *)v12 asset];
  char v14 = [v13 providesPreciseDurationAndTiming];

  if (v14)
  {
    [(AVMutableMovieTrack *)self willChangeValueForKey:@"segments"];
    if (![(AVAssetTrack *)self isEqual:v12] || (v8 & 1) != 0)
    {
      uint64_t v23 = [(AVAssetTrack *)v12 _figFormatReader];
      uint64_t v24 = [(AVAssetTrack *)v12 _figTrackReader];
      if (!v24)
      {
        v22 = AVLocalizedError(@"AVFoundationErrorDomain", -11838, 0);
        signed int v33 = 0;
        BOOL v21 = 0;
        if (!outError) {
          goto LABEL_29;
        }
LABEL_23:
        if (!v21)
        {
          if (v22)
          {
            uint64_t v35 = v22;
LABEL_28:
            *outError = v35;
            goto LABEL_29;
          }
          if (v33)
          {
            AVLocalizedErrorWithUnderlyingOSStatus(v33, 0);
            uint64_t v35 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
            goto LABEL_28;
          }
        }
LABEL_29:
        [(AVMutableMovieTrack *)self didChangeValueForKey:@"segments", v37, epoch];
        goto LABEL_30;
      }
      uint64_t v25 = [(AVAssetTrack *)v12 asset];
      int v26 = [v25 _prefersNominalDurations];

      if (v26) {
        uint64_t v8 = v8 | 0x100;
      }
      else {
        uint64_t v8 = v8;
      }
      uint64_t v27 = [(AVMutableMovieTrack *)self _figMutableMovie];
      uint64_t v28 = [(AVMutableMovieTrack *)self trackID];
      long long v29 = *(_OWORD *)&timeRange->start.epoch;
      *(_OWORD *)&duration.start.value = *(_OWORD *)&timeRange->start.value;
      *(_OWORD *)&duration.start.CMTimeEpoch epoch = v29;
      *(_OWORD *)&duration.duration.timescale = *(_OWORD *)&timeRange->duration.timescale;
      long long v37 = *(_OWORD *)&startTime->value;
      CMTimeEpoch epoch = startTime->epoch;
      uint64_t v30 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v30) {
        uint64_t v31 = v30;
      }
      else {
        uint64_t v31 = 0;
      }
      v34 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, uint64_t, uint64_t, CMTimeRange *, CMTimeRange *, uint64_t))(v31 + 168);
      if (v34)
      {
        CMTimeRange start = duration;
        *(_OWORD *)&v39.start.value = v37;
        v39.start.CMTimeEpoch epoch = epoch;
        signed int v33 = v34(v27, v28, v23, v24, &start, &v39, v8);
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v15 = [(AVMutableMovieTrack *)self _figMutableMovie];
      uint64_t v16 = [(AVMutableMovieTrack *)self trackID];
      *(_OWORD *)&start.start.value = *(_OWORD *)&startTime->value;
      start.start.CMTimeEpoch epoch = startTime->epoch;
      *(_OWORD *)&duration.start.value = *(_OWORD *)&timeRange->duration.value;
      duration.start.CMTimeEpoch epoch = timeRange->duration.epoch;
      CMTimeRangeMake(&v40, &start.start, &duration.start);
      long long v17 = *(_OWORD *)&timeRange->start.epoch;
      *(_OWORD *)&v39.start.value = *(_OWORD *)&timeRange->start.value;
      *(_OWORD *)&v39.start.CMTimeEpoch epoch = v17;
      *(_OWORD *)&v39.duration.timescale = *(_OWORD *)&timeRange->duration.timescale;
      uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v18) {
        uint64_t v19 = v18;
      }
      else {
        uint64_t v19 = 0;
      }
      uint64_t v32 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, CMTimeRange *, CMTimeRange *))(v19 + 112);
      if (v32)
      {
        CMTimeRange start = v40;
        CMTimeRange duration = v39;
        signed int v33 = v32(v15, v16, &start, &duration);
        goto LABEL_22;
      }
    }
    signed int v33 = -12782;
LABEL_22:
    v22 = 0;
    BOOL v21 = v33 == 0;
    if (!outError) {
      goto LABEL_29;
    }
    goto LABEL_23;
  }
  if (outError)
  {
    uint64_t v43 = *MEMORY[0x1E4F1D138];
    v44[0] = @"Source asset must have a value of YES for providesPreciseDurationAndTiming";
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
    AVLocalizedError(@"AVFoundationErrorDomain", -11838, v20);
    *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v21 = 0;
  v22 = 0;
LABEL_30:

  return v21;
}

- (void)insertEmptyTimeRange:(CMTimeRange *)timeRange
{
  [(AVMutableMovieTrack *)self willChangeValueForKey:@"segments"];
  uint64_t v5 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v6 = [(AVMutableMovieTrack *)self trackID];
  CMTimeRange v10 = *timeRange;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, CMTimeRange *))(v8 + 120);
  if (v9)
  {
    CMTimeRange v11 = v10;
    v9(v5, v6, &v11);
  }
  [(AVMutableMovieTrack *)self didChangeValueForKey:@"segments", *(_OWORD *)&v10.start.value, *(_OWORD *)&v10.start.epoch, *(_OWORD *)&v10.duration.timescale];
}

- (void)removeTimeRange:(CMTimeRange *)timeRange
{
  [(AVMutableMovieTrack *)self willChangeValueForKey:@"segments"];
  uint64_t v5 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v6 = [(AVMutableMovieTrack *)self trackID];
  CMTimeRange v10 = *timeRange;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, CMTimeRange *))(v8 + 136);
  if (v9)
  {
    CMTimeRange v11 = v10;
    v9(v5, v6, &v11);
  }
  [(AVMutableMovieTrack *)self didChangeValueForKey:@"segments", *(_OWORD *)&v10.start.value, *(_OWORD *)&v10.start.epoch, *(_OWORD *)&v10.duration.timescale];
}

- (void)scaleTimeRange:(CMTimeRange *)timeRange toDuration:(CMTime *)duration
{
  [(AVMutableMovieTrack *)self willChangeValueForKey:@"segments"];
  uint64_t v7 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v8 = [(AVMutableMovieTrack *)self trackID];
  CMTimeRange v13 = *timeRange;
  CMTime v12 = *duration;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  CMTimeRange v11 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, CMTimeRange *, CMTime *))(v10 + 152);
  if (v11)
  {
    CMTimeRange v15 = v13;
    CMTime v14 = v12;
    v11(v7, v8, &v15, &v14);
  }
  [(AVMutableMovieTrack *)self didChangeValueForKey:@"segments", *(_OWORD *)&v12.value, v12.epoch];
}

- (BOOL)appendSampleBuffer:(CMSampleBufferRef)sampleBuffer decodeTime:(CMTime *)outDecodeTime presentationTime:(CMTime *)outPresentationTime error:(NSError *)outError
{
  if (!sampleBuffer)
  {
    uint64_t v35 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v36 = *MEMORY[0x1E4F1C3C8];
    long long v37 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)outDecodeTime, (uint64_t)outPresentationTime, (uint64_t)outError, v6, v7, (uint64_t)"sampleBuffer != NULL");
    v38 = [v35 exceptionWithName:v36 reason:v37 userInfo:0];
LABEL_23:
    id v43 = v38;
    goto LABEL_24;
  }
  CMFormatDescriptionRef FormatDescription = CMSampleBufferGetFormatDescription(sampleBuffer);
  if (FormatDescription)
  {
    CMTimeRange v15 = FormatDescription;
    uint64_t v16 = [(AVAssetTrack *)self mediaType];
    int v17 = CMMediaTypeFromAVMediaType(v16);

    if (CMFormatDescriptionGetMediaType(v15) != v17)
    {
      v44 = (void *)MEMORY[0x1E4F1CA00];
      long long v37 = [(AVAssetTrack *)self mediaType];
      v50 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Media type of sample buffer must match receiver's media type (\"%@\")", v45, v46, v47, v48, v49, (uint64_t)v37);
      id v43 = [v44 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v50 userInfo:0];

LABEL_24:
      objc_exception_throw(v43);
    }
  }
  if (CMSampleBufferGetImageBuffer(sampleBuffer))
  {
    CMTimeRange v39 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v40 = *MEMORY[0x1E4F1C3C8];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"CMSampleBuffers containing image buffers are not supported; you must provide CMSampleBuffers containing encoded video",
      v18,
      v19,
      v20,
      v21,
      v22,
    long long v37 = v51);
    v38 = [v39 exceptionWithName:v40 reason:v37 userInfo:0];
    goto LABEL_23;
  }
  if (FigSampleBufferGetCaptionGroup())
  {
    uint64_t v41 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v42 = *MEMORY[0x1E4F1C3C8];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"CMSampleBuffers containing caption groups are not supported; you must provide CMSampleBuffers containing encoded media data",
      v23,
      v24,
      v25,
      v26,
      v27,
    long long v37 = v51);
    v38 = [v41 exceptionWithName:v42 reason:v37 userInfo:0];
    goto LABEL_23;
  }
  long long v54 = *MEMORY[0x1E4F1F9F8];
  CMTimeEpoch v55 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  long long v52 = v54;
  CMTimeEpoch v53 = v55;
  uint64_t v28 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v29 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v30 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v30) {
    uint64_t v31 = v30;
  }
  else {
    uint64_t v31 = 0;
  }
  uint64_t v32 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, CMSampleBufferRef, void, long long *, long long *))(v31 + 64);
  if (!v32)
  {
    signed int v33 = -12782;
    if (!outDecodeTime) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  signed int v33 = v32(v28, v29, sampleBuffer, 0, &v54, &v52);
  if (outDecodeTime)
  {
LABEL_13:
    *(_OWORD *)&outDecodeTime->value = v54;
    outDecodeTime->CMTimeEpoch epoch = v55;
  }
LABEL_14:
  if (outPresentationTime)
  {
    *(_OWORD *)&outPresentationTime->value = v52;
    outPresentationTime->CMTimeEpoch epoch = v53;
  }
  if (outError && v33)
  {
    AVLocalizedErrorWithUnderlyingOSStatus(v33, 0);
    *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  return v33 == 0;
}

- (BOOL)insertMediaTimeRange:(CMTimeRange *)mediaTimeRange intoTimeRange:(CMTimeRange *)trackTimeRange
{
  uint64_t v7 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v8 = [(AVMutableMovieTrack *)self trackID];
  CMTimeRange v14 = *trackTimeRange;
  CMTimeRange v13 = *mediaTimeRange;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  CMTimeRange v11 = *(unsigned int (**)(OpaqueFigMutableMovie *, uint64_t, CMTimeRange *, CMTimeRange *))(v10 + 112);
  if (!v11) {
    return 0;
  }
  CMTimeRange v16 = v14;
  CMTimeRange v15 = v13;
  return v11(v7, v8, &v16, &v15) == 0;
}

- (BOOL)appendMediaData:(id)a3 dataOffset:(int64_t *)a4
{
  id v6 = a3;
  CMTime v12 = v6;
  uint64_t v18 = 0;
  CFTypeRef cf = 0;
  if (!v6)
  {
    CMTimeRange v15 = (void *)MEMORY[0x1E4F1CA00];
    CMTimeRange v16 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v7, v8, v9, v10, v11, (uint64_t)"data != nil");
    id v17 = [v15 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];

    objc_exception_throw(v17);
  }
  [v6 length];
  int BlockBufferWithCFDataNoCopy = FigCreateBlockBufferWithCFDataNoCopy();

  return BlockBufferWithCFDataNoCopy == 0;
}

- (id)availableMetadataFormats
{
  CFTypeRef cf = 0;
  BOOL v3 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v4 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, void, void, CFTypeRef *))(v6 + 48);
  if (v7)
  {
    int v8 = v7(v3, v4, *MEMORY[0x1E4F33158], *MEMORY[0x1E4F1CF80], &cf);
    uint64_t v9 = (void *)cf;
    if (v8)
    {
LABEL_13:
      if (v9) {
        CFRelease(v9);
      }
      goto LABEL_9;
    }
    if (cf)
    {
      CFTypeID v10 = CFGetTypeID(cf);
      CFTypeID TypeID = CFArrayGetTypeID();
      uint64_t v9 = (void *)cf;
      if (v10 == TypeID)
      {
        CFTypeRef cf = 0;
        if (v9) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
      goto LABEL_13;
    }
  }
LABEL_9:
  uint64_t v9 = [MEMORY[0x1E4F1C978] array];
LABEL_10:
  return v9;
}

- (NSArray)metadataForFormat:(AVMetadataFormat)format
{
  uint64_t v4 = format;
  uint64_t v5 = [(AVAssetTrack *)self _figTrackReader];
  uint64_t v6 = 0;
  CFTypeRef cf = 0;
  CFArrayRef theArray = 0;
  if (v4 && v5)
  {
    uint64_t FigBaseObject = FigTrackReaderGetFigBaseObject();
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    CFTypeID v10 = *(unsigned int (**)(uint64_t, void, void, CFArrayRef *))(v9 + 48);
    if (!v10) {
      goto LABEL_30;
    }
    uint64_t v11 = *MEMORY[0x1E4F1CF80];
    if (v10(FigBaseObject, *MEMORY[0x1E4F34A78], *MEMORY[0x1E4F1CF80], &theArray)) {
      goto LABEL_30;
    }
    if (!theArray)
    {
      uint64_t v29 = 0;
      goto LABEL_35;
    }
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count < 1)
    {
LABEL_30:
      uint64_t v6 = 0;
    }
    else
    {
      CFIndex v13 = 0;
      uint64_t v6 = 0;
      uint64_t v14 = *MEMORY[0x1E4F33078];
      signed int v33 = @"org.mp4ra";
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v13);
        uint64_t v16 = FigMetadataReaderGetFigBaseObject();
        uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v17) {
          uint64_t v18 = v17;
        }
        else {
          uint64_t v18 = 0;
        }
        uint64_t v19 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(v18 + 48);
        if (v19 && !v19(v16, v14, v11, &cf) && [(NSString *)v4 isEqualToString:cf])
        {
          uint64_t v20 = +[AVMetadataEnumerator metadataEnumeratorWithMetadataReader:ValueAtIndex];
          uint64_t v21 = (void *)MEMORY[0x1E4F1CA48];
          uint64_t v22 = [v20 allObjects];
          uint64_t v23 = [v21 arrayWithArray:v22];

          if ([(NSString *)v4 isEqualToString:@"com.apple.quicktime.udta"]
            || [(NSString *)v4 isEqualToString:v33])
          {
            BOOL v24 = [(NSString *)v4 isEqualToString:@"com.apple.quicktime.udta", v33];
            uint64_t v25 = @"udta";
            if (!v24) {
              uint64_t v25 = @"uiso";
            }
            uint64_t v26 = v25;
            uint64_t v27 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:1835365473];
            uint64_t v28 = +[AVMetadataItem metadataItemsFromArray:v23 withKey:v27 keySpace:v26];

            if (v28 && [v28 count]) {
              [v23 removeObjectsInArray:v28];
            }
          }
          uint64_t v6 = v23;
        }
        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0;
        }
        ++v13;
      }
      while (Count != v13);
    }
  }
  if (theArray) {
    CFRelease(theArray);
  }
  uint64_t v29 = v6;
LABEL_35:
  if (cf) {
    CFRelease(cf);
  }
  if (v29)
  {
    id v30 = v29;
  }
  else
  {
    id v30 = [MEMORY[0x1E4F1C978] array];
  }
  uint64_t v31 = v30;

  return (NSArray *)v31;
}

- (NSArray)metadata
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(AVMutableMovieTrack *)self availableMetadataFormats];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = -[AVMutableMovieTrack metadataForFormat:](self, "metadataForFormat:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        [v4 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v4;
}

- (void)setMetadata:(NSArray *)metadata
{
  CFTypeID v10 = metadata;
  uint64_t v4 = +[AVMetadataItem _figMetadataPropertyFromMetadataItems:](AVMetadataItem, "_figMetadataPropertyFromMetadataItems:");
  id v5 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v6 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, void, void *))(v8 + 56);
  if (v9) {
    v9(v5, v6, *MEMORY[0x1E4F331C0], v4);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_mutableMovieTrackInternal->metadataWaitingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)addTrackAssociationToTrack:(AVMovieTrack *)movieTrack type:(AVTrackAssociationType)trackAssociationType
{
  uint64_t v26 = movieTrack;
  uint64_t v7 = trackAssociationType;
  uint64_t v8 = [(AVAssetTrack *)self asset];
  uint64_t v9 = [(AVAssetTrack *)v26 asset];

  if (v8 != v9)
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v23 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"the tracks being associated must belong to the same movie", v10, v11, v12, v13, v14, v25);
    id v24 = [v22 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v23 userInfo:0];

    objc_exception_throw(v24);
  }
  CMTimeRange v15 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v16 = AVOSTypeForString(v7);
  uint64_t v17 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v18 = [(AVAssetTrack *)v26 trackID];
  uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v19) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = 0;
  }
  uint64_t v21 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, uint64_t, uint64_t))(v20 + 184);
  if (v21) {
    v21(v15, v16, v17, v18);
  }
}

- (void)removeTrackAssociationToTrack:(AVMovieTrack *)movieTrack type:(AVTrackAssociationType)trackAssociationType
{
  uint64_t v26 = movieTrack;
  uint64_t v7 = trackAssociationType;
  uint64_t v8 = [(AVAssetTrack *)self asset];
  uint64_t v9 = [(AVAssetTrack *)v26 asset];

  if (v8 != v9)
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v23 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"the tracks being dissociated must belong to the same movie", v10, v11, v12, v13, v14, v25);
    id v24 = [v22 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v23 userInfo:0];

    objc_exception_throw(v24);
  }
  CMTimeRange v15 = [(AVMutableMovieTrack *)self _figMutableMovie];
  uint64_t v16 = AVOSTypeForString(v7);
  uint64_t v17 = [(AVMutableMovieTrack *)self trackID];
  uint64_t v18 = [(AVAssetTrack *)v26 trackID];
  uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v19) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = 0;
  }
  uint64_t v21 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, uint64_t, uint64_t))(v20 + 192);
  if (v21) {
    v21(v15, v16, v17, v18);
  }
}

@end