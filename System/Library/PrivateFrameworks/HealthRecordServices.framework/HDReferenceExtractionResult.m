@interface HDReferenceExtractionResult
+ (BOOL)supportsSecureCoding;
- (HDReferenceExtractionResult)initWithCoder:(id)a3;
- (HDReferenceExtractionResult)initWithCompleteResources:(id)a3 incompleteResources:(id)a4 unresolvableReferences:(id)a5 nextSearchResultURL:(id)a6;
- (NSArray)completeResources;
- (NSArray)incompleteResources;
- (NSArray)unresolvableReferences;
- (NSURL)nextSearchResultURL;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDReferenceExtractionResult

- (HDReferenceExtractionResult)initWithCompleteResources:(id)a3 incompleteResources:(id)a4 unresolvableReferences:(id)a5 nextSearchResultURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(HDReferenceExtractionResult *)self init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    completeResources = v14->_completeResources;
    v14->_completeResources = (NSArray *)v15;

    uint64_t v17 = [v11 copy];
    incompleteResources = v14->_incompleteResources;
    v14->_incompleteResources = (NSArray *)v17;

    uint64_t v19 = [v12 copy];
    unresolvableReferences = v14->_unresolvableReferences;
    v14->_unresolvableReferences = (NSArray *)v19;

    uint64_t v21 = [v13 copy];
    nextSearchResultURL = v14->_nextSearchResultURL;
    v14->_nextSearchResultURL = (NSURL *)v21;
  }
  return v14;
}

- (HDReferenceExtractionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HDReferenceExtractionResult;
  v5 = [(HDReferenceExtractionResult *)&v17 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"CompleteResources"];
    completeResources = v5->_completeResources;
    v5->_completeResources = (NSArray *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"IncompleteResources"];
    incompleteResources = v5->_incompleteResources;
    v5->_incompleteResources = (NSArray *)v10;

    uint64_t v12 = [v4 decodeObjectOfClasses:v9 forKey:@"UnresolvableReferences"];
    unresolvableReferences = v5->_unresolvableReferences;
    v5->_unresolvableReferences = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NextSearchResult"];
    nextSearchResultURL = v5->_nextSearchResultURL;
    v5->_nextSearchResultURL = (NSURL *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  completeResources = self->_completeResources;
  id v5 = a3;
  [v5 encodeObject:completeResources forKey:@"CompleteResources"];
  [v5 encodeObject:self->_incompleteResources forKey:@"IncompleteResources"];
  [v5 encodeObject:self->_unresolvableReferences forKey:@"UnresolvableReferences"];
  [v5 encodeObject:self->_nextSearchResultURL forKey:@"NextSearchResult"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"<%@> %lu complete resources, %lu incomplete resources, %lu incompletable resources", objc_opt_class(), -[NSArray count](self->_completeResources, "count"), -[NSArray count](self->_incompleteResources, "count"), -[NSArray count](self->_unresolvableReferences, "count")];
}

- (NSArray)completeResources
{
  return self->_completeResources;
}

- (NSArray)incompleteResources
{
  return self->_incompleteResources;
}

- (NSArray)unresolvableReferences
{
  return self->_unresolvableReferences;
}

- (NSURL)nextSearchResultURL
{
  return self->_nextSearchResultURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextSearchResultURL, 0);
  objc_storeStrong((id *)&self->_unresolvableReferences, 0);
  objc_storeStrong((id *)&self->_incompleteResources, 0);

  objc_storeStrong((id *)&self->_completeResources, 0);
}

@end