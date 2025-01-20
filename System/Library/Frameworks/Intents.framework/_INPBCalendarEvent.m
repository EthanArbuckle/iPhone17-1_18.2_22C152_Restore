@interface _INPBCalendarEvent
+ (BOOL)supportsSecureCoding;
+ (Class)participantsType;
- (BOOL)hasCalendarPunchoutURI;
- (BOOL)hasDateTimeRange;
- (BOOL)hasEventIdentifier;
- (BOOL)hasIsContactBirthday;
- (BOOL)hasLocation;
- (BOOL)hasTitle;
- (BOOL)isContactBirthday;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)participants;
- (NSString)calendarPunchoutURI;
- (NSString)eventIdentifier;
- (NSString)title;
- (_INPBCalendarEvent)initWithCoder:(id)a3;
- (_INPBDateTimeRangeValue)dateTimeRange;
- (_INPBLocation)location;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)participantsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)participantsCount;
- (void)addParticipants:(id)a3;
- (void)clearParticipants;
- (void)encodeWithCoder:(id)a3;
- (void)setCalendarPunchoutURI:(id)a3;
- (void)setDateTimeRange:(id)a3;
- (void)setEventIdentifier:(id)a3;
- (void)setHasIsContactBirthday:(BOOL)a3;
- (void)setIsContactBirthday:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCalendarEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
  objc_storeStrong((id *)&self->_dateTimeRange, 0);

  objc_storeStrong((id *)&self->_calendarPunchoutURI, 0);
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

- (BOOL)isContactBirthday
{
  return self->_isContactBirthday;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (_INPBDateTimeRangeValue)dateTimeRange
{
  return self->_dateTimeRange;
}

- (NSString)calendarPunchoutURI
{
  return self->_calendarPunchoutURI;
}

- (id)dictionaryRepresentation
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_calendarPunchoutURI)
  {
    v4 = [(_INPBCalendarEvent *)self calendarPunchoutURI];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"calendarPunchoutURI"];
  }
  v6 = [(_INPBCalendarEvent *)self dateTimeRange];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"dateTimeRange"];

  if (self->_eventIdentifier)
  {
    v8 = [(_INPBCalendarEvent *)self eventIdentifier];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"eventIdentifier"];
  }
  if ([(_INPBCalendarEvent *)self hasIsContactBirthday])
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBCalendarEvent isContactBirthday](self, "isContactBirthday"));
    [v3 setObject:v10 forKeyedSubscript:@"isContactBirthday"];
  }
  v11 = [(_INPBCalendarEvent *)self location];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"location"];

  if ([(NSArray *)self->_participants count])
  {
    v13 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v14 = self->_participants;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (void)v23);
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKeyedSubscript:@"participants"];
  }
  if (self->_title)
  {
    v20 = [(_INPBCalendarEvent *)self title];
    v21 = (void *)[v20 copy];
    [v3 setObject:v21 forKeyedSubscript:@"title"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_calendarPunchoutURI hash];
  unint64_t v4 = [(_INPBDateTimeRangeValue *)self->_dateTimeRange hash];
  NSUInteger v5 = [(NSString *)self->_eventIdentifier hash];
  if ([(_INPBCalendarEvent *)self hasIsContactBirthday]) {
    uint64_t v6 = 2654435761 * self->_isContactBirthday;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v8 = [(_INPBLocation *)self->_location hash];
  uint64_t v9 = v8 ^ [(NSArray *)self->_participants hash];
  return v7 ^ v9 ^ [(NSString *)self->_title hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  NSUInteger v5 = [(_INPBCalendarEvent *)self calendarPunchoutURI];
  uint64_t v6 = [v4 calendarPunchoutURI];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v7 = [(_INPBCalendarEvent *)self calendarPunchoutURI];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBCalendarEvent *)self calendarPunchoutURI];
    v10 = [v4 calendarPunchoutURI];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBCalendarEvent *)self dateTimeRange];
  uint64_t v6 = [v4 dateTimeRange];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v12 = [(_INPBCalendarEvent *)self dateTimeRange];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBCalendarEvent *)self dateTimeRange];
    uint64_t v15 = [v4 dateTimeRange];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBCalendarEvent *)self eventIdentifier];
  uint64_t v6 = [v4 eventIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v17 = [(_INPBCalendarEvent *)self eventIdentifier];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBCalendarEvent *)self eventIdentifier];
    v20 = [v4 eventIdentifier];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  int v22 = [(_INPBCalendarEvent *)self hasIsContactBirthday];
  if (v22 != [v4 hasIsContactBirthday]) {
    goto LABEL_36;
  }
  if ([(_INPBCalendarEvent *)self hasIsContactBirthday])
  {
    if ([v4 hasIsContactBirthday])
    {
      int isContactBirthday = self->_isContactBirthday;
      if (isContactBirthday != [v4 isContactBirthday]) {
        goto LABEL_36;
      }
    }
  }
  NSUInteger v5 = [(_INPBCalendarEvent *)self location];
  uint64_t v6 = [v4 location];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v24 = [(_INPBCalendarEvent *)self location];
  if (v24)
  {
    long long v25 = (void *)v24;
    long long v26 = [(_INPBCalendarEvent *)self location];
    v27 = [v4 location];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBCalendarEvent *)self participants];
  uint64_t v6 = [v4 participants];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v29 = [(_INPBCalendarEvent *)self participants];
  if (v29)
  {
    v30 = (void *)v29;
    v31 = [(_INPBCalendarEvent *)self participants];
    v32 = [v4 participants];
    int v33 = [v31 isEqual:v32];

    if (!v33) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBCalendarEvent *)self title];
  uint64_t v6 = [v4 title];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v34 = [(_INPBCalendarEvent *)self title];
    if (!v34)
    {

LABEL_39:
      BOOL v39 = 1;
      goto LABEL_37;
    }
    v35 = (void *)v34;
    v36 = [(_INPBCalendarEvent *)self title];
    v37 = [v4 title];
    char v38 = [v36 isEqual:v37];

    if (v38) {
      goto LABEL_39;
    }
  }
  else
  {
LABEL_35:
  }
LABEL_36:
  BOOL v39 = 0;
LABEL_37:

  return v39;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[_INPBCalendarEvent allocWithZone:](_INPBCalendarEvent, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSString *)self->_calendarPunchoutURI copyWithZone:a3];
  [(_INPBCalendarEvent *)v5 setCalendarPunchoutURI:v6];

  id v7 = [(_INPBDateTimeRangeValue *)self->_dateTimeRange copyWithZone:a3];
  [(_INPBCalendarEvent *)v5 setDateTimeRange:v7];

  unint64_t v8 = (void *)[(NSString *)self->_eventIdentifier copyWithZone:a3];
  [(_INPBCalendarEvent *)v5 setEventIdentifier:v8];

  if ([(_INPBCalendarEvent *)self hasIsContactBirthday]) {
    [(_INPBCalendarEvent *)v5 setIsContactBirthday:[(_INPBCalendarEvent *)self isContactBirthday]];
  }
  id v9 = [(_INPBLocation *)self->_location copyWithZone:a3];
  [(_INPBCalendarEvent *)v5 setLocation:v9];

  v10 = (void *)[(NSArray *)self->_participants copyWithZone:a3];
  [(_INPBCalendarEvent *)v5 setParticipants:v10];

  int v11 = (void *)[(NSString *)self->_title copyWithZone:a3];
  [(_INPBCalendarEvent *)v5 setTitle:v11];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCalendarEvent *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCalendarEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCalendarEvent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        unint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCalendarEvent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCalendarEvent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_INPBCalendarEvent *)self calendarPunchoutURI];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  id v6 = [(_INPBCalendarEvent *)self dateTimeRange];

  if (v6)
  {
    uint64_t v7 = [(_INPBCalendarEvent *)self dateTimeRange];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v8 = [(_INPBCalendarEvent *)self eventIdentifier];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBCalendarEvent *)self hasIsContactBirthday]) {
    PBDataWriterWriteBOOLField();
  }
  id v9 = [(_INPBCalendarEvent *)self location];

  if (v9)
  {
    v10 = [(_INPBCalendarEvent *)self location];
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

  int v16 = [(_INPBCalendarEvent *)self title];

  if (v16) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCalendarEventReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setTitle:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  title = self->_title;
  self->_title = v4;

  MEMORY[0x1F41817F8](v4, title);
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
  id v4 = (NSArray *)[a3 mutableCopy];
  participants = self->_participants;
  self->_participants = v4;

  MEMORY[0x1F41817F8](v4, participants);
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setLocation:(id)a3
{
}

- (void)setHasIsContactBirthday:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsContactBirthday
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsContactBirthday:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isContactBirthday = a3;
}

- (BOOL)hasEventIdentifier
{
  return self->_eventIdentifier != 0;
}

- (void)setEventIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  eventIdentifier = self->_eventIdentifier;
  self->_eventIdentifier = v4;

  MEMORY[0x1F41817F8](v4, eventIdentifier);
}

- (BOOL)hasDateTimeRange
{
  return self->_dateTimeRange != 0;
}

- (void)setDateTimeRange:(id)a3
{
}

- (BOOL)hasCalendarPunchoutURI
{
  return self->_calendarPunchoutURI != 0;
}

- (void)setCalendarPunchoutURI:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  calendarPunchoutURI = self->_calendarPunchoutURI;
  self->_calendarPunchoutURI = v4;

  MEMORY[0x1F41817F8](v4, calendarPunchoutURI);
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