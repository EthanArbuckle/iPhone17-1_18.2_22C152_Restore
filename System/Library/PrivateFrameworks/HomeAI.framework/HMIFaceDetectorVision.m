@interface HMIFaceDetectorVision
+ (id)detectFacesInImageData:(id)a3 error:(id *)a4;
+ (id)detectFacesInPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
+ (unint64_t)defaultRevision;
+ (void)releaseCachedResources;
@end

@implementation HMIFaceDetectorVision

+ (id)detectFacesInPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = objc_alloc_init(MEMORY[0x263F1EE90]);
  v7 = +[HMIPreference sharedInstance];
  int v8 = [v7 shouldUseCPUOnlyForVisionFaceDetection];

  if (v8) {
    [v6 setUsesCPUOnly:1];
  }
  objc_msgSend(v6, "setRevision:", +[HMIFaceDetectorVision defaultRevision](HMIFaceDetectorVision, "defaultRevision"));
  id v9 = objc_alloc(MEMORY[0x263F1EF40]);
  v10 = (void *)[v9 initWithCVPixelBuffer:a3 options:MEMORY[0x263EFFA78]];
  v17[0] = v6;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  id v16 = 0;
  char v12 = [v10 performRequests:v11 error:&v16];
  id v13 = v16;

  if (v12)
  {
    v14 = [v6 results];
  }
  else
  {
    if (a4) {
      *a4 = v13;
    }
    HMIErrorLogC(v13);
    v14 = 0;
  }

  return v14;
}

+ (id)detectFacesInImageData:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  v5 = (objc_class *)MEMORY[0x263F1EE90];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  int v8 = +[HMIPreference sharedInstance];
  int v9 = [v8 shouldUseCPUOnlyForVisionFaceDetection];

  if (v9) {
    [v7 setUsesCPUOnly:1];
  }
  objc_msgSend(v7, "setRevision:", +[HMIFaceDetectorVision defaultRevision](HMIFaceDetectorVision, "defaultRevision"));
  id v10 = objc_alloc(MEMORY[0x263F1EF40]);
  v11 = +[HMIVisionSession sharedInstance];
  uint64_t v12 = [v11 vnSession];
  id v13 = (void *)[v10 initWithData:v6 options:MEMORY[0x263EFFA78] session:v12];

  v19[0] = v7;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  id v18 = 0;
  LOBYTE(v12) = [v13 performRequests:v14 error:&v18];
  id v15 = v18;

  if (v12)
  {
    id v16 = [v7 results];
  }
  else
  {
    if (a4) {
      *a4 = v15;
    }
    HMIErrorLogC(v15);
    id v16 = 0;
  }

  return v16;
}

+ (unint64_t)defaultRevision
{
  return 3;
}

+ (void)releaseCachedResources
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x22A641C70](a1, a2);
  id v4 = a1;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_225DC6000, v5, OS_LOG_TYPE_DEBUG, "%{public}@releaseCachedResources is deprecated and is now a no-op.", (uint8_t *)&v7, 0xCu);
  }
}

@end