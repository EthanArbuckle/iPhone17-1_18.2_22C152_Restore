@interface SetConfiguration
@end

@implementation SetConfiguration

void __captureSession_SetConfiguration_block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = *(os_unfair_lock_s **)(a1 + 32);
  if (v3[102]._os_unfair_lock_opaque - 1 > 1)
  {
    os_unfair_lock_lock(v3 + 90);
    uint64_t v5 = *(void *)(a1 + 32);
    *(void *)(v5 + 416) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 360));
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v31 = v1;
      LODWORD(v30) = 0;
      FigDebugAssert3();
    }
    os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 360));
    v7 = *(void **)(DerivedStorage + 448);
    if (v7 == *(void **)(DerivedStorage + 456))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 360));
      id v8 = 0;
    }
    else
    {
      id v8 = v7;
      os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 360));
      if (v8)
      {
        v9 = [[FigCaptureSessionParsedConfiguration alloc] initWithSessionConfiguration:v8 clientSetsUserInitiatedCaptureRequestTime:captureSession_clientSetsUserInitiatedCaptureRequestTime() restrictions:*(void *)(DerivedStorage + 440)];
        if (v9)
        {
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          v10 = [(FigCaptureSessionParsedConfiguration *)v9 parsedCameraSourceConfigurations];
          uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v33;
            while (2)
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v33 != v13) {
                  objc_enumerationMutation(v10);
                }
                v15 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "cameraConfiguration", v30, v31);
                if (([v15 hasSetVideoZoomFactorOnCaptureSource] & 1) == 0)
                {
                  uint64_t v16 = [v15 source];
                  if (v16 && (uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 16)) != 0) {
                    uint64_t v18 = v17;
                  }
                  else {
                    uint64_t v18 = 0;
                  }
                  v19 = *(unsigned int (**)(uint64_t))(v18 + 8);
                  if (!v19 || v19(v16)) {
                    goto LABEL_38;
                  }
                  uint64_t v20 = [v15 source];
                  v21 = NSNumber;
                  [v15 videoZoomFactor];
                  uint64_t v22 = objc_msgSend(v21, "numberWithFloat:");
                  uint64_t v23 = *(void *)(CMBaseObjectGetVTable() + 8);
                  uint64_t v24 = v23 ? v23 : 0;
                  v25 = *(unsigned int (**)(uint64_t, __CFString *, uint64_t))(v24 + 56);
                  if (!v25 || v25(v20, @"VideoZoomFactor", v22)) {
                    goto LABEL_38;
                  }
                  uint64_t v26 = [v15 source];
                  if (v26 && (uint64_t v27 = *(void *)(CMBaseObjectGetVTable() + 16)) != 0) {
                    uint64_t v28 = v27;
                  }
                  else {
                    uint64_t v28 = 0;
                  }
                  v29 = *(unsigned int (**)(uint64_t))(v28 + 16);
                  if (!v29 || v29(v26))
                  {
LABEL_38:
                    FigDebugAssert3();
                    goto LABEL_39;
                  }
                  [v15 setHasSetVideoZoomFactorOnCaptureSource:1];
                }
              }
              uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }
        }
        else
        {
          FigSignalErrorAt();
        }
      }
    }
LABEL_39:
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    captureSession_commitInflightConfiguration(v4);
  }
}

@end