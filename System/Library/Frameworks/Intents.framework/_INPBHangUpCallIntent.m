@interface _INPBHangUpCallIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCallIdentifier;
- (BOOL)hasIntentMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)callIdentifier;
- (_INPBHangUpCallIntent)initWithCoder:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCallIdentifier:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBHangUpCallIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_callIdentifier, 0);
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (NSString)callIdentifier
{
  return self->_callIdentifier;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_callIdentifier)
  {
    v4 = [(_INPBHangUpCallIntent *)self callIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"callIdentifier"];
  }
  v6 = [(_INPBHangUpCallIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_callIdentifier hash];
  return [(_INPBIntentMetadata *)self->_intentMetadata hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBHangUpCallIntent *)self callIdentifier];
  v6 = [v4 callIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBHangUpCallIntent *)self callIdentifier];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBHangUpCallIntent *)self callIdentifier];
    v10 = [v4 callIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBHangUpCallIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBHangUpCallIntent *)self intentMetadata];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_INPBHangUpCallIntent *)self intentMetadata];
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
  v5 = [+[_INPBHangUpCallIntent allocWithZone:](_INPBHangUpCallIntent, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_callIdentifier copyWithZone:a3];
  [(_INPBHangUpCallIntent *)v5 setCallIdentifier:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBHangUpCallIntent *)v5 setIntentMetadata:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBHangUpCallIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBHangUpCallIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBHangUpCallIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBHangUpCallIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBHangUpCallIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(_INPBHangUpCallIntent *)self callIdentifier];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(_INPBHangUpCallIntent *)self intentMetadata];

  if (v5)
  {
    id v6 = [(_INPBHangUpCallIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBHangUpCallIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasCallIdentifier
{
  return self->_callIdentifier != 0;
}

- (void)setCallIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  callIdentifier = self->_callIdentifier;
  self->_callIdentifier = v4;

  MEMORY[0x1F41817F8](v4, callIdentifier);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end