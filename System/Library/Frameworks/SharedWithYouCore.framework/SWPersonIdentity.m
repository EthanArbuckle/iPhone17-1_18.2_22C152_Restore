@interface SWPersonIdentity
+ (BOOL)supportsSecureCoding;
+ (SWPersonIdentity)allocWithZone:(_NSZone *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPersonIdentity:(id)a3;
- (NSArray)publicKeys;
- (NSData)rootHash;
- (NSData)trackingPreventionSalt;
- (SWPersonIdentity)initWithCoder:(id)a3;
- (SWPersonIdentity)initWithRootHash:(NSData *)rootHash;
- (SWPersonIdentity)initWithRootHash:(id)a3 publicKeys:(id)a4 trackingPreventionSalt:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SWPersonIdentity

+ (SWPersonIdentity)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (SWPersonIdentity *)+[SWPersonIdentity allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SWPersonIdentity;
    return (SWPersonIdentity *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (SWPersonIdentity)initWithRootHash:(id)a3 publicKeys:(id)a4 trackingPreventionSalt:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 length] == 32)
  {
    v17.receiver = self;
    v17.super_class = (Class)SWPersonIdentity;
    v12 = [(SWPersonIdentity *)&v17 init];
    p_isa = (id *)&v12->super.isa;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_rootHash, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
    }
    self = p_isa;
    v14 = self;
  }
  else
  {
    v15 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C0DE000, v15, OS_LOG_TYPE_DEFAULT, "SWPersonIdentity's rootHash must be a SHA-256 digest. Return nil from [SWPersonIdentity initWithRootHash:publicKeys:]", buf, 2u);
    }

    v14 = 0;
  }

  return v14;
}

- (SWPersonIdentity)initWithRootHash:(NSData *)rootHash
{
  return [(SWPersonIdentity *)self initWithRootHash:rootHash publicKeys:MEMORY[0x1E4F1CBF0] trackingPreventionSalt:0];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(SWPersonIdentity *)self rootHash];
  [v3 appendFormat:@" rootHash=%@", v4];

  v5 = [(SWPersonIdentity *)self publicKeys];
  objc_msgSend(v3, "appendFormat:", @" publicKeys=%lu", objc_msgSend(v5, "count"));

  objc_super v6 = [(SWPersonIdentity *)self trackingPreventionSalt];
  [v3 appendFormat:@" trackingPreventionSalt=%@", v6];

  [v3 appendString:@">"];
  v7 = (void *)[v3 copy];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(SWPersonIdentity *)self isEqualToPersonIdentity:v4];

  return v5;
}

- (BOOL)isEqualToPersonIdentity:(id)a3
{
  id v9 = a3;
  id v10 = [(SWPersonIdentity *)self rootHash];
  if (v10 || ([v9 rootHash], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v5 = [(SWPersonIdentity *)self rootHash];
    id v4 = [v9 rootHash];
    if (([v5 isEqual:v4] & 1) == 0)
    {

      char v12 = 0;
      goto LABEL_26;
    }
    int v11 = 1;
  }
  else
  {
    int v11 = 0;
  }
  v13 = [(SWPersonIdentity *)self publicKeys];
  if (v13 || ([v9 publicKeys], (v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_super v6 = [(SWPersonIdentity *)self publicKeys];
    v7 = [v9 publicKeys];
    if (([v6 isEqual:v7] & 1) == 0)
    {

      if (v13) {
      else
      }

      char v12 = 0;
      if ((v11 & 1) == 0) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
    int v24 = 1;
    int v25 = v11;
  }
  else
  {
    int v24 = 0;
    int v25 = v11;
    v21 = 0;
  }
  v14 = [(SWPersonIdentity *)self trackingPreventionSalt];
  if (v14 || ([v9 trackingPreventionSalt], (uint64_t v20 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v22 = v5;
    v23 = v3;
    v15 = [(SWPersonIdentity *)self trackingPreventionSalt];
    v16 = [v9 trackingPreventionSalt];
    char v12 = [v15 isEqual:v16];

    if (v14)
    {

      BOOL v5 = v22;
      v3 = v23;
      int v17 = v25;
      if (!v24) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
    BOOL v5 = v22;
    v3 = v23;
    int v17 = v25;
    v19 = (void *)v20;
  }
  else
  {
    v19 = 0;
    char v12 = 1;
    int v17 = v25;
  }

  if (v24)
  {
LABEL_21:
  }
LABEL_22:
  if (!v13) {

  }
  if (v17)
  {
LABEL_25:
  }
LABEL_26:
  if (!v10) {

  }
  return v12;
}

- (unint64_t)hash
{
  v3 = [(SWPersonIdentity *)self rootHash];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(SWPersonIdentity *)self publicKeys];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(SWPersonIdentity *)self trackingPreventionSalt];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SWPersonIdentity *)self rootHash];
  uint64_t v6 = NSStringFromSelector(sel_rootHash);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(SWPersonIdentity *)self publicKeys];
  unint64_t v8 = NSStringFromSelector(sel_publicKeys);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(SWPersonIdentity *)self trackingPreventionSalt];
  id v9 = NSStringFromSelector(sel_trackingPreventionSalt);
  [v4 encodeObject:v10 forKey:v9];
}

- (SWPersonIdentity)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SWPersonIdentity;
  BOOL v5 = [(SWPersonIdentity *)&v21 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_rootHash);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    rootHash = v5->_rootHash;
    v5->_rootHash = (NSData *)v8;

    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    char v12 = [v10 setWithArray:v11];
    v13 = NSStringFromSelector(sel_publicKeys);
    uint64_t v14 = [v4 decodeObjectOfClasses:v12 forKey:v13];
    publicKeys = v5->_publicKeys;
    v5->_publicKeys = (NSArray *)v14;

    uint64_t v16 = objc_opt_class();
    int v17 = NSStringFromSelector(sel_trackingPreventionSalt);
    uint64_t v18 = [v4 decodeObjectOfClass:v16 forKey:v17];
    trackingPreventionSalt = v5->_trackingPreventionSalt;
    v5->_trackingPreventionSalt = (NSData *)v18;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  BOOL v5 = [(SWPersonIdentity *)self rootHash];
  uint64_t v6 = [(SWPersonIdentity *)self publicKeys];
  v7 = [(SWPersonIdentity *)self trackingPreventionSalt];
  uint64_t v8 = (void *)[v4 initWithRootHash:v5 publicKeys:v6 trackingPreventionSalt:v7];

  return v8;
}

- (NSData)rootHash
{
  return self->_rootHash;
}

- (NSArray)publicKeys
{
  return self->_publicKeys;
}

- (NSData)trackingPreventionSalt
{
  return self->_trackingPreventionSalt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingPreventionSalt, 0);
  objc_storeStrong((id *)&self->_publicKeys, 0);

  objc_storeStrong((id *)&self->_rootHash, 0);
}

@end