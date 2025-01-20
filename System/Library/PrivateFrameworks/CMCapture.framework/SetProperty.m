@interface SetProperty
@end

@implementation SetProperty

uint64_t __captureSession_SetProperty_block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t SystemStyleFromDefaults = *(void *)(a1 + 32);
  if (!SystemStyleFromDefaults) {
    uint64_t SystemStyleFromDefaults = captureSession_getSystemStyleFromDefaults();
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 48) + 664), "cinematographyPipelines"), "count"))
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v3 = (void *)[*(id *)(*(void *)(a1 + 48) + 664) cinematographyPipelines];
    uint64_t result = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = *(void *)v18;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          -[FigCaptureCinematographyPipeline setSmartStyle:](*(void *)(*((void *)&v17 + 1) + 8 * v7++), SystemStyleFromDefaults);
        }
        while (v5 != v7);
        uint64_t result = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
        uint64_t v5 = result;
      }
      while (result);
    }
  }
  else if (objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 48) + 664), "cameraSourcePipelines"), "count"))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v8 = objc_msgSend(*(id *)(*(void *)(a1 + 48) + 664), "cameraSourcePipelines", 0);
    uint64_t result = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (result)
    {
      uint64_t v9 = result;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          -[FigCaptureCameraSourcePipeline setSmartStyle:](*(void *)(*((void *)&v13 + 1) + 8 * v11++), SystemStyleFromDefaults);
        }
        while (v9 != v11);
        uint64_t result = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
        uint64_t v9 = result;
      }
      while (result);
    }
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 360));
    id v12 = *(id *)(*(void *)(a1 + 48) + 448);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 360));
    uint64_t result = [v12 setSmartStyle:SystemStyleFromDefaults];
  }
  *(unsigned char *)(*(void *)(a1 + 48) + 624) = *(void *)(a1 + 32) != 0;
  return result;
}

void __captureDeferredPhotoProcessor_SetProperty_block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) BOOLValue];
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(unsigned __int8 *)(v3 + 56) != v2)
  {
    *(unsigned char *)(v3 + 56) = v2;
    if ((v2 & 1) == 0)
    {
      v4 = *(const void **)(a1 + 48);
      captureDeferredPhotoProcessor_workloop(v4);
    }
  }
}

@end