@interface VCPCNNConvBlockVector
+ (BOOL)isFilterSizeSupported:(int)a3;
- (VCPCNNConvBlockVector)initWithParameters:(int)a3 filterNum:(int)a4 chunk:(int)a5 reLU:(BOOL)a6 padding:(BOOL)a7 groups:(int)a8 stride:(int)a9 batchNorm:(BOOL)a10;
- (int)chunkFourForward;
- (int)forward;
- (int)readFromDisk:(__sFILE *)a3 quantFactor:(signed __int16)a4;
- (int)straightForwardForChunkFour;
@end

@implementation VCPCNNConvBlockVector

+ (BOOL)isFilterSizeSupported:(int)a3
{
  return (a3 - 1) < 5;
}

- (VCPCNNConvBlockVector)initWithParameters:(int)a3 filterNum:(int)a4 chunk:(int)a5 reLU:(BOOL)a6 padding:(BOOL)a7 groups:(int)a8 stride:(int)a9 batchNorm:(BOOL)a10
{
  uint64_t v10 = *(void *)&a8;
  BOOL v11 = a7;
  BOOL v12 = a6;
  uint64_t v13 = *(void *)&a5;
  uint64_t v14 = *(void *)&a4;
  uint64_t v15 = *(void *)&a3;
  v16 = self;
  if (+[VCPCNNConvBlockVector isFilterSizeSupported:*(unsigned int *)(&self->super.super._executedOnGPU + 3)]&& (v16->super._filterSize & 3) == 0)
  {
    v20.receiver = v16;
    v20.super_class = (Class)VCPCNNConvBlockVector;
    BYTE4(v19) = a10;
    LODWORD(v19) = a9;
    v16 = -[VCPCNNConvBlock initWithParameters:filterNum:chunk:reLU:padding:groups:stride:batchNorm:](&v20, sel_initWithParameters_filterNum_chunk_reLU_padding_groups_stride_batchNorm_, v15, v14, v13, v12, v11, v10, v19);
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (int)readFromDisk:(__sFILE *)a3 quantFactor:(signed __int16)a4
{
  uint64_t v4 = a4;
  p_inputSize = &self->super.super._inputSize;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  uint64_t v9 = [WeakRetained count];

  if (!v9) {
    return -50;
  }
  id v10 = objc_loadWeakRetained((id *)p_inputSize);
  BOOL v11 = [v10 objectAtIndexedSubscript:0];
  int v12 = [v11 intValue] & 3;

  filter = self->super._filter;
  if (v12)
  {
    int result = [(VCPCNNData *)filter readFromDisk:a3 quantFactor:v4];
    if (result) {
      return result;
    }
    bias = self->super._bias;
    v16 = a3;
    goto LABEL_30;
  }
  v17 = [(VCPCNNData *)filter size];
  uint64_t v18 = [v17 count];

  if (v18 != 4) {
    return -50;
  }
  uint64_t v19 = [(VCPCNNData *)self->super._filter size];
  objc_super v20 = [v19 objectAtIndexedSubscript:0];
  __stream = a3;
  int v21 = [v20 intValue];

  v22 = [(VCPCNNData *)self->super._filter size];
  v23 = [v22 objectAtIndexedSubscript:1];
  int v24 = [v23 intValue];

  v25 = [(VCPCNNData *)self->super._filter size];
  v26 = [v25 objectAtIndexedSubscript:2];
  int v27 = [v26 intValue];
  v28 = [(VCPCNNData *)self->super._filter size];
  v29 = [v28 objectAtIndexedSubscript:3];
  uint64_t v30 = [v29 intValue] * v27;

  int v31 = v24 * v21 * v30;
  if (v31 < 0) {
    size_t v32 = -1;
  }
  else {
    size_t v32 = 4 * v31;
  }
  v33 = (float *)operator new[](v32, MEMORY[0x1E4FBA2D0]);
  if (!v33) {
    return -108;
  }
  v34 = v33;
  if ((int)v4 >= 2)
  {
    if (fread(v33, 2uLL, v31, __stream))
    {
      if (v31 >= 1)
      {
        unint64_t v35 = (v24 * v21 * v30) + 1;
        do
        {
          v34[(v35 - 2)] = (float)*((__int16 *)v34 + (v35 - 2)) / (float)(int)v4;
          --v35;
        }
        while (v35 > 1);
      }
      goto LABEL_20;
    }
    return -19;
  }
  if (!fread(v33, 4uLL, v31, __stream)) {
    return -19;
  }
LABEL_20:
  v36 = [(VCPCNNData *)self->super._filter data];
  if (v21 >= 1)
  {
    int v37 = 0;
    uint64_t chunk = self->super._chunk;
    v39 = v34;
    do
    {
      if (v24 >= 1)
      {
        for (int i = 0; i != v24; ++i)
        {
          if ((int)v30 >= 1)
          {
            uint64_t v41 = (i % (int)chunk) + i / (int)chunk * (int)chunk * (uint64_t)(int)v30;
            uint64_t v42 = v30;
            do
            {
              float v43 = *v39++;
              v36[v41] = v43;
              v41 += chunk;
              --v42;
            }
            while (v42);
          }
        }
      }
      ++v37;
      v36 += (int)v30 * v24;
    }
    while (v37 != v21);
  }
  MEMORY[0x1C186C790](v34, 0x1000C8052888210);
  bias = self->super._bias;
  v16 = __stream;
LABEL_30:
  int result = [(VCPCNNData *)bias readFromDisk:v16 quantFactor:v4];
  if (!result) {
    return 0;
  }
  return result;
}

- (int)straightForwardForChunkFour
{
  p_inputSize = &self->super.super._inputSize;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  v5 = [WeakRetained objectAtIndexedSubscript:1];
  int v6 = [v5 intValue];

  id v7 = objc_loadWeakRetained((id *)p_inputSize);
  v8 = [v7 objectAtIndexedSubscript:2];
  int v42 = [v8 intValue];

  uint64_t v9 = [(NSMutableArray *)self->super.super._outputSize objectAtIndexedSubscript:1];
  int v10 = [v9 intValue];

  BOOL v11 = [(NSMutableArray *)self->super.super._outputSize objectAtIndexedSubscript:2];
  int v41 = [v11 intValue];

  id v12 = objc_loadWeakRetained((id *)p_inputSize);
  uint64_t v13 = [v12 objectAtIndexedSubscript:0];
  int v48 = [v13 intValue];

  uint64_t v14 = [(NSMutableArray *)self->super.super._outputSize objectAtIndexedSubscript:0];
  int v15 = [v14 intValue];

  if (self->super._chunk != 4) {
    return -50;
  }
  if (v15 >= 1)
  {
    int v39 = 0;
    uint64_t v44 = 0;
    int v36 = 4 * v41 * v10;
    uint64_t v16 = *(unsigned int *)(&self->super.super._executedOnGPU + 3);
    uint64_t v47 = (v6 * v42);
    uint64_t v17 = v16;
    int v37 = v6;
    do
    {
      if ((int)v17 <= v6)
      {
        uint64_t v38 = 0;
        int v43 = 0;
        uint64_t v40 = ((int)v44 % self->super._chunk) + v36 * (uint64_t)((int)v44 / self->super._chunk);
        do
        {
          if ((int)v17 <= v42)
          {
            int v19 = 0;
            uint64_t v46 = v38;
            uint64_t v16 = v17;
            do
            {
              int v45 = v19;
              float v20 = 0.0;
              float v21 = 0.0;
              if (v48 >= 1)
              {
                int v22 = 0;
                uint64_t v23 = v46;
                int v24 = v39;
                uint64_t v25 = v16;
                do
                {
                  int v50 = v22;
                  uint64_t v49 = v23;
                  if ((int)v25 < 1)
                  {
                    uint64_t v31 = v25;
                  }
                  else
                  {
                    int v26 = 0;
                    do
                    {
                      if ((int)v25 >= 1)
                      {
                        uint64_t v27 = 0;
                        do
                        {
                          id v28 = objc_loadWeakRetained((id *)&self->super.super._input);
                          float v29 = *(float *)([v28 data] + 4 * ((int)v23 + (int)v27));

                          uint64_t v30 = [(VCPCNNData *)self->super._filter data];
                          uint64_t v16 = *(int *)(&self->super.super._executedOnGPU + 3);
                          float v21 = v21 + (float)(v29 * v30[v27 + (int)v16 * (v26 + v24 * (int)v16)]);
                          ++v27;
                        }
                        while (v27 < v16);
                      }
                      ++v26;
                      LODWORD(v23) = v23 + v42;
                      LODWORD(v25) = v16;
                      uint64_t v31 = v16;
                    }
                    while (v26 < (int)v16);
                  }
                  int v22 = v50 + 1;
                  ++v24;
                  uint64_t v23 = v49 + v47;
                  uint64_t v25 = v31;
                }
                while (v50 + 1 != v48);
              }
              int chunk = self->super._chunk;
              int padSize = self->super._padSize;
              if ((float)(v21 + [(VCPCNNData *)self->super._bias data][4 * v44]) > 0.0) {
                float v20 = v21 + [(VCPCNNData *)self->super._bias data][4 * v44];
              }
              [(VCPCNNData *)self->super.super._output data][4
                                                                  * (v40
                                                                   + chunk
                                                                   * (uint64_t)(padSize + v45 + (padSize + v43) * v41))] = v20;
              uint64_t v16 = *(unsigned int *)(&self->super.super._executedOnGPU + 3);
              ++v46;
              int v19 = v45 + 1;
            }
            while (v45 < v42 - (int)v16);
          }
          int v6 = v37;
          v38 += v42;
          uint64_t v17 = v16;
          uint64_t v18 = v16;
        }
        while (v43++ < v37 - (int)v16);
      }
      else
      {
        uint64_t v18 = v17;
      }
      v39 += v48;
      uint64_t v17 = v18;
      ++v44;
    }
    while (v44 != v15);
  }
  return 0;
}

- (int)chunkFourForward
{
  p_inputSize = &self->super.super._inputSize;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  v5 = [WeakRetained objectAtIndexedSubscript:1];
  int v72 = [v5 intValue];

  id v6 = objc_loadWeakRetained((id *)p_inputSize);
  id v7 = [v6 objectAtIndexedSubscript:2];
  int v75 = [v7 intValue];

  v8 = [(NSMutableArray *)self->super.super._outputSize objectAtIndexedSubscript:1];
  int v67 = [v8 intValue];

  uint64_t v9 = [(NSMutableArray *)self->super.super._outputSize objectAtIndexedSubscript:2];
  int v65 = [v9 intValue];

  id v10 = objc_loadWeakRetained((id *)p_inputSize);
  BOOL v11 = [v10 objectAtIndexedSubscript:0];
  int v12 = [v11 intValue];

  uint64_t v13 = [(NSMutableArray *)self->super.super._outputSize objectAtIndexedSubscript:0];
  int v14 = [v13 intValue];

  int result = -50;
  int v16 = v72;
  if (self->super._chunk == 4 && (v12 & 3) == 0 && (v14 & 3) == 0)
  {
    unsigned int v17 = *(_DWORD *)(&self->super.super._executedOnGPU + 3);
    if (([(id)objc_opt_class() isFilterSizeSupported:v17] & 1) != 0
      && (unsigned int v18 = *(_DWORD *)(&self->super.super._executedOnGPU + 3) - 1, v18 <= 4)
      && ((0x17u >> v18) & 1) != 0)
    {
      unsigned int v61 = v17;
      int v63 = v12;
      int v55 = v65 * v67;
      uint64_t v57 = 4 * v65 * v67;
      self->CalculateDotProductOfChunk = off_1F15A0358[v18];
      uint64_t v19 = 4 * v65;
      float v20 = [(VCPCNNData *)self->super._bias data];
      int v58 = v14;
      if (v14 / self->super._chunk >= 1)
      {
        float v21 = v20;
        uint64_t v22 = 0;
        do
        {
          uint64_t v23 = [(VCPCNNData *)self->super.super._output data];
          uint64_t v24 = 92;
          int padSize = self->super._padSize;
          if (self->super._padding)
          {
            int v26 = (*(_DWORD *)(&self->super.super._executedOnGPU + 3) + ~padSize) & ~((*(_DWORD *)(&self->super.super._executedOnGPU
                                                                                                 + 3)
                                                                                     + ~padSize) >> 31);
            int v27 = v67 - v26;
            int v28 = v65 - v26;
          }
          else
          {
            int v28 = v65;
            int v27 = v67;
          }
          uint64_t chunk = self->super._chunk;
          uint64_t v69 = v22;
          if (padSize >= v27)
          {
            LODWORD(v36) = self->super._chunk;
          }
          else
          {
            v73 = &v23[v22 * v57];
            uint64_t v30 = padSize;
            uint64_t v31 = v27;
            do
            {
              uint64_t v32 = v24;
              int v33 = *(_DWORD *)((char *)&self->super.super.super.isa + v24);
              int v34 = v28 - v33;
              if (v28 <= v33)
              {
                uint64_t v36 = chunk;
              }
              else
              {
                unint64_t v35 = &v73[v30 * v19 + (int)chunk * v33];
                do
                {
                  memcpy(v35, v21, 4 * (int)chunk);
                  uint64_t v36 = self->super._chunk;
                  v35 += v36;
                  LODWORD(chunk) = self->super._chunk;
                  --v34;
                }
                while (v34);
              }
              ++v30;
              uint64_t chunk = v36;
              uint64_t v24 = v32;
            }
            while (v30 != v31);
          }
          v21 += (int)v36;
          uint64_t v22 = v69 + 1;
          int v14 = v58;
        }
        while (v69 + 1 < v58 / (int)v36);
      }
      v60 = [(VCPCNNData *)self->super._filter data];
      if (v14 >= 1)
      {
        int v59 = 0;
        uint64_t v37 = 4 * v75;
        int v66 = v63 / 4;
        uint64_t v56 = (int)(v61 * v61 * v63);
        uint64_t v64 = (int)(4 * v61 * v61);
        uint64_t v71 = v19;
        do
        {
          int v38 = self->super._chunk;
          id v39 = objc_loadWeakRetained((id *)&self->super.super._input);
          uint64_t v40 = [v39 data];

          int v41 = [(VCPCNNData *)self->super.super._output data];
          int v42 = v75;
          if (v66 >= 1)
          {
            int v43 = 0;
            uint64_t v62 = (uint64_t)&v41[(int)v57 * (uint64_t)(v59 / v38)
                              + self->super._padSize * (uint64_t)(int)v19
                              + (v59 % v38)];
            LODWORD(v44) = self->super._chunk;
            int v45 = *(_DWORD *)(&self->super.super._executedOnGPU + 3);
            uint64_t v46 = v60;
            do
            {
              int v68 = v43;
              uint64_t v70 = v40;
              if (v45 <= v16)
              {
                int v47 = 0;
                int v48 = (float *)(v62 + 4 * self->super._padSize * (int)v44);
                do
                {
                  if (v45 <= v42)
                  {
                    int v74 = v47;
                    int v49 = -1;
                    int v50 = v48;
                    uint64_t v51 = v40;
                    do
                    {
                      float v52 = ((float (*)(uint64_t, uint64_t, float *))self->CalculateDotProductOfChunk)(v51, v37, v46);
                      int v42 = v75;
                      *int v50 = v52 + *v50;
                      uint64_t v44 = self->super._chunk;
                      v51 += 4 * v44;
                      v50 += v44;
                      int v45 = *(_DWORD *)(&self->super.super._executedOnGPU + 3);
                      ++v49;
                    }
                    while (v49 < v75 - v45);
                    int v16 = v72;
                    int v47 = v74;
                    uint64_t v19 = v71;
                  }
                  v40 += 4 * v37;
                  v48 += v19;
                }
                while (v47++ < v16 - v45);
              }
              v46 += v64;
              uint64_t v40 = v70 + 16 * v75 * v72;
              int v43 = v68 + 1;
            }
            while (v68 + 1 != v66);
          }
          v60 += v56;
          int v14 = v58;
          ++v59;
        }
        while (v59 != v58);
      }
      if (self->super._reLU && v55 * v14 >= 1)
      {
        uint64_t v54 = 0;
        do
        {
          if ([(VCPCNNData *)self->super.super._output data][v54] < 0.0) {
            [(VCPCNNData *)self->super.super._output data][v54] = 0.0;
          }
          int result = 0;
          v54 += 4;
        }
        while (4 * (v55 * v14) != v54);
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return -50;
    }
  }
  return result;
}

- (int)forward
{
  p_inputSize = &self->super.super._inputSize;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  uint64_t v5 = [WeakRetained count];

  if (!v5) {
    return -50;
  }
  if (self->super._chunk == 4)
  {
    id v6 = objc_loadWeakRetained((id *)p_inputSize);
    id v7 = [v6 objectAtIndexedSubscript:0];
    int v8 = [v7 intValue] & 3;

    if (v8)
    {
      int result = [(VCPCNNConvBlockVector *)self straightForwardForChunkFour];
      if (result) {
        return result;
      }
      return 0;
    }
  }
  id v10 = objc_loadWeakRetained((id *)p_inputSize);
  BOOL v11 = [v10 objectAtIndexedSubscript:0];
  if (([v11 intValue] & 3) != 0) {
    goto LABEL_13;
  }
  int v12 = [(NSMutableArray *)self->super.super._outputSize objectAtIndexedSubscript:0];
  if (([v12 intValue] & 3) != 0 || self->super._chunk != 4)
  {

LABEL_13:
    return -50;
  }
  int v13 = [(id)objc_opt_class() isFilterSizeSupported:*(unsigned int *)(&self->super.super._executedOnGPU + 3)];

  if (!v13) {
    return -50;
  }
  int result = [(VCPCNNConvBlockVector *)self chunkFourForward];
  if (!result) {
    return 0;
  }
  return result;
}

@end