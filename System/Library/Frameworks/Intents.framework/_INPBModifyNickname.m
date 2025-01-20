@interface _INPBModifyNickname
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIsRemoval;
- (BOOL)hasTargetNickname;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRemoval;
- (BOOL)readFrom:(id)a3;
- (_INPBModifyNickname)initWithCoder:(id)a3;
- (_INPBString)targetNickname;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasIsRemoval:(BOOL)a3;
- (void)setIsRemoval:(BOOL)a3;
- (void)setTargetNickname:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBModifyNickname

- (void).cxx_destruct
{
}

- (_INPBString)targetNickname
{
  return self->_targetNickname;
}

- (BOOL)isRemoval
{
  return self->_isRemoval;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBModifyNickname *)self hasIsRemoval])
  {
    v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBModifyNickname isRemoval](self, "isRemoval"));
    [v3 setObject:v4 forKeyedSubscript:@"isRemoval"];
  }
  v5 = [(_INPBModifyNickname *)self targetNickname];
  v6 = [v5 dictionaryRepresentation];
  [v3 setObject:v6 forKeyedSubscript:@"targetNickname"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBModifyNickname *)self hasIsRemoval]) {
    uint64_t v3 = 2654435761 * self->_isRemoval;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(_INPBString *)self->_targetNickname hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBModifyNickname *)self hasIsRemoval];
    if (v5 == [v4 hasIsRemoval])
    {
      if (![(_INPBModifyNickname *)self hasIsRemoval]
        || ![v4 hasIsRemoval]
        || (int isRemoval = self->_isRemoval, isRemoval == [v4 isRemoval]))
      {
        v7 = [(_INPBModifyNickname *)self targetNickname];
        v8 = [v4 targetNickname];
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          uint64_t v10 = [(_INPBModifyNickname *)self targetNickname];
          if (!v10)
          {

LABEL_14:
            BOOL v15 = 1;
            goto LABEL_12;
          }
          v11 = (void *)v10;
          v12 = [(_INPBModifyNickname *)self targetNickname];
          v13 = [v4 targetNickname];
          char v14 = [v12 isEqual:v13];

          if (v14) {
            goto LABEL_14;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v15 = 0;
LABEL_12:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBModifyNickname allocWithZone:](_INPBModifyNickname, "allocWithZone:") init];
  if ([(_INPBModifyNickname *)self hasIsRemoval]) {
    [(_INPBModifyNickname *)v5 setIsRemoval:[(_INPBModifyNickname *)self isRemoval]];
  }
  id v6 = [(_INPBString *)self->_targetNickname copyWithZone:a3];
  [(_INPBModifyNickname *)v5 setTargetNickname:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBModifyNickname *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBModifyNickname)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBModifyNickname *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBModifyNickname *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBModifyNickname *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_INPBModifyNickname *)self hasIsRemoval]) {
    PBDataWriterWriteBOOLField();
  }
  id v4 = [(_INPBModifyNickname *)self targetNickname];

  int v5 = v7;
  if (v4)
  {
    id v6 = [(_INPBModifyNickname *)self targetNickname];
    PBDataWriterWriteSubmessage();

    int v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBModifyNicknameReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTargetNickname
{
  return self->_targetNickname != 0;
}

- (void)setTargetNickname:(id)a3
{
}

- (void)setHasIsRemoval:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsRemoval
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsRemoval:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isRemoval = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end