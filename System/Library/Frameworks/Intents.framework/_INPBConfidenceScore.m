@interface _INPBConfidenceScore
+ (BOOL)supportsSecureCoding;
+ (Class)componentsType;
- (BOOL)hasAggregateScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)components;
- (_INPBConfidenceScore)initWithCoder:(id)a3;
- (float)aggregateScore;
- (id)componentsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)componentsCount;
- (unint64_t)hash;
- (void)addComponents:(id)a3;
- (void)clearComponents;
- (void)encodeWithCoder:(id)a3;
- (void)setAggregateScore:(float)a3;
- (void)setComponents:(id)a3;
- (void)setHasAggregateScore:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBConfidenceScore

- (void).cxx_destruct
{
}

- (NSArray)components
{
  return self->_components;
}

- (float)aggregateScore
{
  return self->_aggregateScore;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBConfidenceScore *)self hasAggregateScore])
  {
    v4 = NSNumber;
    [(_INPBConfidenceScore *)self aggregateScore];
    v5 = objc_msgSend(v4, "numberWithFloat:");
    [v3 setObject:v5 forKeyedSubscript:@"aggregateScore"];
  }
  if ([(NSArray *)self->_components count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_components;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"components"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBConfidenceScore *)self hasAggregateScore])
  {
    float aggregateScore = self->_aggregateScore;
    double v4 = aggregateScore;
    if (aggregateScore < 0.0) {
      double v4 = -aggregateScore;
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
  return [(NSArray *)self->_components hash] ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBConfidenceScore *)self hasAggregateScore];
    if (v5 == [v4 hasAggregateScore])
    {
      if (![(_INPBConfidenceScore *)self hasAggregateScore]
        || ![v4 hasAggregateScore]
        || (float aggregateScore = self->_aggregateScore, [v4 aggregateScore], aggregateScore == v7))
      {
        uint64_t v8 = [(_INPBConfidenceScore *)self components];
        uint64_t v9 = [v4 components];
        uint64_t v10 = v9;
        if ((v8 == 0) != (v9 != 0))
        {
          uint64_t v11 = [(_INPBConfidenceScore *)self components];
          if (!v11)
          {

LABEL_14:
            BOOL v16 = 1;
            goto LABEL_12;
          }
          v12 = (void *)v11;
          v13 = [(_INPBConfidenceScore *)self components];
          long long v14 = [v4 components];
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
  int v5 = [+[_INPBConfidenceScore allocWithZone:](_INPBConfidenceScore, "allocWithZone:") init];
  if ([(_INPBConfidenceScore *)self hasAggregateScore])
  {
    [(_INPBConfidenceScore *)self aggregateScore];
    -[_INPBConfidenceScore setAggregateScore:](v5, "setAggregateScore:");
  }
  double v6 = (void *)[(NSArray *)self->_components copyWithZone:a3];
  [(_INPBConfidenceScore *)v5 setComponents:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBConfidenceScore *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBConfidenceScore)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBConfidenceScore *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBConfidenceScore *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBConfidenceScore *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBConfidenceScore *)self hasAggregateScore]) {
    PBDataWriterWriteFloatField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v5 = self->_components;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBConfidenceScoreReadFrom(self, (uint64_t)a3, v3);
}

- (id)componentsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_components objectAtIndexedSubscript:a3];
}

- (unint64_t)componentsCount
{
  return [(NSArray *)self->_components count];
}

- (void)addComponents:(id)a3
{
  id v4 = a3;
  components = self->_components;
  id v8 = v4;
  if (!components)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_components;
    self->_components = v6;

    id v4 = v8;
    components = self->_components;
  }
  [(NSArray *)components addObject:v4];
}

- (void)clearComponents
{
}

- (void)setComponents:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  components = self->_components;
  self->_components = v4;

  MEMORY[0x1F41817F8](v4, components);
}

- (void)setHasAggregateScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAggregateScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAggregateScore:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float aggregateScore = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)componentsType
{
  return (Class)objc_opt_class();
}

@end