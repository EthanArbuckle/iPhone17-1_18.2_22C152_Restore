@interface NSConstantDate
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)new;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (double)timeIntervalSinceReferenceDate;
- (unint64_t)retainCount;
@end

@implementation NSConstantDate

- (double)timeIntervalSinceReferenceDate
{
  return self->_ti;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return +[NSDate allocWithZone:a3];
}

+ (id)new
{
  return (id)objc_opt_new();
}

- (BOOL)_tryRetain
{
  return 1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end