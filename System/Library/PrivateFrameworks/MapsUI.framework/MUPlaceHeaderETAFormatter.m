@interface MUPlaceHeaderETAFormatter
+ (id)etaStringFromSeconds:(unint64_t)a3 isRenderingInFullWidth:(BOOL)a4;
@end

@implementation MUPlaceHeaderETAFormatter

+ (id)etaStringFromSeconds:(unint64_t)a3 isRenderingInFullWidth:(BOOL)a4
{
  v4 = objc_msgSend(NSString, "_navigation_stringWithSeconds:andAbbreviationType:");
  return v4;
}

@end