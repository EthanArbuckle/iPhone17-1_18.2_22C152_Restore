@interface NSData(GEOXPCUtil)
+ (dispatch_data_t)_geo_withXPCData:()GEOXPCUtil;
- (xpc_object_t)_geo_newXPCData;
@end

@implementation NSData(GEOXPCUtil)

- (xpc_object_t)_geo_newXPCData
{
  v1 = [a1 _GEOCreateDispatchData];
  xpc_object_t v2 = xpc_data_create_with_dispatch_data(v1);

  return v2;
}

+ (dispatch_data_t)_geo_withXPCData:()GEOXPCUtil
{
  id v3 = a3;
  v4 = v3;
  if (v3 && MEMORY[0x18C1213B0](v3) == MEMORY[0x1E4F14580])
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v4);
    size_t length = xpc_data_get_length(v4);
    global_queue = geo_get_global_queue();
    destructor[0] = MEMORY[0x1E4F143A8];
    destructor[1] = 3221225472;
    destructor[2] = __39__NSData_GEOXPCUtil___geo_withXPCData___block_invoke;
    destructor[3] = &unk_1E53D79D8;
    id v11 = v4;
    dispatch_data_t v8 = dispatch_data_create(bytes_ptr, length, global_queue, destructor);
  }
  else
  {
    dispatch_data_t v8 = 0;
  }

  return v8;
}

@end