@interface MKLocalSearch
- (BOOL)isSearching;
- (MKLocalSearch)init;
- (MKLocalSearch)initWithPointsOfInterestRequest:(MKLocalPointsOfInterestRequest *)request;
- (MKLocalSearch)initWithRequest:(MKLocalSearchRequest *)request;
- (id)_ticketForSearchRequest:(id)a3;
- (void)_handleMapItems:(id)a3 boundingRegion:(id)a4 error:(id)a5 withCompletionHandler:(id)a6;
- (void)_startPointsOfInterestFetchWithCompletionHandler:(id)a3 queue:(id)a4;
- (void)_startWithCompletionHandler:(id)a3 queue:(id)a4;
- (void)cancel;
- (void)startWithCompletionHandler:(MKLocalSearchCompletionHandler)completionHandler;
@end

@implementation MKLocalSearch

- (MKLocalSearch)initWithRequest:(MKLocalSearchRequest *)request
{
  v4 = request;
  v14.receiver = self;
  v14.super_class = (Class)MKLocalSearch;
  v5 = [(MKLocalSearch *)&v14 init];
  if (v5)
  {
    if (!v4)
    {
      v10 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v11 = *MEMORY[0x1E4F1C3C8];
      v12 = [NSString stringWithFormat:@"Cannot initialize MKLocalSearch with nil request"];
      id v13 = [v10 exceptionWithName:v11 reason:v12 userInfo:0];

      objc_exception_throw(v13);
    }
    uint64_t v6 = [(MKLocalSearchRequest *)v4 copy];
    v7 = v5->_request;
    v5->_request = (MKLocalSearchRequest *)v6;

    v5->_stateLock._os_unfair_lock_opaque = 0;
    v8 = v5;
  }

  return v5;
}

- (void)_startWithCompletionHandler:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (!v7)
    {
      v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3B8];
      uint64_t v11 = [NSString stringWithFormat:@"MKLocalSearch must have valid dispatch_queue"];
      v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];
      [v12 raise];
    }
    os_unfair_lock_lock_with_options();
    if (self->_searching)
    {
      os_unfair_lock_unlock(&self->_stateLock);
      NSLog(&cfstr_CannotCallMklo.isa);
      id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
      objc_super v14 = (void *)[v13 initWithDomain:MKErrorDomain code:1 userInfo:0];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__MKLocalSearch__startWithCompletionHandler_queue___block_invoke;
      block[3] = &unk_1E54B8360;
      id v27 = v14;
      id v28 = v6;
      id v15 = v14;
      dispatch_async(v8, block);

      goto LABEL_12;
    }
    self->_searching = 1;
    os_unfair_lock_unlock(&self->_stateLock);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v16 = __51__MKLocalSearch__startWithCompletionHandler_queue___block_invoke_2;
    v21 = __51__MKLocalSearch__startWithCompletionHandler_queue___block_invoke_2;
    v22 = &unk_1E54B8338;
    v23 = self;
    id v25 = v6;
    v24 = v8;
    v17 = v24;
    v18 = v20;
    if (v17 == MEMORY[0x1E4F14428])
    {
      if (![MEMORY[0x1E4F29060] isMainThread])
      {
        v19 = (void *)MEMORY[0x1E4F14428];
        dispatch_async(MEMORY[0x1E4F14428], v18);

        goto LABEL_11;
      }
      v16 = v21;
    }
    v16((uint64_t)v18);
LABEL_11:
  }
LABEL_12:
}

void __51__MKLocalSearch__startWithCompletionHandler_queue___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 45))
  {
    v3 = (os_unfair_lock_s *)(v2 + 40);
    os_unfair_lock_unlock(v3);
  }
  else
  {
    uint64_t v4 = [(id)v2 _ticketForSearchRequest:*(void *)(v2 + 8)];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;

    uint64_t v7 = *(void *)(a1 + 32);
    v8 = (os_unfair_lock_s *)(v7 + 40);
    id v9 = *(id *)(v7 + 16);
    os_unfair_lock_unlock(v8);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__MKLocalSearch__startWithCompletionHandler_queue___block_invoke_3;
    v10[3] = &unk_1E54B9FF8;
    v10[4] = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    [v9 submitWithHandler:v10 queue:*(void *)(a1 + 40) networkActivity:0];
  }
}

- (id)_ticketForSearchRequest:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 _merchantParameters];

  if (v4)
  {
    uint64_t v5 = [v3 _merchantParameters];
    id v6 = [v5 transactionLocation];

    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F64660]);
      v8 = [v3 _merchantParameters];
      id v9 = [v8 transactionLocation];
      uint64_t v10 = [v7 initWithCLLocation:v9];
    }
    else
    {
      uint64_t v10 = 0;
    }
    v18 = [v3 _deviceLocation];

    v88 = (void *)v10;
    if (v18)
    {
      v19 = +[MKMapService sharedService];
      v20 = [v19 defaultTraits];

      id v21 = objc_alloc(MEMORY[0x1E4F64660]);
      v22 = [v3 _deviceLocation];
      v23 = (void *)[v21 initWithCLLocation:v22];
      [v20 setDeviceLocation:v23];
    }
    else
    {
      v20 = 0;
    }
    v84 = v20;
    v89 = +[MKMapService sharedService];
    v87 = [v3 _merchantParameters];
    v82 = [v87 merchantCode];
    v86 = [v3 _merchantParameters];
    uint64_t v24 = [v86 rawMerchantCode];
    v85 = [v3 _merchantParameters];
    id v25 = [v85 industryCategory];
    v83 = [v3 _merchantParameters];
    v26 = [v83 industryCode];
    id v27 = [v3 _merchantParameters];
    id v28 = [v27 paymentNetwork];
    v29 = [v3 _merchantParameters];
    v30 = [v29 transactionDate];
    v81 = v20;
    v17 = v88;
    v31 = (void *)v24;
    v32 = [v89 ticketForMerchantCode:v82 rawMerchantCode:v24 industryCategory:v25 industryCode:v26 paymentNetwork:v28 transactionDate:v30 transactionLocation:v88 traits:v81];

    v33 = v84;
    goto LABEL_20;
  }
  id v11 = [v3 _externalTransitLookupParameters];

  if (v11)
  {
    v12 = [v3 _externalTransitLookupParameters];
    id v13 = [v12 transactionLocation];

    if (v13)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F64660]);
      id v15 = [v3 _externalTransitLookupParameters];
      v16 = [v15 transactionLocation];
      v17 = (void *)[v14 initWithCLLocation:v16];
    }
    else
    {
      v17 = 0;
    }
    v37 = [v3 _deviceLocation];

    if (v37)
    {
      v38 = +[MKMapService sharedService];
      v39 = [v38 defaultTraits];

      id v40 = objc_alloc(MEMORY[0x1E4F64660]);
      v41 = [v3 _deviceLocation];
      v42 = (void *)[v40 initWithCLLocation:v41];
      v43 = v39;
      [v39 setDeviceLocation:v42];
    }
    else
    {
      v43 = 0;
    }
    v90 = +[MKMapService sharedService];
    v44 = [v3 _externalTransitLookupParameters];
    v45 = [v44 stationCodes];
    v46 = [v3 _externalTransitLookupParameters];
    v47 = [v46 sourceIdentifier];
    v48 = [v3 _externalTransitLookupParameters];
    v49 = [v48 transactionDate];
    v50 = v43;
    v32 = [v90 ticketForExternalTransitStationCodes:v45 sourceID:v47 transactionDate:v49 transactionLocation:v17 traits:v43];

    v33 = v50;
    goto LABEL_20;
  }
  v34 = [v3 _phoneNumbers];
  uint64_t v35 = [v34 count];

  if (v35)
  {
    v17 = +[MKMapService sharedService];
    v33 = [v3 _phoneNumbers];
    uint64_t v36 = objc_msgSend(v17, "ticketForPhoneNumbers:allowCellularDataForLookup:traits:", v33, objc_msgSend(v3, "_allowPhoneNumberLookupUsingCellular"), 0);
LABEL_14:
    v32 = (void *)v36;
    goto LABEL_20;
  }
  v52 = [v3 _muids];
  uint64_t v53 = [v52 count];

  if (v53)
  {
    if ([v3 _hasRegion])
    {
      v54 = +[MKMapService sharedService];
      v17 = [v54 defaultTraits];

      v55 = (void *)MEMORY[0x1E4F64700];
      [v3 region];
      v56 = objc_msgSend(v55, "_mapkit_mapRegionForCoordinateRegion:");
      [v17 setMapRegion:v56];
    }
    else
    {
      v17 = 0;
    }
    v33 = +[MKMapService sharedService];
    v61 = [v3 _muids];
    v32 = objc_msgSend(v33, "ticketForMUIDs:resultProviderID:contentProvider:traits:", v61, objc_msgSend(v3, "_resultProviderID"), 0, v17);
  }
  else
  {
    uint64_t v57 = [v3 _canonicalSearchString];
    if (v57)
    {
      v58 = (void *)v57;
      v59 = [v3 _canonicalSearchString];
      uint64_t v60 = [v59 length];

      if (v60)
      {
        v17 = +[MKMapService sharedService];
        v33 = [v3 _canonicalSearchString];
        uint64_t v36 = [v17 ticketForCanonicalLocationSearchQueryString:v33 traits:0];
        goto LABEL_14;
      }
    }
    v62 = +[MKMapService sharedService];
    v17 = [v62 defaultTraits];

    if ([v3 _hasRegion])
    {
      v63 = (void *)MEMORY[0x1E4F64700];
      [v3 region];
      v64 = objc_msgSend(v63, "_mapkit_mapRegionForCoordinateRegion:");
      [v17 setMapRegion:v64];
    }
    uint64_t v65 = [v3 geoCompletionItem];
    if (v65)
    {
      v66 = (void *)v65;
      char v67 = [v3 hasSentFeedbackForCompletion];

      if ((v67 & 1) == 0)
      {
        [v3 setHasSentFeedbackForCompletion:1];
        v68 = [v3 geoCompletionItem];
        [v68 sendFeedback];
      }
    }
    v33 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    v69 = [v3 pointOfInterestFilter];
    v70 = [v69 _geoPOICategoryFilter];

    if (v70) {
      [v33 addObject:v70];
    }

    v71 = [v3 addressFilter];

    if (v71)
    {
      v72 = [v3 addressFilter];
      v73 = [v72 _geoAddressFilter];

      if (v73) {
        [v33 addObject:v73];
      }
    }
    if ([v3 resultTypes])
    {
      uint64_t v74 = [v3 resultTypes];
      BOOL v75 = _MKLinkedOnOrAfterReleaseSet(3852);
      if ((v74 & 2) != 0 && !v75) {
        v74 |= 4uLL;
      }
      v77 = (void *)[objc_alloc(MEMORY[0x1E4F64938]) initWithResultTypes:v74];
      [v33 addObject:v77];
    }
    if ([v3 regionPriority] == 1)
    {
      id v78 = objc_alloc_init(MEMORY[0x1E4F64A98]);
      [v33 addObject:v78];
    }
    v61 = +[MKMapService sharedService];
    v79 = [v3 naturalLanguageQuery];
    v80 = [v3 geoCompletionItem];
    v32 = objc_msgSend(v61, "_mk_ticketForSearchQuery:completionItem:traits:filters:", v79, v80, v17, v33);
  }
LABEL_20:

  return v32;
}

void __51__MKLocalSearch__startWithCompletionHandler_queue___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  os_unfair_lock_lock_with_options();
  id v9 = [*(id *)(*(void *)(a1 + 32) + 16) boundingRegion];
  *(unsigned char *)(*(void *)(a1 + 32) + 44) = 0;
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  [*(id *)(a1 + 32) _handleMapItems:v6 boundingRegion:v9 error:v5 withCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_handleMapItems:(id)a3 boundingRegion:(id)a4 error:(id)a5 withCompletionHandler:(id)a6
{
  id v15 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, id, void))a6;
  if (v11)
  {
    if (v10)
    {
      uint64_t v12 = objc_msgSend(v10, "_mapkit_error");
    }
    else
    {
      if ([v15 count])
      {
        id v13 = [[MKLocalSearchResponse alloc] _initWithMapItems:v15 boundingRegion:v9];
        v11[2](v11, v13, 0);
        goto LABEL_7;
      }
      id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v12 = [v14 initWithDomain:MKErrorDomain code:1 userInfo:0];
    }
    id v13 = (id)v12;
    v11[2](v11, 0, v12);
LABEL_7:
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spatialPlaceLookupTicket, 0);
  objc_storeStrong((id *)&self->_pointsOfInterestRequest, 0);
  objc_storeStrong((id *)&self->_ticket, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (MKLocalSearch)init
{
  return [(MKLocalSearch *)self initWithRequest:0];
}

- (MKLocalSearch)initWithPointsOfInterestRequest:(MKLocalPointsOfInterestRequest *)request
{
  uint64_t v4 = request;
  v14.receiver = self;
  v14.super_class = (Class)MKLocalSearch;
  id v5 = [(MKLocalSearch *)&v14 init];
  if (v5)
  {
    if (!v4)
    {
      id v10 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v11 = *MEMORY[0x1E4F1C3C8];
      uint64_t v12 = [NSString stringWithFormat:@"Cannot initialize MKLocalSearch with nil request"];
      id v13 = [v10 exceptionWithName:v11 reason:v12 userInfo:0];

      objc_exception_throw(v13);
    }
    uint64_t v6 = [(MKLocalPointsOfInterestRequest *)v4 copy];
    pointsOfInterestRequest = v5->_pointsOfInterestRequest;
    v5->_pointsOfInterestRequest = (MKLocalPointsOfInterestRequest *)v6;

    v5->_stateLock._os_unfair_lock_opaque = 0;
    v8 = v5;
  }

  return v5;
}

uint64_t __51__MKLocalSearch__startWithCompletionHandler_queue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)startWithCompletionHandler:(MKLocalSearchCompletionHandler)completionHandler
{
  if (self->_request) {
    [(MKLocalSearch *)self _startWithCompletionHandler:completionHandler queue:MEMORY[0x1E4F14428]];
  }
  else {
    [(MKLocalSearch *)self _startPointsOfInterestFetchWithCompletionHandler:completionHandler queue:MEMORY[0x1E4F14428]];
  }
}

- (void)_startPointsOfInterestFetchWithCompletionHandler:(id)a3 queue:(id)a4
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (!v7)
    {
      id v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3B8];
      uint64_t v11 = [NSString stringWithFormat:@"MKLocalSearch must have valid dispatch_queue"];
      uint64_t v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];
      [v12 raise];
    }
    id v13 = [(MKLocalPointsOfInterestRequest *)self->_pointsOfInterestRequest pointOfInterestFilter];
    int v14 = [v13 _excludesAllCategories];

    if (v14)
    {
      NSLog(&cfstr_Mklocalpointso.isa);
      id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
      v16 = MKErrorDomain;
      uint64_t v45 = *MEMORY[0x1E4F28228];
      v46[0] = @"MKLocalPointsOfInterestRequest configured to exclude all categories - This request cannot fetch any POIs";
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
      v18 = (void *)[v15 initWithDomain:v16 code:1 userInfo:v17];

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __72__MKLocalSearch__startPointsOfInterestFetchWithCompletionHandler_queue___block_invoke;
      block[3] = &unk_1E54B8360;
      id v43 = v18;
      id v44 = v6;
      v19 = v18;
      dispatch_async(v8, block);

      v20 = v44;
    }
    else
    {
      os_unfair_lock_lock(&self->_stateLock);
      if (self->_searching)
      {
        os_unfair_lock_unlock(&self->_stateLock);
        NSLog(&cfstr_CannotCallMklo.isa);
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        v22 = (void *)[v21 initWithDomain:MKErrorDomain code:1 userInfo:0];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __72__MKLocalSearch__startPointsOfInterestFetchWithCompletionHandler_queue___block_invoke_2;
        v39[3] = &unk_1E54B8360;
        id v40 = v22;
        id v41 = v6;
        v19 = v22;
        dispatch_async(v8, v39);

        v20 = v41;
      }
      else
      {
        self->_searching = 1;
        int64_t v23 = [(MKLocalPointsOfInterestRequest *)self->_pointsOfInterestRequest _maxResultCount];
        if ([(MKLocalPointsOfInterestRequest *)self->_pointsOfInterestRequest _createdFromRegion])
        {
          uint64_t v24 = (void *)MEMORY[0x1E4F64700];
          [(MKLocalPointsOfInterestRequest *)self->_pointsOfInterestRequest region];
          id v25 = objc_msgSend(v24, "_mapkit_mapRegionForCoordinateRegion:");
          v26 = +[MKMapService sharedService];
          id v27 = [(MKLocalPointsOfInterestRequest *)self->_pointsOfInterestRequest pointOfInterestFilter];
          id v28 = [v26 ticketForSpatialPlaceLookupWithMapRegion:v25 pointOfInterestFilter:v27 maxResultCount:v23];
          spatialPlaceLookupTicket = self->_spatialPlaceLookupTicket;
          self->_spatialPlaceLookupTicket = v28;
        }
        else
        {
          id v25 = +[MKMapService sharedService];
          [(MKLocalPointsOfInterestRequest *)self->_pointsOfInterestRequest coordinate];
          double v31 = v30;
          double v33 = v32;
          [(MKLocalPointsOfInterestRequest *)self->_pointsOfInterestRequest radius];
          double v35 = v34;
          v26 = [(MKLocalPointsOfInterestRequest *)self->_pointsOfInterestRequest pointOfInterestFilter];
          objc_msgSend(v25, "ticketForSpatialPlaceLookupWithCenterCoordinate:radius:pointOfInterestFilter:maxResultCount:", v26, v23, v31, v33, v35);
          uint64_t v36 = (MKMapServiceSpatialPlaceLookupTicket *)objc_claimAutoreleasedReturnValue();
          id v27 = self->_spatialPlaceLookupTicket;
          self->_spatialPlaceLookupTicket = v36;
        }

        v19 = self->_spatialPlaceLookupTicket;
        os_unfair_lock_unlock(&self->_stateLock);
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __72__MKLocalSearch__startPointsOfInterestFetchWithCompletionHandler_queue___block_invoke_3;
        v37[3] = &unk_1E54B9FF8;
        v37[4] = self;
        id v38 = v6;
        [(MKMapServiceSpatialPlaceLookupTicket *)v19 submitWithHandler:v37 queue:MEMORY[0x1E4F14428]];
        v20 = v38;
      }
    }
  }
}

uint64_t __72__MKLocalSearch__startPointsOfInterestFetchWithCompletionHandler_queue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __72__MKLocalSearch__startPointsOfInterestFetchWithCompletionHandler_queue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __72__MKLocalSearch__startPointsOfInterestFetchWithCompletionHandler_queue___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  os_unfair_lock_lock_with_options();
  id v9 = [*(id *)(*(void *)(a1 + 32) + 32) boundingRegion];
  *(unsigned char *)(*(void *)(a1 + 32) + 44) = 0;
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  [*(id *)(a1 + 32) _handleMapItems:v6 boundingRegion:v9 error:v5 withCompletionHandler:*(void *)(a1 + 40)];
}

- (void)cancel
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_searching && !self->_cancelled)
  {
    self->_cancelled = 1;
    [(MKMapServiceTicket *)self->_ticket cancel];
    [(MKMapServiceSpatialPlaceLookupTicket *)self->_spatialPlaceLookupTicket cancel];
  }

  os_unfair_lock_unlock(p_stateLock);
}

- (BOOL)isSearching
{
  uint64_t v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_searching;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

@end