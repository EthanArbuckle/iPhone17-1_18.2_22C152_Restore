@interface VCPCNNBlurAnalyzerEspresso
+ (id)sharedModel:(id)a3;
+ (id)sharedModelPoolWithRevision:(unint64_t)a3;
- (VCPCNNBlurAnalyzerEspresso)init;
- (VCPCNNBlurAnalyzerEspresso)initWithRevision:(unint64_t)a3;
- (float)calculateScoreFromNetworkOutputV2:(float *)a3;
- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6;
- (int)computeSharpnessScore:(float *)a3 textureness:(char *)a4 contrast:(float)a5 imgWidth:(int)a6 cancel:(id)a7;
- (int)prepareModelForSourceWidth:(int)a3 andSourceHeight:(int)a4;
- (void)copyBufferFrom:(char *)a3 fromStride:(int64_t)a4 toPtr:(float *)a5 toStride:(int64_t)a6 toWidth:(int)a7 toHeight:(int)a8;
- (void)dealloc;
@end

@implementation VCPCNNBlurAnalyzerEspresso

+ (id)sharedModelPoolWithRevision:(unint64_t)a3
{
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"VCPCNNBlurAnalyzerEspresso.sharedModelPool-%lu", a3);
  v5 = +[VCPSharedInstanceManager sharedManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__VCPCNNBlurAnalyzerEspresso_sharedModelPoolWithRevision___block_invoke;
  v8[3] = &__block_descriptor_40_e20___VCPObjectPool_8__0l;
  v8[4] = a3;
  v6 = [v5 sharedInstanceWithIdentifier:v4 andCreationBlock:v8];

  return v6;
}

id __58__VCPCNNBlurAnalyzerEspresso_sharedModelPoolWithRevision___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__VCPCNNBlurAnalyzerEspresso_sharedModelPoolWithRevision___block_invoke_2;
  v3[3] = &__block_descriptor_40_e26___VCPCNNModelEspresso_8__0l;
  v3[4] = *(void *)(a1 + 32);
  v1 = +[VCPObjectPool objectPoolWithAllocator:v3];
  return v1;
}

VCPCNNModelEspresso *__58__VCPCNNBlurAnalyzerEspresso_sharedModelPoolWithRevision___block_invoke_2(uint64_t a1)
{
  v2 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  v3 = [v2 resourceURL];

  if (*(void *)(a1 + 32) == 2) {
    v4 = @"cnn_blurV2.espresso.net";
  }
  else {
    v4 = @"cnn_blur.espresso.net";
  }
  v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4 relativeToURL:v3];
  v6 = [[VCPCNNModelEspresso alloc] initWithParameters:v5 inputNames:0 outputNames:0 properties:0];

  return v6;
}

- (VCPCNNBlurAnalyzerEspresso)initWithRevision:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)VCPCNNBlurAnalyzerEspresso;
  v4 = -[VCPCNNBlurAnalyzer initWithRevision:](&v12, sel_initWithRevision_);
  if (v4)
  {
    v5 = +[VCPCNNBlurAnalyzerEspresso sharedModelPoolWithRevision:a3];
    uint64_t v6 = [v5 getObject];
    modelEspresso = v4->_modelEspresso;
    v4->_modelEspresso = (VCPLoaned *)v6;

    v8 = v4->_modelEspresso;
    if (v8)
    {
      resConfig = v4->_resConfig;
      v4->_resConfig = (NSString *)&stru_1F15A0D70;

      v8 = v4;
    }
  }
  else
  {
    v8 = 0;
  }
  v10 = v8;

  return v10;
}

- (VCPCNNBlurAnalyzerEspresso)init
{
  return [(VCPCNNBlurAnalyzerEspresso *)self initWithRevision:1];
}

- (void)dealloc
{
  inputData = self->_inputData;
  if (inputData) {
    MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNBlurAnalyzerEspresso;
  [(VCPCNNBlurAnalyzerEspresso *)&v4 dealloc];
}

+ (id)sharedModel:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[VCPSharedInstanceManager sharedManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__VCPCNNBlurAnalyzerEspresso_sharedModel___block_invoke;
  v8[3] = &unk_1E6298108;
  id v5 = v3;
  id v9 = v5;
  uint64_t v6 = [v4 sharedInstanceWithIdentifier:@"VCPBlurEspresso" andCreationBlock:v8];

  return v6;
}

VCPCNNModelEspresso *__42__VCPCNNBlurAnalyzerEspresso_sharedModel___block_invoke(uint64_t a1)
{
  v1 = [[VCPCNNModelEspresso alloc] initWithParameters:*(void *)(a1 + 32) inputNames:0 outputNames:0 properties:0];
  return v1;
}

- (float)calculateScoreFromNetworkOutputV2:(float *)a3
{
  uint64_t v5 = 0;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v3 = 0;
  do
  {
    long long v9 = v3;
    float v6 = expf(a3[v5]);
    long long v3 = v9;
    v10.f32[v5] = v6;
    *(float *)&long long v3 = *(float *)&v9 + v6;
    ++v5;
  }
  while (v5 != 4);
  float32x4_t v7 = vmulq_f32(vdivq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v3, 0)), (float32x4_t)xmmword_1BC283280);
  return (float)((float)((float)(v7.f32[0] + 0.0) + v7.f32[1]) + v7.f32[2]) + v7.f32[3];
}

- (int)prepareModelForSourceWidth:(int)a3 andSourceHeight:(int)a4
{
  if (self->_srcWidth == a3 && self->_srcHeight == a4) {
    return 0;
  }
  if (a4 == 299 && a3 == 299)
  {
    resConfig = self->_resConfig;
    float32x4_t v10 = @"res_299x299";
  }
  else if (a4 == a3)
  {
    resConfig = self->_resConfig;
    float32x4_t v10 = @"res_400x400";
  }
  else
  {
    resConfig = self->_resConfig;
    if (a4 >= a3) {
      float32x4_t v10 = @"res_300x400";
    }
    else {
      float32x4_t v10 = @"res_400x300";
    }
  }
  self->_resConfig = &v10->isa;

  uint64_t v11 = [(VCPLoaned *)self->_modelEspresso object];
  int v7 = [v11 prepareModelWithConfig:self->_resConfig];

  if (!v7)
  {
    self->_srcHeight = 0;
    self->_srcWidth = 0;
    inputData = self->_inputData;
    if (inputData) {
      MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
    }
    v13 = [(VCPLoaned *)self->_modelEspresso object];
    v14 = v13;
    if (v13)
    {
      [v13 inputBlob];
      uint64_t v15 = v27;
    }
    else
    {
      uint64_t v15 = 0;
    }
    v16 = [(VCPLoaned *)self->_modelEspresso object];
    v17 = v16;
    if (v16)
    {
      [v16 inputBlob];
      uint64_t v18 = v26;
    }
    else
    {
      uint64_t v18 = 0;
    }
    v19 = [(VCPLoaned *)self->_modelEspresso object];
    v20 = v19;
    if (v19)
    {
      [v19 inputBlob];
      uint64_t v21 = v25;
    }
    else
    {
      uint64_t v21 = 0;
    }
    unint64_t v22 = v18 * v15 * v21;
    if (v22 >> 62) {
      size_t v23 = -1;
    }
    else {
      size_t v23 = 4 * v22;
    }
    self->_inputData = (float *)operator new[](v23, MEMORY[0x1E4FBA2D0]);

    if (self->_inputData)
    {
      int v7 = 0;
      self->_srcWidth = a3;
      self->_srcHeight = a4;
    }
    else
    {
      return -108;
    }
  }
  return v7;
}

- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6
{
  long long v9 = [(VCPLoaned *)self->_modelEspresso object];
  float32x4_t v10 = v9;
  if (v9)
  {
    [v9 inputBlob];
    int v11 = v17;
  }
  else
  {
    int v11 = 0;
    int v16 = 0;
  }
  *a5 = v11;

  objc_super v12 = [(VCPLoaned *)self->_modelEspresso object];
  v13 = v12;
  if (v12)
  {
    [v12 inputBlob];
    int v14 = v16;
  }
  else
  {
    int v14 = 0;
  }
  *a6 = v14;

  return self->_inputData;
}

- (int)computeSharpnessScore:(float *)a3 textureness:(char *)a4 contrast:(float)a5 imgWidth:(int)a6 cancel:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  id v12 = a7;
  v13 = v12;
  if (v12 && ((*((uint64_t (**)(id))v12 + 2))(v12) & 1) != 0)
  {
    int v14 = -128;
  }
  else
  {
    uint64_t v15 = [(VCPLoaned *)self->_modelEspresso object];
    int v14 = [v15 espressoForward:self->_inputData];

    if (!v14)
    {
      if ([(VCPCNNBlurAnalyzer *)self getRevision] == 2)
      {
        int v16 = [(VCPLoaned *)self->_modelEspresso object];
        int v17 = v16;
        if (v16)
        {
          [v16 outputBlob];
          uint64_t v18 = v35;
        }
        else
        {
          uint64_t v18 = 0;
          uint64_t v45 = 0;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
        }
        -[VCPCNNBlurAnalyzerEspresso calculateScoreFromNetworkOutputV2:](self, "calculateScoreFromNetworkOutputV2:", v18, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45);
        *(_DWORD *)a3 = v22;
      }
      else
      {
        v19 = [(VCPLoaned *)self->_modelEspresso object];
        v20 = v19;
        if (v19)
        {
          [v19 outputBlob];
          uint64_t v21 = v41;
        }
        else
        {
          uint64_t v21 = 0;
          uint64_t v45 = 0;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
        }

        size_t v23 = [(VCPLoaned *)self->_modelEspresso object];
        v24 = v23;
        if (v23)
        {
          [v23 outputBlob];
          uint64_t v25 = DWORD2(v40);
        }
        else
        {
          uint64_t v25 = 0;
          uint64_t v45 = 0;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
        }

        uint64_t v26 = [(VCPLoaned *)self->_modelEspresso object];
        uint64_t v27 = v26;
        if (v26)
        {
          [v26 outputBlob];
          uint64_t v28 = v40;
        }
        else
        {
          uint64_t v28 = 0;
          uint64_t v45 = 0;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
        }

        v29 = [(VCPLoaned *)self->_modelEspresso object];
        v30 = v29;
        if (v29)
        {
          [v29 outputBlob];
          uint64_t v32 = v35;
        }
        else
        {
          uint64_t v32 = 0;
          uint64_t v45 = 0;
          HIDWORD(v31) = 0;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
        }
        *(float *)&double v31 = a5;
        -[VCPCNNBlurAnalyzer calculateScoreFromNetworkOutput:outChannel:outHeight:outWidth:textureness:contrast:imgWidth:](self, "calculateScoreFromNetworkOutput:outChannel:outHeight:outWidth:textureness:contrast:imgWidth:", v32, v21, v25, v28, a4, v7, v31, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44,
          v45);
        *(_DWORD *)a3 = v33;
      }
      int v14 = 0;
    }
  }

  return v14;
}

- (void)copyBufferFrom:(char *)a3 fromStride:(int64_t)a4 toPtr:(float *)a5 toStride:(int64_t)a6 toWidth:(int)a7 toHeight:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v9 = *(void *)&a7;
  if ([(VCPCNNBlurAnalyzer *)self getRevision] == 2)
  {
    if ((int)v8 >= 1)
    {
      int v16 = 0;
      float v17 = 0.0;
      uint64_t v18 = a3;
      do
      {
        if ((int)v9 >= 1)
        {
          uint64_t v19 = 0;
          do
          {
            LOBYTE(v15) = v18[v19];
            float v15 = (float)LODWORD(v15);
            float v17 = v17 + v15;
            ++v19;
          }
          while (v9 != v19);
        }
        v18 += a4;
        ++v16;
      }
      while (v16 != v8);
      float v20 = v17 / (float)((float)((float)(int)v9 * 255.0) * (float)(int)v8);
      int v21 = 0;
      int64_t v22 = 4 * a6;
      if (v20 >= 0.1)
      {
        do
        {
          if ((int)v9 >= 1)
          {
            uint64_t v24 = 0;
            do
            {
              LOBYTE(v20) = a3[v24];
              float v20 = (float)LODWORD(v20) / 255.0;
              a5[v24++] = v20;
            }
            while (v9 != v24);
          }
          a3 += a4;
          ++v21;
          a5 = (float *)((char *)a5 + v22);
        }
        while (v21 != v8);
      }
      else
      {
        do
        {
          if ((int)v9 >= 1)
          {
            uint64_t v23 = 0;
            do
            {
              LOBYTE(v20) = a3[v23];
              float v20 = (float)((float)LODWORD(v20) + (float)LODWORD(v20)) / 255.0;
              a5[v23++] = v20;
            }
            while (v9 != v23);
          }
          a3 += a4;
          ++v21;
          a5 = (float *)((char *)a5 + v22);
        }
        while (v21 != v8);
      }
    }
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)VCPCNNBlurAnalyzerEspresso;
    [(VCPCNNBlurAnalyzer *)&v25 copyBufferFrom:a3 fromStride:a4 toPtr:a5 toStride:a6 toWidth:v9 toHeight:v8];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resConfig, 0);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

@end