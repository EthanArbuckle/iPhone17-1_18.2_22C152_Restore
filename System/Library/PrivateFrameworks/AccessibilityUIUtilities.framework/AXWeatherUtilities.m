@interface AXWeatherUtilities
+ (id)sharedInstance;
- (id)descriptionForPrecipitation:(id)a3 weatherConditionCode:(unint64_t)a4;
- (id)descriptionForWeatherConditionImageName:(id)a3;
- (id)descriptionForWeatherWFConditionCode:(unint64_t)a3;
- (unint64_t)_weatherCodeForGenericIconName:(id)a3;
@end

@implementation AXWeatherUtilities

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance__shared;
  return v2;
}

uint64_t __36__AXWeatherUtilities_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(AXWeatherUtilities);
  uint64_t v1 = sharedInstance__shared;
  sharedInstance__shared = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)descriptionForWeatherConditionImageName:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [v4 stringByDeletingPathExtension];

    id v14 = 0;
    v6 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"-?(centered|day|night|mostly|partly|severe)-?+" options:1 error:&v14];
    id v7 = v14;
    v8 = v7;
    if (v7)
    {
      [v7 localizedDescription];
      v13 = v12 = @"Weather image extract regex failed with error: %@";
      LOBYTE(v11) = 1;
      _AXLogWithFacility();
    }
    objc_msgSend(v6, "stringByReplacingMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(v5, "length", v11, v12, v13), &stru_1F1F0EB90);
    id v4 = (id)objc_claimAutoreleasedReturnValue();

    v9 = [(AXWeatherUtilities *)self descriptionForWeatherWFConditionCode:[(AXWeatherUtilities *)self _weatherCodeForGenericIconName:v4]];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)descriptionForPrecipitation:(id)a3 weatherConditionCode:(unint64_t)a4
{
  id v5 = a3;
  char v6 = (a4 > 0x2E) | (0x23E7FFE03E3EuLL >> a4);
  [v5 floatValue];
  if (v7 >= 0.0)
  {
    v10 = NSString;
    if (v6) {
      uint64_t v11 = @"precipitation.rain";
    }
    else {
      uint64_t v11 = @"precipitation.snow";
    }
    v12 = AXUILocalizedStringForKey(v11);
    [v5 floatValue];
    v13 = AXFormatFloatWithPercentage();
    v9 = objc_msgSend(v10, "stringWithFormat:", v12, v13);
  }
  else
  {
    if ((a4 > 0x2E) | (0x23E7FFE03E3EuLL >> a4) & 1) {
      v8 = @"now.precipitation.rain";
    }
    else {
      v8 = @"now.precipitation.snow";
    }
    v9 = AXUILocalizedStringForKey(v8);
  }

  return v9;
}

- (unint64_t)_weatherCodeForGenericIconName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"thunderstorm"])
  {
    unint64_t v4 = 5;
    goto LABEL_30;
  }
  if ([v3 isEqualToString:@"flurry-snow-snow-shower"])
  {
    unint64_t v4 = 6;
    goto LABEL_30;
  }
  if ([v3 isEqualToString:@"drizzle"])
  {
    unint64_t v4 = 10;
    goto LABEL_30;
  }
  if ([v3 isEqualToString:@"hail"])
  {
    unint64_t v4 = 18;
    goto LABEL_30;
  }
  if ([v3 isEqualToString:@"rain"])
  {
    unint64_t v4 = 13;
    goto LABEL_30;
  }
  if ([v3 isEqualToString:@"flurry"])
  {
    unint64_t v4 = 14;
    goto LABEL_30;
  }
  if ([v3 isEqualToString:@"blowingsnow"])
  {
LABEL_14:
    unint64_t v4 = 17;
    goto LABEL_30;
  }
  if ([v3 isEqualToString:@"sunny"]) {
    goto LABEL_16;
  }
  if ([v3 isEqualToString:@"fog"])
  {
    unint64_t v4 = 21;
    goto LABEL_30;
  }
  if ([v3 isEqualToString:@"breezy"])
  {
    unint64_t v4 = 25;
    goto LABEL_30;
  }
  if ([v3 isEqualToString:@"ice"]) {
    goto LABEL_14;
  }
  if ([v3 isEqualToString:@"cloudy"])
  {
    unint64_t v4 = 27;
    goto LABEL_30;
  }
  if ([v3 isEqualToString:@"clear"])
  {
LABEL_16:
    unint64_t v4 = 33;
    goto LABEL_30;
  }
  if ([v3 isEqualToString:@"suncloud"])
  {
    unint64_t v4 = 35;
  }
  else if ([v3 isEqualToString:@"heavy-rain"])
  {
    unint64_t v4 = 40;
  }
  else
  {
    _AXLogWithFacility();
    unint64_t v4 = 0;
  }
LABEL_30:

  return v4;
}

- (id)descriptionForWeatherWFConditionCode:(unint64_t)a3
{
  id v3 = 0;
  switch(a3)
  {
    case 0uLL:
      unint64_t v4 = @"weather.condition.unavailable";
      goto LABEL_45;
    case 1uLL:
      unint64_t v4 = @"weather.condition.tornado";
      goto LABEL_45;
    case 2uLL:
      unint64_t v4 = @"weather.condition.tropical.storm";
      goto LABEL_45;
    case 3uLL:
      unint64_t v4 = @"weather.condition.hurricane";
      goto LABEL_45;
    case 4uLL:
      unint64_t v4 = @"weather.condition.severe.thunderstorm";
      goto LABEL_45;
    case 5uLL:
      unint64_t v4 = @"weather.condition.thunderstorm";
      goto LABEL_45;
    case 6uLL:
      unint64_t v4 = @"weather.condition.rain.and.snow";
      goto LABEL_45;
    case 7uLL:
      unint64_t v4 = @"weather.condition.rain.and.sleet";
      goto LABEL_45;
    case 8uLL:
      unint64_t v4 = @"weather.condition.snow.and.sleet";
      goto LABEL_45;
    case 9uLL:
      unint64_t v4 = @"weather.condition.freezing.drizzle";
      goto LABEL_45;
    case 0xAuLL:
      unint64_t v4 = @"weather.condition.drizzle";
      goto LABEL_45;
    case 0xBuLL:
      unint64_t v4 = @"weather.condition.freezing.rain";
      goto LABEL_45;
    case 0xCuLL:
      unint64_t v4 = @"weather.condition.showers";
      goto LABEL_45;
    case 0xDuLL:
      unint64_t v4 = @"weather.condition.rain";
      goto LABEL_45;
    case 0xEuLL:
      unint64_t v4 = @"weather.condition.snow.flurries";
      goto LABEL_45;
    case 0xFuLL:
      unint64_t v4 = @"weather.condition.light.snow.showers";
      goto LABEL_45;
    case 0x10uLL:
      unint64_t v4 = @"weather.condition.blowing.snow";
      goto LABEL_45;
    case 0x11uLL:
      unint64_t v4 = @"weather.condition.snow";
      goto LABEL_45;
    case 0x12uLL:
      unint64_t v4 = @"weather.condition.hail";
      goto LABEL_45;
    case 0x13uLL:
      unint64_t v4 = @"weather.condition.sleet";
      goto LABEL_45;
    case 0x14uLL:
      unint64_t v4 = @"weather.condition.dust.haze";
      goto LABEL_45;
    case 0x15uLL:
      unint64_t v4 = @"weather.condition.foggy";
      goto LABEL_45;
    case 0x16uLL:
      unint64_t v4 = @"weather.condition.haze";
      goto LABEL_45;
    case 0x17uLL:
      unint64_t v4 = @"weather.condition.smoky";
      goto LABEL_45;
    case 0x18uLL:
      unint64_t v4 = @"weather.condition.blustery";
      goto LABEL_45;
    case 0x19uLL:
      unint64_t v4 = @"weather.condition.windy";
      goto LABEL_45;
    case 0x1AuLL:
      unint64_t v4 = @"weather.condition.cold";
      goto LABEL_45;
    case 0x1BuLL:
      unint64_t v4 = @"weather.condition.clouds";
      goto LABEL_45;
    case 0x1DuLL:
      unint64_t v4 = @"weather.condition.mostly.cloudy";
      goto LABEL_45;
    case 0x1FuLL:
      unint64_t v4 = @"weather.condition.partly.cloudy";
      goto LABEL_45;
    case 0x21uLL:
      unint64_t v4 = @"weather.condition.clear";
      goto LABEL_45;
    case 0x23uLL:
      unint64_t v4 = @"weather.condition.mostly.clear";
      goto LABEL_45;
    case 0x24uLL:
      unint64_t v4 = @"weather.condition.rain.and.hail";
      goto LABEL_45;
    case 0x25uLL:
      unint64_t v4 = @"weather.condition.hot";
      goto LABEL_45;
    case 0x26uLL:
      unint64_t v4 = @"weather.condition.isolated.thunderstorms";
      goto LABEL_45;
    case 0x27uLL:
      unint64_t v4 = @"weather.condition.scattered.thunderstorms";
      goto LABEL_45;
    case 0x28uLL:
      unint64_t v4 = @"weather.condition.scattered.showers";
      goto LABEL_45;
    case 0x29uLL:
      unint64_t v4 = @"weather.condition.heavy.rain";
      goto LABEL_45;
    case 0x2AuLL:
      unint64_t v4 = @"weather.condition.snow.showers";
      goto LABEL_45;
    case 0x2BuLL:
      unint64_t v4 = @"weather.condition.heavy.snow";
      goto LABEL_45;
    case 0x2CuLL:
      unint64_t v4 = @"weather.condition.blizzard";
      goto LABEL_45;
    case 0x2DuLL:
      unint64_t v4 = @"weather.condition.isolated.thundershowers";
LABEL_45:
      id v3 = AXUILocalizedStringForKey(v4);
      break;
    case 0x2EuLL:
      break;
    default:
      _AXLogWithFacility();
      id v3 = 0;
      break;
  }
  return v3;
}

@end