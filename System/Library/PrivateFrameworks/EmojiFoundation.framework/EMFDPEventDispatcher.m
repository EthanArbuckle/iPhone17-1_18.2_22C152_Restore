@interface EMFDPEventDispatcher
- (EMFDPEventDispatcher)init;
- (EMFDPEventDispatcher)initWithReportingDelegate:(id)a3;
- (void)didUseEmoji:(id)a3 usageSource:(unint64_t)a4 completionHandler:(id)a5;
- (void)didUseEmoji:(id)a3 usageSource:(unint64_t)a4 replacementContext:(id)a5 searchQuery:(id)a6 resultPosition:(id)a7 numberSearchQueriesRun:(id)a8 wasPositiveEngagement:(BOOL)a9;
- (void)didUseEmoji:(id)a3 usageSource:(unint64_t)a4 replacementContext:(id)a5 searchQuery:(id)a6 resultPosition:(id)a7 numberSearchQueriesRun:(id)a8 wasPositiveEngagement:(BOOL)a9 completionHandler:(id)a10;
@end

@implementation EMFDPEventDispatcher

- (EMFDPEventDispatcher)init
{
  return [(EMFDPEventDispatcher *)self initWithReportingDelegate:0];
}

- (EMFDPEventDispatcher)initWithReportingDelegate:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMFDPEventDispatcher;
  v6 = [(EMFDPEventDispatcher *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_reportingDelegate, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.EmojiFoundation.DifferentialPrivacyRecording", 0);
    reportingBackgroundQueue = v7->_reportingBackgroundQueue;
    v7->_reportingBackgroundQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (void)didUseEmoji:(id)a3 usageSource:(unint64_t)a4 replacementContext:(id)a5 searchQuery:(id)a6 resultPosition:(id)a7 numberSearchQueriesRun:(id)a8 wasPositiveEngagement:(BOOL)a9
{
  LOBYTE(v9) = a9;
  [(EMFDPEventDispatcher *)self didUseEmoji:a3 usageSource:a4 replacementContext:a5 searchQuery:a6 resultPosition:a7 numberSearchQueriesRun:a8 wasPositiveEngagement:v9 completionHandler:0];
}

- (void)didUseEmoji:(id)a3 usageSource:(unint64_t)a4 replacementContext:(id)a5 searchQuery:(id)a6 resultPosition:(id)a7 numberSearchQueriesRun:(id)a8 wasPositiveEngagement:(BOOL)a9 completionHandler:(id)a10
{
  id v15 = a3;
  id v36 = a5;
  id v35 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a10;
  v19 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  v20 = v19;
  error[1] = v19;
  if (!v19) {
    goto LABEL_20;
  }
  error[0] = 0;
  CFTypeRef v21 = SecTaskCopyValueForEntitlement(v19, @"com.apple.private.biome.read-write", error);
  CFTypeRef v41 = v21;
  v33 = self;
  if (error[0])
  {
    CFRelease(error[0]);
    BOOL v22 = 0;
  }
  else
  {
    if (!v21)
    {
      BOOL v22 = 0;
      goto LABEL_16;
    }
    CFTypeID v23 = CFGetTypeID(v21);
    if (v23 != CFArrayGetTypeID() || CFArrayGetCount((CFArrayRef)v21) < 1)
    {
      BOOL v22 = 0;
      goto LABEL_15;
    }
    for (CFIndex i = 0; ; ++i)
    {
      CFIndex Count = CFArrayGetCount((CFArrayRef)v21);
      BOOL v22 = i < Count;
      if (i >= Count) {
        break;
      }
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v21, i);
      CFTypeID v27 = CFGetTypeID(ValueAtIndex);
      if (v27 == CFStringGetTypeID()
        && CFEqual(ValueAtIndex, @"Emoji.Engagement"))
      {
        break;
      }
    }
  }
  if (v21) {
LABEL_15:
  }
    CFRelease(v21);
LABEL_16:
  CFRelease(v20);
  if (v22)
  {
    LOBYTE(v32) = a9;
    v28 = [[EMFBiomeEmojiUsageRecorder alloc] initWithEmoji:v15 usageSource:a4 replacementContext:v36 searchQuery:v35 resultPosition:v16 numberSearchQueriesRun:v17 wasPositiveEngagement:v32];
    v29 = v28;
    if (v33->_reportingDelegate) {
      -[EMFDPRecorder setDelegate:](v28, "setDelegate:");
    }
    reportingBackgroundQueue = v33->_reportingBackgroundQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __157__EMFDPEventDispatcher_didUseEmoji_usageSource_replacementContext_searchQuery_resultPosition_numberSearchQueriesRun_wasPositiveEngagement_completionHandler___block_invoke;
    block[3] = &unk_1E61A9840;
    v38 = v29;
    id v40 = v18;
    id v39 = v15;
    v31 = v29;
    dispatch_async(reportingBackgroundQueue, block);
  }
LABEL_20:
}

uint64_t __157__EMFDPEventDispatcher_didUseEmoji_usageSource_replacementContext_searchQuery_resultPosition_numberSearchQueriesRun_wasPositiveEngagement_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) report];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)didUseEmoji:(id)a3 usageSource:(unint64_t)a4 completionHandler:(id)a5
{
  LOBYTE(v5) = 1;
  [(EMFDPEventDispatcher *)self didUseEmoji:a3 usageSource:a4 replacementContext:0 searchQuery:0 resultPosition:0 numberSearchQueriesRun:0 wasPositiveEngagement:v5 completionHandler:a5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingBackgroundQueue, 0);
  objc_storeStrong((id *)&self->_reportingDelegate, 0);
}

@end