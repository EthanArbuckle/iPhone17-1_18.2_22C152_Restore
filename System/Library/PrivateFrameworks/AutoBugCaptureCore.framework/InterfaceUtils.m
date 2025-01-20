@interface InterfaceUtils
+ (id)stringForExtendedInterfaceType:(int64_t)a3;
+ (id)stringForInterfaceType:(int64_t)a3;
+ (int64_t)interfaceTypeForString:(id)a3;
+ (int64_t)nwInterfaceTypeForExtendedNWInterfaceType:(int64_t)a3;
@end

@implementation InterfaceUtils

+ (id)stringForInterfaceType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"Other";
  }
  else {
    return off_263FC2D70[a3 - 1];
  }
}

+ (id)stringForExtendedInterfaceType:(int64_t)a3
{
  if ((unint64_t)(a3 - 257) > 4) {
    return @"Other";
  }
  else {
    return off_263FC2D90[a3 - 257];
  }
}

+ (int64_t)interfaceTypeForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"WiFi"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Cellular"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"WiredEthernet"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"Loopback"])
  {
    int64_t v4 = 4;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (int64_t)nwInterfaceTypeForExtendedNWInterfaceType:(int64_t)a3
{
  if (a3 == 257) {
    return 1;
  }
  else {
    return 2 * (a3 == 258);
  }
}

@end