@interface NSString(CMSCoding)
+ (id)instanceFromCMSCoded:()CMSCoding;
@end

@implementation NSString(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    v4 = (void *)[v3 copy];
  }
  else {
    v4 = 0;
  }

  return v4;
}

@end