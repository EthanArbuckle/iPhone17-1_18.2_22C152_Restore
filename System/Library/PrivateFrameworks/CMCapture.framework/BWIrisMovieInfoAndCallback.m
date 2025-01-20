@interface BWIrisMovieInfoAndCallback
+ (id)movieInfoAndCallbackWithMovieInfo:(id)a3 callback:(id)a4;
- (BOOL)processed;
- (BWIrisMovieInfo)info;
- (double)overCaptureQualityScore;
- (id)callback;
- (unsigned)overCaptureQualityScoringVersion;
- (void)_initWithMovieInfo:(void *)a3 callback:;
- (void)dealloc;
- (void)setOverCaptureQualityScore:(double)a3;
- (void)setOverCaptureQualityScoringVersion:(unsigned int)a3;
- (void)setProcessed:(BOOL)a3;
@end

@implementation BWIrisMovieInfoAndCallback

+ (id)movieInfoAndCallbackWithMovieInfo:(id)a3 callback:(id)a4
{
  v4 = -[BWIrisMovieInfoAndCallback _initWithMovieInfo:callback:]([BWIrisMovieInfoAndCallback alloc], a3, a4);
  return v4;
}

- (void)_initWithMovieInfo:(void *)a3 callback:
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)BWIrisMovieInfoAndCallback;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    v5[1] = a2;
    v5[2] = [a3 copy];
    v5[4] = 0x7FF8000000000000;
    *((_DWORD *)v5 + 10) = 1;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWIrisMovieInfoAndCallback;
  [(BWIrisMovieInfoAndCallback *)&v3 dealloc];
}

- (BWIrisMovieInfo)info
{
  return self->_info;
}

- (id)callback
{
  return self->_callback;
}

- (BOOL)processed
{
  return self->_processed;
}

- (void)setProcessed:(BOOL)a3
{
  self->_processed = a3;
}

- (double)overCaptureQualityScore
{
  return self->_overCaptureQualityScore;
}

- (void)setOverCaptureQualityScore:(double)a3
{
  self->_overCaptureQualityScore = a3;
}

- (unsigned)overCaptureQualityScoringVersion
{
  return self->_overCaptureQualityScoringVersion;
}

- (void)setOverCaptureQualityScoringVersion:(unsigned int)a3
{
  self->_overCaptureQualityScoringVersion = a3;
}

@end