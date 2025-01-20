@interface WeatherSettingsState
+ (_TtC15WeatherSettings20WeatherSettingsState)defaultState;
- (BOOL)resetIdentifier;
- (BOOL)showHomeWorkLabels;
- (_TtC15WeatherSettings20WeatherSettingsState)init;
- (_TtC15WeatherSettings20WeatherSettingsUnits)units;
- (void)setResetIdentifier:(BOOL)a3;
- (void)setShowHomeWorkLabels:(BOOL)a3;
@end

@implementation WeatherSettingsState

+ (_TtC15WeatherSettings20WeatherSettingsState)defaultState
{
  id v2 = sub_8688();

  return (_TtC15WeatherSettings20WeatherSettingsState *)v2;
}

- (_TtC15WeatherSettings20WeatherSettingsUnits)units
{
  id v2 = sub_8740();

  return (_TtC15WeatherSettings20WeatherSettingsUnits *)v2;
}

- (BOOL)resetIdentifier
{
  id v2 = self;
  unsigned __int8 v3 = sub_883C(0x800000000000BB20, 0);

  return v3 & 1;
}

- (void)setResetIdentifier:(BOOL)a3
{
  unsigned __int8 v3 = self;
  sub_890C();
}

- (BOOL)showHomeWorkLabels
{
  id v2 = self;
  unsigned __int8 v3 = sub_883C(0x800000000000BAF0, 1);

  return v3 & 1;
}

- (void)setShowHomeWorkLabels:(BOOL)a3
{
  unsigned __int8 v3 = self;
  sub_890C();
}

- (_TtC15WeatherSettings20WeatherSettingsState)init
{
  return (_TtC15WeatherSettings20WeatherSettingsState *)sub_89A0();
}

- (void).cxx_destruct
{
}

@end