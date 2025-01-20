@interface EKObject(ActionStrings)
+ (uint64_t)actionStringsDisplayName;
+ (uint64_t)actionStringsPluralDisplayName;
- (uint64_t)actionStringsDisplayTitle;
@end

@implementation EKObject(ActionStrings)

+ (uint64_t)actionStringsDisplayName
{
  return 0;
}

+ (uint64_t)actionStringsPluralDisplayName
{
  return 0;
}

- (uint64_t)actionStringsDisplayTitle
{
  return 0;
}

@end