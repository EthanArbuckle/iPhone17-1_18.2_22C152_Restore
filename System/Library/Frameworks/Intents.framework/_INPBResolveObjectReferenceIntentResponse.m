@interface _INPBResolveObjectReferenceIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasResolvedReferences;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)resolvedReferences;
- (_INPBResolveObjectReferenceIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setResolvedReferences:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBResolveObjectReferenceIntentResponse

- (void).cxx_destruct
{
}

- (NSData)resolvedReferences
{
  return self->_resolvedReferences;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_resolvedReferences)
  {
    v4 = [(_INPBResolveObjectReferenceIntentResponse *)self resolvedReferences];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"resolvedReferences"];
  }

  return v3;
}

- (unint64_t)hash
{
  return [(NSData *)self->_resolvedReferences hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_INPBResolveObjectReferenceIntentResponse *)self resolvedReferences];
    v6 = [v4 resolvedReferences];
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_INPBResolveObjectReferenceIntentResponse *)self resolvedReferences];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_INPBResolveObjectReferenceIntentResponse *)self resolvedReferences];
      v11 = [v4 resolvedReferences];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBResolveObjectReferenceIntentResponse allocWithZone:](_INPBResolveObjectReferenceIntentResponse, "allocWithZone:") init];
  v6 = (void *)[(NSData *)self->_resolvedReferences copyWithZone:a3];
  [(_INPBResolveObjectReferenceIntentResponse *)v5 setResolvedReferences:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBResolveObjectReferenceIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBResolveObjectReferenceIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBResolveObjectReferenceIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBResolveObjectReferenceIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBResolveObjectReferenceIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  id v4 = [(_INPBResolveObjectReferenceIntentResponse *)self resolvedReferences];

  if (v4) {
    PBDataWriterWriteDataField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBResolveObjectReferenceIntentResponseReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasResolvedReferences
{
  return self->_resolvedReferences != 0;
}

- (void)setResolvedReferences:(id)a3
{
  id v4 = (NSData *)[a3 copy];
  resolvedReferences = self->_resolvedReferences;
  self->_resolvedReferences = v4;

  MEMORY[0x1F41817F8](v4, resolvedReferences);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end