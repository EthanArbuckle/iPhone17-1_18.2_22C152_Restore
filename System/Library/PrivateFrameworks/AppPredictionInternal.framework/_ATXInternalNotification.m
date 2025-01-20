@interface _ATXInternalNotification
+ (void)postData:(id)a3 forNotificationNamed:(id)a4;
- (_ATXInternalNotification)initWithNotificationName:(id)a3;
- (void)dealloc;
- (void)registerForNotifications:(id)a3;
@end

@implementation _ATXInternalNotification

- (_ATXInternalNotification)initWithNotificationName:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_ATXInternalNotification.m", 21, @"Invalid parameter not satisfying: %@", @"notificationName" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)_ATXInternalNotification;
  v7 = [(_ATXInternalNotification *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_notificationName, a3);
    pthread_mutex_init(&v8->_lock, 0);
  }

  return v8;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_token)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self->_token];
  }
  pthread_mutex_unlock(p_lock);
  pthread_mutex_destroy(p_lock);
  v5.receiver = self;
  v5.super_class = (Class)_ATXInternalNotification;
  [(_ATXInternalNotification *)&v5 dealloc];
}

- (void)registerForNotifications:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&self->_lock);
  if (!self->_token)
  {
    objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    notificationName = self->_notificationName;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53___ATXInternalNotification_registerForNotifications___block_invoke;
    v9[3] = &unk_1E68B3268;
    id v10 = v4;
    v7 = [v5 addObserverForName:notificationName object:0 queue:0 usingBlock:v9];
    id token = self->_token;
    self->_id token = v7;
  }
  pthread_mutex_unlock(&self->_lock);
}

+ (void)postData:(id)a3 forNotificationNamed:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v9 = @"data";
    v10[0] = v5;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    v7 = 0;
  }
  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:v6 object:0 userInfo:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_token, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end