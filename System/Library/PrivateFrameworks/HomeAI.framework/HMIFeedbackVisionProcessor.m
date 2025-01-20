@interface HMIFeedbackVisionProcessor
+ (BOOL)reencodeAssetURL:(id)a3 outputURL:(id)a4 bitRate:(int64_t)a5 duration:(id *)a6 analysisFPS:(float)a7 sampleFrameHandler:(id)a8 dropFrameHandler:(id)a9;
- (BOOL)blurFacesFromAssetURL:(id)a3 outputURL:(id)a4 duration:(id *)a5 analysisFPS:(float)a6 windowSize:(unint64_t)a7 faceDetected:(BOOL *)a8;
- (__CVBuffer)_createBlurredPixelBuffer:(__CVBuffer *)a3 events:(id)a4;
- (unsigned)_blurRadiusForEvents:(id)a3 imageSize:(CGSize)a4;
- (void)_addEventsToEventQueue:(id)a3 events:(id)a4;
- (void)_blurSampleBufferWithEncoder:(id)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 events:(id)a5;
@end

@implementation HMIFeedbackVisionProcessor

+ (BOOL)reencodeAssetURL:(id)a3 outputURL:(id)a4 bitRate:(int64_t)a5 duration:(id *)a6 analysisFPS:(float)a7 sampleFrameHandler:(id)a8 dropFrameHandler:(id)a9
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v58 = a4;
  id v60 = a8;
  id v61 = a9;
  v57 = v15;
  v62 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v15 options:1 error:0];
  if (v62)
  {
    v16 = [[HMIVideoFragment alloc] initWithData:v62];
    v17 = [HMIMemoryAVAsset alloc];
    v55 = v16;
    v18 = [(HMIVideoFragment *)v16 data];
    uint64_t v19 = [(HMIMemoryAVAsset *)v17 initWithData:v18];

    v54 = (void *)v19;
    v20 = [[HMIVideoAssetReader alloc] initWithAsset:v19];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v87 = __Block_byref_object_copy__8;
    v88 = __Block_byref_object_dispose__8;
    id v89 = 0;
    v21 = objc_opt_new();
    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x3032000000;
    v81 = __Block_byref_object_copy__8;
    v82 = __Block_byref_object_dispose__8;
    id v83 = 0;
    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke;
    v77[3] = &unk_26477E3C0;
    v77[4] = &v78;
    [v21 setAssetWriterDidOutputInitializationSegment:v77];
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke_2;
    v76[3] = &unk_26477E3E8;
    v76[4] = &v78;
    [v21 setAssetWriterDidOutputSeparableSegment:v76];
    v22 = [[HMIVideoEncoder alloc] initWithDimensions:CMVideoFormatDescriptionGetDimensions([(HMIVideoFragment *)v55 videoFormatDescription]) codecType:1635148593 useHardwareAcceleration:1 error:0];
    [(HMIVideoEncoder *)v22 setAverageBitRate:a5];
    v59 = objc_opt_new();
    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v24 = dispatch_queue_create("Encoder Queue", v23);
    [(HMIVideoEncoder *)v22 setDelegate:v59 queue:v24];

    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke_3;
    v73[3] = &unk_26477E410;
    v75 = buf;
    id v53 = v21;
    id v74 = v53;
    [v59 setEncoderDidEncodeSampleBuffer:v73];
    v25 = [HMIVideoFrameIntervalSampler alloc];
    *(float *)&double v26 = a7;
    v27 = [(HMIVideoFrameIntervalSampler *)v25 initWithFrameRate:v26];
    v28 = objc_opt_new();
    [(HMIVideoFrameSampler *)v27 setDelegate:v28];
    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    v70[2] = __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke_4;
    v70[3] = &unk_26477E438;
    id v72 = v60;
    v29 = v22;
    v71 = v29;
    [v28 setFrameSamplerDidSampleFrame:v70];
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke_5;
    v67[3] = &unk_26477E438;
    id v69 = v61;
    v30 = v29;
    v68 = v30;
    [v28 setFrameSamplerDidDropFrame:v67];
    v31 = objc_alloc_init(HMIVideoDecoder);
    v32 = objc_opt_new();
    [(HMIVideoDecoder *)v31 setDelegate:v32];
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke_6;
    v65[3] = &unk_26477E460;
    v33 = v27;
    v66 = v33;
    [v32 setDecoderDidDecodeSampleBuffer:v65];
    while (1)
    {
      v34 = [(HMIVideoAssetReader *)v20 copyNextSampleBuffer];
      v35 = v34;
      if (!v34) {
        break;
      }
      if (HMICMSampleBufferIsVideo(v34)) {
        [(HMIVideoDecoder *)v31 handleSampleBuffer:v35 outputFrame:1];
      }
      memset(&v64, 0, sizeof(v64));
      CMSampleBufferGetPresentationTimeStamp(&v64, v35);
      CFRelease(v35);
      CMTime time1 = v64;
      CMTime time2 = (CMTime)*a6;
      if (CMTimeCompare(&time1, &time2) >= 1)
      {
        context = (void *)MEMORY[0x22A641C70]();
        id v36 = a1;
        HMFGetOSLogHandle();
        v37 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v38 = (id)objc_claimAutoreleasedReturnValue();
          CMTime time2 = v64;
          Float64 Seconds = CMTimeGetSeconds(&time2);
          CMTime time2 = (CMTime)*a6;
          Float64 v40 = CMTimeGetSeconds(&time2);
          LODWORD(time1.value) = 138543874;
          *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v38;
          LOWORD(time1.flags) = 2048;
          *(Float64 *)((char *)&time1.flags + 2) = Seconds;
          HIWORD(time1.epoch) = 2048;
          Float64 v85 = v40;
          _os_log_impl(&dword_225DC6000, v37, OS_LOG_TYPE_INFO, "%{public}@Finish re-encoding %.3f > %.3f", (uint8_t *)&time1, 0x20u);
        }
        break;
      }
    }
    [(HMIVideoDecoder *)v31 flush];
    [(HMIVideoEncoder *)v30 flush];
    [*(id *)(*(void *)&buf[8] + 40) flush];
    v41 = (void *)v79[5];
    if (v41)
    {
      char v42 = [v41 writeToURL:v58 atomically:1];
    }
    else
    {
      v47 = (void *)MEMORY[0x22A641C70]();
      id v48 = a1;
      HMFGetOSLogHandle();
      v49 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v50 = HMFGetLogIdentifier();
        LODWORD(time1.value) = 138543618;
        *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v50;
        LOWORD(time1.flags) = 2112;
        *(void *)((char *)&time1.flags + 2) = v57;
        _os_log_impl(&dword_225DC6000, v49, OS_LOG_TYPE_ERROR, "%{public}@Unable to get fragment %@ from AssetWriter", (uint8_t *)&time1, 0x16u);
      }
      char v42 = 0;
    }

    _Block_object_dispose(&v78, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v43 = (void *)MEMORY[0x22A641C70]();
    id v44 = a1;
    v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v46 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v46;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      _os_log_impl(&dword_225DC6000, v45, OS_LOG_TYPE_ERROR, "%{public}@Unable to read the asset %@", buf, 0x16u);
    }
    char v42 = 0;
  }

  return v42;
}

uint64_t __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke(uint64_t result, uint64_t a2, void *a3)
{
  if (!*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 40) = [a3 mutableCopy];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

uint64_t __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "appendData:");
}

uint64_t __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke_3(uint64_t a1, uint64_t a2, opaqueCMSampleBuffer *a3)
{
  v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v5)
  {
    v6 = [HMIVideoAssetWriter alloc];
    CMFormatDescriptionRef FormatDescription = CMSampleBufferGetFormatDescription(a3);
    long long v12 = *MEMORY[0x263F01088];
    uint64_t v13 = *(void *)(MEMORY[0x263F01088] + 16);
    uint64_t v8 = [(HMIVideoAssetWriter *)v6 initWithVideoFormat:FormatDescription audioFormat:0 initialFragmentSequenceNumber:1 preferredOutputSegmentInterval:&v12];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDelegate:*(void *)(a1 + 32)];
    v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  return [v5 handleSampleBuffer:a3];
}

uint64_t __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32), a3);
}

uint64_t __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32), a3);
}

uint64_t __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleSampleBuffer:");
}

- (BOOL)blurFacesFromAssetURL:(id)a3 outputURL:(id)a4 duration:(id *)a5 analysisFPS:(float)a6 windowSize:(unint64_t)a7 faceDetected:(BOOL *)a8
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  v16 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v14 options:1 error:0];
  if (v16)
  {
    v39 = a5;
    id v41 = v15;
    v17 = [HMICameraVideoFrameAnalyzerSignificantActivity alloc];
    v18 = +[HMIVideoAnalyzerEvent defaultConfidenceThresholdsFeedback];
    uint64_t v19 = +[HMIVideoAnalyzerEvent defaultConfidenceThresholdsFeedback];
    v20 = objc_alloc_init(HMIVideoAnalyzerConfiguration);
    id v50 = 0;
    v21 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)v17 initWithMediumConfidenceThresholds:v18 highConfidenceThresholds:v19 analyzerConfiguration:v20 error:&v50];
    id v22 = v50;

    if (v22)
    {
      dispatch_queue_t v24 = (void *)MEMORY[0x22A641C70](v23);
      v25 = self;
      double v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v22;
        _os_log_impl(&dword_225DC6000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to init face detector %@", buf, 0x16u);
      }
      BOOL v28 = 0;
      id v15 = v41;
    }
    else
    {
      if (a8) {
        *a8 = 0;
      }
      v33 = objc_msgSend(MEMORY[0x263EFF980], "array", v39);
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __107__HMIFeedbackVisionProcessor_blurFacesFromAssetURL_outputURL_duration_analysisFPS_windowSize_faceDetected___block_invoke;
      v44[3] = &unk_26477E488;
      v45 = v21;
      v46 = self;
      id v34 = v33;
      id v47 = v34;
      unint64_t v48 = a7;
      v49 = a8;
      v35 = (void *)MEMORY[0x22A641EE0](v44);
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __107__HMIFeedbackVisionProcessor_blurFacesFromAssetURL_outputURL_duration_analysisFPS_windowSize_faceDetected___block_invoke_22;
      v42[3] = &unk_26477E4B0;
      v42[4] = self;
      id v43 = v34;
      id v36 = v34;
      v37 = (void *)MEMORY[0x22A641EE0](v42);
      id v15 = v41;
      *(_OWORD *)buf = *(_OWORD *)v40;
      *(void *)&buf[16] = *(void *)(v40 + 16);
      BOOL v28 = +[HMIFeedbackVisionProcessor reencodeAssetURL:v14 outputURL:v41 bitRate:2000000 duration:buf analysisFPS:v35 sampleFrameHandler:v37 dropFrameHandler:COERCE_DOUBLE(__PAIR64__(*(unsigned int *)&buf[4], LODWORD(a6)))];
    }
  }
  else
  {
    v29 = (void *)MEMORY[0x22A641C70]();
    v30 = self;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v32;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      _os_log_impl(&dword_225DC6000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to read the asset %@", buf, 0x16u);
    }
    BOOL v28 = 0;
  }

  return v28;
}

void __107__HMIFeedbackVisionProcessor_blurFacesFromAssetURL_outputURL_duration_analysisFPS_windowSize_faceDetected___block_invoke(uint64_t a1, void *a2, void *a3, opaqueCMSampleBuffer *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  v10 = *(void **)(a1 + 32);
  id v24 = 0;
  v11 = objc_msgSend(v10, "analyzePixelBuffer:regionOfInterest:error:", ImageBuffer, &v24, 0.0, 0.0, 1.0, 1.0);
  id v12 = v24;
  if (v12)
  {
    uint64_t v13 = (void *)MEMORY[0x22A641C70]();
    id v14 = *(id *)(a1 + 40);
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      CMSampleBufferGetPresentationTimeStamp(&v23, a4);
      Float64 Seconds = CMTimeGetSeconds(&v23);
      *(_DWORD *)buf = 138543618;
      double v26 = v16;
      __int16 v27 = 2048;
      Float64 v28 = Seconds;
      _os_log_impl(&dword_225DC6000, v15, OS_LOG_TYPE_ERROR, "%{public}@Skip the frame @ %.3fs due to analyzer failure", buf, 0x16u);
    }
  }
  else
  {
    while ((unint64_t)[*(id *)(a1 + 48) count] >= *(void *)(a1 + 56))
      objc_msgSend(*(id *)(a1 + 48), "hmf_removeFirstObject");
    v18 = *(void **)(a1 + 40);
    uint64_t v19 = *(void *)(a1 + 48);
    v20 = [v11 allObjects];
    [v18 _addEventsToEventQueue:v19 events:v20];

    if (*(void *)(a1 + 64)) {
      **(unsigned char **)(a1 + 64) |= [v11 count] != 0;
    }
    v21 = *(void **)(a1 + 40);
    id v22 = objc_msgSend(*(id *)(a1 + 48), "na_arrayByFlattening");
    [v21 _blurSampleBufferWithEncoder:v8 sampleBuffer:a4 events:v22];
  }
}

void __107__HMIFeedbackVisionProcessor_blurFacesFromAssetURL_outputURL_duration_analysisFPS_windowSize_faceDetected___block_invoke_22(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  id v7 = a3;
  objc_msgSend(v6, "na_arrayByFlattening");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 _blurSampleBufferWithEncoder:v7 sampleBuffer:a4 events:v8];
}

- (void)_addEventsToEventQueue:(id)a3 events:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((objc_msgSend(v5, "hmf_isEmpty") & 1) == 0)
  {
    id v7 = [v5 lastObject];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __60__HMIFeedbackVisionProcessor__addEventsToEventQueue_events___block_invoke;
    v9[3] = &unk_26477E050;
    id v10 = v6;
    id v8 = objc_msgSend(v7, "na_filter:", v9);

    [v5 removeLastObject];
    [v5 addObject:v8];
  }
  [v5 addObject:v6];
}

uint64_t __60__HMIFeedbackVisionProcessor__addEventsToEventQueue_events___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__HMIFeedbackVisionProcessor__addEventsToEventQueue_events___block_invoke_2;
  v8[3] = &unk_26477E050;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8) ^ 1;

  return v6;
}

BOOL __60__HMIFeedbackVisionProcessor__addEventsToEventQueue_events___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 boundingBox];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 boundingBox];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  HMICGRectIntersectionOverMinArea(v5, v7, v9, v11, v13, v15, v17, v19);
  return v20 > 0.5;
}

- (void)_blurSampleBufferWithEncoder:(id)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 events:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  memset(&v19, 0, sizeof(v19));
  CMSampleBufferGetPresentationTimeStamp(&v19, a4);
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  if (objc_msgSend(v9, "hmf_isEmpty"))
  {
    [v8 handleSampleBuffer:a4];
  }
  else
  {
    double v11 = [(HMIFeedbackVisionProcessor *)self _createBlurredPixelBuffer:ImageBuffer events:v9];
    if (v11)
    {
      double v12 = v11;
      CMSampleBufferRef CopyWithPixelBuffer = HMICMSampleBufferCreateCopyWithPixelBuffer(a4, v11);
      [v8 handleSampleBuffer:CopyWithPixelBuffer];
      CFRelease(CopyWithPixelBuffer);
      CVPixelBufferRelease(v12);
    }
    else
    {
      double v14 = (void *)MEMORY[0x22A641C70]();
      double v15 = self;
      double v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        double v17 = HMFGetLogIdentifier();
        CMTime time = v19;
        Float64 Seconds = CMTimeGetSeconds(&time);
        LODWORD(time.value) = 138543618;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v17;
        LOWORD(time.flags) = 2048;
        *(Float64 *)((char *)&time.flags + 2) = Seconds;
        _os_log_impl(&dword_225DC6000, v16, OS_LOG_TYPE_ERROR, "%{public}@Skip the frame @ %.3fs due to blurring failure", (uint8_t *)&time, 0x16u);
      }
    }
  }
}

- (__CVBuffer)_createBlurredPixelBuffer:(__CVBuffer *)a3 events:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v6 = a4;
  double Size = HMICVPixelBufferGetSize(a3);
  double v9 = v8;
  id v57 = 0;
  double v10 = +[HMIVisionUtilities transferPixelBuffer:a3 pixelFormat:32 options:4 error:&v57];
  id v11 = v57;
  if (!v10)
  {
    double v16 = (void *)MEMORY[0x22A641C70]();
    double v17 = self;
    double v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      CMTime v19 = HMFGetLogIdentifier();
      LODWORD(dest.data) = 138543618;
      *(void **)((char *)&dest.data + 4) = v19;
      WORD2(dest.height) = 2112;
      *(vImagePixelCount *)((char *)&dest.height + 6) = (vImagePixelCount)v11;
      float v20 = "%{public}@Failed to convert YCbCr to RGBA (%@)";
      p_vImage_Buffer dest = (uint8_t *)&dest;
      goto LABEL_8;
    }
LABEL_12:

    id v24 = 0;
    goto LABEL_13;
  }
  double v12 = +[HMIVisionUtilities createPixelBufferWithSize:pixelFormat:useIOSurface:](HMIVisionUtilities, "createPixelBufferWithSize:pixelFormat:useIOSurface:", CVPixelBufferGetPixelFormatType(v10), 0, Size, v9);
  if (!v12)
  {
    CVPixelBufferRelease(v10);
    double v16 = (void *)MEMORY[0x22A641C70]();
    double v17 = self;
    double v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      CMTime v19 = HMFGetLogIdentifier();
      LODWORD(dest.data) = 138543362;
      *(void **)((char *)&dest.data + 4) = v19;
      float v20 = "%{public}@Failed to clone RGBA source image";
      p_vImage_Buffer dest = (uint8_t *)&dest;
      id v22 = v18;
      uint32_t v23 = 12;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  double v13 = v12;
  uint32_t v14 = -[HMIFeedbackVisionProcessor _blurRadiusForEvents:imageSize:](self, "_blurRadiusForEvents:imageSize:", v6, Size, v9);
  CVPixelBufferLockBaseAddress(v13, 0);
  CVPixelBufferLockBaseAddress(v10, 1uLL);
  dest.data = CVPixelBufferGetBaseAddressOfPlane(v13, 0);
  dest.height = CVPixelBufferGetHeightOfPlane(v13, 0);
  dest.width = CVPixelBufferGetWidthOfPlane(v13, 0);
  dest.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(v13, 0);
  src.data = CVPixelBufferGetBaseAddressOfPlane(v10, 0);
  src.height = CVPixelBufferGetHeightOfPlane(v10, 0);
  src.width = CVPixelBufferGetWidthOfPlane(v10, 0);
  src.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(v10, 0);
  vImage_Error v15 = vImageTentConvolve_ARGB8888(&src, &dest, 0, 0, 0, v14, v14, 0, 3u);
  CVPixelBufferUnlockBaseAddress(v13, 0);
  CVPixelBufferUnlockBaseAddress(v10, 1uLL);
  if (v15)
  {
    CVPixelBufferRelease(v13);
    CVPixelBufferRelease(v10);
    double v16 = (void *)MEMORY[0x22A641C70]();
    double v17 = self;
    double v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      CMTime v19 = HMFGetLogIdentifier();
      LODWORD(v62.data) = 138543618;
      *(void **)((char *)&v62.data + 4) = v19;
      WORD2(v62.height) = 2048;
      *(vImagePixelCount *)((char *)&v62.height + 6) = v15;
      float v20 = "%{public}@Failed to blur entire image (vImage_Error = %zd)";
      p_vImage_Buffer dest = (uint8_t *)&v62;
LABEL_8:
      id v22 = v18;
      uint32_t v23 = 22;
LABEL_11:
      _os_log_impl(&dword_225DC6000, v22, OS_LOG_TYPE_ERROR, v20, p_dest, v23);

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if ([v6 count])
  {
    uint64_t v26 = 0;
    while (1)
    {
      __int16 v27 = [v6 objectAtIndexedSubscript:v26];
      [v27 boundingBox];
      HMICGRectPixelFromNormalized(v28, v29, v30, v31, Size, v9);
      double v33 = v32;
      double v35 = v34;
      double v37 = v36;
      double v39 = v38;

      double v40 = HMICGRectExpandWithinLimit(v33, v35, v37, v39, Size, v9, 1.2);
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      CVPixelBufferLockBaseAddress(v13, 1uLL);
      CVPixelBufferLockBaseAddress(v10, 0);
      size_t v47 = dest.rowBytes * (unint64_t)v42 + 4 * (unint64_t)v40;
      v62.width = (unint64_t)v44;
      v62.rowBytes = dest.rowBytes;
      v62.data = (char *)dest.data + v47;
      v62.height = (unint64_t)v46;
      v55.data = (char *)src.data + v47;
      v55.height = (unint64_t)v46;
      v55.width = (unint64_t)v44;
      v55.rowBytes = src.rowBytes;
      vImage_Error v48 = vImageCopyBuffer(&v62, &v55, 4uLL, 0);
      CVPixelBufferUnlockBaseAddress(v13, 1uLL);
      CVPixelBufferUnlockBaseAddress(v10, 0);
      if (v48) {
        break;
      }
      if (++v26 >= (unint64_t)[v6 count]) {
        goto LABEL_18;
      }
    }
    CVPixelBufferRelease(v13);
    CVPixelBufferRelease(v10);
    double v16 = (void *)MEMORY[0x22A641C70]();
    double v17 = self;
    double v18 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    CMTime v19 = HMFGetLogIdentifier();
    int v58 = 138543618;
    v59 = v19;
    __int16 v60 = 2048;
    vImage_Error v61 = v48;
    float v20 = "%{public}@Failed to copy blurred patch (vImage_Error = %zd)";
    p_vImage_Buffer dest = (uint8_t *)&v58;
    goto LABEL_8;
  }
LABEL_18:
  CVPixelBufferRelease(v13);
  id v54 = v11;
  id v24 = +[HMIVisionUtilities transferPixelBuffer:v10 pixelFormat:CVPixelBufferGetPixelFormatType(a3) options:4 error:&v54];
  id v49 = v54;

  CVPixelBufferRelease(v10);
  if (!v24)
  {
    id v50 = (void *)MEMORY[0x22A641C70]();
    v51 = self;
    uint64_t v52 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      id v53 = HMFGetLogIdentifier();
      LODWORD(v62.data) = 138543618;
      *(void **)((char *)&v62.data + 4) = v53;
      WORD2(v62.height) = 2112;
      *(vImagePixelCount *)((char *)&v62.height + 6) = (vImagePixelCount)v49;
      _os_log_impl(&dword_225DC6000, v52, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert RGBA to YCbCr (%@)", (uint8_t *)&v62, 0x16u);
    }
    id v24 = 0;
  }
  id v11 = v49;
LABEL_13:

  return v24;
}

- (unsigned)_blurRadiusForEvents:(id)a3 imageSize:(CGSize)a4
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__HMIFeedbackVisionProcessor__blurRadiusForEvents_imageSize___block_invoke;
  v8[3] = &__block_descriptor_48_e54___NSNumber_24__0__HMIVideoAnalyzerEvent_8__NSNumber_16l;
  CGSize v9 = a4;
  double v4 = objc_msgSend(a3, "na_reduceWithInitialValue:reducer:", &unk_26D9A9528, v8);
  int v5 = (int)[v4 intValue] / 8;
  if (v5 >= 64) {
    int v5 = 64;
  }
  if (v5 <= 8) {
    int v5 = 8;
  }
  unsigned int v6 = (2 * v5) | 1;

  return v6;
}

uint64_t __61__HMIFeedbackVisionProcessor__blurRadiusForEvents_imageSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  [v6 boundingBox];
  float v8 = *(double *)(a1 + 32) * v7;
  [v6 boundingBox];
  double v10 = v9;

  float v11 = *(double *)(a1 + 40) * v10;
  double v12 = NSNumber;
  [v5 floatValue];
  float v14 = v13;

  if (v8 >= v11) {
    *(float *)&double v15 = v8;
  }
  else {
    *(float *)&double v15 = v11;
  }
  if (v14 >= *(float *)&v15) {
    *(float *)&double v15 = v14;
  }
  return [v12 numberWithFloat:v15];
}

@end