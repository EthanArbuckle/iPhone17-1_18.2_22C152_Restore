@interface GEOQuickETARequest
- (BOOL)includeDistance;
- (GEOAutomobileOptions)automobileOptions;
- (GEOComposedWaypoint)destinationWaypoint;
- (GEOComposedWaypoint)sourceWaypoint;
- (GEOCyclingOptions)cyclingOptions;
- (GEOLocation)currentLocation;
- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 arrivalDate:(id)a5 currentLocation:(id)a6 includeDistance:(BOOL)a7 automobileOptions:(id)a8 transitOptions:(id)a9 walkingOptions:(id)a10 cyclingOptions:(id)a11;
- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 arrivalDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7;
- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 arrivalDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7 includeDistance:(BOOL)a8;
- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 arrivalDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7 includeDistance:(BOOL)a8 additionalTransportTypesRequested:(id)a9;
- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 arrivalDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7 includeDistance:(BOOL)a8 additionalTransportTypesRequested:(id)a9 automobileOptions:(id)a10 transitOptions:(id)a11 walkingOptions:(id)a12 cyclingOptions:(id)a13;
- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 departureDate:(id)a5 currentLocation:(id)a6 includeDistance:(BOOL)a7 automobileOptions:(id)a8 transitOptions:(id)a9 walkingOptions:(id)a10 cyclingOptions:(id)a11;
- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 departureDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7;
- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 departureDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7 includeDistance:(BOOL)a8;
- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 departureDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7 includeDistance:(BOOL)a8 additionalTransportTypesRequested:(id)a9;
- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 departureDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7 includeDistance:(BOOL)a8 additionalTransportTypesRequested:(id)a9 automobileOptions:(id)a10 transitOptions:(id)a11 walkingOptions:(id)a12 cyclingOptions:(id)a13;
- (GEOTransitOptions)transitOptions;
- (GEOWalkingOptions)walkingOptions;
- (NSArray)additionalTransportTypesRequested;
- (NSDate)arrivalDate;
- (NSDate)departureDate;
- (NSString)requestingAppIdentifier;
- (id)description;
- (int)transportType;
- (void)setRequestingAppIdentifier:(id)a3;
@end

@implementation GEOQuickETARequest

- (NSArray)additionalTransportTypesRequested
{
  return self->_additionalTransportTypesRequested;
}

- (int)transportType
{
  return self->_transportType;
}

- (GEOComposedWaypoint)sourceWaypoint
{
  return self->_sourceWaypoint;
}

- (GEOComposedWaypoint)destinationWaypoint
{
  return self->_destinationWaypoint;
}

- (GEOWalkingOptions)walkingOptions
{
  return self->_walkingOptions;
}

- (GEOTransitOptions)transitOptions
{
  return self->_transitOptions;
}

- (BOOL)includeDistance
{
  return self->_includeDistance;
}

- (NSDate)departureDate
{
  return self->_departureDate;
}

- (GEOCyclingOptions)cyclingOptions
{
  return self->_cyclingOptions;
}

- (GEOAutomobileOptions)automobileOptions
{
  return self->_automobileOptions;
}

- (NSDate)arrivalDate
{
  return self->_arrivalDate;
}

- (NSString)requestingAppIdentifier
{
  return self->_requestingAppIdentifier;
}

- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 departureDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7 includeDistance:(BOOL)a8 additionalTransportTypesRequested:(id)a9 automobileOptions:(id)a10 transitOptions:(id)a11 walkingOptions:(id)a12 cyclingOptions:(id)a13
{
  id v34 = a3;
  id v33 = a4;
  id v32 = a5;
  id v31 = a7;
  id v30 = a9;
  id v29 = a10;
  id v28 = a11;
  id v27 = a12;
  id v18 = a13;
  v35.receiver = self;
  v35.super_class = (Class)GEOQuickETARequest;
  v19 = [(GEOQuickETARequest *)&v35 init];
  v20 = v19;
  if (v19)
  {
    uint64_t v21 = [(GEOQuickETARequest *)v19 _defaultRequestingAppIdentifier];
    requestingAppIdentifier = v20->_requestingAppIdentifier;
    v20->_requestingAppIdentifier = (NSString *)v21;

    objc_storeStrong((id *)&v20->_sourceWaypoint, a3);
    objc_storeStrong((id *)&v20->_destinationWaypoint, a4);
    objc_storeStrong((id *)&v20->_departureDate, a5);
    v20->_transportType = a6;
    objc_storeStrong((id *)&v20->_currentLocation, a7);
    v20->_includeDistance = a8;
    objc_storeStrong((id *)&v20->_additionalTransportTypesRequested, a9);
    objc_storeStrong((id *)&v20->_automobileOptions, a10);
    objc_storeStrong((id *)&v20->_transitOptions, a11);
    objc_storeStrong((id *)&v20->_walkingOptions, a12);
    objc_storeStrong((id *)&v20->_cyclingOptions, a13);
    v23 = v20;
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalTransportTypesRequested, 0);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_arrivalDate, 0);
  objc_storeStrong((id *)&self->_departureDate, 0);
  objc_storeStrong((id *)&self->_destinationWaypoint, 0);
  objc_storeStrong((id *)&self->_sourceWaypoint, 0);

  objc_storeStrong((id *)&self->_requestingAppIdentifier, 0);
}

- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 departureDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7
{
  return [(GEOQuickETARequest *)self initWithSource:a3 toDestination:a4 departureDate:a5 transportType:*(void *)&a6 currentLocation:a7 includeDistance:0];
}

- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 departureDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7 includeDistance:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)GEOQuickETARequest;
  id v18 = [(GEOQuickETARequest *)&v25 init];
  v19 = v18;
  if (v18)
  {
    uint64_t v20 = [(GEOQuickETARequest *)v18 _defaultRequestingAppIdentifier];
    requestingAppIdentifier = v19->_requestingAppIdentifier;
    v19->_requestingAppIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v19->_sourceWaypoint, a3);
    objc_storeStrong((id *)&v19->_destinationWaypoint, a4);
    objc_storeStrong((id *)&v19->_departureDate, a5);
    v19->_transportType = a6;
    objc_storeStrong((id *)&v19->_currentLocation, a7);
    v19->_includeDistance = a8;
    v22 = v19;
  }

  return v19;
}

- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 arrivalDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7
{
  return [(GEOQuickETARequest *)self initWithSource:a3 toDestination:a4 arrivalDate:a5 transportType:*(void *)&a6 currentLocation:a7 includeDistance:0];
}

- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 arrivalDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7 includeDistance:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)GEOQuickETARequest;
  id v18 = [(GEOQuickETARequest *)&v25 init];
  v19 = v18;
  if (v18)
  {
    uint64_t v20 = [(GEOQuickETARequest *)v18 _defaultRequestingAppIdentifier];
    requestingAppIdentifier = v19->_requestingAppIdentifier;
    v19->_requestingAppIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v19->_sourceWaypoint, a3);
    objc_storeStrong((id *)&v19->_destinationWaypoint, a4);
    objc_storeStrong((id *)&v19->_arrivalDate, a5);
    v19->_transportType = a6;
    objc_storeStrong((id *)&v19->_currentLocation, a7);
    v19->_includeDistance = a8;
    v22 = v19;
  }

  return v19;
}

- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 departureDate:(id)a5 currentLocation:(id)a6 includeDistance:(BOOL)a7 automobileOptions:(id)a8 transitOptions:(id)a9 walkingOptions:(id)a10 cyclingOptions:(id)a11
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v28 = a6;
  id v27 = a8;
  id v26 = a9;
  id v25 = a10;
  id v17 = a11;
  v32.receiver = self;
  v32.super_class = (Class)GEOQuickETARequest;
  id v18 = [(GEOQuickETARequest *)&v32 init];
  v19 = v18;
  if (v18)
  {
    uint64_t v20 = [(GEOQuickETARequest *)v18 _defaultRequestingAppIdentifier];
    requestingAppIdentifier = v19->_requestingAppIdentifier;
    v19->_requestingAppIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v19->_sourceWaypoint, a3);
    objc_storeStrong((id *)&v19->_destinationWaypoint, a4);
    objc_storeStrong((id *)&v19->_departureDate, a5);
    objc_storeStrong((id *)&v19->_currentLocation, a6);
    v19->_includeDistance = a7;
    objc_storeStrong((id *)&v19->_automobileOptions, a8);
    objc_storeStrong((id *)&v19->_transitOptions, a9);
    objc_storeStrong((id *)&v19->_walkingOptions, a10);
    objc_storeStrong((id *)&v19->_cyclingOptions, a11);
    v22 = v19;
  }

  return v19;
}

- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 arrivalDate:(id)a5 currentLocation:(id)a6 includeDistance:(BOOL)a7 automobileOptions:(id)a8 transitOptions:(id)a9 walkingOptions:(id)a10 cyclingOptions:(id)a11
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v28 = a6;
  id v27 = a8;
  id v26 = a9;
  id v25 = a10;
  id v17 = a11;
  v32.receiver = self;
  v32.super_class = (Class)GEOQuickETARequest;
  id v18 = [(GEOQuickETARequest *)&v32 init];
  v19 = v18;
  if (v18)
  {
    uint64_t v20 = [(GEOQuickETARequest *)v18 _defaultRequestingAppIdentifier];
    requestingAppIdentifier = v19->_requestingAppIdentifier;
    v19->_requestingAppIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v19->_sourceWaypoint, a3);
    objc_storeStrong((id *)&v19->_destinationWaypoint, a4);
    objc_storeStrong((id *)&v19->_arrivalDate, a5);
    objc_storeStrong((id *)&v19->_currentLocation, a6);
    v19->_includeDistance = a7;
    objc_storeStrong((id *)&v19->_automobileOptions, a8);
    objc_storeStrong((id *)&v19->_transitOptions, a9);
    objc_storeStrong((id *)&v19->_walkingOptions, a10);
    objc_storeStrong((id *)&v19->_cyclingOptions, a11);
    v22 = v19;
  }

  return v19;
}

- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 departureDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7 includeDistance:(BOOL)a8 additionalTransportTypesRequested:(id)a9
{
  id v26 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)GEOQuickETARequest;
  id v18 = [(GEOQuickETARequest *)&v27 init];
  v19 = v18;
  if (v18)
  {
    uint64_t v20 = [(GEOQuickETARequest *)v18 _defaultRequestingAppIdentifier];
    requestingAppIdentifier = v19->_requestingAppIdentifier;
    v19->_requestingAppIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v19->_sourceWaypoint, a3);
    objc_storeStrong((id *)&v19->_destinationWaypoint, a4);
    objc_storeStrong((id *)&v19->_departureDate, a5);
    v19->_transportType = a6;
    objc_storeStrong((id *)&v19->_currentLocation, a7);
    v19->_includeDistance = a8;
    objc_storeStrong((id *)&v19->_additionalTransportTypesRequested, a9);
    v22 = v19;
  }

  return v19;
}

- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 arrivalDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7 includeDistance:(BOOL)a8 additionalTransportTypesRequested:(id)a9
{
  id v26 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)GEOQuickETARequest;
  id v18 = [(GEOQuickETARequest *)&v27 init];
  v19 = v18;
  if (v18)
  {
    uint64_t v20 = [(GEOQuickETARequest *)v18 _defaultRequestingAppIdentifier];
    requestingAppIdentifier = v19->_requestingAppIdentifier;
    v19->_requestingAppIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v19->_sourceWaypoint, a3);
    objc_storeStrong((id *)&v19->_destinationWaypoint, a4);
    objc_storeStrong((id *)&v19->_arrivalDate, a5);
    v19->_transportType = a6;
    objc_storeStrong((id *)&v19->_currentLocation, a7);
    v19->_includeDistance = a8;
    objc_storeStrong((id *)&v19->_additionalTransportTypesRequested, a9);
    v22 = v19;
  }

  return v19;
}

- (GEOQuickETARequest)initWithSource:(id)a3 toDestination:(id)a4 arrivalDate:(id)a5 transportType:(int)a6 currentLocation:(id)a7 includeDistance:(BOOL)a8 additionalTransportTypesRequested:(id)a9 automobileOptions:(id)a10 transitOptions:(id)a11 walkingOptions:(id)a12 cyclingOptions:(id)a13
{
  id v34 = a3;
  id v33 = a4;
  id v32 = a5;
  id v31 = a7;
  id v30 = a9;
  id v29 = a10;
  id v28 = a11;
  id v27 = a12;
  id v18 = a13;
  v35.receiver = self;
  v35.super_class = (Class)GEOQuickETARequest;
  v19 = [(GEOQuickETARequest *)&v35 init];
  uint64_t v20 = v19;
  if (v19)
  {
    uint64_t v21 = [(GEOQuickETARequest *)v19 _defaultRequestingAppIdentifier];
    requestingAppIdentifier = v20->_requestingAppIdentifier;
    v20->_requestingAppIdentifier = (NSString *)v21;

    objc_storeStrong((id *)&v20->_sourceWaypoint, a3);
    objc_storeStrong((id *)&v20->_destinationWaypoint, a4);
    objc_storeStrong((id *)&v20->_arrivalDate, a5);
    v20->_transportType = a6;
    objc_storeStrong((id *)&v20->_currentLocation, a7);
    v20->_includeDistance = a8;
    objc_storeStrong((id *)&v20->_additionalTransportTypesRequested, a9);
    objc_storeStrong((id *)&v20->_automobileOptions, a10);
    objc_storeStrong((id *)&v20->_transitOptions, a11);
    objc_storeStrong((id *)&v20->_walkingOptions, a12);
    objc_storeStrong((id *)&v20->_cyclingOptions, a13);
    v23 = v20;
  }

  return v20;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"source: %@\ndestination: %@\ndepartureDate: %@\narrivalDate: %@\transportType: %d\ncurrentLocation:%@", self->_sourceWaypoint, self->_destinationWaypoint, self->_departureDate, self->_arrivalDate, self->_transportType, self->_currentLocation];
}

- (void)setRequestingAppIdentifier:(id)a3
{
}

- (GEOLocation)currentLocation
{
  return self->_currentLocation;
}

@end