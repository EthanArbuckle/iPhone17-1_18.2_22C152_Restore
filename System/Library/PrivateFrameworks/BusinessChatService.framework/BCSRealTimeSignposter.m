@interface BCSRealTimeSignposter
- (id)_initWithType:(int64_t)a3 signpostIdentifier:(unint64_t)a4;
- (int64_t)type;
- (unint64_t)signpostIdentifier;
@end

@implementation BCSRealTimeSignposter

- (id)_initWithType:(int64_t)a3 signpostIdentifier:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BCSRealTimeSignposter;
  id result = [(BCSRealTimeSignposter *)&v7 init];
  if (result)
  {
    *((void *)result + 1) = a3;
    *((void *)result + 2) = a4;
  }
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)signpostIdentifier
{
  return self->_signpostIdentifier;
}

@end