@interface VCPAsset
+ (void)unimplementedExceptionForMethodName:(id)a3;
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)slomoRange;
- (BOOL)hadFlash;
- (BOOL)isHDR;
- (BOOL)isImage;
- (BOOL)isLivePhoto;
- (BOOL)isMovie;
- (BOOL)isMovieResourceLocalAvailable;
- (BOOL)isPano;
- (BOOL)isSDOF;
- (BOOL)isScreenshot;
- (BOOL)isShortMovie;
- (BOOL)isSlowmo;
- (BOOL)isTimelapse;
- (CGSize)originalMovieSize;
- (NSArray)allScenes;
- (NSDate)modificationDate;
- (NSDictionary)exif;
- (NSDictionary)scenes;
- (NSString)localIdentifier;
- (NSURL)mainFileURL;
- (PHFetchResult)faces;
- (VCPFingerprint)fingerprint;
- (__CVBuffer)imageWithPreferredDimension:(unint64_t)a3;
- (__CVBuffer)imageWithPreferredDimension:(unint64_t)a3 orientation:(unsigned int *)a4;
- (double)duration;
- (float)exposureTimeSeconds;
- (float)originalPhotoOffsetSeconds;
- (float)photoOffsetSeconds;
- (float)slowmoRate;
- (float)timelapseRate;
- (id)movie;
- (id)originalMovie;
- (id)streamedMovie:(BOOL)a3;
- (id)typeDescription;
- (int64_t)mediaType;
- (unint64_t)mediaSubtypes;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
@end

@implementation VCPAsset

+ (void)unimplementedExceptionForMethodName:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F1CA00];
  v5 = [NSString stringWithFormat:@"[VCPAsset %@] should not be called", v3];
  id v6 = [v4 exceptionWithName:@"NotImplementedException" reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (int64_t)mediaType
{
  return 0;
}

- (unint64_t)mediaSubtypes
{
  return 0;
}

- (unint64_t)pixelWidth
{
  return 0;
}

- (unint64_t)pixelHeight
{
  return 0;
}

- (NSDate)modificationDate
{
  return 0;
}

- (VCPFingerprint)fingerprint
{
  return 0;
}

- (BOOL)isImage
{
  return [(VCPAsset *)self mediaType] == 1;
}

- (BOOL)isMovie
{
  return [(VCPAsset *)self mediaType] == 2;
}

- (NSString)localIdentifier
{
  return 0;
}

- (NSURL)mainFileURL
{
  return 0;
}

- (NSArray)allScenes
{
  return 0;
}

- (NSDictionary)scenes
{
  return 0;
}

- (PHFetchResult)faces
{
  return 0;
}

- (id)typeDescription
{
  if ([(VCPAsset *)self mediaType] == 1)
  {
    if (([(VCPAsset *)self mediaSubtypes] & 8) != 0) {
      return @"Live Photo";
    }
    if ([(VCPAsset *)self mediaSubtypes]) {
      return @"Pano Photo";
    }
    if (([(VCPAsset *)self mediaSubtypes] & 4) != 0) {
      return @"Screenshot";
    }
    if (([(VCPAsset *)self mediaSubtypes] & 2) != 0) {
      return @"HDR Photo";
    }
    char v3 = [(VCPAsset *)self mediaSubtypes];
    v4 = @"SDOF Photo";
    v5 = @"Photo";
    BOOL v6 = (v3 & 0x10) == 0;
  }
  else
  {
    if ([(VCPAsset *)self mediaType] != 2) {
      return @"Unknown";
    }
    if (([(VCPAsset *)self mediaSubtypes] & 0x20000) != 0) {
      return @"Slow-mo Movie";
    }
    unint64_t v7 = [(VCPAsset *)self mediaSubtypes];
    v4 = @"Timelapse Movie";
    v5 = @"Movie";
    BOOL v6 = (v7 & 0x40000) == 0;
  }
  if (v6) {
    return v5;
  }
  else {
    return v4;
  }
}

- (BOOL)isPano
{
  return [(VCPAsset *)self mediaSubtypes] & 1;
}

- (BOOL)isLivePhoto
{
  return ([(VCPAsset *)self mediaSubtypes] >> 3) & 1;
}

- (BOOL)isScreenshot
{
  return ([(VCPAsset *)self mediaSubtypes] >> 2) & 1;
}

- (BOOL)isHDR
{
  return ([(VCPAsset *)self mediaSubtypes] >> 1) & 1;
}

- (BOOL)isSDOF
{
  return ([(VCPAsset *)self mediaSubtypes] >> 4) & 1;
}

- (NSDictionary)exif
{
  return 0;
}

- (__CVBuffer)imageWithPreferredDimension:(unint64_t)a3
{
  return 0;
}

- (__CVBuffer)imageWithPreferredDimension:(unint64_t)a3 orientation:(unsigned int *)a4
{
  return 0;
}

- (BOOL)hadFlash
{
  v2 = [(VCPAsset *)self exif];
  char v3 = v2;
  if (v2) {
    char v4 = objc_msgSend(v2, "vcp_flashFired");
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (float)exposureTimeSeconds
{
  float v3 = 0.0;
  if ([(VCPAsset *)self isLivePhoto])
  {
    char v4 = [(VCPAsset *)self exif];
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "vcp_scaledExposureTime");
      float v3 = v6;
    }
    else
    {
      float v3 = 0.0333;
    }
  }
  return v3;
}

- (float)photoOffsetSeconds
{
  BOOL v2 = [(VCPAsset *)self isLivePhoto];
  float result = 1.6;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (float)originalPhotoOffsetSeconds
{
  BOOL v2 = [(VCPAsset *)self isLivePhoto];
  float result = 1.6;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (BOOL)isSlowmo
{
  return ([(VCPAsset *)self mediaSubtypes] >> 17) & 1;
}

- (BOOL)isTimelapse
{
  return ([(VCPAsset *)self mediaSubtypes] >> 18) & 1;
}

- (BOOL)isShortMovie
{
  return 0;
}

- (double)duration
{
  return 0.0;
}

- (float)slowmoRate
{
  return 1.0;
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

- (float)timelapseRate
{
  BOOL v2 = [(VCPAsset *)self isTimelapse];
  float result = 0.66667;
  if (!v2) {
    return 1.0;
  }
  return result;
}

- (id)movie
{
  return 0;
}

- (BOOL)isMovieResourceLocalAvailable
{
  return 0;
}

- (id)streamedMovie:(BOOL)a3
{
  return 0;
}

- (id)originalMovie
{
  return 0;
}

- (CGSize)originalMovieSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

@end