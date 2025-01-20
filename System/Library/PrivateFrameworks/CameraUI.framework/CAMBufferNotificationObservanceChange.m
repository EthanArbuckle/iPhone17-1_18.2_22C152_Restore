@interface CAMBufferNotificationObservanceChange
- (CAMBufferNotificationObservanceChange)initWithNotification:(id)a3 object:(id)a4;
- (NSObject)object;
- (NSString)notification;
@end

@implementation CAMBufferNotificationObservanceChange

- (CAMBufferNotificationObservanceChange)initWithNotification:(id)a3 object:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CAMBufferNotificationObservanceChange;
  v8 = [(CAMBufferNotificationObservanceChange *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    notification = v8->_notification;
    v8->_notification = (NSString *)v9;

    objc_storeWeak((id *)&v8->_object, v7);
    v11 = v8;
  }

  return v8;
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_object);
  objc_storeStrong((id *)&self->_notification, 0);
}

@end