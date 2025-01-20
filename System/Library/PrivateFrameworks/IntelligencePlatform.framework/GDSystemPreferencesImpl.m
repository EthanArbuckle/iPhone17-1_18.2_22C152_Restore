@interface GDSystemPreferencesImpl
+ (BOOL)personalizationDataCollectionAllowed;
+ (void)updatePersonalizationDataCollectionAllowed:(BOOL)a3;
- (GDSystemPreferencesImpl)init;
@end

@implementation GDSystemPreferencesImpl

+ (BOOL)personalizationDataCollectionAllowed
{
  return static SystemPreferencesImpl.personalizationDataCollectionAllowed()() & 1;
}

+ (void)updatePersonalizationDataCollectionAllowed:(BOOL)a3
{
}

- (GDSystemPreferencesImpl)init
{
  return (GDSystemPreferencesImpl *)SystemPreferencesImpl.init()();
}

@end