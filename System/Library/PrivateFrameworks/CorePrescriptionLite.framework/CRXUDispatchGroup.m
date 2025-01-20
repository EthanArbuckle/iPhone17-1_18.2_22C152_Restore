@interface CRXUDispatchGroup
- (BOOL)waitFor:(double)a3;
- (CRXUDispatchGroup)initWithName:(id)a3;
- (NSString)name;
- (OS_dispatch_group)group;
- (id)debugDescription;
- (void)enter;
- (void)leave;
- (void)notifyOnQueue:(id)a3 withBlock:(id)a4;
- (void)onQueue:(id)a3 dispatchAsync:(id)a4;
- (void)wait;
@end

@implementation CRXUDispatchGroup

- (CRXUDispatchGroup)initWithName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRXUDispatchGroup;
  v5 = [(CRXUDispatchGroup *)&v11 init];
  if (v5)
  {
    dispatch_group_t v6 = dispatch_group_create();
    group = v5->_group;
    v5->_group = (OS_dispatch_group *)v6;

    uint64_t v8 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v8;
  }
  return v5;
}

- (void)enter
{
}

- (void)leave
{
}

- (void)onQueue:(id)a3 dispatchAsync:(id)a4
{
  group = self->_group;
  id v6 = a4;
  v7 = [a3 queue];
  dispatch_group_async(group, v7, v6);
}

- (void)wait
{
}

- (BOOL)waitFor:(double)a3
{
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  return dispatch_group_wait((dispatch_group_t)self->_group, v4) == 0;
}

- (void)notifyOnQueue:(id)a3 withBlock:(id)a4
{
  group = self->_group;
  id v6 = a4;
  v7 = [a3 queue];
  dispatch_group_notify(group, v7, v6);
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CRXUDispatchGroup *)self name];
  id v6 = [v3 stringWithFormat:@"%@<%p> %@", v4, self, v5];

  return v6;
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end