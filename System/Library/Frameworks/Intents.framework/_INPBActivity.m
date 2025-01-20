@interface _INPBActivity
+ (BOOL)supportsSecureCoding;
+ (Class)activityDescriptorsType;
- (BOOL)hasActivityType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)activityDescriptors;
- (_INPBActivity)initWithCoder:(id)a3;
- (_INPBString)activityType;
- (id)activityDescriptorsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)activityDescriptorsCount;
- (unint64_t)hash;
- (void)addActivityDescriptors:(id)a3;
- (void)clearActivityDescriptors;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityDescriptors:(id)a3;
- (void)setActivityType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityType, 0);

  objc_storeStrong((id *)&self->_activityDescriptors, 0);
}

- (_INPBString)activityType
{
  return self->_activityType;
}

- (NSArray)activityDescriptors
{
  return self->_activityDescriptors;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_activityDescriptors count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_activityDescriptors;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"activityDescriptors"];
  }
  v11 = [(_INPBActivity *)self activityType];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"activityType"];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_activityDescriptors hash];
  return [(_INPBString *)self->_activityType hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBActivity *)self activityDescriptors];
  uint64_t v6 = [v4 activityDescriptors];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBActivity *)self activityDescriptors];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBActivity *)self activityDescriptors];
    v10 = [v4 activityDescriptors];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBActivity *)self activityType];
  uint64_t v6 = [v4 activityType];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBActivity *)self activityType];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    long long v14 = [(_INPBActivity *)self activityType];
    long long v15 = [v4 activityType];
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
  v5 = [+[_INPBActivity allocWithZone:](_INPBActivity, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_activityDescriptors copyWithZone:a3];
  [(_INPBActivity *)v5 setActivityDescriptors:v6];

  id v7 = [(_INPBString *)self->_activityType copyWithZone:a3];
  [(_INPBActivity *)v5 setActivityType:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBActivity *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBActivity *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBActivity *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBActivity *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_activityDescriptors;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = [(_INPBActivity *)self activityType];

  if (v10)
  {
    int v11 = [(_INPBActivity *)self activityType];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBActivityReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasActivityType
{
  return self->_activityType != 0;
}

- (void)setActivityType:(id)a3
{
}

- (id)activityDescriptorsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_activityDescriptors objectAtIndexedSubscript:a3];
}

- (unint64_t)activityDescriptorsCount
{
  return [(NSArray *)self->_activityDescriptors count];
}

- (void)addActivityDescriptors:(id)a3
{
  id v4 = a3;
  activityDescriptors = self->_activityDescriptors;
  id v8 = v4;
  if (!activityDescriptors)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_activityDescriptors;
    self->_activityDescriptors = v6;

    id v4 = v8;
    activityDescriptors = self->_activityDescriptors;
  }
  [(NSArray *)activityDescriptors addObject:v4];
}

- (void)clearActivityDescriptors
{
}

- (void)setActivityDescriptors:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  activityDescriptors = self->_activityDescriptors;
  self->_activityDescriptors = v4;

  MEMORY[0x1F41817F8](v4, activityDescriptors);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)activityDescriptorsType
{
  return (Class)objc_opt_class();
}

@end