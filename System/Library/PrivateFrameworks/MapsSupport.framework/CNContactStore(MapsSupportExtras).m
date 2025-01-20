@interface CNContactStore(MapsSupportExtras)
+ (BOOL)_maps_isAuthorized;
@end

@implementation CNContactStore(MapsSupportExtras)

+ (BOOL)_maps_isAuthorized
{
  v0 = (void *)tcc_identity_create();
  if (v0) {
    BOOL v1 = (unint64_t)([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] - 3) < 2;
  }
  else {
    BOOL v1 = 0;
  }

  return v1;
}

@end