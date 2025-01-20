@interface _INPBDateTimeRangeValue
+ (BOOL)supportsSecureCoding;
- (BOOL)allDay;
- (BOOL)hasAllDay;
- (BOOL)hasEndCalendar;
- (BOOL)hasEndDateTime;
- (BOOL)hasName;
- (BOOL)hasRecurrence;
- (BOOL)hasStartCalendar;
- (BOOL)hasStartDateTime;
- (BOOL)hasValueMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)name;
- (_INPBDateTime)endDateTime;
- (_INPBDateTime)startDateTime;
- (_INPBDateTimeRangeValue)initWithCoder:(id)a3;
- (_INPBRecurrenceValue)recurrence;
- (_INPBValueMetadata)valueMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)endCalendar;
- (int64_t)startCalendar;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAllDay:(BOOL)a3;
- (void)setEndCalendar:(int64_t)a3;
- (void)setEndDateTime:(id)a3;
- (void)setHasAllDay:(BOOL)a3;
- (void)setHasEndCalendar:(BOOL)a3;
- (void)setHasStartCalendar:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setRecurrence:(id)a3;
- (void)setStartCalendar:(int64_t)a3;
- (void)setStartDateTime:(id)a3;
- (void)setValueMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBDateTimeRangeValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_startDateTime, 0);
  objc_storeStrong((id *)&self->_recurrence, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_endDateTime, 0);
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (_INPBDateTime)startDateTime
{
  return self->_startDateTime;
}

- (int64_t)startCalendar
{
  return self->_startCalendar;
}

- (_INPBRecurrenceValue)recurrence
{
  return self->_recurrence;
}

- (NSString)name
{
  return self->_name;
}

- (_INPBDateTime)endDateTime
{
  return self->_endDateTime;
}

- (int64_t)endCalendar
{
  return self->_endCalendar;
}

- (BOOL)allDay
{
  return self->_allDay;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBDateTimeRangeValue *)self hasAllDay])
  {
    v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBDateTimeRangeValue allDay](self, "allDay"));
    [v3 setObject:v4 forKeyedSubscript:@"allDay"];
  }
  if ([(_INPBDateTimeRangeValue *)self hasEndCalendar])
  {
    v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_INPBDateTimeRangeValue endCalendar](self, "endCalendar"));
    [v3 setObject:v5 forKeyedSubscript:@"endCalendar"];
  }
  v6 = [(_INPBDateTimeRangeValue *)self endDateTime];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"endDateTime"];

  if (self->_name)
  {
    v8 = [(_INPBDateTimeRangeValue *)self name];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"name"];
  }
  v10 = [(_INPBDateTimeRangeValue *)self recurrence];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"recurrence"];

  if ([(_INPBDateTimeRangeValue *)self hasStartCalendar])
  {
    v12 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_INPBDateTimeRangeValue startCalendar](self, "startCalendar"));
    [v3 setObject:v12 forKeyedSubscript:@"startCalendar"];
  }
  v13 = [(_INPBDateTimeRangeValue *)self startDateTime];
  v14 = [v13 dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"startDateTime"];

  v15 = [(_INPBDateTimeRangeValue *)self valueMetadata];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBDateTimeRangeValue *)self hasAllDay]) {
    uint64_t v3 = 2654435761 * self->_allDay;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(_INPBDateTimeRangeValue *)self hasEndCalendar]) {
    uint64_t v4 = 2654435761 * self->_endCalendar;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(_INPBDateTime *)self->_endDateTime hash];
  NSUInteger v6 = [(NSString *)self->_name hash];
  unint64_t v7 = [(_INPBRecurrenceValue *)self->_recurrence hash];
  if ([(_INPBDateTimeRangeValue *)self hasStartCalendar]) {
    uint64_t v8 = 2654435761 * self->_startCalendar;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7;
  unint64_t v10 = v8 ^ [(_INPBDateTime *)self->_startDateTime hash];
  return v9 ^ v10 ^ [(_INPBValueMetadata *)self->_valueMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_39;
  }
  int v5 = [(_INPBDateTimeRangeValue *)self hasAllDay];
  if (v5 != [v4 hasAllDay]) {
    goto LABEL_39;
  }
  if ([(_INPBDateTimeRangeValue *)self hasAllDay])
  {
    if ([v4 hasAllDay])
    {
      int allDay = self->_allDay;
      if (allDay != [v4 allDay]) {
        goto LABEL_39;
      }
    }
  }
  int v7 = [(_INPBDateTimeRangeValue *)self hasEndCalendar];
  if (v7 != [v4 hasEndCalendar]) {
    goto LABEL_39;
  }
  if ([(_INPBDateTimeRangeValue *)self hasEndCalendar])
  {
    if ([v4 hasEndCalendar])
    {
      int64_t endCalendar = self->_endCalendar;
      if (endCalendar != [v4 endCalendar]) {
        goto LABEL_39;
      }
    }
  }
  unint64_t v9 = [(_INPBDateTimeRangeValue *)self endDateTime];
  unint64_t v10 = [v4 endDateTime];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_38;
  }
  uint64_t v11 = [(_INPBDateTimeRangeValue *)self endDateTime];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [(_INPBDateTimeRangeValue *)self endDateTime];
    v14 = [v4 endDateTime];
    int v15 = [v13 isEqual:v14];

    if (!v15) {
      goto LABEL_39;
    }
  }
  else
  {
  }
  unint64_t v9 = [(_INPBDateTimeRangeValue *)self name];
  unint64_t v10 = [v4 name];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_38;
  }
  uint64_t v16 = [(_INPBDateTimeRangeValue *)self name];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [(_INPBDateTimeRangeValue *)self name];
    v19 = [v4 name];
    int v20 = [v18 isEqual:v19];

    if (!v20) {
      goto LABEL_39;
    }
  }
  else
  {
  }
  unint64_t v9 = [(_INPBDateTimeRangeValue *)self recurrence];
  unint64_t v10 = [v4 recurrence];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_38;
  }
  uint64_t v21 = [(_INPBDateTimeRangeValue *)self recurrence];
  if (v21)
  {
    v22 = (void *)v21;
    v23 = [(_INPBDateTimeRangeValue *)self recurrence];
    v24 = [v4 recurrence];
    int v25 = [v23 isEqual:v24];

    if (!v25) {
      goto LABEL_39;
    }
  }
  else
  {
  }
  int v26 = [(_INPBDateTimeRangeValue *)self hasStartCalendar];
  if (v26 != [v4 hasStartCalendar]) {
    goto LABEL_39;
  }
  if ([(_INPBDateTimeRangeValue *)self hasStartCalendar])
  {
    if ([v4 hasStartCalendar])
    {
      int64_t startCalendar = self->_startCalendar;
      if (startCalendar != [v4 startCalendar]) {
        goto LABEL_39;
      }
    }
  }
  unint64_t v9 = [(_INPBDateTimeRangeValue *)self startDateTime];
  unint64_t v10 = [v4 startDateTime];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_38;
  }
  uint64_t v28 = [(_INPBDateTimeRangeValue *)self startDateTime];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(_INPBDateTimeRangeValue *)self startDateTime];
    v31 = [v4 startDateTime];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_39;
    }
  }
  else
  {
  }
  unint64_t v9 = [(_INPBDateTimeRangeValue *)self valueMetadata];
  unint64_t v10 = [v4 valueMetadata];
  if ((v9 == 0) != (v10 != 0))
  {
    uint64_t v33 = [(_INPBDateTimeRangeValue *)self valueMetadata];
    if (!v33)
    {

LABEL_42:
      BOOL v38 = 1;
      goto LABEL_40;
    }
    v34 = (void *)v33;
    v35 = [(_INPBDateTimeRangeValue *)self valueMetadata];
    v36 = [v4 valueMetadata];
    char v37 = [v35 isEqual:v36];

    if (v37) {
      goto LABEL_42;
    }
  }
  else
  {
LABEL_38:
  }
LABEL_39:
  BOOL v38 = 0;
LABEL_40:

  return v38;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBDateTimeRangeValue allocWithZone:](_INPBDateTimeRangeValue, "allocWithZone:") init];
  if ([(_INPBDateTimeRangeValue *)self hasAllDay]) {
    [(_INPBDateTimeRangeValue *)v5 setAllDay:[(_INPBDateTimeRangeValue *)self allDay]];
  }
  if ([(_INPBDateTimeRangeValue *)self hasEndCalendar]) {
    [(_INPBDateTimeRangeValue *)v5 setEndCalendar:[(_INPBDateTimeRangeValue *)self endCalendar]];
  }
  id v6 = [(_INPBDateTime *)self->_endDateTime copyWithZone:a3];
  [(_INPBDateTimeRangeValue *)v5 setEndDateTime:v6];

  int v7 = (void *)[(NSString *)self->_name copyWithZone:a3];
  [(_INPBDateTimeRangeValue *)v5 setName:v7];

  id v8 = [(_INPBRecurrenceValue *)self->_recurrence copyWithZone:a3];
  [(_INPBDateTimeRangeValue *)v5 setRecurrence:v8];

  if ([(_INPBDateTimeRangeValue *)self hasStartCalendar]) {
    [(_INPBDateTimeRangeValue *)v5 setStartCalendar:[(_INPBDateTimeRangeValue *)self startCalendar]];
  }
  id v9 = [(_INPBDateTime *)self->_startDateTime copyWithZone:a3];
  [(_INPBDateTimeRangeValue *)v5 setStartDateTime:v9];

  id v10 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBDateTimeRangeValue *)v5 setValueMetadata:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBDateTimeRangeValue *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBDateTimeRangeValue)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBDateTimeRangeValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBDateTimeRangeValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBDateTimeRangeValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  if ([(_INPBDateTimeRangeValue *)self hasAllDay]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBDateTimeRangeValue *)self hasEndCalendar]) {
    PBDataWriterWriteInt64Field();
  }
  id v4 = [(_INPBDateTimeRangeValue *)self endDateTime];

  if (v4)
  {
    int v5 = [(_INPBDateTimeRangeValue *)self endDateTime];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBDateTimeRangeValue *)self name];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(_INPBDateTimeRangeValue *)self recurrence];

  if (v7)
  {
    id v8 = [(_INPBDateTimeRangeValue *)self recurrence];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBDateTimeRangeValue *)self hasStartCalendar]) {
    PBDataWriterWriteInt64Field();
  }
  id v9 = [(_INPBDateTimeRangeValue *)self startDateTime];

  if (v9)
  {
    id v10 = [(_INPBDateTimeRangeValue *)self startDateTime];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v11 = [(_INPBDateTimeRangeValue *)self valueMetadata];

  v12 = v14;
  if (v11)
  {
    v13 = [(_INPBDateTimeRangeValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();

    v12 = v14;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDateTimeRangeValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (void)setValueMetadata:(id)a3
{
}

- (BOOL)hasStartDateTime
{
  return self->_startDateTime != 0;
}

- (void)setStartDateTime:(id)a3
{
}

- (void)setHasStartCalendar:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStartCalendar
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setStartCalendar:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int64_t startCalendar = a3;
}

- (BOOL)hasRecurrence
{
  return self->_recurrence != 0;
}

- (void)setRecurrence:(id)a3
{
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

- (BOOL)hasEndDateTime
{
  return self->_endDateTime != 0;
}

- (void)setEndDateTime:(id)a3
{
}

- (void)setHasEndCalendar:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndCalendar
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEndCalendar:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int64_t endCalendar = a3;
}

- (void)setHasAllDay:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAllDay
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAllDay:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int allDay = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end