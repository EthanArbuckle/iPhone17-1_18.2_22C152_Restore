@interface CAMPanoramaOutput
- (CAMCaptureEngine)_engine;
- (CAMPanoramaOutput)initWithEngine:(id)a3;
- (int64_t)photoEncodingBehavior;
- (void)changeToDirection:(int64_t)a3;
- (void)changeToEncodingBehavior:(int64_t)a3;
@end

@implementation CAMPanoramaOutput

- (CAMPanoramaOutput)initWithEngine:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMPanoramaOutput;
  v5 = [(AVCaptureVideoDataOutput *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->__engine, v4);
    v7 = v6;
  }

  return v6;
}

- (void)changeToDirection:(int64_t)a3
{
  id v4 = [(CAMPanoramaOutput *)self _engine];
  [v4 changeToPanoramaDirection:a3];
}

- (void)changeToEncodingBehavior:(int64_t)a3
{
  self->_photoEncodingBehavior = a3;
  id v4 = [(CAMPanoramaOutput *)self _engine];
  [v4 changePanoramaEncodingBehaviorIfNeeded:a3];
}

- (int64_t)photoEncodingBehavior
{
  return self->_photoEncodingBehavior;
}

- (CAMCaptureEngine)_engine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__engine);
  return (CAMCaptureEngine *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end