@interface DBStatusBarHomeButtonStateManager
- (DBStatusBarButtonStateManagerDelegate)delegate;
- (DBStatusBarHomeButtonStateManager)initWithDelegate:(id)a3;
- (int64_t)currentPageIndex;
- (int64_t)firstIconPageIndex;
- (int64_t)minimumPageIndex;
- (unint64_t)currentViewState;
- (void)_updateHomeButtonState;
- (void)dashboardRootViewController:(id)a3 didChangeToViewState:(unint64_t)a4;
- (void)homeViewController:(id)a3 didChangeToPageIndex:(int64_t)a4 firstIconPageIndex:(int64_t)a5 minimumPageIndex:(int64_t)a6;
- (void)setCurrentPageIndex:(int64_t)a3;
- (void)setCurrentViewState:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstIconPageIndex:(int64_t)a3;
- (void)setMinimumPageIndex:(int64_t)a3;
@end

@implementation DBStatusBarHomeButtonStateManager

- (DBStatusBarHomeButtonStateManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DBStatusBarHomeButtonStateManager;
  v5 = [(DBStatusBarHomeButtonStateManager *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_minimumPageIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (void)_updateHomeButtonState
{
  int64_t v3 = [(DBStatusBarHomeButtonStateManager *)self minimumPageIndex];
  if (v3 == [(DBStatusBarHomeButtonStateManager *)self firstIconPageIndex])
  {
LABEL_6:
    uint64_t v6 = 0;
    goto LABEL_7;
  }
  unint64_t v4 = [(DBStatusBarHomeButtonStateManager *)self currentViewState];
  switch(v4)
  {
    case 2uLL:
      uint64_t v6 = 2;
      break;
    case 1uLL:
      int64_t v7 = [(DBStatusBarHomeButtonStateManager *)self currentPageIndex];
      uint64_t v6 = v7 == [(DBStatusBarHomeButtonStateManager *)self minimumPageIndex];
      break;
    case 0uLL:
      int64_t v5 = [(DBStatusBarHomeButtonStateManager *)self currentPageIndex];
      uint64_t v6 = v5 != [(DBStatusBarHomeButtonStateManager *)self minimumPageIndex];
      break;
    default:
      goto LABEL_6;
  }
LABEL_7:
  id v8 = [(DBStatusBarHomeButtonStateManager *)self delegate];
  [v8 statusBarHomeButtonStateManager:self didChangeToDisplayState:v6];
}

- (void)homeViewController:(id)a3 didChangeToPageIndex:(int64_t)a4 firstIconPageIndex:(int64_t)a5 minimumPageIndex:(int64_t)a6
{
  [(DBStatusBarHomeButtonStateManager *)self setCurrentPageIndex:a4];
  [(DBStatusBarHomeButtonStateManager *)self setFirstIconPageIndex:a5];
  [(DBStatusBarHomeButtonStateManager *)self setMinimumPageIndex:a6];
  [(DBStatusBarHomeButtonStateManager *)self _updateHomeButtonState];
}

- (void)dashboardRootViewController:(id)a3 didChangeToViewState:(unint64_t)a4
{
  [(DBStatusBarHomeButtonStateManager *)self setCurrentViewState:a4];
  [(DBStatusBarHomeButtonStateManager *)self _updateHomeButtonState];
}

- (DBStatusBarButtonStateManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DBStatusBarButtonStateManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)currentPageIndex
{
  return self->_currentPageIndex;
}

- (void)setCurrentPageIndex:(int64_t)a3
{
  self->_currentPageIndex = a3;
}

- (unint64_t)currentViewState
{
  return self->_currentViewState;
}

- (void)setCurrentViewState:(unint64_t)a3
{
  self->_currentViewState = a3;
}

- (int64_t)minimumPageIndex
{
  return self->_minimumPageIndex;
}

- (void)setMinimumPageIndex:(int64_t)a3
{
  self->_minimumPageIndex = a3;
}

- (int64_t)firstIconPageIndex
{
  return self->_firstIconPageIndex;
}

- (void)setFirstIconPageIndex:(int64_t)a3
{
  self->_firstIconPageIndex = a3;
}

- (void).cxx_destruct
{
}

@end