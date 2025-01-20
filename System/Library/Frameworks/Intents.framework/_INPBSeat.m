@interface _INPBSeat
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSeatNumber;
- (BOOL)hasSeatRow;
- (BOOL)hasSeatSection;
- (BOOL)hasSeatingType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)seatNumber;
- (NSString)seatRow;
- (NSString)seatSection;
- (NSString)seatingType;
- (_INPBSeat)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSeatNumber:(id)a3;
- (void)setSeatRow:(id)a3;
- (void)setSeatSection:(id)a3;
- (void)setSeatingType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSeat

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seatingType, 0);
  objc_storeStrong((id *)&self->_seatSection, 0);
  objc_storeStrong((id *)&self->_seatRow, 0);

  objc_storeStrong((id *)&self->_seatNumber, 0);
}

- (NSString)seatingType
{
  return self->_seatingType;
}

- (NSString)seatSection
{
  return self->_seatSection;
}

- (NSString)seatRow
{
  return self->_seatRow;
}

- (NSString)seatNumber
{
  return self->_seatNumber;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_seatNumber)
  {
    v4 = [(_INPBSeat *)self seatNumber];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"seatNumber"];
  }
  if (self->_seatRow)
  {
    v6 = [(_INPBSeat *)self seatRow];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"seatRow"];
  }
  if (self->_seatSection)
  {
    v8 = [(_INPBSeat *)self seatSection];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"seatSection"];
  }
  if (self->_seatingType)
  {
    v10 = [(_INPBSeat *)self seatingType];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"seatingType"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_seatNumber hash];
  NSUInteger v4 = [(NSString *)self->_seatRow hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_seatSection hash];
  return v4 ^ v5 ^ [(NSString *)self->_seatingType hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  NSUInteger v5 = [(_INPBSeat *)self seatNumber];
  v6 = [v4 seatNumber];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_INPBSeat *)self seatNumber];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBSeat *)self seatNumber];
    v10 = [v4 seatNumber];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBSeat *)self seatRow];
  v6 = [v4 seatRow];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_INPBSeat *)self seatRow];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSeat *)self seatRow];
    v15 = [v4 seatRow];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBSeat *)self seatSection];
  v6 = [v4 seatSection];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_INPBSeat *)self seatSection];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBSeat *)self seatSection];
    v20 = [v4 seatSection];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBSeat *)self seatingType];
  v6 = [v4 seatingType];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_INPBSeat *)self seatingType];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(_INPBSeat *)self seatingType];
    v25 = [v4 seatingType];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[_INPBSeat allocWithZone:](_INPBSeat, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_seatNumber copyWithZone:a3];
  [(_INPBSeat *)v5 setSeatNumber:v6];

  uint64_t v7 = (void *)[(NSString *)self->_seatRow copyWithZone:a3];
  [(_INPBSeat *)v5 setSeatRow:v7];

  v8 = (void *)[(NSString *)self->_seatSection copyWithZone:a3];
  [(_INPBSeat *)v5 setSeatSection:v8];

  v9 = (void *)[(NSString *)self->_seatingType copyWithZone:a3];
  [(_INPBSeat *)v5 setSeatingType:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSeat *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSeat)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSeat *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSeat *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSeat *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(_INPBSeat *)self seatNumber];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(_INPBSeat *)self seatRow];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  id v6 = [(_INPBSeat *)self seatSection];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(_INPBSeat *)self seatingType];

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSeatReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasSeatingType
{
  return self->_seatingType != 0;
}

- (void)setSeatingType:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  seatingType = self->_seatingType;
  self->_seatingType = v4;

  MEMORY[0x1F41817F8](v4, seatingType);
}

- (BOOL)hasSeatSection
{
  return self->_seatSection != 0;
}

- (void)setSeatSection:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  seatSection = self->_seatSection;
  self->_seatSection = v4;

  MEMORY[0x1F41817F8](v4, seatSection);
}

- (BOOL)hasSeatRow
{
  return self->_seatRow != 0;
}

- (void)setSeatRow:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  seatRow = self->_seatRow;
  self->_seatRow = v4;

  MEMORY[0x1F41817F8](v4, seatRow);
}

- (BOOL)hasSeatNumber
{
  return self->_seatNumber != 0;
}

- (void)setSeatNumber:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  seatNumber = self->_seatNumber;
  self->_seatNumber = v4;

  MEMORY[0x1F41817F8](v4, seatNumber);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end