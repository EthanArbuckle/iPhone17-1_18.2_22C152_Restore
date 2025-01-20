@interface MUBusinessHoursConfiguration
- (BOOL)isServiceHours;
- (MUBusinessHoursConfiguration)initWithBusinessHours:(id)a3 timeZone:(id)a4;
- (NSArray)businessHours;
- (NSString)hoursName;
- (NSTimeZone)placeTimeZone;
- (void)setHoursName:(id)a3;
- (void)setIsServiceHours:(BOOL)a3;
@end

@implementation MUBusinessHoursConfiguration

- (MUBusinessHoursConfiguration)initWithBusinessHours:(id)a3 timeZone:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MUBusinessHoursConfiguration;
  v9 = [(MUBusinessHoursConfiguration *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_businessHours, a3);
    objc_storeStrong((id *)&v10->_placeTimeZone, a4);
  }

  return v10;
}

- (NSTimeZone)placeTimeZone
{
  return self->_placeTimeZone;
}

- (NSArray)businessHours
{
  return self->_businessHours;
}

- (NSString)hoursName
{
  return self->_hoursName;
}

- (void)setHoursName:(id)a3
{
}

- (BOOL)isServiceHours
{
  return self->_isServiceHours;
}

- (void)setIsServiceHours:(BOOL)a3
{
  self->_isServiceHours = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoursName, 0);
  objc_storeStrong((id *)&self->_businessHours, 0);
  objc_storeStrong((id *)&self->_placeTimeZone, 0);
}

@end