@interface WFSpeakTextActionOperation
- (NSMutableArray)completionHandlers;
- (NSProgress)progress;
- (OS_dispatch_queue)queue;
- (WFSpeakTextActionOperation)init;
- (WFSpeechSynthesizer)synthesizer;
- (void)addCompletionHandlerIfRunning:(id)a3;
- (void)callCompletionHandlersWithError:(id)a3;
- (void)cancel;
- (void)cleanupSpeechSynthesizer;
- (void)setProgress:(id)a3;
- (void)speakTextUsingSynthesizer:(id)a3 voice:(id)a4 rate:(float)a5 pitch:(float)a6;
- (void)speechSynthesizer:(id)a3 didFailSpeakingUtterance:(id)a4 error:(id)a5;
- (void)speechSynthesizer:(id)a3 didFinishSpeakingUtterance:(id)a4;
- (void)speechSynthesizer:(id)a3 willSpeakRangeOfUtterance:(_NSRange)a4 utterance:(id)a5;
@end

@implementation WFSpeakTextActionOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_synthesizer, 0);
  objc_destroyWeak((id *)&self->_progress);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (WFSpeechSynthesizer)synthesizer
{
  return self->_synthesizer;
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)progress
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progress);
  return (NSProgress *)WeakRetained;
}

- (void)addCompletionHandlerIfRunning:(id)a3
{
  id v4 = a3;
  v5 = [(WFSpeakTextActionOperation *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__WFSpeakTextActionOperation_addCompletionHandlerIfRunning___block_invoke;
  v7[3] = &unk_264E5EE18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__WFSpeakTextActionOperation_addCompletionHandlerIfRunning___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) synthesizer];

  if (v2)
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 24);
    if (!v3)
    {
      uint64_t v4 = objc_opt_new();
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = v4;

      v3 = *(void **)(*(void *)(a1 + 32) + 24);
    }
    id v8 = _Block_copy(*(const void **)(a1 + 40));
    [v3 addObject:v8];
  }
  else
  {
    v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v7();
  }
}

- (void)callCompletionHandlersWithError:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(WFSpeakTextActionOperation *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)[(NSMutableArray *)self->_completionHandlers copy];
  completionHandlers = self->_completionHandlers;
  self->_completionHandlers = 0;

  objc_storeWeak((id *)&self->_progress, 0);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)cleanupSpeechSynthesizer
{
  v3 = [(WFSpeakTextActionOperation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [getAVAudioSessionClass() sharedInstance];
  [v4 setActive:0 withOptions:1 error:0];

  synthesizer = self->_synthesizer;
  self->_synthesizer = 0;
}

- (void)speechSynthesizer:(id)a3 didFailSpeakingUtterance:(id)a4 error:(id)a5
{
  id v6 = a5;
  v7 = [(WFSpeakTextActionOperation *)self queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__WFSpeakTextActionOperation_speechSynthesizer_didFailSpeakingUtterance_error___block_invoke;
  v9[3] = &unk_264E5DED8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

uint64_t __79__WFSpeakTextActionOperation_speechSynthesizer_didFailSpeakingUtterance_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cleanupSpeechSynthesizer];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 callCompletionHandlersWithError:v3];
}

- (void)speechSynthesizer:(id)a3 didFinishSpeakingUtterance:(id)a4
{
  uint64_t v5 = [(WFSpeakTextActionOperation *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__WFSpeakTextActionOperation_speechSynthesizer_didFinishSpeakingUtterance___block_invoke;
  block[3] = &unk_264E5EE70;
  block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __75__WFSpeakTextActionOperation_speechSynthesizer_didFinishSpeakingUtterance___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cleanupSpeechSynthesizer];
  v2 = *(void **)(a1 + 32);
  return [v2 callCompletionHandlersWithError:0];
}

- (void)speechSynthesizer:(id)a3 willSpeakRangeOfUtterance:(_NSRange)a4 utterance:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = [(WFSpeakTextActionOperation *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__WFSpeakTextActionOperation_speechSynthesizer_willSpeakRangeOfUtterance_utterance___block_invoke;
  block[3] = &unk_264E58E00;
  block[4] = self;
  void block[5] = location;
  block[6] = length;
  dispatch_async(v8, block);
}

void __84__WFSpeakTextActionOperation_speechSynthesizer_willSpeakRangeOfUtterance_utterance___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48) + *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) progress];
  [v2 setCompletedUnitCount:v1];
}

- (void)cancel
{
  uint64_t v3 = [(WFSpeakTextActionOperation *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__WFSpeakTextActionOperation_cancel__block_invoke;
  block[3] = &unk_264E5EE70;
  block[4] = self;
  dispatch_async(v3, block);
}

void __36__WFSpeakTextActionOperation_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  objc_storeWeak((id *)(*(void *)(a1 + 32) + 8), 0);
  id v4 = [*(id *)(a1 + 32) synthesizer];
  [v4 stop];
}

- (void)speakTextUsingSynthesizer:(id)a3 voice:(id)a4 rate:(float)a5 pitch:(float)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [(WFSpeakTextActionOperation *)self queue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __73__WFSpeakTextActionOperation_speakTextUsingSynthesizer_voice_rate_pitch___block_invoke;
  v15[3] = &unk_264E5E3B0;
  v15[4] = self;
  id v16 = v10;
  id v17 = v11;
  float v18 = a5;
  float v19 = a6;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, v15);
}

void __73__WFSpeakTextActionOperation_speakTextUsingSynthesizer_voice_rate_pitch___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) length];
  uint64_t v3 = [*(id *)(a1 + 32) progress];
  [v3 setTotalUnitCount:v2];

  id v4 = objc_alloc_init(WFSpeechSynthesizer);
  [(WFSpeechSynthesizer *)v4 setDelegate:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v4;
  v7 = v4;

  [(WFSpeechSynthesizer *)v7 speakUtterance:*(void *)(a1 + 40) usingVoice:*(void *)(a1 + 48) rate:*(float *)(a1 + 56) pitch:*(float *)(a1 + 60)];
}

- (WFSpeakTextActionOperation)init
{
  v9.receiver = self;
  v9.super_class = (Class)WFSpeakTextActionOperation;
  uint64_t v2 = [(WFSpeakTextActionOperation *)&v9 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    id v4 = dispatch_get_global_queue(21, 0);
    dispatch_queue_t v5 = dispatch_queue_create_with_target_V2("com.apple.shortcuts.action.speaktext", v3, v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

@end