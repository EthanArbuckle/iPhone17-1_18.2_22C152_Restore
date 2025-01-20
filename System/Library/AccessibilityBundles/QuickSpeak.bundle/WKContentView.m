@interface WKContentView
@end

@implementation WKContentView

uint64_t __103__WKContentView_QSExtras__axWaitForSpeakSelectionRectResultsForGuanularity_atSelectionOffset_wordText___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  v3 = (void *)a1[4];
  if (v2 == 1)
  {
    [v3 accessibilitySetQSWordRects:0];
    uint64_t v4 = a1[7];
    v5 = (void *)a1[4];
    uint64_t v6 = a1[5];
    return [v5 _accessibilityRetrieveRectsAtSelectionOffset:v4 withText:v6];
  }
  else
  {
    uint64_t v8 = a1[7];
    return objc_msgSend(v3, "_accessibilityRetrieveRectsEnclosingSelectionOffset:withGranularity:", v8);
  }
}

@end