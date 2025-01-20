@interface VCPCNNHandKeypointsDetectorEspresso
- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6 offset:(float *)a7;
- (id)init:(BOOL)a3 sharedModel:(BOOL)a4 modelName:(id)a5 enableHandObject:(BOOL)a6 options:(id)a7;
- (int)generateHandKeypoints:(CGPoint *)a3 keypointConfidence:(float *)a4 offset:(float)a5 handHoldsObjectConfidence:(float *)a6;
- (void)dealloc;
@end

@implementation VCPCNNHandKeypointsDetectorEspresso

- (id)init:(BOOL)a3 sharedModel:(BOOL)a4 modelName:(id)a5 enableHandObject:(BOOL)a6 options:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a4;
  BOOL v10 = a3;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v47 = a5;
  id v12 = a7;
  v13 = &unk_1F15EDEF0;
  if (!v8) {
    v13 = 0;
  }
  id v14 = v13;
  self->_enableHandObject = v8;
  v15 = [MEMORY[0x1E4F1CA60] dictionary];
  v16 = [NSNumber numberWithBool:v10];
  [v15 setObject:v16 forKey:@"forceCPU"];

  v17 = [NSNumber numberWithBool:v9];
  [v15 setObject:v17 forKey:@"forceCPU"];

  v18 = [v12 objectForKeyedSubscript:@"planPriority"];

  if (v18)
  {
    v19 = [v12 objectForKeyedSubscript:@"planPriority"];
    if ([v19 intValue] == 1)
    {
    }
    else
    {
      v20 = [v12 objectForKeyedSubscript:@"planPriority"];
      int v21 = [v20 intValue];

      if (v21 != 0x2000)
      {
        if ((int)MediaAnalysisLogLevel() < 4) {
          goto LABEL_14;
        }
        v25 = VCPLogInstance();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v27 = [v12 objectForKeyedSubscript:@"planPriority"];
          *(_DWORD *)buf = 67109120;
          LODWORD(v52) = [v27 intValue];
          _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEFAULT, "VCPCNNHandKeypointsDetectorEspresso - invalid input espresso plan priority %d", buf, 8u);
        }
        goto LABEL_13;
      }
    }
    v22 = [v12 objectForKeyedSubscript:@"planPriority"];
    uint64_t v23 = [v22 intValue];

    v24 = [NSNumber numberWithUnsignedInt:v23];
    [v15 setObject:v24 forKey:@"planPriority"];

    if ((int)MediaAnalysisLogLevel() < 7) {
      goto LABEL_14;
    }
    v25 = VCPLogInstance();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v26 = [NSNumber numberWithUnsignedInt:v23];
      *(_DWORD *)buf = 138412290;
      v52 = v26;
      _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEBUG, "VCPCNNHandKeypointsDetectorEspresso - espresso plan priority is set to %@", buf, 0xCu);
    }
LABEL_13:
  }
LABEL_14:
  v50.receiver = self;
  v50.super_class = (Class)VCPCNNHandKeypointsDetectorEspresso;
  v28 = [(VCPCNNHandKeypointsDetectorEspresso *)&v50 init];
  if (v28)
  {
    v29 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
    v30 = [v29 resourceURL];

    v31 = [MEMORY[0x1E4F1CB10] URLWithString:v47 relativeToURL:v30];
    v32 = [[VCPCNNModelEspresso alloc] initWithParameters:v31 inputNames:0 outputNames:v14 properties:v15];
    modelEspresso = v28->_modelEspresso;
    v28->_modelEspresso = v32;

    v34 = v28->_modelEspresso;
    if (!v34 || [(VCPCNNModelEspresso *)v34 prepareModelWithConfig:&stru_1F15A0D70])
    {
      v35 = 0;
LABEL_31:

      goto LABEL_32;
    }
    v36 = v28->_modelEspresso;
    if (v36 && ([(VCPCNNModelEspresso *)v36 inputBlob], (v37 = v28->_modelEspresso) != 0))
    {
      uint64_t v38 = v53;
      [(VCPCNNModelEspresso *)v37 inputBlob];
      v39 = v28->_modelEspresso;
      uint64_t v40 = v49 * v38;
      if (v39)
      {
        [(VCPCNNModelEspresso *)v39 inputBlob];
        uint64_t v41 = v48;
LABEL_25:
        unint64_t v42 = v40 * v41;
        if (v42 >> 62) {
          size_t v43 = -1;
        }
        else {
          size_t v43 = 4 * v42;
        }
        v44 = (float *)operator new[](v43, MEMORY[0x1E4FBA2D0]);
        v28->_inputData = v44;
        v28->_forceCPU = v10;
        if (v44) {
          v35 = v28;
        }
        else {
          v35 = 0;
        }
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v40 = 0;
    }
    uint64_t v41 = 0;
    goto LABEL_25;
  }
  v35 = 0;
LABEL_32:
  v45 = v35;

  return v45;
}

- (void)dealloc
{
  inputData = self->_inputData;
  if (inputData) {
    MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNHandKeypointsDetectorEspresso;
  [(VCPCNNHandKeypointsDetectorEspresso *)&v4 dealloc];
}

- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6 offset:(float *)a7
{
  modelEspresso = self->_modelEspresso;
  if (modelEspresso)
  {
    [(VCPCNNModelEspresso *)modelEspresso inputBlob];
    int v12 = v18;
  }
  else
  {
    int v12 = 0;
  }
  *a5 = v12;
  v13 = self->_modelEspresso;
  if (v13)
  {
    [(VCPCNNModelEspresso *)v13 inputBlob];
    int v14 = v17;
  }
  else
  {
    int v14 = 0;
  }
  *a6 = v14;
  float v15 = 0.0;
  if (!self->_forceCPU) {
    float v15 = 2.0;
  }
  *a7 = v15;
  return self->_inputData;
}

- (int)generateHandKeypoints:(CGPoint *)a3 keypointConfidence:(float *)a4 offset:(float)a5 handHoldsObjectConfidence:(float *)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  BOOL v10 = VCPSignPostLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  int v12 = VCPSignPostLog();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "inferenceHandKeypointCallFromSPI", "", (uint8_t *)buf, 2u);
  }

  int result = [(VCPCNNModelEspresso *)self->_modelEspresso espressoForward:self->_inputData];
  if (!result)
  {
    float v15 = VCPSignPostLog();
    v16 = v15;
    if (v11 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v15))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v16, OS_SIGNPOST_INTERVAL_END, v11, "inferenceHandKeypointCallFromSPI", "", (uint8_t *)buf, 2u);
    }

    modelEspresso = self->_modelEspresso;
    if (modelEspresso)
    {
      [(VCPCNNModelEspresso *)modelEspresso inputBlob];
      v19 = self->_modelEspresso;
      unsigned int v33 = v37;
      if (v19)
      {
        [(VCPCNNModelEspresso *)v19 inputBlob];
        uint64_t v20 = v36;
      }
      else
      {
        uint64_t v20 = 0;
      }
    }
    else
    {
      uint64_t v20 = 0;
      unsigned int v33 = 0;
    }
    if (self->_enableHandObject)
    {
      [(VCPCNNModelEspresso *)self->_modelEspresso outputBlobs];
      uint64_t v21 = *(void *)(*(void *)&buf[0] + 96);
      *((void *)&buf[0] + 1) = *(void *)&buf[0];
      operator delete(*(void **)&buf[0]);
      [(VCPCNNModelEspresso *)self->_modelEspresso outputBlobs];
      uint64_t v22 = *(void *)(*(void *)&buf[0] + 88);
      *((void *)&buf[0] + 1) = *(void *)&buf[0];
      operator delete(*(void **)&buf[0]);
      [(VCPCNNModelEspresso *)self->_modelEspresso outputBlobs];
      uint64_t v23 = *(void *)(*(void *)&buf[0] + 80);
      *((void *)&buf[0] + 1) = *(void *)&buf[0];
      operator delete(*(void **)&buf[0]);
      [(VCPCNNModelEspresso *)self->_modelEspresso outputBlobs];
      uint64_t v24 = **(void **)&buf[0];
      *((void *)&buf[0] + 1) = *(void *)&buf[0];
      operator delete(*(void **)&buf[0]);
      goto LABEL_23;
    }
    v25 = self->_modelEspresso;
    if (v25)
    {
      [(VCPCNNModelEspresso *)v25 outputBlob];
      v26 = self->_modelEspresso;
      uint64_t v21 = v38;
      if (v26)
      {
        [(VCPCNNModelEspresso *)v26 outputBlob];
        uint64_t v22 = v37;
        v27 = self->_modelEspresso;
        if (v27)
        {
          [(VCPCNNModelEspresso *)v27 outputBlob];
          v28 = self->_modelEspresso;
          uint64_t v23 = v36;
          if (v28)
          {
            [(VCPCNNModelEspresso *)v28 outputBlob];
            uint64_t v24 = *(void *)&buf[0];
          }
          else
          {
            uint64_t v24 = 0;
          }
LABEL_23:
          *(float *)&double v17 = a5;
          int result = [(VCPCNNHandKeypointsDetector *)self cvtHeatmaps2Keypoints:v24 outHeight:v22 outWidth:v23 inHeight:v33 inWidth:v20 outChannel:v21 keypoints:v17 keypointConfidence:a3 offset:a4];
          if (!result && a6 && self->_enableHandObject)
          {
            [(VCPCNNModelEspresso *)self->_modelEspresso outputBlobs];
            float v29 = **(float **)(*(void *)&buf[0] + 168);
            *((void *)&buf[0] + 1) = *(void *)&buf[0];
            operator delete(*(void **)&buf[0]);
            float v30 = expf(v29);
            *a6 = v30 / (float)(v30 + 1.0);
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v31 = VCPLogInstance();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                double v32 = *a6;
                LODWORD(buf[0]) = 134217984;
                *(double *)((char *)buf + 4) = v32;
                _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_DEBUG, "VCPCNNHandKeypointsDetectorEspresso - handHoldsObjectConfidence = %f", (uint8_t *)buf, 0xCu);
              }
            }
            return 0;
          }
          return result;
        }
LABEL_22:
        uint64_t v24 = 0;
        uint64_t v23 = 0;
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
    uint64_t v22 = 0;
    goto LABEL_22;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end