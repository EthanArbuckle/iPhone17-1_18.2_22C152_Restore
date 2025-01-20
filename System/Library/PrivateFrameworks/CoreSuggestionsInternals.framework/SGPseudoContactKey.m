@interface SGPseudoContactKey
+ (BOOL)isSupportedEntityType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPseudoContactKey:(id)a3;
- (NSString)description;
- (SGIdentityKey)identityKey;
- (SGPseudoContactKey)initWithEmail:(id)a3;
- (SGPseudoContactKey)initWithIdentityKey:(id)a3;
- (SGPseudoContactKey)initWithNormalizedEmail:(id)a3;
- (SGPseudoContactKey)initWithSerialized:(id)a3;
- (id)serialize;
- (unint64_t)hash;
@end

@implementation SGPseudoContactKey

- (void).cxx_destruct
{
}

- (SGIdentityKey)identityKey
{
  return self->_identityKey;
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"[SGPseudoContactKey identityKey:%@]", self->_identityKey];
  return (NSString *)v2;
}

- (BOOL)isEqualToPseudoContactKey:(id)a3
{
  v4 = self->_identityKey;
  v5 = v4;
  if (v4 == *((SGIdentityKey **)a3 + 1)) {
    char v6 = 1;
  }
  else {
    char v6 = -[SGIdentityKey isEqual:](v4, "isEqual:");
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGPseudoContactKey *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGPseudoContactKey *)self isEqualToPseudoContactKey:v5];

  return v6;
}

- (unint64_t)hash
{
  return [(SGIdentityKey *)self->_identityKey hash];
}

- (id)serialize
{
  return [(SGIdentityKey *)self->_identityKey serialize];
}

- (SGPseudoContactKey)initWithSerialized:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SGPseudoContactKey.m", 38, @"Invalid parameter not satisfying: %@", @"serialized" object file lineNumber description];
  }
  BOOL v6 = [[SGIdentityKey alloc] initWithSerialized:v5];
  v7 = [(SGPseudoContactKey *)self initWithIdentityKey:v6];

  return v7;
}

- (SGPseudoContactKey)initWithIdentityKey:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGPseudoContactKey;
  BOOL v6 = [(SGPseudoContactKey *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identityKey, a3);
  }

  return v7;
}

- (SGPseudoContactKey)initWithNormalizedEmail:(id)a3
{
  v4 = +[SGIdentityKey keyForNormalizedEmail:a3];
  id v5 = [(SGPseudoContactKey *)self initWithIdentityKey:v4];

  return v5;
}

- (SGPseudoContactKey)initWithEmail:(id)a3
{
  v4 = SGNormalizeEmailAddress();
  id v5 = [(SGPseudoContactKey *)self initWithNormalizedEmail:v4];

  return v5;
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  if ((unint64_t)a3 < 0x1C) {
    return (a3 & 0xFFFFFFF) == 4;
  }
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SGPseudoContactKey.m", 100, @"Unknown entity type: %lu", a3);

  return 0;
}

@end