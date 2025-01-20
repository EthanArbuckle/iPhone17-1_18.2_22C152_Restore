@interface LNCascadeAllowList
+ (BOOL)isAllowedItem:(id)a3 clientBundleID:(id)a4;
@end

@implementation LNCascadeAllowList

+ (BOOL)isAllowedItem:(id)a3 clientBundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v6 isEqual:@"com.apple.mail"] & 1) != 0
    || ([v6 isEqual:@"com.apple.mobilemail"] & 1) != 0)
  {
    BOOL v7 = 0;
  }
  else
  {
    v8 = [v5 attributeSet];
    v9 = [v8 attributeForKey:@"_kMDItemAppEntityTypeIdentifier"];

    BOOL v7 = ([v6 isEqual:@"com.apple.mobileslideshow"] & 1) == 0
      && ![v6 isEqual:@"com.apple.Photos"]
      || ([v9 isEqual:@"AssetEntity"] & 1) == 0;
  }
  return v7;
}

@end