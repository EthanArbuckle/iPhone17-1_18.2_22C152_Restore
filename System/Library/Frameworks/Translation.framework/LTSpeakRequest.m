@interface LTSpeakRequest
@end

@implementation LTSpeakRequest

uint64_t __37___LTSpeakRequest__withHandlerQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53___LTSpeakRequest__startTranslationWithService_done___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __53___LTSpeakRequest__startTranslationWithService_done___block_invoke_2;
    v8[3] = &unk_2651DC0C8;
    objc_copyWeak(&v12, (id *)(a1 + 40));
    id v9 = v5;
    id v10 = v6;
    id v11 = *(id *)(a1 + 32);
    [WeakRetained _withHandlerQueue:v8];

    objc_destroyWeak(&v12);
  }
}

void __53___LTSpeakRequest__startTranslationWithService_done___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    [WeakRetained setOutputFileURL:*(void *)(a1 + 32)];
    uint64_t v3 = v4[17];
    if (v3) {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id WeakRetained = v4;
  }
}

void __44___LTSpeakRequest_ttsAudioStarted_duration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [WeakRetained audioStartHandler];

    id WeakRetained = v5;
    if (v3)
    {
      v4 = [v5 audioStartHandler];
      v4[2](v4, *(void *)(a1 + 32), *(double *)(a1 + 48));

      id WeakRetained = v5;
    }
  }
}

@end