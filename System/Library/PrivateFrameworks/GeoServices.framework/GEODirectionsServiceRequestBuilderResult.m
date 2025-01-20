@interface GEODirectionsServiceRequestBuilderResult
+ (id)resultWithError:(id)a3;
+ (id)resultWithWaypoints:(id)a3 directionsRequest:(id)a4;
@end

@implementation GEODirectionsServiceRequestBuilderResult

+ (id)resultWithWaypoints:(id)a3 directionsRequest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v8 = (void *)v7[1];
  v7[1] = v5;
  id v9 = v5;

  v10 = (void *)v7[2];
  v7[2] = v6;

  return v7;
}

+ (id)resultWithError:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = (void *)v4[3];
  v4[3] = v3;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_directionsRequest, 0);

  objc_storeStrong((id *)&self->_waypoints, 0);
}

@end