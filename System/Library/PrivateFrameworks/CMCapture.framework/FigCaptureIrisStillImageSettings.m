@interface FigCaptureIrisStillImageSettings
+ (BOOL)supportsSecureCoding;
- (CGSize)nonDestructiveCropSize;
- (FigCaptureIrisStillImageSettings)initWithCoder:(id)a3;
- (FigCaptureMovieFileRecordingSettings)movieRecordingSettings;
- (FigCaptureSemanticStyle)semanticStyle;
- (NSArray)movieLevelMetadataForOriginalImage;
- (NSArray)spatialOverCaptureMovieLevelMetadataForOriginalImage;
- (NSURL)movieURLForOriginalImage;
- (NSURL)spatialOverCaptureMovieURLForOriginalImage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)movieMode;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setMovieLevelMetadataForOriginalImage:(id)a3;
- (void)setMovieMode:(int)a3;
- (void)setMovieRecordingSettings:(id)a3;
- (void)setMovieURLForOriginalImage:(id)a3;
- (void)setNonDestructiveCropSize:(CGSize)a3;
- (void)setSemanticStyle:(id)a3;
- (void)setSpatialOverCaptureMovieLevelMetadataForOriginalImage:(id)a3;
- (void)setSpatialOverCaptureMovieURLForOriginalImage:(id)a3;
@end

@implementation FigCaptureIrisStillImageSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)FigCaptureIrisStillImageSettings;
  -[FigCaptureStillImageSettings encodeWithCoder:](&v12, sel_encodeWithCoder_);
  [a3 encodeInt32:*((unsigned int *)&self->super._smartStyleReversibilitySupported + 1) forKey:@"movieMode"];
  uint64_t v5 = *(void *)&self->_movieMode;
  if (v5) {
    [a3 encodeObject:v5 forKey:@"movieRecordingSettings"];
  }
  movieRecordingSettings = self->_movieRecordingSettings;
  if (movieRecordingSettings) {
    [a3 encodeObject:movieRecordingSettings forKey:@"movieURLForOriginalImage"];
  }
  movieURLForOriginalImage = self->_movieURLForOriginalImage;
  if (movieURLForOriginalImage) {
    [a3 encodeObject:movieURLForOriginalImage forKey:@"movieLevelMetadataForOriginalImage"];
  }
  movieLevelMetadataForOriginalImage = self->_movieLevelMetadataForOriginalImage;
  if (movieLevelMetadataForOriginalImage) {
    [a3 encodeObject:movieLevelMetadataForOriginalImage forKey:@"spatialOverCaptureMovieURLForOriginalImage"];
  }
  spatialOverCaptureMovieURLForOriginalImage = self->_spatialOverCaptureMovieURLForOriginalImage;
  if (spatialOverCaptureMovieURLForOriginalImage) {
    [a3 encodeObject:spatialOverCaptureMovieURLForOriginalImage forKey:@"spatialOverCaptureMovieLevelMetadataForOriginalImage"];
  }
  CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(*(CGSize *)&self->_spatialOverCaptureMovieLevelMetadataForOriginalImage);
  [a3 encodeObject:DictionaryRepresentation forKey:@"nonDestructiveCropSize"];

  CGFloat height = self->_nonDestructiveCropSize.height;
  if (height != 0.0) {
    [a3 encodeObject:*(void *)&height forKey:@"semanticStyle"];
  }
}

- (FigCaptureIrisStillImageSettings)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)FigCaptureIrisStillImageSettings;
  v4 = -[FigCaptureStillImageSettings initWithCoder:](&v11, sel_initWithCoder_);
  if (v4)
  {
    AllowedClassSetForMetadataItems = (void *)FigCaptureMetadataUtilitiesCreateAllowedClassSetForMetadataItems();
    *((_DWORD *)v4 + 127) = [a3 decodeInt32ForKey:@"movieMode"];
    *((void *)v4 + 64) = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"movieRecordingSettings"];
    *((void *)v4 + 65) = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"movieURLForOriginalImage"];
    *((void *)v4 + 66) = (id)[a3 decodeObjectOfClasses:AllowedClassSetForMetadataItems forKey:@"movieLevelMetadataForOriginalImage"];
    *((void *)v4 + 67) = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"spatialOverCaptureMovieURLForOriginalImage"];
    *((void *)v4 + 68) = (id)[a3 decodeObjectOfClasses:AllowedClassSetForMetadataItems forKey:@"spatialOverCaptureMovieLevelMetadataForOriginalImage"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    CFDictionaryRef v9 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0), @"nonDestructiveCropSize");
    CGSizeMakeWithDictionaryRepresentation(v9, (CGSize *)(v4 + 552));

    *((void *)v4 + 71) = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"semanticStyle"];
  }
  return (FigCaptureIrisStillImageSettings *)v4;
}

- (void)setSemanticStyle:(id)a3
{
}

- (FigCaptureSemanticStyle)semanticStyle
{
  return *(FigCaptureSemanticStyle **)&self->_nonDestructiveCropSize.height;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureIrisStillImageSettings;
  [(FigCaptureStillImageSettings *)&v3 dealloc];
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)FigCaptureIrisStillImageSettings;
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", -[FigCaptureStillImageSettings description](&v7, sel_description));
  uint64_t v4 = *((unsigned int *)&self->super._smartStyleReversibilitySupported + 1);
  if (v4)
  {
    if (self->_movieLevelMetadataForOriginalImage)
    {
      uint64_t v5 = (__CFString *)[NSString stringWithFormat:@" Original-OverCapture:%@", self->_movieLevelMetadataForOriginalImage];
      uint64_t v4 = *((unsigned int *)&self->super._smartStyleReversibilitySupported + 1);
    }
    else
    {
      uint64_t v5 = &stru_1EFA403E0;
    }
    [v3 appendFormat:@" IRIS:%d Original:%@%@ <%@>%@", v4, self->_movieRecordingSettings, v5, *(void *)&self->_movieMode, objc_msgSend(*(id *)&self->_nonDestructiveCropSize.height, "description")];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigCaptureIrisStillImageSettings;
  id v4 = [(FigCaptureStillImageSettings *)&v6 copyWithZone:a3];
  [v4 setMovieMode:*((unsigned int *)&self->super._smartStyleReversibilitySupported + 1)];
  [v4 setMovieRecordingSettings:*(void *)&self->_movieMode];
  [v4 setMovieURLForOriginalImage:self->_movieRecordingSettings];
  [v4 setMovieLevelMetadataForOriginalImage:self->_movieURLForOriginalImage];
  [v4 setSpatialOverCaptureMovieURLForOriginalImage:self->_movieLevelMetadataForOriginalImage];
  [v4 setSpatialOverCaptureMovieLevelMetadataForOriginalImage:self->_spatialOverCaptureMovieURLForOriginalImage];
  objc_msgSend(v4, "setNonDestructiveCropSize:", *(double *)&self->_spatialOverCaptureMovieLevelMetadataForOriginalImage, self->_nonDestructiveCropSize.width);
  [v4 setSemanticStyle:*(void *)&self->_nonDestructiveCropSize.height];
  return v4;
}

- (int)movieMode
{
  return *((_DWORD *)&self->super._smartStyleReversibilitySupported + 1);
}

- (void)setMovieMode:(int)a3
{
  *((_DWORD *)&self->super._smartStyleReversibilitySupported + 1) = a3;
}

- (FigCaptureMovieFileRecordingSettings)movieRecordingSettings
{
  return *(FigCaptureMovieFileRecordingSettings **)&self->_movieMode;
}

- (void)setMovieRecordingSettings:(id)a3
{
}

- (NSURL)movieURLForOriginalImage
{
  return (NSURL *)self->_movieRecordingSettings;
}

- (void)setMovieURLForOriginalImage:(id)a3
{
}

- (NSArray)movieLevelMetadataForOriginalImage
{
  return (NSArray *)self->_movieURLForOriginalImage;
}

- (void)setMovieLevelMetadataForOriginalImage:(id)a3
{
}

- (NSURL)spatialOverCaptureMovieURLForOriginalImage
{
  return (NSURL *)self->_movieLevelMetadataForOriginalImage;
}

- (void)setSpatialOverCaptureMovieURLForOriginalImage:(id)a3
{
}

- (NSArray)spatialOverCaptureMovieLevelMetadataForOriginalImage
{
  return (NSArray *)self->_spatialOverCaptureMovieURLForOriginalImage;
}

- (void)setSpatialOverCaptureMovieLevelMetadataForOriginalImage:(id)a3
{
}

- (CGSize)nonDestructiveCropSize
{
  spatialOverCaptureMovieLevelMetadataForOriginalImage = self->_spatialOverCaptureMovieLevelMetadataForOriginalImage;
  double width = self->_nonDestructiveCropSize.width;
  result.CGFloat height = width;
  result.double width = *(double *)&spatialOverCaptureMovieLevelMetadataForOriginalImage;
  return result;
}

- (void)setNonDestructiveCropSize:(CGSize)a3
{
  *(CGSize *)&self->_spatialOverCaptureMovieLevelMetadataForOriginalImage = a3;
}

@end