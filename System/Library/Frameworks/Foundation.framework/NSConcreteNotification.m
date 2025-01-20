@interface NSConcreteNotification
- (NSConcreteNotification)initWithName:(id)a3 object:(id)a4 userInfo:(id)a5;
- (id)name;
- (id)object;
- (id)userInfo;
- (void)dealloc;
@end

@implementation NSConcreteNotification

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSConcreteNotification;
  [(NSConcreteNotification *)&v3 dealloc];
}

- (NSConcreteNotification)initWithName:(id)a3 object:(id)a4 userInfo:(id)a5
{
  v5 = self;
  if (a3)
  {
    self->name = (NSString *)[a3 copy];
    v5->object = a4;
    v5->userInfo = (NSDictionary *)a5;
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)object
{
  return self->object;
}

- (id)name
{
  v2 = self->name;

  return v2;
}

- (id)userInfo
{
  v2 = self->userInfo;

  return v2;
}

@end