@interface MFMailMessage
@end

@implementation MFMailMessage

uint64_t __93__MFMailMessage_NSItemProvider__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 writableTypeIdentifiersForItemProvider];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93__MFMailMessage_NSItemProvider__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E5F7C7A0;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "ef_any:", v6);

  return v4;
}

uint64_t __93__MFMailMessage_NSItemProvider__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = [MEMORY[0x1E4F442D8] typeWithIdentifier:a2];
  uint64_t v4 = [v3 conformsToType:*(void *)(a1 + 32)];

  return v4;
}

@end