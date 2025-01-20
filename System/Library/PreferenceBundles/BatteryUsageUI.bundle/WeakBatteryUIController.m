@interface WeakBatteryUIController
- (WeakBatteryUIController)initWithController:(id)a3;
- (id)buiViewController;
@end

@implementation WeakBatteryUIController

- (WeakBatteryUIController)initWithController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WeakBatteryUIController;
  v5 = [(WeakBatteryUIController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_weakController, v4);
  }

  return v6;
}

- (id)buiViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakController);

  return WeakRetained;
}

- (void).cxx_destruct
{
}

@end