@interface NSObject(MPStoreLibraryPersonalizingAdditions)
+ (id)requiredStoreLibraryPersonalizationProperties;
- (id)personalizationScopedPropertiesForProperties:()MPStoreLibraryPersonalizingAdditions;
- (uint64_t)objectWithStoreLibraryPersonalizationRelativeModelObject:()MPStoreLibraryPersonalizingAdditions;
- (uint64_t)relativeModelObjectForStoreLibraryPersonalization;
@end

@implementation NSObject(MPStoreLibraryPersonalizingAdditions)

- (uint64_t)objectWithStoreLibraryPersonalizationRelativeModelObject:()MPStoreLibraryPersonalizingAdditions
{
  return 0;
}

- (uint64_t)relativeModelObjectForStoreLibraryPersonalization
{
  return 0;
}

- (id)personalizationScopedPropertiesForProperties:()MPStoreLibraryPersonalizingAdditions
{
  return a3;
}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  return +[MPPropertySet emptyPropertySet];
}

@end