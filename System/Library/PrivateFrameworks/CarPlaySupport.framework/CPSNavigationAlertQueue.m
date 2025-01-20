@interface CPSNavigationAlertQueue
- (BOOL)_canBeginAnimatingAlert;
- (BOOL)isDisplayingAlert;
- (CPNavigationAlert)currentAlert;
- (CPSApplicationStateMonitor)applicationStateMonitor;
- (CPSNavigationAlertQueue)initWithDelegate:(id)a3 applicationStateMonitor:(id)a4;
- (CPSNavigationAlertQueueDelegate)delegate;
- (CPSNavigationAlertView)currentAlertView;
- (CPTemplateDelegate)templateDelegate;
- (NSTimer)alertTimer;
- (void)_clearAlertViewIfNecessaryForDismissedAlertView:(id)a3;
- (void)_startAlertAnimations;
- (void)_visibleAlertTimerFired:(id)a3;
- (void)applicationStateMonitor:(id)a3 didBecomeActive:(BOOL)a4;
- (void)beginAnimatingAlertIfPossible;
- (void)didSelectButton:(id)a3;
- (void)dismissCurrentNavigationAlertAnimated:(BOOL)a3 context:(unint64_t)a4 completion:(id)a5;
- (void)prepareNavigationAlert:(id)a3 templateDelegate:(id)a4 animated:(BOOL)a5;
- (void)setAlertTimer:(id)a3;
- (void)setApplicationStateMonitor:(id)a3;
- (void)setTemplateDelegate:(id)a3;
@end

@implementation CPSNavigationAlertQueue

- (CPSNavigationAlertQueue)initWithDelegate:(id)a3 applicationStateMonitor:(id)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  v4 = v11;
  v11 = 0;
  v8 = [(CPSNavigationAlertQueue *)v4 init];
  v11 = v8;
  objc_storeStrong((id *)&v11, v8);
  if (v8)
  {
    objc_storeStrong((id *)&v11->_currentAlert, 0);
    objc_storeWeak((id *)&v11->_delegate, location[0]);
    objc_storeWeak((id *)&v11->_applicationStateMonitor, v9);
  }
  v6 = v11;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v6;
}

- (BOOL)isDisplayingAlert
{
  v2 = [(CPSNavigationAlertQueue *)self currentAlert];
  BOOL v4 = v2 != 0;

  return v4;
}

- (void)prepareNavigationAlert:(id)a3 templateDelegate:(id)a4 animated:(BOOL)a5
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  BOOL v17 = a5;
  v13 = [CPSNavigationAlertView alloc];
  CGRectMake_4();
  id v16 = -[CPSNavigationAlertView initWithFrame:navigationAlert:templateDelegate:buttonDelegate:](v13, "initWithFrame:navigationAlert:templateDelegate:buttonDelegate:", location[0], v18, v20, v5, v6, v7, v8);
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CPSNavigationAlertView *)v20->_currentAlertView removeFromSuperview];
  objc_storeStrong((id *)&v20->_currentAlert, location[0]);
  objc_storeStrong((id *)&v20->_currentAlertView, v16);
  objc_storeWeak((id *)&v20->_templateDelegate, v18);
  v14 = [(CPSNavigationAlertQueue *)v20 delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    v10 = [(CPSNavigationAlertQueue *)v20 delegate];
    [(CPSNavigationAlertQueueDelegate *)v10 navigationAlertQueue:v20 shouldDisplayAlertView:v16 animated:v17];
  }
  id v9 = [(CPSNavigationAlertQueue *)v20 alertTimer];
  [(NSTimer *)v9 invalidate];

  [(CPSNavigationAlertQueue *)v20 beginAnimatingAlertIfPossible];
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (void)dismissCurrentNavigationAlertAnimated:(BOOL)a3 context:(unint64_t)a4 completion:(id)a5
{
  v26 = self;
  SEL v25 = a2;
  BOOL v24 = a3;
  unint64_t v23 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  v10 = [(CPSNavigationAlertQueue *)v26 alertTimer];
  [(NSTimer *)v10 invalidate];

  v11 = [(CPSNavigationAlertQueue *)v26 delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v21 = [(CPSNavigationAlertQueue *)v26 currentAlertView];
    id v9 = [(CPSNavigationAlertQueue *)v26 delegate];
    double v5 = v26;
    double v6 = v21;
    BOOL v7 = v24;
    unint64_t v8 = v23;
    uint64_t v13 = MEMORY[0x263EF8330];
    int v14 = -1073741824;
    int v15 = 0;
    id v16 = __84__CPSNavigationAlertQueue_dismissCurrentNavigationAlertAnimated_context_completion___block_invoke;
    BOOL v17 = &unk_2648A50F8;
    id v20 = location;
    id v18 = v26;
    v19 = v21;
    [(CPSNavigationAlertQueueDelegate *)v9 navigationAlertQueue:v5 shouldRemoveAlertView:v6 animated:v7 dismissalContext:v8 completion:&v13];

    objc_storeStrong((id *)&v19, 0);
    objc_storeStrong((id *)&v18, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong((id *)&v21, 0);
  }
  objc_storeStrong(&location, 0);
}

uint64_t __84__CPSNavigationAlertQueue_dismissCurrentNavigationAlertAnimated_context_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48)) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  return [*(id *)(a1 + 32) _clearAlertViewIfNecessaryForDismissedAlertView:*(void *)(a1 + 40)];
}

- (void)beginAnimatingAlertIfPossible
{
  if ([(CPSNavigationAlertQueue *)self _canBeginAnimatingAlert]) {
    [(CPSNavigationAlertQueue *)self _startAlertAnimations];
  }
}

- (BOOL)_canBeginAnimatingAlert
{
  v3 = [(CPSNavigationAlertQueue *)self currentAlert];
  char v9 = 0;
  char v7 = 0;
  char v5 = 0;
  LOBYTE(v4) = 0;
  if (v3)
  {
    v10 = [(CPSNavigationAlertQueue *)self applicationStateMonitor];
    char v9 = 1;
    LOBYTE(v4) = 0;
    if ([(CPSApplicationStateMonitor *)v10 templateApplicationSceneIsActive])
    {
      unint64_t v8 = [(CPSNavigationAlertQueue *)self delegate];
      char v7 = 1;
      LOBYTE(v4) = 0;
      if ([(CPSNavigationAlertQueueDelegate *)v8 canAnimateNavigationAlert])
      {
        double v6 = [(CPSNavigationAlertQueue *)self alertTimer];
        char v5 = 1;
        int v4 = ![(NSTimer *)v6 isValid];
      }
    }
  }
  if (v5) {

  }
  if (v7) {
  if (v9)
  }

  return v4 & 1;
}

- (void)_startAlertAnimations
{
  unint64_t v8 = [(CPSNavigationAlertQueue *)self currentAlert];
  [(CPNavigationAlert *)v8 duration];
  BOOL v9 = v2 <= 0.0;

  if (!v9)
  {
    char v5 = (void *)MEMORY[0x263EFFA20];
    double v6 = [(CPSNavigationAlertQueue *)self currentAlert];
    [(CPNavigationAlert *)v6 duration];
    v3 = (NSTimer *)(id)objc_msgSend(v5, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__visibleAlertTimerFired_, 0, 0);
    alertTimer = self->_alertTimer;
    self->_alertTimer = v3;

    char v7 = [(CPSNavigationAlertQueue *)self currentAlertView];
    [(CPSNavigationAlertView *)v7 startAnimating];
  }
}

- (void)_visibleAlertTimerFired:(id)a3
{
  BOOL v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = [(CPSNavigationAlertQueue *)v17 currentAlertView];
  double v6 = [(CPSNavigationAlertQueue *)v17 delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v5 = [(CPSNavigationAlertQueue *)v17 delegate];
    v3 = v17;
    id v4 = v15;
    uint64_t v8 = MEMORY[0x263EF8330];
    int v9 = -1073741824;
    int v10 = 0;
    v11 = __51__CPSNavigationAlertQueue__visibleAlertTimerFired___block_invoke;
    char v12 = &unk_2648A3990;
    uint64_t v13 = v17;
    id v14 = v15;
    [(CPSNavigationAlertQueueDelegate *)v5 navigationAlertQueue:v3 shouldRemoveAlertView:v4 animated:1 dismissalContext:0 completion:&v8];

    objc_storeStrong(&v14, 0);
    objc_storeStrong((id *)&v13, 0);
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

uint64_t __51__CPSNavigationAlertQueue__visibleAlertTimerFired___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearAlertViewIfNecessaryForDismissedAlertView:", *(void *)(a1 + 40), a1, a1);
}

- (void)_clearAlertViewIfNecessaryForDismissedAlertView:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_currentAlertView == location[0])
  {
    objc_storeStrong((id *)&v4->_currentAlertView, 0);
    objc_storeStrong((id *)&v4->_currentAlert, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)didSelectButton:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(CPSNavigationAlertQueue *)v32 currentAlert];
  BOOL v23 = v3 != 0;

  if (v23)
  {
    id v4 = objc_opt_class();
    id v29 = CPSSafeCast_15(v4, location[0]);
    id v28 = (id)[v29 titleForState:0];
    id v27 = 0;
    v21 = [(CPSNavigationAlertQueue *)v32 currentAlert];
    id v20 = [(CPNavigationAlert *)v21 primaryAction];
    v19 = [(CPAlertAction *)v20 title];
    char v22 = objc_msgSend(v28, "isEqualToString:");

    if (v22)
    {
      id v18 = [(CPSNavigationAlertQueue *)v32 currentAlert];
      BOOL v17 = [(CPNavigationAlert *)v18 primaryAction];
      id v5 = (id)[(CPAlertAction *)v17 identifier];
      id v6 = v27;
      id v27 = v5;
    }
    else
    {
      id v15 = [(CPSNavigationAlertQueue *)v32 currentAlert];
      id v14 = [(CPNavigationAlert *)v15 secondaryAction];
      uint64_t v13 = [(CPAlertAction *)v14 title];
      char v16 = objc_msgSend(v28, "isEqualToString:");

      if (v16)
      {
        char v12 = [(CPSNavigationAlertQueue *)v32 currentAlert];
        v11 = [(CPNavigationAlert *)v12 secondaryAction];
        id v7 = (id)[(CPAlertAction *)v11 identifier];
        id v8 = v27;
        id v27 = v7;
      }
      else
      {
        id v26 = CarPlaySupportGeneralLogging();
        os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v34, (uint64_t)v32);
          _os_log_impl(&dword_22B689000, (os_log_t)v26, v25, "%@: dismissing alert with close button", v34, 0xCu);
        }
        objc_storeStrong(&v26, 0);
      }
    }
    if (v27)
    {
      id v24 = CarPlaySupportGeneralLogging();
      if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v33, (uint64_t)v32, (uint64_t)v27);
        _os_log_impl(&dword_22B689000, (os_log_t)v24, OS_LOG_TYPE_DEFAULT, "%@: button selected with UUID: %@", v33, 0x16u);
      }
      objc_storeStrong(&v24, 0);
      int v10 = [(CPSNavigationAlertQueue *)v32 templateDelegate];
      [(CPTemplateDelegate *)v10 handleActionForControlIdentifier:v27];
    }
    [(CPSNavigationAlertQueue *)v32 dismissCurrentNavigationAlertAnimated:1 context:1 completion:0];
    objc_storeStrong(&v27, obj);
    objc_storeStrong(&v28, obj);
    objc_storeStrong(&v29, obj);
    int v30 = 0;
  }
  else
  {
    int v30 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)applicationStateMonitor:(id)a3 didBecomeActive:(BOOL)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v12 = a4;
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __67__CPSNavigationAlertQueue_applicationStateMonitor_didBecomeActive___block_invoke;
  int v10 = &unk_2648A3BE0;
  v11 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

uint64_t __67__CPSNavigationAlertQueue_applicationStateMonitor_didBecomeActive___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _canBeginAnimatingAlert];
  if (result) {
    return [*(id *)(a1 + 32) _startAlertAnimations];
  }
  return result;
}

- (CPSNavigationAlertQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CPSNavigationAlertQueueDelegate *)WeakRetained;
}

- (CPNavigationAlert)currentAlert
{
  return self->_currentAlert;
}

- (CPSNavigationAlertView)currentAlertView
{
  return self->_currentAlertView;
}

- (NSTimer)alertTimer
{
  return self->_alertTimer;
}

- (void)setAlertTimer:(id)a3
{
}

- (CPTemplateDelegate)templateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_templateDelegate);

  return (CPTemplateDelegate *)WeakRetained;
}

- (void)setTemplateDelegate:(id)a3
{
}

- (CPSApplicationStateMonitor)applicationStateMonitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationStateMonitor);

  return (CPSApplicationStateMonitor *)WeakRetained;
}

- (void)setApplicationStateMonitor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end