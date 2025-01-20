@interface AVSampleBufferDisplayLayer(AVPictureInPictureSuppport)
- (AVSampleBufferDisplayLayerPlayerController)avkit_sampleBufferDisplayLayerPlayerController;
- (void)avkit_removePictureInPicturePlayerController;
@end

@implementation AVSampleBufferDisplayLayer(AVPictureInPictureSuppport)

- (void)avkit_removePictureInPicturePlayerController
{
}

- (AVSampleBufferDisplayLayerPlayerController)avkit_sampleBufferDisplayLayerPlayerController
{
  objc_getAssociatedObject(a1, "AVSBDLPlayerControllerKey");
  v2 = (AVSampleBufferDisplayLayerPlayerController *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(AVSampleBufferDisplayLayerPlayerController);
    objc_setAssociatedObject(a1, "AVSBDLPlayerControllerKey", v2, 0);
  }

  return v2;
}

@end