@interface LPApplicationCompatibilityQuirks
+ (BOOL)allowsSkinnyWidthByDefault;
+ (BOOL)needsFreshWKUserContentController;
+ (BOOL)supportsLPLinkViewAutolayout;
@end

@implementation LPApplicationCompatibilityQuirks

+ (BOOL)needsFreshWKUserContentController
{
  if (dyld_program_sdk_at_least()) {
    return 0;
  }

  return +[LPApplicationIdentification isCNNMobile];
}

+ (BOOL)allowsSkinnyWidthByDefault
{
  return dyld_program_sdk_at_least() ^ 1;
}

+ (BOOL)supportsLPLinkViewAutolayout
{
  return dyld_program_sdk_at_least();
}

@end