@interface GEOComposedTransitWalkingRouteStep
+ (BOOL)supportsSecureCoding;
- ($1AB5FA073B851C12C2339EC22442E995)endGeoCoordinate;
- ($1AB5FA073B851C12C2339EC22442E995)startGeoCoordinate;
- (BOOL)isArrivalStep;
- (BOOL)isStartOrResumeStep;
- (GEOComposedTransitWalkingRouteStep)initWithCoder:(id)a3;
- (GEOComposedTransitWalkingRouteStep)initWithComposedRoute:(id)a3 decoderData:(id)a4 transitStep:(id)a5 stepIndex:(unint64_t)a6 geoStep:(id)a7 pointRange:(_NSRange)a8 maneuverPointRange:(_NSRange)a9;
- (GEOComposedTransitWalkingRouteStep)initWithComposedRoute:(id)a3 decoderData:(id)a4 transitStep:(id)a5 stepIndex:(unint64_t)a6 startCoordinate:(id)a7 endCoordinate:(id)a8 pointRange:(_NSRange)a9;
- (double)distance;
- (id)advisories;
- (id)description;
- (id)instructionDescription;
- (id)instructions;
- (id)maneuverDescription;
- (id)routeDetailsPrimaryArtwork;
- (id)routeDetailsSecondaryArtwork;
- (id)steppingArtwork;
- (id)transitIncidents;
- (id)transitStep;
- (void)_commonInitWithDecoderData:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedTransitWalkingRouteStep

- (GEOComposedTransitWalkingRouteStep)initWithComposedRoute:(id)a3 decoderData:(id)a4 transitStep:(id)a5 stepIndex:(unint64_t)a6 geoStep:(id)a7 pointRange:(_NSRange)a8 maneuverPointRange:(_NSRange)a9
{
  id v14 = a4;
  id v19 = a5;
  v20.receiver = self;
  v20.super_class = (Class)GEOComposedTransitWalkingRouteStep;
  v15 = -[GEOComposedWalkingRouteStep initWithComposedRoute:geoRouteLeg:geoStep:stepIndex:pointRange:maneuverPointRange:](&v20, sel_initWithComposedRoute_geoRouteLeg_geoStep_stepIndex_pointRange_maneuverPointRange_, a3, 0, a7, a6, a8.location, a8.length, a9.location, a9.length);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_transitStep, a5);
    v16->_startCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)kGEOLocationCoordinate2DInvalid_4;
    v16->_endCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)kGEOLocationCoordinate2DInvalid_4;
    [(GEOComposedTransitWalkingRouteStep *)v16 _commonInitWithDecoderData:v14];
    v17 = v16;
  }

  return v16;
}

- (GEOComposedTransitWalkingRouteStep)initWithComposedRoute:(id)a3 decoderData:(id)a4 transitStep:(id)a5 stepIndex:(unint64_t)a6 startCoordinate:(id)a7 endCoordinate:(id)a8 pointRange:(_NSRange)a9
{
  NSUInteger length = a9.length;
  NSUInteger location = a9.location;
  double var1 = a8.var1;
  double var0 = a8.var0;
  double v13 = a7.var1;
  double v14 = a7.var0;
  id v19 = a4;
  id v20 = a5;
  v25.receiver = self;
  v25.super_class = (Class)GEOComposedTransitWalkingRouteStep;
  v21 = -[GEOComposedRouteStep initWithComposedRoute:routeSegmentType:stepIndex:pointRange:](&v25, sel_initWithComposedRoute_routeSegmentType_stepIndex_pointRange_, a3, 2, a6, location, length);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_transitStep, a5);
    v22->_startCoordinate.latitude = v14;
    v22->_startCoordinate.longitude = v13;
    v22->_endCoordinate.latitude = var0;
    v22->_endCoordinate.longitude = var1;
    [(GEOComposedTransitWalkingRouteStep *)v22 _commonInitWithDecoderData:v19];
    v23 = v22;
  }

  return v22;
}

- (void)_commonInitWithDecoderData:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(GEOTransitStep *)self->_transitStep advisoriesInfo];
  v6 = [v5 genericAdvisorys];

  if (v6)
  {
    v37 = objc_opt_new();
    v7 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v8 = [(GEOTransitStep *)self->_transitStep advisoriesInfo];
    v9 = [v8 genericAdvisorys];

    obuint64_t j = v9;
    uint64_t v38 = [v9 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v38)
    {
      uint64_t v36 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v44 != v36) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          v12 = [GEOComposedRouteAdvisory alloc];
          double v13 = [v4 transitIncidents];
          double v14 = [(GEOComposedRouteAdvisory *)v12 initWithGeoAdvisoryNotice:v11 transitIncidents:v13];
          [v37 addObject:v14];

          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          v15 = [v11 advisoryItems];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v40;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v40 != v18) {
                  objc_enumerationMutation(v15);
                }
                id v20 = *(void **)(*((void *)&v39 + 1) + 8 * j);
                v21 = [v4 transitIncidents];
                v22 = objc_msgSend(v21, "objectAtIndex:", objc_msgSend(v20, "transitIncidentIndex"));

                v23 = [[_GEOTransitIncident alloc] initWithIncident:v22];
                [v7 addObject:v23];
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v47 count:16];
            }
            while (v17);
          }
        }
        uint64_t v38 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v38);
    }

    v24 = (NSArray *)[v37 copy];
    advisories = self->_advisories;
    self->_advisories = v24;

    v26 = (NSArray *)[v7 copy];
    transitIncidents = self->_transitIncidents;
    self->_transitIncidents = v26;
  }
  objc_msgSend(v4, "artworkFromIndices:count:", -[GEOTransitStep steppingArtworkIndexs](self->_transitStep, "steppingArtworkIndexs"), -[GEOTransitStep steppingArtworkIndexsCount](self->_transitStep, "steppingArtworkIndexsCount"));
  v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
  steppingArtwork = self->_steppingArtwork;
  self->_steppingArtwork = v28;

  objc_msgSend(v4, "artworkFromIndices:count:", -[GEOTransitStep routeDetailsPrimaryArtworkIndexs](self->_transitStep, "routeDetailsPrimaryArtworkIndexs"), -[GEOTransitStep routeDetailsPrimaryArtworkIndexsCount](self->_transitStep, "routeDetailsPrimaryArtworkIndexsCount"));
  v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
  routeDetailsPrimaryArtwork = self->_routeDetailsPrimaryArtwork;
  self->_routeDetailsPrimaryArtwork = v30;

  unsigned int v32 = [(GEOTransitStep *)self->_transitStep routeDetailsSecondaryArtworkIndex];
  if ([v4 artworksCount] > (unint64_t)v32)
  {
    objc_msgSend(v4, "artworkAtIndex:", -[GEOTransitStep routeDetailsSecondaryArtworkIndex](self->_transitStep, "routeDetailsSecondaryArtworkIndex"));
    v33 = (GEOTransitArtworkDataSource *)objc_claimAutoreleasedReturnValue();
    routeDetailsSecondaryArtwork = self->_routeDetailsSecondaryArtwork;
    self->_routeDetailsSecondaryArtwork = v33;
  }
}

- ($1AB5FA073B851C12C2339EC22442E995)startGeoCoordinate
{
  double longitude = self->_startCoordinate.longitude;
  if (longitude < -180.0
    || longitude > 180.0
    || (double latitude = self->_startCoordinate.latitude, latitude < -90.0)
    || latitude > 90.0)
  {
    v5.receiver = self;
    v5.super_class = (Class)GEOComposedTransitWalkingRouteStep;
    [(GEOComposedRouteStep *)&v5 startGeoCoordinate];
  }
  else
  {
    double v4 = 1.79769313e308;
  }
  result.var2 = v4;
  result.double var1 = longitude;
  result.double var0 = latitude;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)endGeoCoordinate
{
  double longitude = self->_endCoordinate.longitude;
  if (longitude < -180.0
    || longitude > 180.0
    || (double latitude = self->_endCoordinate.latitude, latitude < -90.0)
    || latitude > 90.0)
  {
    v5.receiver = self;
    v5.super_class = (Class)GEOComposedTransitWalkingRouteStep;
    [(GEOComposedRouteStep *)&v5 endGeoCoordinate];
  }
  else
  {
    double v4 = 1.79769313e308;
  }
  result.var2 = v4;
  result.double var1 = longitude;
  result.double var0 = latitude;
  return result;
}

- (id)instructions
{
  return [(GEOTransitStep *)self->_transitStep instructions];
}

- (id)transitStep
{
  return self->_transitStep;
}

- (double)distance
{
  v3 = [(GEOComposedRouteStep *)self geoStep];

  if (!v3) {
    return (double)[(GEOTransitStep *)self->_transitStep distanceInMeters];
  }
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedTransitWalkingRouteStep;
  [(GEOComposedRouteStep *)&v5 distance];
  return result;
}

- (BOOL)isStartOrResumeStep
{
  return [(GEOTransitStep *)self->_transitStep maneuverType] == 1;
}

- (BOOL)isArrivalStep
{
  return [(GEOTransitStep *)self->_transitStep maneuverType] == 10;
}

- (id)maneuverDescription
{
  uint64_t v2 = [(GEOTransitStep *)self->_transitStep maneuverType];
  if (v2 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53F5DA8[(int)v2];
  }

  return v3;
}

- (id)instructionDescription
{
  uint64_t v2 = [(GEOTransitStep *)self->_transitStep instructions];
  v3 = [v2 transitListInstruction];
  double v4 = [v3 commandFormatteds];
  objc_super v5 = [v4 firstObject];

  if (v5)
  {
    v6 = [[GEOComposedString alloc] initWithGeoFormattedString:v5];
    v7 = [(GEOComposedString *)v6 stringWithDefaultOptions];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  if (qword_1E9116928 != -1) {
    dispatch_once(&qword_1E9116928, &__block_literal_global_202);
  }
  if ([(GEOTransitStep *)self->_transitStep hasStartingTime])
  {
    v3 = (void *)_MergedGlobals_1_2;
    double v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)-[GEOTransitStep startingTime](self->_transitStep, "startingTime"));
    objc_super v5 = [v3 stringFromDate:v4];
  }
  else
  {
    objc_super v5 = @"-";
  }
  v6 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedTransitWalkingRouteStep;
  v7 = [(GEOComposedRouteStep *)&v12 description];
  uint64_t v8 = [(GEOTransitStep *)self->_transitStep maneuverType];
  if (v8 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E53F5DA8[(int)v8];
  }
  v10 = [v6 stringWithFormat:@"%@ | %@, %@", v7, v9, v5];

  return v10;
}

uint64_t __49__GEOComposedTransitWalkingRouteStep_description__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_1_2;
  _MergedGlobals_1_2 = (uint64_t)v0;

  uint64_t v2 = (void *)_MergedGlobals_1_2;

  return [v2 setDateFormat:@"h:mm:ss a"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedTransitWalkingRouteStep)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)GEOComposedTransitWalkingRouteStep;
  objc_super v5 = [(GEOComposedRouteStep *)&v27 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_transitStep"];
    transitStep = v5->_transitStep;
    v5->_transitStep = (GEOTransitStep *)v6;

    unint64_t v26 = 0;
    id v8 = v4;
    v9 = (const void *)[v8 decodeBytesForKey:@"_startCoordinate" returnedLength:&v26];
    if (v26 && v9)
    {
      if (v26 >= 0x10) {
        size_t v10 = 16;
      }
      else {
        size_t v10 = v26;
      }
      memcpy(&v5->_startCoordinate, v9, v10);
    }
    unint64_t v26 = 0;
    id v11 = v8;
    objc_super v12 = (const void *)[v11 decodeBytesForKey:@"_endCoordinate" returnedLength:&v26];
    if (v26 && v12)
    {
      if (v26 >= 0x10) {
        size_t v13 = 16;
      }
      else {
        size_t v13 = v26;
      }
      memcpy(&v5->_endCoordinate, v12, v13);
    }
    uint64_t v14 = [v11 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_steppingArtwork"];
    steppingArtwork = v5->_steppingArtwork;
    v5->_steppingArtwork = (NSArray *)v14;

    uint64_t v16 = [v11 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_routeDetailsPrimaryArtwork"];
    routeDetailsPrimaryArtwork = v5->_routeDetailsPrimaryArtwork;
    v5->_routeDetailsPrimaryArtwork = (NSArray *)v16;

    uint64_t v18 = [v11 decodeObjectOfClass:objc_opt_class() forKey:@"_routeDetailsSecondaryArtwork"];
    routeDetailsSecondaryArtwork = v5->_routeDetailsSecondaryArtwork;
    v5->_routeDetailsSecondaryArtwork = (GEOTransitArtworkDataSource *)v18;

    uint64_t v20 = [v11 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_advisories"];
    advisories = v5->_advisories;
    v5->_advisories = (NSArray *)v20;

    uint64_t v22 = [v11 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_transitIncidents"];
    transitIncidents = v5->_transitIncidents;
    v5->_transitIncidents = (NSArray *)v22;

    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedTransitWalkingRouteStep;
  id v4 = a3;
  [(GEOComposedRouteStep *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_transitStep, @"_transitStep", v5.receiver, v5.super_class);
  [v4 encodeBytes:&self->_startCoordinate length:16 forKey:@"_startCoordinate"];
  [v4 encodeBytes:&self->_endCoordinate length:16 forKey:@"_endCoordinate"];
  [v4 encodeObject:self->_steppingArtwork forKey:@"_steppingArtwork"];
  [v4 encodeObject:self->_routeDetailsPrimaryArtwork forKey:@"_routeDetailsPrimaryArtwork"];
  [v4 encodeObject:self->_routeDetailsSecondaryArtwork forKey:@"_routeDetailsSecondaryArtwork"];
  [v4 encodeObject:self->_advisories forKey:@"_advisories"];
  [v4 encodeObject:self->_transitIncidents forKey:@"_transitIncidents"];
}

- (id)steppingArtwork
{
  return self->_steppingArtwork;
}

- (id)routeDetailsPrimaryArtwork
{
  return self->_routeDetailsPrimaryArtwork;
}

- (id)routeDetailsSecondaryArtwork
{
  return self->_routeDetailsSecondaryArtwork;
}

- (id)advisories
{
  return self->_advisories;
}

- (id)transitIncidents
{
  return self->_transitIncidents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitIncidents, 0);
  objc_storeStrong((id *)&self->_advisories, 0);
  objc_storeStrong((id *)&self->_routeDetailsSecondaryArtwork, 0);
  objc_storeStrong((id *)&self->_routeDetailsPrimaryArtwork, 0);
  objc_storeStrong((id *)&self->_steppingArtwork, 0);

  objc_storeStrong((id *)&self->_transitStep, 0);
}

@end