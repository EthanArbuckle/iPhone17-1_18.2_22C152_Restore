@interface LUILogViewerController
- (BOOL)_performSearch:(id)a3;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isFetchingLogs;
- (BOOL)isStreaming;
- (BOOL)logFilterViewControllerShouldAllowTextEditing:(id)a3;
- (BOOL)outsideKeyboardIsShowing;
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (LUILogContentViewController)logContentViewController;
- (LUILogFilterViewController)logFilterViewController;
- (LUILogViewerAssistiveTouch)assistiveTouch;
- (LUILogViewerController)init;
- (LUILogViewerControllerDelegate)delegate;
- (LUILogViewerView)logViewerView;
- (NSArray)highlightRanges;
- (NSArray)predicates;
- (NSDate)firstLogDate;
- (NSDate)lastLogDate;
- (NSMutableArray)logMinutesArray;
- (NSMutableSet)logMinutesSet;
- (UIPageViewController)pageViewController;
- (UIPanGestureRecognizer)panGesture;
- (UIView)baseView;
- (_NSRange)_searchRangeForDate:(id)a3 inText:(id)a4;
- (double)logInterval;
- (id)_attributedLogStringFrom:(id)a3 fontSize:(double)a4;
- (id)_getLogsFromDate:(id)a3 predicate:(id)a4 duplicateHandler:(id)a5;
- (id)orderedViewControllers;
- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (int64_t)currentHighlightIndex;
- (void)_cleanupHighlight;
- (void)_cleanupLogs;
- (void)_decreaseCurrentHighlightIndex;
- (void)_dismissLogViewerView;
- (void)_grabLogAndUpdateTextView;
- (void)_increaseCurrentHighlightIndex;
- (void)_moveElementsToView:(id)a3;
- (void)_presentLogViewerView;
- (void)_setupInitialHighlight;
- (void)_startStreamLog;
- (void)_stopStreaming;
- (void)_updateHighlight;
- (void)_updateLogFromLastTime;
- (void)dealloc;
- (void)handlePan:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)logContentViewController:(id)a3 didSelectDateForLog:(id)a4;
- (void)logContentViewController:(id)a3 didSelectLogOptionWithTimeInterval:(double)a4;
- (void)logFilterViewController:(id)a3 didAddPredicates:(id)a4;
- (void)logFilterViewController:(id)a3 didDeletePredicate:(id)a4;
- (void)logFilterViewControllerApplyButtonTapped:(id)a3;
- (void)logViewerLeftCaretButtonTapped:(id)a3;
- (void)logViewerRightCaretButtonTapped:(id)a3;
- (void)logViewerViewClearButtontapped:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)setAssistiveTouch:(id)a3;
- (void)setBaseView:(id)a3;
- (void)setCurrentHighlightIndex:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstLogDate:(id)a3;
- (void)setHighlightRanges:(id)a3;
- (void)setIsFetchingLogs:(BOOL)a3;
- (void)setIsStreaming:(BOOL)a3;
- (void)setLastLogDate:(id)a3;
- (void)setLogContentViewController:(id)a3;
- (void)setLogFilterViewController:(id)a3;
- (void)setLogInterval:(double)a3;
- (void)setLogMinutesArray:(id)a3;
- (void)setLogMinutesSet:(id)a3;
- (void)setLogViewerView:(id)a3;
- (void)setOutsideKeyboardIsShowing:(BOOL)a3;
- (void)setPageViewController:(id)a3;
- (void)setPanGesture:(id)a3;
- (void)setPredicates:(id)a3;
- (void)setup;
- (void)showLogContentPage;
- (void)showLogFilterPage;
@end

@implementation LUILogViewerController

- (void)setup
{
  v3 = [MEMORY[0x263F1C408] sharedApplication];
  v4 = [v3 delegate];
  v5 = [v4 window];
  [(LUILogViewerController *)self setBaseView:v5];

  v6 = [(LUILogViewerController *)self baseView];
  [(LUILogViewerController *)self _moveElementsToView:v6];

  CGAffineTransformMakeScale(&v10, 0.0, 0.0);
  v7 = [(LUILogViewerController *)self assistiveTouch];
  CGAffineTransform v9 = v10;
  [v7 setTransform:&v9];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __31__LUILogViewerController_setup__block_invoke;
  v8[3] = &unk_265097790;
  v8[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:0 delay:v8 usingSpringWithDamping:0 initialSpringVelocity:0.2 options:0.0 animations:0.6 completion:1.0];
}

void __31__LUILogViewerController_setup__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) assistiveTouch];
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v3[0] = *MEMORY[0x263F000D0];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v1 setTransform:v3];
}

- (LUILogViewerController)init
{
  v12.receiver = self;
  v12.super_class = (Class)LUILogViewerController;
  long long v2 = [(LUILogViewerController *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    predicates = v2->_predicates;
    v2->_predicates = (NSArray *)v3;

    uint64_t v5 = objc_opt_new();
    logMinutesSet = v2->_logMinutesSet;
    v2->_logMinutesSet = (NSMutableSet *)v5;

    uint64_t v7 = objc_opt_new();
    logMinutesArray = v2->_logMinutesArray;
    v2->_logMinutesArray = (NSMutableArray *)v7;

    [(LUILogViewerController *)v2 addObserver:v2 forKeyPath:@"predicates" options:1 context:0];
    CGAffineTransform v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v2 selector:sel_keyboardWillShow_ name:*MEMORY[0x263F1D488] object:0];

    CGAffineTransform v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v2 selector:sel_keyboardWillHide_ name:*MEMORY[0x263F1D480] object:0];
  }
  return v2;
}

- (void)dealloc
{
  [(LUILogViewerController *)self removeObserver:self forKeyPath:@"predicates"];
  v3.receiver = self;
  v3.super_class = (Class)LUILogViewerController;
  [(LUILogViewerController *)&v3 dealloc];
}

- (void)_grabLogAndUpdateTextView
{
  [(LUILogViewerController *)self logInterval];
  if (v3 > 0.0)
  {
    v4 = [(LUILogViewerController *)self logContentViewController];
    uint64_t v5 = [v4 textView];
    [v5 setText:0];

    v6 = [(LUILogViewerController *)self logContentViewController];
    [v6 showSpinner:1];

    uint64_t v7 = [(LUILogViewerController *)self logContentViewController];
    v8 = [v7 view];
    [v8 setUserInteractionEnabled:0];

    CGAffineTransform v9 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__LUILogViewerController__grabLogAndUpdateTextView__block_invoke;
    block[3] = &unk_265097790;
    block[4] = self;
    dispatch_async(v9, block);
  }
}

void __51__LUILogViewerController__grabLogAndUpdateTextView__block_invoke(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 32);
  double v3 = (void *)MEMORY[0x263EFF910];
  [v2 logInterval];
  uint64_t v5 = [v3 dateWithTimeIntervalSinceNow:-v4];
  v6 = [*(id *)(a1 + 32) predicates];
  if ([v6 count])
  {
    uint64_t v7 = (void *)MEMORY[0x263F08730];
    v8 = [*(id *)(a1 + 32) predicates];
    CGAffineTransform v9 = [v7 orPredicateWithSubpredicates:v8];
    CGAffineTransform v10 = [v2 _getLogsFromDate:v5 predicate:v9 duplicateHandler:0];
  }
  else
  {
    CGAffineTransform v10 = [v2 _getLogsFromDate:v5 predicate:0 duplicateHandler:0];
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__LUILogViewerController__grabLogAndUpdateTextView__block_invoke_2;
  v12[3] = &unk_2650977B8;
  v12[4] = *(void *)(a1 + 32);
  id v13 = v10;
  id v11 = v10;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

void __51__LUILogViewerController__grabLogAndUpdateTextView__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  double v3 = [*(id *)(a1 + 32) logContentViewController];
  double v4 = [v3 textView];
  [v4 setAttributedText:v2];

  uint64_t v5 = [*(id *)(a1 + 32) logContentViewController];
  [v5 showSpinner:0];

  id v7 = [*(id *)(a1 + 32) logContentViewController];
  v6 = [v7 view];
  [v6 setUserInteractionEnabled:1];
}

- (id)_getLogsFromDate:(id)a3 predicate:(id)a4 duplicateHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(LUILogViewerController *)self setIsFetchingLogs:1];
  id v11 = objc_opt_new();
  objc_super v12 = [MEMORY[0x263F52748] localStore];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  id v35 = 0;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __70__LUILogViewerController__getLogsFromDate_predicate_duplicateHandler___block_invoke;
  v29[3] = &unk_2650977E0;
  v29[4] = &v30;
  [v12 prepareWithCompletionHandler:v29];
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  id v14 = objc_alloc(MEMORY[0x263F52750]);
  uint64_t v15 = [v14 initWithSource:v31[5]];
  v16 = (void *)_getLogsFromDate_predicate_duplicateHandler__stream;
  _getLogsFromDate_predicate_duplicateHandler__stream = v15;

  [(id)_getLogsFromDate_predicate_duplicateHandler__stream setFlags:21];
  [(id)_getLogsFromDate_predicate_duplicateHandler__stream setFilterPredicate:v9];
  v17 = (void *)_getLogsFromDate_predicate_duplicateHandler__stream;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __70__LUILogViewerController__getLogsFromDate_predicate_duplicateHandler___block_invoke_2;
  v26[3] = &unk_265097808;
  v26[4] = self;
  id v18 = v10;
  id v28 = v18;
  id v19 = v11;
  id v27 = v19;
  [v17 setEventHandler:v26];
  v20 = (void *)_getLogsFromDate_predicate_duplicateHandler__stream;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __70__LUILogViewerController__getLogsFromDate_predicate_duplicateHandler___block_invoke_3;
  v24[3] = &unk_265097830;
  v21 = v13;
  v25 = v21;
  [v20 setInvalidationHandler:v24];
  [(id)_getLogsFromDate_predicate_duplicateHandler__stream activateStreamFromDate:v8];
  dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
  [(LUILogViewerController *)self setIsFetchingLogs:0];
  v22 = (void *)[v19 copy];

  _Block_object_dispose(&v30, 8);

  return v22;
}

void __70__LUILogViewerController__getLogsFromDate_predicate_duplicateHandler___block_invoke(uint64_t a1, void *a2)
{
}

void __70__LUILogViewerController__getLogsFromDate_predicate_duplicateHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v27 = a2;
  if ([v27 type] == 1024)
  {
    double v3 = [*(id *)(a1 + 32) firstLogDate];

    if (!v3)
    {
      double v4 = [v27 date];
      [*(id *)(a1 + 32) setFirstLogDate:v4];
    }
    uint64_t v5 = [*(id *)(a1 + 32) _attributedLogStringFrom:v27 fontSize:16.0];
    v6 = v5;
    uint64_t v7 = *(void *)(a1 + 48);
    if (!v7
      || ([v5 string],
          id v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8),
          v8,
          (v9 & 1) == 0))
    {
      [*(id *)(a1 + 40) appendAttributedString:v6];
      id v10 = [v27 date];
      [*(id *)(a1 + 32) setLastLogDate:v10];

      id v11 = [*(id *)(a1 + 32) logMinutesSet];
      objc_super v12 = NSNumber;
      dispatch_semaphore_t v13 = [v27 date];
      [v13 timeIntervalSinceReferenceDate];
      uint64_t v15 = [v12 numberWithDouble:floor(v14)];
      char v16 = [v11 containsObject:v15];

      if ((v16 & 1) == 0)
      {
        v17 = [*(id *)(a1 + 32) logMinutesSet];
        id v18 = NSNumber;
        id v19 = [v27 date];
        [v19 timeIntervalSinceReferenceDate];
        v21 = [v18 numberWithDouble:floor(v20)];
        [v17 addObject:v21];

        v22 = [*(id *)(a1 + 32) logMinutesArray];
        v23 = NSNumber;
        v24 = [v27 date];
        [v24 timeIntervalSinceReferenceDate];
        v26 = [v23 numberWithDouble:floor(v25)];
        [v22 addObject:v26];
      }
    }
  }
}

intptr_t __70__LUILogViewerController__getLogsFromDate_predicate_duplicateHandler___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_attributedLogStringFrom:(id)a3 fontSize:(double)a4
{
  v58[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = objc_opt_new();
  uint64_t v56 = *MEMORY[0x263F1C240];
  uint64_t v7 = v56;
  id v8 = [MEMORY[0x263F1C550] whiteColor];
  v58[0] = v8;
  uint64_t v57 = *MEMORY[0x263F1C238];
  uint64_t v9 = v57;
  id v10 = [MEMORY[0x263F1C658] systemFontOfSize:a4];
  v58[1] = v10;
  v49 = [NSDictionary dictionaryWithObjects:v58 forKeys:&v56 count:2];

  v46 = [MEMORY[0x263F1C550] logCyanColor];
  v54[1] = v9;
  v55[0] = v46;
  v54[0] = v7;
  id v11 = [MEMORY[0x263F1C658] systemFontOfSize:a4];
  v55[1] = v11;
  objc_super v12 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];

  id v13 = objc_alloc(MEMORY[0x263F086A0]);
  double v14 = NSString;
  uint64_t v15 = [v5 date];
  char v16 = secondStringWithDate(v15);
  v17 = [v14 stringWithFormat:@"%@.%06d   ", v16, *(unsigned int *)(objc_msgSend(v5, "unixDate") + 8)];
  uint64_t v18 = [v13 initWithString:v17 attributes:v12];

  v48 = (void *)v18;
  [v6 appendAttributedString:v18];
  id v19 = objc_alloc(MEMORY[0x263F086A0]);
  double v20 = v5;
  v21 = objc_msgSend(NSString, "stringWithFormat:", @"%d   ", objc_msgSend(v5, "processIdentifier"));
  uint64_t v22 = [v19 initWithString:v21 attributes:v49];

  v47 = (void *)v22;
  [v6 appendAttributedString:v22];
  v23 = [MEMORY[0x263F1C550] logPurpleColor];

  v52[1] = v9;
  v53[0] = v23;
  v52[0] = v7;
  v24 = [MEMORY[0x263F1C658] systemFontOfSize:a4];
  v53[1] = v24;
  double v25 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];

  id v26 = objc_alloc(MEMORY[0x263F086A0]);
  id v27 = [v20 process];
  id v28 = (void *)[v26 initWithString:v27 attributes:v25];

  [v6 appendAttributedString:v28];
  v29 = objc_msgSend(objc_alloc(MEMORY[0x263F086A0]), "initWithString:attributes:", @": ("), v49;
  uint64_t v30 = v6;
  [v6 appendAttributedString:v29];
  v31 = [v20 sender];

  if (v31)
  {
    uint64_t v32 = [MEMORY[0x263F1C550] logYellowColor];

    v50[1] = v9;
    v51[0] = v32;
    v50[0] = v7;
    v33 = [MEMORY[0x263F1C658] systemFontOfSize:a4];
    v51[1] = v33;
    uint64_t v34 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];

    id v35 = objc_alloc(MEMORY[0x263F086A0]);
    v36 = [v20 sender];
    v37 = (void *)[v35 initWithString:v36 attributes:v34];

    [v30 appendAttributedString:v37];
    double v25 = (void *)v34;
    v23 = (void *)v32;
  }
  v38 = v30;
  id v39 = objc_alloc(MEMORY[0x263F086A0]);
  v40 = NSString;
  v41 = [v20 composedMessage];
  v42 = [v40 stringWithFormat:@" %@\n\n"], v41);
  v43 = (void *)[v39 initWithString:v42 attributes:v49];

  [v38 appendAttributedString:v43];
  v44 = (void *)[v38 copy];

  return v44;
}

- (void)_startStreamLog
{
  double v3 = objc_opt_new();
  [(LUILogViewerController *)self setLastLogDate:v3];

  [(LUILogViewerController *)self setIsStreaming:1];
  double v4 = [(LUILogViewerController *)self logViewerView];
  [v4 switchClearButtonTitle:0];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__LUILogViewerController__startStreamLog__block_invoke;
  v6[3] = &unk_265097858;
  v6[4] = self;
  id v5 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:1 repeats:v6 block:2.0];
  [v5 fire];
}

void __41__LUILogViewerController__startStreamLog__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isStreaming]) {
    [*(id *)(a1 + 32) _updateLogFromLastTime];
  }
  else {
    [v3 invalidate];
  }
}

- (void)_stopStreaming
{
  [(LUILogViewerController *)self setIsStreaming:0];
  id v3 = [(LUILogViewerController *)self logViewerView];
  [v3 switchClearButtonTitle:1];
}

- (void)_updateLogFromLastTime
{
  id v3 = [(LUILogViewerController *)self logContentViewController];
  double v4 = [v3 textView];
  [v4 contentOffset];
  double v6 = v5;
  uint64_t v7 = [(LUILogViewerController *)self logContentViewController];
  id v8 = [v7 textView];
  [v8 contentSize];
  double v10 = v9;
  id v11 = [(LUILogViewerController *)self logContentViewController];
  objc_super v12 = [v11 textView];
  [v12 frame];
  BOOL v14 = v6 >= v10 - v13 + -50.0;

  uint64_t v15 = [(LUILogViewerController *)self logContentViewController];
  char v16 = [v15 textView];
  v17 = [v16 text];

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  uint64_t v18 = dispatch_get_global_queue(0, 0);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __48__LUILogViewerController__updateLogFromLastTime__block_invoke;
  v20[3] = &unk_2650978D0;
  id v21 = v17;
  uint64_t v22 = v24;
  v20[4] = self;
  BOOL v23 = v14;
  id v19 = v17;
  dispatch_async(v18, v20);

  _Block_object_dispose(v24, 8);
}

void __48__LUILogViewerController__updateLogFromLastTime__block_invoke(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  double v4 = [v3 lastLogDate];
  double v5 = [*(id *)(a1 + 32) predicates];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x263F08730];
    v1 = [*(id *)(a1 + 32) predicates];
    id v8 = [v7 orPredicateWithSubpredicates:v1];
  }
  else
  {
    id v8 = 0;
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__LUILogViewerController__updateLogFromLastTime__block_invoke_2;
  v16[3] = &unk_265097880;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v12;
  long long v17 = v12;
  double v10 = [v3 _getLogsFromDate:v4 predicate:v8 duplicateHandler:v16];
  if (v6)
  {
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__LUILogViewerController__updateLogFromLastTime__block_invoke_3;
  block[3] = &unk_2650978A8;
  block[4] = *(void *)(a1 + 32);
  id v14 = v10;
  char v15 = *(unsigned char *)(a1 + 56);
  id v11 = v10;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __48__LUILogViewerController__updateLogFromLastTime__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    char v3 = [*(id *)(a1 + 32) containsString:a2];
    uint64_t result = 1;
    if (v3) {
      return result;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return 0;
}

void __48__LUILogViewerController__updateLogFromLastTime__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) logContentViewController];
  char v3 = [v2 textView];
  double v4 = [v3 textStorage];
  [v4 appendAttributedString:*(void *)(a1 + 40)];

  if (*(unsigned char *)(a1 + 48))
  {
    id v9 = [*(id *)(a1 + 32) logContentViewController];
    double v5 = [v9 textView];
    uint64_t v6 = [*(id *)(a1 + 32) logContentViewController];
    uint64_t v7 = [v6 textView];
    id v8 = [v7 text];
    objc_msgSend(v5, "scrollRangeToVisible:", objc_msgSend(v8, "lengthOfBytesUsingEncoding:", 4) - 1, 0);
  }
}

- (void)_cleanupLogs
{
  [(LUILogViewerController *)self setLogInterval:0.0];
  char v3 = [(LUILogViewerController *)self logContentViewController];
  double v4 = [v3 textView];
  [v4 setText:0];

  double v5 = [(LUILogViewerController *)self logContentViewController];
  [v5 clearScreenshots];

  uint64_t v6 = [(LUILogViewerController *)self logViewerView];
  [v6 resetSearchResultLabel];

  [(LUILogViewerController *)self setHighlightRanges:MEMORY[0x263EFFA68]];
  [(LUILogViewerController *)self setCurrentHighlightIndex:-1];
  [(LUILogViewerController *)self setFirstLogDate:0];
  [(LUILogViewerController *)self setLastLogDate:0];
  uint64_t v7 = [(LUILogViewerController *)self logMinutesSet];
  [v7 removeAllObjects];

  id v8 = [(LUILogViewerController *)self logMinutesArray];
  [v8 removeAllObjects];
}

- (void)keyboardWillShow:(id)a3
{
  id v29 = a3;
  double v4 = [(LUILogViewerController *)self assistiveTouch];
  [v4 alpha];
  double v6 = v5;

  if (v6 != 0.0)
  {
    [(LUILogViewerController *)self setOutsideKeyboardIsShowing:1];
    uint64_t v7 = [v29 userInfo];
    id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F1D428]];
    id v9 = v8;
    if (v8)
    {
      [v8 CGRectValue];
      double v11 = v10;
      long long v12 = [(LUILogViewerController *)self assistiveTouch];
      [v12 frame];
      double v14 = v13;
      CGFloat v16 = v15;
      double v18 = v17;
      double v20 = v19;

      v31.origin.x = v14;
      v31.origin.y = v16;
      v31.size.width = v18;
      v31.size.height = v20;
      double v21 = v11 + CGRectGetMaxY(v31);
      uint64_t v22 = [MEMORY[0x263F1C920] mainScreen];
      [v22 bounds];
      double v24 = v23;

      if (v21 > v24)
      {
        char v25 = [MEMORY[0x263F1C920] mainScreen];
        [v25 bounds];
        double v27 = v26 - v11 - v20;

        id v28 = [(LUILogViewerController *)self assistiveTouch];
        objc_msgSend(v28, "setFrame:", v14, v27, v18, v20);
      }
    }
  }
}

- (void)keyboardWillHide:(id)a3
{
  double v4 = [(LUILogViewerController *)self assistiveTouch];
  [v4 alpha];
  if (v5 == 0.0)
  {
    BOOL v6 = [(LUILogViewerController *)self outsideKeyboardIsShowing];

    if (!v6) {
      return;
    }
  }
  else
  {
  }

  [(LUILogViewerController *)self setOutsideKeyboardIsShowing:0];
}

- (void)_presentLogViewerView
{
  uint64_t v3 = [(LUILogViewerController *)self outsideKeyboardIsShowing] ^ 1;
  double v4 = [(LUILogViewerController *)self logViewerView];
  double v5 = [v4 searchBar];
  [v5 setUserInteractionEnabled:v3];

  BOOL v6 = [(LUILogViewerController *)self assistiveTouch];
  [v6 setAlpha:0.0];

  uint64_t v7 = [(LUILogViewerController *)self logViewerView];
  [v7 frame];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;

  CGFloat v16 = [(LUILogViewerController *)self assistiveTouch];
  [v16 frame];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  char v25 = [(LUILogViewerController *)self logViewerView];
  objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  double v26 = [(LUILogViewerController *)self logViewerView];
  double v27 = [v26 superview];

  if (!v27)
  {
    id v28 = [(LUILogViewerController *)self baseView];
    id v29 = [(LUILogViewerController *)self logViewerView];
    [v28 addSubview:v29];
  }
  uint64_t v30 = [(LUILogViewerController *)self logViewerView];
  [v30 setAlpha:1.0];

  CGRect v31 = [MEMORY[0x263F15760] animationWithKeyPath:@"cornerRadius"];
  uint64_t v32 = NSNumber;
  v33 = [(LUILogViewerController *)self assistiveTouch];
  uint64_t v34 = [v33 layer];
  [v34 cornerRadius];
  id v35 = objc_msgSend(v32, "numberWithDouble:");
  [v31 setFromValue:v35];

  [v31 setToValue:&unk_26F3E8448];
  [v31 setDuration:0.200000003];
  v36 = [(LUILogViewerController *)self logViewerView];
  v37 = [v36 layer];
  [v37 addAnimation:v31 forKey:0];

  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __47__LUILogViewerController__presentLogViewerView__block_invoke;
  v39[3] = &unk_2650978F8;
  v39[4] = self;
  v39[5] = v9;
  v39[6] = v11;
  v39[7] = v13;
  v39[8] = v15;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __47__LUILogViewerController__presentLogViewerView__block_invoke_2;
  v38[3] = &unk_265097920;
  v38[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:0x10000 delay:v39 usingSpringWithDamping:v38 initialSpringVelocity:0.200000003 options:0.0 animations:0.8 completion:1.0];
}

void __47__LUILogViewerController__presentLogViewerView__block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) logViewerView];
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

void __47__LUILogViewerController__presentLogViewerView__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    double v3 = [*(id *)(a1 + 32) delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) delegate];
      [v5 logViewerControllerDidOpenLogViewer:*(void *)(a1 + 32)];
    }
  }
}

- (void)_dismissLogViewerView
{
  double v3 = [(LUILogViewerController *)self logViewerView];
  [v3 setAlpha:0.0];

  char v4 = objc_opt_new();
  id v5 = [MEMORY[0x263F1C550] blackColor];
  BOOL v6 = [v5 colorWithAlphaComponent:0.8];
  [v4 setBackgroundColor:v6];

  uint64_t v7 = [(LUILogViewerController *)self logViewerView];
  [v7 frame];
  objc_msgSend(v4, "setFrame:");

  uint64_t v8 = [(LUILogViewerController *)self assistiveTouch];
  uint64_t v9 = [v8 layer];
  [v9 cornerRadius];
  double v11 = v10;
  uint64_t v12 = [v4 layer];
  [v12 setCornerRadius:v11];

  uint64_t v13 = [(LUILogViewerController *)self baseView];
  [v13 addSubview:v4];

  uint64_t v14 = [MEMORY[0x263F15760] animationWithKeyPath:@"cornerRadius"];
  [v14 setFromValue:&unk_26F3E8448];
  uint64_t v15 = NSNumber;
  CGFloat v16 = [(LUILogViewerController *)self assistiveTouch];
  double v17 = [v16 layer];
  [v17 cornerRadius];
  double v18 = objc_msgSend(v15, "numberWithDouble:");
  [v14 setToValue:v18];

  [v14 setDuration:0.200000003];
  double v19 = [v4 layer];
  [v19 addAnimation:v14 forKey:0];

  double v20 = (void *)MEMORY[0x263F1CB60];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __47__LUILogViewerController__dismissLogViewerView__block_invoke;
  void v24[3] = &unk_2650977B8;
  id v25 = v4;
  double v26 = self;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __47__LUILogViewerController__dismissLogViewerView__block_invoke_2;
  v22[3] = &unk_265097948;
  v22[4] = self;
  id v23 = v25;
  id v21 = v25;
  [v20 animateWithDuration:0x10000 delay:v24 usingSpringWithDamping:v22 initialSpringVelocity:0.200000003 options:0.0 animations:0.8 completion:1.0];
}

void __47__LUILogViewerController__dismissLogViewerView__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) assistiveTouch];
  [v2 frame];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
}

void __47__LUILogViewerController__dismissLogViewerView__block_invoke_2(uint64_t a1, int a2)
{
  char v4 = [*(id *)(a1 + 32) assistiveTouch];
  [v4 setAlpha:1.0];

  [*(id *)(a1 + 40) removeFromSuperview];
  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) delegate];
      [v7 logViewerControllerDidCloseLogViewer:*(void *)(a1 + 32)];
    }
  }
}

- (void)showLogFilterPage
{
  v15[1] = *MEMORY[0x263EF8340];
  double v3 = [(LUILogViewerController *)self pageViewController];
  char v4 = [v3 viewControllers];
  id v5 = [v4 objectAtIndexedSubscript:0];
  char v6 = [(LUILogViewerController *)self logFilterViewController];

  if (v5 != v6)
  {
    id v7 = [(LUILogViewerController *)self pageViewController];
    uint64_t v8 = [v7 view];
    [v8 setUserInteractionEnabled:0];

    objc_initWeak(&location, self);
    uint64_t v9 = [(LUILogViewerController *)self pageViewController];
    double v10 = [(LUILogViewerController *)self logFilterViewController];
    v15[0] = v10;
    double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __43__LUILogViewerController_showLogFilterPage__block_invoke;
    v12[3] = &unk_265097970;
    objc_copyWeak(&v13, &location);
    [v9 setViewControllers:v11 direction:0 animated:1 completion:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __43__LUILogViewerController_showLogFilterPage__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v3 = [WeakRetained pageViewController];
  char v4 = [v3 view];
  [v4 setUserInteractionEnabled:1];

  if (a2)
  {
    id v5 = [WeakRetained logViewerView];
    [v5 highlightFilterButton:1];

    char v6 = [WeakRetained logViewerView];
    [v6 highlightLogButton:0];
  }
}

- (void)showLogContentPage
{
  v15[1] = *MEMORY[0x263EF8340];
  double v3 = [(LUILogViewerController *)self pageViewController];
  char v4 = [v3 viewControllers];
  id v5 = [v4 objectAtIndexedSubscript:0];
  char v6 = [(LUILogViewerController *)self logContentViewController];

  if (v5 != v6)
  {
    id v7 = [(LUILogViewerController *)self pageViewController];
    uint64_t v8 = [v7 view];
    [v8 setUserInteractionEnabled:0];

    objc_initWeak(&location, self);
    uint64_t v9 = [(LUILogViewerController *)self pageViewController];
    double v10 = [(LUILogViewerController *)self logContentViewController];
    v15[0] = v10;
    double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __44__LUILogViewerController_showLogContentPage__block_invoke;
    v12[3] = &unk_265097970;
    objc_copyWeak(&v13, &location);
    [v9 setViewControllers:v11 direction:1 animated:1 completion:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __44__LUILogViewerController_showLogContentPage__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v3 = [WeakRetained pageViewController];
  char v4 = [v3 view];
  [v4 setUserInteractionEnabled:1];

  if (a2)
  {
    id v5 = [WeakRetained logViewerView];
    [v5 highlightFilterButton:0];

    char v6 = [WeakRetained logViewerView];
    [v6 highlightLogButton:1];
  }
}

- (void)_moveElementsToView:(id)a3
{
  id v4 = a3;
  id v5 = [(LUILogViewerController *)self assistiveTouch];
  char v6 = [v5 superview];
  id v7 = [(LUILogViewerController *)self panGesture];
  [v6 removeGestureRecognizer:v7];

  uint64_t v8 = [(LUILogViewerController *)self assistiveTouch];
  [v8 removeFromSuperview];

  uint64_t v9 = [(LUILogViewerView *)self->_logViewerView superview];

  if (v9)
  {
    double v10 = [(LUILogViewerController *)self logViewerView];
    [v10 removeFromSuperview];

    double v11 = [(LUILogViewerController *)self assistiveTouch];
    [v4 addSubview:v11];

    uint64_t v12 = [(LUILogViewerController *)self panGesture];
    [v4 addGestureRecognizer:v12];

    id v14 = [(LUILogViewerController *)self logViewerView];
    objc_msgSend(v4, "addSubview:");
  }
  else
  {
    id v13 = [(LUILogViewerController *)self assistiveTouch];
    [v4 addSubview:v13];

    id v14 = [(LUILogViewerController *)self panGesture];
    objc_msgSend(v4, "addGestureRecognizer:");
  }
}

- (void)_increaseCurrentHighlightIndex
{
  unint64_t v3 = [(LUILogViewerController *)self currentHighlightIndex] + 1;
  id v4 = [(LUILogViewerController *)self highlightRanges];
  -[LUILogViewerController setCurrentHighlightIndex:](self, "setCurrentHighlightIndex:", v3 % [v4 count]);

  id v6 = [(LUILogViewerController *)self logViewerView];
  id v5 = [(LUILogViewerController *)self highlightRanges];
  objc_msgSend(v6, "updateSearchResultLabelWithTotalResult:currentIndex:", objc_msgSend(v5, "count"), -[LUILogViewerController currentHighlightIndex](self, "currentHighlightIndex") + 1);
}

- (void)_decreaseCurrentHighlightIndex
{
  int64_t v3 = [(LUILogViewerController *)self currentHighlightIndex];
  id v4 = [(LUILogViewerController *)self highlightRanges];
  unint64_t v5 = v3 + [v4 count] - 1;
  id v6 = [(LUILogViewerController *)self highlightRanges];
  -[LUILogViewerController setCurrentHighlightIndex:](self, "setCurrentHighlightIndex:", v5 % [v6 count]);

  id v8 = [(LUILogViewerController *)self logViewerView];
  id v7 = [(LUILogViewerController *)self highlightRanges];
  objc_msgSend(v8, "updateSearchResultLabelWithTotalResult:currentIndex:", objc_msgSend(v7, "count"), -[LUILogViewerController currentHighlightIndex](self, "currentHighlightIndex") + 1);
}

- (BOOL)_performSearch:(id)a3
{
  id v4 = a3;
  [(LUILogViewerController *)self _cleanupHighlight];
  unint64_t v5 = objc_opt_new();
  id v6 = [(LUILogViewerController *)self logContentViewController];
  id v7 = [v6 textView];
  id v8 = [v7 text];
  uint64_t v9 = [v8 lowercaseString];

  double v10 = [v4 lowercaseString];

  uint64_t v11 = [v9 rangeOfString:v10];
  if (v12)
  {
    uint64_t v13 = v11;
    uint64_t v14 = v12;
    do
    {
      uint64_t v15 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v13, v14);
      [v5 addObject:v15];

      uint64_t v13 = objc_msgSend(v9, "rangeOfString:options:range:locale:", v10, 0, v13 + v14, objc_msgSend(v9, "length") - (v13 + v14), 0);
      uint64_t v14 = v16;
    }
    while (v16);
  }
  uint64_t v17 = [v5 count];
  if (v17)
  {
    double v18 = (void *)[v5 copy];
    [(LUILogViewerController *)self setHighlightRanges:v18];

    [(LUILogViewerController *)self _increaseCurrentHighlightIndex];
    [(LUILogViewerController *)self _setupInitialHighlight];
  }

  return v17 != 0;
}

- (void)_setupInitialHighlight
{
  int64_t v3 = [(LUILogViewerController *)self logContentViewController];
  id v4 = [v3 textView];
  unint64_t v5 = [v4 textStorage];
  [v5 beginEditing];

  id v6 = [(LUILogViewerController *)self highlightRanges];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __48__LUILogViewerController__setupInitialHighlight__block_invoke;
  v21[3] = &unk_265097998;
  v21[4] = self;
  [v6 enumerateObjectsUsingBlock:v21];

  id v7 = [(LUILogViewerController *)self logContentViewController];
  id v8 = [v7 textView];
  uint64_t v9 = [v8 textStorage];
  [v9 endEditing];

  double v10 = [(LUILogViewerController *)self logContentViewController];
  uint64_t v11 = [v10 textView];
  [v11 becomeFirstResponder];

  uint64_t v12 = [(LUILogViewerController *)self highlightRanges];
  uint64_t v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", -[LUILogViewerController currentHighlightIndex](self, "currentHighlightIndex"));
  uint64_t v14 = [v13 rangeValue];
  uint64_t v16 = v15;

  uint64_t v17 = [(LUILogViewerController *)self logContentViewController];
  double v18 = [v17 textView];
  objc_msgSend(v18, "setSelectedRange:", v14, v16);

  double v19 = [(LUILogViewerController *)self logContentViewController];
  double v20 = [v19 textView];
  objc_msgSend(v20, "scrollRangeToVisible:", v14, v16);
}

void __48__LUILogViewerController__setupInitialHighlight__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 rangeValue];
  uint64_t v5 = v4;
  id v11 = [*(id *)(a1 + 32) logContentViewController];
  id v6 = [v11 textView];
  id v7 = [v6 textStorage];
  uint64_t v8 = *MEMORY[0x263F1C210];
  uint64_t v9 = [MEMORY[0x263F1C550] grayColor];
  double v10 = [v9 colorWithAlphaComponent:0.5];
  objc_msgSend(v7, "addAttribute:value:range:", v8, v10, v3, v5);
}

- (void)_updateHighlight
{
  uint64_t v3 = [(LUILogViewerController *)self highlightRanges];
  uint64_t v4 = objc_msgSend(v3, "objectAtIndexedSubscript:", -[LUILogViewerController currentHighlightIndex](self, "currentHighlightIndex"));
  uint64_t v5 = [v4 rangeValue];
  uint64_t v7 = v6;

  uint64_t v8 = [(LUILogViewerController *)self logContentViewController];
  uint64_t v9 = [v8 textView];
  [v9 becomeFirstResponder];

  double v10 = [(LUILogViewerController *)self logContentViewController];
  id v11 = [v10 textView];
  objc_msgSend(v11, "setSelectedRange:", v5, v7);

  id v13 = [(LUILogViewerController *)self logContentViewController];
  uint64_t v12 = [v13 textView];
  objc_msgSend(v12, "scrollRangeToVisible:", v5, v7);
}

- (void)_cleanupHighlight
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(LUILogViewerController *)self highlightRanges];

  if (v3)
  {
    uint64_t v4 = [(LUILogViewerController *)self logContentViewController];
    uint64_t v5 = [v4 textView];
    uint64_t v6 = [v5 textStorage];
    [v6 beginEditing];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = [(LUILogViewerController *)self highlightRanges];
    uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      uint64_t v10 = *MEMORY[0x263F1C210];
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = [*(id *)(*((void *)&v23 + 1) + 8 * v11) rangeValue];
          uint64_t v14 = v13;
          uint64_t v15 = [(LUILogViewerController *)self logContentViewController];
          uint64_t v16 = [v15 textView];
          uint64_t v17 = [v16 textStorage];
          objc_msgSend(v17, "removeAttribute:range:", v10, v12, v14);

          ++v11;
        }
        while (v8 != v11);
        uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }

    double v18 = [(LUILogViewerController *)self logContentViewController];
    double v19 = [v18 textView];
    double v20 = [v19 textStorage];
    [v20 endEditing];

    [(LUILogViewerController *)self setHighlightRanges:0];
    [(LUILogViewerController *)self setCurrentHighlightIndex:-1];
    id v21 = [(LUILogViewerController *)self logViewerView];
    [v21 resetSearchResultLabel];
  }
}

- (_NSRange)_searchRangeForDate:(id)a3 inText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = secondStringWithDate(v6);
  uint64_t v9 = [v7 rangeOfString:v8];
  uint64_t v11 = v10;

  if (!v11)
  {
    uint64_t v12 = [(LUILogViewerController *)self logMinutesArray];
    unint64_t v13 = [v12 count];

    if (v13 >= 2)
    {
      [v6 timeIntervalSinceReferenceDate];
      double v15 = v14;
      uint64_t v16 = [(LUILogViewerController *)self logMinutesArray];
      unint64_t v17 = [v16 count] - 1;

      if (v17 < 2)
      {
        uint64_t v18 = 0;
LABEL_13:
        long long v23 = [(LUILogViewerController *)self logMinutesArray];
        long long v24 = [v23 objectAtIndexedSubscript:v18];
        [v24 doubleValue];
        double v26 = v25;

        if (v26 >= v15)
        {
          CGRect v31 = (void *)MEMORY[0x263EFF910];
          uint64_t v32 = [(LUILogViewerController *)self logMinutesArray];
          v33 = [v32 objectAtIndexedSubscript:v18];
          [v33 doubleValue];
          uint64_t v34 = v31;
        }
        else
        {
          double v27 = [(LUILogViewerController *)self logMinutesArray];
          uint64_t v28 = [v27 objectAtIndexedSubscript:v17];
          [v28 doubleValue];
          double v30 = v29;

          if (v30 < v15)
          {
            uint64_t v9 = [v7 length] - 1;
            uint64_t v11 = 1;
            goto LABEL_21;
          }
          v36 = (void *)MEMORY[0x263EFF910];
          uint64_t v32 = [(LUILogViewerController *)self logMinutesArray];
          v33 = [v32 objectAtIndexedSubscript:v17];
          [v33 doubleValue];
          uint64_t v34 = v36;
        }
        v37 = objc_msgSend(v34, "dateWithTimeIntervalSinceReferenceDate:");
        v38 = secondStringWithDate(v37);
        uint64_t v9 = [v7 rangeOfString:v38];
        uint64_t v11 = v39;
      }
      else
      {
        uint64_t v18 = 0;
        while (1)
        {
          double v19 = [(LUILogViewerController *)self logMinutesArray];
          double v20 = [v19 objectAtIndexedSubscript:v18 + ((v17 - v18) >> 1)];
          [v20 doubleValue];
          double v22 = v21;

          if (v15 == v22) {
            break;
          }
          if (v22 > v15) {
            unint64_t v17 = v18 + ((v17 - v18) >> 1);
          }
          else {
            v18 += (v17 - v18) >> 1;
          }
          if (v18 + 1 >= v17) {
            goto LABEL_13;
          }
        }
        uint64_t v32 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v15];
        v33 = secondStringWithDate(v32);
        uint64_t v9 = [v7 rangeOfString:v33];
        uint64_t v11 = v35;
      }

      goto LABEL_21;
    }
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
LABEL_21:

  NSUInteger v40 = v9;
  NSUInteger v41 = v11;
  result.length = v41;
  result.id location = v40;
  return result;
}

- (LUILogViewerAssistiveTouch)assistiveTouch
{
  assistiveTouch = self->_assistiveTouch;
  if (!assistiveTouch)
  {
    uint64_t v4 = [LUILogViewerAssistiveTouch alloc];
    uint64_t v5 = [MEMORY[0x263F1C920] mainScreen];
    [v5 bounds];
    CGFloat v6 = CGRectGetWidth(v13) + -70.0;
    id v7 = [MEMORY[0x263F1C920] mainScreen];
    [v7 bounds];
    uint64_t v8 = -[LUILogViewerAssistiveTouch initWithFrame:](v4, "initWithFrame:", v6, CGRectGetHeight(v14) + -70.0, 70.0, 70.0);
    uint64_t v9 = self->_assistiveTouch;
    self->_assistiveTouch = v8;

    uint64_t v10 = [(LUILogViewerAssistiveTouch *)self->_assistiveTouch layer];
    [v10 setZPosition:3.40282347e38];

    [(LUILogViewerAssistiveTouch *)self->_assistiveTouch setAutoresizingMask:9];
    [(LUILogViewerAssistiveTouch *)self->_assistiveTouch addTarget:self action:sel_assistiveTouchButtonTapped_ forControlEvents:64];
    assistiveTouch = self->_assistiveTouch;
  }

  return assistiveTouch;
}

- (LUILogViewerView)logViewerView
{
  logViewerView = self->_logViewerView;
  if (!logViewerView)
  {
    uint64_t v4 = [MEMORY[0x263F1C920] mainScreen];
    [v4 bounds];
    double Height = CGRectGetHeight(v20);

    if (Height > 650.0) {
      double Height = 650.0;
    }
    CGFloat v6 = [LUILogViewerView alloc];
    id v7 = [MEMORY[0x263F1C920] mainScreen];
    [v7 bounds];
    CGFloat v8 = CGRectGetHeight(v21) - Height;
    uint64_t v9 = [MEMORY[0x263F1C920] mainScreen];
    [v9 bounds];
    uint64_t v10 = -[LUILogViewerView initWithFrame:](v6, "initWithFrame:", 0.0, v8, CGRectGetWidth(v22), Height);
    uint64_t v11 = self->_logViewerView;
    self->_logViewerView = v10;

    uint64_t v12 = [(LUILogViewerView *)self->_logViewerView layer];
    [v12 setZPosition:3.40282347e38];

    [(LUILogViewerView *)self->_logViewerView setAutoresizingMask:10];
    [(LUILogViewerView *)self->_logViewerView setDelegate:self];
    CGRect v13 = [(LUILogViewerController *)self pageViewController];
    CGRect v14 = [v13 view];

    double v15 = [(LUILogViewerView *)self->_logViewerView contentHolderView];
    [v15 frame];
    objc_msgSend(v14, "setFrame:");

    uint64_t v16 = [(LUILogViewerView *)self->_logViewerView contentHolderView];
    [v16 addSubview:v14];

    [v14 setAutoresizingMask:18];
    unint64_t v17 = [(LUILogViewerView *)self->_logViewerView searchBar];
    [v17 setDelegate:self];

    [(LUILogViewerView *)self->_logViewerView highlightLogButton:1];
    logViewerView = self->_logViewerView;
  }

  return logViewerView;
}

- (UIPageViewController)pageViewController
{
  v11[1] = *MEMORY[0x263EF8340];
  pageViewController = self->_pageViewController;
  if (!pageViewController)
  {
    uint64_t v4 = [[LUILogViewerPageViewController alloc] initWithTransitionStyle:1 navigationOrientation:0 options:0];
    uint64_t v5 = self->_pageViewController;
    self->_pageViewController = &v4->super;

    [(UIPageViewController *)self->_pageViewController setDataSource:self];
    [(UIPageViewController *)self->_pageViewController setDelegate:self];
    CGFloat v6 = self->_pageViewController;
    id v7 = [(LUILogViewerController *)self orderedViewControllers];
    CGFloat v8 = [v7 objectAtIndexedSubscript:0];
    v11[0] = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    [(UIPageViewController *)v6 setViewControllers:v9 direction:0 animated:0 completion:0];

    pageViewController = self->_pageViewController;
  }

  return pageViewController;
}

- (LUILogContentViewController)logContentViewController
{
  logContentViewController = self->_logContentViewController;
  if (!logContentViewController)
  {
    uint64_t v4 = (LUILogContentViewController *)objc_opt_new();
    uint64_t v5 = self->_logContentViewController;
    self->_logContentViewController = v4;

    [(LUILogContentViewController *)self->_logContentViewController setDelegate:self];
    logContentViewController = self->_logContentViewController;
  }

  return logContentViewController;
}

- (LUILogFilterViewController)logFilterViewController
{
  logFilterViewController = self->_logFilterViewController;
  if (!logFilterViewController)
  {
    uint64_t v4 = (LUILogFilterViewController *)objc_opt_new();
    uint64_t v5 = self->_logFilterViewController;
    self->_logFilterViewController = v4;

    [(LUILogFilterViewController *)self->_logFilterViewController setDelegate:self];
    logFilterViewController = self->_logFilterViewController;
  }

  return logFilterViewController;
}

- (UIPanGestureRecognizer)panGesture
{
  panGesture = self->_panGesture;
  if (!panGesture)
  {
    uint64_t v4 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x263F1C838]) initWithTarget:self action:sel_handlePan_];
    uint64_t v5 = self->_panGesture;
    self->_panGesture = v4;

    [(UIPanGestureRecognizer *)self->_panGesture setDelegate:self];
    panGesture = self->_panGesture;
  }

  return panGesture;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"predicates", a4, a5, a6))
  {
    id v7 = [(LUILogViewerController *)self predicates];
    uint64_t v8 = [v7 count];

    id v9 = [(LUILogViewerController *)self logContentViewController];
    [v9 enableTimeConsumingOptions:v8 != 0];
  }
}

- (void)handlePan:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 view];
  [v4 translationInView:v5];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [v4 state];
  if (v10 == 2)
  {
    double v13 = v7 + *(double *)&handlePan__originCenter_0;
    double v14 = v9 + *(double *)&handlePan__originCenter_1;
    id v33 = [(LUILogViewerController *)self assistiveTouch];
    objc_msgSend(v33, "setCenter:", v13, v14);
    goto LABEL_5;
  }
  if (v10 == 1)
  {
    id v33 = [(LUILogViewerController *)self assistiveTouch];
    [v33 center];
    handlePan__originCenter_0 = v11;
    handlePan__originCenter_1 = v12;
LABEL_5:

    return;
  }
  double v15 = [MEMORY[0x263F1C920] mainScreen];
  [v15 bounds];
  double Width = CGRectGetWidth(v36);

  unint64_t v17 = [MEMORY[0x263F1C920] mainScreen];
  [v17 bounds];
  double Height = CGRectGetHeight(v37);

  double v19 = [(LUILogViewerController *)self assistiveTouch];
  [v19 center];
  double v21 = v20;

  CGRect v22 = [(LUILogViewerController *)self assistiveTouch];
  [v22 center];
  double v24 = v23;

  double v25 = [(LUILogViewerController *)self assistiveTouch];
  [v25 frame];
  double v26 = CGRectGetWidth(v38) * 0.5;
  if (v24 >= Width * 0.5) {
    double v27 = Width - v26;
  }
  else {
    double v27 = v26;
  }

  uint64_t v28 = [(LUILogViewerController *)self assistiveTouch];
  [v28 frame];
  double v29 = CGRectGetHeight(v39) * 0.5;

  if (v29 >= v21) {
    double v21 = v29;
  }
  double v30 = [(LUILogViewerController *)self assistiveTouch];
  [v30 frame];
  double v31 = Height - CGRectGetHeight(v40) * 0.5;

  v34[1] = 3221225472;
  v34[0] = MEMORY[0x263EF8330];
  v34[2] = __36__LUILogViewerController_handlePan___block_invoke;
  v34[3] = &unk_2650979C0;
  if (v31 >= v21) {
    double v32 = v21;
  }
  else {
    double v32 = v31;
  }
  v34[4] = self;
  *(double *)&v34[5] = v27;
  *(double *)&v34[6] = v32;
  [MEMORY[0x263F1CB60] animateWithDuration:0x10000 delay:v34 usingSpringWithDamping:0 initialSpringVelocity:0.200000003 options:0.0 animations:0.8 completion:1.0];
}

void __36__LUILogViewerController_handlePan___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) assistiveTouch];
  objc_msgSend(v3, "setCenter:", v1, v2);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 view];
  [v4 locationInView:v5];
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  uint64_t v10 = [(LUILogViewerController *)self assistiveTouch];
  [v10 frame];
  v12.x = v7;
  v12.y = v9;
  LOBYTE(v4) = CGRectContainsPoint(v13, v12);

  return (char)v4;
}

- (void)logViewerViewClearButtontapped:(id)a3
{
  if ([(LUILogViewerController *)self isStreaming])
  {
    [(LUILogViewerController *)self _stopStreaming];
  }
  else if (![(LUILogViewerController *)self isFetchingLogs])
  {
    [(LUILogViewerController *)self _cleanupLogs];
    id v4 = [(LUILogViewerController *)self logContentViewController];
    [v4 showLogOptionsView];
  }
}

- (void)logViewerLeftCaretButtonTapped:(id)a3
{
  id v4 = [(LUILogViewerController *)self highlightRanges];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    [(LUILogViewerController *)self _decreaseCurrentHighlightIndex];
    [(LUILogViewerController *)self _updateHighlight];
  }
}

- (void)logViewerRightCaretButtonTapped:(id)a3
{
  id v4 = [(LUILogViewerController *)self highlightRanges];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    [(LUILogViewerController *)self _increaseCurrentHighlightIndex];
    [(LUILogViewerController *)self _updateHighlight];
  }
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  if (a4 && a6)
  {
    CGFloat v7 = [a3 viewControllers];
    double v8 = [v7 objectAtIndexedSubscript:0];
    CGFloat v9 = [(LUILogViewerController *)self logContentViewController];

    uint64_t v10 = [(LUILogViewerController *)self logViewerView];
    uint64_t v11 = v10;
    if (v8 == v9)
    {
      [v10 highlightFilterButton:0];

      CGPoint v12 = [(LUILogViewerController *)self logViewerView];
      id v14 = v12;
      uint64_t v13 = 1;
    }
    else
    {
      [v10 highlightFilterButton:1];

      CGPoint v12 = [(LUILogViewerController *)self logViewerView];
      id v14 = v12;
      uint64_t v13 = 0;
    }
    [v12 highlightLogButton:v13];
  }
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  id v5 = a4;
  double v6 = [(LUILogViewerController *)self orderedViewControllers];
  unint64_t v7 = [v6 indexOfObject:v5];

  double v8 = [(LUILogViewerController *)self orderedViewControllers];
  unint64_t v9 = [v8 count] - 1;

  if (v7 >= v9)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v10 = [(LUILogViewerController *)self orderedViewControllers];
    uint64_t v11 = [v10 objectAtIndexedSubscript:v7 + 1];
  }

  return v11;
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  id v5 = a4;
  double v6 = [(LUILogViewerController *)self orderedViewControllers];
  uint64_t v7 = [v6 indexOfObject:v5];

  if (v7)
  {
    double v8 = [(LUILogViewerController *)self orderedViewControllers];
    unint64_t v9 = [v8 objectAtIndexedSubscript:v7 - 1];
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (id)orderedViewControllers
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__LUILogViewerController_orderedViewControllers__block_invoke;
  block[3] = &unk_265097790;
  block[4] = self;
  if (orderedViewControllers_onceToken != -1) {
    dispatch_once(&orderedViewControllers_onceToken, block);
  }
  return (id)orderedViewControllers_result;
}

void __48__LUILogViewerController_orderedViewControllers__block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x263EF8340];
  double v2 = [*(id *)(a1 + 32) logContentViewController];
  v6[0] = v2;
  id v3 = [*(id *)(a1 + 32) logFilterViewController];
  v6[1] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  id v5 = (void *)orderedViewControllers_result;
  orderedViewControllers__NSRange result = v4;
}

- (void)logFilterViewController:(id)a3 didAddPredicates:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(LUILogViewerController *)self predicates];
  unint64_t v9 = [v8 arrayByAddingObjectsFromArray:v6];

  id v10 = [v9 sortedArrayUsingComparator:&__block_literal_global];

  [(LUILogViewerController *)self setPredicates:v10];
  [v7 predicateDataUpdated];
}

uint64_t __67__LUILogViewerController_logFilterViewController_didAddPredicates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 predicateFormat];
  id v6 = [v4 predicateFormat];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)logFilterViewController:(id)a3 didDeletePredicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(LUILogViewerController *)self predicates];
  id v10 = (id)[v8 mutableCopy];

  [v10 removeObject:v6];
  unint64_t v9 = (void *)[v10 copy];
  [(LUILogViewerController *)self setPredicates:v9];

  [v7 predicateDataUpdated];
}

- (void)logFilterViewControllerApplyButtonTapped:(id)a3
{
  [(LUILogViewerController *)self showLogContentPage];
  [(LUILogViewerController *)self _stopStreaming];
  [(LUILogViewerController *)self logInterval];
  unint64_t v5 = (unint64_t)v4;
  [(LUILogViewerController *)self _cleanupLogs];
  if (v5)
  {
    [(LUILogViewerController *)self setLogInterval:(double)v5];
    [(LUILogViewerController *)self _grabLogAndUpdateTextView];
  }
  else
  {
    id v6 = [(LUILogViewerController *)self logContentViewController];
    [v6 showLogOptionsView];
  }
}

- (BOOL)logFilterViewControllerShouldAllowTextEditing:(id)a3
{
  return ![(LUILogViewerController *)self outsideKeyboardIsShowing];
}

- (void)logContentViewController:(id)a3 didSelectLogOptionWithTimeInterval:(double)a4
{
  [(LUILogViewerController *)self setLogInterval:a3];
  id v6 = [(LUILogViewerController *)self logContentViewController];
  [v6 showLogTextView];

  if (a4 <= 0.0)
  {
    [(LUILogViewerController *)self _startStreamLog];
  }
  else
  {
    [(LUILogViewerController *)self _grabLogAndUpdateTextView];
  }
}

- (void)logContentViewController:(id)a3 didSelectDateForLog:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  uint64_t v7 = [(LUILogViewerController *)self firstLogDate];
  if (v7)
  {
    double v8 = (void *)v7;
    unint64_t v9 = [(LUILogViewerController *)self lastLogDate];

    if (v9)
    {
      id v10 = [v16 textView];
      uint64_t v11 = [v10 text];
      uint64_t v12 = [(LUILogViewerController *)self _searchRangeForDate:v6 inText:v11];
      uint64_t v14 = v13;

      if (v14)
      {
        double v15 = [v16 textView];
        objc_msgSend(v15, "scrollRangeToVisible:", v12, v14);
      }
    }
  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v7 = a3;
  if ([(LUILogViewerController *)self currentHighlightIndex] == -1)
  {
    double v4 = [v7 text];
    BOOL v5 = [(LUILogViewerController *)self _performSearch:v4];

    id v6 = v7;
    if (!v5) {
      goto LABEL_6;
    }
    [v7 endEditing:1];
  }
  else
  {
    [(LUILogViewerController *)self setCurrentHighlightIndex:[(LUILogViewerController *)self currentHighlightIndex] + 1];
    [(LUILogViewerController *)self _updateHighlight];
  }
  id v6 = v7;
LABEL_6:
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  id v3 = self;
  double v4 = [(LUILogViewerController *)self pageViewController];
  BOOL v5 = [v4 viewControllers];
  id v6 = [v5 firstObject];
  id v7 = [(LUILogViewerController *)v3 logContentViewController];
  LOBYTE(v3) = v6 == v7;

  return (char)v3;
}

- (LUILogViewerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LUILogViewerControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setLogViewerView:(id)a3
{
}

- (void)setAssistiveTouch:(id)a3
{
}

- (UIView)baseView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_baseView);

  return (UIView *)WeakRetained;
}

- (void)setBaseView:(id)a3
{
}

- (void)setLogContentViewController:(id)a3
{
}

- (void)setLogFilterViewController:(id)a3
{
}

- (void)setPageViewController:(id)a3
{
}

- (NSArray)predicates
{
  return self->_predicates;
}

- (void)setPredicates:(id)a3
{
}

- (double)logInterval
{
  return self->_logInterval;
}

- (void)setLogInterval:(double)a3
{
  self->_logInterval = a3;
}

- (NSDate)lastLogDate
{
  return self->_lastLogDate;
}

- (void)setLastLogDate:(id)a3
{
}

- (NSDate)firstLogDate
{
  return self->_firstLogDate;
}

- (void)setFirstLogDate:(id)a3
{
}

- (NSMutableSet)logMinutesSet
{
  return self->_logMinutesSet;
}

- (void)setLogMinutesSet:(id)a3
{
}

- (NSMutableArray)logMinutesArray
{
  return self->_logMinutesArray;
}

- (void)setLogMinutesArray:(id)a3
{
}

- (BOOL)isStreaming
{
  return self->_isStreaming;
}

- (void)setIsStreaming:(BOOL)a3
{
  self->_isStreaming = a3;
}

- (NSArray)highlightRanges
{
  return self->_highlightRanges;
}

- (void)setHighlightRanges:(id)a3
{
}

- (int64_t)currentHighlightIndex
{
  return self->_currentHighlightIndex;
}

- (void)setCurrentHighlightIndex:(int64_t)a3
{
  self->_currentHighlightIndex = a3;
}

- (BOOL)isFetchingLogs
{
  return self->_isFetchingLogs;
}

- (void)setIsFetchingLogs:(BOOL)a3
{
  self->_isFetchingLogs = a3;
}

- (void)setPanGesture:(id)a3
{
}

- (BOOL)outsideKeyboardIsShowing
{
  return self->_outsideKeyboardIsShowing;
}

- (void)setOutsideKeyboardIsShowing:(BOOL)a3
{
  self->_outsideKeyboardIsShowing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_highlightRanges, 0);
  objc_storeStrong((id *)&self->_logMinutesArray, 0);
  objc_storeStrong((id *)&self->_logMinutesSet, 0);
  objc_storeStrong((id *)&self->_firstLogDate, 0);
  objc_storeStrong((id *)&self->_lastLogDate, 0);
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);
  objc_storeStrong((id *)&self->_logFilterViewController, 0);
  objc_storeStrong((id *)&self->_logContentViewController, 0);
  objc_destroyWeak((id *)&self->_baseView);
  objc_storeStrong((id *)&self->_assistiveTouch, 0);
  objc_storeStrong((id *)&self->_logViewerView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end