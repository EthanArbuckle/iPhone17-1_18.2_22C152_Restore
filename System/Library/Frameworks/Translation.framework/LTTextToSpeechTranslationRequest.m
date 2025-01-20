@interface LTTextToSpeechTranslationRequest
@end

@implementation LTTextToSpeechTranslationRequest

void __71___LTTextToSpeechTranslationRequest__startTranslationWithService_done___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v2 = [a1[5] copy];
    v3 = (void *)*((void *)WeakRetained + 16);
    *((void *)WeakRetained + 16) = v2;

    objc_storeStrong((id *)WeakRetained + 15, a1[4]);
    v4 = (void *)*((void *)WeakRetained + 15);
    v5 = [WeakRetained requestContext];
    v6 = [WeakRetained text];
    [v4 startTextToSpeechTranslationWithContext:v5 text:v6];
  }
}

@end