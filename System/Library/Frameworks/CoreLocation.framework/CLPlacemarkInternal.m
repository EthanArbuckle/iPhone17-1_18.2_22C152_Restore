@interface CLPlacemarkInternal
- (CLPlacemarkInternal)init;
@end

@implementation CLPlacemarkInternal

- (CLPlacemarkInternal)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!objc_opt_class())
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005D80);
    }
    v4 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v9 = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 2082;
      v13 = "assert";
      __int16 v14 = 2081;
      v15 = "[GEOLocation class]";
      _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Do not use CLPlaceMark when GeoServices is missing\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005D80);
      }
    }
    v5 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)buf = 68289539;
      int v9 = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 2082;
      v13 = "assert";
      __int16 v14 = 2081;
      v15 = "[GEOLocation class]";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Do not use CLPlaceMark when GeoServices is missing", "{\"msg%{public}.0s\":\"Do not use CLPlaceMark when GeoServices is missing\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005D80);
      }
    }
    v6 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v9 = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 2082;
      v13 = "assert";
      __int16 v14 = 2081;
      v15 = "[GEOLocation class]";
      _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Do not use CLPlaceMark when GeoServices is missing\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  v7.receiver = self;
  v7.super_class = (Class)CLPlacemarkInternal;
  return [(CLPlacemarkInternal *)&v7 init];
}

@end