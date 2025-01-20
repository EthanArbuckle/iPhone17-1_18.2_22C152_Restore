@interface _NSPropertyDescriptionProxy2
+ (Class)classForKeyedUnarchiver;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (Class)classForArchiver;
- (Class)classForCoder;
- (_NSPropertyDescriptionProxy2)retain;
- (void)release;
@end

@implementation _NSPropertyDescriptionProxy2

- (_NSPropertyDescriptionProxy2)retain
{
  id v3 = self->super._sourceBuffer;
  return self;
}

- (void)release
{
}

- (Class)classForArchiver
{
  return (Class)objc_opt_class();
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (BOOL)_isDeallocating
{
  return [self->super._sourceBuffer _isDeallocating];
}

- (BOOL)_tryRetain
{
  return [self->super._sourceBuffer _tryRetain];
}

@end