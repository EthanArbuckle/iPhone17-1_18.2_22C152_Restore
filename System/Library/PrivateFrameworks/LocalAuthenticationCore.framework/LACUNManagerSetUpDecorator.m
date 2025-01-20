@interface LACUNManagerSetUpDecorator
- (LACUNManagerDelegate)delegate;
- (LACUNManagerSetUpDecorator)initWithManagerBuilder:(id)a3;
- (LACUNManagerSetUpDecorator)initWithManagerBuilder:(id)a3 setupStateProvider:(id)a4;
- (id)responder;
- (void)cancelAllNotificationsWithCompletion:(id)a3;
- (void)cancelNotificationsWithIdentifiers:(id)a3 scheduledOnly:(BOOL)a4 completion:(id)a5;
- (void)postNotification:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation LACUNManagerSetUpDecorator

- (LACUNManagerSetUpDecorator)initWithManagerBuilder:(id)a3
{
  id v4 = a3;
  v5 = +[LACSetUpStateProvider sharedInstance];
  v6 = [(LACUNManagerSetUpDecorator *)self initWithManagerBuilder:v4 setupStateProvider:v5];

  return v6;
}

- (LACUNManagerSetUpDecorator)initWithManagerBuilder:(id)a3 setupStateProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACUNManagerSetUpDecorator;
  v8 = [(LACUNManagerSetUpDecorator *)&v12 init];
  if (v8)
  {
    v9 = _Block_copy(v6);
    id responderBuilder = v8->_responderBuilder;
    v8->_id responderBuilder = v9;

    objc_storeStrong((id *)&v8->_setupStateProvider, a4);
  }

  return v8;
}

- (void)cancelAllNotificationsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  v5 = [(LACUNManagerSetUpDecorator *)self responder];
  id v6 = v5;
  if (v5)
  {
    [v5 cancelAllNotificationsWithCompletion:v4];
  }
  else
  {
    id v7 = LACLogNotifications();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[LACUNManagerSetUpDecorator cancelAllNotificationsWithCompletion:](v7, v8, v9, v10, v11, v12, v13, v14);
    }

    if (v4)
    {
      v15 = +[LACError errorWithCode:-1000 debugDescription:@"Service not available in Setup"];
      v4[2](v4, v15);
    }
  }
}

- (void)cancelNotificationsWithIdentifiers:(id)a3 scheduledOnly:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *))a5;
  uint64_t v10 = [(LACUNManagerSetUpDecorator *)self responder];
  uint64_t v11 = v10;
  if (v10)
  {
    [v10 cancelNotificationsWithIdentifiers:v8 scheduledOnly:v6 completion:v9];
  }
  else
  {
    uint64_t v12 = LACLogNotifications();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[LACUNManagerSetUpDecorator cancelAllNotificationsWithCompletion:](v12, v13, v14, v15, v16, v17, v18, v19);
    }

    if (v9)
    {
      v20 = +[LACError errorWithCode:-1000 debugDescription:@"Service not available in Setup"];
      v9[2](v9, v20);
    }
  }
}

- (void)postNotification:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(LACUNManagerSetUpDecorator *)self responder];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 postNotification:v6 completion:v7];
  }
  else
  {
    uint64_t v10 = LACLogNotifications();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[LACUNManagerSetUpDecorator cancelAllNotificationsWithCompletion:](v10, v11, v12, v13, v14, v15, v16, v17);
    }

    if (v7)
    {
      uint64_t v18 = +[LACError errorWithCode:-1000 debugDescription:@"Service not available in Setup"];
      v7[2](v7, v18);
    }
  }
}

- (LACUNManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LACUNManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  [(LACUNManager *)self->_responder setDelegate:v5];
}

- (id)responder
{
  if ([(LACSetUpStateProvider *)self->_setupStateProvider hasCompletedSetup])
  {
    responder = self->_responder;
    if (responder)
    {
      id v4 = responder;
    }
    else
    {
      (*((void (**)(void))self->_responderBuilder + 2))();
      id v4 = (LACUNManager *)objc_claimAutoreleasedReturnValue();
    }
    id v6 = self->_responder;
    self->_responder = v4;

    id v7 = self->_responder;
    id v8 = [(LACUNManagerSetUpDecorator *)self delegate];
    [(LACUNManager *)v7 setDelegate:v8];

    id v5 = self->_responder;
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_setupStateProvider, 0);
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong(&self->_responderBuilder, 0);
}

- (void)cancelAllNotificationsWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end