@interface SGDatabaseMigratorSnippets
+ (id)migrations;
+ (id)skipFromZeroSchema:(unsigned int *)a3;
@end

@implementation SGDatabaseMigratorSnippets

+ (id)skipFromZeroSchema:(unsigned int *)a3
{
  *a3 = 107;
  return &unk_1F25367B8;
}

+ (id)migrations
{
  return &unk_1F2537638;
}

@end