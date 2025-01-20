@interface CLSHolidayCalendarEventOverrides
- (CLSHolidayCalendarEventOverrides)initWithUUID:(id)a3 countryCode:(id)a4 dateRuleOverrides:(id)a5 locationScore:(double)a6 sceneImportanceOverrides:(id)a7;
- (NSArray)dateRuleOverrides;
- (NSDictionary)sceneImportanceOverrides;
- (NSString)countryCode;
- (NSString)uuid;
- (double)locationScore;
- (id)sceneImportanceStringForSceneName:(id)a3;
@end

@implementation CLSHolidayCalendarEventOverrides

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneImportanceOverrides, 0);
  objc_storeStrong((id *)&self->_dateRuleOverrides, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (NSDictionary)sceneImportanceOverrides
{
  return self->_sceneImportanceOverrides;
}

- (double)locationScore
{
  return self->_locationScore;
}

- (NSArray)dateRuleOverrides
{
  return self->_dateRuleOverrides;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (id)sceneImportanceStringForSceneName:(id)a3
{
  return [(NSDictionary *)self->_sceneImportanceOverrides objectForKeyedSubscript:a3];
}

- (CLSHolidayCalendarEventOverrides)initWithUUID:(id)a3 countryCode:(id)a4 dateRuleOverrides:(id)a5 locationScore:(double)a6 sceneImportanceOverrides:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CLSHolidayCalendarEventOverrides;
  v17 = [(CLSHolidayCalendarEventOverrides *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_uuid, a3);
    objc_storeStrong((id *)&v18->_countryCode, a4);
    objc_storeStrong((id *)&v18->_dateRuleOverrides, a5);
    v18->_locationScore = a6;
    objc_storeStrong((id *)&v18->_sceneImportanceOverrides, a7);
  }

  return v18;
}

@end