@interface ARKeyframeList
- (CV3DReconKeyframeList)keyframeList;
- (NSSet)removedAnchors;
- (NSSet)updatedAnchors;
- (double)timestamp;
- (void)dealloc;
- (void)setKeyframeList:(CV3DReconKeyframeList *)a3 updatedAnchors:(id)a4 removedAnchors:(id)a5 timestamp:(double)a6;
- (void)setRemovedAnchors:(id)a3;
- (void)setUpdatedAnchors:(id)a3;
@end

@implementation ARKeyframeList

- (void)setKeyframeList:(CV3DReconKeyframeList *)a3 updatedAnchors:(id)a4 removedAnchors:(id)a5 timestamp:(double)a6
{
  id v11 = a4;
  id v10 = a5;
  if (self->_keyframeList) {
    CV3DReconKeyframeListRelease();
  }
  self->_timestamp = a6;
  self->_keyframeList = a3;
  [(ARKeyframeList *)self setUpdatedAnchors:v11];
  [(ARKeyframeList *)self setRemovedAnchors:v10];
  if (self->_keyframeList) {
    CV3DReconKeyframeListRetain();
  }
}

- (void)dealloc
{
  CV3DReconKeyframeListRelease();
  v3.receiver = self;
  v3.super_class = (Class)ARKeyframeList;
  [(ARKeyframeList *)&v3 dealloc];
}

- (double)timestamp
{
  return self->_timestamp;
}

- (CV3DReconKeyframeList)keyframeList
{
  return self->_keyframeList;
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