@interface CUVoiceSession
- (CUVoiceSession)init;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)invalidationHandler;
- (void)_completeAllRequestsWithError:(id)a3;
- (void)_completeRequest:(id)a3 error:(id)a4;
- (void)_invalidate;
- (void)_invalidated;
- (void)_processQueuedRequests;
- (void)_speakText:(id)a3 flags:(unsigned int)a4 volume:(double)a5 completion:(id)a6;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateWithFlags:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)speakText:(id)a3 flags:(unsigned int)a4 completion:(id)a5;
- (void)speakText:(id)a3 flags:(unsigned int)a4 volume:(double)a5 completionHandler:(id)a6;
- (void)stopSpeaking;
@end

@implementation CUVoiceSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_voiceRequests, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
}

- (NSString)label
{
  return self->_label;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)_completeRequest:(id)a3 error:(id)a4
{
  v8 = (CUVoiceRequest *)a3;
  id v6 = a4;
  if (self->_currentRequest == v8)
  {
    self->_currentRequest = 0;
  }
  v7 = [(CUVoiceRequest *)v8 completion];
  if (v7)
  {
    [(CUVoiceRequest *)v8 setCompletion:0];
    ((void (**)(void, id))v7)[2](v7, v6);
  }
}

- (void)_completeAllRequestsWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_requests;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CUVoiceSession _completeRequest:error:](self, "_completeRequest:error:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_requests removeAllObjects];
}

- (void)_processQueuedRequests
{
  p_currentRequest = &self->_currentRequest;
  if (!self->_currentRequest)
  {
    id v4 = [(NSMutableArray *)self->_requests popFirstObject];
    if (!v4)
    {
LABEL_15:

      return;
    }
    objc_storeStrong((id *)p_currentRequest, v4);
    uint64_t v9 = [v4 speechRequest];
    if (!v9)
    {
LABEL_14:

      goto LABEL_15;
    }
    if (IsAppleInternalBuild_sOnce != -1) {
      dispatch_once(&IsAppleInternalBuild_sOnce, &__block_literal_global_116);
    }
    if (IsAppleInternalBuild_sIsInternal)
    {
      long long v10 = [v9 text];
    }
    else
    {
      long long v10 = @"*";
    }
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          goto LABEL_13;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUVoiceSession _processQueuedRequests]", 0x1Eu, (uint64_t)"Start speaking text '%@'\n", v5, v6, v7, v8, (uint64_t)v10);
    }
LABEL_13:
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __40__CUVoiceSession__processQueuedRequests__block_invoke;
    v16[3] = &unk_1E55BF170;
    v16[4] = self;
    v16[5] = v10;
    [v9 setDidStartSpeaking:v16];
    long long v12 = [(objc_class *)getAVAudioSessionClass_9438() sharedInstance];
    [v12 setCategory:@"AVAudioSessionCategoryPlayback" mode:@"AVAudioSessionModeDefault" routeSharingPolicy:1 options:0 error:0];

    speechSynthesizer = self->_speechSynthesizer;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __40__CUVoiceSession__processQueuedRequests__block_invoke_2;
    v14[3] = &unk_1E55BEFE8;
    v14[4] = self;
    v14[5] = v10;
    id v15 = v9;
    [(SiriTTSDaemonSession *)speechSynthesizer speakWithSpeechRequest:v15 didFinish:v14];

    goto LABEL_14;
  }
}

uint64_t __40__CUVoiceSession__processQueuedRequests__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 40);
  if (*(int *)result <= 30)
  {
    if (*(_DWORD *)result != -1) {
      return LogPrintF(result, (uint64_t)"-[CUVoiceSession _processQueuedRequests]_block_invoke", 0x1Eu, (uint64_t)"DidStartSpeakingRequest '%@'\n", a5, a6, a7, a8, *(void *)(a1 + 40));
    }
    uint64_t result = _LogCategory_Initialize(result, 0x1Eu);
    if (result)
    {
      uint64_t result = *(void *)(*(void *)(a1 + 32) + 40);
      return LogPrintF(result, (uint64_t)"-[CUVoiceSession _processQueuedRequests]_block_invoke", 0x1Eu, (uint64_t)"DidStartSpeakingRequest '%@'\n", a5, a6, a7, a8, *(void *)(a1 + 40));
    }
  }
  return result;
}

void __40__CUVoiceSession__processQueuedRequests__block_invoke_2(void *a1, void *a2)
{
  id v30 = a2;
  uint64_t v7 = a1[4];
  uint64_t v8 = *(int **)(v7 + 40);
  if (*v8 <= 30)
  {
    if (*v8 == -1)
    {
      BOOL v9 = _LogCategory_Initialize((uint64_t)v8, 0x1Eu);
      uint64_t v7 = a1[4];
      if (!v9) {
        goto LABEL_5;
      }
      uint64_t v8 = *(int **)(v7 + 40);
    }
    LogPrintF((uint64_t)v8, (uint64_t)"-[CUVoiceSession _processQueuedRequests]_block_invoke_2", 0x1Eu, (uint64_t)"Did finish speaking text '%@', finished %s, error %{error}\n", v3, v4, v5, v6, a1[5]);
    uint64_t v7 = a1[4];
  }
LABEL_5:
  v14 = [*(id *)(v7 + 8) speechRequest];
  uint64_t v15 = a1[4];
  if ((void *)a1[6] != v14)
  {
    v16 = *(int **)(v15 + 40);
    if (*v16 <= 60)
    {
      if (*v16 != -1)
      {
LABEL_8:
        LogPrintF((uint64_t)v16, (uint64_t)"-[CUVoiceSession _processQueuedRequests]_block_invoke_2", 0x3Cu, (uint64_t)"### Finished speaking non-current request?\n", v10, v11, v12, v13, v29);
        uint64_t v15 = a1[4];
        goto LABEL_10;
      }
      BOOL v17 = _LogCategory_Initialize((uint64_t)v16, 0x3Cu);
      uint64_t v15 = a1[4];
      if (v17)
      {
        v16 = *(int **)(v15 + 40);
        goto LABEL_8;
      }
    }
  }
LABEL_10:
  v18 = [*(id *)(v15 + 8) completion];
  if (v18)
  {
    [*(id *)(a1[4] + 8) setCompletion:0];
    ((void (**)(void, id))v18)[2](v18, v30);
  }

  uint64_t v19 = a1[4];
  v20 = *(void **)(v19 + 8);
  *(void *)(v19 + 8) = 0;

  v27 = (unsigned char *)a1[4];
  if (v27[16])
  {
    v28 = NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated", v21, v22, v23, v24, v25, v26, v29);
    [v27 _completeAllRequestsWithError:v28];
  }
  else
  {
    [v27 _processQueuedRequests];
  }
}

- (void)stopSpeaking
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CUVoiceSession_stopSpeaking__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__CUVoiceSession_stopSpeaking__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) speechRequest];
  uint64_t v7 = v2;
  if (v2)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    BOOL v9 = *(int **)(v8 + 40);
    uint64_t v13 = v7;
    if (*v9 <= 30)
    {
      if (*v9 == -1)
      {
        BOOL v10 = _LogCategory_Initialize((uint64_t)v9, 0x1Eu);
        uint64_t v8 = *(void *)(a1 + 32);
        if (!v10) {
          goto LABEL_6;
        }
        BOOL v9 = *(int **)(v8 + 40);
      }
      LogPrintF((uint64_t)v9, (uint64_t)"-[CUVoiceSession stopSpeaking]_block_invoke", 0x1Eu, (uint64_t)"Stop speaking\n", v3, v4, v5, v6, v12);
      uint64_t v8 = *(void *)(a1 + 32);
    }
LABEL_6:
    uint64_t v2 = [*(id *)(v8 + 32) cancelWithRequest:v13];
    uint64_t v7 = v13;
  }
  return MEMORY[0x1F41817F8](v2, v7);
}

- (void)_speakText:(id)a3 flags:(unsigned int)a4 volume:(double)a5 completion:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  v39 = (__CFString *)a3;
  id v14 = a6;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
        goto LABEL_10;
      }
      ucat = self->_ucat;
    }
    if (IsAppleInternalBuild_sOnce != -1) {
      dispatch_once(&IsAppleInternalBuild_sOnce, &__block_literal_global_116);
    }
    if (IsAppleInternalBuild_sIsInternal) {
      v16 = v39;
    }
    else {
      v16 = @"*";
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUVoiceSession _speakText:flags:volume:completion:]", 0x1Eu, (uint64_t)"Scheduling speaking '%@'\n", v10, v11, v12, v13, (uint64_t)v16);
  }
LABEL_10:
  if (!self->_speechSynthesizer)
  {
    BOOL v17 = (SiriTTSDaemonSession *)objc_alloc_init((Class)getSiriTTSDaemonSessionClass[0]());
    speechSynthesizer = self->_speechSynthesizer;
    self->_speechSynthesizer = v17;
  }
  uint64_t v19 = [(CUVoiceRequest *)self->_currentRequest speechRequest];
  uint64_t v24 = (void *)v19;
  if ((v8 & 1) == 0 && v19)
  {
    uint64_t v25 = self->_ucat;
    if (v25->var0 <= 30)
    {
      if (v25->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v25, 0x1Eu)) {
          goto LABEL_18;
        }
        uint64_t v25 = self->_ucat;
      }
      LogPrintF((uint64_t)v25, (uint64_t)"-[CUVoiceSession _speakText:flags:volume:completion:]", 0x1Eu, (uint64_t)"Stop speaking for new request\n", v20, v21, v22, v23, v38);
    }
LABEL_18:
    [(SiriTTSDaemonSession *)self->_speechSynthesizer cancelWithRequest:v24];
  }
  uint64_t v26 = softLinkVSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences[0]();
  v27 = @"en-US";
  if (v26) {
    v27 = (__CFString *)v26;
  }
  v28 = (Class (__cdecl *)())getSiriTTSSynthesisVoiceClass[0];
  uint64_t v29 = v27;
  id v30 = (void *)[objc_alloc(v28()) initWithLanguage:v29 name:0];

  v31 = (void *)[objc_alloc((Class)getSiriTTSSpeechRequestClass[0]()) initWithText:v39 voice:v30];
  v33 = v31;
  if (a5 > 0.0)
  {
    *(float *)&double v32 = a5;
    [v31 setPlaybackVolume:v32];
  }
  v34 = objc_alloc_init(CUVoiceRequest);
  [(CUVoiceRequest *)v34 setCompletion:v14];
  [(CUVoiceRequest *)v34 setFlags:v8];
  [(CUVoiceRequest *)v34 setOwner:self];
  [(CUVoiceRequest *)v34 setSpeechRequest:v33];
  requests = self->_requests;
  if (!requests)
  {
    v36 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v37 = self->_requests;
    self->_requests = v36;

    requests = self->_requests;
  }
  [(NSMutableArray *)requests addObject:v34];
  [(CUVoiceSession *)self _processQueuedRequests];
}

- (void)speakText:(id)a3 flags:(unsigned int)a4 volume:(double)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CUVoiceSession_speakText_flags_volume_completionHandler___block_invoke;
  block[3] = &unk_1E55BEFC0;
  block[4] = self;
  id v16 = v10;
  unsigned int v19 = a4;
  double v18 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(dispatchQueue, block);
}

uint64_t __59__CUVoiceSession_speakText_flags_volume_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _speakText:*(void *)(a1 + 40) flags:*(unsigned int *)(a1 + 64) volume:*(void *)(a1 + 48) completion:*(double *)(a1 + 56)];
}

- (void)speakText:(id)a3 flags:(unsigned int)a4 completion:(id)a5
{
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2](invalidationHandler, a2);
      id v4 = self->_invalidationHandler;
    }
    else
    {
      id v4 = 0;
    }
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          return;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUVoiceSession _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v5, v6, v7, v8, v11);
    }
  }
}

- (void)_invalidate
{
  uint64_t v3 = [(CUVoiceRequest *)self->_currentRequest speechRequest];
  id v9 = (id)v3;
  id v15 = (id)v3;
  if ((self->_invalidateFlags & 2) == 0 || !self->_currentRequest)
  {
    if (!v3)
    {
      uint64_t v12 = NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated", 0, v4, v5, v6, v7, v8, v14);
      [(CUVoiceSession *)self _completeAllRequestsWithError:v12];

      goto LABEL_13;
    }
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_12;
    }
    if (ucat->var0 == -1)
    {
      BOOL v13 = _LogCategory_Initialize((uint64_t)ucat, 0x1Eu);
      id v9 = v15;
      if (!v13) {
        goto LABEL_12;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUVoiceSession _invalidate]", 0x1Eu, (uint64_t)"Stop speaking for invalidate\n", v5, v6, v7, v8, v14);
    id v9 = v15;
LABEL_12:
    [(SiriTTSDaemonSession *)self->_speechSynthesizer cancelWithRequest:v9];
    goto LABEL_13;
  }
  id v10 = self->_ucat;
  if (v10->var0 > 30) {
    goto LABEL_13;
  }
  if (v10->var0 != -1) {
    goto LABEL_5;
  }
  if (_LogCategory_Initialize((uint64_t)v10, 0x1Eu))
  {
    id v10 = self->_ucat;
LABEL_5:
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUVoiceSession _invalidate]", 0x1Eu, (uint64_t)"Waiting until current request finishes before invalidating\n", v5, v6, v7, v8, v14);
  }
LABEL_13:
  [(CUVoiceSession *)self _invalidated];
}

- (void)invalidateWithFlags:(unsigned int)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__CUVoiceSession_invalidateWithFlags___block_invoke;
  v4[3] = &unk_1E55BF088;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __38__CUVoiceSession_invalidateWithFlags___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (*(unsigned char *)(v8 + 16)) {
    return result;
  }
  uint64_t v9 = result;
  *(unsigned char *)(v8 + 16) = 1;
  uint64_t v10 = *(void *)(result + 32);
  uint64_t v11 = *(int **)(v10 + 40);
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
      uint64_t v10 = *(void *)(v9 + 32);
      if (!v12) {
        goto LABEL_6;
      }
      uint64_t v11 = *(int **)(v10 + 40);
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUVoiceSession invalidateWithFlags:]_block_invoke", 0x1Eu, (uint64_t)"InvalidateWithFlags: %#{flags}\n", a5, a6, a7, a8, *(unsigned int *)(v9 + 40));
    uint64_t v10 = *(void *)(v9 + 32);
  }
LABEL_6:
  *(_DWORD *)(v10 + 20) = *(_DWORD *)(v9 + 40);
  BOOL v13 = *(void **)(v9 + 32);
  return [v13 _invalidate];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__CUVoiceSession_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__CUVoiceSession_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (*(unsigned char *)(v8 + 16)) {
    return result;
  }
  uint64_t v9 = result;
  *(unsigned char *)(v8 + 16) = 1;
  uint64_t v10 = *(void **)(result + 32);
  uint64_t v11 = (int *)v10[5];
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
      uint64_t v10 = *(void **)(v9 + 32);
      if (!v12) {
        goto LABEL_6;
      }
      uint64_t v11 = (int *)v10[5];
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUVoiceSession invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v13);
    uint64_t v10 = *(void **)(v9 + 32);
  }
LABEL_6:
  return [v10 _invalidate];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CDBF8;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUVoiceSession;
  [(CUVoiceSession *)&v4 dealloc];
}

- (CUVoiceSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUVoiceSession;
  uint64_t v2 = [(CUVoiceSession *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v3->_ucat = (LogCategory *)&gLogCategory_CUVoiceSession;
    objc_super v4 = v3;
  }

  return v3;
}

@end