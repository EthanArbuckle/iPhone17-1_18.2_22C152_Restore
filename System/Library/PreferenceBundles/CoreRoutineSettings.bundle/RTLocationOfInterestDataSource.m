@interface RTLocationOfInterestDataSource
+ (id)configureDateRangeString:(id)a3 dateStyle:(unint64_t)a4 timeStyle:(unint64_t)a5;
- (NSArray)recentRecords;
- (NSDateInterval)summaryInterval;
- (RTLocationOfInterestDataSource)init;
- (RTLocationOfInterestDataSource)initWithRoutineManager:(id)a3 locationShifter:(id)a4;
- (unint64_t)summaryRecordCount;
- (void)loadLocationsOfInterestWithHandler:(id)a3;
- (void)processLocationsOfInterest:(id)a3 handler:(id)a4;
- (void)reset;
- (void)setRecentRecords:(id)a3;
- (void)setSummaryInterval:(id)a3;
- (void)setSummaryRecordCount:(unint64_t)a3;
- (void)shiftLocationOfInterestCoordinates:(id)a3 handler:(id)a4;
@end

@implementation RTLocationOfInterestDataSource

- (RTLocationOfInterestDataSource)init
{
  uint64_t v2 = objc_opt_class();
  sub_14D60(v2, "initWithRoutineManager:locationShifter:");
}

- (RTLocationOfInterestDataSource)initWithRoutineManager:(id)a3 locationShifter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v15 = sub_139DC(&qword_21E80);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v17 = 0;
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: routineManager";
LABEL_15:
    _os_log_error_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    v15 = sub_139DC(&qword_21E80);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: locationShifter";
    goto LABEL_15;
  }
  v22.receiver = self;
  v22.super_class = (Class)RTLocationOfInterestDataSource;
  v10 = [(RTLocationOfInterestDataSource *)&v22 init];
  v11 = v10;
  if (v10)
  {
    v12 = v10;
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = (const char *)[(RTLocationOfInterestDataSource *)v12 UTF8String];
    }
    else
    {
      id v18 = +[NSString stringWithFormat:@"%@-%p", objc_opt_class(), v12];
      v14 = (const char *)[v18 UTF8String];
    }
    dispatch_queue_t v19 = dispatch_queue_create(v14, v13);

    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v12->_routineManager, a3);
    objc_storeStrong((id *)&v12->_locationShifter, a4);
  }
  self = v11;
  v17 = self;
LABEL_13:

  return v17;
}

- (unint64_t)summaryRecordCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_11B60;
  v5[3] = &unk_1D960;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSDateInterval)summaryInterval
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_11C64;
  v10 = sub_11C74;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_11C7C;
  v5[3] = &unk_1D960;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDateInterval *)v3;
}

- (NSArray)recentRecords
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_11C64;
  v10 = sub_11C74;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_11DB8;
  v5[3] = &unk_1D960;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)loadLocationsOfInterestWithHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_11F00;
    v8[3] = &unk_1DA28;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(queue, v8);
  }
  else
  {
    id v7 = sub_139DC(&qword_21E80);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

- (void)processLocationsOfInterest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (v7)
  {
    if ([v6 count])
    {
      v50 = self;
      v48 = v7;
      v59 = objc_opt_new();
      v57 = objc_opt_new();
      v60 = +[NSDate dateWithTimeIntervalSinceNow:-4838400.0];
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id v49 = v6;
      id obj = v6;
      id v53 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
      if (v53)
      {
        uint64_t v52 = *(void *)v71;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v71 != v52) {
              objc_enumerationMutation(obj);
            }
            uint64_t v55 = v8;
            id v9 = *(void **)(*((void *)&v70 + 1) + 8 * v8);
            long long v66 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            v10 = objc_msgSend(v9, "visits", v48);
            id v11 = [v10 countByEnumeratingWithState:&v66 objects:v76 count:16];
            if (v11)
            {
              id v12 = v11;
              uint64_t v13 = *(void *)v67;
              do
              {
                for (i = 0; i != v12; i = (char *)i + 1)
                {
                  if (*(void *)v67 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  v15 = *(void **)(*((void *)&v66 + 1) + 8 * i);
                  v16 = [v15 entryDate];
                  v17 = [v16 earlierDate:v60];
                  id v18 = [v15 entryDate];
                  unsigned __int8 v19 = [v17 isEqualToDate:v18];

                  if ((v19 & 1) == 0)
                  {
                    [v59 addObject:v15];
                    v20 = [v15 identifier];
                    [v57 setObject:v9 forKeyedSubscript:v20];
                  }
                }
                id v12 = [v10 countByEnumeratingWithState:&v66 objects:v76 count:16];
              }
              while (v12);
            }

            uint64_t v8 = v55 + 1;
          }
          while ((id)(v55 + 1) != v53);
          id v53 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
        }
        while (v53);
      }

      v21 = +[NSSortDescriptor sortDescriptorWithKey:@"entryDate" ascending:1];
      v75 = v21;
      objc_super v22 = +[NSArray arrayWithObjects:&v75 count:1];
      [v59 sortUsingDescriptors:v22];

      v23 = objc_opt_new();
      v24 = +[NSDate date];
      v25 = +[NSCalendar currentCalendar];
      v26 = [v25 components:28 fromDate:v24];
      v27 = [v25 dateFromComponents:v26];
      v28 = +[NSDate dateWithTimeInterval:v27 sinceDate:-86400.0];
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_12A50;
      v61[3] = &unk_1DA50;
      v29 = v23;
      v62 = v29;
      id v30 = v28;
      id v63 = v30;
      id v31 = v27;
      id v64 = v31;
      id v32 = v57;
      id v65 = v32;
      [v59 enumerateObjectsWithOptions:2 usingBlock:v61];
      id v33 = [v59 count];
      v34 = v50;
      v50->_summaryRecordCount = (unint64_t)v33;
      if (v33)
      {
        id v35 = objc_alloc((Class)NSDateInterval);
        v36 = [v59 firstObject];
        [v36 entryDate];
        v56 = v26;
        id v58 = v32;
        v37 = v54 = v24;
        [v59 lastObject];
        v39 = id v38 = v30;
        [v39 exitDate];
        id v40 = v31;
        v42 = v41 = v25;
        v43 = (NSDateInterval *)[v35 initWithStartDate:v37 endDate:v42];
        summaryInterval = v50->_summaryInterval;
        v50->_summaryInterval = v43;

        v25 = v41;
        id v31 = v40;

        id v30 = v38;
        v24 = v54;
        v26 = v56;
        id v32 = v58;
        v34 = v50;
      }
      recentRecords = v34->_recentRecords;
      v34->_recentRecords = v29;
      v46 = v29;

      id v7 = v48;
      v48[2](v48, 0);

      id v6 = v49;
    }
    else
    {
      v7[2](v7, 0);
    }
  }
  else
  {
    v47 = sub_139DC(&qword_21E80);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_0, v47, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

- (void)shiftLocationOfInterestCoordinates:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([v6 count])
    {
      v76 = self;
      long long v71 = v7;
      v75 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v6 count]);
      v78 = objc_opt_new();
      uint64_t v8 = objc_opt_new();
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      id v72 = v6;
      id v9 = v6;
      id v10 = [v9 countByEnumeratingWithState:&v91 objects:v97 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v92;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v92 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v91 + 1) + 8 * i);
            v15 = [v14 location];
            [v15 latitude];
            double v17 = v16;
            id v18 = [v14 location];
            [v18 longitude];
            double v20 = v19;

            if (+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:", v17, v20))v21 = v8; {
            else
            }
              v21 = v78;
            [v21 addObject:v14];
          }
          id v11 = [v9 countByEnumeratingWithState:&v91 objects:v97 count:16];
        }
        while (v11);
      }

      objc_super v22 = dispatch_group_create();
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id obj = v8;
      v23 = v75;
      id v79 = [obj countByEnumeratingWithState:&v87 objects:v96 count:16];
      if (v79)
      {
        uint64_t v24 = *(void *)v88;
        uint64_t v73 = *(void *)v88;
        v74 = v22;
        do
        {
          for (j = 0; j != v79; j = (char *)j + 1)
          {
            if (*(void *)v88 != v24) {
              objc_enumerationMutation(obj);
            }
            v26 = *(void **)(*((void *)&v87 + 1) + 8 * (void)j);
            uint64_t v27 = [v26 mapItem];
            if (!v27) {
              goto LABEL_23;
            }
            v28 = (void *)v27;
            v29 = [v26 mapItem];
            id v30 = [v29 location];
            unsigned int v31 = [v30 referenceFrame];

            if (v31 == 2)
            {
              id v32 = objc_alloc((Class)RTLocation);
              id v33 = [v26 mapItem];
              v34 = [v33 location];
              [v34 latitude];
              double v36 = v35;
              v37 = [v26 mapItem];
              id v38 = [v37 location];
              [v38 longitude];
              double v40 = v39;
              v41 = [v26 location];
              [v41 horizontalUncertainty];
              double v43 = v42;
              v44 = [v26 mapItem];
              v45 = [v44 location];
              id v46 = objc_msgSend(v32, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", 0, objc_msgSend(v45, "referenceFrame"), v36, v40, v43);

              id v47 = objc_alloc((Class)RTLocationOfInterest);
              [v26 confidence];
              double v49 = v48;
              v50 = [v26 identifier];
              id v51 = [v26 type];
              id v52 = [v26 typeSource];
              id v53 = [v26 visits];
              v54 = [v26 customLabel];
              uint64_t v55 = [v26 mapItem];
              id v56 = [v47 initWithLocation:v46 confidence:v50 identifier:v51 type:v52 typeSource:v53 visits:v54 customLabel:v49 mapItem:v55];

              v23 = v75;
              if (v56) {
                [v75 addObject:v56];
              }

              self = v76;
              uint64_t v24 = v73;
              objc_super v22 = v74;
            }
            else
            {
LABEL_23:
              dispatch_group_enter(v22);
              v57 = [v26 location];
              [v57 latitude];
              CLLocationDegrees v59 = v58;
              v60 = [v26 location];
              [v60 longitude];
              CLLocationCoordinate2D v62 = CLLocationCoordinate2DMake(v59, v61);

              locationShifter = self->_locationShifter;
              id v64 = [v26 location];
              [v64 horizontalUncertainty];
              double v66 = v65;
              v84[0] = _NSConcreteStackBlock;
              v84[1] = 3221225472;
              v84[2] = sub_134A0;
              v84[3] = &unk_1DAA0;
              v84[4] = self;
              v84[5] = v26;
              id v85 = v23;
              v86 = v22;
              -[RTLocationShifter shiftCoordinate:accuracy:handler:](locationShifter, "shiftCoordinate:accuracy:handler:", v84, v62.latitude, v62.longitude, v66);
            }
          }
          id v79 = [obj countByEnumeratingWithState:&v87 objects:v96 count:16];
        }
        while (v79);
      }

      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_136E8;
      block[3] = &unk_1D9D8;
      id v81 = v23;
      id v82 = v78;
      id v7 = v71;
      id v83 = v71;
      id v68 = v78;
      id v69 = v23;
      dispatch_group_notify(v22, queue, block);

      id v6 = v72;
    }
    else
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
  else
  {
    long long v70 = sub_139DC(&qword_21E80);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_0, v70, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

- (void)reset
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_13864;
  block[3] = &unk_1DAC8;
  void block[4] = self;
  dispatch_async(queue, block);
}

+ (id)configureDateRangeString:(id)a3 dateStyle:(unint64_t)a4 timeStyle:(unint64_t)a5
{
  if (a3)
  {
    id v7 = a3;
    id v8 = objc_alloc_init((Class)NSDateIntervalFormatter);
    [v8 setDateStyle:a4];
    [v8 setTimeStyle:a5];
    id v9 = [v8 stringFromDateInterval:v7];
  }
  else
  {
    id v9 = &stru_1DDC8;
  }

  return v9;
}

- (void)setSummaryRecordCount:(unint64_t)a3
{
  self->_summaryRecordCount = a3;
}

- (void)setSummaryInterval:(id)a3
{
}

- (void)setRecentRecords:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentRecords, 0);
  objc_storeStrong((id *)&self->_summaryInterval, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);

  objc_storeStrong((id *)&self->_routineManager, 0);
}

@end