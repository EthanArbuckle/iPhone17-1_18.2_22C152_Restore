@interface _INPBPrivateUpdateMediaAffinityIntentData
+ (BOOL)supportsSecureCoding;
- (BOOL)hasPegasusMetaData;
- (BOOL)hasPrivateMediaIntentData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)internalSignals;
- (NSData)pegasusMetaData;
- (_INPBPrivateMediaIntentData)privateMediaIntentData;
- (_INPBPrivateUpdateMediaAffinityIntentData)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)internalSignalAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)internalSignalsCount;
- (void)addInternalSignal:(id)a3;
- (void)clearInternalSignals;
- (void)encodeWithCoder:(id)a3;
- (void)setInternalSignals:(id)a3;
- (void)setPegasusMetaData:(id)a3;
- (void)setPrivateMediaIntentData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPrivateUpdateMediaAffinityIntentData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateMediaIntentData, 0);
  objc_storeStrong((id *)&self->_pegasusMetaData, 0);

  objc_storeStrong((id *)&self->_internalSignals, 0);
}

- (_INPBPrivateMediaIntentData)privateMediaIntentData
{
  return self->_privateMediaIntentData;
}

- (NSData)pegasusMetaData
{
  return self->_pegasusMetaData;
}

- (NSArray)internalSignals
{
  return self->_internalSignals;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_internalSignals)
  {
    v4 = [(_INPBPrivateUpdateMediaAffinityIntentData *)self internalSignals];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"internalSignal"];
  }
  if (self->_pegasusMetaData)
  {
    v6 = [(_INPBPrivateUpdateMediaAffinityIntentData *)self pegasusMetaData];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"pegasusMetaData"];
  }
  v8 = [(_INPBPrivateUpdateMediaAffinityIntentData *)self privateMediaIntentData];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"privateMediaIntentData"];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_internalSignals hash];
  uint64_t v4 = [(NSData *)self->_pegasusMetaData hash] ^ v3;
  return v4 ^ [(_INPBPrivateMediaIntentData *)self->_privateMediaIntentData hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBPrivateUpdateMediaAffinityIntentData *)self internalSignals];
  v6 = [v4 internalSignals];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBPrivateUpdateMediaAffinityIntentData *)self internalSignals];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBPrivateUpdateMediaAffinityIntentData *)self internalSignals];
    v10 = [v4 internalSignals];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBPrivateUpdateMediaAffinityIntentData *)self pegasusMetaData];
  v6 = [v4 pegasusMetaData];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBPrivateUpdateMediaAffinityIntentData *)self pegasusMetaData];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBPrivateUpdateMediaAffinityIntentData *)self pegasusMetaData];
    v15 = [v4 pegasusMetaData];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBPrivateUpdateMediaAffinityIntentData *)self privateMediaIntentData];
  v6 = [v4 privateMediaIntentData];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBPrivateUpdateMediaAffinityIntentData *)self privateMediaIntentData];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBPrivateUpdateMediaAffinityIntentData *)self privateMediaIntentData];
    v20 = [v4 privateMediaIntentData];
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
  v5 = [+[_INPBPrivateUpdateMediaAffinityIntentData allocWithZone:](_INPBPrivateUpdateMediaAffinityIntentData, "allocWithZone:") init];
  v6 = (void *)[(NSArray *)self->_internalSignals copyWithZone:a3];
  [(_INPBPrivateUpdateMediaAffinityIntentData *)v5 setInternalSignals:v6];

  uint64_t v7 = (void *)[(NSData *)self->_pegasusMetaData copyWithZone:a3];
  [(_INPBPrivateUpdateMediaAffinityIntentData *)v5 setPegasusMetaData:v7];

  id v8 = [(_INPBPrivateMediaIntentData *)self->_privateMediaIntentData copyWithZone:a3];
  [(_INPBPrivateUpdateMediaAffinityIntentData *)v5 setPrivateMediaIntentData:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPrivateUpdateMediaAffinityIntentData *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPrivateUpdateMediaAffinityIntentData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPrivateUpdateMediaAffinityIntentData *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPrivateUpdateMediaAffinityIntentData *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPrivateUpdateMediaAffinityIntentData *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_internalSignals;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v10 = [(_INPBPrivateUpdateMediaAffinityIntentData *)self pegasusMetaData];

  if (v10) {
    PBDataWriterWriteDataField();
  }
  int v11 = [(_INPBPrivateUpdateMediaAffinityIntentData *)self privateMediaIntentData];

  if (v11)
  {
    uint64_t v12 = [(_INPBPrivateUpdateMediaAffinityIntentData *)self privateMediaIntentData];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPrivateUpdateMediaAffinityIntentDataReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasPrivateMediaIntentData
{
  return self->_privateMediaIntentData != 0;
}

- (void)setPrivateMediaIntentData:(id)a3
{
}

- (BOOL)hasPegasusMetaData
{
  return self->_pegasusMetaData != 0;
}

- (void)setPegasusMetaData:(id)a3
{
  id v4 = (NSData *)[a3 copy];
  pegasusMetaData = self->_pegasusMetaData;
  self->_pegasusMetaData = v4;

  MEMORY[0x1F41817F8](v4, pegasusMetaData);
}

- (id)internalSignalAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_internalSignals objectAtIndexedSubscript:a3];
}

- (unint64_t)internalSignalsCount
{
  return [(NSArray *)self->_internalSignals count];
}

- (void)addInternalSignal:(id)a3
{
  id v4 = a3;
  internalSignals = self->_internalSignals;
  id v8 = v4;
  if (!internalSignals)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_internalSignals;
    self->_internalSignals = v6;

    id v4 = v8;
    internalSignals = self->_internalSignals;
  }
  [(NSArray *)internalSignals addObject:v4];
}

- (void)clearInternalSignals
{
}

- (void)setInternalSignals:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  internalSignals = self->_internalSignals;
  self->_internalSignals = v4;

  MEMORY[0x1F41817F8](v4, internalSignals);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end