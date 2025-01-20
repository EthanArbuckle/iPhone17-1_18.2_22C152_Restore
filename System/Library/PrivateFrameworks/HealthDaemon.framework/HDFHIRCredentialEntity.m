@interface HDFHIRCredentialEntity
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (int64_t)protectionClass;
@end

@implementation HDFHIRCredentialEntity

+ (id)databaseTable
{
  return @"clinical_credentials";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 10;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_20;
}

+ (int64_t)protectionClass
{
  return 2;
}

@end