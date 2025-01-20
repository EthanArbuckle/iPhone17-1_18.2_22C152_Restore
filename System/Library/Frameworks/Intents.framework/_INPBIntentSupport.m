@interface _INPBIntentSupport
+ (BOOL)supportsSecureCoding;
+ (Class)intentsRestrictedWhileLockedType;
+ (Class)intentsSupportedType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)intentsRestrictedWhileLockeds;
- (NSArray)intentsSupporteds;
- (NSArray)supportedMediaCategories;
- (_INPBIntentSupport)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)intentsRestrictedWhileLockedAtIndex:(unint64_t)a3;
- (id)intentsSupportedAtIndex:(unint64_t)a3;
- (id)supportedMediaCategoriesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)intentsRestrictedWhileLockedsCount;
- (unint64_t)intentsSupportedsCount;
- (unint64_t)supportedMediaCategoriesCount;
- (void)addIntentsRestrictedWhileLocked:(id)a3;
- (void)addIntentsSupported:(id)a3;
- (void)addSupportedMediaCategories:(id)a3;
- (void)clearIntentsRestrictedWhileLockeds;
- (void)clearIntentsSupporteds;
- (void)clearSupportedMediaCategories;
- (void)encodeWithCoder:(id)a3;
- (void)setIntentsRestrictedWhileLockeds:(id)a3;
- (void)setIntentsSupporteds:(id)a3;
- (void)setSupportedMediaCategories:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBIntentSupport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedMediaCategories, 0);
  objc_storeStrong((id *)&self->_intentsSupporteds, 0);

  objc_storeStrong((id *)&self->_intentsRestrictedWhileLockeds, 0);
}

- (NSArray)supportedMediaCategories
{
  return self->_supportedMediaCategories;
}

- (NSArray)intentsSupporteds
{
  return self->_intentsSupporteds;
}

- (NSArray)intentsRestrictedWhileLockeds
{
  return self->_intentsRestrictedWhileLockeds;
}

- (id)dictionaryRepresentation
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_intentsRestrictedWhileLockeds count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v5 = self->_intentsRestrictedWhileLockeds;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v25 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"intents_restricted_while_locked"];
  }
  if ([(NSArray *)self->_intentsSupporteds count])
  {
    v11 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v12 = self->_intentsSupporteds;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "dictionaryRepresentation", (void)v21);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKeyedSubscript:@"intents_supported"];
  }
  if (self->_supportedMediaCategories)
  {
    v18 = [(_INPBIntentSupport *)self supportedMediaCategories];
    v19 = (void *)[v18 copy];
    [v3 setObject:v19 forKeyedSubscript:@"supported_media_categories"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_intentsRestrictedWhileLockeds hash];
  uint64_t v4 = [(NSArray *)self->_intentsSupporteds hash] ^ v3;
  return v4 ^ [(NSArray *)self->_supportedMediaCategories hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBIntentSupport *)self intentsRestrictedWhileLockeds];
  uint64_t v6 = [v4 intentsRestrictedWhileLockeds];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBIntentSupport *)self intentsRestrictedWhileLockeds];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBIntentSupport *)self intentsRestrictedWhileLockeds];
    v10 = [v4 intentsRestrictedWhileLockeds];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBIntentSupport *)self intentsSupporteds];
  uint64_t v6 = [v4 intentsSupporteds];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBIntentSupport *)self intentsSupporteds];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_INPBIntentSupport *)self intentsSupporteds];
    uint64_t v15 = [v4 intentsSupporteds];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBIntentSupport *)self supportedMediaCategories];
  uint64_t v6 = [v4 supportedMediaCategories];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBIntentSupport *)self supportedMediaCategories];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBIntentSupport *)self supportedMediaCategories];
    v20 = [v4 supportedMediaCategories];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBIntentSupport allocWithZone:](_INPBIntentSupport, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_intentsRestrictedWhileLockeds copyWithZone:a3];
  [(_INPBIntentSupport *)v5 setIntentsRestrictedWhileLockeds:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_intentsSupporteds copyWithZone:a3];
  [(_INPBIntentSupport *)v5 setIntentsSupporteds:v7];

  uint64_t v8 = (void *)[(NSArray *)self->_supportedMediaCategories copyWithZone:a3];
  [(_INPBIntentSupport *)v5 setSupportedMediaCategories:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBIntentSupport *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBIntentSupport)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBIntentSupport *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBIntentSupport *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBIntentSupport *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v5 = self->_intentsRestrictedWhileLockeds;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = self->_intentsSupporteds;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = self->_supportedMediaCategories;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentSupportReadFrom(self, (uint64_t)a3);
}

- (id)supportedMediaCategoriesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_supportedMediaCategories objectAtIndexedSubscript:a3];
}

- (unint64_t)supportedMediaCategoriesCount
{
  return [(NSArray *)self->_supportedMediaCategories count];
}

- (void)addSupportedMediaCategories:(id)a3
{
  id v4 = a3;
  supportedMediaCategories = self->_supportedMediaCategories;
  id v8 = v4;
  if (!supportedMediaCategories)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_supportedMediaCategories;
    self->_supportedMediaCategories = v6;

    id v4 = v8;
    supportedMediaCategories = self->_supportedMediaCategories;
  }
  [(NSArray *)supportedMediaCategories addObject:v4];
}

- (void)clearSupportedMediaCategories
{
}

- (void)setSupportedMediaCategories:(id)a3
{
  self->_supportedMediaCategories = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (id)intentsSupportedAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_intentsSupporteds objectAtIndexedSubscript:a3];
}

- (unint64_t)intentsSupportedsCount
{
  return [(NSArray *)self->_intentsSupporteds count];
}

- (void)addIntentsSupported:(id)a3
{
  id v4 = a3;
  intentsSupporteds = self->_intentsSupporteds;
  id v8 = v4;
  if (!intentsSupporteds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_intentsSupporteds;
    self->_intentsSupporteds = v6;

    id v4 = v8;
    intentsSupporteds = self->_intentsSupporteds;
  }
  [(NSArray *)intentsSupporteds addObject:v4];
}

- (void)clearIntentsSupporteds
{
}

- (void)setIntentsSupporteds:(id)a3
{
  self->_intentsSupporteds = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (id)intentsRestrictedWhileLockedAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_intentsRestrictedWhileLockeds objectAtIndexedSubscript:a3];
}

- (unint64_t)intentsRestrictedWhileLockedsCount
{
  return [(NSArray *)self->_intentsRestrictedWhileLockeds count];
}

- (void)addIntentsRestrictedWhileLocked:(id)a3
{
  id v4 = a3;
  intentsRestrictedWhileLockeds = self->_intentsRestrictedWhileLockeds;
  id v8 = v4;
  if (!intentsRestrictedWhileLockeds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_intentsRestrictedWhileLockeds;
    self->_intentsRestrictedWhileLockeds = v6;

    id v4 = v8;
    intentsRestrictedWhileLockeds = self->_intentsRestrictedWhileLockeds;
  }
  [(NSArray *)intentsRestrictedWhileLockeds addObject:v4];
}

- (void)clearIntentsRestrictedWhileLockeds
{
}

- (void)setIntentsRestrictedWhileLockeds:(id)a3
{
  self->_intentsRestrictedWhileLockeds = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)intentsSupportedType
{
  return (Class)objc_opt_class();
}

+ (Class)intentsRestrictedWhileLockedType
{
  return (Class)objc_opt_class();
}

@end