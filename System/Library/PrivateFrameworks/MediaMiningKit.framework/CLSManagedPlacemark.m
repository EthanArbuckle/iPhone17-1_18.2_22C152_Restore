@interface CLSManagedPlacemark
+ (NSString)entityName;
@end

@implementation CLSManagedPlacemark

+ (NSString)entityName
{
  return (NSString *)@"Placemark";
}

@end