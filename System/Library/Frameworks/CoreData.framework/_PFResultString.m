@interface _PFResultString
+ (unint64_t)bufferOffset;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (_PFResultString)retain;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)retainCount;
- (void)release;
@end

@implementation _PFResultString

- (void)release
{
}

- (_PFResultString)retain
{
  id v3 = self->_parentObject;
  return self;
}

+ (unint64_t)bufferOffset
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [NSString alloc];

  return (id)[v4 initWithString:self];
}

- (id)copy
{
  id v3 = [NSString alloc];

  return (id)[v3 initWithString:self];
}

- (unint64_t)retainCount
{
  return [self->_parentObject retainCount];
}

- (BOOL)_isDeallocating
{
  return [self->_parentObject _isDeallocating];
}

- (BOOL)_tryRetain
{
  return [self->_parentObject _tryRetain];
}

@end