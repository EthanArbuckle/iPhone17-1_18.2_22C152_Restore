@interface INPrivateUpdateMediaAffinityIntentData
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INPrivateMediaIntentData)privateMediaIntentData;
- (INPrivateUpdateMediaAffinityIntentData)initWithCoder:(id)a3;
- (INPrivateUpdateMediaAffinityIntentData)initWithPrivateMediaIntentData:(id)a3;
- (INPrivateUpdateMediaAffinityIntentData)initWithPrivateMediaIntentData:(id)a3 internalSignals:(id)a4;
- (INPrivateUpdateMediaAffinityIntentData)initWithPrivateMediaIntentData:(id)a3 internalSignals:(id)a4 pegasusMetaData:(id)a5;
- (NSArray)internalSignals;
- (NSData)pegasusMetaData;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPrivateMediaIntentData:(id)a3;
@end

@implementation INPrivateUpdateMediaAffinityIntentData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pegasusMetaData, 0);
  objc_storeStrong((id *)&self->_internalSignals, 0);

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

- (void)setPrivateMediaIntentData:(id)a3
{
}

- (INPrivateMediaIntentData)privateMediaIntentData
{
  return self->_privateMediaIntentData;
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"privateMediaIntentData";
  privateMediaIntentData = self->_privateMediaIntentData;
  v4 = privateMediaIntentData;
  if (!privateMediaIntentData)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"internalSignals";
  internalSignals = self->_internalSignals;
  v6 = internalSignals;
  if (!internalSignals)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"pegasusMetaData";
  pegasusMetaData = self->_pegasusMetaData;
  v8 = pegasusMetaData;
  if (!pegasusMetaData)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (pegasusMetaData)
  {
    if (internalSignals) {
      goto LABEL_9;
    }
LABEL_14:

    if (privateMediaIntentData) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!internalSignals) {
    goto LABEL_14;
  }
LABEL_9:
  if (privateMediaIntentData) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v9;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INPrivateUpdateMediaAffinityIntentData;
  v6 = [(INPrivateUpdateMediaAffinityIntentData *)&v11 description];
  v7 = [(INPrivateUpdateMediaAffinityIntentData *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INPrivateUpdateMediaAffinityIntentData *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_privateMediaIntentData];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"privateMediaIntentData");

  v9 = [v6 encodeObject:self->_internalSignals];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"internalSignals");

  v10 = [v6 encodeObject:self->_pegasusMetaData];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"pegasusMetaData");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  privateMediaIntentData = self->_privateMediaIntentData;
  id v5 = a3;
  [v5 encodeObject:privateMediaIntentData forKey:@"privateMediaIntentData"];
  [v5 encodeObject:self->_internalSignals forKey:@"internalSignals"];
  [v5 encodeObject:self->_pegasusMetaData forKey:@"pegasusMetaData"];
}

- (INPrivateUpdateMediaAffinityIntentData)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateMediaIntentData"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:3];
  v8 = objc_msgSend(v6, "setWithArray:", v7, v13, v14);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"internalSignals"];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pegasusMetaData"];

  objc_super v11 = [(INPrivateUpdateMediaAffinityIntentData *)self initWithPrivateMediaIntentData:v5 internalSignals:v9 pegasusMetaData:v10];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INPrivateUpdateMediaAffinityIntentData *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      privateMediaIntentData = self->_privateMediaIntentData;
      BOOL v9 = 0;
      if (privateMediaIntentData == v5->_privateMediaIntentData
        || -[INPrivateMediaIntentData isEqual:](privateMediaIntentData, "isEqual:"))
      {
        internalSignals = self->_internalSignals;
        if (internalSignals == v5->_internalSignals || -[NSArray isEqual:](internalSignals, "isEqual:"))
        {
          pegasusMetaData = self->_pegasusMetaData;
          if (pegasusMetaData == v5->_pegasusMetaData || -[NSData isEqual:](pegasusMetaData, "isEqual:")) {
            BOOL v9 = 1;
          }
        }
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INPrivateMediaIntentData *)self->_privateMediaIntentData hash];
  uint64_t v4 = [(NSArray *)self->_internalSignals hash] ^ v3;
  return v4 ^ [(NSData *)self->_pegasusMetaData hash];
}

- (INPrivateUpdateMediaAffinityIntentData)initWithPrivateMediaIntentData:(id)a3 internalSignals:(id)a4
{
  return [(INPrivateUpdateMediaAffinityIntentData *)self initWithPrivateMediaIntentData:a3 internalSignals:a4 pegasusMetaData:0];
}

- (INPrivateUpdateMediaAffinityIntentData)initWithPrivateMediaIntentData:(id)a3
{
  return [(INPrivateUpdateMediaAffinityIntentData *)self initWithPrivateMediaIntentData:a3 internalSignals:0 pegasusMetaData:0];
}

- (INPrivateUpdateMediaAffinityIntentData)initWithPrivateMediaIntentData:(id)a3 internalSignals:(id)a4 pegasusMetaData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)INPrivateUpdateMediaAffinityIntentData;
  objc_super v11 = [(INPrivateUpdateMediaAffinityIntentData *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    privateMediaIntentData = v11->_privateMediaIntentData;
    v11->_privateMediaIntentData = (INPrivateMediaIntentData *)v12;

    uint64_t v14 = [v9 copy];
    internalSignals = v11->_internalSignals;
    v11->_internalSignals = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    pegasusMetaData = v11->_pegasusMetaData;
    v11->_pegasusMetaData = (NSData *)v16;
  }
  return v11;
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
    objc_super v11 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v12 = [v8 objectForKeyedSubscript:@"internalSignals"];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = [v8 objectForKeyedSubscript:@"pegasusMetaData"];
    uint64_t v15 = [v7 decodeObjectOfClass:v13 from:v14];

    uint64_t v16 = (void *)[objc_alloc((Class)a1) initWithPrivateMediaIntentData:v11 internalSignals:v12 pegasusMetaData:v15];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end