@interface BWSubjectRelightingInferences
- (NSArray)lowResPersonInstanceBoundingBoxes;
- (NSArray)lowResPersonInstanceConfidences;
- (NSArray)lowResPersonInstanceMasks;
- (NSArray)skinToneClassificationsForFaces;
- (__CVBuffer)personMask;
- (__CVBuffer)skinMask;
- (void)dealloc;
- (void)setLowResPersonInstanceBoundingBoxes:(id)a3;
- (void)setLowResPersonInstanceConfidences:(id)a3;
- (void)setLowResPersonInstanceMasks:(id)a3;
- (void)setPersonMask:(__CVBuffer *)a3;
- (void)setSkinMask:(__CVBuffer *)a3;
- (void)setSkinToneClassificationsForFaces:(id)a3;
@end

@implementation BWSubjectRelightingInferences

- (void)dealloc
{
  skinMask = self->_skinMask;
  if (skinMask) {
    CFRelease(skinMask);
  }
  personMask = self->_personMask;
  if (personMask) {
    CFRelease(personMask);
  }

  v5.receiver = self;
  v5.super_class = (Class)BWSubjectRelightingInferences;
  [(BWSubjectRelightingInferences *)&v5 dealloc];
}

- (__CVBuffer)skinMask
{
  return self->_skinMask;
}

- (void)setSkinMask:(__CVBuffer *)a3
{
}

- (__CVBuffer)personMask
{
  return self->_personMask;
}

- (void)setPersonMask:(__CVBuffer *)a3
{
}

- (NSArray)lowResPersonInstanceMasks
{
  return self->_lowResPersonInstanceMasks;
}

- (void)setLowResPersonInstanceMasks:(id)a3
{
}

- (NSArray)lowResPersonInstanceConfidences
{
  return self->_lowResPersonInstanceConfidences;
}

- (void)setLowResPersonInstanceConfidences:(id)a3
{
}

- (NSArray)lowResPersonInstanceBoundingBoxes
{
  return self->_lowResPersonInstanceBoundingBoxes;
}

- (void)setLowResPersonInstanceBoundingBoxes:(id)a3
{
}

- (NSArray)skinToneClassificationsForFaces
{
  return self->_skinToneClassificationsForFaces;
}

- (void)setSkinToneClassificationsForFaces:(id)a3
{
}

@end