@interface GEORouteHypothesisKey
+ (BOOL)supportsSecureCoding;
- (BOOL)_isEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (GEORouteHypothesisKey)initWithCoder:(id)a3;
- (GEORouteHypothesisKey)initWithRouteHypothesisRequest:(id)a3;
- (GEORouteHypothesisRequest)request;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEORouteHypothesisKey

- (GEORouteHypothesisKey)initWithRouteHypothesisRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEORouteHypothesisKey;
  v6 = [(GEORouteHypothesisKey *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = +[GEOMapService sharedService];
  v4 = [(GEORouteHypothesisRequest *)self->_request destinationLocation];
  id v5 = [v3 handleForMapItem:v4];

  v6 = [[GEOMapItemHandle alloc] initWithData:v5];
  v7 = [(GEOMapItemHandle *)v6 placeRefinementParameters];
  unint64_t v8 = [v7 _routeHypothesisPlaceRefinementParametersHash];

  return v8;
}

- (BOOL)_isEqual:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[GEOMapService sharedService];
  v6 = [(GEORouteHypothesisRequest *)self->_request destinationLocation];
  v7 = [v5 handleForMapItem:v6];

  unint64_t v8 = [[GEOMapItemHandle alloc] initWithData:v7];
  objc_super v9 = +[GEOMapService sharedService];
  v10 = [v9 handleForMapItem:v4];

  v11 = [[GEOMapItemHandle alloc] initWithData:v10];
  GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesisCache");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = [(GEOMapItemHandle *)v8 placeRefinementParameters];
    v14 = [(GEOMapItemHandle *)v11 placeRefinementParameters];
    int v21 = 138478083;
    v22 = v13;
    __int16 v23 = 2113;
    v24 = v14;
    _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_DEBUG, "isAlmostEqual: place refinement parameters for myhandle:%{private}@, otherHandle:%{private}@", (uint8_t *)&v21, 0x16u);
  }
  v15 = [(GEOMapItemHandle *)v8 placeRefinementParameters];
  if ([v15 _hasRequiredFields])
  {
    v16 = [(GEOMapItemHandle *)v11 placeRefinementParameters];
    char v17 = [v16 _hasRequiredFields];

    if ((v17 & 1) == 0)
    {
      char v19 = 0;
      goto LABEL_9;
    }
    v15 = [(GEOMapItemHandle *)v8 placeRefinementParameters];
    v18 = [(GEOMapItemHandle *)v11 placeRefinementParameters];
    char v19 = [v15 _routeHypothesisPlaceRefinementParametersIsEqual:v18];
  }
  else
  {
    char v19 = 0;
  }

LABEL_9:
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = [v4 request];
    v6 = [(GEORouteHypothesisKey *)self request];
    [v6 arrivalDate];
    uint64_t v8 = v7;
    [v5 arrivalDate];
    if (v8 == v9)
    {
      v10 = [(GEORouteHypothesisKey *)self request];
      int v11 = [v10 transportType];
      if (v11 == [v5 transportType])
      {
        v12 = [v5 destinationLocation];
        BOOL v13 = [(GEORouteHypothesisKey *)self _isEqual:v12];
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (GEORouteHypothesisKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEORouteHypothesisKey;
  id v5 = [(GEORouteHypothesisKey *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HypothesisRequestKey"];
    request = v5->_request;
    v5->_request = (GEORouteHypothesisRequest *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  id v4 = [(GEORouteHypothesisRequest *)self->_request destinationLocation];
  [v4 coordinate];
  uint64_t v6 = v5;
  uint64_t v7 = [(GEORouteHypothesisRequest *)self->_request destinationLocation];
  [v7 coordinate];
  uint64_t v9 = v8;
  v10 = (void *)MEMORY[0x1E4F28C10];
  int v11 = (void *)MEMORY[0x1E4F1C9C8];
  [(GEORouteHypothesisRequest *)self->_request arrivalDate];
  v12 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
  BOOL v13 = [v10 localizedStringFromDate:v12 dateStyle:1 timeStyle:1];
  uint64_t v14 = [(GEORouteHypothesisRequest *)self->_request transportType];
  if (v14 >= 7)
  {
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
  }
  else
  {
    v15 = *(&off_1E53E9DA0 + (int)v14);
  }
  v16 = [v3 stringWithFormat:@"[ Destination: (%f, %f)| Arrival Date: %@ | Transport Type: %@", v6, v9, v13, v15];

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORouteHypothesisRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
}

@end