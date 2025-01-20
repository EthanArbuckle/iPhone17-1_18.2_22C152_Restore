@interface RTRoutineManager
- (void)_maps_fetchAllLocationsOfInterestWithHandler:(id)a3;
- (void)_maps_fetchAllVisitedLocationsOfInterestWithHandler:(id)a3;
- (void)_maps_fetchLocationsOfInterestWithTypes:(int)a3 handler:(id)a4;
- (void)_maps_fetchPredictedLocationsOfInterestWithHandler:(id)a3;
@end

@implementation RTRoutineManager

- (void)_maps_fetchAllVisitedLocationsOfInterestWithHandler:(id)a3
{
}

- (void)_maps_fetchAllLocationsOfInterestWithHandler:(id)a3
{
}

- (void)_maps_fetchPredictedLocationsOfInterestWithHandler:(id)a3
{
}

- (void)_maps_fetchLocationsOfInterestWithTypes:(int)a3 handler:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  dispatch_group_t v7 = dispatch_group_create();
  +[NSMutableSet set];
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_5268;
  v30[4] = sub_5278;
  id v31 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_5280;
  v26[3] = &unk_60CE8;
  v29 = v30;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v27 = v8;
  v9 = v7;
  v28 = v9;
  v10 = objc_retainBlock(v26);
  if (v4)
  {
    dispatch_group_enter(v9);
    [(RTRoutineManager *)self fetchLocationsOfInterestOfType:0 withHandler:v10];
    dispatch_group_enter(v9);
    [(RTRoutineManager *)self fetchLocationsOfInterestOfType:1 withHandler:v10];
  }
  if ((v4 & 2) != 0)
  {
    v11 = +[NSDate date];
    v12 = [v11 dateByAddingTimeInterval:-4233600.0];
    dispatch_group_enter(v9);
    [(RTRoutineManager *)self fetchLocationsOfInterestVisitedBetweenStartDate:v12 endDate:v11 withHandler:v10];
  }
  if ((v4 & 4) != 0)
  {
    id v13 = objc_alloc((Class)NSDateInterval);
    v14 = +[NSDate date];
    id v15 = [v13 initWithStartDate:v14 duration:3024000.0];

    dispatch_group_enter(v9);
    v16 = [v15 startDate];
    v17 = [v15 endDate];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_53CC;
    v24[3] = &unk_60D10;
    v25 = v10;
    [(RTRoutineManager *)self fetchPredictedLocationsOfInterestBetweenStartDate:v16 endDate:v17 withHandler:v24];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5554;
  block[3] = &unk_60D38;
  id v22 = v6;
  v23 = v30;
  id v21 = v8;
  id v18 = v8;
  id v19 = v6;
  dispatch_group_notify(v9, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v30, 8);
}

@end