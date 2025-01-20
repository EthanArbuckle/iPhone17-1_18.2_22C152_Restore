@interface HMIVideoFrameAnalyzer
- (BOOL)handleSampleBuffer:(opaqueCMSampleBuffer *)a3 background:(opaqueCMSampleBuffer *)a4 motionDetections:(id)a5 tracks:(id)a6;
- (HMICameraVideoFrameAnalyzer)cameraVideoFrameAnalyzer;
- (HMIVideoFrameAnalyzer)initWithConfiguration:(id)a3 workQueue:(id)a4;
- (HMIVideoFrameAnalyzerDelegate)delegate;
- (HMIVideoFrameSampler)frameSampler;
- (double)averageAnalysisTime;
- (void)flush;
- (void)setDelegate:(id)a3;
@end

@implementation HMIVideoFrameAnalyzer

- (HMIVideoFrameAnalyzer)initWithConfiguration:(id)a3 workQueue:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)HMIVideoFrameAnalyzer;
  v8 = [(HMIVideoAnalyzerProcessingNode *)&v30 initWithConfiguration:v6 workQueue:v7];
  if (!v8) {
    goto LABEL_4;
  }
  v9 = [[MovingAverage alloc] initWithWindowSize:8];
  analysisTime = v8->_analysisTime;
  v8->_analysisTime = v9;

  v11 = [HMICameraVideoFrameAnalyzerSignificantActivity alloc];
  v12 = +[HMIVideoAnalyzerEvent eventConfidenceThresholdsMedium];
  v13 = +[HMIVideoAnalyzerEvent eventConfidenceThresholdsHigh];
  id v29 = 0;
  uint64_t v14 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)v11 initWithMediumConfidenceThresholds:v12 highConfidenceThresholds:v13 analyzerConfiguration:v6 error:&v29];
  id v15 = v29;
  cameraVideoFrameAnalyzer = v8->_cameraVideoFrameAnalyzer;
  v8->_cameraVideoFrameAnalyzer = (HMICameraVideoFrameAnalyzer *)v14;

  v17 = [(HMIVideoFrameAnalyzer *)v8 cameraVideoFrameAnalyzer];

  if (v17)
  {
    v18 = [HMIVideoFrameIntervalSampler alloc];
    CMTimeMake(&v28, 10, 1);
    uint64_t v19 = [(HMIVideoFrameIntervalSampler *)v18 initWithInterval:&v28];
    frameSampler = v8->_frameSampler;
    v8->_frameSampler = (HMIVideoFrameSampler *)v19;

    v21 = [(HMIVideoFrameAnalyzer *)v8 frameSampler];
    [v21 setDelegate:v8];

LABEL_4:
    v22 = v8;
    goto LABEL_8;
  }
  v23 = (void *)MEMORY[0x22A641C70]();
  v24 = v8;
  v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v32 = v26;
    __int16 v33 = 2112;
    id v34 = v15;
    _os_log_impl(&dword_225DC6000, v25, OS_LOG_TYPE_ERROR, "%{public}@Error creating frame analyzer: %@", buf, 0x16u);
  }

  v22 = 0;
LABEL_8:

  return v22;
}

- (BOOL)handleSampleBuffer:(opaqueCMSampleBuffer *)a3 background:(opaqueCMSampleBuffer *)a4 motionDetections:(id)a5 tracks:(id)a6
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  v12 = [(HMIVideoAnalyzerProcessingNode *)self dynamicConfiguration];

  if (!v12) {
    _HMFPreconditionFailure();
  }
  unint64_t v13 = 0x263EFF000uLL;
  uint64_t v14 = [MEMORY[0x263EFF910] date];
  v96 = [MEMORY[0x263EFF9C0] set];
  v95 = [MEMORY[0x263EFF9C0] set];
  v97 = [[HMIVideoFrame alloc] initWithSampleBuffer:a3];
  id v15 = [(HMIVideoAnalyzerProcessingNode *)self dynamicConfiguration];
  uint64_t v16 = [v15 eventTriggers];

  v94 = a3;
  if ((v16 & 0x1E) != 0)
  {
    v93 = v14;
    v100[0] = MEMORY[0x263EF8330];
    v100[1] = 3221225472;
    v100[2] = __79__HMIVideoFrameAnalyzer_handleSampleBuffer_background_motionDetections_tracks___block_invoke;
    v100[3] = &unk_26477C4B8;
    v17 = v97;
    v101 = v17;
    v18 = objc_msgSend(v11, "na_map:", v100);
    uint64_t v19 = [(HMIVideoAnalyzerProcessingNode *)self configuration];
    uint64_t v20 = [v19 packageClassifierMode];

    v91 = a4;
    id v89 = v11;
    if (!v20)
    {
      [v96 unionSet:v18];
      uint64_t v21 = [MEMORY[0x263EFFA08] set];

      v18 = (void *)v21;
    }
    v22 = [(HMIVideoFrameAnalyzer *)self cameraVideoFrameAnalyzer];
    [(HMIVideoFrame *)v17 size];
    id v88 = v10;
    objc_msgSend(v22, "regionOfInterestForMotionDetections:foregroundEvents:frameSize:", v10, v18);
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;

    v31 = [(HMIVideoFrameAnalyzer *)self cameraVideoFrameAnalyzer];
    uint64_t v32 = objc_msgSend(v31, "analyzeFrame:regionOfInterest:", v17, v24, v26, v28, v30);

    __int16 v33 = [(HMIVideoFrameAnalyzer *)self cameraVideoFrameAnalyzer];
    id v34 = [(HMIVideoAnalyzerProcessingNode *)self dynamicConfiguration];
    uint64_t v35 = [v34 recognizeFaces];
    v36 = +[HMIPreference sharedInstance];
    v90 = (void *)v32;
    v37 = objc_msgSend(v33, "getAnalyzerEvents:eventTriggers:enableFaceClassification:enableTorsoRecognition:", v32, v16 & 0xFFFFFFFFFFFFFFEFLL, v35, objc_msgSend(v36, "shouldEnableTorsoRecognition"));

    v38 = [(HMIVideoAnalyzerProcessingNode *)self dynamicConfiguration];
    if ([v38 recognizeFaces])
    {
      v39 = [(HMIVideoAnalyzerProcessingNode *)self configuration];
      v40 = [v39 homeUUID];

      a4 = v91;
      if (v40)
      {
        v41 = [(HMIVideoFrameAnalyzer *)self cameraVideoFrameAnalyzer];
        v42 = [(HMIVideoAnalyzerProcessingNode *)self configuration];
        v43 = [v42 homeUUID];
        uint64_t v44 = objc_msgSend(v41, "recognizeEvents:frame:regionOfInterest:homeUUID:", v37, v17, v43, v24, v26, v28, v30);

        a4 = v91;
        v37 = (void *)v44;
        goto LABEL_22;
      }
    }
    else
    {

      a4 = v91;
    }
    v63 = [(HMIVideoAnalyzerProcessingNode *)self dynamicConfiguration];
    if ([v63 recognizeFaces])
    {
      v64 = [(HMIVideoAnalyzerProcessingNode *)self configuration];
      v65 = [v64 homeUUID];

      id v10 = v88;
      uint64_t v14 = v93;
      if (v65)
      {
LABEL_24:
        unint64_t v13 = 0x263EFF000;
        if ((v16 & 0x10) != 0)
        {
          uint64_t v70 = [v18 count];
          if (a4)
          {
            if (v70)
            {
              v71 = [[HMIVideoFrame alloc] initWithSampleBuffer:a4];
              v72 = [(HMIVideoFrameAnalyzer *)self cameraVideoFrameAnalyzer];
              if (v71) {
                [(HMIVideoFrame *)v71 presentationTimeStamp];
              }
              else {
                memset(v99, 0, sizeof(v99));
              }
              v73 = [v72 getPackageEvents:v90 foregroundEvents:v18 newBackgroundEvents:v95 backgroundTimeStamp:v99];

              if ([v73 count])
              {
                v74 = [(HMIVideoFrameAnalyzer *)self cameraVideoFrameAnalyzer];
                uint64_t v75 = objc_msgSend(v74, "analyzeBackgroundFrame:packageEvents:newBackgroundEvents:regionOfInterest:", v71, v73, v95, v24, v26, v28, v30);

                [v96 unionSet:v75];
                v73 = (void *)v75;
              }
              unint64_t v13 = 0x263EFF000uLL;

              uint64_t v14 = v93;
            }
          }
        }
        [v96 unionSet:v37];

        id v11 = v89;
        if ((v16 & 1) == 0) {
          goto LABEL_34;
        }
        goto LABEL_9;
      }
      v66 = (void *)MEMORY[0x22A641C70]();
      v67 = self;
      v68 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v69 = v92 = v67;
        LODWORD(buf.value) = 138543362;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v69;
        _os_log_impl(&dword_225DC6000, v68, OS_LOG_TYPE_ERROR, "%{public}@Face Classification is enabled, but homeUUID is nil, skipping face recognition", (uint8_t *)&buf, 0xCu);

        v67 = v92;
      }

LABEL_23:
      uint64_t v14 = v93;
      goto LABEL_24;
    }

LABEL_22:
    id v10 = v88;
    goto LABEL_23;
  }
  double v24 = *MEMORY[0x263F001A0];
  double v26 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v28 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v30 = *(double *)(MEMORY[0x263F001A0] + 24);
  if ((v16 & 1) == 0)
  {
LABEL_34:
    v45 = v10;
    goto LABEL_35;
  }
LABEL_9:
  v45 = v10;
  v46 = +[HMIMotionDetection firstMotionDetectionInArray:v10 withMode:1];
  v47 = v46;
  if (v46)
  {
    [v46 motionScore];
    if (v48 > 1.0)
    {
      unint64_t v49 = v13;
      v50 = [[HMIConfidence alloc] initWithValue:&unk_26D9A9720 levelThresholds:1.0];
      v51 = [HMIVideoAnalyzerEventMotion alloc];
      [v47 boundingBox];
      double v53 = v52;
      double v55 = v54;
      double v57 = v56;
      double v59 = v58;
      [v47 motionScore];
      LODWORD(v61) = v60;
      v62 = -[HMIVideoAnalyzerEventMotion initWithConfidence:boundingBox:motionScore:](v51, "initWithConfidence:boundingBox:motionScore:", v50, v53, v55, v57, v59, v61);
      [v96 addObject:v62];

      v104.origin.x = v24;
      v104.origin.y = v26;
      v104.size.width = v28;
      v104.size.height = v30;
      if (CGRectIsNull(v104))
      {
        double v30 = 1.0;
        double v28 = 1.0;
        double v26 = 0.0;
        double v24 = 0.0;
      }

      unint64_t v13 = v49;
    }
  }

LABEL_35:
  analysisTime = self->_analysisTime;
  v77 = NSNumber;
  v78 = [*(id *)(v13 + 2320) date];
  [v78 timeIntervalSinceDate:v14];
  v79 = objc_msgSend(v77, "numberWithDouble:");
  [(MovingAverage *)analysisTime addNumber:v79];

  v80 = (void *)MEMORY[0x22A641C70]();
  v81 = [(HMIVideoAnalyzerProcessingNode *)self configuration];
  LODWORD(v78) = [v81 redactFrames];

  if (v78)
  {
    uint64_t v82 = [(HMIVideoFrame *)v97 redactedCopy];

    v97 = (HMIVideoFrame *)v82;
  }
  memset(&buf, 0, sizeof(buf));
  if (a4) {
    CMSampleBufferGetPresentationTimeStamp(&buf, a4);
  }
  else {
    CMTime buf = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  }
  v83 = [HMIVideoFrameAnalyzerResult alloc];
  CMTime v98 = buf;
  v84 = -[HMIVideoFrameAnalyzerResult initWithFrame:events:backgroundEvents:backgroundTimeStamp:regionOfInterest:motionDetections:](v83, "initWithFrame:events:backgroundEvents:backgroundTimeStamp:regionOfInterest:motionDetections:", v97, v96, v95, &v98, v45, v24, v26, v28, v30);
  v85 = [(HMIVideoFrameAnalyzer *)self delegate];
  [v85 frameAnalyzer:self didAnalyzeFrame:v84];

  v86 = [(HMIVideoFrameAnalyzer *)self frameSampler];
  [v86 handleSampleBuffer:v94];

  return 1;
}

id __79__HMIVideoFrameAnalyzer_handleSampleBuffer_background_motionDetections_tracks___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4) {
    [v4 presentationTimeStamp];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  v5 = [v3 createPackageEventAtTimeStamp:v7];

  return v5;
}

- (double)averageAnalysisTime
{
  [(MovingAverage *)self->_analysisTime movingAverageForInterval:4.0 defaultValue:0.0];
  return result;
}

- (void)flush
{
  id v3 = [(HMIVideoFrameAnalyzer *)self cameraVideoFrameAnalyzer];
  v4 = [(HMIVideoAnalyzerProcessingNode *)self configuration];
  v5 = [v4 homeUUID];
  id v6 = [(HMIVideoAnalyzerProcessingNode *)self dynamicConfiguration];
  objc_msgSend(v3, "flushAndGetAnalysisStateUpdateForHome:enableFaceClassification:", v5, objc_msgSend(v6, "recognizeFaces"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    id v7 = [(HMIVideoFrameAnalyzer *)self delegate];
    [v7 frameAnalyzer:self didProduceAnalysisStateUpdate:v8];
  }
}

- (HMIVideoFrameAnalyzerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMIVideoFrameAnalyzerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMICameraVideoFrameAnalyzer)cameraVideoFrameAnalyzer
{
  return (HMICameraVideoFrameAnalyzer *)objc_getProperty(self, a2, 64, 1);
}

- (HMIVideoFrameSampler)frameSampler
{
  return (HMIVideoFrameSampler *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameSampler, 0);
  objc_storeStrong((id *)&self->_cameraVideoFrameAnalyzer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_analysisTime, 0);
}

@end