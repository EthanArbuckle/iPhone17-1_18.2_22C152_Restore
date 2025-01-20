@interface EKMutableTravelEngineHypothesis
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAggressiveDepartureDate:(id)a3;
- (void)setAggressiveTravelTime:(double)a3;
- (void)setConservativeDepartureDate:(id)a3;
- (void)setConservativeTravelTime:(double)a3;
- (void)setCreationDate:(id)a3;
- (void)setCurrentTrafficDensity:(unint64_t)a3;
- (void)setEstimatedTravelTime:(double)a3;
- (void)setRouteName:(id)a3;
- (void)setSuggestedDepartureDate:(id)a3;
- (void)setSupportsLiveTraffic:(BOOL)a3;
- (void)setTrafficDensityDescription:(id)a3;
- (void)setTransportType:(int)a3;
- (void)setTravelState:(int64_t)a3;
@end

@implementation EKMutableTravelEngineHypothesis

- (void)setTransportType:(int)a3
{
  self->super._transportType = a3;
}

- (void)setConservativeDepartureDate:(id)a3
{
  v4 = (NSDate *)[a3 copy];
  conservativeDepartureDate = self->super._conservativeDepartureDate;
  self->super._conservativeDepartureDate = v4;

  MEMORY[0x1F41817F8](v4, conservativeDepartureDate);
}

- (void)setConservativeTravelTime:(double)a3
{
  self->super._conservativeTravelTime = a3;
}

- (void)setSuggestedDepartureDate:(id)a3
{
  v4 = (NSDate *)[a3 copy];
  suggestedDepartureDate = self->super._suggestedDepartureDate;
  self->super._suggestedDepartureDate = v4;

  MEMORY[0x1F41817F8](v4, suggestedDepartureDate);
}

- (void)setEstimatedTravelTime:(double)a3
{
  self->super._estimatedTravelTime = a3;
}

- (void)setAggressiveDepartureDate:(id)a3
{
  v4 = (NSDate *)[a3 copy];
  aggressiveDepartureDate = self->super._aggressiveDepartureDate;
  self->super._aggressiveDepartureDate = v4;

  MEMORY[0x1F41817F8](v4, aggressiveDepartureDate);
}

- (void)setAggressiveTravelTime:(double)a3
{
  self->super._aggressiveTravelTime = a3;
}

- (void)setRouteName:(id)a3
{
  v4 = (NSString *)[a3 copy];
  routeName = self->super._routeName;
  self->super._routeName = v4;

  MEMORY[0x1F41817F8](v4, routeName);
}

- (void)setSupportsLiveTraffic:(BOOL)a3
{
  self->super._supportsLiveTraffic = a3;
}

- (void)setCurrentTrafficDensity:(unint64_t)a3
{
  self->super._currentTrafficDensity = a3;
}

- (void)setTrafficDensityDescription:(id)a3
{
  v4 = (NSString *)[a3 copy];
  trafficDensityDescription = self->super._trafficDensityDescription;
  self->super._trafficDensityDescription = v4;

  MEMORY[0x1F41817F8](v4, trafficDensityDescription);
}

- (void)setTravelState:(int64_t)a3
{
  self->super._travelState = a3;
}

- (void)setCreationDate:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[EKTravelEngineHypothesis allocWithZone:a3];
  uint64_t v5 = [(EKTravelEngineHypothesis *)self transportType];
  v6 = [(EKTravelEngineHypothesis *)self conservativeDepartureDate];
  [(EKTravelEngineHypothesis *)self conservativeTravelTime];
  double v8 = v7;
  v9 = [(EKTravelEngineHypothesis *)self suggestedDepartureDate];
  [(EKTravelEngineHypothesis *)self estimatedTravelTime];
  double v11 = v10;
  v12 = [(EKTravelEngineHypothesis *)self aggressiveDepartureDate];
  [(EKTravelEngineHypothesis *)self aggressiveTravelTime];
  double v14 = v13;
  v15 = [(EKTravelEngineHypothesis *)self routeName];
  BOOL v16 = [(EKTravelEngineHypothesis *)self supportsLiveTraffic];
  unint64_t v17 = [(EKTravelEngineHypothesis *)self currentTrafficDensity];
  v18 = [(EKTravelEngineHypothesis *)self trafficDensityDescription];
  v19 = [(EKTravelEngineHypothesis *)v4 initWithTransportType:v5 conservativeDepartureDate:v6 conservativeTravelTime:v9 suggestedDepartureDate:v12 estimatedTravelTime:v15 aggressiveDepartureDate:v16 aggressiveTravelTime:v8 routeName:v11 supportsLiveTraffic:v14 currentTrafficDensity:v17 trafficDensityDescription:v18 travelState:[(EKTravelEngineHypothesis *)self travelState]];

  return v19;
}

@end