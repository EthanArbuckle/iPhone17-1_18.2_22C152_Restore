@interface MRUVolumeGroupCoordinator
- (BOOL)shouldAllowEqualization;
- (MRUVolumeController)mainVolumeController;
- (MRUVolumeGroupCoordinator)initWithMainVolumeController:(id)a3;
- (NSArray)volumeControllers;
- (NSArray)volumeScales;
- (float)updateVolumeScales;
- (void)beginEqualization;
- (void)equalizeVolumes;
- (void)finishEqualization;
- (void)setVolumeControllers:(id)a3;
- (void)setVolumeScales:(id)a3;
- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4;
@end

@implementation MRUVolumeGroupCoordinator

- (MRUVolumeGroupCoordinator)initWithMainVolumeController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUVolumeGroupCoordinator;
  v6 = [(MRUVolumeGroupCoordinator *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mainVolumeController, a3);
    [(MRUVolumeController *)v7->_mainVolumeController setCoordinationDelegate:v7];
  }

  return v7;
}

- (void)setVolumeControllers:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v6 = self->_volumeControllers;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v10++) setCoordinationDelegate:0];
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  objc_storeStrong((id *)&self->_volumeControllers, a3);
  [(MRUVolumeGroupCoordinator *)self updateVolumeScales];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "setCoordinationDelegate:", self, (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (BOOL)shouldAllowEqualization
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_volumeControllers count] < 2) {
    return 0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_volumeControllers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "volumeValue", (void)v13);
        float v9 = v8;
        [(MRUVolumeController *)self->_mainVolumeController volumeValue];
        if (vabds_f32(v9, v10) > 0.00000011921)
        {
          BOOL v11 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_13:

  return v11;
}

- (void)beginEqualization
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_volumeControllers;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "beginEqualization", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)equalizeVolumes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(MRUVolumeController *)self->_mainVolumeController volumeValue];
  int v4 = v3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_volumeControllers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v5);
        }
        LODWORD(v7) = v4;
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setVolumeValue:", v7, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)finishEqualization
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_volumeControllers;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "finishEqualization", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  long long v15 = (MRUVolumeController *)a3;
  [(MRUVolumeGroupCoordinator *)self updateVolumeScales];
  if (self->_mainVolumeController == v15)
  {
    [(MRUVolumeController *)v15 volumeValue];
    float v7 = v6;
    if ([(NSArray *)self->_volumeControllers count])
    {
      unint64_t v8 = 0;
      do
      {
        long long v9 = [(NSArray *)self->_volumeControllers objectAtIndexedSubscript:v8];
        if (v9 != v15)
        {
          long long v10 = [(NSArray *)self->_volumeScales objectAtIndexedSubscript:v8];
          [v10 floatValue];
          float v12 = v11;

          *(float *)&double v13 = v7 * v12;
          long long v14 = [NSNumber numberWithFloat:v13];
          [(MRUVolumeController *)v9 setOptimisticValue:v14];
        }
        ++v8;
      }
      while ([(NSArray *)self->_volumeControllers count] > v8);
    }
  }
  else
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithFloat:");
    [(MRUVolumeController *)self->_mainVolumeController setOptimisticValue:v5];
  }
}

- (float)updateVolumeScales
{
  uint64_t v12 = 0;
  double v13 = (float *)&v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  volumeControllers = self->_volumeControllers;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__MRUVolumeGroupCoordinator_updateVolumeScales__block_invoke;
  v11[3] = &unk_1E5F10310;
  v11[4] = &v12;
  uint64_t v4 = [(NSArray *)volumeControllers msv_map:v11];
  uint64_t v5 = v4;
  float v6 = v13[6];
  if (v6 > 0.0)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__MRUVolumeGroupCoordinator_updateVolumeScales__block_invoke_2;
    v10[3] = &unk_1E5F10338;
    v10[4] = &v12;
    objc_msgSend(v4, "msv_map:", v10);
    float v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    volumeScales = self->_volumeScales;
    self->_volumeScales = v7;

    float v6 = v13[6];
  }

  _Block_object_dispose(&v12, 8);
  return v6;
}

uint64_t __47__MRUVolumeGroupCoordinator_updateVolumeScales__block_invoke(uint64_t a1, void *a2)
{
  [a2 volumeValue];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  float v5 = *(float *)(v4 + 24);
  if (v5 < v3) {
    float v5 = v3;
  }
  *(float *)(v4 + 24) = v5;
  float v6 = NSNumber;

  return objc_msgSend(v6, "numberWithFloat:");
}

uint64_t __47__MRUVolumeGroupCoordinator_updateVolumeScales__block_invoke_2(uint64_t a1, void *a2)
{
  float v3 = NSNumber;
  [a2 floatValue];
  *(float *)&double v4 = *(float *)&v4 / *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

  return [v3 numberWithFloat:v4];
}

- (MRUVolumeController)mainVolumeController
{
  return self->_mainVolumeController;
}

- (NSArray)volumeControllers
{
  return self->_volumeControllers;
}

- (NSArray)volumeScales
{
  return self->_volumeScales;
}

- (void)setVolumeScales:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeScales, 0);
  objc_storeStrong((id *)&self->_volumeControllers, 0);

  objc_storeStrong((id *)&self->_mainVolumeController, 0);
}

@end