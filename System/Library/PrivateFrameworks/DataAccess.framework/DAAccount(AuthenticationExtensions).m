@interface DAAccount(AuthenticationExtensions)
+ (id)_leafAccountTypes;
@end

@implementation DAAccount(AuthenticationExtensions)

+ (id)_leafAccountTypes
{
  if (_leafAccountTypes_onceToken != -1) {
    dispatch_once(&_leafAccountTypes_onceToken, &__block_literal_global_527);
  }
  v2 = (void *)_leafAccountTypes__sLeafAccountTypes;
  return v2;
}

@end