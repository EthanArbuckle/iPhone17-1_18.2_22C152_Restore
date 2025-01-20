@interface _INPBGenericIntent
+ (BOOL)supportsSecureCoding;
+ (Class)parametersType;
- (BOOL)hasDomain;
- (BOOL)hasMetadata;
- (BOOL)hasVerb;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)parameters;
- (NSString)domain;
- (NSString)verb;
- (_INPBGenericIntent)initWithCoder:(id)a3;
- (_INPBIntentMetadata)metadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)parametersAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)parametersCount;
- (void)addParameters:(id)a3;
- (void)clearParameters;
- (void)encodeWithCoder:(id)a3;
- (void)setDomain:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setParameters:(id)a3;
- (void)setVerb:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBGenericIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verb, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

- (NSString)verb
{
  return self->_verb;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (_INPBIntentMetadata)metadata
{
  return self->_metadata;
}

- (NSString)domain
{
  return self->_domain;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_domain)
  {
    v4 = [(_INPBGenericIntent *)self domain];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"domain"];
  }
  v6 = [(_INPBGenericIntent *)self metadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"metadata"];

  if ([(NSArray *)self->_parameters count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v9 = self->_parameters;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"parameters"];
  }
  if (self->_verb)
  {
    v15 = [(_INPBGenericIntent *)self verb];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"verb"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  unint64_t v4 = [(_INPBIntentMetadata *)self->_metadata hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_parameters hash];
  return v4 ^ v5 ^ [(NSString *)self->_verb hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  uint64_t v5 = [(_INPBGenericIntent *)self domain];
  v6 = [v4 domain];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_INPBGenericIntent *)self domain];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBGenericIntent *)self domain];
    uint64_t v10 = [v4 domain];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBGenericIntent *)self metadata];
  v6 = [v4 metadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_INPBGenericIntent *)self metadata];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBGenericIntent *)self metadata];
    v15 = [v4 metadata];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBGenericIntent *)self parameters];
  v6 = [v4 parameters];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_INPBGenericIntent *)self parameters];
  if (v17)
  {
    long long v18 = (void *)v17;
    long long v19 = [(_INPBGenericIntent *)self parameters];
    long long v20 = [v4 parameters];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBGenericIntent *)self verb];
  v6 = [v4 verb];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_INPBGenericIntent *)self verb];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    uint64_t v23 = (void *)v22;
    v24 = [(_INPBGenericIntent *)self verb];
    v25 = [v4 verb];
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
  uint64_t v5 = [+[_INPBGenericIntent allocWithZone:](_INPBGenericIntent, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_domain copyWithZone:a3];
  [(_INPBGenericIntent *)v5 setDomain:v6];

  id v7 = [(_INPBIntentMetadata *)self->_metadata copyWithZone:a3];
  [(_INPBGenericIntent *)v5 setMetadata:v7];

  v8 = (void *)[(NSArray *)self->_parameters copyWithZone:a3];
  [(_INPBGenericIntent *)v5 setParameters:v8];

  v9 = (void *)[(NSString *)self->_verb copyWithZone:a3];
  [(_INPBGenericIntent *)v5 setVerb:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBGenericIntent *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBGenericIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBGenericIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBGenericIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBGenericIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_INPBGenericIntent *)self domain];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  id v6 = [(_INPBGenericIntent *)self metadata];

  if (v6)
  {
    uint64_t v7 = [(_INPBGenericIntent *)self metadata];
    PBDataWriterWriteSubmessage();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v8 = self->_parameters;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  v13 = [(_INPBGenericIntent *)self verb];

  if (v13) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBGenericIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasVerb
{
  return self->_verb != 0;
}

- (void)setVerb:(id)a3
{
  self->_verb = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)parametersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_parameters objectAtIndexedSubscript:a3];
}

- (unint64_t)parametersCount
{
  return [(NSArray *)self->_parameters count];
}

- (void)addParameters:(id)a3
{
  id v4 = a3;
  parameters = self->_parameters;
  id v8 = v4;
  if (!parameters)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_parameters;
    self->_parameters = v6;

    id v4 = v8;
    parameters = self->_parameters;
  }
  [(NSArray *)parameters addObject:v4];
}

- (void)clearParameters
{
}

- (void)setParameters:(id)a3
{
  self->_parameters = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (void)setDomain:(id)a3
{
  self->_domain = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)parametersType
{
  return (Class)objc_opt_class();
}

@end