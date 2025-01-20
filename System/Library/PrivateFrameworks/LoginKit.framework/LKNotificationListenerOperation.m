@interface LKNotificationListenerOperation
- (BOOL)isCancelled;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)operationCancelled;
- (BOOL)operationExecuting;
- (BOOL)operationFinished;
- (BOOL)operationReady;
- (LKNotificationListenerOperation)initWithNotificationType:(unint64_t)a3 timeOutPeriod:(double)a4 completionBlock:(id)a5;
- (double)timeOutPeriod;
- (id)_errorForNotificationType:(unint64_t)a3;
- (id)_notificationForNotificationType:(unint64_t)a3;
- (id)listenerStartedBlock;
- (id)notificationListenerCompletionBlock;
- (int)notifyToken;
- (unint64_t)notificationType;
- (void)_endOperation;
- (void)cancel;
- (void)setListenerStartedBlock:(id)a3;
- (void)setNotificationListenerCompletionBlock:(id)a3;
- (void)setNotificationType:(unint64_t)a3;
- (void)setNotifyToken:(int)a3;
- (void)setOperationCancelled:(BOOL)a3;
- (void)setOperationExecuting:(BOOL)a3;
- (void)setOperationFinished:(BOOL)a3;
- (void)setOperationReady:(BOOL)a3;
- (void)setTimeOutPeriod:(double)a3;
- (void)start;
@end

@implementation LKNotificationListenerOperation

- (LKNotificationListenerOperation)initWithNotificationType:(unint64_t)a3 timeOutPeriod:(double)a4 completionBlock:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)LKNotificationListenerOperation;
  v9 = [(LKNotificationListenerOperation *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_notificationType = a3;
    v9->_timeOutPeriod = a4;
    uint64_t v11 = MEMORY[0x223C96140](v8);
    id notificationListenerCompletionBlock = v10->_notificationListenerCompletionBlock;
    v10->_id notificationListenerCompletionBlock = (id)v11;

    v10->_notifyToken = -1;
  }

  return v10;
}

- (void)setOperationReady:(BOOL)a3
{
  if (self->_operationReady != a3)
  {
    [(LKNotificationListenerOperation *)self willChangeValueForKey:@"ready"];
    self->_operationReady = a3;
    [(LKNotificationListenerOperation *)self didChangeValueForKey:@"ready"];
  }
}

- (void)setOperationExecuting:(BOOL)a3
{
  if (self->_operationExecuting != a3)
  {
    [(LKNotificationListenerOperation *)self willChangeValueForKey:@"executing"];
    self->_operationExecuting = a3;
    [(LKNotificationListenerOperation *)self didChangeValueForKey:@"executing"];
  }
}

- (void)setOperationFinished:(BOOL)a3
{
  if (self->_operationFinished != a3)
  {
    [(LKNotificationListenerOperation *)self willChangeValueForKey:@"finished"];
    self->_operationFinished = a3;
    [(LKNotificationListenerOperation *)self didChangeValueForKey:@"finished"];
  }
}

- (void)setOperationCancelled:(BOOL)a3
{
  if (self->_operationCancelled != a3)
  {
    [(LKNotificationListenerOperation *)self willChangeValueForKey:@"cancelled"];
    self->_operationCancelled = a3;
    [(LKNotificationListenerOperation *)self didChangeValueForKey:@"cancelled"];
  }
}

- (void)start
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2221A9000, log, OS_LOG_TYPE_ERROR, "No listenerStartedBlock is set. This shouldn't happen", v1, 2u);
}

void __40__LKNotificationListenerOperation_start__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  char v3 = [*(id *)(a1 + 32) isCancelled];
  v4 = *(void **)(a1 + 32);
  if ((v3 & 1) == 0)
  {
    v5 = [v4 notificationListenerCompletionBlock];

    if (v5)
    {
      v6 = [*(id *)(a1 + 32) notificationListenerCompletionBlock];
      ((void (**)(void, id))v6)[2](v6, v7);
    }
    v4 = *(void **)(a1 + 32);
  }
  [v4 _endOperation];
}

void __40__LKNotificationListenerOperation_start__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = (void *)LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    char v3 = *(void **)(a1 + 32);
    v4 = v2;
    [v3 timeOutPeriod];
    int v8 = 134217984;
    uint64_t v9 = v5;
    _os_log_impl(&dword_2221A9000, v4, OS_LOG_TYPE_DEFAULT, "Notification hasn't posted in the given period (%f seconds). Timing out.", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = objc_msgSend(*(id *)(a1 + 32), "_errorForNotificationType:", objc_msgSend(*(id *)(a1 + 32), "notificationType"));
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

uint64_t __40__LKNotificationListenerOperation_start__block_invoke_12(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2221A9000, v2, OS_LOG_TYPE_DEFAULT, "Notified with %@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)cancel
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([(LKNotificationListenerOperation *)self isExecuting]
    && [(LKNotificationListenerOperation *)self notifyToken] != -1)
  {
    uint64_t v3 = (void *)LKLogDefault;
    if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      int v5 = [(LKNotificationListenerOperation *)self _notificationForNotificationType:[(LKNotificationListenerOperation *)self notificationType]];
      *(_DWORD *)buf = 138412290;
      int v8 = v5;
      _os_log_impl(&dword_2221A9000, v4, OS_LOG_TYPE_DEFAULT, "Cancel listening the notification: %@", buf, 0xCu);
    }
    notify_cancel([(LKNotificationListenerOperation *)self notifyToken]);
  }
  [(LKNotificationListenerOperation *)self _endOperation];
  v6.receiver = self;
  v6.super_class = (Class)LKNotificationListenerOperation;
  [(LKNotificationListenerOperation *)&v6 cancel];
}

- (BOOL)isFinished
{
  return self->_operationFinished;
}

- (BOOL)isExecuting
{
  return self->_operationExecuting;
}

- (BOOL)isCancelled
{
  return self->_operationCancelled;
}

- (void)_endOperation
{
  [(LKNotificationListenerOperation *)self setOperationFinished:1];
  [(LKNotificationListenerOperation *)self setOperationExecuting:0];
  [(LKNotificationListenerOperation *)self setListenerStartedBlock:0];
}

- (id)_errorForNotificationType:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    uint64_t v5 = 25;
  }
  else
  {
    uint64_t v5 = 26;
  }
  +[LKError errorWithCode:](LKError, "errorWithCode:", v5, v3);
  self = (LKNotificationListenerOperation *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  return self;
}

- (id)_notificationForNotificationType:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    uint64_t v4 = LKLoggedInNotificationName;
  }
  else
  {
    uint64_t v4 = LKReadyToLoginNotificationName;
  }
  self = *v4;
LABEL_6:
  return self;
}

- (id)listenerStartedBlock
{
  return self->_listenerStartedBlock;
}

- (void)setListenerStartedBlock:(id)a3
{
}

- (unint64_t)notificationType
{
  return self->_notificationType;
}

- (void)setNotificationType:(unint64_t)a3
{
  self->_notificationType = a3;
}

- (double)timeOutPeriod
{
  return self->_timeOutPeriod;
}

- (void)setTimeOutPeriod:(double)a3
{
  self->_timeOutPeriod = a3;
}

- (id)notificationListenerCompletionBlock
{
  return self->_notificationListenerCompletionBlock;
}

- (void)setNotificationListenerCompletionBlock:(id)a3
{
}

- (BOOL)operationExecuting
{
  return self->_operationExecuting;
}

- (BOOL)operationFinished
{
  return self->_operationFinished;
}

- (BOOL)operationCancelled
{
  return self->_operationCancelled;
}

- (BOOL)operationReady
{
  return self->_operationReady;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationListenerCompletionBlock, 0);
  objc_storeStrong(&self->_listenerStartedBlock, 0);
}

@end