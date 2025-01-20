@interface VCPCNNPersonDetector
- (VCPCNNPersonDetector)initWithMaxNumRegions:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 inputConfig:(id)a6;
- (id).cxx_construct;
- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4;
- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 inputHeight:(int)a5 inputWidth:(int)a6;
- (int)generatePersonBoxes:(id)a3;
- (int)generatePersonRegions:(const void *)a3 boxes:(id)a4 maxNumRegions:(int)a5;
- (int)personDetection:(__CVBuffer *)a3 personRegions:(id)a4 cancel:(id)a5;
- (int)retrieveBoxes:(float *)a3 outHeight:(int)a4 outWidth:(int)a5 boxes:(id)a6 anchorBox:(float)a7[3][2];
- (void)nonMaxSuppression:(id)a3;
@end

@implementation VCPCNNPersonDetector

- (VCPCNNPersonDetector)initWithMaxNumRegions:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 inputConfig:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  v55[2] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  self->_maxNumRegions = a3;
  outputNames = self->_outputNames;
  self->_outputNames = (NSArray *)&unk_1F15EE748;

  std::vector<void *>::resize((uint64_t)&self->_outputsData, [(NSArray *)self->_outputNames count]);
  v53.receiver = self;
  v53.super_class = (Class)VCPCNNPersonDetector;
  v12 = [(VCPCNNPersonDetector *)&v53 init];
  if (v12)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
    v14 = [v13 resourceURL];

    v15 = [MEMORY[0x1E4F1CB10] URLWithString:@"cnn_person_detector.espresso.net" relativeToURL:v14];
    v16 = [VCPCNNModelEspresso alloc];
    v17 = v12->_outputNames;
    v54[0] = @"forceCPU";
    v18 = [NSNumber numberWithBool:v7];
    v55[0] = v18;
    v54[1] = @"sharedContext";
    v19 = [NSNumber numberWithBool:v6];
    v55[1] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];
    uint64_t v21 = [(VCPCNNModelEspresso *)v16 initWithParameters:v15 inputNames:0 outputNames:v17 properties:v20];
    modelEspresso = v12->_modelEspresso;
    v12->_modelEspresso = (VCPCNNModelEspresso *)v21;

    v23 = v12->_modelEspresso;
    if (!v23 || [(VCPCNNModelEspresso *)v23 prepareModelWithConfig:v10]) {
      goto LABEL_4;
    }
    v27 = v12->_modelEspresso;
    if (v27)
    {
      [(VCPCNNModelEspresso *)v27 inputBlob];
      uint64_t v28 = *((void *)&v52 + 1);
    }
    else
    {
      uint64_t v28 = 0;
      long long v52 = 0u;
      v51 = 0;
    }
    v29 = v12->_modelEspresso;
    if (v29)
    {
      [(VCPCNNModelEspresso *)v29 inputBlob];
      uint64_t v30 = v50;
    }
    else
    {
      uint64_t v30 = 0;
      v49 = 0;
    }
    v31 = v12->_modelEspresso;
    if (v31)
    {
      [(VCPCNNModelEspresso *)v31 inputBlob];
      uint64_t v32 = v48;
    }
    else
    {
      uint64_t v32 = 0;
    }
    unint64_t v33 = v30 * v28 * v32;
    size_t v34 = v33 >> 62 ? -1 : 4 * v33;
    v12->_inputData = (float *)operator new[](v34, MEMORY[0x1E4FBA2D0]);
    v35 = v12->_modelEspresso;
    if (v35)
    {
      [(VCPCNNModelEspresso *)v35 inputBlob];
      int v36 = v52;
    }
    else
    {
      int v36 = 0;
    }
    v12->_inputWidth = v36;
    v37 = v12->_modelEspresso;
    if (v37)
    {
      [(VCPCNNModelEspresso *)v37 inputBlob];
      int v38 = DWORD2(v52);
    }
    else
    {
      int v38 = 0;
    }
    v12->_inputHeight = v38;
    if (v12->_inputData)
    {
      uint64_t v39 = 0;
      unint64_t v40 = 0;
      v41 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
      while ([(NSArray *)v12->_outputNames count] > v40)
      {
        [(VCPCNNModelEspresso *)v12->_modelEspresso outputBlobs];
        uint64_t v42 = *(void *)&v51[v39 + 88];
        [(VCPCNNModelEspresso *)v12->_modelEspresso outputBlobs];
        uint64_t v43 = *(void *)&v49[v39 + 80];
        [(VCPCNNModelEspresso *)v12->_modelEspresso outputBlobs];
        unint64_t v44 = v43 * v42 * *(void *)&__p[v39 + 96];
        if (v44 >> 62) {
          size_t v45 = -1;
        }
        else {
          size_t v45 = 4 * v44;
        }
        v12->_outputsData.__begin_[v40] = (float *)operator new[](v45, v41);
        if (__p) {
          operator delete(__p);
        }
        if (v49) {
          operator delete(v49);
        }
        if (v51) {
          operator delete(v51);
        }
        v46 = v12->_outputsData.__begin_[v40++];
        v39 += 168;
        if (!v46) {
          goto LABEL_4;
        }
      }
      v24 = v12;
    }
    else
    {
LABEL_4:
      v24 = 0;
    }
  }
  else
  {
    v24 = 0;
  }
  v25 = v24;

  return v25;
}

- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4
{
  if (CVPixelBufferGetPixelFormatType(a3) != 1111970369) {
    return -50;
  }
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (!a3)
  {
    BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v11) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
    return -50;
  }
  int v8 = Height;
  CVReturn v9 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVReturn v30 = v9;
  if (v9)
  {
    int v10 = v9;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:]();
    }
  }
  else
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    bzero(a4, 3 * 4 * Width * v8);
    if (v8 >= 1)
    {
      int v23 = 0;
      v24 = &a4[2 * v8 * Width];
      v25 = &a4[v8 * Width];
      uint64_t v26 = 4 * Width;
      do
      {
        if (Width >= 1)
        {
          for (uint64_t i = 0; i != Width; ++i)
          {
            LOBYTE(v22) = BaseAddress[(int)(i * 4)];
            double v28 = (double)*(unint64_t *)&v22 / 255.0;
            *(float *)&double v28 = v28;
            a4[i] = *(float *)&v28;
            LOBYTE(v28) = BaseAddress[(int)(i * 4) + 1];
            double v29 = (double)*(unint64_t *)&v28 / 255.0;
            *(float *)&double v29 = v29;
            v25[i] = *(float *)&v29;
            LOBYTE(v29) = BaseAddress[(int)(i * 4) + 2];
            double v22 = (double)*(unint64_t *)&v29 / 255.0;
            *(float *)&double v22 = v22;
            v24[i] = *(float *)&v22;
          }
        }
        BaseAddress += BytesPerRow;
        ++v23;
        v24 = (float *)((char *)v24 + v26);
        v25 = (float *)((char *)v25 + v26);
        a4 = (float *)((char *)a4 + v26);
      }
      while (v23 != v8);
    }
    int v10 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v30);
    if (pixelBuffer
      && !v30
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[VCPCNNSmileDetector detectSmileForFace:inBuffer:smile:]();
    }
  }
  return v10;
}

- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 inputHeight:(int)a5 inputWidth:(int)a6
{
  if (!a3) {
    return -108;
  }
  CFTypeRef cf = 0;
  Scaler::Scale(&self->_scaler, a4, (__CVBuffer **)&cf, *(uint64_t *)&a6, *(uint64_t *)&a5, 1111970369);
  int v9 = v8;
  if (!v8) {
    int v9 = [(VCPCNNPersonDetector *)self copyImage:cf toData:a3];
  }
  if (cf) {
    CFRelease(cf);
  }
  return v9;
}

- (int)generatePersonBoxes:(id)a3
{
  id v4 = a3;
  int v5 = [(VCPCNNModelEspresso *)self->_modelEspresso espressoForward:self->_inputData];
  if (!v5)
  {
    modelEspresso = self->_modelEspresso;
    if (modelEspresso)
    {
      [(VCPCNNModelEspresso *)modelEspresso outputBlobs];
    }
    else
    {
      __p = 0;
      int v9 = 0;
      uint64_t v10 = 0;
    }
    int v5 = [(VCPCNNPersonDetector *)self generatePersonRegions:&__p boxes:v4 maxNumRegions:self->_maxNumRegions];
    if (__p)
    {
      int v9 = __p;
      operator delete(__p);
    }
  }

  return v5;
}

- (void)nonMaxSuppression:(id)a3
{
  id v19 = a3;
  unint64_t v3 = [v19 count];
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      int v5 = [v19 objectAtIndexedSubscript:i];
      LODWORD(v6) = 1.0;
      [v5 setFlag:v6];
    }
    uint64_t v7 = 0;
    uint64_t v8 = 1;
    do
    {
      int v9 = [v19 objectAtIndexedSubscript:v7];
      [v9 flag];
      BOOL v11 = v10 == 1.0 && v3 > ++v7;
      unint64_t v12 = v8;
      if (v11)
      {
        do
        {
          uint64_t v13 = [v19 objectAtIndexedSubscript:v12];
          [v13 flag];
          if (v14 == 1.0)
          {
            [v9 computeIntersectionOverUnion:v13];
            if (v15 > 0.45)
            {
              [v9 confidence];
              float v17 = v16;
              [v13 confidence];
              if (v17 <= v18)
              {
                [v9 setFlag:0.0];

                break;
              }
              [v13 setFlag:0.0];
            }
          }

          ++v12;
        }
        while (v3 > v12);
      }

      ++v8;
    }
    while (v7 != v3);
  }
}

- (int)retrieveBoxes:(float *)a3 outHeight:(int)a4 outWidth:(int)a5 boxes:(id)a6 anchorBox:(float)a7[3][2]
{
  id v52 = a6;
  if (a4 >= 1)
  {
    uint64_t v9 = a5 * a4;
    float v48 = (float)a4;
    uint64_t v44 = a4;
    v46 = &a3[4 * a5 * a4];
    uint64_t v47 = 0;
    int v49 = 6 * a5 * a4;
    float v10 = 0.5;
    do
    {
      if (a5 >= 1)
      {
        uint64_t v11 = 0;
        unint64_t v12 = v46;
        do
        {
          int v13 = 0;
          float v14 = 0.0;
          int v15 = -1;
          float v16 = v12;
          do
          {
            float v17 = 1.0 / (float)(expf(-*v16) + 1.0);
            if (v17 > v14)
            {
              float v14 = v17;
              int v15 = v13;
            }
            ++v13;
            v16 += v49;
          }
          while (v13 != 3);
          if (v14 > v10)
          {
            float v18 = &a3[(int)v11 + (int)v47 * a5 + v49 * v15];
            float v19 = *v18;
            v20 = &v18[v9];
            float v21 = *v20;
            inputint Width = self->_inputWidth;
            inputint Height = self->_inputHeight;
            v24 = &v20[v9];
            float v25 = *v24;
            uint64_t v26 = &(*a7)[2 * v15];
            float v27 = v24[v9];
            float v28 = *v26;
            float v29 = v26[1];
            CVReturn v30 = [VCPBoundingBox alloc];
            float v31 = expf(v27);
            float v32 = expf(v25);
            float v33 = expf(-v21) + 1.0;
            float v34 = -v19;
            float v35 = 1.0 / v33;
            float v36 = expf(v34);
            *(float *)&double v37 = v31 * v29;
            *(float *)&double v38 = v32 * v28;
            *(float *)&double v39 = (float)((float)(v35 + (float)(int)v47) * (float)inputHeight) / v48;
            *(float *)&double v40 = (float)((float)((float)(1.0 / (float)(v36 + 1.0)) + (float)(int)v11) * (float)inputWidth)
                           / (float)a5;
            *(float *)&double v41 = v14;
            uint64_t v42 = [(VCPBoundingBox *)v30 initWithCenterAndSize:v40 y:v39 width:v38 height:v37 confidence:v41];
            [v52 addObject:v42];

            float v10 = 0.5;
          }
          ++v11;
          ++v12;
        }
        while (v11 != a5);
      }
      v46 += a5;
      ++v47;
    }
    while (v47 != v44);
  }

  return 0;
}

- (int)generatePersonRegions:(const void *)a3 boxes:(id)a4 maxNumRegions:(int)a5
{
  id v8 = a4;
  uint64_t v9 = *(void *)a3;
  if (*(void *)a3 != *((void *)a3 + 1))
  {
    float v10 = (char *)&kAnchorBoxes;
    do
    {
      [(VCPCNNPersonDetector *)self retrieveBoxes:*(void *)v9 outHeight:*(unsigned int *)(v9 + 88) outWidth:*(unsigned int *)(v9 + 80) boxes:v8 anchorBox:v10];
      v10 += 24;
      v9 += 168;
    }
    while (v9 != *((void *)a3 + 1));
  }
  [(VCPCNNPersonDetector *)self nonMaxSuppression:v8];
  [v8 sortUsingComparator:&__block_literal_global_83];
  while ([v8 count] > (unint64_t)a5)
    [v8 removeLastObject];
  uint64_t v11 = [v8 lastObject];
  if (v11)
  {
    do
    {
      [v11 flag];
      if (v12 != 0.0) {
        break;
      }
      [v8 removeLastObject];
      uint64_t v13 = [v8 lastObject];

      uint64_t v11 = (void *)v13;
    }
    while (v13);
  }
  return 0;
}

uint64_t __66__VCPCNNPersonDetector_generatePersonRegions_boxes_maxNumRegions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  [v6 maxX];
  float v32 = v8;
  [v6 minX];
  float v10 = v9;
  [v6 maxY];
  float v12 = v11;
  [v6 minY];
  float v14 = v13;
  [v7 maxX];
  float v16 = v15;
  [v7 minX];
  float v18 = v17;
  [v7 maxY];
  float v20 = v19;
  [v7 minY];
  float v22 = v21;
  [v6 flag];
  float v24 = v23;
  [v7 flag];
  if (v24 <= v25)
  {
    [v6 flag];
    float v28 = v27;
    [v7 flag];
    uint64_t v30 = -1;
    if ((float)((float)(v32 - v10) * (float)(v12 - v14)) <= (float)((float)(v16 - v18) * (float)(v20 - v22))) {
      uint64_t v30 = 1;
    }
    if (v28 >= v29) {
      uint64_t v26 = v30;
    }
    else {
      uint64_t v26 = 1;
    }
  }
  else
  {
    uint64_t v26 = -1;
  }

  return v26;
}

- (int)personDetection:(__CVBuffer *)a3 personRegions:(id)a4 cancel:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  float v11 = (void *)MEMORY[0x1C186D320]();
  int v12 = [(VCPCNNPersonDetector *)self createInput:self->_inputData withBuffer:a3 inputHeight:self->_inputHeight inputWidth:self->_inputWidth];
  if (v12)
  {
    int v13 = 4;
  }
  else
  {
    float v14 = [MEMORY[0x1E4F1CA48] array];
    int v5 = [(VCPCNNPersonDetector *)self generatePersonBoxes:v14];
    if (v5)
    {
      int v13 = 1;
    }
    else
    {
      for (unint64_t i = 0; [v14 count] > i; ++i)
      {
        float v16 = [v14 objectAtIndexedSubscript:i];
        [v16 minX];
        *(float *)&double v17 = *(float *)&v17 / (float)self->_inputWidth;
        if (*(float *)&v17 < 0.0) {
          *(float *)&double v17 = 0.0;
        }
        [v16 setMinX:v17];
        [v16 maxX];
        *(float *)&double v18 = *(float *)&v18 / (float)self->_inputWidth;
        if (*(float *)&v18 > 1.0) {
          *(float *)&double v18 = 1.0;
        }
        [v16 setMaxX:v18];
        [v16 minY];
        *(float *)&double v19 = *(float *)&v19 / (float)self->_inputHeight;
        if (*(float *)&v19 < 0.0) {
          *(float *)&double v19 = 0.0;
        }
        [v16 setMinY:v19];
        [v16 maxY];
        *(float *)&double v20 = *(float *)&v20 / (float)self->_inputHeight;
        if (*(float *)&v20 > 1.0) {
          *(float *)&double v20 = 1.0;
        }
        [v16 setMaxY:v20];
        [v9 addObject:v16];
      }
      int v13 = 0;
    }
  }
  if ((v13 | 4) == 4) {
    int v21 = v12;
  }
  else {
    int v21 = v5;
  }

  return v21;
}

- (void).cxx_destruct
{
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
  begin = self->_outputsData.__begin_;
  if (begin)
  {
    self->_outputsData.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_outputNames, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 10) = 0;
  *((_DWORD *)self + 22) = 0;
  return self;
}

@end