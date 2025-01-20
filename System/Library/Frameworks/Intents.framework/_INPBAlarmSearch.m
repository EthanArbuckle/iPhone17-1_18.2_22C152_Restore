@interface _INPBAlarmSearch
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAlarmReferenceType;
- (BOOL)hasAlarmSearchStatus;
- (BOOL)hasIdentifier;
- (BOOL)hasIncludeSleepAlarm;
- (BOOL)hasIsMeridianInferred;
- (BOOL)hasLabel;
- (BOOL)hasPeriod;
- (BOOL)hasTime;
- (BOOL)includeSleepAlarm;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMeridianInferred;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (_INPBAlarmSearch)initWithCoder:(id)a3;
- (_INPBDataString)label;
- (_INPBDateTimeRangeValue)time;
- (id)alarmReferenceTypeAsString:(int)a3;
- (id)alarmSearchStatusAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)periodAsString:(int)a3;
- (int)StringAsAlarmReferenceType:(id)a3;
- (int)StringAsAlarmSearchStatus:(id)a3;
- (int)StringAsPeriod:(id)a3;
- (int)alarmReferenceType;
- (int)alarmSearchStatus;
- (int)period;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAlarmReferenceType:(int)a3;
- (void)setAlarmSearchStatus:(int)a3;
- (void)setHasAlarmReferenceType:(BOOL)a3;
- (void)setHasAlarmSearchStatus:(BOOL)a3;
- (void)setHasIncludeSleepAlarm:(BOOL)a3;
- (void)setHasIsMeridianInferred:(BOOL)a3;
- (void)setHasPeriod:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIncludeSleepAlarm:(BOOL)a3;
- (void)setIsMeridianInferred:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setPeriod:(int)a3;
- (void)setTime:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBAlarmSearch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (_INPBDateTimeRangeValue)time
{
  return self->_time;
}

- (int)period
{
  return self->_period;
}

- (_INPBDataString)label
{
  return self->_label;
}

- (BOOL)isMeridianInferred
{
  return self->_isMeridianInferred;
}

- (BOOL)includeSleepAlarm
{
  return self->_includeSleepAlarm;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int)alarmSearchStatus
{
  return self->_alarmSearchStatus;
}

- (int)alarmReferenceType
{
  return self->_alarmReferenceType;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBAlarmSearch *)self hasAlarmReferenceType])
  {
    uint64_t v4 = [(_INPBAlarmSearch *)self alarmReferenceType];
    if (v4 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E55205F8[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"alarmReferenceType"];
  }
  if ([(_INPBAlarmSearch *)self hasAlarmSearchStatus])
  {
    uint64_t v6 = [(_INPBAlarmSearch *)self alarmSearchStatus];
    if ((v6 - 1) >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E5520618[(v6 - 1)];
    }
    [v3 setObject:v7 forKeyedSubscript:@"alarmSearchStatus"];
  }
  if (self->_identifier)
  {
    v8 = [(_INPBAlarmSearch *)self identifier];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"identifier"];
  }
  if ([(_INPBAlarmSearch *)self hasIncludeSleepAlarm])
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBAlarmSearch includeSleepAlarm](self, "includeSleepAlarm"));
    [v3 setObject:v10 forKeyedSubscript:@"includeSleepAlarm"];
  }
  if ([(_INPBAlarmSearch *)self hasIsMeridianInferred])
  {
    v11 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBAlarmSearch isMeridianInferred](self, "isMeridianInferred"));
    [v3 setObject:v11 forKeyedSubscript:@"isMeridianInferred"];
  }
  v12 = [(_INPBAlarmSearch *)self label];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"label"];

  if ([(_INPBAlarmSearch *)self hasPeriod])
  {
    uint64_t v14 = [(_INPBAlarmSearch *)self period];
    if (v14 >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E5520638[v14];
    }
    [v3 setObject:v15 forKeyedSubscript:@"period"];
  }
  v16 = [(_INPBAlarmSearch *)self time];
  v17 = [v16 dictionaryRepresentation];
  [v3 setObject:v17 forKeyedSubscript:@"time"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBAlarmSearch *)self hasAlarmReferenceType]) {
    uint64_t v3 = 2654435761 * self->_alarmReferenceType;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(_INPBAlarmSearch *)self hasAlarmSearchStatus]) {
    uint64_t v4 = 2654435761 * self->_alarmSearchStatus;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_identifier hash];
  if ([(_INPBAlarmSearch *)self hasIncludeSleepAlarm]) {
    uint64_t v6 = 2654435761 * self->_includeSleepAlarm;
  }
  else {
    uint64_t v6 = 0;
  }
  if ([(_INPBAlarmSearch *)self hasIsMeridianInferred]) {
    uint64_t v7 = 2654435761 * self->_isMeridianInferred;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = [(_INPBDataString *)self->_label hash];
  if ([(_INPBAlarmSearch *)self hasPeriod]) {
    uint64_t v9 = 2654435761 * self->_period;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v7 ^ v5 ^ v8 ^ v9 ^ [(_INPBDateTimeRangeValue *)self->_time hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  int v5 = [(_INPBAlarmSearch *)self hasAlarmReferenceType];
  if (v5 != [v4 hasAlarmReferenceType]) {
    goto LABEL_37;
  }
  if ([(_INPBAlarmSearch *)self hasAlarmReferenceType])
  {
    if ([v4 hasAlarmReferenceType])
    {
      int alarmReferenceType = self->_alarmReferenceType;
      if (alarmReferenceType != [v4 alarmReferenceType]) {
        goto LABEL_37;
      }
    }
  }
  int v7 = [(_INPBAlarmSearch *)self hasAlarmSearchStatus];
  if (v7 != [v4 hasAlarmSearchStatus]) {
    goto LABEL_37;
  }
  if ([(_INPBAlarmSearch *)self hasAlarmSearchStatus])
  {
    if ([v4 hasAlarmSearchStatus])
    {
      int alarmSearchStatus = self->_alarmSearchStatus;
      if (alarmSearchStatus != [v4 alarmSearchStatus]) {
        goto LABEL_37;
      }
    }
  }
  uint64_t v9 = [(_INPBAlarmSearch *)self identifier];
  v10 = [v4 identifier];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_36;
  }
  uint64_t v11 = [(_INPBAlarmSearch *)self identifier];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [(_INPBAlarmSearch *)self identifier];
    uint64_t v14 = [v4 identifier];
    int v15 = [v13 isEqual:v14];

    if (!v15) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  int v16 = [(_INPBAlarmSearch *)self hasIncludeSleepAlarm];
  if (v16 != [v4 hasIncludeSleepAlarm]) {
    goto LABEL_37;
  }
  if ([(_INPBAlarmSearch *)self hasIncludeSleepAlarm])
  {
    if ([v4 hasIncludeSleepAlarm])
    {
      int includeSleepAlarm = self->_includeSleepAlarm;
      if (includeSleepAlarm != [v4 includeSleepAlarm]) {
        goto LABEL_37;
      }
    }
  }
  int v18 = [(_INPBAlarmSearch *)self hasIsMeridianInferred];
  if (v18 != [v4 hasIsMeridianInferred]) {
    goto LABEL_37;
  }
  if ([(_INPBAlarmSearch *)self hasIsMeridianInferred])
  {
    if ([v4 hasIsMeridianInferred])
    {
      int isMeridianInferred = self->_isMeridianInferred;
      if (isMeridianInferred != [v4 isMeridianInferred]) {
        goto LABEL_37;
      }
    }
  }
  uint64_t v9 = [(_INPBAlarmSearch *)self label];
  v10 = [v4 label];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_36;
  }
  uint64_t v20 = [(_INPBAlarmSearch *)self label];
  if (v20)
  {
    v21 = (void *)v20;
    v22 = [(_INPBAlarmSearch *)self label];
    v23 = [v4 label];
    int v24 = [v22 isEqual:v23];

    if (!v24) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  int v25 = [(_INPBAlarmSearch *)self hasPeriod];
  if (v25 != [v4 hasPeriod]) {
    goto LABEL_37;
  }
  if ([(_INPBAlarmSearch *)self hasPeriod])
  {
    if ([v4 hasPeriod])
    {
      int period = self->_period;
      if (period != [v4 period]) {
        goto LABEL_37;
      }
    }
  }
  uint64_t v9 = [(_INPBAlarmSearch *)self time];
  v10 = [v4 time];
  if ((v9 == 0) != (v10 != 0))
  {
    uint64_t v27 = [(_INPBAlarmSearch *)self time];
    if (!v27)
    {

LABEL_40:
      BOOL v32 = 1;
      goto LABEL_38;
    }
    v28 = (void *)v27;
    v29 = [(_INPBAlarmSearch *)self time];
    v30 = [v4 time];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_40;
    }
  }
  else
  {
LABEL_36:
  }
LABEL_37:
  BOOL v32 = 0;
LABEL_38:

  return v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBAlarmSearch allocWithZone:](_INPBAlarmSearch, "allocWithZone:") init];
  if ([(_INPBAlarmSearch *)self hasAlarmReferenceType]) {
    [(_INPBAlarmSearch *)v5 setAlarmReferenceType:[(_INPBAlarmSearch *)self alarmReferenceType]];
  }
  if ([(_INPBAlarmSearch *)self hasAlarmSearchStatus]) {
    [(_INPBAlarmSearch *)v5 setAlarmSearchStatus:[(_INPBAlarmSearch *)self alarmSearchStatus]];
  }
  uint64_t v6 = (void *)[(NSString *)self->_identifier copyWithZone:a3];
  [(_INPBAlarmSearch *)v5 setIdentifier:v6];

  if ([(_INPBAlarmSearch *)self hasIncludeSleepAlarm]) {
    [(_INPBAlarmSearch *)v5 setIncludeSleepAlarm:[(_INPBAlarmSearch *)self includeSleepAlarm]];
  }
  if ([(_INPBAlarmSearch *)self hasIsMeridianInferred]) {
    [(_INPBAlarmSearch *)v5 setIsMeridianInferred:[(_INPBAlarmSearch *)self isMeridianInferred]];
  }
  id v7 = [(_INPBDataString *)self->_label copyWithZone:a3];
  [(_INPBAlarmSearch *)v5 setLabel:v7];

  if ([(_INPBAlarmSearch *)self hasPeriod]) {
    [(_INPBAlarmSearch *)v5 setPeriod:[(_INPBAlarmSearch *)self period]];
  }
  id v8 = [(_INPBDateTimeRangeValue *)self->_time copyWithZone:a3];
  [(_INPBAlarmSearch *)v5 setTime:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBAlarmSearch *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBAlarmSearch)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBAlarmSearch *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBAlarmSearch *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBAlarmSearch *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  if ([(_INPBAlarmSearch *)self hasAlarmReferenceType]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBAlarmSearch *)self hasAlarmSearchStatus]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBAlarmSearch *)self identifier];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBAlarmSearch *)self hasIncludeSleepAlarm]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBAlarmSearch *)self hasIsMeridianInferred]) {
    PBDataWriterWriteBOOLField();
  }
  int v5 = [(_INPBAlarmSearch *)self label];

  if (v5)
  {
    id v6 = [(_INPBAlarmSearch *)self label];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBAlarmSearch *)self hasPeriod]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v7 = [(_INPBAlarmSearch *)self time];

  id v8 = v10;
  if (v7)
  {
    uint64_t v9 = [(_INPBAlarmSearch *)self time];
    PBDataWriterWriteSubmessage();

    id v8 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAlarmSearchReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTime
{
  return self->_time != 0;
}

- (void)setTime:(id)a3
{
}

- (int)StringAsPeriod:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PERIOD"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MORNING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AFTERNOON"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EVENING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NIGHT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NOON"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MIDNIGHT"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"TODAY"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"TOMORROW"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)periodAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5520638[a3];
  }

  return v3;
}

- (void)setHasPeriod:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPeriod
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setPeriod:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xEF;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 0x10;
    self->_int period = a3;
  }
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setLabel:(id)a3
{
}

- (void)setHasIsMeridianInferred:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsMeridianInferred
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsMeridianInferred:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isMeridianInferred = a3;
}

- (void)setHasIncludeSleepAlarm:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIncludeSleepAlarm
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIncludeSleepAlarm:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int includeSleepAlarm = a3;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setIdentifier:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  identifier = self->_identifier;
  self->_identifier = v4;

  MEMORY[0x1F41817F8](v4, identifier);
}

- (int)StringAsAlarmSearchStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ENABLED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DISABLED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FIRING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SNOOZED"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)alarmSearchStatusAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5520618[a3 - 1];
  }

  return v3;
}

- (void)setHasAlarmSearchStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAlarmSearchStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAlarmSearchStatus:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int alarmSearchStatus = a3;
  }
}

- (int)StringAsAlarmReferenceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEFAULT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"THIS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NEXT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ALL"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)alarmReferenceTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E55205F8[a3];
  }

  return v3;
}

- (void)setHasAlarmReferenceType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAlarmReferenceType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAlarmReferenceType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int alarmReferenceType = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end