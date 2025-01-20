@interface GDSystemPreferences
+ (BOOL)systemPersonalizationDataCollectionAllowed;
+ (void)updateSystemPersonalizationDataCollectionAllowed:(BOOL)a3;
@end

@implementation GDSystemPreferences

+ (BOOL)systemPersonalizationDataCollectionAllowed
{
  return ((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1F4181798])(GDSystemPreferencesImpl, sel_personalizationDataCollectionAllowed);
}

+ (void)updateSystemPersonalizationDataCollectionAllowed:(BOOL)a3
{
}

@end