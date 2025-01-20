@interface ENExposureDetectionHistoryCheck
- (id)enui_jsonSerializationWithDateFormatter:(id)a3;
@end

@implementation ENExposureDetectionHistoryCheck

- (id)enui_jsonSerializationWithDateFormatter:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSMutableDictionary);
  v29[0] = @"Timestamp";
  v6 = [(ENExposureDetectionHistoryCheck *)self session];
  v7 = [v6 date];
  v8 = [v4 stringFromDate:v7];
  v29[1] = @"Files";
  v30[0] = v8;
  v9 = [(ENExposureDetectionHistoryCheck *)self files];
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  v26 = sub_134DC;
  v27 = &unk_2D058;
  id v10 = v4;
  id v28 = v10;
  v11 = objc_msgSend(v9, "enui_map:", &v24);
  v30[1] = v11;
  v12 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2, v24, v25, v26, v27);
  id v13 = [v5 initWithDictionary:v12];

  v14 = [(ENExposureDetectionHistoryCheck *)self session];
  v15 = [v14 appBundleIdentifier];

  if (v15)
  {
    v16 = [(ENExposureDetectionHistoryCheck *)self session];
    v17 = [v16 appBundleIdentifier];
    [v13 setObject:v17 forKey:@"AppBundleIdentifier"];
  }
  v18 = [(ENExposureDetectionHistoryCheck *)self session];
  v19 = [v18 region];

  if (v19)
  {
    v20 = [(ENExposureDetectionHistoryCheck *)self session];
    v21 = [v20 region];
    v22 = [v21 regionCode];
    [v13 setObject:v22 forKey:@"RegionCode"];
  }

  return v13;
}

@end