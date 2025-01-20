@interface _INPBScoredValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasScore;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)value;
- (_INPBScoredValue)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)score;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setScore:(int64_t)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBScoredValue

- (void).cxx_destruct
{
}

- (NSString)value
{
  return self->_value;
}

- (int64_t)score
{
  return self->_score;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBScoredValue *)self hasScore])
  {
    v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_INPBScoredValue score](self, "score"));
    [v3 setObject:v4 forKeyedSubscript:@"score"];
  }
  if (self->_value)
  {
    v5 = [(_INPBScoredValue *)self value];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"value"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBScoredValue *)self hasScore]) {
    uint64_t v3 = 2654435761 * self->_score;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(NSString *)self->_value hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBScoredValue *)self hasScore];
    if (v5 == [v4 hasScore])
    {
      if (![(_INPBScoredValue *)self hasScore]
        || ![v4 hasScore]
        || (int64_t score = self->_score, score == [v4 score]))
      {
        v7 = [(_INPBScoredValue *)self value];
        v8 = [v4 value];
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          uint64_t v10 = [(_INPBScoredValue *)self value];
          if (!v10)
          {

LABEL_14:
            BOOL v15 = 1;
            goto LABEL_12;
          }
          v11 = (void *)v10;
          v12 = [(_INPBScoredValue *)self value];
          v13 = [v4 value];
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
  int v5 = [+[_INPBScoredValue allocWithZone:](_INPBScoredValue, "allocWithZone:") init];
  if ([(_INPBScoredValue *)self hasScore]) {
    [(_INPBScoredValue *)v5 setScore:[(_INPBScoredValue *)self score]];
  }
  v6 = (void *)[(NSString *)self->_value copyWithZone:a3];
  [(_INPBScoredValue *)v5 setValue:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBScoredValue *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBScoredValue)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBScoredValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBScoredValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBScoredValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ([(_INPBScoredValue *)self hasScore]) {
    PBDataWriterWriteInt64Field();
  }
  id v4 = [(_INPBScoredValue *)self value];

  int v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    int v5 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBScoredValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setValue:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  value = self->_value;
  self->_value = v4;

  MEMORY[0x1F41817F8](v4, value);
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setScore:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t score = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end