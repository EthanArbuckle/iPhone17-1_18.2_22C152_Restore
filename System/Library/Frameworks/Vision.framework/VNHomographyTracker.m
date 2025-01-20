@interface VNHomographyTracker
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNHomographyTracker

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities allCPUComputeDevices];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12 = a5;
  v13 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v12 error:a8];
  if (v13)
  {
    v14 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNHomographyTrackerProcessOption_State" inOptions:v12 error:a8];
    if (v14)
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __121__VNHomographyTracker_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
      v20[3] = &unk_1E5B1BE40;
      v20[4] = self;
      id v21 = v12;
      id v22 = v14;
      v25 = a4;
      id v23 = v13;
      id v16 = v15;
      id v24 = v16;
      v17 = _Block_copy(v20);
      if (VNExecuteBlock(v17, (uint64_t)a8)) {
        id v18 = v16;
      }
      else {
        id v18 = 0;
      }
    }
    else
    {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

uint64_t __121__VNHomographyTracker_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, void *a2)
{
  v4 = [*(id *)(a1 + 32) validatedImageBufferFromOptions:*(void *)(a1 + 40) error:a2];
  v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  [v4 timingInfo];
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    if (ICAnalysisAddFrame())
    {
      uint64_t v7 = *(void *)(v6 + 24);
      *(void *)(v6 + 24) = v7 - 1;
      if (v7 > 1) {
        goto LABEL_5;
      }
      dispatch_time_t v9 = dispatch_time(0, 60000000000);
      if (!dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v6 + 16), v9))
      {
        uint64_t v37 = a1;
        v11 = 0;
        id v12 = 0;
        unint64_t v13 = 0;
        v14 = (os_unfair_lock_s *)(v6 + 32);
        do
        {
          id v15 = v14;
          os_unfair_lock_lock(v14);
          id v16 = *(long long **)(v6 + 40);
          v17 = *(long long **)(v6 + 48);
          if (v16 != v17)
          {
            do
            {
              if ((unint64_t)v12 >= v13)
              {
                uint64_t v21 = (v12 - v11) >> 6;
                unint64_t v22 = v21 + 1;
                if ((unint64_t)(v21 + 1) >> 58) {
                  std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                }
                if ((uint64_t)(v13 - (void)v11) >> 5 > v22) {
                  unint64_t v22 = (uint64_t)(v13 - (void)v11) >> 5;
                }
                if (v13 - (unint64_t)v11 >= 0x7FFFFFFFFFFFFFC0) {
                  unint64_t v23 = 0x3FFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v23 = v22;
                }
                if (v23) {
                  unint64_t v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<simd_float3x3,float>>>(v23);
                }
                else {
                  uint64_t v24 = 0;
                }
                v25 = (_OWORD *)(v23 + (v21 << 6));
                long long v26 = *v16;
                long long v27 = v16[1];
                long long v28 = v16[3];
                v25[2] = v16[2];
                v25[3] = v28;
                _OWORD *v25 = v26;
                v25[1] = v27;
                if (v12 == v11)
                {
                  v30 = (char *)(v23 + (v21 << 6));
                }
                else
                {
                  unint64_t v29 = v23 + (v21 << 6);
                  do
                  {
                    v30 = (char *)(v29 - 64);
                    long long v31 = *((_OWORD *)v12 - 4);
                    long long v32 = *((_OWORD *)v12 - 3);
                    long long v33 = *((_OWORD *)v12 - 1);
                    *(_OWORD *)(v29 - 32) = *((_OWORD *)v12 - 2);
                    *(_OWORD *)(v29 - 16) = v33;
                    *(_OWORD *)(v29 - 64) = v31;
                    *(_OWORD *)(v29 - 48) = v32;
                    v12 -= 64;
                    v29 -= 64;
                  }
                  while (v12 != v11);
                }
                unint64_t v13 = v23 + (v24 << 6);
                id v12 = (char *)(v25 + 4);
                if (v11) {
                  operator delete(v11);
                }
                v11 = v30;
              }
              else
              {
                long long v18 = *v16;
                long long v19 = v16[1];
                long long v20 = v16[3];
                *((_OWORD *)v12 + 2) = v16[2];
                *((_OWORD *)v12 + 3) = v20;
                *(_OWORD *)id v12 = v18;
                *((_OWORD *)v12 + 1) = v19;
                v12 += 64;
              }
              v16 += 4;
            }
            while (v16 != v17);
            id v16 = *(long long **)(v6 + 40);
          }
          *(void *)(v6 + 48) = v16;
          v14 = v15;
          os_unfair_lock_unlock(v15);
        }
        while (!dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v6 + 16), 0));
        if (v11 != v12)
        {
          v34 = (double *)v11;
          do
          {
            v35 = [(VNObservation *)[VNImageHomographicAlignmentObservation alloc] initWithOriginatingRequestSpecifier:*(void *)(v37 + 56)];
            -[VNImageHomographicAlignmentObservation setWarpTransform:](v35, "setWarpTransform:", *v34, v34[2], v34[4]);
            LODWORD(v36) = *((_DWORD *)v34 + 12);
            [(VNObservation *)v35 setConfidence:v36];
            [*(id *)(v37 + 64) addObject:v35];

            v34 += 8;
          }
          while (v34 != (double *)v12);
        }
        if (v11) {
          operator delete(v11);
        }
        goto LABEL_5;
      }
      if (a2)
      {
        *a2 = +[VNError errorForInternalErrorWithLocalizedDescription:@"timeout exceeded"];
      }
    }
LABEL_9:
    uint64_t v8 = 0;
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v8 = 1;
LABEL_10:

  return v8;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a4;
  v17 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a8];
  long long v18 = v17;
  if (v17)
  {
    uint64_t v19 = [v17 width];
    uint64_t v20 = [v18 height];
    uint64_t v21 = (__CVBuffer *)objc_msgSend(v18, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)(width * (double)(v19 & 0xFFFFFFFFFFFFFFFELL)), (unint64_t)(height * (double)(v20 & 0xFFFFFFFFFFFFFFFELL)), 875704422, v16, a8, x * (double)(v19 & 0xFFFFFFFFFFFFFFFELL), y * (double)(v20 & 0xFFFFFFFFFFFFFFFELL));
    *a7 = v21;
    BOOL v22 = v21 != 0;
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

@end