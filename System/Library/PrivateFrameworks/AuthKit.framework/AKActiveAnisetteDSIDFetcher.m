@interface AKActiveAnisetteDSIDFetcher
+ (unint64_t)_activeAnisetteDSIDWithEnvironment:(unint64_t)a3;
+ (unint64_t)activeAnisettDSIDFromCurrentIDMSEnvironment;
+ (unint64_t)activeAnisettDSIDFromLastKnownIDMSEnvironment;
@end

@implementation AKActiveAnisetteDSIDFetcher

+ (unint64_t)activeAnisettDSIDFromLastKnownIDMSEnvironment
{
  v3 = +[AKURLBag bagForAltDSID:0];
  id v4 = [v3 lastKnownIDMSEnvironment];

  return (unint64_t)_[a1 _activeAnisetteDSIDWithEnvironment:v4];
}

+ (unint64_t)_activeAnisetteDSIDWithEnvironment:(unint64_t)a3
{
  if (!a3) {
    return -2;
  }
  id v4 = _AKTrafficLogSubsystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (a3 > 3)
  {
    if (v5) {
      sub_10018B6EC(v4);
    }
    unint64_t v6 = -5;
  }
  else
  {
    if (v5) {
      sub_10018B6A8(v4);
    }
    unint64_t v6 = -3;
  }

  return v6;
}

+ (unint64_t)activeAnisettDSIDFromCurrentIDMSEnvironment
{
  v3 = +[AKURLBag bagForAltDSID:0];
  id v4 = [v3 IDMSEnvironment];

  return (unint64_t)_[a1 _activeAnisetteDSIDWithEnvironment:v4];
}

@end