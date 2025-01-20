@interface TDSchemaRenditionSpec
- (id)_slicesToUseForCSI;
@end

@implementation TDSchemaRenditionSpec

- (id)_slicesToUseForCSI
{
  v2 = (void *)[(TDSchemaRenditionSpec *)self production];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return (id)[v2 slices];
}

@end