@interface CNContactStore(MKExtras)
+ (BOOL)_mapkit_isAuthorized;
@end

@implementation CNContactStore(MKExtras)

+ (BOOL)_mapkit_isAuthorized
{
  return (unint64_t)([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] - 3) < 2;
}

@end