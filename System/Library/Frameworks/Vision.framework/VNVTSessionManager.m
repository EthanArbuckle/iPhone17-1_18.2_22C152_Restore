@interface VNVTSessionManager
- (BOOL)isEqual:(id)a3;
- (VNVTSessionManager)init;
- (VTSessionRef)waitAndGetAvailablePixelRotationSessionForInputPixelFormat:(int)a3 outputPixelFormat:(int)a4 rotation:(int)a5 flipHorizontal:(int)a6 flipVertical:(void *)a7 error:;
- (id).cxx_construct;
- (unint64_t)hash;
- (void)releasePixelRotationSession:(uint64_t)a1;
@end

@implementation VNVTSessionManager

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (VNVTSessionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)VNVTSessionManager;
  v2 = [(VNVTSessionManager *)&v6 init];
  if (!v2) {
    return 0;
  }
  v7.receiver = v2;
  v7.super_class = (Class)VNVTSessionManager;
  v3 = [(VNVTSessionManager *)&v7 init];
  v4 = v3;
  if (v3)
  {
    v3->_maxSessionsCount = 3;
    operator new();
  }
  return v4;
}

- (void).cxx_destruct
{
  value = (id *)self->_pixelRotationSessionsHandler.__ptr_.__value_;
  self->_pixelRotationSessionsHandler.__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<SessionsHandler<VNVTPixelRotationSession>>::operator()[abi:ne180100](value);
  }
  v4 = (id *)self->_pixelTransferSessionsHandler.__ptr_.__value_;
  self->_pixelTransferSessionsHandler.__ptr_.__value_ = 0;
  if (v4)
  {
    std::default_delete<SessionsHandler<VNVTPixelRotationSession>>::operator()[abi:ne180100](v4);
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNVTSessionManager *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v8 = 0;
    goto LABEL_9;
  }
  v5 = v4;
  if (!self)
  {
    unint64_t maxSessionsCount = 0;
    if (v5) {
      goto LABEL_5;
    }
LABEL_11:
    unint64_t v7 = 0;
    goto LABEL_6;
  }
  unint64_t maxSessionsCount = self->_maxSessionsCount;
  if (!v5) {
    goto LABEL_11;
  }
LABEL_5:
  unint64_t v7 = v5->_maxSessionsCount;
LABEL_6:
  BOOL v8 = maxSessionsCount == v7;

LABEL_9:
  return v8;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)VNVTSessionManager;
  id v3 = [(VNVTSessionManager *)&v6 hash];
  if (self) {
    unint64_t maxSessionsCount = self->_maxSessionsCount;
  }
  else {
    unint64_t maxSessionsCount = 0;
  }
  return maxSessionsCount ^ __ROR8__(v3, 51);
}

- (VTSessionRef)waitAndGetAvailablePixelRotationSessionForInputPixelFormat:(int)a3 outputPixelFormat:(int)a4 rotation:(int)a5 flipHorizontal:(int)a6 flipVertical:(void *)a7 error:
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __142__VNVTSessionManager_waitAndGetAvailablePixelRotationSessionForInputPixelFormat_outputPixelFormat_rotation_flipHorizontal_flipVertical_error___block_invoke;
    aBlock[3] = &__block_descriptor_36_e21_B16__0__VNVTSession_8l;
    int v50 = a4;
    v11 = _Block_copy(aBlock);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __142__VNVTSessionManager_waitAndGetAvailablePixelRotationSessionForInputPixelFormat_outputPixelFormat_rotation_flipHorizontal_flipVertical_error___block_invoke_2;
    v45[3] = &__block_descriptor_38_e22___VNVTSession_16__0__8l;
    int v46 = a4;
    char v47 = a5;
    char v48 = a6;
    v12 = _Block_copy(v45);
    uint64_t v13 = *(void *)(a1 + 16);
    v14 = v11;
    v43 = v12;
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v13 + 8), 0xFFFFFFFFFFFFFFFFLL);
    lock = (os_unfair_lock_s *)(v13 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(v13 + 16));
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v42 = v13;
    id v15 = *(id *)(v13 + 24);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v16)
    {
      uint64_t v17 = 0;
      uint64_t v18 = *(void *)v52;
LABEL_4:
      uint64_t v19 = 0;
      uint64_t v44 = v17 + v16;
      while (1)
      {
        if (*(void *)v52 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = (VTSessionRef *)*(id *)(*((void *)&v51 + 1) + 8 * v19);
        v21 = v20;
        if (v20)
        {
          if (*((_DWORD *)v20 + 2) == a2)
          {
            int v22 = *((_DWORD *)v20 + 3);
LABEL_10:
            if (v22 == a3 && (v14[2](v14, v20) & 1) != 0)
            {

              if (!v21) {
                goto LABEL_20;
              }
              uint64_t v24 = v17 + v19;
              uint64_t v25 = v42;
              [*(id *)(v42 + 24) removeObjectAtIndex:v24];
              goto LABEL_26;
            }
          }
        }
        else if (!a2)
        {
          int v22 = 0;
          goto LABEL_10;
        }

        if (v16 == ++v19)
        {
          uint64_t v23 = [v15 countByEnumeratingWithState:&v51 objects:v55 count:16];
          uint64_t v16 = v23;
          uint64_t v17 = v44;
          if (v23) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

LABEL_20:
    uint64_t v26 = [*(id *)(v42 + 24) count];
    uint64_t v27 = [*(id *)(v42 + 32) count];
    if (v26 && v27 + v26 == *(_DWORD *)v42) {
      [*(id *)(v42 + 24) removeLastObject];
    }
    uint64_t v28 = v43[2](v43, a7);
    v21 = (VTSessionRef *)v28;
    if (v28)
    {
      *(_DWORD *)(v28 + 8) = a2;
      *(_DWORD *)(v28 + 12) = a3;
    }
    uint64_t v25 = v42;
LABEL_26:
    [*(id *)(v25 + 32) addObject:v21];
    os_unfair_lock_unlock(lock);

    if (!v21) {
      goto LABEL_39;
    }
    VTSessionRef v29 = v21[4];
    v30 = (const void *)*MEMORY[0x1E4F1CFD0];
    v31 = (const void *)*MEMORY[0x1E4F1CFC8];
    if (a5) {
      v32 = (const void *)*MEMORY[0x1E4F1CFD0];
    }
    else {
      v32 = (const void *)*MEMORY[0x1E4F1CFC8];
    }
    uint64_t v33 = VTSessionSetProperty(v21[4], (CFStringRef)*MEMORY[0x1E4F45098], v32);
    if (v33)
    {
      if (a7)
      {
LABEL_38:
        v35 = [NSString stringWithFormat:@"Cannot set VTSession property, error: %d", v33];
        *a7 = +[VNError errorForInternalErrorWithLocalizedDescription:v35];
      }
    }
    else
    {
      if (a6) {
        v34 = v30;
      }
      else {
        v34 = v31;
      }
      uint64_t v33 = VTSessionSetProperty(v29, (CFStringRef)*MEMORY[0x1E4F450A0], v34);
      if (!v33)
      {
        v36 = v21;
        goto LABEL_40;
      }
      if (a7) {
        goto LABEL_38;
      }
    }
LABEL_39:
    v36 = 0;
LABEL_40:

    goto LABEL_41;
  }
  v36 = 0;
LABEL_41:

  return v36;
}

BOOL __142__VNVTSessionManager_waitAndGetAvailablePixelRotationSessionForInputPixelFormat_outputPixelFormat_rotation_flipHorizontal_flipVertical_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    int v2 = *(_DWORD *)(a2 + 24);
  }
  else {
    int v2 = 0;
  }
  return v2 == *(_DWORD *)(a1 + 32);
}

id __142__VNVTSessionManager_waitAndGetAvailablePixelRotationSessionForInputPixelFormat_outputPixelFormat_rotation_flipHorizontal_flipVertical_error___block_invoke_2(uint64_t a1, void *a2)
{
  self;
  uint64_t v3 = VTPixelRotationSessionCreateWithRotationAndFlip();
  if (a2)
  {
    id v4 = [NSString stringWithFormat:@"Cannot create VTPixelRotationSessionRef object: session: %lu, error: %d", 0, v3];
    uint64_t v5 = [v4 UTF8String];
    VNValidatedLog(4, @"%s", v6, v7, v8, v9, v10, v11, v5);
    *a2 = +[VNError errorForInternalErrorWithLocalizedDescription:v4];
  }

  return 0;
}

- (void)releasePixelRotationSession:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 16);
    id v13 = v3;
    id v5 = v3;
    if (v5)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v4 + 16));
      if (([*(id *)(v4 + 32) containsObject:v5] & 1) == 0) {
      [*(id *)(v4 + 24) addObject:v5];
      }
      [*(id *)(v4 + 32) removeObject:v5];
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 16));
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v4 + 8));
    }

    id v3 = v13;
  }
}

@end