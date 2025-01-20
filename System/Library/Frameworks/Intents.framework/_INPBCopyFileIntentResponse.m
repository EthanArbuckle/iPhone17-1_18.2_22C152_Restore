@interface _INPBCopyFileIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDestinationName;
- (BOOL)hasEntityName;
- (BOOL)hasEntityType;
- (BOOL)hasOverwrite;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)overwrite;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (_INPBCopyFileIntentResponse)initWithCoder:(id)a3;
- (_INPBString)destinationName;
- (_INPBString)entityName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)entityTypeAsString:(int)a3;
- (int)StringAsEntityType:(id)a3;
- (int)entityType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinationName:(id)a3;
- (void)setEntityName:(id)a3;
- (void)setEntityType:(int)a3;
- (void)setHasEntityType:(BOOL)a3;
- (void)setHasOverwrite:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setOverwrite:(BOOL)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCopyFileIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityName, 0);

  objc_storeStrong((id *)&self->_destinationName, 0);
}

- (BOOL)success
{
  return self->_success;
}

- (BOOL)overwrite
{
  return self->_overwrite;
}

- (int)entityType
{
  return self->_entityType;
}

- (_INPBString)entityName
{
  return self->_entityName;
}

- (_INPBString)destinationName
{
  return self->_destinationName;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBCopyFileIntentResponse *)self destinationName];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"destinationName"];

  v6 = [(_INPBCopyFileIntentResponse *)self entityName];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"entityName"];

  if ([(_INPBCopyFileIntentResponse *)self hasEntityType])
  {
    uint64_t v8 = [(_INPBCopyFileIntentResponse *)self entityType];
    if (v8 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E5518B68[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"entityType"];
  }
  if ([(_INPBCopyFileIntentResponse *)self hasOverwrite])
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBCopyFileIntentResponse overwrite](self, "overwrite"));
    [v3 setObject:v10 forKeyedSubscript:@"overwrite"];
  }
  if ([(_INPBCopyFileIntentResponse *)self hasSuccess])
  {
    v11 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBCopyFileIntentResponse success](self, "success"));
    [v3 setObject:v11 forKeyedSubscript:@"success"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBString *)self->_destinationName hash];
  unint64_t v4 = [(_INPBString *)self->_entityName hash];
  if ([(_INPBCopyFileIntentResponse *)self hasEntityType]) {
    uint64_t v5 = 2654435761 * self->_entityType;
  }
  else {
    uint64_t v5 = 0;
  }
  if ([(_INPBCopyFileIntentResponse *)self hasOverwrite]) {
    uint64_t v6 = 2654435761 * self->_overwrite;
  }
  else {
    uint64_t v6 = 0;
  }
  if ([(_INPBCopyFileIntentResponse *)self hasSuccess]) {
    uint64_t v7 = 2654435761 * self->_success;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(_INPBCopyFileIntentResponse *)self destinationName];
  uint64_t v6 = [v4 destinationName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBCopyFileIntentResponse *)self destinationName];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBCopyFileIntentResponse *)self destinationName];
    v10 = [v4 destinationName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBCopyFileIntentResponse *)self entityName];
  uint64_t v6 = [v4 entityName];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(_INPBCopyFileIntentResponse *)self entityName];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBCopyFileIntentResponse *)self entityName];
    v15 = [v4 entityName];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  int v19 = [(_INPBCopyFileIntentResponse *)self hasEntityType];
  if (v19 == [v4 hasEntityType])
  {
    if (![(_INPBCopyFileIntentResponse *)self hasEntityType]
      || ![v4 hasEntityType]
      || (int entityType = self->_entityType, entityType == [v4 entityType]))
    {
      int v21 = [(_INPBCopyFileIntentResponse *)self hasOverwrite];
      if (v21 == [v4 hasOverwrite])
      {
        if (![(_INPBCopyFileIntentResponse *)self hasOverwrite]
          || ![v4 hasOverwrite]
          || (int overwrite = self->_overwrite, overwrite == [v4 overwrite]))
        {
          int v23 = [(_INPBCopyFileIntentResponse *)self hasSuccess];
          if (v23 == [v4 hasSuccess])
          {
            if (![(_INPBCopyFileIntentResponse *)self hasSuccess]
              || ![v4 hasSuccess]
              || (int success = self->_success, success == [v4 success]))
            {
              BOOL v17 = 1;
              goto LABEL_13;
            }
          }
        }
      }
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBCopyFileIntentResponse allocWithZone:](_INPBCopyFileIntentResponse, "allocWithZone:") init];
  id v6 = [(_INPBString *)self->_destinationName copyWithZone:a3];
  [(_INPBCopyFileIntentResponse *)v5 setDestinationName:v6];

  id v7 = [(_INPBString *)self->_entityName copyWithZone:a3];
  [(_INPBCopyFileIntentResponse *)v5 setEntityName:v7];

  if ([(_INPBCopyFileIntentResponse *)self hasEntityType]) {
    [(_INPBCopyFileIntentResponse *)v5 setEntityType:[(_INPBCopyFileIntentResponse *)self entityType]];
  }
  if ([(_INPBCopyFileIntentResponse *)self hasOverwrite]) {
    [(_INPBCopyFileIntentResponse *)v5 setOverwrite:[(_INPBCopyFileIntentResponse *)self overwrite]];
  }
  if ([(_INPBCopyFileIntentResponse *)self hasSuccess]) {
    [(_INPBCopyFileIntentResponse *)v5 setSuccess:[(_INPBCopyFileIntentResponse *)self success]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCopyFileIntentResponse *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCopyFileIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCopyFileIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCopyFileIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCopyFileIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(_INPBCopyFileIntentResponse *)self destinationName];

  if (v4)
  {
    uint64_t v5 = [(_INPBCopyFileIntentResponse *)self destinationName];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBCopyFileIntentResponse *)self entityName];

  if (v6)
  {
    uint64_t v7 = [(_INPBCopyFileIntentResponse *)self entityName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBCopyFileIntentResponse *)self hasEntityType]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBCopyFileIntentResponse *)self hasOverwrite]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBCopyFileIntentResponse *)self hasSuccess]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCopyFileIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSuccess
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int success = a3;
}

- (void)setHasOverwrite:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOverwrite
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setOverwrite:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int overwrite = a3;
}

- (int)StringAsEntityType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FILE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FOLDER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REFERENCE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"URL"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)entityTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5518B68[a3];
  }

  return v3;
}

- (void)setHasEntityType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEntityType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEntityType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int entityType = a3;
  }
}

- (BOOL)hasEntityName
{
  return self->_entityName != 0;
}

- (void)setEntityName:(id)a3
{
}

- (BOOL)hasDestinationName
{
  return self->_destinationName != 0;
}

- (void)setDestinationName:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end