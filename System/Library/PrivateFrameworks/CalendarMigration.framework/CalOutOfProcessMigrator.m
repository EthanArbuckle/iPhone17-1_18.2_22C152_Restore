@interface CalOutOfProcessMigrator
+ (BOOL)performMigrationIfNeeded;
@end

@implementation CalOutOfProcessMigrator

+ (BOOL)performMigrationIfNeeded
{
  return MEMORY[0x270EEB680](a1, a2);
}

@end