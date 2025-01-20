@interface GEOLocation
- (id)initWithRTLocation:(id)a3 includeTimeStamp:(BOOL)a4;
@end

@implementation GEOLocation

- (id)initWithRTLocation:(id)a3 includeTimeStamp:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v7 = objc_alloc((Class)GEOLocation);
    [v6 latitude];
    double v9 = v8;
    [v6 longitude];
    id v11 = [v7 initWithLatitude:v9 longitude:v10];
    [v6 horizontalUncertainty];
    objc_msgSend(v11, "setHorizontalAccuracy:");
    if (v4)
    {
      v12 = [v6 date];
      [v12 timeIntervalSinceReferenceDate];
      objc_msgSend(v11, "setTimestamp:");
    }
    else
    {
      [v11 setTimestamp:0.0];
    }
    unsigned int v14 = [v6 referenceFrame];
    if (v14 > 2) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = dword_100019358[v14];
    }
    [v11 setReferenceFrame:v15];
  }
  else
  {
    v13 = sub_1000071D0(&qword_10002D358);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315394;
      v18 = "-[GEOLocation(XPCMapItemService) initWithRTLocation:includeTimeStamp:]";
      __int16 v19 = 1024;
      int v20 = 85;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location (in %s:%d)", (uint8_t *)&v17, 0x12u);
    }

    id v11 = 0;
  }

  return v11;
}

@end