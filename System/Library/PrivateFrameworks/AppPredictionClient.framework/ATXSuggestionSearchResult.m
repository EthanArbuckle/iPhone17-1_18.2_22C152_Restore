@interface ATXSuggestionSearchResult
+ (BOOL)supportsSecureCoding;
- (ATXContextActionIdentifier)contextActionIdentifier;
- (ATXProactiveSuggestion)proactiveSuggestion;
- (ATXSuggestionSearchResult)initWithCoder:(id)a3;
- (NSUUID)blendingModelUICacheUpdateUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBlendingModelUICacheUpdateUUID:(id)a3;
- (void)setContextActionIdentifier:(id)a3;
- (void)setProactiveSuggestion:(id)a3;
@end

@implementation ATXSuggestionSearchResult

- (void)setProactiveSuggestion:(id)a3
{
  v5 = (ATXProactiveSuggestion *)a3;
  p_proactiveSuggestion = &self->_proactiveSuggestion;
  if (self->_proactiveSuggestion != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_proactiveSuggestion, a3);
    v5 = v7;
  }

  MEMORY[0x1F41817F8](p_proactiveSuggestion, v5);
}

- (void)setBlendingModelUICacheUpdateUUID:(id)a3
{
}

- (void)setContextActionIdentifier:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ATXSuggestionSearchResult;
  id v4 = [(ATXSuggestionSearchResult *)&v10 copyWithZone:a3];
  v5 = [(ATXSuggestionSearchResult *)self proactiveSuggestion];
  v6 = (void *)[v5 copy];
  [v4 setProactiveSuggestion:v6];

  v7 = [(ATXSuggestionSearchResult *)self blendingModelUICacheUpdateUUID];
  v8 = (void *)[v7 copy];
  [v4 setBlendingModelUICacheUpdateUUID:v8];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXSuggestionSearchResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXSuggestionSearchResult;
  v5 = [(ATXSuggestionSearchResult *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proactiveSuggestion"];
    proactiveSuggestion = v5->_proactiveSuggestion;
    v5->_proactiveSuggestion = (ATXProactiveSuggestion *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"blendingCacheUUID"];
    blendingModelUICacheUpdateUUID = v5->_blendingModelUICacheUpdateUUID;
    v5->_blendingModelUICacheUpdateUUID = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextActionIdentifier"];
    contextActionIdentifier = v5->_contextActionIdentifier;
    v5->_contextActionIdentifier = (ATXContextActionIdentifier *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  proactiveSuggestion = self->_proactiveSuggestion;
  id v5 = a3;
  [v5 encodeObject:proactiveSuggestion forKey:@"proactiveSuggestion"];
  [v5 encodeObject:self->_blendingModelUICacheUpdateUUID forKey:@"blendingCacheUUID"];
  [v5 encodeObject:self->_contextActionIdentifier forKey:@"contextActionIdentifier"];
  v6.receiver = self;
  v6.super_class = (Class)ATXSuggestionSearchResult;
  [(ATXSuggestionSearchResult *)&v6 encodeWithCoder:v5];
}

- (ATXProactiveSuggestion)proactiveSuggestion
{
  return self->_proactiveSuggestion;
}

- (NSUUID)blendingModelUICacheUpdateUUID
{
  return self->_blendingModelUICacheUpdateUUID;
}

- (ATXContextActionIdentifier)contextActionIdentifier
{
  return self->_contextActionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextActionIdentifier, 0);
  objc_storeStrong((id *)&self->_blendingModelUICacheUpdateUUID, 0);

  objc_storeStrong((id *)&self->_proactiveSuggestion, 0);
}

@end