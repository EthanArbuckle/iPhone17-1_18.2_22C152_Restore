@interface HMIVideoDecoder
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastSampleBufferDTS;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastSampleBufferPTS;
- (BOOL)_createSessionWithFormatDescription:(opaqueCMFormatDescription *)a3;
- (BOOL)handleSampleBuffer:(opaqueCMSampleBuffer *)a3 outputFrame:(BOOL)a4;
- (HMFWeakObject)weakDecoder;
- (HMIVideoDecoder)init;
- (HMIVideoDecoder)initWithFrameReordering:(BOOL)a3;
- (HMIVideoDecoderDelegate)delegate;
- (NSString)logIdentifier;
- (OS_dispatch_queue)workQueue;
- (OpaqueVTDecompressionSession)session;
- (opaqueCMBufferQueue)buffer;
- (unint64_t)reorderBufferSize;
- (void)_didDecodeSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)_evictSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)_failWithDescription:(id)a3;
- (void)dealloc;
- (void)flush;
- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setBuffer:(opaqueCMBufferQueue *)a3;
- (void)setDelegate:(id)a3;
- (void)setLastSampleBufferDTS:(id *)a3;
- (void)setLastSampleBufferPTS:(id *)a3;
- (void)setLogIdentifier:(id)a3;
- (void)setSession:(OpaqueVTDecompressionSession *)a3;
@end

@implementation HMIVideoDecoder

- (HMIVideoDecoder)init
{
  return [(HMIVideoDecoder *)self initWithFrameReordering:1];
}

- (HMIVideoDecoder)initWithFrameReordering:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMIVideoDecoder;
  v4 = [(HMIVideoDecoder *)&v16 init];
  v5 = (HMIVideoDecoder *)v4;
  if (v4)
  {
    *((void *)v4 + 6) = 0;
    *((void *)v4 + 7) = 0;
    uint64_t v6 = MEMORY[0x263F01090];
    long long v7 = *MEMORY[0x263F01090];
    *((_OWORD *)v4 + 5) = *MEMORY[0x263F01090];
    uint64_t v8 = *(void *)(v6 + 16);
    *((void *)v4 + 12) = v8;
    *(_OWORD *)(v4 + 104) = v7;
    *((void *)v4 + 15) = v8;
    uint64_t v9 = 3;
    if (!v3) {
      uint64_t v9 = 0;
    }
    *((void *)v4 + 5) = v9;
    *((void *)v4 + 1) = 2;
    uint64_t v10 = [objc_alloc(MEMORY[0x263F42678]) initWithWeakObject:v4];
    weakDecoder = v5->_weakDecoder;
    v5->_weakDecoder = (HMFWeakObject *)v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("HMIVideoDecoderWorkQueue", v12);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v13;
  }
  return v5;
}

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3
{
}

- (BOOL)handleSampleBuffer:(opaqueCMSampleBuffer *)a3 outputFrame:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v44 = *MEMORY[0x263EF8340];
  if ([(HMIVideoNode *)self status] != 2)
  {
    uint64_t v19 = MEMORY[0x22A641C70]();
    v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      v23 = HMICMSampleBufferFormattedDescription(a3, 1000);
      LODWORD(time1.value) = 138543618;
      *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v22;
      LOWORD(time1.flags) = 2112;
      *(void *)((char *)&time1.flags + 2) = v23;
      _os_log_impl(&dword_225DC6000, v21, OS_LOG_TYPE_ERROR, "%{public}@Video decoder is not running, ignoring %@", (uint8_t *)&time1, 0x16u);
    }
    v24 = (void *)v19;
    goto LABEL_29;
  }
  if (!CMSampleBufferGetNumSamples(a3))
  {
    uint64_t v25 = MEMORY[0x22A641C70]();
    v26 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      LODWORD(time1.value) = 138543362;
      *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v28;
      _os_log_impl(&dword_225DC6000, v27, OS_LOG_TYPE_ERROR, "%{public}@Sample buffer has no samples, skipping.", (uint8_t *)&time1, 0xCu);
LABEL_27:
    }
LABEL_28:

    v24 = (void *)v25;
LABEL_29:
    return 0;
  }
  memset(&v41, 0, sizeof(v41));
  CMSampleBufferGetDecodeTimeStamp(&v41, a3);
  [(HMIVideoDecoder *)self lastSampleBufferDTS];
  if (v40)
  {
    [(HMIVideoDecoder *)self lastSampleBufferDTS];
    CMTime time1 = v41;
    if (CMTimeCompare(&time1, &time2) <= 0)
    {
      uint64_t v25 = MEMORY[0x22A641C70]();
      v26 = self;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = HMFGetLogIdentifier();
        [(HMIVideoDecoder *)v26 lastSampleBufferDTS];
        v30 = HMICMTimeDescription(&v38);
        CMTime time1 = v41;
        v31 = HMICMTimeDescription(&time1);
        LODWORD(time1.value) = 138543874;
        *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v28;
        LOWORD(time1.flags) = 2112;
        *(void *)((char *)&time1.flags + 2) = v30;
        HIWORD(time1.epoch) = 2112;
        v43 = v31;
        _os_log_impl(&dword_225DC6000, v27, OS_LOG_TYPE_ERROR, "%{public}@Invalid DTS, expected > %@, got %@, skipping.", (uint8_t *)&time1, 0x20u);

        goto LABEL_27;
      }
      goto LABEL_28;
    }
  }
  CMTime v37 = v41;
  [(HMIVideoDecoder *)self setLastSampleBufferDTS:&v37];
  CMFormatDescriptionRef FormatDescription = CMSampleBufferGetFormatDescription(a3);
  if (!FormatDescription)
  {
    v29 = @"Format description is missing.";
LABEL_24:
    [(HMIVideoDecoder *)self _failWithDescription:v29];
    return 0;
  }
  uint64_t v8 = FormatDescription;
  if (![(HMIVideoDecoder *)self session]
    || VTDecompressionSessionCanAcceptFormatDescription([(HMIVideoDecoder *)self session], v8))
  {
    goto LABEL_12;
  }
  uint64_t v9 = +[HMIPreference sharedInstance];
  int v10 = [v9 BOOLPreferenceForKey:@"restartDecoderIfFormatChanges" defaultValue:0];

  if (!v10)
  {
    v29 = @"Cannot accept format description.";
    goto LABEL_24;
  }
  v11 = (void *)MEMORY[0x22A641C70]();
  v12 = self;
  dispatch_queue_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    LODWORD(time1.value) = 138543362;
    *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v14;
    _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_INFO, "%{public}@Restarting decoder because format description changed.", (uint8_t *)&time1, 0xCu);
  }
  [(HMIVideoDecoder *)v12 flush];
  VTDecompressionSessionInvalidate([(HMIVideoDecoder *)v12 session]);
  CFRelease([(HMIVideoDecoder *)v12 session]);
  [(HMIVideoDecoder *)v12 _createSessionWithFormatDescription:v8];
LABEL_12:
  if (![(HMIVideoDecoder *)self session])
  {
    CMItemCount reorderBufferSize = self->_reorderBufferSize;
    CallbacksForSampleBuffersSortedByOutputPTS = CMBufferQueueGetCallbacksForSampleBuffersSortedByOutputPTS();
    uint64_t v35 = CMBufferQueueCreate(0, reorderBufferSize, CallbacksForSampleBuffersSortedByOutputPTS, &self->_buffer);
    if (v35)
    {
      v36 = [NSString stringWithFormat:@"Cannot create reorder buffer, err: %d.", v35];
      [(HMIVideoDecoder *)self _failWithDescription:v36];

      return 0;
    }
    if ([(HMIVideoDecoder *)self _createSessionWithFormatDescription:v8]) {
      goto LABEL_13;
    }
    v29 = @"Cannot create decoder.";
    goto LABEL_24;
  }
LABEL_13:
  if (v4) {
    VTDecodeFrameFlags v15 = 1;
  }
  else {
    VTDecodeFrameFlags v15 = 3;
  }
  LODWORD(time1.value) = 0;
  uint64_t v16 = VTDecompressionSessionDecodeFrame([(HMIVideoDecoder *)self session], a3, v15, 0, (VTDecodeInfoFlags *)&time1);
  BOOL v17 = v16 == 0;
  if (v16)
  {
    v18 = [NSString stringWithFormat:@"Cannot decode frame, err: %d.", v16];
    [(HMIVideoDecoder *)self _failWithDescription:v18];
  }
  return v17;
}

- (void)flush
{
  if ([(HMIVideoDecoder *)self session])
  {
    VTDecompressionSessionWaitForAsynchronousFrames([(HMIVideoDecoder *)self session]);
    while (!CMBufferQueueIsEmpty([(HMIVideoDecoder *)self buffer]))
    {
      CMBufferRef v3 = CMBufferQueueDequeueAndRetain([(HMIVideoDecoder *)self buffer]);
      [(HMIVideoDecoder *)self _evictSampleBuffer:v3];
      CFRelease(v3);
    }
  }
}

- (void)dealloc
{
  if ([(HMIVideoDecoder *)self buffer])
  {
    CFRelease(self->_buffer);
    [(HMIVideoDecoder *)self setBuffer:0];
  }
  if ([(HMIVideoDecoder *)self session])
  {
    CMBufferRef v3 = [(HMIVideoDecoder *)self session];
    BOOL v4 = [(HMIVideoDecoder *)self weakDecoder];
    v5 = [(HMIVideoDecoder *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __26__HMIVideoDecoder_dealloc__block_invoke;
    block[3] = &unk_26477D798;
    id v9 = v4;
    int v10 = v3;
    id v6 = v4;
    dispatch_async(v5, block);

    [(HMIVideoDecoder *)self setSession:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)HMIVideoDecoder;
  [(HMIVideoDecoder *)&v7 dealloc];
}

void __26__HMIVideoDecoder_dealloc__block_invoke(uint64_t a1)
{
  VTDecompressionSessionWaitForAsynchronousFrames(*(VTDecompressionSessionRef *)(a1 + 40));
  VTDecompressionSessionInvalidate(*(VTDecompressionSessionRef *)(a1 + 40));
  v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

- (BOOL)_createSessionWithFormatDescription:(opaqueCMFormatDescription *)a3
{
  v6.decompressionOutputRefCon = [(HMIVideoDecoder *)self weakDecoder];

  return VTDecompressionSessionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, 0, 0, &v6, &self->_session) == 0;
}

- (void)_evictSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  memset(&v16, 0, sizeof(v16));
  CMSampleBufferGetPresentationTimeStamp(&v16, a3);
  v5 = [(HMIVideoDecoder *)self lastSampleBufferPTS];
  if (v15)
  {
    [(HMIVideoDecoder *)self lastSampleBufferPTS];
    CMTime time2 = v16;
    v5 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&time1, &time2);
    if ((v5 & 0x80000000) == 0)
    {
      VTDecompressionOutputCallbackRecord v6 = (void *)MEMORY[0x22A641C70]([(HMIVideoDecoder *)self _failWithDescription:@"Cannot reorder frames."]);
      objc_super v7 = self;
      uint64_t v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = HMFGetLogIdentifier();
        LODWORD(time2.value) = 138543618;
        *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v9;
        LOWORD(time2.flags) = 2112;
        *(void *)((char *)&time2.flags + 2) = a3;
        int v10 = "%{public}@Decoded sample is out of PTS order, sample: %@";
LABEL_8:
        _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&time2, 0x16u);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  if ((v16.flags & 1) == 0)
  {
    VTDecompressionOutputCallbackRecord v6 = (void *)MEMORY[0x22A641C70]([(HMIVideoDecoder *)self _failWithDescription:@"Decoded sample has an invalid PTS."]);
    objc_super v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      LODWORD(time2.value) = 138543618;
      *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v9;
      LOWORD(time2.flags) = 2112;
      *(void *)((char *)&time2.flags + 2) = a3;
      int v10 = "%{public}@Decoded sample has an invalid PTS, sample: %@";
      goto LABEL_8;
    }
LABEL_9:

    return;
  }
  v11 = (void *)MEMORY[0x22A641C70](v5);
  v12 = [(HMIVideoDecoder *)self delegate];
  [v12 decoder:self didDecodeSampleBuffer:a3];

  CMTime v13 = v16;
  [(HMIVideoDecoder *)self setLastSampleBufferPTS:&v13];
}

- (void)_didDecodeSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if ([(HMIVideoDecoder *)self reorderBufferSize])
  {
    CMItemCount BufferCount = CMBufferQueueGetBufferCount(self->_buffer);
    if (BufferCount == [(HMIVideoDecoder *)self reorderBufferSize])
    {
      CMBufferRef v6 = CMBufferQueueDequeueAndRetain(self->_buffer);
      [(HMIVideoDecoder *)self _evictSampleBuffer:v6];
      CFRelease(v6);
    }
    buffer = self->_buffer;
    CMBufferQueueEnqueue(buffer, a3);
  }
  else
  {
    [(HMIVideoDecoder *)self _evictSampleBuffer:a3];
  }
}

- (void)_failWithDescription:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->super.super._status == 4)
  {
    v5 = (void *)MEMORY[0x22A641C70]();
    CMBufferRef v6 = self;
    objc_super v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_ERROR, "%{public}@Decoder is already in a failed state.", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    self->super.super._status = 4;
    id v9 = [MEMORY[0x263F087E8] hmiErrorWithCode:-1 description:v4];
    HMIErrorLog(self, v9);
    int v10 = [(HMIVideoDecoder *)self delegate];
    [v10 decoder:self didFailWithError:v9];
  }
}

- (HMIVideoDecoderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMIVideoDecoderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLogIdentifier:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastSampleBufferPTS
{
  objc_copyStruct(retstr, &self->_lastSampleBufferPTS, 24, 1, 0);
  return result;
}

- (void)setLastSampleBufferPTS:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastSampleBufferDTS
{
  objc_copyStruct(retstr, &self->_lastSampleBufferDTS, 24, 1, 0);
  return result;
}

- (void)setLastSampleBufferDTS:(id *)a3
{
}

- (unint64_t)reorderBufferSize
{
  return self->_reorderBufferSize;
}

- (opaqueCMBufferQueue)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(opaqueCMBufferQueue *)a3
{
  self->_buffer = a3;
}

- (OpaqueVTDecompressionSession)session
{
  return self->_session;
}

- (void)setSession:(OpaqueVTDecompressionSession *)a3
{
  self->_session = a3;
}

- (HMFWeakObject)weakDecoder
{
  return (HMFWeakObject *)objc_getProperty(self, a2, 64, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_weakDecoder, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end