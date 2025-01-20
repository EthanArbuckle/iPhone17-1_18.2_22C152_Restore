@interface AVPlayerItemLegibleOutput
+ (void)initialize;
- (AVPlayerItemLegibleOutput)init;
- (AVPlayerItemLegibleOutput)initWithDependencyFactory:(id)a3 mediaSubtypesForNativeRepresentation:(id)a4;
- (AVPlayerItemLegibleOutput)initWithMediaSubtypesForNativeRepresentation:(NSArray *)subtypes;
- (AVPlayerItemLegibleOutputTextStylingResolution)textStylingResolution;
- (BOOL)_attachToPlayerItem:(id)a3;
- (BOOL)isDefunct;
- (BOOL)suppressesPlayerRendering;
- (NSTimeInterval)advanceIntervalForDelegateInvocation;
- (dispatch_queue_t)delegateQueue;
- (id)_figLegibleOutputsDictionaryOptions;
- (id)delegate;
- (void)_collectUncollectables;
- (void)_detachFromPlayerItem;
- (void)_pushAttributedStrings:(id)a3 andSampleBuffers:(id)a4 atItemTime:(id *)a5;
- (void)_signalFlush;
- (void)dealloc;
- (void)setAdvanceIntervalForDelegateInvocation:(NSTimeInterval)advanceIntervalForDelegateInvocation;
- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)delegateQueue;
- (void)setSuppressesPlayerRendering:(BOOL)a3;
- (void)setTextStylingResolution:(AVPlayerItemLegibleOutputTextStylingResolution)textStylingResolution;
@end

@implementation AVPlayerItemLegibleOutput

+ (void)initialize
{
}

- (AVPlayerItemLegibleOutput)init
{
  uint64_t v3 = [MEMORY[0x1E4F1C978] array];
  return [(AVPlayerItemLegibleOutput *)self initWithMediaSubtypesForNativeRepresentation:v3];
}

- (AVPlayerItemLegibleOutput)initWithMediaSubtypesForNativeRepresentation:(NSArray *)subtypes
{
  v5 = objc_alloc_init(AVPlayerItemLegibleOutputRealDependencyFactory);
  if (!subtypes) {
    subtypes = (NSArray *)[MEMORY[0x1E4F1C978] array];
  }
  return [(AVPlayerItemLegibleOutput *)self initWithDependencyFactory:v5 mediaSubtypesForNativeRepresentation:subtypes];
}

- (AVPlayerItemLegibleOutput)initWithDependencyFactory:(id)a3 mediaSubtypesForNativeRepresentation:(id)a4
{
  v5 = (objc_class *)self;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    v34 = self;
    v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3C8];
    v25 = "subtypes != nil";
LABEL_19:
    uint64_t v27 = AVMethodExceptionReasonWithObjectAndSelector(v5, a2, @"invalid parameter not satisfying: %s", v18, v19, v20, v21, v22, (uint64_t)v25);
LABEL_21:
    objc_exception_throw((id)[v23 exceptionWithName:v24 reason:v27 userInfo:0]);
  }
  v40.receiver = self;
  v40.super_class = (Class)AVPlayerItemLegibleOutput;
  v5 = [(AVPlayerItemOutput *)&v40 init];
  if (v5)
  {
    v8 = objc_alloc_init(AVPlayerItemLegibleOutputInternal);
    *((void *)v5 + 2) = v8;
    if (v8)
    {
      CFRetain(v8);
      *(void *)(*((void *)v5 + 2) + 24) = objc_alloc_init(AVWeakReferencingDelegateStorage);
      *(void *)(*((void *)v5 + 2) + 8) = a3;
      *(void *)(*((void *)v5 + 2) + 16) = [a4 copy];
      *(void *)(*((void *)v5 + 2) + 32) = av_readwrite_dispatch_queue_create("com.apple.avplayeritemlegibleoutput.ivars");
      *(void *)(*((void *)v5 + 2) + 64) = [@"AVPlayerItemLegibleOutputTextStylingResolutionDefault" copy];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      v9 = *(void **)(*((void *)v5 + 2) + 16);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v37 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v17 = v5;
              v23 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v24 = *MEMORY[0x1E4F1C3C8];
              v25 = "[mediaSubtypeObject isKindOfClass:[NSNumber class]]";
              goto LABEL_19;
            }
            unint64_t v15 = [v14 unsignedLongLongValue];
            if (HIDWORD(v15))
            {
              v26 = v5;
              v23 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v24 = *MEMORY[0x1E4F1C3C8];
              v25 = "integerValueAppearsToBeAFourCC";
              goto LABEL_19;
            }
            if (v15 == 1664495672)
            {
              v28 = v5;
              v23 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v24 = *MEMORY[0x1E4F1C3C8];
              uint64_t v27 = AVMethodExceptionReasonWithObjectAndSelector(v5, a2, @"Native representation is not available for media subtype 'c608'", v29, v30, v31, v32, v33, v35);
              goto LABEL_21;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v11);
      }
    }
    else
    {

      return 0;
    }
  }
  return (AVPlayerItemLegibleOutput *)v5;
}

- (void)_collectUncollectables
{
  legibleOutputInternal = (dispatch_object_t *)self->_legibleOutputInternal;
  if (legibleOutputInternal[4])
  {
    dispatch_release(legibleOutputInternal[4]);
    legibleOutputInternal = (dispatch_object_t *)self->_legibleOutputInternal;
  }
  CFRelease(legibleOutputInternal);
}

- (void)dealloc
{
  legibleOutputInternal = self->_legibleOutputInternal;
  if (legibleOutputInternal)
  {

    [(AVPlayerItemLegibleOutput *)self _collectUncollectables];
    legibleOutputInternal = self->_legibleOutputInternal;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVPlayerItemLegibleOutput;
  [(AVPlayerItemOutput *)&v4 dealloc];
}

- (void)_pushAttributedStrings:(id)a3 andSampleBuffers:(id)a4 atItemTime:(id *)a5
{
  delegateStorage = self->_legibleOutputInternal->delegateStorage;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__AVPlayerItemLegibleOutput__pushAttributedStrings_andSampleBuffers_atItemTime___block_invoke;
  v6[3] = &unk_1E57B72C8;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a5;
  [(AVWeakReferencingDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v6];
}

uint64_t __80__AVPlayerItemLegibleOutput__pushAttributedStrings_andSampleBuffers_atItemTime___block_invoke(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v4 = *(void *)(v3 + 32);
      uint64_t v5 = *(void *)(v3 + 40);
      uint64_t v6 = *(void *)(v3 + 48);
      long long v7 = *(_OWORD *)(v3 + 56);
      uint64_t v8 = *(void *)(v3 + 72);
      return [a2 legibleOutput:v4 didOutputAttributedStrings:v5 nativeSampleBuffers:v6 forItemTime:&v7];
    }
  }
  return result;
}

- (void)_signalFlush
{
  delegateStorage = self->_legibleOutputInternal->delegateStorage;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__AVPlayerItemLegibleOutput__signalFlush__block_invoke;
  v3[3] = &unk_1E57B4B88;
  v3[4] = self;
  [(AVWeakReferencingDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v3];
}

uint64_t __41__AVPlayerItemLegibleOutput__signalFlush__block_invoke(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v4 = *(void *)(v3 + 32);
      return [a2 outputSequenceWasFlushed:v4];
    }
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
  uint64_t v9 = -[AVPlayerItemLegibleOutputDependencyFactory playerItemOutputHostForPlayerItem:](self->_legibleOutputInternal->dependencyFactory, "playerItemOutputHostForPlayerItem:");
  ivarAccessQueue = self->_legibleOutputInternal->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__AVPlayerItemLegibleOutput__attachToPlayerItem___block_invoke;
  block[3] = &unk_1E57B3270;
  block[5] = v9;
  block[6] = &v15;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  BOOL v11 = *((unsigned char *)v16 + 24) == 0;
  _Block_object_dispose(&v15, 8);
  return v11;
}

id __49__AVPlayerItemLegibleOutput__attachToPlayerItem___block_invoke(id result)
{
  *(unsigned char *)(*(void *)(*((void *)result + 6) + 8) + 24) = *(void *)(*(void *)(*((void *)result + 4) + 16)
                                                                            + 40) != 0;
  if (!*(unsigned char *)(*(void *)(*((void *)result + 6) + 8) + 24))
  {
    v1 = result;
    result = (id)[*((id *)result + 5) _weakReference];
    *(void *)(*(void *)(v1[4] + 16) + 40) = result;
  }
  return result;
}

- (void)_detachFromPlayerItem
{
  ivarAccessQueue = self->_legibleOutputInternal->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AVPlayerItemLegibleOutput__detachFromPlayerItem__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

void __50__AVPlayerItemLegibleOutput__detachFromPlayerItem__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 40) = 0;
}

- (id)_figLegibleOutputsDictionaryOptions
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [(AVPlayerItemLegibleOutput *)self advanceIntervalForDelegateInvocation];
  if (v4 != 0.0)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
    [v3 setObject:v5 forKey:*MEMORY[0x1E4F33500]];
  }
  nativeRepresentationSubtypes = self->_legibleOutputInternal->nativeRepresentationSubtypes;
  if (nativeRepresentationSubtypes) {
    [v3 setObject:nativeRepresentationSubtypes forKey:*MEMORY[0x1E4F33508]];
  }
  BOOL v7 = [(NSString *)[(AVPlayerItemLegibleOutput *)self textStylingResolution] isEqualToString:@"AVPlayerItemLegibleOutputTextStylingResolutionSourceAndRulesOnly"];
  uint64_t v8 = (void *)MEMORY[0x1E4F33520];
  if (!v7) {
    uint64_t v8 = (void *)MEMORY[0x1E4F33518];
  }
  [v3 setObject:*v8 forKey:*MEMORY[0x1E4F33510]];
  return v3;
}

- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)delegateQueue
{
  if (delegate)
  {
    if (!delegateQueue)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
      uint64_t v10 = "newDelegateQueue != NULL";
      goto LABEL_9;
    }
  }
  else if (delegateQueue)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = "newDelegateQueue == NULL";
LABEL_9:
    uint64_t v12 = (void *)[v8 exceptionWithName:v9, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)delegateQueue, v4, v5, v6, v7, (uint64_t)v10), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  delegateStorage = self->_legibleOutputInternal->delegateStorage;
  -[AVWeakReferencingDelegateStorage setDelegate:queue:](delegateStorage, "setDelegate:queue:");
}

- (id)delegate
{
  return [(AVWeakReferencingDelegateStorage *)self->_legibleOutputInternal->delegateStorage delegate];
}

- (dispatch_queue_t)delegateQueue
{
  return (dispatch_queue_t)[(AVWeakReferencingDelegateStorage *)self->_legibleOutputInternal->delegateStorage delegateQueue];
}

- (NSTimeInterval)advanceIntervalForDelegateInvocation
{
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  legibleOutputInternal = self->_legibleOutputInternal;
  uint64_t v10 = 0;
  ivarAccessQueue = legibleOutputInternal->ivarAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__AVPlayerItemLegibleOutput_advanceIntervalForDelegateInvocation__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  v6[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v6);
  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

double __65__AVPlayerItemLegibleOutput_advanceIntervalForDelegateInvocation__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(*(void *)(a1 + 32) + 16) + 56);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setAdvanceIntervalForDelegateInvocation:(NSTimeInterval)advanceIntervalForDelegateInvocation
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__40;
  uint64_t v9 = __Block_byref_object_dispose__40;
  uint64_t v10 = 0;
  ivarAccessQueue = self->_legibleOutputInternal->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__AVPlayerItemLegibleOutput_setAdvanceIntervalForDelegateInvocation___block_invoke;
  v4[3] = &unk_1E57B4B60;
  *(NSTimeInterval *)&v4[7] = advanceIntervalForDelegateInvocation;
  v4[4] = self;
  v4[5] = &v11;
  v4[6] = &v5;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
  if (*((unsigned char *)v12 + 24)) {
    objc_msgSend((id)objc_msgSend((id)v6[5], "referencedObject"), "_evaluateLegibleOutputs");
  }

  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v11, 8);
}

double __69__AVPlayerItemLegibleOutput_setAdvanceIntervalForDelegateInvocation___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 56) != *(double *)(*(void *)(*(void *)(a1 + 32) + 16)
                                                                                                 + 56);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_retain(*(id *)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 16)
                                                                                  + 40));
  double result = *(double *)(a1 + 56);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 16) + 56) = result;
  return result;
}

- (AVPlayerItemLegibleOutputTextStylingResolution)textStylingResolution
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__40;
  legibleOutputInternal = self->_legibleOutputInternal;
  uint64_t v11 = __Block_byref_object_dispose__40;
  uint64_t v12 = 0;
  ivarAccessQueue = legibleOutputInternal->ivarAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__AVPlayerItemLegibleOutput_textStylingResolution__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  v6[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v6);
  double v4 = (NSString *)(id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __50__AVPlayerItemLegibleOutput_textStylingResolution__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 16) + 64) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setTextStylingResolution:(AVPlayerItemLegibleOutputTextStylingResolution)textStylingResolution
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"AVPlayerItemLegibleOutputTextStylingResolutionDefault", @"AVPlayerItemLegibleOutputTextStylingResolutionSourceAndRulesOnly", 0), "containsObject:", textStylingResolution) & 1) == 0)
  {
    uint64_t v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Invalid text styling resolution %@", v6, v7, v8, v9, v10, (uint64_t)textStylingResolution), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3052000000;
  uint64_t v17 = __Block_byref_object_copy__40;
  char v18 = __Block_byref_object_dispose__40;
  uint64_t v19 = 0;
  ivarAccessQueue = self->_legibleOutputInternal->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AVPlayerItemLegibleOutput_setTextStylingResolution___block_invoke;
  block[3] = &unk_1E57B6680;
  block[4] = textStylingResolution;
  void block[5] = self;
  block[6] = &v20;
  void block[7] = &v14;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v21 + 24)) {
    objc_msgSend((id)objc_msgSend((id)v15[5], "referencedObject"), "_evaluateLegibleOutputs");
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
}

id __54__AVPlayerItemLegibleOutput_setTextStylingResolution___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(a1 + 32) != *(void *)(*(void *)(*(void *)(a1 + 40) + 16)
                                                                                                 + 64);
  id result = *(id *)(*(void *)(*(void *)(a1 + 40) + 16) + 40);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {

    id result = (id)[*(id *)(a1 + 32) copy];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 16) + 64) = result;
  }
  return result;
}

- (BOOL)suppressesPlayerRendering
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  legibleOutputInternal = self->_legibleOutputInternal;
  char v10 = 0;
  ivarAccessQueue = legibleOutputInternal->ivarAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__AVPlayerItemLegibleOutput_suppressesPlayerRendering__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  v6[5] = &v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __54__AVPlayerItemLegibleOutput_suppressesPlayerRendering__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 16)
                                                                            + 48);
  return result;
}

- (void)setSuppressesPlayerRendering:(BOOL)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  char v10 = __Block_byref_object_copy__40;
  uint64_t v11 = __Block_byref_object_dispose__40;
  uint64_t v12 = 0;
  ivarAccessQueue = self->_legibleOutputInternal->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__AVPlayerItemLegibleOutput_setSuppressesPlayerRendering___block_invoke;
  v5[3] = &unk_1E57B5908;
  v5[4] = self;
  v5[5] = &v13;
  BOOL v6 = a3;
  v5[6] = &v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  if (*((unsigned char *)v14 + 24)) {
    objc_msgSend((id)objc_msgSend((id)v8[5], "referencedObject"), "_renderingSuppressionDidChangeForOutput:", self);
  }

  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v13, 8);
}

id __58__AVPlayerItemLegibleOutput_setSuppressesPlayerRendering___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 16)
                                                                                  + 48) != *(unsigned __int8 *)(a1 + 56);
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 16) + 40);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 16) + 48) = *(unsigned char *)(a1 + 56);
  return result;
}

- (BOOL)isDefunct
{
  return 0;
}

@end