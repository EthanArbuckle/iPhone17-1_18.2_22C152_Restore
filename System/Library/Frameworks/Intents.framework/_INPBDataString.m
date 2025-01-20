@interface _INPBDataString
+ (BOOL)supportsSecureCoding;
+ (Class)alternativesType;
- (BOOL)hasLocalizedValue;
- (BOOL)hasPronunciationHint;
- (BOOL)hasVocabularyIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)alternatives;
- (NSString)localizedValue;
- (NSString)pronunciationHint;
- (NSString)vocabularyIdentifier;
- (_INPBDataString)initWithCoder:(id)a3;
- (id)alternativesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)alternativesCount;
- (unint64_t)hash;
- (void)addAlternatives:(id)a3;
- (void)clearAlternatives;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternatives:(id)a3;
- (void)setLocalizedValue:(id)a3;
- (void)setPronunciationHint:(id)a3;
- (void)setVocabularyIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBDataString

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocabularyIdentifier, 0);
  objc_storeStrong((id *)&self->_pronunciationHint, 0);
  objc_storeStrong((id *)&self->_localizedValue, 0);

  objc_storeStrong((id *)&self->_alternatives, 0);
}

- (NSString)vocabularyIdentifier
{
  return self->_vocabularyIdentifier;
}

- (NSString)pronunciationHint
{
  return self->_pronunciationHint;
}

- (NSString)localizedValue
{
  return self->_localizedValue;
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_alternatives count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v5 = self->_alternatives;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"alternatives"];
  }
  if (self->_localizedValue)
  {
    v11 = [(_INPBDataString *)self localizedValue];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"localizedValue"];
  }
  if (self->_pronunciationHint)
  {
    v13 = [(_INPBDataString *)self pronunciationHint];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"pronunciationHint"];
  }
  if (self->_vocabularyIdentifier)
  {
    v15 = [(_INPBDataString *)self vocabularyIdentifier];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"vocabularyIdentifier"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_alternatives hash];
  NSUInteger v4 = [(NSString *)self->_localizedValue hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_pronunciationHint hash];
  return v4 ^ v5 ^ [(NSString *)self->_vocabularyIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  NSUInteger v5 = [(_INPBDataString *)self alternatives];
  uint64_t v6 = [v4 alternatives];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_INPBDataString *)self alternatives];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBDataString *)self alternatives];
    v10 = [v4 alternatives];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBDataString *)self localizedValue];
  uint64_t v6 = [v4 localizedValue];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_INPBDataString *)self localizedValue];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBDataString *)self localizedValue];
    v15 = [v4 localizedValue];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBDataString *)self pronunciationHint];
  uint64_t v6 = [v4 pronunciationHint];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_INPBDataString *)self pronunciationHint];
  if (v17)
  {
    long long v18 = (void *)v17;
    long long v19 = [(_INPBDataString *)self pronunciationHint];
    long long v20 = [v4 pronunciationHint];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBDataString *)self vocabularyIdentifier];
  uint64_t v6 = [v4 vocabularyIdentifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_INPBDataString *)self vocabularyIdentifier];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    uint64_t v23 = (void *)v22;
    v24 = [(_INPBDataString *)self vocabularyIdentifier];
    v25 = [v4 vocabularyIdentifier];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[_INPBDataString allocWithZone:](_INPBDataString, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_alternatives copyWithZone:a3];
  [(_INPBDataString *)v5 setAlternatives:v6];

  uint64_t v7 = (void *)[(NSString *)self->_localizedValue copyWithZone:a3];
  [(_INPBDataString *)v5 setLocalizedValue:v7];

  uint64_t v8 = (void *)[(NSString *)self->_pronunciationHint copyWithZone:a3];
  [(_INPBDataString *)v5 setPronunciationHint:v8];

  v9 = (void *)[(NSString *)self->_vocabularyIdentifier copyWithZone:a3];
  [(_INPBDataString *)v5 setVocabularyIdentifier:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBDataString *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBDataString)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBDataString *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBDataString *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBDataString *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  NSUInteger v5 = self->_alternatives;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v10 = [(_INPBDataString *)self localizedValue];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  int v11 = [(_INPBDataString *)self pronunciationHint];

  if (v11) {
    PBDataWriterWriteStringField();
  }
  uint64_t v12 = [(_INPBDataString *)self vocabularyIdentifier];

  if (v12) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDataStringReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasVocabularyIdentifier
{
  return self->_vocabularyIdentifier != 0;
}

- (void)setVocabularyIdentifier:(id)a3
{
  self->_vocabularyIdentifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasPronunciationHint
{
  return self->_pronunciationHint != 0;
}

- (void)setPronunciationHint:(id)a3
{
  self->_pronunciationHint = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasLocalizedValue
{
  return self->_localizedValue != 0;
}

- (void)setLocalizedValue:(id)a3
{
  self->_localizedValue = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)alternativesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_alternatives objectAtIndexedSubscript:a3];
}

- (unint64_t)alternativesCount
{
  return [(NSArray *)self->_alternatives count];
}

- (void)addAlternatives:(id)a3
{
  id v4 = a3;
  alternatives = self->_alternatives;
  id v8 = v4;
  if (!alternatives)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_alternatives;
    self->_alternatives = v6;

    id v4 = v8;
    alternatives = self->_alternatives;
  }
  [(NSArray *)alternatives addObject:v4];
}

- (void)clearAlternatives
{
}

- (void)setAlternatives:(id)a3
{
  self->_alternatives = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)alternativesType
{
  return (Class)objc_opt_class();
}

@end