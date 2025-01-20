@interface NSObject
- (id)HSProxy_conformsToProtocol:(id)a3;
- (id)HSProxy_isKindOfClass:(id)a3;
- (id)HSProxy_respondsToSelector:(id)a3;
@end

@implementation NSObject

- (id)HSProxy_isKindOfClass:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v7 = location[0] != 0;
  if (location[0])
  {
    NSClassFromString((NSString *)location[0]);
    v9 = +[NSNumber numberWithBool:objc_opt_isKindOfClass() & 1];
  }
  else
  {
    v6 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSRemoteObject.mm", v11);
    os_log_t oslog = &_os_log_default;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v10, (uint64_t)"-[NSObject(HSProxyPrivate) HSProxy_isKindOfClass:]", (uint64_t)v6, 688, (uint64_t)"cls");
      _os_log_error_impl(&def_411C8, oslog, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v10, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    v9 = 0;
  }
  objc_storeStrong(location, 0);
  v3 = v9;

  return v3;
}

- (id)HSProxy_respondsToSelector:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v7 = location[0] != 0;
  if (location[0])
  {
    NSSelectorFromString((NSString *)location[0]);
    v9 = +[NSNumber numberWithBool:objc_opt_respondsToSelector() & 1];
  }
  else
  {
    v6 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSRemoteObject.mm", v11);
    os_log_t oslog = &_os_log_default;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v10, (uint64_t)"-[NSObject(HSProxyPrivate) HSProxy_respondsToSelector:]", (uint64_t)v6, 693, (uint64_t)"sel");
      _os_log_error_impl(&def_411C8, oslog, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v10, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    v9 = 0;
  }
  objc_storeStrong(location, 0);
  v3 = v9;

  return v3;
}

- (id)HSProxy_conformsToProtocol:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v9 = location[0] != 0;
  if (location[0])
  {
    v6 = v11;
    v5 = NSProtocolFromString((NSString *)location[0]);
    v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[NSObject conformsToProtocol:](v6, "conformsToProtocol:") & 1);
  }
  else
  {
    v8 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSRemoteObject.mm", v14);
    os_log_t oslog = &_os_log_default;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v13, (uint64_t)"-[NSObject(HSProxyPrivate) HSProxy_conformsToProtocol:]", (uint64_t)v8, 698, (uint64_t)"proto");
      _os_log_error_impl(&def_411C8, oslog, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v13, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    v12 = 0;
  }
  objc_storeStrong(location, 0);
  v3 = v12;

  return v3;
}

@end