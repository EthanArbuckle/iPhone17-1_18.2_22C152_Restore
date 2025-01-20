@interface ATXSuggestedPagesLayoutOptions
+ (BOOL)supportsSecureCoding;
- (ATXSuggestedPagesLayoutOptions)initWithCoder:(id)a3;
- (NSSet)candidateApps;
- (void)encodeWithCoder:(id)a3;
- (void)setCandidateApps:(id)a3;
@end

@implementation ATXSuggestedPagesLayoutOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXSuggestedPagesLayoutOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ATXSuggestedPagesLayoutOptions;
  v5 = [(ATXSuggestedPagesLayoutOptions *)&v14 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1AD0D3C30]();
    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v8 = self;
    v9 = self;
    v10 = objc_msgSend(v7, "initWithObjects:", v8, v9, 0);

    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"candidateApps"];
    candidateApps = v5->_candidateApps;
    v5->_candidateApps = (NSSet *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSSet)candidateApps
{
  return self->_candidateApps;
}

- (void)setCandidateApps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end