@interface INFileProperty
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INDateComponentsRange)dateComponentsRange;
- (INFileProperty)initWithCoder:(id)a3;
- (INFileProperty)initWithName:(id)a3 qualifier:(id)a4 type:(id)a5 dateComponentsRange:(id)a6 person:(id)a7 value:(id)a8 quantity:(id)a9;
- (INPerson)person;
- (NSNumber)quantity;
- (NSString)description;
- (NSString)name;
- (NSString)qualifier;
- (NSString)type;
- (NSString)value;
- (id)_dictionaryRepresentation;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INFileProperty

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantity, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_dateComponentsRange, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_qualifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSNumber)quantity
{
  return self->_quantity;
}

- (NSString)value
{
  return self->_value;
}

- (INPerson)person
{
  return self->_person;
}

- (INDateComponentsRange)dateComponentsRange
{
  return self->_dateComponentsRange;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)qualifier
{
  return self->_qualifier;
}

- (NSString)name
{
  return self->_name;
}

- (id)_dictionaryRepresentation
{
  v24[7] = *MEMORY[0x1E4F143B8];
  uint64_t name = (uint64_t)self->_name;
  uint64_t v22 = name;
  v23[0] = @"name";
  if (!name)
  {
    uint64_t name = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)name;
  v24[0] = name;
  v23[1] = @"qualifier";
  qualifier = self->_qualifier;
  uint64_t v5 = (uint64_t)qualifier;
  if (!qualifier)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v5;
  v24[1] = v5;
  v23[2] = @"type";
  type = self->_type;
  uint64_t v7 = (uint64_t)type;
  if (!type)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v7;
  v24[2] = v7;
  v23[3] = @"dateComponentsRange";
  dateComponentsRange = self->_dateComponentsRange;
  uint64_t v9 = (uint64_t)dateComponentsRange;
  if (!dateComponentsRange)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v18 = (void *)v9;
  v24[3] = v9;
  v23[4] = @"person";
  person = self->_person;
  v11 = person;
  if (!person)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[4] = v11;
  v23[5] = @"value";
  value = self->_value;
  v13 = value;
  if (!value)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[5] = v13;
  v23[6] = @"quantity";
  quantity = self->_quantity;
  v15 = quantity;
  if (!quantity)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[6] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:7];
  if (quantity)
  {
    if (value) {
      goto LABEL_17;
    }
  }
  else
  {

    if (value)
    {
LABEL_17:
      if (person) {
        goto LABEL_18;
      }
      goto LABEL_28;
    }
  }

  if (person)
  {
LABEL_18:
    if (dateComponentsRange) {
      goto LABEL_19;
    }
    goto LABEL_29;
  }
LABEL_28:

  if (dateComponentsRange)
  {
LABEL_19:
    if (type) {
      goto LABEL_20;
    }
LABEL_30:

    if (qualifier) {
      goto LABEL_21;
    }
    goto LABEL_31;
  }
LABEL_29:

  if (!type) {
    goto LABEL_30;
  }
LABEL_20:
  if (qualifier) {
    goto LABEL_21;
  }
LABEL_31:

LABEL_21:
  if (!v22) {

  }
  return v16;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  uint64_t v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INFileProperty;
  v6 = [(INFileProperty *)&v11 description];
  uint64_t v7 = [(INFileProperty *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INFileProperty *)self descriptionAtIndent:0];
}

- (INFileProperty)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"qualifier"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateComponentsRange"];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"person"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
  objc_super v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"quantity"];

  v12 = [(INFileProperty *)self initWithName:v5 qualifier:v6 type:v7 dateComponentsRange:v8 person:v9 value:v10 quantity:v11];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_qualifier forKey:@"qualifier"];
  [v5 encodeObject:self->_type forKey:@"type"];
  [v5 encodeObject:self->_dateComponentsRange forKey:@"dateComponentsRange"];
  [v5 encodeObject:self->_person forKey:@"person"];
  [v5 encodeObject:self->_value forKey:@"value"];
  [v5 encodeObject:self->_quantity forKey:@"quantity"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t name = self->_name;
    BOOL v13 = 0;
    if (name == (NSString *)v5[1] || -[NSString isEqual:](name, "isEqual:"))
    {
      qualifier = self->_qualifier;
      if (qualifier == (NSString *)v5[2] || -[NSString isEqual:](qualifier, "isEqual:"))
      {
        type = self->_type;
        if (type == (NSString *)v5[3] || -[NSString isEqual:](type, "isEqual:"))
        {
          dateComponentsRange = self->_dateComponentsRange;
          if (dateComponentsRange == (INDateComponentsRange *)v5[4]
            || -[INDateComponentsRange isEqual:](dateComponentsRange, "isEqual:"))
          {
            person = self->_person;
            if (person == (INPerson *)v5[5] || -[INPerson isEqual:](person, "isEqual:"))
            {
              value = self->_value;
              if (value == (NSString *)v5[6] || -[NSString isEqual:](value, "isEqual:"))
              {
                quantity = self->_quantity;
                if (quantity == (NSNumber *)v5[7] || -[NSNumber isEqual:](quantity, "isEqual:")) {
                  BOOL v13 = 1;
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_qualifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_type hash];
  unint64_t v6 = v4 ^ v5 ^ [(INDateComponentsRange *)self->_dateComponentsRange hash];
  unint64_t v7 = [(INPerson *)self->_person hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_value hash];
  return v6 ^ v8 ^ [(NSNumber *)self->_quantity hash];
}

- (INFileProperty)initWithName:(id)a3 qualifier:(id)a4 type:(id)a5 dateComponentsRange:(id)a6 person:(id)a7 value:(id)a8 quantity:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)INFileProperty;
  uint64_t v22 = [(INFileProperty *)&v38 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    uint64_t name = v22->_name;
    v22->_uint64_t name = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    qualifier = v22->_qualifier;
    v22->_qualifier = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    type = v22->_type;
    v22->_type = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    dateComponentsRange = v22->_dateComponentsRange;
    v22->_dateComponentsRange = (INDateComponentsRange *)v29;

    uint64_t v31 = [v19 copy];
    person = v22->_person;
    v22->_person = (INPerson *)v31;

    uint64_t v33 = [v20 copy];
    value = v22->_value;
    v22->_value = (NSString *)v33;

    uint64_t v35 = [v21 copy];
    quantity = v22->_quantity;
    v22->_quantity = (NSNumber *)v35;
  }
  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end