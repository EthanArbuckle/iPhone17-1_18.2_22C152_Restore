@interface _INPBCreateFileIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDestinationName;
- (BOOL)hasDestinationType;
- (BOOL)hasEntityName;
- (BOOL)hasEntityType;
- (BOOL)hasIntentMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBCreateFileIntent)initWithCoder:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBString)destinationName;
- (_INPBString)entityName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)destinationTypeAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)entityTypeAsString:(int)a3;
- (int)StringAsDestinationType:(id)a3;
- (int)StringAsEntityType:(id)a3;
- (int)destinationType;
- (int)entityType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinationName:(id)a3;
- (void)setDestinationType:(int)a3;
- (void)setEntityName:(id)a3;
- (void)setEntityType:(int)a3;
- (void)setHasDestinationType:(BOOL)a3;
- (void)setHasEntityType:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCreateFileIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_entityName, 0);

  objc_storeStrong((id *)&self->_destinationName, 0);
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)entityType
{
  return self->_entityType;
}

- (_INPBString)entityName
{
  return self->_entityName;
}

- (int)destinationType
{
  return self->_destinationType;
}

- (_INPBString)destinationName
{
  return self->_destinationName;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBCreateFileIntent *)self destinationName];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"destinationName"];

  if ([(_INPBCreateFileIntent *)self hasDestinationType])
  {
    uint64_t v6 = [(_INPBCreateFileIntent *)self destinationType];
    if (v6 >= 4)
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
    }
    else
    {
      v7 = *(&off_1E55190C0 + v6);
    }
    [v3 setObject:v7 forKeyedSubscript:@"destinationType"];
  }
  v8 = [(_INPBCreateFileIntent *)self entityName];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"entityName"];

  if ([(_INPBCreateFileIntent *)self hasEntityType])
  {
    uint64_t v10 = [(_INPBCreateFileIntent *)self entityType];
    if (v10 >= 4)
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
    }
    else
    {
      v11 = *(&off_1E55190C0 + v10);
    }
    [v3 setObject:v11 forKeyedSubscript:@"entityType"];
  }
  v12 = [(_INPBCreateFileIntent *)self intentMetadata];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"intentMetadata"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBString *)self->_destinationName hash];
  if ([(_INPBCreateFileIntent *)self hasDestinationType]) {
    uint64_t v4 = 2654435761 * self->_destinationType;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(_INPBString *)self->_entityName hash];
  if ([(_INPBCreateFileIntent *)self hasEntityType]) {
    uint64_t v6 = 2654435761 * self->_entityType;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(_INPBIntentMetadata *)self->_intentMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  unint64_t v5 = [(_INPBCreateFileIntent *)self destinationName];
  uint64_t v6 = [v4 destinationName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_24;
  }
  uint64_t v7 = [(_INPBCreateFileIntent *)self destinationName];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBCreateFileIntent *)self destinationName];
    uint64_t v10 = [v4 destinationName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  int v12 = [(_INPBCreateFileIntent *)self hasDestinationType];
  if (v12 != [v4 hasDestinationType]) {
    goto LABEL_25;
  }
  if ([(_INPBCreateFileIntent *)self hasDestinationType])
  {
    if ([v4 hasDestinationType])
    {
      int destinationType = self->_destinationType;
      if (destinationType != [v4 destinationType]) {
        goto LABEL_25;
      }
    }
  }
  unint64_t v5 = [(_INPBCreateFileIntent *)self entityName];
  uint64_t v6 = [v4 entityName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_24;
  }
  uint64_t v14 = [(_INPBCreateFileIntent *)self entityName];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBCreateFileIntent *)self entityName];
    v17 = [v4 entityName];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  int v19 = [(_INPBCreateFileIntent *)self hasEntityType];
  if (v19 != [v4 hasEntityType]) {
    goto LABEL_25;
  }
  if ([(_INPBCreateFileIntent *)self hasEntityType])
  {
    if ([v4 hasEntityType])
    {
      int entityType = self->_entityType;
      if (entityType != [v4 entityType]) {
        goto LABEL_25;
      }
    }
  }
  unint64_t v5 = [(_INPBCreateFileIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v21 = [(_INPBCreateFileIntent *)self intentMetadata];
    if (!v21)
    {

LABEL_28:
      BOOL v26 = 1;
      goto LABEL_26;
    }
    v22 = (void *)v21;
    v23 = [(_INPBCreateFileIntent *)self intentMetadata];
    v24 = [v4 intentMetadata];
    char v25 = [v23 isEqual:v24];

    if (v25) {
      goto LABEL_28;
    }
  }
  else
  {
LABEL_24:
  }
LABEL_25:
  BOOL v26 = 0;
LABEL_26:

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBCreateFileIntent allocWithZone:](_INPBCreateFileIntent, "allocWithZone:") init];
  id v6 = [(_INPBString *)self->_destinationName copyWithZone:a3];
  [(_INPBCreateFileIntent *)v5 setDestinationName:v6];

  if ([(_INPBCreateFileIntent *)self hasDestinationType]) {
    [(_INPBCreateFileIntent *)v5 setDestinationType:[(_INPBCreateFileIntent *)self destinationType]];
  }
  id v7 = [(_INPBString *)self->_entityName copyWithZone:a3];
  [(_INPBCreateFileIntent *)v5 setEntityName:v7];

  if ([(_INPBCreateFileIntent *)self hasEntityType]) {
    [(_INPBCreateFileIntent *)v5 setEntityType:[(_INPBCreateFileIntent *)self entityType]];
  }
  id v8 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBCreateFileIntent *)v5 setIntentMetadata:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCreateFileIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCreateFileIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCreateFileIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCreateFileIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCreateFileIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  id v4 = [(_INPBCreateFileIntent *)self destinationName];

  if (v4)
  {
    unint64_t v5 = [(_INPBCreateFileIntent *)self destinationName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBCreateFileIntent *)self hasDestinationType]) {
    PBDataWriterWriteInt32Field();
  }
  id v6 = [(_INPBCreateFileIntent *)self entityName];

  if (v6)
  {
    uint64_t v7 = [(_INPBCreateFileIntent *)self entityName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBCreateFileIntent *)self hasEntityType]) {
    PBDataWriterWriteInt32Field();
  }
  id v8 = [(_INPBCreateFileIntent *)self intentMetadata];

  v9 = v11;
  if (v8)
  {
    uint64_t v10 = [(_INPBCreateFileIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCreateFileIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
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
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E55190C0 + a3);
  }

  return v3;
}

- (void)setHasEntityType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEntityType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEntityType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
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

- (int)StringAsDestinationType:(id)a3
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

- (id)destinationTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E55190C0 + a3);
  }

  return v3;
}

- (void)setHasDestinationType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDestinationType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDestinationType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int destinationType = a3;
  }
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