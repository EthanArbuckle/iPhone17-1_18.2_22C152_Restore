@interface _INPBIntentSlotVocabularyPolicy
+ (BOOL)supportsSecureCoding;
+ (Class)intentSlotVocabularyConceptsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)intentSlotNames;
- (NSArray)intentSlotVocabularyConcepts;
- (_INPBIntentSlotVocabularyPolicy)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)intentSlotNamesAtIndex:(unint64_t)a3;
- (id)intentSlotVocabularyConceptsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)intentSlotNamesCount;
- (unint64_t)intentSlotVocabularyConceptsCount;
- (void)addIntentSlotNames:(id)a3;
- (void)addIntentSlotVocabularyConcepts:(id)a3;
- (void)clearIntentSlotNames;
- (void)clearIntentSlotVocabularyConcepts;
- (void)encodeWithCoder:(id)a3;
- (void)setIntentSlotNames:(id)a3;
- (void)setIntentSlotVocabularyConcepts:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBIntentSlotVocabularyPolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentSlotVocabularyConcepts, 0);

  objc_storeStrong((id *)&self->_intentSlotNames, 0);
}

- (NSArray)intentSlotVocabularyConcepts
{
  return self->_intentSlotVocabularyConcepts;
}

- (NSArray)intentSlotNames
{
  return self->_intentSlotNames;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_intentSlotNames)
  {
    v4 = [(_INPBIntentSlotVocabularyPolicy *)self intentSlotNames];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"intent_slot_names"];
  }
  if ([(NSArray *)self->_intentSlotVocabularyConcepts count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_intentSlotVocabularyConcepts;
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

    [v3 setObject:v6 forKeyedSubscript:@"intent_slot_vocabulary_concepts"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_intentSlotNames hash];
  return [(NSArray *)self->_intentSlotVocabularyConcepts hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBIntentSlotVocabularyPolicy *)self intentSlotNames];
  v6 = [v4 intentSlotNames];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBIntentSlotVocabularyPolicy *)self intentSlotNames];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBIntentSlotVocabularyPolicy *)self intentSlotNames];
    uint64_t v10 = [v4 intentSlotNames];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBIntentSlotVocabularyPolicy *)self intentSlotVocabularyConcepts];
  v6 = [v4 intentSlotVocabularyConcepts];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBIntentSlotVocabularyPolicy *)self intentSlotVocabularyConcepts];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    long long v14 = [(_INPBIntentSlotVocabularyPolicy *)self intentSlotVocabularyConcepts];
    long long v15 = [v4 intentSlotVocabularyConcepts];
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
  v5 = [+[_INPBIntentSlotVocabularyPolicy allocWithZone:](_INPBIntentSlotVocabularyPolicy, "allocWithZone:") init];
  v6 = (void *)[(NSArray *)self->_intentSlotNames copyWithZone:a3];
  [(_INPBIntentSlotVocabularyPolicy *)v5 setIntentSlotNames:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_intentSlotVocabularyConcepts copyWithZone:a3];
  [(_INPBIntentSlotVocabularyPolicy *)v5 setIntentSlotVocabularyConcepts:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBIntentSlotVocabularyPolicy *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBIntentSlotVocabularyPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBIntentSlotVocabularyPolicy *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBIntentSlotVocabularyPolicy *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBIntentSlotVocabularyPolicy *)self initWithData:v6];

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
  v5 = self->_intentSlotNames;
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
        PBDataWriterWriteStringField();
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
  uint64_t v10 = self->_intentSlotVocabularyConcepts;
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
  return _INPBIntentSlotVocabularyPolicyReadFrom(self, (uint64_t)a3);
}

- (id)intentSlotVocabularyConceptsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_intentSlotVocabularyConcepts objectAtIndexedSubscript:a3];
}

- (unint64_t)intentSlotVocabularyConceptsCount
{
  return [(NSArray *)self->_intentSlotVocabularyConcepts count];
}

- (void)addIntentSlotVocabularyConcepts:(id)a3
{
  id v4 = a3;
  intentSlotVocabularyConcepts = self->_intentSlotVocabularyConcepts;
  id v8 = v4;
  if (!intentSlotVocabularyConcepts)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_intentSlotVocabularyConcepts;
    self->_intentSlotVocabularyConcepts = v6;

    id v4 = v8;
    intentSlotVocabularyConcepts = self->_intentSlotVocabularyConcepts;
  }
  [(NSArray *)intentSlotVocabularyConcepts addObject:v4];
}

- (void)clearIntentSlotVocabularyConcepts
{
}

- (void)setIntentSlotVocabularyConcepts:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  intentSlotVocabularyConcepts = self->_intentSlotVocabularyConcepts;
  self->_intentSlotVocabularyConcepts = v4;

  MEMORY[0x1F41817F8](v4, intentSlotVocabularyConcepts);
}

- (id)intentSlotNamesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_intentSlotNames objectAtIndexedSubscript:a3];
}

- (unint64_t)intentSlotNamesCount
{
  return [(NSArray *)self->_intentSlotNames count];
}

- (void)addIntentSlotNames:(id)a3
{
  id v4 = a3;
  intentSlotNames = self->_intentSlotNames;
  id v8 = v4;
  if (!intentSlotNames)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_intentSlotNames;
    self->_intentSlotNames = v6;

    id v4 = v8;
    intentSlotNames = self->_intentSlotNames;
  }
  [(NSArray *)intentSlotNames addObject:v4];
}

- (void)clearIntentSlotNames
{
}

- (void)setIntentSlotNames:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  intentSlotNames = self->_intentSlotNames;
  self->_intentSlotNames = v4;

  MEMORY[0x1F41817F8](v4, intentSlotNames);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)intentSlotVocabularyConceptsType
{
  return (Class)objc_opt_class();
}

@end