@interface HKWorkoutZone
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKQuantity)endQuantity;
- (HKQuantity)startQuantity;
- (HKWorkoutZone)initWithCoder:(id)a3;
- (HKWorkoutZone)initWithIdentifier:(id)a3 startQuantity:(id)a4 endQuantity:(id)a5;
- (NSUUID)identifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKWorkoutZone

- (HKWorkoutZone)initWithIdentifier:(id)a3 startQuantity:(id)a4 endQuantity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKWorkoutZone;
  v11 = [(HKWorkoutZone *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSUUID *)v12;

    uint64_t v14 = [v9 copy];
    startQuantity = v11->_startQuantity;
    v11->_startQuantity = (HKQuantity *)v14;

    uint64_t v16 = [v10 copy];
    endQuantity = v11->_endQuantity;
    v11->_endQuantity = (HKQuantity *)v16;
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:%p identifier=%@, startQuantity=%@, endQuantity=%@>", v5, self, self->_identifier, self->_startQuantity, self->_endQuantity];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HKWorkoutZone *)a3;
  if (self == v5)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      identifier = self->_identifier;
      v7 = [(HKWorkoutZone *)v5 identifier];
      if (identifier != v7)
      {
        uint64_t v8 = [(HKWorkoutZone *)v5 identifier];
        if (!v8)
        {
          char v12 = 0;
          goto LABEL_31;
        }
        id v9 = (void *)v8;
        id v10 = self->_identifier;
        v11 = [(HKWorkoutZone *)v5 identifier];
        if (![(NSUUID *)v10 isEqual:v11])
        {
          char v12 = 0;
LABEL_30:

          goto LABEL_31;
        }
        v28 = v9;
        v29 = v11;
      }
      startQuantity = self->_startQuantity;
      uint64_t v14 = [(HKWorkoutZone *)v5 startQuantity];
      if (startQuantity != v14)
      {
        uint64_t v15 = [(HKWorkoutZone *)v5 startQuantity];
        if (!v15)
        {
          char v12 = 0;
          goto LABEL_25;
        }
        v3 = (void *)v15;
        uint64_t v16 = self->_startQuantity;
        v17 = [(HKWorkoutZone *)v5 startQuantity];
        if (![(HKQuantity *)v16 isEqual:v17])
        {

          char v12 = 0;
LABEL_28:
          BOOL v25 = identifier == v7;
          id v9 = v28;
LABEL_29:
          v11 = v29;
          if (!v25) {
            goto LABEL_30;
          }
LABEL_31:

          goto LABEL_32;
        }
        v27 = v17;
      }
      endQuantity = self->_endQuantity;
      uint64_t v19 = [(HKWorkoutZone *)v5 endQuantity];
      char v12 = endQuantity == (HKQuantity *)v19;
      if (endQuantity == (HKQuantity *)v19)
      {
      }
      else
      {
        v20 = (void *)v19;
        uint64_t v21 = [(HKWorkoutZone *)v5 endQuantity];
        if (v21)
        {
          v22 = (void *)v21;
          v23 = self->_endQuantity;
          v24 = [(HKWorkoutZone *)v5 endQuantity];
          char v12 = [(HKQuantity *)v23 isEqual:v24];

          if (startQuantity == v14)
          {

            goto LABEL_28;
          }

          goto LABEL_26;
        }
      }
      if (startQuantity == v14)
      {
LABEL_26:

        goto LABEL_28;
      }

LABEL_25:
      id v9 = v28;

      BOOL v25 = identifier == v7;
      goto LABEL_29;
    }
    char v12 = 0;
  }
LABEL_32:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"Identifier"];
  [v5 encodeObject:self->_startQuantity forKey:@"StartQuantity"];
  [v5 encodeObject:self->_endQuantity forKey:@"EndQuantity"];
}

- (HKWorkoutZone)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StartQuantity"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EndQuantity"];

  uint64_t v8 = [(HKWorkoutZone *)self initWithIdentifier:v5 startQuantity:v6 endQuantity:v7];
  return v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HKQuantity)startQuantity
{
  return self->_startQuantity;
}

- (HKQuantity)endQuantity
{
  return self->_endQuantity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endQuantity, 0);
  objc_storeStrong((id *)&self->_startQuantity, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end