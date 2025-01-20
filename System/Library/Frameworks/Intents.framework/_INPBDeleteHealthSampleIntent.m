@interface _INPBDeleteHealthSampleIntent
+ (BOOL)supportsSecureCoding;
+ (Class)sampleUuidsType;
- (BOOL)hasIntentMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)sampleUuids;
- (_INPBDeleteHealthSampleIntent)initWithCoder:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)sampleUuidsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)sampleUuidsCount;
- (void)addSampleUuids:(id)a3;
- (void)clearSampleUuids;
- (void)encodeWithCoder:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setSampleUuids:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBDeleteHealthSampleIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleUuids, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (NSArray)sampleUuids
{
  return self->_sampleUuids;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBDeleteHealthSampleIntent *)self intentMetadata];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"intentMetadata"];

  if ([(NSArray *)self->_sampleUuids count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_sampleUuids;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"sampleUuids"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  return [(NSArray *)self->_sampleUuids hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBDeleteHealthSampleIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBDeleteHealthSampleIntent *)self intentMetadata];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBDeleteHealthSampleIntent *)self intentMetadata];
    uint64_t v10 = [v4 intentMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBDeleteHealthSampleIntent *)self sampleUuids];
  v6 = [v4 sampleUuids];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBDeleteHealthSampleIntent *)self sampleUuids];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    long long v14 = [(_INPBDeleteHealthSampleIntent *)self sampleUuids];
    long long v15 = [v4 sampleUuids];
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
  v5 = [+[_INPBDeleteHealthSampleIntent allocWithZone:](_INPBDeleteHealthSampleIntent, "allocWithZone:") init];
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBDeleteHealthSampleIntent *)v5 setIntentMetadata:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_sampleUuids copyWithZone:a3];
  [(_INPBDeleteHealthSampleIntent *)v5 setSampleUuids:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBDeleteHealthSampleIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBDeleteHealthSampleIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBDeleteHealthSampleIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBDeleteHealthSampleIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBDeleteHealthSampleIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_INPBDeleteHealthSampleIntent *)self intentMetadata];

  if (v5)
  {
    id v6 = [(_INPBDeleteHealthSampleIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_sampleUuids;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDeleteHealthSampleIntentReadFrom(self, (uint64_t)a3);
}

- (id)sampleUuidsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_sampleUuids objectAtIndexedSubscript:a3];
}

- (unint64_t)sampleUuidsCount
{
  return [(NSArray *)self->_sampleUuids count];
}

- (void)addSampleUuids:(id)a3
{
  id v4 = a3;
  sampleUuids = self->_sampleUuids;
  id v8 = v4;
  if (!sampleUuids)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_sampleUuids;
    self->_sampleUuids = v6;

    id v4 = v8;
    sampleUuids = self->_sampleUuids;
  }
  [(NSArray *)sampleUuids addObject:v4];
}

- (void)clearSampleUuids
{
}

- (void)setSampleUuids:(id)a3
{
  self->_sampleUuids = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
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

+ (Class)sampleUuidsType
{
  return (Class)objc_opt_class();
}

@end