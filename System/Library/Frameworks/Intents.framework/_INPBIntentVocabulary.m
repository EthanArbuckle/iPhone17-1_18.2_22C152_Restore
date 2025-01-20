@interface _INPBIntentVocabulary
+ (BOOL)supportsSecureCoding;
+ (Class)intentSlotVocabularyPoliciesType;
+ (Class)intentTypePhrasesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)intentSlotVocabularyPolicies;
- (NSArray)intentTypePhrases;
- (_INPBIntentVocabulary)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)intentSlotVocabularyPoliciesAtIndex:(unint64_t)a3;
- (id)intentTypePhrasesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)intentSlotVocabularyPoliciesCount;
- (unint64_t)intentTypePhrasesCount;
- (void)addIntentSlotVocabularyPolicies:(id)a3;
- (void)addIntentTypePhrases:(id)a3;
- (void)clearIntentSlotVocabularyPolicies;
- (void)clearIntentTypePhrases;
- (void)encodeWithCoder:(id)a3;
- (void)setIntentSlotVocabularyPolicies:(id)a3;
- (void)setIntentTypePhrases:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBIntentVocabulary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentTypePhrases, 0);

  objc_storeStrong((id *)&self->_intentSlotVocabularyPolicies, 0);
}

- (NSArray)intentTypePhrases
{
  return self->_intentTypePhrases;
}

- (NSArray)intentSlotVocabularyPolicies
{
  return self->_intentSlotVocabularyPolicies;
}

- (id)dictionaryRepresentation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_intentSlotVocabularyPolicies count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v5 = self->_intentSlotVocabularyPolicies;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"intent_slot_vocabulary_policies"];
  }
  if ([(NSArray *)self->_intentTypePhrases count])
  {
    v11 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = self->_intentTypePhrases;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "dictionaryRepresentation", (void)v19);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKeyedSubscript:@"intent_type_phrases"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_intentSlotVocabularyPolicies hash];
  return [(NSArray *)self->_intentTypePhrases hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBIntentVocabulary *)self intentSlotVocabularyPolicies];
  uint64_t v6 = [v4 intentSlotVocabularyPolicies];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBIntentVocabulary *)self intentSlotVocabularyPolicies];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBIntentVocabulary *)self intentSlotVocabularyPolicies];
    v10 = [v4 intentSlotVocabularyPolicies];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBIntentVocabulary *)self intentTypePhrases];
  uint64_t v6 = [v4 intentTypePhrases];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBIntentVocabulary *)self intentTypePhrases];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_INPBIntentVocabulary *)self intentTypePhrases];
    uint64_t v15 = [v4 intentTypePhrases];
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
  v5 = [+[_INPBIntentVocabulary allocWithZone:](_INPBIntentVocabulary, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_intentSlotVocabularyPolicies copyWithZone:a3];
  [(_INPBIntentVocabulary *)v5 setIntentSlotVocabularyPolicies:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_intentTypePhrases copyWithZone:a3];
  [(_INPBIntentVocabulary *)v5 setIntentTypePhrases:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBIntentVocabulary *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBIntentVocabulary)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBIntentVocabulary *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBIntentVocabulary *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBIntentVocabulary *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_intentSlotVocabularyPolicies;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_intentTypePhrases;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentVocabularyReadFrom(self, (uint64_t)a3);
}

- (id)intentTypePhrasesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_intentTypePhrases objectAtIndexedSubscript:a3];
}

- (unint64_t)intentTypePhrasesCount
{
  return [(NSArray *)self->_intentTypePhrases count];
}

- (void)addIntentTypePhrases:(id)a3
{
  id v4 = a3;
  intentTypePhrases = self->_intentTypePhrases;
  id v8 = v4;
  if (!intentTypePhrases)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_intentTypePhrases;
    self->_intentTypePhrases = v6;

    id v4 = v8;
    intentTypePhrases = self->_intentTypePhrases;
  }
  [(NSArray *)intentTypePhrases addObject:v4];
}

- (void)clearIntentTypePhrases
{
}

- (void)setIntentTypePhrases:(id)a3
{
  self->_intentTypePhrases = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (id)intentSlotVocabularyPoliciesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_intentSlotVocabularyPolicies objectAtIndexedSubscript:a3];
}

- (unint64_t)intentSlotVocabularyPoliciesCount
{
  return [(NSArray *)self->_intentSlotVocabularyPolicies count];
}

- (void)addIntentSlotVocabularyPolicies:(id)a3
{
  id v4 = a3;
  intentSlotVocabularyPolicies = self->_intentSlotVocabularyPolicies;
  id v8 = v4;
  if (!intentSlotVocabularyPolicies)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_intentSlotVocabularyPolicies;
    self->_intentSlotVocabularyPolicies = v6;

    id v4 = v8;
    intentSlotVocabularyPolicies = self->_intentSlotVocabularyPolicies;
  }
  [(NSArray *)intentSlotVocabularyPolicies addObject:v4];
}

- (void)clearIntentSlotVocabularyPolicies
{
}

- (void)setIntentSlotVocabularyPolicies:(id)a3
{
  self->_intentSlotVocabularyPolicies = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)intentTypePhrasesType
{
  return (Class)objc_opt_class();
}

+ (Class)intentSlotVocabularyPoliciesType
{
  return (Class)objc_opt_class();
}

@end