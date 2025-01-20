@interface CBRecordingIndicatorSettings
+ (id)settingsControllerModule;
- (int64_t)sensorType;
- (void)setDefaultValues;
- (void)setSensorType:(int64_t)a3;
@end

@implementation CBRecordingIndicatorSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)CBRecordingIndicatorSettings;
  [(CBRecordingIndicatorSettings *)&v3 setDefaultValues];
  [(CBRecordingIndicatorSettings *)self setSensorType:0];
}

+ (id)settingsControllerModule
{
  v2 = +[PTChoiceRow rowWithTitle:@"Sensor Type" valueKeyPath:@"sensorType"];
  objc_super v3 = [v2 possibleValues:&off_10007CF98 titles:&off_10007CF80];

  v15 = v3;
  v4 = +[NSArray arrayWithObjects:&v15 count:1];
  v5 = +[PTModule sectionWithRows:v4 title:@"Override Sensor State"];

  v6 = +[PTRestoreDefaultSettingsRowAction actionWithSettingsKeyPath:0];
  v7 = +[PTButtonRow rowWithTitle:@"Restore Defaults" action:v6];

  v14 = v7;
  v8 = +[NSArray arrayWithObjects:&v14 count:1];
  v9 = +[PTModule sectionWithRows:v8];

  v13[0] = v5;
  v13[1] = v9;
  v10 = +[NSArray arrayWithObjects:v13 count:2];
  v11 = +[PTModule moduleWithTitle:0 contents:v10];

  return v11;
}

- (int64_t)sensorType
{
  return self->_sensorType;
}

- (void)setSensorType:(int64_t)a3
{
  self->_sensorType = a3;
}

@end