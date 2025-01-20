@interface _INPBSetRelationshipIntent
+ (BOOL)supportsSecureCoding;
+ (Class)contactIdentifiersType;
- (BOOL)hasIntentMetadata;
- (BOOL)hasTargetRelationship;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)contactIdentifiers;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBModifyRelationship)targetRelationship;
- (_INPBSetRelationshipIntent)initWithCoder:(id)a3;
- (id)contactIdentifiersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)contactIdentifiersCount;
- (unint64_t)hash;
- (void)addContactIdentifiers:(id)a3;
- (void)clearContactIdentifiers;
- (void)encodeWithCoder:(id)a3;
- (void)setContactIdentifiers:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setTargetRelationship:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSetRelationshipIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetRelationship, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
}

- (_INPBModifyRelationship)targetRelationship
{
  return self->_targetRelationship;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_contactIdentifiers count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = self->_contactIdentifiers;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"contactIdentifiers"];
  }
  v11 = [(_INPBSetRelationshipIntent *)self intentMetadata];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"intentMetadata"];

  v13 = [(_INPBSetRelationshipIntent *)self targetRelationship];
  v14 = [v13 dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"targetRelationship"];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_contactIdentifiers hash];
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash] ^ v3;
  return v4 ^ [(_INPBModifyRelationship *)self->_targetRelationship hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBSetRelationshipIntent *)self contactIdentifiers];
  uint64_t v6 = [v4 contactIdentifiers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBSetRelationshipIntent *)self contactIdentifiers];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBSetRelationshipIntent *)self contactIdentifiers];
    v10 = [v4 contactIdentifiers];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBSetRelationshipIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBSetRelationshipIntent *)self intentMetadata];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSetRelationshipIntent *)self intentMetadata];
    v15 = [v4 intentMetadata];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBSetRelationshipIntent *)self targetRelationship];
  uint64_t v6 = [v4 targetRelationship];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBSetRelationshipIntent *)self targetRelationship];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    long long v18 = (void *)v17;
    long long v19 = [(_INPBSetRelationshipIntent *)self targetRelationship];
    v20 = [v4 targetRelationship];
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
  v5 = [+[_INPBSetRelationshipIntent allocWithZone:](_INPBSetRelationshipIntent, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_contactIdentifiers copyWithZone:a3];
  [(_INPBSetRelationshipIntent *)v5 setContactIdentifiers:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSetRelationshipIntent *)v5 setIntentMetadata:v7];

  id v8 = [(_INPBModifyRelationship *)self->_targetRelationship copyWithZone:a3];
  [(_INPBSetRelationshipIntent *)v5 setTargetRelationship:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSetRelationshipIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSetRelationshipIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSetRelationshipIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSetRelationshipIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSetRelationshipIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_contactIdentifiers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v10 = [(_INPBSetRelationshipIntent *)self intentMetadata];

  if (v10)
  {
    int v11 = [(_INPBSetRelationshipIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(_INPBSetRelationshipIntent *)self targetRelationship];

  if (v12)
  {
    v13 = [(_INPBSetRelationshipIntent *)self targetRelationship];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetRelationshipIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTargetRelationship
{
  return self->_targetRelationship != 0;
}

- (void)setTargetRelationship:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (id)contactIdentifiersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_contactIdentifiers objectAtIndexedSubscript:a3];
}

- (unint64_t)contactIdentifiersCount
{
  return [(NSArray *)self->_contactIdentifiers count];
}

- (void)addContactIdentifiers:(id)a3
{
  id v4 = a3;
  contactIdentifiers = self->_contactIdentifiers;
  id v8 = v4;
  if (!contactIdentifiers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_contactIdentifiers;
    self->_contactIdentifiers = v6;

    id v4 = v8;
    contactIdentifiers = self->_contactIdentifiers;
  }
  [(NSArray *)contactIdentifiers addObject:v4];
}

- (void)clearContactIdentifiers
{
}

- (void)setContactIdentifiers:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  contactIdentifiers = self->_contactIdentifiers;
  self->_contactIdentifiers = v4;

  MEMORY[0x1F41817F8](v4, contactIdentifiers);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)contactIdentifiersType
{
  return (Class)objc_opt_class();
}

@end