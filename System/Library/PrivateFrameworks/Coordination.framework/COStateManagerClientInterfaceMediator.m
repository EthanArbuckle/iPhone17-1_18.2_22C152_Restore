@interface COStateManagerClientInterfaceMediator
- (COStateManager)manager;
- (COStateManagerClientInterfaceMediator)initWithStateManager:(id)a3;
- (void)changesObserved:(id)a3 forPredicate:(id)a4;
@end

@implementation COStateManagerClientInterfaceMediator

- (COStateManagerClientInterfaceMediator)initWithStateManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)COStateManagerClientInterfaceMediator;
  v5 = [(COStateManagerClientInterfaceMediator *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_manager, v4);
  }

  return v6;
}

- (void)changesObserved:(id)a3 forPredicate:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  objc_super v8 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained changesObserved:v9 forPredicate:v6];
  }
}

- (COStateManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);

  return (COStateManager *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end