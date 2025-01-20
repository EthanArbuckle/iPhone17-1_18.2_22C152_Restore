@interface _INPBHomeContent
+ (BOOL)supportsSecureCoding;
+ (Class)actionsType;
- (BOOL)hasFilter;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)actions;
- (_INPBHomeContent)initWithCoder:(id)a3;
- (_INPBHomeFilter)filter;
- (id)actionsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)actionsCount;
- (unint64_t)hash;
- (void)addActions:(id)a3;
- (void)clearActions;
- (void)encodeWithCoder:(id)a3;
- (void)setActions:(id)a3;
- (void)setFilter:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBHomeContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);

  objc_storeStrong((id *)&self->_actions, 0);
}

- (_INPBHomeFilter)filter
{
  return self->_filter;
}

- (NSArray)actions
{
  return self->_actions;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_actions count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_actions;
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

    [v3 setObject:v4 forKeyedSubscript:@"actions"];
  }
  v11 = [(_INPBHomeContent *)self filter];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"filter"];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_actions hash];
  return [(_INPBHomeFilter *)self->_filter hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBHomeContent *)self actions];
  uint64_t v6 = [v4 actions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBHomeContent *)self actions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBHomeContent *)self actions];
    v10 = [v4 actions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBHomeContent *)self filter];
  uint64_t v6 = [v4 filter];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBHomeContent *)self filter];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    long long v14 = [(_INPBHomeContent *)self filter];
    long long v15 = [v4 filter];
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
  v5 = [+[_INPBHomeContent allocWithZone:](_INPBHomeContent, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_actions copyWithZone:a3];
  [(_INPBHomeContent *)v5 setActions:v6];

  id v7 = [(_INPBHomeFilter *)self->_filter copyWithZone:a3];
  [(_INPBHomeContent *)v5 setFilter:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBHomeContent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBHomeContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBHomeContent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBHomeContent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBHomeContent *)self initWithData:v6];

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
  v5 = self->_actions;
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

  v10 = [(_INPBHomeContent *)self filter];

  if (v10)
  {
    int v11 = [(_INPBHomeContent *)self filter];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBHomeContentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasFilter
{
  return self->_filter != 0;
}

- (void)setFilter:(id)a3
{
}

- (id)actionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_actions objectAtIndexedSubscript:a3];
}

- (unint64_t)actionsCount
{
  return [(NSArray *)self->_actions count];
}

- (void)addActions:(id)a3
{
  id v4 = a3;
  actions = self->_actions;
  id v8 = v4;
  if (!actions)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_actions;
    self->_actions = v6;

    id v4 = v8;
    actions = self->_actions;
  }
  [(NSArray *)actions addObject:v4];
}

- (void)clearActions
{
}

- (void)setActions:(id)a3
{
  self->_actions = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)actionsType
{
  return (Class)objc_opt_class();
}

@end