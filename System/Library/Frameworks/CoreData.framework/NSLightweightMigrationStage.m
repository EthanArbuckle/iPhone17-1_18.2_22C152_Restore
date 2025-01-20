@interface NSLightweightMigrationStage
- (NSArray)versionChecksums;
- (NSLightweightMigrationStage)initWithVersionChecksums:(NSArray *)versionChecksums;
- (NSMigrationStage)subsequentStage;
- (void)dealloc;
- (void)setSubsequentStage:(id)a3;
@end

@implementation NSLightweightMigrationStage

- (NSLightweightMigrationStage)initWithVersionChecksums:(NSArray *)versionChecksums
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:"), "count");
  if (v5 != [(NSArray *)versionChecksums count])
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Duplicate version checksums detected." userInfo:0]);
  }
  v8.receiver = self;
  v8.super_class = (Class)NSLightweightMigrationStage;
  v6 = [(NSMigrationStage *)&v8 init];
  if (v6) {
    v6->_versionChecksums = versionChecksums;
  }
  return v6;
}

- (void)dealloc
{
  self->_versionChecksums = 0;
  self->_subsequentStage = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSLightweightMigrationStage;
  [(NSMigrationStage *)&v3 dealloc];
}

- (NSArray)versionChecksums
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSMigrationStage)subsequentStage
{
  return (NSMigrationStage *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSubsequentStage:(id)a3
{
}

@end