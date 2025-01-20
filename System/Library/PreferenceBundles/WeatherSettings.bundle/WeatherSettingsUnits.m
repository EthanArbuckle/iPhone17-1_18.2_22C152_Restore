@interface WeatherSettingsUnits
- (NSUnitTemperature)preferredTemperatureUnit;
- (_TtC15WeatherSettings20WeatherSettingsUnits)init;
- (void)refreshUnits;
- (void)refreshUnitsWithCompletionHandler:(id)a3;
- (void)setPreferredTemperatureUnit:(id)a3;
@end

@implementation WeatherSettingsUnits

- (_TtC15WeatherSettings20WeatherSettingsUnits)init
{
  return (_TtC15WeatherSettings20WeatherSettingsUnits *)sub_72AC();
}

- (void)refreshUnits
{
  v2 = self;
  sub_73C0();
}

- (void)refreshUnitsWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  v6 = self;

  sub_7804((uint64_t)&unk_11340, v5);
}

- (void)setPreferredTemperatureUnit:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_7908(a3);
}

- (NSUnitTemperature)preferredTemperatureUnit
{
  v2 = self;
  v3 = (void *)sub_7AA0();

  return (NSUnitTemperature *)v3;
}

@end