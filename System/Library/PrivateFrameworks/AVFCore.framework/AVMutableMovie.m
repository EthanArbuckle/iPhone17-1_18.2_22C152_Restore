@interface AVMutableMovie
+ (AVMutableMovie)movieWithData:(NSData *)data options:(NSDictionary *)options error:(NSError *)outError;
+ (AVMutableMovie)movieWithSettingsFromMovie:(AVMovie *)movie options:(NSDictionary *)options error:(NSError *)outError;
+ (AVMutableMovie)movieWithURL:(NSURL *)URL options:(NSDictionary *)options error:(NSError *)outError;
+ (BOOL)expectsPropertyRevisedNotifications;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- (AVMediaDataStorage)defaultMediaDataStorage;
- (AVMutableMovie)init;
- (AVMutableMovie)initWithData:(NSData *)data options:(NSDictionary *)options error:(NSError *)outError;
- (AVMutableMovie)initWithData:(id)a3 options:(id)a4;
- (AVMutableMovie)initWithFileType:(id)a3 copySettingsFromMovie:(id)a4 options:(id)a5;
- (AVMutableMovie)initWithSettingsFromMovie:(AVMovie *)movie options:(NSDictionary *)options error:(NSError *)outError;
- (AVMutableMovie)initWithSettingsFromMovie:(id)a3 options:(id)a4;
- (AVMutableMovie)initWithURL:(NSURL *)URL options:(NSDictionary *)options error:(NSError *)outError;
- (AVMutableMovie)initWithURL:(id)a3 options:(id)a4;
- (AVMutableMovieTrack)addMutableTrackWithMediaType:(AVMediaType)mediaType copySettingsFromTrack:(AVAssetTrack *)track options:(NSDictionary *)options;
- (AVMutableMovieTrack)mutableTrackCompatibleWithTrack:(AVAssetTrack *)track;
- (AVMutableMovieTrack)trackWithTrackID:(CMPersistentTrackID)trackID;
- (BOOL)insertTimeRange:(CMTimeRange *)timeRange ofAsset:(AVAsset *)asset atTime:(CMTime *)startTime copySampleData:(BOOL)copySampleData error:(NSError *)outError;
- (BOOL)isDefunct;
- (BOOL)isModified;
- (CGAffineTransform)preferredTransform;
- (CMTime)interleavingPeriod;
- (CMTimeScale)timescale;
- (Class)_classForTrackInspectors;
- (NSArray)addMutableTracksCopyingSettingsFromTracks:(NSArray *)existingTracks options:(NSDictionary *)options;
- (NSArray)metadata;
- (NSArray)metadataForFormat:(AVMetadataFormat)format;
- (NSArray)tracks;
- (NSArray)tracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic;
- (NSArray)tracksWithMediaType:(AVMediaType)mediaType;
- (OpaqueFigFormatReader)_copyFormatReader;
- (OpaqueFigMutableMovie)_figMutableMovie;
- (float)preferredRate;
- (float)preferredVolume;
- (id)URL;
- (id)_addMutableTrackWithMediaType:(id)a3 copySettingsFromTrack:(id)a4 options:(id)a5;
- (id)_initWithFigAsset:(OpaqueFigAsset *)a3;
- (id)_initWithFigError:(int)a3 userInfo:(id)a4;
- (id)_initWithFormatReader:(OpaqueFigFormatReader *)a3 URL:(id)a4 data:(id)a5 options:(id)a6;
- (id)_initializationOptions;
- (id)_mutableTracks;
- (id)availableMetadataFormats;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (id)description;
- (id)fileType;
- (id)trackReferences;
- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4;
- (void)_addFigAssetNotifications;
- (void)_removeFigAssetNotifications;
- (void)_signalMetadataUpdated;
- (void)_signalTracksUpdated;
- (void)dealloc;
- (void)insertEmptyTimeRange:(CMTimeRange *)timeRange;
- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4;
- (void)removeTimeRange:(CMTimeRange *)timeRange;
- (void)removeTrack:(AVMovieTrack *)track;
- (void)scaleTimeRange:(CMTimeRange *)timeRange toDuration:(CMTime *)duration;
- (void)setDefaultMediaDataStorage:(AVMediaDataStorage *)defaultMediaDataStorage;
- (void)setInterleavingPeriod:(CMTime *)interleavingPeriod;
- (void)setMetadata:(NSArray *)metadata;
- (void)setModified:(BOOL)modified;
- (void)setPreferredRate:(float)preferredRate;
- (void)setPreferredTransform:(CGAffineTransform *)preferredTransform;
- (void)setPreferredVolume:(float)preferredVolume;
- (void)setTimescale:(CMTimeScale)timescale;
@end

@implementation AVMutableMovie

- (AVMutableMovie)initWithURL:(id)a3 options:(id)a4
{
  return [(AVMutableMovie *)self initWithURL:a3 options:a4 error:0];
}

- (AVMutableMovie)initWithData:(id)a3 options:(id)a4
{
  return [(AVMutableMovie *)self initWithData:a3 options:a4 error:0];
}

- (AVMutableMovie)initWithSettingsFromMovie:(id)a3 options:(id)a4
{
  return [(AVMutableMovie *)self initWithSettingsFromMovie:a3 options:a4 error:0];
}

+ (AVMutableMovie)movieWithURL:(NSURL *)URL options:(NSDictionary *)options error:(NSError *)outError
{
  v8 = URL;
  v9 = options;
  v10 = (void *)[objc_alloc((Class)a1) initWithURL:v8 options:v9 error:outError];

  return (AVMutableMovie *)v10;
}

- (AVMutableMovie)initWithURL:(NSURL *)URL options:(NSDictionary *)options error:(NSError *)outError
{
  v10 = URL;
  v11 = options;
  v17 = v11;
  CFTypeRef cf = 0;
  CFTypeRef v35 = 0;
  CFTypeRef v36 = 0;
  if (!v10)
  {
    v30 = (void *)MEMORY[0x1E4F1CA00];
    v31 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v12, v13, v14, v15, v16, (uint64_t)"URL != nil");
    id v32 = [v30 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v31 userInfo:0];

    objc_exception_throw(v32);
  }
  v18 = _figOptionsFromAVMovieOptions(v11);
  signed int v19 = FigMutableMovieRemoteCreateWithURL();
  if (v19 || (signed int v19 = _configureFigObjects((uint64_t *)&cf, v17)) != 0)
  {
    initializationOptions = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v10 forKey:*MEMORY[0x1E4F289D0]];
    v21 = AVLocalizedErrorWithUnderlyingOSStatus(v19, initializationOptions);
    int v22 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v33.receiver = self;
  v33.super_class = (Class)AVMutableMovie;
  v23 = [(AVMovie *)&v33 _initWithFigAsset:v36];
  if (v23)
  {
    uint64_t v24 = _createMutableMovieStorageWithFigObjects((uint64_t)&cf);
    mutableMovieInternal = v23->_mutableMovieInternal;
    v23->_mutableMovieInternal = (AVMutableMovieInternal *)v24;

    if (v23->_mutableMovieInternal)
    {
      [(AVMutableMovie *)v23 _addFigAssetNotifications];
      objc_storeStrong((id *)&v23->_mutableMovieInternal->URL, URL);
      uint64_t v26 = [(NSDictionary *)v17 copy];
      v21 = 0;
      v27 = v23->_mutableMovieInternal;
      initializationOptions = v27->initializationOptions;
      v27->initializationOptions = (NSDictionary *)v26;
      int v22 = 1;
      self = v23;
      goto LABEL_8;
    }
    v21 = 0;
    int v22 = 0;
    self = v23;
  }
  else
  {
    self = 0;
    v21 = 0;
    int v22 = 0;
  }
LABEL_9:
  if (cf) {
    CFRelease(cf);
  }
  if (v35) {
    CFRelease(v35);
  }
  if (v36) {
    CFRelease(v36);
  }
  if (v22)
  {
    v28 = self;
  }
  else
  {
    v28 = 0;
    if (outError) {
      *outError = (NSError *)v21;
    }
  }

  return v28;
}

+ (AVMutableMovie)movieWithData:(NSData *)data options:(NSDictionary *)options error:(NSError *)outError
{
  v8 = data;
  v9 = options;
  v10 = (void *)[objc_alloc((Class)a1) initWithData:v8 options:v9 error:outError];

  return (AVMutableMovie *)v10;
}

- (AVMutableMovie)initWithData:(NSData *)data options:(NSDictionary *)options error:(NSError *)outError
{
  v9 = data;
  v10 = options;
  CFTypeRef cf = 0;
  CFTypeRef v37 = 0;
  CFTypeRef v38 = 0;
  if (![(NSData *)v9 length])
  {
    id v32 = (void *)MEMORY[0x1E4F1CA00];
    objc_super v33 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v11, v12, v13, v14, v15, (uint64_t)"[data length] > 0");
    id v34 = [v32 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v33 userInfo:0];

    objc_exception_throw(v34);
  }
  uint64_t v16 = (void *)[(NSData *)v9 copy];

  if (!v10)
  {
    v10 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  uint64_t v17 = *MEMORY[0x1E4F330E0];
  v18 = [(NSDictionary *)v10 objectForKeyedSubscript:*MEMORY[0x1E4F330E0]];

  if (!v18)
  {
    signed int v19 = (NSDictionary *)[(NSDictionary *)v10 mutableCopy];
    [(NSDictionary *)v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v17];

    v10 = v19;
  }
  v20 = _figOptionsFromAVMovieOptions(v10);
  signed int v21 = FigMutableMovieRemoteCreateFromData();
  if (v21 || (signed int v21 = _configureFigObjects((uint64_t *)&cf, v10)) != 0)
  {
    AVLocalizedErrorWithUnderlyingOSStatus(v21, 0);
    v23 = int v22 = 0;
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)AVMutableMovie;
    uint64_t v24 = [(AVMovie *)&v35 _initWithFigAsset:v38];
    if (v24)
    {
      uint64_t v25 = _createMutableMovieStorageWithFigObjects((uint64_t)&cf);
      mutableMovieInternal = v24->_mutableMovieInternal;
      v24->_mutableMovieInternal = (AVMutableMovieInternal *)v25;

      if (v24->_mutableMovieInternal)
      {
        [(AVMutableMovie *)v24 _addFigAssetNotifications];
        objc_storeStrong((id *)&v24->_mutableMovieInternal->data, v16);
        uint64_t v27 = [(NSDictionary *)v10 copy];
        v28 = v24->_mutableMovieInternal;
        initializationOptions = v28->initializationOptions;
        v28->initializationOptions = (NSDictionary *)v27;

        v23 = 0;
        int v22 = 1;
      }
      else
      {
        v23 = 0;
        int v22 = 0;
      }
      self = v24;
    }
    else
    {
      v23 = 0;
      int v22 = 0;
      self = 0;
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v37) {
    CFRelease(v37);
  }
  if (v38) {
    CFRelease(v38);
  }
  if (v22)
  {
    v30 = self;
  }
  else
  {
    v30 = 0;
    if (outError) {
      *outError = (NSError *)v23;
    }
  }

  return v30;
}

- (AVMutableMovie)init
{
  return [(AVMutableMovie *)self initWithSettingsFromMovie:0 options:0 error:0];
}

- (AVMutableMovie)initWithFileType:(id)a3 copySettingsFromMovie:(id)a4 options:(id)a5
{
  return [(AVMutableMovie *)self initWithSettingsFromMovie:a4 options:a5 error:0];
}

+ (AVMutableMovie)movieWithSettingsFromMovie:(AVMovie *)movie options:(NSDictionary *)options error:(NSError *)outError
{
  v7 = movie;
  v8 = options;
  v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSettingsFromMovie:v7 options:v8 error:outError];

  return (AVMutableMovie *)v9;
}

- (AVMutableMovie)initWithSettingsFromMovie:(AVMovie *)movie options:(NSDictionary *)options error:(NSError *)outError
{
  v8 = movie;
  v9 = options;
  CFTypeRef cf = 0;
  CFTypeRef v25 = 0;
  CFTypeRef v26 = 0;
  v10 = [(AVMovie *)v8 _copyFormatReader];
  uint64_t v11 = _figOptionsFromAVMovieOptions(v9);
  signed int Empty = FigMutableMovieRemoteCreateEmpty();
  if (Empty || (signed int Empty = _configureFigObjects((uint64_t *)&cf, v9)) != 0)
  {
    AVLocalizedErrorWithUnderlyingOSStatus(Empty, 0);
    v14 = int v13 = 0;
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)AVMutableMovie;
    uint64_t v15 = [(AVMovie *)&v23 _initWithFigAsset:v26];
    if (v15)
    {
      uint64_t v16 = _createMutableMovieStorageWithFigObjects((uint64_t)&cf);
      mutableMovieInternal = v15->_mutableMovieInternal;
      v15->_mutableMovieInternal = (AVMutableMovieInternal *)v16;

      if (v15->_mutableMovieInternal)
      {
        [(AVMutableMovie *)v15 _addFigAssetNotifications];
        uint64_t v18 = [(NSDictionary *)v9 copy];
        signed int v19 = v15->_mutableMovieInternal;
        initializationOptions = v19->initializationOptions;
        v19->initializationOptions = (NSDictionary *)v18;

        uint64_t v14 = 0;
        int v13 = 1;
      }
      else
      {
        uint64_t v14 = 0;
        int v13 = 0;
      }
      self = v15;
    }
    else
    {
      self = 0;
      uint64_t v14 = 0;
      int v13 = 0;
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v25) {
    CFRelease(v25);
  }
  if (v26) {
    CFRelease(v26);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v13)
  {
    signed int v21 = self;
  }
  else
  {
    signed int v21 = 0;
    if (outError) {
      *outError = (NSError *)v14;
    }
  }

  return v21;
}

- (id)_initWithFormatReader:(OpaqueFigFormatReader *)a3 URL:(id)a4 data:(id)a5 options:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  CFTypeRef cf = 0;
  CFTypeRef v31 = 0;
  CFTypeRef v32 = 0;
  int v13 = _figOptionsFromAVMovieOptions(v12);
  signed int v14 = FigMutableMovieRemoteCreateFromFormatReader();
  if (v14 || (signed int v14 = _configureFigObjects((uint64_t *)&cf, v12)) != 0)
  {
    if (v10)
    {
      initializationOptions = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v10 forKey:*MEMORY[0x1E4F289D0]];
    }
    else
    {
      initializationOptions = 0;
    }
    objc_super v23 = AVLocalizedErrorWithUnderlyingOSStatus(v14, initializationOptions);
    int v25 = 0;
    int v26 = 0;
    if (v10) {
      goto LABEL_10;
    }
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)AVMutableMovie;
    uint64_t v16 = [(AVMovie *)&v29 _initWithFigAsset:v32];
    if (v16)
    {
      uint64_t v17 = _createMutableMovieStorageWithFigObjects((uint64_t)&cf);
      mutableMovieInternal = v16->_mutableMovieInternal;
      v16->_mutableMovieInternal = (AVMutableMovieInternal *)v17;

      if (v16->_mutableMovieInternal)
      {
        [(AVMutableMovie *)v16 _addFigAssetNotifications];
        objc_storeStrong((id *)&v16->_mutableMovieInternal->URL, a4);
        uint64_t v19 = [v11 copy];
        v20 = v16->_mutableMovieInternal;
        data = v20->data;
        v20->data = (NSData *)v19;

        uint64_t v22 = [v12 copy];
        objc_super v23 = 0;
        uint64_t v24 = v16->_mutableMovieInternal;
        initializationOptions = v24->initializationOptions;
        v24->initializationOptions = (NSDictionary *)v22;
        int v25 = 1;
        self = v16;
LABEL_10:

        int v26 = v25;
        goto LABEL_11;
      }
      objc_super v23 = 0;
      int v26 = 0;
      self = v16;
    }
    else
    {
      self = 0;
      objc_super v23 = 0;
      int v26 = 0;
    }
  }
LABEL_11:
  if (cf) {
    CFRelease(cf);
  }
  if (v31) {
    CFRelease(v31);
  }
  if (v32) {
    CFRelease(v32);
  }
  if (v26) {
    uint64_t v27 = self;
  }
  else {
    uint64_t v27 = 0;
  }

  return v27;
}

- (id)_initWithFigAsset:(OpaqueFigAsset *)a3
{
  if ([(AVMutableMovie *)self isMemberOfClass:objc_opt_class()])
  {
    id v11 = (void *)MEMORY[0x1E4F1CA00];
    id v12 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v5, v6, v7, v8, v9, (uint64_t)"![self isMemberOfClass:[AVMutableMovie class]]");
    id v13 = [v11 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v12 userInfo:0];

    objc_exception_throw(v13);
  }

  return 0;
}

- (id)_initWithFigError:(int)a3 userInfo:(id)a4
{
  id v6 = a4;
  if ([(AVMutableMovie *)self isMemberOfClass:objc_opt_class()])
  {
    id v13 = (void *)MEMORY[0x1E4F1CA00];
    signed int v14 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v7, v8, v9, v10, v11, (uint64_t)"![self isMemberOfClass:[AVMutableMovie class]]");
    id v15 = [v13 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0];

    objc_exception_throw(v15);
  }

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CFTypeRef cf = 0;
  v4 = [(AVMutableMovie *)self _figMutableMovie];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(unsigned int (**)(OpaqueFigMutableMovie *, uint64_t, void, CFTypeRef *))(v6 + 8);
  if (!v7 || v7(v4, 1, 0, &cf))
  {
    id v13 = 0;
  }
  else
  {
    uint64_t v8 = [AVMovie alloc];
    CFTypeRef v9 = cf;
    uint64_t v10 = [(AVMutableMovie *)self URL];
    uint64_t v11 = [(AVMutableMovie *)self data];
    id v12 = [(AVMutableMovie *)self _initializationOptions];
    id v13 = [(AVMovie *)v8 _initWithFormatReader:v9 URL:v10 data:v11 options:v12];
  }
  if (cf) {
    CFRelease(cf);
  }
  return v13;
}

- (void)_addFigAssetNotifications
{
  figAsset = self->_mutableMovieInternal->figAsset;
  if (figAsset)
  {
    id v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    v4 = [(AVAsset *)self _weakReference];
    [v5 addListenerWithWeakReference:v4 callback:mutableMovieNotificationHandler name:*MEMORY[0x1E4F31EE0] object:figAsset flags:0];
  }
}

- (void)_removeFigAssetNotifications
{
  figAsset = self->_mutableMovieInternal->figAsset;
  if (figAsset)
  {
    id v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    v4 = [(AVAsset *)self _weakReference];
    [v5 removeListenerWithWeakReference:v4 callback:mutableMovieNotificationHandler name:*MEMORY[0x1E4F31EE0] object:figAsset];
  }
}

- (void)dealloc
{
  if (self->_mutableMovieInternal)
  {
    [(AVMutableMovie *)self _removeFigAssetNotifications];
    mutableMovieInternal = self->_mutableMovieInternal;
    figMutableMovie = mutableMovieInternal->figMutableMovie;
    if (figMutableMovie)
    {
      CFRelease(figMutableMovie);
      mutableMovieInternal = self->_mutableMovieInternal;
    }
    formatReader = mutableMovieInternal->formatReader;
    if (formatReader)
    {
      CFRelease(formatReader);
      mutableMovieInternal = self->_mutableMovieInternal;
    }
    figAsset = mutableMovieInternal->figAsset;
    if (figAsset) {
      CFRelease(figAsset);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)AVMutableMovie;
  [(AVMovie *)&v7 dealloc];
}

- (Class)_classForTrackInspectors
{
  return (Class)objc_opt_class();
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(AVMutableMovie *)self _figMutableMovie])
  {
    int64_t v7 = 2;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AVMutableMovie;
    int64_t v7 = [(AVAsset *)&v9 statusOfValueForKey:v6 error:a4];
  }

  return v7;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  int64_t v7 = (void (**)(void))a4;
  if ([(AVMutableMovie *)self _figMutableMovie])
  {
    if (v7) {
      v7[2](v7);
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVMutableMovie;
    [(AVAsset *)&v8 loadValuesAsynchronouslyForKeys:v6 completionHandler:v7];
  }
}

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 1;
}

- (id)fileType
{
  return 0;
}

- (AVMediaDataStorage)defaultMediaDataStorage
{
  CFTypeRef cf = 0;
  [(AVMutableMovie *)self _figMutableMovie];
  uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v4 + 48);
  if (!v5 || v5(FigBaseObject, *MEMORY[0x1E4F330F8], *MEMORY[0x1E4F1CF80], &cf)) {
    goto LABEL_9;
  }
  if (!cf)
  {
    objc_super v8 = 0;
    goto LABEL_12;
  }
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 == CFURLGetTypeID())
  {
    int64_t v7 = [AVMediaDataStorage alloc];
    objc_super v8 = [(AVMediaDataStorage *)v7 initWithURL:cf options:0];
  }
  else
  {
LABEL_9:
    objc_super v8 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
LABEL_12:
  return v8;
}

- (id)URL
{
  return self->_mutableMovieInternal->URL;
}

- (id)data
{
  return self->_mutableMovieInternal->data;
}

- (id)_initializationOptions
{
  return self->_mutableMovieInternal->initializationOptions;
}

- (id)_mutableTracks
{
  makeTracksArrayOnce = self->_mutableMovieInternal->makeTracksArrayOnce;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__AVMutableMovie__mutableTracks__block_invoke;
  v5[3] = &unk_1E57B76B0;
  v5[4] = self;
  [(AVDispatchOnce *)makeTracksArrayOnce runBlockOnce:v5];
  return self->_mutableMovieInternal->tracks;
}

void __32__AVMutableMovie__mutableTracks__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = *(void *)(a1 + 32);
  CFTypeRef cf = 0;
  objc_storeStrong((id *)(*(void *)(v3 + 24) + 72), v2);
  [*(id *)(a1 + 32) _figMutableMovie];
  uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  int64_t v7 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v6 + 48);
  if (v7 && !v7(FigBaseObject, *MEMORY[0x1E4F33148], *MEMORY[0x1E4F1CF80], &cf))
  {
    if (!cf) {
      goto LABEL_23;
    }
    CFTypeID v8 = CFGetTypeID(cf);
    if (v8 == CFArrayGetTypeID())
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      objc_super v9 = (id)cf;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v16;
LABEL_10:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          if (objc_msgSend(v13, "integerValue", (void)v15))
          {
            signed int v14 = +[AVMutableMovieTrack trackWithTrackID:forMovie:](AVMutableMovieTrack, "trackWithTrackID:forMovie:");
            if (v14) {
              [v2 addObject:v14];
            }
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
            if (v10) {
              goto LABEL_10;
            }
            break;
          }
        }
      }
    }
  }
  if (cf) {
    CFRelease(cf);
  }
LABEL_23:
}

- (NSArray)tracks
{
  v2 = [(AVMutableMovie *)self _mutableTracks];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (AVMutableMovieTrack)trackWithTrackID:(CMPersistentTrackID)trackID
{
  v5.receiver = self;
  v5.super_class = (Class)AVMutableMovie;
  uint64_t v3 = [(AVMovie *)&v5 trackWithTrackID:*(void *)&trackID];
  return (AVMutableMovieTrack *)v3;
}

- (NSArray)tracksWithMediaType:(AVMediaType)mediaType
{
  v5.receiver = self;
  v5.super_class = (Class)AVMutableMovie;
  uint64_t v3 = [(AVMovie *)&v5 tracksWithMediaType:mediaType];
  return (NSArray *)v3;
}

- (NSArray)tracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  v5.receiver = self;
  v5.super_class = (Class)AVMutableMovie;
  uint64_t v3 = [(AVMovie *)&v5 tracksWithMediaCharacteristic:mediaCharacteristic];
  return (NSArray *)v3;
}

- (id)trackReferences
{
  CFTypeRef cf = 0;
  [(AVMutableMovie *)self _figMutableMovie];
  uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  objc_super v5 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v4 + 48);
  if (v5)
  {
    int v6 = v5(FigBaseObject, *MEMORY[0x1E4F33140], *MEMORY[0x1E4F1CF80], &cf);
    int64_t v7 = (void *)cf;
    if (v6)
    {
LABEL_10:
      if (v7) {
        CFRelease(v7);
      }
      goto LABEL_12;
    }
    if (cf)
    {
      CFTypeID v8 = CFGetTypeID(cf);
      CFTypeID TypeID = CFDictionaryGetTypeID();
      int64_t v7 = (void *)cf;
      if (v8 == TypeID)
      {
        if (cf) {
          goto LABEL_13;
        }
        int64_t v7 = 0;
      }
      goto LABEL_10;
    }
  }
LABEL_12:
  int64_t v7 = [MEMORY[0x1E4F1C9E8] dictionary];
LABEL_13:
  return v7;
}

- (BOOL)isModified
{
  CFTypeRef cf = 0;
  [(AVMutableMovie *)self _figMutableMovie];
  uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  objc_super v5 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v4 + 48);
  if (!v5) {
    return 0;
  }
  int v6 = v5(FigBaseObject, *MEMORY[0x1E4F33110], *MEMORY[0x1E4F1CF80], &cf);
  CFTypeRef v7 = cf;
  if (v6) {
    goto LABEL_12;
  }
  if (!cf) {
    return 0;
  }
  CFTypeID v8 = CFGetTypeID(cf);
  CFTypeID TypeID = CFBooleanGetTypeID();
  CFTypeRef v7 = cf;
  if (v8 != TypeID)
  {
LABEL_12:
    BOOL v10 = 0;
    if (!v7) {
      return v10;
    }
    goto LABEL_9;
  }
  BOOL v10 = CFBooleanGetValue((CFBooleanRef)cf) != 0;
  CFTypeRef v7 = cf;
  if (cf) {
LABEL_9:
  }
    CFRelease(v7);
  return v10;
}

- (void)setModified:(BOOL)modified
{
  BOOL v3 = modified;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(AVMutableMovie *)self _figMutableMovie];
  if (v3) {
    objc_super v5 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    objc_super v5 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  objc_super v9 = *(void (**)(uint64_t, void, void))(v8 + 56);
  if (v9) {
    v9(FigBaseObject, *MEMORY[0x1E4F33110], *v5);
  }
  if (!v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    BOOL v10 = [(AVMutableMovie *)self tracks];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v13++) setModified:0];
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (OpaqueFigMutableMovie)_figMutableMovie
{
  return self->_mutableMovieInternal->figMutableMovie;
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  result = self->_mutableMovieInternal->formatReader;
  if (result) {
    return (OpaqueFigFormatReader *)CFRetain(result);
  }
  return result;
}

- (void)_signalTracksUpdated
{
}

- (void)_signalMetadataUpdated
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  CFTypeRef cf = 0;
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  [(AVMutableMovie *)self _figMutableMovie];
  uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v8 = *(void *)(VTable + 8);
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(VTable + 8);
  uint64_t v7 = v8;
  if (v8) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0;
  }
  BOOL v10 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v9 + 48);
  if (v10)
  {
    int v11 = v10(FigBaseObject, *MEMORY[0x1E4F33118], *MEMORY[0x1E4F1CF80], &cf);
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)cf;
    if (!v11)
    {
      if (!cf) {
        return result;
      }
      CFTypeID v12 = CFGetTypeID(cf);
      CFTypeID TypeID = CFDictionaryGetTypeID();
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)cf;
      if (v12 == TypeID)
      {
        CMTimeMakeFromDictionary(&v14, (CFDictionaryRef)cf);
        *(_OWORD *)&retstr->var0 = *(_OWORD *)&v14.value;
        result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)cf;
        retstr->var3 = v14.epoch;
      }
    }
    if (result) {
      CFRelease(result);
    }
  }
  return result;
}

- (float)preferredRate
{
  CFTypeRef cf = 0;
  float valuePtr = 1.0;
  [(AVMutableMovie *)self _figMutableMovie];
  uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  objc_super v5 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v4 + 48);
  if (v5)
  {
    int v6 = v5(FigBaseObject, *MEMORY[0x1E4F33130], *MEMORY[0x1E4F1CF80], &cf);
    CFTypeRef v7 = cf;
    if (!v6)
    {
      if (!cf) {
        return valuePtr;
      }
      CFTypeID v8 = CFGetTypeID(cf);
      CFTypeID TypeID = CFNumberGetTypeID();
      CFTypeRef v7 = cf;
      if (v8 == TypeID)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberFloat32Type, &valuePtr);
        CFTypeRef v7 = cf;
      }
    }
    if (v7) {
      CFRelease(v7);
    }
  }
  return valuePtr;
}

- (float)preferredVolume
{
  CFTypeRef cf = 0;
  float valuePtr = 1.0;
  [(AVMutableMovie *)self _figMutableMovie];
  uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  objc_super v5 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v4 + 48);
  if (v5)
  {
    int v6 = v5(FigBaseObject, *MEMORY[0x1E4F33138], *MEMORY[0x1E4F1CF80], &cf);
    CFTypeRef v7 = cf;
    if (!v6)
    {
      if (!cf) {
        return valuePtr;
      }
      CFTypeID v8 = CFGetTypeID(cf);
      CFTypeID TypeID = CFNumberGetTypeID();
      CFTypeRef v7 = cf;
      if (v8 == TypeID)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberFloat32Type, &valuePtr);
        CFTypeRef v7 = cf;
      }
    }
    if (v7) {
      CFRelease(v7);
    }
  }
  return valuePtr;
}

- (CGAffineTransform)preferredTransform
{
  uint64_t v19 = 0;
  uint64_t v4 = MEMORY[0x1E4F1DAB8];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v4 + 32);
  [(AVMutableMovie *)self _figMutableMovie];
  uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v10 = *(void *)(VTable + 8);
  result = (CGAffineTransform *)(VTable + 8);
  uint64_t v9 = v10;
  if (v10) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = 0;
  }
  CFTypeID v12 = *(uint64_t (**)(uint64_t, void, void, CGAffineTransform **))(v11 + 48);
  if (v12)
  {
    int v13 = v12(FigBaseObject, *MEMORY[0x1E4F33120], *MEMORY[0x1E4F1CF80], &v19);
    result = v19;
    if (!v13)
    {
      if (!v19) {
        return result;
      }
      CFTypeID v14 = CFGetTypeID(v19);
      CFTypeID TypeID = CFArrayGetTypeID();
      result = v19;
      if (v14 == TypeID)
      {
        FigGetCGAffineTransformFrom3x3MatrixArray();
        *(_OWORD *)&retstr->a = v16;
        *(_OWORD *)&retstr->c = v17;
        *(_OWORD *)&retstr->tx = v18;
        result = v19;
      }
    }
    if (result) {
      CFRelease(result);
    }
  }
  return result;
}

- (CMTimeScale)timescale
{
  CFTypeRef cf = 0;
  CMTimeScale valuePtr = 0;
  [(AVMutableMovie *)self _figMutableMovie];
  uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  long long v5 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v4 + 48);
  if (v5)
  {
    int v6 = v5(FigBaseObject, *MEMORY[0x1E4F33128], *MEMORY[0x1E4F1CF80], &cf);
    CFTypeRef v7 = cf;
    if (!v6)
    {
      if (!cf) {
        return valuePtr;
      }
      CFTypeID v8 = CFGetTypeID(cf);
      CFTypeID TypeID = CFNumberGetTypeID();
      CFTypeRef v7 = cf;
      if (v8 == TypeID)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &valuePtr);
        CFTypeRef v7 = cf;
      }
    }
    if (v7) {
      CFRelease(v7);
    }
  }
  return valuePtr;
}

- (CMTime)interleavingPeriod
{
  CFTypeRef cf = 0;
  *retstr = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  [(AVMutableMovie *)self _figMutableMovie];
  uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v8 = *(void *)(VTable + 8);
  result = (CMTime *)(VTable + 8);
  uint64_t v7 = v8;
  if (v8) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v9 + 48);
  if (v10)
  {
    int v11 = v10(FigBaseObject, *MEMORY[0x1E4F33100], *MEMORY[0x1E4F1CF80], &cf);
    result = (CMTime *)cf;
    if (!v11)
    {
      if (!cf) {
        return result;
      }
      CFTypeID v12 = CFGetTypeID(cf);
      CFTypeID TypeID = CFDictionaryGetTypeID();
      result = (CMTime *)cf;
      if (v12 == TypeID)
      {
        CMTimeMakeFromDictionary(&v14, (CFDictionaryRef)cf);
        *(_OWORD *)&retstr->value = *(_OWORD *)&v14.value;
        result = (CMTime *)cf;
        retstr->epoch = v14.epoch;
      }
    }
    if (result) {
      CFRelease(result);
    }
  }
  return result;
}

- (void)setPreferredRate:(float)preferredRate
{
  [(AVMutableMovie *)self _figMutableMovie];
  *(float *)&double v4 = preferredRate;
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithFloat:v4];
  uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 56);
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F33130];
    v9(FigBaseObject, v10, v5);
  }
}

- (void)setPreferredVolume:(float)preferredVolume
{
  [(AVMutableMovie *)self _figMutableMovie];
  *(float *)&double v4 = preferredVolume;
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithFloat:v4];
  uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 56);
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F33138];
    v9(FigBaseObject, v10, v5);
  }
}

- (void)setPreferredTransform:(CGAffineTransform *)preferredTransform
{
  CGAffineTransform v10 = *preferredTransform;
  uint64_t v4 = FigCreate3x3MatrixArrayFromCGAffineTransform();
  if (v4)
  {
    uint64_t v5 = (const void *)v4;
    [(AVMutableMovie *)self _figMutableMovie];
    uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = *(void (**)(uint64_t, void, const void *))(v8 + 56);
    if (v9) {
      v9(FigBaseObject, *MEMORY[0x1E4F33120], v5);
    }
    CFRelease(v5);
  }
}

- (void)setTimescale:(CMTimeScale)timescale
{
  uint64_t v3 = *(void *)&timescale;
  [(AVMutableMovie *)self _figMutableMovie];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithInt:v3];
  uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F33128];
    v8(FigBaseObject, v9, v4);
  }
}

- (void)setInterleavingPeriod:(CMTime *)interleavingPeriod
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTime v10 = *interleavingPeriod;
  CFDictionaryRef v5 = CMTimeCopyAsDictionary(&v10, v4);
  [(AVMutableMovie *)self _figMutableMovie];
  uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(uint64_t, void, CFDictionaryRef))(v8 + 56);
  if (v9) {
    v9(FigBaseObject, *MEMORY[0x1E4F33100], v5);
  }
  if (v5) {
    CFRelease(v5);
  }
}

- (void)setDefaultMediaDataStorage:(AVMediaDataStorage *)defaultMediaDataStorage
{
  uint64_t v9 = defaultMediaDataStorage;
  CFAllocatorRef v4 = [(AVMediaDataStorage *)v9 URL];
  [(AVMutableMovie *)self _figMutableMovie];
  uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(void (**)(uint64_t, void, void *))(v7 + 56);
  if (v8) {
    v8(FigBaseObject, *MEMORY[0x1E4F330F8], v4);
  }
}

- (id)description
{
  uint64_t v3 = [(AVMutableMovie *)self defaultMediaDataStorage];
  CFAllocatorRef v4 = [v3 URL];

  CFDictionaryRef v5 = NSString;
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = [(AVMutableMovie *)self tracks];
  if (v4) {
    [v5 stringWithFormat:@"<%@: %p defaultMediaDataStorage = %@, tracks = %@ >", v7, self, v4, v8];
  }
  else {
  uint64_t v9 = [v5 stringWithFormat:@"<%@: %p tracks = %@ >", v7, self, v8];
  }

  return v9;
}

- (BOOL)isDefunct
{
  unsigned __int8 v9 = 0;
  v2 = [(AVMutableMovie *)self _figMutableMovie];
  uint64_t v3 = *(void **)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    CFAllocatorRef v4 = v3;
  }
  else {
    CFAllocatorRef v4 = 0;
  }
  if (*v4 < 5uLL)
  {
    int v6 = 0;
    LOBYTE(v5) = 0;
  }
  else
  {
    CFDictionaryRef v5 = (unsigned int (*)(OpaqueFigMutableMovie *, unsigned __int8 *))v4[11];
    if (v5)
    {
      LOBYTE(v5) = v5(v2, &v9) == 0;
      int v6 = v9;
    }
    else
    {
      int v6 = 0;
    }
  }
  if (v5) {
    int v7 = v6;
  }
  else {
    int v7 = 1;
  }
  if (!v6) {
    int v6 = v7;
  }
  return v6 == 1;
}

- (void).cxx_destruct
{
}

- (BOOL)insertTimeRange:(CMTimeRange *)timeRange ofAsset:(AVAsset *)asset atTime:(CMTime *)startTime copySampleData:(BOOL)copySampleData error:(NSError *)outError
{
  BOOL v7 = copySampleData;
  v91[1] = *MEMORY[0x1E4F143B8];
  v55 = asset;
  v57 = [(AVMutableMovie *)self _mutableTracks];
  uint64_t v80 = 0;
  CFTypeRef cf = 0;
  if ([(AVAsset *)v55 providesPreciseDurationAndTiming])
  {
    CMTime v10 = [(AVMutableMovie *)self _copyFormatReader];
    [(AVMutableMovie *)self willChangeValueForKey:@"duration"];
    [(AVMutableMovie *)self willChangeValueForKey:@"tracks"];
    uint64_t v11 = [v57 count];
    if (self != v55 || v7)
    {
      v52 = [(AVMutableMovie *)v55 _copyFormatReader];
      if (!v52)
      {
        objc_super v23 = AVLocalizedError(@"AVFoundationErrorDomain", -11838, 0);
        v52 = 0;
        BOOL v53 = 0;
        signed int v34 = 0;
        goto LABEL_67;
      }
      if ([(AVAsset *)v55 _prefersNominalDurations]) {
        uint64_t v24 = v7 | 0x100u;
      }
      else {
        uint64_t v24 = v7;
      }
      int v25 = [(AVMutableMovie *)self _figMutableMovie];
      long long v26 = *(_OWORD *)&timeRange->start.epoch;
      long long v72 = *(_OWORD *)&timeRange->start.value;
      long long v73 = v26;
      long long v74 = *(_OWORD *)&timeRange->duration.timescale;
      long long v70 = *(_OWORD *)&startTime->value;
      CMTimeEpoch epoch = startTime->epoch;
      uint64_t v27 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v27) {
        uint64_t v28 = v27;
      }
      else {
        uint64_t v28 = 0;
      }
      objc_super v29 = *(uint64_t (**)(OpaqueFigMutableMovie *, OpaqueFigFormatReader *, long long *, long long *, uint64_t))(v28 + 176);
      if (v29)
      {
        long long v84 = v72;
        long long v85 = v73;
        long long v86 = v74;
        long long v82 = v70;
        CMTimeEpoch v83 = epoch;
        int v30 = v29(v25, v52, &v84, &v82, v24);
      }
      else
      {
        int v30 = -12782;
      }
      id v14 = 0;
      BOOL v53 = v30 == 0;
    }
    else
    {
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      CFTypeID v12 = [(AVMutableMovie *)self tracks];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v76 objects:v89 count:16];
      uint64_t v59 = v11;
      v51 = v10;
      id v14 = 0;
      if (v13)
      {
        uint64_t v15 = *(void *)v77;
        char v16 = 1;
        do
        {
          uint64_t v17 = 0;
          long long v18 = v14;
          do
          {
            if (*(void *)v77 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v19 = *(void **)(*((void *)&v76 + 1) + 8 * v17);
            id v75 = v18;
            long long v20 = *(_OWORD *)&timeRange->start.epoch;
            long long v84 = *(_OWORD *)&timeRange->start.value;
            long long v85 = v20;
            long long v86 = *(_OWORD *)&timeRange->duration.timescale;
            long long v72 = *(_OWORD *)&startTime->value;
            *(void *)&long long v73 = startTime->epoch;
            int v21 = objc_msgSend(v19, "insertTimeRange:ofTrack:atTime:copySampleData:error:", &v84, v19, &v72, 0, &v75, v51);
            id v14 = v75;

            if (!v21) {
              char v16 = 0;
            }
            ++v17;
            long long v18 = v14;
          }
          while (v13 != v17);
          uint64_t v13 = [v12 countByEnumeratingWithState:&v76 objects:v89 count:16];
        }
        while (v13);
      }
      else
      {
        char v16 = 1;
      }

      v52 = 0;
      BOOL v53 = v16 & 1;
      CMTime v10 = v51;
      uint64_t v11 = v59;
    }
    uint64_t v31 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v31) {
      uint64_t v32 = v31;
    }
    else {
      uint64_t v32 = 0;
    }
    objc_super v33 = *(uint64_t (**)(OpaqueFigFormatReader *, uint64_t *))(v32 + 8);
    if (!v33) {
      goto LABEL_65;
    }
    signed int v34 = v33(v10, &v80);
    if (v34)
    {
LABEL_66:
      objc_super v23 = v14;
      goto LABEL_67;
    }
    if (v11 == v80)
    {
      signed int v34 = 0;
      goto LABEL_66;
    }
    [(AVMutableMovie *)self _figMutableMovie];
    uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
    uint64_t v36 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v37 = v36 ? v36 : 0;
    CFTypeRef v38 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v37 + 48);
    if (!v38)
    {
LABEL_65:
      signed int v34 = -12782;
      goto LABEL_66;
    }
    signed int v34 = v38(FigBaseObject, *MEMORY[0x1E4F33148], *MEMORY[0x1E4F1CF80], &cf);
    if (v34) {
      goto LABEL_66;
    }
    v51 = v10;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    obid j = (id)cf;
    uint64_t v39 = [obj countByEnumeratingWithState:&v66 objects:v88 count:16];
    if (v39)
    {
      uint64_t v58 = *(void *)v67;
      do
      {
        uint64_t v60 = v39;
        for (uint64_t i = 0; i != v60; ++i)
        {
          if (*(void *)v67 != v58) {
            objc_enumerationMutation(obj);
          }
          uint64_t v41 = objc_msgSend(*(id *)(*((void *)&v66 + 1) + 8 * i), "integerValue", v51);
          if (v41)
          {
            long long v64 = 0u;
            long long v65 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            id v42 = v57;
            uint64_t v43 = [v42 countByEnumeratingWithState:&v62 objects:v87 count:16];
            if (v43)
            {
              id j = 0;
              uint64_t v45 = *(void *)v63;
              while (2)
              {
                uint64_t v46 = 0;
                v47 = j;
                do
                {
                  if (*(void *)v63 != v45) {
                    objc_enumerationMutation(v42);
                  }
                  id j = *(id *)(*((void *)&v62 + 1) + 8 * v46);

                  if ([j trackID] == v41)
                  {

                    goto LABEL_62;
                  }
                  ++v46;
                  v47 = j;
                }
                while (v43 != v46);
                uint64_t v43 = [v42 countByEnumeratingWithState:&v62 objects:v87 count:16];
                if (v43) {
                  continue;
                }
                break;
              }
            }
            for (id j = +[AVMutableMovieTrack trackWithTrackID:v41 forMovie:self];
            {
              dispatch_semaphore_wait((dispatch_semaphore_t)self->_mutableMovieInternal->trackWaitingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
              +[AVMutableMovieTrack trackWithTrackID:v41 forMovie:self];
            }
            [v42 addObject:j];
          }
          else
          {
            id j = 0;
          }
LABEL_62:
        }
        uint64_t v39 = [obj countByEnumeratingWithState:&v66 objects:v88 count:16];
      }
      while (v39);
    }

    signed int v34 = 0;
    objc_super v23 = v14;
    CMTime v10 = v51;
LABEL_67:
    if (cf) {
      CFRelease(cf);
    }
    if (v52) {
      CFRelease(v52);
    }
    if (v10) {
      CFRelease(v10);
    }
    if (outError) {
      char v48 = v53;
    }
    else {
      char v48 = 1;
    }
    if (v48) {
      goto LABEL_82;
    }
    if (v23)
    {
      v49 = v23;
    }
    else
    {
      if (!v34)
      {
LABEL_82:
        [(AVMutableMovie *)self didChangeValueForKey:@"tracks", v51];
        [(AVMutableMovie *)self didChangeValueForKey:@"duration"];
        goto LABEL_83;
      }
      AVLocalizedErrorWithUnderlyingOSStatus(v34, 0);
      v49 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    *outError = v49;
    goto LABEL_82;
  }
  if (outError)
  {
    uint64_t v90 = *MEMORY[0x1E4F1D138];
    v91[0] = @"Source asset must have a value of YES for providesPreciseDurationAndTiming";
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:&v90 count:1];
    AVLocalizedError(@"AVFoundationErrorDomain", -11838, v22);
    *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  objc_super v23 = 0;
  BOOL v53 = 0;
LABEL_83:

  return v53;
}

- (void)insertEmptyTimeRange:(CMTimeRange *)timeRange
{
  [(AVMutableMovie *)self willChangeValueForKey:@"duration"];
  CFDictionaryRef v5 = [(AVMutableMovie *)self _figMutableMovie];
  CMTimeRange v9 = *timeRange;
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(void (**)(OpaqueFigMutableMovie *, CMTimeRange *))(v7 + 128);
  if (v8)
  {
    CMTimeRange v10 = v9;
    v8(v5, &v10);
  }
  [(AVMutableMovie *)self didChangeValueForKey:@"duration", *(_OWORD *)&v9.start.value, *(_OWORD *)&v9.start.epoch, *(_OWORD *)&v9.duration.timescale];
}

- (void)removeTimeRange:(CMTimeRange *)timeRange
{
  [(AVMutableMovie *)self willChangeValueForKey:@"duration"];
  CFDictionaryRef v5 = [(AVMutableMovie *)self _figMutableMovie];
  CMTimeRange v9 = *timeRange;
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(void (**)(OpaqueFigMutableMovie *, CMTimeRange *))(v7 + 144);
  if (v8)
  {
    CMTimeRange v10 = v9;
    v8(v5, &v10);
  }
  [(AVMutableMovie *)self didChangeValueForKey:@"duration", *(_OWORD *)&v9.start.value, *(_OWORD *)&v9.start.epoch, *(_OWORD *)&v9.duration.timescale];
}

- (void)scaleTimeRange:(CMTimeRange *)timeRange toDuration:(CMTime *)duration
{
  [(AVMutableMovie *)self willChangeValueForKey:@"duration"];
  uint64_t v7 = [(AVMutableMovie *)self _figMutableMovie];
  CMTimeRange v12 = *timeRange;
  CMTime v11 = *duration;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  CMTimeRange v10 = *(void (**)(OpaqueFigMutableMovie *, CMTimeRange *, CMTime *))(v9 + 160);
  if (v10)
  {
    CMTimeRange v14 = v12;
    CMTime v13 = v11;
    v10(v7, &v14, &v13);
  }
  [(AVMutableMovie *)self didChangeValueForKey:@"duration", *(_OWORD *)&v11.value, v11.epoch];
}

- (AVMutableMovieTrack)mutableTrackCompatibleWithTrack:(AVAssetTrack *)track
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v4 = track;
  CFDictionaryRef v5 = [(AVMutableMovie *)self tracks];
  uint64_t v6 = v5;
  int v23 = 0;
  if (!v5 || ![v5 count]) {
    goto LABEL_21;
  }
  if ([v6 containsObject:v4])
  {
    uint64_t v7 = v4;
    goto LABEL_22;
  }
  uint64_t v7 = [(AVAssetTrack *)v4 _figTrackReader];
  if (v7)
  {
    uint64_t v8 = [(AVMutableMovie *)self _figMutableMovie];
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    CMTime v11 = *(uint64_t (**)(OpaqueFigMutableMovie *, AVAssetTrack *, int *))(v10 + 104);
    if (v11)
    {
      int v12 = v11(v8, v7, &v23);
      uint64_t v7 = 0;
      if (!v12 && v23)
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v13 = v6;
        uint64_t v7 = (AVAssetTrack *)[v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v7)
        {
          uint64_t v14 = *(void *)v20;
          while (2)
          {
            for (uint64_t i = 0; i != v7; uint64_t i = (AVAssetTrack *)((char *)i + 1))
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v13);
              }
              char v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
              int v17 = objc_msgSend(v16, "trackID", (void)v19);
              if (v17 == v23)
              {
                uint64_t v7 = v16;
                goto LABEL_26;
              }
            }
            uint64_t v7 = (AVAssetTrack *)[v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }
LABEL_26:
      }
      goto LABEL_22;
    }
LABEL_21:
    uint64_t v7 = 0;
  }
LABEL_22:

  return (AVMutableMovieTrack *)v7;
}

- (id)_addMutableTrackWithMediaType:(id)a3 copySettingsFromTrack:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v21 = 0;
  CMTime v11 = [(AVMutableMovie *)self _mutableTracks];
  uint64_t v12 = AVOSTypeForString(v8);
  id v13 = [(AVMutableMovie *)self _figMutableMovie];
  uint64_t v14 = [v9 _figTrackReader];
  uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v15) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0;
  }
  int v17 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, id, uint64_t, int *))(v16 + 32);
  if (v17) {
    int v18 = v17(v13, v12, v10, v14, &v21);
  }
  else {
    int v18 = -12782;
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_mutableMovieInternal->trackWaitingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  long long v19 = 0;
  if (!v18)
  {
    if (v21)
    {
      long long v19 = +[AVMutableMovieTrack trackWithTrackID:forMovie:](AVMutableMovieTrack, "trackWithTrackID:forMovie:");
      if (v19) {
        [v11 addObject:v19];
      }
    }
  }

  return v19;
}

- (AVMutableMovieTrack)addMutableTrackWithMediaType:(AVMediaType)mediaType copySettingsFromTrack:(AVAssetTrack *)track options:(NSDictionary *)options
{
  id v9 = mediaType;
  id v10 = track;
  uint64_t v16 = options;
  if (!v9)
  {
    uint64_t v31 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v32 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v11, v12, v13, v14, v15, (uint64_t)"mediaType != nil");
    objc_super v33 = [v31 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v32 userInfo:0];
    goto LABEL_11;
  }
  if (v10)
  {
    int v17 = [(AVAssetTrack *)v10 mediaType];
    BOOL v18 = [(NSString *)v9 isEqualToString:v17];

    if (!v18)
    {
      objc_super v35 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v32 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Can't copy settings from an AVAssetTrack with a non-matching media type", v19, v20, v21, v22, v23, v37);
      objc_super v33 = [v35 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v32 userInfo:0];
LABEL_11:
      id v36 = v33;

      objc_exception_throw(v36);
    }
  }
  if ([(NSDictionary *)v16 count])
  {
    signed int v34 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v32 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Invalid options", v24, v25, v26, v27, v28, v37);
    objc_super v33 = [v34 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v32 userInfo:0];
    goto LABEL_11;
  }
  [(AVMutableMovie *)self willChangeValueForKey:@"tracks"];
  objc_super v29 = [(AVMutableMovie *)self _addMutableTrackWithMediaType:v9 copySettingsFromTrack:v10 options:v16];
  [(AVMutableMovie *)self didChangeValueForKey:@"tracks"];

  return (AVMutableMovieTrack *)v29;
}

- (NSArray)addMutableTracksCopyingSettingsFromTracks:(NSArray *)existingTracks options:(NSDictionary *)options
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = existingTracks;
  v71 = options;
  if (!v6)
  {
    v55 = (void *)MEMORY[0x1E4F1CA00];
    v56 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v7, v8, v9, v10, v11, (uint64_t)"existingTracks != nil");
    id v57 = [v55 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v56 userInfo:0];

    goto LABEL_63;
  }
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  obuint64_t j = v6;
  uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v92 objects:v101 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v93;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v93 != v13) {
          objc_enumerationMutation(obj);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v52 = (void *)MEMORY[0x1E4F1CA00];
          BOOL v53 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v15, v16, v17, v18, v19, (uint64_t)"[track isKindOfClass:[AVAssetTrack class]]");
          id v54 = [v52 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v53 userInfo:0];

          objc_exception_throw(v54);
        }
      }
      uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v92 objects:v101 count:16];
    }
    while (v12);
  }

  if ([(NSDictionary *)v71 count])
  {
    uint64_t v58 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v59 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Invalid options", v20, v21, v22, v23, v24, v60);
    id v57 = [v58 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v59 userInfo:0];

LABEL_63:
    objc_exception_throw(v57);
  }
  CFIndex v25 = [(NSArray *)obj count];
  id v66 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v25];
  uint64_t v26 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v25, 0, MEMORY[0x1E4F1D540]);
  if (v25)
  {
    [(AVMutableMovie *)self willChangeValueForKey:@"tracks"];
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    uint64_t v27 = obj;
    uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v88 objects:v100 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v89;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v89 != v29) {
            objc_enumerationMutation(v27);
          }
          uint64_t v31 = *(void **)(*((void *)&v88 + 1) + 8 * j);
          uint64_t v32 = [v31 mediaType];
          objc_super v33 = [(AVMutableMovie *)self _addMutableTrackWithMediaType:v32 copySettingsFromTrack:v31 options:v71];

          if (v33) {
            [v26 setObject:v33 forKey:v31];
          }
        }
        uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v88 objects:v100 count:16];
      }
      while (v28);
    }

    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v63 = v27;
    uint64_t v61 = [(NSArray *)v63 countByEnumeratingWithState:&v84 objects:v99 count:16];
    if (v61)
    {
      uint64_t v62 = *(void *)v85;
      do
      {
        for (uint64_t k = 0; k != v61; ++k)
        {
          if (*(void *)v85 != v62) {
            objc_enumerationMutation(v63);
          }
          signed int v34 = *(void **)(*((void *)&v84 + 1) + 8 * k);
          long long v80 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          id v65 = [v34 availableTrackAssociationTypes];
          uint64_t v35 = [v65 countByEnumeratingWithState:&v80 objects:v98 count:16];
          if (v35)
          {
            uint64_t v67 = *(void *)v81;
            do
            {
              uint64_t v68 = v35;
              for (uint64_t m = 0; m != v68; ++m)
              {
                if (*(void *)v81 != v67) {
                  objc_enumerationMutation(v65);
                }
                uint64_t v37 = *(void *)(*((void *)&v80 + 1) + 8 * m);
                long long v76 = 0u;
                long long v77 = 0u;
                long long v78 = 0u;
                long long v79 = 0u;
                CFTypeRef v38 = [v34 associatedTracksOfType:v37];
                uint64_t v39 = [v38 countByEnumeratingWithState:&v76 objects:v97 count:16];
                if (v39)
                {
                  uint64_t v40 = *(void *)v77;
                  do
                  {
                    for (uint64_t n = 0; n != v39; ++n)
                    {
                      if (*(void *)v77 != v40) {
                        objc_enumerationMutation(v38);
                      }
                      uint64_t v42 = *(void *)(*((void *)&v76 + 1) + 8 * n);
                      uint64_t v43 = [v26 objectForKey:v34];
                      uint64_t v44 = [v26 objectForKey:v42];
                      uint64_t v45 = (void *)v44;
                      if (v43 && v44) {
                        [v43 addTrackAssociationToTrack:v44 type:v37];
                      }
                    }
                    uint64_t v39 = [v38 countByEnumeratingWithState:&v76 objects:v97 count:16];
                  }
                  while (v39);
                }
              }
              uint64_t v35 = [v65 countByEnumeratingWithState:&v80 objects:v98 count:16];
            }
            while (v35);
          }
        }
        uint64_t v61 = [(NSArray *)v63 countByEnumeratingWithState:&v84 objects:v99 count:16];
      }
      while (v61);
    }

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    uint64_t v46 = v63;
    uint64_t v47 = [(NSArray *)v46 countByEnumeratingWithState:&v72 objects:v96 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v73;
      do
      {
        for (iuint64_t i = 0; ii != v47; ++ii)
        {
          if (*(void *)v73 != v48) {
            objc_enumerationMutation(v46);
          }
          v50 = [v26 objectForKey:*(void *)(*((void *)&v72 + 1) + 8 * ii)];
          if (v50) {
            [v66 addObject:v50];
          }
        }
        uint64_t v47 = [(NSArray *)v46 countByEnumeratingWithState:&v72 objects:v96 count:16];
      }
      while (v47);
    }

    [(AVMutableMovie *)self didChangeValueForKey:@"tracks"];
  }
  if (v26) {
    CFRelease(v26);
  }

  return (NSArray *)v66;
}

- (void)removeTrack:(AVMovieTrack *)track
{
  uint64_t v12 = track;
  CFAllocatorRef v4 = [(AVMutableMovie *)self _mutableTracks];
  uint64_t v5 = [v4 indexOfObject:v12];
  if (v12 && v4 && v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = [(AVAssetTrack *)v12 asset];

    if (v6 != self) {
      goto LABEL_12;
    }
    [(AVMutableMovie *)self willChangeValueForKey:@"duration"];
    uint64_t v7 = [(AVMutableMovie *)self _figMutableMovie];
    uint64_t v8 = [(AVAssetTrack *)v12 trackID];
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = *(unsigned int (**)(OpaqueFigMutableMovie *, uint64_t))(v10 + 40);
    if (v11 && !v11(v7, v8))
    {
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_mutableMovieInternal->trackWaitingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      [(AVMutableMovie *)self willChangeValueForKey:@"tracks"];
      [v4 removeObjectAtIndex:v5];
      [(AVMutableMovie *)self didChangeValueForKey:@"tracks"];
    }
  }
  [(AVMutableMovie *)self willChangeValueForKey:@"duration"];
LABEL_12:
}

- (id)availableMetadataFormats
{
  CFTypeRef cf = 0;
  [(AVMutableMovie *)self _figMutableMovie];
  uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v4 + 48);
  if (v5)
  {
    int v6 = v5(FigBaseObject, *MEMORY[0x1E4F330F0], *MEMORY[0x1E4F1CF80], &cf);
    uint64_t v7 = (void *)cf;
    if (v6)
    {
LABEL_13:
      if (v7) {
        CFRelease(v7);
      }
      goto LABEL_9;
    }
    if (cf)
    {
      CFTypeID v8 = CFGetTypeID(cf);
      CFTypeID TypeID = CFArrayGetTypeID();
      uint64_t v7 = (void *)cf;
      if (v8 == TypeID)
      {
        CFTypeRef cf = 0;
        if (v7) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
      goto LABEL_13;
    }
  }
LABEL_9:
  uint64_t v7 = [MEMORY[0x1E4F1C978] array];
LABEL_10:
  return v7;
}

- (NSArray)metadataForFormat:(AVMetadataFormat)format
{
  uint64_t v4 = format;
  uint64_t v5 = [(AVMutableMovie *)self _copyFormatReader];
  int v6 = v5;
  uint64_t v7 = 0;
  CFTypeRef cf = 0;
  CFArrayRef theArray = 0;
  if (v4 && v5)
  {
    uint64_t FigBaseObject = FigFormatReaderGetFigBaseObject();
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = *(unsigned int (**)(uint64_t, void, void, CFArrayRef *))(v10 + 48);
    if (!v11) {
      goto LABEL_20;
    }
    uint64_t v12 = *MEMORY[0x1E4F1CF80];
    if (v11(FigBaseObject, *MEMORY[0x1E4F32B50], *MEMORY[0x1E4F1CF80], &theArray)) {
      goto LABEL_20;
    }
    if (!theArray)
    {
      uint64_t v21 = 0;
      goto LABEL_25;
    }
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count < 1)
    {
LABEL_20:
      uint64_t v7 = 0;
    }
    else
    {
      CFIndex v14 = 0;
      uint64_t v15 = *MEMORY[0x1E4F33078];
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v14);
        uint64_t v17 = FigMetadataReaderGetFigBaseObject();
        uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 8);
        uint64_t v19 = v18 ? v18 : 0;
        uint64_t v20 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(v19 + 48);
        if (v20)
        {
          if (!v20(v17, v15, v12, &cf) && [(NSString *)v4 isEqualToString:cf]) {
            break;
          }
        }
        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0;
        }
        if (Count == ++v14) {
          goto LABEL_20;
        }
      }
      CFIndex v25 = +[AVMetadataEnumerator metadataEnumeratorWithMetadataReader:ValueAtIndex];
      uint64_t v26 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v27 = [v25 allObjects];
      uint64_t v7 = [v26 arrayWithArray:v27];

      if ([(NSString *)v4 isEqualToString:@"com.apple.quicktime.udta"]
        || [(NSString *)v4 isEqualToString:@"org.mp4ra"])
      {
        BOOL v28 = [(NSString *)v4 isEqualToString:@"com.apple.quicktime.udta", cf];
        uint64_t v29 = (id *)&AVMetadataKeySpaceQuickTimeUserData;
        if (!v28) {
          uint64_t v29 = (id *)&AVMetadataKeySpaceISOUserData;
        }
        id v30 = *v29;
        uint64_t v31 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:1835365473];
        uint64_t v32 = +[AVMetadataItem metadataItemsFromArray:v7 withKey:v31 keySpace:v30];

        if (v32 && [v32 count]) {
          [v7 removeObjectsInArray:v32];
        }
      }
    }
  }
  if (theArray) {
    CFRelease(theArray);
  }
  uint64_t v21 = v7;
LABEL_25:
  if (cf) {
    CFRelease(cf);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v21)
  {
    id v22 = v21;
  }
  else
  {
    id v22 = [MEMORY[0x1E4F1C978] array];
  }
  uint64_t v23 = v22;

  return (NSArray *)v23;
}

- (NSArray)metadata
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AVMutableMovie *)self availableMetadataFormats];
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
        uint64_t v9 = -[AVMutableMovie metadataForFormat:](self, "metadataForFormat:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
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
  uint64_t v9 = metadata;
  uint64_t v4 = +[AVMetadataItem _figMetadataPropertyFromMetadataItems:](AVMetadataItem, "_figMetadataPropertyFromMetadataItems:");
  [(AVMutableMovie *)self _figMutableMovie];
  uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  CFTypeID v8 = *(void (**)(uint64_t, void, void *))(v7 + 56);
  if (v8) {
    v8(FigBaseObject, *MEMORY[0x1E4F33108], v4);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_mutableMovieInternal->metadataWaitingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
}

@end