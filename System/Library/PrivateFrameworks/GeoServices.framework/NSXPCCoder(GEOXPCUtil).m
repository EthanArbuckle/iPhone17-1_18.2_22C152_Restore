@interface NSXPCCoder(GEOXPCUtil)
- (dispatch_data_t)geo_decodeXPCDataForKey:()GEOXPCUtil;
- (double)geo_decodeXPCDoubleForKey:()GEOXPCUtil success:;
- (id)geo_decodeXPCStringForKey:()GEOXPCUtil;
- (int64_t)geo_decodeXPCInt64ForKey:()GEOXPCUtil success:;
- (uint64_t)geo_decodeXPCDoubleForKey:()GEOXPCUtil defaultValue:;
- (uint64_t)geo_decodeXPCInt64ForKey:()GEOXPCUtil defaultValue:;
- (void)geo_encodeXPCData:()GEOXPCUtil forKey:;
- (void)geo_encodeXPCDouble:()GEOXPCUtil forKey:;
- (void)geo_encodeXPCInt64:()GEOXPCUtil forKey:;
- (void)geo_encodeXPCString:()GEOXPCUtil forKey:;
@end

@implementation NSXPCCoder(GEOXPCUtil)

- (dispatch_data_t)geo_decodeXPCDataForKey:()GEOXPCUtil
{
  uint64_t v1 = objc_msgSend(a1, "decodeXPCObjectForKey:");
  v2 = (void *)v1;
  if (v1 && MEMORY[0x18C1213B0](v1) == MEMORY[0x1E4F14580])
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v2);
    size_t length = xpc_data_get_length(v2);
    global_queue = geo_get_global_queue();
    destructor[0] = MEMORY[0x1E4F143A8];
    destructor[1] = 3221225472;
    destructor[2] = __50__NSXPCCoder_GEOXPCUtil__geo_decodeXPCDataForKey___block_invoke;
    destructor[3] = &unk_1E53D79D8;
    id v9 = v2;
    dispatch_data_t v3 = dispatch_data_create(bytes_ptr, length, global_queue, destructor);
  }
  else
  {
    dispatch_data_t v3 = 0;
  }

  return v3;
}

- (void)geo_encodeXPCData:()GEOXPCUtil forKey:
{
  if (a3)
  {
    id v6 = a4;
    v7 = [a3 _GEOCreateDispatchData];
    id v8 = xpc_data_create_with_dispatch_data(v7);

    [a1 encodeXPCObject:v8 forKey:v6];
  }
}

- (void)geo_encodeXPCDouble:()GEOXPCUtil forKey:
{
  id v6 = a4;
  id v7 = xpc_double_create(a2);
  [a1 encodeXPCObject:v7 forKey:v6];
}

- (void)geo_encodeXPCInt64:()GEOXPCUtil forKey:
{
  id v6 = a4;
  id v7 = xpc_int64_create(a3);
  [a1 encodeXPCObject:v7 forKey:v6];
}

- (void)geo_encodeXPCString:()GEOXPCUtil forKey:
{
  if (a3)
  {
    id v6 = a3;
    id v7 = a4;
    id v8 = xpc_string_create((const char *)[v6 UTF8String]);
    [a1 encodeXPCObject:v8 forKey:v7];
  }
}

- (uint64_t)geo_decodeXPCInt64ForKey:()GEOXPCUtil defaultValue:
{
  char v6 = 1;
  uint64_t result = objc_msgSend(a1, "geo_decodeXPCInt64ForKey:success:", a3, &v6);
  if (!v6) {
    return a4;
  }
  return result;
}

- (int64_t)geo_decodeXPCInt64ForKey:()GEOXPCUtil success:
{
  uint64_t v5 = objc_msgSend(a1, "decodeXPCObjectForKey:");
  char v6 = (void *)v5;
  if (v5 && MEMORY[0x18C1213B0](v5) == MEMORY[0x1E4F145C0])
  {
    int64_t value = xpc_int64_get_value(v6);
  }
  else
  {
    int64_t value = 0;
    *a4 = 0;
  }

  return value;
}

- (uint64_t)geo_decodeXPCDoubleForKey:()GEOXPCUtil defaultValue:
{
  char v4 = 1;
  return objc_msgSend(a1, "geo_decodeXPCDoubleForKey:success:", a3, &v4);
}

- (double)geo_decodeXPCDoubleForKey:()GEOXPCUtil success:
{
  uint64_t v5 = objc_msgSend(a1, "decodeXPCObjectForKey:");
  char v6 = (void *)v5;
  if (v5 && MEMORY[0x18C1213B0](v5) == MEMORY[0x1E4F14598])
  {
    double value = xpc_double_get_value(v6);
  }
  else
  {
    *a4 = 0;
    double value = 0.0;
  }

  return value;
}

- (id)geo_decodeXPCStringForKey:()GEOXPCUtil
{
  uint64_t v1 = objc_msgSend(a1, "decodeXPCObjectForKey:");
  v2 = (void *)v1;
  if (!v1) {
    goto LABEL_3;
  }
  if (MEMORY[0x18C1213B0](v1) != MEMORY[0x1E4F145F0]) {
    goto LABEL_3;
  }
  string_ptr = xpc_string_get_string_ptr(v2);
  size_t length = xpc_string_get_length(v2);
  global_queue = geo_get_global_queue();
  destructor[0] = MEMORY[0x1E4F143A8];
  destructor[1] = 3221225472;
  destructor[2] = __52__NSXPCCoder_GEOXPCUtil__geo_decodeXPCStringForKey___block_invoke;
  destructor[3] = &unk_1E53D79D8;
  id v10 = v2;
  dispatch_data_t v8 = dispatch_data_create(string_ptr, length, global_queue, destructor);

  if (v8)
  {
    dispatch_data_t v3 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
  }
  else
  {
LABEL_3:
    dispatch_data_t v3 = 0;
  }

  return v3;
}

@end