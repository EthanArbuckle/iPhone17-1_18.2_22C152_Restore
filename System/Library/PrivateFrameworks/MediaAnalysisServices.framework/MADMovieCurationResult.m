@interface MADMovieCurationResult
+ (BOOL)supportsSecureCoding;
+ (id)resultWithSummaryEntries:(id)a3 highlightEntries:(id)a4 curationScoreEntries:(id)a5;
- (MADMovieCurationResult)initWithCoder:(id)a3;
- (MADMovieCurationResult)initWithSummaryEntries:(id)a3 highlightEntries:(id)a4 curationScoreEntries:(id)a5;
- (NSArray)curationScoreEntries;
- (NSArray)highlightEntries;
- (NSArray)summaryEntries;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADMovieCurationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMovieCurationResult)initWithSummaryEntries:(id)a3 highlightEntries:(id)a4 curationScoreEntries:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MADMovieCurationResult;
  v12 = [(MADResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_summaryEntries, a3);
    objc_storeStrong((id *)&v13->_highlightEntries, a4);
    objc_storeStrong((id *)&v13->_curationScoreEntries, a5);
  }

  return v13;
}

+ (id)resultWithSummaryEntries:(id)a3 highlightEntries:(id)a4 curationScoreEntries:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)[objc_alloc((Class)a1) initWithSummaryEntries:v8 highlightEntries:v9 curationScoreEntries:v10];

  return v11;
}

- (MADMovieCurationResult)initWithCoder:(id)a3
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MADMovieCurationResult;
  v5 = [(MADResult *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
    id v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"CurationScoreEntries"];
    curationScoreEntries = v5->_curationScoreEntries;
    v5->_curationScoreEntries = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClasses:v8 forKey:@"HighlightEntries"];
    highlightEntries = v5->_highlightEntries;
    v5->_highlightEntries = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClasses:v8 forKey:@"SummaryEntries"];
    summaryEntries = v5->_summaryEntries;
    v5->_summaryEntries = (NSArray *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADMovieCurationResult;
  [(MADResult *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_curationScoreEntries forKey:@"CurationScoreEntries"];
  [v4 encodeObject:self->_highlightEntries forKey:@"HighlightEntries"];
  [v4 encodeObject:self->_summaryEntries forKey:@"SummaryEntries"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"%@: %lu count, ", @"SummaryEntries", -[NSArray count](self->_summaryEntries, "count")];
  [v3 appendFormat:@"%@: %lu count, ", @"HighlightEntries", -[NSArray count](self->_highlightEntries, "count")];
  [v3 appendFormat:@"%@: %lu count>", @"CurationScoreEntries", -[NSArray count](self->_curationScoreEntries, "count")];
  return v3;
}

- (NSArray)curationScoreEntries
{
  return self->_curationScoreEntries;
}

- (NSArray)highlightEntries
{
  return self->_highlightEntries;
}

- (NSArray)summaryEntries
{
  return self->_summaryEntries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryEntries, 0);
  objc_storeStrong((id *)&self->_highlightEntries, 0);
  objc_storeStrong((id *)&self->_curationScoreEntries, 0);
}

@end