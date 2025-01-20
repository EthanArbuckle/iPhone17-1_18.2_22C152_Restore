@interface _INPBDeleteFilePermanentlyIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)confirm;
- (BOOL)hasConfirm;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (_INPBDeleteFilePermanentlyIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConfirm:(BOOL)a3;
- (void)setHasConfirm:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBDeleteFilePermanentlyIntentResponse

- (BOOL)success
{
  return self->_success;
}

- (BOOL)confirm
{
  return self->_confirm;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBDeleteFilePermanentlyIntentResponse *)self hasConfirm])
  {
    v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBDeleteFilePermanentlyIntentResponse confirm](self, "confirm"));
    [v3 setObject:v4 forKeyedSubscript:@"confirm"];
  }
  if ([(_INPBDeleteFilePermanentlyIntentResponse *)self hasSuccess])
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBDeleteFilePermanentlyIntentResponse success](self, "success"));
    [v3 setObject:v5 forKeyedSubscript:@"success"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBDeleteFilePermanentlyIntentResponse *)self hasConfirm]) {
    uint64_t v3 = 2654435761 * self->_confirm;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(_INPBDeleteFilePermanentlyIntentResponse *)self hasSuccess]) {
    uint64_t v4 = 2654435761 * self->_success;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v8 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBDeleteFilePermanentlyIntentResponse *)self hasConfirm];
    if (v5 == [v4 hasConfirm])
    {
      if (![(_INPBDeleteFilePermanentlyIntentResponse *)self hasConfirm]
        || ![v4 hasConfirm]
        || (int confirm = self->_confirm, confirm == [v4 confirm]))
      {
        int v7 = [(_INPBDeleteFilePermanentlyIntentResponse *)self hasSuccess];
        if (v7 == [v4 hasSuccess])
        {
          if (![(_INPBDeleteFilePermanentlyIntentResponse *)self hasSuccess]
            || ![v4 hasSuccess]
            || (int success = self->_success, success == [v4 success]))
          {
            BOOL v8 = 1;
          }
        }
      }
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_INPBDeleteFilePermanentlyIntentResponse allocWithZone:a3] init];
  if ([(_INPBDeleteFilePermanentlyIntentResponse *)self hasConfirm]) {
    [(_INPBDeleteFilePermanentlyIntentResponse *)v4 setConfirm:[(_INPBDeleteFilePermanentlyIntentResponse *)self confirm]];
  }
  if ([(_INPBDeleteFilePermanentlyIntentResponse *)self hasSuccess]) {
    [(_INPBDeleteFilePermanentlyIntentResponse *)v4 setSuccess:[(_INPBDeleteFilePermanentlyIntentResponse *)self success]];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBDeleteFilePermanentlyIntentResponse *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBDeleteFilePermanentlyIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBDeleteFilePermanentlyIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBDeleteFilePermanentlyIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBDeleteFilePermanentlyIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_INPBDeleteFilePermanentlyIntentResponse *)self hasConfirm]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBDeleteFilePermanentlyIntentResponse *)self hasSuccess]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDeleteFilePermanentlyIntentResponseReadFrom(self, (uint64_t)a3);
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

- (void)setHasConfirm:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfirm
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setConfirm:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int confirm = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end