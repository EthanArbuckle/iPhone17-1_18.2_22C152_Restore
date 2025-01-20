@interface BCCAReporter
+ (id)descriptionForDiscoverSuccessType:(unint64_t)a3;
+ (id)discoverRouteDescription;
+ (unint64_t)routeType;
+ (void)incrementDiscoverSuccessType:(unint64_t)a3;
+ (void)setRouteType:(unint64_t)a3;
@end

@implementation BCCAReporter

+ (void)setRouteType:(unint64_t)a3
{
  RouteType = a3;
}

+ (unint64_t)routeType
{
  return RouteType;
}

+ (id)discoverRouteDescription
{
  uint64_t v2 = [a1 routeType];
  if ((unint64_t)(v2 - 1) > 2) {
    return @"Undefined";
  }
  else {
    return off_264937098[v2 - 1];
  }
}

+ (id)descriptionForDiscoverSuccessType:(unint64_t)a3
{
  id result = @"WhatsNewInWatchOS";
  switch(a3)
  {
    case 1uLL:
      [a1 setRouteType:1];
      id result = @"DiscoverVisitPaired";
      break;
    case 2uLL:
      [a1 setRouteType:2];
      id result = @"DiscoverVisitUnpaired";
      break;
    case 3uLL:
      return result;
    case 4uLL:
      id result = @"WelcomeToAppleWatch";
      break;
    case 5uLL:
      id result = @"GetToKnowCurrentSeries";
      break;
    case 6uLL:
      id result = @"UserGuide";
      break;
    case 7uLL:
      id result = @"CustomizeYourWatch";
      break;
    case 8uLL:
      id result = @"HealthAndFitness";
      break;
    case 9uLL:
      id result = @"ExploreWatchApps";
      break;
    case 0xAuLL:
      id result = @"VideoTutorials";
      break;
    case 0xBuLL:
      id result = @"FitnessPlus";
      break;
    case 0xCuLL:
      [a1 setRouteType:3];
      id result = @"DiscoverVisitInSyncTrap";
      break;
    default:
      id result = @"Unknown";
      break;
  }
  return result;
}

+ (void)incrementDiscoverSuccessType:(unint64_t)a3
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"StoryID";
  v4 = [a1 descriptionForDiscoverSuccessType:a3];
  v7[1] = @"RouteID";
  v8[0] = v4;
  v5 = [a1 discoverRouteDescription];
  v8[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  [a1 sendEvent:@"com.apple.com.apple.Bridge.DiscoverTab.Story" with:v6];
}

@end