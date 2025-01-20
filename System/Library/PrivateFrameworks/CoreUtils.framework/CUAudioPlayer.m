@interface CUAudioPlayer
- (BOOL)setPortUID:(id)a3 channelName:(id)a4 error:(id *)a5;
- (CUAudioPlayer)init;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)invalidationHandler;
- (unsigned)enableSmartRouting;
- (unsigned)flags;
- (void)_abortRequestsWithError:(id)a3;
- (void)_activate;
- (void)_applyChannelAssignments:(id)a3;
- (void)_completeRequest:(id)a3 error:(id)a4;
- (void)_invalidateWithFlags:(unsigned int)a3;
- (void)_invalidated;
- (void)_playPreparedIdentifier:(id)a3 completion:(id)a4;
- (void)_playURL:(id)a3 loop:(BOOL)a4 completion:(id)a5;
- (void)_prepareURL:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)_processRequests;
- (void)activate;
- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)audioSessionInterrupted:(id)a3;
- (void)dealloc;
- (void)invalidateWithFlags:(unsigned int)a3;
- (void)playPreparedIdentifier:(id)a3 completion:(id)a4;
- (void)playURL:(id)a3 completion:(id)a4;
- (void)playURL:(id)a3 loop:(BOOL)a4 completion:(id)a5;
- (void)prepareURL:(id)a3 identifier:(id *)a4 completion:(id)a5;
- (void)setDispatchQueue:(id)a3;
- (void)setEnableSmartRouting:(unsigned int)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation CUAudioPlayer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_selfRef, 0);
  objc_storeStrong((id *)&self->_preparedRequests, 0);
  objc_storeStrong((id *)&self->_playRequests, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
}

- (void)setEnableSmartRouting:(unsigned int)a3
{
  self->_enableSmartRouting = a3;
}

- (unsigned)enableSmartRouting
{
  return self->_enableSmartRouting;
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

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)audioSessionInterrupted:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CUAudioPlayer_audioSessionInterrupted___block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __41__CUAudioPlayer_audioSessionInterrupted___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9 = *(void **)(a1 + 32);
  v10 = (int *)v9[8];
  if (*v10 <= 60)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUAudioPlayer audioSessionInterrupted:]_block_invoke", 0x3Cu, (uint64_t)"### AudioPlayer interrupted\n", a5, a6, a7, a8, v12);
      v9 = *(void **)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x3Cu);
    v9 = *(void **)(a1 + 32);
    if (v11)
    {
      v10 = (int *)v9[8];
      goto LABEL_3;
    }
  }
LABEL_5:
  NSErrorWithOSStatusF(4294960573, (uint64_t)"AudioSession interrupted", a3, a4, a5, a6, a7, a8, v12);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v9 _abortRequestsWithError:v13];
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  id v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CUAudioPlayer_audioPlayerDidFinishPlaying_successfully___block_invoke;
  block[3] = &unk_1E55BEAD0;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __58__CUAudioPlayer_audioPlayerDidFinishPlaying_successfully___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v15 = (uint64_t)v2;
  if (v2
    && (v7 = *(void **)(a1 + 40),
        [v2 audioPlayer],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7 == v8))
  {
    BOOL v11 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 48))
    {
      [*(id *)(a1 + 32) _completeRequest:v15 error:0];
    }
    else
    {
      uint64_t v12 = NSErrorWithOSStatusF(4294960596, (uint64_t)"Finish failed", v15, v9, v3, v4, v5, v6, v14);
      [v11 _completeRequest:v15 error:v12];
    }
  }
  else
  {
    id v10 = *(int **)(*(void *)(a1 + 32) + 64);
    if (*v10 > 90) {
      goto LABEL_11;
    }
    if (*v10 != -1) {
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)v10, 0x5Au))
    {
      id v10 = *(int **)(*(void *)(a1 + 32) + 64);
LABEL_5:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUAudioPlayer audioPlayerDidFinishPlaying:successfully:]_block_invoke", 0x5Au, (uint64_t)"### AudioPlayer finished for non-current player\n", v3, v4, v5, v6, v14);
    }
  }
LABEL_11:
  return MEMORY[0x1F4181820]();
}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CUAudioPlayer_audioPlayerDecodeErrorDidOccur_error___block_invoke;
  block[3] = &unk_1E55BE528;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

uint64_t __54__CUAudioPlayer_audioPlayerDecodeErrorDidOccur_error___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = *(int **)(*(void *)(a1 + 32) + 64);
  id v14 = v2;
  if (*v3 <= 60)
  {
    if (*v3 == -1)
    {
      BOOL v10 = _LogCategory_Initialize((uint64_t)v3, 0x3Cu);
      id v2 = v14;
      if (!v10) {
        goto LABEL_5;
      }
      uint64_t v3 = *(int **)(*(void *)(a1 + 32) + 64);
    }
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = [v2 audioPlayer];
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUAudioPlayer audioPlayerDecodeErrorDidOccur:error:]_block_invoke", 0x3Cu, (uint64_t)"### AudioPlayer decode failed %{error} %s\n", v6, v7, v8, v9, v4);

    id v2 = v14;
  }
LABEL_5:
  if (v2)
  {
    BOOL v11 = *(void **)(a1 + 48);
    id v12 = [v2 audioPlayer];

    if (v11 == v12) {
      [*(id *)(a1 + 32) _completeRequest:v14 error:*(void *)(a1 + 40)];
    }
  }
  return MEMORY[0x1F41817F8]();
}

- (void)_abortRequestsWithError:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self->_currentRequest;
  if (v5)
  {
    currentRequest = self->_currentRequest;
    self->_currentRequest = 0;

    uint64_t v7 = [(CUAudioRequest *)v5 completion];

    if (v7)
    {
      uint64_t v8 = [(CUAudioRequest *)v5 completion];
      ((void (**)(void, id))v8)[2](v8, v4);
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v9 = self->_playRequests;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      id v14 = v5;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v5 = (CUAudioRequest *)*(id *)(*((void *)&v21 + 1) + 8 * v13);

        uint64_t v15 = [(CUAudioRequest *)v5 completion];

        if (v15)
        {
          v16 = [(CUAudioRequest *)v5 completion];
          ((void (**)(void, id))v16)[2](v16, v4);
        }
        ++v13;
        id v14 = v5;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  [(NSMutableArray *)self->_playRequests removeAllObjects];
  preparedRequests = self->_preparedRequests;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __41__CUAudioPlayer__abortRequestsWithError___block_invoke;
  v19[3] = &unk_1E55BD898;
  id v20 = v4;
  id v18 = v4;
  [(NSMutableDictionary *)preparedRequests enumerateKeysAndObjectsUsingBlock:v19];
  [(NSMutableDictionary *)self->_preparedRequests removeAllObjects];
  [(CUAudioPlayer *)self _invalidated];
}

void __41__CUAudioPlayer__abortRequestsWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v4 = [v6 completion];

  if (v4)
  {
    uint64_t v5 = [v6 completion];
    v5[2](v5, *(void *)(a1 + 32));
  }
}

- (void)_completeRequest:(id)a3 error:(id)a4
{
  v28 = (CUAudioRequest *)a3;
  id v6 = a4;
  uint64_t v7 = v28;
  id v8 = v6;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      uint64_t v10 = [(CUAudioRequest *)v28 label];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUAudioPlayer _completeRequest:error:]", 0x1Eu, (uint64_t)"Play completed '%@', %{error}\n", v11, v12, v13, v14, (uint64_t)v10);

      uint64_t v7 = v28;
      goto LABEL_5;
    }
    BOOL v15 = _LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu);
    uint64_t v7 = v28;
    if (v15)
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  v16 = v7;
  if (self->_currentRequest == v7)
  {
    self->_currentRequest = 0;

    v16 = v28;
  }
  v17 = [(CUAudioRequest *)v16 completion];

  if (v17)
  {
    long long v24 = [(CUAudioRequest *)v28 completion];
    ((void (**)(void, id))v24)[2](v24, v8);
  }
  unsigned int invalidateFlags = self->_invalidateFlags;
  if ((invalidateFlags & 1) != 0
    || (invalidateFlags & 2) != 0 && ![(NSMutableArray *)self->_playRequests count])
  {
    uint64_t v26 = NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated", v18, v19, v20, v21, v22, v23, v27);
    [(CUAudioPlayer *)self _abortRequestsWithError:v26];
  }
  else
  {
    [(CUAudioPlayer *)self _processRequests];
  }
}

- (void)_processRequests
{
  if (self->_currentRequest) {
    return;
  }
  uint64_t v3 = [(NSMutableArray *)self->_playRequests firstObject];
  currentRequest = self->_currentRequest;
  self->_currentRequest = v3;

  if (!self->_currentRequest) {
    return;
  }
  [(NSMutableArray *)self->_playRequests removeObjectAtIndex:0];
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
        goto LABEL_8;
      }
      ucat = self->_ucat;
    }
    id v6 = [(CUAudioRequest *)self->_currentRequest label];
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUAudioPlayer _processRequests]", 0x1Eu, (uint64_t)"Play start '%@'\n", v7, v8, v9, v10, (uint64_t)v6);
  }
LABEL_8:
  id v11 = [(CUAudioRequest *)self->_currentRequest audioPlayer];
  [v11 play];
}

- (void)_prepareURL:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (void (**)(id, id))a5;
  id v10 = a3;
  id v11 = [v10 absoluteString];
  uint64_t v12 = [v11 lastPathComponent];

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUAudioPlayer _prepareURL:identifier:completion:]", 0x1Eu, (uint64_t)"Prepare request '%@'\n", v13, v14, v15, v16, (uint64_t)v12);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  id v30 = 0;
  uint64_t v18 = (void *)[objc_alloc((Class)getAVAudioPlayerClass[0]()) initWithContentsOfURL:v10 error:&v30];

  id v25 = v30;
  if (v18)
  {
    [v18 setDelegate:self];
    [(CUAudioPlayer *)self _applyChannelAssignments:v18];
    [v18 prepareToPlay];
    uint64_t v26 = objc_alloc_init(CUAudioRequest);
    [(CUAudioRequest *)v26 setAudioPlayer:v18];
    [(CUAudioRequest *)v26 setLabel:v12];
    [(NSMutableDictionary *)self->_preparedRequests setObject:v26 forKeyedSubscript:v8];

    goto LABEL_7;
  }
  uint64_t v27 = self->_ucat;
  if (v27->var0 <= 90)
  {
    if (v27->var0 != -1)
    {
LABEL_10:
      LogPrintF((uint64_t)v27, (uint64_t)"-[CUAudioPlayer _prepareURL:identifier:completion:]", 0x5Au, (uint64_t)"### Create AVAudioPlayer for '%@' failed: %{error}\n", v21, v22, v23, v24, (uint64_t)v12);
      goto LABEL_12;
    }
    if (_LogCategory_Initialize((uint64_t)v27, 0x5Au))
    {
      uint64_t v27 = self->_ucat;
      goto LABEL_10;
    }
  }
LABEL_12:
  if (v9)
  {
    if (v25)
    {
      v9[2](v9, v25);
    }
    else
    {
      v28 = NSErrorWithOSStatusF(4294960596, (uint64_t)"Create AVAudioPlayer", v19, v20, v21, v22, v23, v24, v29);
      v9[2](v9, v28);
    }
  }
LABEL_7:
}

- (void)prepareURL:(id)a3 identifier:(id *)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F29128] UUID];
  objc_storeStrong(a4, v10);
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__CUAudioPlayer_prepareURL_identifier_completion___block_invoke;
  v15[3] = &unk_1E55BEEF0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

uint64_t __50__CUAudioPlayer_prepareURL_identifier_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareURL:*(void *)(a1 + 40) identifier:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)_playURL:(id)a3 loop:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = (void (**)(id, id))a5;
  id v9 = a3;
  id v10 = [v9 absoluteString];
  id v11 = [v10 lastPathComponent];

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUAudioPlayer _playURL:loop:completion:]", 0x1Eu, (uint64_t)"Play request '%@'\n", v12, v13, v14, v15, (uint64_t)v11);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  id v29 = 0;
  id v17 = (void *)[objc_alloc((Class)getAVAudioPlayerClass[0]()) initWithContentsOfURL:v9 error:&v29];

  id v24 = v29;
  if (v17)
  {
    [v17 setDelegate:self];
    if (v5) {
      [v17 setNumberOfLoops:-1];
    }
    [(CUAudioPlayer *)self _applyChannelAssignments:v17];
    [v17 prepareToPlay];
    id v25 = objc_alloc_init(CUAudioRequest);
    [(CUAudioRequest *)v25 setAudioPlayer:v17];
    [(CUAudioRequest *)v25 setCompletion:v8];
    [(CUAudioRequest *)v25 setLabel:v11];
    [(NSMutableArray *)self->_playRequests addObject:v25];
    [(CUAudioPlayer *)self _processRequests];

    goto LABEL_9;
  }
  uint64_t v26 = self->_ucat;
  if (v26->var0 <= 90)
  {
    if (v26->var0 != -1)
    {
LABEL_12:
      LogPrintF((uint64_t)v26, (uint64_t)"-[CUAudioPlayer _playURL:loop:completion:]", 0x5Au, (uint64_t)"### Create AVAudioPlayer for '%@' failed: %{error}\n", v20, v21, v22, v23, (uint64_t)v11);
      goto LABEL_14;
    }
    if (_LogCategory_Initialize((uint64_t)v26, 0x5Au))
    {
      uint64_t v26 = self->_ucat;
      goto LABEL_12;
    }
  }
LABEL_14:
  if (v8)
  {
    if (v24)
    {
      v8[2](v8, v24);
    }
    else
    {
      uint64_t v27 = NSErrorWithOSStatusF(4294960596, (uint64_t)"Create AVAudioPlayer", v18, v19, v20, v21, v22, v23, v28);
      v8[2](v8, v27);
    }
  }
LABEL_9:
}

- (void)playURL:(id)a3 loop:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__CUAudioPlayer_playURL_loop_completion___block_invoke;
  v13[3] = &unk_1E55BD870;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

uint64_t __41__CUAudioPlayer_playURL_loop_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _playURL:*(void *)(a1 + 40) loop:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)playURL:(id)a3 completion:(id)a4
{
}

- (void)_playPreparedIdentifier:(id)a3 completion:(id)a4
{
  id v23 = a3;
  id v6 = (void (**)(id, void *))a4;
  uint64_t v13 = [(NSMutableDictionary *)self->_preparedRequests objectForKeyedSubscript:v23];
  ucat = self->_ucat;
  int var0 = ucat->var0;
  if (v13)
  {
    if (var0 <= 30)
    {
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
          goto LABEL_9;
        }
        ucat = self->_ucat;
      }
      uint64_t v22 = [v13 label];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUAudioPlayer _playPreparedIdentifier:completion:]", 0x1Eu, (uint64_t)"Play prepared ID %@ '%@'\n", v16, v17, v18, v19, (uint64_t)v23);
    }
LABEL_9:
    [(NSMutableDictionary *)self->_preparedRequests setObject:0 forKeyedSubscript:v23];
    [v13 setCompletion:v6];
    [(NSMutableArray *)self->_playRequests addObject:v13];
    [(CUAudioPlayer *)self _processRequests];
    goto LABEL_13;
  }
  if (var0 <= 90)
  {
    uint64_t v20 = (uint64_t)v23;
    if (var0 != -1)
    {
LABEL_7:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUAudioPlayer _playPreparedIdentifier:completion:]", 0x5Au, (uint64_t)"### Play prepared ID %@ not found\n", v9, v10, v11, v12, v20);
      goto LABEL_11;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au))
    {
      ucat = self->_ucat;
      uint64_t v20 = (uint64_t)v23;
      goto LABEL_7;
    }
  }
LABEL_11:
  if (v6)
  {
    uint64_t v21 = NSErrorWithOSStatusF(4294960569, (uint64_t)"Prepared ID %@ not found", v7, v8, v9, v10, v11, v12, (uint64_t)v23);
    v6[2](v6, v21);
  }
LABEL_13:
}

- (void)playPreparedIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CUAudioPlayer_playPreparedIdentifier_completion___block_invoke;
  block[3] = &unk_1E55BE9F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __51__CUAudioPlayer_playPreparedIdentifier_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _playPreparedIdentifier:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_invalidated
{
  if (!self->_invalidateCalled
    || self->_invalidateDone
    || self->_currentRequest
    || [(NSMutableArray *)self->_playRequests count]
    || [(NSMutableDictionary *)self->_preparedRequests count])
  {
    return;
  }
  if (self->_audioSession)
  {
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v4 = getAVAudioSessionInterruptionNotification[0]();
    [v3 removeObserver:self name:v4 object:self->_audioSession];

    audioSession = self->_audioSession;
    self->_audioSession = 0;
  }
  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2]();
    id v7 = self->_invalidationHandler;
  }
  else
  {
    id v7 = 0;
  }
  self->_invalidationHandler = 0;

  self->_invalidateDone = 1;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_16;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUAudioPlayer _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v8, v9, v10, v11, v14);
  }
LABEL_16:
  selfRef = self->_selfRef;
  self->_selfRef = 0;
}

- (void)_invalidateWithFlags:(unsigned int)a3
{
  if (self->_invalidateCalled) {
    return;
  }
  uint64_t v8 = *(void *)&a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_6;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUAudioPlayer _invalidateWithFlags:]", 0x1Eu, (uint64_t)"Invalidate %#{flags}\n", v4, v5, v6, v7, v8);
  }
LABEL_6:
  self->_invalidateCalled = 1;
  self->_unsigned int invalidateFlags = v8;
  if ((v8 & 3) == 0)
  {
    uint64_t v11 = NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated", *(uint64_t *)&a3, v3, v4, v5, v6, v7, v12);
    [(CUAudioPlayer *)self _abortRequestsWithError:v11];
  }
  [(CUAudioPlayer *)self _invalidated];
}

- (void)invalidateWithFlags:(unsigned int)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__CUAudioPlayer_invalidateWithFlags___block_invoke;
  v4[3] = &unk_1E55BF088;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __37__CUAudioPlayer_invalidateWithFlags___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateWithFlags:*(unsigned int *)(a1 + 40)];
}

- (void)_activate
{
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUAudioPlayer _activate]", 0x1Eu, (uint64_t)"Activate %#{flags}\n", v2, v3, v4, v5, self->_flags);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  playRequests = self->_playRequests;
  self->_playRequests = v8;

  uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  preparedRequests = self->_preparedRequests;
  self->_preparedRequests = v10;

  objc_storeStrong((id *)&self->_selfRef, self);
  uint64_t v12 = [(Class)getAVAudioSessionClass[0]() sharedInstance];
  audioSession = self->_audioSession;
  self->_audioSession = v12;

  unsigned int enableSmartRouting = self->_enableSmartRouting;
  if (enableSmartRouting)
  {
    id v15 = self->_audioSession;
    id v54 = 0;
    char v16 = [(AVAudioSession *)v15 setEligibleForBTSmartRoutingConsideration:enableSmartRouting == 1 error:&v54];
    id v24 = v54;
    if ((v16 & 1) == 0)
    {
      id v25 = self->_ucat;
      if (v25->var0 <= 90)
      {
        if (v25->var0 != -1)
        {
LABEL_9:
          uint64_t v26 = self->_enableSmartRouting;
          if (v26 > 2) {
            uint64_t v27 = "?";
          }
          else {
            uint64_t v27 = off_1E55BD8B8[v26];
          }
          v51 = NSPrintF((uint64_t)"%{error}", v17, v18, v19, v20, v21, v22, v23, (uint64_t)v24);
          LogPrintF((uint64_t)v25, (uint64_t)"-[CUAudioPlayer _activate]", 0x5Au, (uint64_t)"### AudioSession Smart Routing failed: option=%s, error=%@", v28, v29, v30, v31, (uint64_t)v27);

          goto LABEL_15;
        }
        if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au))
        {
          id v25 = self->_ucat;
          goto LABEL_9;
        }
      }
    }
LABEL_15:
  }
  v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v33 = getAVAudioSessionInterruptionNotification[0]();
  [v32 addObserver:self selector:sel_audioSessionInterrupted_ name:v33 object:self->_audioSession];

  unint64_t v34 = ((unint64_t)self->_flags >> 2) & 1;
  v35 = self->_audioSession;
  v36 = getAVAudioSessionCategoryAmbient[0]();
  id v53 = 0;
  LOBYTE(v35) = [(AVAudioSession *)v35 setCategory:v36 withOptions:v34 error:&v53];
  id v37 = v53;

  if ((v35 & 1) == 0)
  {
    v42 = self->_ucat;
    if (v42->var0 <= 90)
    {
      if (v42->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v42, 0x5Au)) {
          goto LABEL_21;
        }
        v42 = self->_ucat;
      }
      LogPrintF((uint64_t)v42, (uint64_t)"-[CUAudioPlayer _activate]", 0x5Au, (uint64_t)"### AudioSession setCategory failed: %{error}\n", v38, v39, v40, v41, (uint64_t)v37);
    }
  }
LABEL_21:
  v43 = self->_audioSession;
  id v52 = v37;
  BOOL v44 = [(AVAudioSession *)v43 setActive:1 error:&v52];
  id v45 = v52;

  if (!v44)
  {
    v50 = self->_ucat;
    if (v50->var0 <= 90)
    {
      if (v50->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v50, 0x5Au)) {
          goto LABEL_26;
        }
        v50 = self->_ucat;
      }
      LogPrintF((uint64_t)v50, (uint64_t)"-[CUAudioPlayer _activate]", 0x5Au, (uint64_t)"### AudioSession setActive failed: %{error}\n", v46, v47, v48, v49, (uint64_t)v45);
    }
  }
LABEL_26:
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__CUAudioPlayer_activate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__CUAudioPlayer_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_applyChannelAssignments:(id)a3
{
  id v4 = a3;
  id v22 = v4;
  if (self->_channel)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = [v22 numberOfChannels];
    if (v6)
    {
      uint64_t v7 = v6;
      do
      {
        [v5 addObject:self->_channel];
        --v7;
      }
      while (v7);
    }
    ucat = self->_ucat;
    if (ucat->var0 >= 31) {
      goto LABEL_13;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
        goto LABEL_13;
      }
      ucat = self->_ucat;
    }
    uint64_t v9 = [(AVAudioSessionChannelDescription *)self->_channel owningPortUID];
    uint64_t v21 = [(AVAudioSessionChannelDescription *)self->_channel channelName];
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUAudioPlayer _applyChannelAssignments:]", 0x1Eu, (uint64_t)"Applying channel: portUID=%@, channelName=%@", v10, v11, v12, v13, (uint64_t)v9);

LABEL_13:
    [v22 setChannelAssignments:v5];

    goto LABEL_16;
  }
  uint64_t v14 = [v4 channelAssignments];

  if (!v14) {
    goto LABEL_16;
  }
  uint64_t v19 = self->_ucat;
  if (v19->var0 <= 30)
  {
    if (v19->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v19, 0x1Eu)) {
        goto LABEL_15;
      }
      uint64_t v19 = self->_ucat;
    }
    LogPrintF((uint64_t)v19, (uint64_t)"-[CUAudioPlayer _applyChannelAssignments:]", 0x1Eu, (uint64_t)"Applying channel: nil", v15, v16, v17, v18, v20);
  }
LABEL_15:
  [v22 setChannelAssignments:0];
LABEL_16:
}

- (BOOL)setPortUID:(id)a3 channelName:(id)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v10 = [(Class)getAVAudioSessionClass[0]() sharedInstance];
  uint64_t v11 = [v10 currentRoute];
  uint64_t v12 = [v11 outputs];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v46;
    uint64_t v39 = v12;
    id v40 = v8;
    v36 = a5;
    uint64_t v37 = *(void *)v46;
    uint64_t v38 = self;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v46 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v18 = [v17 UID];
        int v19 = [v18 isEqual:v8];

        if (v19)
        {
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          uint64_t v20 = [v17 channels];
          uint64_t v21 = [v20 countByEnumeratingWithState:&v41 objects:v49 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v42;
            while (2)
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v42 != v23) {
                  objc_enumerationMutation(v20);
                }
                id v25 = *(void **)(*((void *)&v41 + 1) + 8 * j);
                uint64_t v26 = [v25 channelName];
                int v27 = [v26 isEqual:v9];

                if (v27)
                {
                  objc_storeStrong((id *)&v38->_channel, v25);

                  BOOL v33 = 1;
                  id v8 = v40;
                  goto LABEL_21;
                }
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v41 objects:v49 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }

          uint64_t v12 = v39;
          id v8 = v40;
          uint64_t v15 = v37;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v45 objects:v50 count:16];
      a5 = v36;
    }
    while (v14);
  }

  if (a5)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960591, (uint64_t)"Port/channel not found", v28, v29, v30, v31, v32, v35);
    BOOL v33 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v33 = 0;
  }
LABEL_21:

  return v33;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CC268;
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
  v4.super_class = (Class)CUAudioPlayer;
  [(CUAudioPlayer *)&v4 dealloc];
}

- (CUAudioPlayer)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUAudioPlayer;
  uint64_t v2 = [(CUAudioPlayer *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v3->_ucat = (LogCategory *)&gLogCategory_CUAudioPlayer;
    objc_super v4 = v3;
  }

  return v3;
}

@end