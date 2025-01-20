@interface INPrivateAddMediaIntentData
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INPrivateAddMediaIntentData)initWithAudioSearchResults:(id)a3;
- (INPrivateAddMediaIntentData)initWithCoder:(id)a3;
- (INPrivateAddMediaIntentData)initWithPrivateMediaIntentData:(id)a3 audioSearchResults:(id)a4;
- (INPrivateAddMediaIntentData)initWithPrivateMediaIntentData:(id)a3 audioSearchResults:(id)a4 internalSignals:(id)a5;
- (INPrivateAddMediaIntentData)initWithPrivateMediaIntentData:(id)a3 audioSearchResults:(id)a4 internalSignals:(id)a5 pegasusMetaData:(id)a6;
- (INPrivateMediaIntentData)privateMediaIntentData;
- (NSArray)audioSearchResults;
- (NSArray)internalSignals;
- (NSData)pegasusMetaData;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPrivateMediaIntentData:(id)a3;
@end

@implementation INPrivateAddMediaIntentData

- (void)_intents_updateContainerWithCache:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(INPrivateAddMediaIntentData *)self audioSearchResults];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_intents_updateContainerWithCache:", v4);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pegasusMetaData, 0);
  objc_storeStrong((id *)&self->_internalSignals, 0);
  objc_storeStrong((id *)&self->_audioSearchResults, 0);

  objc_storeStrong((id *)&self->_privateMediaIntentData, 0);
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

- (void)setPrivateMediaIntentData:(id)a3
{
}

- (INPrivateMediaIntentData)privateMediaIntentData
{
  return self->_privateMediaIntentData;
}

- (id)_dictionaryRepresentation
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v13[0] = @"privateMediaIntentData";
  privateMediaIntentData = self->_privateMediaIntentData;
  id v4 = privateMediaIntentData;
  if (!privateMediaIntentData)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v4;
  v13[1] = @"audioSearchResults";
  audioSearchResults = self->_audioSearchResults;
  uint64_t v6 = audioSearchResults;
  if (!audioSearchResults)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v6;
  v13[2] = @"internalSignals";
  internalSignals = self->_internalSignals;
  uint64_t v8 = internalSignals;
  if (!internalSignals)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v8;
  v13[3] = @"pegasusMetaData";
  pegasusMetaData = self->_pegasusMetaData;
  long long v10 = pegasusMetaData;
  if (!pegasusMetaData)
  {
    long long v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v10;
  long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  if (pegasusMetaData)
  {
    if (internalSignals) {
      goto LABEL_11;
    }
  }
  else
  {

    if (internalSignals)
    {
LABEL_11:
      if (audioSearchResults) {
        goto LABEL_12;
      }
LABEL_18:

      if (privateMediaIntentData) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!audioSearchResults) {
    goto LABEL_18;
  }
LABEL_12:
  if (privateMediaIntentData) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:

  return v11;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INPrivateAddMediaIntentData;
  uint64_t v6 = [(INPrivateAddMediaIntentData *)&v11 description];
  uint64_t v7 = [(INPrivateAddMediaIntentData *)self _dictionaryRepresentation];
  uint64_t v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INPrivateAddMediaIntentData *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  uint64_t v7 = [v5 dictionary];
  uint64_t v8 = [v6 encodeObject:self->_privateMediaIntentData];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"privateMediaIntentData");

  uint64_t v9 = [v6 encodeObject:self->_audioSearchResults];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"audioSearchResults");

  long long v10 = [v6 encodeObject:self->_internalSignals];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"internalSignals");

  objc_super v11 = [v6 encodeObject:self->_pegasusMetaData];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"pegasusMetaData");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  privateMediaIntentData = self->_privateMediaIntentData;
  id v5 = a3;
  [v5 encodeObject:privateMediaIntentData forKey:@"privateMediaIntentData"];
  [v5 encodeObject:self->_audioSearchResults forKey:@"audioSearchResults"];
  [v5 encodeObject:self->_internalSignals forKey:@"internalSignals"];
  [v5 encodeObject:self->_pegasusMetaData forKey:@"pegasusMetaData"];
}

- (INPrivateAddMediaIntentData)initWithCoder:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateMediaIntentData"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  uint64_t v8 = [v6 setWithArray:v7];
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"audioSearchResults"];

  long long v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:3];
  long long v12 = objc_msgSend(v10, "setWithArray:", v11, v17, v18);
  long long v13 = [v4 decodeObjectOfClasses:v12 forKey:@"internalSignals"];

  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pegasusMetaData"];

  uint64_t v15 = [(INPrivateAddMediaIntentData *)self initWithPrivateMediaIntentData:v5 audioSearchResults:v9 internalSignals:v13 pegasusMetaData:v14];
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INPrivateAddMediaIntentData *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      privateMediaIntentData = self->_privateMediaIntentData;
      BOOL v10 = 0;
      if (privateMediaIntentData == v5->_privateMediaIntentData
        || -[INPrivateMediaIntentData isEqual:](privateMediaIntentData, "isEqual:"))
      {
        audioSearchResults = self->_audioSearchResults;
        if (audioSearchResults == v5->_audioSearchResults
          || -[NSArray isEqual:](audioSearchResults, "isEqual:"))
        {
          internalSignals = self->_internalSignals;
          if (internalSignals == v5->_internalSignals || -[NSArray isEqual:](internalSignals, "isEqual:"))
          {
            pegasusMetaData = self->_pegasusMetaData;
            if (pegasusMetaData == v5->_pegasusMetaData
              || -[NSData isEqual:](pegasusMetaData, "isEqual:"))
            {
              BOOL v10 = 1;
            }
          }
        }
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INPrivateMediaIntentData *)self->_privateMediaIntentData hash];
  uint64_t v4 = [(NSArray *)self->_audioSearchResults hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_internalSignals hash];
  return v4 ^ v5 ^ [(NSData *)self->_pegasusMetaData hash];
}

- (INPrivateAddMediaIntentData)initWithPrivateMediaIntentData:(id)a3 audioSearchResults:(id)a4 internalSignals:(id)a5
{
  return [(INPrivateAddMediaIntentData *)self initWithPrivateMediaIntentData:a3 audioSearchResults:a4 internalSignals:a5 pegasusMetaData:0];
}

- (INPrivateAddMediaIntentData)initWithPrivateMediaIntentData:(id)a3 audioSearchResults:(id)a4
{
  return [(INPrivateAddMediaIntentData *)self initWithPrivateMediaIntentData:a3 audioSearchResults:a4 internalSignals:0 pegasusMetaData:0];
}

- (INPrivateAddMediaIntentData)initWithAudioSearchResults:(id)a3
{
  return [(INPrivateAddMediaIntentData *)self initWithPrivateMediaIntentData:0 audioSearchResults:a3 internalSignals:0 pegasusMetaData:0];
}

- (INPrivateAddMediaIntentData)initWithPrivateMediaIntentData:(id)a3 audioSearchResults:(id)a4 internalSignals:(id)a5 pegasusMetaData:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)INPrivateAddMediaIntentData;
  v14 = [(INPrivateAddMediaIntentData *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    privateMediaIntentData = v14->_privateMediaIntentData;
    v14->_privateMediaIntentData = (INPrivateMediaIntentData *)v15;

    uint64_t v17 = [v11 copy];
    audioSearchResults = v14->_audioSearchResults;
    v14->_audioSearchResults = (NSArray *)v17;

    uint64_t v19 = [v12 copy];
    internalSignals = v14->_internalSignals;
    v14->_internalSignals = (NSArray *)v19;

    uint64_t v21 = [v13 copy];
    pegasusMetaData = v14->_pegasusMetaData;
    v14->_pegasusMetaData = (NSData *)v21;
  }
  return v14;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    id v10 = [v8 objectForKeyedSubscript:@"privateMediaIntentData"];
    id v11 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v12 = objc_opt_class();
    id v13 = [v8 objectForKeyedSubscript:@"audioSearchResults"];
    v14 = [v7 decodeObjectsOfClass:v12 from:v13];

    uint64_t v15 = [v8 objectForKeyedSubscript:@"internalSignals"];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = [v8 objectForKeyedSubscript:@"pegasusMetaData"];
    uint64_t v18 = [v7 decodeObjectOfClass:v16 from:v17];

    uint64_t v19 = (void *)[objc_alloc((Class)a1) initWithPrivateMediaIntentData:v11 audioSearchResults:v14 internalSignals:v15 pegasusMetaData:v18];
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_intents_cacheableObjects
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(INPrivateAddMediaIntentData *)self audioSearchResults];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v8), "_intents_cacheableObjects");
        [v3 unionSet:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  if ([v3 count]) {
    id v10 = v3;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  return v11;
}

@end