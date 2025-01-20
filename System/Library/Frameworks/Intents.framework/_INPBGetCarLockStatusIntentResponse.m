@interface _INPBGetCarLockStatusIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasLocked;
- (BOOL)isEqual:(id)a3;
- (BOOL)locked;
- (BOOL)readFrom:(id)a3;
- (_INPBGetCarLockStatusIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasLocked:(BOOL)a3;
- (void)setLocked:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBGetCarLockStatusIntentResponse

- (BOOL)locked
{
  return self->_locked;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBGetCarLockStatusIntentResponse *)self hasLocked])
  {
    v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBGetCarLockStatusIntentResponse locked](self, "locked"));
    [v3 setObject:v4 forKeyedSubscript:@"locked"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBGetCarLockStatusIntentResponse *)self hasLocked]) {
    return 2654435761 * self->_locked;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBGetCarLockStatusIntentResponse *)self hasLocked];
    if (v5 == [v4 hasLocked])
    {
      if (![(_INPBGetCarLockStatusIntentResponse *)self hasLocked]
        || ![v4 hasLocked]
        || (int locked = self->_locked, locked == [v4 locked]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_INPBGetCarLockStatusIntentResponse allocWithZone:a3] init];
  if ([(_INPBGetCarLockStatusIntentResponse *)self hasLocked]) {
    [(_INPBGetCarLockStatusIntentResponse *)v4 setLocked:[(_INPBGetCarLockStatusIntentResponse *)self locked]];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBGetCarLockStatusIntentResponse *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBGetCarLockStatusIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBGetCarLockStatusIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBGetCarLockStatusIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBGetCarLockStatusIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_INPBGetCarLockStatusIntentResponse *)self hasLocked]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBGetCarLockStatusIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)setHasLocked:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLocked
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLocked:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int locked = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end