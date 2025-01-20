@interface GEOAPDailySettingsQueueElem
- (BOOL)isEqual:(id)a3;
- (GEOAPDailySettingsQueueElem)initWithSettings:(id)a3 createTime:(id)a4;
- (GEOLogMsgEventPeriodicSettingsSummary)settings;
- (id)copy;
- (unint64_t)hash;
@end

@implementation GEOAPDailySettingsQueueElem

- (GEOAPDailySettingsQueueElem)initWithSettings:(id)a3 createTime:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOAPDailySettingsQueueElem;
  v9 = [(GEOAPQueueElem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->super._createTime, a4);
    objc_storeStrong((id *)&v10->_settings, a3);
  }

  return v10;
}

- (id)copy
{
  v3 = [GEOAPDailySettingsQueueElem alloc];
  settings = self->_settings;
  createTime = self->super._createTime;
  return [(GEOAPDailySettingsQueueElem *)v3 initWithSettings:settings createTime:createTime];
}

- (unint64_t)hash
{
  v3 = [(GEOAPQueueElem *)self createTime];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = [(GEOAPDailySettingsQueueElem *)self settings];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [v5 createTime];
    id v7 = [(GEOAPQueueElem *)self createTime];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;

    double v10 = -v9;
    if (v9 >= 0.0) {
      double v10 = v9;
    }
    if (v10 >= 1.0)
    {
      unsigned __int8 v13 = 0;
    }
    else
    {
      settings = self->_settings;
      objc_super v12 = [v5 settings];
      unsigned __int8 v13 = [(GEOLogMsgEventPeriodicSettingsSummary *)settings isEqual:v12];
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (GEOLogMsgEventPeriodicSettingsSummary)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
}

@end