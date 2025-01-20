@interface _INPBRentalCar
+ (BOOL)supportsSecureCoding;
- (BOOL)hasMake;
- (BOOL)hasModel;
- (BOOL)hasRentalCarDescription;
- (BOOL)hasRentalCompanyName;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)make;
- (NSString)model;
- (NSString)rentalCarDescription;
- (NSString)rentalCompanyName;
- (NSString)type;
- (_INPBRentalCar)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMake:(id)a3;
- (void)setModel:(id)a3;
- (void)setRentalCarDescription:(id)a3;
- (void)setRentalCompanyName:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBRentalCar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_rentalCompanyName, 0);
  objc_storeStrong((id *)&self->_rentalCarDescription, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_make, 0);
}

- (NSString)type
{
  return self->_type;
}

- (NSString)rentalCompanyName
{
  return self->_rentalCompanyName;
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

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_make)
  {
    v4 = [(_INPBRentalCar *)self make];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"make"];
  }
  if (self->_model)
  {
    v6 = [(_INPBRentalCar *)self model];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"model"];
  }
  if (self->_rentalCarDescription)
  {
    v8 = [(_INPBRentalCar *)self rentalCarDescription];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"rentalCarDescription"];
  }
  if (self->_rentalCompanyName)
  {
    v10 = [(_INPBRentalCar *)self rentalCompanyName];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"rentalCompanyName"];
  }
  if (self->_type)
  {
    v12 = [(_INPBRentalCar *)self type];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"type"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_make hash];
  NSUInteger v4 = [(NSString *)self->_model hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_rentalCarDescription hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_rentalCompanyName hash];
  return v6 ^ [(NSString *)self->_type hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  NSUInteger v5 = [(_INPBRentalCar *)self make];
  NSUInteger v6 = [v4 make];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(_INPBRentalCar *)self make];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBRentalCar *)self make];
    v10 = [v4 make];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBRentalCar *)self model];
  NSUInteger v6 = [v4 model];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(_INPBRentalCar *)self model];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBRentalCar *)self model];
    v15 = [v4 model];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBRentalCar *)self rentalCarDescription];
  NSUInteger v6 = [v4 rentalCarDescription];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(_INPBRentalCar *)self rentalCarDescription];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBRentalCar *)self rentalCarDescription];
    v20 = [v4 rentalCarDescription];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBRentalCar *)self rentalCompanyName];
  NSUInteger v6 = [v4 rentalCompanyName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(_INPBRentalCar *)self rentalCompanyName];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBRentalCar *)self rentalCompanyName];
    v25 = [v4 rentalCompanyName];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBRentalCar *)self type];
  NSUInteger v6 = [v4 type];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(_INPBRentalCar *)self type];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(_INPBRentalCar *)self type];
    v30 = [v4 type];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[_INPBRentalCar allocWithZone:](_INPBRentalCar, "allocWithZone:") init];
  NSUInteger v6 = (void *)[(NSString *)self->_make copyWithZone:a3];
  [(_INPBRentalCar *)v5 setMake:v6];

  uint64_t v7 = (void *)[(NSString *)self->_model copyWithZone:a3];
  [(_INPBRentalCar *)v5 setModel:v7];

  v8 = (void *)[(NSString *)self->_rentalCarDescription copyWithZone:a3];
  [(_INPBRentalCar *)v5 setRentalCarDescription:v8];

  v9 = (void *)[(NSString *)self->_rentalCompanyName copyWithZone:a3];
  [(_INPBRentalCar *)v5 setRentalCompanyName:v9];

  v10 = (void *)[(NSString *)self->_type copyWithZone:a3];
  [(_INPBRentalCar *)v5 setType:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBRentalCar *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBRentalCar)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBRentalCar *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBRentalCar *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBRentalCar *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(_INPBRentalCar *)self make];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(_INPBRentalCar *)self model];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  id v6 = [(_INPBRentalCar *)self rentalCarDescription];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(_INPBRentalCar *)self rentalCompanyName];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  v8 = [(_INPBRentalCar *)self type];

  v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    v9 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRentalCarReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (void)setType:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  type = self->_type;
  self->_type = v4;

  MEMORY[0x1F41817F8](v4, type);
}

- (BOOL)hasRentalCompanyName
{
  return self->_rentalCompanyName != 0;
}

- (void)setRentalCompanyName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  rentalCompanyName = self->_rentalCompanyName;
  self->_rentalCompanyName = v4;

  MEMORY[0x1F41817F8](v4, rentalCompanyName);
}

- (BOOL)hasRentalCarDescription
{
  return self->_rentalCarDescription != 0;
}

- (void)setRentalCarDescription:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  rentalCarDescription = self->_rentalCarDescription;
  self->_rentalCarDescription = v4;

  MEMORY[0x1F41817F8](v4, rentalCarDescription);
}

- (BOOL)hasModel
{
  return self->_model != 0;
}

- (void)setModel:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  model = self->_model;
  self->_model = v4;

  MEMORY[0x1F41817F8](v4, model);
}

- (BOOL)hasMake
{
  return self->_make != 0;
}

- (void)setMake:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  make = self->_make;
  self->_make = v4;

  MEMORY[0x1F41817F8](v4, make);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end