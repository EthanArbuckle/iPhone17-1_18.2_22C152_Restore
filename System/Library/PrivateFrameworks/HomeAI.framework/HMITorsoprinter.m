@interface HMITorsoprinter
+ (__CVBuffer)createTorsoPixelBufferForTorsoEvent:(id)a3 pixelBuffer:(__CVBuffer *)a4 error:(id *)a5;
+ (id)currentModelUUID;
+ (unint64_t)currentTorsoRequestRevision;
- (id)torsoprintForTorsoPixelBuffer:(__CVBuffer *)a3 unrecognizable:(BOOL)a4 error:(id *)a5;
@end

@implementation HMITorsoprinter

+ (unint64_t)currentTorsoRequestRevision
{
  return 3737841670;
}

+ (id)currentModelUUID
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__HMITorsoprinter_currentModelUUID__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentModelUUID_onceToken != -1) {
    dispatch_once(&currentModelUUID_onceToken, block);
  }
  v2 = (void *)currentModelUUID_modelUUID;
  return v2;
}

void __35__HMITorsoprinter_currentModelUUID__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[HMITorsoprinter currentTorsoRequestRevision];
  uint64_t v3 = (int)HMIVisionRuntimeVersion();
  v4 = (void *)MEMORY[0x22A641C70]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v10 = 138543874;
    v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = v2;
    __int16 v14 = 2048;
    uint64_t v15 = v3;
    _os_log_impl(&dword_225DC6000, v6, OS_LOG_TYPE_INFO, "%{public}@Torsoprint Version: %ld.%ld", (uint8_t *)&v10, 0x20u);
  }
  uint64_t v8 = HMIModelUUID(v2, v3);
  v9 = (void *)currentModelUUID_modelUUID;
  currentModelUUID_modelUUID = v8;
}

+ (__CVBuffer)createTorsoPixelBufferForTorsoEvent:(id)a3 pixelBuffer:(__CVBuffer *)a4 error:(id *)a5
{
  id v7 = a3;
  double Size = HMICVPixelBufferGetSize(a4);
  CGFloat v10 = v9;
  [v7 boundingBox];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  HMICGRectPixelFromNormalized(v12, v14, v16, v18, Size, v10);
  CGRect v22 = CGRectIntegral(v21);
  return +[HMIVisionUtilities transferPixelBuffer:crop:size:pixelFormat:options:error:](HMIVisionUtilities, "transferPixelBuffer:crop:size:pixelFormat:options:error:", a4, 1111970369, 8, a5, v22.origin.x, v22.origin.y, v22.size.width, v22.size.height, 128.0, 256.0);
}

- (id)torsoprintForTorsoPixelBuffer:(__CVBuffer *)a3 unrecognizable:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v68[1] = *MEMORY[0x263EF8340];
  id v9 = objc_alloc_init(MEMORY[0x263F1EE60]);
  id v60 = 0;
  char v10 = objc_msgSend(v9, "setRevision:error:", +[HMITorsoprinter currentTorsoRequestRevision](HMITorsoprinter, "currentTorsoRequestRevision"), &v60);
  id v11 = v60;
  if (v10)
  {
    CGFloat v12 = objc_msgSend(MEMORY[0x263F1EF28], "observationWithRequestRevision:boundingBox:", 3737841664, 0.0, 0.0, 1.0, 1.0);
    v68[0] = v12;
    double v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:1];
    [v9 setInputDetectedObjectObservations:v13];

    id v14 = objc_alloc(MEMORY[0x263F1EF40]);
    double v15 = +[HMIVisionSession sharedInstance];
    CGFloat v16 = [v15 vnSession];
    double v17 = (void *)[v14 initWithCVPixelBuffer:a3 options:MEMORY[0x263EFFA78] session:v16];

    id v67 = v9;
    CGFloat v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v67 count:1];
    id v59 = v11;
    char v19 = [v17 performRequests:v18 error:&v59];
    id v20 = v59;

    if (v19)
    {
      CGRect v21 = [v9 results];
      uint64_t v22 = [v21 count];

      if (v22 == 1)
      {
        v23 = [v9 results];
        v24 = [v23 firstObject];

        v25 = [v24 torsoprint];
        [v25 confidence];
        float v27 = v26;

        BOOL v28 = v27 <= 0.5;
        if (v27 <= 0.5)
        {
          context = (void *)MEMORY[0x22A641C70]();
          v29 = self;
          v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v56 = HMFGetLogIdentifier();
            v55 = [v24 torsoprint];
            [v55 confidence];
            *(_DWORD *)buf = 138543618;
            v62 = v56;
            __int16 v63 = 2048;
            double v64 = v31;
            _os_log_impl(&dword_225DC6000, v30, OS_LOG_TYPE_INFO, "%{public}@Found low quality torso conf: %.4f", buf, 0x16u);
          }
          BOOL v28 = 1;
        }
        +[HMITorsoQuality entropyOfSaturationForBGRAPixelBuffer:a3];
        float v33 = v32;
        uint64_t v34 = +[HMITorsoQuality entropyOfLaplacianForBGRAPixelBuffer:a3];
        float v36 = v35;
        if (v33 >= -1.988 && v35 >= -1.915)
        {
          v37 = (void *)MEMORY[0x22A641C70](v34);
          v38 = self;
          v39 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v40 = v58 = v37;
            *(_DWORD *)buf = 138543874;
            v62 = v40;
            __int16 v63 = 2048;
            double v64 = v33;
            __int16 v65 = 2048;
            double v66 = v36;
            _os_log_impl(&dword_225DC6000, v39, OS_LOG_TYPE_INFO, "%{public}@Found low quality torso entropyOfSaturation: %.4f entropyOfLaplacian: %.4f", buf, 0x20u);

            v37 = v58;
          }

          BOOL v28 = 1;
        }
        v41 = [v24 torsoprint];

        if (v41)
        {
          v42 = [HMITorsoprint alloc];
          v43 = [MEMORY[0x263F08C38] UUID];
          v44 = [v24 torsoprint];
          v45 = [v44 descriptorData];
          v46 = [(HMITorsoprint *)v42 initWithUUID:v43 data:v45 lowQuality:v28 unrecognizable:v6];
        }
        else
        {
          v53 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1038 description:@"torsoprint is nil"];
          v43 = v53;
          if (a5) {
            *a5 = v53;
          }
          HMIErrorLog(self, v43);
          v46 = 0;
        }

        goto LABEL_29;
      }
      v49 = NSString;
      v50 = [v9 results];
      v24 = [v49 stringWithFormat:@"Expected 1 torsoprint, but got %lu torsoprints", objc_msgSend(v50, "count")];

      v51 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1038 description:v24];
      v52 = v51;
      if (a5) {
        *a5 = v51;
      }
      HMIErrorLog(self, v52);
    }
    else
    {
      v48 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1038 description:@"failed to perform image request" underlyingError:v20];
      v24 = v48;
      if (a5) {
        *a5 = v48;
      }
      HMIErrorLog(self, v24);
    }
    v46 = 0;
LABEL_29:

    goto LABEL_30;
  }
  v47 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1038 description:@"Failed to set request revision" underlyingError:v11];
  double v17 = v47;
  if (a5) {
    *a5 = v47;
  }
  HMIErrorLog(self, v17);
  v46 = 0;
  id v20 = v11;
LABEL_30:

  return v46;
}

@end