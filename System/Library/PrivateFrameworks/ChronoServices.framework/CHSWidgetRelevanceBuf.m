@interface CHSWidgetRelevanceBuf
@end

@implementation CHSWidgetRelevanceBuf

void __61___CHSWidgetRelevanceBuf_deepCopyUsingBufferBuilder_changes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v3, "setAttributeKey:");
  }
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v3, "setIntentReference:");
  }
}

@end