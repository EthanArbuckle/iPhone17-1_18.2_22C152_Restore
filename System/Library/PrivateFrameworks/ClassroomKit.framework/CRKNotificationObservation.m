@interface CRKNotificationObservation
+ (id)observationWithNotificationCenter:(id)a3 notificationName:(id)a4 object:(id)a5 notificationHandler:(id)a6;
- (CRKNotificationObservation)initWithNotificationCenter:(id)a3 notificationName:(id)a4 object:(id)a5 notificationHandler:(id)a6;
- (NSNotificationCenter)notificationCenter;
- (NSObject)object;
- (NSString)notificationName;
- (id)notificationHandler;
- (void)beginObserving;
- (void)dealloc;
- (void)endObserving;
- (void)invalidate;
- (void)notificationDidFire:(id)a3;
- (void)setNotificationHandler:(id)a3;
- (void)setObject:(id)a3;
@end

@implementation CRKNotificationObservation

- (void)dealloc
{
  [(CRKNotificationObservation *)self endObserving];
  v3.receiver = self;
  v3.super_class = (Class)CRKNotificationObservation;
  [(CRKNotificationObservation *)&v3 dealloc];
}

- (CRKNotificationObservation)initWithNotificationCenter:(id)a3 notificationName:(id)a4 object:(id)a5 notificationHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CRKNotificationObservation;
  v15 = [(CRKNotificationObservation *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_notificationCenter, a3);
    uint64_t v17 = [v12 copy];
    notificationName = v16->_notificationName;
    v16->_notificationName = (NSString *)v17;

    objc_storeStrong((id *)&v16->_object, a5);
    uint64_t v19 = MEMORY[0x22A620AF0](v14);
    id notificationHandler = v16->_notificationHandler;
    v16->_id notificationHandler = (id)v19;
  }
  return v16;
}

+ (id)observationWithNotificationCenter:(id)a3 notificationName:(id)a4 object:(id)a5 notificationHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[objc_alloc((Class)a1) initWithNotificationCenter:v13 notificationName:v12 object:v11 notificationHandler:v10];

  [v14 beginObserving];

  return v14;
}

- (void)invalidate
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __40__CRKNotificationObservation_invalidate__block_invoke;
  v2[3] = &unk_2646F3D40;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __40__CRKNotificationObservation_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained notificationHandler];

    id WeakRetained = v3;
    if (v2)
    {
      [v3 endObserving];
      [v3 setNotificationHandler:0];
      [v3 setObject:0];
      id WeakRetained = v3;
    }
  }
}

- (void)beginObserving
{
  id v5 = [(CRKNotificationObservation *)self notificationCenter];
  id v3 = [(CRKNotificationObservation *)self notificationName];
  v4 = [(CRKNotificationObservation *)self object];
  [v5 addObserver:self selector:sel_notificationDidFire_ name:v3 object:v4];
}

- (void)endObserving
{
  id v5 = [(CRKNotificationObservation *)self notificationCenter];
  id v3 = [(CRKNotificationObservation *)self notificationName];
  v4 = [(CRKNotificationObservation *)self object];
  [v5 removeObserver:self name:v3 object:v4];
}

- (void)notificationDidFire:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__CRKNotificationObservation_notificationDidFire___block_invoke;
  block[3] = &unk_2646F3EC8;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __50__CRKNotificationObservation_notificationDidFire___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [WeakRetained notificationHandler];

    id WeakRetained = v5;
    if (v3)
    {
      id v4 = [v5 notificationHandler];
      v4[2](v4, *(void *)(a1 + 32));

      id WeakRetained = v5;
    }
  }
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSObject)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (id)notificationHandler
{
  return self->_notificationHandler;
}

- (void)setNotificationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationHandler, 0);
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);

  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end