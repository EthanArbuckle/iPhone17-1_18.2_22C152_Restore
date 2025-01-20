@interface NSCustomMigrationStage
- (NSCustomMigrationStage)initWithCurrentModelReference:(NSManagedObjectModelReference *)currentModel nextModelReference:(NSManagedObjectModelReference *)nextModel;
- (NSManagedObjectModelReference)currentModel;
- (NSManagedObjectModelReference)nextModel;
- (void)dealloc;
- (void)didMigrateHandler;
- (void)setDidMigrateHandler:(void *)didMigrateHandler;
- (void)setWillMigrateHandler:(void *)willMigrateHandler;
- (void)willMigrateHandler;
@end

@implementation NSCustomMigrationStage

- (void)setDidMigrateHandler:(void *)didMigrateHandler
{
}

- (NSManagedObjectModelReference)nextModel
{
  return (NSManagedObjectModelReference *)objc_getProperty(self, a2, 24, 1);
}

- (NSManagedObjectModelReference)currentModel
{
  return (NSManagedObjectModelReference *)objc_getProperty(self, a2, 16, 1);
}

- (NSCustomMigrationStage)initWithCurrentModelReference:(NSManagedObjectModelReference *)currentModel nextModelReference:(NSManagedObjectModelReference *)nextModel
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if ([(NSString *)[(NSManagedObjectModelReference *)currentModel versionChecksum] isEqualToString:[(NSManagedObjectModelReference *)nextModel versionChecksum]])
  {

    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    v12[0] = @"currentModel versionChecksum";
    v12[1] = @"nextModel versionChecksum";
    v13[0] = [(NSManagedObjectModelReference *)currentModel versionChecksum];
    v13[1] = [(NSManagedObjectModelReference *)nextModel versionChecksum];
    objc_exception_throw((id)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, @"The current model reference and the next model reference cannot be equal.", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, v12, 2)));
  }
  v11.receiver = self;
  v11.super_class = (Class)NSCustomMigrationStage;
  v7 = [(NSMigrationStage *)&v11 init];
  if (v7)
  {
    v7->_currentModel = currentModel;
    v7->_nextModel = nextModel;
  }
  return v7;
}

- (void)dealloc
{
  self->_currentModel = 0;
  self->_nextModel = 0;

  self->_willMigrateHandler = 0;
  self->_didMigrateHandler = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCustomMigrationStage;
  [(NSMigrationStage *)&v3 dealloc];
}

- (void)willMigrateHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setWillMigrateHandler:(void *)willMigrateHandler
{
}

- (void)didMigrateHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

@end