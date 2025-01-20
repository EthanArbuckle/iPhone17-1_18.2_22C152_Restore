@interface ServiceAlertController
- (ServiceAlertController)initWithRemoteViewControllerProxy:(id)a3;
- (ServiceAlertDelegate)delegate;
- (void)_disconnectFromAlertView:(id)a3;
- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4;
- (void)alertViewCancel:(id)a3;
- (void)dealloc;
- (void)presentAlertForDialog:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ServiceAlertController

- (ServiceAlertController)initWithRemoteViewControllerProxy:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ServiceAlertController;
  v6 = [(ServiceAlertController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_remoteViewControllerProxy, a3);
  }

  return v7;
}

- (void)dealloc
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_alertViews;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) setDelegate:0];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)ServiceAlertController;
  [(ServiceAlertController *)&v8 dealloc];
}

- (void)presentAlertForDialog:(id)a3
{
  id v4 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = self->_alertViews;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v28 != v8) {
        objc_enumerationMutation(v5);
      }
      long long v10 = objc_getAssociatedObject(*(id *)(*((void *)&v27 + 1) + 8 * v9), "com.apple.ios.StoreKitUIService.dialog");
      unsigned __int8 v11 = [v4 isEqual:v10];

      if (v11) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    id v5 = +[UIAlertView _alertViewForSessionWithRemoteViewController:self->_remoteViewControllerProxy];
    objc_setAssociatedObject(v5, "com.apple.ios.StoreKitUIService.dialog", v4, (void *)1);
    [(NSMutableArray *)v5 setDelegate:self];
    long long v12 = [v4 message];
    [(NSMutableArray *)v5 setMessage:v12];

    v13 = [v4 title];
    [(NSMutableArray *)v5 setTitle:v13];

    v14 = [v4 buttons];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        v18 = 0;
        do
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v18) title];
          [(NSMutableArray *)v5 addButtonWithTitle:v19];

          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v16);
    }
    alertViews = self->_alertViews;
    if (!alertViews)
    {
      v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v22 = self->_alertViews;
      self->_alertViews = v21;

      alertViews = self->_alertViews;
    }
    [(NSMutableArray *)alertViews addObject:v5];
    [(NSMutableArray *)v5 show];
  }
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  id v6 = a3;
  objc_getAssociatedObject(v6, "com.apple.ios.StoreKitUIService.dialog");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [(ServiceAlertController *)self _disconnectFromAlertView:v6];

  id v7 = [(ServiceAlertController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [v11 buttons];
    uint64_t v9 = v8;
    if ((a4 & 0x8000000000000000) == 0 && (unint64_t)[v8 count] > a4)
    {
      long long v10 = [v9 objectAtIndex:a4];
      [v7 alertController:self alertDidFinishWithButton:v10];
    }
  }
}

- (void)alertViewCancel:(id)a3
{
  [(ServiceAlertController *)self _disconnectFromAlertView:a3];
  id v4 = [(ServiceAlertController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 alertController:self alertDidFinishWithButton:0];
  }
}

- (void)_disconnectFromAlertView:(id)a3
{
  id v6 = a3;
  if ([(id)objc_opt_class() instancesRespondToSelector:"_target"])
  {
    uint64_t v4 = [v6 _target];

    id v6 = (id)v4;
  }
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:v6 name:@"_UIViewServiceHostedWindowWillDisconnectNotificationName" object:0];
  [v5 removeObserver:v6 name:@"_UIViewServiceRemoteViewControllerWillDisconnectNotificationName" object:0];
  [v6 setDelegate:0];
  [(NSMutableArray *)self->_alertViews removeObjectIdenticalTo:v6];
}

- (ServiceAlertDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ServiceAlertDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteViewControllerProxy, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_alertViews, 0);
}

@end