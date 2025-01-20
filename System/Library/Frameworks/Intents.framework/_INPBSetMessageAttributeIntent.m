@interface _INPBSetMessageAttributeIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAttribute;
- (BOOL)hasIntentMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)identifiers;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSetMessageAttributeIntent)initWithCoder:(id)a3;
- (id)attributeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)identifierAtIndex:(unint64_t)a3;
- (int)StringAsAttribute:(id)a3;
- (int)attribute;
- (unint64_t)hash;
- (unint64_t)identifiersCount;
- (void)addIdentifier:(id)a3;
- (void)clearIdentifiers;
- (void)encodeWithCoder:(id)a3;
- (void)setAttribute:(int)a3;
- (void)setHasAttribute:(BOOL)a3;
- (void)setIdentifiers:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSetMessageAttributeIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_identifiers, 0);
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (int)attribute
{
  return self->_attribute;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBSetMessageAttributeIntent *)self hasAttribute])
  {
    uint64_t v4 = [(_INPBSetMessageAttributeIntent *)self attribute];
    if ((v4 - 1) >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E551C3E8[(v4 - 1)];
    }
    [v3 setObject:v5 forKeyedSubscript:@"attribute"];
  }
  if (self->_identifiers)
  {
    v6 = [(_INPBSetMessageAttributeIntent *)self identifiers];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"identifier"];
  }
  v8 = [(_INPBSetMessageAttributeIntent *)self intentMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"intentMetadata"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBSetMessageAttributeIntent *)self hasAttribute]) {
    uint64_t v3 = 2654435761 * self->_attribute;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSArray *)self->_identifiers hash] ^ v3;
  return v4 ^ [(_INPBIntentMetadata *)self->_intentMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  int v5 = [(_INPBSetMessageAttributeIntent *)self hasAttribute];
  if (v5 != [v4 hasAttribute]) {
    goto LABEL_16;
  }
  if ([(_INPBSetMessageAttributeIntent *)self hasAttribute])
  {
    if ([v4 hasAttribute])
    {
      int attribute = self->_attribute;
      if (attribute != [v4 attribute]) {
        goto LABEL_16;
      }
    }
  }
  v7 = [(_INPBSetMessageAttributeIntent *)self identifiers];
  v8 = [v4 identifiers];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_15;
  }
  uint64_t v9 = [(_INPBSetMessageAttributeIntent *)self identifiers];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_INPBSetMessageAttributeIntent *)self identifiers];
    v12 = [v4 identifiers];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  v7 = [(_INPBSetMessageAttributeIntent *)self intentMetadata];
  v8 = [v4 intentMetadata];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v14 = [(_INPBSetMessageAttributeIntent *)self intentMetadata];
    if (!v14)
    {

LABEL_19:
      BOOL v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    v16 = [(_INPBSetMessageAttributeIntent *)self intentMetadata];
    v17 = [v4 intentMetadata];
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
  int v5 = [+[_INPBSetMessageAttributeIntent allocWithZone:](_INPBSetMessageAttributeIntent, "allocWithZone:") init];
  if ([(_INPBSetMessageAttributeIntent *)self hasAttribute]) {
    [(_INPBSetMessageAttributeIntent *)v5 setAttribute:[(_INPBSetMessageAttributeIntent *)self attribute]];
  }
  v6 = (void *)[(NSArray *)self->_identifiers copyWithZone:a3];
  [(_INPBSetMessageAttributeIntent *)v5 setIdentifiers:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSetMessageAttributeIntent *)v5 setIntentMetadata:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSetMessageAttributeIntent *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSetMessageAttributeIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSetMessageAttributeIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSetMessageAttributeIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSetMessageAttributeIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBSetMessageAttributeIntent *)self hasAttribute]) {
    PBDataWriterWriteInt32Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v5 = self->_identifiers;
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

  v10 = [(_INPBSetMessageAttributeIntent *)self intentMetadata];

  if (v10)
  {
    v11 = [(_INPBSetMessageAttributeIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetMessageAttributeIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (id)identifierAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_identifiers objectAtIndexedSubscript:a3];
}

- (unint64_t)identifiersCount
{
  return [(NSArray *)self->_identifiers count];
}

- (void)addIdentifier:(id)a3
{
  id v4 = a3;
  identifiers = self->_identifiers;
  id v8 = v4;
  if (!identifiers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_identifiers;
    self->_identifiers = v6;

    id v4 = v8;
    identifiers = self->_identifiers;
  }
  [(NSArray *)identifiers addObject:v4];
}

- (void)clearIdentifiers
{
}

- (void)setIdentifiers:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  identifiers = self->_identifiers;
  self->_identifiers = v4;

  MEMORY[0x1F41817F8](v4, identifiers);
}

- (int)StringAsAttribute:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"READ"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"UNREAD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FLAGGED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNFLAGGED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PLAYED"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)attributeAsString:(int)a3
{
  if ((a3 - 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551C3E8[a3 - 1];
  }

  return v3;
}

- (void)setHasAttribute:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAttribute
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAttribute:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int attribute = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end