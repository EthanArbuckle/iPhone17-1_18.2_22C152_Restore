@interface WKContentView(WKInteractionPreview)
- (uint64_t)continueContextMenuInteraction:;
- (void)continueContextMenuInteraction:;
@end

@implementation WKContentView(WKInteractionPreview)

- (void)continueContextMenuInteraction:
{
  v2 = *(unsigned int **)(a1 + 40);
  *(void *)(a1 + 40) = 0;
  if (v2) {
    WTF::ThreadSafeRefCounted<WebKit::CompletionHandlerCallChecker,(WTF::DestructionThread)0>::deref(v2);
  }
  v3 = *(const void **)(a1 + 32);

  _Block_release(v3);
}

- (uint64_t)continueContextMenuInteraction:
{
  uint64_t result = WebKit::CompletionHandlerCallChecker::completionHandlerHasBeenCalled(*(SEL **)(a1 + 40));
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(unsigned char *)(*(void *)(a1 + 40) + 24) = 1;
    v4 = *(uint64_t (**)(void))(v3 + 16);
    return v4();
  }
  return result;
}

@end