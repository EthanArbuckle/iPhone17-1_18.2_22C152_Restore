@interface ADPearlColorInfieldCalibrationFlow
- (ADPearlColorInFieldCalibrationExecutor)executor;
- (ADPearlColorInFieldCalibrationResult)lastExecutionResult;
- (ADPearlColorInfieldCalibrationFlow)initWithExecutor:(id)a3 andIntersessionData:(id)a4;
- (void)handleMatch:(id)a3;
- (void)pushColor:(double)a3 pose:(double)a4 calibration:(double)a5 metadata:(double)a6 timestamp:(uint64_t)a7;
- (void)pushPearlDepth:(double)a3 pose:(double)a4 depthCalibration:(double)a5 irToDepthTransform:(__n128)a6 timestamp:(__n128)a7;
@end

@implementation ADPearlColorInfieldCalibrationFlow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastExecutionResult, 0);
  objc_storeStrong((id *)&self->_executor, 0);
  objc_storeStrong((id *)&self->_transformKey, 0);
  objc_storeStrong((id *)&self->_intersessionData, 0);
  objc_storeStrong((id *)&self->_streamSync, 0);
}

- (ADPearlColorInFieldCalibrationResult)lastExecutionResult
{
  return self->_lastExecutionResult;
}

- (ADPearlColorInFieldCalibrationExecutor)executor
{
  return self->_executor;
}

- (void)handleMatch:(id)a3
{
  id v69 = a3;
  [(ADPearlColorInFieldCalibrationResult *)self->_lastExecutionResult setExecuted:0];
  v4 = [v69 matchedObjectsForStream:0];
  v5 = [v4 firstObject];

  v6 = [v69 matchedObjectsForStream:1];
  v7 = [v6 firstObject];

  v68 = v7;
  v8 = [v5 data];

  v67 = [v5 calibration];
  v9 = [v7 data];

  v66 = [v7 calibration];
  v63 = [v7 metadata];
  id v10 = [v63 objectForKeyedSubscript:self->_transformKey];
  v11 = [v10 objectAtIndexedSubscript:0];
  [v11 floatValue];
  unsigned int v64 = v12;

  v13 = [v10 objectAtIndexedSubscript:1];
  [v13 floatValue];
  unsigned int v62 = v14;

  v15 = [v10 objectAtIndexedSubscript:2];
  [v15 floatValue];

  v16 = [v10 objectAtIndexedSubscript:3];
  [v16 floatValue];

  v17 = [v10 objectAtIndexedSubscript:4];
  [v17 floatValue];
  unsigned int v61 = v18;

  v19 = [v10 objectAtIndexedSubscript:5];
  [v19 floatValue];
  unsigned int v60 = v20;

  v21 = [v10 objectAtIndexedSubscript:6];
  [v21 floatValue];

  v22 = [v10 objectAtIndexedSubscript:7];
  [v22 floatValue];

  v23 = [v10 objectAtIndexedSubscript:8];
  [v23 floatValue];
  unsigned int v59 = v24;

  v25 = [v10 objectAtIndexedSubscript:9];
  [v25 floatValue];
  unsigned int v58 = v26;

  v27 = [v10 objectAtIndexedSubscript:10];
  [v27 floatValue];

  v28 = [v10 objectAtIndexedSubscript:11];
  [v28 floatValue];

  v29 = [v10 objectAtIndexedSubscript:12];
  [v29 floatValue];
  unsigned int v57 = v30;

  v31 = [v10 objectAtIndexedSubscript:13];
  [v31 floatValue];
  unsigned int v56 = v32;

  v33 = [v10 objectAtIndexedSubscript:14];
  [v33 floatValue];

  v34 = [v10 objectAtIndexedSubscript:15];
  [v34 floatValue];

  [v68 pose];
  double v54 = v36;
  double v55 = v35;
  double v52 = v38;
  double v53 = v37;
  [v5 timestamp];
  double v40 = v39;
  int64_t v41 = -[ADPearlColorInFieldCalibrationExecutor preprocessInputColorFrame:pearlDepth:pearlPoses:pceCameraCalibration:pearlCameraCalibrationTransform:colorCameraCalibration:timestamp:](self->_executor, "preprocessInputColorFrame:pearlDepth:pearlPoses:pceCameraCalibration:pearlCameraCalibrationTransform:colorCameraCalibration:timestamp:", v8, v9, v66, v67, v55, v54, v53, v52, COERCE_DOUBLE(__PAIR64__(v62, v64)), COERCE_DOUBLE(__PAIR64__(v60, v61)), COERCE_DOUBLE(__PAIR64__(v58, v59)), COERCE_DOUBLE(__PAIR64__(v56, v57)), *(void *)&v39);
  v65 = objc_opt_new();
  v42 = objc_opt_new();
  [v42 setColor:v8];
  [v42 setPearl:v9];
  v43 = [(ADFlow *)self delegate];
  if (v43)
  {
    v44 = [(ADFlow *)self delegate];
    char v45 = objc_opt_respondsToSelector();
  }
  else
  {
    char v45 = 0;
  }

  v46 = [(ADFlow *)self delegate];
  if (v46)
  {
    v47 = [(ADFlow *)self delegate];
    char v48 = objc_opt_respondsToSelector();

    if (v41)
    {
LABEL_6:
      if ((v45 & 1) == 0) {
        goto LABEL_15;
      }
      v49 = [(ADFlow *)self delegate];
      [v5 timestamp];
      objc_msgSend(v49, "didFailOnFrame:input:message:error:", v42, @"failed preprocessing input stage", v41);
      goto LABEL_14;
    }
  }
  else
  {
    char v48 = 0;

    if (v41) {
      goto LABEL_6;
    }
  }
  int64_t v50 = [(ADPearlColorInFieldCalibrationExecutor *)self->_executor executePreprocessedInputsWithInterSessionData:self->_intersessionData outResult:self->_lastExecutionResult];
  if (v50)
  {
    if ((v45 & 1) == 0) {
      goto LABEL_15;
    }
    v49 = [(ADFlow *)self delegate];
    [v5 timestamp];
    objc_msgSend(v49, "didFailOnFrame:input:message:error:", v42, @"failed execute preprocessed stage", v50);
  }
  else
  {
    if ((v48 & 1) == 0) {
      goto LABEL_15;
    }
    v51 = [(ADPearlColorInFieldCalibrationResult *)self->_lastExecutionResult dictionaryRepresentation];
    [v65 setFiguresOfMerit:v51];

    [v65 setDepth:v9];
    v49 = [(ADFlow *)self delegate];
    [v49 didProcessFrame:v42 input:v65 output:v40];
  }
LABEL_14:

LABEL_15:
}

- (void)pushColor:(double)a3 pose:(double)a4 calibration:(double)a5 metadata:(double)a6 timestamp:(uint64_t)a7
{
  objc_msgSend(a1[2], "pushData:streamIndex:timestamp:pose:calibration:", a8, 0, a9, a6, a2, a3, a4, a5);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10) {
    [a1 handleMatch:v10];
  }
}

- (void)pushPearlDepth:(double)a3 pose:(double)a4 depthCalibration:(double)a5 irToDepthTransform:(__n128)a6 timestamp:(__n128)a7
{
  v52[1] = *MEMORY[0x263EF8340];
  id v19 = a12;
  unsigned int v20 = objc_opt_new();
  v21 = [NSNumber numberWithFloat:a6.n128_f64[0]];
  [v20 addObject:v21];

  HIDWORD(v22) = a6.n128_u32[1];
  LODWORD(v22) = a6.n128_u32[1];
  v23 = [NSNumber numberWithFloat:v22];
  [v20 addObject:v23];

  unsigned int v24 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a6.n128_u32[1], a6.n128_u32[2])));
  [v20 addObject:v24];

  v25 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a6.n128_u32[1], a6.n128_u32[3])));
  [v20 addObject:v25];

  unsigned int v26 = [NSNumber numberWithFloat:a7.n128_f64[0]];
  [v20 addObject:v26];

  HIDWORD(v27) = a7.n128_u32[1];
  LODWORD(v27) = a7.n128_u32[1];
  v28 = [NSNumber numberWithFloat:v27];
  [v20 addObject:v28];

  v29 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a7.n128_u32[1], a7.n128_u32[2])));
  [v20 addObject:v29];

  unsigned int v30 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a7.n128_u32[1], a7.n128_u32[3])));
  [v20 addObject:v30];

  v31 = [NSNumber numberWithFloat:a8.n128_f64[0]];
  [v20 addObject:v31];

  HIDWORD(v32) = a8.n128_u32[1];
  LODWORD(v32) = a8.n128_u32[1];
  v33 = [NSNumber numberWithFloat:v32];
  [v20 addObject:v33];

  v34 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a8.n128_u32[1], a8.n128_u32[2])));
  [v20 addObject:v34];

  double v35 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a8.n128_u32[1], a8.n128_u32[3])));
  [v20 addObject:v35];

  double v36 = [NSNumber numberWithFloat:a9.n128_f64[0]];
  [v20 addObject:v36];

  HIDWORD(v37) = a9.n128_u32[1];
  LODWORD(v37) = a9.n128_u32[1];
  double v38 = [NSNumber numberWithFloat:v37];
  [v20 addObject:v38];

  double v39 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a9.n128_u32[1], a9.n128_u32[2])));
  [v20 addObject:v39];

  double v40 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a9.n128_u32[1], a9.n128_u32[3])));
  [v20 addObject:v40];

  uint64_t v51 = *(void *)(a1 + 32);
  v52[0] = v20;
  int64_t v41 = [NSDictionary dictionaryWithObjects:v52 forKeys:&v51 count:1];
  v42 = objc_msgSend(*(id *)(a1 + 16), "pushData:streamIndex:timestamp:pose:calibration:meta:", a11, 1, v19, v41, a13, a2, a3, a4, a5);
  if (v42) {
    [(id)a1 handleMatch:v42];
  }
}

- (ADPearlColorInfieldCalibrationFlow)initWithExecutor:(id)a3 andIntersessionData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ADPearlColorInfieldCalibrationFlow;
  v9 = [(ADPearlColorInfieldCalibrationFlow *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [NSString stringWithCString:"inputIrToDepthTransform" encoding:4];
    transformKey = v9->_transformKey;
    v9->_transformKey = (NSString *)v10;

    objc_storeStrong((id *)&v9->_intersessionData, a4);
    objc_storeStrong((id *)&v9->_executor, a3);
    uint64_t v12 = objc_opt_new();
    lastExecutionResult = v9->_lastExecutionResult;
    v9->_lastExecutionResult = (ADPearlColorInFieldCalibrationResult *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x263F26CF8]) initWithStreamCount:2 allowedMatchTimeInterval:0.00999999978];
    streamSync = v9->_streamSync;
    v9->_streamSync = (ADStreamSync *)v14;

    [(ADStreamSync *)v9->_streamSync setStream:0 queueSize:10];
    [(ADStreamSync *)v9->_streamSync setStream:1 queueSize:10 aggregationCount:1 allowedAggregationInterval:0.0];
  }

  return v9;
}

@end