@interface HKConceptRelationship
+ (BOOL)supportsSecureCoding;
- (BOOL)isDeleted;
- (BOOL)isEqual:(id)a3;
- (HKConcept)destination;
- (HKConceptRelationship)init;
- (HKConceptRelationship)initWithCoder:(id)a3;
- (HKConceptRelationship)initWithType:(int64_t)a3 destination:(id)a4;
- (HKConceptRelationship)initWithType:(int64_t)a3 destination:(id)a4 version:(int64_t)a5 deleted:(BOOL)a6;
- (HKConceptRelationship)initWithType:(int64_t)a3 destination:(id)a4 weakDestination:(id)a5 version:(int64_t)a6 deleted:(BOOL)a7;
- (HKConceptRelationship)initWithType:(int64_t)a3 weakDestination:(id)a4 version:(int64_t)a5 deleted:(BOOL)a6;
- (NSString)description;
- (int64_t)type;
- (int64_t)version;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKConceptRelationship

- (HKConceptRelationship)initWithType:(int64_t)a3 destination:(id)a4
{
  return [(HKConceptRelationship *)self initWithType:a3 destination:a4 version:0 deleted:0];
}

- (HKConceptRelationship)initWithType:(int64_t)a3 destination:(id)a4 version:(int64_t)a5 deleted:(BOOL)a6
{
  return [(HKConceptRelationship *)self initWithType:a3 destination:a4 weakDestination:0 version:a5 deleted:a6];
}

- (HKConceptRelationship)initWithType:(int64_t)a3 weakDestination:(id)a4 version:(int64_t)a5 deleted:(BOOL)a6
{
  return [(HKConceptRelationship *)self initWithType:a3 destination:0 weakDestination:a4 version:a5 deleted:a6];
}

- (HKConceptRelationship)initWithType:(int64_t)a3 destination:(id)a4 weakDestination:(id)a5 version:(int64_t)a6 deleted:(BOOL)a7
{
  unint64_t v13 = (unint64_t)a4;
  unint64_t v14 = (unint64_t)a5;
  v15 = (void *)v14;
  if (!(v13 | v14))
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HKConceptRelationship.m", 73, @"Invalid parameter not satisfying: %@", @"destination != nil || weakDestination != nil" object file lineNumber description];
LABEL_13:

    goto LABEL_4;
  }
  if (v13 && v14)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HKConceptRelationship.m", 74, @"Invalid parameter not satisfying: %@", @"destination == nil || weakDestination == nil" object file lineNumber description];
    goto LABEL_13;
  }
LABEL_4:
  v22.receiver = self;
  v22.super_class = (Class)HKConceptRelationship;
  v16 = [(HKConceptRelationship *)&v22 init];
  v17 = v16;
  if (v16)
  {
    v16->_type = a3;
    if (v13)
    {
      uint64_t v18 = [(id)v13 copy];
      destination = v17->_destination;
      v17->_destination = (HKConcept *)v18;
    }
    else if (v15)
    {
      objc_storeWeak((id *)&v16->_weakDestination, v15);
    }
    v17->_version = a6;
    v17->_deleted = a7;
  }

  return v17;
}

- (HKConcept)destination
{
  destination = self->_destination;
  if (destination) {
    WeakRetained = destination;
  }
  else {
    WeakRetained = (HKConcept *)objc_loadWeakRetained((id *)&self->_weakDestination);
  }

  return WeakRetained;
}

- (HKConceptRelationship)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKConceptRelationship *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (self->_type == v5->_type)
      {
        v6 = [(HKConceptRelationship *)self destination];
        v7 = [(HKConceptRelationship *)v5 destination];
        if (v6 == v7)
        {
          BOOL v11 = self->_version == v5->_version && self->_deleted == v5->_deleted;
        }
        else
        {
          v8 = [(HKConceptRelationship *)v5 destination];
          if (v8)
          {
            v9 = [(HKConceptRelationship *)self destination];
            v10 = [(HKConceptRelationship *)v5 destination];
            BOOL v11 = [v9 isEqual:v10]
               && self->_version == v5->_version
               && self->_deleted == v5->_deleted;
          }
          else
          {
            BOOL v11 = 0;
          }
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  int64_t type = self->_type;
  uint64_t v4 = [(HKConceptRelationship *)self destination];
  unint64_t v5 = [v4 hash] ^ type ^ self->_version ^ self->_deleted;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeInteger:self->_type forKey:@"Type"];
  destination = self->_destination;
  if (destination)
  {
    [v7 encodeObject:destination forKey:@"Destination"];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_weakDestination);

    if (WeakRetained)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_weakDestination);
      [v7 encodeObject:v6 forKey:@"WeakDestination"];
    }
  }
  [v7 encodeInt64:self->_version forKey:@"Version"];
  [v7 encodeBool:self->_deleted forKey:@"Deleted"];
}

- (HKConceptRelationship)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKConceptRelationship;
  unint64_t v5 = [(HKConceptRelationship *)&v10 init];
  if (v5)
  {
    v5->_int64_t type = [v4 decodeIntegerForKey:@"Type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Destination"];
    destination = v5->_destination;
    v5->_destination = (HKConcept *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WeakDestination"];
    objc_storeWeak((id *)&v5->_weakDestination, v8);

    v5->_version = [v4 decodeInt64ForKey:@"Version"];
    v5->_deleted = [v4 decodeBoolForKey:@"Deleted"];
  }

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  int64_t type = self->_type;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakDestination);
  if (WeakRetained) {
    uint64_t v6 = @"Weak ";
  }
  else {
    uint64_t v6 = &stru_1EEC60288;
  }
  id v7 = [(HKConceptRelationship *)self destination];
  v8 = [v7 identifier];
  uint64_t v9 = [v8 rawIdentifier];
  int64_t version = self->_version;
  BOOL v11 = HKStringFromBool(self->_deleted);
  v12 = [v3 stringWithFormat:@"Concept Relationship: Type: %lld, %@Destination ID: %lld, Version: %lld, Deleted: %@", type, v6, v9, version, v11];

  return (NSString *)v12;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);

  objc_destroyWeak((id *)&self->_weakDestination);
}

@end