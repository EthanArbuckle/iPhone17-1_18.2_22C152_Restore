@interface _INPBTicketedEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCategory;
- (BOOL)hasEventDuration;
- (BOOL)hasLocation;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)name;
- (_INPBDateTimeRange)eventDuration;
- (_INPBLocationValue)location;
- (_INPBTicketedEvent)initWithCoder:(id)a3;
- (id)categoryAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsCategory:(id)a3;
- (int)category;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCategory:(int)a3;
- (void)setEventDuration:(id)a3;
- (void)setHasCategory:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBTicketedEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_eventDuration, 0);
}

- (NSString)name
{
  return self->_name;
}

- (_INPBLocationValue)location
{
  return self->_location;
}

- (_INPBDateTimeRange)eventDuration
{
  return self->_eventDuration;
}

- (int)category
{
  return self->_category;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBTicketedEvent *)self hasCategory])
  {
    uint64_t v4 = [(_INPBTicketedEvent *)self category];
    if (v4 == 1)
    {
      v5 = @"UNKNOWN";
    }
    else if (v4 == 2)
    {
      v5 = @"MOVIE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v5 forKeyedSubscript:@"category"];
  }
  v6 = [(_INPBTicketedEvent *)self eventDuration];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"eventDuration"];

  v8 = [(_INPBTicketedEvent *)self location];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"location"];

  if (self->_name)
  {
    v10 = [(_INPBTicketedEvent *)self name];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"name"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBTicketedEvent *)self hasCategory]) {
    uint64_t v3 = 2654435761 * self->_category;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_INPBDateTimeRange *)self->_eventDuration hash] ^ v3;
  unint64_t v5 = [(_INPBLocationValue *)self->_location hash];
  return v4 ^ v5 ^ [(NSString *)self->_name hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  int v5 = [(_INPBTicketedEvent *)self hasCategory];
  if (v5 != [v4 hasCategory]) {
    goto LABEL_21;
  }
  if ([(_INPBTicketedEvent *)self hasCategory])
  {
    if ([v4 hasCategory])
    {
      int category = self->_category;
      if (category != [v4 category]) {
        goto LABEL_21;
      }
    }
  }
  v7 = [(_INPBTicketedEvent *)self eventDuration];
  v8 = [v4 eventDuration];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_20;
  }
  uint64_t v9 = [(_INPBTicketedEvent *)self eventDuration];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_INPBTicketedEvent *)self eventDuration];
    v12 = [v4 eventDuration];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  v7 = [(_INPBTicketedEvent *)self location];
  v8 = [v4 location];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_20;
  }
  uint64_t v14 = [(_INPBTicketedEvent *)self location];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBTicketedEvent *)self location];
    v17 = [v4 location];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  v7 = [(_INPBTicketedEvent *)self name];
  v8 = [v4 name];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v19 = [(_INPBTicketedEvent *)self name];
    if (!v19)
    {

LABEL_24:
      BOOL v24 = 1;
      goto LABEL_22;
    }
    v20 = (void *)v19;
    v21 = [(_INPBTicketedEvent *)self name];
    v22 = [v4 name];
    char v23 = [v21 isEqual:v22];

    if (v23) {
      goto LABEL_24;
    }
  }
  else
  {
LABEL_20:
  }
LABEL_21:
  BOOL v24 = 0;
LABEL_22:

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBTicketedEvent allocWithZone:](_INPBTicketedEvent, "allocWithZone:") init];
  if ([(_INPBTicketedEvent *)self hasCategory]) {
    [(_INPBTicketedEvent *)v5 setCategory:[(_INPBTicketedEvent *)self category]];
  }
  id v6 = [(_INPBDateTimeRange *)self->_eventDuration copyWithZone:a3];
  [(_INPBTicketedEvent *)v5 setEventDuration:v6];

  id v7 = [(_INPBLocationValue *)self->_location copyWithZone:a3];
  [(_INPBTicketedEvent *)v5 setLocation:v7];

  v8 = (void *)[(NSString *)self->_name copyWithZone:a3];
  [(_INPBTicketedEvent *)v5 setName:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBTicketedEvent *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBTicketedEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBTicketedEvent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBTicketedEvent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBTicketedEvent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  if ([(_INPBTicketedEvent *)self hasCategory]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBTicketedEvent *)self eventDuration];

  if (v4)
  {
    int v5 = [(_INPBTicketedEvent *)self eventDuration];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBTicketedEvent *)self location];

  if (v6)
  {
    uint64_t v7 = [(_INPBTicketedEvent *)self location];
    PBDataWriterWriteSubmessage();
  }
  v8 = [(_INPBTicketedEvent *)self name];

  uint64_t v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    uint64_t v9 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBTicketedEventReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  name = self->_name;
  self->_name = v4;

  MEMORY[0x1F41817F8](v4, name);
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setLocation:(id)a3
{
}

- (BOOL)hasEventDuration
{
  return self->_eventDuration != 0;
}

- (void)setEventDuration:(id)a3
{
}

- (int)StringAsCategory:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"UNKNOWN"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"MOVIE"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)categoryAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"UNKNOWN";
  }
  else if (a3 == 2)
  {
    int v4 = @"MOVIE";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasCategory:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCategory
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCategory:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int category = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end