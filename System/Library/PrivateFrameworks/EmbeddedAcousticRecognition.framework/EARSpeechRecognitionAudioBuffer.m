@interface EARSpeechRecognitionAudioBuffer
@end

@implementation EARSpeechRecognitionAudioBuffer

uint64_t __55___EARSpeechRecognitionAudioBuffer_addAudioSampleData___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 40))
  {
    uint64_t v1 = result;
    [*(id *)(result + 40) bytes];
    [*(id *)(v1 + 40) length];
    v2 = *(uint64_t (**)(void))(**(void **)(*(void *)(v1 + 32) + 8) + 16);
    return v2();
  }
  return result;
}

uint64_t __44___EARSpeechRecognitionAudioBuffer_endAudio__block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 32) + 8) + 32))(*(void *)(*(void *)(a1 + 32) + 8));
  *(unsigned char *)(*(void *)(a1 + 32) + 41) = 1;
  return result;
}

uint64_t __63___EARSpeechRecognitionAudioBuffer_triggerServerSideEndPointer__block_invoke(uint64_t a1)
{
  (*(void (**)(void))(**(void **)(*(void *)(a1 + 32) + 8) + 48))(*(void *)(*(void *)(a1 + 32)
                                                                                                + 8));
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 32) + 8) + 32))(*(void *)(*(void *)(a1 + 32) + 8));
  *(unsigned char *)(*(void *)(a1 + 32) + 41) = 1;
  return result;
}

void __53___EARSpeechRecognitionAudioBuffer_cancelRecognition__block_invoke(uint64_t a1)
{
  (*(void (**)(void))(**(void **)(*(void *)(a1 + 32) + 8) + 32))(*(void *)(*(void *)(a1 + 32)
                                                                                                + 8));
  *(unsigned char *)(*(void *)(a1 + 32) + 41) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained cancelRecognition];
}

uint64_t __53___EARSpeechRecognitionAudioBuffer_stopAudioDecoding__block_invoke(uint64_t a1)
{
  (*(void (**)(void))(**(void **)(*(void *)(a1 + 32) + 8) + 56))(*(void *)(*(void *)(a1 + 32)
                                                                                                + 8));
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 32) + 8) + 32))(*(void *)(*(void *)(a1 + 32) + 8));
  *(unsigned char *)(*(void *)(a1 + 32) + 41) = 1;
  return result;
}

void __57___EARSpeechRecognitionAudioBuffer__setUnderlyingBuffer___block_invoke(void *a1)
{
  (*(void (**)(void))(**(void **)(a1[4] + 8) + 32))(*(void *)(a1[4] + 8));
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  v5 = *(std::__shared_weak_count **)(v2 + 16);
  *(void *)(v2 + 8) = v3;
  *(void *)(v2 + 16) = v4;
  if (v5)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
}

double __57___EARSpeechRecognitionAudioBuffer_bufferedAudioDuration__block_invoke(uint64_t a1)
{
  double result = (*(float (**)(void))(**(void **)(*(void *)(a1 + 32) + 8) + 64))(*(void *)(*(void *)(a1 + 32) + 8));
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

double __57___EARSpeechRecognitionAudioBuffer_consumedAudioDuration__block_invoke(uint64_t a1)
{
  double result = (*(float (**)(void))(**(void **)(*(void *)(a1 + 32) + 8) + 72))(*(void *)(*(void *)(a1 + 32) + 8));
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __72___EARSpeechRecognitionAudioBuffer_packetArrivalTimestampFromAudioTime___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void, float))(**(void **)(*(void *)(a1 + 32) + 8) + 80))(*(void *)(*(void *)(a1 + 32) + 8), *(float *)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end