@interface HDSQLiteEntityForeignKey
- (BOOL)isDeferred;
- (Class)entityClass;
- (HDSQLiteEntityForeignKey)initWithEntityClass:(Class)a3 property:(id)a4 deletionAction:(int64_t)a5;
- (HDSQLiteEntityForeignKey)initWithEntityClass:(Class)a3 property:(id)a4 deletionAction:(int64_t)a5 isDeferred:(BOOL)a6;
- (NSString)property;
- (id)creationSQL;
- (int64_t)deletionAction;
@end

@implementation HDSQLiteEntityForeignKey

- (HDSQLiteEntityForeignKey)initWithEntityClass:(Class)a3 property:(id)a4 deletionAction:(int64_t)a5 isDeferred:(BOOL)a6
{
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDSQLiteEntityForeignKey;
  v11 = [(HDSQLiteEntityForeignKey *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entityClass, a3);
    uint64_t v13 = [v10 copy];
    property = v12->_property;
    v12->_property = (NSString *)v13;

    v12->_deletionAction = a5;
    v12->_isDeferred = a6;
  }

  return v12;
}

- (HDSQLiteEntityForeignKey)initWithEntityClass:(Class)a3 property:(id)a4 deletionAction:(int64_t)a5
{
  return [(HDSQLiteEntityForeignKey *)self initWithEntityClass:a3 property:a4 deletionAction:a5 isDeferred:0];
}

- (id)creationSQL
{
  v3 = NSString;
  v4 = [(objc_class *)self->_entityClass databaseTable];
  property = self->_property;
  uint64_t v6 = HDSQLForForeignKeyDeletionAction(self->_deletionAction);
  v7 = (void *)v6;
  if (self->_isDeferred) {
    v8 = @" DEFERRABLE INITIALLY DEFERRED";
  }
  else {
    v8 = &stru_26CC1AE10;
  }
  v9 = [v3 stringWithFormat:@"REFERENCES %@ (%@) ON DELETE %@%@", v4, property, v6, v8];

  return v9;
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (NSString)property
{
  return self->_property;
}

- (int64_t)deletionAction
{
  return self->_deletionAction;
}

- (BOOL)isDeferred
{
  return self->_isDeferred;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_property, 0);

  objc_storeStrong((id *)&self->_entityClass, 0);
}

@end