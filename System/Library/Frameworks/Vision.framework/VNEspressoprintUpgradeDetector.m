@interface VNEspressoprintUpgradeDetector
+ (BOOL)isSupportedUpgradeFromPreviousEspressoprint:(id)a3 toNewLowResolutionEspressoprint:(id)a4;
+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- ($FD4688982923A924290ECB669CAF1EC2)highResolutionNewEspressoprint;
- ($FD4688982923A924290ECB669CAF1EC2)highResolutionNewEspressoprintSigma;
- (BOOL)_bindEspressoprintClientBuffer:(id)a3 toNetworkInputBlobName:(id)a4 toNetworkBuffer:(id *)a5 error:(id *)a6;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (void)dealloc;
- (void)setHighResolutionNewEspressoprint:(id *)a3;
- (void)setHighResolutionNewEspressoprintSigma:(id *)a3;
@end

@implementation VNEspressoprintUpgradeDetector

- (void)setHighResolutionNewEspressoprintSigma:(id *)a3
{
  long long v4 = *(_OWORD *)a3->var2;
  long long v3 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)&self->_highResolutionNewEspressoprintSigma.data = *(_OWORD *)&a3->var0;
  *(_OWORD *)self->_highResolutionNewEspressoprintSigma.dim = v4;
  *(_OWORD *)&self->_highResolutionNewEspressoprintSigma.dim[2] = v3;
  long long v5 = *(_OWORD *)&a3->var6;
  long long v7 = *(_OWORD *)a3->var3;
  long long v6 = *(_OWORD *)&a3->var3[2];
  *(_OWORD *)&self->_highResolutionNewEspressoprintSigma.width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_highResolutionNewEspressoprintSigma.channels = v5;
  *(_OWORD *)self->_highResolutionNewEspressoprintSigma.stride = v7;
  *(_OWORD *)&self->_highResolutionNewEspressoprintSigma.stride[2] = v6;
  long long v9 = *(_OWORD *)&a3->var10;
  long long v8 = *(_OWORD *)&a3->var12;
  long long v10 = *(_OWORD *)&a3->var8;
  *(void *)&self->_highResolutionNewEspressoprintSigma.storage_type = *(void *)&a3->var14;
  *(_OWORD *)&self->_highResolutionNewEspressoprintSigma.stride_height = v9;
  *(_OWORD *)&self->_highResolutionNewEspressoprintSigma.stride_batch_number = v8;
  *(_OWORD *)&self->_highResolutionNewEspressoprintSigma.sequence_length = v10;
}

- ($FD4688982923A924290ECB669CAF1EC2)highResolutionNewEspressoprintSigma
{
  long long v3 = *(_OWORD *)&self[4].var3[2];
  *(_OWORD *)&retstr->var10 = *(_OWORD *)self[4].var3;
  *(_OWORD *)&retstr->var12 = v3;
  *(void *)&retstr->var14 = self[4].var4;
  long long v4 = *(_OWORD *)&self[4].var0;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self[3].var13;
  *(_OWORD *)&retstr->var4 = v4;
  long long v5 = *(_OWORD *)&self[4].var2[2];
  *(_OWORD *)&retstr->var6 = *(_OWORD *)self[4].var2;
  *(_OWORD *)&retstr->var8 = v5;
  long long v6 = *(_OWORD *)&self[3].var7;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var5;
  *(_OWORD *)retstr->var2 = v6;
  long long v7 = *(_OWORD *)&self[3].var11;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[3].var9;
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)setHighResolutionNewEspressoprint:(id *)a3
{
  long long v4 = *(_OWORD *)a3->var2;
  long long v3 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)&self->_highResolutionNewEspressoprint.data = *(_OWORD *)&a3->var0;
  *(_OWORD *)self->_highResolutionNewEspressoprint.dim = v4;
  *(_OWORD *)&self->_highResolutionNewEspressoprint.dim[2] = v3;
  long long v5 = *(_OWORD *)&a3->var6;
  long long v7 = *(_OWORD *)a3->var3;
  long long v6 = *(_OWORD *)&a3->var3[2];
  *(_OWORD *)&self->_highResolutionNewEspressoprint.width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_highResolutionNewEspressoprint.channels = v5;
  *(_OWORD *)self->_highResolutionNewEspressoprint.stride = v7;
  *(_OWORD *)&self->_highResolutionNewEspressoprint.stride[2] = v6;
  long long v9 = *(_OWORD *)&a3->var10;
  long long v8 = *(_OWORD *)&a3->var12;
  long long v10 = *(_OWORD *)&a3->var8;
  *(void *)&self->_highResolutionNewEspressoprint.storage_type = *(void *)&a3->var14;
  *(_OWORD *)&self->_highResolutionNewEspressoprint.stride_height = v9;
  *(_OWORD *)&self->_highResolutionNewEspressoprint.stride_batch_number = v8;
  *(_OWORD *)&self->_highResolutionNewEspressoprint.sequence_length = v10;
}

- ($FD4688982923A924290ECB669CAF1EC2)highResolutionNewEspressoprint
{
  long long v3 = *(_OWORD *)&self[3].var3[2];
  *(_OWORD *)&retstr->var10 = *(_OWORD *)self[3].var3;
  *(_OWORD *)&retstr->var12 = v3;
  *(void *)&retstr->var14 = self[3].var4;
  long long v4 = *(_OWORD *)&self[3].var0;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self[2].var13;
  *(_OWORD *)&retstr->var4 = v4;
  long long v5 = *(_OWORD *)&self[3].var2[2];
  *(_OWORD *)&retstr->var6 = *(_OWORD *)self[3].var2;
  *(_OWORD *)&retstr->var8 = v5;
  long long v6 = *(_OWORD *)&self[2].var7;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var5;
  *(_OWORD *)retstr->var2 = v6;
  long long v7 = *(_OWORD *)&self[2].var11;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[2].var9;
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (BOOL)_bindEspressoprintClientBuffer:(id)a3 toNetworkInputBlobName:(id)a4 toNetworkBuffer:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (v10) {
    BOOL v12 = a5 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  uint64_t v13 = !v12;
  +[VNError VNAssert:v13 log:@"One or more of output parameters is/are NULL"];
  id v14 = [v10 descriptorData];
  v15 = (const void *)[v14 bytes];

  memcpy(a5->var0, v15, 4 * [v10 elementCount]);
  v16 = [(VNEspressoModelFileBasedDetector *)self espressoResources];
  [v16 network];
  id v17 = v11;
  [v17 UTF8String];
  uint64_t v18 = espresso_network_bind_buffer();

  if (a6 && v18)
  {
    *a6 = +[VNError errorForEspressoReturnStatus:v18 localizedDescription:@"failed to bind buffer to network"];
  }

  return v18 == 0;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v11 = a5;
  uint64_t v12 = [(id)objc_opt_class() espressoprintClass];
  uint64_t v13 = +[VNValidationUtilities requiredObjectOfClass:v12 forKey:@"VNEspressoprintUpgradeDetectorProcessOption_FromEspressoprint" inOptions:v11 error:a8];
  if (v13)
  {
    id v14 = +[VNValidationUtilities requiredObjectOfClass:v12 forKey:@"VNEspressoprintUpgradeDetectorProcessOption_ToEspressoprint" inOptions:v11 error:a8];
    if (v14)
    {
      if ([(id)objc_opt_class() isSupportedUpgradeFromPreviousEspressoprint:v13 toNewLowResolutionEspressoprint:v14])
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __132__VNEspressoprintUpgradeDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
        aBlock[3] = &unk_1E5B1DFB0;
        aBlock[4] = self;
        id v19 = v13;
        id v20 = v14;
        v15 = (unsigned int (**)(void *, id *))_Block_copy(aBlock);
        if (v15[2](v15, a8)) {
          a8 = (id *)MEMORY[0x1E4F1CBF0];
        }
        else {
          a8 = 0;
        }

        goto LABEL_12;
      }
      if (!a8)
      {
LABEL_12:

        goto LABEL_13;
      }
      v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Espressoprint upgrade is not supported for these pair of                                                                  prints produced with request revisions: from = %lu; to = %lu",
                      [v13 requestRevision],
                      [v14 requestRevision]);
      *a8 = +[VNError errorForInternalErrorWithLocalizedDescription:v16];
    }
    a8 = 0;
    goto LABEL_12;
  }
  a8 = 0;
LABEL_13:

  return a8;
}

uint64_t __132__VNEspressoprintUpgradeDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (![*(id *)(a1 + 32) _bindEspressoprintClientBuffer:*(void *)(a1 + 40) toNetworkInputBlobName:@"old_embedding" toNetworkBuffer:*(void *)(a1 + 32) + 88 error:a2]|| !objc_msgSend(*(id *)(a1 + 32), "_bindEspressoprintClientBuffer:toNetworkInputBlobName:toNetworkBuffer:error:", *(void *)(a1 + 48), @"thumbnail_embedding", *(void *)(a1 + 32) + 256, a2))
  {
    return 0;
  }
  long long v4 = *(void **)(a1 + 32);

  return [v4 executePlanAndReturnError:a2];
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  return 1;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v22.receiver = self;
  v22.super_class = (Class)VNEspressoprintUpgradeDetector;
  if (!-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v22, sel_completeInitializationForSession_error_, a3))return 0; {
  aBlock[0] = MEMORY[0x1E4F143A8];
  }
  aBlock[1] = 3221225472;
  aBlock[2] = __73__VNEspressoprintUpgradeDetector_completeInitializationForSession_error___block_invoke;
  aBlock[3] = &__block_descriptor_36_e47_B36__0_____v_v_4Q__4Q_QQQQQQQQQQi_8r_v16B24__28l;
  int v21 = 0;
  long long v6 = (uint64_t (**)(void *, $70B10377DC9035999D77C63B14D421A0 *, void **, void, id *))_Block_copy(aBlock);
  long long v7 = operator new(0x20uLL);
  uint64_t v18 = v7 + 2;
  id v19 = v7 + 2;
  *long long v7 = xmmword_1A4111C18;
  v7[1] = unk_1A4111C28;
  __p = v7;
  if ((v6[2](v6, &self->_highResolutionOldEspressoprint, &__p, 1, a4) & 1) != 0
    && v6[2](v6, &self->_lowResolutionNewEspressoprint, &__p, 1, a4)
    && v6[2](v6, &self->_highResolutionNewEspressoprint, &__p, 0, a4))
  {
    long long v8 = operator new(0x20uLL);
    v15 = v8 + 2;
    v16 = v8 + 2;
    *long long v8 = xmmword_1A4111C38;
    v8[1] = unk_1A4111C48;
    id v14 = v8;
    if (v6[2](v6, &self->_highResolutionNewEspressoprintSigma, &v14, 0, a4))
    {
      long long v9 = [(VNEspressoModelFileBasedDetector *)self espressoResources];
      [v9 network];
      [@"embedding" UTF8String];
      uint64_t v10 = espresso_network_bind_buffer();

      if (!v10)
      {
        id v11 = [(VNEspressoModelFileBasedDetector *)self espressoResources];
        [v11 network];
        [@"sigma" UTF8String];
        uint64_t v10 = espresso_network_bind_buffer();

        if (!v10)
        {
          BOOL v12 = 1;
LABEL_17:
          if (v14)
          {
            v15 = v14;
            operator delete(v14);
          }
          goto LABEL_12;
        }
      }
      if (a4)
      {
        +[VNError errorForEspressoReturnStatus:v10 localizedDescription:@"failed to bind buffer to network"];
        BOOL v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
    BOOL v12 = 0;
    goto LABEL_17;
  }
  BOOL v12 = 0;
LABEL_12:
  if (__p)
  {
    uint64_t v18 = __p;
    operator delete(__p);
  }

  return v12;
}

BOOL __73__VNEspressoprintUpgradeDetector_completeInitializationForSession_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  *(void *)(a2 + 160) = 0x3030303030303030;
  *(void *)&long long v10 = 0x3030303030303030;
  *((void *)&v10 + 1) = 0x3030303030303030;
  *(_OWORD *)(a2 + 128) = v10;
  *(_OWORD *)(a2 + 144) = v10;
  *(_OWORD *)(a2 + 96) = v10;
  *(_OWORD *)(a2 + 112) = v10;
  *(_OWORD *)(a2 + 64) = v10;
  *(_OWORD *)(a2 + 80) = v10;
  *(_OWORD *)(a2 + 32) = v10;
  *(_OWORD *)(a2 + 48) = v10;
  *(_OWORD *)a2 = v10;
  *(_OWORD *)(a2 + 16) = v10;
  espresso_buffer_pack_tensor_shape();
  uint64_t v11 = *(unsigned int *)(a1 + 32);
  if (v11)
  {
    if (a5)
    {
      *a5 = +[VNError errorForEspressoReturnStatus:v11 localizedDescription:@"failed to shape tensor"];
    }
  }
  else
  {
    if (a4) {
      *(void *)a2 = malloc_type_calloc(*(void *)(*(void *)a3 + 8), 4uLL, 0x2906025AuLL);
    }
    *(_DWORD *)(a2 + 160) = 65568;
  }
  return v11 == 0;
}

- (void)dealloc
{
  free(self->_highResolutionOldEspressoprint.data);
  self->_highResolutionOldEspressoprint.data = 0;
  free(self->_lowResolutionNewEspressoprint.data);
  self->_lowResolutionNewEspressoprint.data = 0;
  v3.receiver = self;
  v3.super_class = (Class)VNEspressoprintUpgradeDetector;
  [(VNDetector *)&v3 dealloc];
}

+ (BOOL)isSupportedUpgradeFromPreviousEspressoprint:(id)a3 toNewLowResolutionEspressoprint:(id)a4
{
  return 0;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  long long v7 = @"VNComputeStageMain";
  long long v4 = +[VNComputeDeviceUtilities allCPUComputeDevices];
  v8[0] = v4;
  long long v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (id)[v5 objectForKeyedSubscript:@"VNEspressoprintUpgradeDetectorProcessOption_EspressoprintClass"];
  if (([v6 isEqual:objc_opt_class()] & 1) != 0
    || [v6 isEqual:objc_opt_class()])
  {
    long long v7 = objc_opt_class();
  }
  else if (a4)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:@"Unknown espresso print type"];
    long long v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v7 = 0;
  }

  return (Class)v7;
}

@end