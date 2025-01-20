@interface PKSelectionStatisticsManager
+ (id)sharedStatisticsManager;
- (void)_endSelectionSession;
- (void)_recordSelectionSession:(id)a3;
- (void)logEndSelectionSessionIfNecessary;
- (void)logScrollEventWithContentOffset:(CGPoint)a3;
- (void)logSelectionAction:(int64_t)a3;
- (void)recordDidMakeSelectionWithType:(int64_t)a3;
- (void)recordLassoSelectionEventWithContentType:(int64_t)a3;
- (void)recordSmartSelectionEventWithType:(int64_t)a3 contentType:(int64_t)a4 gestureInvoked:(int64_t)a5;
@end

@implementation PKSelectionStatisticsManager

void __55__PKSelectionStatisticsManager_sharedStatisticsManager__block_invoke()
{
  v0 = objc_alloc_init(PKSelectionStatisticsManager);
  v1 = (void *)qword_1EB3C6350;
  qword_1EB3C6350 = (uint64_t)v0;
}

- (void)logScrollEventWithContentOffset:(CGPoint)a3
{
  double x = self->_lastContentOffset.x;
  double y = self->_lastContentOffset.y;
  self->_lastContentOffset = a3;
  selectionSession = self->_selectionSession;
  if (selectionSession)
  {
    if (sqrt((a3.y - y) * (a3.y - y) + (a3.x - x) * (a3.x - x)) > 1000.0)
    {
      v7 = [(PKSelectionStatisticsSession *)selectionSession lastActionTaken];
      int v8 = [v7 isEqualToString:@"selectionActionTypeNone"];

      if (v8)
      {
        [(PKSelectionStatisticsManager *)self _endSelectionSession];
      }
    }
  }
}

+ (id)sharedStatisticsManager
{
  if (_MergedGlobals_162 != -1) {
    dispatch_once(&_MergedGlobals_162, &__block_literal_global_89);
  }
  v2 = (void *)qword_1EB3C6350;

  return v2;
}

- (void)recordDidMakeSelectionWithType:(int64_t)a3
{
  v3 = @"smartSelection";
  if (!a3) {
    v3 = @"lasso";
  }
  v4 = v3;
  v5 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"selection.selectionType"];
  v7 = v4;
  v6 = v4;
  AnalyticsSendEventLazy();
}

id __63__PKSelectionStatisticsManager_recordDidMakeSelectionWithType___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v4 = @"selectionType";
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)recordLassoSelectionEventWithContentType:(int64_t)a3
{
  if (self->_selectionSession)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__endSelectionSession object:0];
  }
  else
  {
    v5 = objc_alloc_init(PKSelectionStatisticsSession);
    selectionSession = self->_selectionSession;
    self->_selectionSession = v5;
  }
  [(PKSelectionStatisticsSession *)self->_selectionSession logGesture:6 selectionType:0 contentType:a3];
  [(PKSelectionStatisticsManager *)self performSelector:sel__endSelectionSession withObject:0 afterDelay:180.0];
  if ((unint64_t)(a3 - 1) > 5) {
    v7 = @"unknown";
  }
  else {
    v7 = off_1E64CB3F8[a3 - 1];
  }
  int v8 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"selection.lassoSelection"];
  AnalyticsSendEventLazy();
}

id __73__PKSelectionStatisticsManager_recordLassoSelectionEventWithContentType___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v4 = @"lassoSelectionContents";
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)recordSmartSelectionEventWithType:(int64_t)a3 contentType:(int64_t)a4 gestureInvoked:(int64_t)a5
{
  if (self->_selectionSession)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__endSelectionSession object:0];
  }
  else
  {
    v9 = objc_alloc_init(PKSelectionStatisticsSession);
    selectionSession = self->_selectionSession;
    self->_selectionSession = v9;
  }
  [(PKSelectionStatisticsSession *)self->_selectionSession logGesture:a5 selectionType:a3 contentType:a4];
  [(PKSelectionStatisticsManager *)self performSelector:sel__endSelectionSession withObject:0 afterDelay:180.0];
  if ((unint64_t)(a3 - 1) > 5) {
    v11 = @"lasso";
  }
  else {
    v11 = off_1E64CB3C8[a3 - 1];
  }
  if ((unint64_t)(a4 - 1) > 5) {
    v12 = @"unknown";
  }
  else {
    v12 = off_1E64CB3F8[a4 - 1];
  }
  if ((unint64_t)(a5 - 1) > 5) {
    v13 = @"none";
  }
  else {
    v13 = off_1E64CB398[a5 - 1];
  }
  v14 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"selection.smartSelection"];
  AnalyticsSendEventLazy();
}

id __93__PKSelectionStatisticsManager_recordSmartSelectionEventWithType_contentType_gestureInvoked___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  long long v1 = *(_OWORD *)(a1 + 32);
  v4[0] = @"smartSelectionLevel";
  v4[1] = @"smartSelectionContents";
  long long v5 = v1;
  v4[2] = @"gestureInvoked";
  uint64_t v6 = *(void *)(a1 + 48);
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v5 forKeys:v4 count:3];

  return v2;
}

- (void)logSelectionAction:(int64_t)a3
{
  if (self->_selectionSession)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__endSelectionSession object:0];
    selectionSession = self->_selectionSession;
    [(PKSelectionStatisticsSession *)selectionSession logSelectionAction:a3];
  }
  else
  {
    uint64_t v6 = objc_alloc_init(PKSelectionStatisticsSession);
    uint64_t v7 = self->_selectionSession;
    self->_selectionSession = v6;

    [(PKSelectionStatisticsSession *)self->_selectionSession logSelectionAction:a3];
    [(PKSelectionStatisticsManager *)self performSelector:sel__endSelectionSession withObject:0 afterDelay:180.0];
  }
}

- (void)logEndSelectionSessionIfNecessary
{
  if (self->_selectionSession) {
    [(PKSelectionStatisticsManager *)self _endSelectionSession];
  }
}

- (void)_endSelectionSession
{
  if (self->_selectionSession)
  {
    -[PKSelectionStatisticsManager _recordSelectionSession:](self, "_recordSelectionSession:");
    selectionSession = self->_selectionSession;
    self->_selectionSession = 0;
  }
}

- (void)_recordSelectionSession:(id)a3
{
  v21[7] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [v3 lastSelectionType] - 1;
  if (v4 > 5) {
    long long v5 = @"lasso";
  }
  else {
    long long v5 = off_1E64CB3C8[v4];
  }
  uint64_t v6 = [v3 lastContentType];
  if ((unint64_t)(v6 - 1) > 5) {
    uint64_t v7 = @"unknown";
  }
  else {
    uint64_t v7 = off_1E64CB3F8[v6 - 1];
  }
  int v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v21[0] = &unk_1F200E9A0;
  v20[0] = @"sessionCount";
  v20[1] = @"timeSpentEditingSelection";
  v9 = NSNumber;
  [v3 timeSpentSelecting];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  v21[1] = v10;
  v21[2] = v5;
  v20[2] = @"selectionType";
  v20[3] = @"selectionContents";
  v21[3] = v7;
  v20[4] = @"selectionEditCount";
  v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "selectionGestureCount"));
  v21[4] = v11;
  v20[5] = @"selectionActionType";
  v12 = [v3 lastSignificantActionTaken];
  v21[5] = v12;
  v20[6] = @"deselected";
  v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "numberOfTimesSelectionWasClearedInASession"));
  v21[6] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:7];

  [v8 addEntriesFromDictionary:v14];
  v15 = [v3 selectionGestureDictionary];
  [v8 addEntriesFromDictionary:v15];

  v16 = [v3 selectionActionDictionary];
  [v8 addEntriesFromDictionary:v16];

  v17 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"selection.session"];
  v19 = v8;
  id v18 = v8;
  AnalyticsSendEventLazy();
}

id __56__PKSelectionStatisticsManager__recordSelectionSession___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void).cxx_destruct
{
}

@end