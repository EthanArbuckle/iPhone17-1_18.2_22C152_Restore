@interface NEPathEvent
- (NSString)bundleID;
- (id)initWithType:(void *)a3 bundleID:;
- (int64_t)type;
@end

@implementation NEPathEvent

- (void).cxx_destruct
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)type
{
  return self->_type;
}

- (id)initWithType:(void *)a3 bundleID:
{
  id v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)NEPathEvent;
    v7 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      v7[1] = a2;
      objc_storeStrong(v7 + 2, a3);
    }
  }

  return a1;
}

@end