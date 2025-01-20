@interface MKDirectionsRequest
+ (BOOL)isDirectionsRequestURL:(NSURL *)url;
- (BOOL)_includeDistanceInETA;
- (BOOL)_includeRoutePoints;
- (BOOL)_includeTrafficIncidents;
- (BOOL)_includeTravelTimes;
- (BOOL)_resolveExtraAutomobileOptions;
- (BOOL)_useBackgroundURL;
- (BOOL)requestsAlternateRoutes;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (GEOAutomobileOptions)_automobileOptions;
- (GEOCyclingOptions)_cyclingOptions;
- (GEOTransitOptions)_transitOptions;
- (GEOWalkingOptions)_walkingOptions;
- (MKDirectionsRequest)init;
- (MKDirectionsRequest)initWithContentsOfURL:(NSURL *)url;
- (MKDirectionsRoutePreference)highwayPreference;
- (MKDirectionsRoutePreference)tollPreference;
- (MKDirectionsTransportType)transportType;
- (MKMapItem)destination;
- (MKMapItem)source;
- (NSArray)_additionalTransportTypesRequested;
- (NSDate)arrivalDate;
- (NSDate)departureDate;
- (id)_arrivalDate;
- (id)_departureDate;
- (id)_mapkit_initWithDictionaryRepresentation:(id)a3;
- (id)_mapkit_initWithSource:(id)a3 destination:(id)a4 transportType:(unint64_t)a5 arrivalDate:(id)a6;
- (id)_mapkit_initWithSource:(id)a3 destination:(id)a4 transportType:(unint64_t)a5 departureDate:(id)a6 includeTravelTimes:(BOOL)a7 includeTrafficIncidents:(BOOL)a8 includeRoutePoints:(BOOL)a9 resolveExtraAutomobileOptions:(BOOL)a10;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)_transportType;
- (void)_setAdditionalTransportTypesRequested:(id)a3;
- (void)_setAutomobileOptions:(id)a3;
- (void)_setCyclingOptions:(id)a3;
- (void)_setIncludeDistanceInETA:(BOOL)a3;
- (void)_setTransitOptions:(id)a3;
- (void)_setUseBackgroundURL:(BOOL)a3;
- (void)_setWalkingOptions:(id)a3;
- (void)setArrivalDate:(NSDate *)arrivalDate;
- (void)setDepartureDate:(NSDate *)departureDate;
- (void)setDestination:(MKMapItem *)destination;
- (void)setHighwayPreference:(MKDirectionsRoutePreference)highwayPreference;
- (void)setRequestsAlternateRoutes:(BOOL)requestsAlternateRoutes;
- (void)setSource:(MKMapItem *)source;
- (void)setTollPreference:(MKDirectionsRoutePreference)tollPreference;
- (void)setTransportType:(MKDirectionsTransportType)transportType;
@end

@implementation MKDirectionsRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_additionalTransportTypesRequested, 0);
  objc_storeStrong((id *)&self->_arrivalDate, 0);
  objc_storeStrong((id *)&self->_departureDate, 0);
  objc_storeStrong((id *)&self->_destination, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

- (void)setSource:(MKMapItem *)source
{
}

- (void)setDestination:(MKMapItem *)destination
{
}

- (BOOL)_resolveExtraAutomobileOptions
{
  return self->_resolveExtraAutomobileOptions;
}

- (GEOAutomobileOptions)_automobileOptions
{
  return self->_automobileOptions;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[MKDirectionsRequest allocWithZone:a3] init];
  uint64_t v5 = [(MKDirectionsRequest *)self source];
  source = v4->_source;
  v4->_source = (MKMapItem *)v5;

  uint64_t v7 = [(MKDirectionsRequest *)self destination];
  destination = v4->_destination;
  v4->_destination = (MKMapItem *)v7;

  [(MKDirectionsRequest *)v4 setTransportType:[(MKDirectionsRequest *)self transportType]];
  [(MKDirectionsRequest *)v4 setRequestsAlternateRoutes:[(MKDirectionsRequest *)self requestsAlternateRoutes]];
  v4->_includeTravelTimes = self->_includeTravelTimes;
  v4->_includeTrafficIncidents = self->_includeTrafficIncidents;
  v4->_includeRoutePoints = self->_includeRoutePoints;
  v4->_includeDistanceInETA = self->_includeDistanceInETA;
  v4->_resolveExtraAutomobileOptions = self->_resolveExtraAutomobileOptions;
  objc_storeStrong((id *)&v4->_additionalTransportTypesRequested, self->_additionalTransportTypesRequested);
  v4->_useBackgroundURL = self->_useBackgroundURL;
  v9 = [(MKDirectionsRequest *)self departureDate];
  [(MKDirectionsRequest *)v4 setDepartureDate:v9];

  v10 = [(MKDirectionsRequest *)self arrivalDate];
  [(MKDirectionsRequest *)v4 setArrivalDate:v10];

  uint64_t v11 = [(GEOAutomobileOptions *)self->_automobileOptions copy];
  automobileOptions = v4->_automobileOptions;
  v4->_automobileOptions = (GEOAutomobileOptions *)v11;

  uint64_t v13 = [(GEOTransitOptions *)self->_transitOptions copy];
  transitOptions = v4->_transitOptions;
  v4->_transitOptions = (GEOTransitOptions *)v13;

  uint64_t v15 = [(GEOWalkingOptions *)self->_walkingOptions copy];
  walkingOptions = v4->_walkingOptions;
  v4->_walkingOptions = (GEOWalkingOptions *)v15;

  uint64_t v17 = [(GEOCyclingOptions *)self->_cyclingOptions copy];
  cyclingOptions = v4->_cyclingOptions;
  v4->_cyclingOptions = (GEOCyclingOptions *)v17;

  [(MKDirectionsRequest *)v4 setTollPreference:[(MKDirectionsRequest *)self tollPreference]];
  [(MKDirectionsRequest *)v4 setHighwayPreference:[(MKDirectionsRequest *)self highwayPreference]];
  return v4;
}

- (void)setTransportType:(MKDirectionsTransportType)transportType
{
  self->_transportType = transportType;
}

- (MKDirectionsRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)MKDirectionsRequest;
  result = [(MKDirectionsRequest *)&v3 init];
  if (result)
  {
    result->_transportType = 0xFFFFFFFLL;
    *(_WORD *)&result->_requestsAlternateRoutes = 256;
    result->_includeDistanceInETA = 1;
    result->_includeRoutePoints = 1;
    result->_tollPreference = 0;
    result->_highwayPreference = 0;
  }
  return result;
}

- (MKDirectionsTransportType)transportType
{
  return self->_transportType;
}

- (MKDirectionsRoutePreference)tollPreference
{
  return self->_tollPreference;
}

- (MKDirectionsRoutePreference)highwayPreference
{
  return self->_highwayPreference;
}

- (id)_departureDate
{
  return self->_departureDate;
}

- (id)_arrivalDate
{
  return self->_arrivalDate;
}

- (NSDate)departureDate
{
  return self->_departureDate;
}

- (NSDate)arrivalDate
{
  return self->_arrivalDate;
}

- (MKMapItem)source
{
  return self->_source;
}

- (MKMapItem)destination
{
  return self->_destination;
}

- (void)setTollPreference:(MKDirectionsRoutePreference)tollPreference
{
  self->_tollPreference = tollPreference;
}

- (void)setRequestsAlternateRoutes:(BOOL)requestsAlternateRoutes
{
  self->_requestsAlternateRoutes = requestsAlternateRoutes;
}

- (void)setHighwayPreference:(MKDirectionsRoutePreference)highwayPreference
{
  self->_highwayPreference = highwayPreference;
}

- (void)setDepartureDate:(NSDate *)departureDate
{
  v4 = (NSDate *)[(NSDate *)departureDate copy];
  uint64_t v5 = self->_departureDate;
  self->_departureDate = v4;
}

- (void)setArrivalDate:(NSDate *)arrivalDate
{
  v4 = (NSDate *)[(NSDate *)arrivalDate copy];
  uint64_t v5 = self->_arrivalDate;
  self->_arrivalDate = v4;
}

- (BOOL)requestsAlternateRoutes
{
  return self->_requestsAlternateRoutes;
}

- (GEOWalkingOptions)_walkingOptions
{
  return self->_walkingOptions;
}

- (GEOTransitOptions)_transitOptions
{
  return self->_transitOptions;
}

- (BOOL)_includeTravelTimes
{
  return self->_includeTravelTimes;
}

- (BOOL)_includeTrafficIncidents
{
  return self->_includeTrafficIncidents;
}

- (BOOL)_includeRoutePoints
{
  return self->_includeRoutePoints;
}

- (BOOL)_includeDistanceInETA
{
  return self->_includeDistanceInETA;
}

- (GEOCyclingOptions)_cyclingOptions
{
  return self->_cyclingOptions;
}

- (NSArray)_additionalTransportTypesRequested
{
  return self->_additionalTransportTypesRequested;
}

- (unint64_t)_transportType
{
  return self->_transportType;
}

- (id)_mapkit_initWithSource:(id)a3 destination:(id)a4 transportType:(unint64_t)a5 departureDate:(id)a6 includeTravelTimes:(BOOL)a7 includeTrafficIncidents:(BOOL)a8 includeRoutePoints:(BOOL)a9 resolveExtraAutomobileOptions:(BOOL)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  v24.receiver = self;
  v24.super_class = (Class)MKDirectionsRequest;
  v20 = [(MKDirectionsRequest *)&v24 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_source, a3);
    objc_storeStrong((id *)&v21->_destination, a4);
    v21->_transportType = a5;
    objc_storeStrong((id *)&v21->_departureDate, a6);
    v21->_includeTravelTimes = a7;
    v21->_includeTrafficIncidents = a8;
    v21->_includeRoutePoints = a9;
    v21->_resolveExtraAutomobileOptions = a10;
    v22 = v21;
  }

  return v21;
}

- (id)_mapkit_initWithSource:(id)a3 destination:(id)a4 transportType:(unint64_t)a5 arrivalDate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MKDirectionsRequest;
  v14 = [(MKDirectionsRequest *)&v18 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_source, a3);
    objc_storeStrong((id *)&v15->_destination, a4);
    v15->_transportType = a5;
    objc_storeStrong((id *)&v15->_arrivalDate, a6);
    v16 = v15;
  }

  return v15;
}

+ (BOOL)isDirectionsRequestURL:(NSURL *)url
{
  objc_super v3 = url;
  if ([(NSURL *)v3 isFileURL])
  {
    v4 = [(NSURL *)v3 lastPathComponent];
    uint64_t v5 = [v4 pathExtension];
    char v6 = [v5 isEqualToString:@"mkdirectionsrequest"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (MKDirectionsRequest)initWithContentsOfURL:(NSURL *)url
{
  v4 = url;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v4];
  id v15 = 0;
  char v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:&v15];
  id v7 = v15;
  if (!v6)
  {
    id v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    id v13 = [NSString stringWithFormat:@"Could not read directions request from %@", v4];
    id v14 = [v11 exceptionWithName:v12 reason:v13 userInfo:0];

    objc_exception_throw(v14);
  }
  v8 = v7;
  v9 = [(MKDirectionsRequest *)self _mapkit_initWithDictionaryRepresentation:v6];

  return v9;
}

- (id)_mapkit_initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MKDirectionsRequest *)self init];
  if (v5)
  {
    char v6 = [v4 objectForKey:@"MKDirectionsRequestSource"];
    id v7 = [v4 objectForKey:@"MKDirectionsRequestDestination"];
    if (v6)
    {
      v8 = +[MKMapItem mapItemWithDictionary:v6];
      [(MKDirectionsRequest *)v5 setSource:v8];
    }
    if (v7)
    {
      v9 = +[MKMapItem mapItemWithDictionary:v7];
      [(MKDirectionsRequest *)v5 setDestination:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (id)description
{
  objc_super v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)MKDirectionsRequest;
  id v4 = [(MKDirectionsRequest *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"<%@ source:%@ destination:%@ transportType:%lu>", v4, self->_source, self->_destination, self->_transportType];

  return v5;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  id v4 = [(MKDirectionsRequest *)self source];

  if (v4)
  {
    uint64_t v5 = [(MKDirectionsRequest *)self source];
    char v6 = [v5 dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"MKDirectionsRequestSource"];
  }
  objc_super v7 = [(MKDirectionsRequest *)self destination];

  if (v7)
  {
    v8 = [(MKDirectionsRequest *)self destination];
    v9 = [v8 dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"MKDirectionsRequestDestination"];
  }

  return v3;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = [(MKDirectionsRequest *)self dictionaryRepresentation];
  v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:200 options:0 error:a4];
  v9 = v8;
  if (v8) {
    char v10 = [v8 writeToURL:v6 options:0 error:a4];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)_useBackgroundURL
{
  return self->_useBackgroundURL;
}

- (void)_setUseBackgroundURL:(BOOL)a3
{
  self->_useBackgroundURL = a3;
}

- (void)_setIncludeDistanceInETA:(BOOL)a3
{
  self->_includeDistanceInETA = a3;
}

- (void)_setAdditionalTransportTypesRequested:(id)a3
{
}

- (void)_setAutomobileOptions:(id)a3
{
}

- (void)_setTransitOptions:(id)a3
{
}

- (void)_setWalkingOptions:(id)a3
{
}

- (void)_setCyclingOptions:(id)a3
{
}

@end