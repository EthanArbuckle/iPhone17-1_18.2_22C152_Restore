@interface ICDocCamDebugMovieController
- (AVAssetWriter)assetWriter;
- (AVAssetWriterInput)assetWriterMetadataIn;
- (AVAssetWriterInput)assetWriterVideoIn;
- (AVAssetWriterInputMetadataAdaptor)assetWriterMetadataAdaptor;
- (AVAssetWriterInputPixelBufferAdaptor)pixelBufferAdaptor;
- (AVCaptureConnection)videoConnection;
- (BOOL)canRecordFrames;
- (BOOL)inputsReadyToRecord;
- (BOOL)isRecording;
- (BOOL)readyToRecordMetadata;
- (BOOL)readyToRecordVideo;
- (BOOL)recordingWillBeStarted;
- (BOOL)recordingWillBeStopped;
- (BOOL)setupAssetWriterMetadataInputAndMetadataAdaptor;
- (BOOL)setupAssetWriterVideoInput:(opaqueCMFormatDescription *)a3;
- (CGAffineTransform)transformFromCurrentVideoOrientationToOrientation:(SEL)a3;
- (ICDocCamDebugMovieController)initWithDelegate:(id)a3 videoConnection:(id)a4 referenceOrientation:(int64_t)a5;
- (ICDocCamDebugMovieControllerDelegate)delegate;
- (NSURL)movieURL;
- (OS_dispatch_queue)movieWritingQueue;
- (double)angleOffsetFromPortraitOrientationToOrientation:(int64_t)a3;
- (int64_t)referenceOrientation;
- (int64_t)videoOrientation;
- (uint64_t)writeMetaDataAtFrame:(double)a3 intrinsicMatrix:(float32x2_t)a4;
- (unint64_t)backgroundRecordingID;
- (void)pauseCaptureSessionForMovieRecording;
- (void)recordFrame:(opaqueCMSampleBuffer *)a3 fromConnection:(id)a4;
- (void)recordingDidStart;
- (void)recordingDidStop;
- (void)recordingWillStart;
- (void)recordingWillStop;
- (void)removeFile:(id)a3;
- (void)resumeCaptureSessionForMovieRecording;
- (void)saveMovieToCameraRoll;
- (void)setAssetWriter:(id)a3;
- (void)setAssetWriterMetadataAdaptor:(id)a3;
- (void)setAssetWriterMetadataIn:(id)a3;
- (void)setAssetWriterVideoIn:(id)a3;
- (void)setBackgroundRecordingID:(unint64_t)a3;
- (void)setCanRecordFrames:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setMovieURL:(id)a3;
- (void)setMovieWritingQueue:(id)a3;
- (void)setPixelBufferAdaptor:(id)a3;
- (void)setReadyToRecordMetadata:(BOOL)a3;
- (void)setReadyToRecordVideo:(BOOL)a3;
- (void)setRecording:(BOOL)a3;
- (void)setRecordingWillBeStarted:(BOOL)a3;
- (void)setRecordingWillBeStopped:(BOOL)a3;
- (void)setReferenceOrientation:(int64_t)a3;
- (void)setVideoConnection:(id)a3;
- (void)setVideoOrientation:(int64_t)a3;
- (void)startRecording;
- (void)stopRecording;
- (void)video:(id)a3 didFinishSavingWithError:(id)a4 contextInfo:(void *)a5;
- (void)writeSampleBuffer:(opaqueCMSampleBuffer *)a3 ofType:(id)a4 atFrame:(int64_t)a5;
@end

@implementation ICDocCamDebugMovieController

- (ICDocCamDebugMovieController)initWithDelegate:(id)a3 videoConnection:(id)a4 referenceOrientation:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)ICDocCamDebugMovieController;
  v10 = [(ICDocCamDebugMovieController *)&v22 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v8);
    objc_storeWeak((id *)&v11->_videoConnection, v9);
    v11->_referenceOrientation = a5;
    v12 = NSURL;
    v13 = NSString;
    v14 = NSTemporaryDirectory();
    v15 = [v13 stringWithFormat:@"%@%@", v14, @"Movie.MOV"];
    uint64_t v16 = [v12 fileURLWithPath:v15];
    movieURL = v11->_movieURL;
    v11->_movieURL = (NSURL *)v16;

    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("Movie Writing Queue", v18);
    movieWritingQueue = v11->_movieWritingQueue;
    v11->_movieWritingQueue = (OS_dispatch_queue *)v19;

    v11->_backgroundRecordingID = *MEMORY[0x263F1D108];
  }

  return v11;
}

- (void)recordFrame:(opaqueCMSampleBuffer *)a3 fromConnection:(id)a4
{
  id v6 = a4;
  CFRetain(a3);
  v7 = [(ICDocCamDebugMovieController *)self movieWritingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__ICDocCamDebugMovieController_recordFrame_fromConnection___block_invoke;
  block[3] = &unk_2642A98D8;
  block[4] = self;
  id v10 = v6;
  v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __59__ICDocCamDebugMovieController_recordFrame_fromConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) assetWriter];
  if (v2)
  {
    v3 = (void *)v2;
    int v4 = [*(id *)(a1 + 32) canRecordFrames];

    if (v4)
    {
      int v5 = [*(id *)(a1 + 32) inputsReadyToRecord];
      id v6 = *(void **)(a1 + 40);
      v7 = [*(id *)(a1 + 32) videoConnection];

      if (v6 == v7)
      {
        if (([*(id *)(a1 + 32) readyToRecordVideo] & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "setReadyToRecordVideo:", objc_msgSend(*(id *)(a1 + 32), "setupAssetWriterVideoInput:", CMSampleBufferGetFormatDescription(*(CMSampleBufferRef *)(a1 + 48))));
          recordFrame_fromConnection__frameNumber = 0;
        }
        if ([*(id *)(a1 + 32) inputsReadyToRecord]) {
          [*(id *)(a1 + 32) writeSampleBuffer:*(void *)(a1 + 48) ofType:*MEMORY[0x263EF9D48] atFrame:recordFrame_fromConnection__frameNumber];
        }
      }
      if (([*(id *)(a1 + 32) readyToRecordMetadata] & 1) == 0) {
        objc_msgSend(*(id *)(a1 + 32), "setReadyToRecordMetadata:", objc_msgSend(*(id *)(a1 + 32), "setupAssetWriterMetadataInputAndMetadataAdaptor"));
      }
      if ([*(id *)(a1 + 32) inputsReadyToRecord])
      {
        id v8 = CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 48), (CFStringRef)*MEMORY[0x263F01028], 0);
        long long v10 = 0u;
        long long v11 = 0u;
        long long v9 = 0u;
        [v8 getBytes:&v9 length:48];
        objc_msgSend(*(id *)(a1 + 32), "writeMetaDataAtFrame:intrinsicMatrix:", recordFrame_fromConnection__frameNumber++, *(double *)&v9, *(double *)&v10, *(double *)&v11);
      }
      if (((v5 | [*(id *)(a1 + 32) inputsReadyToRecord] ^ 1) & 1) == 0)
      {
        [*(id *)(a1 + 32) setRecordingWillBeStarted:0];
        [*(id *)(a1 + 32) setRecording:1];
        [*(id *)(a1 + 32) recordingDidStart];
      }
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

- (void)recordingWillStart
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ICDocCamDebugMovieController_recordingWillStart__block_invoke;
  block[3] = &unk_2642A9250;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __50__ICDocCamDebugMovieController_recordingWillStart__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  [v2 enableRecordButton:0];

  v3 = [*(id *)(a1 + 32) delegate];
  int v4 = +[DCLocalization localizedStringForKey:@"Stop" value:@"Stop" table:@"Localizable"];
  [v3 changeRecordButtonTitle:v4];

  int v5 = [MEMORY[0x263F1C408] sharedApplication];
  [v5 setIdleTimerDisabled:1];

  id v6 = [MEMORY[0x263F1C5C0] currentDevice];
  LODWORD(v4) = [v6 isMultitaskingSupported];

  if (v4)
  {
    id v7 = [MEMORY[0x263F1C408] sharedApplication];
    objc_msgSend(*(id *)(a1 + 32), "setBackgroundRecordingID:", objc_msgSend(v7, "beginBackgroundTaskWithExpirationHandler:", &__block_literal_global_17));
  }
}

- (void)recordingDidStart
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ICDocCamDebugMovieController_recordingDidStart__block_invoke;
  block[3] = &unk_2642A9250;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __49__ICDocCamDebugMovieController_recordingDidStart__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  [v2 enableRecordButton:1];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 enableUIElementsForMovieRecording:0];
}

- (void)recordingWillStop
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ICDocCamDebugMovieController_recordingWillStop__block_invoke;
  block[3] = &unk_2642A9250;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __49__ICDocCamDebugMovieController_recordingWillStop__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  [v2 enableRecordButton:0];

  id v3 = [*(id *)(a1 + 32) delegate];
  int v4 = +[DCLocalization localizedStringForKey:@"Record" value:@"Record" table:@"Localizable"];
  [v3 changeRecordButtonTitle:v4];

  int v5 = *(void **)(a1 + 32);

  return [v5 pauseCaptureSessionForMovieRecording];
}

- (void)recordingDidStop
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__ICDocCamDebugMovieController_recordingDidStop__block_invoke;
  block[3] = &unk_2642A9250;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __48__ICDocCamDebugMovieController_recordingDidStop__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  [v2 enableRecordButton:1];

  id v3 = [MEMORY[0x263F1C408] sharedApplication];
  [v3 setIdleTimerDisabled:0];

  [*(id *)(a1 + 32) resumeCaptureSessionForMovieRecording];
  int v4 = [MEMORY[0x263F1C5C0] currentDevice];
  int v5 = [v4 isMultitaskingSupported];

  if (v5)
  {
    id v6 = [MEMORY[0x263F1C408] sharedApplication];
    objc_msgSend(v6, "endBackgroundTask:", objc_msgSend(*(id *)(a1 + 32), "backgroundRecordingID"));

    [*(id *)(a1 + 32) setBackgroundRecordingID:*MEMORY[0x263F1D108]];
  }
  id v7 = [*(id *)(a1 + 32) delegate];
  [v7 enableUIElementsForMovieRecording:1];
}

- (void)writeSampleBuffer:(opaqueCMSampleBuffer *)a3 ofType:(id)a4 atFrame:(int64_t)a5
{
  id v8 = a4;
  long long v9 = [(ICDocCamDebugMovieController *)self assetWriter];
  uint64_t v10 = [v9 status];

  if (!v10)
  {
    long long v11 = [(ICDocCamDebugMovieController *)self assetWriter];
    int v12 = [v11 startWriting];

    if (v12)
    {
      v13 = [(ICDocCamDebugMovieController *)self assetWriter];
      long long v27 = *MEMORY[0x263F010E0];
      uint64_t v28 = *(void *)(MEMORY[0x263F010E0] + 16);
      [v13 startSessionAtSourceTime:&v27];
    }
    else
    {
      v13 = [(ICDocCamDebugMovieController *)self delegate];
      v14 = [(ICDocCamDebugMovieController *)self assetWriter];
      v15 = [v14 error];
      [v13 showErrorForMovieRecording:v15];
    }
  }
  uint64_t v16 = [(ICDocCamDebugMovieController *)self assetWriter];
  uint64_t v17 = [v16 status];

  if (v17 == 1 && (id)*MEMORY[0x263EF9D48] == v8)
  {
    v18 = [(ICDocCamDebugMovieController *)self assetWriterVideoIn];
    int v19 = [v18 isReadyForMoreMediaData];

    if (v19)
    {
      CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
      v21 = [(ICDocCamDebugMovieController *)self pixelBufferAdaptor];
      CMTimeMake(&v26, a5, 30);
      char v22 = [v21 appendPixelBuffer:ImageBuffer withPresentationTime:&v26];

      if ((v22 & 1) == 0)
      {
        v23 = [(ICDocCamDebugMovieController *)self delegate];
        v24 = [(ICDocCamDebugMovieController *)self assetWriter];
        v25 = [v24 error];
        [v23 showErrorForMovieRecording:v25];
      }
    }
  }
}

- (uint64_t)writeMetaDataAtFrame:(double)a3 intrinsicMatrix:(float32x2_t)a4
{
  float v28 = *((float *)&a3 + 1);
  v34[4] = *MEMORY[0x263EF8340];
  id v8 = [MEMORY[0x263EFA790] metadataItem];
  [v8 setIdentifier:@"mdta/com.docCamMovie.version.field"];
  [v8 setDataType:*MEMORY[0x263F00F58]];
  [v8 setValue:&unk_26C7ED898];
  long long v9 = [MEMORY[0x263EFA790] metadataItem];
  [v9 setIdentifier:@"mdta/com.docCamMovie.comment.field"];
  [v9 setDataType:*MEMORY[0x263F00F90]];
  uint64_t v10 = [NSString stringWithFormat:@"%.2f", (double)a6];
  [v9 setValue:v10];

  long long v11 = [MEMORY[0x263EFA790] metadataItem];
  [v11 setIdentifier:@"mdta/com.docCamMovie.pixelFocalLength.field"];
  uint64_t v12 = *MEMORY[0x263F00F40];
  [v11 setDataType:*MEMORY[0x263F00F40]];
  v13 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", a2, v28);
  [v11 setValue:v13];

  v14 = [MEMORY[0x263EFA790] metadataItem];
  [v14 setIdentifier:@"mdta/com.docCamMovie.principalPoint.field"];
  [v14 setDataType:v12];
  v15 = [MEMORY[0x263F08D40] valueWithCGPoint:vcvtq_f64_f32(a4)];
  [v14 setValue:v15];

  memset(&v33, 0, sizeof(v33));
  CMTimeMake(&v33, a6, 30);
  id v16 = objc_alloc(MEMORY[0x263EFA8C0]);
  v34[0] = v8;
  v34[1] = v9;
  v34[2] = v11;
  v34[3] = v14;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
  CMTime start = v33;
  CMTime duration = *(CMTime *)*(void *)&MEMORY[0x263F01090];
  CMTimeRangeMake(&v32, &start, &duration);
  v18 = (void *)[v16 initWithItems:v17 timeRange:&v32];

  int v19 = [a1 assetWriterMetadataIn];
  int v20 = [v19 isReadyForMoreMediaData];

  if (v20)
  {
    v21 = [a1 assetWriterMetadataAdaptor];
    char v22 = [v21 appendTimedMetadataGroup:v18];

    if ((v22 & 1) == 0)
    {
      v23 = [a1 delegate];
      v24 = [a1 assetWriter];
      v25 = [v24 error];
      [v23 showErrorForMovieRecording:v25];
    }
  }

  return 1;
}

- (BOOL)setupAssetWriterVideoInput:(opaqueCMFormatDescription *)a3
{
  v34[4] = *MEMORY[0x263EF8340];
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a3);
  int v5 = NSDictionary;
  id v6 = [NSNumber numberWithInt:96000000];
  uint64_t v7 = *MEMORY[0x263EFA318];
  id v8 = [NSNumber numberWithInt:1];
  long long v9 = objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, v7, v8, *MEMORY[0x263EFA3F0], *MEMORY[0x263EFA410], *MEMORY[0x263EFA420], MEMORY[0x263EFFA80], *MEMORY[0x263EFA310], *MEMORY[0x263EFA3D8], *MEMORY[0x263EFA3E0], &unk_26C7ED8B0, *MEMORY[0x263EFA3B8], &unk_26C7ED8B0, *MEMORY[0x263EFA328], 0);

  uint64_t v10 = *MEMORY[0x263EFA338];
  v34[0] = *MEMORY[0x263EFA368];
  uint64_t v11 = *MEMORY[0x263EFA458];
  v33[0] = v10;
  v33[1] = v11;
  uint64_t v12 = [NSNumber numberWithInteger:Dimensions.width];
  v34[1] = v12;
  v33[2] = *MEMORY[0x263EFA3E8];
  v13 = [NSNumber numberWithInteger:*(uint64_t *)&Dimensions >> 32];
  v33[3] = *MEMORY[0x263EFA3A0];
  v34[2] = v13;
  v34[3] = v9;
  v14 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];

  v15 = [(ICDocCamDebugMovieController *)self assetWriter];
  uint64_t v16 = *MEMORY[0x263EF9D48];
  LODWORD(v7) = [v15 canApplyOutputSettings:v14 forMediaType:*MEMORY[0x263EF9D48]];

  if (!v7)
  {
    NSLog(&cfstr_CouldnTApplyVi.isa);
LABEL_6:
    BOOL v30 = 0;
    goto LABEL_7;
  }
  uint64_t v17 = [MEMORY[0x263EFA520] assetWriterInputWithMediaType:v16 outputSettings:0];
  [(ICDocCamDebugMovieController *)self setAssetWriterVideoIn:v17];

  v18 = [(ICDocCamDebugMovieController *)self assetWriterVideoIn];
  [v18 setExpectsMediaDataInRealTime:1];

  [(ICDocCamDebugMovieController *)self transformFromCurrentVideoOrientationToOrientation:[(ICDocCamDebugMovieController *)self referenceOrientation]];
  int v19 = [(ICDocCamDebugMovieController *)self assetWriterVideoIn];
  *(_OWORD *)CMTimeRange v32 = *(_OWORD *)&v32[7];
  *(_OWORD *)&v32[2] = *(_OWORD *)&v32[9];
  *(_OWORD *)&v32[4] = *(_OWORD *)&v32[11];
  [v19 setTransform:v32];

  id v20 = objc_alloc(MEMORY[0x263EFA530]);
  v21 = [(ICDocCamDebugMovieController *)self assetWriterVideoIn];
  char v22 = NSDictionary;
  v23 = [NSNumber numberWithInt:875704422];
  v24 = objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v23, *MEMORY[0x263F04180], 0);
  v25 = (void *)[v20 initWithAssetWriterInput:v21 sourcePixelBufferAttributes:v24];
  [(ICDocCamDebugMovieController *)self setPixelBufferAdaptor:v25];

  CMTime v26 = [(ICDocCamDebugMovieController *)self assetWriter];
  long long v27 = [(ICDocCamDebugMovieController *)self assetWriterVideoIn];
  LODWORD(v24) = [v26 canAddInput:v27];

  if (!v24)
  {
    NSLog(&cfstr_CouldnTAddAsse.isa);
    goto LABEL_6;
  }
  float v28 = [(ICDocCamDebugMovieController *)self assetWriter];
  v29 = [(ICDocCamDebugMovieController *)self assetWriterVideoIn];
  [v28 addInput:v29];

  BOOL v30 = 1;
LABEL_7:

  return v30;
}

- (BOOL)setupAssetWriterMetadataInputAndMetadataAdaptor
{
  v34[4] = *MEMORY[0x263EF8340];
  CMMetadataFormatDescriptionRef formatDescriptionOut = 0;
  uint64_t v4 = *MEMORY[0x263F00F98];
  v32[0] = *MEMORY[0x263F00FA8];
  uint64_t v3 = v32[0];
  v32[1] = v4;
  uint64_t v5 = *MEMORY[0x263F00F58];
  v33[0] = @"mdta/com.docCamMovie.version.field";
  v33[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
  v34[0] = v6;
  v30[0] = v3;
  v30[1] = v4;
  uint64_t v7 = *MEMORY[0x263F00F90];
  v31[0] = @"mdta/com.docCamMovie.comment.field";
  v31[1] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
  v34[1] = v8;
  v28[0] = v3;
  v28[1] = v4;
  uint64_t v9 = *MEMORY[0x263F00F40];
  v29[0] = @"mdta/com.docCamMovie.pixelFocalLength.field";
  v29[1] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  v34[2] = v10;
  v26[0] = v3;
  v26[1] = v4;
  v27[0] = @"mdta/com.docCamMovie.principalPoint.field";
  v27[1] = v9;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  v34[3] = v11;
  CFArrayRef v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];

  if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x263EFFB08], 0x6D656278u, v12, &formatDescriptionOut))
  {
    NSLog(&cfstr_FailedToCreate.isa, v12);
LABEL_6:
    BOOL v23 = 0;
    goto LABEL_7;
  }
  v13 = [MEMORY[0x263EFA520] assetWriterInputWithMediaType:*MEMORY[0x263EF9D08] outputSettings:0 sourceFormatHint:formatDescriptionOut];
  [(ICDocCamDebugMovieController *)self setAssetWriterMetadataIn:v13];

  v14 = (void *)MEMORY[0x263EFA528];
  v15 = [(ICDocCamDebugMovieController *)self assetWriterMetadataIn];
  uint64_t v16 = [v14 assetWriterInputMetadataAdaptorWithAssetWriterInput:v15];
  [(ICDocCamDebugMovieController *)self setAssetWriterMetadataAdaptor:v16];

  uint64_t v17 = [(ICDocCamDebugMovieController *)self assetWriterMetadataIn];
  [v17 setExpectsMediaDataInRealTime:1];

  v18 = [(ICDocCamDebugMovieController *)self assetWriter];
  int v19 = [(ICDocCamDebugMovieController *)self assetWriterMetadataIn];
  int v20 = [v18 canAddInput:v19];

  if (!v20)
  {
    NSLog(&cfstr_CouldnTAddAsse_0.isa);
    goto LABEL_6;
  }
  v21 = [(ICDocCamDebugMovieController *)self assetWriter];
  char v22 = [(ICDocCamDebugMovieController *)self assetWriterMetadataIn];
  [v21 addInput:v22];

  BOOL v23 = 1;
LABEL_7:

  return v23;
}

- (void)startRecording
{
  [(ICDocCamDebugMovieController *)self resumeCaptureSessionForMovieRecording];
  uint64_t v3 = [(ICDocCamDebugMovieController *)self movieWritingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__ICDocCamDebugMovieController_startRecording__block_invoke;
  block[3] = &unk_2642A9250;
  block[4] = self;
  dispatch_async(v3, block);
}

void __46__ICDocCamDebugMovieController_startRecording__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) recordingWillBeStarted] & 1) == 0
    && ([*(id *)(a1 + 32) isRecording] & 1) == 0)
  {
    [*(id *)(a1 + 32) setRecordingWillBeStarted:1];
    [*(id *)(a1 + 32) recordingWillStart];
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = [v2 movieURL];
    [v2 removeFile:v3];

    id v4 = objc_alloc(MEMORY[0x263EFA518]);
    uint64_t v5 = [*(id *)(a1 + 32) movieURL];
    uint64_t v6 = *MEMORY[0x263EF9898];
    id v10 = 0;
    uint64_t v7 = (void *)[v4 initWithURL:v5 fileType:v6 error:&v10];
    id v8 = v10;
    [*(id *)(a1 + 32) setAssetWriter:v7];

    if (v8)
    {
      uint64_t v9 = [*(id *)(a1 + 32) delegate];
      [v9 showErrorForMovieRecording:v8];
    }
    [*(id *)(a1 + 32) setCanRecordFrames:1];
  }
}

- (void)stopRecording
{
  uint64_t v3 = [(ICDocCamDebugMovieController *)self movieWritingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__ICDocCamDebugMovieController_stopRecording__block_invoke;
  block[3] = &unk_2642A9250;
  block[4] = self;
  dispatch_async(v3, block);
}

void __45__ICDocCamDebugMovieController_stopRecording__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCanRecordFrames:0];
  if (([*(id *)(a1 + 32) recordingWillBeStopped] & 1) == 0)
  {
    if ([*(id *)(a1 + 32) isRecording])
    {
      [*(id *)(a1 + 32) setRecordingWillBeStopped:1];
      [*(id *)(a1 + 32) recordingWillStop];
      uint64_t v2 = [*(id *)(a1 + 32) assetWriter];
      v3[0] = MEMORY[0x263EF8330];
      v3[1] = 3221225472;
      v3[2] = __45__ICDocCamDebugMovieController_stopRecording__block_invoke_2;
      v3[3] = &unk_2642A9250;
      v3[4] = *(void *)(a1 + 32);
      [v2 finishWritingWithCompletionHandler:v3];
    }
  }
}

void __45__ICDocCamDebugMovieController_stopRecording__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) assetWriter];
  uint64_t v3 = [v2 status];

  if (v3 == 3)
  {
    id v7 = [*(id *)(a1 + 32) delegate];
    uint64_t v5 = [*(id *)(a1 + 32) assetWriter];
    uint64_t v6 = [v5 error];
    [v7 showErrorForMovieRecording:v6];
  }
  else if (v3 == 2)
  {
    [*(id *)(a1 + 32) setReadyToRecordVideo:0];
    [*(id *)(a1 + 32) setReadyToRecordMetadata:0];
    [*(id *)(a1 + 32) setAssetWriter:0];
    id v4 = *(void **)(a1 + 32);
    [v4 saveMovieToCameraRoll];
  }
}

- (BOOL)inputsReadyToRecord
{
  BOOL v3 = [(ICDocCamDebugMovieController *)self readyToRecordVideo];
  if (v3)
  {
    LOBYTE(v3) = [(ICDocCamDebugMovieController *)self readyToRecordMetadata];
  }
  return v3;
}

- (void)pauseCaptureSessionForMovieRecording
{
  id v2 = [(ICDocCamDebugMovieController *)self delegate];
  [v2 pauseCaptureSessionForMovieRecording];
}

- (void)resumeCaptureSessionForMovieRecording
{
  id v2 = [(ICDocCamDebugMovieController *)self delegate];
  [v2 resumeCaptureSessionForMovieRecording];
}

- (void)saveMovieToCameraRoll
{
  uint64_t v3 = [(ICDocCamDebugMovieController *)self movieURL];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = [(ICDocCamDebugMovieController *)self movieURL];
    uint64_t v6 = [v5 path];
    BOOL IsCompatibleWithSavedPhotosAlbum = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(v6);

    if (IsCompatibleWithSavedPhotosAlbum)
    {
      id v9 = [(ICDocCamDebugMovieController *)self movieURL];
      id v8 = [v9 path];
      UISaveVideoAtPathToSavedPhotosAlbum(v8, self, sel_video_didFinishSavingWithError_contextInfo_, 0);
    }
  }
}

- (void)video:(id)a3 didFinishSavingWithError:(id)a4 contextInfo:(void *)a5
{
  id v6 = a4;
  if (v6)
  {
    id v7 = [(ICDocCamDebugMovieController *)self delegate];
    [v7 showErrorForMovieRecording:v6];
  }
  else
  {
    id v7 = [(ICDocCamDebugMovieController *)self movieURL];
    [(ICDocCamDebugMovieController *)self removeFile:v7];
  }

  id v8 = [(ICDocCamDebugMovieController *)self movieWritingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__ICDocCamDebugMovieController_video_didFinishSavingWithError_contextInfo___block_invoke;
  block[3] = &unk_2642A9250;
  block[4] = self;
  dispatch_async(v8, block);
}

uint64_t __75__ICDocCamDebugMovieController_video_didFinishSavingWithError_contextInfo___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setRecordingWillBeStopped:0];
  [*(id *)(a1 + 32) setRecording:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 recordingDidStop];
}

- (void)removeFile:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08850];
  id v5 = a3;
  id v6 = [v4 defaultManager];
  id v7 = [v5 path];

  if ([v6 fileExistsAtPath:v7])
  {
    id v11 = 0;
    char v8 = [v6 removeItemAtPath:v7 error:&v11];
    id v9 = v11;
    if ((v8 & 1) == 0)
    {
      id v10 = [(ICDocCamDebugMovieController *)self delegate];
      [v10 showErrorForMovieRecording:v9];
    }
  }
}

- (double)angleOffsetFromPortraitOrientationToOrientation:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)(a3 - 2) <= 2) {
    return dbl_21791ACE0[a3 - 2];
  }
  return result;
}

- (CGAffineTransform)transformFromCurrentVideoOrientationToOrientation:(SEL)a3
{
  uint64_t v7 = MEMORY[0x263F000D0];
  long long v8 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v8;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v7 + 32);
  id v9 = [(ICDocCamDebugMovieController *)self delegate];
  id v10 = [v9 videoPreviewLayer];
  id v11 = [v10 connection];
  uint64_t v12 = [v11 videoOrientation];

  [(ICDocCamDebugMovieController *)self angleOffsetFromPortraitOrientationToOrientation:a4];
  double v14 = v13;
  [(ICDocCamDebugMovieController *)self angleOffsetFromPortraitOrientationToOrientation:v12];
  CGAffineTransformMakeRotation(retstr, v14 - v15);
  uint64_t v16 = [(ICDocCamDebugMovieController *)self delegate];
  uint64_t v17 = [v16 statusBarOrientation];

  switch(v17)
  {
    case 1:
      CGFloat v19 = 1.57079633;
      goto LABEL_6;
    case 2:
      CGFloat v19 = 4.71238898;
      goto LABEL_6;
    case 3:
      CGFloat v19 = 0.0;
      goto LABEL_6;
    case 4:
      CGFloat v19 = 3.14159265;
LABEL_6:
      double result = CGAffineTransformMakeRotation(&v21, v19);
      long long v20 = *(_OWORD *)&v21.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v21.a;
      *(_OWORD *)&retstr->c = v20;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&v21.tx;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
}

- (int64_t)referenceOrientation
{
  return self->_referenceOrientation;
}

- (void)setReferenceOrientation:(int64_t)a3
{
  self->_referenceOrientation = a3;
}

- (AVCaptureConnection)videoConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_videoConnection);

  return (AVCaptureConnection *)WeakRetained;
}

- (void)setVideoConnection:(id)a3
{
}

- (ICDocCamDebugMovieControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICDocCamDebugMovieControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)movieURL
{
  return self->_movieURL;
}

- (void)setMovieURL:(id)a3
{
}

- (AVAssetWriter)assetWriter
{
  return self->_assetWriter;
}

- (void)setAssetWriter:(id)a3
{
}

- (AVAssetWriterInput)assetWriterVideoIn
{
  return self->_assetWriterVideoIn;
}

- (void)setAssetWriterVideoIn:(id)a3
{
}

- (AVAssetWriterInput)assetWriterMetadataIn
{
  return self->_assetWriterMetadataIn;
}

- (void)setAssetWriterMetadataIn:(id)a3
{
}

- (AVAssetWriterInputMetadataAdaptor)assetWriterMetadataAdaptor
{
  return self->_assetWriterMetadataAdaptor;
}

- (void)setAssetWriterMetadataAdaptor:(id)a3
{
}

- (AVAssetWriterInputPixelBufferAdaptor)pixelBufferAdaptor
{
  return self->_pixelBufferAdaptor;
}

- (void)setPixelBufferAdaptor:(id)a3
{
}

- (OS_dispatch_queue)movieWritingQueue
{
  return self->_movieWritingQueue;
}

- (void)setMovieWritingQueue:(id)a3
{
}

- (BOOL)readyToRecordVideo
{
  return self->_readyToRecordVideo;
}

- (void)setReadyToRecordVideo:(BOOL)a3
{
  self->_readyToRecordVideo = a3;
}

- (BOOL)readyToRecordMetadata
{
  return self->_readyToRecordMetadata;
}

- (void)setReadyToRecordMetadata:(BOOL)a3
{
  self->_readyToRecordMetadata = a3;
}

- (BOOL)recordingWillBeStarted
{
  return self->_recordingWillBeStarted;
}

- (void)setRecordingWillBeStarted:(BOOL)a3
{
  self->_recordingWillBeStarted = a3;
}

- (BOOL)recordingWillBeStopped
{
  return self->_recordingWillBeStopped;
}

- (void)setRecordingWillBeStopped:(BOOL)a3
{
  self->_recordingWillBeStopped = a3;
}

- (BOOL)canRecordFrames
{
  return self->_canRecordFrames;
}

- (void)setCanRecordFrames:(BOOL)a3
{
  self->_canRecordFrames = a3;
}

- (int64_t)videoOrientation
{
  return self->_videoOrientation;
}

- (void)setVideoOrientation:(int64_t)a3
{
  self->_videoOrientation = a3;
}

- (unint64_t)backgroundRecordingID
{
  return self->_backgroundRecordingID;
}

- (void)setBackgroundRecordingID:(unint64_t)a3
{
  self->_backgroundRecordingID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movieWritingQueue, 0);
  objc_storeStrong((id *)&self->_pixelBufferAdaptor, 0);
  objc_storeStrong((id *)&self->_assetWriterMetadataAdaptor, 0);
  objc_storeStrong((id *)&self->_assetWriterMetadataIn, 0);
  objc_storeStrong((id *)&self->_assetWriterVideoIn, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->_movieURL, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_videoConnection);
}

@end