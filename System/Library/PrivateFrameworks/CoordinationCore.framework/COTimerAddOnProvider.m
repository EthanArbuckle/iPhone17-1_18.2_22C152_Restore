@interface COTimerAddOnProvider
- (COHomeHubAdapter)homehub;
- (COHomeKitAdapter)homekit;
- (COTimerAddOnProvider)init;
- (COTimerAddOnProvider)initWithTimerManager:(id)a3 homekitAdapter:(id)a4 hubAdapter:(id)a5;
- (MTTimerManager)timerManager;
- (id)serviceAddOn;
@end

@implementation COTimerAddOnProvider

- (COTimerAddOnProvider)initWithTimerManager:(id)a3 homekitAdapter:(id)a4 hubAdapter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)COTimerAddOnProvider;
  v12 = [(COTimerAddOnProvider *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_timerManager, a3);
    objc_storeStrong((id *)&v13->_homekit, a4);
    objc_storeStrong((id *)&v13->_homehub, a5);
  }

  return v13;
}

- (COTimerAddOnProvider)init
{
  id v3 = objc_alloc_init(MEMORY[0x263F55DA0]);
  v4 = +[COHomeKitAdapter sharedInstance];
  v5 = +[COHomeHubAdapter sharedInstance];
  v6 = [(COTimerAddOnProvider *)self initWithTimerManager:v3 homekitAdapter:v4 hubAdapter:v5];

  return v6;
}

- (id)serviceAddOn
{
  id v3 = [COMeshTimerAddOn alloc];
  v4 = [(COTimerAddOnProvider *)self timerManager];
  v5 = [(COTimerAddOnProvider *)self homekit];
  v6 = [(COTimerAddOnProvider *)self homehub];
  v7 = [(COMeshTimerAddOn *)v3 initWithTimerManager:v4 homekitAdapter:v5 hubAdapter:v6];

  return v7;
}

- (MTTimerManager)timerManager
{
  return self->_timerManager;
}

- (COHomeKitAdapter)homekit
{
  return self->_homekit;
}

- (COHomeHubAdapter)homehub
{
  return self->_homehub;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homehub, 0);
  objc_storeStrong((id *)&self->_homekit, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
}

@end