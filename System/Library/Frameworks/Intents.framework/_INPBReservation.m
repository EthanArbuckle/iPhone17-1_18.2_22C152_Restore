@interface _INPBReservation
+ (BOOL)supportsSecureCoding;
+ (Class)actionsType;
- (BOOL)hasBookingTime;
- (BOOL)hasItemReference;
- (BOOL)hasReservationHolderName;
- (BOOL)hasReservationNumber;
- (BOOL)hasReservationStatus;
- (BOOL)hasUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)actions;
- (NSString)reservationHolderName;
- (NSString)reservationNumber;
- (_INPBDataString)itemReference;
- (_INPBReservation)initWithCoder:(id)a3;
- (_INPBTimestamp)bookingTime;
- (_INPBURLValue)url;
- (id)actionsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)reservationStatusAsString:(int)a3;
- (int)StringAsReservationStatus:(id)a3;
- (int)reservationStatus;
- (unint64_t)actionsCount;
- (unint64_t)hash;
- (void)addActions:(id)a3;
- (void)clearActions;
- (void)encodeWithCoder:(id)a3;
- (void)setActions:(id)a3;
- (void)setBookingTime:(id)a3;
- (void)setHasReservationStatus:(BOOL)a3;
- (void)setItemReference:(id)a3;
- (void)setReservationHolderName:(id)a3;
- (void)setReservationNumber:(id)a3;
- (void)setReservationStatus:(int)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBReservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservationNumber, 0);
  objc_storeStrong((id *)&self->_reservationHolderName, 0);
  objc_storeStrong((id *)&self->_itemReference, 0);
  objc_storeStrong((id *)&self->_bookingTime, 0);
  objc_storeStrong((id *)&self->_actions, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (int)reservationStatus
{
  return self->_reservationStatus;
}

- (NSString)reservationNumber
{
  return self->_reservationNumber;
}

- (NSString)reservationHolderName
{
  return self->_reservationHolderName;
}

- (_INPBDataString)itemReference
{
  return self->_itemReference;
}

- (_INPBTimestamp)bookingTime
{
  return self->_bookingTime;
}

- (NSArray)actions
{
  return self->_actions;
}

- (_INPBURLValue)url
{
  return self->_url;
}

- (id)dictionaryRepresentation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBReservation *)self url];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"URL"];

  if ([(NSArray *)self->_actions count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v7 = self->_actions;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v24 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"actions"];
  }
  v13 = [(_INPBReservation *)self bookingTime];
  v14 = [v13 dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"bookingTime"];

  v15 = [(_INPBReservation *)self itemReference];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"itemReference"];

  if (self->_reservationHolderName)
  {
    v17 = [(_INPBReservation *)self reservationHolderName];
    v18 = (void *)[v17 copy];
    [v3 setObject:v18 forKeyedSubscript:@"reservationHolderName"];
  }
  if (self->_reservationNumber)
  {
    v19 = [(_INPBReservation *)self reservationNumber];
    v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"reservationNumber"];
  }
  if ([(_INPBReservation *)self hasReservationStatus])
  {
    uint64_t v21 = [(_INPBReservation *)self reservationStatus];
    if ((v21 - 1) >= 5)
    {
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v21);
    }
    else
    {
      v22 = *(&off_1E551F6A0 + (v21 - 1));
    }
    [v3 setObject:v22 forKeyedSubscript:@"reservationStatus"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBURLValue *)self->_url hash];
  uint64_t v4 = [(NSArray *)self->_actions hash];
  unint64_t v5 = [(_INPBTimestamp *)self->_bookingTime hash];
  unint64_t v6 = [(_INPBDataString *)self->_itemReference hash];
  NSUInteger v7 = [(NSString *)self->_reservationHolderName hash];
  NSUInteger v8 = [(NSString *)self->_reservationNumber hash];
  if ([(_INPBReservation *)self hasReservationStatus]) {
    uint64_t v9 = 2654435761 * self->_reservationStatus;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  unint64_t v5 = [(_INPBReservation *)self url];
  unint64_t v6 = [v4 url];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(_INPBReservation *)self url];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    uint64_t v9 = [(_INPBReservation *)self url];
    uint64_t v10 = [v4 url];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBReservation *)self actions];
  unint64_t v6 = [v4 actions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v12 = [(_INPBReservation *)self actions];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBReservation *)self actions];
    v15 = [v4 actions];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBReservation *)self bookingTime];
  unint64_t v6 = [v4 bookingTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(_INPBReservation *)self bookingTime];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBReservation *)self bookingTime];
    v20 = [v4 bookingTime];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBReservation *)self itemReference];
  unint64_t v6 = [v4 itemReference];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(_INPBReservation *)self itemReference];
  if (v22)
  {
    v23 = (void *)v22;
    long long v24 = [(_INPBReservation *)self itemReference];
    long long v25 = [v4 itemReference];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBReservation *)self reservationHolderName];
  unint64_t v6 = [v4 reservationHolderName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(_INPBReservation *)self reservationHolderName];
  if (v27)
  {
    v28 = (void *)v27;
    uint64_t v29 = [(_INPBReservation *)self reservationHolderName];
    v30 = [v4 reservationHolderName];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBReservation *)self reservationNumber];
  unint64_t v6 = [v4 reservationNumber];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_31:

    goto LABEL_32;
  }
  uint64_t v32 = [(_INPBReservation *)self reservationNumber];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_INPBReservation *)self reservationNumber];
    v35 = [v4 reservationNumber];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  int v39 = [(_INPBReservation *)self hasReservationStatus];
  if (v39 == [v4 hasReservationStatus])
  {
    if (![(_INPBReservation *)self hasReservationStatus]
      || ![v4 hasReservationStatus]
      || (int reservationStatus = self->_reservationStatus,
          reservationStatus == [v4 reservationStatus]))
    {
      BOOL v37 = 1;
      goto LABEL_33;
    }
  }
LABEL_32:
  BOOL v37 = 0;
LABEL_33:

  return v37;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBReservation allocWithZone:](_INPBReservation, "allocWithZone:") init];
  id v6 = [(_INPBURLValue *)self->_url copyWithZone:a3];
  [(_INPBReservation *)v5 setUrl:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_actions copyWithZone:a3];
  [(_INPBReservation *)v5 setActions:v7];

  id v8 = [(_INPBTimestamp *)self->_bookingTime copyWithZone:a3];
  [(_INPBReservation *)v5 setBookingTime:v8];

  id v9 = [(_INPBDataString *)self->_itemReference copyWithZone:a3];
  [(_INPBReservation *)v5 setItemReference:v9];

  uint64_t v10 = (void *)[(NSString *)self->_reservationHolderName copyWithZone:a3];
  [(_INPBReservation *)v5 setReservationHolderName:v10];

  int v11 = (void *)[(NSString *)self->_reservationNumber copyWithZone:a3];
  [(_INPBReservation *)v5 setReservationNumber:v11];

  if ([(_INPBReservation *)self hasReservationStatus]) {
    [(_INPBReservation *)v5 setReservationStatus:[(_INPBReservation *)self reservationStatus]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBReservation *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBReservation)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBReservation *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBReservation *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBReservation *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_INPBReservation *)self url];

  if (v5)
  {
    id v6 = [(_INPBReservation *)self url];
    PBDataWriterWriteSubmessage();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = self->_actions;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [(_INPBReservation *)self bookingTime];

  if (v12)
  {
    v13 = [(_INPBReservation *)self bookingTime];
    PBDataWriterWriteSubmessage();
  }
  v14 = [(_INPBReservation *)self itemReference];

  if (v14)
  {
    v15 = [(_INPBReservation *)self itemReference];
    PBDataWriterWriteSubmessage();
  }
  int v16 = [(_INPBReservation *)self reservationHolderName];

  if (v16) {
    PBDataWriterWriteStringField();
  }
  uint64_t v17 = [(_INPBReservation *)self reservationNumber];

  if (v17) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBReservation *)self hasReservationStatus]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBReservationReadFrom(self, (uint64_t)a3);
}

- (int)StringAsReservationStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_RESERVATION_STATUS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CANCELED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PENDING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HOLD"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CONFIRMED"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)reservationStatusAsString:(int)a3
{
  if ((a3 - 1) >= 5)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551F6A0 + (a3 - 1));
  }

  return v3;
}

- (void)setHasReservationStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReservationStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setReservationStatus:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int reservationStatus = a3;
  }
}

- (BOOL)hasReservationNumber
{
  return self->_reservationNumber != 0;
}

- (void)setReservationNumber:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  reservationNumber = self->_reservationNumber;
  self->_reservationNumber = v4;

  MEMORY[0x1F41817F8](v4, reservationNumber);
}

- (BOOL)hasReservationHolderName
{
  return self->_reservationHolderName != 0;
}

- (void)setReservationHolderName:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  reservationHolderName = self->_reservationHolderName;
  self->_reservationHolderName = v4;

  MEMORY[0x1F41817F8](v4, reservationHolderName);
}

- (BOOL)hasItemReference
{
  return self->_itemReference != 0;
}

- (void)setItemReference:(id)a3
{
}

- (BOOL)hasBookingTime
{
  return self->_bookingTime != 0;
}

- (void)setBookingTime:(id)a3
{
}

- (id)actionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_actions objectAtIndexedSubscript:a3];
}

- (unint64_t)actionsCount
{
  return [(NSArray *)self->_actions count];
}

- (void)addActions:(id)a3
{
  id v4 = a3;
  actions = self->_actions;
  id v8 = v4;
  if (!actions)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_actions;
    self->_actions = v6;

    id v4 = v8;
    actions = self->_actions;
  }
  [(NSArray *)actions addObject:v4];
}

- (void)clearActions
{
}

- (void)setActions:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  actions = self->_actions;
  self->_actions = v4;

  MEMORY[0x1F41817F8](v4, actions);
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (void)setUrl:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)actionsType
{
  return (Class)objc_opt_class();
}

@end