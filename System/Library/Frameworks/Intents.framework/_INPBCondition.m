@interface _INPBCondition
+ (BOOL)supportsSecureCoding;
- (BOOL)hasConditionalOperator;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBCondition)initWithCoder:(id)a3;
- (id)conditionalOperatorAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsConditionalOperator:(id)a3;
- (int)conditionalOperator;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConditionalOperator:(int)a3;
- (void)setHasConditionalOperator:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCondition

- (int)conditionalOperator
{
  return self->_conditionalOperator;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBCondition *)self hasConditionalOperator])
  {
    uint64_t v4 = [(_INPBCondition *)self conditionalOperator];
    if ((v4 - 1) >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E551B7E8[(v4 - 1)];
    }
    [v3 setObject:v5 forKeyedSubscript:@"conditionalOperator"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBCondition *)self hasConditionalOperator]) {
    return 2654435761 * self->_conditionalOperator;
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
    int v5 = [(_INPBCondition *)self hasConditionalOperator];
    if (v5 == [v4 hasConditionalOperator])
    {
      if (![(_INPBCondition *)self hasConditionalOperator]
        || ![v4 hasConditionalOperator]
        || (int conditionalOperator = self->_conditionalOperator,
            conditionalOperator == [v4 conditionalOperator]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_INPBCondition allocWithZone:a3] init];
  if ([(_INPBCondition *)self hasConditionalOperator]) {
    [(_INPBCondition *)v4 setConditionalOperator:[(_INPBCondition *)self conditionalOperator]];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCondition *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCondition)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCondition *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCondition *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCondition *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_INPBCondition *)self hasConditionalOperator]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBConditionReadFrom(self, (uint64_t)a3);
}

- (int)StringAsConditionalOperator:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ALL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ANY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NOT_ALL"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)conditionalOperatorAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551B7E8[a3 - 1];
  }

  return v3;
}

- (void)setHasConditionalOperator:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConditionalOperator
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setConditionalOperator:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int conditionalOperator = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end