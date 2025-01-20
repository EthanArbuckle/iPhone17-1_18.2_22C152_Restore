@interface VSWaitGroup
- (BOOL)wait;
- (BOOL)waitWithMilliseconds:(unint64_t)a3;
- (VSWaitGroup)init;
- (void)enter;
- (void)leave;
@end

@implementation VSWaitGroup

- (VSWaitGroup)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSWaitGroup;
  v2 = [(VSWaitGroup *)&v6 init];
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v3;
  }
  return v2;
}

- (void)enter
{
}

- (void)leave
{
}

- (BOOL)waitWithMilliseconds:(unint64_t)a3
{
  if (a3) {
    dispatch_time_t v4 = dispatch_time(0, 1000000 * a3);
  }
  else {
    dispatch_time_t v4 = -1;
  }
  return dispatch_group_wait((dispatch_group_t)self->_group, v4) == 0;
}

- (BOOL)wait
{
  return [(VSWaitGroup *)self waitWithMilliseconds:0];
}

- (void).cxx_destruct
{
}

@end