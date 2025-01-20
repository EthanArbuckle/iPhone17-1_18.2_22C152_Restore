@interface _INPBReservationAction
+ (BOOL)supportsSecureCoding;
- (BOOL)hasType;
- (BOOL)hasUserActivity;
- (BOOL)hasValidDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDateTimeRange)validDuration;
- (_INPBReservationAction)initWithCoder:(id)a3;
- (_INPBUserActivity)userActivity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setType:(int)a3;
- (void)setUserActivity:(id)a3;
- (void)setValidDuration:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBReservationAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validDuration, 0);

  objc_storeStrong((id *)&self->_userActivity, 0);
}

- (_INPBDateTimeRange)validDuration
{
  return self->_validDuration;
}

- (_INPBUserActivity)userActivity
{
  return self->_userActivity;
}

- (int)type
{
  return self->_type;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBReservationAction *)self hasType])
  {
    uint64_t v4 = [(_INPBReservationAction *)self type];
    if (v4 == 1)
    {
      v5 = @"UNKNOWN_RESERVATION_ACTION";
    }
    else if (v4 == 2)
    {
      v5 = @"CHECK_IN";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v5 forKeyedSubscript:@"type"];
  }
  v6 = [(_INPBReservationAction *)self userActivity];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"userActivity"];

  v8 = [(_INPBReservationAction *)self validDuration];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"validDuration"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBReservationAction *)self hasType]) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_INPBUserActivity *)self->_userActivity hash] ^ v3;
  return v4 ^ [(_INPBDateTimeRange *)self->_validDuration hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  int v5 = [(_INPBReservationAction *)self hasType];
  if (v5 != [v4 hasType]) {
    goto LABEL_16;
  }
  if ([(_INPBReservationAction *)self hasType])
  {
    if ([v4 hasType])
    {
      int type = self->_type;
      if (type != [v4 type]) {
        goto LABEL_16;
      }
    }
  }
  v7 = [(_INPBReservationAction *)self userActivity];
  v8 = [v4 userActivity];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_15;
  }
  uint64_t v9 = [(_INPBReservationAction *)self userActivity];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_INPBReservationAction *)self userActivity];
    v12 = [v4 userActivity];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  v7 = [(_INPBReservationAction *)self validDuration];
  v8 = [v4 validDuration];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v14 = [(_INPBReservationAction *)self validDuration];
    if (!v14)
    {

LABEL_19:
      BOOL v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    v16 = [(_INPBReservationAction *)self validDuration];
    v17 = [v4 validDuration];
    char v18 = [v16 isEqual:v17];

    if (v18) {
      goto LABEL_19;
    }
  }
  else
  {
LABEL_15:
  }
LABEL_16:
  BOOL v19 = 0;
LABEL_17:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBReservationAction allocWithZone:](_INPBReservationAction, "allocWithZone:") init];
  if ([(_INPBReservationAction *)self hasType]) {
    [(_INPBReservationAction *)v5 setType:[(_INPBReservationAction *)self type]];
  }
  id v6 = [(_INPBUserActivity *)self->_userActivity copyWithZone:a3];
  [(_INPBReservationAction *)v5 setUserActivity:v6];

  id v7 = [(_INPBDateTimeRange *)self->_validDuration copyWithZone:a3];
  [(_INPBReservationAction *)v5 setValidDuration:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBReservationAction *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBReservationAction)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBReservationAction *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBReservationAction *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBReservationAction *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  if ([(_INPBReservationAction *)self hasType]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBReservationAction *)self userActivity];

  if (v4)
  {
    int v5 = [(_INPBReservationAction *)self userActivity];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBReservationAction *)self validDuration];

  uint64_t v7 = v9;
  if (v6)
  {
    v8 = [(_INPBReservationAction *)self validDuration];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBReservationActionReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValidDuration
{
  return self->_validDuration != 0;
}

- (void)setValidDuration:(id)a3
{
}

- (BOOL)hasUserActivity
{
  return self->_userActivity != 0;
}

- (void)setUserActivity:(id)a3
{
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"UNKNOWN_RESERVATION_ACTION"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"CHECK_IN"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"UNKNOWN_RESERVATION_ACTION";
  }
  else if (a3 == 2)
  {
    int v4 = @"CHECK_IN";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int type = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end