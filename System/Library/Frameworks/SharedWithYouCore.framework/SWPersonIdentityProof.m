@interface SWPersonIdentityProof
+ (BOOL)supportsSecureCoding;
+ (SWPersonIdentityProof)allocWithZone:(_NSZone *)a3;
- (NSArray)inclusionHashes;
- (NSData)publicKey;
- (SWPersonIdentityProof)initWithCoder:(id)a3;
- (SWPersonIdentityProof)initWithInclusionHashes:(id)a3;
- (SWPersonIdentityProof)initWithInclusionHashes:(id)a3 publicKey:(id)a4 localKeyIndex:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)localKeyIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setLocalKeyIndex:(unint64_t)a3;
- (void)setPublicKey:(id)a3;
@end

@implementation SWPersonIdentityProof

+ (SWPersonIdentityProof)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (SWPersonIdentityProof *)+[SWPersonIdentityProof allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SWPersonIdentityProof;
    return (SWPersonIdentityProof *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (SWPersonIdentityProof)initWithInclusionHashes:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWPersonIdentityProof;
  objc_super v6 = [(SWPersonIdentityProof *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_inclusionHashes, a3);
  }

  return v7;
}

- (SWPersonIdentityProof)initWithInclusionHashes:(id)a3 publicKey:(id)a4 localKeyIndex:(unint64_t)a5
{
  id v9 = a4;
  v10 = [(SWPersonIdentityProof *)self initWithInclusionHashes:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_publicKey, a4);
    v11->_localKeyIndex = a5;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SWPersonIdentityProof *)self inclusionHashes];
  objc_super v6 = NSStringFromSelector(sel_inclusionHashes);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(SWPersonIdentityProof *)self publicKey];
  v8 = NSStringFromSelector(sel_publicKey);
  [v4 encodeObject:v7 forKey:v8];

  unint64_t v9 = [(SWPersonIdentityProof *)self localKeyIndex];
  NSStringFromSelector(sel_localKeyIndex);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInteger:v9 forKey:v10];
}

- (SWPersonIdentityProof)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SWPersonIdentityProof;
  id v5 = [(SWPersonIdentityProof *)&v18 init];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    unint64_t v9 = NSStringFromSelector(sel_inclusionHashes);
    uint64_t v10 = [v4 decodeObjectOfClasses:v8 forKey:v9];
    inclusionHashes = v5->_inclusionHashes;
    v5->_inclusionHashes = (NSArray *)v10;

    uint64_t v12 = objc_opt_class();
    v13 = NSStringFromSelector(sel_publicKey);
    uint64_t v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSData *)v14;

    v16 = NSStringFromSelector(sel_localKeyIndex);
    v5->_localKeyIndex = [v4 decodeIntegerForKey:v16];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(SWPersonIdentityProof *)self inclusionHashes];
  objc_super v6 = (void *)[v4 initWithInclusionHashes:v5];

  uint64_t v7 = [(SWPersonIdentityProof *)self publicKey];
  [v6 setPublicKey:v7];

  objc_msgSend(v6, "setLocalKeyIndex:", -[SWPersonIdentityProof localKeyIndex](self, "localKeyIndex"));
  return v6;
}

- (NSArray)inclusionHashes
{
  return self->_inclusionHashes;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (unint64_t)localKeyIndex
{
  return self->_localKeyIndex;
}

- (void)setLocalKeyIndex:(unint64_t)a3
{
  self->_localKeyIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKey, 0);

  objc_storeStrong((id *)&self->_inclusionHashes, 0);
}

@end