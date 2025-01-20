@interface UIApplication(AXFrontBoardExtras)
- (id)_accessibilityRecentlyActivatedApplicationBundleIdentifiers;
- (uint64_t)_accessibilityRemoveRecentlyActivatedBundleIdFromSwitcher:()AXFrontBoardExtras;
- (void)_accessibilityAddRecentlyActivatedBundleIdFromSwitcher:()AXFrontBoardExtras;
@end

@implementation UIApplication(AXFrontBoardExtras)

- (void)_accessibilityAddRecentlyActivatedBundleIdFromSwitcher:()AXFrontBoardExtras
{
  uint64_t v3 = _accessibilityAddRecentlyActivatedBundleIdFromSwitcher__onceToken;
  id v4 = a3;
  id v6 = v4;
  if (v3 == -1)
  {
    id v5 = v4;
  }
  else
  {
    dispatch_once(&_accessibilityAddRecentlyActivatedBundleIdFromSwitcher__onceToken, &__block_literal_global_0);
    id v5 = v6;
  }
  [(id)_accessibilityBundleIdsRecentlyActivatedFromSwitcher addObject:v5];
}

- (uint64_t)_accessibilityRemoveRecentlyActivatedBundleIdFromSwitcher:()AXFrontBoardExtras
{
  return objc_msgSend((id)_accessibilityBundleIdsRecentlyActivatedFromSwitcher, "removeObject:");
}

- (id)_accessibilityRecentlyActivatedApplicationBundleIdentifiers
{
  if (_accessibilityBundleIdsRecentlyActivatedFromSwitcher)
  {
    id v0 = (id)_accessibilityBundleIdsRecentlyActivatedFromSwitcher;
  }
  else
  {
    id v0 = [MEMORY[0x263EFFA08] set];
  }

  return v0;
}

@end