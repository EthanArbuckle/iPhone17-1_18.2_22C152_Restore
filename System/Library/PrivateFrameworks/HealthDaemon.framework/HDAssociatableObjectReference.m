@interface HDAssociatableObjectReference
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (Class)objectClass;
- (HDAssociatableObjectReference)initWithCoder:(id)a3;
- (HDAssociatableObjectReference)initWithUUID:(id)a3 objectClass:(Class)a4;
- (NSUUID)UUID;
- (id)persistentIDInTransaction:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDAssociatableObjectReference

- (HDAssociatableObjectReference)initWithUUID:(id)a3 objectClass:(Class)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDAssociatableObjectReference;
  v7 = [(HDAssociatableObjectReference *)&v15 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    UUID = v7->_UUID;
    v7->_UUID = (NSUUID *)v8;

    objc_storeStrong((id *)&v7->_objectClass, a4);
    if (([(objc_class *)v7->_objectClass isEqual:objc_opt_class()] & 1) == 0)
    {
      _HKInitializeLogging();
      v10 = (void *)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
      {
        objectClass = v7->_objectClass;
        v13 = v10;
        v14 = NSStringFromClass(objectClass);
        *(_DWORD *)buf = 138543362;
        v17 = v14;
        _os_log_fault_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_FAULT, "Attempting to create associatable object for invalid class %{public}@", buf, 0xCu);
      }
    }
  }

  return v7;
}

- (id)persistentIDInTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(objc_class *)self->_objectClass isEqual:objc_opt_class()]
    && (+[HDWorkoutActivityEntity activityEntityWithUUID:self->_UUID transaction:v6 error:a4], (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v8 = v7;
    v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "persistentID"));
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  v5 = (NSUUID *)v4[1];
  UUID = self->_UUID;
  if (v5 != UUID && (!UUID || !-[NSUUID isEqual:](v5, "isEqual:"))) {
    goto LABEL_8;
  }
  Class v7 = (Class)v4[2];
  Class objectClass = self->_objectClass;
  if (v7 == objectClass)
  {
    char v9 = 1;
    goto LABEL_9;
  }
  if (objectClass) {
    char v9 = -[objc_class isEqual:](v7, "isEqual:");
  }
  else {
LABEL_8:
  }
    char v9 = 0;
LABEL_9:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDAssociatableObjectReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"class"];

  uint64_t v7 = (uint64_t)NSClassFromString(v6);
  if (!v7) {
    uint64_t v7 = objc_opt_class();
  }
  uint64_t v8 = [(HDAssociatableObjectReference *)self initWithUUID:v5 objectClass:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  [v5 encodeObject:UUID forKey:@"UUID"];
  NSStringFromClass(self->_objectClass);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"class"];
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (Class)objectClass
{
  return self->_objectClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectClass, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end