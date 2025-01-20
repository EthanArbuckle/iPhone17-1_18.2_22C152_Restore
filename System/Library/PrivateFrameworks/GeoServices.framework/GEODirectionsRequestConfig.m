@interface GEODirectionsRequestConfig
- ($D10D8C5E6DF5C70B839224840994203A)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (BOOL)supportsOffline;
- (BOOL)usesBackgroundURL;
- (GEODirectionsRequestConfig)initWithRequest:(id)a3 requestPriority:(id)a4;
- (id)additionalHTTPHeaders;
- (id)additionalStatesForNetworkEvent;
- (id)additionalURLQueryItems;
- (id)serviceTypeNumber;
- (unint64_t)multipathServiceType;
- (unint64_t)urlType;
@end

@implementation GEODirectionsRequestConfig

- (GEODirectionsRequestConfig)initWithRequest:(id)a3 requestPriority:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GEODirectionsRequestConfig;
  v9 = [(GEODirectionsRequestConfig *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    v11 = (NSNumber *)[v8 copy];
    requestPriority = v10->_requestPriority;
    v10->_requestPriority = v11;
  }
  return v10;
}

- (unint64_t)urlType
{
  return 2;
}

- (id)additionalURLQueryItems
{
  v3 = GEOConfigGetString();
  if ([v3 length])
  {
    if ([v3 hasPrefix:@"?"]) {
      v4 = @"http://www.apple.com/";
    }
    else {
      v4 = @"http://www.apple.com/?";
    }
    v5 = [(__CFString *)v4 stringByAppendingString:v3];
    v6 = +[NSURLComponents componentsWithString:v5];
    id v7 = [v6 queryItems];

    if (v7)
    {
      id v8 = [v6 queryItems];

      goto LABEL_9;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)GEODirectionsRequestConfig;
  id v8 = [(GEODirectionsRequestConfig *)&v10 additionalURLQueryItems];
LABEL_9:

  return v8;
}

- (id)additionalHTTPHeaders
{
  requestPriority = self->_requestPriority;
  if (requestPriority)
  {
    v3 = +[NSString stringWithFormat:@"%ld", [(NSNumber *)requestPriority integerValue]];
    CFStringRef v6 = @"x-msg-priority";
    id v7 = v3;
    v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)serviceTypeNumber
{
  return +[NSNumber numberWithInt:4];
}

- ($D10D8C5E6DF5C70B839224840994203A)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($D10D8C5E6DF5C70B839224840994203A)512;
}

- (unint64_t)multipathServiceType
{
  return GEOConfigGetInteger();
}

- (id)additionalStatesForNetworkEvent
{
  id v3 = objc_alloc_init((Class)GEOLogMsgState);
  id v4 = objc_alloc_init((Class)GEOLogMsgStateDirectionsDetail);
  [v3 setDirectionsDetail:v4];

  [v3 setStateType:721];
  v5 = [(GEODirectionsRequest *)self->_request routeAttributes];
  unsigned int v6 = [v5 hasMainTransportType];

  if (v6)
  {
    id v7 = [(GEODirectionsRequest *)self->_request routeAttributes];
    id v8 = [v7 mainTransportType];
    v9 = [v3 directionsDetail];
    [v9 setTransportType:v8];
  }
  objc_super v10 = [(GEODirectionsRequest *)self->_request routeAttributes];
  v11 = [v10 automobileOptions];
  v12 = [v11 vehicleSpecifications];
  id v13 = [v12 hasEvInfo];
  objc_super v14 = [v3 directionsDetail];
  [v14 setIsEv:v13];

  id v17 = v3;
  v15 = +[NSArray arrayWithObjects:&v17 count:1];

  return v15;
}

- (BOOL)usesBackgroundURL
{
  return 0;
}

- (BOOL)supportsOffline
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_requestPriority, 0);
}

@end