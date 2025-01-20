@interface VCPCNNPetsDetectorEspresso
+ (id)sharedModel:(id)a3;
- (VCPCNNPetsDetectorEspresso)initWithMaxNumRegions:(int)a3;
- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6;
- (int)createModel:(int)a3 srcWidth:(int)a4;
- (int)generatePetsBoxes:(id)a3 faceBoxes:(id)a4 cancel:(id)a5;
- (void)dealloc;
@end

@implementation VCPCNNPetsDetectorEspresso

- (VCPCNNPetsDetectorEspresso)initWithMaxNumRegions:(int)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  v6 = [v5 resourceURL];

  v7 = [MEMORY[0x1E4F1CB10] URLWithString:@"cnn_pets.espresso.net" relativeToURL:v6];
  self->_maxNumRegions = a3;
  resConfig = self->_resConfig;
  self->_resConfig = (NSString *)&stru_1F15A0D70;

  v15.receiver = self;
  v15.super_class = (Class)VCPCNNPetsDetectorEspresso;
  v9 = [(VCPCNNPetsDetectorEspresso *)&v15 init];
  if (v9)
  {
    if (DeviceHasANE())
    {
      v10 = [(id)objc_opt_class() sharedModel:v7];
    }
    else
    {
      v10 = [[VCPCNNModelEspresso alloc] initWithParameters:v7 inputNames:0 outputNames:0 properties:0];
    }
    modelEspresso = v9->_modelEspresso;
    v9->_modelEspresso = v10;

    if (v9->_modelEspresso) {
      v11 = v9;
    }
    else {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  v13 = v11;

  return v13;
}

+ (id)sharedModel:(id)a3
{
  id v3 = a3;
  v4 = +[VCPSharedInstanceManager sharedManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__VCPCNNPetsDetectorEspresso_sharedModel___block_invoke;
  v8[3] = &unk_1E6298108;
  id v5 = v3;
  id v9 = v5;
  v6 = [v4 sharedInstanceWithIdentifier:@"VCPPetsEspresso" andCreationBlock:v8];

  return v6;
}

VCPCNNModelEspresso *__42__VCPCNNPetsDetectorEspresso_sharedModel___block_invoke(uint64_t a1)
{
  v1 = [[VCPCNNModelEspresso alloc] initWithParameters:*(void *)(a1 + 32) inputNames:0 outputNames:0 properties:0];
  return v1;
}

- (int)createModel:(int)a3 srcWidth:(int)a4
{
  if (self->_srcWidth == a4 && self->_srcHeight == a3) {
    return 0;
  }
  if (a3 == a4)
  {
    resConfig = self->_resConfig;
    id v9 = @"res_0";
  }
  else
  {
    resConfig = self->_resConfig;
    if (a3 >= a4) {
      id v9 = @"res_2";
    }
    else {
      id v9 = @"res_1";
    }
  }
  self->_resConfig = &v9->isa;

  int result = [(VCPCNNModelEspresso *)self->_modelEspresso prepareModelWithConfig:self->_resConfig];
  if (!result)
  {
    self->_srcHeight = 0;
    self->_srcWidth = 0;
    inputData = self->_inputData;
    if (inputData) {
      MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
    }
    modelEspresso = self->_modelEspresso;
    if (modelEspresso
      && ([(VCPCNNModelEspresso *)modelEspresso inputBlob], (v12 = self->_modelEspresso) != 0))
    {
      [(VCPCNNModelEspresso *)v12 inputBlob];
      v13 = self->_modelEspresso;
      uint64_t v14 = v20 * v21;
      if (v13)
      {
        [(VCPCNNModelEspresso *)v13 inputBlob];
        uint64_t v15 = v19;
LABEL_18:
        unint64_t v16 = v14 * v15;
        if (v16 >> 62) {
          size_t v17 = -1;
        }
        else {
          size_t v17 = 4 * v16;
        }
        v18 = (float *)operator new[](v17, MEMORY[0x1E4FBA2D0]);
        self->_inputData = v18;
        if (!v18) {
          return -108;
        }
        int result = 0;
        self->_srcWidth = a4;
        self->_srcHeight = a3;
        return result;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint64_t v15 = 0;
    goto LABEL_18;
  }
  return result;
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

- (int)generatePetsBoxes:(id)a3 faceBoxes:(id)a4 cancel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v10 || ((*((uint64_t (**)(id))v10 + 2))(v10) & 1) == 0)
  {
    int v12 = [(VCPCNNModelEspresso *)self->_modelEspresso espressoForward:self->_inputData];
    if (v12) {
      goto LABEL_13;
    }
    modelEspresso = self->_modelEspresso;
    if (modelEspresso)
    {
      [(VCPCNNModelEspresso *)modelEspresso outputBlob];
      int v14 = self->_modelEspresso;
      uint64_t v15 = DWORD2(v25);
      if (v14)
      {
        [(VCPCNNModelEspresso *)v14 outputBlob];
        uint64_t v16 = v25;
        size_t v17 = self->_modelEspresso;
        if (v17)
        {
          [(VCPCNNModelEspresso *)v17 outputBlob];
          uint64_t v18 = v20;
LABEL_12:
          int v12 = -[VCPCNNPetsDetector generatePetsRegions:outHeight:outWidth:boxes:faceBoxes:maxNumRegions:](self, "generatePetsRegions:outHeight:outWidth:boxes:faceBoxes:maxNumRegions:", v18, v15, v16, v8, v9, self->_maxNumRegions, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30);
          goto LABEL_13;
        }
LABEL_11:
        uint64_t v18 = 0;
        uint64_t v30 = 0;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    uint64_t v16 = 0;
    goto LABEL_11;
  }
  int v12 = -128;
LABEL_13:

  return v12;
}

- (void)dealloc
{
  inputData = self->_inputData;
  if (inputData) {
    MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNPetsDetectorEspresso;
  [(VCPCNNPetsDetectorEspresso *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resConfig, 0);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

@end