@interface AVVideoCallPlayerController
- (AVPictureInPictureControllerContentSource)contentSource;
- (BOOL)isPictureInPicturePossible;
- (BOOL)isPlaying;
- (CGSize)contentDimensions;
- (double)rate;
- (int64_t)status;
- (int64_t)timeControlStatus;
- (void)setContentDimensions:(CGSize)a3;
- (void)setContentSource:(id)a3;
- (void)setPictureInPicturePossible:(BOOL)a3;
@end

@implementation AVVideoCallPlayerController

- (void).cxx_destruct
{
}

- (void)setPictureInPicturePossible:(BOOL)a3
{
  LOBYTE(self->super._seekToTimeInternal.epoch) = a3;
}

- (BOOL)isPictureInPicturePossible
{
  return self->super._seekToTimeInternal.epoch;
}

- (void)setContentDimensions:(CGSize)a3
{
  *(CGSize *)&self->_contentSource = a3;
}

- (CGSize)contentDimensions
{
  contentSource = self->_contentSource;
  double width = self->_contentDimensions.width;
  result.height = width;
  result.double width = *(double *)&contentSource;
  return result;
}

- (void)setContentSource:(id)a3
{
}

- (AVPictureInPictureControllerContentSource)contentSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPicturePossible);

  return (AVPictureInPictureControllerContentSource *)WeakRetained;
}

- (double)rate
{
  return 1.0;
}

- (int64_t)timeControlStatus
{
  return 2;
}

- (int64_t)status
{
  return 2;
}

- (BOOL)isPlaying
{
  return 1;
}

@end