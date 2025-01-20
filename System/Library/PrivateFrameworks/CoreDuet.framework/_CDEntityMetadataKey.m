@interface _CDEntityMetadataKey
+ (id)bestLanguage;
+ (id)name;
@end

@implementation _CDEntityMetadataKey

+ (id)name
{
  return @"_CDEntityMetadataKey-name";
}

+ (id)bestLanguage
{
  return @"_CDEntityMetadataKey-bestLanguage";
}

@end