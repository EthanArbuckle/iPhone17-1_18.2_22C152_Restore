@interface RAPBatchSubmissionStatusTicket
- (void)fetchStatusesForIdentifiers:(id)a3 completion:(id)a4;
@end

@implementation RAPBatchSubmissionStatusTicket

- (void)fetchStatusesForIdentifiers:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = v5;
    id v8 = objc_alloc_init((Class)GEORPRapQueryParameters);
    id v9 = [v7 mutableCopy];

    [v8 setFeedbackIds:v9];
    id v10 = objc_alloc_init((Class)GEORPFeedbackRequestParameters);
    id v11 = objc_alloc_init((Class)GEORPFeedbackQueryParameters);
    [v10 setQueryParameters:v11];

    v12 = [v10 queryParameters];
    [v12 addFeedbackComponentType:5];

    id v13 = objc_alloc_init((Class)GEORPFeedbackComponentQueryParameters);
    v14 = [v10 queryParameters];
    [v14 setComponentQueryParameters:v13];

    v15 = [v10 queryParameters];
    v16 = [v15 componentQueryParameters];
    [v16 setRapQueryParameters:v8];

    id v17 = objc_alloc((Class)GEORPFeedbackRequest);
    v18 = +[GEOMapService sharedService];
    v19 = [v18 defaultTraits];
    id v20 = [v17 initWithFeedbackRequestParameters:v10 traits:v19];

    v21 = sub_100005260();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Created request %@", buf, 0xCu);
    }

    v22 = +[GEOMapService sharedService];
    v23 = +[GEOMapService sharedService];
    v24 = [v23 defaultTraits];
    v25 = [v22 ticketForFeedbackRequest:v20 traits:v24];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000052B4;
    v26[3] = &unk_100038988;
    id v27 = v6;
    [v25 submitWithHandler:v26 networkActivity:0];
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

@end