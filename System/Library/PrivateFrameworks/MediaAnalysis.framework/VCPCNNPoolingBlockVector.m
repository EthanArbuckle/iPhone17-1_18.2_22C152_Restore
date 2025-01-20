@interface VCPCNNPoolingBlockVector
- (int)forward;
@end

@implementation VCPCNNPoolingBlockVector

- (int)forward
{
  if (self->super._py != 4 || *(_DWORD *)(&self->super.super._executedOnGPU + 3) != 2 || self->super._px != 2) {
    return -50;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  v4 = [WeakRetained objectAtIndexedSubscript:0];
  int v5 = [v4 intValue];

  id v6 = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  v7 = [v6 objectAtIndexedSubscript:1];
  int v8 = [v7 intValue];

  id v9 = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  v10 = [v9 objectAtIndexedSubscript:2];
  int v11 = [v10 intValue];

  int px = self->super._px;
  int v13 = *(_DWORD *)(&self->super.super._executedOnGPU + 3);
  id v14 = objc_loadWeakRetained((id *)&self->super.super._input);
  uint64_t v15 = [v14 data];

  v16 = [(VCPCNNData *)self->super.super._output data];
  LODWORD(py) = self->super._py;
  if (v5 / (int)py >= 1)
  {
    int v18 = 0;
    int v19 = v8 / px;
    uint64_t v20 = v11 * v8 * (int)py;
    uint64_t v21 = (int)py * v11;
    do
    {
      if (v19 >= 1)
      {
        int v22 = 0;
        v23 = (float32x4_t *)v15;
        do
        {
          int v24 = v11 / v13;
          v25 = v23;
          if (v11 / v13 >= 1)
          {
            do
            {
              *(float32x4_t *)v16 = vmaxq_f32(vmaxq_f32(*v25, *(float32x4_t *)((char *)v25 + 4 * v21)), vmaxq_f32(v25[1], *(float32x4_t *)((char *)v25 + 4 * v21 + 16)));
              uint64_t py = self->super._py;
              v25 = (float32x4_t *)((char *)v25 + 8 * (int)py);
              v16 += py;
              --v24;
            }
            while (v24);
          }
          v23 = (float32x4_t *)((char *)v23 + 8 * v21);
          ++v22;
        }
        while (v22 != v19);
      }
      v15 += 4 * v20;
      ++v18;
    }
    while (v18 < v5 / (int)py);
  }
  return 0;
}

@end