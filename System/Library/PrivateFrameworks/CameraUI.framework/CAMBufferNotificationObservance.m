@interface CAMBufferNotificationObservance
- (CAMBufferNotificationObservance)initWithNotification:(id)a3 object:(id)a4 center:(id)a5 removeOnceEnabled:(BOOL)a6;
- (NSNotificationCenter)notificationCenter;
- (NSObject)object;
- (NSString)notification;
- (void)fulfillWithChange:(id)a3;
- (void)setupObservanceForBuffer:(id)a3;
- (void)teardownObservanceForBuffer:(id)a3;
@end

@implementation CAMBufferNotificationObservance

- (CAMBufferNotificationObservance)initWithNotification:(id)a3 object:(id)a4 center:(id)a5 removeOnceEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CAMBufferNotificationObservance;
  v14 = [(CAMBufferObservance *)&v18 initWithPredicate:0 removedOnceEnabled:v6];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_notification, a3);
    objc_storeWeak((id *)&v15->_object, v12);
    objc_storeStrong((id *)&v15->_notificationCenter, a5);
    v16 = v15;
  }

  return v15;
}

- (void)fulfillWithChange:(id)a3
{
  id v10 = a3;
  if (![(CAMBufferObservance *)self isFulfilled]) {
    [(CAMBufferObservance *)self setFulfilled:1];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v10;
    v5 = [(CAMBufferNotificationObservance *)self notification];
    BOOL v6 = [(CAMBufferNotificationObservance *)self object];
    v7 = [v4 notification];
    if ([v7 isEqualToString:v5])
    {
      v8 = [v4 object];
      uint64_t v9 = [v8 isEqual:v6];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  [(CAMBufferObservance *)self setEnabled:v9];
}

- (void)setupObservanceForBuffer:(id)a3
{
  id v4 = a3;
  id v7 = [(CAMBufferNotificationObservance *)self notification];
  v5 = [(CAMBufferNotificationObservance *)self object];
  BOOL v6 = [(CAMBufferNotificationObservance *)self notificationCenter];
  [v6 addObserver:v4 selector:sel_handleObservedNotification_ name:v7 object:v5];
}

- (void)teardownObservanceForBuffer:(id)a3
{
  id v4 = a3;
  id v7 = [(CAMBufferNotificationObservance *)self notification];
  v5 = [(CAMBufferNotificationObservance *)self object];
  BOOL v6 = [(CAMBufferNotificationObservance *)self notificationCenter];
  [v6 removeObserver:v4 name:v7 object:v5];
}

- (NSString)notification
{
  return self->_notification;
}

- (NSObject)object
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);
  return WeakRetained;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_object);
  objc_storeStrong((id *)&self->_notification, 0);
}

@end