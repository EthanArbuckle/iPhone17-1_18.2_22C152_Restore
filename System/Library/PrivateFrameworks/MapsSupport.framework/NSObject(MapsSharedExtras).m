@interface NSObject(MapsSharedExtras)
- (uint64_t)_maps_needsUpdateWithSelector:()MapsSharedExtras;
- (uint64_t)_maps_setNeedsUpdateWithSelector:()MapsSharedExtras;
- (void)_maps_setNeedsUpdate:()MapsSharedExtras withSelector:;
@end

@implementation NSObject(MapsSharedExtras)

- (uint64_t)_maps_setNeedsUpdateWithSelector:()MapsSharedExtras
{
  return objc_msgSend(a1, "_maps_setNeedsUpdate:withSelector:", 1, a3);
}

- (void)_maps_setNeedsUpdate:()MapsSharedExtras withSelector:
{
  uint64_t v7 = objc_getAssociatedObject(a1, off_1EB7F4458);
  id v8 = (id)v7;
  if (a3)
  {
    if (!v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      objc_setAssociatedObject(a1, off_1EB7F4458, v8, (void *)1);
    }
    v9 = NSStringFromSelector(a4);
    [v8 addObject:v9];

    v10 = objc_getAssociatedObject(a1, _MergedGlobals_34);

    if (!v10)
    {
      objc_setAssociatedObject(a1, _MergedGlobals_34, MEMORY[0x1E4F1CC38], (void *)3);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__NSObject_MapsSharedExtras___maps_setNeedsUpdate_withSelector___block_invoke;
      block[3] = &unk_1E617C770;
      block[4] = a1;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    v11 = NSStringFromSelector(a4);
    [v8 removeObject:v11];
  }
}

- (uint64_t)_maps_needsUpdateWithSelector:()MapsSharedExtras
{
  v4 = objc_getAssociatedObject(a1, off_1EB7F4458);
  v5 = NSStringFromSelector(a3);
  uint64_t v6 = [v4 containsObject:v5];

  return v6;
}

@end