@interface UIView(CSRegion)
- (uint64_t)coverSheetRegionIsReservedForHorizontalScrolling;
- (uint64_t)coverSheetRegionRole;
- (void)setCoverSheetRegionReservedForHorizontalScrolling:()CSRegion;
- (void)setCoverSheetRegionRole:()CSRegion;
@end

@implementation UIView(CSRegion)

- (void)setCoverSheetRegionRole:()CSRegion
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "coverSheetRegionRole", v2, (void *)1);
}

- (uint64_t)coverSheetRegionRole
{
  v1 = objc_getAssociatedObject(a1, "coverSheetRegionRole");
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (void)setCoverSheetRegionReservedForHorizontalScrolling:()CSRegion
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "coverSheetRegionReservedForHorizontalScrolling", v2, (void *)1);
}

- (uint64_t)coverSheetRegionIsReservedForHorizontalScrolling
{
  v1 = objc_getAssociatedObject(a1, "coverSheetRegionReservedForHorizontalScrolling");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end