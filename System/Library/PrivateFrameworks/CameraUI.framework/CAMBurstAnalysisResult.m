@interface CAMBurstAnalysisResult
- (CAMBurstAnalysisResult)init;
- (CAMBurstAnalysisResult)initWithIdentifier:(id)a3 allAssetIdentifiers:(id)a4 goodAssetIdentifiers:(id)a5 bestAssetIdentifier:(id)a6;
- (NSArray)allAssetIdentifiers;
- (NSArray)goodAssetIdentifiers;
- (NSString)bestAssetIdentifier;
- (NSString)identifier;
- (id)description;
@end

@implementation CAMBurstAnalysisResult

- (CAMBurstAnalysisResult)init
{
  return [(CAMBurstAnalysisResult *)self initWithIdentifier:0 allAssetIdentifiers:0 goodAssetIdentifiers:0 bestAssetIdentifier:0];
}

- (CAMBurstAnalysisResult)initWithIdentifier:(id)a3 allAssetIdentifiers:(id)a4 goodAssetIdentifiers:(id)a5 bestAssetIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CAMBurstAnalysisResult;
  v14 = [(CAMBurstAnalysisResult *)&v25 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    allAssetIdentifiers = v14->_allAssetIdentifiers;
    v14->_allAssetIdentifiers = (NSArray *)v17;

    uint64_t v19 = [v12 copy];
    goodAssetIdentifiers = v14->_goodAssetIdentifiers;
    v14->_goodAssetIdentifiers = (NSArray *)v19;

    uint64_t v21 = [v13 copy];
    bestAssetIdentifier = v14->_bestAssetIdentifier;
    v14->_bestAssetIdentifier = (NSString *)v21;

    v23 = v14;
  }

  return v14;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CAMBurstAnalysisResult *)self identifier];
  v6 = [(CAMBurstAnalysisResult *)self allAssetIdentifiers];
  v7 = [(CAMBurstAnalysisResult *)self goodAssetIdentifiers];
  v8 = [(CAMBurstAnalysisResult *)self bestAssetIdentifier];
  v9 = [v3 stringWithFormat:@"<%@ identifier:%@, allAssetIidentifiers:%@, goodAssetIdentifiers:%@, bestAssetIdentifiers:%@>", v4, v5, v6, v7, v8];

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)allAssetIdentifiers
{
  return self->_allAssetIdentifiers;
}

- (NSArray)goodAssetIdentifiers
{
  return self->_goodAssetIdentifiers;
}

- (NSString)bestAssetIdentifier
{
  return self->_bestAssetIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bestAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_goodAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_allAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end