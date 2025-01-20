@interface VCPCNNConvBlockScalar
- (int)forward;
- (int)readFromDisk:(__sFILE *)a3 quantFactor:(signed __int16)a4;
@end

@implementation VCPCNNConvBlockScalar

- (int)readFromDisk:(__sFILE *)a3 quantFactor:(signed __int16)a4
{
  uint64_t v4 = a4;
  int result = -[VCPCNNData readFromDisk:quantFactor:](self->super._filter, "readFromDisk:quantFactor:");
  if (!result)
  {
    bias = self->super._bias;
    return [(VCPCNNData *)bias readFromDisk:a3 quantFactor:v4];
  }
  return result;
}

- (int)forward
{
  p_inputSize = &self->super.super._inputSize;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  v5 = [WeakRetained objectAtIndexedSubscript:1];
  int v33 = [v5 intValue];

  id v6 = objc_loadWeakRetained((id *)p_inputSize);
  v7 = [v6 objectAtIndexedSubscript:2];
  int v38 = [v7 intValue];

  v8 = [(NSMutableArray *)self->super.super._outputSize objectAtIndexedSubscript:1];
  int v32 = [v8 intValue];

  v9 = [(NSMutableArray *)self->super.super._outputSize objectAtIndexedSubscript:2];
  int v37 = [v9 intValue];

  id v10 = objc_loadWeakRetained((id *)p_inputSize);
  v11 = [v10 objectAtIndexedSubscript:0];
  int v42 = [v11 intValue];

  v12 = [(NSMutableArray *)self->super.super._outputSize objectAtIndexedSubscript:0];
  int v13 = [v12 intValue];

  if (v13 >= 1)
  {
    int v36 = 0;
    uint64_t v39 = 0;
    uint64_t v14 = *(unsigned int *)(&self->super.super._executedOnGPU + 3);
    uint64_t v15 = v14;
    do
    {
      if ((int)v15 <= v33)
      {
        uint64_t v35 = 0;
        int v34 = 0;
        do
        {
          if ((int)v15 <= v38)
          {
            int v17 = 0;
            uint64_t v41 = v35;
            uint64_t v14 = v15;
            do
            {
              int v40 = v17;
              float v18 = 0.0;
              float v19 = 0.0;
              if (v42 >= 1)
              {
                int v20 = 0;
                uint64_t v21 = v41;
                int v22 = v36;
                uint64_t v23 = v14;
                do
                {
                  int v44 = v20;
                  uint64_t v43 = v21;
                  if ((int)v23 < 1)
                  {
                    uint64_t v29 = v23;
                  }
                  else
                  {
                    int v24 = 0;
                    do
                    {
                      if ((int)v23 >= 1)
                      {
                        uint64_t v25 = 0;
                        do
                        {
                          id v26 = objc_loadWeakRetained((id *)&self->super.super._input);
                          float v27 = *(float *)([v26 data] + 4 * ((int)v21 + (int)v25));

                          v28 = [(VCPCNNData *)self->super._filter data];
                          uint64_t v14 = *(int *)(&self->super.super._executedOnGPU + 3);
                          float v19 = v19 + (float)(v27 * v28[v25 + (int)v14 * (v24 + v22 * (int)v14)]);
                          ++v25;
                        }
                        while (v25 < v14);
                      }
                      ++v24;
                      LODWORD(v21) = v21 + v38;
                      LODWORD(v23) = v14;
                      uint64_t v29 = v14;
                    }
                    while (v24 < (int)v14);
                  }
                  int v20 = v44 + 1;
                  ++v22;
                  uint64_t v21 = v43 + (v33 * v38);
                  uint64_t v23 = v29;
                }
                while (v44 + 1 != v42);
              }
              if ((float)(v19 + [(VCPCNNData *)self->super._bias data][4 * v39]) > 0.0) {
                float v18 = v19 + [(VCPCNNData *)self->super._bias data][4 * v39];
              }
              [(VCPCNNData *)self->super.super._output data][4
                                                                  * (self->super._padSize
                                                                   + v40
                                                                   + (v34 + v32 * (int)v39 + self->super._padSize) * v37)] = v18;
              uint64_t v14 = *(unsigned int *)(&self->super.super._executedOnGPU + 3);
              ++v41;
              int v17 = v40 + 1;
            }
            while (v40 < v38 - (int)v14);
          }
          v35 += v38;
          uint64_t v15 = v14;
          uint64_t v16 = v14;
        }
        while (v34++ < v33 - (int)v14);
      }
      else
      {
        uint64_t v16 = v15;
      }
      v36 += v42;
      uint64_t v15 = v16;
      ++v39;
    }
    while (v39 != v13);
  }
  return 0;
}

@end