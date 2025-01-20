@interface _INPBResolveObjectReferenceIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIntentMetadata;
- (BOOL)hasReference;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)reference;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBResolveObjectReferenceIntent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setReference:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBResolveObjectReferenceIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reference, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (NSData)reference
{
  return self->_reference;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBResolveObjectReferenceIntent *)self intentMetadata];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"intentMetadata"];

  if (self->_reference)
  {
    v6 = [(_INPBResolveObjectReferenceIntent *)self reference];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"reference"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  return [(NSData *)self->_reference hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBResolveObjectReferenceIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBResolveObjectReferenceIntent *)self intentMetadata];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBResolveObjectReferenceIntent *)self intentMetadata];
    v10 = [v4 intentMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBResolveObjectReferenceIntent *)self reference];
  v6 = [v4 reference];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBResolveObjectReferenceIntent *)self reference];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_INPBResolveObjectReferenceIntent *)self reference];
    v15 = [v4 reference];
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
  v5 = [+[_INPBResolveObjectReferenceIntent allocWithZone:](_INPBResolveObjectReferenceIntent, "allocWithZone:") init];
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBResolveObjectReferenceIntent *)v5 setIntentMetadata:v6];

  uint64_t v7 = (void *)[(NSData *)self->_reference copyWithZone:a3];
  [(_INPBResolveObjectReferenceIntent *)v5 setReference:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBResolveObjectReferenceIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBResolveObjectReferenceIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBResolveObjectReferenceIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBResolveObjectReferenceIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBResolveObjectReferenceIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(_INPBResolveObjectReferenceIntent *)self intentMetadata];

  if (v4)
  {
    v5 = [(_INPBResolveObjectReferenceIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBResolveObjectReferenceIntent *)self reference];

  if (v6) {
    PBDataWriterWriteDataField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBResolveObjectReferenceIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasReference
{
  return self->_reference != 0;
}

- (void)setReference:(id)a3
{
  id v4 = (NSData *)[a3 copy];
  reference = self->_reference;
  self->_reference = v4;

  MEMORY[0x1F41817F8](v4, reference);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end