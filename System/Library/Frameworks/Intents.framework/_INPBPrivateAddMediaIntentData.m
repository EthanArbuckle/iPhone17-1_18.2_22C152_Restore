@interface _INPBPrivateAddMediaIntentData
+ (BOOL)supportsSecureCoding;
+ (Class)audioSearchResultsType;
- (BOOL)hasPegasusMetaData;
- (BOOL)hasPrivateMediaIntentData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)audioSearchResults;
- (NSArray)internalSignals;
- (NSData)pegasusMetaData;
- (_INPBPrivateAddMediaIntentData)initWithCoder:(id)a3;
- (_INPBPrivateMediaIntentData)privateMediaIntentData;
- (id)audioSearchResultsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)internalSignalAtIndex:(unint64_t)a3;
- (unint64_t)audioSearchResultsCount;
- (unint64_t)hash;
- (unint64_t)internalSignalsCount;
- (void)addAudioSearchResults:(id)a3;
- (void)addInternalSignal:(id)a3;
- (void)clearAudioSearchResults;
- (void)clearInternalSignals;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioSearchResults:(id)a3;
- (void)setInternalSignals:(id)a3;
- (void)setPegasusMetaData:(id)a3;
- (void)setPrivateMediaIntentData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPrivateAddMediaIntentData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateMediaIntentData, 0);
  objc_storeStrong((id *)&self->_pegasusMetaData, 0);
  objc_storeStrong((id *)&self->_internalSignals, 0);

  objc_storeStrong((id *)&self->_audioSearchResults, 0);
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

- (NSArray)audioSearchResults
{
  return self->_audioSearchResults;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_audioSearchResults count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v5 = self->_audioSearchResults;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"audioSearchResults"];
  }
  if (self->_internalSignals)
  {
    v11 = [(_INPBPrivateAddMediaIntentData *)self internalSignals];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"internalSignal"];
  }
  if (self->_pegasusMetaData)
  {
    v13 = [(_INPBPrivateAddMediaIntentData *)self pegasusMetaData];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"pegasusMetaData"];
  }
  v15 = [(_INPBPrivateAddMediaIntentData *)self privateMediaIntentData];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"privateMediaIntentData"];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_audioSearchResults hash];
  uint64_t v4 = [(NSArray *)self->_internalSignals hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_pegasusMetaData hash];
  return v4 ^ v5 ^ [(_INPBPrivateMediaIntentData *)self->_privateMediaIntentData hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  uint64_t v5 = [(_INPBPrivateAddMediaIntentData *)self audioSearchResults];
  uint64_t v6 = [v4 audioSearchResults];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_INPBPrivateAddMediaIntentData *)self audioSearchResults];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBPrivateAddMediaIntentData *)self audioSearchResults];
    v10 = [v4 audioSearchResults];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBPrivateAddMediaIntentData *)self internalSignals];
  uint64_t v6 = [v4 internalSignals];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_INPBPrivateAddMediaIntentData *)self internalSignals];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBPrivateAddMediaIntentData *)self internalSignals];
    v15 = [v4 internalSignals];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBPrivateAddMediaIntentData *)self pegasusMetaData];
  uint64_t v6 = [v4 pegasusMetaData];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_INPBPrivateAddMediaIntentData *)self pegasusMetaData];
  if (v17)
  {
    long long v18 = (void *)v17;
    long long v19 = [(_INPBPrivateAddMediaIntentData *)self pegasusMetaData];
    long long v20 = [v4 pegasusMetaData];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBPrivateAddMediaIntentData *)self privateMediaIntentData];
  uint64_t v6 = [v4 privateMediaIntentData];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_INPBPrivateAddMediaIntentData *)self privateMediaIntentData];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    uint64_t v23 = (void *)v22;
    v24 = [(_INPBPrivateAddMediaIntentData *)self privateMediaIntentData];
    v25 = [v4 privateMediaIntentData];
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
  uint64_t v5 = [+[_INPBPrivateAddMediaIntentData allocWithZone:](_INPBPrivateAddMediaIntentData, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_audioSearchResults copyWithZone:a3];
  [(_INPBPrivateAddMediaIntentData *)v5 setAudioSearchResults:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_internalSignals copyWithZone:a3];
  [(_INPBPrivateAddMediaIntentData *)v5 setInternalSignals:v7];

  uint64_t v8 = (void *)[(NSData *)self->_pegasusMetaData copyWithZone:a3];
  [(_INPBPrivateAddMediaIntentData *)v5 setPegasusMetaData:v8];

  id v9 = [(_INPBPrivateMediaIntentData *)self->_privateMediaIntentData copyWithZone:a3];
  [(_INPBPrivateAddMediaIntentData *)v5 setPrivateMediaIntentData:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPrivateAddMediaIntentData *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPrivateAddMediaIntentData)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPrivateAddMediaIntentData *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPrivateAddMediaIntentData *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPrivateAddMediaIntentData *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = self->_audioSearchResults;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v10 = self->_internalSignals;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v12);
  }

  v15 = [(_INPBPrivateAddMediaIntentData *)self pegasusMetaData];

  if (v15) {
    PBDataWriterWriteDataField();
  }
  int v16 = [(_INPBPrivateAddMediaIntentData *)self privateMediaIntentData];

  if (v16)
  {
    uint64_t v17 = [(_INPBPrivateAddMediaIntentData *)self privateMediaIntentData];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPrivateAddMediaIntentDataReadFrom(self, (uint64_t)a3);
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

- (id)audioSearchResultsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_audioSearchResults objectAtIndexedSubscript:a3];
}

- (unint64_t)audioSearchResultsCount
{
  return [(NSArray *)self->_audioSearchResults count];
}

- (void)addAudioSearchResults:(id)a3
{
  id v4 = a3;
  audioSearchResults = self->_audioSearchResults;
  id v8 = v4;
  if (!audioSearchResults)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_audioSearchResults;
    self->_audioSearchResults = v6;

    id v4 = v8;
    audioSearchResults = self->_audioSearchResults;
  }
  [(NSArray *)audioSearchResults addObject:v4];
}

- (void)clearAudioSearchResults
{
}

- (void)setAudioSearchResults:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  audioSearchResults = self->_audioSearchResults;
  self->_audioSearchResults = v4;

  MEMORY[0x1F41817F8](v4, audioSearchResults);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)audioSearchResultsType
{
  return (Class)objc_opt_class();
}

@end