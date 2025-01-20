@interface NSObject(AXUISettingsWelcomeControllerCommon)
- (id)ax_buddyDynamicHeightConstraints;
- (id)ax_buddyObservedTableViews;
- (uint64_t)ax_setBuddyDynamicHeightConstraints:()AXUISettingsWelcomeControllerCommon;
- (uint64_t)ax_setBuddyObservedTableViews:()AXUISettingsWelcomeControllerCommon;
@end

@implementation NSObject(AXUISettingsWelcomeControllerCommon)

- (id)ax_buddyObservedTableViews
{
  return objc_getAssociatedObject(a1, &__NSObject__ax_buddyObservedTableViews);
}

- (uint64_t)ax_setBuddyObservedTableViews:()AXUISettingsWelcomeControllerCommon
{
  return MEMORY[0x1F41063F8](a1, &__NSObject__ax_buddyObservedTableViews);
}

- (id)ax_buddyDynamicHeightConstraints
{
  return objc_getAssociatedObject(a1, &__NSObject__ax_buddyDynamicHeightConstraints);
}

- (uint64_t)ax_setBuddyDynamicHeightConstraints:()AXUISettingsWelcomeControllerCommon
{
  return MEMORY[0x1F41063F8](a1, &__NSObject__ax_buddyDynamicHeightConstraints);
}

@end