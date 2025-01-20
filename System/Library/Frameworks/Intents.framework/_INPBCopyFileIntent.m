@interface _INPBCopyFileIntent
+ (BOOL)supportsSecureCoding;
+ (Class)propertiesType;
- (BOOL)hasDestinationName;
- (BOOL)hasDestinationType;
- (BOOL)hasEntityName;
- (BOOL)hasEntityType;
- (BOOL)hasIntentMetadata;
- (BOOL)hasSourceName;
- (BOOL)hasSourceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)properties;
- (_INPBCopyFileIntent)initWithCoder:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBString)destinationName;
- (_INPBString)entityName;
- (_INPBString)sourceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)destinationTypeAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)entityTypeAsString:(int)a3;
- (id)propertiesAtIndex:(unint64_t)a3;
- (id)sourceTypeAsString:(int)a3;
- (int)StringAsDestinationType:(id)a3;
- (int)StringAsEntityType:(id)a3;
- (int)StringAsSourceType:(id)a3;
- (int)destinationType;
- (int)entityType;
- (int)sourceType;
- (unint64_t)hash;
- (unint64_t)propertiesCount;
- (void)addProperties:(id)a3;
- (void)clearProperties;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinationName:(id)a3;
- (void)setDestinationType:(int)a3;
- (void)setEntityName:(id)a3;
- (void)setEntityType:(int)a3;
- (void)setHasDestinationType:(BOOL)a3;
- (void)setHasEntityType:(BOOL)a3;
- (void)setHasSourceType:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setProperties:(id)a3;
- (void)setSourceName:(id)a3;
- (void)setSourceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCopyFileIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_entityName, 0);

  objc_storeStrong((id *)&self->_destinationName, 0);
}

- (int)sourceType
{
  return self->_sourceType;
}

- (_INPBString)sourceName
{
  return self->_sourceName;
}

- (NSArray)properties
{
  return self->_properties;
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
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBCopyFileIntent *)self destinationName];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"destinationName"];

  if ([(_INPBCopyFileIntent *)self hasDestinationType])
  {
    uint64_t v6 = [(_INPBCopyFileIntent *)self destinationType];
    if (v6 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E551AFC0[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"destinationType"];
  }
  v8 = [(_INPBCopyFileIntent *)self entityName];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"entityName"];

  if ([(_INPBCopyFileIntent *)self hasEntityType])
  {
    uint64_t v10 = [(_INPBCopyFileIntent *)self entityType];
    if (v10 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E551AFC0[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"entityType"];
  }
  v12 = [(_INPBCopyFileIntent *)self intentMetadata];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"intentMetadata"];

  if ([(NSArray *)self->_properties count])
  {
    v14 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v15 = self->_properties;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v26 + 1) + 8 * i) dictionaryRepresentation];
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKeyedSubscript:@"properties"];
  }
  v21 = [(_INPBCopyFileIntent *)self sourceName];
  v22 = [v21 dictionaryRepresentation];
  [v3 setObject:v22 forKeyedSubscript:@"sourceName"];

  if ([(_INPBCopyFileIntent *)self hasSourceType])
  {
    uint64_t v23 = [(_INPBCopyFileIntent *)self sourceType];
    if (v23 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v23);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_1E551AFC0[v23];
    }
    [v3 setObject:v24 forKeyedSubscript:@"sourceType"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBString *)self->_destinationName hash];
  if ([(_INPBCopyFileIntent *)self hasDestinationType]) {
    uint64_t v4 = 2654435761 * self->_destinationType;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(_INPBString *)self->_entityName hash];
  if ([(_INPBCopyFileIntent *)self hasEntityType]) {
    uint64_t v6 = 2654435761 * self->_entityType;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  uint64_t v8 = [(NSArray *)self->_properties hash];
  unint64_t v9 = [(_INPBString *)self->_sourceName hash];
  if ([(_INPBCopyFileIntent *)self hasSourceType]) {
    uint64_t v10 = 2654435761 * self->_sourceType;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  unint64_t v5 = [(_INPBCopyFileIntent *)self destinationName];
  uint64_t v6 = [v4 destinationName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v7 = [(_INPBCopyFileIntent *)self destinationName];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    unint64_t v9 = [(_INPBCopyFileIntent *)self destinationName];
    uint64_t v10 = [v4 destinationName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  int v12 = [(_INPBCopyFileIntent *)self hasDestinationType];
  if (v12 != [v4 hasDestinationType]) {
    goto LABEL_35;
  }
  if ([(_INPBCopyFileIntent *)self hasDestinationType])
  {
    if ([v4 hasDestinationType])
    {
      int destinationType = self->_destinationType;
      if (destinationType != [v4 destinationType]) {
        goto LABEL_35;
      }
    }
  }
  unint64_t v5 = [(_INPBCopyFileIntent *)self entityName];
  uint64_t v6 = [v4 entityName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v14 = [(_INPBCopyFileIntent *)self entityName];
  if (v14)
  {
    v15 = (void *)v14;
    uint64_t v16 = [(_INPBCopyFileIntent *)self entityName];
    uint64_t v17 = [v4 entityName];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  int v19 = [(_INPBCopyFileIntent *)self hasEntityType];
  if (v19 != [v4 hasEntityType]) {
    goto LABEL_35;
  }
  if ([(_INPBCopyFileIntent *)self hasEntityType])
  {
    if ([v4 hasEntityType])
    {
      int entityType = self->_entityType;
      if (entityType != [v4 entityType]) {
        goto LABEL_35;
      }
    }
  }
  unint64_t v5 = [(_INPBCopyFileIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v21 = [(_INPBCopyFileIntent *)self intentMetadata];
  if (v21)
  {
    v22 = (void *)v21;
    uint64_t v23 = [(_INPBCopyFileIntent *)self intentMetadata];
    v24 = [v4 intentMetadata];
    int v25 = [v23 isEqual:v24];

    if (!v25) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBCopyFileIntent *)self properties];
  uint64_t v6 = [v4 properties];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v26 = [(_INPBCopyFileIntent *)self properties];
  if (v26)
  {
    long long v27 = (void *)v26;
    long long v28 = [(_INPBCopyFileIntent *)self properties];
    long long v29 = [v4 properties];
    int v30 = [v28 isEqual:v29];

    if (!v30) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBCopyFileIntent *)self sourceName];
  uint64_t v6 = [v4 sourceName];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_34:

    goto LABEL_35;
  }
  uint64_t v31 = [(_INPBCopyFileIntent *)self sourceName];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(_INPBCopyFileIntent *)self sourceName];
    v34 = [v4 sourceName];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  int v38 = [(_INPBCopyFileIntent *)self hasSourceType];
  if (v38 == [v4 hasSourceType])
  {
    if (![(_INPBCopyFileIntent *)self hasSourceType]
      || ![v4 hasSourceType]
      || (int sourceType = self->_sourceType, sourceType == [v4 sourceType]))
    {
      BOOL v36 = 1;
      goto LABEL_36;
    }
  }
LABEL_35:
  BOOL v36 = 0;
LABEL_36:

  return v36;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBCopyFileIntent allocWithZone:](_INPBCopyFileIntent, "allocWithZone:") init];
  id v6 = [(_INPBString *)self->_destinationName copyWithZone:a3];
  [(_INPBCopyFileIntent *)v5 setDestinationName:v6];

  if ([(_INPBCopyFileIntent *)self hasDestinationType]) {
    [(_INPBCopyFileIntent *)v5 setDestinationType:[(_INPBCopyFileIntent *)self destinationType]];
  }
  id v7 = [(_INPBString *)self->_entityName copyWithZone:a3];
  [(_INPBCopyFileIntent *)v5 setEntityName:v7];

  if ([(_INPBCopyFileIntent *)self hasEntityType]) {
    [(_INPBCopyFileIntent *)v5 setEntityType:[(_INPBCopyFileIntent *)self entityType]];
  }
  id v8 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBCopyFileIntent *)v5 setIntentMetadata:v8];

  unint64_t v9 = (void *)[(NSArray *)self->_properties copyWithZone:a3];
  [(_INPBCopyFileIntent *)v5 setProperties:v9];

  id v10 = [(_INPBString *)self->_sourceName copyWithZone:a3];
  [(_INPBCopyFileIntent *)v5 setSourceName:v10];

  if ([(_INPBCopyFileIntent *)self hasSourceType]) {
    [(_INPBCopyFileIntent *)v5 setSourceType:[(_INPBCopyFileIntent *)self sourceType]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCopyFileIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCopyFileIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCopyFileIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCopyFileIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCopyFileIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_INPBCopyFileIntent *)self destinationName];

  if (v5)
  {
    id v6 = [(_INPBCopyFileIntent *)self destinationName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBCopyFileIntent *)self hasDestinationType]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v7 = [(_INPBCopyFileIntent *)self entityName];

  if (v7)
  {
    id v8 = [(_INPBCopyFileIntent *)self entityName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBCopyFileIntent *)self hasEntityType]) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v9 = [(_INPBCopyFileIntent *)self intentMetadata];

  if (v9)
  {
    id v10 = [(_INPBCopyFileIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v11 = self->_properties;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  uint64_t v16 = [(_INPBCopyFileIntent *)self sourceName];

  if (v16)
  {
    uint64_t v17 = [(_INPBCopyFileIntent *)self sourceName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBCopyFileIntent *)self hasSourceType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCopyFileIntentReadFrom(self, (uint64_t)a3);
}

- (int)StringAsSourceType:(id)a3
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

- (id)sourceTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551AFC0[a3];
  }

  return v3;
}

- (void)setHasSourceType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSourceType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSourceType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFB;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 4;
    self->_int sourceType = a3;
  }
}

- (BOOL)hasSourceName
{
  return self->_sourceName != 0;
}

- (void)setSourceName:(id)a3
{
}

- (id)propertiesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_properties objectAtIndexedSubscript:a3];
}

- (unint64_t)propertiesCount
{
  return [(NSArray *)self->_properties count];
}

- (void)addProperties:(id)a3
{
  id v4 = a3;
  properties = self->_properties;
  id v8 = v4;
  if (!properties)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_properties;
    self->_properties = v6;

    id v4 = v8;
    properties = self->_properties;
  }
  [(NSArray *)properties addObject:v4];
}

- (void)clearProperties
{
}

- (void)setProperties:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  properties = self->_properties;
  self->_properties = v4;

  MEMORY[0x1F41817F8](v4, properties);
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
    id v3 = off_1E551AFC0[a3];
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
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
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
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551AFC0[a3];
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

+ (Class)propertiesType
{
  return (Class)objc_opt_class();
}

@end