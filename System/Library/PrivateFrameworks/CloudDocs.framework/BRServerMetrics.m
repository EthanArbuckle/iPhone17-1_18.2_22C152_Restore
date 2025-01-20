@interface BRServerMetrics
+ (BOOL)supportsSecureCoding;
- (BRServerMetrics)initWithCoder:(id)a3;
- (BRServerMetrics)initWithServerMetrics:(id)a3;
- (NSNumber)childCount;
- (NSNumber)quotaUsed;
- (NSNumber)recursiveChildCount;
- (NSNumber)sharedAliasRecursiveCount;
- (NSNumber)sharedByMeRecursiveCount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initFromResultSet:(id)a3 pos:(int)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setChildCount:(id)a3;
- (void)setQuotaUsed:(id)a3;
- (void)setRecursiveChildCount:(id)a3;
- (void)setSharedAliasRecursiveCount:(id)a3;
- (void)setSharedByMeRecursiveCount:(id)a3;
@end

@implementation BRServerMetrics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());

  return (id)[v4 initWithServerMetrics:self];
}

- (BRServerMetrics)initWithServerMetrics:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BRServerMetrics;
  v5 = [(BRServerMetrics *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 quotaUsed];
    quotaUsed = v5->_quotaUsed;
    v5->_quotaUsed = (NSNumber *)v6;

    uint64_t v8 = [v4 recursiveChildCount];
    recursiveChildCount = v5->_recursiveChildCount;
    v5->_recursiveChildCount = (NSNumber *)v8;

    uint64_t v10 = [v4 sharedByMeRecursiveCount];
    sharedByMeRecursiveCount = v5->_sharedByMeRecursiveCount;
    v5->_sharedByMeRecursiveCount = (NSNumber *)v10;

    uint64_t v12 = [v4 sharedAliasRecursiveCount];
    sharedAliasRecursiveCount = v5->_sharedAliasRecursiveCount;
    v5->_sharedAliasRecursiveCount = (NSNumber *)v12;

    uint64_t v14 = [v4 childCount];
    childCount = v5->_childCount;
    v5->_childCount = (NSNumber *)v14;
  }
  return v5;
}

- (id)initFromResultSet:(id)a3 pos:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BRServerMetrics;
  v7 = [(BRServerMetrics *)&v19 init];
  if (v7)
  {
    uint64_t v8 = [v6 numberAtIndex:v4];
    quotaUsed = v7->_quotaUsed;
    v7->_quotaUsed = (NSNumber *)v8;

    uint64_t v10 = [v6 numberAtIndex:(v4 + 1)];
    recursiveChildCount = v7->_recursiveChildCount;
    v7->_recursiveChildCount = (NSNumber *)v10;

    uint64_t v12 = [v6 numberAtIndex:(v4 + 2)];
    sharedByMeRecursiveCount = v7->_sharedByMeRecursiveCount;
    v7->_sharedByMeRecursiveCount = (NSNumber *)v12;

    uint64_t v14 = [v6 numberAtIndex:(v4 + 3)];
    sharedAliasRecursiveCount = v7->_sharedAliasRecursiveCount;
    v7->_sharedAliasRecursiveCount = (NSNumber *)v14;

    uint64_t v16 = [v6 numberAtIndex:(v4 + 4)];
    childCount = v7->_childCount;
    v7->_childCount = (NSNumber *)v16;
  }
  return v7;
}

- (BRServerMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BRServerMetrics;
  v5 = [(BRServerMetrics *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"quota-used"];
    quotaUsed = v5->_quotaUsed;
    v5->_quotaUsed = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rec-child-count"];
    recursiveChildCount = v5->_recursiveChildCount;
    v5->_recursiveChildCount = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shared-by-me"];
    sharedByMeRecursiveCount = v5->_sharedByMeRecursiveCount;
    v5->_sharedByMeRecursiveCount = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shared-alias"];
    sharedAliasRecursiveCount = v5->_sharedAliasRecursiveCount;
    v5->_sharedAliasRecursiveCount = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"child-count"];
    childCount = v5->_childCount;
    v5->_childCount = (NSNumber *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  quotaUsed = self->_quotaUsed;
  id v5 = a3;
  [v5 encodeObject:quotaUsed forKey:@"quota-used"];
  [v5 encodeObject:self->_recursiveChildCount forKey:@"rec-child-count"];
  [v5 encodeObject:self->_sharedByMeRecursiveCount forKey:@"shared-by-me"];
  [v5 encodeObject:self->_sharedAliasRecursiveCount forKey:@"shared-alias"];
  [v5 encodeObject:self->_childCount forKey:@"child-count"];
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:64];
  quotaUsed = self->_quotaUsed;
  if (quotaUsed) {
    objc_msgSend(v3, "appendFormat:", @"qta:%llu ", -[NSNumber unsignedLongLongValue](quotaUsed, "unsignedLongLongValue"));
  }
  recursiveChildCount = self->_recursiveChildCount;
  if (recursiveChildCount) {
    objc_msgSend(v3, "appendFormat:", @"rcc:%llu ", -[NSNumber unsignedLongLongValue](recursiveChildCount, "unsignedLongLongValue"));
  }
  sharedByMeRecursiveCount = self->_sharedByMeRecursiveCount;
  if (sharedByMeRecursiveCount) {
    objc_msgSend(v3, "appendFormat:", @"sbm:%llu ", -[NSNumber unsignedLongLongValue](sharedByMeRecursiveCount, "unsignedLongLongValue"));
  }
  sharedAliasRecursiveCount = self->_sharedAliasRecursiveCount;
  if (sharedAliasRecursiveCount) {
    objc_msgSend(v3, "appendFormat:", @"stm:%llu ", -[NSNumber unsignedLongLongValue](sharedAliasRecursiveCount, "unsignedLongLongValue"));
  }
  childCount = self->_childCount;
  if (childCount) {
    objc_msgSend(v3, "appendFormat:", @"cc:%llu ", -[NSNumber unsignedLongLongValue](childCount, "unsignedLongLongValue"));
  }

  return v3;
}

- (NSNumber)quotaUsed
{
  return self->_quotaUsed;
}

- (void)setQuotaUsed:(id)a3
{
}

- (NSNumber)recursiveChildCount
{
  return self->_recursiveChildCount;
}

- (void)setRecursiveChildCount:(id)a3
{
}

- (NSNumber)sharedByMeRecursiveCount
{
  return self->_sharedByMeRecursiveCount;
}

- (void)setSharedByMeRecursiveCount:(id)a3
{
}

- (NSNumber)sharedAliasRecursiveCount
{
  return self->_sharedAliasRecursiveCount;
}

- (void)setSharedAliasRecursiveCount:(id)a3
{
}

- (NSNumber)childCount
{
  return self->_childCount;
}

- (void)setChildCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childCount, 0);
  objc_storeStrong((id *)&self->_sharedAliasRecursiveCount, 0);
  objc_storeStrong((id *)&self->_sharedByMeRecursiveCount, 0);
  objc_storeStrong((id *)&self->_recursiveChildCount, 0);

  objc_storeStrong((id *)&self->_quotaUsed, 0);
}

@end