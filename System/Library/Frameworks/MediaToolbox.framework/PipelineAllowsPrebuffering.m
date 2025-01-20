@interface PipelineAllowsPrebuffering
@end

@implementation PipelineAllowsPrebuffering

void __ruleNoConsumerConnected_and_PipelineAllowsPrebuffering_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFTypeRef cf = 0;
  uint64_t v4 = *(void *)(a3 + 8);
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = *(void (**)(uint64_t, __CFString *, void, CFTypeRef *))(v6 + 48);
  if (v7)
  {
    v7(v4, @"DownstreamConsumer", *MEMORY[0x1E4F1CF80], &cf);
    CFTypeRef v8 = cf;
    if (cf)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      CFRelease(v8);
    }
  }
}

@end