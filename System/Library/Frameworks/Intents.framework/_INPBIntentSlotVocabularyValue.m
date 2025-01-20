@interface _INPBIntentSlotVocabularyValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasPhrase;
- (BOOL)hasPronunciation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)examples;
- (NSString)phrase;
- (NSString)pronunciation;
- (_INPBIntentSlotVocabularyValue)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)examplesAtIndex:(unint64_t)a3;
- (unint64_t)examplesCount;
- (unint64_t)hash;
- (void)addExamples:(id)a3;
- (void)clearExamples;
- (void)encodeWithCoder:(id)a3;
- (void)setExamples:(id)a3;
- (void)setPhrase:(id)a3;
- (void)setPronunciation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBIntentSlotVocabularyValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pronunciation, 0);
  objc_storeStrong((id *)&self->_phrase, 0);

  objc_storeStrong((id *)&self->_examples, 0);
}

- (NSString)pronunciation
{
  return self->_pronunciation;
}

- (NSString)phrase
{
  return self->_phrase;
}

- (NSArray)examples
{
  return self->_examples;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_examples)
  {
    v4 = [(_INPBIntentSlotVocabularyValue *)self examples];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"examples"];
  }
  if (self->_phrase)
  {
    v6 = [(_INPBIntentSlotVocabularyValue *)self phrase];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"phrase"];
  }
  if (self->_pronunciation)
  {
    v8 = [(_INPBIntentSlotVocabularyValue *)self pronunciation];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"pronunciation"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_examples hash];
  NSUInteger v4 = [(NSString *)self->_phrase hash] ^ v3;
  return v4 ^ [(NSString *)self->_pronunciation hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBIntentSlotVocabularyValue *)self examples];
  v6 = [v4 examples];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBIntentSlotVocabularyValue *)self examples];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBIntentSlotVocabularyValue *)self examples];
    v10 = [v4 examples];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBIntentSlotVocabularyValue *)self phrase];
  v6 = [v4 phrase];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBIntentSlotVocabularyValue *)self phrase];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBIntentSlotVocabularyValue *)self phrase];
    v15 = [v4 phrase];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBIntentSlotVocabularyValue *)self pronunciation];
  v6 = [v4 pronunciation];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBIntentSlotVocabularyValue *)self pronunciation];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBIntentSlotVocabularyValue *)self pronunciation];
    v20 = [v4 pronunciation];
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
  v5 = [+[_INPBIntentSlotVocabularyValue allocWithZone:](_INPBIntentSlotVocabularyValue, "allocWithZone:") init];
  v6 = (void *)[(NSArray *)self->_examples copyWithZone:a3];
  [(_INPBIntentSlotVocabularyValue *)v5 setExamples:v6];

  uint64_t v7 = (void *)[(NSString *)self->_phrase copyWithZone:a3];
  [(_INPBIntentSlotVocabularyValue *)v5 setPhrase:v7];

  v8 = (void *)[(NSString *)self->_pronunciation copyWithZone:a3];
  [(_INPBIntentSlotVocabularyValue *)v5 setPronunciation:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBIntentSlotVocabularyValue *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBIntentSlotVocabularyValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBIntentSlotVocabularyValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBIntentSlotVocabularyValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBIntentSlotVocabularyValue *)self initWithData:v6];

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
  v5 = self->_examples;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = [(_INPBIntentSlotVocabularyValue *)self phrase];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  int v11 = [(_INPBIntentSlotVocabularyValue *)self pronunciation];

  if (v11) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentSlotVocabularyValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasPronunciation
{
  return self->_pronunciation != 0;
}

- (void)setPronunciation:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  pronunciation = self->_pronunciation;
  self->_pronunciation = v4;

  MEMORY[0x1F41817F8](v4, pronunciation);
}

- (BOOL)hasPhrase
{
  return self->_phrase != 0;
}

- (void)setPhrase:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  phrase = self->_phrase;
  self->_phrase = v4;

  MEMORY[0x1F41817F8](v4, phrase);
}

- (id)examplesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_examples objectAtIndexedSubscript:a3];
}

- (unint64_t)examplesCount
{
  return [(NSArray *)self->_examples count];
}

- (void)addExamples:(id)a3
{
  id v4 = a3;
  examples = self->_examples;
  id v8 = v4;
  if (!examples)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_examples;
    self->_examples = v6;

    id v4 = v8;
    examples = self->_examples;
  }
  [(NSArray *)examples addObject:v4];
}

- (void)clearExamples
{
}

- (void)setExamples:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  examples = self->_examples;
  self->_examples = v4;

  MEMORY[0x1F41817F8](v4, examples);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end