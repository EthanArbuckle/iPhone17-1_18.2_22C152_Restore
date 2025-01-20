@interface NTKTimelapseListing
- (BOOL)isEqual:(id)a3;
- (BOOL)isSimilarTo:(id)a3;
- (BOOL)snapshotDiffers:(id)a3;
- (CLKVideo)video;
- (NTKPhotoAnalysis)photoAnalysis;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForDevice:(id)a3 withTheme:(unint64_t)a4 videoIndex:(int64_t)a5 photoAnalysis:(id)a6;
- (int64_t)videoIndex;
- (unint64_t)theme;
- (void)_setHasAssets;
- (void)discardAssets;
@end

@implementation NTKTimelapseListing

- (id)initForDevice:(id)a3 withTheme:(unint64_t)a4 videoIndex:(int64_t)a5 photoAnalysis:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)NTKTimelapseListing;
  v13 = [(NTKTimelapseListing *)&v22 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_device, a3);
    v15 = +[NTKTimelapseThemeEditOption optionWithTimelapseTheme:a4 forDevice:v14->_device];
    uint64_t v16 = [v15 resourceNameWithVideoIndex:a5];
    videoName = v14->_videoName;
    v14->_videoName = (NSString *)v16;

    uint64_t v18 = [v15 resourceBaseName];
    imageName = v14->_imageName;
    v14->_imageName = (NSString *)v18;

    v14->_theme = a4;
    v14->_videoIndex = a5;
    objc_storeStrong((id *)&v14->_photoAnalysis, a6);
    v20 = v14;
  }
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  device = self->_device;
  unint64_t theme = self->_theme;
  int64_t videoIndex = self->_videoIndex;
  photoAnalysis = self->_photoAnalysis;

  return [v4 initForDevice:device withTheme:theme videoIndex:videoIndex photoAnalysis:photoAnalysis];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CLKDevice **)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && self->_device == v4[1]
    && (id v5 = -[NTKTimelapseListing theme](self, "theme"), v5 == [v4 theme]))
  {
    id v6 = [(NTKTimelapseListing *)self videoIndex];
    BOOL v7 = v6 == [v4 videoIndex];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isSimilarTo:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKTimelapseListing *)self theme];
  if (v5 == [v4 theme])
  {
    uint64_t v6 = NTKNumberOfTimelapseSlots();
    int64_t v7 = [(NTKTimelapseListing *)self videoIndex];
    id v8 = [v4 videoIndex];
    uint64_t v9 = v7 - (void)v8;
    if (v7 - (uint64_t)v8 < 0) {
      uint64_t v9 = (uint64_t)v8 - v7;
    }
    if (v9 >= v6 - v9) {
      uint64_t v9 = v6 - v9;
    }
    BOOL v10 = v9 < 3;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_setHasAssets
{
  id v3 = +[NTKTimelapseListingFactory sharedInstanceForDevice:self->_device];
  [v3 setTimelapseListingHasAssets:self];
}

- (CLKVideo)video
{
  video = self->_video;
  if (!video)
  {
    videoName = self->_videoName;
    device = self->_device;
    uint64_t v6 = NTKAssetsBundle();
    int64_t v7 = +[CLKVideo videoNamed:videoName forDevice:device inBundle:v6];
    id v8 = self->_video;
    self->_video = v7;

    [(NTKTimelapseListing *)self _setHasAssets];
    video = self->_video;
  }

  return video;
}

- (BOOL)snapshotDiffers:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 theme];
    if (v6 == (id)[(NTKTimelapseListing *)self theme])
    {
      id v7 = [v5 videoIndex];
      char v8 = v7 != (id)[(NTKTimelapseListing *)self videoIndex];
    }
    else
    {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (void)discardAssets
{
  self->_video = 0;
  _objc_release_x1();
}

- (unint64_t)theme
{
  return self->_theme;
}

- (int64_t)videoIndex
{
  return self->_videoIndex;
}

- (NTKPhotoAnalysis)photoAnalysis
{
  return self->_photoAnalysis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoAnalysis, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_videoName, 0);
  objc_storeStrong((id *)&self->_video, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end