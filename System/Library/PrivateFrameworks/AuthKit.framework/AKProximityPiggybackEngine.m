@interface AKProximityPiggybackEngine
- (AKProximityEngineController)controller;
- (AKProximityPiggybackEngine)initWithPresenceSID:(id)a3;
- (BOOL)isActivated;
- (NSUUID)presenceSID;
- (OS_dispatch_queue)queue;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)prepareWithController:(id)a3 queue:(id)a4;
@end

@implementation AKProximityPiggybackEngine

- (AKProximityPiggybackEngine)initWithPresenceSID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKProximityPiggybackEngine;
  v6 = [(AKProximityPiggybackEngine *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_presenceSID, a3);
  }

  return v7;
}

- (void)dealloc
{
  v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1001883BC(v3);
  }

  [(AKProximityPiggybackEngine *)self invalidate];
  v4.receiver = self;
  v4.super_class = (Class)AKProximityPiggybackEngine;
  [(AKProximityPiggybackEngine *)&v4 dealloc];
}

- (void)prepareWithController:(id)a3 queue:(id)a4
{
  v6 = (OS_dispatch_queue *)a4;
  objc_storeWeak((id *)&self->_controller, a3);
  queue = self->_queue;
  self->_queue = v6;
}

- (void)activate
{
  id v3 = [(AKProximityPiggybackEngine *)self controller];
  [v3 proximityEngineDidActivate:self];
}

- (void)invalidate
{
  id v3 = [(AKProximityPiggybackEngine *)self controller];
  [v3 proximityEngineDidInvalidate:self];
}

- (BOOL)isActivated
{
  return 0;
}

- (AKProximityEngineController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (AKProximityEngineController *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSUUID)presenceSID
{
  return self->_presenceSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenceSID, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_controller);
}

@end