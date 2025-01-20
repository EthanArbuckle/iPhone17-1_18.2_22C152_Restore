@interface _INPBModifyRelationship
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIsRemoval;
- (BOOL)hasTargetRelationship;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRemoval;
- (BOOL)readFrom:(id)a3;
- (_INPBModifyRelationship)initWithCoder:(id)a3;
- (_INPBString)targetRelationship;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasIsRemoval:(BOOL)a3;
- (void)setIsRemoval:(BOOL)a3;
- (void)setTargetRelationship:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBModifyRelationship

- (void).cxx_destruct
{
}

- (_INPBString)targetRelationship
{
  return self->_targetRelationship;
}

- (BOOL)isRemoval
{
  return self->_isRemoval;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBModifyRelationship *)self hasIsRemoval])
  {
    v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBModifyRelationship isRemoval](self, "isRemoval"));
    [v3 setObject:v4 forKeyedSubscript:@"isRemoval"];
  }
  v5 = [(_INPBModifyRelationship *)self targetRelationship];
  v6 = [v5 dictionaryRepresentation];
  [v3 setObject:v6 forKeyedSubscript:@"targetRelationship"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBModifyRelationship *)self hasIsRemoval]) {
    uint64_t v3 = 2654435761 * self->_isRemoval;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(_INPBString *)self->_targetRelationship hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBModifyRelationship *)self hasIsRemoval];
    if (v5 == [v4 hasIsRemoval])
    {
      if (![(_INPBModifyRelationship *)self hasIsRemoval]
        || ![v4 hasIsRemoval]
        || (int isRemoval = self->_isRemoval, isRemoval == [v4 isRemoval]))
      {
        v7 = [(_INPBModifyRelationship *)self targetRelationship];
        v8 = [v4 targetRelationship];
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          uint64_t v10 = [(_INPBModifyRelationship *)self targetRelationship];
          if (!v10)
          {

LABEL_14:
            BOOL v15 = 1;
            goto LABEL_12;
          }
          v11 = (void *)v10;
          v12 = [(_INPBModifyRelationship *)self targetRelationship];
          v13 = [v4 targetRelationship];
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
  int v5 = [+[_INPBModifyRelationship allocWithZone:](_INPBModifyRelationship, "allocWithZone:") init];
  if ([(_INPBModifyRelationship *)self hasIsRemoval]) {
    [(_INPBModifyRelationship *)v5 setIsRemoval:[(_INPBModifyRelationship *)self isRemoval]];
  }
  id v6 = [(_INPBString *)self->_targetRelationship copyWithZone:a3];
  [(_INPBModifyRelationship *)v5 setTargetRelationship:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBModifyRelationship *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBModifyRelationship)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBModifyRelationship *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBModifyRelationship *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBModifyRelationship *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_INPBModifyRelationship *)self hasIsRemoval]) {
    PBDataWriterWriteBOOLField();
  }
  id v4 = [(_INPBModifyRelationship *)self targetRelationship];

  int v5 = v7;
  if (v4)
  {
    id v6 = [(_INPBModifyRelationship *)self targetRelationship];
    PBDataWriterWriteSubmessage();

    int v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBModifyRelationshipReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTargetRelationship
{
  return self->_targetRelationship != 0;
}

- (void)setTargetRelationship:(id)a3
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