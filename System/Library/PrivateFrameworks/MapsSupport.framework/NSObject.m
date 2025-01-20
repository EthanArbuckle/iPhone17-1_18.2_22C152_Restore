@interface NSObject
- (BOOL)_maps_needsUpdateWithSelector:(SEL)a3;
- (void)_maps_setNeedsUpdate:(BOOL)a3 withSelector:(SEL)a4;
- (void)_maps_setNeedsUpdateWithSelector:(SEL)a3;
@end

@implementation NSObject

- (void)_maps_setNeedsUpdateWithSelector:(SEL)a3
{
}

- (void)_maps_setNeedsUpdate:(BOOL)a3 withSelector:(SEL)a4
{
  BOOL v5 = a3;
  uint64_t v7 = objc_getAssociatedObject(self, off_10009AFF8);
  id v8 = (id)v7;
  if (v5)
  {
    if (!v7)
    {
      id v8 = objc_alloc_init((Class)NSMutableSet);
      objc_setAssociatedObject(self, off_10009AFF8, v8, (void *)1);
    }
    v9 = NSStringFromSelector(a4);
    [v8 addObject:v9];

    v10 = objc_getAssociatedObject(self, off_10009AFF0);

    if (!v10)
    {
      objc_setAssociatedObject(self, off_10009AFF0, &__kCFBooleanTrue, (void *)3);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000288B0;
      block[3] = &unk_100080F10;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    v11 = NSStringFromSelector(a4);
    [v8 removeObject:v11];
  }
}

- (BOOL)_maps_needsUpdateWithSelector:(SEL)a3
{
  v4 = objc_getAssociatedObject(self, off_10009AFF8);
  BOOL v5 = NSStringFromSelector(a3);
  unsigned __int8 v6 = [v4 containsObject:v5];

  return v6;
}

@end