@interface GEORouteHypothesisMonitorTransit
- (id)routeName;
- (void)_recalculateETAWithRouteMatch:(id)a3;
- (void)checkRouteForLocation:(id)a3;
@end

@implementation GEORouteHypothesisMonitorTransit

- (void)_recalculateETAWithRouteMatch:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = [(GEOComposedRoute *)self->super._route startDate];
  if (v4)
  {
    [(NSDate *)self->super._arrivalDate timeIntervalSinceDate:v4];
    double v6 = v5;
    v7 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

    if (v8)
    {
      v9 = [(GEOComposedRoute *)self->super._route startDate];
      v10 = objc_msgSend(v9, "dateByAddingTimeInterval:", (double)-[GEOComposedRoute expectedTime](self->super._route, "expectedTime"));

      GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        arrivalDate = self->super._arrivalDate;
        v13 = _navd_debugDurationAsString(v6);
        int v15 = 138478595;
        v16 = arrivalDate;
        __int16 v17 = 2113;
        v18 = v4;
        __int16 v19 = 2113;
        v20 = v13;
        __int16 v21 = 2113;
        v22 = v10;
        _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEBUG, "Updating transit ETA. Event Date: %{private}@, Start Date: %{private}@, Travel time: %{private}@, Arrival Date: %{private}@", (uint8_t *)&v15, 0x2Au);
      }
    }
    [(GEORouteHypothesis *)self->super._hypothesis _setError:0];
    [(GEORouteHypothesis *)self->super._hypothesis _updateDepartureAndArrivalSuggestionsForArrivalDate:self->super._arrivalDate travelTimeWithTraffic:[(GEOComposedRoute *)self->super._route transportType] conservativeTravelTime:v6 aggressiveTravelTime:v6 transportType:v6];
  }
  else
  {
    v14 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_ERROR, "Updating transit ETA but we did not get a start date for the route.", (uint8_t *)&v15, 2u);
    }

    [(GEORouteHypothesis *)self->super._hypothesis _clearHypothesisAndSetErrorWithCode:-11];
  }
}

- (void)checkRouteForLocation:(id)a3
{
  id v5 = a3;
  if (self->super._route)
  {
    self->super._needReroute = 1;
    id v6 = v5;
    objc_storeStrong((id *)&self->super._lastMatchedLocation, a3);
    id v5 = v6;
  }
}

- (id)routeName
{
  route = self->super._route;
  if (route)
  {
    if ([(GEOComposedRoute *)route isWalkingOnlyTransitRoute])
    {
      v4 = [(GEOComposedRoute *)self->super._route name];
    }
    else if (serverFormattedStringFormatter {
           && ([(GEOComposedRoute *)self->super._route transitDescriptionFormatString],
    }
               id v5 = objc_claimAutoreleasedReturnValue(),
               v5,
               v5))
    {
      id v6 = (void *)serverFormattedStringFormatter;
      v7 = [(GEOComposedRoute *)self->super._route transitDescriptionFormatString];
      v4 = [v6 stringForServerFormattedString:v7];
    }
    else
    {
      v4 = @"by transit";
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end