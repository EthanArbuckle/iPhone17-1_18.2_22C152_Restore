@interface _INPBDistanceList
+ (BOOL)supportsSecureCoding;
+ (Class)distanceType;
- (BOOL)hasCondition;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)distances;
- (_INPBCondition)condition;
- (_INPBDistanceList)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)distanceAtIndex:(unint64_t)a3;
- (unint64_t)distancesCount;
- (unint64_t)hash;
- (void)addDistance:(id)a3;
- (void)clearDistances;
- (void)encodeWithCoder:(id)a3;
- (void)setCondition:(id)a3;
- (void)setDistances:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBDistanceList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distances, 0);

  objc_storeStrong((id *)&self->_condition, 0);
}

- (NSArray)distances
{
  return self->_distances;
}

- (_INPBCondition)condition
{
  return self->_condition;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBDistanceList *)self condition];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"condition"];

  if ([(NSArray *)self->_distances count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_distances;
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

    [v3 setObject:v6 forKeyedSubscript:@"distance"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBCondition *)self->_condition hash];
  return [(NSArray *)self->_distances hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBDistanceList *)self condition];
  v6 = [v4 condition];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBDistanceList *)self condition];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBDistanceList *)self condition];
    uint64_t v10 = [v4 condition];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBDistanceList *)self distances];
  v6 = [v4 distances];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBDistanceList *)self distances];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    long long v14 = [(_INPBDistanceList *)self distances];
    long long v15 = [v4 distances];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBDistanceList allocWithZone:](_INPBDistanceList, "allocWithZone:") init];
  id v6 = [(_INPBCondition *)self->_condition copyWithZone:a3];
  [(_INPBDistanceList *)v5 setCondition:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_distances copyWithZone:a3];
  [(_INPBDistanceList *)v5 setDistances:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBDistanceList *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBDistanceList)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBDistanceList *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBDistanceList *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBDistanceList *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_INPBDistanceList *)self condition];

  if (v5)
  {
    id v6 = [(_INPBDistanceList *)self condition];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_distances;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDistanceListReadFrom(self, (uint64_t)a3);
}

- (id)distanceAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_distances objectAtIndexedSubscript:a3];
}

- (unint64_t)distancesCount
{
  return [(NSArray *)self->_distances count];
}

- (void)addDistance:(id)a3
{
  id v4 = a3;
  distances = self->_distances;
  id v8 = v4;
  if (!distances)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_distances;
    self->_distances = v6;

    id v4 = v8;
    distances = self->_distances;
  }
  [(NSArray *)distances addObject:v4];
}

- (void)clearDistances
{
}

- (void)setDistances:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  distances = self->_distances;
  self->_distances = v4;

  MEMORY[0x1F41817F8](v4, distances);
}

- (BOOL)hasCondition
{
  return self->_condition != 0;
}

- (void)setCondition:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)distanceType
{
  return (Class)objc_opt_class();
}

@end