@interface CHManagedCallMigrationPolicy
- (id)addressForManagedCall:(id)a3;
@end

@implementation CHManagedCallMigrationPolicy

- (id)addressForManagedCall:(id)a3
{
  return (id)[a3 address];
}

@end