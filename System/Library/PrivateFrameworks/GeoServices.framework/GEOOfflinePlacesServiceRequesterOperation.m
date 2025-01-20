@interface GEOOfflinePlacesServiceRequesterOperation
- (GEOOfflinePlacesServiceRequesterOperation)initWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 config:(id)a6 throttleToken:(id)a7 options:(unint64_t)a8 willSendRequestHandler:(id)a9 validationHandler:(id)a10 completionHandler:(id)a11;
- (id)validateRequest:(id)a3 withAvailableRegions:(id)a4 returningResponseOrError:(id *)a5;
- (void)_recordAnalyticsDataForResponse:(id)a3;
@end

@implementation GEOOfflinePlacesServiceRequesterOperation

- (GEOOfflinePlacesServiceRequesterOperation)initWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 config:(id)a6 throttleToken:(id)a7 options:(unint64_t)a8 willSendRequestHandler:(id)a9 validationHandler:(id)a10 completionHandler:(id)a11
{
  id v17 = a5;
  v23.receiver = self;
  v23.super_class = (Class)GEOOfflinePlacesServiceRequesterOperation;
  v18 = [(GEOOfflineServiceRequesterOperation *)&v23 initWithRequest:a3 traits:a4 auditToken:v17 config:a6 throttleToken:a7 options:a8 willSendRequestHandler:a9 validationHandler:a10 completionHandler:a11];
  if (v18)
  {
    v19 = [v17 offlineCohortId];
    uint64_t v20 = [v19 copy];
    offlineCohortId = v18->_offlineCohortId;
    v18->_offlineCohortId = (NSString *)v20;
  }
  return v18;
}

- (void)_recordAnalyticsDataForResponse:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v5 = v8;
  if (isKindOfClass)
  {
    id v6 = v8;
    if ([v6 hasAnalyticData])
    {
      v7 = [v6 analyticData];
      +[GEORequestResponseMetadataRecorder recordPlacesRequestResponseAnalyticsData:v7 forCohortId:self->_offlineCohortId];
    }
    v5 = v8;
  }
}

- (id)validateRequest:(id)a3 withAvailableRegions:(id)a4 returningResponseOrError:(id *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    if ([v8 requestType] == 7)
    {
      v9 = [v8 placeRequestParameters];
      uint64_t v10 = -[GEOPDPlaceRequestParameters placeRefinementParameters](v9);

      if (v10)
      {
        -[GEOPDPlaceRefinementParameters _readLocationHint](v10);
        if (*(void *)(v10 + 48))
        {
          v11 = -[GEOPDPlaceRefinementParameters locationHint]((id *)v10);
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v12 = v7;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v23;
            while (2)
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v23 != v15) {
                  objc_enumerationMutation(v12);
                }
                id v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
                [v11 coordinate];
                if (objc_msgSend(v17, "containsCoordinate:"))
                {

                  v19 = 0;
                  goto LABEL_19;
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }

          if (qword_1EB2A0910 != -1) {
            dispatch_once(&qword_1EB2A0910, &__block_literal_global_217);
          }
          v18 = _MergedGlobals_351;
          if (os_log_type_enabled((os_log_t)_MergedGlobals_351, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v21 = 0;
            _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_INFO, "PLACE_REFINEMENT request's location hint is not contained by any loaded offline regions. Failing request", v21, 2u);
          }
          v19 = objc_alloc_init(GEOPDPlaceResponse);
          -[GEOPDPlaceResponse setRequestType:](v19, "setRequestType:", [v8 requestType]);
          [(GEOPDPlaceResponse *)v19 setStatus:1];
LABEL_19:

          goto LABEL_22;
        }
      }
    }
    v19 = 0;
LABEL_22:

    goto LABEL_23;
  }
  v19 = 0;
LABEL_23:

  return v19;
}

- (void).cxx_destruct
{
}

@end