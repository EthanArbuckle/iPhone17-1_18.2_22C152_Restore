@interface CLIntersiloInterface
+ (id)sharedInterface;
- (BOOL)hasInfoForSelector:(SEL)a3;
- (id)getInfoForSelector:(SEL)a3;
- (void)extendSelectorInfoWithProtocol:(id)a3 bases:(id)a4;
@end

@implementation CLIntersiloInterface

- (id)getInfoForSelector:(SEL)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1A45528B0;
  v10 = sub_1A45528C0;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A4546DC0;
  v5[3] = &unk_1E5B3E880;
  v5[4] = &v6;
  v5[5] = a3;
  sub_1A4546CC8(v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (id)sharedInterface
{
  if (qword_1EB30CF50 != -1) {
    dispatch_once(&qword_1EB30CF50, &unk_1EF7F4E80);
  }
  v2 = (void *)qword_1EB30CF48;
  return v2;
}

- (void)extendSelectorInfoWithProtocol:(id)a3 bases:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v5 = a4;
  if ((sub_1A45522E8(v9, v5) & 1) == 0)
  {
    uint64_t v6 = sub_1A4551420();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68290051;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = &unk_1A45670B7;
      __int16 v14 = 2114;
      id v15 = v9;
      __int16 v16 = 2114;
      id v17 = v5;
      __int16 v18 = 2082;
      v19 = "assert";
      __int16 v20 = 2081;
      v21 = "__objc_no";
      _os_log_impl(&dword_1A4540000, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Selector extension failed!\", \"proto\":%{public, location:escape_only}@, \"bases\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
    }

    v7 = sub_1A4551420();
    if (os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 68290051;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = &unk_1A45670B7;
      __int16 v14 = 2114;
      id v15 = v9;
      __int16 v16 = 2114;
      id v17 = v5;
      __int16 v18 = 2082;
      v19 = "assert";
      __int16 v20 = 2081;
      v21 = "__objc_no";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Selector extension failed!", "{\"msg%{public}.0s\":\"Selector extension failed!\", \"proto\":%{public, location:escape_only}@, \"bases\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
    }

    uint64_t v8 = sub_1A4551420();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68290051;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = &unk_1A45670B7;
      __int16 v14 = 2114;
      id v15 = v9;
      __int16 v16 = 2114;
      id v17 = v5;
      __int16 v18 = 2082;
      v19 = "assert";
      __int16 v20 = 2081;
      v21 = "__objc_no";
      _os_log_impl(&dword_1A4540000, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Selector extension failed!\", \"proto\":%{public, location:escape_only}@, \"bases\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
    }

    abort_report_np();
    __break(1u);
  }
}

- (BOOL)hasInfoForSelector:(SEL)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1A45528B0;
  v10 = sub_1A45528C0;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A45529C0;
  v5[3] = &unk_1E5B3E880;
  v5[4] = &v6;
  v5[5] = a3;
  sub_1A4546CC8(v5);
  BOOL v3 = v7[5] != 0;
  _Block_object_dispose(&v6, 8);

  return v3;
}

@end