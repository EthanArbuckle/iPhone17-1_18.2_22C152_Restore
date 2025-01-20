@interface __NSEnumerator0
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)new;
+ (id)sharedInstance;
- (__NSEnumerator0)init;
- (id)nextObject;
- (unint64_t)retainCount;
@end

@implementation __NSEnumerator0

- (id)nextObject
{
  return 0;
}

+ (id)sharedInstance
{
  return &__NSEnumerator0__struct;
}

+ (id)new
{
  return &__NSEnumerator0__struct;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return &__NSEnumerator0__struct;
}

- (__NSEnumerator0)init
{
  return (__NSEnumerator0 *)&__NSEnumerator0__struct;
}

- (unint64_t)retainCount
{
  return -1;
}

@end