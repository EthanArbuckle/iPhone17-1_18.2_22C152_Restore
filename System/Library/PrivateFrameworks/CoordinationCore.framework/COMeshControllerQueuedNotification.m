@interface COMeshControllerQueuedNotification
- (COMeshControllerQueuedNotification)initWithNotification:(id)a3 destination:(id)a4;
- (COMeshNode)destination;
- (COMeshNotification)notification;
@end

@implementation COMeshControllerQueuedNotification

- (COMeshControllerQueuedNotification)initWithNotification:(id)a3 destination:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)COMeshControllerQueuedNotification;
  v9 = [(COMeshControllerQueuedNotification *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notification, a3);
    objc_storeStrong((id *)&v10->_destination, a4);
  }

  return v10;
}

- (COMeshNotification)notification
{
  return self->_notification;
}

- (COMeshNode)destination
{
  return self->_destination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_notification, 0);
}

@end