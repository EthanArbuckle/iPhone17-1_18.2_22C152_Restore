@interface HMIVideoEncoder
- (BOOL)_initSessionWithDimensions:(id)a3 codecType:(unsigned int)a4 useHardwareAcceleration:(BOOL)a5 error:(id *)a6;
- (BOOL)forceKeyFrameOnNextEncodedFrame;
- (BOOL)prepare;
- (HMIVideoEncoder)initWithDimensions:(id)a3 codecType:(unsigned int)a4 useHardwareAcceleration:(BOOL)a5 error:(id *)a6;
- (HMIVideoEncoderDataRate)dataRateLimit;
- (HMIVideoEncoderDelegate)delegate;
- (NSString)logIdentifier;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)workQueue;
- (OpaqueVTCompressionSession)session;
- (double)expectedDuration;
- (double)quality;
- (int)_getFloat64Property:(__CFString *)a3 propertyValueOut:(double *)a4;
- (int)_getProperty:(__CFString *)a3 propertyValue:(const void *)a4;
- (int)_getSInt32Property:(__CFString *)a3 propertyValueOut:(int *)a4;
- (int)_setFloat64Property:(__CFString *)a3 propertyValue:(double)a4;
- (int)_setProperty:(__CFString *)a3 propertyValue:(void *)a4;
- (int)_setSInt32Property:(__CFString *)a3 propertyValue:(int)a4;
- (int64_t)averageBitRate;
- (int64_t)expectedFrameRate;
- (int64_t)maxFrameDelayCount;
- (int64_t)maxKeyFrameIntervalDuration;
- (unint64_t)numberOfDroppedFrames;
- (void)_invalidate;
- (void)_invalidateWithErr:(int)a3;
- (void)dealloc;
- (void)flush;
- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setAverageBitRate:(int64_t)a3;
- (void)setDataRateLimit:(HMIVideoEncoderDataRate)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setExpectedDuration:(double)a3;
- (void)setExpectedFrameRate:(int64_t)a3;
- (void)setForceKeyFrameOnNextEncodedFrame:(BOOL)a3;
- (void)setLogIdentifier:(id)a3;
- (void)setMaxFrameDelayCount:(int64_t)a3;
- (void)setMaxKeyFrameIntervalDuration:(int64_t)a3;
- (void)setQuality:(double)a3;
- (void)setSession:(OpaqueVTCompressionSession *)a3;
@end

@implementation HMIVideoEncoder

- (HMIVideoEncoder)initWithDimensions:(id)a3 codecType:(unsigned int)a4 useHardwareAcceleration:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  v17.receiver = self;
  v17.super_class = (Class)HMIVideoEncoder;
  v10 = [(HMIVideoEncoder *)&v17 init];
  if (!v10) {
    goto LABEL_4;
  }
  v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v12 = dispatch_queue_create("HMIVideoEncoderWorkQueue", v11);
  workQueue = v10->_workQueue;
  v10->_workQueue = (OS_dispatch_queue *)v12;

  BOOL v14 = [(HMIVideoEncoder *)v10 _initSessionWithDimensions:a3 codecType:v8 useHardwareAcceleration:v7 error:a6];
  v15 = 0;
  if (v14)
  {
    v10->super.super._status = 2;
LABEL_4:
    v15 = v10;
  }

  return v15;
}

- (BOOL)_initSessionWithDimensions:(id)a3 codecType:(unsigned int)a4 useHardwareAcceleration:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  v29[1] = *MEMORY[0x263EF8340];
  if ([(HMIVideoEncoder *)self session]) {
    _HMFPreconditionFailure();
  }
  v24 = a6;
  uint64_t v11 = *MEMORY[0x263F04180];
  uint64_t v28 = *MEMORY[0x263F04180];
  v29[0] = &unk_26D9A9318;
  dispatch_queue_t v12 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
  v13 = (void *)[v12 mutableCopy];

  if (v7) {
    uint64_t v14 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v14 = MEMORY[0x263EFFA80];
  }
  v15 = (void *)MEMORY[0x263F1ED58];
  if (!v7) {
    v15 = (void *)MEMORY[0x263F1ED50];
  }
  [v13 setObject:v14 forKey:*v15];
  uint64_t v26 = v11;
  v27 = &unk_26D9A9318;
  CFDictionaryRef v16 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  VTCompressionSessionRef session = 0;
  uint64_t v17 = VTCompressionSessionCreate(0, a3.var0, a3.var1, a4, (CFDictionaryRef)v13, v16, 0, 0, 0, &session);
  if (!session || v17)
  {
    v20 = [NSString stringWithFormat:@"VTCompressionSessionCreate failed, err: %d", v17];
    v21 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1023 description:v20];
    v19 = v24;
    if (!v24) {
      goto LABEL_14;
    }
LABEL_13:
    id *v19 = v21;
    goto LABEL_14;
  }
  uint64_t v18 = VTCompressionSessionPrepareToEncodeFrames(session);
  v19 = v24;
  if (!v18)
  {
    [(HMIVideoEncoder *)self setSession:session];
    [(HMIVideoEncoder *)self _setProperty:*MEMORY[0x263F1E508] propertyValue:*MEMORY[0x263F03F08]];
    [(HMIVideoEncoder *)self _setProperty:*MEMORY[0x263F1E670] propertyValue:*MEMORY[0x263F03FD8]];
    [(HMIVideoEncoder *)self _setProperty:*MEMORY[0x263F1E6A8] propertyValue:*MEMORY[0x263F04050]];
    BOOL v22 = 1;
    [(HMIVideoEncoder *)self setForceKeyFrameOnNextEncodedFrame:1];
    goto LABEL_15;
  }
  v20 = [NSString stringWithFormat:@"VTCompressionSessionPrepareToEncodeFrames failed, err: %d", v18];
  v21 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1023 description:v20];
  if (v24) {
    goto LABEL_13;
  }
LABEL_14:
  HMIErrorLog(self, v21);

  BOOL v22 = 0;
LABEL_15:

  return v22;
}

- (void)dealloc
{
  if ([(HMIVideoEncoder *)self session])
  {
    v3 = [(HMIVideoEncoder *)self session];
    v4 = [(HMIVideoEncoder *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __26__HMIVideoEncoder_dealloc__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v3;
    dispatch_async(v4, block);

    [(HMIVideoEncoder *)self setSession:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)HMIVideoEncoder;
  [(HMIVideoEncoder *)&v5 dealloc];
}

void __26__HMIVideoEncoder_dealloc__block_invoke(uint64_t a1)
{
  VTCompressionSessionInvalidate(*(VTCompressionSessionRef *)(a1 + 32));
  v2 = *(const void **)(a1 + 32);
  CFRelease(v2);
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  v6 = (OS_dispatch_queue *)a4;
  objc_storeWeak((id *)&self->_delegate, a3);
  delegateQueue = self->_delegateQueue;
  self->_delegateQueue = v6;
}

- (void)_invalidate
{
  v3 = [(HMIVideoEncoder *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMIVideoEncoder *)self session])
  {
    VTCompressionSessionInvalidate([(HMIVideoEncoder *)self session]);
    CFRelease([(HMIVideoEncoder *)self session]);
    [(HMIVideoEncoder *)self setSession:0];
  }
}

- (void)_invalidateWithErr:(int)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v5 = [(HMIVideoEncoder *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HMIVideoNode *)self status] != 4)
  {
    self->super.super._status = 4;
    v6 = (void *)MEMORY[0x22A641C70]();
    BOOL v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v15 = v9;
      __int16 v16 = 1024;
      int v17 = a3;
      _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_ERROR, "%{public}@Invalidated with err: %d", buf, 0x12u);
    }
    v10 = [(HMIVideoEncoder *)v7 delegateQueue];

    if (v10)
    {
      uint64_t v11 = [(HMIVideoEncoder *)v7 delegateQueue];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __38__HMIVideoEncoder__invalidateWithErr___block_invoke;
      v12[3] = &unk_26477D770;
      int v13 = a3;
      v12[4] = v7;
      dispatch_async(v11, v12);
    }
    [(HMIVideoEncoder *)v7 _invalidate];
  }
}

void __38__HMIVideoEncoder__invalidateWithErr___block_invoke(uint64_t a1)
{
  id v4 = [NSString stringWithFormat:@"Video encoding failed, err: %d", *(unsigned int *)(a1 + 40)];
  v2 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1023 description:v4];
  v3 = [*(id *)(a1 + 32) delegate];
  [v3 encoder:*(void *)(a1 + 32) didFailWithError:v2];
}

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([(HMIVideoNode *)self status] == 2)
  {
    if (![(HMIVideoEncoder *)self session]) {
      _HMFPreconditionFailure();
    }
    HMICMSampleBufferGetMediaType(a3);
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    memset(&v15, 0, sizeof(v15));
    CMSampleBufferGetPresentationTimeStamp(&v15, a3);
    memset(&v14, 0, sizeof(v14));
    CMSampleBufferGetDuration(&v14, a3);
    CFRetain(a3);
    v6 = [(HMIVideoEncoder *)self workQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __38__HMIVideoEncoder_handleSampleBuffer___block_invoke;
    v11[3] = &unk_26477D7E8;
    v11[4] = self;
    v11[5] = a3;
    v11[6] = ImageBuffer;
    CMTime v12 = v15;
    CMTime v13 = v14;
    dispatch_sync(v6, v11);
  }
  else
  {
    BOOL v7 = (void *)MEMORY[0x22A641C70]();
    uint64_t v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      LODWORD(v15.value) = 138543362;
      *(CMTimeValue *)((char *)&v15.value + 4) = (CMTimeValue)v10;
      _os_log_impl(&dword_225DC6000, v9, OS_LOG_TYPE_ERROR, "%{public}@Encoder is in a failed state, ignoring sample.", (uint8_t *)&v15, 0xCu);
    }
  }
}

void __38__HMIVideoEncoder_handleSampleBuffer___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) session])
  {
    if ([*(id *)(a1 + 32) forceKeyFrameOnNextEncodedFrame])
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F1E8F0], (const void *)*MEMORY[0x263EFFB40]);
      [*(id *)(a1 + 32) setForceKeyFrameOnNextEncodedFrame:0];
    }
    else
    {
      Mutable = 0;
    }
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v4 = (OpaqueVTCompressionSession *)[*(id *)(a1 + 32) session];
    objc_super v5 = *(__CVBuffer **)(a1 + 48);
    outputHandler[0] = MEMORY[0x263EF8330];
    outputHandler[1] = 3221225472;
    outputHandler[2] = __38__HMIVideoEncoder_handleSampleBuffer___block_invoke_2;
    outputHandler[3] = &unk_26477D7C0;
    objc_copyWeak(&v10, &location);
    CMTime presentationTimeStamp = *(CMTime *)(a1 + 56);
    CMTime duration = *(CMTime *)(a1 + 80);
    uint64_t v6 = VTCompressionSessionEncodeFrameWithOutputHandler(v4, v5, &presentationTimeStamp, &duration, Mutable, 0, outputHandler);
    if (Mutable) {
      CFRelease(Mutable);
    }
    CFRelease(*(CFTypeRef *)(a1 + 40));
    if (v6)
    {
      NSLog(&cfstr_Vtcompressions_1.isa, v6);
      [*(id *)(a1 + 32) _invalidateWithErr:v6];
    }
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    v3 = *(const void **)(a1 + 40);
    CFRelease(v3);
  }
}

void __38__HMIVideoEncoder_handleSampleBuffer___block_invoke_2(uint64_t a1, int a2, char a3, const void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      v9 = (void *)MEMORY[0x22A641C70]();
      id v10 = v8;
      uint64_t v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        CMTime v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v24 = v12;
        __int16 v25 = 1024;
        int v26 = a2;
        _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_ERROR, "%{public}@VTCompressionSessionEncodeFrameWithOutputHandler (Handler) failed, err: %d", buf, 0x12u);
      }
      CMTime v13 = [v10 workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __38__HMIVideoEncoder_handleSampleBuffer___block_invoke_56;
      block[3] = &unk_26477D770;
      block[4] = v10;
      int v22 = a2;
      dispatch_async(v13, block);
    }
    else if ((a3 & 2) != 0)
    {
      uint64_t v16 = (void *)MEMORY[0x22A641C70]();
      int v17 = v8;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v24 = v19;
        _os_log_impl(&dword_225DC6000, v18, OS_LOG_TYPE_ERROR, "%{public}@VTCompressionSessionEncodeFrameWithOutputHandler, frame dropped.", buf, 0xCu);
      }
      ++v17[5];
    }
    else
    {
      CMTime v14 = [WeakRetained delegateQueue];

      if (v14)
      {
        CFRetain(a4);
        CMTime v15 = [v8 delegateQueue];
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __38__HMIVideoEncoder_handleSampleBuffer___block_invoke_57;
        v20[3] = &unk_26477D798;
        v20[4] = v8;
        v20[5] = a4;
        dispatch_async(v15, v20);
      }
    }
  }
}

uint64_t __38__HMIVideoEncoder_handleSampleBuffer___block_invoke_56(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateWithErr:*(unsigned int *)(a1 + 40)];
}

void __38__HMIVideoEncoder_handleSampleBuffer___block_invoke_57(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 encoder:*(void *)(a1 + 32) didEncodeSampleBuffer:*(void *)(a1 + 40)];

  v3 = *(const void **)(a1 + 40);
  CFRelease(v3);
}

- (void)flush
{
  v3 = [(HMIVideoEncoder *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__HMIVideoEncoder_flush__block_invoke;
  block[3] = &unk_26477B7D8;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __24__HMIVideoEncoder_flush__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(a1 + 32) session];
  if (result)
  {
    v3 = (OpaqueVTCompressionSession *)[*(id *)(a1 + 32) session];
    CMTime v12 = *(CMTime *)*(void *)&MEMORY[0x263F01090];
    uint64_t v4 = VTCompressionSessionCompleteFrames(v3, &v12);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = (void *)MEMORY[0x22A641C70]();
      id v7 = *(id *)(a1 + 32);
      uint64_t v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = HMFGetLogIdentifier();
        LODWORD(v12.value) = 138543618;
        *(CMTimeValue *)((char *)&v12.value + 4) = (CMTimeValue)v9;
        LOWORD(v12.flags) = 1024;
        *(CMTimeFlags *)((char *)&v12.flags + 2) = v5;
        _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_ERROR, "%{public}@VTCompressionSessionCompleteFrames failed, err: %d", (uint8_t *)&v12, 0x12u);
      }
      [*(id *)(a1 + 32) _invalidateWithErr:v5];
    }
    else
    {
      id v10 = [*(id *)(a1 + 32) delegateQueue];

      if (v10)
      {
        uint64_t v11 = [*(id *)(a1 + 32) delegateQueue];
        dispatch_sync(v11, HMISyncBlock);
      }
    }
    return [*(id *)(a1 + 32) setForceKeyFrameOnNextEncodedFrame:1];
  }
  return result;
}

- (BOOL)prepare
{
  if (![(HMIVideoEncoder *)self session])
  {
    uint64_t v6 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v6);
  }
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v3 = [(HMIVideoEncoder *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __26__HMIVideoEncoder_prepare__block_invoke;
  v7[3] = &unk_26477D810;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v3, v7);

  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __26__HMIVideoEncoder_prepare__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  OSStatus v2 = VTCompressionSessionPrepareToEncodeFrames((VTCompressionSessionRef)[*(id *)(a1 + 32) session]);
  if (v2)
  {
    OSStatus v3 = v2;
    char v4 = (void *)MEMORY[0x22A641C70]();
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      v9 = v7;
      __int16 v10 = 1024;
      OSStatus v11 = v3;
      _os_log_impl(&dword_225DC6000, v6, OS_LOG_TYPE_ERROR, "%{public}@VTCompressionSessionPrepareToEncodeFrames failed, err: %d", (uint8_t *)&v8, 0x12u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (int)_setProperty:(__CFString *)a3 propertyValue:(void *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (![(HMIVideoEncoder *)self session]) {
    _HMFPreconditionFailure();
  }
  OSStatus v7 = VTSessionSetProperty([(HMIVideoEncoder *)self session], a3, a4);
  if (v7)
  {
    int v8 = (void *)MEMORY[0x22A641C70]();
    v9 = self;
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      OSStatus v11 = HMFGetLogIdentifier();
      int v13 = 138543874;
      CMTime v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = a3;
      __int16 v17 = 1024;
      OSStatus v18 = v7;
      _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot set property: %@, error: %d", (uint8_t *)&v13, 0x1Cu);
    }
  }
  return v7;
}

- (int)_getProperty:(__CFString *)a3 propertyValue:(const void *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (![(HMIVideoEncoder *)self session]) {
    _HMFPreconditionFailure();
  }
  OSStatus v7 = [(HMIVideoEncoder *)self session];
  OSStatus v8 = VTSessionCopyProperty(v7, a3, (CFAllocatorRef)*MEMORY[0x263EFFB08], a4);
  if (v8)
  {
    v9 = (void *)MEMORY[0x22A641C70]();
    __int16 v10 = self;
    OSStatus v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v14 = 138543874;
      __int16 v15 = v12;
      __int16 v16 = 2112;
      __int16 v17 = a3;
      __int16 v18 = 1024;
      OSStatus v19 = v8;
      _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot copy property: %@, error: %d", (uint8_t *)&v14, 0x1Cu);
    }
  }
  return v8;
}

- (int)_setSInt32Property:(__CFString *)a3 propertyValue:(int)a4
{
  SInt32 = (const void *)FigCFNumberCreateSInt32();
  LODWORD(a3) = [(HMIVideoEncoder *)self _setProperty:a3 propertyValue:SInt32];
  CFRelease(SInt32);
  return (int)a3;
}

- (int)_getSInt32Property:(__CFString *)a3 propertyValueOut:(int *)a4
{
  CFNumberRef number = 0;
  int v5 = [(HMIVideoEncoder *)self _getProperty:a3 propertyValue:&number];
  int v6 = v5;
  if (a4 && !v5) {
    CFNumberGetValue(number, kCFNumberSInt32Type, a4);
  }
  CFRelease(number);
  return v6;
}

- (int)_setFloat64Property:(__CFString *)a3 propertyValue:(double)a4
{
  Float64 = (const void *)FigCFNumberCreateFloat64();
  LODWORD(a3) = [(HMIVideoEncoder *)self _setProperty:a3 propertyValue:Float64];
  CFRelease(Float64);
  return (int)a3;
}

- (int)_getFloat64Property:(__CFString *)a3 propertyValueOut:(double *)a4
{
  CFNumberRef number = 0;
  int v5 = [(HMIVideoEncoder *)self _getProperty:a3 propertyValue:&number];
  int v6 = v5;
  if (a4 && !v5) {
    CFNumberGetValue(number, kCFNumberFloatType, a4);
  }
  CFRelease(number);
  return v6;
}

- (void)setMaxFrameDelayCount:(int64_t)a3
{
}

- (int64_t)maxFrameDelayCount
{
  int v3 = 0;
  [(HMIVideoEncoder *)self _getSInt32Property:*MEMORY[0x263F1E5B8] propertyValueOut:&v3];
  return v3;
}

- (void)setAverageBitRate:(int64_t)a3
{
}

- (int64_t)averageBitRate
{
  int v3 = 0;
  [(HMIVideoEncoder *)self _getSInt32Property:*MEMORY[0x263F1E4E8] propertyValueOut:&v3];
  return v3;
}

- (void)setQuality:(double)a3
{
}

- (double)quality
{
  double v3 = 0.0;
  [(HMIVideoEncoder *)self _getFloat64Property:*MEMORY[0x263F1E640] propertyValueOut:&v3];
  return v3;
}

- (void)setMaxKeyFrameIntervalDuration:(int64_t)a3
{
}

- (int64_t)maxKeyFrameIntervalDuration
{
  OSStatus v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  char v4 = NSString;
  int v5 = NSStringFromSelector(a2);
  int v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)setExpectedFrameRate:(int64_t)a3
{
}

- (int64_t)expectedFrameRate
{
  OSStatus v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  char v4 = NSString;
  int v5 = NSStringFromSelector(a2);
  int v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)setExpectedDuration:(double)a3
{
  uint64_t v4 = *MEMORY[0x263F1E540];
  if (a3 == 0.0) {
    uint64_t v5 = *MEMORY[0x263EFFD08];
  }
  else {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithDouble:");
  }
  [(HMIVideoEncoder *)self _setProperty:v4 propertyValue:v5];
}

- (double)expectedDuration
{
  OSStatus v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  uint64_t v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  int v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)setDataRateLimit:(HMIVideoEncoderDataRate)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F1E520];
  if (a3.var0 && (int64_t var1 = a3.var1) != 0)
  {
    int v6 = objc_msgSend(NSNumber, "numberWithInteger:");
    v10[0] = v6;
    id v7 = [NSNumber numberWithInteger:var1];
    v10[1] = v7;
    -[HMIVideoEncoder _setProperty:propertyValue:](self, "_setProperty:propertyValue:", v4, [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2]);
  }
  else
  {
    uint64_t v8 = *MEMORY[0x263EFFD08];
    uint64_t v9 = *MEMORY[0x263F1E520];
    [(HMIVideoEncoder *)self _setProperty:v9 propertyValue:v8];
  }
}

- (HMIVideoEncoderDataRate)dataRateLimit
{
  OSStatus v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  uint64_t v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  int v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLogIdentifier:(id)a3
{
}

- (unint64_t)numberOfDroppedFrames
{
  return self->_numberOfDroppedFrames;
}

- (OpaqueVTCompressionSession)session
{
  return self->_session;
}

- (void)setSession:(OpaqueVTCompressionSession *)a3
{
  self->_VTCompressionSessionRef session = a3;
}

- (BOOL)forceKeyFrameOnNextEncodedFrame
{
  return self->_forceKeyFrameOnNextEncodedFrame;
}

- (void)setForceKeyFrameOnNextEncodedFrame:(BOOL)a3
{
  self->_forceKeyFrameOnNextEncodedFrame = a3;
}

- (HMIVideoEncoderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMIVideoEncoderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

@end