@interface _INPBConflictingParameter
+ (BOOL)supportsSecureCoding;
+ (Class)alternateItemsType;
- (BOOL)hasKeyPath;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)alternateItems;
- (NSString)keyPath;
- (_INPBConflictingParameter)initWithCoder:(id)a3;
- (id)alternateItemsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)alternateItemsCount;
- (unint64_t)hash;
- (void)addAlternateItems:(id)a3;
- (void)clearAlternateItems;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternateItems:(id)a3;
- (void)setKeyPath:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBConflictingParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);

  objc_storeStrong((id *)&self->_alternateItems, 0);
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSArray)alternateItems
{
  return self->_alternateItems;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_alternateItems count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_alternateItems;
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

    [v3 setObject:v4 forKeyedSubscript:@"alternateItems"];
  }
  if (self->_keyPath)
  {
    v11 = [(_INPBConflictingParameter *)self keyPath];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"keyPath"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_alternateItems hash];
  return [(NSString *)self->_keyPath hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBConflictingParameter *)self alternateItems];
  uint64_t v6 = [v4 alternateItems];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBConflictingParameter *)self alternateItems];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBConflictingParameter *)self alternateItems];
    v10 = [v4 alternateItems];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBConflictingParameter *)self keyPath];
  uint64_t v6 = [v4 keyPath];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBConflictingParameter *)self keyPath];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    long long v14 = [(_INPBConflictingParameter *)self keyPath];
    long long v15 = [v4 keyPath];
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
  v5 = [+[_INPBConflictingParameter allocWithZone:](_INPBConflictingParameter, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_alternateItems copyWithZone:a3];
  [(_INPBConflictingParameter *)v5 setAlternateItems:v6];

  uint64_t v7 = (void *)[(NSString *)self->_keyPath copyWithZone:a3];
  [(_INPBConflictingParameter *)v5 setKeyPath:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBConflictingParameter *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBConflictingParameter)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBConflictingParameter *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBConflictingParameter *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBConflictingParameter *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_alternateItems;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  v10 = [(_INPBConflictingParameter *)self keyPath];

  if (v10) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBConflictingParameterReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasKeyPath
{
  return self->_keyPath != 0;
}

- (void)setKeyPath:(id)a3
{
  self->_keyPath = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)alternateItemsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_alternateItems objectAtIndexedSubscript:a3];
}

- (unint64_t)alternateItemsCount
{
  return [(NSArray *)self->_alternateItems count];
}

- (void)addAlternateItems:(id)a3
{
  id v4 = a3;
  alternateItems = self->_alternateItems;
  id v8 = v4;
  if (!alternateItems)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_alternateItems;
    self->_alternateItems = v6;

    id v4 = v8;
    alternateItems = self->_alternateItems;
  }
  [(NSArray *)alternateItems addObject:v4];
}

- (void)clearAlternateItems
{
}

- (void)setAlternateItems:(id)a3
{
  self->_alternateItems = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)alternateItemsType
{
  return (Class)objc_opt_class();
}

@end