@interface _INPBPrivateSearchForMediaIntentData
+ (BOOL)supportsSecureCoding;
+ (Class)audioSearchResultsType;
- (BOOL)appInferred;
- (BOOL)hasAppInferred;
- (BOOL)hasPegasusMetaData;
- (BOOL)hasPrivateMediaIntentData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)audioSearchResults;
- (NSArray)internalSignals;
- (NSData)pegasusMetaData;
- (_INPBPrivateMediaIntentData)privateMediaIntentData;
- (_INPBPrivateSearchForMediaIntentData)initWithCoder:(id)a3;
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
- (void)setAppInferred:(BOOL)a3;
- (void)setAudioSearchResults:(id)a3;
- (void)setHasAppInferred:(BOOL)a3;
- (void)setInternalSignals:(id)a3;
- (void)setPegasusMetaData:(id)a3;
- (void)setPrivateMediaIntentData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPrivateSearchForMediaIntentData

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  int v5 = [(_INPBPrivateSearchForMediaIntentData *)self hasAppInferred];
  if (v5 != [v4 hasAppInferred]) {
    goto LABEL_26;
  }
  if ([(_INPBPrivateSearchForMediaIntentData *)self hasAppInferred])
  {
    if ([v4 hasAppInferred])
    {
      int appInferred = self->_appInferred;
      if (appInferred != [v4 appInferred]) {
        goto LABEL_26;
      }
    }
  }
  v7 = [(_INPBPrivateSearchForMediaIntentData *)self audioSearchResults];
  v8 = [v4 audioSearchResults];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_25;
  }
  uint64_t v9 = [(_INPBPrivateSearchForMediaIntentData *)self audioSearchResults];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_INPBPrivateSearchForMediaIntentData *)self audioSearchResults];
    v12 = [v4 audioSearchResults];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  v7 = [(_INPBPrivateSearchForMediaIntentData *)self internalSignals];
  v8 = [v4 internalSignals];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_25;
  }
  uint64_t v14 = [(_INPBPrivateSearchForMediaIntentData *)self internalSignals];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBPrivateSearchForMediaIntentData *)self internalSignals];
    v17 = [v4 internalSignals];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  v7 = [(_INPBPrivateSearchForMediaIntentData *)self pegasusMetaData];
  v8 = [v4 pegasusMetaData];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_25;
  }
  uint64_t v19 = [(_INPBPrivateSearchForMediaIntentData *)self pegasusMetaData];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_INPBPrivateSearchForMediaIntentData *)self pegasusMetaData];
    v22 = [v4 pegasusMetaData];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  v7 = [(_INPBPrivateSearchForMediaIntentData *)self privateMediaIntentData];
  v8 = [v4 privateMediaIntentData];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v24 = [(_INPBPrivateSearchForMediaIntentData *)self privateMediaIntentData];
    if (!v24)
    {

LABEL_29:
      BOOL v29 = 1;
      goto LABEL_27;
    }
    v25 = (void *)v24;
    v26 = [(_INPBPrivateSearchForMediaIntentData *)self privateMediaIntentData];
    v27 = [v4 privateMediaIntentData];
    char v28 = [v26 isEqual:v27];

    if (v28) {
      goto LABEL_29;
    }
  }
  else
  {
LABEL_25:
  }
LABEL_26:
  BOOL v29 = 0;
LABEL_27:

  return v29;
}

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

- (BOOL)appInferred
{
  return self->_appInferred;
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBPrivateSearchForMediaIntentData *)self hasAppInferred])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBPrivateSearchForMediaIntentData appInferred](self, "appInferred"));
    [v3 setObject:v4 forKeyedSubscript:@"appInferred"];
  }
  if ([(NSArray *)self->_audioSearchResults count])
  {
    int v5 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v6 = self->_audioSearchResults;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKeyedSubscript:@"audioSearchResults"];
  }
  if (self->_internalSignals)
  {
    v12 = [(_INPBPrivateSearchForMediaIntentData *)self internalSignals];
    int v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"internalSignal"];
  }
  if (self->_pegasusMetaData)
  {
    uint64_t v14 = [(_INPBPrivateSearchForMediaIntentData *)self pegasusMetaData];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"pegasusMetaData"];
  }
  v16 = [(_INPBPrivateSearchForMediaIntentData *)self privateMediaIntentData];
  v17 = [v16 dictionaryRepresentation];
  [v3 setObject:v17 forKeyedSubscript:@"privateMediaIntentData"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBPrivateSearchForMediaIntentData *)self hasAppInferred]) {
    uint64_t v3 = 2654435761 * self->_appInferred;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSArray *)self->_audioSearchResults hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_internalSignals hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSData *)self->_pegasusMetaData hash];
  return v6 ^ [(_INPBPrivateMediaIntentData *)self->_privateMediaIntentData hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBPrivateSearchForMediaIntentData allocWithZone:](_INPBPrivateSearchForMediaIntentData, "allocWithZone:") init];
  if ([(_INPBPrivateSearchForMediaIntentData *)self hasAppInferred]) {
    [(_INPBPrivateSearchForMediaIntentData *)v5 setAppInferred:[(_INPBPrivateSearchForMediaIntentData *)self appInferred]];
  }
  uint64_t v6 = (void *)[(NSArray *)self->_audioSearchResults copyWithZone:a3];
  [(_INPBPrivateSearchForMediaIntentData *)v5 setAudioSearchResults:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_internalSignals copyWithZone:a3];
  [(_INPBPrivateSearchForMediaIntentData *)v5 setInternalSignals:v7];

  uint64_t v8 = (void *)[(NSData *)self->_pegasusMetaData copyWithZone:a3];
  [(_INPBPrivateSearchForMediaIntentData *)v5 setPegasusMetaData:v8];

  id v9 = [(_INPBPrivateMediaIntentData *)self->_privateMediaIntentData copyWithZone:a3];
  [(_INPBPrivateSearchForMediaIntentData *)v5 setPrivateMediaIntentData:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPrivateSearchForMediaIntentData *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPrivateSearchForMediaIntentData)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPrivateSearchForMediaIntentData *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPrivateSearchForMediaIntentData *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPrivateSearchForMediaIntentData *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBPrivateSearchForMediaIntentData *)self hasAppInferred]) {
    PBDataWriterWriteBOOLField();
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
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

  v15 = [(_INPBPrivateSearchForMediaIntentData *)self pegasusMetaData];

  if (v15) {
    PBDataWriterWriteDataField();
  }
  v16 = [(_INPBPrivateSearchForMediaIntentData *)self privateMediaIntentData];

  if (v16)
  {
    v17 = [(_INPBPrivateSearchForMediaIntentData *)self privateMediaIntentData];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPrivateSearchForMediaIntentDataReadFrom(self, (uint64_t)a3);
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

- (void)setHasAppInferred:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAppInferred
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAppInferred:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int appInferred = a3;
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