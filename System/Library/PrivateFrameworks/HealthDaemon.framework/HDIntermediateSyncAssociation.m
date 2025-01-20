@interface HDIntermediateSyncAssociation
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)deleted;
- (HDIntermediateSyncAssociation)init;
- (HDIntermediateSyncAssociation)initWithAssociationUUID:(id)a3 type:(unint64_t)a4 creationDate:(id)a5 deleted:(BOOL)a6 destinationSubObjectUUID:(id)a7;
- (HDIntermediateSyncAssociation)initWithCoder:(id)a3;
- (NSDate)creationDate;
- (NSUUID)associationUUID;
- (NSUUID)destinationSubObjectUUID;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDIntermediateSyncAssociation

- (HDIntermediateSyncAssociation)init
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

- (HDIntermediateSyncAssociation)initWithAssociationUUID:(id)a3 type:(unint64_t)a4 creationDate:(id)a5 deleted:(BOOL)a6 destinationSubObjectUUID:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HDIntermediateSyncAssociation;
  v15 = [(HDIntermediateSyncAssociation *)&v23 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    associationUUID = v15->_associationUUID;
    v15->_associationUUID = (NSUUID *)v16;

    v15->_type = a4;
    v15->_deleted = a6;
    uint64_t v18 = [v13 copy];
    creationDate = v15->_creationDate;
    v15->_creationDate = (NSDate *)v18;

    uint64_t v20 = [v14 copy];
    destinationSubObjectUUID = v15->_destinationSubObjectUUID;
    v15->_destinationSubObjectUUID = (NSUUID *)v20;
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  associationUUID = self->_associationUUID;
  id v5 = a3;
  [v5 encodeObject:associationUUID forKey:@"UUID"];
  [v5 encodeObject:self->_creationDate forKey:@"CreationDate"];
  [v5 encodeInteger:self->_type forKey:@"Type"];
  [v5 encodeBool:self->_deleted forKey:@"Deleted"];
  [v5 encodeObject:self->_destinationSubObjectUUID forKey:@"SubObjectUUID"];
}

- (HDIntermediateSyncAssociation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CreationDate"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"Type"];
  uint64_t v8 = [v4 decodeBoolForKey:@"Deleted"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SubObjectUUID"];

  v10 = [(HDIntermediateSyncAssociation *)self initWithAssociationUUID:v5 type:v7 creationDate:v6 deleted:v8 destinationSubObjectUUID:v9];
  return v10;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSUUID)destinationSubObjectUUID
{
  return self->_destinationSubObjectUUID;
}

- (NSUUID)associationUUID
{
  return self->_associationUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associationUUID, 0);
  objc_storeStrong((id *)&self->_destinationSubObjectUUID, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end