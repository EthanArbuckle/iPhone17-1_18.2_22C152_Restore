@interface ASTSuite
+ (BOOL)supportsSecureCoding;
- (ASTSuite)initWithCoder:(id)a3;
- (ASTSuite)initWithId:(id)a3 suiteNameLocalizedString:(id)a4 suiteDescriptionLocalizedString:(id)a5 estimatedCompletionTimeLocalizedString:(id)a6 primaryAssetLocator:(id)a7 secondaryAssetLocator:(id)a8;
- (BOOL)isEqual:(id)a3;
- (NSNumber)suiteID;
- (NSString)estimatedCompletionTimeLocalizedString;
- (NSString)primaryAssetLocator;
- (NSString)secondaryAssetLocator;
- (NSString)suiteDescriptionLocalizedString;
- (NSString)suiteNameLocalizedString;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEstimatedCompletionTimeLocalizedString:(id)a3;
- (void)setPrimaryAssetLocator:(id)a3;
- (void)setSecondaryAssetLocator:(id)a3;
- (void)setSuiteDescriptionLocalizedString:(id)a3;
- (void)setSuiteID:(id)a3;
- (void)setSuiteNameLocalizedString:(id)a3;
@end

@implementation ASTSuite

- (ASTSuite)initWithId:(id)a3 suiteNameLocalizedString:(id)a4 suiteDescriptionLocalizedString:(id)a5 estimatedCompletionTimeLocalizedString:(id)a6 primaryAssetLocator:(id)a7 secondaryAssetLocator:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24.receiver = self;
    v24.super_class = (Class)ASTSuite;
    v20 = [(ASTSuite *)&v24 init];
    v21 = v20;
    if (v20)
    {
      [(ASTSuite *)v20 setSuiteID:v14];
      [(ASTSuite *)v21 setSuiteNameLocalizedString:v15];
      [(ASTSuite *)v21 setSuiteDescriptionLocalizedString:v16];
      [(ASTSuite *)v21 setEstimatedCompletionTimeLocalizedString:v17];
      [(ASTSuite *)v21 setPrimaryAssetLocator:v18];
      [(ASTSuite *)v21 setSecondaryAssetLocator:v19];
    }
    self = v21;
    v22 = self;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ASTSuite *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    char v8 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [(ASTSuite *)self suiteID];
    v7 = [(ASTSuite *)v5 suiteID];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
LABEL_5:
    char v8 = 0;
  }
LABEL_7:

  return v8;
}

- (unint64_t)hash
{
  v2 = [(ASTSuite *)self suiteID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (ASTSuite)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASTSuite *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suiteID"];
    suiteID = v5->_suiteID;
    v5->_suiteID = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suiteNameLocalizedString"];
    suiteNameLocalizedString = v5->_suiteNameLocalizedString;
    v5->_suiteNameLocalizedString = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suiteDescriptionLocalizedString"];
    suiteDescriptionLocalizedString = v5->_suiteDescriptionLocalizedString;
    v5->_suiteDescriptionLocalizedString = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"estimatedCompletionTimeLocalizedString"];
    estimatedCompletionTimeLocalizedString = v5->_estimatedCompletionTimeLocalizedString;
    v5->_estimatedCompletionTimeLocalizedString = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryAssetLocator"];
    primaryAssetLocator = v5->_primaryAssetLocator;
    v5->_primaryAssetLocator = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryAssetLocator"];
    secondaryAssetLocator = v5->_secondaryAssetLocator;
    v5->_secondaryAssetLocator = (NSString *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASTSuite *)self suiteID];
  [v4 encodeObject:v5 forKey:@"suiteID"];

  uint64_t v6 = [(ASTSuite *)self suiteNameLocalizedString];
  [v4 encodeObject:v6 forKey:@"suiteNameLocalizedString"];

  v7 = [(ASTSuite *)self suiteDescriptionLocalizedString];
  [v4 encodeObject:v7 forKey:@"suiteDescriptionLocalizedString"];

  uint64_t v8 = [(ASTSuite *)self estimatedCompletionTimeLocalizedString];
  [v4 encodeObject:v8 forKey:@"estimatedCompletionTimeLocalizedString"];

  v9 = [(ASTSuite *)self primaryAssetLocator];
  [v4 encodeObject:v9 forKey:@"primaryAssetLocator"];

  id v10 = [(ASTSuite *)self secondaryAssetLocator];
  [v4 encodeObject:v10 forKey:@"secondaryAssetLocator"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)suiteID
{
  return self->_suiteID;
}

- (void)setSuiteID:(id)a3
{
}

- (NSString)suiteNameLocalizedString
{
  return self->_suiteNameLocalizedString;
}

- (void)setSuiteNameLocalizedString:(id)a3
{
}

- (NSString)suiteDescriptionLocalizedString
{
  return self->_suiteDescriptionLocalizedString;
}

- (void)setSuiteDescriptionLocalizedString:(id)a3
{
}

- (NSString)estimatedCompletionTimeLocalizedString
{
  return self->_estimatedCompletionTimeLocalizedString;
}

- (void)setEstimatedCompletionTimeLocalizedString:(id)a3
{
}

- (NSString)primaryAssetLocator
{
  return self->_primaryAssetLocator;
}

- (void)setPrimaryAssetLocator:(id)a3
{
}

- (NSString)secondaryAssetLocator
{
  return self->_secondaryAssetLocator;
}

- (void)setSecondaryAssetLocator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryAssetLocator, 0);
  objc_storeStrong((id *)&self->_primaryAssetLocator, 0);
  objc_storeStrong((id *)&self->_estimatedCompletionTimeLocalizedString, 0);
  objc_storeStrong((id *)&self->_suiteDescriptionLocalizedString, 0);
  objc_storeStrong((id *)&self->_suiteNameLocalizedString, 0);

  objc_storeStrong((id *)&self->_suiteID, 0);
}

@end