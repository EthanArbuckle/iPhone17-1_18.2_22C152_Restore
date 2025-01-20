@interface NSString(CoreMaterialAdditions)
+ (__CFString)mt_identityValueForMaterialSettingsProperty:()CoreMaterialAdditions;
- (uint64_t)mt_isIdentityValueForMaterialSettingsProperty:()CoreMaterialAdditions;
@end

@implementation NSString(CoreMaterialAdditions)

+ (__CFString)mt_identityValueForMaterialSettingsProperty:()CoreMaterialAdditions
{
  if ([a3 isEqualToString:@"blurInputQuality"]) {
    return @"default";
  }
  else {
    return 0;
  }
}

- (uint64_t)mt_isIdentityValueForMaterialSettingsProperty:()CoreMaterialAdditions
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "mt_identityValueForMaterialSettingsProperty:", v4);

  uint64_t v6 = [a1 isEqual:v5];
  return v6;
}

@end