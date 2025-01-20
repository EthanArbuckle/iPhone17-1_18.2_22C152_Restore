@interface ADJasperColorV2Pipeline
- (ADJasperColorV2Pipeline)initWithInputPrioritization:(int64_t)a3 espressoEngine:(unint64_t)a4;
- (ADJasperColorV2Pipeline)initWithInputPrioritization:(int64_t)a3 espressoEngine:(unint64_t)a4 andParameters:(id)a5;
- (ADJasperColorV2PipelineParameters)pipelineParameters;
- (id)inferenceDescriptor;
- (int64_t)postProcessDepth:(__CVBuffer *)a3 output:(__CVBuffer *)a4;
- (int64_t)postProcessDepth:(__CVBuffer *)a3 output:(__CVBuffer *)a4 depthRoi:(CGRect)a5;
- (int64_t)postProcessDepth:(__CVBuffer *)a3 uncertainty:(__CVBuffer *)a4 filteredPointCloud:(id)a5 outputDepth:(__CVBuffer *)a6 outputUncertainty:(__CVBuffer *)a7 depthRoi:(CGRect)a8;
- (int64_t)postProcessUncertainty:(__CVBuffer *)a3 outputConfidence:(__CVBuffer *)a4 confidenceUnits:(unint64_t)a5;
- (int64_t)projectJasperPoints:(id)a3 cropTo:(CGRect)a4 rotateBy:(int64_t)a5 projectedPointsBuffer:(__CVBuffer *)a6 filteredPoints:(id *)a7;
- (uint64_t)changePointCloudPOV:(double)a3 targetCamera:(double)a4 jasperToCameraTransform:(uint64_t)a5 outputPointCloud:(uint64_t)a6;
- (void)setPipelineParameters:(id)a3;
@end

@implementation ADJasperColorV2Pipeline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  objc_storeStrong((id *)&self->_inferenceDesc, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
}

- (void)setPipelineParameters:(id)a3
{
}

- (ADJasperColorV2PipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (int64_t)postProcessUncertainty:(__CVBuffer *)a3 outputConfidence:(__CVBuffer *)a4 confidenceUnits:(unint64_t)a5
{
  kdebug_trace();
  int64_t v8 = +[ADUtils postProcessConfidence:a3 confidenceOutput:a4 rawConfidenceUnits:3 outConfidenceUnits:a5 confidenceLevelRanges:0];
  kdebug_trace();
  return v8;
}

- (int64_t)postProcessDepth:(__CVBuffer *)a3 output:(__CVBuffer *)a4 depthRoi:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  kdebug_trace();
  int64_t v11 = +[ADUtils postProcessDepth:depthOutput:inputRoi:](ADUtils, "postProcessDepth:depthOutput:inputRoi:", a3, a4, x, y, width, height);
  kdebug_trace();
  return v11;
}

- (int64_t)postProcessDepth:(__CVBuffer *)a3 output:(__CVBuffer *)a4
{
  return -[ADJasperColorV2Pipeline postProcessDepth:output:depthRoi:](self, "postProcessDepth:output:depthRoi:", a3, a4, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (int64_t)postProcessDepth:(__CVBuffer *)a3 uncertainty:(__CVBuffer *)a4 filteredPointCloud:(id)a5 outputDepth:(__CVBuffer *)a6 outputUncertainty:(__CVBuffer *)a7 depthRoi:(CGRect)a8
{
  double height = a8.size.height;
  double width = a8.size.width;
  double y = a8.origin.y;
  double x = a8.origin.x;
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v47 = a5;
  int v50 = 335687404;
  long long v51 = 0u;
  long long v52 = 0u;
  kdebug_trace();
  if (!a3 || !a4 || !a6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      *(void *)&buf[4] = a3;
      __int16 v58 = 2048;
      size_t v59 = (size_t)a4;
      __int16 v60 = 2048;
      v61 = a6;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Function arguments depth, uncertainty, outputDepth must not be nil (%p,%p,%p)", buf, 0x20u);
    }
    int64_t v24 = -22953;
    goto LABEL_28;
  }
  size_t v16 = CVPixelBufferGetWidth(a3);
  size_t v17 = CVPixelBufferGetHeight(a3);
  size_t v18 = CVPixelBufferGetWidth(a4);
  size_t v19 = CVPixelBufferGetHeight(a4);
  size_t v20 = CVPixelBufferGetWidth(a6);
  size_t v21 = CVPixelBufferGetHeight(a6);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  OSType v44 = CVPixelBufferGetPixelFormatType(a6);
  if (v17 != v19 || v16 != v18)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218752;
      *(void *)&buf[4] = v16;
      __int16 v58 = 2048;
      size_t v59 = v17;
      __int16 v60 = 2048;
      v61 = (__CVBuffer *)v18;
      __int16 v62 = 2048;
      double v63 = *(double *)&v19;
      v22 = &_os_log_internal;
      v23 = "Depth dimensions (%lu,%lu) do not match uncertainty dimensions (%lu,%lu)";
      goto LABEL_22;
    }
LABEL_27:
    int64_t v24 = -22957;
    goto LABEL_28;
  }
  v69.origin.double x = x;
  v69.origin.double y = y;
  v69.size.double width = width;
  v69.size.double height = height;
  if (CGRectIsEmpty(v69))
  {
    double x = *MEMORY[0x263F00148];
    double y = *(double *)(MEMORY[0x263F00148] + 8);
    double width = (double)CVPixelBufferGetWidth(a3);
    double height = (double)CVPixelBufferGetHeight(a3);
  }
  if (width > (double)v20 || height > (double)v21)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218752;
      *(void *)&buf[4] = v20;
      __int16 v58 = 2048;
      size_t v59 = v21;
      __int16 v60 = 2048;
      v61 = *(__CVBuffer **)&width;
      __int16 v62 = 2048;
      double v63 = height;
      v22 = &_os_log_internal;
      v23 = "Output depth dimensions (%lu,%lu) are smaller than ROI (%f,%f)";
      goto LABEL_22;
    }
    goto LABEL_27;
  }
  if (a7 && (width > (double)CVPixelBufferGetWidth(a7) || height > (double)CVPixelBufferGetHeight(a7)))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218752;
      *(void *)&buf[4] = CVPixelBufferGetWidth(a7);
      __int16 v58 = 2048;
      size_t v59 = CVPixelBufferGetHeight(a7);
      __int16 v60 = 2048;
      v61 = *(__CVBuffer **)&width;
      __int16 v62 = 2048;
      double v63 = height;
      v22 = &_os_log_internal;
      v23 = "Output uncertainty dimensions (%lu,%lu) are smaller than ROI (%f,%f)";
LABEL_22:
      _os_log_error_impl(&dword_215F16000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0x2Au);
      goto LABEL_27;
    }
    goto LABEL_27;
  }
  if (x + width > (double)v16 || y + height > (double)v17)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134219264;
      *(double *)&buf[4] = x;
      __int16 v58 = 2048;
      size_t v59 = *(void *)&y;
      __int16 v60 = 2048;
      v61 = *(__CVBuffer **)&width;
      __int16 v62 = 2048;
      double v63 = height;
      __int16 v64 = 2048;
      size_t v65 = v16;
      __int16 v66 = 2048;
      size_t v67 = v17;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ROI (%f,%f,%f,%f) does not fit into depth image (%lu,%lu)", buf, 0x3Eu);
    }
    goto LABEL_27;
  }
  unint64_t v26 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)PixelFormatType, 0);
  v27 = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(a4);
  if (v26 != PixelBufferUtils::pixelSizeForPixelFormat(v27, 0))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    v32 = buf;
    PixelBufferUtils::pixelFormatAsString(PixelFormatType, buf);
    if (v60 < 0) {
      v32 = *(unsigned char **)buf;
    }
    unint64_t v33 = CVPixelBufferGetPixelFormatType(a4);
    PixelBufferUtils::pixelFormatAsString(v33, (char *)__p);
    if (v49 >= 0) {
      v34 = __p;
    }
    else {
      v34 = (void **)__p[0];
    }
    *(_DWORD *)v53 = 136315394;
    v54 = v32;
    __int16 v55 = 2080;
    v56 = v34;
    v35 = &_os_log_internal;
    v36 = "Input depth (%s) and uncertainty (%s) bits per pixel do not match";
LABEL_54:
    _os_log_error_impl(&dword_215F16000, v35, OS_LOG_TYPE_ERROR, v36, v53, 0x16u);
    if (v49 < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v60) < 0) {
      operator delete(*(void **)buf);
    }
    goto LABEL_27;
  }
  if (a7)
  {
    unint64_t v28 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)v44, 0);
    v29 = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(a7);
    if (v28 != PixelBufferUtils::pixelSizeForPixelFormat(v29, 0))
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      v37 = buf;
      PixelBufferUtils::pixelFormatAsString(v44, buf);
      if (v60 < 0) {
        v37 = *(unsigned char **)buf;
      }
      unint64_t v38 = CVPixelBufferGetPixelFormatType(a7);
      PixelBufferUtils::pixelFormatAsString(v38, (char *)__p);
      if (v49 >= 0) {
        v39 = __p;
      }
      else {
        v39 = (void **)__p[0];
      }
      *(_DWORD *)v53 = 136315394;
      v54 = v37;
      __int16 v55 = 2080;
      v56 = v39;
      v35 = &_os_log_internal;
      v36 = "Output depth (%s) and uncertainty (%s) bits per pixel do not match";
      goto LABEL_54;
    }
  }
  BOOL v30 = [(ADJasperColorV2PipelineParameters *)self->_pipelineParameters outputHighConfidencePixelsOnly];
  if (a7) {
    char v31 = 1;
  }
  else {
    char v31 = v30;
  }
  if ((v31 & 1) == 0)
  {
    int64_t v24 = +[ADUtils postProcessDepth:depthOutput:inputRoi:](ADUtils, "postProcessDepth:depthOutput:inputRoi:", a3, a6, x, y, width, height);
    goto LABEL_28;
  }
  if (PixelFormatType == 1717855600 && v44 == 1717855600)
  {
    filterDepthAndUncertainty<float,float,false>(a3, a4, a6, a7, v47, self, x, y, width, height);
LABEL_79:
    int64_t v24 = 0;
    goto LABEL_28;
  }
  if (PixelFormatType == 1717855600 && v44 == 1751410032)
  {
    filterDepthAndUncertainty<float,half,false>(a3, a4, a6, a7, v47, self, x, y, width, height);
    goto LABEL_79;
  }
  if (PixelFormatType == 1717855600 && v44 == 1717856627)
  {
    filterDepthAndUncertainty<float,float,true>(a3, a4, a6, a7, v47, self, x, y, width, height);
    goto LABEL_79;
  }
  if (PixelFormatType == 1717855600 && v44 == 1751411059)
  {
    filterDepthAndUncertainty<float,half,true>(a3, a4, a6, a7, v47, self, x, y, width, height);
    goto LABEL_79;
  }
  if (PixelFormatType == 1751410032 && v44 == 1717855600)
  {
    filterDepthAndUncertainty<half,float,false>(a3, a4, a6, a7, v47, self, x, y, width, height);
    goto LABEL_79;
  }
  if (PixelFormatType == 1751410032 && v44 == 1751410032)
  {
    filterDepthAndUncertainty<half,half,false>(a3, a4, a6, a7, v47, self, x, y, width, height);
    goto LABEL_79;
  }
  if (PixelFormatType == 1751410032 && v44 == 1717856627)
  {
    filterDepthAndUncertainty<half,float,true>(a3, a4, a6, a7, v47, self, x, y, width, height);
    goto LABEL_79;
  }
  if (PixelFormatType == 1751410032 && v44 == 1751411059)
  {
    filterDepthAndUncertainty<half,half,true>(a3, a4, a6, a7, v47, self, x, y, width, height);
    goto LABEL_79;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    PixelBufferUtils::pixelFormatAsString(PixelFormatType, buf);
    int v40 = SHIBYTE(v60);
    v41 = *(unsigned char **)buf;
    PixelBufferUtils::pixelFormatAsString(v44, (char *)__p);
    v42 = buf;
    if (v40 < 0) {
      v42 = v41;
    }
    if (v49 >= 0) {
      v43 = __p;
    }
    else {
      v43 = (void **)__p[0];
    }
    *(_DWORD *)v53 = 136315394;
    v54 = v42;
    __int16 v55 = 2080;
    v56 = v43;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unsupported input (%s) and output (%s) formats combination", v53, 0x16u);
    if (v49 < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v60) < 0) {
      operator delete(*(void **)buf);
    }
  }
  int64_t v24 = -22956;
LABEL_28:
  kdebug_trace();

  return v24;
}

- (uint64_t)changePointCloudPOV:(double)a3 targetCamera:(double)a4 jasperToCameraTransform:(uint64_t)a5 outputPointCloud:(uint64_t)a6
{
  id v11 = a7;
  id v12 = a8;
  id v13 = a9;
  int v22 = 335679632;
  long long v23 = 0u;
  long long v24 = 0u;
  kdebug_trace();
  if (v11 && v13)
  {
    v14 = objc_msgSend(v11, "pointCloudByChangingPointOfViewByTransform:to:", v12, a1, a2, a3, a4);
    if (v14)
    {
      [v13 appendPointsFrom:v14];
      uint64_t v15 = 0;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed changing point cloud POV", buf, 2u);
      }
      uint64_t v15 = -22950;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Jasper inputs/outputs must not be nil", buf, 2u);
    }
    uint64_t v15 = -22953;
  }
  kdebug_trace();

  return v15;
}

- (int64_t)projectJasperPoints:(id)a3 cropTo:(CGRect)a4 rotateBy:(int64_t)a5 projectedPointsBuffer:(__CVBuffer *)a6 filteredPoints:(id *)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = a3;
  int v22 = 335679632;
  long long v23 = 0u;
  long long v24 = 0u;
  kdebug_trace();
  if (a6)
  {
    if (v15)
    {
      size_t v17 = [(ADJasperColorV2PipelineParameters *)self->_pipelineParameters pointCloudFilter];
      size_t v18 = [v15 pointCloudByApplyingFilter:v17];

      if (a7) {
        *a7 = v18;
      }
      int64_t v19 = objc_msgSend(v18, "projectJasperPointsCroppedBy:rotatedBy:andScaledInto:", a5, a6, x, y, width, height);
      id v15 = v18;
    }
    else
    {
      PixelBufferUtils::blacken(a6, v16);
      int64_t v19 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)size_t v21 = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Output buffer must not be nil", v21, 2u);
    }
    int64_t v19 = -22953;
  }
  kdebug_trace();

  return v19;
}

- (id)inferenceDescriptor
{
  return self->_inferenceDesc;
}

- (ADJasperColorV2Pipeline)initWithInputPrioritization:(int64_t)a3 espressoEngine:(unint64_t)a4 andParameters:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a5;
  int v23 = 335684564;
  int64_t v24 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  kdebug_trace();
  v22.receiver = self;
  v22.super_class = (Class)ADJasperColorV2Pipeline;
  v9 = [(ADJasperColorV2Pipeline *)&v22 init];
  if (!v9) {
    goto LABEL_18;
  }
  if (v8) {
    v10 = (ADJasperColorV2PipelineParameters *)v8;
  }
  else {
    v10 = (ADJasperColorV2PipelineParameters *)objc_opt_new();
  }
  pipelineParameters = v9->_pipelineParameters;
  v9->_pipelineParameters = v10;

  id v12 = [(ADPipelineParameters *)v9->_pipelineParameters deviceName];
  unint64_t v13 = +[ADDeviceConfiguration getLidarType:v12];

  if (v13 == 2)
  {
    if (a3 != 2)
    {
      if (a3 == 3)
      {
        v14 = @"D3PQuality";
        goto LABEL_16;
      }
LABEL_12:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        id v15 = +[ADUtils prioritizationAsString:a3];
        *(_DWORD *)buf = 138412290;
        v29 = v15;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "did not find network for pipeline ADJasperColorV2Pipeline prioritization %@", buf, 0xCu);
      }
      goto LABEL_19;
    }
    v14 = @"D3PBalanced";
  }
  else if (a3 == 2)
  {
    v14 = @"DAPIBalanced";
  }
  else
  {
    if (a3 != 3) {
      goto LABEL_12;
    }
    v14 = @"DAPIQuality";
  }
LABEL_16:
  [(ADJasperColorV2PipelineParameters *)v9->_pipelineParameters uncertaintyThreshold];
  uint64_t v16 = +[ADNetworkProvider providerForNetwork:v14];
  networkProvider = v9->_networkProvider;
  v9->_networkProvider = (ADNetworkProvider *)v16;

  if (!v9->_networkProvider)
  {
LABEL_19:
    size_t v20 = 0;
    goto LABEL_20;
  }
  size_t v18 = [[ADEspressoJasperColorV2InferenceDescriptor alloc] initWithNetworkProvider:v9->_networkProvider espressoEngine:a4 lidarType:v13];
  inferenceDesc = v9->_inferenceDesc;
  v9->_inferenceDesc = v18;

LABEL_18:
  size_t v20 = v9;
LABEL_20:
  kdebug_trace();

  return v20;
}

- (ADJasperColorV2Pipeline)initWithInputPrioritization:(int64_t)a3 espressoEngine:(unint64_t)a4
{
  return [(ADJasperColorV2Pipeline *)self initWithInputPrioritization:a3 espressoEngine:a4 andParameters:0];
}

@end