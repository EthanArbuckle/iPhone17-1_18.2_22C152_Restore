@interface VCPCNNData
+ (Class)cnnDataClass;
+ (id)cnnData;
+ (id)cnnDataWithGPUContext:(id)a3;
+ (id)cnnDataWithPlane:(int)a3 height:(int)a4 width:(int)a5 context:(id)a6;
- (BOOL)isInputOutput;
- (MPSImage)mpsImg;
- (NSMutableArray)size;
- (VCPCNNData)init;
- (VCPCNNData)initWithGPUContext:(id)a3;
- (VCPCNNData)initWithParameters:(int)a3 height:(int)a4 width:(int)a5 context:(id)a6;
- (VCPCNNMetalContext)context;
- (float)data;
- (int)allocBuffers:(BOOL)a3;
- (int)bufferAllocCPU;
- (int)convertCPUData2GPU;
- (int)convertGPUData2CPU;
- (int)copyImage:(__CVBuffer *)a3 withChunk:(int)a4;
- (int)normalization;
- (int)randInit;
- (int)readFromDisk:(__sFILE *)a3 quantFactor:(signed __int16)a4;
- (int)reallocGPUTemporalBuffers;
- (int)softmax;
- (void)dealloc;
- (void)setContext:(id)a3;
- (void)setData:(float *)a3;
- (void)setIsInputOutput:(BOOL)a3;
- (void)setMpsImg:(id)a3;
- (void)setSize:(id)a3;
@end

@implementation VCPCNNData

+ (Class)cnnDataClass
{
  v2 = objc_opt_class();
  if (+[VCPCNNMetalContext supportGPU]) {
    v2 = objc_opt_class();
  }
  return (Class)v2;
}

+ (id)cnnData
{
  v2 = objc_alloc_init(VCPCNNData);
  return v2;
}

+ (id)cnnDataWithGPUContext:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(+[VCPCNNData cnnDataClass](VCPCNNData, "cnnDataClass")), "initWithGPUContext:", v3);

  return v4;
}

+ (id)cnnDataWithPlane:(int)a3 height:(int)a4 width:(int)a5 context:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v9 = a6;
  v10 = objc_msgSend(objc_alloc(+[VCPCNNData cnnDataClass](VCPCNNData, "cnnDataClass")), "initWithParameters:height:width:context:", v8, v7, v6, v9);

  return v10;
}

- (VCPCNNData)init
{
  v9.receiver = self;
  v9.super_class = (Class)VCPCNNData;
  v2 = [(VCPCNNData *)&v9 init];
  id v3 = v2;
  if (v2)
  {
    v2->_data = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    size = v3->_size;
    v3->_size = v4;

    objc_storeWeak((id *)&v3->_context, 0);
    mpsImg = v3->_mpsImg;
    v3->_mpsImg = 0;

    uint64_t v7 = v3;
  }

  return v3;
}

- (VCPCNNData)initWithGPUContext:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VCPCNNData;
  v5 = [(VCPCNNData *)&v12 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_data = 0;
    uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    size = v6->_size;
    v6->_size = v7;

    objc_storeWeak((id *)&v6->_context, v4);
    mpsImg = v6->_mpsImg;
    v6->_mpsImg = 0;

    v10 = v6;
  }

  return v6;
}

- (VCPCNNData)initWithParameters:(int)a3 height:(int)a4 width:(int)a5 context:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  v23.receiver = self;
  v23.super_class = (Class)VCPCNNData;
  v11 = [(VCPCNNData *)&v23 init];
  if (v11)
  {
    objc_super v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    size = v11->_size;
    v11->_size = v12;

    v14 = v11->_size;
    v15 = [NSNumber numberWithInt:v8];
    [(NSMutableArray *)v14 addObject:v15];

    v16 = v11->_size;
    v17 = [NSNumber numberWithInt:v7];
    [(NSMutableArray *)v16 addObject:v17];

    v18 = v11->_size;
    v19 = [NSNumber numberWithInt:v6];
    [(NSMutableArray *)v18 addObject:v19];

    v11->_data = 0;
    objc_storeWeak((id *)&v11->_context, v10);
    mpsImg = v11->_mpsImg;
    v11->_mpsImg = 0;

    v21 = v11;
  }

  return v11;
}

- (void)dealloc
{
  data = self->_data;
  if (data) {
    MEMORY[0x1C186C790](data, 0x1000C8052888210);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNData;
  [(VCPCNNData *)&v4 dealloc];
}

- (int)allocBuffers:(BOOL)a3
{
  self->_isInputOutput = a3;
  return [(VCPCNNData *)self bufferAllocCPU];
}

- (int)randInit
{
  id v3 = [(NSMutableArray *)self->_size objectAtIndexedSubscript:0];
  int v4 = [v3 intValue];

  v5 = [(NSMutableArray *)self->_size objectAtIndexedSubscript:1];
  int v6 = [v5 intValue];

  uint64_t v7 = [(NSMutableArray *)self->_size objectAtIndexedSubscript:2];
  int v8 = [v7 intValue];

  if (v4 >= 1)
  {
    int v9 = 0;
    int v10 = 0;
    do
    {
      if (v6 >= 1)
      {
        for (int i = 0; i != v6; ++i)
        {
          if (v8 >= 1)
          {
            int v12 = 0;
            v13 = &self->_data[v10];
            do
            {
              float v14 = (double)((10 * v9 + (255 - i) * (255 - i) + (v12 + 255) * (v12 + 255)) % 0xFFu) / 255.0;
              *v13++ = v14;
              --v12;
            }
            while (-v8 != v12);
            v10 -= v12;
          }
        }
      }
      ++v9;
    }
    while (v9 != v4);
  }
  return 0;
}

- (int)bufferAllocCPU
{
  if (self->_data) {
    return -18;
  }
  if ([(NSMutableArray *)self->_size count])
  {
    unint64_t v4 = 0;
    int v5 = 1;
    do
    {
      int v6 = [(NSMutableArray *)self->_size objectAtIndexedSubscript:v4];
      v5 *= [v6 intValue];

      ++v4;
    }
    while ([(NSMutableArray *)self->_size count] > v4);
    size_t v7 = 4 * v5;
    if (v5 < 0) {
      size_t v8 = -1;
    }
    else {
      size_t v8 = 4 * v5;
    }
  }
  else
  {
    size_t v7 = 4;
    size_t v8 = 4;
  }
  int v9 = (float *)operator new[](v8, MEMORY[0x1E4FBA2D0]);
  self->_data = v9;
  if (!v9) {
    return -108;
  }
  bzero(v9, v7);
  return 0;
}

- (int)convertCPUData2GPU
{
  return -4;
}

- (int)convertGPUData2CPU
{
  return 0;
}

- (int)reallocGPUTemporalBuffers
{
  return -4;
}

- (int)copyImage:(__CVBuffer *)a3 withChunk:(int)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (CVPixelBufferGetPixelFormatType(a3) != 1111970369) {
    return -50;
  }
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  [(NSMutableArray *)self->_size addObject:&unk_1F15ED848];
  size = self->_size;
  int v10 = [NSNumber numberWithInt:Height];
  [(NSMutableArray *)size addObject:v10];

  v11 = self->_size;
  int v12 = [NSNumber numberWithInt:Width];
  [(NSMutableArray *)v11 addObject:v12];

  int v13 = [(VCPCNNData *)self allocBuffers:1];
  if (v13) {
    return v13;
  }
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (!a3)
  {
    BOOL v31 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v31) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v31, v32, v33, v34, v35, v36, v37, v38);
    }
    return -50;
  }
  CVReturn v14 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVReturn v49 = v14;
  if (!v14
    || (int v13 = v14, os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    && (*(_DWORD *)buf = 134218240,
        v53 = a3,
        __int16 v54 = 1024,
        int v55 = v13,
        _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (int v13 = v49) == 0))
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    BOOL v19 = a4 != 4 || WeakRetained != 0;

    data = self->_data;
    if (v19)
    {
      bzero(data, 16 * (int)Width * (int)Height);
      if ((int)Height >= 1)
      {
        int v22 = 0;
        uint64_t v23 = (int)Height * (uint64_t)(int)Width;
        v24 = &data[2 * v23];
        v25 = &data[3 * v23];
        v26 = &data[v23];
        uint64_t v27 = 4 * (int)Width;
        do
        {
          if ((int)Width >= 1)
          {
            uint64_t v28 = 0;
            do
            {
              LOBYTE(v21) = BaseAddress[(int)(v28 * 4) + 2];
              *(float *)&unsigned int v29 = (float)LODWORD(v21) / 255.0;
              data[v28] = *(float *)&v29;
              LOBYTE(v29) = BaseAddress[(int)(v28 * 4) + 1];
              *(float *)&unsigned int v30 = (float)v29 / 255.0;
              v26[v28] = *(float *)&v30;
              LOBYTE(v30) = BaseAddress[(int)(v28 * 4)];
              float v21 = (float)v30 / 255.0;
              v24[v28] = v21;
              v25[v28++] = 0.0;
            }
            while (Width != v28);
          }
          BaseAddress += BytesPerRow;
          ++v22;
          v25 = (float *)((char *)v25 + v27);
          v24 = (float *)((char *)v24 + v27);
          v26 = (float *)((char *)v26 + v27);
          data = (float *)((char *)data + v27);
        }
        while (v22 != Height);
      }
    }
    else
    {
      bzero(data, 16 * (int)Width * (int)Height);
      if ((int)Height >= 1)
      {
        int v41 = 0;
        v42 = data + 3;
        v43 = data + 2;
        v44 = data + 1;
        do
        {
          if ((int)Width >= 1)
          {
            uint64_t v45 = 0;
            do
            {
              LOBYTE(v40) = BaseAddress[(int)v45 + 2];
              *(float *)&unsigned int v46 = (float)LODWORD(v40) / 255.0;
              uint64_t v47 = v45;
              data[v47] = *(float *)&v46;
              LOBYTE(v46) = BaseAddress[(int)v45 + 1];
              *(float *)&unsigned int v48 = (float)v46 / 255.0;
              v44[v47] = *(float *)&v48;
              LOBYTE(v48) = BaseAddress[(int)v45];
              float v40 = (float)v48 / 255.0;
              v43[v47] = v40;
              v42[v47] = 0.0;
              v45 += 4;
            }
            while (4 * Width != v45);
          }
          data += 4 * (int)Width;
          v44 += 4 * (int)Width;
          v43 += 4 * (int)Width;
          BaseAddress += BytesPerRow;
          ++v41;
          v42 += 4 * (int)Width;
        }
        while (v41 != Height);
      }
    }
    int v13 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v49);
    if (pixelBuffer
      && !v49
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:]();
    }
  }
  return v13;
}

- (int)readFromDisk:(__sFILE *)a3 quantFactor:(signed __int16)a4
{
  int v4 = a4;
  if ([(NSMutableArray *)self->_size count])
  {
    unint64_t v7 = 0;
    int v8 = 1;
    do
    {
      int v9 = [(NSMutableArray *)self->_size objectAtIndexedSubscript:v7];
      v8 *= [v9 intValue];

      ++v7;
    }
    while ([(NSMutableArray *)self->_size count] > v7);
  }
  else
  {
    int v8 = 1;
  }
  if (v4 > 1)
  {
    if (fread(self->_data, 2uLL, v8, a3))
    {
      if (v8 >= 1)
      {
        data = self->_data;
        unint64_t v11 = v8 + 1;
        do
        {
          data[(v11 - 2)] = (float)*((__int16 *)data + (v11 - 2)) / (float)v4;
          --v11;
        }
        while (v11 > 1);
      }
      return 0;
    }
    return -19;
  }
  if (v4 == 1)
  {
    if (fread(self->_data, 4uLL, v8, a3)) {
      return 0;
    }
    return -19;
  }
  if (!v4) {
    operator new[]();
  }
  return -50;
}

- (int)normalization
{
  if (![(NSMutableArray *)self->_size count])
  {
    int v4 = 1;
LABEL_7:
    data = self->_data;
    uint64_t v7 = v4;
    float v8 = 0.0;
    float v9 = 0.0;
    do
    {
      float v10 = *data++;
      float v9 = v9 + v10;
      float v8 = v8 + (float)(v10 * v10);
      --v7;
    }
    while (v7);
    float v11 = v9 / (float)v4;
    float v12 = fmaxf(sqrtf((float)(v8 / (float)v4) - (float)(v11 * v11)), 1.0e-10);
    int v13 = self->_data;
    uint64_t v14 = v4;
    do
    {
      float *v13 = (float)(*v13 - v11) / v12;
      ++v13;
      --v14;
    }
    while (v14);
    return 0;
  }
  unint64_t v3 = 0;
  int v4 = 1;
  do
  {
    int v5 = [(NSMutableArray *)self->_size objectAtIndexedSubscript:v3];
    v4 *= [v5 intValue];

    ++v3;
  }
  while ([(NSMutableArray *)self->_size count] > v3);
  if (v4 >= 1) {
    goto LABEL_7;
  }
  return 0;
}

- (int)softmax
{
  if ([(NSMutableArray *)self->_size count] == 1)
  {
    unint64_t v3 = [(NSMutableArray *)self->_size objectAtIndexedSubscript:0];
    int v4 = [v3 intValue];

    if (v4 >= 1)
    {
      data = self->_data;
      uint64_t v6 = v4;
      float v7 = -1.0e10;
      uint64_t v8 = v4;
      do
      {
        float v9 = *data++;
        float v10 = v9;
        if (v9 > v7) {
          float v7 = v10;
        }
        --v8;
      }
      while (v8);
      float v11 = self->_data;
      float v12 = 0.0;
      uint64_t v13 = v6;
      do
      {
        float v14 = expf(*v11 - v7);
        *v11++ = v14;
        float v12 = v12 + v14;
        --v13;
      }
      while (v13);
      v15 = self->_data;
      do
      {
        float *v15 = *v15 / v12;
        ++v15;
        --v6;
      }
      while (v6);
    }
  }
  return 0;
}

- (NSMutableArray)size
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSize:(id)a3
{
}

- (float)data
{
  return self->_data;
}

- (void)setData:(float *)a3
{
  self->_data = a3;
}

- (BOOL)isInputOutput
{
  return self->_isInputOutput;
}

- (void)setIsInputOutput:(BOOL)a3
{
  self->_isInputOutput = a3;
}

- (MPSImage)mpsImg
{
  return (MPSImage *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMpsImg:(id)a3
{
}

- (VCPCNNMetalContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (VCPCNNMetalContext *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_mpsImg, 0);
  objc_storeStrong((id *)&self->_size, 0);
}

@end