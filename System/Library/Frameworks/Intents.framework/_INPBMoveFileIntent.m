@interface _INPBMoveFileIntent
+ (BOOL)supportsSecureCoding;
+ (Class)entityNameType;
+ (Class)propertiesType;
- (BOOL)hasDestinationName;
- (BOOL)hasDestinationType;
- (BOOL)hasIntentMetadata;
- (BOOL)hasSourceName;
- (BOOL)hasSourceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)entityNames;
- (NSArray)properties;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBMoveFileIntent)initWithCoder:(id)a3;
- (_INPBString)destinationName;
- (_INPBString)sourceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)destinationTypeAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)entityNameAtIndex:(unint64_t)a3;
- (id)entityTypesAsString:(int)a3;
- (id)propertiesAtIndex:(unint64_t)a3;
- (id)sourceTypeAsString:(int)a3;
- (int)StringAsDestinationType:(id)a3;
- (int)StringAsEntityTypes:(id)a3;
- (int)StringAsSourceType:(id)a3;
- (int)destinationType;
- (int)entityTypeAtIndex:(unint64_t)a3;
- (int)entityTypes;
- (int)sourceType;
- (unint64_t)entityNamesCount;
- (unint64_t)entityTypesCount;
- (unint64_t)hash;
- (unint64_t)propertiesCount;
- (void)addEntityName:(id)a3;
- (void)addEntityType:(int)a3;
- (void)addProperties:(id)a3;
- (void)clearEntityNames;
- (void)clearEntityTypes;
- (void)clearProperties;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinationName:(id)a3;
- (void)setDestinationType:(int)a3;
- (void)setEntityNames:(id)a3;
- (void)setEntityTypes:(int *)a3 count:(unint64_t)a4;
- (void)setHasDestinationType:(BOOL)a3;
- (void)setHasSourceType:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setProperties:(id)a3;
- (void)setSourceName:(id)a3;
- (void)setSourceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBMoveFileIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_entityNames, 0);

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

- (NSArray)entityNames
{
  return self->_entityNames;
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
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBMoveFileIntent *)self destinationName];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"destinationName"];

  if ([(_INPBMoveFileIntent *)self hasDestinationType])
  {
    uint64_t v6 = [(_INPBMoveFileIntent *)self destinationType];
    if (v6 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E55183C8[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"destinationType"];
  }
  if ([(NSArray *)self->_entityNames count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v9 = self->_entityNames;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v38 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v37 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"entityName"];
  }
  if (self->_entityTypes.count)
  {
    v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBMoveFileIntent entityTypesCount](self, "entityTypesCount"));
    if ([(_INPBMoveFileIntent *)self entityTypesCount])
    {
      unint64_t v16 = 0;
      do
      {
        uint64_t v17 = self->_entityTypes.list[v16];
        if (v17 >= 4)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_entityTypes.list[v16]);
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = off_1E55183C8[v17];
        }
        [v15 addObject:v18];

        ++v16;
      }
      while (v16 < [(_INPBMoveFileIntent *)self entityTypesCount]);
    }
    [v3 setObject:v15 forKeyedSubscript:@"entityType"];
  }
  v19 = [(_INPBMoveFileIntent *)self intentMetadata];
  v20 = [v19 dictionaryRepresentation];
  [v3 setObject:v20 forKeyedSubscript:@"intentMetadata"];

  if ([(NSArray *)self->_properties count])
  {
    v21 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v22 = self->_properties;
    uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [*(id *)(*((void *)&v33 + 1) + 8 * j) dictionaryRepresentation];
          [v21 addObject:v27];
        }
        uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v24);
    }

    [v3 setObject:v21 forKeyedSubscript:@"properties"];
  }
  v28 = [(_INPBMoveFileIntent *)self sourceName];
  v29 = [v28 dictionaryRepresentation];
  [v3 setObject:v29 forKeyedSubscript:@"sourceName"];

  if ([(_INPBMoveFileIntent *)self hasSourceType])
  {
    uint64_t v30 = [(_INPBMoveFileIntent *)self sourceType];
    if (v30 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v30);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = off_1E55183C8[v30];
    }
    [v3 setObject:v31 forKeyedSubscript:@"sourceType"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBString *)self->_destinationName hash];
  if ([(_INPBMoveFileIntent *)self hasDestinationType]) {
    uint64_t v4 = 2654435761 * self->_destinationType;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(NSArray *)self->_entityNames hash];
  uint64_t v6 = PBRepeatedInt32Hash();
  unint64_t v7 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  uint64_t v8 = [(NSArray *)self->_properties hash];
  unint64_t v9 = [(_INPBString *)self->_sourceName hash];
  if ([(_INPBMoveFileIntent *)self hasSourceType]) {
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
    goto LABEL_32;
  }
  uint64_t v5 = [(_INPBMoveFileIntent *)self destinationName];
  uint64_t v6 = [v4 destinationName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(_INPBMoveFileIntent *)self destinationName];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    unint64_t v9 = [(_INPBMoveFileIntent *)self destinationName];
    uint64_t v10 = [v4 destinationName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  int v12 = [(_INPBMoveFileIntent *)self hasDestinationType];
  if (v12 != [v4 hasDestinationType]) {
    goto LABEL_32;
  }
  if ([(_INPBMoveFileIntent *)self hasDestinationType])
  {
    if ([v4 hasDestinationType])
    {
      int destinationType = self->_destinationType;
      if (destinationType != [v4 destinationType]) {
        goto LABEL_32;
      }
    }
  }
  uint64_t v5 = [(_INPBMoveFileIntent *)self entityNames];
  uint64_t v6 = [v4 entityNames];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v14 = [(_INPBMoveFileIntent *)self entityNames];
  if (v14)
  {
    v15 = (void *)v14;
    unint64_t v16 = [(_INPBMoveFileIntent *)self entityNames];
    uint64_t v17 = [v4 entityNames];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_32;
  }
  uint64_t v5 = [(_INPBMoveFileIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v19 = [(_INPBMoveFileIntent *)self intentMetadata];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_INPBMoveFileIntent *)self intentMetadata];
    v22 = [v4 intentMetadata];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBMoveFileIntent *)self properties];
  uint64_t v6 = [v4 properties];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v24 = [(_INPBMoveFileIntent *)self properties];
  if (v24)
  {
    uint64_t v25 = (void *)v24;
    v26 = [(_INPBMoveFileIntent *)self properties];
    v27 = [v4 properties];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBMoveFileIntent *)self sourceName];
  uint64_t v6 = [v4 sourceName];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_31:

    goto LABEL_32;
  }
  uint64_t v29 = [(_INPBMoveFileIntent *)self sourceName];
  if (v29)
  {
    uint64_t v30 = (void *)v29;
    v31 = [(_INPBMoveFileIntent *)self sourceName];
    v32 = [v4 sourceName];
    int v33 = [v31 isEqual:v32];

    if (!v33) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  int v36 = [(_INPBMoveFileIntent *)self hasSourceType];
  if (v36 == [v4 hasSourceType])
  {
    if (![(_INPBMoveFileIntent *)self hasSourceType]
      || ![v4 hasSourceType]
      || (int sourceType = self->_sourceType, sourceType == [v4 sourceType]))
    {
      BOOL v34 = 1;
      goto LABEL_33;
    }
  }
LABEL_32:
  BOOL v34 = 0;
LABEL_33:

  return v34;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBMoveFileIntent allocWithZone:](_INPBMoveFileIntent, "allocWithZone:") init];
  id v6 = [(_INPBString *)self->_destinationName copyWithZone:a3];
  [(_INPBMoveFileIntent *)v5 setDestinationName:v6];

  if ([(_INPBMoveFileIntent *)self hasDestinationType]) {
    [(_INPBMoveFileIntent *)v5 setDestinationType:[(_INPBMoveFileIntent *)self destinationType]];
  }
  uint64_t v7 = (void *)[(NSArray *)self->_entityNames copyWithZone:a3];
  [(_INPBMoveFileIntent *)v5 setEntityNames:v7];

  PBRepeatedInt32Copy();
  id v8 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBMoveFileIntent *)v5 setIntentMetadata:v8];

  unint64_t v9 = (void *)[(NSArray *)self->_properties copyWithZone:a3];
  [(_INPBMoveFileIntent *)v5 setProperties:v9];

  id v10 = [(_INPBString *)self->_sourceName copyWithZone:a3];
  [(_INPBMoveFileIntent *)v5 setSourceName:v10];

  if ([(_INPBMoveFileIntent *)self hasSourceType]) {
    [(_INPBMoveFileIntent *)v5 setSourceType:[(_INPBMoveFileIntent *)self sourceType]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBMoveFileIntent *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBMoveFileIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBMoveFileIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBMoveFileIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBMoveFileIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBMoveFileIntent *)self clearEntityTypes];
  v3.receiver = self;
  v3.super_class = (Class)_INPBMoveFileIntent;
  [(_INPBMoveFileIntent *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_INPBMoveFileIntent *)self destinationName];

  if (v5)
  {
    id v6 = [(_INPBMoveFileIntent *)self destinationName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBMoveFileIntent *)self hasDestinationType]) {
    PBDataWriterWriteInt32Field();
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v7 = self->_entityNames;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v9);
  }

  if (self->_entityTypes.count)
  {
    unint64_t v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v12;
    }
    while (v12 < self->_entityTypes.count);
  }
  v13 = [(_INPBMoveFileIntent *)self intentMetadata];

  if (v13)
  {
    uint64_t v14 = [(_INPBMoveFileIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v15 = self->_properties;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }

  v20 = [(_INPBMoveFileIntent *)self sourceName];

  if (v20)
  {
    v21 = [(_INPBMoveFileIntent *)self sourceName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBMoveFileIntent *)self hasSourceType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBMoveFileIntentReadFrom(self, (uint64_t)a3);
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
    id v3 = off_1E55183C8[a3];
  }

  return v3;
}

- (void)setHasSourceType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSourceType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSourceType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
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
  self->_properties = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (int)StringAsEntityTypes:(id)a3
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

- (id)entityTypesAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E55183C8[a3];
  }

  return v3;
}

- (int)entityTypeAtIndex:(unint64_t)a3
{
  return self->_entityTypes.list[a3];
}

- (unint64_t)entityTypesCount
{
  return self->_entityTypes.count;
}

- (void)addEntityType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearEntityTypes
{
}

- (int)entityTypes
{
  return self->_entityTypes.list;
}

- (void)setEntityTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)entityNameAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_entityNames objectAtIndexedSubscript:a3];
}

- (unint64_t)entityNamesCount
{
  return [(NSArray *)self->_entityNames count];
}

- (void)addEntityName:(id)a3
{
  id v4 = a3;
  entityNames = self->_entityNames;
  id v8 = v4;
  if (!entityNames)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_entityNames;
    self->_entityNames = v6;

    id v4 = v8;
    entityNames = self->_entityNames;
  }
  [(NSArray *)entityNames addObject:v4];
}

- (void)clearEntityNames
{
}

- (void)setEntityNames:(id)a3
{
  self->_entityNames = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
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
    id v3 = off_1E55183C8[a3];
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

+ (Class)entityNameType
{
  return (Class)objc_opt_class();
}

@end