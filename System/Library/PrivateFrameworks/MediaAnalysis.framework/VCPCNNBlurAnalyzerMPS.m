@interface VCPCNNBlurAnalyzerMPS
- (VCPCNNBlurAnalyzerMPS)init;
- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6;
- (int)computeSharpnessScore:(float *)a3 textureness:(char *)a4 contrast:(float)a5 imgWidth:(int)a6 cancel:(id)a7;
- (int)prepareModelForSourceWidth:(int)a3 andSourceHeight:(int)a4;
@end

@implementation VCPCNNBlurAnalyzerMPS

- (VCPCNNBlurAnalyzerMPS)init
{
  v8.receiver = self;
  v8.super_class = (Class)VCPCNNBlurAnalyzerMPS;
  v2 = [(VCPCNNBlurAnalyzer *)&v8 init];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
    v4 = [v3 resourceURL];

    uint64_t v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"cnn_blur.dat" relativeToURL:v4];
    modelURL = v2->_modelURL;
    v2->_modelURL = (NSURL *)v5;
  }
  return v2;
}

- (int)prepareModelForSourceWidth:(int)a3 andSourceHeight:(int)a4
{
  if (!+[VCPCNNMetalContext supportGPU]) {
    return -50;
  }
  uint64_t v5 = [[VCPCNNModel alloc] initWithParameters:1 useGPU:1];
  model = self->_model;
  self->_model = v5;

  if (!self->_model) {
    return -108;
  }
  v7 = +[VCPCNNConvBlock convBlockWithFilterSize:5 filterNum:20 chunk:1 reLU:1 padding:0];
  int v8 = [(VCPCNNModel *)self->_model add:v7];
  if (!v8)
  {
    v9 = +[VCPCNNConvBlock convBlockWithFilterSize:3 filterNum:32 chunk:1 reLU:1 padding:0];
    int v8 = [(VCPCNNModel *)self->_model add:v9];
    if (!v8)
    {
      v10 = +[VCPCNNPoolingBlock poolingBlockWithPoolX:2 poolY:2 chunk:1];
      int v8 = [(VCPCNNModel *)self->_model add:v10];
      if (!v8)
      {
        v11 = +[VCPCNNConvBlock convBlockWithFilterSize:3 filterNum:64 chunk:1 reLU:1 padding:0];
        int v8 = [(VCPCNNModel *)self->_model add:v11];
        if (!v8)
        {
          v12 = +[VCPCNNConvBlock convBlockWithFilterSize:3 filterNum:64 chunk:1 reLU:1 padding:0];
          int v8 = [(VCPCNNModel *)self->_model add:v12];
          if (!v8)
          {
            v13 = +[VCPCNNPoolingBlock poolingBlockWithPoolX:2 poolY:2 chunk:1];
            int v8 = [(VCPCNNModel *)self->_model add:v13];
            if (!v8)
            {
              v16 = +[VCPCNNConvBlock convBlockWithFilterSize:4 filterNum:100 chunk:1 reLU:1 padding:0];
              int v8 = [(VCPCNNModel *)self->_model add:v16];
              if (!v8)
              {
                v14 = +[VCPCNNConvBlock convBlockWithFilterSize:1 filterNum:36 chunk:1 reLU:0 padding:0];
                int v8 = [(VCPCNNModel *)self->_model add:v14];
              }
            }
          }
        }
      }
    }
  }
  return v8;
}

- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6
{
  uint64_t v6 = *(void *)&a4;
  *a5 = a3;
  *a6 = a4;
  uint64_t v8 = *a5;
  v9 = [(VCPCNNModel *)self->_model getGPUContext];
  v10 = +[VCPCNNData cnnDataWithPlane:1 height:v8 width:v6 context:v9];
  input = self->_input;
  self->_input = v10;

  [(VCPCNNData *)self->_input allocBuffers:1];
  v12 = self->_input;
  return [(VCPCNNData *)v12 data];
}

- (int)computeSharpnessScore:(float *)a3 textureness:(char *)a4 contrast:(float)a5 imgWidth:(int)a6 cancel:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  int v12 = [(VCPCNNModel *)self->_model dynamicForward:self->_input paramFileUrl:self->_modelURL cancel:a7];
  if (!v12)
  {
    v29 = [(VCPCNNModel *)self->_model output];
    uint64_t v24 = [v29 data];
    v28 = [(VCPCNNModel *)self->_model output];
    v27 = [v28 size];
    v26 = [v27 objectAtIndexedSubscript:0];
    unsigned int v22 = [v26 intValue];
    v25 = [(VCPCNNModel *)self->_model output];
    v23 = [v25 size];
    v13 = [v23 objectAtIndexedSubscript:1];
    uint64_t v14 = [v13 intValue];
    v15 = [(VCPCNNModel *)self->_model output];
    v16 = [v15 size];
    v17 = [v16 objectAtIndexedSubscript:2];
    uint64_t v18 = [v17 intValue];
    *(float *)&double v19 = a5;
    [(VCPCNNBlurAnalyzer *)self calculateScoreFromNetworkOutput:v24 outChannel:v22 outHeight:v14 outWidth:v18 textureness:a4 contrast:v7 imgWidth:v19];
    *(_DWORD *)a3 = v20;
  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end