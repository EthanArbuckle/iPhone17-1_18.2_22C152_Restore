@interface MIAppUserDataMigrator
- (BOOL)performMigration;
- (MIAppUserDataMigrator)init;
- (id)dataClassName;
- (unint64_t)countItemsToMigrate;
- (void)setCountItemsToMigrate:(unint64_t)a3;
@end

@implementation MIAppUserDataMigrator

- (MIAppUserDataMigrator)init
{
  v3.receiver = self;
  v3.super_class = (Class)MIAppUserDataMigrator;
  result = [(MIAppUserDataMigrator *)&v3 init];
  if (result) {
    result->_countItemsToMigrate = 0;
  }
  return result;
}

- (id)dataClassName
{
  return @"MIAppUserDataMigrator";
}

- (BOOL)performMigration
{
  v2 = self;
  unint64_t v22 = [(MIAppUserDataMigrator *)self countItemsToMigrate];
  _DMLogFunc();
  if (![(MIAppUserDataMigrator *)v2 countItemsToMigrate])
  {
    BOOL v20 = 1;
    if (container_perform_data_migration_for_current_user()) {
      return v20;
    }
    goto LABEL_14;
  }
  unint64_t v3 = 0;
  char v29 = 1;
  v4 = &MOLogWrite_ptr;
  v5 = &MOLogWrite_ptr;
  v28 = v2;
  do
  {
    v6 = objc_msgSend(v4[54], "stringWithUTF8String:", 0, v23, v24, v25, v27);
    id v7 = objc_alloc((Class)v5[45]);
    id v31 = 0;
    id v8 = [v7 initWithBundleIdentifier:v6 allowPlaceholder:1 error:&v31];
    id v9 = v31;
    if (v8
      && ([v8 dataContainerURL], v10 = objc_claimAutoreleasedReturnValue(),
                                                v10,
                                                v10))
    {
      v11 = +[NSURL fileURLWithFileSystemRepresentation:0 isDirectory:0 relativeToURL:0];
      v12 = [v8 dataContainerURL];
      v13 = [v4[54] stringWithFileSystemRepresentation:0];
      v14 = [v12 URLByAppendingPathComponent:v13];

      v15 = [v11 path];
      v26 = [v14 path];
      _DMLogFunc();

      v16 = +[MIFileManager defaultManager];
      id v30 = v9;
      unsigned __int8 v17 = [v16 moveItemIfExistsAtURL:v11 toURL:v14 error:&v30];
      id v18 = v30;

      if ((v17 & 1) == 0)
      {
        v19 = [v11 path];
        v25 = [v14 path];
        id v27 = v18;
        v23 = v6;
        v24 = v19;
        _DMLogFunc();

        char v29 = 0;
      }

      id v9 = v18;
      v2 = v28;
      v4 = &MOLogWrite_ptr;
      v5 = &MOLogWrite_ptr;
    }
    else
    {
      v11 = [v8 dataContainerURL];
      v24 = v11;
      v25 = v9;
      v23 = v6;
      _DMLogFunc();
      char v29 = 0;
    }

    ++v3;
  }
  while (v3 < [(MIAppUserDataMigrator *)v2 countItemsToMigrate]);
  if ((container_perform_data_migration_for_current_user() & 1) == 0)
  {
LABEL_14:
    _DMLogFunc();
    goto LABEL_15;
  }
  if ((v29 & 1) == 0)
  {
LABEL_15:
    _DMLogFunc();
    return 0;
  }
  return 1;
}

- (unint64_t)countItemsToMigrate
{
  return self->_countItemsToMigrate;
}

- (void)setCountItemsToMigrate:(unint64_t)a3
{
  self->_countItemsToMigrate = a3;
}

@end