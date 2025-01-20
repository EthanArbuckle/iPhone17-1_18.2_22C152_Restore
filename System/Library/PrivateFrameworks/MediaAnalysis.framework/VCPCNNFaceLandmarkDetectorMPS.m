@interface VCPCNNFaceLandmarkDetectorMPS
- (VCPCNNFaceLandmarkDetectorMPS)init;
- (float)getInputBuffer;
- (int)computeLandmarks:(float *)a3;
@end

@implementation VCPCNNFaceLandmarkDetectorMPS

- (VCPCNNFaceLandmarkDetectorMPS)init
{
  BOOL v3 = +[VCPCNNMetalContext supportGPU];
  if (+[VCPCNNMetalContext supportVectorForward]) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 1;
  }
  if (v3) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  v33.receiver = self;
  v33.super_class = (Class)VCPCNNFaceLandmarkDetectorMPS;
  v6 = [(VCPCNNFaceLandmarkDetectorMPS *)&v33 init];
  if (!v6) {
    goto LABEL_23;
  }
  v7 = [[VCPCNNModel alloc] initWithParameters:1 useGPU:v3];
  modelLandmarks = v6->_modelLandmarks;
  v6->_modelLandmarks = v7;

  v9 = v6->_modelLandmarks;
  if (!v9)
  {
LABEL_22:
    v16 = 0;
LABEL_24:
    v13 = v16;
    goto LABEL_25;
  }
  v10 = [(VCPCNNModel *)v9 getGPUContext];
  uint64_t v11 = +[VCPCNNData cnnDataWithPlane:1 height:40 width:40 context:v10];
  faceInput = v6->_faceInput;
  v6->_faceInput = (VCPCNNData *)v11;

  [(VCPCNNData *)v6->_faceInput allocBuffers:1];
  v13 = +[VCPCNNConvBlock convBlockWithFilterSize:5 filterNum:20 chunk:v5 reLU:1 padding:0];
  int v14 = [(VCPCNNModel *)v6->_modelLandmarks add:v13];
  if (v14) {
    goto LABEL_20;
  }
  v32 = +[VCPCNNPoolingBlock poolingBlockWithPoolX:2 poolY:2 chunk:v5];
  int v14 = [(VCPCNNModel *)v6->_modelLandmarks add:v32];
  if (v14)
  {
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  v31 = +[VCPCNNConvBlock convBlockWithFilterSize:3 filterNum:48 chunk:v5 reLU:1 padding:0];
  int v14 = [(VCPCNNModel *)v6->_modelLandmarks add:v31];
  if (v14)
  {
LABEL_18:

    goto LABEL_19;
  }
  v30 = +[VCPCNNPoolingBlock poolingBlockWithPoolX:2 poolY:2 chunk:v5];
  int v14 = [(VCPCNNModel *)v6->_modelLandmarks add:v30];
  if (v14)
  {
LABEL_17:

    goto LABEL_18;
  }
  v29 = +[VCPCNNConvBlock convBlockWithFilterSize:3 filterNum:64 chunk:v5 reLU:1 padding:0];
  int v14 = [(VCPCNNModel *)v6->_modelLandmarks add:v29];
  if (v14)
  {
LABEL_16:

    goto LABEL_17;
  }
  v15 = +[VCPCNNPoolingBlock poolingBlockWithPoolX:2 poolY:2 chunk:v5];
  int v14 = [(VCPCNNModel *)v6->_modelLandmarks add:v15];
  if (v14)
  {

    goto LABEL_16;
  }
  v18 = +[VCPCNNConvBlock convBlockWithFilterSize:2 filterNum:64 chunk:v5 reLU:1 padding:0];
  int v14 = [(VCPCNNModel *)v6->_modelLandmarks add:v18];
  if (v14
    || !v3
    && (v21 = [[VCPCNNFlattenBlock alloc] initWithParameters:v4], int v14 = [(VCPCNNModel *)v6->_modelLandmarks add:v21], v21, v14))
  {
    v19 = v15;
    int v20 = 4;
  }
  else
  {
    v19 = v15;
    v22 = +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:100 NeuronType:1];
    int v14 = [(VCPCNNModel *)v6->_modelLandmarks add:v22];
    if (v14)
    {
      int v20 = 4;
    }
    else
    {
      v28 = +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:14 NeuronType:1];
      int v14 = [(VCPCNNModel *)v6->_modelLandmarks add:v28];
      if (v14)
      {
        int v20 = 4;
      }
      else
      {
        v23 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
        v27 = [v23 resourceURL];

        v26 = [MEMORY[0x1E4F1CB10] URLWithString:@"cnn_lm.dat" relativeToURL:v27];
        v24 = v6->_modelLandmarks;
        v25 = [(VCPCNNData *)v6->_faceInput size];
        int v14 = [(VCPCNNModel *)v24 prepareNetworkFromURL:v26 withInputSize:v25];

        int v20 = 4 * (v14 != 0);
      }
    }
  }

  if ((v20 | 4) == 4)
  {
LABEL_21:
    if (v14) {
      goto LABEL_22;
    }
LABEL_23:
    v16 = v6;
    goto LABEL_24;
  }
LABEL_25:

  return v13;
}

- (float)getInputBuffer
{
  return [(VCPCNNData *)self->_faceInput data];
}

- (int)computeLandmarks:(float *)a3
{
  int result = [(VCPCNNData *)self->_faceInput normalization];
  if (!result)
  {
    int result = [(VCPCNNModel *)self->_modelLandmarks forward:self->_faceInput];
    if (!result)
    {
      unint64_t v6 = 0;
      int v7 = 1;
      while (1)
      {
        v8 = [(VCPCNNModel *)self->_modelLandmarks output];
        v9 = [v8 size];
        unint64_t v10 = [v9 count];

        uint64_t v11 = [(VCPCNNModel *)self->_modelLandmarks output];
        v12 = v11;
        if (v10 <= v6) {
          break;
        }
        v13 = [v11 size];
        int v14 = [v13 objectAtIndexedSubscript:v6];
        v7 *= [v14 intValue];

        ++v6;
      }
      memcpy(a3, (const void *)[v11 data], 4 * v7);

      return 0;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceInput, 0);
  objc_storeStrong((id *)&self->_modelLandmarks, 0);
}

@end