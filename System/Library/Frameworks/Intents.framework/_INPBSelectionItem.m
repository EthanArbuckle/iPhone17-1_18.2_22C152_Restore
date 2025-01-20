@interface _INPBSelectionItem
+ (BOOL)supportsSecureCoding;
- (BOOL)hasUuid;
- (BOOL)hasValue;
- (BOOL)hasVocabularyValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)uuid;
- (NSString)vocabularyValue;
- (_INPBIntentSlotValue)value;
- (_INPBSelectionItem)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setUuid:(id)a3;
- (void)setValue:(id)a3;
- (void)setVocabularyValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSelectionItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocabularyValue, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (NSString)vocabularyValue
{
  return self->_vocabularyValue;
}

- (_INPBIntentSlotValue)value
{
  return self->_value;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_uuid)
  {
    v4 = [(_INPBSelectionItem *)self uuid];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"uuid"];
  }
  v6 = [(_INPBSelectionItem *)self value];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"value"];

  if (self->_vocabularyValue)
  {
    v8 = [(_INPBSelectionItem *)self vocabularyValue];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"vocabularyValue"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuid hash];
  unint64_t v4 = [(_INPBIntentSlotValue *)self->_value hash] ^ v3;
  return v4 ^ [(NSString *)self->_vocabularyValue hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBSelectionItem *)self uuid];
  v6 = [v4 uuid];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBSelectionItem *)self uuid];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBSelectionItem *)self uuid];
    v10 = [v4 uuid];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBSelectionItem *)self value];
  v6 = [v4 value];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBSelectionItem *)self value];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSelectionItem *)self value];
    v15 = [v4 value];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBSelectionItem *)self vocabularyValue];
  v6 = [v4 vocabularyValue];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBSelectionItem *)self vocabularyValue];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBSelectionItem *)self vocabularyValue];
    v20 = [v4 vocabularyValue];
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
  v5 = [+[_INPBSelectionItem allocWithZone:](_INPBSelectionItem, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_uuid copyWithZone:a3];
  [(_INPBSelectionItem *)v5 setUuid:v6];

  id v7 = [(_INPBIntentSlotValue *)self->_value copyWithZone:a3];
  [(_INPBSelectionItem *)v5 setValue:v7];

  v8 = (void *)[(NSString *)self->_vocabularyValue copyWithZone:a3];
  [(_INPBSelectionItem *)v5 setVocabularyValue:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSelectionItem *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSelectionItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSelectionItem *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSelectionItem *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSelectionItem *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(_INPBSelectionItem *)self uuid];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(_INPBSelectionItem *)self value];

  if (v5)
  {
    id v6 = [(_INPBSelectionItem *)self value];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBSelectionItem *)self vocabularyValue];

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSelectionItemReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasVocabularyValue
{
  return self->_vocabularyValue != 0;
}

- (void)setVocabularyValue:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  vocabularyValue = self->_vocabularyValue;
  self->_vocabularyValue = v4;

  MEMORY[0x1F41817F8](v4, vocabularyValue);
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setValue:(id)a3
{
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setUuid:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  uuid = self->_uuid;
  self->_uuid = v4;

  MEMORY[0x1F41817F8](v4, uuid);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end