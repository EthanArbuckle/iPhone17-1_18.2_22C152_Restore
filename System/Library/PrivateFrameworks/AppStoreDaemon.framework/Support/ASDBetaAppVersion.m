@interface ASDBetaAppVersion
+ (int64_t)platformForRecord:(id)a3;
@end

@implementation ASDBetaAppVersion

+ (int64_t)platformForRecord:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 platform] - 1;
  if (v4 < 6 && ((0x27u >> v4) & 1) != 0)
  {
    id v6 = (id)qword_1004A0F78[v4];
  }
  else
  {
    v5 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = [v3 platform];
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error, unhandled platform: %d, falling back to default", (uint8_t *)v8, 8u);
    }

    id v6 = +[ASDBetaAppVersion defaultPlatform];
  }

  return (int64_t)v6;
}

@end