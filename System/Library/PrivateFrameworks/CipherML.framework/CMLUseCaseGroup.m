@interface CMLUseCaseGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUseCaseGroup:(id)a3;
- (BOOL)keyRotationIgnoreMissingEvaluationKey;
- (CMLNetworkManager)networkConfig;
- (CMLUseCaseGroup)initWithCoder:(id)a3;
- (CMLUseCaseGroup)initWithKeyExpirationMinutes:(int64_t)a3 keyRotationBeforeExpirationMinutes:(int64_t)a4 keyRotationIgnoreMissingEvaluationKey:(BOOL)a5 useCases:(id)a6 networkConfig:(id)a7;
- (CMLUseCaseGroup)initWithKeyExpirationMinutes:(int64_t)a3 keyRotationBeforeExpirationMinutes:(int64_t)a4 useCases:(id)a5 networkConfig:(id)a6;
- (CMLUseCaseGroup)initWithUseCases:(id)a3 networkConfig:(id)a4;
- (NSDictionary)useCases;
- (int64_t)keyExpirationMinutes;
- (int64_t)keyRotationBeforeExpirationMinutes;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setKeyExpirationMinutes:(int64_t)a3;
- (void)setKeyRotationBeforeExpirationMinutes:(int64_t)a3;
- (void)setKeyRotationIgnoreMissingEvaluationKey:(BOOL)a3;
- (void)setNetworkConfig:(id)a3;
- (void)setUseCases:(id)a3;
@end

@implementation CMLUseCaseGroup

- (CMLUseCaseGroup)initWithKeyExpirationMinutes:(int64_t)a3 keyRotationBeforeExpirationMinutes:(int64_t)a4 keyRotationIgnoreMissingEvaluationKey:(BOOL)a5 useCases:(id)a6 networkConfig:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v19.receiver = self;
  v19.super_class = (Class)CMLUseCaseGroup;
  v14 = [(CMLUseCaseGroup *)&v19 init];
  v15 = v14;
  if (v14)
  {
    v14->_keyExpirationMinutes = a3;
    v14->_keyRotationBeforeExpirationMinutes = a4;
    v14->_keyRotationIgnoreMissingEvaluationKey = a5;
    uint64_t v16 = [v12 copy];
    useCases = v15->_useCases;
    v15->_useCases = (NSDictionary *)v16;

    objc_storeStrong((id *)&v15->_networkConfig, a7);
  }

  return v15;
}

- (CMLUseCaseGroup)initWithKeyExpirationMinutes:(int64_t)a3 keyRotationBeforeExpirationMinutes:(int64_t)a4 useCases:(id)a5 networkConfig:(id)a6
{
  return [(CMLUseCaseGroup *)self initWithKeyExpirationMinutes:a3 keyRotationBeforeExpirationMinutes:a4 keyRotationIgnoreMissingEvaluationKey:0 useCases:a5 networkConfig:a6];
}

- (CMLUseCaseGroup)initWithUseCases:(id)a3 networkConfig:(id)a4
{
  return [(CMLUseCaseGroup *)self initWithKeyExpirationMinutes:43200 keyRotationBeforeExpirationMinutes:2880 useCases:a3 networkConfig:a4];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CMLUseCaseGroup *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CMLUseCaseGroup *)self isEqualToUseCaseGroup:v5];

  return v6;
}

- (BOOL)isEqualToUseCaseGroup:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CMLUseCaseGroup *)self keyExpirationMinutes];
  if (v5 == [v4 keyExpirationMinutes]
    && (int64_t v6 = [(CMLUseCaseGroup *)self keyRotationBeforeExpirationMinutes],
        v6 == [v4 keyRotationBeforeExpirationMinutes])
    && (int v7 = [(CMLUseCaseGroup *)self keyRotationIgnoreMissingEvaluationKey],
        v7 == [v4 keyRotationIgnoreMissingEvaluationKey]))
  {
    v10 = [(CMLUseCaseGroup *)self useCases];
    v11 = [v4 useCases];
    if ([v10 isEqual:v11])
    {
      id v12 = [(CMLUseCaseGroup *)self networkConfig];
      id v13 = [v4 networkConfig];
      char v8 = [v12 isEqual:v13];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  int64_t v3 = [(CMLUseCaseGroup *)self keyExpirationMinutes];
  int64_t v4 = [(CMLUseCaseGroup *)self keyRotationBeforeExpirationMinutes] ^ v3;
  uint64_t v5 = [(CMLUseCaseGroup *)self keyRotationIgnoreMissingEvaluationKey];
  int64_t v6 = [(CMLUseCaseGroup *)self useCases];
  uint64_t v7 = v4 ^ [v6 hash] ^ v5;
  char v8 = [(CMLUseCaseGroup *)self networkConfig];
  unint64_t v9 = v7 ^ [v8 hash];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLUseCaseGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"keyExpirationMinutes"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"keyRotationBeforeExpirationMinutes"];
  uint64_t v7 = [v4 decodeBoolForKey:@"keyRotationIgnoreMissingEvaluationKey"];
  uint64_t v8 = objc_opt_class();
  unint64_t v9 = [v4 decodeDictionaryWithKeysOfClass:v8 objectsOfClass:objc_opt_class() forKey:@"useCases"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkConfig"];

  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    id v12 = 0;
  }
  else
  {
    self = [(CMLUseCaseGroup *)self initWithKeyExpirationMinutes:v5 keyRotationBeforeExpirationMinutes:v6 keyRotationIgnoreMissingEvaluationKey:v7 useCases:v9 networkConfig:v10];
    id v12 = self;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CMLUseCaseGroup keyExpirationMinutes](self, "keyExpirationMinutes"), @"keyExpirationMinutes");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CMLUseCaseGroup keyRotationBeforeExpirationMinutes](self, "keyRotationBeforeExpirationMinutes"), @"keyRotationBeforeExpirationMinutes");
  objc_msgSend(v4, "encodeBool:forKey:", -[CMLUseCaseGroup keyRotationIgnoreMissingEvaluationKey](self, "keyRotationIgnoreMissingEvaluationKey"), @"keyRotationIgnoreMissingEvaluationKey");
  uint64_t v5 = [(CMLUseCaseGroup *)self useCases];
  [v4 encodeObject:v5 forKey:@"useCases"];

  id v6 = [(CMLUseCaseGroup *)self networkConfig];
  [v4 encodeObject:v6 forKey:@"networkConfig"];
}

- (int64_t)keyExpirationMinutes
{
  return self->_keyExpirationMinutes;
}

- (void)setKeyExpirationMinutes:(int64_t)a3
{
  self->_keyExpirationMinutes = a3;
}

- (int64_t)keyRotationBeforeExpirationMinutes
{
  return self->_keyRotationBeforeExpirationMinutes;
}

- (void)setKeyRotationBeforeExpirationMinutes:(int64_t)a3
{
  self->_keyRotationBeforeExpirationMinutes = a3;
}

- (BOOL)keyRotationIgnoreMissingEvaluationKey
{
  return self->_keyRotationIgnoreMissingEvaluationKey;
}

- (void)setKeyRotationIgnoreMissingEvaluationKey:(BOOL)a3
{
  self->_keyRotationIgnoreMissingEvaluationKey = a3;
}

- (NSDictionary)useCases
{
  return self->_useCases;
}

- (void)setUseCases:(id)a3
{
}

- (CMLNetworkManager)networkConfig
{
  return self->_networkConfig;
}

- (void)setNetworkConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkConfig, 0);
  objc_storeStrong((id *)&self->_useCases, 0);
}

@end