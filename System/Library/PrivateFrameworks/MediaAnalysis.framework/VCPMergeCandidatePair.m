@interface VCPMergeCandidatePair
+ (id)mergeCandidatePairWithPerson:(id)a3 andPerson:(id)a4 reason:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)person1LocalIdentifier;
- (NSString)person2LocalIdentifier;
- (NSString)reason;
- (VCPMergeCandidatePair)initWithPerson:(id)a3 andPerson:(id)a4 reason:(id)a5;
- (id)description;
- (unint64_t)hash;
@end

@implementation VCPMergeCandidatePair

+ (id)mergeCandidatePairWithPerson:(id)a3 andPerson:(id)a4 reason:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [[VCPMergeCandidatePair alloc] initWithPerson:v7 andPerson:v8 reason:v9];

  return v10;
}

- (VCPMergeCandidatePair)initWithPerson:(id)a3 andPerson:(id)a4 reason:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)VCPMergeCandidatePair;
  v12 = [(VCPMergeCandidatePair *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_person1LocalIdentifier, a3);
    objc_storeStrong((id *)&v13->_person2LocalIdentifier, a4);
    objc_storeStrong((id *)&v13->_reason, a5);
    uint64_t v14 = [(NSString *)v13->_person1LocalIdentifier hash];
    v13->_hash = [(NSString *)v13->_person2LocalIdentifier hash] ^ v14;
  }

  return v13;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (VCPMergeCandidatePair *)a3;
  if (v5 == self) {
    goto LABEL_11;
  }
  uint64_t v6 = objc_opt_class();
  if (v6 != objc_opt_class()) {
    goto LABEL_3;
  }
  id v8 = v5;
  id v9 = [(VCPMergeCandidatePair *)v8 person1LocalIdentifier];
  int v10 = [v9 isEqualToString:self->_person1LocalIdentifier];
  if (v10)
  {
    v3 = [(VCPMergeCandidatePair *)v8 person2LocalIdentifier];
    if ([v3 isEqualToString:self->_person2LocalIdentifier])
    {

      goto LABEL_11;
    }
  }
  id v11 = [(VCPMergeCandidatePair *)v8 person1LocalIdentifier];
  if (![v11 isEqualToString:self->_person2LocalIdentifier])
  {

    if (v10) {
    goto LABEL_3;
    }
  }
  v12 = [(VCPMergeCandidatePair *)v8 person2LocalIdentifier];
  char v13 = [v12 isEqualToString:self->_person1LocalIdentifier];

  if (v10) {
  if (v13)
  }
  {
LABEL_11:
    BOOL v7 = 1;
    goto LABEL_12;
  }
LABEL_3:
  BOOL v7 = 0;
LABEL_12:

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"\n%@ <%p>:\n", objc_opt_class(), self];
  [v3 appendFormat:@"  person1LocalIdentifier  : %@\n", self->_person1LocalIdentifier];
  [v3 appendFormat:@"  person2LocalIdentifier  : %@\n", self->_person2LocalIdentifier];
  [v3 appendFormat:@"  reason                  : %@\n", self->_reason];
  return v3;
}

- (NSString)person1LocalIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)person2LocalIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_person2LocalIdentifier, 0);
  objc_storeStrong((id *)&self->_person1LocalIdentifier, 0);
}

@end