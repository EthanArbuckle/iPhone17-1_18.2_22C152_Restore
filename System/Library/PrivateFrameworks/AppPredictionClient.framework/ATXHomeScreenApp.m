@interface ATXHomeScreenApp
+ (BOOL)supportsSecureCoding;
- (ATXHomeScreenApp)initWithBundleId:(id)a3;
- (ATXHomeScreenApp)initWithBundleId:(id)a3 predictionSource:(id)a4;
- (ATXHomeScreenApp)initWithBundleId:(id)a3 predictionSource:(id)a4 score:(double)a5;
- (ATXHomeScreenApp)initWithBundleId:(id)a3 predictionSource:(id)a4 score:(double)a5 uniqueDaysLaunched:(unint64_t)a6 rawLaunchCount:(unint64_t)a7;
- (ATXHomeScreenApp)initWithCoder:(id)a3;
- (ATXHomeScreenPage)page;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXHomeScreenApp:(id)a3;
- (NSString)bundleId;
- (NSString)description;
- (NSString)predictionSource;
- (double)score;
- (id)dictionaryRepresentationForIntrospection;
- (unint64_t)hash;
- (unint64_t)numAppLaunches;
- (unint64_t)numUniqueDays;
- (void)encodeWithCoder:(id)a3;
- (void)setPage:(id)a3;
- (void)setPredictionSource:(id)a3;
@end

@implementation ATXHomeScreenApp

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHomeScreenApp)initWithBundleId:(id)a3
{
  return [(ATXHomeScreenApp *)self initWithBundleId:a3 predictionSource:0];
}

- (ATXHomeScreenApp)initWithBundleId:(id)a3 predictionSource:(id)a4
{
  return [(ATXHomeScreenApp *)self initWithBundleId:a3 predictionSource:a4 score:0.0];
}

- (ATXHomeScreenApp)initWithBundleId:(id)a3 predictionSource:(id)a4 score:(double)a5
{
  return [(ATXHomeScreenApp *)self initWithBundleId:a3 predictionSource:a4 score:0 uniqueDaysLaunched:0 rawLaunchCount:a5];
}

- (ATXHomeScreenApp)initWithBundleId:(id)a3 predictionSource:(id)a4 score:(double)a5 uniqueDaysLaunched:(unint64_t)a6 rawLaunchCount:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ATXHomeScreenApp;
  v14 = [(ATXHomeScreenApp *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    bundleId = v14->_bundleId;
    v14->_bundleId = (NSString *)v15;

    uint64_t v17 = [v13 copy];
    predictionSource = v14->_predictionSource;
    v14->_predictionSource = (NSString *)v17;

    v14->_score = a5;
    v14->_numUniqueDays = a6;
    v14->_numAppLaunches = a7;
  }

  return v14;
}

- (unint64_t)hash
{
  return [(NSString *)self->_bundleId hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXHomeScreenApp *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXHomeScreenApp *)self isEqualToATXHomeScreenApp:v5];

  return v6;
}

- (NSString)description
{
  return self->_bundleId;
}

- (BOOL)isEqualToATXHomeScreenApp:(id)a3
{
  v4 = self->_bundleId;
  v5 = v4;
  if (v4 == *((NSString **)a3 + 1)) {
    char v6 = 1;
  }
  else {
    char v6 = -[NSString isEqual:](v4, "isEqual:");
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  bundleId = self->_bundleId;
  id v5 = a3;
  [v5 encodeObject:bundleId forKey:@"bundleId"];
  [v5 encodeObject:self->_predictionSource forKey:@"predictionSource"];
  [v5 encodeDouble:@"score" forKey:self->_score];
  [v5 encodeInteger:self->_numUniqueDays forKey:@"numUniqueDays"];
  [v5 encodeInteger:self->_numAppLaunches forKey:@"numAppLaunches"];
}

- (ATXHomeScreenApp)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXHomeScreenApp;
  id v5 = [(ATXHomeScreenApp *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predictionSource"];
    predictionSource = v5->_predictionSource;
    v5->_predictionSource = (NSString *)v8;

    [v4 decodeDoubleForKey:@"score"];
    v5->_score = v10;
    v5->_numUniqueDays = [v4 decodeIntegerForKey:@"numUniqueDays"];
    v5->_numAppLaunches = [v4 decodeIntegerForKey:@"numAppLaunches"];
  }

  return v5;
}

- (id)dictionaryRepresentationForIntrospection
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v9[0] = @"bundleId";
  v9[1] = @"predictionSource";
  predictionSource = (__CFString *)self->_predictionSource;
  if (!predictionSource) {
    predictionSource = @"<nil>";
  }
  v10[0] = self->_bundleId;
  v10[1] = predictionSource;
  v9[2] = @"score";
  id v4 = [NSNumber numberWithDouble:self->_score];
  v10[2] = v4;
  v9[3] = @"numUniqueDays";
  id v5 = [NSNumber numberWithUnsignedInteger:self->_numUniqueDays];
  v10[3] = v5;
  v9[4] = @"numAppLaunches";
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_numAppLaunches];
  v10[4] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)predictionSource
{
  return self->_predictionSource;
}

- (void)setPredictionSource:(id)a3
{
}

- (double)score
{
  return self->_score;
}

- (unint64_t)numUniqueDays
{
  return self->_numUniqueDays;
}

- (unint64_t)numAppLaunches
{
  return self->_numAppLaunches;
}

- (ATXHomeScreenPage)page
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);

  return (ATXHomeScreenPage *)WeakRetained;
}

- (void)setPage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_page);
  objc_storeStrong((id *)&self->_predictionSource, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end