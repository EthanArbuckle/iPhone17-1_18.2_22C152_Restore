@interface VCPImageSaliencyAnalyzerFullEspresso
+ (id)sharedModel:(id)a3;
- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6;
- (int)getSalientRegions:(id)a3;
- (int)prepareModelForSourceWidth:(int)a3 andSourceHeight:(int)a4;
- (void)dealloc;
@end

@implementation VCPImageSaliencyAnalyzerFullEspresso

- (void)dealloc
{
  inputData = self->_inputData;
  if (inputData) {
    MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPImageSaliencyAnalyzerFullEspresso;
  [(VCPImageSaliencyAnalyzerFullEspresso *)&v4 dealloc];
}

- (int)prepareModelForSourceWidth:(int)a3 andSourceHeight:(int)a4
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  v8 = [v7 resourceURL];

  v9 = [MEMORY[0x1E4F1CB10] URLWithString:@"cnn_saliency.espresso.net" relativeToURL:v8];
  if (!self->_modelEspresso)
  {
    v10 = [(id)objc_opt_class() sharedModel:v9];
    modelEspresso = self->_modelEspresso;
    self->_modelEspresso = v10;

    if (!self->_modelEspresso) {
      goto LABEL_25;
    }
  }
  if (self->_srcWidth == a3 && self->_srcHeight == a4)
  {
    int v12 = 0;
    goto LABEL_26;
  }
  if (a4 == a3)
  {
    resConfig = self->_resConfig;
    v14 = @"res_0";
  }
  else
  {
    resConfig = self->_resConfig;
    if (a4 >= a3) {
      v14 = @"res_2";
    }
    else {
      v14 = @"res_1";
    }
  }
  self->_resConfig = &v14->isa;

  int v12 = [(VCPCNNModelEspresso *)self->_modelEspresso prepareModelWithConfig:self->_resConfig];
  if (!v12)
  {
    self->_srcHeight = 0;
    self->_srcWidth = 0;
    inputData = self->_inputData;
    if (inputData) {
      MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
    }
    v16 = self->_modelEspresso;
    if (v16 && ([(VCPCNNModelEspresso *)v16 inputBlob], (v17 = self->_modelEspresso) != 0))
    {
      [(VCPCNNModelEspresso *)v17 inputBlob];
      v18 = self->_modelEspresso;
      uint64_t v19 = v26 * v27;
      if (v18)
      {
        [(VCPCNNModelEspresso *)v18 inputBlob];
        uint64_t v20 = v25;
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v19 = 0;
    }
    uint64_t v20 = 0;
LABEL_20:
    unint64_t v21 = v19 * v20;
    if (v21 >> 62) {
      size_t v22 = -1;
    }
    else {
      size_t v22 = 4 * v21;
    }
    v23 = (float *)operator new[](v22, MEMORY[0x1E4FBA2D0]);
    self->_inputData = v23;
    if (v23)
    {
      int v12 = 0;
      self->_srcWidth = a3;
      self->_srcHeight = a4;
      goto LABEL_26;
    }
LABEL_25:
    int v12 = -108;
  }
LABEL_26:

  return v12;
}

+ (id)sharedModel:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[VCPSharedInstanceManager sharedManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__VCPImageSaliencyAnalyzerFullEspresso_sharedModel___block_invoke;
  v8[3] = &unk_1E6298108;
  id v5 = v3;
  id v9 = v5;
  v6 = [v4 sharedInstanceWithIdentifier:@"VCPSaliencyFullEspresso" andCreationBlock:v8];

  return v6;
}

VCPCNNModelEspresso *__52__VCPImageSaliencyAnalyzerFullEspresso_sharedModel___block_invoke(uint64_t a1)
{
  v1 = [[VCPCNNModelEspresso alloc] initWithParameters:*(void *)(a1 + 32) inputNames:0 outputNames:0 properties:0];
  return v1;
}

- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6
{
  modelEspresso = self->_modelEspresso;
  if (modelEspresso)
  {
    [(VCPCNNModelEspresso *)modelEspresso inputBlob];
    int v10 = v15;
  }
  else
  {
    int v10 = 0;
  }
  *a5 = v10;
  v11 = self->_modelEspresso;
  if (v11)
  {
    [(VCPCNNModelEspresso *)v11 inputBlob];
    int v12 = v14;
  }
  else
  {
    int v12 = 0;
  }
  *a6 = v12;
  return self->_inputData;
}

- (int)getSalientRegions:(id)a3
{
  objc_super v4 = (uint64_t (**)(void))a3;
  modelEspresso = self->_modelEspresso;
  if (modelEspresso)
  {
    [(VCPCNNModelEspresso *)modelEspresso outputBlob];
    v6 = self->_modelEspresso;
    uint64_t v7 = DWORD2(v18);
    if (v6)
    {
      [(VCPCNNModelEspresso *)v6 outputBlob];
      uint64_t v8 = v18;
      if (!v4) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v8 = 0;
      if (!v4) {
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v4[2](v4))
  {
    int v9 = -128;
    goto LABEL_15;
  }
LABEL_10:
  int v9 = [(VCPCNNModelEspresso *)self->_modelEspresso espressoForward:self->_inputData];
  if (!v9)
  {
    int v10 = self->_modelEspresso;
    if (v10)
    {
      [(VCPCNNModelEspresso *)v10 outputBlob];
      uint64_t v11 = v13;
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v23 = 0;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
    }
    int v9 = -[VCPImageSaliencyAnalyzer generateSalientRegion:outHeight:outWidth:](self, "generateSalientRegion:outHeight:outWidth:", v11, v7, v8, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
  }
LABEL_15:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resConfig, 0);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

@end