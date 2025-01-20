@interface AVMomentCaptureMovieRequest
+ (id)requestWithDelegate:(id)a3 movieRecordingSettings:(id)a4 momentSettings:(id)a5;
- (AVMomentCaptureMovie)movie;
- (AVMomentCaptureMovie)spatialOverCaptureMovie;
- (AVMomentCaptureMovieRecordingResolvedSettings)resolvedSettings;
- (AVMomentCaptureMovieRecordingSettings)unresolvedSettings;
- (AVMomentCaptureSettings)momentCaptureSettings;
- (AVWeakReferencingDelegateStorage)delegateStorage;
- (id)_initWithDelegate:(id)a3 movieRecordingSettings:(id)a4 momentSettings:(id)a5;
- (unint64_t)expectedMovieCount;
- (unsigned)firedCallbackFlags;
- (void)dealloc;
- (void)setFiredCallbackFlags:(unsigned int)a3;
- (void)setMovie:(id)a3;
- (void)setResolvedSettings:(id)a3;
- (void)setSpatialOverCaptureMovie:(id)a3;
@end

@implementation AVMomentCaptureMovieRequest

+ (id)requestWithDelegate:(id)a3 movieRecordingSettings:(id)a4 momentSettings:(id)a5
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithDelegate:a3 movieRecordingSettings:a4 momentSettings:a5];

  return v5;
}

- (id)_initWithDelegate:(id)a3 movieRecordingSettings:(id)a4 momentSettings:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)AVMomentCaptureMovieRequest;
  v8 = [(AVMomentCaptureMovieRequest *)&v11 init];
  if (v8)
  {
    v9 = (AVWeakReferencingDelegateStorage *)objc_alloc_init(MEMORY[0x1E4F47DF8]);
    v8->_delegateStorage = v9;
    [(AVWeakReferencingDelegateStorage *)v9 setDelegate:a3 queue:MEMORY[0x1E4F14428]];
    v8->_unresolvedSettings = (AVMomentCaptureMovieRecordingSettings *)a4;
    v8->_momentCaptureSettings = (AVMomentCaptureSettings *)a5;
    if ([(AVMomentCaptureMovieRecordingSettings *)v8->_unresolvedSettings movieFileURL]) {
      v8->_expectedMovieCount = 1;
    }
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMomentCaptureMovieRequest;
  [(AVMomentCaptureMovieRequest *)&v3 dealloc];
}

- (AVMomentCaptureMovieRecordingResolvedSettings)resolvedSettings
{
  v2 = self->_resolvedSettings;

  return v2;
}

- (void)setResolvedSettings:(id)a3
{
  self->_expectedMovieCount = 0;
  if ([a3 movieURL]) {
    ++self->_expectedMovieCount;
  }
  if ([a3 spatialOverCaptureURL]) {
    ++self->_expectedMovieCount;
  }

  self->_resolvedSettings = (AVMomentCaptureMovieRecordingResolvedSettings *)a3;
}

- (AVWeakReferencingDelegateStorage)delegateStorage
{
  return self->_delegateStorage;
}

- (AVMomentCaptureMovieRecordingSettings)unresolvedSettings
{
  return self->_unresolvedSettings;
}

- (AVMomentCaptureSettings)momentCaptureSettings
{
  return self->_momentCaptureSettings;
}

- (unint64_t)expectedMovieCount
{
  return self->_expectedMovieCount;
}

- (unsigned)firedCallbackFlags
{
  return self->_firedCallbackFlags;
}

- (void)setFiredCallbackFlags:(unsigned int)a3
{
  self->_firedCallbackFlags = a3;
}

- (AVMomentCaptureMovie)movie
{
  return self->_movie;
}

- (void)setMovie:(id)a3
{
}

- (AVMomentCaptureMovie)spatialOverCaptureMovie
{
  return self->_spatialOverCaptureMovie;
}

- (void)setSpatialOverCaptureMovie:(id)a3
{
}

@end