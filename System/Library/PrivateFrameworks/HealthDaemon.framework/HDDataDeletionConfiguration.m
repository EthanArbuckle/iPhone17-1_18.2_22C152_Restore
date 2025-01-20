@interface HDDataDeletionConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)failIfNotFound;
- (BOOL)generateDeletedObjects;
- (BOOL)notifyObservers;
- (BOOL)preserveExactStartAndEndDates;
- (BOOL)secureDelete;
- (BOOL)userRequested;
- (Class)entityClass;
- (HDDataDeletionConfiguration)init;
- (HDDataDeletionConfiguration)initWithCoder:(id)a3;
- (NSString)restrictedSourceBundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)recursiveDeleteAuthorizationBlock;
- (void)encodeWithCoder:(id)a3;
- (void)setEntityClass:(Class)a3;
- (void)setFailIfNotFound:(BOOL)a3;
- (void)setGenerateDeletedObjects:(BOOL)a3;
- (void)setNotifyObservers:(BOOL)a3;
- (void)setPreserveExactStartAndEndDates:(BOOL)a3;
- (void)setRecursiveDeleteAuthorizationBlock:(id)a3;
- (void)setRestrictedSourceBundleIdentifier:(id)a3;
- (void)setSecureDelete:(BOOL)a3;
- (void)setUserRequested:(BOOL)a3;
@end

@implementation HDDataDeletionConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDDataDeletionConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)HDDataDeletionConfiguration;
  result = [(HDDataDeletionConfiguration *)&v3 init];
  if (result)
  {
    *(_DWORD *)&result->_generateDeletedObjects = 65793;
    result->_preserveExactStartAndEndDates = 0;
  }
  return result;
}

- (HDDataDeletionConfiguration)initWithCoder:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDDataDeletionConfiguration;
  v6 = [(HDDataDeletionConfiguration *)&v15 init];
  if (v6)
  {
    v6->_generateDeletedObjects = [v5 decodeBoolForKey:@"generate_deleted"];
    v6->_failIfNotFound = [v5 decodeBoolForKey:@"fail_not_found"];
    v6->_notifyObservers = [v5 decodeBoolForKey:@"notify_observers"];
    v6->_secureDelete = [v5 decodeBoolForKey:@"secure_delete"];
    v6->_preserveExactStartAndEndDates = [v5 decodeBoolForKey:@"preserve_dates"];
    uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"source_bundle"];
    restrictedSourceBundleIdentifier = v6->_restrictedSourceBundleIdentifier;
    v6->_restrictedSourceBundleIdentifier = (NSString *)v7;

    v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"entity_class"];
    v10 = v9;
    if (v9)
    {
      uint64_t v11 = NSClassFromString(v9);
      Class entityClass = v6->_entityClass;
      v6->_Class entityClass = (Class)v11;

      if (!v6->_entityClass)
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2, v6, @"HDDataManager.m", 1462, @"Failed to load entity class '%@' when handling deletion configuration entry.", v10 object file lineNumber description];
      }
    }
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeBool:self->_generateDeletedObjects forKey:@"generate_deleted"];
  [v6 encodeBool:self->_failIfNotFound forKey:@"fail_not_found"];
  [v6 encodeBool:self->_notifyObservers forKey:@"notify_observers"];
  [v6 encodeBool:self->_secureDelete forKey:@"secure_delete"];
  [v6 encodeBool:self->_preserveExactStartAndEndDates forKey:@"preserve_dates"];
  [v6 encodeObject:self->_restrictedSourceBundleIdentifier forKey:@"source_bundle"];
  Class entityClass = self->_entityClass;
  if (entityClass)
  {
    id v5 = NSStringFromClass(entityClass);
    [v6 encodeObject:v5 forKey:@"entity_class"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[HDDataDeletionConfiguration allocWithZone:a3] init];
  [(HDDataDeletionConfiguration *)v4 setGenerateDeletedObjects:self->_generateDeletedObjects];
  [(HDDataDeletionConfiguration *)v4 setFailIfNotFound:self->_failIfNotFound];
  [(HDDataDeletionConfiguration *)v4 setNotifyObservers:self->_notifyObservers];
  [(HDDataDeletionConfiguration *)v4 setSecureDelete:self->_secureDelete];
  [(HDDataDeletionConfiguration *)v4 setPreserveExactStartAndEndDates:self->_preserveExactStartAndEndDates];
  [(HDDataDeletionConfiguration *)v4 setEntityClass:self->_entityClass];
  [(HDDataDeletionConfiguration *)v4 setRestrictedSourceBundleIdentifier:self->_restrictedSourceBundleIdentifier];
  return v4;
}

- (BOOL)generateDeletedObjects
{
  return self->_generateDeletedObjects;
}

- (void)setGenerateDeletedObjects:(BOOL)a3
{
  self->_generateDeletedObjects = a3;
}

- (BOOL)failIfNotFound
{
  return self->_failIfNotFound;
}

- (void)setFailIfNotFound:(BOOL)a3
{
  self->_failIfNotFound = a3;
}

- (BOOL)notifyObservers
{
  return self->_notifyObservers;
}

- (void)setNotifyObservers:(BOOL)a3
{
  self->_notifyObservers = a3;
}

- (BOOL)secureDelete
{
  return self->_secureDelete;
}

- (void)setSecureDelete:(BOOL)a3
{
  self->_secureDelete = a3;
}

- (BOOL)preserveExactStartAndEndDates
{
  return self->_preserveExactStartAndEndDates;
}

- (void)setPreserveExactStartAndEndDates:(BOOL)a3
{
  self->_preserveExactStartAndEndDates = a3;
}

- (BOOL)userRequested
{
  return self->_userRequested;
}

- (void)setUserRequested:(BOOL)a3
{
  self->_userRequested = a3;
}

- (id)recursiveDeleteAuthorizationBlock
{
  return self->_recursiveDeleteAuthorizationBlock;
}

- (void)setRecursiveDeleteAuthorizationBlock:(id)a3
{
}

- (NSString)restrictedSourceBundleIdentifier
{
  return self->_restrictedSourceBundleIdentifier;
}

- (void)setRestrictedSourceBundleIdentifier:(id)a3
{
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (void)setEntityClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityClass, 0);
  objc_storeStrong((id *)&self->_restrictedSourceBundleIdentifier, 0);

  objc_storeStrong(&self->_recursiveDeleteAuthorizationBlock, 0);
}

@end