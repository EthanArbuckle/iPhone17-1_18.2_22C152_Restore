@interface HFCameraTimelapsePosterFrameGenerationRequest
- (HFCameraImageGenerator)imageGenerator;
- (HMCameraClip)clip;
- (double)timelapseOffset;
- (void)setClip:(id)a3;
- (void)setImageGenerator:(id)a3;
- (void)setTimelapseOffset:(double)a3;
@end

@implementation HFCameraTimelapsePosterFrameGenerationRequest

- (HMCameraClip)clip
{
  return self->_clip;
}

- (void)setClip:(id)a3
{
}

- (double)timelapseOffset
{
  return self->_timelapseOffset;
}

- (void)setTimelapseOffset:(double)a3
{
  self->_timelapseOffset = a3;
}

- (HFCameraImageGenerator)imageGenerator
{
  return self->_imageGenerator;
}

- (void)setImageGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageGenerator, 0);
  objc_storeStrong((id *)&self->_clip, 0);
}

@end