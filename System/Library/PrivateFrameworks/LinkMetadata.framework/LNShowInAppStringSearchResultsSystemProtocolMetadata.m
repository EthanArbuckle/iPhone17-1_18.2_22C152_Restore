@interface LNShowInAppStringSearchResultsSystemProtocolMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNShowInAppStringSearchResultsSystemProtocolMetadata)initWithCoder:(id)a3;
- (LNShowInAppStringSearchResultsSystemProtocolMetadata)initWithSearchScopes:(id)a3;
- (NSArray)searchScopes;
- (NSString)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNShowInAppStringSearchResultsSystemProtocolMetadata

- (void).cxx_destruct
{
}

- (NSArray)searchScopes
{
  return self->_searchScopes;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNShowInAppStringSearchResultsSystemProtocolMetadata *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(LNShowInAppStringSearchResultsSystemProtocolMetadata *)self searchScopes];
      v8 = [(LNShowInAppStringSearchResultsSystemProtocolMetadata *)v6 searchScopes];
      char v9 = [v7 isEqualToArray:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(LNShowInAppStringSearchResultsSystemProtocolMetadata *)self searchScopes];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(LNShowInAppStringSearchResultsSystemProtocolMetadata *)self searchScopes];
  v7 = [v3 stringWithFormat:@"<%@: %p, searchScopes: %@>", v5, self, v6];

  return (NSString *)v7;
}

- (LNShowInAppStringSearchResultsSystemProtocolMetadata)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"searchScopes"];

  char v9 = [(LNShowInAppStringSearchResultsSystemProtocolMetadata *)self initWithSearchScopes:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNShowInAppStringSearchResultsSystemProtocolMetadata *)self searchScopes];
  [v4 encodeObject:v5 forKey:@"searchScopes"];
}

- (LNShowInAppStringSearchResultsSystemProtocolMetadata)initWithSearchScopes:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNShowInAppStringSearchResultsSystemProtocolMetadata;
  uint64_t v6 = [(LNShowInAppStringSearchResultsSystemProtocolMetadata *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchScopes, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end