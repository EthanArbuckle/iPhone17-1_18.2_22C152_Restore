@interface GEOComposedETARouteLeg
+ (BOOL)supportsSecureCoding;
- (GEOComposedETARouteLeg)initWithCoder:(id)a3;
- (GEOComposedRouteEVChargingStationInfo)chargingStationInfo;
- (GEOWaypointInfo)destinationWaypointInfo;
- (GEOWaypointInfo)originWaypointInfo;
- (NSArray)steps;
- (double)length;
- (double)travelDuration;
- (id)description;
- (id)descriptionWithPrecision:(unint64_t)a3;
- (unint64_t)originalLegIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setChargingStationInfo:(id)a3;
- (void)setDestinationWaypointInfo:(id)a3;
- (void)setLength:(double)a3;
- (void)setOriginWaypointInfo:(id)a3;
- (void)setOriginalLegIndex:(unint64_t)a3;
- (void)setSteps:(id)a3;
@end

@implementation GEOComposedETARouteLeg

- (double)travelDuration
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_steps;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "travelDuration", (void)v10);
        double v6 = v6 + v8;
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (id)description
{
  uint64_t v3 = [(NSArray *)self->_steps lastObject];
  unint64_t v4 = (unint64_t)log10((double)(unint64_t)[v3 stepID]) + 1;

  return [(GEOComposedETARouteLeg *)self descriptionWithPrecision:v4];
}

- (id)descriptionWithPrecision:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_steps, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v6 = self->_steps;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "descriptionWithPrecision:", a3, (void)v14);
        [v5 addObject:v11];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  long long v12 = [v5 componentsJoinedByString:@"\n"];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedETARouteLeg)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOComposedETARouteLeg;
  uint64_t v5 = [(GEOComposedETARouteLeg *)&v16 init];
  if (v5)
  {
    v5->_originalLegIndex = [v4 decodeIntegerForKey:@"_originalLegIndex"];
    [v4 decodeDoubleForKey:@"_length"];
    v5->_length = v6;
    uint64_t v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_steps"];
    steps = v5->_steps;
    v5->_steps = (NSArray *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_chargingStationInfo"];
    chargingStationInfo = v5->_chargingStationInfo;
    v5->_chargingStationInfo = (GEOComposedRouteEVChargingStationInfo *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_originWaypointInfo"];
    originWaypointInfo = v5->_originWaypointInfo;
    v5->_originWaypointInfo = (GEOWaypointInfo *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_destinationWaypointInfo"];
    destinationWaypointInfo = v5->_destinationWaypointInfo;
    v5->_destinationWaypointInfo = (GEOWaypointInfo *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t originalLegIndex = self->_originalLegIndex;
  id v5 = a3;
  [v5 encodeInteger:originalLegIndex forKey:@"_originalLegIndex"];
  [v5 encodeDouble:@"_length" forKey:self->_length];
  [v5 encodeObject:self->_steps forKey:@"_steps"];
  [v5 encodeObject:self->_chargingStationInfo forKey:@"_chargingStationInfo"];
  [v5 encodeObject:self->_originWaypointInfo forKey:@"_originWaypointInfo"];
  [v5 encodeObject:self->_destinationWaypointInfo forKey:@"_destinationWaypointInfo"];
}

- (unint64_t)originalLegIndex
{
  return self->_originalLegIndex;
}

- (void)setOriginalLegIndex:(unint64_t)a3
{
  self->_unint64_t originalLegIndex = a3;
}

- (double)length
{
  return self->_length;
}

- (void)setLength:(double)a3
{
  self->_length = a3;
}

- (NSArray)steps
{
  return self->_steps;
}

- (void)setSteps:(id)a3
{
}

- (GEOComposedRouteEVChargingStationInfo)chargingStationInfo
{
  return self->_chargingStationInfo;
}

- (void)setChargingStationInfo:(id)a3
{
}

- (GEOWaypointInfo)originWaypointInfo
{
  return self->_originWaypointInfo;
}

- (void)setOriginWaypointInfo:(id)a3
{
}

- (GEOWaypointInfo)destinationWaypointInfo
{
  return self->_destinationWaypointInfo;
}

- (void)setDestinationWaypointInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationWaypointInfo, 0);
  objc_storeStrong((id *)&self->_originWaypointInfo, 0);
  objc_storeStrong((id *)&self->_chargingStationInfo, 0);

  objc_storeStrong((id *)&self->_steps, 0);
}

@end