@interface ARMeshList
- (CV3DReconMeshList)meshList;
- (NSSet)removedAnchors;
- (NSSet)updatedAnchors;
- (double)timestamp;
- (void)dealloc;
- (void)setMeshList:(CV3DReconMeshList *)a3 updatedAnchors:(id)a4 removedAnchors:(id)a5 timestamp:(double)a6;
- (void)setRemovedAnchors:(id)a3;
- (void)setUpdatedAnchors:(id)a3;
@end

@implementation ARMeshList

- (void)setMeshList:(CV3DReconMeshList *)a3 updatedAnchors:(id)a4 removedAnchors:(id)a5 timestamp:(double)a6
{
  id v11 = a4;
  id v10 = a5;
  if (self->_meshList) {
    CV3DReconMeshListRelease();
  }
  self->_timestamp = a6;
  self->_meshList = a3;
  [(ARMeshList *)self setUpdatedAnchors:v11];
  [(ARMeshList *)self setRemovedAnchors:v10];
  if (self->_meshList) {
    CV3DReconMeshListRetain();
  }
}

- (void)dealloc
{
  CV3DReconMeshListRelease();
  v3.receiver = self;
  v3.super_class = (Class)ARMeshList;
  [(ARMeshList *)&v3 dealloc];
}

- (double)timestamp
{
  return self->_timestamp;
}

- (CV3DReconMeshList)meshList
{
  return self->_meshList;
}

- (NSSet)updatedAnchors
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUpdatedAnchors:(id)a3
{
}

- (NSSet)removedAnchors
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRemovedAnchors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedAnchors, 0);
  objc_storeStrong((id *)&self->_updatedAnchors, 0);
}

@end