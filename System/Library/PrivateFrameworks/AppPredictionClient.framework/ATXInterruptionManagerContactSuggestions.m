@interface ATXInterruptionManagerContactSuggestions
+ (BOOL)supportsSecureCoding;
- (ATXInterruptionManagerContactSuggestions)init;
- (ATXInterruptionManagerContactSuggestions)initWithCoder:(id)a3;
- (ATXInterruptionManagerContactSuggestions)initWithRecommendedContacts:(id)a3 candidateContacts:(id)a4;
- (NSArray)candidateContacts;
- (NSArray)recommendedContacts;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (void)addCandidateContact:(id)a3;
- (void)addRecommendedContact:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXInterruptionManagerContactSuggestions

- (ATXInterruptionManagerContactSuggestions)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = [(ATXInterruptionManagerContactSuggestions *)self initWithRecommendedContacts:v3 candidateContacts:v4];

  return v5;
}

- (ATXInterruptionManagerContactSuggestions)initWithRecommendedContacts:(id)a3 candidateContacts:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXInterruptionManagerContactSuggestions;
  v9 = [(ATXInterruptionManagerContactSuggestions *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recommendedContacts, a3);
    objc_storeStrong((id *)&v10->_candidateContacts, a4);
  }

  return v10;
}

- (id)debugDescription
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"recommendedContacts";
  v6[1] = @"candidateContacts";
  candidateContacts = self->_candidateContacts;
  v7[0] = self->_recommendedContacts;
  v7[1] = candidateContacts;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  v4 = [v3 debugDescription];

  return v4;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"recommendedContacts: %@ candidateContacts: %@", self->_recommendedContacts, self->_candidateContacts];

  return v2;
}

- (void)addRecommendedContact:(id)a3
{
}

- (void)addCandidateContact:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  recommendedContacts = self->_recommendedContacts;
  id v5 = a3;
  [v5 encodeObject:recommendedContacts forKey:@"codingKeyForRecommendedContacts"];
  [v5 encodeObject:self->_candidateContacts forKey:@"codingKeyForCandidateContacts"];
}

- (ATXInterruptionManagerContactSuggestions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  v6 = (void *)MEMORY[0x1AD0D3C30]();
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  v10 = __atxlog_handle_notification_management();
  v11 = [v5 robustDecodeObjectOfClasses:v9 forKey:@"codingKeyForRecommendedContacts" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.decode.ATXInterruptionManagerContactSuggestions" errorCode:-1 logHandle:v10];

  objc_super v12 = [v4 error];

  v13 = 0;
  if (!v12)
  {
    v14 = (void *)MEMORY[0x1E4F93B90];
    v15 = (void *)MEMORY[0x1AD0D3C30]();
    id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "initWithObjects:", v17, objc_opt_class(), 0);
    v19 = __atxlog_handle_notification_management();
    v20 = [v14 robustDecodeObjectOfClasses:v18 forKey:@"codingKeyForCandidateContacts" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.decode.ATXInterruptionManagerContactSuggestions" errorCode:-1 logHandle:v19];

    v21 = [v4 error];

    v13 = 0;
    if (!v21) {
      v13 = [[ATXInterruptionManagerContactSuggestions alloc] initWithRecommendedContacts:v11 candidateContacts:v20];
    }
  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ATXInterruptionManagerContactSuggestions allocWithZone:a3];
  id v5 = (void *)[(NSMutableArray *)self->_recommendedContacts mutableCopy];
  v6 = (void *)[(NSMutableArray *)self->_candidateContacts mutableCopy];
  id v7 = [(ATXInterruptionManagerContactSuggestions *)v4 initWithRecommendedContacts:v5 candidateContacts:v6];

  return v7;
}

- (NSArray)recommendedContacts
{
  return &self->_recommendedContacts->super;
}

- (NSArray)candidateContacts
{
  return &self->_candidateContacts->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateContacts, 0);

  objc_storeStrong((id *)&self->_recommendedContacts, 0);
}

@end