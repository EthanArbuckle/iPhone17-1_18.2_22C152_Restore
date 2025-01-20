@interface COAlarmAddOnProvider
- (COAlarmAddOnProvider)init;
- (COAlarmAddOnProvider)initWithAlarmManager:(id)a3 homekitAdapter:(id)a4 hubAdapter:(id)a5;
- (COHomeHubAdapter)homehub;
- (COHomeKitAdapter)homekit;
- (MTAlarmManager)alarmManager;
- (id)serviceAddOn;
@end

@implementation COAlarmAddOnProvider

- (COAlarmAddOnProvider)initWithAlarmManager:(id)a3 homekitAdapter:(id)a4 hubAdapter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)COAlarmAddOnProvider;
  v12 = [(COAlarmAddOnProvider *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_alarmManager, a3);
    objc_storeStrong((id *)&v13->_homekit, a4);
    objc_storeStrong((id *)&v13->_homehub, a5);
  }

  return v13;
}

- (COAlarmAddOnProvider)init
{
  id v3 = objc_alloc_init(MEMORY[0x263F55D50]);
  v4 = +[COHomeKitAdapter sharedInstance];
  v5 = +[COHomeHubAdapter sharedInstance];
  v6 = [(COAlarmAddOnProvider *)self initWithAlarmManager:v3 homekitAdapter:v4 hubAdapter:v5];

  return v6;
}

- (id)serviceAddOn
{
  id v3 = [COMeshAlarmAddOn alloc];
  v4 = [(COAlarmAddOnProvider *)self alarmManager];
  v5 = [(COAlarmAddOnProvider *)self homekit];
  v6 = [(COAlarmAddOnProvider *)self homehub];
  v7 = [(COMeshAlarmAddOn *)v3 initWithAlarmManager:v4 homekitAdapter:v5 hubAdapter:v6];

  return v7;
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
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
  objc_storeStrong((id *)&self->_alarmManager, 0);
}

@end