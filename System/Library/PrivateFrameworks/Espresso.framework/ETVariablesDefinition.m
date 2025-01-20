@interface ETVariablesDefinition
- (NSArray)layerNames;
- (id)initForLayers:(id)a3 error:(id *)a4;
- (void)setLayerNames:(id)a3;
@end

@implementation ETVariablesDefinition

- (void).cxx_destruct
{
}

- (void)setLayerNames:(id)a3
{
}

- (NSArray)layerNames
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (id)initForLayers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ETVariablesDefinition;
  v7 = [(ETVariablesDefinition *)&v10 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_layerNames, a3);
  }

  return v8;
}

@end