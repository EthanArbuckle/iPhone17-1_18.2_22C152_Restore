@interface INRentalCar
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INRentalCar)initWithCoder:(id)a3;
- (INRentalCar)initWithRentalCompanyName:(NSString *)rentalCompanyName type:(NSString *)type make:(NSString *)make model:(NSString *)model rentalCarDescription:(NSString *)rentalCarDescription;
- (NSString)description;
- (NSString)make;
- (NSString)model;
- (NSString)rentalCarDescription;
- (NSString)rentalCompanyName;
- (NSString)type;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INRentalCar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rentalCarDescription, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_make, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_rentalCompanyName, 0);
}

- (NSString)rentalCarDescription
{
  return self->_rentalCarDescription;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)make
{
  return self->_make;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)rentalCompanyName
{
  return self->_rentalCompanyName;
}

- (id)_dictionaryRepresentation
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v17 = @"rentalCompanyName";
  rentalCompanyName = self->_rentalCompanyName;
  uint64_t v4 = (uint64_t)rentalCompanyName;
  if (!rentalCompanyName)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v15 = v4;
  v22[0] = v4;
  v18 = @"type";
  type = self->_type;
  v6 = type;
  if (!type)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v4, v17, v18);
  }
  v22[1] = v6;
  v19 = @"make";
  make = self->_make;
  v8 = make;
  if (!make)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v8;
  v20 = @"model";
  model = self->_model;
  v10 = model;
  if (!model)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v10;
  v21 = @"rentalCarDescription";
  rentalCarDescription = self->_rentalCarDescription;
  v12 = rentalCarDescription;
  if (!rentalCarDescription)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v12;
  v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  if (rentalCarDescription)
  {
    if (model) {
      goto LABEL_13;
    }
  }
  else
  {

    if (model)
    {
LABEL_13:
      if (make) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }

  if (make)
  {
LABEL_14:
    if (type) {
      goto LABEL_15;
    }
LABEL_22:

    if (rentalCompanyName) {
      goto LABEL_16;
    }
    goto LABEL_23;
  }
LABEL_21:

  if (!type) {
    goto LABEL_22;
  }
LABEL_15:
  if (rentalCompanyName) {
    goto LABEL_16;
  }
LABEL_23:

LABEL_16:

  return v13;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INRentalCar;
  v6 = [(INRentalCar *)&v11 description];
  v7 = [(INRentalCar *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INRentalCar *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_rentalCompanyName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"rentalCompanyName");

  v9 = [v6 encodeObject:self->_type];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"type");

  v10 = [v6 encodeObject:self->_make];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"make");

  objc_super v11 = [v6 encodeObject:self->_model];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"model");

  v12 = [v6 encodeObject:self->_rentalCarDescription];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"rentalCarDescription");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  rentalCompanyName = self->_rentalCompanyName;
  id v5 = a3;
  [v5 encodeObject:rentalCompanyName forKey:@"rentalCompanyName"];
  [v5 encodeObject:self->_type forKey:@"type"];
  [v5 encodeObject:self->_make forKey:@"make"];
  [v5 encodeObject:self->_model forKey:@"model"];
  [v5 encodeObject:self->_rentalCarDescription forKey:@"rentalCarDescription"];
}

- (INRentalCar)initWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"rentalCompanyName"];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  objc_super v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"type"];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v16 = [v5 decodeObjectOfClasses:v15 forKey:@"make"];

  v17 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v20 = [v5 decodeObjectOfClasses:v19 forKey:@"model"];

  v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v24 = [v5 decodeObjectOfClasses:v23 forKey:@"rentalCarDescription"];

  v25 = [(INRentalCar *)self initWithRentalCompanyName:v8 type:v12 make:v16 model:v20 rentalCarDescription:v24];
  return v25;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (INRentalCar *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      rentalCompanyName = self->_rentalCompanyName;
      BOOL v11 = 0;
      if (rentalCompanyName == v5->_rentalCompanyName
        || -[NSString isEqual:](rentalCompanyName, "isEqual:"))
      {
        type = self->_type;
        if (type == v5->_type || -[NSString isEqual:](type, "isEqual:"))
        {
          make = self->_make;
          if (make == v5->_make || -[NSString isEqual:](make, "isEqual:"))
          {
            model = self->_model;
            if (model == v5->_model || -[NSString isEqual:](model, "isEqual:"))
            {
              rentalCarDescription = self->_rentalCarDescription;
              if (rentalCarDescription == v5->_rentalCarDescription
                || -[NSString isEqual:](rentalCarDescription, "isEqual:"))
              {
                BOOL v11 = 1;
              }
            }
          }
        }
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
  NSUInteger v3 = [(NSString *)self->_rentalCompanyName hash];
  NSUInteger v4 = [(NSString *)self->_type hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_make hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_model hash];
  return v6 ^ [(NSString *)self->_rentalCarDescription hash];
}

- (INRentalCar)initWithRentalCompanyName:(NSString *)rentalCompanyName type:(NSString *)type make:(NSString *)make model:(NSString *)model rentalCarDescription:(NSString *)rentalCarDescription
{
  v12 = rentalCompanyName;
  v13 = type;
  uint64_t v14 = make;
  uint64_t v15 = model;
  v16 = rentalCarDescription;
  v29.receiver = self;
  v29.super_class = (Class)INRentalCar;
  v17 = [(INRentalCar *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [(NSString *)v12 copy];
    v19 = v17->_rentalCompanyName;
    v17->_rentalCompanyName = (NSString *)v18;

    uint64_t v20 = [(NSString *)v13 copy];
    v21 = v17->_type;
    v17->_type = (NSString *)v20;

    uint64_t v22 = [(NSString *)v14 copy];
    v23 = v17->_make;
    v17->_make = (NSString *)v22;

    uint64_t v24 = [(NSString *)v15 copy];
    v25 = v17->_model;
    v17->_model = (NSString *)v24;

    uint64_t v26 = [(NSString *)v16 copy];
    v27 = v17->_rentalCarDescription;
    v17->_rentalCarDescription = (NSString *)v26;
  }
  return v17;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 objectForKeyedSubscript:@"rentalCompanyName"];
    v8 = [v6 objectForKeyedSubscript:@"type"];
    v9 = [v6 objectForKeyedSubscript:@"make"];
    uint64_t v10 = [v6 objectForKeyedSubscript:@"model"];
    BOOL v11 = [v6 objectForKeyedSubscript:@"rentalCarDescription"];
    v12 = (void *)[objc_alloc((Class)a1) initWithRentalCompanyName:v7 type:v8 make:v9 model:v10 rentalCarDescription:v11];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end