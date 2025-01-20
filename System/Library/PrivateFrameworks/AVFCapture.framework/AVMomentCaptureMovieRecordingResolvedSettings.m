@interface AVMomentCaptureMovieRecordingResolvedSettings
+ (AVMomentCaptureMovieRecordingResolvedSettings)movieRecordingResolvedSettingsWithUniqueID:(int64_t)a3 torchEnabled:(BOOL)a4 movieURL:(id)a5 spatialOverCaptureURL:(id)a6 movieDimensions:(id)a7;
- ($2825F4736939C4A6D3AD43837233062D)movieDimensions;
- (BOOL)isTorchEnabled;
- (NSURL)movieURL;
- (NSURL)spatialOverCaptureURL;
- (id)_initWithUniqueID:(int64_t)a3 torchEnabled:(BOOL)a4 movieURL:(id)a5 spatialOverCaptureURL:(id)a6 movieDimensions:(id)a7;
- (id)debugDescription;
- (id)description;
- (int64_t)uniqueID;
- (void)dealloc;
@end

@implementation AVMomentCaptureMovieRecordingResolvedSettings

+ (AVMomentCaptureMovieRecordingResolvedSettings)movieRecordingResolvedSettingsWithUniqueID:(int64_t)a3 torchEnabled:(BOOL)a4 movieURL:(id)a5 spatialOverCaptureURL:(id)a6 movieDimensions:(id)a7
{
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithUniqueID:a3 torchEnabled:a4 movieURL:a5 spatialOverCaptureURL:a6 movieDimensions:a7];

  return (AVMomentCaptureMovieRecordingResolvedSettings *)v7;
}

- (id)_initWithUniqueID:(int64_t)a3 torchEnabled:(BOOL)a4 movieURL:(id)a5 spatialOverCaptureURL:(id)a6 movieDimensions:(id)a7
{
  v15.receiver = self;
  v15.super_class = (Class)AVMomentCaptureMovieRecordingResolvedSettings;
  v12 = [(AVMomentCaptureMovieRecordingResolvedSettings *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_uniqueID = a3;
    v12->_torchEnabled = a4;
    v12->_movieURL = (NSURL *)[a5 copy];
    v13->_spatialOverCaptureURL = (NSURL *)[a6 copy];
    v13->_movieDimensions = ($470D365275581EF16070F5A11344F73E)a7;
  }
  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMomentCaptureMovieRecordingResolvedSettings;
  [(AVMomentCaptureMovieRecordingResolvedSettings *)&v3 dealloc];
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"uid:%lld torch:%d dims:%dx%d url:%@ socurl:%@", self->_uniqueID, self->_torchEnabled, self->_movieDimensions.width, self->_movieDimensions.height, -[NSURL lastPathComponent](self->_movieURL, "lastPathComponent"), -[NSURL lastPathComponent](self->_spatialOverCaptureURL, "lastPathComponent")];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVMomentCaptureMovieRecordingResolvedSettings debugDescription](self, "debugDescription")];
}

- (int64_t)uniqueID
{
  return self->_uniqueID;
}

- (BOOL)isTorchEnabled
{
  return self->_torchEnabled;
}

- (NSURL)movieURL
{
  return self->_movieURL;
}

- (NSURL)spatialOverCaptureURL
{
  return self->_spatialOverCaptureURL;
}

- ($2825F4736939C4A6D3AD43837233062D)movieDimensions
{
  objc_copyStruct(&dest, &self->_movieDimensions, 8, 1, 0);
  return dest;
}

@end