@interface NSString
+ (id)at_deviceIconNameForIdentifier:(id)a3;
+ (id)getIconSuffix;
+ (id)sc_deviceIconNameForIdentifier:(id)a3;
@end

@implementation NSString

+ (id)at_deviceIconNameForIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[NSString getIconSuffix];
  v5 = +[NSString stringWithFormat:@"%@%@", v3, v4];

  return v5;
}

+ (id)sc_deviceIconNameForIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[NSString getIconSuffix];
  v5 = +[NSString stringWithFormat:@"SCATIcon_%@%@", v3, v4];

  return v5;
}

+ (id)getIconSuffix
{
  if (AXDeviceHasJindo())
  {
    v2 = @"_DI";
  }
  else if (AXDeviceHasHomeButton())
  {
    v2 = &stru_1001B1E10;
  }
  else
  {
    int IsPad = AXDeviceIsPad();
    v2 = @"_NHB";
    if (IsPad) {
      v2 = @"_NHB_IPAD";
    }
  }
  v4 = v2;

  return v4;
}

@end