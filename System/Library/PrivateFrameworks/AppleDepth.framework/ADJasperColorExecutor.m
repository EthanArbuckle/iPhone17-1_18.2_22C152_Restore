@interface ADJasperColorExecutor
- (ADJasperColorExecutor)initWithInputPrioritization:(int64_t)a3;
- (ADJasperColorExecutor)initWithInputPrioritization:(int64_t)a3 parameters:(id)a4;
- (ADJasperColorExecutorParameters)executorParameters;
- (id)getIntermediates;
- (int64_t)allocateIntermediateBuffers;
- (int64_t)executeWithColor:(__CVBuffer *)a3 pointCloud:(id)a4 outDepthMap:(__CVBuffer *)a5 outConfMap:(__CVBuffer *)a6;
- (int64_t)executeWithColor:(__CVBuffer *)a3 pointCloud:(id)a4 outDepthMap:(__CVBuffer *)a5 outConfMap:(__CVBuffer *)a6 outNormalsMap:(__CVBuffer *)a7;
- (int64_t)numberOfExecutionSteps;
- (int64_t)prepareForEngineType:(unint64_t)a3 roi:(CGRect)a4 exifOrientation:(unsigned int)a5;
- (int64_t)prepareForEngineType:(unint64_t)a3 roi:(CGRect)a4 exifOrientation:(unsigned int)a5 rotationPreference:(unint64_t)a6;
- (int64_t)prepareForEngineType:(unint64_t)a3 roi:(CGRect)a4 exifOrientation:(unsigned int)a5 useTemporalConsistency:(BOOL)a6;
- (int64_t)prepareForEngineType:(unint64_t)a3 roi:(CGRect)a4 exifOrientation:(unsigned int)a5 useTemporalConsistency:(BOOL)a6 rotationPreference:(unint64_t)a7;
- (uint64_t)executeWithColor:(double)a3 pointCloud:(double)a4 outDepthMap:(double)a5 outConfMap:(uint64_t)a6 outNormalsMap:(uint64_t)a7 worldToCameraTransform:(void *)a8 cameraCalibration:(uint64_t)a9;
- (uint64_t)executeWithColor:(float32x4_t)a3 colorCameraCalibration:(float32x4_t)a4 colorWorldToPlatformTransform:(float32x4_t)a5 pointClouds:(uint64_t)a6 lidarCameraCalibration:(__CVBuffer *)a7 pointCloudWorldToPlatformTransforms:(void *)a8 outDepthMap:(void *)a9 outConfMap:(void *)a10 outNormalsMap:(uint64_t)a11;
- (uint64_t)executeWithColor:(uint64_t)a3 pointCloud:(uint64_t)a4 outDepthMap:(uint64_t)a5 outConfMap:(uint64_t)a6 worldToCameraTransform:(uint64_t)a7 cameraCalibration:;
- (void)dealloc;
- (void)deallocateEspressoBuffers;
- (void)setExecutorParameters:(id)a3;
@end

@implementation ADJasperColorExecutor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executorParameters, 0);
  objc_storeStrong((id *)&self->_prevCamCalib, 0);
  objc_storeStrong((id *)&self->_lktExecutor, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

- (void)setExecutorParameters:(id)a3
{
}

- (ADJasperColorExecutorParameters)executorParameters
{
  return self->_executorParameters;
}

- (int64_t)numberOfExecutionSteps
{
  if ([(ADJasperColorExecutorParameters *)self->_executorParameters temporalConsistencyMethod] == 2)return 7; {
  if ([(ADJasperColorExecutorParameters *)self->_executorParameters temporalConsistencyMethod] == 1)return 8;
  }
  return 5;
}

- (id)getIntermediates
{
  v84[2] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(ADJasperColorExecutorParameters *)self->_executorParameters temporalConsistencyMethod];
  if (v3 && !self->_opticalFlowEnabled)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v48 = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "cannot re-enable temporal consistency after executor was prepare without it.", v48, 2u);
    }
    v4 = 0;
  }
  else
  {
    v4 = objc_opt_new();
    itmPreProcessedColor = self->_itmPreProcessedColor;
    if (itmPreProcessedColor)
    {
      v83[0] = @"name";
      v83[1] = @"image";
      v84[0] = @"PreProcessed Color";
      v84[1] = itmPreProcessedColor;
      v6 = [NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:2];
      [v4 addObject:v6];
    }
    itmPreProcessedJasper = self->_itmPreProcessedJasper;
    if (itmPreProcessedJasper)
    {
      v81[0] = @"name";
      v81[1] = @"image";
      v82[0] = @"PreProcessed Jasper";
      v82[1] = itmPreProcessedJasper;
      v8 = [NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:2];
      [v4 addObject:v8];
    }
    itmUnprocessedDepth = self->_itmUnprocessedDepth;
    if (itmUnprocessedDepth)
    {
      v79[0] = @"name";
      v79[1] = @"image";
      v80[0] = @"Unprocessed Depth";
      v80[1] = itmUnprocessedDepth;
      v10 = [NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:2];
      [v4 addObject:v10];
    }
    itmPostProcessedDepth = self->_itmPostProcessedDepth;
    if (itmPostProcessedDepth)
    {
      v77[0] = @"name";
      v77[1] = @"image";
      v78[0] = @"PostProcessed Depth";
      v78[1] = itmPostProcessedDepth;
      v12 = [NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:2];
      [v4 addObject:v12];
    }
    itmUnprocessedConf = self->_itmUnprocessedConf;
    if (itmUnprocessedConf)
    {
      v75[0] = @"name";
      v75[1] = @"image";
      v76[0] = @"Unprocessed Conf";
      v76[1] = itmUnprocessedConf;
      v14 = [NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:2];
      [v4 addObject:v14];
    }
    itmPostProcessedConf = self->_itmPostProcessedConf;
    if (itmPostProcessedConf)
    {
      v73[0] = @"name";
      v73[1] = @"image";
      v74[0] = @"PostProcessed Conf";
      v74[1] = itmPostProcessedConf;
      v16 = [NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:2];
      [v4 addObject:v16];
    }
    v17 = [(ADJasperColorPipeline *)self->_pipeline inferenceDescriptor];
    v18 = [v17 normalsOutput];
    BOOL v19 = v18 == 0;

    if (!v19)
    {
      itmUnprocessedNormals = self->_itmUnprocessedNormals;
      if (itmUnprocessedNormals)
      {
        v71[0] = @"name";
        v71[1] = @"image";
        v72[0] = @"Unprocessed Normals";
        v72[1] = itmUnprocessedNormals;
        v21 = [NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];
        [v4 addObject:v21];
      }
      itmPostProcessedNormals = self->_itmPostProcessedNormals;
      if (itmPostProcessedNormals)
      {
        v69[0] = @"name";
        v69[1] = @"image";
        v70[0] = @"PostProcessed Normals";
        v70[1] = itmPostProcessedNormals;
        v23 = [NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:2];
        [v4 addObject:v23];
      }
    }
    if (v3)
    {
      itmUnprocessedAlpha = self->_itmUnprocessedAlpha;
      if (itmUnprocessedAlpha)
      {
        v67[0] = @"name";
        v67[1] = @"image";
        v68[0] = @"Unprocessed Alpha";
        v68[1] = itmUnprocessedAlpha;
        v25 = [NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];
        [v4 addObject:v25];
      }
      itmOpticalFlow = self->_itmOpticalFlow;
      if (itmOpticalFlow)
      {
        v65[0] = @"name";
        v65[1] = @"image";
        v66[0] = @"Optical Flow";
        v66[1] = itmOpticalFlow;
        v27 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:2];
        [v4 addObject:v27];
      }
      itmPrevProcessedFusedDepth = self->_itmPrevProcessedFusedDepth;
      if (itmPrevProcessedFusedDepth)
      {
        v63[0] = @"name";
        v63[1] = @"image";
        v64[0] = @"Prev Processed Fused Depth";
        v64[1] = itmPrevProcessedFusedDepth;
        v29 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];
        [v4 addObject:v29];
      }
      itmCurrProcessedFusedDepth = self->_itmCurrProcessedFusedDepth;
      if (itmCurrProcessedFusedDepth)
      {
        v61[0] = @"name";
        v61[1] = @"image";
        v62[0] = @"Curr Processed Fused Depth";
        v62[1] = itmCurrProcessedFusedDepth;
        v31 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];
        [v4 addObject:v31];
      }
      itmPrevProcessedFusedConf = self->_itmPrevProcessedFusedConf;
      if (itmPrevProcessedFusedConf)
      {
        v59[0] = @"name";
        v59[1] = @"image";
        v60[0] = @"Prev Processed Fused conf";
        v60[1] = itmPrevProcessedFusedConf;
        v33 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];
        [v4 addObject:v33];
      }
      itmCurrProcessedFusedConf = self->_itmCurrProcessedFusedConf;
      if (itmCurrProcessedFusedConf)
      {
        v57[0] = @"name";
        v57[1] = @"image";
        v58[0] = @"Curr Processed Fused conf";
        v58[1] = itmCurrProcessedFusedConf;
        v35 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
        [v4 addObject:v35];
      }
      itmWarpedPrevDepth = self->_itmWarpedPrevDepth;
      if (itmWarpedPrevDepth)
      {
        v55[0] = @"name";
        v55[1] = @"image";
        v56[0] = @"Prev Processed warped Depth";
        v56[1] = itmWarpedPrevDepth;
        v37 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
        [v4 addObject:v37];
      }
      itmWarpedPrevConf = self->_itmWarpedPrevConf;
      if (itmWarpedPrevConf)
      {
        v53[0] = @"name";
        v53[1] = @"image";
        v54[0] = @"Prev Processed warped conf";
        v54[1] = itmWarpedPrevConf;
        v39 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
        [v4 addObject:v39];
      }
      v40 = [(ADJasperColorPipeline *)self->_pipeline inferenceDescriptor];
      v41 = [v40 normalsOutput];
      BOOL v42 = v41 == 0;

      if (!v42)
      {
        itmPrevProcessedFusedNormals = self->_itmPrevProcessedFusedNormals;
        if (itmPrevProcessedFusedNormals)
        {
          v51[0] = @"name";
          v51[1] = @"image";
          v52[0] = @"Prev Processed Fused Normals";
          v52[1] = itmPrevProcessedFusedNormals;
          v44 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
          [v4 addObject:v44];
        }
        itmCurrProcessedFusedNormals = self->_itmCurrProcessedFusedNormals;
        if (itmCurrProcessedFusedNormals)
        {
          v49[0] = @"name";
          v49[1] = @"image";
          v50[0] = @"Curr Processed Fused Normals";
          v50[1] = itmCurrProcessedFusedNormals;
          v46 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
          [v4 addObject:v46];
        }
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_itmPreProcessedColor);
  CVPixelBufferRelease(self->_itmPreProcessedJasper);
  CVPixelBufferRelease(self->_itmUnprocessedDepth);
  CVPixelBufferRelease(self->_itmPostProcessedDepth);
  CVPixelBufferRelease(self->_itmUnprocessedConf);
  CVPixelBufferRelease(self->_itmPostProcessedConf);
  CVPixelBufferRelease(self->_itmUnprocessedNormals);
  CVPixelBufferRelease(self->_itmPostProcessedNormals);
  CVPixelBufferRelease(self->_itmUnprocessedAlpha);
  CVPixelBufferRelease(self->_itmOpticalFlow);
  CVPixelBufferRelease(self->_itmPrevProcessedFusedDepth);
  CVPixelBufferRelease(self->_itmPrevProcessedFusedConf);
  CVPixelBufferRelease(self->_itmCurrProcessedFusedConf);
  CVPixelBufferRelease(self->_itmWarpedPrevDepth);
  CVPixelBufferRelease(self->_itmWarpedPrevConf);
  CVPixelBufferRelease(self->_itmCurrProcessedFusedDepth);
  CVPixelBufferRelease(self->_itmPrevProcessedFusedNormals);
  CVPixelBufferRelease(self->_itmCurrProcessedFusedNormals);
  colorProcessingSession = self->_colorProcessingSession;
  if (colorProcessingSession)
  {
    PixelBufferUtilsSession::~PixelBufferUtilsSession(colorProcessingSession);
    MEMORY[0x2166C5D90]();
  }
  v4.receiver = self;
  v4.super_class = (Class)ADJasperColorExecutor;
  [(ADExecutor *)&v4 dealloc];
}

- (uint64_t)executeWithColor:(float32x4_t)a3 colorCameraCalibration:(float32x4_t)a4 colorWorldToPlatformTransform:(float32x4_t)a5 pointClouds:(uint64_t)a6 lidarCameraCalibration:(__CVBuffer *)a7 pointCloudWorldToPlatformTransforms:(void *)a8 outDepthMap:(void *)a9 outConfMap:(void *)a10 outNormalsMap:(uint64_t)a11
{
  v149[1] = *MEMORY[0x263EF8340];
  id v128 = a8;
  id v141 = a9;
  id v129 = a10;
  v18 = a1;
  objc_sync_enter(v18);
  int v146 = 335684428;
  long long v147 = 0u;
  long long v148 = 0u;
  v130 = v18;
  kdebug_trace();
  if (!*((void *)v18 + 8))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "must call prepare before execution", buf, 2u);
    }
    uint64_t v40 = -22960;
    goto LABEL_108;
  }
  if (!a12)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "must provide a pointer to CVPixelBufferRef", buf, 2u);
    }
    uint64_t v40 = -22953;
    goto LABEL_108;
  }
  if (CGRectIsEmpty(*(CGRect *)(v18 + 8)))
  {
    size_t Width = CVPixelBufferGetWidth(a7);
    size_t Height = CVPixelBufferGetHeight(a7);
    *((void *)v18 + 1) = 0;
    *((void *)v18 + 2) = 0;
    *((double *)v18 + 3) = (double)Width;
    *((double *)v18 + 4) = (double)Height;
  }
  v140 = [*((id *)v18 + 47) logger];
  v21 = [MEMORY[0x263F08AB0] processInfo];
  [v21 systemUptime];
  double v23 = v22;

  [v140 logPixelBuffer:a7 name:"inputColor" timestamp:v23];
  for (unsigned int i = 0; [v141 count] > (unint64_t)i; ++i)
  {
    v25 = [v141 objectAtIndexedSubscript:i];
    *((unsigned char *)&v143.__r_.__value_.__s + 23) = 15;
    strcpy((char *)&v143, "inputPointCloud");
    std::to_string(&__p, i);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
    }
    v28 = std::string::append(&v143, (const std::string::value_type *)p_p, size);
    long long v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
    int64_t v145 = v28->__r_.__value_.__r.__words[2];
    *(_OWORD *)buf = v29;
    v28->__r_.__value_.__l.__size_ = 0;
    v28->__r_.__value_.__r.__words[2] = 0;
    v28->__r_.__value_.__r.__words[0] = 0;
    if (v145 >= 0) {
      v30 = buf;
    }
    else {
      v30 = *(uint8_t **)buf;
    }
    [v140 logPointCloud:v25 name:v30 timestamp:v23];
    if (SHIBYTE(v145) < 0)
    {
      operator delete(*(void **)buf);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
LABEL_35:
        operator delete(__p.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v143.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_21;
        }
        goto LABEL_36;
      }
    }
    else if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      goto LABEL_35;
    }
    if ((SHIBYTE(v143.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_21;
    }
LABEL_36:
    operator delete(v143.__r_.__value_.__l.__data_);
LABEL_21:

    if (!a11) {
      goto LABEL_7;
    }
    v31 = (long long *)(a11 + ((unint64_t)i << 6));
    *(_OWORD *)obj = v31[1];
    long long v138 = *v31;
    long long v131 = v31[3];
    *(_OWORD *)v133 = v31[2];
    *((unsigned char *)&v143.__r_.__value_.__s + 23) = 19;
    strcpy((char *)&v143, "inputPointCloudPose");
    std::to_string(&__p, i);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v32 = &__p;
    }
    else {
      v32 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v33 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v33 = __p.__r_.__value_.__l.__size_;
    }
    v34 = std::string::append(&v143, (const std::string::value_type *)v32, v33);
    long long v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
    int64_t v145 = v34->__r_.__value_.__r.__words[2];
    *(_OWORD *)buf = v35;
    v34->__r_.__value_.__l.__size_ = 0;
    v34->__r_.__value_.__r.__words[2] = 0;
    v34->__r_.__value_.__r.__words[0] = 0;
    if (v145 >= 0) {
      v36 = buf;
    }
    else {
      v36 = *(uint8_t **)buf;
    }
    objc_msgSend(v140, "logMatrix4x4:name:timestamp:", v36, *(double *)&v138, *(double *)obj, *(double *)v133, *(double *)&v131, v23);
    if (SHIBYTE(v145) < 0)
    {
      operator delete(*(void **)buf);
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_38:
        if ((SHIBYTE(v143.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_7;
        }
        goto LABEL_39;
      }
    }
    else if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_38;
    }
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v143.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_7;
    }
LABEL_39:
    operator delete(v143.__r_.__value_.__l.__data_);
LABEL_7:
    v18 = v130;
  }
  if (!v141)
  {
    v39 = 0;
    goto LABEL_54;
  }
  if (v129)
  {
    if (v128 && a11)
    {
      [v140 logCalibration:v129 name:"inputPointCloudCalibration" timestamp:v23];
      [v140 logCalibration:v128 name:"inputColorCalibration" timestamp:v23];
      objc_msgSend(v140, "logMatrix4x4:name:timestamp:", "inputColorPose", *(double *)a2.i64, *(double *)a3.i64, *(double *)a4.i64, *(double *)a5.i64, v23);
      v37 = (void *)MEMORY[0x263F26CD8];
      v149[0] = v129;
      v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v149 count:1];
      v39 = objc_msgSend(v37, "aggregatePointClouds:calibrations:worldToPlatformTransforms:projectingToCamera:worldToPlatformAtProjectionTime:", v141, v38, a11, v128, *(double *)a2.i64, *(double *)a3.i64, *(double *)a4.i64, *(double *)a5.i64);

      v18 = v130;
      goto LABEL_54;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v68 = &_os_log_internal;
      v69 = "cannot aggregate and project point clouds without color calibration and world transform data";
      goto LABEL_100;
    }
    goto LABEL_87;
  }
  if ([v141 count] != 1)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v68 = &_os_log_internal;
      v69 = "cannot execute on multiple point clouds without aggregation information";
LABEL_100:
      _os_log_error_impl(&dword_215F16000, v68, OS_LOG_TYPE_ERROR, v69, buf, 2u);
    }
LABEL_87:
    uint64_t v40 = -22953;
    goto LABEL_107;
  }
  v39 = [v141 objectAtIndexedSubscript:0];
LABEL_54:
  [v140 logPointCloud:v39 name:"aggregatedPointCloud" timestamp:v23];
  uint64_t v41 = [*((id *)v18 + 47) temporalConsistencyMethod];
  if (!v41)
  {
    uint64_t obja = 0;
    BOOL v42 = &OBJC_IVAR___ADJasperColorExecutor__itmPostProcessedDepth;
    v43 = &OBJC_IVAR___ADJasperColorExecutor__itmPostProcessedConf;
    v44 = &OBJC_IVAR___ADJasperColorExecutor__itmPostProcessedNormals;
LABEL_58:
    v134 = *(__CVBuffer **)&v18[*v42];
    v120 = *(PixelBufferUtils **)&v18[*v43];
    v132 = *(PixelBufferUtils **)&v18[*v44];
    uint64_t v45 = *((void *)v18 + 18);
    if (!v45)
    {
LABEL_69:
      size_t v55 = CVPixelBufferGetWidth(a7);
      size_t v56 = CVPixelBufferGetHeight(a7);
      PixelFormatType = (PixelBufferUtilsSession *)CVPixelBufferGetPixelFormatType(a7);
      size_t v58 = CVPixelBufferGetWidth(*((CVPixelBufferRef *)v130 + 17));
      size_t v59 = CVPixelBufferGetHeight(*((CVPixelBufferRef *)v130 + 17));
      CVPixelBufferGetPixelFormatType(*((CVPixelBufferRef *)v130 + 17));
      v152.width = (double)v55;
      v152.height = (double)v56;
      v154.height = (double)v59;
      v154.width = (double)v58;
      PixelBufferUtilsSession::createCropScaleConvertRotateSession(PixelFormatType, v152, v154, *(CGRect *)(v130 + 8));
    }
    if (!a7) {
      goto LABEL_67;
    }
    int v46 = *(_DWORD *)(v45 + 40);
    double v48 = *(double *)(v45 + 24);
    double v47 = *(double *)(v45 + 32);
    if (v48 != (double)CVPixelBufferGetWidth(a7)
      || v47 != (double)CVPixelBufferGetHeight(a7)
      || CVPixelBufferGetPixelFormatType(a7) != v46
      || (v49 = (__CVBuffer *)*((void *)v130 + 17)) == 0
      || (uint64_t v50 = *((void *)v130 + 18),
          int v51 = *(_DWORD *)(v50 + 64),
          double v53 = *(double *)(v50 + 48),
          double v52 = *(double *)(v50 + 56),
          v53 != (double)CVPixelBufferGetWidth(*((CVPixelBufferRef *)v130 + 17)))
      || v52 != (double)CVPixelBufferGetHeight(v49)
      || CVPixelBufferGetPixelFormatType(v49) != v51)
    {
LABEL_67:
      v54 = (PixelBufferUtilsSession *)*((void *)v130 + 18);
      if (v54)
      {
        PixelBufferUtilsSession::~PixelBufferUtilsSession(v54);
        MEMORY[0x2166C5D90]();
      }
      goto LABEL_69;
    }
    uint64_t v60 = [v130 numberOfExecutionSteps];
    uint64_t v61 = [*((id *)v130 + 47) stepsToSkip];
    int v62 = [*((id *)v130 + 47) powerMeasureMode];
    v139 = [*((id *)v130 + 47) timeProfiler];
    uint64_t v63 = v60 - v61;
    if (v62)
    {
      BOOL v64 = v63-- < 1;
      if (v64) {
        goto LABEL_98;
      }
    }
    kdebug_trace();
    [v139 startWithUTFString:"preprocess color"];
    [v130 frameExecutionStart];
    if ((PixelBufferUtilsSession::run(*((PixelBufferUtilsSession **)v130 + 18), a7, *((__CVBuffer **)v130 + 17)) & 1) == 0)
    {
      v65 = v39;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed scaling color image", buf, 2u);
      }
      uint64_t v40 = -22950;
      goto LABEL_106;
    }
    [v140 logPixelBuffer:*((void *)v130 + 17) name:"processedColor" timestamp:v23];
    [v139 stopWithUTFString:"preprocess color"];
    kdebug_trace();
    if (v62)
    {
      BOOL v64 = v63-- < 1;
      if (v64) {
        goto LABEL_98;
      }
    }
    kdebug_trace();
    [v139 startWithUTFString:"preprocess jasper"];
    uint64_t v40 = objc_msgSend(*((id *)v130 + 15), "projectJasperPoints:cropTo:rotateBy:projectedPointsBuffer:", v39, *((void *)v130 + 10), *((void *)v130 + 19), *((double *)v130 + 1), *((double *)v130 + 2), *((double *)v130 + 3), *((double *)v130 + 4));
    if (v40)
    {
      v65 = v39;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v66 = &_os_log_internal;
        v67 = "failed projecting jasper points";
LABEL_105:
        _os_log_error_impl(&dword_215F16000, v66, OS_LOG_TYPE_ERROR, v67, buf, 2u);
        goto LABEL_106;
      }
      goto LABEL_106;
    }
    [v140 logPixelBuffer:*((void *)v130 + 19) name:"processedJasper" timestamp:v23];
    [v139 stopWithUTFString:"preprocess jasper"];
    kdebug_trace();
    if (v62)
    {
      BOOL v64 = v63-- < 1;
      if (v64) {
        goto LABEL_98;
      }
    }
    kdebug_trace();
    [v139 startWithUTFString:"network execution"];
    uint64_t v40 = [*((id *)v130 + 8) execute];
    if (v40)
    {
      v65 = v39;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v66 = &_os_log_internal;
        v67 = "failed executing espresso plan";
        goto LABEL_105;
      }
LABEL_106:

      goto LABEL_107;
    }
    [v140 logPixelBuffer:*((void *)v130 + 20) name:"depthOutRaw" timestamp:v23];
    [v140 logPixelBuffer:*((void *)v130 + 22) name:"confidenceOutRaw" timestamp:v23];
    [v140 logPixelBuffer:*((void *)v130 + 24) name:"normalsOutRaw" timestamp:v23];
    [v140 logPixelBuffer:*((void *)v130 + 26) name:"alphaMapOutRaw" timestamp:v23];
    [v139 stopWithUTFString:"network execution"];
    kdebug_trace();
    if (v62)
    {
      BOOL v64 = v63-- < 1;
      if (v64)
      {
LABEL_98:
        v65 = v39;
        uint64_t v40 = 0;
        goto LABEL_106;
      }
    }
    kdebug_trace();
    [v139 startWithUTFString:"postprocess depth"];
    uint64_t v70 = *((void *)v130 + 10);
    if (v70 == 3)
    {
      uint64_t v70 = 1;
    }
    else if (v70 == 1)
    {
      uint64_t v70 = 3;
    }
    uint64_t v40 = [*((id *)v130 + 15) postProcessWithDepth:*((void *)v130 + 20) confidence:*((void *)v130 + 22) normals:*((void *)v130 + 24) depthOutput:*((void *)v130 + 21) confidenceOutput:*((void *)v130 + 23) normalsOutput:*((void *)v130 + 25) normalsRequiredRotation:v70];
    if (v40)
    {
      v65 = v39;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v66 = &_os_log_internal;
        v67 = "failed postprocessing depth";
        goto LABEL_105;
      }
      goto LABEL_106;
    }
    [v140 logPixelBuffer:*((void *)v130 + 21) name:"depthOutProcessed" timestamp:v23];
    [v140 logPixelBuffer:*((void *)v130 + 23) name:"confidenceOutProcessed" timestamp:v23];
    if (!obja)
    {
      objb = 0;
      v74 = "postprocess depth";
      id v75 = v130;
      goto LABEL_116;
    }
    v72 = v130;
    if ([*((id *)v130 + 47) temporalConsistencyMethod] == 2)
    {
      uint64_t v40 = [*((id *)v130 + 16) executeWithFrame:*((void *)v130 + 17) intoOpticalFlowBuffer:*((void *)v130 + 29)];
      if (v40)
      {
        v65 = v39;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed running lktExecutor", buf, 2u);
        }
        v73 = 0;
        goto LABEL_204;
      }
      objb = 0;
      [v140 logPixelBuffer:*((void *)v130 + 29) name:"opticalFlow" timestamp:v23];
    }
    else
    {
      if ([*((id *)v130 + 47) temporalConsistencyMethod] == 1)
      {
        [v139 stopWithUTFString:"postprocess depth"];
        kdebug_trace();
        if (v62)
        {
          BOOL v64 = v63-- < 1;
          if (v64)
          {
            v65 = v39;
            v73 = 0;
LABEL_203:
            uint64_t v40 = 0;
            goto LABEL_204;
          }
        }
        kdebug_trace();
        [v139 startWithUTFString:"preprocess calibration"];
        if (!*((void *)v130 + 46)) {
          v130[288] = 1;
        }
        size_t v78 = CVPixelBufferGetWidth(*((CVPixelBufferRef *)v130 + 27));
        size_t v79 = CVPixelBufferGetHeight(*((CVPixelBufferRef *)v130 + 27));
        v80 = (void *)[v128 mutableCopy];
        objc_msgSend(v80, "crop:", *((double *)v130 + 1), *((double *)v130 + 2), *((double *)v130 + 3), *((double *)v130 + 4));
        objb = v80;
        if ([v80 adjustForImageRotation:*((void *)v130 + 10)])
        {
          if (objc_msgSend(v80, "scale:", (double)v78, (double)v79))
          {
            objc_msgSend(v140, "logCalibration:name:timestamp:", v23);
            v81 = "preprocess calibration";
LABEL_134:
            [v139 stopWithUTFString:v81];
            kdebug_trace();
            if (v62)
            {
              BOOL v64 = v63-- < 1;
              if (v64) {
                goto LABEL_144;
              }
            }
            kdebug_trace();
            [v139 startWithUTFString:"postprocess warp n fuse"];
            if (v130[288])
            {
              if (!PixelBufferUtils::copyPixelBuffer(*((PixelBufferUtils **)v130 + 31), *((CVPixelBufferRef *)v130 + 21), 0))
              {
                if (*((void *)v130 + 34))
                {
                  v94 = (PixelBufferUtils *)*((void *)v130 + 35);
                  if (v94) {
                    PixelBufferUtils::copyPixelBuffer(v94, *((CVPixelBufferRef *)v130 + 25), 0);
                  }
                }
              }
              v130[288] = 0;
              goto LABEL_139;
            }
            if ([*((id *)v130 + 47) useAlphaMapForTemporalConsistency])
            {
              v84 = (id *)v130;
              uint64_t v85 = *((void *)v130 + 26);
            }
            else
            {
              uint64_t v85 = 0;
              v84 = (id *)v130;
            }
            if ([v84[47] temporalConsistencyMethod] == 1)
            {
              v65 = v39;
              unint64_t v95 = *((void *)v130 + 10) - 1;
              float v96 = 0.0;
              if (v95 <= 2) {
                float v96 = flt_215FC4794[v95];
              }
              __float2 v97 = __sincosf_stret(v96);
              simd_float4 cosval_low = (simd_float4)LODWORD(v97.__cosval);
              cosval_low.f32[1] = -v97.__sinval;
              simd_float4 v119 = cosval_low;
              simd_float4 sinval_low = (simd_float4)LODWORD(v97.__sinval);
              sinval_low.i32[1] = LODWORD(v97.__cosval);
              simd_float4 v121 = sinval_low;
              simd_float4x4 v150 = __invert_f4(*(simd_float4x4 *)(v130 + 304));
              float32x4_t v117 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, v150.columns[1].f32[0]), a3, *(float32x2_t *)v150.columns[1].f32, 1), a4, (float32x4_t)v150.columns[1], 2), a5, (float32x4_t)v150.columns[1], 3);
              float32x4_t v118 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, v150.columns[0].f32[0]), a3, *(float32x2_t *)v150.columns[0].f32, 1), a4, (float32x4_t)v150.columns[0], 2), a5, (float32x4_t)v150.columns[0], 3);
              float32x4_t v116 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, v150.columns[2].f32[0]), a3, *(float32x2_t *)v150.columns[2].f32, 1), a4, (float32x4_t)v150.columns[2], 2), a5, (float32x4_t)v150.columns[2], 3);
              float32x4_t v115 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, v150.columns[3].f32[0]), a3, *(float32x2_t *)v150.columns[3].f32, 1), a4, (float32x4_t)v150.columns[3], 2), a5, (float32x4_t)v150.columns[3], 3);
              v150.columns[2] = (simd_float4)xmmword_215FC45E0;
              v150.columns[3] = (simd_float4)xmmword_215FC4640;
              v150.columns[0] = v119;
              v150.columns[1] = v121;
              simd_float4x4 v151 = __invert_f4(v150);
              float32x4_t v100 = vmlaq_f32(vmlaq_f32(vmlaq_lane_f32(vmulq_n_f32(v118, v97.__cosval), v117, *(float32x2_t *)v119.f32, 1), (float32x4_t)0, v116), (float32x4_t)0, v115);
              float32x4_t v101 = vmlaq_f32(vmlaq_f32(vmlaq_lane_f32(vmulq_n_f32(v118, v97.__sinval), v117, *(float32x2_t *)v121.f32, 1), (float32x4_t)0, v116), (float32x4_t)0, v115);
              float32x4_t v102 = vmlaq_f32(vmulq_f32(v118, (float32x4_t)0), (float32x4_t)0, v117);
              float32x4_t v103 = vmlaq_f32(vaddq_f32(v116, v102), (float32x4_t)0, v115);
              float32x4_t v104 = vaddq_f32(v115, vmlaq_f32(v102, (float32x4_t)0, v116));
              uint64_t v40 = objc_msgSend(*((id *)v130 + 15), "warpPreviousDepth:intoCurrentDepth:previousConfidence:intoCurrentConfidence:previousNormals:intoCurrentNormals:usingPoseDelta:previousCalibration:currentCalibration:", *((void *)v130 + 30), *((void *)v130 + 27), *((void *)v130 + 32), *((void *)v130 + 28), 0, 0, *(double *)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v151.columns[0], v100.f32[0]), (float32x4_t)v151.columns[1], *(float32x2_t *)v100.f32, 1), (float32x4_t)v151.columns[2], v100, 2),
                                   (float32x4_t)v151.columns[3],
                                   v100,
                                   3).i64,
                      *(double *)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v151.columns[0], v101.f32[0]), (float32x4_t)v151.columns[1], *(float32x2_t *)v101.f32, 1), (float32x4_t)v151.columns[2], v101, 2), (float32x4_t)v151.columns[3], v101, 3).i64, *(double *)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v151.columns[0], v103.f32[0]), (float32x4_t)v151.columns[1], *(float32x2_t *)v103.f32, 1),
                                     (float32x4_t)v151.columns[2],
                                     v103,
                                     2),
                                   (float32x4_t)v151.columns[3],
                                   v103,
                                   3).i64,
                      *(double *)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v151.columns[0], v104.f32[0]), (float32x4_t)v151.columns[1], *(float32x2_t *)v104.f32, 1), (float32x4_t)v151.columns[2], v104, 2), (float32x4_t)v151.columns[3], v104, 3).i64, *((void *)v130 + 46), objb);
LABEL_166:
              if (v40)
              {
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  v105 = &_os_log_internal;
                  v106 = "failed warping depth";
LABEL_210:
                  _os_log_error_impl(&dword_215F16000, v105, OS_LOG_TYPE_ERROR, v106, buf, 2u);
                  v73 = objb;
                  goto LABEL_204;
                }
              }
              else
              {
                v39 = v65;
                [v140 logPixelBuffer:*((void *)v130 + 27) name:"prevWarpedDepth" timestamp:v23];
                [v140 logPixelBuffer:*((void *)v130 + 28) name:"prevWarpedConf" timestamp:v23];
                uint64_t v40 = [*((id *)v130 + 15) fuseCurrentDepth:*((void *)v130 + 21) previousDepth:*((void *)v130 + 27) intoOutputDepth:*((void *)v130 + 31) currentConfidence:*((void *)v130 + 23) previousConfidence:*((void *)v130 + 28) intoOutputConfidence:*((void *)v130 + 33) currentNormals:0 previousNormals:0 intoOutputNormals:0 usingAlpha:v85];
                if (!v40)
                {
                  v72 = v130;
LABEL_139:
                  [v139 stopWithUTFString:"postprocess warp n fuse"];
                  kdebug_trace();
                  if (v62)
                  {
                    BOOL v64 = v63-- < 1;
                    if (v64) {
                      goto LABEL_144;
                    }
                  }
                  kdebug_trace();
                  [v139 startWithUTFString:"postprocess previous depth"];
                  if (PixelBufferUtils::copyPixelBuffer(*((PixelBufferUtils **)v72 + 30), *((CVPixelBufferRef *)v72 + 31), 0))
                  {
                    v65 = v39;
                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      v82 = &_os_log_internal;
                      v83 = "failed storing previous depth";
LABEL_208:
                      _os_log_error_impl(&dword_215F16000, v82, OS_LOG_TYPE_ERROR, v83, buf, 2u);
                      goto LABEL_158;
                    }
                    goto LABEL_158;
                  }
                  v65 = v39;
                  if (PixelBufferUtils::copyPixelBuffer(*((PixelBufferUtils **)v72 + 32), *((CVPixelBufferRef *)v72 + 33), 0))
                  {
                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      v82 = &_os_log_internal;
                      v83 = "failed storing previous confidence";
                      goto LABEL_208;
                    }
                    goto LABEL_158;
                  }
                  v110 = (PixelBufferUtils *)*((void *)v72 + 34);
                  if (v110)
                  {
                    v111 = (__CVBuffer *)*((void *)v72 + 35);
                    if (v111)
                    {
                      if (PixelBufferUtils::copyPixelBuffer(v110, v111, 0))
                      {
                        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)buf = 0;
                          v82 = &_os_log_internal;
                          v83 = "failed storing previous normals";
                          goto LABEL_208;
                        }
LABEL_158:
                        uint64_t v40 = -22950;
                        v73 = objb;
                        goto LABEL_204;
                      }
                    }
                  }
                  *((float32x4_t *)v72 + 19) = a2;
                  *((float32x4_t *)v72 + 20) = a3;
                  *((float32x4_t *)v72 + 21) = a4;
                  *((float32x4_t *)v72 + 22) = a5;
                  objc_storeStrong((id *)v72 + 46, objb);
                  v74 = "postprocess previous depth";
                  id v75 = v130;
LABEL_116:
                  [v139 stopWithUTFString:v74];
                  kdebug_trace();
                  if (v63 < 1) {
                    char v76 = v62;
                  }
                  else {
                    char v76 = 0;
                  }
                  if ((v76 & 1) == 0)
                  {
                    kdebug_trace();
                    [v139 startWithUTFString:"output rotation"];
                    uint64_t v77 = *((void *)v75 + 10);
                    if (v77 == 3)
                    {
                      uint64_t v77 = 1;
                      v73 = objb;
                    }
                    else
                    {
                      v73 = objb;
                      if (v77 == 1) {
                        uint64_t v77 = 3;
                      }
                    }
                    v65 = v39;
                    v86 = *a12;
                    if (!*a12)
                    {
                      v87 = [*((id *)v75 + 15) processedDepthOutputDescriptor];
                      [v87 sizeForLayout:*((void *)v75 + 5)];
                      CGFloat v90 = v88;
                      if ((v77 | 2) == 3)
                      {
                        CGFloat v91 = v89;
                      }
                      else
                      {
                        CGFloat v91 = v88;
                        CGFloat v90 = v89;
                      }

                      v107 = [*((id *)v130 + 15) processedDepthOutputDescriptor];
                      OSType v108 = [v107 pixelFormat];
                      v153.width = v91;
                      v153.height = v90;
                      *a12 = PixelBufferUtils::createPixelBuffer(v108, v153, 1);

                      v86 = *a12;
                      id v75 = v130;
                    }
                    if (PixelBufferUtils::rotatePixelBuffer(v134, v86, (__CVBuffer *)v77, 0))
                    {
                      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed rotating depth. please verify output buffer dimensions", buf, 2u);
                      }
                      uint64_t v40 = -22950;
                      goto LABEL_204;
                    }
                    objc_msgSend(v75, "convertIntrinsicsFrom:cropBy:to:", a7, *a12, *((double *)v75 + 1), *((double *)v75 + 2), *((double *)v75 + 3), *((double *)v75 + 4));
                    [v140 logPixelBuffer:*a12 name:"depthOutProcessedRotated" timestamp:v23];
                    if (a13)
                    {
                      uint64_t v109 = *((void *)v75 + 10);
                      if (v109 == 3)
                      {
                        uint64_t v109 = 1;
                      }
                      else if (v109 == 1)
                      {
                        uint64_t v109 = 3;
                      }
                      id v75 = v130;
                      v73 = objb;
                      RotatedPixelBuffer = PixelBufferUtils::createRotatedPixelBuffer(v120, (__CVBuffer *)v109, 0);
                      *a13 = RotatedPixelBuffer;
                      [v140 logPixelBuffer:RotatedPixelBuffer name:"confidenceOutProcessedRotated" timestamp:v23];
                    }
                    if (a14)
                    {
                      uint64_t v113 = *((void *)v75 + 10);
                      if (v113 == 3)
                      {
                        uint64_t v113 = 1;
                      }
                      else if (v113 == 1)
                      {
                        uint64_t v113 = 3;
                      }
                      id v75 = v130;
                      v73 = objb;
                      v114 = PixelBufferUtils::createRotatedPixelBuffer(v132, (__CVBuffer *)v113, 0);
                      *a14 = v114;
                      [v140 logPixelBuffer:v114 name:"normalsOutProcessedRotated" timestamp:v23];
                    }
                    [v139 stopWithUTFString:"output rotation"];
                    kdebug_trace();
                    [v75 frameExecutionEnd];
                    goto LABEL_203;
                  }
LABEL_144:
                  v65 = v39;
                  uint64_t v40 = 0;
                  v73 = objb;
LABEL_204:

                  goto LABEL_106;
                }
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  v105 = &_os_log_internal;
                  v106 = "failed fusing depth";
                  goto LABEL_210;
                }
              }
              v73 = objb;
              goto LABEL_204;
            }
            if ([*((id *)v130 + 47) temporalConsistencyMethod] == 2)
            {
              uint64_t v40 = [*((id *)v130 + 15) warpPreviousDepth:*((void *)v130 + 30) intoCurrentDepth:*((void *)v130 + 27) previousConfidence:*((void *)v130 + 32) intoCurrentConfidence:*((void *)v130 + 28) previousNormals:0 intoCurrentNormals:0 usingOpticalFlow:*((void *)v130 + 29)];
              v65 = v39;
              goto LABEL_166;
            }
            v65 = v39;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v92 = &_os_log_internal;
              v93 = "unknown temporal consistency method";
              goto LABEL_187;
            }
LABEL_188:
            uint64_t v40 = -22951;
            v73 = objb;
            goto LABEL_204;
          }
          v65 = v39;
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            goto LABEL_188;
          }
          *(_WORD *)buf = 0;
          v92 = &_os_log_internal;
          v93 = "failed scaling calibration";
        }
        else
        {
          v65 = v39;
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            goto LABEL_188;
          }
          *(_WORD *)buf = 0;
          v92 = &_os_log_internal;
          v93 = "failed rotating calibration";
        }
LABEL_187:
        _os_log_error_impl(&dword_215F16000, v92, OS_LOG_TYPE_ERROR, v93, buf, 2u);
        goto LABEL_188;
      }
      objb = 0;
    }
    v81 = "postprocess depth";
    goto LABEL_134;
  }
  if (v18[289])
  {
    uint64_t obja = v41;
    BOOL v42 = &OBJC_IVAR___ADJasperColorExecutor__itmCurrProcessedFusedDepth;
    v43 = &OBJC_IVAR___ADJasperColorExecutor__itmCurrProcessedFusedConf;
    v44 = &OBJC_IVAR___ADJasperColorExecutor__itmCurrProcessedFusedNormals;
    goto LABEL_58;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "cannot re-enable temporal consistency after executor was prepare without it.", buf, 2u);
  }

  uint64_t v40 = -22951;
LABEL_107:

  v18 = v130;
LABEL_108:
  kdebug_trace();
  objc_sync_exit(v18);

  return v40;
}

- (uint64_t)executeWithColor:(double)a3 pointCloud:(double)a4 outDepthMap:(double)a5 outConfMap:(uint64_t)a6 outNormalsMap:(uint64_t)a7 worldToCameraTransform:(void *)a8 cameraCalibration:(uint64_t)a9
{
  v27[1] = *MEMORY[0x263EF8340];
  id v18 = a8;
  id v19 = a12;
  if (v18)
  {
    v27[0] = v18;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  }
  else
  {
    v20 = 0;
  }
  uint64_t v21 = objc_msgSend(a1, "executeWithColor:colorCameraCalibration:colorWorldToPlatformTransform:pointClouds:lidarCameraCalibration:pointCloudWorldToPlatformTransforms:outDepthMap:outConfMap:outNormalsMap:", a7, v19, v20, 0, 0, a9, a2, a3, a4, a5, a10, a11);
  if (v18) {

  }
  return v21;
}

- (int64_t)executeWithColor:(__CVBuffer *)a3 pointCloud:(id)a4 outDepthMap:(__CVBuffer *)a5 outConfMap:(__CVBuffer *)a6 outNormalsMap:(__CVBuffer *)a7
{
  return -[ADJasperColorExecutor executeWithColor:pointCloud:outDepthMap:outConfMap:outNormalsMap:worldToCameraTransform:cameraCalibration:](self, "executeWithColor:pointCloud:outDepthMap:outConfMap:outNormalsMap:worldToCameraTransform:cameraCalibration:", a3, a4, a5, a6, a7, 0, *MEMORY[0x263EF89A8], *(double *)(MEMORY[0x263EF89A8] + 16), *(double *)(MEMORY[0x263EF89A8] + 32), *(double *)(MEMORY[0x263EF89A8] + 48));
}

- (uint64_t)executeWithColor:(uint64_t)a3 pointCloud:(uint64_t)a4 outDepthMap:(uint64_t)a5 outConfMap:(uint64_t)a6 worldToCameraTransform:(uint64_t)a7 cameraCalibration:
{
  return objc_msgSend(a1, "executeWithColor:pointCloud:outDepthMap:outConfMap:outNormalsMap:worldToCameraTransform:cameraCalibration:", a3, a4, a5, a6, 0, a7);
}

- (int64_t)executeWithColor:(__CVBuffer *)a3 pointCloud:(id)a4 outDepthMap:(__CVBuffer *)a5 outConfMap:(__CVBuffer *)a6
{
  return -[ADJasperColorExecutor executeWithColor:pointCloud:outDepthMap:outConfMap:outNormalsMap:worldToCameraTransform:cameraCalibration:](self, "executeWithColor:pointCloud:outDepthMap:outConfMap:outNormalsMap:worldToCameraTransform:cameraCalibration:", a3, a4, a5, a6, 0, 0, *MEMORY[0x263EF89A8], *(double *)(MEMORY[0x263EF89A8] + 16), *(double *)(MEMORY[0x263EF89A8] + 32), *(double *)(MEMORY[0x263EF89A8] + 48));
}

- (int64_t)prepareForEngineType:(unint64_t)a3 roi:(CGRect)a4 exifOrientation:(unsigned int)a5 rotationPreference:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v13 = self;
  objc_sync_enter(v13);
  kdebug_trace();
  v14 = [(ADJasperColorPipeline *)v13->_pipeline inferenceDescriptor];
  v13->_opticalFlowEnabled = [(ADJasperColorExecutorParameters *)v13->_executorParameters temporalConsistencyMethod] == 2;
  v15 = [v14 colorInput];
  v16 = [v15 imageDescriptor];
  int64_t v17 = -[ADExecutor prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:](v13, "prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:", a3, v16, v7, a6, v14, x, y, width, height);

  if (!v17)
  {
    v13->_firstTimeExecution = 1;
    int64_t v17 = [(ADJasperColorExecutor *)v13 allocateIntermediateBuffers];
    if (v13->_opticalFlowEnabled)
    {
      id v18 = [(ADJasperColorPipeline *)v13->_pipeline LKTTexturesDescriptor];
      id v19 = [[ADLKTExecutor alloc] initWithDescriptor:v18 forLayout:v13->super._layout];
      lktExecutor = v13->_lktExecutor;
      v13->_lktExecutor = v19;
    }
    colorProcessingSession = v13->_colorProcessingSession;
    if (colorProcessingSession)
    {
      PixelBufferUtilsSession::~PixelBufferUtilsSession(colorProcessingSession);
      MEMORY[0x2166C5D90]();
      v13->_colorProcessingSession = 0;
    }
  }

  kdebug_trace();
  objc_sync_exit(v13);

  return v17;
}

- (int64_t)prepareForEngineType:(unint64_t)a3 roi:(CGRect)a4 exifOrientation:(unsigned int)a5 useTemporalConsistency:(BOOL)a6 rotationPreference:(unint64_t)a7
{
  BOOL v7 = a6;
  uint64_t v8 = *(void *)&a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int64_t v17 = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "-[prepareForEngineType:roi:exifOrientation:useTemporalConsistency:rotationPreference:] is deprecated. please use temporalConsistencyMethod property in the executor parameters instead", v17, 2u);
  }
  if (v7) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 0;
  }
  [(ADJasperColorExecutorParameters *)self->_executorParameters setTemporalConsistencyMethod:v15];
  return -[ADJasperColorExecutor prepareForEngineType:roi:exifOrientation:rotationPreference:](self, "prepareForEngineType:roi:exifOrientation:rotationPreference:", a3, v8, 0, x, y, width, height);
}

- (int64_t)prepareForEngineType:(unint64_t)a3 roi:(CGRect)a4 exifOrientation:(unsigned int)a5 useTemporalConsistency:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "-[prepareForEngineType:roi:exifOrientation:useTemporalConsistency:] is deprecated. please use temporalConsistencyMethod property in the executor parameters instead", v15, 2u);
  }
  return -[ADJasperColorExecutor prepareForEngineType:roi:exifOrientation:useTemporalConsistency:rotationPreference:](self, "prepareForEngineType:roi:exifOrientation:useTemporalConsistency:rotationPreference:", a3, v7, v6, 0, x, y, width, height);
}

- (int64_t)prepareForEngineType:(unint64_t)a3 roi:(CGRect)a4 exifOrientation:(unsigned int)a5
{
  return -[ADJasperColorExecutor prepareForEngineType:roi:exifOrientation:rotationPreference:](self, "prepareForEngineType:roi:exifOrientation:rotationPreference:", a3, *(void *)&a5, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (int64_t)allocateIntermediateBuffers
{
  unint64_t v3 = [(ADJasperColorPipeline *)self->_pipeline inferenceDescriptor];
  objc_super v4 = [v3 depthOutput];
  v5 = [v4 imageDescriptor];

  [v5 sizeForLayout:self->super._layout];
  +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", [v5 pixelFormat], &self->_itmPostProcessedDepth, v6, v7);
  uint64_t v8 = [(ADJasperColorPipeline *)self->_pipeline inferenceDescriptor];
  v9 = [v8 confidenceOutput];
  v10 = [v9 imageDescriptor];

  [v10 sizeForLayout:self->super._layout];
  +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", [v10 pixelFormat], &self->_itmPostProcessedConf, v11, v12);
  if (self->_itmPostProcessedDepth && self->_itmPostProcessedConf)
  {
    if ([(ADJasperColorExecutorParameters *)self->_executorParameters doComputeNormals])
    {
      v13 = [(ADJasperColorPipeline *)self->_pipeline processedNormalsOutputDescriptor];
      v14 = v13;
      if (v13)
      {
        [v13 sizeForLayout:self->super._layout];
        +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", [v14 pixelFormat], &self->_itmPostProcessedNormals, v15, v16);
        int v65 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      v14 = 0;
    }
    int v65 = 1;
LABEL_9:
    uint64_t v63 = 289;
    if (self->_opticalFlowEnabled)
    {
      [v5 sizeForLayout:self->super._layout];
      +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", [v5 pixelFormat], &self->_itmPrevProcessedFusedDepth, v18, v19);
      [v5 sizeForLayout:self->super._layout];
      +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", [v5 pixelFormat], &self->_itmWarpedPrevDepth, v20, v21);
      [v5 sizeForLayout:self->super._layout];
      +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", [v5 pixelFormat], &self->_itmCurrProcessedFusedDepth, v22, v23);
      [v10 sizeForLayout:self->super._layout];
      +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", [v10 pixelFormat], &self->_itmPrevProcessedFusedConf, v24, v25);
      [v10 sizeForLayout:self->super._layout];
      +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", [v10 pixelFormat], &self->_itmCurrProcessedFusedConf, v26, v27);
      [v10 sizeForLayout:self->super._layout];
      +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", [v10 pixelFormat], &self->_itmWarpedPrevConf, v28, v29);
      if ((v65 & 1) == 0)
      {
        [v14 sizeForLayout:self->super._layout];
        +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", [v14 pixelFormat], &self->_itmPrevProcessedFusedNormals, v30, v31);
        [v14 sizeForLayout:self->super._layout];
        +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", [v14 pixelFormat], &self->_itmCurrProcessedFusedNormals, v32, v33);
      }
      v34 = [(ADJasperColorPipeline *)self->_pipeline LKTTexturesDescriptor];
      long long v35 = [v34 shiftmapDescriptor];

      [v35 sizeForLayout:self->super._layout];
      +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", [v35 pixelFormat], &self->_itmOpticalFlow, v36, v37);
    }
    [(ADJasperColorExecutor *)self deallocateEspressoBuffers];
    espressoRunner = self->super._espressoRunner;
    v39 = [(ADJasperColorPipeline *)self->_pipeline inferenceDescriptor];
    uint64_t v40 = [v39 colorInput];
    self->_itmPreProcessedColor = (__CVBuffer *)[(ADEspressoRunner *)espressoRunner createAndRegisterPixelBufferForDescriptor:v40];

    uint64_t v41 = self->super._espressoRunner;
    BOOL v42 = [(ADJasperColorPipeline *)self->_pipeline inferenceDescriptor];
    v43 = [v42 jasperInput];
    self->_itmPreProcessedJasper = (__CVBuffer *)[(ADEspressoRunner *)v41 createAndRegisterPixelBufferForDescriptor:v43];

    v44 = self->super._espressoRunner;
    uint64_t v45 = [(ADJasperColorPipeline *)self->_pipeline inferenceDescriptor];
    int v46 = [v45 depthOutput];
    self->_itmUnprocessedDepth = (__CVBuffer *)[(ADEspressoRunner *)v44 createAndRegisterPixelBufferForDescriptor:v46];

    double v47 = self->super._espressoRunner;
    double v48 = [(ADJasperColorPipeline *)self->_pipeline inferenceDescriptor];
    v49 = [v48 confidenceOutput];
    self->_itmUnprocessedConf = (__CVBuffer *)[(ADEspressoRunner *)v47 createAndRegisterPixelBufferForDescriptor:v49];

    if (self->_itmPreProcessedColor
      && self->_itmPreProcessedJasper
      && self->_itmUnprocessedDepth
      && self->_itmUnprocessedConf)
    {
      if ([(ADJasperColorExecutorParameters *)self->_executorParameters doComputeNormals])
      {
        uint64_t v50 = [(ADJasperColorPipeline *)self->_pipeline inferenceDescriptor];
        int v51 = [v50 normalsOutput];

        if (v51)
        {
          double v52 = self->super._espressoRunner;
          double v53 = [(ADJasperColorPipeline *)self->_pipeline inferenceDescriptor];
          v54 = [v53 normalsOutput];
          self->_itmUnprocessedNormals = (__CVBuffer *)[(ADEspressoRunner *)v52 createAndRegisterPixelBufferForDescriptor:v54];
        }
      }
      if (!*((unsigned char *)&self->super.super.isa + v64))
      {
LABEL_27:
        if (![(ADJasperColorExecutorParameters *)self->_executorParameters doComputeNormals]
          || v65
          && ([(ADJasperColorPipeline *)self->_pipeline inferenceDescriptor],
              uint64_t v60 = objc_claimAutoreleasedReturnValue(),
              [v60 normalsOutput],
              uint64_t v61 = objc_claimAutoreleasedReturnValue(),
              v61,
              v60,
              !v61)
          || self->_itmUnprocessedNormals
          && self->_itmPostProcessedNormals
          && (!*((unsigned char *)&self->super.super.isa + v64)
           || self->_itmCurrProcessedFusedNormals && self->_itmPrevProcessedFusedNormals))
        {
          int64_t v17 = 0;
LABEL_37:

          goto LABEL_38;
        }
LABEL_39:
        [(ADJasperColorExecutor *)self deallocateEspressoBuffers];
        int64_t v17 = -22965;
        goto LABEL_37;
      }
      size_t v55 = [(ADJasperColorPipeline *)self->_pipeline inferenceDescriptor];
      size_t v56 = [v55 alphaMapOutput];

      if (!v56) {
        goto LABEL_42;
      }
      v57 = self->super._espressoRunner;
      size_t v58 = [(ADJasperColorPipeline *)self->_pipeline inferenceDescriptor];
      size_t v59 = [v58 alphaMapOutput];
      self->_itmUnprocessedAlpha = (__CVBuffer *)[(ADEspressoRunner *)v57 createAndRegisterPixelBufferForDescriptor:v59];

      if (self->_itmUnprocessedAlpha)
      {
LABEL_42:
        if (*((unsigned char *)&self->super.super.isa + v64)
          && (!self->_itmCurrProcessedFusedDepth || !self->_itmPrevProcessedFusedDepth || !self->_itmOpticalFlow))
        {
          goto LABEL_39;
        }
        goto LABEL_27;
      }
    }
    [(ADJasperColorExecutor *)self deallocateEspressoBuffers];
    int64_t v17 = -22971;
    goto LABEL_37;
  }
  int64_t v17 = -22965;
LABEL_38:

  return v17;
}

- (void)deallocateEspressoBuffers
{
  self->_itmPreProcessedColor = 0;
  CVPixelBufferRelease(self->_itmPreProcessedJasper);
  self->_itmPreProcessedJasper = 0;
  CVPixelBufferRelease(self->_itmUnprocessedDepth);
  self->_itmUnprocessedDepth = 0;
  CVPixelBufferRelease(self->_itmUnprocessedConf);
  self->_itmUnprocessedConf = 0;
  CVPixelBufferRelease(self->_itmUnprocessedNormals);
  self->_itmUnprocessedNormals = 0;
  CVPixelBufferRelease(self->_itmUnprocessedAlpha);
  self->_itmUnprocessedAlpha = 0;
}

- (ADJasperColorExecutor)initWithInputPrioritization:(int64_t)a3 parameters:(id)a4
{
  id v6 = a4;
  int v15 = 335686668;
  long long v16 = 0u;
  long long v17 = 0u;
  kdebug_trace();
  v14.receiver = self;
  v14.super_class = (Class)ADJasperColorExecutor;
  double v7 = [(ADExecutor *)&v14 init];
  if (v7)
  {
    if (!v6) {
      id v6 = (id)objc_opt_new();
    }
    uint64_t v8 = [ADJasperColorPipeline alloc];
    v9 = [v6 pipelineParameters];
    uint64_t v10 = [(ADJasperColorPipeline *)v8 initWithInputPrioritization:a3 andParameters:v9];
    pipeline = v7->_pipeline;
    v7->_pipeline = (ADJasperColorPipeline *)v10;

    if (!v7->_pipeline)
    {
      double v12 = 0;
      goto LABEL_8;
    }
    objc_storeStrong((id *)&v7->_executorParameters, v6);
    v7->_colorProcessingSession = 0;
    v7->_itmPreProcessedColor = 0;
    v7->_itmPreProcessedJasper = 0;
    v7->_itmUnprocessedDepth = 0;
    v7->_itmPostProcessedDepth = 0;
    v7->_itmUnprocessedConf = 0;
    v7->_itmPostProcessedConf = 0;
    v7->_itmUnprocessedNormals = 0;
    v7->_itmPostProcessedNormals = 0;
    v7->_itmUnprocessedAlpha = 0;
    v7->_itmPrevProcessedFusedDepth = 0;
    v7->_itmPrevProcessedFusedConf = 0;
    v7->_itmCurrProcessedFusedConf = 0;
    v7->_itmWarpedPrevDepth = 0;
    v7->_itmWarpedPrevConf = 0;
    v7->_itmPrevProcessedFusedNormals = 0;
    v7->_itmOpticalFlow = 0;
    v7->_firstTimeExecution = 1;
    v7->_opticalFlowEnabled = 0;
  }
  double v12 = v7;
LABEL_8:
  kdebug_trace();

  return v12;
}

- (ADJasperColorExecutor)initWithInputPrioritization:(int64_t)a3
{
  v5 = objc_opt_new();
  id v6 = [(ADJasperColorExecutor *)self initWithInputPrioritization:a3 parameters:v5];

  return v6;
}

@end