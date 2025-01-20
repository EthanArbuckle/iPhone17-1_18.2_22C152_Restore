@interface CPLScopeStatusCounts
+ (BOOL)supportsSecureCoding;
- (CPLScopeStatusCounts)initWithCoder:(id)a3;
- (CPLScopeStatusCounts)initWithFlagsCounts:(id)a3;
- (NSDictionary)countPerFlags;
- (id)description;
- (unint64_t)countOfSharingRecords;
- (unint64_t)countOfUnsharingRecords;
- (void)_computeSummariesIfNecessary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLScopeStatusCounts

- (void).cxx_destruct
{
}

- (NSDictionary)countPerFlags
{
  return self->_countPerFlags;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ ", objc_opt_class()];
  [(CPLScopeStatusCounts *)self _computeSummariesIfNecessary];
  objc_msgSend(v3, "appendFormat:", @"sharing records: %tu / unsharing records: %tu", self->_countOfSharingRecords, self->_countOfUnsharingRecords);
  [v3 appendString:@">"];
  return v3;
}

- (unint64_t)countOfUnsharingRecords
{
  return self->_countOfUnsharingRecords;
}

- (unint64_t)countOfSharingRecords
{
  return self->_countOfSharingRecords;
}

- (void)_computeSummariesIfNecessary
{
  if (!self->_hasCachedSummaries)
  {
    countPerFlags = self->_countPerFlags;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __52__CPLScopeStatusCounts__computeSummariesIfNecessary__block_invoke;
    v4[3] = &unk_1E60AB978;
    v4[4] = self;
    [(NSDictionary *)countPerFlags enumerateKeysAndObjectsUsingBlock:v4];
    self->_hasCachedSummaries = 1;
  }
}

uint64_t __52__CPLScopeStatusCounts__computeSummariesIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  uint64_t v5 = [a2 integerValue];
  if (v5)
  {
    uint64_t v7 = 16;
    v6 = v9;
  }
  else
  {
    v6 = v9;
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    uint64_t v7 = 24;
  }
  uint64_t v5 = [v6 unsignedIntegerValue];
  v6 = v9;
  *(void *)(*(void *)(a1 + 32) + v7) += v5;
LABEL_6:
  return MEMORY[0x1F41817F8](v5, v6);
}

- (void)encodeWithCoder:(id)a3
{
}

- (CPLScopeStatusCounts)initWithCoder:(id)a3
{
  uint64_t v4 = initWithCoder__onceToken_23914;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&initWithCoder__onceToken_23914, &__block_literal_global_23915);
  }
  v6 = [v5 decodeObjectOfClasses:initWithCoder__countPerFlagsClasses forKey:@"counts"];

  uint64_t v7 = [(CPLScopeStatusCounts *)self initWithFlagsCounts:v6];
  return v7;
}

uint64_t __38__CPLScopeStatusCounts_initWithCoder___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_msgSend(v0, "initWithObjects:", v1, objc_opt_class(), 0);
  uint64_t v3 = initWithCoder__countPerFlagsClasses;
  initWithCoder__countPerFlagsClasses = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

- (CPLScopeStatusCounts)initWithFlagsCounts:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLScopeStatusCounts;
  id v5 = [(CPLScopeStatusCounts *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    countPerFlags = v5->_countPerFlags;
    v5->_countPerFlags = (NSDictionary *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end