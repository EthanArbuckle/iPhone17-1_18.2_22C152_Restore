@interface _INPBCreateEventIntent
+ (BOOL)supportsSecureCoding;
+ (Class)participantsType;
- (BOOL)hasDateTimeRange;
- (BOOL)hasIntentMetadata;
- (BOOL)hasLocation;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)participants;
- (NSString)title;
- (_INPBCreateEventIntent)initWithCoder:(id)a3;
- (_INPBDateTimeRangeValue)dateTimeRange;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBLocation)location;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)participantsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)participantsCount;
- (void)addParticipants:(id)a3;
- (void)clearParticipants;
- (void)encodeWithCoder:(id)a3;
- (void)setDateTimeRange:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setLocation:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCreateEventIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_dateTimeRange, 0);
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)participants
{
  return self->_participants;
}

- (_INPBLocation)location
{
  return self->_location;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBDateTimeRangeValue)dateTimeRange
{
  return self->_dateTimeRange;
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBCreateEventIntent *)self dateTimeRange];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"dateTimeRange"];

  v6 = [(_INPBCreateEventIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  v8 = [(_INPBCreateEventIntent *)self location];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"location"];

  if ([(NSArray *)self->_participants count])
  {
    v10 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v11 = self->_participants;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"participants"];
  }
  if (self->_title)
  {
    v17 = [(_INPBCreateEventIntent *)self title];
    v18 = (void *)[v17 copy];
    [v3 setObject:v18 forKeyedSubscript:@"title"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBDateTimeRangeValue *)self->_dateTimeRange hash];
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash] ^ v3;
  unint64_t v5 = [(_INPBLocation *)self->_location hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_participants hash];
  return v6 ^ [(NSString *)self->_title hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  unint64_t v5 = [(_INPBCreateEventIntent *)self dateTimeRange];
  uint64_t v6 = [v4 dateTimeRange];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(_INPBCreateEventIntent *)self dateTimeRange];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBCreateEventIntent *)self dateTimeRange];
    v10 = [v4 dateTimeRange];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBCreateEventIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(_INPBCreateEventIntent *)self intentMetadata];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_INPBCreateEventIntent *)self intentMetadata];
    v15 = [v4 intentMetadata];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBCreateEventIntent *)self location];
  uint64_t v6 = [v4 location];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(_INPBCreateEventIntent *)self location];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBCreateEventIntent *)self location];
    long long v20 = [v4 location];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBCreateEventIntent *)self participants];
  uint64_t v6 = [v4 participants];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(_INPBCreateEventIntent *)self participants];
  if (v22)
  {
    long long v23 = (void *)v22;
    v24 = [(_INPBCreateEventIntent *)self participants];
    uint64_t v25 = [v4 participants];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBCreateEventIntent *)self title];
  uint64_t v6 = [v4 title];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(_INPBCreateEventIntent *)self title];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(_INPBCreateEventIntent *)self title];
    v30 = [v4 title];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBCreateEventIntent allocWithZone:](_INPBCreateEventIntent, "allocWithZone:") init];
  id v6 = [(_INPBDateTimeRangeValue *)self->_dateTimeRange copyWithZone:a3];
  [(_INPBCreateEventIntent *)v5 setDateTimeRange:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBCreateEventIntent *)v5 setIntentMetadata:v7];

  id v8 = [(_INPBLocation *)self->_location copyWithZone:a3];
  [(_INPBCreateEventIntent *)v5 setLocation:v8];

  v9 = (void *)[(NSArray *)self->_participants copyWithZone:a3];
  [(_INPBCreateEventIntent *)v5 setParticipants:v9];

  v10 = (void *)[(NSString *)self->_title copyWithZone:a3];
  [(_INPBCreateEventIntent *)v5 setTitle:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCreateEventIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCreateEventIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCreateEventIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCreateEventIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCreateEventIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_INPBCreateEventIntent *)self dateTimeRange];

  if (v5)
  {
    id v6 = [(_INPBCreateEventIntent *)self dateTimeRange];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBCreateEventIntent *)self intentMetadata];

  if (v7)
  {
    id v8 = [(_INPBCreateEventIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  v9 = [(_INPBCreateEventIntent *)self location];

  if (v9)
  {
    v10 = [(_INPBCreateEventIntent *)self location];
    PBDataWriterWriteSubmessage();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v11 = self->_participants;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  int v16 = [(_INPBCreateEventIntent *)self title];

  if (v16) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCreateEventIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setTitle:(id)a3
{
  self->_title = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)participantsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_participants objectAtIndexedSubscript:a3];
}

- (unint64_t)participantsCount
{
  return [(NSArray *)self->_participants count];
}

- (void)addParticipants:(id)a3
{
  id v4 = a3;
  participants = self->_participants;
  id v8 = v4;
  if (!participants)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_participants;
    self->_participants = v6;

    id v4 = v8;
    participants = self->_participants;
  }
  [(NSArray *)participants addObject:v4];
}

- (void)clearParticipants
{
}

- (void)setParticipants:(id)a3
{
  self->_participants = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setLocation:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasDateTimeRange
{
  return self->_dateTimeRange != 0;
}

- (void)setDateTimeRange:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)participantsType
{
  return (Class)objc_opt_class();
}

@end