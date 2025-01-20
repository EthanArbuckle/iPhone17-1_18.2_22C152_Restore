@interface INSeat
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INSeat)initWithCoder:(id)a3;
- (INSeat)initWithSeatSection:(NSString *)seatSection seatRow:(NSString *)seatRow seatNumber:(NSString *)seatNumber seatingType:(NSString *)seatingType;
- (NSString)description;
- (NSString)seatNumber;
- (NSString)seatRow;
- (NSString)seatSection;
- (NSString)seatingType;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INSeat

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seatingType, 0);
  objc_storeStrong((id *)&self->_seatNumber, 0);
  objc_storeStrong((id *)&self->_seatRow, 0);

  objc_storeStrong((id *)&self->_seatSection, 0);
}

- (NSString)seatingType
{
  return self->_seatingType;
}

- (NSString)seatNumber
{
  return self->_seatNumber;
}

- (NSString)seatRow
{
  return self->_seatRow;
}

- (NSString)seatSection
{
  return self->_seatSection;
}

- (id)_dictionaryRepresentation
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v13[0] = @"seatSection";
  seatSection = self->_seatSection;
  v4 = seatSection;
  if (!seatSection)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v4;
  v13[1] = @"seatRow";
  seatRow = self->_seatRow;
  v6 = seatRow;
  if (!seatRow)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v6;
  v13[2] = @"seatNumber";
  seatNumber = self->_seatNumber;
  v8 = seatNumber;
  if (!seatNumber)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v8;
  v13[3] = @"seatingType";
  seatingType = self->_seatingType;
  v10 = seatingType;
  if (!seatingType)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  if (seatingType)
  {
    if (seatNumber) {
      goto LABEL_11;
    }
  }
  else
  {

    if (seatNumber)
    {
LABEL_11:
      if (seatRow) {
        goto LABEL_12;
      }
LABEL_18:

      if (seatSection) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!seatRow) {
    goto LABEL_18;
  }
LABEL_12:
  if (seatSection) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:

  return v11;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INSeat;
  v6 = [(INSeat *)&v11 description];
  v7 = [(INSeat *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INSeat *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_seatSection];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"seatSection");

  v9 = [v6 encodeObject:self->_seatRow];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"seatRow");

  v10 = [v6 encodeObject:self->_seatNumber];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"seatNumber");

  objc_super v11 = [v6 encodeObject:self->_seatingType];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"seatingType");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  seatSection = self->_seatSection;
  id v5 = a3;
  [v5 encodeObject:seatSection forKey:@"seatSection"];
  [v5 encodeObject:self->_seatRow forKey:@"seatRow"];
  [v5 encodeObject:self->_seatNumber forKey:@"seatNumber"];
  [v5 encodeObject:self->_seatingType forKey:@"seatingType"];
}

- (INSeat)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"seatSection"];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  objc_super v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"seatRow"];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v16 = [v5 decodeObjectOfClasses:v15 forKey:@"seatNumber"];

  v17 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v20 = [v5 decodeObjectOfClasses:v19 forKey:@"seatingType"];

  v21 = [(INSeat *)self initWithSeatSection:v8 seatRow:v12 seatNumber:v16 seatingType:v20];
  return v21;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INSeat *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      seatSection = self->_seatSection;
      BOOL v10 = 0;
      if (seatSection == v5->_seatSection || -[NSString isEqual:](seatSection, "isEqual:"))
      {
        seatRow = self->_seatRow;
        if (seatRow == v5->_seatRow || -[NSString isEqual:](seatRow, "isEqual:"))
        {
          seatNumber = self->_seatNumber;
          if (seatNumber == v5->_seatNumber || -[NSString isEqual:](seatNumber, "isEqual:"))
          {
            seatingType = self->_seatingType;
            if (seatingType == v5->_seatingType || -[NSString isEqual:](seatingType, "isEqual:")) {
              BOOL v10 = 1;
            }
          }
        }
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_seatSection hash];
  NSUInteger v4 = [(NSString *)self->_seatRow hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_seatNumber hash];
  return v4 ^ v5 ^ [(NSString *)self->_seatingType hash];
}

- (INSeat)initWithSeatSection:(NSString *)seatSection seatRow:(NSString *)seatRow seatNumber:(NSString *)seatNumber seatingType:(NSString *)seatingType
{
  BOOL v10 = seatSection;
  objc_super v11 = seatRow;
  v12 = seatNumber;
  v13 = seatingType;
  v24.receiver = self;
  v24.super_class = (Class)INSeat;
  uint64_t v14 = [(INSeat *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [(NSString *)v10 copy];
    v16 = v14->_seatSection;
    v14->_seatSection = (NSString *)v15;

    uint64_t v17 = [(NSString *)v11 copy];
    uint64_t v18 = v14->_seatRow;
    v14->_seatRow = (NSString *)v17;

    uint64_t v19 = [(NSString *)v12 copy];
    v20 = v14->_seatNumber;
    v14->_seatNumber = (NSString *)v19;

    uint64_t v21 = [(NSString *)v13 copy];
    v22 = v14->_seatingType;
    v14->_seatingType = (NSString *)v21;
  }
  return v14;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 objectForKeyedSubscript:@"seatSection"];
    v8 = [v6 objectForKeyedSubscript:@"seatRow"];
    v9 = [v6 objectForKeyedSubscript:@"seatNumber"];
    BOOL v10 = [v6 objectForKeyedSubscript:@"seatingType"];
    objc_super v11 = (void *)[objc_alloc((Class)a1) initWithSeatSection:v7 seatRow:v8 seatNumber:v9 seatingType:v10];
  }
  else
  {
    objc_super v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end