@interface INPrivateSearchForMediaIntentData
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INPrivateMediaIntentData)privateMediaIntentData;
- (INPrivateSearchForMediaIntentData)initWithAudioSearchResults:(id)a3;
- (INPrivateSearchForMediaIntentData)initWithCoder:(id)a3;
- (INPrivateSearchForMediaIntentData)initWithPrivateMediaIntentData:(id)a3 audioSearchResults:(id)a4;
- (INPrivateSearchForMediaIntentData)initWithPrivateMediaIntentData:(id)a3 audioSearchResults:(id)a4 internalSignals:(id)a5;
- (INPrivateSearchForMediaIntentData)initWithPrivateMediaIntentData:(id)a3 audioSearchResults:(id)a4 internalSignals:(id)a5 appInferred:(id)a6;
- (INPrivateSearchForMediaIntentData)initWithPrivateMediaIntentData:(id)a3 audioSearchResults:(id)a4 internalSignals:(id)a5 appInferred:(id)a6 pegasusMetaData:(id)a7;
- (NSArray)audioSearchResults;
- (NSArray)internalSignals;
- (NSData)pegasusMetaData;
- (NSNumber)appInferred;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INPrivateSearchForMediaIntentData

- (void)_intents_updateContainerWithCache:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(INPrivateSearchForMediaIntentData *)self audioSearchResults];
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

- (id)_intents_cacheableObjects
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(INPrivateSearchForMediaIntentData *)self audioSearchResults];
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
    long long v10 = v3;
  }
  else {
    long long v10 = 0;
  }
  id v11 = v10;

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pegasusMetaData, 0);
  objc_storeStrong((id *)&self->_appInferred, 0);
  objc_storeStrong((id *)&self->_internalSignals, 0);
  objc_storeStrong((id *)&self->_audioSearchResults, 0);

  objc_storeStrong((id *)&self->_privateMediaIntentData, 0);
}

- (NSData)pegasusMetaData
{
  return self->_pegasusMetaData;
}

- (NSNumber)appInferred
{
  return self->_appInferred;
}

- (NSArray)internalSignals
{
  return self->_internalSignals;
}

- (NSArray)audioSearchResults
{
  return self->_audioSearchResults;
}

- (INPrivateMediaIntentData)privateMediaIntentData
{
  return self->_privateMediaIntentData;
}

- (id)_dictionaryRepresentation
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v17 = @"privateMediaIntentData";
  privateMediaIntentData = self->_privateMediaIntentData;
  uint64_t v4 = (uint64_t)privateMediaIntentData;
  if (!privateMediaIntentData)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v15 = v4;
  v22[0] = v4;
  uint64_t v18 = @"audioSearchResults";
  audioSearchResults = self->_audioSearchResults;
  uint64_t v6 = audioSearchResults;
  if (!audioSearchResults)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v4, v17, v18);
  }
  v22[1] = v6;
  v19 = @"internalSignals";
  internalSignals = self->_internalSignals;
  uint64_t v8 = internalSignals;
  if (!internalSignals)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v8;
  v20 = @"appInferred";
  appInferred = self->_appInferred;
  long long v10 = appInferred;
  if (!appInferred)
  {
    long long v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v10;
  v21 = @"pegasusMetaData";
  pegasusMetaData = self->_pegasusMetaData;
  long long v12 = pegasusMetaData;
  if (!pegasusMetaData)
  {
    long long v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v12;
  long long v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  if (pegasusMetaData)
  {
    if (appInferred) {
      goto LABEL_13;
    }
  }
  else
  {

    if (appInferred)
    {
LABEL_13:
      if (internalSignals) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }

  if (internalSignals)
  {
LABEL_14:
    if (audioSearchResults) {
      goto LABEL_15;
    }
LABEL_22:

    if (privateMediaIntentData) {
      goto LABEL_16;
    }
    goto LABEL_23;
  }
LABEL_21:

  if (!audioSearchResults) {
    goto LABEL_22;
  }
LABEL_15:
  if (privateMediaIntentData) {
    goto LABEL_16;
  }
LABEL_23:

LABEL_16:

  return v13;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  uint64_t v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INPrivateSearchForMediaIntentData;
  uint64_t v6 = [(INPrivateSearchForMediaIntentData *)&v11 description];
  uint64_t v7 = [(INPrivateSearchForMediaIntentData *)self _dictionaryRepresentation];
  uint64_t v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INPrivateSearchForMediaIntentData *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  uint64_t v7 = [v5 dictionary];
  uint64_t v8 = [v6 encodeObject:self->_privateMediaIntentData];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"privateMediaIntentData");

  uint64_t v9 = [v6 encodeObject:self->_audioSearchResults];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"audioSearchResults");

  long long v10 = [v6 encodeObject:self->_internalSignals];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"internalSignals");

  objc_super v11 = [v6 encodeObject:self->_appInferred];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"appInferred");

  long long v12 = [v6 encodeObject:self->_pegasusMetaData];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"pegasusMetaData");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  privateMediaIntentData = self->_privateMediaIntentData;
  id v5 = a3;
  [v5 encodeObject:privateMediaIntentData forKey:@"privateMediaIntentData"];
  [v5 encodeObject:self->_audioSearchResults forKey:@"audioSearchResults"];
  [v5 encodeObject:self->_internalSignals forKey:@"internalSignals"];
  [v5 encodeObject:self->_appInferred forKey:@"appInferred"];
  [v5 encodeObject:self->_pegasusMetaData forKey:@"pegasusMetaData"];
}

- (INPrivateSearchForMediaIntentData)initWithCoder:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateMediaIntentData"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  uint64_t v8 = [v6 setWithArray:v7];
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"audioSearchResults"];

  long long v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:3];
  long long v12 = objc_msgSend(v10, "setWithArray:", v11, v18, v19);
  long long v13 = [v4 decodeObjectOfClasses:v12 forKey:@"internalSignals"];

  long long v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appInferred"];
  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pegasusMetaData"];

  long long v16 = [(INPrivateSearchForMediaIntentData *)self initWithPrivateMediaIntentData:v5 audioSearchResults:v9 internalSignals:v13 appInferred:v14 pegasusMetaData:v15];
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INPrivateSearchForMediaIntentData *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      privateMediaIntentData = self->_privateMediaIntentData;
      BOOL v11 = 0;
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
            appInferred = self->_appInferred;
            if (appInferred == v5->_appInferred || -[NSNumber isEqual:](appInferred, "isEqual:"))
            {
              pegasusMetaData = self->_pegasusMetaData;
              if (pegasusMetaData == v5->_pegasusMetaData
                || -[NSData isEqual:](pegasusMetaData, "isEqual:"))
              {
                BOOL v11 = 1;
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INPrivateMediaIntentData *)self->_privateMediaIntentData hash];
  uint64_t v4 = [(NSArray *)self->_audioSearchResults hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_internalSignals hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSNumber *)self->_appInferred hash];
  return v6 ^ [(NSData *)self->_pegasusMetaData hash];
}

- (INPrivateSearchForMediaIntentData)initWithPrivateMediaIntentData:(id)a3 audioSearchResults:(id)a4 internalSignals:(id)a5 appInferred:(id)a6
{
  return [(INPrivateSearchForMediaIntentData *)self initWithPrivateMediaIntentData:a3 audioSearchResults:a4 internalSignals:a5 appInferred:a6 pegasusMetaData:0];
}

- (INPrivateSearchForMediaIntentData)initWithPrivateMediaIntentData:(id)a3 audioSearchResults:(id)a4 internalSignals:(id)a5
{
  return [(INPrivateSearchForMediaIntentData *)self initWithPrivateMediaIntentData:a3 audioSearchResults:a4 internalSignals:a5 appInferred:0 pegasusMetaData:0];
}

- (INPrivateSearchForMediaIntentData)initWithPrivateMediaIntentData:(id)a3 audioSearchResults:(id)a4
{
  return [(INPrivateSearchForMediaIntentData *)self initWithPrivateMediaIntentData:a3 audioSearchResults:a4 internalSignals:0 appInferred:0 pegasusMetaData:0];
}

- (INPrivateSearchForMediaIntentData)initWithAudioSearchResults:(id)a3
{
  return [(INPrivateSearchForMediaIntentData *)self initWithPrivateMediaIntentData:0 audioSearchResults:a3 internalSignals:0 appInferred:0 pegasusMetaData:0];
}

- (INPrivateSearchForMediaIntentData)initWithPrivateMediaIntentData:(id)a3 audioSearchResults:(id)a4 internalSignals:(id)a5 appInferred:(id)a6 pegasusMetaData:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)INPrivateSearchForMediaIntentData;
  v17 = [(INPrivateSearchForMediaIntentData *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    privateMediaIntentData = v17->_privateMediaIntentData;
    v17->_privateMediaIntentData = (INPrivateMediaIntentData *)v18;

    uint64_t v20 = [v13 copy];
    audioSearchResults = v17->_audioSearchResults;
    v17->_audioSearchResults = (NSArray *)v20;

    uint64_t v22 = [v14 copy];
    internalSignals = v17->_internalSignals;
    v17->_internalSignals = (NSArray *)v22;

    uint64_t v24 = [v15 copy];
    appInferred = v17->_appInferred;
    v17->_appInferred = (NSNumber *)v24;

    uint64_t v26 = [v16 copy];
    pegasusMetaData = v17->_pegasusMetaData;
    v17->_pegasusMetaData = (NSData *)v26;
  }
  return v17;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    long long v10 = [v8 objectForKeyedSubscript:@"privateMediaIntentData"];
    BOOL v11 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v12 = objc_opt_class();
    id v13 = [v8 objectForKeyedSubscript:@"audioSearchResults"];
    id v14 = [v7 decodeObjectsOfClass:v12 from:v13];

    id v15 = [v8 objectForKeyedSubscript:@"internalSignals"];
    id v16 = [v8 objectForKeyedSubscript:@"appInferred"];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = [v8 objectForKeyedSubscript:@"pegasusMetaData"];
    uint64_t v19 = [v7 decodeObjectOfClass:v17 from:v18];

    uint64_t v20 = (void *)[objc_alloc((Class)a1) initWithPrivateMediaIntentData:v11 audioSearchResults:v14 internalSignals:v15 appInferred:v16 pegasusMetaData:v19];
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end