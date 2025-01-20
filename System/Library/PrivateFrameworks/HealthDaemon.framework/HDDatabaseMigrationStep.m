@interface HDDatabaseMigrationStep
+ (id)migrationStepFrom:(int64_t)a3 to:(int64_t)a4 handler:(id)a5;
+ (id)migrationStepWithForeignKeysDisabledFrom:(int64_t)a3 to:(int64_t)a4 handler:(id)a5;
- (NSString)schemaName;
- (id)description;
- (id)initForSchema:(id)a3 toVersion:(int64_t)a4 requiringVersion:(int64_t)a5 foreignKeys:(int64_t)a6 handler:(id)a7;
- (id)migrationHandler;
- (int64_t)finalSchemaVersion;
- (int64_t)foreignKeyStatus;
- (int64_t)requiredPrimarySchemaVersion;
- (void)setForeignKeyStatus:(int64_t)a3;
@end

@implementation HDDatabaseMigrationStep

+ (id)migrationStepFrom:(int64_t)a3 to:(int64_t)a4 handler:(id)a5
{
  id v6 = a5;
  v7 = [HDDatabaseMigrationStep alloc];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__HDDatabaseMigrationStep_migrationStepFrom_to_handler___block_invoke;
  v11[3] = &unk_1E6303040;
  id v12 = v6;
  id v8 = v6;
  id v9 = [(HDDatabaseMigrationStep *)v7 initForSchema:0 toVersion:a4 requiringVersion:-1 foreignKeys:0 handler:v11];

  return v9;
}

uint64_t __56__HDDatabaseMigrationStep_migrationStepFrom_to_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)migrationStepWithForeignKeysDisabledFrom:(int64_t)a3 to:(int64_t)a4 handler:(id)a5
{
  id v6 = a5;
  v7 = [HDDatabaseMigrationStep alloc];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__HDDatabaseMigrationStep_migrationStepWithForeignKeysDisabledFrom_to_handler___block_invoke;
  v11[3] = &unk_1E6303040;
  id v12 = v6;
  id v8 = v6;
  id v9 = [(HDDatabaseMigrationStep *)v7 initForSchema:0 toVersion:a4 requiringVersion:-1 foreignKeys:1 handler:v11];

  return v9;
}

uint64_t __79__HDDatabaseMigrationStep_migrationStepWithForeignKeysDisabledFrom_to_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)initForSchema:(id)a3 toVersion:(int64_t)a4 requiringVersion:(int64_t)a5 foreignKeys:(int64_t)a6 handler:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  if (!v13 && a5 != -1)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HDDatabaseMigrationStep.m", 53, @"Invalid parameter not satisfying: %@", @"(schemaName != nil) || (requiredPrimarySchemaVersion == HDSQLiteRequiredPrimarySchemaVersionAny)" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)HDDatabaseMigrationStep;
  v15 = [(HDDatabaseMigrationStep *)&v22 init];
  if (v15)
  {
    uint64_t v16 = [v13 copy];
    schemaName = v15->_schemaName;
    v15->_schemaName = (NSString *)v16;

    v15->_requiredPrimarySchemaVersion = a5;
    v15->_finalSchemaVersion = a4;
    v15->_foreignKeyStatus = a6;
    uint64_t v18 = [v14 copy];
    id migrationHandler = v15->_migrationHandler;
    v15->_id migrationHandler = (id)v18;
  }
  return v15;
}

- (id)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)HDDatabaseMigrationStep;
  uint64_t v4 = [(HDDatabaseMigrationStep *)&v12 description];
  v5 = (void *)v4;
  schemaName = &stru_1F1728D60;
  if (self->_schemaName) {
    schemaName = (__CFString *)self->_schemaName;
  }
  int64_t foreignKeyStatus = self->_foreignKeyStatus;
  id v8 = @"<UNKNOWN>";
  if (foreignKeyStatus == 1) {
    id v8 = @"disabled";
  }
  if (foreignKeyStatus) {
    id v9 = v8;
  }
  else {
    id v9 = @"enabled";
  }
  v10 = [v3 stringWithFormat:@"<%@ %@: -> %ld (requiring: %ld) foreign keys %@>", v4, schemaName, self->_finalSchemaVersion, self->_requiredPrimarySchemaVersion, v9];

  return v10;
}

- (id)migrationHandler
{
  return self->_migrationHandler;
}

- (int64_t)finalSchemaVersion
{
  return self->_finalSchemaVersion;
}

- (int64_t)foreignKeyStatus
{
  return self->_foreignKeyStatus;
}

- (void)setForeignKeyStatus:(int64_t)a3
{
  self->_int64_t foreignKeyStatus = a3;
}

- (NSString)schemaName
{
  return self->_schemaName;
}

- (int64_t)requiredPrimarySchemaVersion
{
  return self->_requiredPrimarySchemaVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schemaName, 0);

  objc_storeStrong(&self->_migrationHandler, 0);
}

@end