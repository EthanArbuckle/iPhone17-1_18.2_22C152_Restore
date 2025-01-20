@interface _INPBCustomObject
+ (BOOL)supportsSecureCoding;
+ (Class)alternativeType;
- (BOOL)hasDisplayImage;
- (BOOL)hasDisplayString;
- (BOOL)hasIdentifier;
- (BOOL)hasPronunciationHint;
- (BOOL)hasSubtitleString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)alternatives;
- (NSString)displayString;
- (NSString)identifier;
- (NSString)pronunciationHint;
- (NSString)subtitleString;
- (_INPBCustomObject)initWithCoder:(id)a3;
- (_INPBImageValue)displayImage;
- (id)alternativeAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)alternativesCount;
- (unint64_t)hash;
- (void)addAlternative:(id)a3;
- (void)clearAlternatives;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternatives:(id)a3;
- (void)setDisplayImage:(id)a3;
- (void)setDisplayString:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPronunciationHint:(id)a3;
- (void)setSubtitleString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCustomObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleString, 0);
  objc_storeStrong((id *)&self->_pronunciationHint, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_displayImage, 0);

  objc_storeStrong((id *)&self->_alternatives, 0);
}

- (NSString)subtitleString
{
  return self->_subtitleString;
}

- (NSString)pronunciationHint
{
  return self->_pronunciationHint;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (_INPBImageValue)displayImage
{
  return self->_displayImage;
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (id)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_alternatives count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v5 = self->_alternatives;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (void)v22);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"alternative"];
  }
  v11 = [(_INPBCustomObject *)self displayImage];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"displayImage"];

  if (self->_displayString)
  {
    v13 = [(_INPBCustomObject *)self displayString];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"displayString"];
  }
  if (self->_identifier)
  {
    v15 = [(_INPBCustomObject *)self identifier];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"identifier"];
  }
  if (self->_pronunciationHint)
  {
    v17 = [(_INPBCustomObject *)self pronunciationHint];
    v18 = (void *)[v17 copy];
    [v3 setObject:v18 forKeyedSubscript:@"pronunciationHint"];
  }
  if (self->_subtitleString)
  {
    v19 = [(_INPBCustomObject *)self subtitleString];
    v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"subtitleString"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_alternatives hash];
  unint64_t v4 = [(_INPBImageValue *)self->_displayImage hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_displayString hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_identifier hash];
  NSUInteger v7 = [(NSString *)self->_pronunciationHint hash];
  return v6 ^ v7 ^ [(NSString *)self->_subtitleString hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  NSUInteger v5 = [(_INPBCustomObject *)self alternatives];
  NSUInteger v6 = [v4 alternatives];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(_INPBCustomObject *)self alternatives];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBCustomObject *)self alternatives];
    v10 = [v4 alternatives];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBCustomObject *)self displayImage];
  NSUInteger v6 = [v4 displayImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v12 = [(_INPBCustomObject *)self displayImage];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBCustomObject *)self displayImage];
    v15 = [v4 displayImage];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBCustomObject *)self displayString];
  NSUInteger v6 = [v4 displayString];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(_INPBCustomObject *)self displayString];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBCustomObject *)self displayString];
    v20 = [v4 displayString];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBCustomObject *)self identifier];
  NSUInteger v6 = [v4 identifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(_INPBCustomObject *)self identifier];
  if (v22)
  {
    long long v23 = (void *)v22;
    long long v24 = [(_INPBCustomObject *)self identifier];
    long long v25 = [v4 identifier];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBCustomObject *)self pronunciationHint];
  NSUInteger v6 = [v4 pronunciationHint];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(_INPBCustomObject *)self pronunciationHint];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBCustomObject *)self pronunciationHint];
    v30 = [v4 pronunciationHint];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBCustomObject *)self subtitleString];
  NSUInteger v6 = [v4 subtitleString];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v32 = [(_INPBCustomObject *)self subtitleString];
    if (!v32)
    {

LABEL_35:
      BOOL v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    v34 = [(_INPBCustomObject *)self subtitleString];
    v35 = [v4 subtitleString];
    char v36 = [v34 isEqual:v35];

    if (v36) {
      goto LABEL_35;
    }
  }
  else
  {
LABEL_31:
  }
LABEL_32:
  BOOL v37 = 0;
LABEL_33:

  return v37;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[_INPBCustomObject allocWithZone:](_INPBCustomObject, "allocWithZone:") init];
  NSUInteger v6 = (void *)[(NSArray *)self->_alternatives copyWithZone:a3];
  [(_INPBCustomObject *)v5 setAlternatives:v6];

  id v7 = [(_INPBImageValue *)self->_displayImage copyWithZone:a3];
  [(_INPBCustomObject *)v5 setDisplayImage:v7];

  uint64_t v8 = (void *)[(NSString *)self->_displayString copyWithZone:a3];
  [(_INPBCustomObject *)v5 setDisplayString:v8];

  v9 = (void *)[(NSString *)self->_identifier copyWithZone:a3];
  [(_INPBCustomObject *)v5 setIdentifier:v9];

  v10 = (void *)[(NSString *)self->_pronunciationHint copyWithZone:a3];
  [(_INPBCustomObject *)v5 setPronunciationHint:v10];

  int v11 = (void *)[(NSString *)self->_subtitleString copyWithZone:a3];
  [(_INPBCustomObject *)v5 setSubtitleString:v11];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCustomObject *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCustomObject)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCustomObject *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCustomObject *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCustomObject *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  NSUInteger v5 = self->_alternatives;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v10 = [(_INPBCustomObject *)self displayImage];

  if (v10)
  {
    int v11 = [(_INPBCustomObject *)self displayImage];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(_INPBCustomObject *)self displayString];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  v13 = [(_INPBCustomObject *)self identifier];

  if (v13) {
    PBDataWriterWriteStringField();
  }
  v14 = [(_INPBCustomObject *)self pronunciationHint];

  if (v14) {
    PBDataWriterWriteStringField();
  }
  v15 = [(_INPBCustomObject *)self subtitleString];

  if (v15) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCustomObjectReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasSubtitleString
{
  return self->_subtitleString != 0;
}

- (void)setSubtitleString:(id)a3
{
  self->_subtitleString = (NSString *)[a3 copy];

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

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setIdentifier:(id)a3
{
  self->_identifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasDisplayString
{
  return self->_displayString != 0;
}

- (void)setDisplayString:(id)a3
{
  self->_displayString = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasDisplayImage
{
  return self->_displayImage != 0;
}

- (void)setDisplayImage:(id)a3
{
}

- (id)alternativeAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_alternatives objectAtIndexedSubscript:a3];
}

- (unint64_t)alternativesCount
{
  return [(NSArray *)self->_alternatives count];
}

- (void)addAlternative:(id)a3
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

+ (Class)alternativeType
{
  return (Class)objc_opt_class();
}

@end