@interface EKUIEventViewDelegateAlertDisplayer
- (EKUIEventViewDelegateAlertDisplayer)initWithDelegate:(id)a3 eventViewController:(id)a4;
- (void)displayIntegrationAlert:(id)a3;
@end

@implementation EKUIEventViewDelegateAlertDisplayer

- (EKUIEventViewDelegateAlertDisplayer)initWithDelegate:(id)a3 eventViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EKUIEventViewDelegateAlertDisplayer;
  v8 = [(EKUIEventViewDelegateAlertDisplayer *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v9->_eventViewController, v7);
  }

  return v9;
}

- (void)displayIntegrationAlert:(id)a3
{
  id v7 = +[EKUIIntegrationAlertDisplayer alertControllerForAlert:a3 viewController:0 options:2];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = objc_loadWeakRetained((id *)&self->_eventViewController);
  id v6 = [v5 _ekEventViewController];
  [WeakRetained eventViewController:v6 requestsDisplayOfDeleteAlert:v7];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_eventViewController);

  objc_destroyWeak((id *)&self->_delegate);
}

@end