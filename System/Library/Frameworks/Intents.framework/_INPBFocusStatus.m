@interface _INPBFocusStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIsFocused;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFocused;
- (BOOL)readFrom:(id)a3;
- (_INPBFocusStatus)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasIsFocused:(BOOL)a3;
- (void)setIsFocused:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBFocusStatus

- (BOOL)isFocused
{
  return self->_isFocused;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBFocusStatus *)self hasIsFocused])
  {
    v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBFocusStatus isFocused](self, "isFocused"));
    [v3 setObject:v4 forKeyedSubscript:@"isFocused"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBFocusStatus *)self hasIsFocused]) {
    return 2654435761 * self->_isFocused;
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
    int v5 = [(_INPBFocusStatus *)self hasIsFocused];
    if (v5 == [v4 hasIsFocused])
    {
      if (![(_INPBFocusStatus *)self hasIsFocused]
        || ![v4 hasIsFocused]
        || (int isFocused = self->_isFocused, isFocused == [v4 isFocused]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_INPBFocusStatus allocWithZone:a3] init];
  if ([(_INPBFocusStatus *)self hasIsFocused]) {
    [(_INPBFocusStatus *)v4 setIsFocused:[(_INPBFocusStatus *)self isFocused]];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBFocusStatus *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBFocusStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBFocusStatus *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBFocusStatus *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBFocusStatus *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_INPBFocusStatus *)self hasIsFocused]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBFocusStatusReadFrom(self, (uint64_t)a3);
}

- (void)setHasIsFocused:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsFocused
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsFocused:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isFocused = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end