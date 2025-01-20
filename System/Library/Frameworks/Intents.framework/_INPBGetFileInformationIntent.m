@interface _INPBGetFileInformationIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasEntityName;
- (BOOL)hasEntityType;
- (BOOL)hasIntentMetadata;
- (BOOL)hasPropertyName;
- (BOOL)hasQualifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBGetFileInformationIntent)initWithCoder:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBString)entityName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)entityTypeAsString:(int)a3;
- (id)propertyNameAsString:(int)a3;
- (id)qualifierAsString:(int)a3;
- (int)StringAsEntityType:(id)a3;
- (int)StringAsPropertyName:(id)a3;
- (int)StringAsQualifier:(id)a3;
- (int)entityType;
- (int)propertyName;
- (int)qualifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEntityName:(id)a3;
- (void)setEntityType:(int)a3;
- (void)setHasEntityType:(BOOL)a3;
- (void)setHasPropertyName:(BOOL)a3;
- (void)setHasQualifier:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setPropertyName:(int)a3;
- (void)setQualifier:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBGetFileInformationIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_entityName, 0);
}

- (int)qualifier
{
  return self->_qualifier;
}

- (int)propertyName
{
  return self->_propertyName;
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

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBGetFileInformationIntent *)self entityName];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"entityName"];

  if ([(_INPBGetFileInformationIntent *)self hasEntityType])
  {
    uint64_t v6 = [(_INPBGetFileInformationIntent *)self entityType];
    if (v6 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E551A510[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"entityType"];
  }
  v8 = [(_INPBGetFileInformationIntent *)self intentMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBGetFileInformationIntent *)self hasPropertyName])
  {
    uint64_t v10 = [(_INPBGetFileInformationIntent *)self propertyName];
    if (v10 >= 0xC)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E551A530[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"propertyName"];
  }
  if ([(_INPBGetFileInformationIntent *)self hasQualifier])
  {
    uint64_t v12 = [(_INPBGetFileInformationIntent *)self qualifier];
    if (v12 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E551A590[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"qualifier"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBString *)self->_entityName hash];
  if ([(_INPBGetFileInformationIntent *)self hasEntityType]) {
    uint64_t v4 = 2654435761 * self->_entityType;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBGetFileInformationIntent *)self hasPropertyName]) {
    uint64_t v6 = 2654435761 * self->_propertyName;
  }
  else {
    uint64_t v6 = 0;
  }
  if ([(_INPBGetFileInformationIntent *)self hasQualifier]) {
    uint64_t v7 = 2654435761 * self->_qualifier;
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
    goto LABEL_16;
  }
  unint64_t v5 = [(_INPBGetFileInformationIntent *)self entityName];
  uint64_t v6 = [v4 entityName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_15;
  }
  uint64_t v7 = [(_INPBGetFileInformationIntent *)self entityName];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBGetFileInformationIntent *)self entityName];
    uint64_t v10 = [v4 entityName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  int v12 = [(_INPBGetFileInformationIntent *)self hasEntityType];
  if (v12 != [v4 hasEntityType]) {
    goto LABEL_16;
  }
  if ([(_INPBGetFileInformationIntent *)self hasEntityType])
  {
    if ([v4 hasEntityType])
    {
      int entityType = self->_entityType;
      if (entityType != [v4 entityType]) {
        goto LABEL_16;
      }
    }
  }
  unint64_t v5 = [(_INPBGetFileInformationIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v14 = [(_INPBGetFileInformationIntent *)self intentMetadata];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBGetFileInformationIntent *)self intentMetadata];
    v17 = [v4 intentMetadata];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  int v21 = [(_INPBGetFileInformationIntent *)self hasPropertyName];
  if (v21 == [v4 hasPropertyName])
  {
    if (![(_INPBGetFileInformationIntent *)self hasPropertyName]
      || ![v4 hasPropertyName]
      || (int propertyName = self->_propertyName, propertyName == [v4 propertyName]))
    {
      int v23 = [(_INPBGetFileInformationIntent *)self hasQualifier];
      if (v23 == [v4 hasQualifier])
      {
        if (![(_INPBGetFileInformationIntent *)self hasQualifier]
          || ![v4 hasQualifier]
          || (int qualifier = self->_qualifier, qualifier == [v4 qualifier]))
        {
          BOOL v19 = 1;
          goto LABEL_17;
        }
      }
    }
  }
LABEL_16:
  BOOL v19 = 0;
LABEL_17:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBGetFileInformationIntent allocWithZone:](_INPBGetFileInformationIntent, "allocWithZone:") init];
  id v6 = [(_INPBString *)self->_entityName copyWithZone:a3];
  [(_INPBGetFileInformationIntent *)v5 setEntityName:v6];

  if ([(_INPBGetFileInformationIntent *)self hasEntityType]) {
    [(_INPBGetFileInformationIntent *)v5 setEntityType:[(_INPBGetFileInformationIntent *)self entityType]];
  }
  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBGetFileInformationIntent *)v5 setIntentMetadata:v7];

  if ([(_INPBGetFileInformationIntent *)self hasPropertyName]) {
    [(_INPBGetFileInformationIntent *)v5 setPropertyName:[(_INPBGetFileInformationIntent *)self propertyName]];
  }
  if ([(_INPBGetFileInformationIntent *)self hasQualifier]) {
    [(_INPBGetFileInformationIntent *)v5 setQualifier:[(_INPBGetFileInformationIntent *)self qualifier]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBGetFileInformationIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBGetFileInformationIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBGetFileInformationIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBGetFileInformationIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBGetFileInformationIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(_INPBGetFileInformationIntent *)self entityName];

  if (v4)
  {
    unint64_t v5 = [(_INPBGetFileInformationIntent *)self entityName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBGetFileInformationIntent *)self hasEntityType]) {
    PBDataWriterWriteInt32Field();
  }
  id v6 = [(_INPBGetFileInformationIntent *)self intentMetadata];

  if (v6)
  {
    uint64_t v7 = [(_INPBGetFileInformationIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBGetFileInformationIntent *)self hasPropertyName]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBGetFileInformationIntent *)self hasQualifier]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBGetFileInformationIntentReadFrom(self, (uint64_t)a3);
}

- (int)StringAsQualifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"EQUAL"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AT_LEAST"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AT_MOST"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MIN"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MAX"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)qualifierAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551A590[a3];
  }

  return v3;
}

- (void)setHasQualifier:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasQualifier
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setQualifier:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFB;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 4;
    self->_int qualifier = a3;
  }
}

- (int)StringAsPropertyName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SIZE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CONTENTS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AUTHOR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CREATION_TIME"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ACCESSED_TIME"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MODIFIED_TIME"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PRINTED_TIME"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SENDER"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RECIPIENT"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PAGE_COUNT"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"TAG"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"FILE_TYPE"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)propertyNameAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551A530[a3];
  }

  return v3;
}

- (void)setHasPropertyName:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPropertyName
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPropertyName:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int propertyName = a3;
  }
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
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551A510[a3];
  }

  return v3;
}

- (void)setHasEntityType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end