@interface _INPBIntentTypePhrases
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIntentType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)intentVocabularyExamples;
- (_INPBIntentType)intentType;
- (_INPBIntentTypePhrases)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)intentVocabularyExamplesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)intentVocabularyExamplesCount;
- (void)addIntentVocabularyExamples:(id)a3;
- (void)clearIntentVocabularyExamples;
- (void)encodeWithCoder:(id)a3;
- (void)setIntentType:(id)a3;
- (void)setIntentVocabularyExamples:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBIntentTypePhrases

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentVocabularyExamples, 0);

  objc_storeStrong((id *)&self->_intentType, 0);
}

- (NSArray)intentVocabularyExamples
{
  return self->_intentVocabularyExamples;
}

- (_INPBIntentType)intentType
{
  return self->_intentType;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBIntentTypePhrases *)self intentType];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"intent_type"];

  if (self->_intentVocabularyExamples)
  {
    v6 = [(_INPBIntentTypePhrases *)self intentVocabularyExamples];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"intent_vocabulary_examples"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentType *)self->_intentType hash];
  return [(NSArray *)self->_intentVocabularyExamples hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBIntentTypePhrases *)self intentType];
  v6 = [v4 intentType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBIntentTypePhrases *)self intentType];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBIntentTypePhrases *)self intentType];
    v10 = [v4 intentType];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBIntentTypePhrases *)self intentVocabularyExamples];
  v6 = [v4 intentVocabularyExamples];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBIntentTypePhrases *)self intentVocabularyExamples];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_INPBIntentTypePhrases *)self intentVocabularyExamples];
    v15 = [v4 intentVocabularyExamples];
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
  v5 = [+[_INPBIntentTypePhrases allocWithZone:](_INPBIntentTypePhrases, "allocWithZone:") init];
  id v6 = [(_INPBIntentType *)self->_intentType copyWithZone:a3];
  [(_INPBIntentTypePhrases *)v5 setIntentType:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_intentVocabularyExamples copyWithZone:a3];
  [(_INPBIntentTypePhrases *)v5 setIntentVocabularyExamples:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBIntentTypePhrases *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBIntentTypePhrases)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBIntentTypePhrases *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBIntentTypePhrases *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBIntentTypePhrases *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_INPBIntentTypePhrases *)self intentType];

  if (v5)
  {
    id v6 = [(_INPBIntentTypePhrases *)self intentType];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_intentVocabularyExamples;
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
        PBDataWriterWriteStringField();
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
  return _INPBIntentTypePhrasesReadFrom(self, (uint64_t)a3);
}

- (id)intentVocabularyExamplesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_intentVocabularyExamples objectAtIndexedSubscript:a3];
}

- (unint64_t)intentVocabularyExamplesCount
{
  return [(NSArray *)self->_intentVocabularyExamples count];
}

- (void)addIntentVocabularyExamples:(id)a3
{
  id v4 = a3;
  intentVocabularyExamples = self->_intentVocabularyExamples;
  id v8 = v4;
  if (!intentVocabularyExamples)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_intentVocabularyExamples;
    self->_intentVocabularyExamples = v6;

    id v4 = v8;
    intentVocabularyExamples = self->_intentVocabularyExamples;
  }
  [(NSArray *)intentVocabularyExamples addObject:v4];
}

- (void)clearIntentVocabularyExamples
{
}

- (void)setIntentVocabularyExamples:(id)a3
{
  self->_intentVocabularyExamples = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasIntentType
{
  return self->_intentType != 0;
}

- (void)setIntentType:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end