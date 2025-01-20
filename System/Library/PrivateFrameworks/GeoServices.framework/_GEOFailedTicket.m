@interface _GEOFailedTicket
- (_GEOFailedTicket)initWithError:(id)a3 traits:(id)a4;
- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6;
- (void)submitWithRefinedHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6;
@end

@implementation _GEOFailedTicket

- (_GEOFailedTicket)initWithError:(id)a3 traits:(id)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_GEOFailedTicket;
  v8 = [(GEOAbstractTicket *)&v12 initWithTraits:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_error, a3);
    v10 = v9;
  }

  return v9;
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  id v7 = a3;
  if (v7)
  {
    v8 = +[GEONotificationPreferenceManager sharedManager];
    int v9 = [v8 isEnabledForSubTestWithName:@"GEOPPTTest_PlaceRequest"];

    if (v9)
    {
      v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 postNotificationName:@"GEOPPTTest_PlaceRequestBEGIN" object:0];
    }
    v11 = +[GEONotificationPreferenceManager sharedManager];
    int v12 = [v11 isEnabledForSubTestWithName:@"GEOPPTTest_PlaceRequest_RequestPreparing"];

    if (v12)
    {
      v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 postNotificationName:@"GEOPPTTest_PlaceRequest_RequestPreparingBEGIN" object:0];
    }
    qos_class_self();
    uint64_t v17 = MEMORY[0x1E4F143A8];
    id v18 = v7;
    geo_dispatch_async_qos();
    v14 = +[GEONotificationPreferenceManager sharedManager];
    int v15 = [v14 isEnabledForSubTestWithName:@"GEOPPTTest_PlaceRequest_RequestPreparing"];

    if (v15)
    {
      v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v16 postNotificationName:@"GEOPPTTest_PlaceRequest_RequestPreparingEND" object:0];
    }
  }
}

- (void)submitWithRefinedHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  id v7 = a3;
  if (v7)
  {
    v8 = +[GEONotificationPreferenceManager sharedManager];
    int v9 = [v8 isEnabledForSubTestWithName:@"GEOPPTTest_PlaceRequest"];

    if (v9)
    {
      v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 postNotificationName:@"GEOPPTTest_PlaceRequestBEGIN" object:0];
    }
    v11 = +[GEONotificationPreferenceManager sharedManager];
    int v12 = [v11 isEnabledForSubTestWithName:@"GEOPPTTest_PlaceRequest_RequestPreparing"];

    if (v12)
    {
      v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 postNotificationName:@"GEOPPTTest_PlaceRequest_RequestPreparingBEGIN" object:0];
    }
    qos_class_self();
    uint64_t v17 = MEMORY[0x1E4F143A8];
    id v18 = v7;
    geo_dispatch_async_qos();
    v14 = +[GEONotificationPreferenceManager sharedManager];
    int v15 = [v14 isEnabledForSubTestWithName:@"GEOPPTTest_PlaceRequest_RequestPreparing"];

    if (v15)
    {
      v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v16 postNotificationName:@"GEOPPTTest_PlaceRequest_RequestPreparingEND" object:0];
    }
  }
}

- (void).cxx_destruct
{
}

@end