@interface ADSiriUserNotificationRequestCapabilityManager
+ (Class)_classForPlatform:(int64_t)a3;
@end

@implementation ADSiriUserNotificationRequestCapabilityManager

+ (Class)_classForPlatform:(int64_t)a3
{
  uint64_t IsValid = AFSiriAnnouncementPlatformGetIsValid();
  if ((IsValid & 1) == 0)
  {
    v5 = AFSiriLogContextConnection;
    if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      uint64_t IsValid = objc_opt_class();
      goto LABEL_8;
    }
LABEL_12:
    int v7 = 136315394;
    v8 = "+[ADSiriUserNotificationRequestCapabilityManager _classForPlatform:]";
    __int16 v9 = 2048;
    int64_t v10 = a3;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s platform %li is not valid, using headphones provider.", (uint8_t *)&v7, 0x16u);
    goto LABEL_7;
  }
  if ((unint64_t)a3 <= 5)
  {
    if (((1 << a3) & 0x1A) != 0) {
      goto LABEL_7;
    }
    v5 = AFSiriLogContextConnection;
    if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    goto LABEL_12;
  }
LABEL_8:
  return (Class)(id)IsValid;
}

@end