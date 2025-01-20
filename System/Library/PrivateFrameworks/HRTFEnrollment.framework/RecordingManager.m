@interface RecordingManager
+ (id)movSummaryItem:(float)a3 appName:(id)a4;
+ (void)copyBuffer:(__CVBuffer *)a3 dst:(__CVBuffer *)a4;
- (RecordingManager)initWithFileURL:(id)a3 expectedFrameRate:(double)a4 colorStreamId:(id)a5 depthStreamId:(id)a6 appName:(id)a7;
- (RecordingManagerDelegate)delegate;
- (uint64_t)process:(__n128)a3 depthFrame:(__n128)a4 faceObject:(__n128)a5 timestamp:(double)a6 intrinsics:(uint64_t)a7 calibration:(uint64_t)a8 exposureTime:(__CVBuffer *)a9;
- (void)didFinishRecording;
- (void)isReadyToRecord;
- (void)setDelegate:(id)a3;
- (void)stopRecording;
@end

@implementation RecordingManager

+ (id)movSummaryItem:(float)a3 appName:(id)a4
{
  v17[5] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v16[0] = @"frameRate";
  *(float *)&double v6 = a3;
  v7 = [NSNumber numberWithFloat:v6];
  v17[0] = v7;
  v16[1] = @"depthFrameRate";
  *(float *)&double v8 = a3;
  v9 = [NSNumber numberWithFloat:v8];
  v17[1] = v9;
  v16[2] = @"machTimeSince1970";
  v10 = NSNumber;
  v11 = [MEMORY[0x263EFF910] date];
  [v11 timeIntervalSince1970];
  v13 = [v10 numberWithDouble:v12 - CACurrentMediaTime()];
  v17[2] = v13;
  v17[3] = MEMORY[0x263EFFA88];
  v16[3] = @"hasVisageMetadataFaceObject";
  v16[4] = @"RecorderApp";
  v17[4] = v5;
  v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:5];

  return v14;
}

- (RecordingManager)initWithFileURL:(id)a3 expectedFrameRate:(double)a4 colorStreamId:(id)a5 depthStreamId:(id)a6 appName:(id)a7
{
  v53[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v49.receiver = self;
  v49.super_class = (Class)RecordingManager;
  v16 = [(RecordingManager *)&v49 init];
  if (!v16) {
    goto LABEL_4;
  }
  uint64_t v17 = [v13 copy];
  colorStreamID = v16->_colorStreamID;
  v16->_colorStreamID = (NSString *)v17;

  uint64_t v19 = [v14 copy];
  depthStreamID = v16->_depthStreamID;
  v16->_depthStreamID = (NSString *)v19;

  id v21 = objc_alloc(MEMORY[0x263F26908]);
  float v22 = a4;
  *(float *)&double v23 = v22;
  v24 = +[RecordingManager movSummaryItem:v15 appName:v23];
  uint64_t v25 = MEMORY[0x263EF83A0];
  id v26 = MEMORY[0x263EF83A0];
  uint64_t v27 = [v21 initWithFileURL:v12 expectedFrameRate:v24 fileSummary:v25 callbackQueue:a4];
  writerInterface = v16->_writerInterface;
  v16->_writerInterface = (MOVWriterInterface *)v27;

  v29 = v16->_writerInterface;
  if (v29)
  {
    [(MOVWriterInterface *)v29 setInterface_delegate:v16];
    [(MOVWriterInterface *)v16->_writerInterface registerCVACameraCalibrationData];
    uint64_t v52 = *MEMORY[0x263F53600];
    v30 = [NSNumber numberWithUnsignedLong:*MEMORY[0x263F535B8]];
    v53[0] = v30;
    v31 = [NSDictionary dictionaryWithObjects:v53 forKeys:&v52 count:1];

    id v32 = objc_alloc(MEMORY[0x263F26910]);
    LODWORD(v33) = 1273291200;
    *(float *)&double v34 = a4;
    v35 = (void *)[v32 initWithLossless:0 bitrate:0 forceH264:v31 expectedFPS:v33 extraConfigs:v34];
    [(MOVWriterInterface *)v16->_writerInterface registerStreamID:v16->_colorStreamID withConfigObject:v35];

    uint64_t v36 = *MEMORY[0x263F535E8];
    v50[0] = *MEMORY[0x263F535F0];
    v50[1] = v36;
    v51[0] = &unk_26E28B710;
    v51[1] = &unk_26E28B728;
    v50[2] = *MEMORY[0x263F535D8];
    v37 = [NSNumber numberWithDouble:a4];
    v51[2] = v37;
    v38 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:3];

    id v39 = objc_alloc(MEMORY[0x263F26910]);
    *(float *)&double v40 = a4;
    v41 = (void *)[v39 initWithLossless:1 bitrate:0 forceH264:v38 expectedFPS:0.0 extraConfigs:v40];
    [(MOVWriterInterface *)v16->_writerInterface registerStreamID:v16->_depthStreamID withConfigObject:v41];

    v42 = (void *)MGCopyAnswer();
    [(MOVWriterInterface *)v16->_writerInterface setSerialNumber:v42];

    v43 = [MEMORY[0x263F26908] makeDeviceString];
    [(MOVWriterInterface *)v16->_writerInterface setDeviceString:v43];

    v44 = [MEMORY[0x263F1C5C0] currentDevice];
    v45 = [v44 name];
    [(MOVWriterInterface *)v16->_writerInterface setDeviceName:v45];

    v46 = (void *)MGCopyAnswer();
    [(MOVWriterInterface *)v16->_writerInterface setOsBuildVersion:v46];

    v47 = v16;
  }
  else
  {
LABEL_4:
    v47 = 0;
  }

  return v47;
}

+ (void)copyBuffer:(__CVBuffer *)a3 dst:(__CVBuffer *)a4
{
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(a4, 0);
  size_t PlaneCount = CVPixelBufferGetPlaneCount(a3);
  if (PlaneCount <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = PlaneCount;
  }
  size_t v8 = CVPixelBufferGetPlaneCount(a4);
  if (v8 <= 1) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v8;
  }
  if (v7 != v9) {
    +[RecordingManager copyBuffer:dst:]();
  }
  for (size_t i = 0; i != v7; ++i)
  {
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, i);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, i);
    id v13 = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, i);
    size_t v14 = CVPixelBufferGetBytesPerRowOfPlane(a4, i);
    size_t v15 = v14;
    if (v14 >= BytesPerRowOfPlane) {
      size_t v16 = BytesPerRowOfPlane;
    }
    else {
      size_t v16 = v14;
    }
    int64_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, i);
    if (HeightOfPlane >= 1)
    {
      int64_t v18 = HeightOfPlane;
      do
      {
        memcpy(v13, BaseAddressOfPlane, v16);
        BaseAddressOfPlane += BytesPerRowOfPlane;
        v13 += v15;
        --v18;
      }
      while (v18);
    }
  }
  CVPixelBufferUnlockBaseAddress(a4, 0);
  CVPixelBufferUnlockBaseAddress(a3, 0);
  CFDictionaryRef v19 = CVBufferCopyAttachments(a3, kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachments(a4, v19, kCVAttachmentMode_ShouldPropagate);
}

- (uint64_t)process:(__n128)a3 depthFrame:(__n128)a4 faceObject:(__n128)a5 timestamp:(double)a6 intrinsics:(uint64_t)a7 calibration:(uint64_t)a8 exposureTime:(__CVBuffer *)a9
{
  v62[12] = *MEMORY[0x263EF8340];
  v58[0] = a3;
  v58[1] = a4;
  v58[2] = a5;
  id v15 = a10;
  id v47 = a11;
  v48 = (void *)[objc_alloc(MEMORY[0x263F26900]) initWithAVCameraCalibrationData:v47 timestamp:*(void *)(a1 + 16) streamID:a2];
  objc_msgSend(*(id *)(a1 + 8), "processCVACameraCalibrationData:");
  memset(&v57, 0, sizeof(v57));
  CMTimeMakeWithSeconds(&v57, a2, 10000000);
  v51 = objc_opt_new();
  if (v15)
  {
    v61[0] = @"faceID";
    v46 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "faceID"));
    v62[0] = v46;
    v61[1] = @"hasRollAngle";
    v45 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v15, "hasRollAngle"));
    v62[1] = v45;
    v61[2] = @"rollAngle";
    size_t v16 = NSNumber;
    [v15 rollAngle];
    v44 = objc_msgSend(v16, "numberWithDouble:");
    v62[2] = v44;
    v61[3] = @"hasYawAngle";
    v43 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v15, "hasYawAngle"));
    v62[3] = v43;
    v61[4] = @"yawAngle";
    uint64_t v17 = NSNumber;
    [v15 yawAngle];
    v42 = objc_msgSend(v17, "numberWithDouble:");
    v62[4] = v42;
    v61[5] = @"time";
    int64_t v18 = NSNumber;
    [v15 time];
    CFDictionaryRef v19 = [v18 numberWithDouble:CMTimeGetSeconds(&time)];
    v62[5] = v19;
    v61[6] = @"duration";
    v20 = NSNumber;
    [v15 duration];
    id v21 = [v20 numberWithDouble:CMTimeGetSeconds(&v55)];
    v62[6] = v21;
    v61[7] = @"rectX";
    float v22 = NSNumber;
    [v15 bounds];
    double v23 = objc_msgSend(v22, "numberWithDouble:");
    v62[7] = v23;
    v61[8] = @"rectY";
    v24 = NSNumber;
    [v15 bounds];
    id v26 = [v24 numberWithDouble:v25];
    v62[8] = v26;
    v61[9] = @"rectWidth";
    uint64_t v27 = NSNumber;
    [v15 bounds];
    v29 = [v27 numberWithDouble:v28];
    v62[9] = v29;
    v61[10] = @"rectHeight";
    v30 = NSNumber;
    [v15 bounds];
    id v32 = [v30 numberWithDouble:v31];
    v62[10] = v32;
    v61[11] = @"timestamp";
    double v33 = [NSNumber numberWithDouble:a2];
    v62[11] = v33;
    double v34 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:12];

    [v51 setObject:v34 forKeyedSubscript:@"VisageMetadataFaceObject"];
  }
  [*(id *)(a1 + 8) addFrameMetadata:v51 streamID:*(void *)(a1 + 16)];
  CMTime v54 = v57;
  int v35 = [*(id *)(a1 + 8) processPixelBuffer:a8 withTimeStamp:&v54 intrinsics:v58 exposureTime:*(void *)(a1 + 16) streamID:a6];
  CVPixelBufferRef pixelBufferOut = 0;
  uint64_t v59 = *MEMORY[0x263F04130];
  uint64_t v60 = MEMORY[0x263EFFA78];
  CFDictionaryRef v36 = [NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
  size_t Width = CVPixelBufferGetWidth(a9);
  size_t Height = CVPixelBufferGetHeight(a9);
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], Width, Height, 0x4C303066u, v36, &pixelBufferOut))
  {
    NSLog(&cfstr_HrtfappRecordi.isa);
    unsigned int v39 = 0;
  }
  else
  {
    +[RecordingManager copyBuffer:a9 dst:pixelBufferOut];
    double v40 = *(void **)(a1 + 8);
    CMTime v52 = v57;
    unsigned int v39 = [v40 processPixelBuffer:pixelBufferOut withTimeStamp:&v52 intrinsics:0 exposureTime:*(void *)(a1 + 24) streamID:-1.0];
    CVPixelBufferRelease(pixelBufferOut);
  }

  return v35 & v39;
}

- (void)stopRecording
{
  writerInterface = self->_writerInterface;
  id v6 = 0;
  [(MOVWriterInterface *)writerInterface finishWriting:&v6];
  id v3 = v6;
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 localizedDescription];
    NSLog(&cfstr_HrtfappRecordi_0.isa, v5);
  }
}

- (void)isReadyToRecord
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 isReadyToRecord];
  }
}

- (void)didFinishRecording
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 didFinishRecording];
  }
}

- (RecordingManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RecordingManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_depthStreamID, 0);
  objc_storeStrong((id *)&self->_colorStreamID, 0);
  objc_storeStrong((id *)&self->_writerInterface, 0);
}

+ (void)copyBuffer:dst:.cold.1()
{
  __assert_rtn("+[RecordingManager copyBuffer:dst:]", "RecordingManager.mm", 131, "planes == std::max(static_cast<size_t>(1), CVPixelBufferGetPlaneCount(dst))");
}

@end