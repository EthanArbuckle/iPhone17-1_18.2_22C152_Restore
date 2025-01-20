@interface AppInstallEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)foreignDatabaseTablesToDelete;
+ (id)foreignKeyColumnForTable:(id)a3;
- (BOOL)deleteFromDatabase;
@end

@implementation AppInstallEntity

- (BOOL)deleteFromDatabase
{
  v3 = sub_10026E9D4(self, @"external_id");
  if (v3)
  {
    v4 = sub_10025910C();
    sub_100259328(v4, v3);
  }
  v7.receiver = self;
  v7.super_class = (Class)AppInstallEntity;
  BOOL v5 = [(SQLiteEntity *)&v7 deleteFromDatabase];

  return v5;
}

+ (id)foreignDatabaseTablesToDelete
{
  if (qword_1005B0DE0 != -1) {
    dispatch_once(&qword_1005B0DE0, &stru_100525F50);
  }
  v2 = (void *)qword_1005B0DD8;
  return v2;
}

+ (id)foreignKeyColumnForTable:(id)a3
{
  return [&off_10054E220 valueForKey:a3];
}

+ (id)databaseTable
{
  return @"app_install";
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4 = a3;
  v12[0] = @"COUNT(1)";
  v12[1] = @"MAX(app_install.priority)";
  v12[2] = @"MIN(app_install.priority)";
  BOOL v5 = +[NSArray arrayWithObjects:v12 count:3];
  if ([v5 containsObject:v4])
  {
    id v6 = v4;
  }
  else
  {
    v11[0] = @"IFNULL(app_install.bootstrapped, 2)";
    v11[1] = @"IFNULL(app_install.phase, 10)";
    v11[2] = @"IFNULL(app_install.priority, 0)";
    objc_super v7 = +[NSArray arrayWithObjects:v11 count:3];
    if ([v7 containsObject:v4])
    {
      id v8 = v4;
    }
    else
    {
      v10.receiver = a1;
      v10.super_class = (Class)&OBJC_METACLASS___AppInstallEntity;
      objc_msgSendSuper2(&v10, "disambiguatedSQLForProperty:", v4);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v6 = v8;
  }
  return v6;
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installVerificationToken, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
}

@end