@interface NSDictionary
+ (NSDictionary)dictionaryWithJSONData:(id)a3 error:(id *)a4;
- (id)generateJSONDataWithError:(id *)a3;
- (id)generateJSONStringWithError:(id *)a3;
@end

@implementation NSDictionary

+ (NSDictionary)dictionaryWithJSONData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = DebugHierarchyJSONProcessingOSLog();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, a1);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v18 = 134217984;
    id v19 = [v6 length];
    _os_signpost_emit_with_name_impl(&dword_0, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "JSON Data -> Dict", "Begin with size: %{xcode:size-in-bytes}lu", (uint8_t *)&v18, 0xCu);
  }

  v11 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:a4];
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      id v12 = +[NSError errorWithDomain:@"Error: Unarchived JSON object is not an NSDictionary." code:-1 userInfo:0];
    }
  }
  v13 = DebugHierarchyJSONProcessingOSLog();
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, a1);
  v15 = v13;
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v16, OS_SIGNPOST_INTERVAL_END, v14, "JSON Data -> Dict", "Completed", (uint8_t *)&v18, 2u);
  }

  return (NSDictionary *)v11;
}

- (id)generateJSONDataWithError:(id *)a3
{
  v5 = DebugHierarchyJSONProcessingOSLog();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
  v7 = v5;
  os_signpost_id_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Dict -> JSON Data", "Begin", (uint8_t *)&v16, 2u);
  }

  v9 = +[NSJSONSerialization dataWithJSONObject:self options:0 error:a3];
  v10 = DebugHierarchyJSONProcessingOSLog();
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);
  id v12 = v10;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    id v14 = [v9 length];
    int v16 = 134217984;
    id v17 = v14;
    _os_signpost_emit_with_name_impl(&dword_0, v13, OS_SIGNPOST_INTERVAL_END, v11, "Dict -> JSON Data", "Completed with size: %{xcode:size-in-bytes}lu", (uint8_t *)&v16, 0xCu);
  }

  return v9;
}

- (id)generateJSONStringWithError:(id *)a3
{
  v5 = DebugHierarchyJSONProcessingOSLog();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
  v7 = v5;
  os_signpost_id_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Dict -> JSON String", "Begin", buf, 2u);
  }

  v9 = [(NSDictionary *)self generateJSONDataWithError:a3];
  id v10 = [objc_alloc((Class)NSString) initWithData:v9 encoding:4];
  os_signpost_id_t v11 = DebugHierarchyJSONProcessingOSLog();
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, self);
  v13 = v11;
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)int v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v14, OS_SIGNPOST_INTERVAL_END, v12, "Dict -> JSON String", "Completed", v16, 2u);
  }

  return v10;
}

@end