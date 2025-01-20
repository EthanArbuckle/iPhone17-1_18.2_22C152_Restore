@interface MPUNotificationObserver
+ (id)observerWithName:(id)a3 object:(id)a4 queue:(id)a5 observationHandler:(id)a6;
- (MPUNotificationObserver)initWithName:(id)a3 object:(id)a4 queue:(id)a5 observationHandler:(id)a6;
- (id)notificationObservationToken;
- (void)dealloc;
- (void)setNotificationObservationToken:(id)a3;
@end

@implementation MPUNotificationObserver

+ (id)observerWithName:(id)a3 object:(id)a4 queue:(id)a5 observationHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithName:v13 object:v12 queue:v11 observationHandler:v10];

  return v14;
}

- (MPUNotificationObserver)initWithName:(id)a3 object:(id)a4 queue:(id)a5 observationHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MPUNotificationObserver;
  v14 = [(MPUNotificationObserver *)&v19 init];
  if (v14)
  {
    v15 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v16 = [v15 addObserverForName:v10 object:v11 queue:v12 usingBlock:v13];
    id notificationObservationToken = v14->_notificationObservationToken;
    v14->_id notificationObservationToken = (id)v16;
  }
  return v14;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  v4 = [(MPUNotificationObserver *)self notificationObservationToken];
  [v3 removeObserver:v4];

  v5.receiver = self;
  v5.super_class = (Class)MPUNotificationObserver;
  [(MPUNotificationObserver *)&v5 dealloc];
}

- (id)notificationObservationToken
{
  return self->_notificationObservationToken;
}

- (void)setNotificationObservationToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end