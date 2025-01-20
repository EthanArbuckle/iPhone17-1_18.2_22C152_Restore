@interface CALNRouteHypothesisMapper
+ (id)ekTravelEngineHypothesisFromCADRouteHypothesis:(id)a3;
+ (id)ekTravelEngineHypothesisFromGEORouteHypothesis:(id)a3;
@end

@implementation CALNRouteHypothesisMapper

+ (id)ekTravelEngineHypothesisFromGEORouteHypothesis:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F04C10];
  id v4 = a3;
  id v22 = [v3 alloc];
  uint64_t v5 = [v4 transportType];
  v6 = [v4 conservativeDepartureDate];
  [v4 conservativeTravelTime];
  double v8 = v7;
  v9 = [v4 suggestedDepartureDate];
  [v4 estimatedTravelTime];
  double v11 = v10;
  v12 = [v4 aggressiveDepartureDate];
  [v4 aggressiveTravelTime];
  double v14 = v13;
  v15 = [v4 routeName];
  uint64_t v16 = [v4 supportsLiveTraffic];
  uint64_t v17 = [v4 currentTrafficDensity];
  v18 = [v4 trafficDensityDescription];
  uint64_t v19 = [v4 travelState];

  v20 = (void *)[v22 initWithTransportType:v5 conservativeDepartureDate:v6 conservativeTravelTime:v9 suggestedDepartureDate:v12 estimatedTravelTime:v15 aggressiveDepartureDate:v16 aggressiveTravelTime:v8 routeName:v11 supportsLiveTraffic:v14 currentTrafficDensity:v17 trafficDensityDescription:v18 travelState:v19];
  return v20;
}

+ (id)ekTravelEngineHypothesisFromCADRouteHypothesis:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F04C10];
  id v4 = a3;
  id v22 = [v3 alloc];
  uint64_t v5 = [v4 transportType];
  v6 = [v4 conservativeDepartureDate];
  [v4 conservativeTravelTime];
  double v8 = v7;
  v9 = [v4 suggestedDepartureDate];
  [v4 estimatedTravelTime];
  double v11 = v10;
  v12 = [v4 aggressiveDepartureDate];
  [v4 aggressiveTravelTime];
  double v14 = v13;
  v15 = [v4 routeName];
  uint64_t v16 = [v4 supportsLiveTraffic];
  uint64_t v17 = [v4 currentTrafficDensity];
  v18 = [v4 trafficDensityDescription];
  uint64_t v19 = [v4 travelState];

  v20 = (void *)[v22 initWithTransportType:v5 conservativeDepartureDate:v6 conservativeTravelTime:v9 suggestedDepartureDate:v12 estimatedTravelTime:v15 aggressiveDepartureDate:v16 aggressiveTravelTime:v8 routeName:v11 supportsLiveTraffic:v14 currentTrafficDensity:v17 trafficDensityDescription:v18 travelState:v19];
  return v20;
}

@end