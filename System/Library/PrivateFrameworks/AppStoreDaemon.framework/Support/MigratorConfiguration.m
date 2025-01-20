@interface MigratorConfiguration
- (MigratorConfiguration)init;
@end

@implementation MigratorConfiguration

- (MigratorConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)MigratorConfiguration;
  result = [(MigratorConfiguration *)&v3 init];
  if (result) {
    result->_attempts = 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migratorValues, 0);
  objc_storeStrong((id *)&self->_migratorType, 0);
}

@end