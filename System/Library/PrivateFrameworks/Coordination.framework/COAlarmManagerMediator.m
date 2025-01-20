@interface COAlarmManagerMediator
- (COAlarmManager)manager;
- (COAlarmManagerMediator)initWithAlarmManager:(id)a3;
- (void)postNotificationName:(id)a3 withUserInfo:(id)a4 callback:(id)a5;
@end

@implementation COAlarmManagerMediator

- (COAlarmManagerMediator)initWithAlarmManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)COAlarmManagerMediator;
  v5 = [(COAlarmManagerMediator *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_manager, v4);
  }

  return v6;
}

- (void)postNotificationName:(id)a3 withUserInfo:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(COAlarmManagerMediator *)self manager];
  [v11 postNotificationName:v10 withUserInfo:v9 callback:v8];
}

- (COAlarmManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);

  return (COAlarmManager *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end