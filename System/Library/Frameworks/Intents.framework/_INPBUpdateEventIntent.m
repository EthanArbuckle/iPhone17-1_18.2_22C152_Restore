@interface _INPBUpdateEventIntent
+ (BOOL)supportsSecureCoding;
+ (Class)addParticipantsType;
+ (Class)removeParticipantsType;
- (BOOL)hasIntentMetadata;
- (BOOL)hasRemoveLocation;
- (BOOL)hasSetDateTimeRange;
- (BOOL)hasSetLocation;
- (BOOL)hasSetTitle;
- (BOOL)hasTargetEventIdentifier;
- (BOOL)hasUpdateAllOccurrences;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)removeLocation;
- (BOOL)updateAllOccurrences;
- (NSArray)addParticipants;
- (NSArray)removeParticipants;
- (NSString)setTitle;
- (NSString)targetEventIdentifier;
- (_INPBDateTimeRangeValue)setDateTimeRange;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBLocation)setLocation;
- (_INPBUpdateEventIntent)initWithCoder:(id)a3;
- (id)addParticipantsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)removeParticipantsAtIndex:(unint64_t)a3;
- (unint64_t)addParticipantsCount;
- (unint64_t)hash;
- (unint64_t)removeParticipantsCount;
- (void)addAddParticipants:(id)a3;
- (void)addRemoveParticipants:(id)a3;
- (void)clearAddParticipants;
- (void)clearRemoveParticipants;
- (void)encodeWithCoder:(id)a3;
- (void)setAddParticipants:(id)a3;
- (void)setHasRemoveLocation:(BOOL)a3;
- (void)setHasUpdateAllOccurrences:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setRemoveLocation:(BOOL)a3;
- (void)setRemoveParticipants:(id)a3;
- (void)setSetDateTimeRange:(id)a3;
- (void)setSetLocation:(id)a3;
- (void)setSetTitle:(id)a3;
- (void)setTargetEventIdentifier:(id)a3;
- (void)setUpdateAllOccurrences:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBUpdateEventIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetEventIdentifier, 0);
  objc_storeStrong((id *)&self->_setTitle, 0);
  objc_storeStrong((id *)&self->_setLocation, 0);
  objc_storeStrong((id *)&self->_setDateTimeRange, 0);
  objc_storeStrong((id *)&self->_removeParticipants, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_addParticipants, 0);
}

- (BOOL)updateAllOccurrences
{
  return self->_updateAllOccurrences;
}

- (NSString)targetEventIdentifier
{
  return self->_targetEventIdentifier;
}

- (NSString)setTitle
{
  return self->_setTitle;
}

- (_INPBLocation)setLocation
{
  return self->_setLocation;
}

- (_INPBDateTimeRangeValue)setDateTimeRange
{
  return self->_setDateTimeRange;
}

- (NSArray)removeParticipants
{
  return self->_removeParticipants;
}

- (BOOL)removeLocation
{
  return self->_removeLocation;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (NSArray)addParticipants
{
  return self->_addParticipants;
}

- (id)dictionaryRepresentation
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_addParticipants count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v5 = self->_addParticipants;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v36 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v35 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"addParticipants"];
  }
  v11 = [(_INPBUpdateEventIntent *)self intentMetadata];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBUpdateEventIntent *)self hasRemoveLocation])
  {
    v13 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBUpdateEventIntent removeLocation](self, "removeLocation"));
    [v3 setObject:v13 forKeyedSubscript:@"removeLocation"];
  }
  if ([(NSArray *)self->_removeParticipants count])
  {
    v14 = [MEMORY[0x1E4F1CA48] array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v15 = self->_removeParticipants;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * j), "dictionaryRepresentation", (void)v31);
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKeyedSubscript:@"removeParticipants"];
  }
  v21 = [(_INPBUpdateEventIntent *)self setDateTimeRange];
  v22 = [v21 dictionaryRepresentation];
  [v3 setObject:v22 forKeyedSubscript:@"setDateTimeRange"];

  v23 = [(_INPBUpdateEventIntent *)self setLocation];
  v24 = [v23 dictionaryRepresentation];
  [v3 setObject:v24 forKeyedSubscript:@"setLocation"];

  if (self->_setTitle)
  {
    v25 = [(_INPBUpdateEventIntent *)self setTitle];
    v26 = (void *)[v25 copy];
    [v3 setObject:v26 forKeyedSubscript:@"setTitle"];
  }
  if (self->_targetEventIdentifier)
  {
    v27 = [(_INPBUpdateEventIntent *)self targetEventIdentifier];
    v28 = (void *)[v27 copy];
    [v3 setObject:v28 forKeyedSubscript:@"targetEventIdentifier"];
  }
  if ([(_INPBUpdateEventIntent *)self hasUpdateAllOccurrences])
  {
    v29 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBUpdateEventIntent updateAllOccurrences](self, "updateAllOccurrences"));
    [v3 setObject:v29 forKeyedSubscript:@"updateAllOccurrences"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_addParticipants hash];
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBUpdateEventIntent *)self hasRemoveLocation]) {
    uint64_t v5 = 2654435761 * self->_removeLocation;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [(NSArray *)self->_removeParticipants hash];
  unint64_t v7 = [(_INPBDateTimeRangeValue *)self->_setDateTimeRange hash];
  unint64_t v8 = [(_INPBLocation *)self->_setLocation hash];
  NSUInteger v9 = [(NSString *)self->_setTitle hash];
  NSUInteger v10 = [(NSString *)self->_targetEventIdentifier hash];
  if ([(_INPBUpdateEventIntent *)self hasUpdateAllOccurrences]) {
    uint64_t v11 = 2654435761 * self->_updateAllOccurrences;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  uint64_t v5 = [(_INPBUpdateEventIntent *)self addParticipants];
  uint64_t v6 = [v4 addParticipants];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v7 = [(_INPBUpdateEventIntent *)self addParticipants];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    NSUInteger v9 = [(_INPBUpdateEventIntent *)self addParticipants];
    NSUInteger v10 = [v4 addParticipants];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBUpdateEventIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v12 = [(_INPBUpdateEventIntent *)self intentMetadata];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBUpdateEventIntent *)self intentMetadata];
    v15 = [v4 intentMetadata];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  int v17 = [(_INPBUpdateEventIntent *)self hasRemoveLocation];
  if (v17 != [v4 hasRemoveLocation]) {
    goto LABEL_41;
  }
  if ([(_INPBUpdateEventIntent *)self hasRemoveLocation])
  {
    if ([v4 hasRemoveLocation])
    {
      int removeLocation = self->_removeLocation;
      if (removeLocation != [v4 removeLocation]) {
        goto LABEL_41;
      }
    }
  }
  uint64_t v5 = [(_INPBUpdateEventIntent *)self removeParticipants];
  uint64_t v6 = [v4 removeParticipants];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v19 = [(_INPBUpdateEventIntent *)self removeParticipants];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_INPBUpdateEventIntent *)self removeParticipants];
    v22 = [v4 removeParticipants];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBUpdateEventIntent *)self setDateTimeRange];
  uint64_t v6 = [v4 setDateTimeRange];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v24 = [(_INPBUpdateEventIntent *)self setDateTimeRange];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(_INPBUpdateEventIntent *)self setDateTimeRange];
    v27 = [v4 setDateTimeRange];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBUpdateEventIntent *)self setLocation];
  uint64_t v6 = [v4 setLocation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v29 = [(_INPBUpdateEventIntent *)self setLocation];
  if (v29)
  {
    v30 = (void *)v29;
    long long v31 = [(_INPBUpdateEventIntent *)self setLocation];
    long long v32 = [v4 setLocation];
    int v33 = [v31 isEqual:v32];

    if (!v33) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBUpdateEventIntent *)self setTitle];
  uint64_t v6 = [v4 setTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v34 = [(_INPBUpdateEventIntent *)self setTitle];
  if (v34)
  {
    long long v35 = (void *)v34;
    long long v36 = [(_INPBUpdateEventIntent *)self setTitle];
    long long v37 = [v4 setTitle];
    int v38 = [v36 isEqual:v37];

    if (!v38) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBUpdateEventIntent *)self targetEventIdentifier];
  uint64_t v6 = [v4 targetEventIdentifier];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_40:

    goto LABEL_41;
  }
  uint64_t v39 = [(_INPBUpdateEventIntent *)self targetEventIdentifier];
  if (v39)
  {
    v40 = (void *)v39;
    uint64_t v41 = [(_INPBUpdateEventIntent *)self targetEventIdentifier];
    v42 = [v4 targetEventIdentifier];
    int v43 = [v41 isEqual:v42];

    if (!v43) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  int v46 = [(_INPBUpdateEventIntent *)self hasUpdateAllOccurrences];
  if (v46 == [v4 hasUpdateAllOccurrences])
  {
    if (![(_INPBUpdateEventIntent *)self hasUpdateAllOccurrences]
      || ![v4 hasUpdateAllOccurrences]
      || (int updateAllOccurrences = self->_updateAllOccurrences,
          updateAllOccurrences == [v4 updateAllOccurrences]))
    {
      BOOL v44 = 1;
      goto LABEL_42;
    }
  }
LABEL_41:
  BOOL v44 = 0;
LABEL_42:

  return v44;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBUpdateEventIntent allocWithZone:](_INPBUpdateEventIntent, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_addParticipants copyWithZone:a3];
  [(_INPBUpdateEventIntent *)v5 setAddParticipants:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBUpdateEventIntent *)v5 setIntentMetadata:v7];

  if ([(_INPBUpdateEventIntent *)self hasRemoveLocation]) {
    [(_INPBUpdateEventIntent *)v5 setRemoveLocation:[(_INPBUpdateEventIntent *)self removeLocation]];
  }
  unint64_t v8 = (void *)[(NSArray *)self->_removeParticipants copyWithZone:a3];
  [(_INPBUpdateEventIntent *)v5 setRemoveParticipants:v8];

  id v9 = [(_INPBDateTimeRangeValue *)self->_setDateTimeRange copyWithZone:a3];
  [(_INPBUpdateEventIntent *)v5 setSetDateTimeRange:v9];

  id v10 = [(_INPBLocation *)self->_setLocation copyWithZone:a3];
  [(_INPBUpdateEventIntent *)v5 setSetLocation:v10];

  int v11 = (void *)[(NSString *)self->_setTitle copyWithZone:a3];
  [(_INPBUpdateEventIntent *)v5 setSetTitle:v11];

  uint64_t v12 = (void *)[(NSString *)self->_targetEventIdentifier copyWithZone:a3];
  [(_INPBUpdateEventIntent *)v5 setTargetEventIdentifier:v12];

  if ([(_INPBUpdateEventIntent *)self hasUpdateAllOccurrences]) {
    [(_INPBUpdateEventIntent *)v5 setUpdateAllOccurrences:[(_INPBUpdateEventIntent *)self updateAllOccurrences]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBUpdateEventIntent *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBUpdateEventIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBUpdateEventIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        unint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBUpdateEventIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBUpdateEventIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v5 = self->_addParticipants;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  id v10 = [(_INPBUpdateEventIntent *)self intentMetadata];

  if (v10)
  {
    int v11 = [(_INPBUpdateEventIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBUpdateEventIntent *)self hasRemoveLocation]) {
    PBDataWriterWriteBOOLField();
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v12 = self->_removeParticipants;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v14);
  }

  int v17 = [(_INPBUpdateEventIntent *)self setDateTimeRange];

  if (v17)
  {
    uint64_t v18 = [(_INPBUpdateEventIntent *)self setDateTimeRange];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v19 = [(_INPBUpdateEventIntent *)self setLocation];

  if (v19)
  {
    v20 = [(_INPBUpdateEventIntent *)self setLocation];
    PBDataWriterWriteSubmessage();
  }
  v21 = [(_INPBUpdateEventIntent *)self setTitle];

  if (v21) {
    PBDataWriterWriteStringField();
  }
  v22 = [(_INPBUpdateEventIntent *)self targetEventIdentifier];

  if (v22) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBUpdateEventIntent *)self hasUpdateAllOccurrences]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBUpdateEventIntentReadFrom(self, (uint64_t)a3);
}

- (void)setHasUpdateAllOccurrences:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUpdateAllOccurrences
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUpdateAllOccurrences:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int updateAllOccurrences = a3;
}

- (BOOL)hasTargetEventIdentifier
{
  return self->_targetEventIdentifier != 0;
}

- (void)setTargetEventIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  targetEventIdentifier = self->_targetEventIdentifier;
  self->_targetEventIdentifier = v4;

  MEMORY[0x1F41817F8](v4, targetEventIdentifier);
}

- (BOOL)hasSetTitle
{
  return self->_setTitle != 0;
}

- (void)setSetTitle:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  setTitle = self->_setTitle;
  self->_setTitle = v4;

  MEMORY[0x1F41817F8](v4, setTitle);
}

- (BOOL)hasSetLocation
{
  return self->_setLocation != 0;
}

- (void)setSetLocation:(id)a3
{
}

- (BOOL)hasSetDateTimeRange
{
  return self->_setDateTimeRange != 0;
}

- (void)setSetDateTimeRange:(id)a3
{
}

- (id)removeParticipantsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_removeParticipants objectAtIndexedSubscript:a3];
}

- (unint64_t)removeParticipantsCount
{
  return [(NSArray *)self->_removeParticipants count];
}

- (void)addRemoveParticipants:(id)a3
{
  id v4 = a3;
  removeParticipants = self->_removeParticipants;
  id v8 = v4;
  if (!removeParticipants)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_removeParticipants;
    self->_removeParticipants = v6;

    id v4 = v8;
    removeParticipants = self->_removeParticipants;
  }
  [(NSArray *)removeParticipants addObject:v4];
}

- (void)clearRemoveParticipants
{
}

- (void)setRemoveParticipants:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  removeParticipants = self->_removeParticipants;
  self->_removeParticipants = v4;

  MEMORY[0x1F41817F8](v4, removeParticipants);
}

- (void)setHasRemoveLocation:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRemoveLocation
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRemoveLocation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int removeLocation = a3;
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (id)addParticipantsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_addParticipants objectAtIndexedSubscript:a3];
}

- (unint64_t)addParticipantsCount
{
  return [(NSArray *)self->_addParticipants count];
}

- (void)addAddParticipants:(id)a3
{
  id v4 = a3;
  addParticipants = self->_addParticipants;
  id v8 = v4;
  if (!addParticipants)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_addParticipants;
    self->_addParticipants = v6;

    id v4 = v8;
    addParticipants = self->_addParticipants;
  }
  [(NSArray *)addParticipants addObject:v4];
}

- (void)clearAddParticipants
{
}

- (void)setAddParticipants:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  addParticipants = self->_addParticipants;
  self->_addParticipants = v4;

  MEMORY[0x1F41817F8](v4, addParticipants);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)removeParticipantsType
{
  return (Class)objc_opt_class();
}

+ (Class)addParticipantsType
{
  return (Class)objc_opt_class();
}

@end