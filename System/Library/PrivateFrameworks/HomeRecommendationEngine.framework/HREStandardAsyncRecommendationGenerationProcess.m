@interface HREStandardAsyncRecommendationGenerationProcess
- (BOOL)shouldGenerateRecommendations;
- (HFAccessoryTypeGroup)typeGroup;
- (HFMatterSnapshotContainer)snapshotContainer;
- (HMHome)home;
- (HREStandardAsyncRecommendationGenerationProcess)initWithHome:(id)a3 sourceItems:(id)a4 accessoryTypeGroup:(id)a5 options:(unint64_t)a6;
- (NSSet)homeRecommendableObjects;
- (NSSet)sourceItems;
- (NSSet)sourceRecommendableObjects;
- (id)generateRecommendations;
- (unint64_t)options;
- (void)setHome:(id)a3;
- (void)setHomeRecommendableObjects:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setSnapshotContainer:(id)a3;
- (void)setSourceItems:(id)a3;
- (void)setSourceRecommendableObjects:(id)a3;
- (void)setTypeGroup:(id)a3;
@end

@implementation HREStandardAsyncRecommendationGenerationProcess

- (HREStandardAsyncRecommendationGenerationProcess)initWithHome:(id)a3 sourceItems:(id)a4 accessoryTypeGroup:(id)a5 options:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HREStandardAsyncRecommendationGenerationProcess;
  v14 = [(HREStandardAsyncRecommendationGenerationProcess *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_home, a3);
    uint64_t v16 = [MEMORY[0x263EFFA08] setWithArray:v12];
    sourceItems = v15->_sourceItems;
    v15->_sourceItems = (NSSet *)v16;

    objc_storeStrong((id *)&v15->_typeGroup, a5);
    v15->_options = a6;
  }

  return v15;
}

- (BOOL)shouldGenerateRecommendations
{
  v3 = [(HREStandardAsyncRecommendationGenerationProcess *)self sourceItems];
  if ([v3 count])
  {
    v4 = [(HREStandardAsyncRecommendationGenerationProcess *)self sourceRecommendableObjects];
    uint64_t v5 = [v4 count];

    if (!v5) {
      return 0;
    }
  }
  else
  {
  }
  uint64_t v7 = [(HREStandardAsyncRecommendationGenerationProcess *)self typeGroup];
  if (!v7) {
    return 1;
  }
  v8 = (void *)v7;
  v9 = [(HREStandardAsyncRecommendationGenerationProcess *)self sourceRecommendableObjects];
  BOOL v6 = [v9 count] != 0;

  return v6;
}

- (id)generateRecommendations
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HREStandardAsyncRecommendationSource.m", 207, @"%s is an abstract method that must be overriden by subclass %@", "-[HREStandardAsyncRecommendationGenerationProcess generateRecommendations]", objc_opt_class() object file lineNumber description];

  uint64_t v5 = objc_opt_new();

  return v5;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (NSSet)sourceItems
{
  return self->_sourceItems;
}

- (void)setSourceItems:(id)a3
{
}

- (HFAccessoryTypeGroup)typeGroup
{
  return self->_typeGroup;
}

- (void)setTypeGroup:(id)a3
{
}

- (NSSet)sourceRecommendableObjects
{
  return self->_sourceRecommendableObjects;
}

- (void)setSourceRecommendableObjects:(id)a3
{
}

- (NSSet)homeRecommendableObjects
{
  return self->_homeRecommendableObjects;
}

- (void)setHomeRecommendableObjects:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (HFMatterSnapshotContainer)snapshotContainer
{
  return self->_snapshotContainer;
}

- (void)setSnapshotContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotContainer, 0);
  objc_storeStrong((id *)&self->_homeRecommendableObjects, 0);
  objc_storeStrong((id *)&self->_sourceRecommendableObjects, 0);
  objc_storeStrong((id *)&self->_typeGroup, 0);
  objc_storeStrong((id *)&self->_sourceItems, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end