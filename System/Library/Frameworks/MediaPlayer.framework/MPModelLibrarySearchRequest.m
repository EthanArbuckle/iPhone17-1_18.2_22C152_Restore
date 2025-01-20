@interface MPModelLibrarySearchRequest
+ (BOOL)supportsSecureCoding;
- (MPModelLibrarySearchRequest)initWithCoder:(id)a3;
- (NSArray)scopes;
- (NSString)searchString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)newOperationWithResponseHandler:(id)a3;
- (int64_t)maximumResultsPerScope;
- (void)encodeWithCoder:(id)a3;
- (void)setMaximumResultsPerScope:(int64_t)a3;
- (void)setScopes:(id)a3;
- (void)setSearchString:(id)a3;
@end

@implementation MPModelLibrarySearchRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);

  objc_storeStrong((id *)&self->_scopes, 0);
}

- (void)setSearchString:(id)a3
{
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setMaximumResultsPerScope:(int64_t)a3
{
  self->_maximumResultsPerScope = a3;
}

- (int64_t)maximumResultsPerScope
{
  return self->_maximumResultsPerScope;
}

- (void)setScopes:(id)a3
{
}

- (NSArray)scopes
{
  return self->_scopes;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(MPModelLibrarySearchRequestOperation);
  [(MPModelLibrarySearchRequestOperation *)v5 setResponseHandler:v4];
  [(MPModelLibrarySearchRequestOperation *)v5 setRequest:self];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MPModelLibrarySearchRequest;
  id v4 = [(MPModelLibraryRequest *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    v4[22] = self->_maximumResultsPerScope;
    objc_storeStrong(v4 + 21, self->_scopes);
    objc_storeStrong(v5 + 23, self->_searchString);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MPModelLibrarySearchRequest;
  [(MPModelLibraryRequest *)&v5 encodeWithCoder:v4];
  [v4 encodeInteger:self->_maximumResultsPerScope forKey:@"MPModelLibrarySearchRequestMaximumResultsPerScope"];
  [v4 encodeObject:self->_scopes forKey:@"MPModelLibrarySearchRequestScopes"];
  [v4 encodeObject:self->_searchString forKey:@"MPModelLibrarySearchRequestSearchString"];
}

- (MPModelLibrarySearchRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MPModelLibrarySearchRequest;
  objc_super v5 = [(MPModelLibraryRequest *)&v14 initWithCoder:v4];
  if (v5)
  {
    v5->_maximumResultsPerScope = [v4 decodeIntegerForKey:@"MPModelLibrarySearchRequestMaximumResultsPerScope"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"MPModelLibrarySearchRequestScopes"];
    scopes = v5->_scopes;
    v5->_scopes = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPModelLibrarySearchRequestSearchString"];
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v11;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithString:@"<"];
  v8.receiver = self;
  v8.super_class = (Class)MPModelLibrarySearchRequest;
  id v4 = [(MPModelLibraryRequest *)&v8 description];
  [v3 appendString:v4];

  if (self->_searchString) {
    [v3 appendFormat:@", searchString = %@", self->_searchString];
  }
  scopes = self->_scopes;
  if (scopes)
  {
    v6 = [(NSArray *)scopes description];
    [v3 appendFormat:@", scopes = %@", v6];
  }
  [v3 appendString:@">"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end