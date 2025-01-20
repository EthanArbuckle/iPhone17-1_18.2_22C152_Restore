@interface StocksSyncPreferenceKeys
+ (NSString)compactListName;
+ (NSString)companyName;
+ (NSString)listName;
+ (NSString)symbol;
+ (NSString)type;
@end

@implementation StocksSyncPreferenceKeys

+ (NSString)symbol
{
  return (NSString *)@"symbol";
}

+ (NSString)companyName
{
  return (NSString *)@"companyName";
}

+ (NSString)listName
{
  return (NSString *)@"listName";
}

+ (NSString)compactListName
{
  return (NSString *)@"compactListName";
}

+ (NSString)type
{
  return (NSString *)@"type";
}

@end