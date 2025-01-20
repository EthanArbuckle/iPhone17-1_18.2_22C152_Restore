@interface _INPBFindEventsIntent
+ (BOOL)supportsSecureCoding;
+ (Class)participantsType;
- (BOOL)hasDateTimeRange;
- (BOOL)hasIntentMetadata;
- (BOOL)hasLocation;
- (BOOL)hasRequestedEventAttribute;
- (BOOL)hasSearchQuery;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)participants;
- (NSString)searchQuery;
- (_INPBDateTimeRangeValue)dateTimeRange;
- (_INPBFindEventsIntent)initWithCoder:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBLocation)location;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)participantsAtIndex:(unint64_t)a3;
- (id)requestedEventAttributeAsString:(int)a3;
- (int)StringAsRequestedEventAttribute:(id)a3;
- (int)requestedEventAttribute;
- (unint64_t)hash;
- (unint64_t)participantsCount;
- (void)addParticipants:(id)a3;
- (void)clearParticipants;
- (void)encodeWithCoder:(id)a3;
- (void)setDateTimeRange:(id)a3;
- (void)setHasRequestedEventAttribute:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setLocation:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setRequestedEventAttribute:(int)a3;
- (void)setSearchQuery:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBFindEventsIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_dateTimeRange, 0);
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (int)requestedEventAttribute
{
  return self->_requestedEventAttribute;
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBFindEventsIntent *)self dateTimeRange];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"dateTimeRange"];

  v6 = [(_INPBFindEventsIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  v8 = [(_INPBFindEventsIntent *)self location];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"location"];

  if ([(NSArray *)self->_participants count])
  {
    v10 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v11 = self->_participants;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v22 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"participants"];
  }
  if ([(_INPBFindEventsIntent *)self hasRequestedEventAttribute])
  {
    uint64_t v17 = [(_INPBFindEventsIntent *)self requestedEventAttribute];
    if ((v17 - 1) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v17);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E5517C28[(v17 - 1)];
    }
    [v3 setObject:v18 forKeyedSubscript:@"requestedEventAttribute"];
  }
  if (self->_searchQuery)
  {
    v19 = [(_INPBFindEventsIntent *)self searchQuery];
    v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"searchQuery"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBDateTimeRangeValue *)self->_dateTimeRange hash];
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v5 = [(_INPBLocation *)self->_location hash];
  uint64_t v6 = [(NSArray *)self->_participants hash];
  if ([(_INPBFindEventsIntent *)self hasRequestedEventAttribute]) {
    uint64_t v7 = 2654435761 * self->_requestedEventAttribute;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_searchQuery hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  unint64_t v5 = [(_INPBFindEventsIntent *)self dateTimeRange];
  uint64_t v6 = [v4 dateTimeRange];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v7 = [(_INPBFindEventsIntent *)self dateTimeRange];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBFindEventsIntent *)self dateTimeRange];
    v10 = [v4 dateTimeRange];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBFindEventsIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v12 = [(_INPBFindEventsIntent *)self intentMetadata];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_INPBFindEventsIntent *)self intentMetadata];
    v15 = [v4 intentMetadata];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBFindEventsIntent *)self location];
  uint64_t v6 = [v4 location];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v17 = [(_INPBFindEventsIntent *)self location];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBFindEventsIntent *)self location];
    v20 = [v4 location];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBFindEventsIntent *)self participants];
  uint64_t v6 = [v4 participants];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v22 = [(_INPBFindEventsIntent *)self participants];
  if (v22)
  {
    long long v23 = (void *)v22;
    long long v24 = [(_INPBFindEventsIntent *)self participants];
    long long v25 = [v4 participants];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  int v27 = [(_INPBFindEventsIntent *)self hasRequestedEventAttribute];
  if (v27 != [v4 hasRequestedEventAttribute]) {
    goto LABEL_31;
  }
  if ([(_INPBFindEventsIntent *)self hasRequestedEventAttribute])
  {
    if ([v4 hasRequestedEventAttribute])
    {
      int requestedEventAttribute = self->_requestedEventAttribute;
      if (requestedEventAttribute != [v4 requestedEventAttribute]) {
        goto LABEL_31;
      }
    }
  }
  unint64_t v5 = [(_INPBFindEventsIntent *)self searchQuery];
  uint64_t v6 = [v4 searchQuery];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v29 = [(_INPBFindEventsIntent *)self searchQuery];
    if (!v29)
    {

LABEL_34:
      BOOL v34 = 1;
      goto LABEL_32;
    }
    v30 = (void *)v29;
    v31 = [(_INPBFindEventsIntent *)self searchQuery];
    v32 = [v4 searchQuery];
    char v33 = [v31 isEqual:v32];

    if (v33) {
      goto LABEL_34;
    }
  }
  else
  {
LABEL_30:
  }
LABEL_31:
  BOOL v34 = 0;
LABEL_32:

  return v34;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBFindEventsIntent allocWithZone:](_INPBFindEventsIntent, "allocWithZone:") init];
  id v6 = [(_INPBDateTimeRangeValue *)self->_dateTimeRange copyWithZone:a3];
  [(_INPBFindEventsIntent *)v5 setDateTimeRange:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBFindEventsIntent *)v5 setIntentMetadata:v7];

  id v8 = [(_INPBLocation *)self->_location copyWithZone:a3];
  [(_INPBFindEventsIntent *)v5 setLocation:v8];

  v9 = (void *)[(NSArray *)self->_participants copyWithZone:a3];
  [(_INPBFindEventsIntent *)v5 setParticipants:v9];

  if ([(_INPBFindEventsIntent *)self hasRequestedEventAttribute]) {
    [(_INPBFindEventsIntent *)v5 setRequestedEventAttribute:[(_INPBFindEventsIntent *)self requestedEventAttribute]];
  }
  v10 = (void *)[(NSString *)self->_searchQuery copyWithZone:a3];
  [(_INPBFindEventsIntent *)v5 setSearchQuery:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBFindEventsIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBFindEventsIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBFindEventsIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBFindEventsIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBFindEventsIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_INPBFindEventsIntent *)self dateTimeRange];

  if (v5)
  {
    id v6 = [(_INPBFindEventsIntent *)self dateTimeRange];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBFindEventsIntent *)self intentMetadata];

  if (v7)
  {
    id v8 = [(_INPBFindEventsIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  v9 = [(_INPBFindEventsIntent *)self location];

  if (v9)
  {
    v10 = [(_INPBFindEventsIntent *)self location];
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

  if ([(_INPBFindEventsIntent *)self hasRequestedEventAttribute]) {
    PBDataWriterWriteInt32Field();
  }
  int v16 = [(_INPBFindEventsIntent *)self searchQuery];

  if (v16) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBFindEventsIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasSearchQuery
{
  return self->_searchQuery != 0;
}

- (void)setSearchQuery:(id)a3
{
  self->_searchQuery = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (int)StringAsRequestedEventAttribute:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"EVENT_LOCATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PARTICIPANTS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DATETIME"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)requestedEventAttributeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5517C28[a3 - 1];
  }

  return v3;
}

- (void)setHasRequestedEventAttribute:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestedEventAttribute
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRequestedEventAttribute:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int requestedEventAttribute = a3;
  }
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