@interface CLSInvestigationHelperSceneNodeLevelAndWeight
- (CLSInvestigationHelperSceneNodeLevelAndWeight)initWithTaxonomyNode:(id)a3 level:(unint64_t)a4 andWeight:(double)a5;
- (PFSceneTaxonomyNode)taxonomyNode;
- (double)weight;
- (unint64_t)level;
@end

@implementation CLSInvestigationHelperSceneNodeLevelAndWeight

- (void).cxx_destruct
{
}

- (double)weight
{
  return self->_weight;
}

- (unint64_t)level
{
  return self->_level;
}

- (PFSceneTaxonomyNode)taxonomyNode
{
  return (PFSceneTaxonomyNode *)objc_getProperty(self, a2, 8, 1);
}

- (CLSInvestigationHelperSceneNodeLevelAndWeight)initWithTaxonomyNode:(id)a3 level:(unint64_t)a4 andWeight:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLSInvestigationHelperSceneNodeLevelAndWeight;
  v10 = [(CLSInvestigationHelperSceneNodeLevelAndWeight *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_taxonomyNode, a3);
    v11->_level = a4;
    v11->_weight = a5;
  }

  return v11;
}

@end