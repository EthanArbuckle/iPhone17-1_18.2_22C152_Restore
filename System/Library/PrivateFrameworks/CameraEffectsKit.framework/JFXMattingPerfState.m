@interface JFXMattingPerfState
+ (CGSize)mattingDepthInputSize;
- (JFXCapturePreviewFrameStats)captureFrameStats;
- (JFXMattingPerfState)initWithStats:(id)a3 signpostToken:(id)a4;
- (PVTaskToken)signpostToken;
@end

@implementation JFXMattingPerfState

- (JFXMattingPerfState)initWithStats:(id)a3 signpostToken:(id)a4
{
  id v7 = a3;
  v8 = (PVTaskToken *)a4;
  v12.receiver = self;
  v12.super_class = (Class)JFXMattingPerfState;
  v9 = [(JFXMattingPerfState *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_captureFrameStats, a3);
    v10->_signpostToken = v8;
  }

  return v10;
}

+ (CGSize)mattingDepthInputSize
{
  double v2 = 640.0;
  double v3 = 360.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (JFXCapturePreviewFrameStats)captureFrameStats
{
  return self->_captureFrameStats;
}

- (PVTaskToken)signpostToken
{
  return self->_signpostToken;
}

- (void).cxx_destruct
{
}

@end