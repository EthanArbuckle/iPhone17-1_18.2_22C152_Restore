@interface CHSWidgetDescriptor(ATX)
- (uint64_t)atx_hasAccessoryWidgetFamiliesOnly;
- (uint64_t)atx_hasHomeScreenWidgetFamilies;
- (uint64_t)atx_hasHomeScreenWidgetFamiliesOnly;
@end

@implementation CHSWidgetDescriptor(ATX)

- (uint64_t)atx_hasHomeScreenWidgetFamilies
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  char v6 = 0;
  [a1 supportedFamilies];
  CHSWidgetFamilyMaskEnumerateFamilies();
  uint64_t v1 = *((unsigned __int8 *)v4 + 24);
  _Block_object_dispose(&v3, 8);
  return v1;
}

- (uint64_t)atx_hasHomeScreenWidgetFamiliesOnly
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  char v6 = 1;
  [a1 supportedFamilies];
  CHSWidgetFamilyMaskEnumerateFamilies();
  uint64_t v1 = *((unsigned __int8 *)v4 + 24);
  _Block_object_dispose(&v3, 8);
  return v1;
}

- (uint64_t)atx_hasAccessoryWidgetFamiliesOnly
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  char v6 = 1;
  [a1 supportedFamilies];
  CHSWidgetFamilyMaskEnumerateFamilies();
  uint64_t v1 = *((unsigned __int8 *)v4 + 24);
  _Block_object_dispose(&v3, 8);
  return v1;
}

@end