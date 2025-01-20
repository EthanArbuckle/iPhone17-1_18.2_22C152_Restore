@interface CLMapHelperService
- (CLMapHelperService)init;
- (void)clearMemoryAndExitCleanly;
- (void)fetchGEOBuildingDataAroundCoordinate:(CLLocationCoordinate2D)a3 inRadius:(double)a4 tileSetStyle:(int)a5 allowNetwork:(BOOL)a6 clearTiles:(BOOL)a7 withReply:(id)a8;
- (void)fetchGEORoadDataAroundCoordinate:(CLLocationCoordinate2D)a3 inRadius:(double)a4 allowNetwork:(BOOL)a5 isPedestrianOrCycling:(BOOL)a6 clearTiles:(BOOL)a7 withReply:(id)a8;
- (void)releaseOSTransaction;
- (void)setEntitlementsForBuilding:(BOOL)a3;
- (void)setEntitlementsForRoad:(BOOL)a3;
- (void)takeOSTransaction;
@end

@implementation CLMapHelperService

- (CLMapHelperService)init
{
  v12.receiver = self;
  v12.super_class = (Class)CLMapHelperService;
  v2 = [(CLMapHelperService *)&v12 init];
  if (v2)
  {
    id v3 = +[NSString stringWithFormat:@"_CLMapHelperService, %p", v2];
    v4 = (const char *)[v3 UTF8String];
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = (GEOMapFeatureAccess *)[objc_alloc((Class)GEOMapFeatureAccess) initWithQueue:v2->_queue memoryCacheCountLimit:150 memoryCacheCostLimit:0x200000];
    fGEOMapFeatureAccess = v2->fGEOMapFeatureAccess;
    v2->fGEOMapFeatureAccess = v8;

    [v2->fGEOMapFeatureAccess setAllowNetworkTileLoad:1];
    [v2->fGEOMapFeatureAccess setFlipNegativeTravelDirectionRoads:1];
    [v2->fGEOMapFeatureAccess setAllowStaleData:1];
    [v2->fGEOMapFeatureAccess setVisitDoubleTravelDirectionRoadsTwice:1];
    [v2->fGEOMapFeatureAccess setAllowOfflineData:1];
    *(_WORD *)&v2->fHasEntitlementForRoadData = 0;
    fTransaction = v2->fTransaction;
    v2->fTransaction = 0;
  }
  return v2;
}

- (void)clearMemoryAndExitCleanly
{
  NSLog(@"CLTSP,CLMM,MapHelperService CleanExit", a2);
  id v3 = [(CLMapHelperService *)self releaseOSTransaction];

  _xpc_transaction_exit_clean(v3);
}

- (void)fetchGEORoadDataAroundCoordinate:(CLLocationCoordinate2D)a3 inRadius:(double)a4 allowNetwork:(BOOL)a5 isPedestrianOrCycling:(BOOL)a6 clearTiles:(BOOL)a7 withReply:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  v15 = (void (**)(id, void))a8;
  if (!self->fHasEntitlementForRoadData)
  {
    NSLog(@"CLTSP,CLMM,MaphelperService,application missing road data entitlement");
    goto LABEL_10;
  }
  if (latitude == 0.0 && longitude == 0.0)
  {
    NSLog(@"CLTSP,CLMM,MaphelperService,invalid coordinates for road data query");
LABEL_10:
    v15[2](v15, 0);
    goto LABEL_11;
  }
  if (a4 < 0.01 || a4 > 2000.0)
  {
    NSLog(@"CLTSP,CLMM,MaphelperService,invalid radius or over the max allowed radius for road data query");
    goto LABEL_10;
  }
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_100004E64;
  v25[4] = sub_100004E74;
  id v26 = +[NSMutableArray array];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100004E7C;
  v24[3] = &unk_100008220;
  v24[4] = v25;
  v17 = objc_retainBlock(v24);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100005404;
  v20[3] = &unk_100008248;
  v21 = v15;
  v22 = v25;
  BOOL v23 = a7;
  v20[4] = self;
  v18 = objc_retainBlock(v20);
  [(CLMapHelperService *)self takeOSTransaction];
  [self->fGEOMapFeatureAccess setAllowNetworkTileLoad:v10];
  [self->fGEOMapFeatureAccess setVisitDoubleTravelDirectionRoadsTwice:!v9];
  id v19 = -[GEOMapFeatureAccess findRoadsNear:radius:handler:completionHandler:](self->fGEOMapFeatureAccess, "findRoadsNear:radius:handler:completionHandler:", v17, v18, latitude, longitude, a4);

  _Block_object_dispose(v25, 8);
LABEL_11:
}

- (void)fetchGEOBuildingDataAroundCoordinate:(CLLocationCoordinate2D)a3 inRadius:(double)a4 tileSetStyle:(int)a5 allowNetwork:(BOOL)a6 clearTiles:(BOOL)a7 withReply:(id)a8
{
  BOOL v9 = a6;
  uint64_t v10 = *(void *)&a5;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  v15 = (void (**)(id, void))a8;
  if (!self->fHasEntitlementForBuildingData)
  {
    NSLog(@"CLTSP,CLMM,MaphelperService,application missing building data entitlement");
    goto LABEL_10;
  }
  if (latitude == 0.0 && longitude == 0.0)
  {
    NSLog(@"CLTSP,CLMM,MaphelperService,invalid coordinates for building data query");
LABEL_10:
    v15[2](v15, 0);
    goto LABEL_11;
  }
  if (a4 < 0.01 || a4 > 2000.0)
  {
    NSLog(@"CLTSP,CLMM,MaphelperService,invalid radius or over the max allowed radius for building data query");
    goto LABEL_10;
  }
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  CFAbsoluteTime Current = 0.0;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = sub_100004E64;
  v31[4] = sub_100004E74;
  id v32 = +[NSMutableArray array];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100005794;
  v30[3] = &unk_100008270;
  v30[4] = v31;
  v17 = objc_retainBlock(v30);
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  v22 = sub_100005BC4;
  BOOL v23 = &unk_100008298;
  int v28 = v10;
  id v26 = v31;
  v27 = v33;
  BOOL v29 = a7;
  v24 = self;
  v25 = v15;
  v18 = objc_retainBlock(&v20);
  [(CLMapHelperService *)self takeOSTransaction];
  [self->fGEOMapFeatureAccess setAllowNetworkTileLoad:v9];
  id v19 = -[GEOMapFeatureAccess findBuildingsNear:radius:tileSetStyle:handler:completionHandler:](self->fGEOMapFeatureAccess, "findBuildingsNear:radius:tileSetStyle:handler:completionHandler:", v10, v17, v18, latitude, longitude, a4);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);
LABEL_11:
}

- (void)setEntitlementsForRoad:(BOOL)a3
{
  self->fHasEntitlementForRoadData = a3;
}

- (void)setEntitlementsForBuilding:(BOOL)a3
{
  self->fHasEntitlementForBuildingData = a3;
}

- (void)takeOSTransaction
{
  if (!self->fTransaction)
  {
    NSLog(@"CLTSP,CLMM,MaphelperService,Taking OS Transaction", a2);
    self->fTransaction = (OS_os_transaction *)os_transaction_create();
    _objc_release_x1();
  }
}

- (void)releaseOSTransaction
{
  fGEOMapFeatureAccess = self->fGEOMapFeatureAccess;
  if (fGEOMapFeatureAccess) {
    [fGEOMapFeatureAccess clearAllTiles];
  }
  if (self->fTransaction)
  {
    NSLog(@"CLTSP,CLMM,MaphelperService,Releasing OS Transaction", a2);
    fTransaction = self->fTransaction;
    self->fTransaction = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fTransaction, 0);
  objc_storeStrong((id *)&self->fGEOMapFeatureAccess, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end