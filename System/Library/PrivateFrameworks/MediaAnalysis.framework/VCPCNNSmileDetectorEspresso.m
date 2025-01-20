@interface VCPCNNSmileDetectorEspresso
+ (id)sharedModel:(id)a3;
- (VCPCNNSmileDetectorEspresso)init;
- (float)getInputBuffer;
- (int)computeSmileScore:(float *)a3;
- (void)dealloc;
@end

@implementation VCPCNNSmileDetectorEspresso

- (VCPCNNSmileDetectorEspresso)init
{
  v3 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  v4 = [v3 resourceURL];

  v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"cnn_smile.espresso.net" relativeToURL:v4];
  v14.receiver = self;
  v14.super_class = (Class)VCPCNNSmileDetectorEspresso;
  v6 = [(VCPCNNSmileDetectorEspresso *)&v14 init];
  if (!v6) {
    goto LABEL_6;
  }
  v7 = (float *)operator new[](0x1900uLL, MEMORY[0x1E4FBA2D0]);
  v6->_inputData = v7;
  if (!v7) {
    goto LABEL_5;
  }
  uint64_t v8 = [(id)objc_opt_class() sharedModel:v5];
  modelEspresso = v6->_modelEspresso;
  v6->_modelEspresso = (VCPCNNModelEspresso *)v8;

  v10 = v6->_modelEspresso;
  if (v10 && ![(VCPCNNModelEspresso *)v10 prepareModelWithConfig:&stru_1F15A0D70]) {
LABEL_6:
  }
    v11 = v6;
  else {
LABEL_5:
  }
    v11 = 0;
  v12 = v11;

  return v12;
}

- (float)getInputBuffer
{
  return self->_inputData;
}

+ (id)sharedModel:(id)a3
{
  id v3 = a3;
  v4 = +[VCPSharedInstanceManager sharedManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__VCPCNNSmileDetectorEspresso_sharedModel___block_invoke;
  v8[3] = &unk_1E6298108;
  id v5 = v3;
  id v9 = v5;
  v6 = [v4 sharedInstanceWithIdentifier:@"VCPSmileEspresso" andCreationBlock:v8];

  return v6;
}

VCPCNNModelEspresso *__43__VCPCNNSmileDetectorEspresso_sharedModel___block_invoke(uint64_t a1)
{
  v1 = [[VCPCNNModelEspresso alloc] initWithParameters:*(void *)(a1 + 32) inputNames:0 outputNames:0 properties:0];
  return v1;
}

- (int)computeSmileScore:(float *)a3
{
  int result = [(VCPCNNModelEspresso *)self->_modelEspresso espressoForward:self->_inputData];
  if (!result)
  {
    int result = [(VCPCNNModelEspresso *)self->_modelEspresso softmax];
    if (!result)
    {
      [(VCPCNNModelEspresso *)self->_modelEspresso outputBlob];
      int result = 0;
      *a3 = *(float *)(v6 + 4);
    }
  }
  return result;
}

- (void)dealloc
{
  inputData = self->_inputData;
  if (inputData) {
    MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNSmileDetectorEspresso;
  [(VCPCNNSmileDetectorEspresso *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end