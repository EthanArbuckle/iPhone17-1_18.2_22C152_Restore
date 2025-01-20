@interface BLJaliscoVersion
+ (id)defaultIdentifier;
+ (id)persistentStoreFileName;
+ (id)schemaVersion;
@end

@implementation BLJaliscoVersion

+ (id)defaultIdentifier
{
  return @"BKJaliscoServerSource";
}

+ (id)schemaVersion
{
  return @"v09182016";
}

+ (id)persistentStoreFileName
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%@-%@.sqlite", v2, @"BKJaliscoServerSource", @"v09182016");
}

@end