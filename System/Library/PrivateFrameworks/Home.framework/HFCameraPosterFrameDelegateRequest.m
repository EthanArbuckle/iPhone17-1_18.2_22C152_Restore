@interface HFCameraPosterFrameDelegateRequest
- (HFCameraPosterFrameDelegate)delegate;
- (HMCameraClip)highQualityClip;
- (HMCameraClip)timelapseClip;
- (NSNumber)offsetNumber;
- (void)setDelegate:(id)a3;
- (void)setHighQualityClip:(id)a3;
- (void)setOffsetNumber:(id)a3;
- (void)setTimelapseClip:(id)a3;
@end

@implementation HFCameraPosterFrameDelegateRequest

- (NSNumber)offsetNumber
{
  return self->_offsetNumber;
}

- (void)setOffsetNumber:(id)a3
{
}

- (HMCameraClip)highQualityClip
{
  return self->_highQualityClip;
}

- (void)setHighQualityClip:(id)a3
{
}

- (HMCameraClip)timelapseClip
{
  return self->_timelapseClip;
}

- (void)setTimelapseClip:(id)a3
{
}

- (HFCameraPosterFrameDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HFCameraPosterFrameDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timelapseClip, 0);
  objc_storeStrong((id *)&self->_highQualityClip, 0);
  objc_storeStrong((id *)&self->_offsetNumber, 0);
}

@end