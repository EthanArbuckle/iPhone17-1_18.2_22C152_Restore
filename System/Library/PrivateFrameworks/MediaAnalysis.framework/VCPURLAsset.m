@interface VCPURLAsset
+ (id)imageAssetWithURL:(id)a3;
+ (id)livePhotoAssetWithImageURL:(id)a3 andMovieURL:(id)a4;
+ (id)movieAssetWithURL:(id)a3;
+ (id)sdofImageAssetWithURL:(id)a3;
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)slomoRange;
- (BOOL)isMovieResourceLocalAvailable;
- (VCPURLAsset)initWithImageURL:(id)a3 andMovieURL:(id)a4;
- (VCPURLAsset)initWithImageURL:(id)a3 isSDOF:(BOOL)a4;
- (VCPURLAsset)initWithMovieURL:(id)a3;
- (__CVBuffer)imageWithPreferredDimension:(unint64_t)a3;
- (__CVBuffer)imageWithPreferredDimension:(unint64_t)a3 orientation:(unsigned int *)a4;
- (double)duration;
- (float)photoOffsetSeconds;
- (float)slowmoRate;
- (id)exif;
- (id)mainFileURL;
- (id)modificationDate;
- (id)movie;
- (id)originalMovie;
- (id)scenes;
- (int64_t)mediaType;
- (unint64_t)mediaSubtypes;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
@end

@implementation VCPURLAsset

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (unint64_t)mediaSubtypes
{
  return self->_mediaSubtypes;
}

- (unint64_t)pixelWidth
{
  return self->_pixelWidth;
}

- (unint64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (id)modificationDate
{
  if ([(VCPAsset *)self isMovie])
  {
    v3 = [(AVURLAsset *)self->_movie URL];
  }
  else
  {
    v3 = self->_imageURL;
  }
  v4 = v3;
  id v7 = 0;
  [(NSURL *)v3 getResourceValue:&v7 forKey:*MEMORY[0x1E4F1C530] error:0];
  id v5 = v7;

  return v5;
}

- (id)mainFileURL
{
  if ([(VCPAsset *)self isMovie])
  {
    v3 = [(AVURLAsset *)self->_movie URL];
  }
  else
  {
    v3 = self->_imageURL;
  }
  return v3;
}

- (id)scenes
{
  v35[1] = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_onceScenes)
  {
    int v29 = 0;
LABEL_3:
    objc_sync_exit(v2);

    goto LABEL_4;
  }
  v2->_onceScenes = 1;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  cachedScenes = v2->_cachedScenes;
  v2->_cachedScenes = (NSMutableDictionary *)v4;

  id v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = (void *)MEMORY[0x1C186D320]();
  id v8 = objc_alloc(MEMORY[0x1E4F45890]);
  v9 = (void *)[v8 initWithURL:v2->_imageURL options:MEMORY[0x1E4F1CC08]];
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F45948]);
    v11 = v10;
    if (v10
      && ([v10 setPreferBackgroundProcessing:1],
          [v11 setRevision:2],
          v35[0] = v11,
          [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1],
          v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = [v9 performRequests:v12 error:0],
          v12,
          (v13 & 1) != 0))
    {
      v14 = [v11 results];
      BOOL v15 = v14 == 0;

      if (!v15)
      {
        v16 = [v11 results];
        [v6 addObjectsFromArray:v16];
      }
      int v17 = 0;
      int v29 = 0;
    }
    else
    {
      int v29 = -18;
      int v17 = 4;
    }
  }
  else
  {
    int v29 = -108;
    int v17 = 4;
  }

  if (!v17)
  {
    if ([v6 count])
    {
      if ((unint64_t)[v6 count] >= 0xB)
      {
        [v6 sortUsingComparator:&__block_literal_global_34];
        v19 = objc_msgSend(v6, "subarrayWithRange:", 0, 10);
        uint64_t v20 = [v19 mutableCopy];

        id v6 = (id)v20;
      }
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v6 = v6;
      uint64_t v21 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v31 != v22) {
              objc_enumerationMutation(v6);
            }
            v24 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            v25 = v2->_cachedScenes;
            v26 = NSNumber;
            [v24 confidence];
            v27 = objc_msgSend(v26, "numberWithFloat:");
            v28 = [v24 identifier];
            [(NSMutableDictionary *)v25 setObject:v27 forKey:v28];
          }
          uint64_t v21 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v21);
      }
    }
    goto LABEL_3;
  }

  objc_sync_exit(v2);
LABEL_4:
  if (v29)
  {
    v3 = 0;
  }
  else
  {
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v2->_cachedScenes];
  }
  return v3;
}

uint64_t __21__VCPURLAsset_scenes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 confidence];
  float v7 = v6;
  [v5 confidence];
  if (v7 <= v8)
  {
    [v4 confidence];
    float v11 = v10;
    [v5 confidence];
    uint64_t v9 = v11 < v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedScenes, 0);
  objc_storeStrong((id *)&self->_cachedExif, 0);
  objc_storeStrong((id *)&self->_movie, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
}

- (VCPURLAsset)initWithImageURL:(id)a3 isSDOF:(BOOL)a4
{
  BOOL v4 = a4;
  CFURLRef v6 = (const __CFURL *)a3;
  float v7 = CGImageSourceCreateWithURL(v6, 0);
  if (!v7)
  {
    v18 = 0;
    goto LABEL_23;
  }
  v24.receiver = self;
  v24.super_class = (Class)VCPURLAsset;
  float v8 = [(VCPURLAsset *)&v24 init];
  self = v8;
  if (v8)
  {
    uint64_t v9 = [(__CFURL *)v6 copy];
    imageURL = v8->_imageURL;
    v8->_imageURL = (NSURL *)v9;

    v8->_mediaType = 1;
    double Size = CGImageSourceGetSize(v7);
    p_unint64_t pixelWidth = &v8->_pixelWidth;
    v8->_unint64_t pixelWidth = (unint64_t)Size;
    unint64_t v14 = (unint64_t)v13;
    v8->_pixelHeight = (unint64_t)v13;
    unint64_t pixelWidth = v8->_pixelWidth;
    if (pixelWidth) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (v16)
    {
      int v17 = 0;
      goto LABEL_20;
    }
    BOOL v19 = pixelWidth > v14;
    if (pixelWidth >= v14) {
      p_pixelHeight = &v8->_pixelWidth;
    }
    else {
      p_pixelHeight = &v8->_pixelHeight;
    }
    unint64_t v21 = *p_pixelHeight;
    if (v19) {
      p_unint64_t pixelWidth = &v8->_pixelHeight;
    }
    if (v21 > 2 * *p_pixelWidth) {
      v8->_mediaSubtypes |= 1uLL;
    }
    if (v4) {
      v8->_mediaSubtypes |= 0x10uLL;
    }
  }
  int v17 = 1;
LABEL_20:
  CFRelease(v7);
  if (v17) {
    v18 = v8;
  }
  else {
    v18 = 0;
  }
LABEL_23:
  uint64_t v22 = v18;

  return v22;
}

+ (id)imageAssetWithURL:(id)a3
{
  id v3 = a3;
  if (v3) {
    BOOL v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithImageURL:v3 isSDOF:0];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

+ (id)sdofImageAssetWithURL:(id)a3
{
  id v3 = a3;
  if (v3) {
    BOOL v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithImageURL:v3 isSDOF:1];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)exif
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_onceExif)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1C9E8], "vcp_exifFromImageURL:", v2->_imageURL);
    cachedExif = v2->_cachedExif;
    v2->_cachedExif = (NSDictionary *)v3;

    v2->_onceExif = 1;
  }
  objc_sync_exit(v2);

  id v5 = v2->_cachedExif;
  return v5;
}

- (__CVBuffer)imageWithPreferredDimension:(unint64_t)a3
{
  id v5 = +[VCPImageManager sharedImageManager];
  CFURLRef v6 = (__CVBuffer *)[v5 pixelBufferWithFormat:875704422 andMaxDimension:a3 fromImageURL:self->_imageURL];

  return v6;
}

- (__CVBuffer)imageWithPreferredDimension:(unint64_t)a3 orientation:(unsigned int *)a4
{
  float v7 = +[VCPImageManager sharedImageManager];
  float v8 = (__CVBuffer *)[v7 pixelBufferWithFormat:875704422 andMaxDimension:a3 fromImageURL:self->_imageURL orientation:a4];

  return v8;
}

- (VCPURLAsset)initWithImageURL:(id)a3 andMovieURL:(id)a4
{
  CFURLRef v6 = (const __CFURL *)a3;
  id v7 = a4;
  float v8 = CGImageSourceCreateWithURL(v6, 0);
  if (v8)
  {
    v20.receiver = self;
    v20.super_class = (Class)VCPURLAsset;
    uint64_t v9 = [(VCPURLAsset *)&v20 init];
    self = v9;
    if (v9)
    {
      uint64_t v10 = [(__CFURL *)v6 copy];
      imageURL = v9->_imageURL;
      v9->_imageURL = (NSURL *)v10;

      v9->_mediaType = 1;
      v9->_mediaSubtypes = 8;
      v9->_unint64_t pixelWidth = (unint64_t)CGImageSourceGetSize(v8);
      v9->_pixelHeight = (unint64_t)v12;
      if (v9->_pixelWidth) {
        BOOL v13 = (unint64_t)v12 == 0;
      }
      else {
        BOOL v13 = 1;
      }
      if (v13)
      {
        int v14 = -50;
      }
      else
      {
        uint64_t v16 = [MEMORY[0x1E4F166C8] assetWithURL:v7];
        movie = v9->_movie;
        v9->_movie = (AVURLAsset *)v16;

        if (v9->_movie) {
          int v14 = 0;
        }
        else {
          int v14 = -50;
        }
      }
    }
    else
    {
      int v14 = 0;
    }
    CFRelease(v8);
    if (v14) {
      BOOL v15 = 0;
    }
    else {
      BOOL v15 = v9;
    }
  }
  else
  {
    BOOL v15 = 0;
  }
  v18 = v15;

  return v18;
}

+ (id)livePhotoAssetWithImageURL:(id)a3 andMovieURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  float v8 = 0;
  if (v5 && v6) {
    float v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithImageURL:v5 andMovieURL:v6];
  }

  return v8;
}

- (float)photoOffsetSeconds
{
  BOOL v3 = [(VCPAsset *)self isLivePhoto];
  double v4 = 0.0;
  if (v3)
  {
    memset(&v9, 0, sizeof(v9));
    movie = self->_movie;
    if (movie
      && ([(AVURLAsset *)movie vcp_livePhotoStillDisplayTime], (v9.flags & 1) != 0))
    {
      CMTime time = v9;
      *(float *)&double v4 = CMTimeGetSeconds(&time);
    }
    else
    {
      v7.receiver = self;
      v7.super_class = (Class)VCPURLAsset;
      [(VCPAsset *)&v7 photoOffsetSeconds];
    }
  }
  return *(float *)&v4;
}

- (VCPURLAsset)initWithMovieURL:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)VCPURLAsset;
  id v5 = [(VCPURLAsset *)&v25 init];
  if (!v5) {
    goto LABEL_12;
  }
  id v6 = (VCPURLAsset *)MEMORY[0x1C186D320]();
  v5->_mediaType = 2;
  uint64_t v7 = [MEMORY[0x1E4F166C8] assetWithURL:v4];
  movie = v5->_movie;
  v5->_movie = (AVURLAsset *)v7;

  CMTime v9 = v5->_movie;
  if (v9)
  {
    uint64_t v10 = [(AVURLAsset *)v9 vcp_firstEnabledTrackWithMediaType:*MEMORY[0x1E4F15C18]];
    float v11 = v10;
    if (v10)
    {
      [v10 naturalSize];
      double v13 = v12;
      double v15 = v14;
      [v11 preferredTransform];
      v5->_unint64_t pixelWidth = (unint64_t)fabs(v15 * v23 + v21 * v13);
      v5->_pixelHeight = (unint64_t)fabs(v15 * v24 + v22 * v13);
      [v11 nominalFrameRate];
      int v16 = 0;
      int v17 = 0;
      if (v18 >= 120.0) {
        v5->_mediaSubtypes |= 0x20000uLL;
      }
    }
    else
    {
      int v17 = -18;
      int v16 = 4;
    }
  }
  else
  {
    int v17 = -50;
    int v16 = 4;
  }
  if ((v16 | 4) == 4)
  {
    if (v17)
    {
      BOOL v19 = 0;
LABEL_13:
      id v6 = v19;
      goto LABEL_14;
    }
LABEL_12:
    BOOL v19 = v5;
    goto LABEL_13;
  }
LABEL_14:

  return v6;
}

+ (id)movieAssetWithURL:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMovieURL:v3];

  return v4;
}

- (double)duration
{
  movie = self->_movie;
  if (movie) {
    [(AVURLAsset *)movie duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  return CMTimeGetSeconds(&time);
}

- (float)slowmoRate
{
  float v3 = 1.0;
  if ([(VCPAsset *)self isSlowmo])
  {
    id v4 = [(AVURLAsset *)self->_movie vcp_firstEnabledTrackWithMediaType:*MEMORY[0x1E4F15C18]];
    [v4 nominalFrameRate];
    float v3 = 30.0 / v5;
  }
  return v3;
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)slomoRange
{
  uint64_t v3 = MEMORY[0x1E4F1FA20];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&retstr->var0.var3 = v4;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v3 + 32);
  return self;
}

- (id)movie
{
  return self->_movie;
}

- (BOOL)isMovieResourceLocalAvailable
{
  return 1;
}

- (id)originalMovie
{
  return self->_movie;
}

@end