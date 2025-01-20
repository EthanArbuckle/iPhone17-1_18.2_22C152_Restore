@interface _Locationd
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)valid;
- (void)setValid:(BOOL)a3;
@end

@implementation _Locationd

+ (BOOL)isSupported
{
  return 0;
}

+ (id)getSilo
{
  return 0;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (!byte_1EB30CEC0) {
    _Exit(0);
  }
  unint64_t v7 = a4 + 1;
  if (v7 < [v5 count])
  {
    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
    }
    v8 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1A4540000, v8, OS_LOG_TYPE_FAULT, "_Locationd should come last?!", (uint8_t *)&v12, 2u);
    }
    v9 = [v6 objectAtIndexedSubscript:v7];
    [v9 becameFatallyBlocked:v6 index:v7];
  }
  if (qword_1EB30CE70 != -1) {
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
  }
  v10 = qword_1EB30CE68;
  if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
  {
    int v12 = 68289282;
    int v13 = 0;
    __int16 v14 = 2082;
    v15 = &unk_1A45670B7;
    __int16 v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_1A4540000, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"locationd became blocked, non-fatally because internal install\", \"ImplicatedServicesSoFar\":%{public, location:escape_only}@}", (uint8_t *)&v12, 0x1Cu);
    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
    }
  }
  v11 = qword_1EB30CE68;
  if (os_signpost_enabled((os_log_t)qword_1EB30CE68))
  {
    int v12 = 68289282;
    int v13 = 0;
    __int16 v14 = 2082;
    v15 = &unk_1A45670B7;
    __int16 v16 = 2114;
    v17 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A4540000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "locationd became blocked, non-fatally because internal install", "{\"msg%{public}.0s\":\"locationd became blocked, non-fatally because internal install\", \"ImplicatedServicesSoFar\":%{public, location:escape_only}@}", (uint8_t *)&v12, 0x1Cu);
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (qword_1EB30CE70 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    unint64_t v7 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v11 = 0;
      __int16 v12 = 2082;
      int v13 = &unk_1A45670B7;
      __int16 v14 = 2082;
      v15 = "assert";
      __int16 v16 = 2081;
      v17 = "__objc_no";
      _os_log_impl(&dword_1A4540000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Don't message _Locationd\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
      }
    }
    v8 = qword_1EB30CE68;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE68))
    {
      *(_DWORD *)buf = 68289539;
      int v11 = 0;
      __int16 v12 = 2082;
      int v13 = &unk_1A45670B7;
      __int16 v14 = 2082;
      v15 = "assert";
      __int16 v16 = 2081;
      v17 = "__objc_no";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Don't message _Locationd", "{\"msg%{public}.0s\":\"Don't message _Locationd\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
      }
    }
    v9 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v11 = 0;
      __int16 v12 = 2082;
      int v13 = &unk_1A45670B7;
      __int16 v14 = 2082;
      v15 = "assert";
      __int16 v16 = 2081;
      v17 = "__objc_no";
      _os_log_impl(&dword_1A4540000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Don't message _Locationd\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
    __break(1u);
LABEL_11:
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end