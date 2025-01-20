@interface AVPlayerItemOutput
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_itemTimeForHostTimeAsCMTime:(SEL)a3;
- (AVPlayerItemOutput)init;
- (BOOL)_attachToPlayerItem:(id)a3;
- (BOOL)isDefunct;
- (BOOL)suppressesPlayerRendering;
- (CMTime)itemTimeForHostTime:(SEL)a3;
- (CMTime)itemTimeForMachAbsoluteTime:(SEL)a3;
- (OpaqueCMTimebase)_copyTimebase;
- (id)_weakReference;
- (void)_detachFromPlayerItem;
- (void)_setTimebase:(OpaqueCMTimebase *)a3;
- (void)dealloc;
@end

@implementation AVPlayerItemOutput

- (void)_setTimebase:(OpaqueCMTimebase *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  timebaseReadWriteQueue = self->_outputInternal->timebaseReadWriteQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__AVPlayerItemOutput__setTimebase___block_invoke;
  v6[3] = &unk_1E57B2228;
  v6[4] = self;
  v6[5] = a3;
  av_readwrite_dispatch_queue_write_async(timebaseReadWriteQueue, v6);
}

void __35__AVPlayerItemOutput__setTimebase___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  v3 = *(const void **)(v2 + 24);
  if (v3)
  {
    CFRelease(v3);
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(void *)(v2 + 24) = *(void *)(a1 + 40);
}

CFTypeRef __35__AVPlayerItemOutput__copyTimebase__block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (CMTime)itemTimeForHostTime:(SEL)a3
{
  memset(&v8, 0, sizeof(v8));
  CFTypeRef result = CMTimeMakeWithSeconds(&v8, hostTimeInSeconds, 1000000000);
  if (self)
  {
    CMTime v7 = v8;
    return (CMTime *)[(AVPlayerItemOutput *)self _itemTimeForHostTimeAsCMTime:&v7];
  }
  else
  {
    retstr->value = 0;
    *(void *)&retstr->timescale = 0;
    retstr->epoch = 0;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_itemTimeForHostTimeAsCMTime:(SEL)a3
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  CFTypeRef result = [(AVPlayerItemOutput *)self _copyTimebase];
  if (result)
  {
    CMTime v7 = result;
    CMClockRef HostTimeClock = CMClockGetHostTimeClock();
    $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a4;
    CMSyncConvertTime(&v10, (CMTime *)&v9, HostTimeClock, v7);
    *(CMTime *)retstr = v10;
    CFRelease(v7);
  }
  return result;
}

- (OpaqueCMTimebase)_copyTimebase
{
  uint64_t v6 = 0;
  CMTime v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  timebaseReadWriteQueue = self->_outputInternal->timebaseReadWriteQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__AVPlayerItemOutput__copyTimebase__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(timebaseReadWriteQueue, v5);
  v3 = (OpaqueCMTimebase *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (AVPlayerItemOutput)init
{
  v10.receiver = self;
  v10.super_class = (Class)AVPlayerItemOutput;
  v3 = [(AVPlayerItemOutput *)&v10 init];
  if (v3)
  {
    uint64_t v4 = objc_opt_class();
    AVRequireConcreteObject(v3, a2, v4);
    v5 = objc_alloc_init(AVPlayerItemOutputInternal);
    v3->_outputInternal = v5;
    if (v5
      && (CFRetain(v5),
          uint64_t v6 = NSString,
          CMTime v7 = (objc_class *)objc_opt_class(),
          uint64_t v8 = (const char *)[(id)objc_msgSend(v6 stringWithFormat:@"<%@: %p> timebase read/write queue", NSStringFromClass(v7), v3), "UTF8String"], (v3->_outputInternal->timebaseReadWriteQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create(v8)) != 0))
    {
      v3->_outputInternal->weakReference = [[AVWeakReference alloc] initWithReferencedObject:v3];
    }
    else
    {

      return 0;
    }
  }
  return v3;
}

- (id)_weakReference
{
  return self->_outputInternal->weakReference;
}

- (void)dealloc
{
  outputInternal = self->_outputInternal;
  if (outputInternal)
  {

    uint64_t v4 = self->_outputInternal;
    if (v4->timebaseReadWriteQueue)
    {
      dispatch_release((dispatch_object_t)v4->timebaseReadWriteQueue);
      uint64_t v4 = self->_outputInternal;
    }
    if (v4->timebase)
    {
      CFRelease(v4->timebase);
      uint64_t v4 = self->_outputInternal;
    }
    CFRelease(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerItemOutput;
  [(AVPlayerItemOutput *)&v5 dealloc];
}

- (CMTime)itemTimeForMachAbsoluteTime:(SEL)a3
{
  memset(&v8, 0, sizeof(v8));
  CFTypeRef result = CMClockMakeHostTimeFromSystemUnits(&v8, machAbsoluteTime);
  if (self)
  {
    CMTime v7 = v8;
    return (CMTime *)[(AVPlayerItemOutput *)self _itemTimeForHostTimeAsCMTime:&v7];
  }
  else
  {
    retstr->value = 0;
    *(void *)&retstr->timescale = 0;
    retstr->epoch = 0;
  }
  return result;
}

- (BOOL)suppressesPlayerRendering
{
  return 0;
}

- (BOOL)_attachToPlayerItem:(id)a3
{
  objc_super v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- (void)_detachFromPlayerItem
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
}

- (BOOL)isDefunct
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

@end