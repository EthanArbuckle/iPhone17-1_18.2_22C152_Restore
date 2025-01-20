@interface CLSClue
+ (id)_clueWithValue:(id)a3 forKey:(id)a4;
+ (id)_clueWithValue:(id)a3 forKey:(id)a4 confidence:(double)a5 relevance:(double)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)transient;
- (CLSClue)init;
- (CLSInformant)informant;
- (CLSProfile)profile;
- (NSDictionary)extraParameters;
- (NSString)informantIdentifier;
- (NSString)key;
- (NSString)profileIdentifier;
- (double)confidence;
- (double)doubleValue;
- (double)relevance;
- (double)score;
- (id)description;
- (id)stringValue;
- (id)value;
- (int64_t)compare:(id)a3;
- (int64_t)compareScore:(id)a3;
- (int64_t)integerValue;
- (unint64_t)enumValue;
- (unint64_t)hash;
- (unint64_t)valueHash;
- (unint64_t)versionCount;
- (void)_incrementVersionCount;
- (void)setConfidence:(double)a3;
- (void)setExtraParameters:(id)a3;
- (void)setInformant:(id)a3;
- (void)setInformantIdentifier:(id)a3;
- (void)setKey:(id)a3;
- (void)setProfile:(id)a3;
- (void)setProfileIdentifier:(id)a3;
- (void)setRelevance:(double)a3;
- (void)setTransient:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)setVersionCount:(unint64_t)a3;
@end

@implementation CLSClue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_informantIdentifier, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_informant, 0);
  objc_storeStrong((id *)&self->_extraParameters, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setVersionCount:(unint64_t)a3
{
  self->_versionCount = a3;
}

- (unint64_t)versionCount
{
  return self->_versionCount;
}

- (void)setTransient:(BOOL)a3
{
  self->_transient = a3;
}

- (BOOL)transient
{
  return self->_transient;
}

- (void)setProfile:(id)a3
{
}

- (CLSProfile)profile
{
  return (CLSProfile *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInformant:(id)a3
{
}

- (CLSInformant)informant
{
  return (CLSInformant *)objc_getProperty(self, a2, 56, 1);
}

- (void)setExtraParameters:(id)a3
{
}

- (NSDictionary)extraParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRelevance:(double)a3
{
  self->_relevance = a3;
}

- (double)relevance
{
  return self->_relevance;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setValue:(id)a3
{
}

- (id)value
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)compareScore:(id)a3
{
  id v4 = a3;
  [(CLSClue *)self score];
  double v6 = v5;
  [v4 score];
  double v8 = v7;

  if (v6 > v8) {
    return -1;
  }
  else {
    return v6 < v8;
  }
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  key = self->_key;
  if (!key || !self->_value) {
    __assert_rtn("-[CLSClue compare:]", "CLSClue.m", 246, "(_key != nil) && (_value != nil)");
  }
  int64_t v6 = [(NSString *)key compare:v4[2]];
  if (!v6)
  {
    int64_t v6 = [self->_value compare:v4[3]];
    if (!v6) {
      int64_t v6 = [(CLSClue *)self compareScore:v4];
    }
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    double v8 = [(CLSClue *)self value];
    v9 = [v7 value];
    if ([v8 isEqual:v9])
    {
      v10 = [(CLSClue *)self key];
      v11 = [v7 key];
      char v6 = [v10 isEqual:v11];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v3 = [(CLSClue *)self value];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(CLSClue *)self key];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (void)setProfileIdentifier:(id)a3
{
}

- (NSString)profileIdentifier
{
  profileIdentifier = (CLSProfile *)self->_profileIdentifier;
  if (!profileIdentifier)
  {
    profileIdentifier = self->_profile;
    if (profileIdentifier)
    {
      uint64_t v4 = [(id)objc_opt_class() identifier];
      uint64_t v5 = self->_profileIdentifier;
      self->_profileIdentifier = v4;

      profileIdentifier = (CLSProfile *)self->_profileIdentifier;
    }
  }
  return (NSString *)profileIdentifier;
}

- (void)setInformantIdentifier:(id)a3
{
}

- (NSString)informantIdentifier
{
  informantIdentifier = (CLSInformant *)self->_informantIdentifier;
  if (!informantIdentifier)
  {
    informantIdentifier = self->_informant;
    if (informantIdentifier)
    {
      uint64_t v4 = [(id)objc_opt_class() identifier];
      uint64_t v5 = self->_informantIdentifier;
      self->_informantIdentifier = v4;

      informantIdentifier = (CLSInformant *)self->_informantIdentifier;
    }
  }
  return (NSString *)informantIdentifier;
}

- (double)score
{
  return self->_confidence * self->_relevance;
}

- (void)_incrementVersionCount
{
  obj = self;
  objc_sync_enter(obj);
  ++obj->_versionCount;
  objc_sync_exit(obj);
}

- (double)doubleValue
{
  v2 = [(CLSClue *)self value];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (int64_t)integerValue
{
  v2 = [(CLSClue *)self value];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (id)stringValue
{
  int64_t v3 = [(CLSClue *)self value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v5 = [(CLSClue *)self value];
  unint64_t v6 = v5;
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v7 = [v5 stringValue];

    unint64_t v6 = (void *)v7;
  }

  return v6;
}

- (unint64_t)enumValue
{
  v2 = [(CLSClue *)self value];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (unint64_t)valueHash
{
  v2 = [(CLSClue *)self value];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  double v4 = [(CLSClue *)self value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v6 = [(CLSClue *)self value];
  uint64_t v7 = v6;
  if (isKindOfClass) {
    [v6 flattenWithSeparator:@", "];
  }
  else {
  double v8 = [v6 description];
  }

  v9 = (void *)MEMORY[0x1E4F28E78];
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = [(CLSClue *)self key];
  v13 = [v9 stringWithFormat:@"<%@> key:[%@] value:[%@]", v11, v12, v8];

  [(CLSClue *)self confidence];
  uint64_t v15 = v14;
  [(CLSClue *)self relevance];
  uint64_t v17 = v16;
  [(CLSClue *)self score];
  uint64_t v19 = v18;
  v20 = [(CLSClue *)self informant];
  if (v20)
  {
    v21 = [(CLSClue *)self informant];
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
  }
  else
  {
    v23 = [(CLSClue *)self informantIdentifier];
    v21 = v23;
  }
  v24 = [(CLSClue *)self profile];
  if (v24)
  {
    uint64_t v2 = [(CLSClue *)self profile];
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
  }
  else
  {
    [(CLSClue *)self profileIdentifier];
  v26 = };
  [v13 appendFormat:@"\n\tconfidence:[%.2f] relevance:[%.2f] score:[%.2f] informant:[%@] profile:[%@] version:[%ld]", v15, v17, v19, v23, v26, -[CLSClue versionCount](self, "versionCount")];
  if (v24)
  {

    v26 = (void *)v2;
  }

  if (v20) {
  return v13;
  }
}

- (CLSClue)init
{
  v16.receiver = self;
  v16.super_class = (Class)CLSClue;
  uint64_t v2 = [(CLSClue *)&v16 init];
  unint64_t v3 = v2;
  if (v2)
  {
    key = v2->_key;
    v2->_key = 0;

    id value = v3->_value;
    v3->_id value = 0;

    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v3->_confidence = _Q0;
    informant = v3->_informant;
    v3->_informant = 0;

    profile = v3->_profile;
    v3->_profile = 0;

    informantIdentifier = v3->_informantIdentifier;
    v3->_informantIdentifier = 0;

    profileIdentifier = v3->_profileIdentifier;
    v3->_profileIdentifier = 0;

    v3->_transient = 0;
    v3->_versionCount = 1;
  }
  return v3;
}

+ (id)_clueWithValue:(id)a3 forKey:(id)a4 confidence:(double)a5 relevance:(double)a6
{
  double v8 = [a1 _clueWithValue:a3 forKey:a4];
  [v8 setConfidence:a5];
  [v8 setRelevance:a6];
  return v8;
}

+ (id)_clueWithValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 setKey:v6];

  [v8 setValue:v7];
  return v8;
}

@end