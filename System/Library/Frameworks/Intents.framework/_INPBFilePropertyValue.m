@interface _INPBFilePropertyValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDateTime;
- (BOOL)hasFileType;
- (BOOL)hasPerson;
- (BOOL)hasQuantity;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBContact)person;
- (_INPBDateTimeRange)dateTime;
- (_INPBFilePropertyValue)initWithCoder:(id)a3;
- (_INPBLong)quantity;
- (_INPBString)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)fileTypeAsString:(int)a3;
- (int)StringAsFileType:(id)a3;
- (int)fileType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDateTime:(id)a3;
- (void)setFileType:(int)a3;
- (void)setHasFileType:(BOOL)a3;
- (void)setPerson:(id)a3;
- (void)setQuantity:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBFilePropertyValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_quantity, 0);
  objc_storeStrong((id *)&self->_person, 0);

  objc_storeStrong((id *)&self->_dateTime, 0);
}

- (_INPBString)value
{
  return self->_value;
}

- (_INPBLong)quantity
{
  return self->_quantity;
}

- (_INPBContact)person
{
  return self->_person;
}

- (int)fileType
{
  return self->_fileType;
}

- (_INPBDateTimeRange)dateTime
{
  return self->_dateTime;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBFilePropertyValue *)self dateTime];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"dateTime"];

  if ([(_INPBFilePropertyValue *)self hasFileType])
  {
    uint64_t v6 = [(_INPBFilePropertyValue *)self fileType];
    if (v6 >= 0xB)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E55179B0[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"fileType"];
  }
  v8 = [(_INPBFilePropertyValue *)self person];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"person"];

  v10 = [(_INPBFilePropertyValue *)self quantity];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"quantity"];

  v12 = [(_INPBFilePropertyValue *)self value];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"value"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBDateTimeRange *)self->_dateTime hash];
  if ([(_INPBFilePropertyValue *)self hasFileType]) {
    uint64_t v4 = 2654435761 * self->_fileType;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  unint64_t v6 = [(_INPBContact *)self->_person hash];
  unint64_t v7 = v5 ^ v6 ^ [(_INPBLong *)self->_quantity hash];
  return v7 ^ [(_INPBString *)self->_value hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  unint64_t v5 = [(_INPBFilePropertyValue *)self dateTime];
  unint64_t v6 = [v4 dateTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_25;
  }
  uint64_t v7 = [(_INPBFilePropertyValue *)self dateTime];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBFilePropertyValue *)self dateTime];
    v10 = [v4 dateTime];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  int v12 = [(_INPBFilePropertyValue *)self hasFileType];
  if (v12 != [v4 hasFileType]) {
    goto LABEL_26;
  }
  if ([(_INPBFilePropertyValue *)self hasFileType])
  {
    if ([v4 hasFileType])
    {
      int fileType = self->_fileType;
      if (fileType != [v4 fileType]) {
        goto LABEL_26;
      }
    }
  }
  unint64_t v5 = [(_INPBFilePropertyValue *)self person];
  unint64_t v6 = [v4 person];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_25;
  }
  uint64_t v14 = [(_INPBFilePropertyValue *)self person];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBFilePropertyValue *)self person];
    v17 = [v4 person];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBFilePropertyValue *)self quantity];
  unint64_t v6 = [v4 quantity];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_25;
  }
  uint64_t v19 = [(_INPBFilePropertyValue *)self quantity];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_INPBFilePropertyValue *)self quantity];
    v22 = [v4 quantity];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBFilePropertyValue *)self value];
  unint64_t v6 = [v4 value];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v24 = [(_INPBFilePropertyValue *)self value];
    if (!v24)
    {

LABEL_29:
      BOOL v29 = 1;
      goto LABEL_27;
    }
    v25 = (void *)v24;
    v26 = [(_INPBFilePropertyValue *)self value];
    v27 = [v4 value];
    char v28 = [v26 isEqual:v27];

    if (v28) {
      goto LABEL_29;
    }
  }
  else
  {
LABEL_25:
  }
LABEL_26:
  BOOL v29 = 0;
LABEL_27:

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBFilePropertyValue allocWithZone:](_INPBFilePropertyValue, "allocWithZone:") init];
  id v6 = [(_INPBDateTimeRange *)self->_dateTime copyWithZone:a3];
  [(_INPBFilePropertyValue *)v5 setDateTime:v6];

  if ([(_INPBFilePropertyValue *)self hasFileType]) {
    [(_INPBFilePropertyValue *)v5 setFileType:[(_INPBFilePropertyValue *)self fileType]];
  }
  id v7 = [(_INPBContact *)self->_person copyWithZone:a3];
  [(_INPBFilePropertyValue *)v5 setPerson:v7];

  id v8 = [(_INPBLong *)self->_quantity copyWithZone:a3];
  [(_INPBFilePropertyValue *)v5 setQuantity:v8];

  id v9 = [(_INPBString *)self->_value copyWithZone:a3];
  [(_INPBFilePropertyValue *)v5 setValue:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBFilePropertyValue *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBFilePropertyValue)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBFilePropertyValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBFilePropertyValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBFilePropertyValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  id v4 = [(_INPBFilePropertyValue *)self dateTime];

  if (v4)
  {
    unint64_t v5 = [(_INPBFilePropertyValue *)self dateTime];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBFilePropertyValue *)self hasFileType]) {
    PBDataWriterWriteInt32Field();
  }
  id v6 = [(_INPBFilePropertyValue *)self person];

  if (v6)
  {
    uint64_t v7 = [(_INPBFilePropertyValue *)self person];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBFilePropertyValue *)self quantity];

  if (v8)
  {
    id v9 = [(_INPBFilePropertyValue *)self quantity];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(_INPBFilePropertyValue *)self value];

  int v11 = v13;
  if (v10)
  {
    int v12 = [(_INPBFilePropertyValue *)self value];
    PBDataWriterWriteSubmessage();

    int v11 = v13;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBFilePropertyValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setValue:(id)a3
{
}

- (BOOL)hasQuantity
{
  return self->_quantity != 0;
}

- (void)setQuantity:(id)a3
{
}

- (BOOL)hasPerson
{
  return self->_person != 0;
}

- (void)setPerson:(id)a3
{
}

- (int)StringAsFileType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"OTHER"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"APPLICATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DOCUMENT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MUSIC"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MOVIE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PDF"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PRESENTATION"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"IMAGE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SOURCE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SPREADSHEET"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"TEXT"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)fileTypeAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E55179B0[a3];
  }

  return v3;
}

- (void)setHasFileType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFileType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFileType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int fileType = a3;
  }
}

- (BOOL)hasDateTime
{
  return self->_dateTime != 0;
}

- (void)setDateTime:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end