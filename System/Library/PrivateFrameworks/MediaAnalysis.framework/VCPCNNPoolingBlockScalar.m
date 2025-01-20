@interface VCPCNNPoolingBlockScalar
- (int)forward;
@end

@implementation VCPCNNPoolingBlockScalar

- (int)forward
{
  p_inputSize = &self->super.super._inputSize;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  v5 = [WeakRetained objectAtIndexedSubscript:0];
  int v24 = [v5 intValue];

  id v6 = objc_loadWeakRetained((id *)p_inputSize);
  v7 = [v6 objectAtIndexedSubscript:1];
  int v23 = [v7 intValue];

  id v8 = objc_loadWeakRetained((id *)p_inputSize);
  v9 = [v8 objectAtIndexedSubscript:2];
  int v10 = [v9 intValue];

  if (v24 >= 1)
  {
    int v27 = 0;
    int v25 = 0;
    int v26 = v23 / self->super._px;
    uint64_t v28 = (v10 / *(_DWORD *)(&self->super.super._executedOnGPU + 3));
    do
    {
      if (v26 >= 1)
      {
        for (int i = 0; i != v26; ++i)
        {
          if ((int)v28 >= 1)
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              int px = self->super._px;
              float v14 = -1.0e10;
              if (px >= 1)
              {
                int v15 = 0;
                int v16 = *(_DWORD *)(&self->super.super._executedOnGPU + 3);
                int v17 = v27;
                float v14 = -1.0e10;
                do
                {
                  if (v16 >= 1)
                  {
                    int v29 = v15;
                    for (int k = 0; k < v16; ++k)
                    {
                      id v19 = objc_loadWeakRetained((id *)&self->super.super._input);
                      uint64_t v20 = [v19 data];
                      int v21 = k
                          + v10 * (v17 + i * self->super._px)
                          + j * *(_DWORD *)(&self->super.super._executedOnGPU + 3);
                      if (v14 < *(float *)(v20 + 4 * v21)) {
                        float v14 = *(float *)(v20 + 4 * v21);
                      }

                      int v16 = *(_DWORD *)(&self->super.super._executedOnGPU + 3);
                    }
                    int px = self->super._px;
                    int v15 = v29;
                  }
                  ++v15;
                  ++v17;
                }
                while (v15 < px);
              }
              [(VCPCNNData *)self->super.super._output data][4 * ((i + v25 * v26) * (int)v28 + (int)j)] = v14;
            }
          }
        }
      }
      v27 += v23;
      ++v25;
    }
    while (v25 != v24);
  }
  return 0;
}

@end