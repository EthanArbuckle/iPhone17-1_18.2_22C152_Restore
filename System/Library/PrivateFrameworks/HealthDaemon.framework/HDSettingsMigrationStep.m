@interface HDSettingsMigrationStep
- (BOOL)performStepWithProfile:(id)a3 error:(id *)a4;
- (HDSettingsMigrationStep)initWithIdentifier:(id)a3 migrationVersion:(int64_t)a4 block:(id)a5;
- (NSString)identifier;
- (id)description;
- (int64_t)migrationVersion;
@end

@implementation HDSettingsMigrationStep

- (HDSettingsMigrationStep)initWithIdentifier:(id)a3 migrationVersion:(int64_t)a4 block:(id)a5
{
  id v7 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDSettingsMigrationStep;
  v8 = [(HDSettingsMigrationStep *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_migrationVersion = a4;
    v10 = _Block_copy(v7);
    id block = v9->_block;
    v9->_id block = v10;
  }
  return v9;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%ld>", objc_opt_class(), self->_migrationVersion];
}

- (BOOL)performStepWithProfile:(id)a3 error:(id *)a4
{
  return (*((uint64_t (**)(void))self->_block + 2))();
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)migrationVersion
{
  return self->_migrationVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong(&self->_block, 0);
}

@end