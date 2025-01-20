@interface CTBandInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)addActiveBand:(id)a3 forRat:(id)a4;
- (BOOL)addActiveBands:(id)a3 forRat:(id)a4;
- (BOOL)addSupportedBand:(id)a3 forRat:(id)a4;
- (BOOL)addSupportedBands:(id)a3 forRat:(id)a4;
- (BOOL)isEqual:(id)a3;
- (CTBandInfo)init;
- (CTBandInfo)initWithActiveBands:(id)a3;
- (CTBandInfo)initWithCoder:(id)a3;
- (CTBandInfo)initWithSupported:(id)a3 andActiveBands:(id)a4;
- (CTBandInfo)initWithSupportedBands:(id)a3;
- (NSMutableDictionary)fActiveBands;
- (NSMutableDictionary)fSupportedBands;
- (id)activeBands;
- (id)activeBandsForRat:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)supportedBands;
- (id)supportedBandsForRat:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setFActiveBands:(id)a3;
- (void)setFSupportedBands:(id)a3;
@end

@implementation CTBandInfo

- (CTBandInfo)init
{
  return [(CTBandInfo *)self initWithSupported:0 andActiveBands:0];
}

- (CTBandInfo)initWithActiveBands:(id)a3
{
  return [(CTBandInfo *)self initWithSupported:0 andActiveBands:a3];
}

- (CTBandInfo)initWithSupportedBands:(id)a3
{
  return [(CTBandInfo *)self initWithSupported:a3 andActiveBands:0];
}

- (CTBandInfo)initWithSupported:(id)a3 andActiveBands:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && !isBandMapValid(v6) || v7 && !isBandMapValid(v7))
  {
    v13 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CTBandInfo;
    v8 = [(CTBandInfo *)&v15 init];
    if (v8)
    {
      if (v7)
      {
        uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v7];
        fActiveBands = v8->_fActiveBands;
        v8->_fActiveBands = (NSMutableDictionary *)v9;
      }
      if (v6)
      {
        uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
        fSupportedBands = v8->_fSupportedBands;
        v8->_fSupportedBands = (NSMutableDictionary *)v11;
      }
    }
    self = v8;
    v13 = self;
  }

  return v13;
}

- (BOOL)addActiveBand:(id)a3 forRat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL IsValidBand = sIsValidBand(v7, v6);
  if (IsValidBand)
  {
    uint64_t v9 = [(CTBandInfo *)self fActiveBands];

    if (v9)
    {
      v10 = [(CTBandInfo *)self fActiveBands];
      uint64_t v11 = [v10 objectForKey:v7];

      if (v11)
      {
        [v11 addObject:v6];
      }
      else
      {
        v14 = [(CTBandInfo *)self fActiveBands];
        objc_super v15 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
        [v14 setObject:v15 forKey:v7];
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E4F1CA60];
      uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
      v13 = [v12 dictionaryWithObject:v11 forKey:v7];
      [(CTBandInfo *)self setFActiveBands:v13];
    }
  }

  return IsValidBand;
}

- (BOOL)addActiveBands:(id)a3 forRat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = sAreBandsValid(v7, v6);
  if (v8)
  {
    uint64_t v9 = [(CTBandInfo *)self fActiveBands];

    if (v9)
    {
      v10 = [(CTBandInfo *)self fActiveBands];
      uint64_t v11 = [v10 objectForKey:v7];

      if (v11)
      {
        [v11 addObjectsFromArray:v6];
      }
      else
      {
        v14 = [(CTBandInfo *)self fActiveBands];
        objc_super v15 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
        [v14 setObject:v15 forKey:v7];
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E4F1CA60];
      uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
      v13 = [v12 dictionaryWithObject:v11 forKey:v7];
      [(CTBandInfo *)self setFActiveBands:v13];
    }
  }

  return v8;
}

- (BOOL)addSupportedBand:(id)a3 forRat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL IsValidBand = sIsValidBand(v7, v6);
  if (IsValidBand)
  {
    uint64_t v9 = [(CTBandInfo *)self fSupportedBands];

    if (v9)
    {
      v10 = [(CTBandInfo *)self fSupportedBands];
      uint64_t v11 = [v10 objectForKey:v7];

      if (v11)
      {
        [v11 addObject:v6];
      }
      else
      {
        v14 = [(CTBandInfo *)self fSupportedBands];
        objc_super v15 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
        [v14 setObject:v15 forKey:v7];
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E4F1CA60];
      uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
      v13 = [v12 dictionaryWithObject:v11 forKey:v7];
      [(CTBandInfo *)self setFSupportedBands:v13];
    }
  }

  return IsValidBand;
}

- (BOOL)addSupportedBands:(id)a3 forRat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = sAreBandsValid(v7, v6);
  if (v8)
  {
    uint64_t v9 = [(CTBandInfo *)self fSupportedBands];

    if (v9)
    {
      v10 = [(CTBandInfo *)self fSupportedBands];
      uint64_t v11 = [v10 objectForKey:v7];

      if (v11)
      {
        [v11 addObjectsFromArray:v6];
      }
      else
      {
        v14 = [(CTBandInfo *)self fSupportedBands];
        objc_super v15 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
        [v14 setObject:v15 forKey:v7];
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E4F1CA60];
      uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
      v13 = [v12 dictionaryWithObject:v11 forKey:v7];
      [(CTBandInfo *)self setFSupportedBands:v13];
    }
  }

  return v8;
}

- (id)activeBands
{
  v2 = [(CTBandInfo *)self fActiveBands];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)activeBandsForRat:(id)a3
{
  id v4 = a3;
  v5 = [(CTBandInfo *)self fActiveBands];
  id v6 = [v5 objectForKey:v4];

  id v7 = (void *)[v6 copy];

  return v7;
}

- (id)supportedBands
{
  v2 = [(CTBandInfo *)self fSupportedBands];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)supportedBandsForRat:(id)a3
{
  id v4 = a3;
  v5 = [(CTBandInfo *)self fSupportedBands];
  id v6 = [v5 objectForKey:v4];

  id v7 = (void *)[v6 copy];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [(CTBandInfo *)self fActiveBands];
  id v6 = [v4 fActiveBands];
  if ([v5 isEqualToDictionary:v6])
  {
    id v7 = [(CTBandInfo *)self fSupportedBands];
    int v8 = [v4 fSupportedBands];
    char v9 = [v7 isEqualToDictionary:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p>\n{\n", objc_opt_class(), self];
  id v4 = [(CTBandInfo *)self fActiveBands];
  [v3 appendFormat:@"ActiveBands\n%@\n", v4];

  v5 = [(CTBandInfo *)self fSupportedBands];
  [v3 appendFormat:@"SupportedBands\n%@\n", v5];

  [v3 appendString:@"}"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(CTBandInfo *)self fSupportedBands];
  id v6 = [(CTBandInfo *)self fActiveBands];
  id v7 = (void *)[v4 initWithSupported:v5 andActiveBands:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTBandInfo *)self fActiveBands];
  [v4 encodeObject:v5 forKey:@"activeBand"];

  id v6 = [(CTBandInfo *)self fSupportedBands];
  [v4 encodeObject:v6 forKey:@"supportedBand"];
}

- (CTBandInfo)initWithCoder:(id)a3
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTBandInfo;
  v5 = [(CTBandInfo *)&v17 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
    int v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"activeBand"];
    fActiveBands = v5->_fActiveBands;
    v5->_fActiveBands = (NSMutableDictionary *)v9;

    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v18[3] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"supportedBand"];
    fSupportedBands = v5->_fSupportedBands;
    v5->_fSupportedBands = (NSMutableDictionary *)v14;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSMutableDictionary)fActiveBands
{
  return self->_fActiveBands;
}

- (void)setFActiveBands:(id)a3
{
}

- (NSMutableDictionary)fSupportedBands
{
  return self->_fSupportedBands;
}

- (void)setFSupportedBands:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fSupportedBands, 0);

  objc_storeStrong((id *)&self->_fActiveBands, 0);
}

@end