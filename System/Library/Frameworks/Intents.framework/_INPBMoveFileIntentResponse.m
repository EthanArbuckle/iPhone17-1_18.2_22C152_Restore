@interface _INPBMoveFileIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)entityNameType;
- (BOOL)hasDestinationName;
- (BOOL)hasOverwrite;
- (BOOL)hasSourceName;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)overwrite;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NSArray)entityNames;
- (_INPBMoveFileIntentResponse)initWithCoder:(id)a3;
- (_INPBString)destinationName;
- (_INPBString)sourceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)entityNameAtIndex:(unint64_t)a3;
- (id)entityTypesAsString:(int)a3;
- (int)StringAsEntityTypes:(id)a3;
- (int)entityTypeAtIndex:(unint64_t)a3;
- (int)entityTypes;
- (unint64_t)entityNamesCount;
- (unint64_t)entityTypesCount;
- (unint64_t)hash;
- (void)addEntityName:(id)a3;
- (void)addEntityType:(int)a3;
- (void)clearEntityNames;
- (void)clearEntityTypes;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinationName:(id)a3;
- (void)setEntityNames:(id)a3;
- (void)setEntityTypes:(int *)a3 count:(unint64_t)a4;
- (void)setHasOverwrite:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setOverwrite:(BOOL)a3;
- (void)setSourceName:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBMoveFileIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_entityNames, 0);

  objc_storeStrong((id *)&self->_destinationName, 0);
}

- (BOOL)success
{
  return self->_success;
}

- (_INPBString)sourceName
{
  return self->_sourceName;
}

- (BOOL)overwrite
{
  return self->_overwrite;
}

- (NSArray)entityNames
{
  return self->_entityNames;
}

- (_INPBString)destinationName
{
  return self->_destinationName;
}

- (id)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBMoveFileIntentResponse *)self destinationName];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"destinationName"];

  if ([(NSArray *)self->_entityNames count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v7 = self->_entityNames;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v22 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"entityName"];
  }
  if (self->_entityTypes.count)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBMoveFileIntentResponse entityTypesCount](self, "entityTypesCount"));
    if ([(_INPBMoveFileIntentResponse *)self entityTypesCount])
    {
      unint64_t v14 = 0;
      do
      {
        uint64_t v15 = self->_entityTypes.list[v14];
        if (v15 >= 4)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_entityTypes.list[v14]);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = off_1E551AE80[v15];
        }
        [v13 addObject:v16];

        ++v14;
      }
      while (v14 < [(_INPBMoveFileIntentResponse *)self entityTypesCount]);
    }
    [v3 setObject:v13 forKeyedSubscript:@"entityType"];
  }
  if ([(_INPBMoveFileIntentResponse *)self hasOverwrite])
  {
    v17 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBMoveFileIntentResponse overwrite](self, "overwrite"));
    [v3 setObject:v17 forKeyedSubscript:@"overwrite"];
  }
  v18 = [(_INPBMoveFileIntentResponse *)self sourceName];
  v19 = [v18 dictionaryRepresentation];
  [v3 setObject:v19 forKeyedSubscript:@"sourceName"];

  if ([(_INPBMoveFileIntentResponse *)self hasSuccess])
  {
    v20 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBMoveFileIntentResponse success](self, "success"));
    [v3 setObject:v20 forKeyedSubscript:@"success"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBString *)self->_destinationName hash];
  uint64_t v4 = [(NSArray *)self->_entityNames hash];
  uint64_t v5 = PBRepeatedInt32Hash();
  if ([(_INPBMoveFileIntentResponse *)self hasOverwrite]) {
    uint64_t v6 = 2654435761 * self->_overwrite;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(_INPBString *)self->_sourceName hash];
  if ([(_INPBMoveFileIntentResponse *)self hasSuccess]) {
    uint64_t v8 = 2654435761 * self->_success;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  uint64_t v5 = [(_INPBMoveFileIntentResponse *)self destinationName];
  uint64_t v6 = [v4 destinationName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_INPBMoveFileIntentResponse *)self destinationName];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBMoveFileIntentResponse *)self destinationName];
    uint64_t v10 = [v4 destinationName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBMoveFileIntentResponse *)self entityNames];
  uint64_t v6 = [v4 entityNames];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_INPBMoveFileIntentResponse *)self entityNames];
  if (v12)
  {
    v13 = (void *)v12;
    unint64_t v14 = [(_INPBMoveFileIntentResponse *)self entityNames];
    uint64_t v15 = [v4 entityNames];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_22;
  }
  int v17 = [(_INPBMoveFileIntentResponse *)self hasOverwrite];
  if (v17 != [v4 hasOverwrite]) {
    goto LABEL_22;
  }
  if ([(_INPBMoveFileIntentResponse *)self hasOverwrite])
  {
    if ([v4 hasOverwrite])
    {
      int overwrite = self->_overwrite;
      if (overwrite != [v4 overwrite]) {
        goto LABEL_22;
      }
    }
  }
  uint64_t v5 = [(_INPBMoveFileIntentResponse *)self sourceName];
  uint64_t v6 = [v4 sourceName];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v19 = [(_INPBMoveFileIntentResponse *)self sourceName];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_INPBMoveFileIntentResponse *)self sourceName];
    long long v22 = [v4 sourceName];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  int v26 = [(_INPBMoveFileIntentResponse *)self hasSuccess];
  if (v26 == [v4 hasSuccess])
  {
    if (![(_INPBMoveFileIntentResponse *)self hasSuccess]
      || ![v4 hasSuccess]
      || (int success = self->_success, success == [v4 success]))
    {
      BOOL v24 = 1;
      goto LABEL_23;
    }
  }
LABEL_22:
  BOOL v24 = 0;
LABEL_23:

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBMoveFileIntentResponse allocWithZone:](_INPBMoveFileIntentResponse, "allocWithZone:") init];
  id v6 = [(_INPBString *)self->_destinationName copyWithZone:a3];
  [(_INPBMoveFileIntentResponse *)v5 setDestinationName:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_entityNames copyWithZone:a3];
  [(_INPBMoveFileIntentResponse *)v5 setEntityNames:v7];

  PBRepeatedInt32Copy();
  if ([(_INPBMoveFileIntentResponse *)self hasOverwrite]) {
    [(_INPBMoveFileIntentResponse *)v5 setOverwrite:[(_INPBMoveFileIntentResponse *)self overwrite]];
  }
  id v8 = [(_INPBString *)self->_sourceName copyWithZone:a3];
  [(_INPBMoveFileIntentResponse *)v5 setSourceName:v8];

  if ([(_INPBMoveFileIntentResponse *)self hasSuccess]) {
    [(_INPBMoveFileIntentResponse *)v5 setSuccess:[(_INPBMoveFileIntentResponse *)self success]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBMoveFileIntentResponse *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBMoveFileIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBMoveFileIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBMoveFileIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBMoveFileIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBMoveFileIntentResponse *)self clearEntityTypes];
  v3.receiver = self;
  v3.super_class = (Class)_INPBMoveFileIntentResponse;
  [(_INPBMoveFileIntentResponse *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_INPBMoveFileIntentResponse *)self destinationName];

  if (v5)
  {
    id v6 = [(_INPBMoveFileIntentResponse *)self destinationName];
    PBDataWriterWriteSubmessage();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = self->_entityNames;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
  if ([(_INPBMoveFileIntentResponse *)self hasOverwrite]) {
    PBDataWriterWriteBOOLField();
  }
  v13 = [(_INPBMoveFileIntentResponse *)self sourceName];

  if (v13)
  {
    unint64_t v14 = [(_INPBMoveFileIntentResponse *)self sourceName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBMoveFileIntentResponse *)self hasSuccess]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBMoveFileIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSuccess
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int success = a3;
}

- (BOOL)hasSourceName
{
  return self->_sourceName != 0;
}

- (void)setSourceName:(id)a3
{
}

- (void)setHasOverwrite:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOverwrite
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setOverwrite:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int overwrite = a3;
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
    id v3 = off_1E551AE80[a3];
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
  id v4 = (NSArray *)[a3 mutableCopy];
  entityNames = self->_entityNames;
  self->_entityNames = v4;

  MEMORY[0x1F41817F8](v4, entityNames);
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

+ (Class)entityNameType
{
  return (Class)objc_opt_class();
}

@end