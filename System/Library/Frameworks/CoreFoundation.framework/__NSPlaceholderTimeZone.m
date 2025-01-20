@interface __NSPlaceholderTimeZone
- (BOOL)isDaylightSavingTimeForDate:(id)a3;
- (__NSPlaceholderTimeZone)init;
- (__NSPlaceholderTimeZone)initWithName:(id)a3;
- (__NSPlaceholderTimeZone)initWithName:(id)a3 data:(id)a4;
- (double)daylightSavingTimeOffsetForDate:(id)a3;
- (id)abbreviationForDate:(id)a3;
- (id)data;
- (id)name;
- (id)nextDaylightSavingTimeTransitionAfterDate:(id)a3;
- (int64_t)secondsFromGMTForDate:(id)a3;
- (unint64_t)retainCount;
@end

@implementation __NSPlaceholderTimeZone

- (__NSPlaceholderTimeZone)initWithName:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = (void *)+[NSTimeZone _timeZoneWithName:](NSTimeZone, "_timeZoneWithName:");

  return (__NSPlaceholderTimeZone *)v3;
}

- (__NSPlaceholderTimeZone)initWithName:(id)a3 data:(id)a4
{
  if (!a3) {
    return 0;
  }
  v4 = (void *)+[NSTimeZone _timeZoneWithName:a3 data:a4];

  return (__NSPlaceholderTimeZone *)v4;
}

- (__NSPlaceholderTimeZone)init
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1;
}

- (id)name
{
  v4 = __CFLookUpClass("NSTimeZone");
  uint64_t v5 = __CFFullMethodName(v4, (objc_class *)self, a2);
  CFStringRef v6 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized time zone object", v5);
  v7 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v6) userInfo:0];
  objc_exception_throw(v7);
}

- (id)data
{
  v4 = __CFLookUpClass("NSTimeZone");
  uint64_t v5 = __CFFullMethodName(v4, (objc_class *)self, a2);
  CFStringRef v6 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized time zone object", v5);
  v7 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v6) userInfo:0];
  objc_exception_throw(v7);
}

- (int64_t)secondsFromGMTForDate:(id)a3
{
  uint64_t v5 = __CFLookUpClass("NSTimeZone");
  uint64_t v6 = __CFFullMethodName(v5, (objc_class *)self, a2);
  CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized time zone object", v6);
  v8 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v7) userInfo:0];
  objc_exception_throw(v8);
}

- (id)abbreviationForDate:(id)a3
{
  uint64_t v5 = __CFLookUpClass("NSTimeZone");
  uint64_t v6 = __CFFullMethodName(v5, (objc_class *)self, a2);
  CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized time zone object", v6);
  v8 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v7) userInfo:0];
  objc_exception_throw(v8);
}

- (BOOL)isDaylightSavingTimeForDate:(id)a3
{
  uint64_t v5 = __CFLookUpClass("NSTimeZone");
  uint64_t v6 = __CFFullMethodName(v5, (objc_class *)self, a2);
  CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized time zone object", v6);
  v8 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v7) userInfo:0];
  objc_exception_throw(v8);
}

- (double)daylightSavingTimeOffsetForDate:(id)a3
{
  uint64_t v5 = __CFLookUpClass("NSTimeZone");
  uint64_t v6 = __CFFullMethodName(v5, (objc_class *)self, a2);
  CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized time zone object", v6);
  v8 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v7) userInfo:0];
  objc_exception_throw(v8);
}

- (id)nextDaylightSavingTimeTransitionAfterDate:(id)a3
{
  uint64_t v5 = __CFLookUpClass("NSTimeZone");
  uint64_t v6 = __CFFullMethodName(v5, (objc_class *)self, a2);
  CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized time zone object", v6);
  v8 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v7) userInfo:0];
  objc_exception_throw(v8);
}

@end