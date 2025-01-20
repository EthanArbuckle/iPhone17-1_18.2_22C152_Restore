@interface HMCameraView
- (HMCameraSource)cameraSource;
- (HMCameraView)init;
- (void)_fillSlotForCameraSource;
- (void)setCameraSource:(HMCameraSource *)cameraSource;
- (void)willMoveToWindow:(id)a3;
@end

@implementation HMCameraView

- (void)willMoveToWindow:(id)a3
{
  v5 = [(HMCameraView *)self cameraSource];

  if (a3 && v5)
  {
    [(HMCameraView *)self _fillSlotForCameraSource];
  }
}

- (HMCameraSource)cameraSource
{
  return self->_cameraSource;
}

- (HMCameraView)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMCameraView;
  return [(HMCameraView *)&v3 init];
}

- (void).cxx_destruct
{
}

- (void)_fillSlotForCameraSource
{
  objc_super v3 = [(HMCameraView *)self cameraSource];
  v4 = [v3 slotIdentifier];
  int v5 = [v4 unsignedIntValue];

  v6 = [(HMCameraView *)self cameraSource];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__HMCameraView__fillSlotForCameraSource__block_invoke;
  v7[3] = &unk_1E593F4F8;
  v7[4] = self;
  int v8 = v5;
  [v6 fillSlotWithCompletionHandler:v7];
}

void __40__HMCameraView__fillSlotForCameraSource__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = *(id *)(a1 + 32);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fill slot for camera source: %@", buf, 0x16u);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__HMCameraView__fillSlotForCameraSource__block_invoke_1;
    v8[3] = &unk_1E593F4D0;
    int v9 = *(_DWORD *)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

void __40__HMCameraView__fillSlotForCameraSource__block_invoke_1(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F39CF8] begin];
  v2 = [MEMORY[0x1E4F39B58] objectForSlot:*(unsigned int *)(a1 + 40)];
  id v3 = (void *)MEMORY[0x19F3A64A0]();
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543618;
    int v8 = v5;
    __int16 v9 = 2112;
    v10 = v2;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Setting layer contents: %@", (uint8_t *)&v7, 0x16u);
  }
  v6 = [*(id *)(a1 + 32) layer];
  [v6 setContents:v2];

  [MEMORY[0x1E4F39CF8] commit];
}

- (void)setCameraSource:(HMCameraSource *)cameraSource
{
  __int16 v9 = cameraSource;
  id v5 = [(HMCameraView *)self cameraSource];

  v6 = v9;
  if (v5 != v9)
  {
    objc_storeStrong((id *)&self->_cameraSource, cameraSource);
    if (v9)
    {
      int v7 = [(HMCameraView *)self window];

      v6 = v9;
      if (!v7) {
        goto LABEL_7;
      }
      [(HMCameraView *)self _fillSlotForCameraSource];
    }
    else
    {
      [MEMORY[0x1E4F39CF8] begin];
      int v8 = [(HMCameraView *)self layer];
      [v8 setContents:0];

      [MEMORY[0x1E4F39CF8] commit];
    }
    v6 = v9;
  }
LABEL_7:
}

@end