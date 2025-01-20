@interface CNSocialProfileContactPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNSocialProfile)socialProfile;
- (CNSocialProfileContactPredicate)initWithCoder:(id)a3;
- (CNSocialProfileContactPredicate)initWithSocialProfile:(id)a3;
- (NSString)description;
- (id)sgContactMatchesWithSortOrder:(int64_t)a3 mutableObjects:(BOOL)a4 service:(id)a5 error:(id *)a6;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNSocialProfileContactPredicate

- (id)sgContactMatchesWithSortOrder:(int64_t)a3 mutableObjects:(BOOL)a4 service:(id)a5 error:(id *)a6
{
  v7 = (void *)MEMORY[0x1E4F5DA20];
  id v32 = a5;
  v34 = [v7 extractionInfoWithExtractionType:0 modelVersion:0 confidence:0];
  uint64_t v8 = [MEMORY[0x1E4F5DB20] recordIdWithNumericValue:-1];
  id v26 = objc_alloc(MEMORY[0x1E4F5DB48]);
  v30 = [(CNSocialProfileContactPredicate *)self socialProfile];
  uint64_t v9 = [v30 username];
  v29 = [(CNSocialProfileContactPredicate *)self socialProfile];
  v10 = [v29 userIdentifier];
  v28 = [(CNSocialProfileContactPredicate *)self socialProfile];
  v27 = [v28 bundleIdentifiers];
  v11 = [v27 firstObject];
  v12 = [(CNSocialProfileContactPredicate *)self socialProfile];
  v13 = [v12 displayname];
  v14 = [(CNSocialProfileContactPredicate *)self socialProfile];
  v15 = [v14 service];
  v16 = [(CNSocialProfileContactPredicate *)self socialProfile];
  v17 = [v16 teamIdentifier];
  v33 = (void *)v8;
  uint64_t v25 = v8;
  v18 = (void *)v9;
  v19 = (void *)[v26 initWithUsername:v9 userIdentifier:v10 bundleIdentifier:v11 displayName:v13 service:v15 teamIdentifier:v17 label:0 extractionInfo:v34 recordId:v25];

  id v20 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  v21 = [v20 completionHandlerAdapter];
  [v32 contactMatchesBySocialProfile:v19 withCompletion:v21];

  v22 = [v20 future];
  v23 = [v22 resultWithTimeout:a6 error:*(double *)&CNSuggestionsServiceDefaultTimeout];

  if (!v23 && [MEMORY[0x1E4F5A3F0] isTimeoutError:*a6]) {
    CNSetError(a6, 1001, 0);
  }

  return v23;
}

- (CNSocialProfileContactPredicate)initWithSocialProfile:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNSocialProfileContactPredicate;
  v5 = [(CNPredicate *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    socialProfile = v5->_socialProfile;
    v5->_socialProfile = (CNSocialProfile *)v6;

    uint64_t v8 = v5;
  }

  return v5;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactsMatchingSocialProfile:]"];
  v5 = [(CNSocialProfileContactPredicate *)self socialProfile];
  uint64_t v6 = [v5 dictionaryRepresentation];
  id v7 = (id)[v3 appendName:@"socialProfile" object:v6];

  uint64_t v8 = [v3 build];

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNSocialProfileContactPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNSocialProfileContactPredicate;
  v5 = [(CNPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_socialProfile"];
    uint64_t v7 = [v6 copy];
    socialProfile = v5->_socialProfile;
    v5->_socialProfile = (CNSocialProfile *)v7;

    uint64_t v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNSocialProfileContactPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_socialProfile, @"_socialProfile", v5.receiver, v5.super_class);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x1E4F5A3E0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__CNSocialProfileContactPredicate_isEqual___block_invoke;
  v8[3] = &unk_1E56B3E18;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v8, 0);

  return (char)self;
}

uint64_t __43__CNSocialProfileContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) socialProfile];
  id v4 = [*(id *)(a1 + 40) socialProfile];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__CNSocialProfileContactPredicate_hash__block_invoke;
  v3[3] = &unk_1E56B3E40;
  v3[4] = self;
  return objc_msgSend(MEMORY[0x1E4F5A418], "hashWithBlocks:", v3, 0);
}

uint64_t __39__CNSocialProfileContactPredicate_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) socialProfile];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (CNSocialProfile)socialProfile
{
  return self->_socialProfile;
}

- (void).cxx_destruct
{
}

@end