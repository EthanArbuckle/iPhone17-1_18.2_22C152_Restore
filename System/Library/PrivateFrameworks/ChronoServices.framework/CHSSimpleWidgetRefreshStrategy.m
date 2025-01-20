@interface CHSSimpleWidgetRefreshStrategy
@end

@implementation CHSSimpleWidgetRefreshStrategy

void *__64___CHSSimpleWidgetRefreshStrategy_appendDescriptionToFormatter___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (*(void *)(v1 + 8))
  {
    v2 = (void *)result[5];
  }
  else if (*(unsigned char *)(v1 + 16))
  {
    v2 = (void *)result[5];
  }
  else
  {
    if (!*(unsigned char *)(v1 + 17)) {
      return result;
    }
    v2 = (void *)result[5];
  }
  return (id)objc_msgSend(v2, "appendObject:withName:");
}

@end