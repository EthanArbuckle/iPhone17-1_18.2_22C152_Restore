@interface IMDWhitetailToCoralDowngradeHelper
+ (id)arrayOfCreateIndexesSQL;
+ (id)arrayOfCreateTablesSQL;
+ (id)arrayOfCreateTriggersSQL;
+ (id)arrayOfTableNames;
- (IMDWhitetailToCoralDowngradeHelper)initWithPath:(id)a3;
@end

@implementation IMDWhitetailToCoralDowngradeHelper

+ (id)arrayOfCreateTablesSQL
{
  return &unk_1F0864FF8;
}

+ (id)arrayOfTableNames
{
  return &unk_1F0865010;
}

+ (id)arrayOfCreateIndexesSQL
{
  return &unk_1F0865028;
}

+ (id)arrayOfCreateTriggersSQL
{
  return &unk_1F0865040;
}

- (IMDWhitetailToCoralDowngradeHelper)initWithPath:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IMDWhitetailToCoralDowngradeHelper;
  return [(IMDDatabaseDowngradeHelper *)&v4 initWithPath:a3 tableNames:+[IMDWhitetailToCoralDowngradeHelper arrayOfTableNames](IMDWhitetailToCoralDowngradeHelper, "arrayOfTableNames") createTablesSQL:+[IMDWhitetailToCoralDowngradeHelper arrayOfCreateTablesSQL](IMDWhitetailToCoralDowngradeHelper, "arrayOfCreateTablesSQL") createIndexesSQL:+[IMDWhitetailToCoralDowngradeHelper arrayOfCreateIndexesSQL](IMDWhitetailToCoralDowngradeHelper, "arrayOfCreateIndexesSQL") createTriggersSQL:+[IMDWhitetailToCoralDowngradeHelper arrayOfCreateTriggersSQL] downgradesToVersion:9006];
}

@end