@interface MADImageRemoveBackgroundTask
- (BOOL)autoCancellable;
- (BOOL)canceled;
- (BOOL)computeRegionOfInterest:(CGRect *)a3 pixelBuffer:(__CVBuffer *)a4 orientation:(unsigned int)a5 error:(id *)a6;
- (MADImageRemoveBackgroundTask)initWithSignpostPayload:(id)a3;
- (MTLDevice)preferredMetalDevice;
- (NSString)signpostPayload;
- (float)resourceRequirement;
- (id)computeSensitivityOfPixelBuffer:(__CVBuffer *)a3;
- (id)generateMaskWithRequestHandler:(id)a3 regionOfInterest:(CGRect)a4 error:(id *)a5;
- (void)cancel;
- (void)setPreferredMetalDevice:(id)a3;
@end

@implementation MADImageRemoveBackgroundTask

- (MADImageRemoveBackgroundTask)initWithSignpostPayload:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADImageRemoveBackgroundTask;
  v6 = [(MADImageRemoveBackgroundTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_signpostPayload, a3);
  }

  return v7;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (BOOL)canceled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_canceled);
  return v2 & 1;
}

- (void)cancel
{
}

- (float)resourceRequirement
{
  return 1.0;
}

- (id)computeSensitivityOfPixelBuffer:(__CVBuffer *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEFAULT, "[RemoveBackground|IVS] Checking image eligibility", buf, 2u);
    }
  }
  v6 = +[MADImageSafetyClassificationResource sharedResource];
  v7 = +[VCPMADResourceManager sharedManager];
  v8 = [v7 activateResource:v6];

  objc_super v9 = VCPSignPostLog();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  v11 = VCPSignPostLog();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v13 = [(MADImageRemoveBackgroundTask *)self signpostPayload];
    *(_DWORD *)buf = 138412290;
    v26 = v13;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SCMLHandler_analyzePixelBuffer", "%@", buf, 0xCu);
  }
  v14 = [v6 handler];
  id v24 = 0;
  v15 = [v14 analyzePixelBuffer:a3 error:&v24];
  id v16 = v24;

  v17 = VCPSignPostLog();
  v18 = v17;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    v19 = [(MADImageRemoveBackgroundTask *)self signpostPayload];
    *(_DWORD *)buf = 138412290;
    v26 = v19;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v18, OS_SIGNPOST_INTERVAL_END, v10, "SCMLHandler_analyzePixelBuffer", "%@", buf, 0xCu);
  }
  [v8 reset];
  if (v15)
  {
    v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v15, "sensitive"));
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [v16 description];
        *(_DWORD *)buf = 138412290;
        v26 = v22;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_DEFAULT, "[RemoveBackground|IVS] Failed to check eligibility (%@)", buf, 0xCu);
      }
    }
    v20 = 0;
  }

  return v20;
}

- (BOOL)computeRegionOfInterest:(CGRect *)a3 pixelBuffer:(__CVBuffer *)a4 orientation:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  a3->origin.CGFloat x = 0.0;
  a3->origin.CGFloat y = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  a3->size = _Q0;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v16 = VCPLogInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_INFO, "[RemoveBackground|ROI] Image is screenshot - detecting ROI", buf, 2u);
    }
  }
  v17 = [MEMORY[0x1E4FB4020] imageWithPixelBuffer:a4 orientation:v7];
  id v18 = objc_alloc(MEMORY[0x1E4FB4058]);
  v19 = [(MADImageRemoveBackgroundTask *)self preferredMetalDevice];
  v20 = objc_msgSend(v18, "initWithImage:regionOfInterest:imageType:preferredMetalDevice:", v17, 1, v19, 0.0, 0.0, 1.0, 1.0);

  v21 = +[VCPMADVIVisualSearchResource sharedResource];
  v22 = +[VCPMADResourceManager sharedManager];
  v23 = [v22 activateResource:v21];

  id v24 = [v21 service];
  id v44 = 0;
  v25 = [v24 refineRegionsWithRequest:v20 error:&v44];
  id v26 = v44;

  [v23 reset];
  if (!v26)
  {
    v31 = [v25 refinedRegions];
    BOOL v32 = [v31 count] == 0;

    if (!v32)
    {
      v33 = [v25 refinedRegions];
      v30 = [v33 firstObject];

      [v30 regionOfInterest];
      v59.origin.CGFloat x = 0.0;
      v59.origin.CGFloat y = 0.0;
      v59.size.CGFloat width = 1.0;
      v59.size.CGFloat height = 1.0;
      *a3 = CGRectIntersection(v58, v59);
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v34 = VCPLogInstance();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          CGFloat x = a3->origin.x;
          CGFloat y = a3->origin.y;
          CGFloat width = a3->size.width;
          CGFloat height = a3->size.height;
          [v30 confidence];
          float v36 = v35;
          v37 = [v25 refinedRegions];
          int v38 = [v37 count];
          *(_DWORD *)buf = 134219264;
          CGFloat v46 = x;
          __int16 v47 = 2048;
          CGFloat v48 = y;
          __int16 v49 = 2048;
          CGFloat v50 = width;
          __int16 v51 = 2048;
          CGFloat v52 = height;
          __int16 v53 = 2048;
          double v54 = v36;
          __int16 v55 = 1024;
          int v56 = v38;
          _os_log_impl(&dword_1BBEDA000, v34, OS_LOG_TYPE_INFO, "[RemoveBackground|ROI] Screenshot ROI: (%0.2f, %0.2f) %0.2fx%0.2f Confidence: %0.2f [1 of %d]", buf, 0x3Au);
        }
      }
      BOOL v29 = 1;
      goto LABEL_22;
    }
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v30 = VCPLogInstance();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_DEFAULT, "[RemoveBackground|ROI] Screenshot has no ROI", buf, 2u);
      }
      BOOL v29 = 0;
      goto LABEL_22;
    }
LABEL_23:
    BOOL v29 = 0;
    goto LABEL_24;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v27 = VCPLogInstance();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CGFloat v46 = *(double *)&v26;
      _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "[RemoveBackground|ROI] Failed to detect screenshot ROI (%@)", buf, 0xCu);
    }
  }
  if (!a6) {
    goto LABEL_23;
  }
  v28 = (void *)[v26 copy];
  BOOL v29 = 0;
  v30 = *a6;
  *a6 = v28;
LABEL_22:

LABEL_24:
  return v29;
}

- (id)generateMaskWithRequestHandler:(id)a3 regionOfInterest:(CGRect)a4 error:(id *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = objc_alloc_init(MEMORY[0x1E4F45840]);
  [v12 setRevision:1];
  if (DeviceHasANE())
  {
    v13 = [MEMORY[0x1E4F458E8] defaultANEDevice];
    [v12 setProcessingDevice:v13];
  }
  v14 = [(MADImageRemoveBackgroundTask *)self preferredMetalDevice];

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E4F458E8];
    id v16 = [(MADImageRemoveBackgroundTask *)self preferredMetalDevice];
    v17 = [v15 deviceForMetalDevice:v16];
    [v12 setProcessingDevice:v17];

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v18 = VCPLogInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v19 = [v12 processingDevice];
        v20 = [(MADImageRemoveBackgroundTask *)self preferredMetalDevice];
        *(_DWORD *)buf = 138412546;
        v43 = v19;
        __int16 v44 = 2112;
        v45 = v20;
        _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_DEBUG, "[RemoveBackground|Mask] Set VNProcessingDevice: %@ (%@)", buf, 0x16u);
      }
    }
  }
  objc_msgSend(v12, "setRegionOfInterest:", x, y, width, height);
  v21 = VCPSignPostLog();
  os_signpost_id_t v22 = os_signpost_id_generate(v21);

  v23 = VCPSignPostLog();
  id v24 = v23;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    signpostPayload = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    v43 = signpostPayload;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
  }

  id v41 = v12;
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  id v40 = 0;
  char v27 = [v11 performRequests:v26 error:&v40];
  id v28 = v40;

  BOOL v29 = VCPSignPostLog();
  v30 = v29;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    v31 = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    v43 = v31;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v30, OS_SIGNPOST_INTERVAL_END, v22, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
  }

  if ((v27 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      float v36 = VCPLogInstance();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = [v28 description];
        *(_DWORD *)buf = 138412290;
        v43 = v37;
        _os_log_impl(&dword_1BBEDA000, v36, OS_LOG_TYPE_DEFAULT, "[RemoveBackground|Mask] Mask generation failed (%@)", buf, 0xCu);
      }
    }
    int v38 = (void *)[v28 copy];
    float v35 = 0;
    v34 = *a5;
    *a5 = v38;
    goto LABEL_22;
  }
  BOOL v32 = [v12 results];
  BOOL v33 = [v32 count] == 0;

  if (!v33)
  {
    v34 = [v12 results];
    float v35 = [v34 firstObject];
LABEL_22:

    goto LABEL_23;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v34 = VCPLogInstance();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v34, OS_LOG_TYPE_DEFAULT, "[RemoveBackground|Mask] No observations produced for image", buf, 2u);
    }
    float v35 = 0;
    goto LABEL_22;
  }
  float v35 = 0;
LABEL_23:

  return v35;
}

- (NSString)signpostPayload
{
  return self->_signpostPayload;
}

- (MTLDevice)preferredMetalDevice
{
  return self->_preferredMetalDevice;
}

- (void)setPreferredMetalDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredMetalDevice, 0);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
}

@end