@interface HKRelationshipConceptSelection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKConceptSelection)selection;
- (HKRelationshipConceptSelection)init;
- (HKRelationshipConceptSelection)initWithCoder:(id)a3;
- (HKRelationshipConceptSelection)initWithDirection:(unint64_t)a3 type:(int64_t)a4 selection:(id)a5;
- (id)description;
- (int64_t)type;
- (unint64_t)direction;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKRelationshipConceptSelection

- (HKRelationshipConceptSelection)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKRelationshipConceptSelection)initWithDirection:(unint64_t)a3 type:(int64_t)a4 selection:(id)a5
{
  id v9 = a5;
  if (!v9)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HKRelationshipConceptSelection.m", 21, @"Invalid parameter not satisfying: %@", @"selection" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)HKRelationshipConceptSelection;
  v10 = [(HKConceptSelection *)&v16 init];
  v11 = v10;
  if (v10)
  {
    v10->_direction = a3;
    v10->_type = a4;
    uint64_t v12 = [v9 copy];
    selection = v11->_selection;
    v11->_selection = (HKConceptSelection *)v12;
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_direction == 1) {
    v5 = @"objects";
  }
  else {
    v5 = @"subjects";
  }
  return (id)[v3 stringWithFormat:@"<%@: %lld with %@ matching %@>", v4, self->_type, v5, self->_selection];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKRelationshipConceptSelection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"DirectionKey"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"TypeKey"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SelectionKey"];

  if (v7)
  {
    self = [(HKRelationshipConceptSelection *)self initWithDirection:v5 type:v6 selection:v7];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t direction = self->_direction;
  id v5 = a3;
  [v5 encodeInteger:direction forKey:@"DirectionKey"];
  [v5 encodeInt64:self->_type forKey:@"TypeKey"];
  [v5 encodeObject:self->_selection forKey:@"SelectionKey"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKRelationshipConceptSelection;
  if ([(HKConceptSelection *)&v18 isEqual:v4])
  {
    id v5 = v4;
    unint64_t v6 = [(HKRelationshipConceptSelection *)self direction];
    if (v6 != [v5 direction]) {
      goto LABEL_12;
    }
    int64_t v7 = [(HKRelationshipConceptSelection *)self type];
    if (v7 != [v5 type]) {
      goto LABEL_12;
    }
    v8 = [(HKRelationshipConceptSelection *)self selection];
    uint64_t v9 = [v5 selection];
    if (v8 == (void *)v9)
    {
    }
    else
    {
      v10 = (void *)v9;
      uint64_t v11 = [v5 selection];
      if (!v11)
      {

LABEL_12:
        BOOL v16 = 0;
        goto LABEL_13;
      }
      uint64_t v12 = (void *)v11;
      v13 = [(HKRelationshipConceptSelection *)self selection];
      v14 = [v5 selection];
      char v15 = [v13 isEqual:v14];

      if ((v15 & 1) == 0) {
        goto LABEL_12;
      }
    }
    BOOL v16 = 1;
LABEL_13:

    goto LABEL_14;
  }
  BOOL v16 = 0;
LABEL_14:

  return v16;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (int64_t)type
{
  return self->_type;
}

- (HKConceptSelection)selection
{
  return self->_selection;
}

- (void).cxx_destruct
{
}

@end