@interface PKAnalyticsSession
- (PKAnalyticsSession)init;
- (void)_sendSessionAnalyticsMainThread;
- (void)endSessionAndSendAnalytics;
- (void)incrementStrokeCount;
- (void)incrementTextLineStraighteningCount;
- (void)incrementUndoCount;
@end

@implementation PKAnalyticsSession

- (PKAnalyticsSession)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKAnalyticsSession;
  result = [(PKAnalyticsSession *)&v3 init];
  if (result)
  {
    result->_undosPerSession = 0;
    result->_strokesPerSession = 0;
    result->_textLineStraighteningPerSession = 0;
  }
  return result;
}

- (void)_sendSessionAnalyticsMainThread
{
  if (a1)
  {
    v2 = +[PKCanvasSessionStatisticsManager sharedStatisticsManager]();
    -[PKCanvasSessionStatisticsManager endSession]((uint64_t)v2);

    uint64_t v3 = a1[2];
    if (v3 >= 1)
    {
      uint64_t v4 = a1[1];
      v5 = [MEMORY[0x1E4F28B50] mainBundle];
      v6 = [v5 bundleIdentifier];

      v7 = +[PKPencilStatisticsManager allowedBundleIDFromBundleID:v6];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __53__PKAnalyticsSession__sendSessionAnalyticsMainThread__block_invoke;
      v10[3] = &unk_1E64CAA90;
      uint64_t v12 = v4;
      uint64_t v13 = v3;
      id v11 = v7;
      id v8 = v7;
      +[PKHoverSettings checkIfHoverIsEnabled:v10];
    }
    v9 = +[PKStatisticsManager sharedStatisticsManager]();
    -[PKStatisticsManager recordTextLineStraighteningPerSession:Undos:]((uint64_t)v9);

    a1[1] = 0;
    a1[2] = 0;
    a1[3] = 0;
  }
}

void __53__PKAnalyticsSession__sendSessionAnalyticsMainThread__block_invoke(uint64_t a1, uint64_t a2)
{
  +[PKStatisticsManager sharedStatisticsManager]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordNumberOfUndos:numberOfStrokes:showEffectsEnabled:shadowEnabled:bundleID:]((uint64_t)v4, *(void *)(a1 + 40), *(void *)(a1 + 48), a2, 0, *(void **)(a1 + 32));
}

- (void)endSessionAndSendAnalytics
{
  if (a1)
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      -[PKAnalyticsSession _sendSessionAnalyticsMainThread](a1);
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__PKAnalyticsSession_endSessionAndSendAnalytics__block_invoke;
      block[3] = &unk_1E64C61C0;
      block[4] = a1;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __48__PKAnalyticsSession_endSessionAndSendAnalytics__block_invoke(uint64_t a1)
{
}

- (void)incrementUndoCount
{
  if (a1)
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      ++a1[1];
    }
    else
    {
      objc_initWeak(&location, a1);
      v2[0] = MEMORY[0x1E4F143A8];
      v2[1] = 3221225472;
      v2[2] = __40__PKAnalyticsSession_incrementUndoCount__block_invoke;
      v2[3] = &unk_1E64C5998;
      objc_copyWeak(&v3, &location);
      dispatch_async(MEMORY[0x1E4F14428], v2);
      objc_destroyWeak(&v3);
      objc_destroyWeak(&location);
    }
  }
}

void __40__PKAnalyticsSession_incrementUndoCount__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    ++WeakRetained[1];
  }
}

- (void)incrementStrokeCount
{
  if (a1)
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      ++a1[2];
    }
    else
    {
      objc_initWeak(&location, a1);
      v2[0] = MEMORY[0x1E4F143A8];
      v2[1] = 3221225472;
      v2[2] = __42__PKAnalyticsSession_incrementStrokeCount__block_invoke;
      v2[3] = &unk_1E64C5998;
      objc_copyWeak(&v3, &location);
      dispatch_async(MEMORY[0x1E4F14428], v2);
      objc_destroyWeak(&v3);
      objc_destroyWeak(&location);
    }
  }
}

void __42__PKAnalyticsSession_incrementStrokeCount__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    ++WeakRetained[2];
  }
}

- (void)incrementTextLineStraighteningCount
{
  if (a1)
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      ++a1[3];
    }
    else
    {
      objc_initWeak(&location, a1);
      v2[0] = MEMORY[0x1E4F143A8];
      v2[1] = 3221225472;
      v2[2] = __57__PKAnalyticsSession_incrementTextLineStraighteningCount__block_invoke;
      v2[3] = &unk_1E64C5998;
      objc_copyWeak(&v3, &location);
      dispatch_async(MEMORY[0x1E4F14428], v2);
      objc_destroyWeak(&v3);
      objc_destroyWeak(&location);
    }
  }
}

void __57__PKAnalyticsSession_incrementTextLineStraighteningCount__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    ++WeakRetained[3];
  }
}

@end