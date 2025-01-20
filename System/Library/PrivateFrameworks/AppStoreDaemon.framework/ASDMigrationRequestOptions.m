@interface ASDMigrationRequestOptions
+ (BOOL)supportsSecureCoding;
- (ASDMigrationRequestOptions)initWithCoder:(id)a3;
- (ASDMigrationRequestOptions)initWithMigrationType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)migrationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDMigrationRequestOptions

- (ASDMigrationRequestOptions)initWithMigrationType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASDMigrationRequestOptions;
  result = [(ASDMigrationRequestOptions *)&v5 init];
  if (result) {
    result->_migrationType = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[ASDMigrationRequestOptions allocWithZone:a3] init];
  *((void *)result + 1) = self->_migrationType;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDMigrationRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ASDMigrationRequestOptions;
  objc_super v5 = [(ASDRequestOptions *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_migrationType = [v4 decodeIntegerForKey:@"migrationType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)migrationType
{
  return self->_migrationType;
}

@end