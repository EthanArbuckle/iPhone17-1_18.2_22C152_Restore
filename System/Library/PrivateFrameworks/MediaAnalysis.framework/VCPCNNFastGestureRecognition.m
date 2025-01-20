@interface VCPCNNFastGestureRecognition
+ (id)detector;
- (VCPCNNFastGestureRecognition)init;
- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6;
- (int)createInput:(float *)a3 keypoints:(id)a4;
- (int)gestureDetection:(id)a3 score:(float *)a4;
- (int)getDetectionScore:(float *)a3;
- (int)planDestroy;
- (void)dealloc;
@end

@implementation VCPCNNFastGestureRecognition

- (VCPCNNFastGestureRecognition)init
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)VCPCNNFastGestureRecognition;
  v2 = [(VCPCNNFastGestureRecognition *)&v41 init];
  if (v2)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, "CNNFastGestureRecognition: start loading model", buf, 2u);
      }
    }
    v4 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
    v5 = [v4 resourceURL];

    v6 = [MEMORY[0x1E4F1CB10] URLWithString:@"gesture_recognition.espresso.net" relativeToURL:v5];
    v7 = [[VCPCNNModelEspresso alloc] initWithParameters:v6 inputNames:0 outputNames:0 properties:0];
    modelEspresso = v2->_modelEspresso;
    v2->_modelEspresso = v7;

    v9 = v2->_modelEspresso;
    if (!v9 || [(VCPCNNModelEspresso *)v9 prepareModelWithConfig:&stru_1F15A0D70]) {
      goto LABEL_32;
    }
    if ((int)MediaAnalysisLogLevel() < 7)
    {
LABEL_20:
      v18 = v2->_modelEspresso;
      if (v18 && ([(VCPCNNModelEspresso *)v18 inputBlob], (v19 = v2->_modelEspresso) != 0))
      {
        int v20 = DWORD2(v35);
        [(VCPCNNModelEspresso *)v19 inputBlob];
        v21 = v2->_modelEspresso;
        int v22 = v29 * v20;
        if (v21)
        {
          [(VCPCNNModelEspresso *)v21 inputBlob];
          int v23 = v28;
LABEL_26:
          if (v22 * v23 == 378)
          {
            v24 = (float *)operator new[](0x5E8uLL, MEMORY[0x1E4FBA2D0]);
            v2->_inputData = v24;
            if (v24)
            {
              v17 = v2;
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                v25 = VCPLogInstance();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEBUG, "CNNFastGestureRecognition: successfully loaded model", buf, 2u);
                }

                v17 = v2;
              }
              goto LABEL_33;
            }
          }
LABEL_32:
          v17 = 0;
LABEL_33:

          goto LABEL_34;
        }
      }
      else
      {
        int v22 = 0;
      }
      int v23 = 0;
      goto LABEL_26;
    }
    v10 = VCPLogInstance();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
LABEL_19:

      goto LABEL_20;
    }
    v11 = v2->_modelEspresso;
    if (v11)
    {
      [(VCPCNNModelEspresso *)v11 inputBlob];
      int v12 = DWORD2(v35);
      v13 = v2->_modelEspresso;
      if (v13)
      {
        [(VCPCNNModelEspresso *)v13 inputBlob];
        int v14 = v29;
        v15 = v2->_modelEspresso;
        if (v15)
        {
          [(VCPCNNModelEspresso *)v15 inputBlob];
          int v16 = v28;
LABEL_18:
          *(_DWORD *)v42 = 67109632;
          int v43 = v12;
          __int16 v44 = 1024;
          int v45 = v14;
          __int16 v46 = 1024;
          int v47 = v16;
          _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "CNNFastGestureRecognition: inputBlob.height = %d, inputBlob.width = %d, inputBlob.channels = %d", v42, 0x14u);
          goto LABEL_19;
        }
LABEL_17:
        int v16 = 0;
        int v28 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      int v12 = 0;
      uint64_t v40 = 0;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      *(_OWORD *)buf = 0u;
      long long v31 = 0u;
    }
    int v14 = 0;
    int v29 = 0;
    goto LABEL_17;
  }
  v17 = 0;
LABEL_34:
  v26 = v17;

  return v26;
}

- (void)dealloc
{
  inputData = self->_inputData;
  if (inputData) {
    MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNFastGestureRecognition;
  [(VCPCNNFastGestureRecognition *)&v4 dealloc];
}

+ (id)detector
{
  {
    +[VCPCNNFastGestureRecognition detector]::analyzerClass = objc_opt_class();
  }
  id v2 = objc_alloc_init((Class)+[VCPCNNFastGestureRecognition detector]::analyzerClass);
  return v2;
}

- (int)planDestroy
{
  return 0;
}

- (int)createInput:(float *)a3 keypoints:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    uint64_t v6 = 0;
    v7 = a3 + 21;
    do
    {
      v8 = [v5 objectAtIndex:v6];
      uint64_t v9 = 0;
      v10 = v7;
      do
      {
        v11 = [v8 objectAtIndex:v9];
        int v12 = [v11 objectAtIndex:0];
        [v12 floatValue];
        *((_DWORD *)v10 - 21) = v13;

        int v14 = [v11 objectAtIndex:1];
        [v14 floatValue];
        *(_DWORD *)v10 = v15;

        int v16 = [v11 objectAtIndex:2];
        [v16 floatValue];
        *((_DWORD *)v10 + 21) = v17;

        ++v9;
        ++v10;
      }
      while (v9 != 21);

      ++v6;
      v7 += 63;
    }
    while (v6 != 6);
    int v18 = 0;
  }
  else
  {
    int v18 = -108;
  }

  return v18;
}

- (int)getDetectionScore:(float *)a3
{
  int v5 = [(VCPCNNModelEspresso *)self->_modelEspresso espressoForward:self->_inputData];
  if (!v5)
  {
    [(VCPCNNModelEspresso *)self->_modelEspresso outputBlob];
    [(VCPCNNModelEspresso *)self->_modelEspresso outputBlob];
    [(VCPCNNModelEspresso *)self->_modelEspresso outputBlob];
    [(VCPCNNModelEspresso *)self->_modelEspresso outputBlob];
    *a3 = *(float *)(v7 + 4);
  }
  return v5;
}

- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6
{
  return 0;
}

- (int)gestureDetection:(id)a3 score:(float *)a4
{
  uint64_t v7 = (void *)MEMORY[0x1C186D320](self, a2);
  int v8 = [(VCPCNNFastGestureRecognition *)self createInput:self->_inputData keypoints:a3];
  if (!v8) {
    int v8 = [(VCPCNNFastGestureRecognition *)self getDetectionScore:a4];
  }
  return v8;
}

- (void).cxx_destruct
{
}

@end