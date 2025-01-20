@interface VCPCNNDataGPU
- (int)allocBuffers:(BOOL)a3;
- (int)bufferAllocGPU;
- (int)convertCPUData2GPU;
- (int)convertGPUData2CPU;
- (int)reallocGPUTemporalBuffers;
@end

@implementation VCPCNNDataGPU

- (int)allocBuffers:(BOOL)a3
{
  self->super._isInputOutput = a3;
  if (!a3 || (int result = [(VCPCNNData *)self bufferAllocCPU]) == 0)
  {
    return [(VCPCNNDataGPU *)self bufferAllocGPU];
  }
  return result;
}

- (int)reallocGPUTemporalBuffers
{
  if (self->super._isInputOutput) {
    return 0;
  }
  else {
    return [(VCPCNNDataGPU *)self bufferAllocGPU];
  }
}

- (int)bufferAllocGPU
{
  if ([(NSMutableArray *)self->super._size count] != 1
    && [(NSMutableArray *)self->super._size count] != 3)
  {
    return -50;
  }
  v3 = [(NSMutableArray *)self->super._size objectAtIndexedSubscript:0];
  int v4 = [v3 intValue];

  if ([(NSMutableArray *)self->super._size count] == 3)
  {
    v5 = [(NSMutableArray *)self->super._size objectAtIndexedSubscript:1];
    LODWORD(v8) = [v5 intValue];

    v6 = [(NSMutableArray *)self->super._size objectAtIndexedSubscript:2];
    LODWORD(v7) = [v6 intValue];

    uint64_t v7 = (int)v7;
    uint64_t v8 = (int)v8;
  }
  else
  {
    uint64_t v8 = 1;
    uint64_t v7 = 1;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F35578]);
  v10 = v9;
  if (v9)
  {
    [v9 setWidth:v7];
    [v10 setHeight:v8];
    [v10 setFeatureChannels:v4];
    [v10 setNumberOfImages:1];
    [v10 setUsage:3];
    [v10 setChannelFormat:3];
    [v10 setFeatureChannelsLayout:1];
    if (self->super._isInputOutput)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F35530]);
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._context);
      v13 = [WeakRetained device];
      v14 = (MPSImage *)[v11 initWithDevice:v13 imageDescriptor:v10];
    }
    else
    {
      v16 = (void *)MEMORY[0x1E4F35978];
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._context);
      v13 = [WeakRetained commandBuffer];
      v14 = [v16 temporaryImageWithCommandBuffer:v13 imageDescriptor:v10];
    }
    mpsImg = self->super._mpsImg;
    self->super._mpsImg = v14;

    if (self->super._mpsImg) {
      int v15 = 0;
    }
    else {
      int v15 = -108;
    }
  }
  else
  {
    int v15 = -108;
  }

  return v15;
}

- (int)convertCPUData2GPU
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._context);
  if (!WeakRetained) {
    return -50;
  }
  data = self->super._data;

  if (!data) {
    return -50;
  }
  if (self->super._mpsImg || (int result = [(VCPCNNDataGPU *)self bufferAllocGPU]) == 0)
  {
    v5 = [(NSMutableArray *)self->super._size objectAtIndexedSubscript:0];
    int v6 = [v5 intValue];

    uint64_t v7 = [(NSMutableArray *)self->super._size objectAtIndexedSubscript:1];
    int v8 = [v7 intValue];

    id v9 = [(NSMutableArray *)self->super._size objectAtIndexedSubscript:2];
    int v10 = [v9 intValue];

    if (v6 != 1 && (v6 & 3) != 0) {
      return -50;
    }
    int v12 = v8 * v6 * v10;
    if (v12 < 0) {
      size_t v13 = -1;
    }
    else {
      size_t v13 = 2 * v12;
    }
    v14 = operator new[](v13, MEMORY[0x1E4FBA2D0]);
    if (v14)
    {
      int v15 = v14;
      if (v6 >= 1)
      {
        uint64_t v16 = 0;
        int v17 = 0;
        v18 = v14;
        do
        {
          if (v8 >= 1)
          {
            uint64_t v19 = 0;
            v20 = v18;
            do
            {
              if (v10 >= 1)
              {
                v21 = &self->super._data[v17];
                v17 += v10;
                uint64_t v22 = v10;
                v23 = v20;
                do
                {
                  int v24 = *(_DWORD *)v21++;
                  _S0 = v24;
                  __asm { FCVT            H0, S0 }
                  _WORD *v23 = _S0;
                  v23 += v6;
                  --v22;
                }
                while (v22);
              }
              ++v19;
              v20 += v10 * (unint64_t)v6;
            }
            while (v19 != v8);
          }
          ++v16;
          ++v18;
        }
        while (v16 != v6);
      }
      [(MPSImage *)self->super._mpsImg writeBytes:v15 dataLayout:0 imageIndex:0];
      MEMORY[0x1C186C790](v15, 0x1000C80BDFB0063);
      return 0;
    }
    else
    {
      return -108;
    }
  }
  return result;
}

- (int)convertGPUData2CPU
{
  if (!self->super._mpsImg) {
    return -50;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._context);

  if (!WeakRetained
    || [(NSMutableArray *)self->super._size count] != 1
    && [(NSMutableArray *)self->super._size count] != 3)
  {
    return -50;
  }
  int v4 = [(NSMutableArray *)self->super._size objectAtIndexedSubscript:0];
  int v5 = [v4 intValue];

  if ([(NSMutableArray *)self->super._size count] == 3)
  {
    int v6 = [(NSMutableArray *)self->super._size objectAtIndexedSubscript:1];
    int v7 = [v6 intValue];

    int v8 = [(NSMutableArray *)self->super._size objectAtIndexedSubscript:2];
    int v9 = [v8 intValue];
  }
  else
  {
    int v7 = 1;
    int v9 = 1;
  }
  int v11 = v5 + 3;
  if (v5 < -3) {
    int v11 = v5 + 6;
  }
  double v12 = fmax((double)(v11 >> 2), 1.0);
  if ((((int)v12 * v7 * v9) & 0x20000000) != 0) {
    size_t v13 = -1;
  }
  else {
    size_t v13 = 8 * (int)v12 * v7 * v9;
  }
  v14 = (__int16 *)operator new[](v13, MEMORY[0x1E4FBA2D0]);
  if (!v14) {
    return -108;
  }
  int v15 = v14;
  [(MPSImage *)self->super._mpsImg readBytes:v14 dataLayout:0 imageIndex:0];
  if (self->super._data || (int v10 = [(VCPCNNData *)self bufferAllocCPU]) == 0)
  {
    if (v7 == 1 && v9 == 1)
    {
      if (v5 >= 1)
      {
        data = self->super._data;
        int v17 = v15;
        uint64_t v18 = v5;
        do
        {
          __int16 v19 = *v17++;
          _H0 = v19;
          __asm { FCVT            S0, H0 }
          *(_DWORD *)data++ = _S0;
          --v18;
        }
        while (v18);
      }
    }
    else if (v5 >= 1)
    {
      uint64_t v26 = 0;
      int v27 = 0;
      v28 = v15;
      do
      {
        if (v7 >= 1)
        {
          uint64_t v29 = 0;
          v30 = v28;
          do
          {
            if (v9 >= 1)
            {
              v31 = &self->super._data[v27];
              v27 += v9;
              uint64_t v32 = v9;
              v33 = v30;
              do
              {
                _H0 = *v33;
                __asm { FCVT            S0, H0 }
                *(_DWORD *)v31++ = _S0;
                v33 += v5;
                --v32;
              }
              while (v32);
            }
            ++v29;
            v30 += v9 * (unint64_t)v5;
          }
          while (v29 != v7);
        }
        ++v26;
        ++v28;
      }
      while (v26 != v5);
    }
    int v10 = 0;
  }
  MEMORY[0x1C186C790](v15, 0x1000C80BDFB0063);
  return v10;
}

@end