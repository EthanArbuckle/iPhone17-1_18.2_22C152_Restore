@interface ATXAppLaunchMicroLocationGuardedData
- (ATXAppLaunchMicroLocationGuardedData)initWithCurrentMicroLocation:(id)a3;
- (BOOL)microLocationExpired:(id)a3;
- (id)getCurrentMicroLocation;
- (void)setCurrentMicroLocation:(id)a3;
@end

@implementation ATXAppLaunchMicroLocationGuardedData

- (ATXAppLaunchMicroLocationGuardedData)initWithCurrentMicroLocation:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ATXAppLaunchMicroLocationGuardedData;
  v5 = [(ATXAppLaunchMicroLocationGuardedData *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ATXAppLaunchMicroLocationGuardedData *)v5 setCurrentMicroLocation:v4];
  }

  return v6;
}

- (void)setCurrentMicroLocation:(id)a3
{
  id v17 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  v5 = [v17 startDate];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;
  objc_super v8 = [v17 endDate];
  [v8 timeIntervalSinceReferenceDate];
  v10 = [v4 dateWithTimeIntervalSinceReferenceDate:v9 * 0.5 + v7 * 0.5];

  if (v17 && ![(ATXAppLaunchMicroLocationGuardedData *)self microLocationExpired:v10])
  {
    v13 = [v17 event];
    v14 = (NSDictionary *)[v13 copy];
    currentMicroLocation = self->_currentMicroLocation;
    self->_currentMicroLocation = v14;

    v16 = (NSDate *)[v10 copy];
    currentMicroLocationDate = self->_currentMicroLocationDate;
    self->_currentMicroLocationDate = v16;
  }
  else
  {
    v11 = self->_currentMicroLocation;
    self->_currentMicroLocation = 0;

    currentMicroLocationDate = self->_currentMicroLocationDate;
    self->_currentMicroLocationDate = 0;
  }
}

- (id)getCurrentMicroLocation
{
  if ([(ATXAppLaunchMicroLocationGuardedData *)self microLocationExpired:self->_currentMicroLocationDate])
  {
    currentMicroLocationDate = self->_currentMicroLocationDate;
    self->_currentMicroLocationDate = 0;

    currentMicroLocation = self->_currentMicroLocation;
    self->_currentMicroLocation = 0;
  }
  v5 = self->_currentMicroLocation;
  return v5;
}

- (BOOL)microLocationExpired:(id)a3
{
  [a3 timeIntervalSinceNow];
  BOOL v6 = v4 > 0.0 || a3 == 0;
  return v4 <= -300.0 || v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationToActionKeyCorrelation, 0);
  objc_storeStrong((id *)&self->_locationToAppLaunchCorrelation, 0);
  objc_storeStrong((id *)&self->_currentMicroLocationDate, 0);
  objc_storeStrong((id *)&self->_currentMicroLocation, 0);
  objc_storeStrong(&self->_waitForUnlockNotificationToken, 0);
}

@end