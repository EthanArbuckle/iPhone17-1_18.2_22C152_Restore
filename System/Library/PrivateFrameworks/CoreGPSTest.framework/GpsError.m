@interface GpsError
+ (BOOL)setError:(id *)a3 withCode:(int)a4;
+ (BOOL)setError:(id *)a3 withCode:(int)a4 format:(id)a5;
+ (BOOL)setErrorTestUnavailable:(id *)a3;
@end

@implementation GpsError

+ (BOOL)setError:(id *)a3 withCode:(int)a4
{
  return [a1 setError:a3 withCode:*(void *)&a4 format:0];
}

+ (BOOL)setError:(id *)a3 withCode:(int)a4 format:(id)a5
{
  id v5 = a5;
  v16[3] = *MEMORY[0x263EF8340];
  if (a5)
  {
    v16[0] = &v17;
    id v5 = (id)[[NSString alloc] initWithFormat:a5 arguments:&v17];
    v8 = (void *)[MEMORY[0x263EFF9A0] dictionary];
    uint64_t v9 = (uint64_t)v8;
    if (v5) {
      [v8 setObject:v5 forKeyedSubscript:*MEMORY[0x263F08320]];
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
  }
  v10 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"GpsFactoryTest", a4, v9, v16[0]);

  if (a3)
  {
    id v11 = *a3;
    *a3 = v10;
    if (!v11)
    {
      LOBYTE(v12) = 1;
      return v12;
    }
    BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      LODWORD(v16[0]) = 138412290;
      *(void *)((char *)v16 + 4) = v10;
      v13 = &_os_log_internal;
      v14 = "NSError variable was previously assigned.  New unsaved error: %@";
LABEL_11:
      _os_log_error_impl(&dword_237AFF000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)v16, 0xCu);
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      LODWORD(v16[0]) = 138412290;
      *(void *)((char *)v16 + 4) = v10;
      v13 = &_os_log_internal;
      v14 = "NSError variable was nil.  New unsaved error: %@";
      goto LABEL_11;
    }
  }
  return v12;
}

+ (BOOL)setErrorTestUnavailable:(id *)a3
{
  return [a1 setError:a3 withCode:7 format:@"Requested test not available on this platform"];
}

@end