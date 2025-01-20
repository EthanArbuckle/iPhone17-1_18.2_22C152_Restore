@interface NanoRoutePlanningRouteRequestState
- (void)_processIncomingRoutes:(id)a3 error:(id)a4 directionsError:(id)a5 fromTicket:(id)a6;
- (void)cancelRequest;
- (void)dealloc;
- (void)start;
- (void)stop;
@end

@implementation NanoRoutePlanningRouteRequestState

- (void)dealloc
{
  [(MNNavigationServiceDirectionsRequestTicket *)self->_ticket cancel];
  ticket = self->_ticket;
  self->_ticket = 0;

  v4.receiver = self;
  v4.super_class = (Class)NanoRoutePlanningRouteRequestState;
  [(NanoRoutePlanningRouteRequestState *)&v4 dealloc];
}

- (void)start
{
  v3 = [(NanoRoutePlanningState *)self manager];
  objc_super v4 = [v3 request];

  v5 = [v4 waypoints];
  v6 = sub_100029020(v5, &stru_100081410);

  v7 = [v4 routeAttributes];
  v8 = [v4 tracePath];
  id v9 = [v8 length];

  id v10 = objc_alloc((Class)MNDirectionsRequestDetails);
  v11 = v10;
  if (v9)
  {
    v12 = [v4 tracePath];
    id v13 = [v11 initWithTracePath:v12];
  }
  else
  {
    id v13 = [v10 initWithWaypoints:v6 routeAttributes:v7];
  }
  id v14 = [objc_alloc((Class)GEODirectionsRequestFeedback) initWithPurpose:4 andSource:1];
  [v14 setAppIdentifier:MapsAppBundleId];
  [v13 setDirectionsRequestFeedback:v14];
  v15 = [v4 auditToken];
  [v13 setAuditToken:v15];

  v16 = [v4 traits];
  [v13 setTraits:v16];

  v17 = [v4 traits];
  v18 = [v17 deviceLocation];

  [v13 setCurrentUserLocation:v18];
  p_ticket = &self->_ticket;
  ticket = self->_ticket;
  if (ticket)
  {
    [(MNNavigationServiceDirectionsRequestTicket *)ticket cancel];
    v21 = *p_ticket;
    *p_ticket = 0;
  }
  v22 = +[MNNavigationService sharedService];
  v23 = [v22 ticketForDirectionsRequest:v13];

  objc_storeStrong((id *)&self->_ticket, v23);
  v24 = sub_100053DCC();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = sub_10001CA6C(v6);
    *(_DWORD *)buf = 138477827;
    v32 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Will submit directions request ticket for waypoints: %{private}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100010F54;
  v27[3] = &unk_100081460;
  objc_copyWeak(&v30, (id *)buf);
  id v26 = v23;
  id v28 = v26;
  v29 = self;
  [v26 submitWithHandler:v27];

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);
}

- (void)_processIncomingRoutes:(id)a3 error:(id)a4 directionsError:(id)a5 fromTicket:(id)a6
{
  id v10 = a3;
  unint64_t v11 = (unint64_t)a4;
  unint64_t v12 = (unint64_t)a5;
  id v13 = a6;
  if ([(NanoRoutePlanningState *)self isActive])
  {
    id v14 = sub_100053DCC();
    v15 = v14;
    if (v11 | v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        *(void *)&uint8_t buf[4] = [v10 count];
        __int16 v36 = 2114;
        unint64_t v37 = v11;
        __int16 v38 = 2114;
        unint64_t v39 = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Route request returned with %lu routes and error: %{public}@, directionsError: %{public}@", buf, 0x20u);
      }

      ticket = self->_ticket;
      self->_ticket = 0;

      if (v12)
      {
        v17 = +[GEODirectionsError key];
        v33 = v17;
        unint64_t v34 = v12;
        id v18 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        v19 = [v18 objectForKeyedSubscript:NSLocalizedDescriptionKey];

        id v20 = v18;
        if (!v19)
        {
          v21 = sub_100013F14(5);
          id v20 = v18;
          if (v21)
          {
            id v28 = v21;
            id v22 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v18];
            [v22 setObject:v28 forKeyedSubscript:NSLocalizedDescriptionKey];
            id v20 = [v22 copy];

            v21 = v28;
          }
        }
        v23 = +[NSError errorWithDomain:@"NanoRoutePlanningSession", 5, v20, v28 code userInfo];

        goto LABEL_20;
      }
      if (v11)
      {
        uint64_t v25 = sub_100013F14(5);
        v17 = (void *)v25;
        if (v25)
        {
          NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
          *(void *)buf = v25;
          id v18 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v40 count:1];
        }
        else
        {
          id v18 = 0;
        }
        v23 = +[NSError errorWithDomain:@"NanoRoutePlanningSession" code:5 userInfo:v18];
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = [v10 count];
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Route request returned %lu routes", buf, 0xCu);
      }

      v24 = self->_ticket;
      self->_ticket = 0;
    }
    v23 = 0;
LABEL_21:
    id v26 = [(NanoRoutePlanningState *)self manager];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000114B4;
    v29[3] = &unk_100081488;
    id v30 = v13;
    id v31 = v23;
    id v32 = v10;
    id v27 = v23;
    [v26 updateWithBlock:v29];
  }
}

- (void)cancelRequest
{
  if (self->_ticket)
  {
    v3 = sub_100053DCC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Cancelling in-flight route manager request", v5, 2u);
    }

    [(MNNavigationServiceDirectionsRequestTicket *)self->_ticket cancel];
    ticket = self->_ticket;
    self->_ticket = 0;
  }
}

- (void)stop
{
}

- (void).cxx_destruct
{
}

@end