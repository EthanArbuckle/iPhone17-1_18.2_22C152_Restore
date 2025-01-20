@interface CorrectionsProfilesPersistedState
+ (BOOL)supportsSecureCoding;
- (CorrectionsProfilesPersistedState)initWithCoder:(id)a3;
- (NSDictionary)correctionsProfiles;
- (NSString)digest;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCorrectionsProfiles:(id)a3;
- (void)setDigest:(id)a3;
@end

@implementation CorrectionsProfilesPersistedState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digest, 0);

  objc_storeStrong((id *)&self->_correctionsProfiles, 0);
}

- (void)setDigest:(id)a3
{
}

- (NSString)digest
{
  return self->_digest;
}

- (void)setCorrectionsProfiles:(id)a3
{
}

- (NSDictionary)correctionsProfiles
{
  return self->_correctionsProfiles;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p digest='%@' profiles=%@", objc_opt_class(), self, self->_digest, self->_correctionsProfiles];
}

- (void)encodeWithCoder:(id)a3
{
  digest = self->_digest;
  id v5 = a3;
  [v5 encodeObject:digest forKey:@"digest"];
  [v5 encodeObject:self->_correctionsProfiles forKey:@"correctionsProfiles"];
}

- (CorrectionsProfilesPersistedState)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CorrectionsProfilesPersistedState;
  id v5 = [(CorrectionsProfilesPersistedState *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"digest"];
    digest = v5->_digest;
    v5->_digest = (NSString *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"correctionsProfiles"];
    correctionsProfiles = v5->_correctionsProfiles;
    v5->_correctionsProfiles = (NSDictionary *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end