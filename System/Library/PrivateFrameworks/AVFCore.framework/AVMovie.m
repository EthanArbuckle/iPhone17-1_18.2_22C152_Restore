@interface AVMovie
+ (AVMovie)movieWithData:(NSData *)data options:(NSDictionary *)options;
+ (AVMovie)movieWithURL:(NSURL *)URL options:(NSDictionary *)options;
+ (BOOL)expectsPropertyRevisedNotifications;
+ (NSArray)movieTypes;
+ (void)initialize;
- (AVMediaDataStorage)defaultMediaDataStorage;
- (AVMovie)init;
- (AVMovie)initWithData:(NSData *)data options:(NSDictionary *)options;
- (AVMovie)initWithData:(id)a3 contentType:(id)a4 options:(id)a5;
- (AVMovie)initWithURL:(NSURL *)URL options:(NSDictionary *)options;
- (AVMovieTrack)trackWithTrackID:(CMPersistentTrackID)trackID;
- (BOOL)canContainMovieFragments;
- (BOOL)containsMovieFragments;
- (BOOL)hasProtectedContent;
- (BOOL)isCompatibleWithFileType:(AVFileType)fileType;
- (BOOL)isDefunct;
- (BOOL)writeMovieHeaderToURL:(NSURL *)URL fileType:(AVFileType)fileType options:(AVMovieWritingOptions)options error:(NSError *)outError;
- (Class)_classForMovieTracks;
- (Class)_classForTrackInspectors;
- (NSArray)tracks;
- (NSArray)tracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic;
- (NSArray)tracksWithMediaType:(AVMediaType)mediaType;
- (NSData)data;
- (NSData)movieHeaderWithFileType:(AVFileType)fileType error:(NSError *)outError;
- (NSURL)URL;
- (OpaqueFigFormatReader)_copyFormatReader;
- (OpaqueFigMutableMovie)_figMutableMovie;
- (OpaqueFigMutableMovie)_figMutableMovieFromFormatReader:(OpaqueFigFormatReader *)a3;
- (OpaqueFigMutableMovie)_mutableMovieForFileType:(id)a3;
- (id)_absoluteURL;
- (id)_assetInspector;
- (id)_assetInspectorLoader;
- (id)_initWithFigAsset:(OpaqueFigAsset *)a3;
- (id)_initWithFigError:(int)a3 userInfo:(id)a4;
- (id)_initWithFormatReader:(OpaqueFigFormatReader *)a3 URL:(id)a4 data:(id)a5 options:(id)a6;
- (id)_initializationOptions;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)trackReferences;
- (unint64_t)referenceRestrictions;
- (void)_startListeningToLoaderNotifications;
- (void)_stopListeningToLoaderNotifications;
- (void)dealloc;
@end

@implementation AVMovie

+ (void)initialize
{
}

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 0;
}

+ (NSArray)movieTypes
{
  if (movieTypes_makeMovieTypesArrayOnceToken != -1) {
    dispatch_once(&movieTypes_makeMovieTypesArrayOnceToken, &__block_literal_global_40);
  }
  v2 = (void *)movieTypes_movieTypesArray;
  return (NSArray *)v2;
}

uint64_t __21__AVMovie_movieTypes__block_invoke()
{
  movieTypes_movieTypesArray = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"com.apple.quicktime-movie", @"public.mpeg-4", @"com.apple.m4v-video", @"com.apple.m4a-audio", @"public.3gpp", @"com.apple.quicktime-audio", 0);
  return MEMORY[0x1F41817F8]();
}

- (void)_startListeningToLoaderNotifications
{
  v3 = [(AVMovie *)self _assetInspectorLoader];
  if (v3)
  {
    id v6 = v3;
    v4 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    v5 = [(AVAsset *)self _weakReference];
    [v4 addListenerWithWeakReference:v5 callback:figLoaderNotificationHandler name:*MEMORY[0x1E4F31EE8] object:v6 flags:0];
    [v4 addListenerWithWeakReference:v5 callback:figLoaderNotificationHandler name:*MEMORY[0x1E4F31EE0] object:v6 flags:0];

    v3 = v6;
  }
}

- (void)_stopListeningToLoaderNotifications
{
  v3 = [(AVMovie *)self _assetInspectorLoader];
  if (v3)
  {
    id v6 = v3;
    v4 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    v5 = [(AVAsset *)self _weakReference];
    [v4 removeListenerWithWeakReference:v5 callback:figLoaderNotificationHandler name:*MEMORY[0x1E4F31EE8] object:v6];
    [v4 removeListenerWithWeakReference:v5 callback:figLoaderNotificationHandler name:*MEMORY[0x1E4F31EE0] object:v6];

    v3 = v6;
  }
}

- (AVMovie)init
{
  v18.receiver = self;
  v18.super_class = (Class)AVMovie;
  v2 = [(AVAsset *)&v18 init];
  v3 = v2;
  if (!v2) {
    goto LABEL_20;
  }
  v4 = v2;
  CFTypeRef v20 = 0;
  CFTypeRef cf = 0;
  CFTypeRef v19 = 0;
  v5 = _figOptionsFromAVMovieOptions(0);
  uint64_t Empty = FigMutableMovieRemoteCreateEmpty();
  if (Empty) {
    goto LABEL_11;
  }
  CFTypeRef v7 = cf;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  v10 = *(uint64_t (**)(CFTypeRef, uint64_t, void, CFTypeRef *))(v9 + 8);
  if (!v10)
  {
    uint64_t Empty = 4294954514;
LABEL_11:
    v12 = [[AVUnreachableAssetInspectorLoader alloc] initWithFigError:Empty userInfo:0];
    goto LABEL_12;
  }
  uint64_t Empty = v10(v7, 1, 0, &v20);
  if (Empty) {
    goto LABEL_11;
  }
  figAssetDefaultCreationFlags();
  AVAssetShouldPreferNominalDurations(0, @"AVAssetPreferNominalDurationsKey");
  uint64_t Empty = FigAssetRemoteCreateWithFormatReader();
  if (Empty) {
    goto LABEL_11;
  }
  v11 = [AVFigAssetInspectorLoader alloc];
  v12 = [(AVFigAssetInspectorLoader *)v11 initWithFigAsset:v19 forAsset:v4];
LABEL_12:
  v13 = v12;
  if (cf) {
    CFRelease(cf);
  }
  if (v20) {
    CFRelease(v20);
  }
  if (v19) {
    CFRelease(v19);
  }

  uint64_t v14 = _createMovieStorageWithLoader(v13);
  movie = v4->_movie;
  v4->_movie = (AVMovieInternal *)v14;

  if (!v4->_movie)
  {

    v16 = 0;
    goto LABEL_22;
  }
  [(AVMovie *)v4 _startListeningToLoaderNotifications];

LABEL_20:
  v16 = v3;
LABEL_22:

  return v16;
}

+ (AVMovie)movieWithURL:(NSURL *)URL options:(NSDictionary *)options
{
  v5 = URL;
  id v6 = options;
  CFTypeRef v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithURL:v5 options:v6];

  return (AVMovie *)v7;
}

- (AVMovie)initWithURL:(NSURL *)URL options:(NSDictionary *)options
{
  uint64_t v8 = URL;
  uint64_t v14 = options;
  if (!v8)
  {
    v26 = (void *)MEMORY[0x1E4F1CA00];
    v27 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v9, v10, v11, v12, v13, (uint64_t)"URL != nil");
    id v28 = [v26 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v27 userInfo:0];

    objc_exception_throw(v28);
  }
  v30.receiver = self;
  v30.super_class = (Class)AVMovie;
  v15 = [(AVAsset *)&v30 init];
  if (v15)
  {
    uint64_t v29 = 0;
    v16 = _movieOptionsDictionaryToFigAssetOptionsDictionary(v14, &v29);
    v17 = [AVFigAssetInspectorLoader alloc];
    objc_super v18 = [(AVFigAssetInspectorLoader *)v17 initWithURL:v8 figAssetCreationFlags:v29 figAssetCreationOptions:v16 avAssetInitializationOptions:v14 forAsset:v15 figErr:0];
    uint64_t v19 = _createMovieStorageWithLoader(v18);
    movie = v15->_movie;
    v15->_movie = (AVMovieInternal *)v19;

    if (!v15->_movie)
    {

      v24 = 0;
      goto LABEL_7;
    }
    [(AVMovie *)v15 _startListeningToLoaderNotifications];
    objc_storeStrong((id *)&v15->_movie->URL, URL);
    uint64_t v21 = [(NSDictionary *)v14 copy];
    v22 = v15->_movie;
    initializationOptions = v22->initializationOptions;
    v22->initializationOptions = (NSDictionary *)v21;
  }
  v24 = v15;
LABEL_7:

  return v24;
}

+ (AVMovie)movieWithData:(NSData *)data options:(NSDictionary *)options
{
  v5 = data;
  id v6 = options;
  CFTypeRef v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithData:v5 options:v6];

  return (AVMovie *)v7;
}

- (AVMovie)initWithData:(NSData *)data options:(NSDictionary *)options
{
  CFTypeRef v7 = data;
  uint64_t v8 = options;
  if (![(NSData *)v7 length])
  {
    uint64_t v29 = (void *)MEMORY[0x1E4F1CA00];
    objc_super v30 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v9, v10, v11, v12, v13, (uint64_t)"[data length] > 0");
    id v31 = [v29 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v30 userInfo:0];

    objc_exception_throw(v31);
  }
  v32.receiver = self;
  v32.super_class = (Class)AVMovie;
  uint64_t v14 = [(AVAsset *)&v32 init];
  if (!v14) {
    goto LABEL_15;
  }
  v15 = (void *)[(NSData *)v7 copy];

  CFTypeRef v7 = v15;
  v16 = v14;
  CFTypeRef v34 = 0;
  CFTypeRef cf = 0;
  uint64_t v33 = 1;
  v17 = _movieOptionsDictionaryToFigAssetOptionsDictionary(v8, &v33);
  if (!v7)
  {
    uint64_t BlockBufferWithCFDataNoCopy = 4294954516;
LABEL_8:
    CFTypeRef v20 = [[AVUnreachableAssetInspectorLoader alloc] initWithFigError:BlockBufferWithCFDataNoCopy userInfo:0];
    goto LABEL_9;
  }
  [(NSData *)v7 length];
  uint64_t BlockBufferWithCFDataNoCopy = FigCreateBlockBufferWithCFDataNoCopy();
  if (BlockBufferWithCFDataNoCopy) {
    goto LABEL_8;
  }
  uint64_t BlockBufferWithCFDataNoCopy = FigAssetRemoteCreateWithBlockBuffer();
  if (BlockBufferWithCFDataNoCopy) {
    goto LABEL_8;
  }
  uint64_t v19 = [AVFigAssetInspectorLoader alloc];
  CFTypeRef v20 = [(AVFigAssetInspectorLoader *)v19 initWithFigAsset:cf forAsset:v16];
LABEL_9:
  uint64_t v21 = v20;
  if (cf) {
    CFRelease(cf);
  }
  if (v34) {
    CFRelease(v34);
  }

  uint64_t v22 = _createMovieStorageWithLoader(v21);
  movie = v16->_movie;
  v16->_movie = (AVMovieInternal *)v22;

  if (!v16->_movie)
  {

    v27 = 0;
    goto LABEL_17;
  }
  [(AVMovie *)v16 _startListeningToLoaderNotifications];
  objc_storeStrong((id *)&v16->_movie->data, v15);
  uint64_t v24 = [(NSDictionary *)v8 copy];
  v25 = v16->_movie;
  initializationOptions = v25->initializationOptions;
  v25->initializationOptions = (NSDictionary *)v24;

LABEL_15:
  v27 = v14;
LABEL_17:

  return v27;
}

- (AVMovie)initWithData:(id)a3 contentType:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = +[AVMovie movieTypes];
  char v13 = [v12 containsObject:v10];

  if ((v13 & 1) == 0)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v14, v15, v16, v17, v18, (uint64_t)"[[AVMovie movieTypes] containsObject:contentType]");
    id v23 = [v21 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];

    objc_exception_throw(v23);
  }
  uint64_t v19 = [(AVMovie *)self initWithData:v9 options:v11];

  return v19;
}

- (id)_initWithFigAsset:(OpaqueFigAsset *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AVMovie;
  v4 = [(AVAsset *)&v10 init];
  if (v4)
  {
    v5 = [[AVFigAssetInspectorLoader alloc] initWithFigAsset:a3 forAsset:v4];
    uint64_t v6 = _createMovieStorageWithLoader(v5);
    movie = v4->_movie;
    v4->_movie = (AVMovieInternal *)v6;

    if (!v4->_movie)
    {

      uint64_t v8 = 0;
      goto LABEL_6;
    }
    [(AVMovie *)v4 _startListeningToLoaderNotifications];
  }
  uint64_t v8 = v4;
LABEL_6:

  return v8;
}

- (id)_initWithFormatReader:(OpaqueFigFormatReader *)a3 URL:(id)a4 data:(id)a5 options:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)AVMovie;
  uint64_t v14 = [(AVAsset *)&v32 init];
  uint64_t v15 = v14;
  if (!v14) {
    goto LABEL_11;
  }
  uint64_t v16 = v14;
  uint64_t v33 = 0;
  CFTypeRef cf = 0;
  uint64_t v17 = _movieOptionsDictionaryToFigAssetOptionsDictionary(v13, &v33);
  if (!a3)
  {
    uint64_t v18 = 4294954516;
    goto LABEL_6;
  }
  uint64_t v18 = FigAssetRemoteCreateWithFormatReader();
  if (v18)
  {
LABEL_6:
    CFTypeRef v20 = [[AVUnreachableAssetInspectorLoader alloc] initWithFigError:v18 userInfo:0];
    goto LABEL_7;
  }
  uint64_t v19 = [AVFigAssetInspectorLoader alloc];
  CFTypeRef v20 = [(AVFigAssetInspectorLoader *)v19 initWithFigAsset:cf forAsset:v16];
LABEL_7:
  uint64_t v21 = v20;
  if (cf) {
    CFRelease(cf);
  }

  uint64_t v22 = _createMovieStorageWithLoader(v21);
  movie = v16->_movie;
  v16->_movie = (AVMovieInternal *)v22;

  if (!v16->_movie)
  {

    objc_super v30 = 0;
    goto LABEL_13;
  }
  [(AVMovie *)v16 _startListeningToLoaderNotifications];
  objc_storeStrong((id *)&v16->_movie->URL, a4);
  uint64_t v24 = [v12 copy];
  v25 = v16->_movie;
  data = v25->data;
  v25->data = (NSData *)v24;

  uint64_t v27 = [v13 copy];
  id v28 = v16->_movie;
  initializationOptions = v28->initializationOptions;
  v28->initializationOptions = (NSDictionary *)v27;

LABEL_11:
  objc_super v30 = v15;
LABEL_13:

  return v30;
}

- (id)_initWithFigError:(int)a3 userInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AVMovie;
  CFTypeRef v7 = [(AVAsset *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [[AVUnreachableAssetInspectorLoader alloc] initWithFigError:v4 userInfo:v6];
    uint64_t v9 = _createMovieStorageWithLoader(v8);
    movie = v7->_movie;
    v7->_movie = (AVMovieInternal *)v9;

    if (!v7->_movie)
    {

      id v11 = 0;
      goto LABEL_6;
    }
    [(AVMovie *)v7 _startListeningToLoaderNotifications];
  }
  id v11 = v7;
LABEL_6:

  return v11;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(AVMovie *)self _copyFormatReader];
  v5 = [AVMutableMovie alloc];
  id v6 = [(AVMovie *)self URL];
  CFTypeRef v7 = [(AVMovie *)self data];
  uint64_t v8 = [(AVMovie *)self _initializationOptions];
  id v9 = [(AVMutableMovie *)v5 _initWithFormatReader:v4 URL:v6 data:v7 options:v8];

  if (v4) {
    CFRelease(v4);
  }
  return v9;
}

- (void)dealloc
{
  if (self->_movie) {
    [(AVMovie *)self _stopListeningToLoaderNotifications];
  }
  v3.receiver = self;
  v3.super_class = (Class)AVMovie;
  [(AVAsset *)&v3 dealloc];
}

- (id)_assetInspectorLoader
{
  return self->_movie->loader;
}

- (id)_assetInspector
{
  return [(AVAssetInspectorLoader *)self->_movie->loader assetInspector];
}

- (Class)_classForTrackInspectors
{
  return [(AVAssetInspectorLoader *)self->_movie->loader _classForTrackInspectors];
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  return [(AVAssetInspectorLoader *)self->_movie->loader _copyFormatReader];
}

- (OpaqueFigMutableMovie)_figMutableMovie
{
  return 0;
}

- (OpaqueFigMutableMovie)_figMutableMovieFromFormatReader:(OpaqueFigFormatReader *)a3
{
  return 0;
}

- (id)_absoluteURL
{
  v2 = [(AVMovie *)self URL];
  objc_super v3 = [v2 absoluteURL];

  return v3;
}

- (AVMediaDataStorage)defaultMediaDataStorage
{
  return 0;
}

- (NSURL)URL
{
  return self->_movie->URL;
}

- (NSData)data
{
  return self->_movie->data;
}

- (id)_initializationOptions
{
  return self->_movie->initializationOptions;
}

- (Class)_classForMovieTracks
{
  return (Class)objc_opt_class();
}

- (NSArray)tracks
{
  makeTracksArrayOnce = self->_movie->makeTracksArrayOnce;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __17__AVMovie_tracks__block_invoke;
  v5[3] = &unk_1E57B76B0;
  v5[4] = self;
  [(AVDispatchOnce *)makeTracksArrayOnce runBlockOnce:v5];
  return self->_movie->tracks;
}

void __17__AVMovie_tracks__block_invoke(uint64_t a1)
{
  id v9 = [MEMORY[0x1E4F1CA48] array];
  v2 = [*(id *)(a1 + 32) _assetInspector];
  uint64_t v3 = [v2 trackCount];

  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(*(id *)(a1 + 32), "_classForMovieTracks")), "_initWithAsset:trackIndex:", *(void *)(a1 + 32), i);
      if (v5) {
        [v9 addObject:v5];
      }
    }
  }
  uint64_t v6 = [v9 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 16);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (AVMovieTrack)trackWithTrackID:(CMPersistentTrackID)trackID
{
  v5.receiver = self;
  v5.super_class = (Class)AVMovie;
  uint64_t v3 = [(AVAsset *)&v5 trackWithTrackID:*(void *)&trackID];
  return (AVMovieTrack *)v3;
}

- (NSArray)tracksWithMediaType:(AVMediaType)mediaType
{
  v5.receiver = self;
  v5.super_class = (Class)AVMovie;
  uint64_t v3 = [(AVAsset *)&v5 tracksWithMediaType:mediaType];
  return (NSArray *)v3;
}

- (NSArray)tracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  v5.receiver = self;
  v5.super_class = (Class)AVMovie;
  uint64_t v3 = [(AVAsset *)&v5 tracksWithMediaCharacteristic:mediaCharacteristic];
  return (NSArray *)v3;
}

- (id)trackReferences
{
  v4.receiver = self;
  v4.super_class = (Class)AVMovie;
  v2 = [(AVAsset *)&v4 trackReferences];
  return v2;
}

- (unint64_t)referenceRestrictions
{
  v2 = [(AVMovie *)self _initializationOptions];
  uint64_t v3 = [v2 objectForKey:@"AVMovieReferenceRestrictionsKey"];

  if (v3) {
    unint64_t v4 = [v3 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 2;
  }

  return v4;
}

- (BOOL)canContainMovieFragments
{
  v3.receiver = self;
  v3.super_class = (Class)AVMovie;
  return [(AVAsset *)&v3 canContainFragments];
}

- (BOOL)containsMovieFragments
{
  v3.receiver = self;
  v3.super_class = (Class)AVMovie;
  return [(AVAsset *)&v3 containsFragments];
}

- (BOOL)hasProtectedContent
{
  CFTypeRef cf = 0;
  [(AVAsset *)self _figAsset];
  uint64_t CMBaseObject = FigAssetGetCMBaseObject();
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
  int v6 = v5(CMBaseObject, *MEMORY[0x1E4F322D0], *MEMORY[0x1E4F1CF80], &cf);
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

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  int v6 = [v3 stringWithFormat:@"<%@: %p>", v5, self];

  return v6;
}

- (BOOL)isDefunct
{
  unsigned __int8 v9 = 0;
  v2 = [(AVAsset *)self _figAsset];
  uint64_t v3 = *(void **)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  if (*v4 < 5uLL)
  {
    int v6 = 0;
    LOBYTE(v5) = 0;
  }
  else
  {
    objc_super v5 = (unsigned int (*)(OpaqueFigAsset *, unsigned __int8 *))v4[11];
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

- (OpaqueFigMutableMovie)_mutableMovieForFileType:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(AVMovie *)self _copyFormatReader];
  int v6 = _figOptionsFromAVMovieOptions(0);
  if (v5)
  {
    FigMutableMovieRemoteCreateFromFormatReader();
    CFRelease(v5);
  }
  else if (self->_movie->data)
  {
    FigMutableMovieRemoteCreateFromData();
  }

  return 0;
}

- (NSData)movieHeaderWithFileType:(AVFileType)fileType error:(NSError *)outError
{
  int v7 = fileType;
  v25 = 0;
  CFTypeID v8 = [(AVMovie *)self _figMutableMovie];
  if (!v7)
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F1CA00];
    id v23 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v9, v10, v11, v12, v13, (uint64_t)"fileType != nil");
    id v24 = [v22 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v23 userInfo:0];

    objc_exception_throw(v24);
  }
  if (v8) {
    uint64_t v14 = (OpaqueFigMutableMovie *)CFRetain(v8);
  }
  else {
    uint64_t v14 = [(AVMovie *)self _mutableMovieForFileType:v7];
  }
  uint64_t v15 = v14;
  if (v14)
  {
    uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v16) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 0;
    }
    uint64_t v18 = *(uint64_t (**)(OpaqueFigMutableMovie *, NSString *, void, void, void **))(v17 + 24);
    if (v18)
    {
      signed int v19 = v18(v15, v7, 0, *MEMORY[0x1E4F1CF80], &v25);
      if (!outError) {
        goto LABEL_15;
      }
    }
    else
    {
      signed int v19 = -12782;
      if (!outError)
      {
LABEL_15:
        CFRelease(v15);
        CFTypeRef v20 = v25;
        goto LABEL_16;
      }
    }
    if (v19)
    {
      AVLocalizedErrorWithUnderlyingOSStatus(v19, 0);
      *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_15;
  }
  CFTypeRef v20 = 0;
LABEL_16:

  return (NSData *)v20;
}

- (BOOL)writeMovieHeaderToURL:(NSURL *)URL fileType:(AVFileType)fileType options:(AVMovieWritingOptions)options error:(NSError *)outError
{
  char v7 = options;
  uint64_t v11 = URL;
  uint64_t v12 = fileType;
  uint64_t v13 = [(AVMovie *)self _figMutableMovie];
  if (!v11)
  {
    v26 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v27 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v14, v15, v16, v17, v18, (uint64_t)"URL != nil");
    id v28 = [v26 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v27 userInfo:0];
    goto LABEL_21;
  }
  if (!v12)
  {
    uint64_t v29 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v27 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v14, v15, v16, v17, v18, (uint64_t)"fileType != nil");
    id v28 = [v29 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v27 userInfo:0];
LABEL_21:
    id v30 = v28;

    objc_exception_throw(v30);
  }
  if (v13) {
    signed int v19 = (OpaqueFigMutableMovie *)CFRetain(v13);
  }
  else {
    signed int v19 = [(AVMovie *)self _mutableMovieForFileType:v12];
  }
  CFTypeRef v20 = v19;
  if (!v19)
  {
    signed int v24 = 0;
    goto LABEL_17;
  }
  uint64_t v21 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v21) {
    uint64_t v22 = v21;
  }
  else {
    uint64_t v22 = 0;
  }
  id v23 = *(uint64_t (**)(OpaqueFigMutableMovie *, NSString *, NSURL *, void, void))(v22 + 16);
  if (v23)
  {
    signed int v24 = v23(v20, v12, v11, 0, v7 & 1);
    if (!outError) {
      goto LABEL_16;
    }
LABEL_14:
    if (v24)
    {
      AVLocalizedErrorWithUnderlyingOSStatus(v24, 0);
      *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_16;
  }
  signed int v24 = -12782;
  if (outError) {
    goto LABEL_14;
  }
LABEL_16:
  CFRelease(v20);
LABEL_17:

  return v24 == 0;
}

- (BOOL)isCompatibleWithFileType:(AVFileType)fileType
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  signed int v19 = fileType;
  id v4 = [(AVAsset *)self _chapterTracks];
  objc_super v5 = +[AVMediaFileType mediaFileTypeWithFileTypeIdentifier:v19];
  [v5 figFormatReaderFileFormat];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int v6 = [(AVMovie *)self tracks];
  CFTypeRef v20 = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    do
    {
      uint64_t v9 = 0;
      uint64_t v18 = v7;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
        uint64_t v11 = [v10 formatDescriptions];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v22;
          while (2)
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v22 != v14) {
                objc_enumerationMutation(v12);
              }
              [v4 containsObject:v10];
              if (!FigMovieFormatWriterCanFileTypeSupportFormatDescription())
              {

                BOOL v16 = 0;
                int v6 = v20;
                goto LABEL_19;
              }
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        ++v9;
        int v6 = v20;
      }
      while (v9 != v18);
      uint64_t v7 = [v20 countByEnumeratingWithState:&v25 objects:v30 count:16];
      BOOL v16 = 1;
    }
    while (v7);
  }
  else
  {
    BOOL v16 = 1;
  }
LABEL_19:

  return v16;
}

@end