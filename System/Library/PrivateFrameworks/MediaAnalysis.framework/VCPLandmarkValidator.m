@interface VCPLandmarkValidator
- (VCPLandmarkValidator)initWithModelFile:(id)a3 paramFile:(__sFILE *)a4 numTri:(unsigned __int8)a5 triList:(char *)a6 angle:(float *)a7;
- (float)orientation;
- (int)validateOneImage:(__CVBuffer *)a3 landmarks:(float *)a4 numofLandmarks:(int)a5 score:(float *)a6;
- (void)dealloc;
- (void)setOrientation:(float *)a3;
@end

@implementation VCPLandmarkValidator

- (VCPLandmarkValidator)initWithModelFile:(id)a3 paramFile:(__sFILE *)a4 numTri:(unsigned __int8)a5 triList:(char *)a6 angle:(float *)a7
{
  id v8 = a3;
  BOOL v9 = +[VCPCNNMetalContext supportGPU];
  if (+[VCPCNNMetalContext supportVectorForward]) {
    uint64_t v10 = 4;
  }
  else {
    uint64_t v10 = 1;
  }
  if (v9) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v10;
  }
  v34.receiver = self;
  v34.super_class = (Class)VCPLandmarkValidator;
  v12 = [(VCPLandmarkValidator *)&v34 init];
  if (!v12) {
    goto LABEL_26;
  }
  v13 = [[VCPCNNModel alloc] initWithParameters:1 useGPU:v9];
  model = v12->_model;
  v12->_model = v13;

  v15 = v12->_model;
  if (!v15) {
    goto LABEL_25;
  }
  v16 = [(VCPCNNModel *)v15 getGPUContext];
  uint64_t v17 = +[VCPCNNData cnnDataWithPlane:1 height:66 width:66 context:v16];
  input = v12->_input;
  v12->_input = (VCPCNNData *)v17;

  [(VCPCNNData *)v12->_input allocBuffers:1];
  BYTE4(v30) = 1;
  LODWORD(v30) = 1;
  v19 = +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:groups:stride:batchNorm:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:groups:stride:batchNorm:", 7, 10, v11, 1, 0, 1, v30);
  int v20 = [(VCPCNNModel *)v12->_model add:v19];
  if (!v20)
  {
    v33 = +[VCPCNNPoolingBlock poolingBlockWithPoolX:2 poolY:2 chunk:v11];
    int v20 = [(VCPCNNModel *)v12->_model add:v33];
    if (!v20)
    {
      BYTE4(v31) = 1;
      LODWORD(v31) = 1;
      v21 = +[VCPCNNConvBlock convBlockWithFilterSize:filterNum:chunk:reLU:padding:groups:stride:batchNorm:](VCPCNNConvBlock, "convBlockWithFilterSize:filterNum:chunk:reLU:padding:groups:stride:batchNorm:", 7, 10, v11, 1, 0, 1, v31);
      int v20 = [(VCPCNNModel *)v12->_model add:v21];
      if (!v20)
      {
        v32 = +[VCPCNNPoolingBlock poolingBlockWithPoolX:2 poolY:2 chunk:v11];
        int v20 = [(VCPCNNModel *)v12->_model add:v32];
        if (!v20)
        {
          if (v9
            || (v22 = [[VCPCNNFlattenBlock alloc] initWithParameters:v10], int v20 = [(VCPCNNModel *)v12->_model add:v22], v22, !v20))
          {
            v23 = +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:50 NeuronType:1];
            int v20 = [(VCPCNNModel *)v12->_model add:v23];
            if (!v20)
            {
              v24 = +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:2 NeuronType:0];
              int v20 = [(VCPCNNModel *)v12->_model add:v24];
              if (!v20)
              {
                v25 = v12->_model;
                v26 = [(VCPCNNData *)v12->_input size];
                int v20 = [(VCPCNNModel *)v25 prepareNetworkFromURL:v8 withInputSize:v26];

                if (!v20) {
                  operator new[]();
                }
              }
            }
          }
        }
      }
    }
  }
  if (v20) {
LABEL_25:
  }
    v27 = 0;
  else {
LABEL_26:
  }
    v27 = v12;
  v28 = v27;

  return v28;
}

- (void)dealloc
{
  transArray = self->_transArray;
  if (transArray) {
    MEMORY[0x1C186C790](transArray, 0x1000C8052888210);
  }
  meanLandmarkLoc = self->_meanLandmarkLoc;
  if (meanLandmarkLoc) {
    MEMORY[0x1C186C790](meanLandmarkLoc, 0x1000C8052888210);
  }
  triIndexMap = self->_triIndexMap;
  if (triIndexMap) {
    MEMORY[0x1C186C790](triIndexMap, 0x1000C8077774924);
  }
  triList = self->_triList;
  if (triList) {
    MEMORY[0x1C186C790](triList, 0x1000C8077774924);
  }
  orientation = self->_orientation;
  if (orientation) {
    MEMORY[0x1C186C790](orientation, 0x1000C8052888210);
  }
  v8.receiver = self;
  v8.super_class = (Class)VCPLandmarkValidator;
  [(VCPLandmarkValidator *)&v8 dealloc];
}

- (int)validateOneImage:(__CVBuffer *)a3 landmarks:(float *)a4 numofLandmarks:(int)a5 score:(float *)a6
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  signed int WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  signed int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  if (self->_numTri)
  {
    uint64_t v12 = 0;
    meanLandmarkLoc = self->_meanLandmarkLoc;
    triList = self->_triList;
    do
    {
      unsigned int v15 = *triList++;
      uint64_t v16 = 2 * v15;
      uint64_t v17 = &v77[v12];
      *uint64_t v17 = a4[v16];
      unsigned int v18 = (2 * v15) | 1;
      v17[3] = a4[v18];
      v17[6] = 1.0;
      float v19 = meanLandmarkLoc[v16] * 66.0;
      int v20 = &buf[v12 * 4];
      *(float *)int v20 = v19;
      *((float *)v20 + 3) = meanLandmarkLoc[v18] * 66.0;
      *((_DWORD *)v20 + 6) = 1065353216;
      ++v12;
    }
    while (v12 != 3);
    vcp_matrix_invert((float *)buf, 3);
  }
  v77[0] = 0.0;
  CVPixelBufferRef v78 = a3;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (a3)
  {
    CVReturn v21 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    LODWORD(v77[0]) = v21;
    if (!v21
      || (int v22 = v21, os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      && (*(float *)buf = 3.8521e-34,
          uint64_t v74 = (uint64_t)v78,
          __int16 v75 = 1024,
          int v76 = v22,
          _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (int v22 = LODWORD(v77[0])) == 0))
    {
      BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      v24 = [(VCPCNNData *)self->_input data];
      uint64_t v25 = 0;
      float v26 = 0.0;
      float v27 = 255.0;
      v28 = 0;
      v29 = v24;
      do
      {
        uint64_t v30 = 0;
        __C = v28;
        float v31 = (float)(int)v28;
        do
        {
          char v32 = self->_triIndexMap[v25 + v30];
          if (v32)
          {
            *(float *)buf = (float)(int)v30;
            uint64_t v74 = LODWORD(v31) | 0x3F80000000000000;
            matrix_multiplication(&self->_transArray[9 * (v32 - 1)], (const float *)buf, &v71, 3, 3, 1);
            signed int v36 = vcvtms_s32_f32(v71);
            signed int v37 = vcvtms_s32_f32(v72);
            if (WidthOfPlane >= v36) {
              int v38 = v36;
            }
            else {
              int v38 = WidthOfPlane;
            }
            uint64_t v39 = v38 & ~(v38 >> 31);
            if (v36 + 1 < WidthOfPlane) {
              int v40 = v36 + 1;
            }
            else {
              int v40 = WidthOfPlane;
            }
            uint64_t v41 = v40 & ~(v40 >> 31);
            if (HeightOfPlane >= v37) {
              int v42 = v37;
            }
            else {
              int v42 = HeightOfPlane;
            }
            uint64_t v43 = v42 & ~(v42 >> 31);
            if (v37 + 1 < HeightOfPlane) {
              int v44 = v37 + 1;
            }
            else {
              int v44 = HeightOfPlane;
            }
            float v45 = v71 - (float)(int)v39;
            float v46 = v72 - (float)(int)v43;
            size_t v47 = BytesPerRowOfPlane * v43;
            size_t v48 = BytesPerRowOfPlane * (v44 & ~(v44 >> 31));
            LOBYTE(v33) = BaseAddressOfPlane[v47 + v39];
            LOBYTE(v34) = BaseAddressOfPlane[v47 + v41];
            *(float *)&unsigned int v49 = v45 * (float)v34;
            float v50 = *(float *)&v49 + (float)((float)v33 * (float)(1.0 - v45));
            LOBYTE(v49) = BaseAddressOfPlane[v48 + v39];
            LOBYTE(v35) = BaseAddressOfPlane[v48 + v41];
            float v51 = (float)(v46 * (float)((float)(v45 * (float)v35) + (float)((float)v49 * (float)(1.0 - v45))))
                + (float)(v50 * (float)(1.0 - v46));
            float v27 = fminf(v27, v51);
            float v26 = fmaxf(v26, v51);
            v29[v30] = v51;
          }
          else
          {
            v29[v30] = 0.0;
          }
          ++v30;
        }
        while (v30 != 66);
        v28 = (float *)((char *)__C + 1);
        v29 += 66;
        v25 += 66;
      }
      while (__C != (float *)65);
      int v22 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)v77);
      if (!v22)
      {
        uint64_t v52 = 0;
        float v53 = fmax((float)(v26 - v27), 1.0);
        triIndexMap = self->_triIndexMap;
        do
        {
          for (uint64_t i = 0; i != 66; ++i)
          {
            if (triIndexMap[i]) {
              float v56 = (float)(v24[i] - v27) / v53;
            }
            else {
              float v56 = 0.0;
            }
            v24[i] = v56;
          }
          ++v52;
          v24 += 66;
          triIndexMap += 66;
        }
        while (v52 != 66);
        int v22 = [(VCPCNNModel *)self->_model forward:self->_input];
        if (!v22)
        {
          v57 = [(VCPCNNModel *)self->_model output];
          int v58 = [v57 softmax];

          int v22 = v58;
          if (!v58)
          {
            v59 = [(VCPCNNModel *)self->_model output];
            *a6 = *(float *)([v59 data] + 4);

            int v22 = 0;
          }
        }
      }
    }
  }
  else
  {
    BOOL v60 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v60) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v60, v61, v62, v63, v64, v65, v66, v67);
    }
    int v22 = -50;
    v77[0] = NAN;
  }
  if (v78
    && !LODWORD(v77[0])
    && CVPixelBufferUnlockBaseAddress(v78, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:]();
  }
  return v22;
}

- (float)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(float *)a3
{
  self->_orientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end