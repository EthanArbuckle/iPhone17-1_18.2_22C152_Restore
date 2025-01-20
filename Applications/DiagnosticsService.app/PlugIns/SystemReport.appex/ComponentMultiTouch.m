@interface ComponentMultiTouch
- (BOOL)isPresent;
- (NSMutableDictionary)tmpProfile;
- (id)resetCount;
- (void)populateAttributes:(id)a3;
- (void)setTmpProfile:(id)a3;
@end

@implementation ComponentMultiTouch

- (id)resetCount
{
  v2 = +[NSNull null];
  if (MTDeviceCreateDefault())
  {
    CFMutableDictionaryRef properties = 0;
    io_registry_entry_t Service = MTDeviceGetService();
    if (IORegistryEntryCreateCFProperties(Service, &properties, kCFAllocatorDefault, 0))
    {
      v4 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error: IORegistryEntryCreateCFProperties failure for AppleMultitouchSPI.", buf, 2u);
      }
    }
    else
    {
      v4 = properties;
      v6 = [(__CFDictionary *)properties objectForKeyedSubscript:@"ResetCount"];

      if (v6)
      {
        v7 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v12 = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "MultiTouch found", v12, 2u);
        }

        uint64_t v8 = [v4 objectForKeyedSubscript:@"ResetCount"];

        v2 = (void *)v8;
      }
    }

    MTDeviceRelease();
  }
  else
  {
    v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error: Could not create default MTDevice.", v10, 2u);
    }
  }

  return v2;
}

- (BOOL)isPresent
{
  v2 = [(ComponentMultiTouch *)self resetCount];
  if (v2)
  {
    objc_opt_class();
    char v3 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v3 = 0;
  }

  return v3 & 1;
}

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(ComponentMultiTouch *)self resetCount];
  [v4 setObject:v5 forKeyedSubscript:@"multitouchResetCount"];
}

- (NSMutableDictionary)tmpProfile
{
  return self->_tmpProfile;
}

- (void)setTmpProfile:(id)a3
{
}

- (void).cxx_destruct
{
}

@end