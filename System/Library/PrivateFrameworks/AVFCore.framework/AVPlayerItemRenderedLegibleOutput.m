@interface AVPlayerItemRenderedLegibleOutput
+ (void)initialize;
- (AVPlayerItemRenderedLegibleOutput)initWithDependencyFactory:(id)a3 videoDisplaySize:(CGSize)a4;
- (AVPlayerItemRenderedLegibleOutput)initWithVideoDisplaySize:(CGSize)a3;
- (AVPlayerItemRenderedLegibleOutputPushDelegate)delegate;
- (BOOL)_attachToPlayerItem:(id)a3;
- (BOOL)isDefunct;
- (BOOL)suppressesPlayerRendering;
- (CGSize)videoDisplaySize;
- (OS_dispatch_queue)delegateQueue;
- (double)advanceIntervalForDelegateInvocation;
- (id)_figRenderedLegibleOutputsDictionaryOptions;
- (void)_collectUncollectables;
- (void)_detachFromPlayerItem;
- (void)_pushRenderedCaptionImages:(id)a3 atItemTime:(id *)a4;
- (void)_signalFlush;
- (void)dealloc;
- (void)setAdvanceIntervalForDelegateInvocation:(double)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setSuppressesPlayerRendering:(BOOL)a3;
- (void)setVideoDisplaySize:(CGSize)a3;
@end

@implementation AVPlayerItemRenderedLegibleOutput

+ (void)initialize
{
}

- (AVPlayerItemRenderedLegibleOutput)initWithVideoDisplaySize:(CGSize)a3
{
  if (a3.width == 0.0 || (double height = a3.height, a3.height == 0.0))
  {
    v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"AVPlayerItemRenderedLegibleOutput shall be initialized with a valid videoDisplaySize having non-zero height and width", v3, v4, v5, v6, v7, v14), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  double width = a3.width;
  v11 = objc_alloc_init(AVPlayerItemRenderedLegibleOutputRealDependencyFactory);
  return -[AVPlayerItemRenderedLegibleOutput initWithDependencyFactory:videoDisplaySize:](self, "initWithDependencyFactory:videoDisplaySize:", v11, width, height);
}

- (AVPlayerItemRenderedLegibleOutput)initWithDependencyFactory:(id)a3 videoDisplaySize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v9.receiver = self;
  v9.super_class = (Class)AVPlayerItemRenderedLegibleOutput;
  uint64_t v7 = [(AVPlayerItemOutput *)&v9 init];
  if (v7)
  {
    v7->_delegateStorage = objc_alloc_init(AVWeakReferencingDelegateStorage);
    v7->_dependencyFactory = (AVPlayerItemRenderedLegibleOutputDependencyFactory *)a3;
    v7->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayeritemrenderedlegibleoutput.ivars");
    v7->_videoDisplaySize.CGFloat width = width;
    v7->_videoDisplaySize.CGFloat height = height;
    v7->_suppressesPlayerRendering = 0;
  }
  return v7;
}

- (void)_collectUncollectables
{
  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue) {
    dispatch_release(ivarAccessQueue);
  }
}

- (void)dealloc
{
  [(AVPlayerItemRenderedLegibleOutput *)self _collectUncollectables];
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerItemRenderedLegibleOutput;
  [(AVPlayerItemOutput *)&v3 dealloc];
}

- (void)_pushRenderedCaptionImages:(id)a3 atItemTime:(id *)a4
{
  delegateStorage = self->_delegateStorage;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__AVPlayerItemRenderedLegibleOutput__pushRenderedCaptionImages_atItemTime___block_invoke;
  v5[3] = &unk_1E57B58E0;
  v5[4] = self;
  v5[5] = a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a4;
  [(AVWeakReferencingDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v5];
}

uint64_t __75__AVPlayerItemRenderedLegibleOutput__pushRenderedCaptionImages_atItemTime___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    long long v7 = *(_OWORD *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 64);
    return [a2 renderedLegibleOutput:v5 didOutputRenderedCaptionImages:v6 forItemTime:&v7];
  }
  return result;
}

- (void)_signalFlush
{
  delegateStorage = self->_delegateStorage;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__AVPlayerItemRenderedLegibleOutput__signalFlush__block_invoke;
  v3[3] = &unk_1E57B4B88;
  v3[4] = self;
  [(AVWeakReferencingDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v3];
}

uint64_t __49__AVPlayerItemRenderedLegibleOutput__signalFlush__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 outputSequenceWasFlushed:v5];
  }
  return result;
}

- (BOOL)_attachToPlayerItem:(id)a3
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  if (!a3)
  {
    v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"playerItem != nil"), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  uint64_t v9 = -[AVPlayerItemRenderedLegibleOutputDependencyFactory playerItemOutputHostForPlayerItem:](self->_dependencyFactory, "playerItemOutputHostForPlayerItem:");
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__AVPlayerItemRenderedLegibleOutput__attachToPlayerItem___block_invoke;
  block[3] = &unk_1E57B3270;
  block[5] = v9;
  block[6] = &v15;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  BOOL v11 = *((unsigned char *)v16 + 24) == 0;
  _Block_object_dispose(&v15, 8);
  return v11;
}

id __57__AVPlayerItemRenderedLegibleOutput__attachToPlayerItem___block_invoke(id result)
{
  *(unsigned char *)(*(void *)(*((void *)result + 6) + 8) + 24) = *(void *)(*((void *)result + 4) + 40) != 0;
  if (!*(unsigned char *)(*(void *)(*((void *)result + 6) + 8) + 24))
  {
    v1 = result;
    uint64_t result = (id)[*((id *)result + 5) _weakReference];
    *(void *)(v1[4] + 40) = result;
  }
  return result;
}

- (void)_detachFromPlayerItem
{
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__AVPlayerItemRenderedLegibleOutput__detachFromPlayerItem__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

void __58__AVPlayerItemRenderedLegibleOutput__detachFromPlayerItem__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) = 0;
}

- (id)_figRenderedLegibleOutputsDictionaryOptions
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [(AVPlayerItemRenderedLegibleOutput *)self advanceIntervalForDelegateInvocation];
  double v5 = v4;
  [(AVPlayerItemRenderedLegibleOutput *)self videoDisplaySize];
  CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v9);
  if (v5 != 0.0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:v5];
    [v3 setObject:v7 forKey:*MEMORY[0x1E4F33CB0]];
  }
  [v3 setObject:DictionaryRepresentation forKey:*MEMORY[0x1E4F33CB8]];
  if (DictionaryRepresentation) {
    CFRelease(DictionaryRepresentation);
  }
  return v3;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  if ((unint64_t)a3 | (unint64_t)a4 && (!a3 || !a4))
  {
    CGSize v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)a4, v4, v5, v6, v7, (uint64_t)"(newDelegate == nil && newDelegateQueue == NULL) || (newDelegate != nil && newDelegateQueue != NULL)"), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  delegateStorage = self->_delegateStorage;
  -[AVWeakReferencingDelegateStorage setDelegate:queue:](delegateStorage, "setDelegate:queue:");
}

- (AVPlayerItemRenderedLegibleOutputPushDelegate)delegate
{
  return (AVPlayerItemRenderedLegibleOutputPushDelegate *)[(AVWeakReferencingDelegateStorage *)self->_delegateStorage delegate];
}

- (OS_dispatch_queue)delegateQueue
{
  return [(AVWeakReferencingDelegateStorage *)self->_delegateStorage delegateQueue];
}

- (double)advanceIntervalForDelegateInvocation
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__AVPlayerItemRenderedLegibleOutput_advanceIntervalForDelegateInvocation__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __73__AVPlayerItemRenderedLegibleOutput_advanceIntervalForDelegateInvocation__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 56);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setAdvanceIntervalForDelegateInvocation:(double)a3
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__20;
  uint64_t v9 = __Block_byref_object_dispose__20;
  uint64_t v10 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__AVPlayerItemRenderedLegibleOutput_setAdvanceIntervalForDelegateInvocation___block_invoke;
  v4[3] = &unk_1E57B4B60;
  *(double *)&v4[7] = a3;
  v4[4] = self;
  v4[5] = &v11;
  v4[6] = &v5;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
  if (*((unsigned char *)v12 + 24)) {
    objc_msgSend((id)objc_msgSend((id)v6[5], "referencedObject"), "_evaluateRenderedLegibleOutputs");
  }

  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v11, 8);
}

double __77__AVPlayerItemRenderedLegibleOutput_setAdvanceIntervalForDelegateInvocation___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 56) != *(double *)(*(void *)(a1 + 32)
                                                                                                 + 56);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = *(id *)(*(void *)(a1 + 32) + 40);
  double result = *(double *)(a1 + 56);
  *(double *)(*(void *)(a1 + 32) + 56) = result;
  return result;
}

- (BOOL)suppressesPlayerRendering
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__AVPlayerItemRenderedLegibleOutput_suppressesPlayerRendering__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __62__AVPlayerItemRenderedLegibleOutput_suppressesPlayerRendering__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 48);
  return result;
}

- (void)setSuppressesPlayerRendering:(BOOL)a3
{
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__20;
  uint64_t v11 = __Block_byref_object_dispose__20;
  uint64_t v12 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__AVPlayerItemRenderedLegibleOutput_setSuppressesPlayerRendering___block_invoke;
  v5[3] = &unk_1E57B5908;
  v5[4] = self;
  v5[5] = &v13;
  BOOL v6 = a3;
  void v5[6] = &v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  if (*((unsigned char *)v14 + 24)) {
    objc_msgSend((id)objc_msgSend((id)v8[5], "referencedObject"), "_renderingSuppressionDidChangeForOutput:", self);
  }

  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v13, 8);
}

id __66__AVPlayerItemRenderedLegibleOutput_setSuppressesPlayerRendering___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned __int8 *)(*(void *)(a1 + 32) + 48) != *(unsigned __int8 *)(a1 + 56);
  id result = *(id *)(*(void *)(a1 + 32) + 40);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = *(unsigned char *)(a1 + 56);
  return result;
}

- (BOOL)isDefunct
{
  return 0;
}

- (CGSize)videoDisplaySize
{
  uint64_t v8 = 0;
  uint64_t v9 = (double *)&v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v11 = &unk_194C75EBF;
  long long v12 = *MEMORY[0x1E4F1DB30];
  ivarAccessQueue = self->_ivarAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__AVPlayerItemRenderedLegibleOutput_videoDisplaySize__block_invoke;
  v7[3] = &unk_1E57B2110;
  v7[4] = self;
  v7[5] = &v8;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v7);
  double v3 = v9[4];
  double v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  double v5 = v3;
  double v6 = v4;
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

__n128 __53__AVPlayerItemRenderedLegibleOutput_videoDisplaySize__block_invoke(uint64_t a1)
{
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 64);
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (void)setVideoDisplaySize:(CGSize)a3
{
  if (a3.width == 0.0 || a3.height == 0.0)
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"videoDisplaySize for AVPlayerItemRenderedLegibleOutput shall have non-zero height and width", v3, v4, v5, v6, v7, v10), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x3052000000;
  char v16 = __Block_byref_object_copy__20;
  uint64_t v17 = __Block_byref_object_dispose__20;
  uint64_t v18 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__AVPlayerItemRenderedLegibleOutput_setVideoDisplaySize___block_invoke;
  block[3] = &unk_1E57B5930;
  block[4] = self;
  void block[5] = &v19;
  CGSize v12 = a3;
  block[6] = &v13;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v20 + 24)) {
    objc_msgSend((id)objc_msgSend((id)v14[5], "referencedObject"), "_evaluateRenderedLegibleOutputs");
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
}

__n128 __57__AVPlayerItemRenderedLegibleOutput_setVideoDisplaySize___block_invoke(uint64_t a1)
{
  BOOL v2 = *(double *)(*(void *)(a1 + 32) + 64) != *(double *)(a1 + 56);
  if (*(double *)(*(void *)(a1 + 32) + 72) != *(double *)(a1 + 64)) {
    BOOL v2 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = *(id *)(*(void *)(a1 + 32) + 40);
  __n128 result = *(__n128 *)(a1 + 56);
  *(__n128 *)(*(void *)(a1 + 32) + 64) = result;
  return result;
}

@end