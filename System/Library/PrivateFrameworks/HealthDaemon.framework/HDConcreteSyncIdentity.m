@interface HDConcreteSyncIdentity
+ (id)new;
- (BOOL)isChild;
- (BOOL)isEqual:(id)a3;
- (HDConcreteSyncIdentity)init;
- (HDSyncIdentity)identity;
- (HDSyncIdentityEntity)entity;
- (id)description;
- (id)initWithIdentity:(void *)a3 entity:(char)a4 isChild:;
- (unint64_t)hash;
@end

@implementation HDConcreteSyncIdentity

- (id)initWithIdentity:(void *)a3 entity:(char)a4 isChild:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)HDConcreteSyncIdentity;
    a1 = objc_msgSendSuper2(&v14, sel_init);
    if (a1)
    {
      uint64_t v9 = [v7 copy];
      v10 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v9;

      uint64_t v11 = [v8 copy];
      v12 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = v11;

      *((unsigned char *)a1 + 8) = a4;
    }
  }

  return a1;
}

- (HDConcreteSyncIdentity)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (id)new
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"The -%@ method is not available on %@", v4, objc_opt_class() format];

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(HDSyncIdentity *)self->_identity isEqual:v4[2]]
    && [(HDSQLiteEntity *)self->_entity isEqual:v4[3]];

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HDSyncIdentity *)self->_identity hash];
  return [(HDSQLiteEntity *)self->_entity hash] ^ v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ [%lld] %@>", v5, -[HDSQLiteEntity persistentID](self->_entity, "persistentID"), self->_identity];

  return v6;
}

- (HDSyncIdentity)identity
{
  return self->_identity;
}

- (HDSyncIdentityEntity)entity
{
  return self->_entity;
}

- (BOOL)isChild
{
  return self->_isChild;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);

  objc_storeStrong((id *)&self->_identity, 0);
}

@end