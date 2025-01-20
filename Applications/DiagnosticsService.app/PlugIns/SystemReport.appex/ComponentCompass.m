@interface ComponentCompass
- (BOOL)isPresent;
- (id)backglassCompassSerialNumber;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentCompass

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ComponentCompass;
  [(ComponentBase *)&v6 populateAttributes:v4];
  v5 = [(ComponentCompass *)self backglassCompassSerialNumber];
  if (v5) {
    [v4 setObject:v5 forKeyedSubscript:@"backglassCompassSerialNumber"];
  }
}

- (BOOL)isPresent
{
  return findDeviceWithName("compass");
}

- (id)backglassCompassSerialNumber
{
  v2 = (void *)ZhuGeCopyValue();
  if (!v2)
  {
    v3 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v6 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Error getting BackglassCompassSerialNumber: %@", buf, 0xCu);
    }
  }

  return v2;
}

@end