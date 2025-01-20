@interface JFXCustomImageSensor
- (ARSensorDelegate)delegate;
- (unint64_t)providedDataTypes;
- (void)createImageDataFromFrameSet:(id)a3 captureDevice:(id)a4 captureSession:(id)a5 trackedFacesMetadata:(id)a6 faceObjectsMetadata:(id)a7;
- (void)outputSensorData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation JFXCustomImageSensor

- (unint64_t)providedDataTypes
{
  return 49;
}

- (void)start
{
  v3 = [(JFXCustomImageSensor *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(JFXCustomImageSensor *)self delegate];
    [v5 sensorDidStart:self];
  }
}

- (void)stop
{
  v3 = [(JFXCustomImageSensor *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(JFXCustomImageSensor *)self delegate];
    [v5 sensorDidPause:self];
  }
}

- (void)createImageDataFromFrameSet:(id)a3 captureDevice:(id)a4 captureSession:(id)a5 trackedFacesMetadata:(id)a6 faceObjectsMetadata:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  if (v14)
  {
    [v14 activeVideoMinFrameDuration];
    uint64_t v7 = (int)((int)v32 / v31);
  }
  v18 = [v13 colorSampleBuffer];
  v19 = (void *)[v18 sampleBufferRef];

  v20 = (void *)[objc_alloc(MEMORY[0x263EF8F78]) initWithSampleBuffer:v19 captureFramePerSecond:v7 captureDevice:v14 captureSession:v15];
  CMAttachmentMode attachmentModeOut = 1;
  CFStringRef v21 = (const __CFString *)*MEMORY[0x263F0F248];
  CFTypeRef v22 = CMGetAttachment(v19, (CFStringRef)*MEMORY[0x263F0F248], &attachmentModeOut);
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v19);
  CMSetAttachment(ImageBuffer, v21, v22, 1u);
  v24 = (void *)[objc_alloc(MEMORY[0x263EF8F40]) initWithMetadataObjects:v16 mirroredVideoInput:0 stripDetectionData:0];
  [v20 setFaceData:v24];

  v25 = [v13 depthData];
  if (v25)
  {
    [v20 setDepthData:v25];
    if (v13) {
      [v13 presentationTimeStamp];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    [v20 setDepthDataTimestamp:CMTimeGetSeconds(&time)];
  }
  [v20 setMirrored:1];
  [v20 setCameraPosition:2];
  if (v20)
  {
    v26 = [(JFXCustomImageSensor *)self delegate];
    char v27 = objc_opt_respondsToSelector();

    if (v27)
    {
      v28 = [(JFXCustomImageSensor *)self delegate];
      [v28 sensor:self didOutputSensorData:v20];
    }
  }
}

- (void)outputSensorData:(id)a3
{
  id v7 = a3;
  char v4 = [(JFXCustomImageSensor *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(JFXCustomImageSensor *)self delegate];
    [v6 sensor:self didOutputSensorData:v7];
  }
}

- (ARSensorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ARSensorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end