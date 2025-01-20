@interface MADVITextLookupResult
+ (BOOL)supportsSecureCoding;
- (MADVITextLookupResult)initWithCoder:(id)a3;
- (MADVITextLookupResult)initWithSearchSections:(id)a3;
- (NSArray)searchSections;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADVITextLookupResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVITextLookupResult)initWithSearchSections:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADVITextLookupResult;
  v6 = [(MADResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_searchSections, a3);
  }

  return v7;
}

- (MADVITextLookupResult)initWithCoder:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MADVITextLookupResult;
  id v5 = [(MADResult *)&v14 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v20[0] = objc_opt_class();
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v7 = (void *)getSFResultSectionClass_softClass;
    uint64_t v19 = getSFResultSectionClass_softClass;
    if (!getSFResultSectionClass_softClass)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __getSFResultSectionClass_block_invoke;
      v15[3] = &unk_1E6CAD0C8;
      v15[4] = &v16;
      __getSFResultSectionClass_block_invoke((uint64_t)v15);
      v7 = (void *)v17[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v16, 8);
    v20[1] = objc_opt_class();
    objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    v10 = [v6 setWithArray:v9];

    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"SearchSections"];
    searchSections = v5->_searchSections;
    v5->_searchSections = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADVITextLookupResult;
  id v4 = a3;
  [(MADResult *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchSections, @"SearchSections", v5.receiver, v5.super_class);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"searchSections:\n"];
  if ([(NSArray *)self->_searchSections count])
  {
    unint64_t v6 = 0;
    v33 = self;
    do
    {
      context = (void *)MEMORY[0x1E01AAD10]();
      unint64_t v35 = v6;
      v7 = [(NSArray *)self->_searchSections objectAtIndexedSubscript:v6];
      [v3 appendFormat:@"<results:["];
      id v8 = [v7 results];
      uint64_t v9 = [v8 count];

      if (v9)
      {
        unint64_t v10 = 0;
        do
        {
          uint64_t v11 = (void *)MEMORY[0x1E01AAD10]();
          v12 = [v7 results];
          v13 = [v12 objectAtIndexedSubscript:v10];
          objc_super v14 = [v13 description];
          [v3 appendFormat:@"%@ ", v14];

          v15 = [v7 results];
          uint64_t v16 = [v15 objectAtIndexedSubscript:v10];
          v17 = [v16 title];
          uint64_t v18 = [v17 text];
          [v3 appendFormat:@"(title: %@)", v18];

          uint64_t v19 = [v7 results];
          unint64_t v20 = [v19 count] - 1;

          if (v10 < v20) {
            [v3 appendFormat:@", "];
          }
          ++v10;
          v21 = [v7 results];
          unint64_t v22 = [v21 count];
        }
        while (v10 < v22);
      }
      [v3 appendFormat:@"] "];
      objc_msgSend(v3, "appendFormat:", @"maxInitiallyVisibleResults:%lu ", objc_msgSend(v7, "maxInitiallyVisibleResults"));
      int v23 = [v7 isInitiallyHidden];
      v24 = @"NO";
      if (v23) {
        v24 = @"YES";
      }
      [v3 appendFormat:@"isInitiallyHidden:%@ ", v24];
      v25 = [v7 identifier];
      [v3 appendFormat:@"identifier:%@ ", v25];

      v26 = [v7 bundleIdentifier];
      [v3 appendFormat:@"bundleIdentifier:%@ ", v26];

      v27 = [v7 title];
      [v3 appendFormat:@"title:%@ ", v27];

      v28 = [v7 moreText];
      [v3 appendFormat:@"moreText:%@ ", v28];

      v29 = [v7 button];
      v30 = [v29 description];
      [v3 appendFormat:@"button:%@ ", v30];

      [v7 rankingScore];
      objc_msgSend(v3, "appendFormat:", @"rankingScore:%lf>", v31);
      self = v33;
      if (v35 < [(NSArray *)v33->_searchSections count] - 1) {
        [v3 appendFormat:@",\n"];
      }

      unint64_t v6 = v35 + 1;
    }
    while (v35 + 1 < [(NSArray *)v33->_searchSections count]);
  }
  [v3 appendFormat:@">"];
  return v3;
}

- (NSArray)searchSections
{
  return self->_searchSections;
}

- (void).cxx_destruct
{
}

@end