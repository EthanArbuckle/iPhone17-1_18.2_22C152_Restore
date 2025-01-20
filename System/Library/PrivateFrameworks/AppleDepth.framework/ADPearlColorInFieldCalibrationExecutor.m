@interface ADPearlColorInFieldCalibrationExecutor
- (ADCameraCalibration)colorCameraCalibration;
- (ADCameraCalibration)pearlCameraCalibration;
- (ADPearlColorInFieldCalibrationExecutor)init;
- (ADPearlColorInFieldCalibrationExecutorParameters)executorParameters;
- (ADPearlColorInFieldCalibrationPipeline)pipeline;
- (BOOL)normalizedDX:(__CVBuffer *)a3 toDepth:(__CVBuffer *)a4 withMultiplier:(double)a5 andOffset:(double)a6;
- (__n128)setVmcamToWmcamExtrinsics:(__n128)a3;
- (__n128)vmcamToWmcamExtrinsics;
- (__n128)wmcamToMcamExtrinsics;
- (double)rectifyColorCameraExtrinsics:(float32x4_t)a3;
- (id)initForEngineType:(unint64_t)a3;
- (id)initForEngineType:(unint64_t)a3 andExecutorParameters:(id)a4;
- (int64_t)allocateIntermediateBuffers;
- (int64_t)clearFeaturesAggregator;
- (int64_t)executePreprocessedInputsWithInterSessionData:(id)a3 outResult:(id)a4;
- (int64_t)numberOfExecutionSteps;
- (int64_t)prepare;
- (uint64_t)preprocessInputColorFrame:(__n128)a3 pearlDepth:(__n128)a4 pearlPoses:(__n128)a5 pceCameraCalibration:(double)a6 pearlCameraCalibrationTransform:(double)a7 colorCameraCalibration:(double)a8 timestamp:(double)a9;
- (uint64_t)preprocessInputColorFrame:(double)a3 pearlNormalizedDX:(double)a4 pearlPoses:(double)a5 disparityNormalizationMultiplier:(double)a6 disparityNormalizationOffset:(double)a7 pceCameraCalibration:(uint64_t)a8 pearlCameraCalibrationTransform:(uint64_t)a9 colorCameraCalibration:(__CVBuffer *)a10 timestamp:(void *)a11;
- (uint64_t)setWmcamToMcamExtrinsics:(float32x4_t)a3;
- (void)dealloc;
- (void)deallocateEspressoBuffers;
- (void)setColorCameraCalibration:(id)a3;
- (void)setExecutorParameters:(id)a3;
- (void)setPearlCameraCalibration:(id)a3;
@end

@implementation ADPearlColorInFieldCalibrationExecutor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pearlCameraCalibration, 0);
  objc_storeStrong((id *)&self->_colorCameraCalibration, 0);
  objc_storeStrong((id *)&self->_executorParameters, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
  objc_storeStrong((id *)&self->_preprocessedPearlMetadata, 0);
  objc_storeStrong((id *)&self->_preprocessedColorMetadata, 0);
  objc_storeStrong((id *)&self->_frontendErrorZOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendErrorYOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendErrorXOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendRotationZOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendRotationYOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendRotationXOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendFeaturesInputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_featuresOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_mcamPCameraCalibration, 0);
  objc_storeStrong((id *)&self->_frontendEspressoRunner, 0);
  objc_storeStrong((id *)&self->_backendEspressoRunner, 0);
}

- (__n128)wmcamToMcamExtrinsics
{
  return a1[30];
}

- (__n128)setVmcamToWmcamExtrinsics:(__n128)a3
{
  result[26] = a2;
  result[27] = a3;
  result[28] = a4;
  result[29] = a5;
  return result;
}

- (__n128)vmcamToWmcamExtrinsics
{
  return a1[26];
}

- (ADCameraCalibration)pearlCameraCalibration
{
  return self->_pearlCameraCalibration;
}

- (ADCameraCalibration)colorCameraCalibration
{
  return self->_colorCameraCalibration;
}

- (void)setExecutorParameters:(id)a3
{
}

- (ADPearlColorInFieldCalibrationExecutorParameters)executorParameters
{
  return self->_executorParameters;
}

- (ADPearlColorInFieldCalibrationPipeline)pipeline
{
  return self->_pipeline;
}

- (int64_t)numberOfExecutionSteps
{
  return 6;
}

- (int64_t)clearFeaturesAggregator
{
  self->_backendResultAggregationCounter = 0;
  return 0;
}

- (int64_t)executePreprocessedInputsWithInterSessionData:(id)a3 outResult:(id)a4
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (self->_preProcessInputColorFrameDone)
  {
    v8 = [(ADExecutorParameters *)self->_executorParameters logger];
    v9 = [v6 persistenceData];
    [v8 logDictionary:v9 name:"inputIntersessionData" timestamp:self->_lastColorTimestamp];

    self->_preProcessInputColorFrameDone = 0;
    [v7 setExecuted:0];
    if (self->_isPrepared)
    {
      if (self->_backendEspressoRunner && self->_frontendEspressoRunner)
      {
        if (v7)
        {
          int64_t v10 = [(ADPearlColorInFieldCalibrationExecutor *)self numberOfExecutionSteps];
          int64_t v11 = [(ADExecutorParameters *)self->_executorParameters stepsToSkip];
          BOOL v12 = [(ADExecutorParameters *)self->_executorParameters powerMeasureMode];
          v89 = [(ADExecutorParameters *)self->_executorParameters timeProfiler];
          uint64_t v88 = v10 - v11;
          if (v12 && v88-- < 1)
          {
            int64_t v16 = 0;
LABEL_33:

            goto LABEL_34;
          }
          kdebug_trace();
          [v89 startWithUTFString:"first network execution"];
          [(ADExecutor *)self frameExecutionStart];
          v14 = [(ADExecutorParameters *)self->_executorParameters timeProfiler];
          [v14 start:@"BackendProcess"];

          unint64_t v15 = +[ADTimeProfiler currentTimeUsec];
          int64_t v16 = [(ADEspressoRunner *)self->_backendEspressoRunner execute];
          unint64_t v17 = +[ADTimeProfiler currentTimeUsec];
          if (v16)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed executing backend", buf, 2u);
            }
            goto LABEL_33;
          }
          unint64_t v18 = v17;
          v19 = [(ADExecutorParameters *)self->_executorParameters timeProfiler];
          BOOL v86 = v12;
          [v19 stop:@"BackendProcess"];

          v87 = [v6 inFieldCalibrationTelemetryData];
          [v87 reportBackendRunTime:v18 - v15];
          v20 = [(ADExecutorParameters *)self->_executorParameters logger];
          objc_msgSend(v20, "logRawBuffer:size:name:timestamp:", -[ADEspressoBufferHandle data](self->_featuresOutputEspressoBufferHandle, "data"), self->_backendSingleResultSize, "featureVectorItr", self->_lastColorTimestamp);

          memcpy((char *)self->_backendResultAggregated+ self->_backendSingleResultSize * self->_backendResultAggregationCounter, (const void *)[(ADEspressoBufferHandle *)self->_featuresOutputEspressoBufferHandle data], self->_backendSingleResultSize);
          unsigned int v21 = self->_backendResultAggregationCounter + 1;
          self->_backendResultAggregationCounter = v21;
          v22 = [(ADPearlColorInFieldCalibrationExecutorParameters *)self->_executorParameters pipelineParameters];
          LODWORD(v20) = [v22 featuresVectorAggregationSize];

          if (v21 != v20)
          {

            id v7 = 0;
            v30 = "first network execution";
LABEL_30:
            [v89 stopWithUTFString:v30];
            kdebug_trace();
            [(ADExecutor *)self frameExecutionEnd];
            goto LABEL_31;
          }
          v23 = [(ADExecutorParameters *)self->_executorParameters timeProfiler];
          [v23 start:@"FrontendProcess"];

          unint64_t v85 = +[ADTimeProfiler currentTimeUsec];
          self->_backendResultAggregationCounter = 0;
          [v89 stopWithUTFString:"first network execution"];
          kdebug_trace();
          if (v12)
          {
            if (v88 < 1) {
              goto LABEL_31;
            }
            --v88;
          }
          kdebug_trace();
          [v89 startWithUTFString:"preprocess features"];
          pipeline = self->_pipeline;
          backendResultAggregated = self->_backendResultAggregated;
          uint64_t v26 = [(ADEspressoBufferHandle *)self->_frontendFeaturesInputEspressoBufferHandle data];
          v27 = [(ADEspressoBufferHandle *)self->_featuresOutputEspressoBufferHandle dimensions];
          int64_t v16 = [(ADPearlColorInFieldCalibrationPipeline *)pipeline processIntermediateResultsWithBackendFeaturesOutputVector:backendResultAggregated frontendEspressoFeaturesInput:v26 dimensions:v27];

          if (v16)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v28 = &_os_log_internal;
              v29 = "failed processing intermediate results (backend features vector output to frontend features input)";
LABEL_41:
              _os_log_error_impl(&dword_215F16000, v28, OS_LOG_TYPE_ERROR, v29, buf, 2u);
              goto LABEL_32;
            }
            goto LABEL_32;
          }
          [v89 stopWithUTFString:"preprocess features"];
          kdebug_trace();
          if (v12)
          {
            if (v88 < 1) {
              goto LABEL_31;
            }
            --v88;
          }
          kdebug_trace();
          [v89 startWithUTFString:"second network execution"];
          int64_t v16 = [(ADEspressoRunner *)self->_frontendEspressoRunner execute];
          if (v16)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v28 = &_os_log_internal;
              v29 = "failed executing frontend";
              goto LABEL_41;
            }
LABEL_32:

            goto LABEL_33;
          }
          unint64_t v32 = +[ADTimeProfiler currentTimeUsec];
          v33 = [(ADExecutorParameters *)self->_executorParameters timeProfiler];
          [v33 stop:@"FrontendProcess"];

          [v87 reportFrontendRunTime:v32 - v85];
          uint64_t v34 = [(ADEspressoBufferHandle *)self->_frontendFeaturesInputEspressoBufferHandle dimensionsProduct];
          unint64_t frontendFeaturesInputElementSize = self->_frontendFeaturesInputElementSize;
          v36 = [(ADExecutorParameters *)self->_executorParameters logger];
          objc_msgSend(v36, "logRawBuffer:size:name:timestamp:", -[ADEspressoBufferHandle data](self->_frontendFeaturesInputEspressoBufferHandle, "data"), frontendFeaturesInputElementSize * v34, "featureVectorAvg", self->_lastColorTimestamp);

          [v89 stopWithUTFString:"second network execution"];
          kdebug_trace();
          BOOL v37 = v86;
          if (v88 >= 1) {
            BOOL v37 = 0;
          }
          if (!v37)
          {
            kdebug_trace();
            [v89 startWithUTFString:"postprocess rotation"];
            v38 = [(ADExecutorParameters *)self->_executorParameters timeProfiler];
            [v38 start:@"PostProcess"];

            int64_t v16 = [(ADPearlColorInFieldCalibrationPipeline *)self->_pipeline postProcessFrontendOutputX:[(ADEspressoBufferHandle *)self->_frontendRotationXOutputEspressoBufferHandle data] frontendOutputY:[(ADEspressoBufferHandle *)self->_frontendRotationYOutputEspressoBufferHandle data] frontendOutputZ:[(ADEspressoBufferHandle *)self->_frontendRotationZOutputEspressoBufferHandle data] frontendOutputErrorX:[(ADEspressoBufferHandle *)self->_frontendErrorXOutputEspressoBufferHandle data] frontendOutputErrorY:[(ADEspressoBufferHandle *)self->_frontendErrorYOutputEspressoBufferHandle data] frontendOutputErrorZ:[(ADEspressoBufferHandle *)self->_frontendErrorZOutputEspressoBufferHandle data] interSessionData:v6 pearlColorInFieldCalibrationResult:v7];
            if (v16)
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                goto LABEL_32;
              }
              *(_WORD *)buf = 0;
              v28 = &_os_log_internal;
              v29 = "failed post processing pipeline results";
              goto LABEL_41;
            }
            v39 = [(ADExecutorParameters *)self->_executorParameters timeProfiler];
            [v39 stop:@"PostProcess"];

            v40 = [(ADExecutorParameters *)self->_executorParameters logger];
            v41 = [v7 dictionaryRepresentation];
            [v40 logDictionary:v41 name:"internalUseResults" timestamp:self->_lastColorTimestamp];

            v42 = [(ADExecutorParameters *)self->_executorParameters logger];
            [v7 pearlToColorExtrinsics];
            objc_msgSend(v42, "logMatrix4x3:name:timestamp:", "depthToColorExtrinsics");

            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              [v7 preRelative2FactoryX];
              float v44 = v43;
              [v7 preRelative2FactoryY];
              float v46 = v45;
              [v7 preRelative2FactoryZ];
              *(_DWORD *)buf = 134218496;
              *(double *)v91 = v44;
              *(_WORD *)&v91[8] = 2048;
              *(double *)&v91[10] = v46;
              __int16 v92 = 2048;
              double v93 = v47;
              _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration run results relative to factory [%f, %f, %f]", buf, 0x20u);
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              [v7 postRelative2FactoryX];
              float v49 = v48;
              [v7 postRelative2FactoryY];
              float v51 = v50;
              [v7 postRelative2FactoryZ];
              *(_DWORD *)buf = 134218496;
              *(double *)v91 = v49;
              *(_WORD *)&v91[8] = 2048;
              *(double *)&v91[10] = v51;
              __int16 v92 = 2048;
              double v93 = v52;
              _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration run results relative to factory post ISF [%f, %f, %f]", buf, 0x20u);
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              [v7 deltaRotationX];
              float v54 = v53;
              [v7 deltaRotationY];
              float v56 = v55;
              [v7 deltaRotationZ];
              *(_DWORD *)buf = 134218496;
              *(double *)v91 = v54;
              *(_WORD *)&v91[8] = 2048;
              *(double *)&v91[10] = v56;
              __int16 v92 = 2048;
              double v93 = v57;
              _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration run results relative to previouse [%f, %f, %f]", buf, 0x20u);
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              [v7 postRelative2PrevX];
              float v59 = v58;
              [v7 postRelative2PrevY];
              float v61 = v60;
              [v7 postRelative2PrevZ];
              *(_DWORD *)buf = 134218496;
              *(double *)v91 = v59;
              *(_WORD *)&v91[8] = 2048;
              *(double *)&v91[10] = v61;
              __int16 v92 = 2048;
              double v93 = v62;
              _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration run results relative to previouse post ISF [%f, %f, %f]", buf, 0x20u);
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              [v7 absoluteRotationX];
              float v64 = v63;
              [v7 absoluteRotationY];
              float v66 = v65;
              [v7 absoluteRotationZ];
              *(_DWORD *)buf = 134218496;
              *(double *)v91 = v64;
              *(_WORD *)&v91[8] = 2048;
              *(double *)&v91[10] = v66;
              __int16 v92 = 2048;
              double v93 = v67;
              _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration run results absolute [%f, %f, %f]", buf, 0x20u);
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              [v7 absoluteRotationPostISFX];
              float v69 = v68;
              [v7 absoluteRotationPostISFY];
              float v71 = v70;
              [v7 absoluteRotationPostISFZ];
              *(_DWORD *)buf = 134218496;
              *(double *)v91 = v69;
              *(_WORD *)&v91[8] = 2048;
              *(double *)&v91[10] = v71;
              __int16 v92 = 2048;
              double v93 = v72;
              _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration run results absolute post ISF [%f, %f, %f]", buf, 0x20u);
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              [v7 factoryRotationX];
              float v74 = v73;
              [v7 factoryRotationY];
              float v76 = v75;
              [v7 factoryRotationZ];
              *(_DWORD *)buf = 134218496;
              *(double *)v91 = v74;
              *(_WORD *)&v91[8] = 2048;
              *(double *)&v91[10] = v76;
              __int16 v92 = 2048;
              double v93 = v77;
              _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration run factory [%f, %f, %f]", buf, 0x20u);
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              [v7 stdX];
              float v79 = v78;
              [v7 stdY];
              float v81 = v80;
              [v7 stdZ];
              *(_DWORD *)buf = 134218496;
              *(double *)v91 = v79;
              *(_WORD *)&v91[8] = 2048;
              *(double *)&v91[10] = v81;
              __int16 v92 = 2048;
              double v93 = v82;
              _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration run std [%f, %f, %f]", buf, 0x20u);
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              int v83 = [v7 executed];
              [v7 confidence];
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v91 = v83;
              *(_WORD *)&v91[4] = 2048;
              *(double *)&v91[6] = v84;
              _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration run executed: %d with std: %f]", buf, 0x12u);
            }
            [v87 increaseRunTimesByOne];
            objc_msgSend(v87, "updateLastExecutionTime:", +[ADTimeProfiler currentTimeUsec](ADTimeProfiler, "currentTimeUsec"));
            if ([(ADPearlColorInFieldCalibrationExecutorParameters *)self->_executorParameters reportTelemetry])
            {
              [(ADPearlColorInFieldCalibrationPipeline *)self->_pipeline reportTelemetry:v7 withInterSessionData:v6];
              [v87 reset];
            }
            v30 = "postprocess rotation";
            goto LABEL_30;
          }
LABEL_31:
          int64_t v16 = 0;
          goto LABEL_32;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "must provide a pointer to ADPearlColorInFieldCalibrationResult", buf, 2u);
        }
        id v7 = 0;
        int64_t v16 = -22953;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed preparing executor", buf, 2u);
        }
        int64_t v16 = -22960;
      }
    }
    else
    {
      int64_t v16 = -22970;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "running executeForPreprocesed before preProcessInputColorFrame called", buf, 2u);
    }
    int64_t v16 = -22961;
  }
LABEL_34:

  return v16;
}

- (uint64_t)preprocessInputColorFrame:(__n128)a3 pearlDepth:(__n128)a4 pearlPoses:(__n128)a5 pceCameraCalibration:(double)a6 pearlCameraCalibrationTransform:(double)a7 colorCameraCalibration:(double)a8 timestamp:(double)a9
{
  id v20 = a13;
  int v51 = 335684824;
  long long v52 = 0u;
  long long v53 = 0u;
  id v45 = a14;
  kdebug_trace();
  *(unsigned char *)(a1 + 152) = 0;
  *(void *)(a1 + 288) = a17;
  unsigned int v21 = [*(id *)(a1 + 392) logger];
  objc_msgSend(v21, "logMatrix4x4:name:timestamp:", "inputIrToDepthTransform", a6, a7, a8, a9, *(double *)(a1 + 288));

  [(id)a1 setColorCameraCalibration:v45];
  [(id)a1 setPearlCameraCalibration:v20];
  uint64_t v22 = [(id)a1 numberOfExecutionSteps];
  uint64_t v23 = [*(id *)(a1 + 392) stepsToSkip];
  int v24 = [*(id *)(a1 + 392) powerMeasureMode];
  v25 = [*(id *)(a1 + 392) timeProfiler];
  uint64_t v26 = v22 - v23;
  if (v24 && (BOOL v27 = v26 < 1, --v26, v27))
  {
    uint64_t v30 = 0;
  }
  else
  {
    kdebug_trace();
    [v25 startWithUTFString:"preprocess pearl"];
    [(id)a1 frameExecutionStart];
    v28 = [*(id *)(a1 + 392) timeProfiler];
    [v28 start:@"preprocessColor"];

    v29 = [*(id *)(a1 + 392) logger];
    [v29 logPixelBuffer:a11 name:"inputColor" timestamp:*(double *)(a1 + 288)];

    uint64_t v30 = [*(id *)(a1 + 384) preProcessColor:a11 processedColor:*(void *)(a1 + 160) referenceCameraCalibration:*(void *)(a1 + 144) colorCameraCalibration:*(void *)(a1 + 400)];
    if (v30)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "preProcessColor failed", buf, 2u);
      }
    }
    else
    {
      v31 = [*(id *)(a1 + 392) logger];
      [v31 logPixelBuffer:*(void *)(a1 + 160) name:"processedColor" timestamp:*(double *)(a1 + 288)];

      unint64_t v32 = [*(id *)(a1 + 392) timeProfiler];
      [v32 stop:@"preprocessColor"];

      [v25 stopWithUTFString:"preprocess pearl"];
      kdebug_trace();
      if (v26 < 1) {
        char v33 = v24;
      }
      else {
        char v33 = 0;
      }
      if (v33)
      {
        uint64_t v30 = 0;
      }
      else
      {
        kdebug_trace();
        [v25 startWithUTFString:"preprocess color"];
        uint64_t v34 = [*(id *)(a1 + 392) timeProfiler];
        [v34 start:@"ProjectPearlPoints"];

        v35 = [*(id *)(a1 + 392) logger];
        [v35 logPixelBuffer:a12 name:"inputPearl" timestamp:*(double *)(a1 + 288)];

        objc_msgSend(*(id *)(a1 + 384), "setPearlToColorCurrentTransform:", a6, a7, a8, a9);
        uint64_t v30 = objc_msgSend(*(id *)(a1 + 384), "preProcessPearl:pose:prevPose:referenceCameraCalibration:pearlCameraCalibration:reprojectedPointsBuffer:reprojectedPointsMaskBuffer:", a12, *(void *)(a1 + 144), *(void *)(a1 + 408), *(void *)(a1 + 168), *(void *)(a1 + 176), a2.n128_f64[0], a3.n128_f64[0], a4.n128_f64[0], a5.n128_f64[0], *(double *)(a1 + 320), *(double *)(a1 + 336), *(double *)(a1 + 352), *(double *)(a1 + 368));
        *(__n128 *)(a1 + 320) = a2;
        *(__n128 *)(a1 + 336) = a3;
        *(__n128 *)(a1 + 352) = a4;
        *(__n128 *)(a1 + 368) = a5;
        v36 = [*(id *)(a1 + 392) timeProfiler];
        [v36 stop:@"ProjectPearlPoints"];

        if (v30)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "preProcessPearl failed", buf, 2u);
          }
        }
        else
        {
          BOOL v37 = [*(id *)(a1 + 392) logger];
          [v37 logPixelBuffer:*(void *)(a1 + 168) name:"pearlProcessed" timestamp:*(double *)(a1 + 288)];

          v38 = [*(id *)(a1 + 392) logger];
          [v38 logPixelBuffer:*(void *)(a1 + 176) name:"pearlMaskProcessed" timestamp:*(double *)(a1 + 288)];

          uint64_t v30 = 0;
          *(unsigned char *)(a1 + 152) = 1;
        }
      }
    }
  }

  kdebug_trace();
  return v30;
}

- (uint64_t)preprocessInputColorFrame:(double)a3 pearlNormalizedDX:(double)a4 pearlPoses:(double)a5 disparityNormalizationMultiplier:(double)a6 disparityNormalizationOffset:(double)a7 pceCameraCalibration:(uint64_t)a8 pearlCameraCalibrationTransform:(uint64_t)a9 colorCameraCalibration:(__CVBuffer *)a10 timestamp:(void *)a11
{
  id v29 = a11;
  id v30 = a12;
  size_t Width = CVPixelBufferGetWidth(a10);
  size_t Height = CVPixelBufferGetHeight(a10);
  CVPixelBufferRef pixelBufferOut = 0;
  CFDictionaryRef BufferAttributes = (const __CFDictionary *)getBufferAttributes();
  CVReturn v34 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], Width, Height, 0x31332E33u, BufferAttributes, &pixelBufferOut);
  v35 = pixelBufferOut;
  if (v34) {
    BOOL v36 = 1;
  }
  else {
    BOOL v36 = pixelBufferOut == 0;
  }
  if (v36)
  {
    uint64_t v37 = -22950;
  }
  else
  {
    [a1 normalizedDX:a10 toDepth:pixelBufferOut withMultiplier:a6 andOffset:a7];
    uint64_t v37 = objc_msgSend(a1, "preprocessInputColorFrame:pearlDepth:pearlPoses:pceCameraCalibration:pearlCameraCalibrationTransform:colorCameraCalibration:timestamp:", a9, v35, v29, v30, a2, a3, a4, a5, a17, a19, a21, a23, a25);
    CVPixelBufferRelease(v35);
  }

  return v37;
}

- (BOOL)normalizedDX:(__CVBuffer *)a3 toDepth:(__CVBuffer *)a4 withMultiplier:(double)a5 andOffset:(double)a6
{
  size_t Width = CVPixelBufferGetWidth(a3);
  if (Width != CVPixelBufferGetWidth(a4)) {
    return 0;
  }
  size_t Height = CVPixelBufferGetHeight(a3);
  if (Height != CVPixelBufferGetHeight(a4)
    || CVPixelBufferGetPixelFormatType(a3) != 825306677
    || CVPixelBufferGetPixelFormatType(a4) != 825437747)
  {
    return 0;
  }
  size_t v12 = CVPixelBufferGetWidth(a3);
  size_t v13 = CVPixelBufferGetHeight(a3);
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
  int v15 = CVPixelBufferGetBytesPerRow(a3);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(a4, 1uLL);
  BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a3);
  unint64_t v17 = CVPixelBufferGetBaseAddress(a4);
  if (v13 && v12)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      size_t v21 = v12;
      do
      {
        unsigned int v23 = *BaseAddress;
        if (v23 == 0x1FFF) {
          __int16 v22 = 0;
        }
        else {
          __int16 v22 = vcvtd_n_s64_f64(1.0 / (a6 + (double)v23 * a5) * 1000.0, 3uLL);
        }
        *v17++ = v22;
        ++BaseAddress;
        --v21;
      }
      while (v21);
      BaseAddress += (unsigned __int16)((unint64_t)(v15 - 2 * v12) >> 1);
      v17 += (unsigned __int16)((unint64_t)(BytesPerRow - 2 * v12) >> 1);
    }
  }
  BOOL v19 = 1;
  CVPixelBufferUnlockBaseAddress(a4, 1uLL);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  return v19;
}

- (uint64_t)setWmcamToMcamExtrinsics:(float32x4_t)a3
{
  uint32x4_t v5 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(result + 496), a3), (int8x16_t)vceqq_f32(*(float32x4_t *)(result + 480), a2)), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(result + 512), a4), (int8x16_t)vceqq_f32(*(float32x4_t *)(result + 528), a5)));
  v5.i32[3] = v5.i32[2];
  if ((vminvq_u32(v5) & 0x80000000) == 0)
  {
    *(float32x4_t *)(result + 480) = a2;
    *(float32x4_t *)(result + 496) = a3;
    *(float32x4_t *)(result + 512) = a4;
    *(float32x4_t *)(result + 528) = a5;
    return objc_msgSend(*(id *)(result + 384), "updateWmcamToMcamExtrinsics:");
  }
  return result;
}

- (void)setColorCameraCalibration:(id)a3
{
  id v13 = a3;
  v4 = [(ADExecutorParameters *)self->_executorParameters logger];
  [v4 logCalibration:v13 name:"inputColorCalibration" timestamp:self->_lastColorTimestamp];

  colorCameraCalibration = self->_colorCameraCalibration;
  if (!colorCameraCalibration || ([(ADCameraCalibration *)colorCameraCalibration isEqual:v13] & 1) == 0)
  {
    id v6 = (ADCameraCalibration *)[v13 copy];
    id v7 = self->_colorCameraCalibration;
    self->_colorCameraCalibration = v6;

    pipeline = self->_pipeline;
    v9 = self->_colorCameraCalibration;
    [(ADCameraCalibration *)v9 cameraToPlatformTransform];
    -[ADPearlColorInFieldCalibrationExecutor rectifyColorCameraExtrinsics:](self, "rectifyColorCameraExtrinsics:");
    -[ADPearlColorInFieldCalibrationPipeline createReferenceCameraForColor:withExtrinsics:](pipeline, "createReferenceCameraForColor:withExtrinsics:", v9);
    int64_t v10 = (ADCameraCalibration *)objc_claimAutoreleasedReturnValue();
    mcamPCameraCalibration = self->_mcamPCameraCalibration;
    self->_mcamPCameraCalibration = v10;

    size_t v12 = [(ADExecutorParameters *)self->_executorParameters logger];
    [v12 logCalibration:self->_mcamPCameraCalibration name:"referenceColorCameraCalibration" timestamp:self->_lastColorTimestamp];
  }
}

- (void)setPearlCameraCalibration:(id)a3
{
  id v8 = a3;
  v4 = [(ADExecutorParameters *)self->_executorParameters logger];
  [v4 logCalibration:v8 name:"inputPearlCalibration" timestamp:self->_lastColorTimestamp];

  pearlCameraCalibration = self->_pearlCameraCalibration;
  if (!pearlCameraCalibration || ([(ADCameraCalibration *)pearlCameraCalibration isEqual:v8] & 1) == 0)
  {
    id v6 = (ADCameraCalibration *)[v8 copy];
    id v7 = self->_pearlCameraCalibration;
    self->_pearlCameraCalibration = v6;

    [(ADPearlColorInFieldCalibrationPipeline *)self->_pipeline updatePearlCamera:self->_pearlCameraCalibration];
  }
}

- (double)rectifyColorCameraExtrinsics:(float32x4_t)a3
{
  *(void *)&double result = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)a1[52].f32)), a3, a1[52], 1), a4, *(float32x4_t *)a1[52].f32, 2).u64[0];
  return result;
}

- (int64_t)prepare
{
  v2 = self;
  objc_sync_enter(v2);
  int v22 = 335680140;
  long long v23 = 0u;
  long long v24 = 0u;
  kdebug_trace();
  if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)size_t v21 = 0;
    _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "pearl color infield calibration executor: preparing executor", v21, 2u);
  }
  v3 = [(ADPearlColorInFieldCalibrationPipeline *)v2->_pipeline backendInferenceDescriptor];
  id v4 = objc_alloc(MEMORY[0x263F26C58]);
  uint32x4_t v5 = [v3 networkURL];
  id v6 = [v5 absoluteString];
  unint64_t engineType = v2->super._engineType;
  id v8 = [v3 configurationNameForLayout:v2->super._layout];
  uint64_t v9 = [v4 initWithPath:v6 forEngine:engineType configurationName:v8];
  backendEspressoRunner = v2->_backendEspressoRunner;
  v2->_backendEspressoRunner = (ADEspressoRunner *)v9;

  if (v2->_backendEspressoRunner)
  {
    int64_t v11 = [(ADPearlColorInFieldCalibrationPipeline *)v2->_pipeline frontendInferenceDescriptor];
    id v12 = objc_alloc(MEMORY[0x263F26C58]);
    id v13 = [v11 networkURL];
    v14 = [v13 absoluteString];
    unint64_t v15 = v2->super._engineType;
    int64_t v16 = [v11 configurationNameForLayout:v2->super._layout];
    uint64_t v17 = [v12 initWithPath:v14 forEngine:v15 configurationName:v16];
    frontendEspressoRunner = v2->_frontendEspressoRunner;
    v2->_frontendEspressoRunner = (ADEspressoRunner *)v17;

    if (v2->_frontendEspressoRunner)
    {
      if (ADDebugUtilsADVerboseLogsEnabled)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)size_t v21 = 0;
          _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "preparing pearl color in field calibration executor", v21, 2u);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)size_t v21 = 0;
        _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "preparing pearl color in field calibration executor", v21, 2u);
      }
      int64_t v19 = [(ADPearlColorInFieldCalibrationExecutor *)v2 allocateIntermediateBuffers];
      if (v19)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)size_t v21 = 0;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to allocate buffers", v21, 2u);
        }
      }
      else
      {
        v2->_isPrepared = 1;
      }
    }
    else
    {
      int64_t v19 = -22960;
    }
  }
  else
  {
    int64_t v19 = -22960;
  }

  kdebug_trace();
  objc_sync_exit(v2);

  return v19;
}

- (int64_t)allocateIntermediateBuffers
{
  [(ADPearlColorInFieldCalibrationExecutor *)self deallocateEspressoBuffers];
  int v51 = [(ADPearlColorInFieldCalibrationPipeline *)self->_pipeline backendInferenceDescriptor];
  v3 = [(ADPearlColorInFieldCalibrationPipeline *)self->_pipeline frontendInferenceDescriptor];
  backendEspressoRunner = self->_backendEspressoRunner;
  uint32x4_t v5 = [v51 colorInput];
  self->_itmPreProcessedColor = (__CVBuffer *)[(ADEspressoRunner *)backendEspressoRunner createAndRegisterPixelBufferForDescriptor:v5];

  id v6 = self->_backendEspressoRunner;
  id v7 = [v51 pearlInput];
  self->_itmPreProcessedPearl = (__CVBuffer *)[(ADEspressoRunner *)v6 createAndRegisterPixelBufferForDescriptor:v7];

  id v8 = [v51 pearlMaskInput];

  if (v8)
  {
    uint64_t v9 = self->_backendEspressoRunner;
    int64_t v10 = [v51 pearlMaskInput];
    self->_itmPreProcessedPearlMask = (__CVBuffer *)[(ADEspressoRunner *)v9 createAndRegisterPixelBufferForDescriptor:v10];
  }
  int64_t v11 = +[ADUtils getStandardNameForBufferOfType:@"itmPreProcessedColor" moduleName:@"RGBP"];
  +[ADUtils updatePixelBufferIOSurfaceLabel:v11 pixelBuffer:self->_itmPreProcessedColor];
  uint64_t v12 = +[ADUtils getStandardNameForBufferOfType:@"itmPreProcessedPearl" moduleName:@"RGBP"];

  float v50 = (void *)v12;
  +[ADUtils updatePixelBufferIOSurfaceLabel:v12 pixelBuffer:self->_itmPreProcessedPearl];
  id v13 = self->_backendEspressoRunner;
  v14 = [v51 featuresOutput];
  unint64_t v15 = [(ADEspressoRunner *)v13 registerDescriptor:v14];
  featuresOutputEspressoBufferHandle = self->_featuresOutputEspressoBufferHandle;
  self->_featuresOutputEspressoBufferHandle = v15;

  frontendEspressoRunner = self->_frontendEspressoRunner;
  unint64_t v18 = [v3 featuresInput];
  int64_t v19 = [(ADEspressoRunner *)frontendEspressoRunner registerDescriptor:v18];
  frontendFeaturesInputEspressoBufferHandle = self->_frontendFeaturesInputEspressoBufferHandle;
  self->_frontendFeaturesInputEspressoBufferHandle = v19;

  size_t v21 = self->_frontendEspressoRunner;
  int v22 = [v3 rotationXOutput];
  long long v23 = [(ADEspressoRunner *)v21 registerDescriptor:v22];
  frontendRotationXOutputEspressoBufferHandle = self->_frontendRotationXOutputEspressoBufferHandle;
  self->_frontendRotationXOutputEspressoBufferHandle = v23;

  v25 = self->_frontendEspressoRunner;
  uint64_t v26 = [v3 rotationYOutput];
  BOOL v27 = [(ADEspressoRunner *)v25 registerDescriptor:v26];
  frontendRotationYOutputEspressoBufferHandle = self->_frontendRotationYOutputEspressoBufferHandle;
  self->_frontendRotationYOutputEspressoBufferHandle = v27;

  id v29 = [v3 rotationZOutput];

  if (v29)
  {
    id v30 = self->_frontendEspressoRunner;
    v31 = [v3 rotationZOutput];
    unint64_t v32 = [(ADEspressoRunner *)v30 registerDescriptor:v31];
    frontendRotationZOutputEspressoBufferHandle = self->_frontendRotationZOutputEspressoBufferHandle;
    self->_frontendRotationZOutputEspressoBufferHandle = v32;
  }
  CVReturn v34 = self->_frontendEspressoRunner;
  v35 = [v3 errorXOutput];
  BOOL v36 = [(ADEspressoRunner *)v34 registerDescriptor:v35];
  frontendErrorXOutputEspressoBufferHandle = self->_frontendErrorXOutputEspressoBufferHandle;
  self->_frontendErrorXOutputEspressoBufferHandle = v36;

  v38 = self->_frontendEspressoRunner;
  v39 = [v3 errorYOutput];
  v40 = [(ADEspressoRunner *)v38 registerDescriptor:v39];
  frontendErrorYOutputEspressoBufferHandle = self->_frontendErrorYOutputEspressoBufferHandle;
  self->_frontendErrorYOutputEspressoBufferHandle = v40;

  v42 = [v3 errorZOutput];

  if (v42)
  {
    float v43 = self->_frontendEspressoRunner;
    float v44 = [v3 errorZOutput];
    id v45 = [(ADEspressoRunner *)v43 registerDescriptor:v44];
    frontendErrorZOutputEspressoBufferHandle = self->_frontendErrorZOutputEspressoBufferHandle;
    self->_frontendErrorZOutputEspressoBufferHandle = v45;
  }
  if (self->_itmPreProcessedColor
    && self->_itmPreProcessedPearl
    && self->_featuresOutputEspressoBufferHandle
    && self->_frontendFeaturesInputEspressoBufferHandle
    && self->_frontendRotationXOutputEspressoBufferHandle
    && self->_frontendRotationYOutputEspressoBufferHandle
    && self->_frontendErrorXOutputEspressoBufferHandle
    && self->_frontendErrorYOutputEspressoBufferHandle
    && (![(ADPearlColorInFieldCalibrationPipeline *)self->_pipeline isPearlMaskExpected]
     || self->_itmPreProcessedPearlMask)
    && (![(ADPearlColorInFieldCalibrationPipeline *)self->_pipeline isZused]
     || self->_frontendRotationZOutputEspressoBufferHandle && self->_frontendErrorZOutputEspressoBufferHandle))
  {
    uint64_t v47 = [(ADEspressoBufferHandle *)self->_featuresOutputEspressoBufferHandle dimensionsProduct];
    float v48 = [(ADPearlColorInFieldCalibrationExecutorParameters *)self->_executorParameters pipelineParameters];
    [v48 featuresVectorAggregationSize];

    self->_backendSingleResultSize = self->_backendFeaturesOutputElementSize * v47;
    operator new[]();
  }
  [(ADPearlColorInFieldCalibrationExecutor *)self deallocateEspressoBuffers];

  return -22971;
}

- (void)deallocateEspressoBuffers
{
  self->_itmPreProcessedColor = 0;
  CVPixelBufferRelease(self->_itmPreProcessedPearl);
  self->_itmPreProcessedPearl = 0;
  CVPixelBufferRelease(self->_itmPreProcessedPearlMask);
  self->_itmPreProcessedPearlMask = 0;
}

- (void)dealloc
{
  if (self->_backendResultAggregated) {
    MEMORY[0x2166C5D70]();
  }
  [(ADPearlColorInFieldCalibrationExecutor *)self deallocateEspressoBuffers];
  v3.receiver = self;
  v3.super_class = (Class)ADPearlColorInFieldCalibrationExecutor;
  [(ADExecutor *)&v3 dealloc];
}

- (id)initForEngineType:(unint64_t)a3
{
  kdebug_trace();
  uint32x4_t v5 = objc_alloc_init(ADPearlColorInFieldCalibrationExecutorParameters);
  id v6 = [(ADPearlColorInFieldCalibrationExecutor *)self initForEngineType:a3 andExecutorParameters:v5];

  kdebug_trace();
  return v6;
}

- (id)initForEngineType:(unint64_t)a3 andExecutorParameters:(id)a4
{
  id v6 = a4;
  int v46 = 335679636;
  long long v47 = 0u;
  long long v48 = 0u;
  kdebug_trace();
  v45.receiver = self;
  v45.super_class = (Class)ADPearlColorInFieldCalibrationExecutor;
  id v7 = [(ADExecutor *)&v45 init];
  id v8 = v7;
  uint64_t v9 = v7;
  if (!v7) {
    goto LABEL_9;
  }
  v7->_isPrepared = 0;
  int64_t v10 = [ADPearlColorInFieldCalibrationPipeline alloc];
  int64_t v11 = [v6 pipelineParameters];
  uint64_t v12 = [(ADPearlColorInFieldCalibrationPipeline *)v10 initWithParameters:v11 espressoEngine:a3];
  pipeline = v9->_pipeline;
  v9->_pipeline = (ADPearlColorInFieldCalibrationPipeline *)v12;

  if (!v9->_pipeline)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v41 = &_os_log_internal;
    v42 = "Pearl Color In Field Calibration pipeline failed to init ";
LABEL_18:
    _os_log_error_impl(&dword_215F16000, v41, OS_LOG_TYPE_ERROR, v42, buf, 2u);
    goto LABEL_19;
  }
  v9->super._unint64_t engineType = a3;
  backendEspressoRunner = v9->_backendEspressoRunner;
  v9->_backendEspressoRunner = 0;

  frontendEspressoRunner = v9->_frontendEspressoRunner;
  v9->_frontendEspressoRunner = 0;

  mcamPCameraCalibration = v9->_mcamPCameraCalibration;
  v9->_mcamPCameraCalibration = 0;

  uint64_t v17 = [ADPearlColorInFieldCalibrationExecutorParameters alloc];
  unint64_t v18 = [(ADPearlColorInFieldCalibrationPipeline *)v9->_pipeline pipelineParameters];
  uint64_t v19 = [(ADPearlColorInFieldCalibrationExecutorParameters *)v17 initWithPipelineParameters:v18];
  executorParameters = v9->_executorParameters;
  v9->_executorParameters = (ADPearlColorInFieldCalibrationExecutorParameters *)v19;

  if (!v9->_executorParameters)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v41 = &_os_log_internal;
    v42 = "Pearl Color In Field Calibration executor parameters failed to init ";
    goto LABEL_18;
  }
  -[ADPearlColorInFieldCalibrationExecutor setVmcamToWmcamExtrinsics:](v9, "setVmcamToWmcamExtrinsics:");
  -[ADPearlColorInFieldCalibrationExecutor setWmcamToMcamExtrinsics:](v9, "setWmcamToMcamExtrinsics:", *(double *)&_PromotedConst_5734, 0.0078125, 0.0, 0.0);
  v9->_itmPreProcessedColor = 0;
  v9->_itmPreProcessedPearl = 0;
  v9->_itmPreProcessedPearlMask = 0;
  featuresOutputEspressoBufferHandle = v9->_featuresOutputEspressoBufferHandle;
  v9->_featuresOutputEspressoBufferHandle = 0;

  frontendFeaturesInputEspressoBufferHandle = v9->_frontendFeaturesInputEspressoBufferHandle;
  v9->_frontendFeaturesInputEspressoBufferHandle = 0;

  frontendErrorXOutputEspressoBufferHandle = v9->_frontendErrorXOutputEspressoBufferHandle;
  v9->_frontendErrorXOutputEspressoBufferHandle = 0;

  frontendErrorYOutputEspressoBufferHandle = v9->_frontendErrorYOutputEspressoBufferHandle;
  v9->_frontendErrorYOutputEspressoBufferHandle = 0;

  frontendErrorZOutputEspressoBufferHandle = v9->_frontendErrorZOutputEspressoBufferHandle;
  v9->_frontendErrorZOutputEspressoBufferHandle = 0;

  frontendRotationXOutputEspressoBufferHandle = v9->_frontendRotationXOutputEspressoBufferHandle;
  v9->_frontendRotationXOutputEspressoBufferHandle = 0;

  frontendRotationYOutputEspressoBufferHandle = v9->_frontendRotationYOutputEspressoBufferHandle;
  v9->_frontendRotationYOutputEspressoBufferHandle = 0;

  frontendRotationZOutputEspressoBufferHandle = v9->_frontendRotationZOutputEspressoBufferHandle;
  v9->_frontendRotationZOutputEspressoBufferHandle = 0;

  id v29 = [(ADPearlColorInFieldCalibrationPipeline *)v9->_pipeline frontendInferenceDescriptor];
  id v30 = [v29 featuresInput];
  v31 = [v30 imageDescriptor];
  v9->_unint64_t frontendFeaturesInputElementSize = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)[v31 pixelFormat], 0);

  unint64_t frontendFeaturesInputElementSize = v9->_frontendFeaturesInputElementSize;
  if (frontendFeaturesInputElementSize != 2 && frontendFeaturesInputElementSize != 4)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v41 = &_os_log_internal;
    v42 = "Unexpected pixel format for frontend input";
    goto LABEL_18;
  }
  char v33 = [(ADPearlColorInFieldCalibrationPipeline *)v9->_pipeline backendInferenceDescriptor];
  CVReturn v34 = [v33 featuresOutput];
  v35 = [v34 imageDescriptor];
  v9->_unint64_t backendFeaturesOutputElementSize = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)[v35 pixelFormat], 0);

  unint64_t backendFeaturesOutputElementSize = v9->_backendFeaturesOutputElementSize;
  if (backendFeaturesOutputElementSize != 2 && backendFeaturesOutputElementSize != 4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v41 = &_os_log_internal;
      v42 = "Unexpected pixel format for backend output";
      goto LABEL_18;
    }
LABEL_19:
    v40 = 0;
    goto LABEL_20;
  }
  v9->_backendResultAggregated = 0;
  v9->_backendResultAggregationCounter = 0;
  v9->_backendSingleResultSize = 0;
  v9->_lastColorTimestamp = 0.0;
  long long v38 = *MEMORY[0x263EF89A8];
  long long v37 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
  long long v39 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
  *(_OWORD *)&v8->_anon_140[32] = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
  *(_OWORD *)&v8->_anon_140[48] = v39;
  *(_OWORD *)v8->_anon_140 = v38;
  *(_OWORD *)&v8->_anon_140[16] = v37;
LABEL_9:
  v40 = v9;
LABEL_20:
  kdebug_trace();

  return v40;
}

- (ADPearlColorInFieldCalibrationExecutor)init
{
  return (ADPearlColorInFieldCalibrationExecutor *)[(ADPearlColorInFieldCalibrationExecutor *)self initForEngineType:0];
}

@end