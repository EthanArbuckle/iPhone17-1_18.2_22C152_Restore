@interface ATXInterruptionManagerAppSuggestions
+ (BOOL)supportsSecureCoding;
- (ATXInterruptionManagerAppSuggestions)init;
- (ATXInterruptionManagerAppSuggestions)initWithCoder:(id)a3;
- (ATXInterruptionManagerAppSuggestions)initWithRecommendedApps:(id)a3 candidateApps:(id)a4;
- (NSArray)candidateApps;
- (NSArray)recommendedApps;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (void)addCandidateApp:(id)a3;
- (void)addRecommendedApp:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXInterruptionManagerAppSuggestions

- (ATXInterruptionManagerAppSuggestions)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = [(ATXInterruptionManagerAppSuggestions *)self initWithRecommendedApps:v3 candidateApps:v4];

  return v5;
}

- (ATXInterruptionManagerAppSuggestions)initWithRecommendedApps:(id)a3 candidateApps:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXInterruptionManagerAppSuggestions;
  v9 = [(ATXInterruptionManagerAppSuggestions *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recommendedApps, a3);
    objc_storeStrong((id *)&v10->_candidateApps, a4);
  }

  return v10;
}

- (id)debugDescription
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"recommendedApps";
  v6[1] = @"candidateApps";
  candidateApps = self->_candidateApps;
  v7[0] = self->_recommendedApps;
  v7[1] = candidateApps;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  v4 = [v3 debugDescription];

  return v4;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"recommendedApps: %@ candidateApps: %@", self->_recommendedApps, self->_candidateApps];

  return v2;
}

- (void)addRecommendedApp:(id)a3
{
}

- (void)addCandidateApp:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  recommendedApps = self->_recommendedApps;
  id v5 = a3;
  [v5 encodeObject:recommendedApps forKey:@"codingKeyForRecommendedApps"];
  [v5 encodeObject:self->_candidateApps forKey:@"codingKeyForCandidateApps"];
}

- (ATXInterruptionManagerAppSuggestions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  v6 = (void *)MEMORY[0x1AD0D3C30]();
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  v10 = __atxlog_handle_notification_management();
  v11 = [v5 robustDecodeObjectOfClasses:v9 forKey:@"codingKeyForRecommendedApps" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.decode.ATXInterruptionManagerAppSuggestions" errorCode:-1 logHandle:v10];

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
    v20 = [v14 robustDecodeObjectOfClasses:v18 forKey:@"codingKeyForCandidateApps" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.decode.ATXInterruptionManagerAppSuggestions" errorCode:-1 logHandle:v19];

    v21 = [v4 error];

    v13 = 0;
    if (!v21) {
      v13 = [[ATXInterruptionManagerAppSuggestions alloc] initWithRecommendedApps:v11 candidateApps:v20];
    }
  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ATXInterruptionManagerAppSuggestions allocWithZone:a3];
  id v5 = (void *)[(NSMutableArray *)self->_recommendedApps mutableCopy];
  v6 = (void *)[(NSMutableArray *)self->_candidateApps mutableCopy];
  id v7 = [(ATXInterruptionManagerAppSuggestions *)v4 initWithRecommendedApps:v5 candidateApps:v6];

  return v7;
}

- (NSArray)recommendedApps
{
  return &self->_recommendedApps->super;
}

- (NSArray)candidateApps
{
  return &self->_candidateApps->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateApps, 0);

  objc_storeStrong((id *)&self->_recommendedApps, 0);
}

@end