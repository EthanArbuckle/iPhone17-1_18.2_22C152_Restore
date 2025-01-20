@interface __NSDate
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (__NSDate)initWithTimeIntervalSinceReferenceDate:(double)a3;
- (double)timeIntervalSinceReferenceDate;
- (void)dealloc;
@end

@implementation __NSDate

- (double)timeIntervalSinceReferenceDate
{
  return self->_time;
}

- (void)dealloc
{
  uint64_t v3 = *(void *)off_1ECE0A5B0;
  v2.receiver = self;
  v2.super_class = (Class)__NSDate;
  [(__NSDate *)&v2 dealloc];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return &___immutablePlaceholderDate;
}

- (__NSDate)initWithTimeIntervalSinceReferenceDate:(double)a3
{
  v4 = [NSDate alloc];

  return (__NSDate *)[(NSDate *)v4 initWithTimeIntervalSinceReferenceDate:a3];
}

@end