@interface EMContentRequestOptions
+ (BOOL)supportsSecureCoding;
+ (id)optionsWithRequestedRepresentationType:(id)a3 networkUsage:(int64_t)a4;
+ (id)optionsWithRequestedRepresentationType:(id)a3 networkUsage:(int64_t)a4 includeSuggestionItems:(BOOL)a5;
+ (id)optionsWithRequestedRepresentationType:(id)a3 networkUsage:(int64_t)a4 includeSuggestions:(int64_t)a5;
- (BOOL)includeCachedMetadataJSON;
- (BOOL)requestAllHeaders;
- (EMContentRequestOptions)init;
- (EMContentRequestOptions)initWithBuilder:(id)a3;
- (EMContentRequestOptions)initWithCoder:(id)a3;
- (NSArray)requestedHeaderKeys;
- (NSString)requestedRepresentation;
- (id)copyWithBuilder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)cacheBehavior;
- (int64_t)includeSuggestionItems;
- (int64_t)networkUsage;
- (unint64_t)maximumNumberOfOriginalContentMessagesToRequest;
- (void)encodeWithCoder:(id)a3;
- (void)setCacheBehavior:(int64_t)a3;
- (void)setIncludeCachedMetadataJSON:(BOOL)a3;
- (void)setIncludeSuggestionItems:(int64_t)a3;
- (void)setMaximumNumberOfOriginalContentMessagesToRequest:(unint64_t)a3;
- (void)setNetworkUsage:(int64_t)a3;
- (void)setRequestAllHeaders:(BOOL)a3;
- (void)setRequestedHeaderKeys:(id)a3;
- (void)setRequestedRepresentation:(id)a3;
@end

@implementation EMContentRequestOptions

+ (id)optionsWithRequestedRepresentationType:(id)a3 networkUsage:(int64_t)a4
{
  v4 = +[EMContentRequestOptions optionsWithRequestedRepresentationType:a3 networkUsage:a4 includeSuggestions:0];
  return v4;
}

+ (id)optionsWithRequestedRepresentationType:(id)a3 networkUsage:(int64_t)a4 includeSuggestionItems:(BOOL)a5
{
  if (a5) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = +[EMContentRequestOptions optionsWithRequestedRepresentationType:a3 networkUsage:a4 includeSuggestions:v5];
  return v6;
}

+ (id)optionsWithRequestedRepresentationType:(id)a3 networkUsage:(int64_t)a4 includeSuggestions:(int64_t)a5
{
  id v8 = a3;
  id v9 = objc_alloc((Class)a1);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__EMContentRequestOptions_optionsWithRequestedRepresentationType_networkUsage_includeSuggestions___block_invoke;
  v13[3] = &unk_1E63E2EC8;
  id v10 = v8;
  id v14 = v10;
  int64_t v15 = a4;
  int64_t v16 = a5;
  v11 = (void *)[v9 initWithBuilder:v13];

  return v11;
}

void __98__EMContentRequestOptions_optionsWithRequestedRepresentationType_networkUsage_includeSuggestions___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  [v3 setRequestedRepresentation:a1[4]];
  [v3 setNetworkUsage:a1[5]];
  [v3 setIncludeSuggestionItems:a1[6]];
}

- (EMContentRequestOptions)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, EMContentRequestOptions *))a3;
  v7.receiver = self;
  v7.super_class = (Class)EMContentRequestOptions;
  uint64_t v5 = [(EMContentRequestOptions *)&v7 init];
  if (v5) {
    v4[2](v4, v5);
  }

  return v5;
}

- (EMContentRequestOptions)init
{
  return [(EMContentRequestOptions *)self initWithBuilder:&__block_literal_global_6];
}

void __31__EMContentRequestOptions_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setRequestedRepresentation:@"raw"];
  [v2 setNetworkUsage:0];
  [v2 setIncludeSuggestionItems:0];
}

- (id)copyWithBuilder:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  uint64_t v5 = (void *)[(EMContentRequestOptions *)self copy];
  v4[2](v4, v5);

  return v5;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(EMContentRequestOptions *)self requestedRepresentation];
  v6 = (void *)[v3 initWithFormat:@"<%@: %p> requestedRepresentation=%@, networkUsage=%ld", v4, self, v5, -[EMContentRequestOptions networkUsage](self, "networkUsage")];

  return v6;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(EMContentRequestOptions *)self requestedRepresentation];
  int64_t v6 = [(EMContentRequestOptions *)self networkUsage];
  BOOL v7 = [(EMContentRequestOptions *)self requestAllHeaders];
  id v8 = [(EMContentRequestOptions *)self requestedHeaderKeys];
  id v9 = (void *)[v3 initWithFormat:@"<%@: %p> requestedRepresentation=%@, networkUsage=%d, requestAllHeaders=%{BOOL}d, requestedHeaders=%@, includeCachedMetadataJSON=%{BOOL}d, maximumNumberOfOriginalContentMessagesToRequest=%lu", v4, self, v5, v6, v7, v8, -[EMContentRequestOptions includeCachedMetadataJSON](self, "includeCachedMetadataJSON"), -[EMContentRequestOptions maximumNumberOfOriginalContentMessagesToRequest](self, "maximumNumberOfOriginalContentMessagesToRequest")];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMContentRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EMContentRequestOptions *)self init];
  if (v5)
  {
    v5->_networkUsage = [v4 decodeIntegerForKey:@"EFPropertyKey_networkUsage"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_requestedRepresentation"];
    requestedRepresentation = v5->_requestedRepresentation;
    v5->_requestedRepresentation = (NSString *)v6;

    v5->_includeSuggestionItems = [v4 decodeIntegerForKey:@"EFPropertyKey_includeSuggestionItems"];
    v5->_requestAllHeaders = [v4 decodeBoolForKey:@"EFPropertyKey_requestAllHeaders"];
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"EFPropertyKey_requestedHeaderKeys"];
    requestedHeaderKeys = v5->_requestedHeaderKeys;
    v5->_requestedHeaderKeys = (NSArray *)v11;

    v5->_includeCachedMetadataJSON = [v4 decodeBoolForKey:@"EFPropertyKey_includeCachedMetadataJSON"];
    v5->_maximumNumberOfOriginalContentMessagesToRequest = [v4 decodeIntegerForKey:@"EFPropertyKey_maximumNumberOfOriginalContentMessagesToRequest"];
    v5->_cacheBehavior = [v4 decodeIntegerForKey:@"EFPropertyKey_cacheBehavior"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", -[EMContentRequestOptions networkUsage](self, "networkUsage"), @"EFPropertyKey_networkUsage");
  id v4 = [(EMContentRequestOptions *)self requestedRepresentation];
  [v6 encodeObject:v4 forKey:@"EFPropertyKey_requestedRepresentation"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[EMContentRequestOptions includeSuggestionItems](self, "includeSuggestionItems"), @"EFPropertyKey_includeSuggestionItems");
  objc_msgSend(v6, "encodeBool:forKey:", -[EMContentRequestOptions requestAllHeaders](self, "requestAllHeaders"), @"EFPropertyKey_requestAllHeaders");
  uint64_t v5 = [(EMContentRequestOptions *)self requestedHeaderKeys];
  [v6 encodeObject:v5 forKey:@"EFPropertyKey_requestedHeaderKeys"];

  objc_msgSend(v6, "encodeBool:forKey:", -[EMContentRequestOptions includeCachedMetadataJSON](self, "includeCachedMetadataJSON"), @"EFPropertyKey_includeCachedMetadataJSON");
  objc_msgSend(v6, "encodeInteger:forKey:", -[EMContentRequestOptions maximumNumberOfOriginalContentMessagesToRequest](self, "maximumNumberOfOriginalContentMessagesToRequest"), @"EFPropertyKey_maximumNumberOfOriginalContentMessagesToRequest");
  objc_msgSend(v6, "encodeInteger:forKey:", -[EMContentRequestOptions cacheBehavior](self, "cacheBehavior"), @"EFPropertyKey_cacheBehavior");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__EMContentRequestOptions_copyWithZone___block_invoke;
  v6[3] = &unk_1E63E2F10;
  v6[4] = self;
  return (id)[v4 initWithBuilder:v6];
}

void __40__EMContentRequestOptions_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_msgSend(v5, "setIncludeSuggestionItems:", objc_msgSend(*(id *)(a1 + 32), "includeSuggestionItems"));
  id v3 = [*(id *)(a1 + 32) requestedRepresentation];
  [v5 setRequestedRepresentation:v3];

  objc_msgSend(v5, "setNetworkUsage:", objc_msgSend(*(id *)(a1 + 32), "networkUsage"));
  objc_msgSend(v5, "setRequestAllHeaders:", objc_msgSend(*(id *)(a1 + 32), "requestAllHeaders"));
  id v4 = [*(id *)(a1 + 32) requestedHeaderKeys];
  [v5 setRequestedHeaderKeys:v4];

  objc_msgSend(v5, "setIncludeCachedMetadataJSON:", objc_msgSend(*(id *)(a1 + 32), "includeCachedMetadataJSON"));
  objc_msgSend(v5, "setMaximumNumberOfOriginalContentMessagesToRequest:", objc_msgSend(*(id *)(a1 + 32), "maximumNumberOfOriginalContentMessagesToRequest"));
  objc_msgSend(v5, "setCacheBehavior:", objc_msgSend(*(id *)(a1 + 32), "cacheBehavior"));
}

- (NSString)requestedRepresentation
{
  return self->_requestedRepresentation;
}

- (void)setRequestedRepresentation:(id)a3
{
}

- (int64_t)networkUsage
{
  return self->_networkUsage;
}

- (void)setNetworkUsage:(int64_t)a3
{
  self->_networkUsage = a3;
}

- (int64_t)cacheBehavior
{
  return self->_cacheBehavior;
}

- (void)setCacheBehavior:(int64_t)a3
{
  self->_cacheBehavior = a3;
}

- (int64_t)includeSuggestionItems
{
  return self->_includeSuggestionItems;
}

- (void)setIncludeSuggestionItems:(int64_t)a3
{
  self->_includeSuggestionItems = a3;
}

- (BOOL)includeCachedMetadataJSON
{
  return self->_includeCachedMetadataJSON;
}

- (void)setIncludeCachedMetadataJSON:(BOOL)a3
{
  self->_includeCachedMetadataJSON = a3;
}

- (BOOL)requestAllHeaders
{
  return self->_requestAllHeaders;
}

- (void)setRequestAllHeaders:(BOOL)a3
{
  self->_requestAllHeaders = a3;
}

- (NSArray)requestedHeaderKeys
{
  return self->_requestedHeaderKeys;
}

- (void)setRequestedHeaderKeys:(id)a3
{
}

- (unint64_t)maximumNumberOfOriginalContentMessagesToRequest
{
  return self->_maximumNumberOfOriginalContentMessagesToRequest;
}

- (void)setMaximumNumberOfOriginalContentMessagesToRequest:(unint64_t)a3
{
  self->_maximumNumberOfOriginalContentMessagesToRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedHeaderKeys, 0);
  objc_storeStrong((id *)&self->_requestedRepresentation, 0);
}

@end