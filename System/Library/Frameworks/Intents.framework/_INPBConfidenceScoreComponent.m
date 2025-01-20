@interface _INPBConfidenceScoreComponent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasScore;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)source;
- (_INPBConfidenceScoreComponent)initWithCoder:(id)a3;
- (float)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setScore:(float)a3;
- (void)setSource:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBConfidenceScoreComponent

- (void).cxx_destruct
{
}

- (NSString)source
{
  return self->_source;
}

- (float)score
{
  return self->_score;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBConfidenceScoreComponent *)self hasScore])
  {
    v4 = NSNumber;
    [(_INPBConfidenceScoreComponent *)self score];
    v5 = objc_msgSend(v4, "numberWithFloat:");
    [v3 setObject:v5 forKeyedSubscript:@"score"];
  }
  if (self->_source)
  {
    v6 = [(_INPBConfidenceScoreComponent *)self source];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"source"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBConfidenceScoreComponent *)self hasScore])
  {
    float score = self->_score;
    double v4 = score;
    if (score < 0.0) {
      double v4 = -score;
    }
    long double v5 = floor(v4 + 0.5);
    double v6 = (v4 - v5) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
    if (v6 >= 0.0)
    {
      if (v6 > 0.0) {
        v7 += (unint64_t)v6;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v6);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  return [(NSString *)self->_source hash] ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBConfidenceScoreComponent *)self hasScore];
    if (v5 == [v4 hasScore])
    {
      if (![(_INPBConfidenceScoreComponent *)self hasScore]
        || ![v4 hasScore]
        || (float score = self->_score, [v4 score], score == v7))
      {
        v8 = [(_INPBConfidenceScoreComponent *)self source];
        v9 = [v4 source];
        v10 = v9;
        if ((v8 == 0) != (v9 != 0))
        {
          uint64_t v11 = [(_INPBConfidenceScoreComponent *)self source];
          if (!v11)
          {

LABEL_14:
            BOOL v16 = 1;
            goto LABEL_12;
          }
          v12 = (void *)v11;
          v13 = [(_INPBConfidenceScoreComponent *)self source];
          v14 = [v4 source];
          char v15 = [v13 isEqual:v14];

          if (v15) {
            goto LABEL_14;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v16 = 0;
LABEL_12:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBConfidenceScoreComponent allocWithZone:](_INPBConfidenceScoreComponent, "allocWithZone:") init];
  if ([(_INPBConfidenceScoreComponent *)self hasScore])
  {
    [(_INPBConfidenceScoreComponent *)self score];
    -[_INPBConfidenceScoreComponent setScore:](v5, "setScore:");
  }
  double v6 = (void *)[(NSString *)self->_source copyWithZone:a3];
  [(_INPBConfidenceScoreComponent *)v5 setSource:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBConfidenceScoreComponent *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBConfidenceScoreComponent)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBConfidenceScoreComponent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBConfidenceScoreComponent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBConfidenceScoreComponent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ([(_INPBConfidenceScoreComponent *)self hasScore]) {
    PBDataWriterWriteFloatField();
  }
  id v4 = [(_INPBConfidenceScoreComponent *)self source];

  int v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    int v5 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBConfidenceScoreComponentReadFrom(self, (uint64_t)a3, v3);
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (void)setSource:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  source = self->_source;
  self->_source = v4;

  MEMORY[0x1F41817F8](v4, source);
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setScore:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float score = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end