@interface SGSearchableItemIdTriple
+ (SGSearchableItemIdTriple)searchableItemIdTripleWithBundleId:(id)a3 domainId:(id)a4 uniqueId:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSearchableItemIdTriple:(id)a3;
- (NSString)bundleId;
- (NSString)domainId;
- (NSString)uniqueId;
- (SGSearchableItemIdTriple)initWithBundleId:(id)a3 domainId:(id)a4 uniqueId:(id)a5;
- (unint64_t)hash;
@end

@implementation SGSearchableItemIdTriple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (NSString)domainId
{
  return self->_domainId;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  NSUInteger v4 = [(NSString *)self->_domainId hash] - v3 + 32 * v3;
  return [(NSString *)self->_uniqueId hash] - v4 + 32 * v4;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (SGSearchableItemIdTriple *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGSearchableItemIdTriple *)self isEqualToSearchableItemIdTriple:v5];

  return v6;
}

- (BOOL)isEqualToSearchableItemIdTriple:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  int v6 = self->_bundleId != 0;
  v7 = [v4 bundleId];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_11;
  }
  bundleId = self->_bundleId;
  if (bundleId)
  {
    v10 = [v5 bundleId];
    int v11 = [(NSString *)bundleId isEqual:v10];

    if (!v11) {
      goto LABEL_11;
    }
  }
  int v12 = self->_domainId != 0;
  v13 = [v5 domainId];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_11;
  }
  domainId = self->_domainId;
  if (domainId)
  {
    v16 = [v5 domainId];
    int v17 = [(NSString *)domainId isEqual:v16];

    if (!v17) {
      goto LABEL_11;
    }
  }
  int v18 = self->_uniqueId != 0;
  v19 = [v5 uniqueId];
  int v20 = v19 == 0;

  if (v18 == v20)
  {
LABEL_11:
    char v23 = 0;
  }
  else
  {
    uniqueId = self->_uniqueId;
    if (uniqueId)
    {
      v22 = [v5 uniqueId];
      char v23 = [(NSString *)uniqueId isEqual:v22];
    }
    else
    {
      char v23 = 1;
    }
  }

  return v23;
}

- (SGSearchableItemIdTriple)initWithBundleId:(id)a3 domainId:(id)a4 uniqueId:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (v10)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    int v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SGSearchableItemIdTriple.m", 11, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  int v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"SGSearchableItemIdTriple.m", 12, @"Invalid parameter not satisfying: %@", @"uniqueId" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)SGSearchableItemIdTriple;
  int v14 = [(SGSearchableItemIdTriple *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_bundleId, a3);
    objc_storeStrong((id *)&v15->_domainId, a4);
    objc_storeStrong((id *)&v15->_uniqueId, a5);
  }

  return v15;
}

+ (SGSearchableItemIdTriple)searchableItemIdTripleWithBundleId:(id)a3 domainId:(id)a4 uniqueId:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithBundleId:v10 domainId:v9 uniqueId:v8];

  return (SGSearchableItemIdTriple *)v11;
}

@end