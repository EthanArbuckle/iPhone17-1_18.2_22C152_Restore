@interface _INPBIntentSlotVocabularyConcept
+ (BOOL)supportsSecureCoding;
+ (Class)synonymsType;
- (BOOL)hasIdentifier;
- (BOOL)hasRequiresUserIdentification;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)requiresUserIdentification;
- (NSArray)synonyms;
- (NSString)identifier;
- (_INPBIntentSlotVocabularyConcept)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)synonymsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)synonymsCount;
- (void)addSynonyms:(id)a3;
- (void)clearSynonyms;
- (void)encodeWithCoder:(id)a3;
- (void)setHasRequiresUserIdentification:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setRequiresUserIdentification:(BOOL)a3;
- (void)setSynonyms:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBIntentSlotVocabularyConcept

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (BOOL)requiresUserIdentification
{
  return self->_requiresUserIdentification;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_identifier)
  {
    v4 = [(_INPBIntentSlotVocabularyConcept *)self identifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"identifier"];
  }
  if ([(_INPBIntentSlotVocabularyConcept *)self hasRequiresUserIdentification])
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBIntentSlotVocabularyConcept requiresUserIdentification](self, "requiresUserIdentification"));
    [v3 setObject:v6 forKeyedSubscript:@"requires_user_identification"];
  }
  if ([(NSArray *)self->_synonyms count])
  {
    v7 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v8 = self->_synonyms;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"synonyms"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  if ([(_INPBIntentSlotVocabularyConcept *)self hasRequiresUserIdentification]) {
    uint64_t v4 = 2654435761 * self->_requiresUserIdentification;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSArray *)self->_synonyms hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  v5 = [(_INPBIntentSlotVocabularyConcept *)self identifier];
  v6 = [v4 identifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_15;
  }
  uint64_t v7 = [(_INPBIntentSlotVocabularyConcept *)self identifier];
  if (v7)
  {
    v8 = (void *)v7;
    uint64_t v9 = [(_INPBIntentSlotVocabularyConcept *)self identifier];
    uint64_t v10 = [v4 identifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  int v12 = [(_INPBIntentSlotVocabularyConcept *)self hasRequiresUserIdentification];
  if (v12 != [v4 hasRequiresUserIdentification]) {
    goto LABEL_16;
  }
  if ([(_INPBIntentSlotVocabularyConcept *)self hasRequiresUserIdentification])
  {
    if ([v4 hasRequiresUserIdentification])
    {
      int requiresUserIdentification = self->_requiresUserIdentification;
      if (requiresUserIdentification != [v4 requiresUserIdentification]) {
        goto LABEL_16;
      }
    }
  }
  v5 = [(_INPBIntentSlotVocabularyConcept *)self synonyms];
  v6 = [v4 synonyms];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v14 = [(_INPBIntentSlotVocabularyConcept *)self synonyms];
    if (!v14)
    {

LABEL_19:
      BOOL v19 = 1;
      goto LABEL_17;
    }
    long long v15 = (void *)v14;
    long long v16 = [(_INPBIntentSlotVocabularyConcept *)self synonyms];
    long long v17 = [v4 synonyms];
    char v18 = [v16 isEqual:v17];

    if (v18) {
      goto LABEL_19;
    }
  }
  else
  {
LABEL_15:
  }
LABEL_16:
  BOOL v19 = 0;
LABEL_17:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBIntentSlotVocabularyConcept allocWithZone:](_INPBIntentSlotVocabularyConcept, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_identifier copyWithZone:a3];
  [(_INPBIntentSlotVocabularyConcept *)v5 setIdentifier:v6];

  if ([(_INPBIntentSlotVocabularyConcept *)self hasRequiresUserIdentification]) {
    [(_INPBIntentSlotVocabularyConcept *)v5 setRequiresUserIdentification:[(_INPBIntentSlotVocabularyConcept *)self requiresUserIdentification]];
  }
  uint64_t v7 = (void *)[(NSArray *)self->_synonyms copyWithZone:a3];
  [(_INPBIntentSlotVocabularyConcept *)v5 setSynonyms:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBIntentSlotVocabularyConcept *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBIntentSlotVocabularyConcept)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBIntentSlotVocabularyConcept *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBIntentSlotVocabularyConcept *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBIntentSlotVocabularyConcept *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_INPBIntentSlotVocabularyConcept *)self identifier];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBIntentSlotVocabularyConcept *)self hasRequiresUserIdentification]) {
    PBDataWriterWriteBOOLField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_synonyms;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentSlotVocabularyConceptReadFrom(self, (uint64_t)a3);
}

- (id)synonymsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_synonyms objectAtIndexedSubscript:a3];
}

- (unint64_t)synonymsCount
{
  return [(NSArray *)self->_synonyms count];
}

- (void)addSynonyms:(id)a3
{
  id v4 = a3;
  synonyms = self->_synonyms;
  id v8 = v4;
  if (!synonyms)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_synonyms;
    self->_synonyms = v6;

    id v4 = v8;
    synonyms = self->_synonyms;
  }
  [(NSArray *)synonyms addObject:v4];
}

- (void)clearSynonyms
{
}

- (void)setSynonyms:(id)a3
{
  self->_synonyms = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (void)setHasRequiresUserIdentification:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequiresUserIdentification
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRequiresUserIdentification:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int requiresUserIdentification = a3;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setIdentifier:(id)a3
{
  self->_identifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)synonymsType
{
  return (Class)objc_opt_class();
}

@end