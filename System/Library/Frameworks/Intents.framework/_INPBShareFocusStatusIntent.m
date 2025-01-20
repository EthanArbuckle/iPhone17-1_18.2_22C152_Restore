@interface _INPBShareFocusStatusIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasFocusStatus;
- (BOOL)hasIntentMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBFocusStatus)focusStatus;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBShareFocusStatusIntent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFocusStatus:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBShareFocusStatusIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_focusStatus, 0);
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBFocusStatus)focusStatus
{
  return self->_focusStatus;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBShareFocusStatusIntent *)self focusStatus];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"focusStatus"];

  v6 = [(_INPBShareFocusStatusIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBFocusStatus *)self->_focusStatus hash];
  return [(_INPBIntentMetadata *)self->_intentMetadata hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBShareFocusStatusIntent *)self focusStatus];
  v6 = [v4 focusStatus];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBShareFocusStatusIntent *)self focusStatus];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBShareFocusStatusIntent *)self focusStatus];
    v10 = [v4 focusStatus];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBShareFocusStatusIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBShareFocusStatusIntent *)self intentMetadata];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_INPBShareFocusStatusIntent *)self intentMetadata];
    v15 = [v4 intentMetadata];
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
  v5 = [+[_INPBShareFocusStatusIntent allocWithZone:](_INPBShareFocusStatusIntent, "allocWithZone:") init];
  id v6 = [(_INPBFocusStatus *)self->_focusStatus copyWithZone:a3];
  [(_INPBShareFocusStatusIntent *)v5 setFocusStatus:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBShareFocusStatusIntent *)v5 setIntentMetadata:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBShareFocusStatusIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBShareFocusStatusIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBShareFocusStatusIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBShareFocusStatusIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBShareFocusStatusIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(_INPBShareFocusStatusIntent *)self focusStatus];

  if (v4)
  {
    v5 = [(_INPBShareFocusStatusIntent *)self focusStatus];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBShareFocusStatusIntent *)self intentMetadata];

  if (v6)
  {
    uint64_t v7 = [(_INPBShareFocusStatusIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBShareFocusStatusIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasFocusStatus
{
  return self->_focusStatus != 0;
}

- (void)setFocusStatus:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end