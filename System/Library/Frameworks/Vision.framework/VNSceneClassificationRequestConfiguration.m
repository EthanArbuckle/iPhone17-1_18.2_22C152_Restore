@interface VNSceneClassificationRequestConfiguration
- (VNClassificationCustomHierarchy)customHierarchy;
- (VNSceneClassificationRequestConfiguration)initWithRequestClass:(Class)a3;
- (VNSceneObservation)sceneObservation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)maximumHierarchicalObservations;
- (unint64_t)maximumLeafObservations;
- (void)setCustomHierarchy:(id)a3;
- (void)setMaximumHierarchicalObservations:(unint64_t)a3;
- (void)setMaximumLeafObservations:(unint64_t)a3;
- (void)setSceneObservation:(id)a3;
@end

@implementation VNSceneClassificationRequestConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customHierarchy, 0);

  objc_storeStrong((id *)&self->_sceneObservation, 0);
}

- (void)setMaximumHierarchicalObservations:(unint64_t)a3
{
  self->_maximumHierarchicalObservations = a3;
}

- (unint64_t)maximumHierarchicalObservations
{
  return self->_maximumHierarchicalObservations;
}

- (void)setMaximumLeafObservations:(unint64_t)a3
{
  self->_maximumLeafObservations = a3;
}

- (unint64_t)maximumLeafObservations
{
  return self->_maximumLeafObservations;
}

- (void)setCustomHierarchy:(id)a3
{
}

- (VNClassificationCustomHierarchy)customHierarchy
{
  return self->_customHierarchy;
}

- (void)setSceneObservation:(id)a3
{
}

- (VNSceneObservation)sceneObservation
{
  return self->_sceneObservation;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v10.receiver = self;
  v10.super_class = (Class)VNSceneClassificationRequestConfiguration;
  v4 = [(VNRequestConfiguration *)&v10 description];
  [v3 appendString:v4];

  uint64_t v5 = [(VNSceneClassificationRequestConfiguration *)self sceneObservation];
  v6 = (void *)v5;
  if (v5) {
    [v3 appendFormat:@" %@", v5];
  }
  objc_msgSend(v3, "appendFormat:", @" leaf=%lu hierarchy=%lu", -[VNSceneClassificationRequestConfiguration maximumLeafObservations](self, "maximumLeafObservations"), -[VNSceneClassificationRequestConfiguration maximumHierarchicalObservations](self, "maximumHierarchicalObservations"));
  uint64_t v7 = [(VNSceneClassificationRequestConfiguration *)self customHierarchy];
  v8 = (void *)v7;
  if (v7) {
    [v3 appendFormat:@" %@", v7];
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNSceneClassificationRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v7 copyWithZone:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 setSceneObservation:self->_sceneObservation];
    [v5 setCustomHierarchy:self->_customHierarchy];
    [v5 setMaximumLeafObservations:self->_maximumLeafObservations];
    [v5 setMaximumHierarchicalObservations:self->_maximumHierarchicalObservations];
  }
  return v5;
}

- (VNSceneClassificationRequestConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNSceneClassificationRequestConfiguration;
  result = [(VNImageBasedRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result)
  {
    result->_maximumLeafObservations = 5;
    result->_maximumHierarchicalObservations = 5;
  }
  return result;
}

@end