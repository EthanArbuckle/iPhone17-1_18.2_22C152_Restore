@interface GEOClientRankingFeatureUnit
- (GEOClientRankingFeatureUnit)initWithFeatureType:(id)a3 function:(id)a4;
- (GEOClientRankingFeatureUnit)initWithSource:(id)a3 function:(id)a4;
- (GEOClientRankingModelFeatureFunction)function;
- (GEOClientRankingModelFeatureSourceIdentifier)source;
- (GEOClientRankingModelFeatureTypeIdentifier)feature;
- (int64_t)featureType;
@end

@implementation GEOClientRankingFeatureUnit

- (GEOClientRankingFeatureUnit)initWithSource:(id)a3 function:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOClientRankingFeatureUnit;
  v9 = [(GEOClientRankingFeatureUnit *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_source, a3);
    v10->_featureType = 1;
    objc_storeStrong((id *)&v10->_function, a4);
  }

  return v10;
}

- (GEOClientRankingFeatureUnit)initWithFeatureType:(id)a3 function:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOClientRankingFeatureUnit;
  v9 = [(GEOClientRankingFeatureUnit *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_feature, a3);
    v10->_featureType = 2;
    objc_storeStrong((id *)&v10->_function, a4);
  }

  return v10;
}

- (int64_t)featureType
{
  return self->_featureType;
}

- (GEOClientRankingModelFeatureSourceIdentifier)source
{
  return self->_source;
}

- (GEOClientRankingModelFeatureTypeIdentifier)feature
{
  return self->_feature;
}

- (GEOClientRankingModelFeatureFunction)function
{
  return self->_function;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_function, 0);
  objc_storeStrong((id *)&self->_feature, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

@end