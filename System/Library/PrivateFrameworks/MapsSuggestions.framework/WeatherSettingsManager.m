@interface WeatherSettingsManager
+ (id)settingsUpdatedNotification;
+ (id)sharedManager;
- (BOOL)shouldShowAirQualityConditions;
- (BOOL)shouldShowWeatherConditions;
- (WeatherSettingsManager)init;
- (id)initSharedManager;
- (void)_postWeatherConditionsSettingsUpdatedNotification;
- (void)countryConfigurationDidChange:(id)a3;
- (void)setShouldShowAirQualityConditions:(BOOL)a3;
- (void)setShouldShowWeatherConditions:(BOOL)a3;
@end

@implementation WeatherSettingsManager

+ (id)sharedManager
{
  if (qword_100081E88 != -1) {
    dispatch_once(&qword_100081E88, &stru_100071BD8);
  }
  v2 = (void *)qword_100081E80;
  return v2;
}

- (WeatherSettingsManager)init
{
  return 0;
}

- (id)initSharedManager
{
  v6.receiver = self;
  v6.super_class = (Class)WeatherSettingsManager;
  v2 = [(WeatherSettingsManager *)&v6 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"countryConfigurationDidChange:" name:GEOCountryConfigurationCountryCodeDidChangeNotification object:0];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"countryConfigurationDidChange:" name:GEOCountryConfigurationProvidersDidChangeNotification object:0];
  }
  return v2;
}

+ (id)settingsUpdatedNotification
{
  return @"WeatherConditionsNeedsUpdatedNotification";
}

- (void)countryConfigurationDidChange:(id)a3
{
}

- (BOOL)shouldShowAirQualityConditions
{
  return GEOConfigGetBOOL();
}

- (void)setShouldShowAirQualityConditions:(BOOL)a3
{
  GEOConfigSetBOOL();
  [(WeatherSettingsManager *)self _postWeatherConditionsSettingsUpdatedNotification];
}

- (BOOL)shouldShowWeatherConditions
{
  return GEOConfigGetBOOL();
}

- (void)setShouldShowWeatherConditions:(BOOL)a3
{
  GEOConfigSetBOOL();
  [(WeatherSettingsManager *)self _postWeatherConditionsSettingsUpdatedNotification];
}

- (void)_postWeatherConditionsSettingsUpdatedNotification
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"WeatherConditionsNeedsUpdatedNotification" object:self];
}

@end