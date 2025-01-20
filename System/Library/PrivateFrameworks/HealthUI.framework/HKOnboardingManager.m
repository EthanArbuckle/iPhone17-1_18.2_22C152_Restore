@interface HKOnboardingManager
- (BOOL)firstTimeOnboarding;
- (HKDateCache)dateCache;
- (HKHealthStore)healthStore;
- (HKOnboardingManager)initWithOnboardingType:(int64_t)a3 isFirstTimeOnboarding:(BOOL)a4 healthStore:(id)a5 dateCache:(id)a6;
- (HKOnboardingManager)initWithOnboardingType:(int64_t)a3 isFirstTimeOnboarding:(BOOL)a4 healthStore:(id)a5 dateCache:(id)a6 navigationController:(id)a7;
- (HKOnboardingManagerDataSource)dataSource;
- (HKOnboardingManagerDelegate)delegate;
- (HKOnboardingSequence)currentSequence;
- (NSArray)steps;
- (NSMutableDictionary)userInfo;
- (UINavigationController)navigationController;
- (id)onboardingNavigationController;
- (id)viewControllerForPage:(id)a3;
- (int64_t)currentStepIndex;
- (int64_t)onboardingType;
- (int64_t)upgradingFromAlgorithmVersionForOnboardingType:(int64_t)a3;
- (unint64_t)currentPageIndex;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (unint64_t)presentedPagesCount;
- (void)_didStepBackward;
- (void)currentSequence;
- (void)dismissOnboarding;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)onboardingCancelled;
- (void)pushPageAnimated:(BOOL)a3;
- (void)setCurrentPageIndex:(unint64_t)a3;
- (void)setCurrentSequence:(id)a3;
- (void)setCurrentStepIndex:(int64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDateCache:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setOnboardingType:(int64_t)a3;
- (void)setPresentedPagesCount:(unint64_t)a3;
- (void)setSteps:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)stepForward;
- (void)stepToNextPage;
- (void)stepToNextState;
@end

@implementation HKOnboardingManager

- (HKOnboardingManager)initWithOnboardingType:(int64_t)a3 isFirstTimeOnboarding:(BOOL)a4 healthStore:(id)a5 dateCache:(id)a6
{
  BOOL v7 = a4;
  v10 = (objc_class *)MEMORY[0x1E4FB19E8];
  id v11 = a6;
  id v12 = a5;
  id v13 = objc_alloc_init(v10);
  v14 = [(HKOnboardingManager *)self initWithOnboardingType:a3 isFirstTimeOnboarding:v7 healthStore:v12 dateCache:v11 navigationController:v13];

  return v14;
}

- (HKOnboardingManager)initWithOnboardingType:(int64_t)a3 isFirstTimeOnboarding:(BOOL)a4 healthStore:(id)a5 dateCache:(id)a6 navigationController:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HKOnboardingManager;
  v16 = [(HKOnboardingManager *)&v21 init];
  v17 = v16;
  if (v16)
  {
    v16->_onboardingType = a3;
    v16->_firstTimeOnboarding = a4;
    objc_storeStrong((id *)&v16->_healthStore, a5);
    objc_storeStrong((id *)&v17->_dateCache, a6);
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    userInfo = v17->_userInfo;
    v17->_userInfo = v18;

    objc_storeStrong((id *)&v17->_navigationController, a7);
    [(UINavigationController *)v17->_navigationController setDelegate:v17];
    v17->_currentStepIndex = 0;
    v17->_currentPageIndex = 0;
    v17->_presentedPagesCount = 0;
  }

  return v17;
}

- (NSArray)steps
{
  if (!self->_steps)
  {
    v3 = [(HKOnboardingManager *)self dataSource];

    if (v3)
    {
      v4 = [(HKOnboardingManager *)self dataSource];
      v5 = [v4 availableOnboardingStepsForOnboardingManager:self];
      steps = self->_steps;
      self->_steps = v5;
    }
    else
    {
      v4 = self->_steps;
      self->_steps = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }
  BOOL v7 = self->_steps;
  return v7;
}

- (void)setCurrentStepIndex:(int64_t)a3
{
  if (self->_currentStepIndex != a3)
  {
    currentSequence = self->_currentSequence;
    self->_currentSequence = 0;
    self->_currentStepIndex = a3;

    self->_currentPageIndex = 0;
  }
}

- (HKOnboardingSequence)currentSequence
{
  currentSequence = self->_currentSequence;
  if (!currentSequence)
  {
    v5 = [(HKOnboardingManager *)self dataSource];

    if (v5)
    {
      v6 = [(HKOnboardingManager *)self steps];
      BOOL v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", -[HKOnboardingManager currentStepIndex](self, "currentStepIndex"));
      uint64_t v8 = [v7 integerValue];

      v9 = [(HKOnboardingManager *)self dataSource];
      objc_msgSend(v9, "onboardingManager:sequenceForStep:onboardingType:", self, v8, -[HKOnboardingManager onboardingType](self, "onboardingType"));
      v10 = (HKOnboardingSequence *)objc_claimAutoreleasedReturnValue();
      id v11 = self->_currentSequence;
      self->_currentSequence = v10;
    }
    else
    {
      v9 = self->_currentSequence;
      self->_currentSequence = 0;
    }

    currentSequence = self->_currentSequence;
    if (!currentSequence)
    {
      _HKInitializeLogging();
      id v12 = (void *)*MEMORY[0x1E4F29F28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
        [(HKOnboardingManager *)self currentSequence];
      }
      currentSequence = self->_currentSequence;
    }
  }
  return currentSequence;
}

- (id)onboardingNavigationController
{
  v3 = [(HKOnboardingManager *)self currentSequence];
  v4 = [v3 pages];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(HKOnboardingManager *)self setUserInfo:v6];

    BOOL v7 = [(HKOnboardingManager *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [(HKOnboardingManager *)self delegate];
      [v9 didBeginOnboardingForOnboardingManager:self];
    }
    [(HKOnboardingManager *)self pushPageAnimated:0];
    v10 = [(HKOnboardingManager *)self navigationController];
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)dismissOnboarding
{
  [(HKOnboardingManager *)self setCurrentStepIndex:0];
  v3 = [(HKOnboardingManager *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];

  v4 = [(HKOnboardingManager *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(HKOnboardingManager *)self delegate];
    [v6 didCompleteOnboardingForOnboardingManager:self];
  }
}

- (int64_t)upgradingFromAlgorithmVersionForOnboardingType:(int64_t)a3
{
  if (a3 == 1)
  {
    v3 = (void *)self;
    v4 = [self dataSource];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [v3 dataSource];
      int64_t v7 = [v6 upgradingFromAlgorithmVersionForOnboardingManager:v3];

      return v7;
    }
    return *MEMORY[0x1E4F2B9E0];
  }
  if (!a3) {
    return *MEMORY[0x1E4F2B9E0];
  }
  return self;
}

- (id)viewControllerForPage:(id)a3
{
  id v4 = a3;
  char v5 = [(HKOnboardingManager *)self dataSource];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0
    || ([(HKOnboardingManager *)self dataSource],
        int64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v7 onboardingManager:self customViewControllerForPage:v4],
        char v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    char v8 = objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "viewControllerClass")), "initForOnboarding:upgradingFromAlgorithmVersion:", 1, -[HKOnboardingManager upgradingFromAlgorithmVersionForOnboardingType:](self, "upgradingFromAlgorithmVersionForOnboardingType:", -[HKOnboardingManager onboardingType](self, "onboardingType")));
  }
  [v8 setDelegate:self];

  return v8;
}

- (void)stepForward
{
  unint64_t v3 = [(HKOnboardingManager *)self currentPageIndex];
  id v4 = [(HKOnboardingManager *)self currentSequence];
  char v5 = [v4 pages];
  uint64_t v6 = [v5 count] - 1;

  if (v3 == v6)
  {
    int64_t v7 = [(HKOnboardingManager *)self currentStepIndex];
    char v8 = [(HKOnboardingManager *)self steps];
    uint64_t v9 = [v8 count] - 1;

    if (v7 == v9) {
      [(HKOnboardingManager *)self dismissOnboarding];
    }
    else {
      [(HKOnboardingManager *)self stepToNextState];
    }
  }
  else
  {
    [(HKOnboardingManager *)self stepToNextPage];
  }
  [(HKOnboardingManager *)self pushPageAnimated:1];
}

- (void)stepToNextState
{
  unint64_t v3 = [(HKOnboardingManager *)self currentStepIndex];
  id v4 = [(HKOnboardingManager *)self steps];
  unint64_t v5 = [v4 count] - 1;

  if (v3 < v5)
  {
    int64_t v6 = [(HKOnboardingManager *)self currentStepIndex] + 1;
    [(HKOnboardingManager *)self setCurrentStepIndex:v6];
  }
}

- (void)stepToNextPage
{
  unint64_t v3 = [(HKOnboardingManager *)self currentPageIndex];
  id v4 = [(HKOnboardingManager *)self currentSequence];
  unint64_t v5 = [v4 pages];
  unint64_t v6 = [v5 count] - 1;

  if (v3 < v6)
  {
    unint64_t v7 = [(HKOnboardingManager *)self currentPageIndex] + 1;
    [(HKOnboardingManager *)self setCurrentPageIndex:v7];
  }
}

- (void)pushPageAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(HKOnboardingManager *)self currentSequence];
  uint64_t v6 = [v5 pages];
  objc_msgSend((id)v6, "objectAtIndexedSubscript:", -[HKOnboardingManager currentPageIndex](self, "currentPageIndex"));
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  unint64_t v7 = [(HKOnboardingManager *)self delegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    char v8 = [(HKOnboardingManager *)self delegate];
    [v8 onboardingManager:self willMoveToPage:v11];
  }
  uint64_t v9 = [(HKOnboardingManager *)self viewControllerForPage:v11];
  v10 = [(HKOnboardingManager *)self navigationController];
  [v10 pushViewController:v9 animated:v3];
}

- (void)onboardingCancelled
{
  BOOL v3 = [(HKOnboardingManager *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(HKOnboardingManager *)self delegate];
    [v5 didCancelOnboardingForOnboardingManager:self];
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v10 = a3;
  uint64_t v6 = [v10 viewControllers];
  unint64_t v7 = [v6 count];
  unint64_t v8 = [(HKOnboardingManager *)self presentedPagesCount];

  if (v7 < v8) {
    [(HKOnboardingManager *)self _didStepBackward];
  }
  uint64_t v9 = [v10 viewControllers];
  -[HKOnboardingManager setPresentedPagesCount:](self, "setPresentedPagesCount:", [v9 count]);
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  return 2;
}

- (void)_didStepBackward
{
  if ([(HKOnboardingManager *)self currentPageIndex])
  {
    unint64_t v3 = [(HKOnboardingManager *)self currentPageIndex] - 1;
    [(HKOnboardingManager *)self setCurrentPageIndex:v3];
  }
  else if ([(HKOnboardingManager *)self currentStepIndex])
  {
    [(HKOnboardingManager *)self setCurrentStepIndex:[(HKOnboardingManager *)self currentStepIndex] - 1];
    id v5 = [(HKOnboardingManager *)self currentSequence];
    char v4 = [v5 pages];
    -[HKOnboardingManager setCurrentPageIndex:](self, "setCurrentPageIndex:", [v4 count] - 1);
  }
  else
  {
    [(HKOnboardingManager *)self dismissOnboarding];
  }
}

- (int64_t)onboardingType
{
  return self->_onboardingType;
}

- (void)setOnboardingType:(int64_t)a3
{
  self->_onboardingType = a3;
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (BOOL)firstTimeOnboarding
{
  return self->_firstTimeOnboarding;
}

- (HKOnboardingManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HKOnboardingManagerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (HKOnboardingManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKOnboardingManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (void)setDateCache:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (void)setSteps:(id)a3
{
}

- (void)setCurrentSequence:(id)a3
{
}

- (int64_t)currentStepIndex
{
  return self->_currentStepIndex;
}

- (unint64_t)currentPageIndex
{
  return self->_currentPageIndex;
}

- (void)setCurrentPageIndex:(unint64_t)a3
{
  self->_currentPageIndex = a3;
}

- (unint64_t)presentedPagesCount
{
  return self->_presentedPagesCount;
}

- (void)setPresentedPagesCount:(unint64_t)a3
{
  self->_presentedPagesCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSequence, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

- (void)currentSequence
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = NSStringFromSelector(a3);
  int v7 = 138544130;
  unint64_t v8 = a1;
  __int16 v9 = 2114;
  id v10 = v6;
  __int16 v11 = 1024;
  int v12 = [a1 currentStepIndex];
  __int16 v13 = 1024;
  int v14 = [a1 onboardingType];
  _os_log_error_impl(&dword_1E0B26000, v5, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] Current sequence is nil for step index: %d, onboarding type: %d.", (uint8_t *)&v7, 0x22u);
}

@end