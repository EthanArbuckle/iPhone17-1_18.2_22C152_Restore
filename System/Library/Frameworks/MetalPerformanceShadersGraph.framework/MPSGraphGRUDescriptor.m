@interface MPSGraphGRUDescriptor
+ (MPSGraphGRUDescriptor)descriptor;
- (BOOL)bidirectional;
- (BOOL)flipZ;
- (BOOL)resetAfter;
- (BOOL)resetGateFirst;
- (BOOL)reverse;
- (BOOL)training;
- (MPSGraphRNNActivation)outputGateActivation;
- (MPSGraphRNNActivation)resetGateActivation;
- (MPSGraphRNNActivation)updateGateActivation;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBidirectional:(BOOL)bidirectional;
- (void)setFlipZ:(BOOL)flipZ;
- (void)setOutputGateActivation:(MPSGraphRNNActivation)outputGateActivation;
- (void)setResetAfter:(BOOL)resetAfter;
- (void)setResetGateActivation:(MPSGraphRNNActivation)resetGateActivation;
- (void)setResetGateFirst:(BOOL)resetGateFirst;
- (void)setReverse:(BOOL)reverse;
- (void)setTraining:(BOOL)training;
- (void)setUpdateGateActivation:(MPSGraphRNNActivation)updateGateActivation;
@end

@implementation MPSGraphGRUDescriptor

+ (MPSGraphGRUDescriptor)descriptor
{
  v2 = objc_alloc_init(MPSGraphGRUDescriptor);
  v2->_reverse = 0;
  v2->_training = 0;
  v2->_bidirectional = 0;
  v2->_hasMask = 0;
  v2->_hasInitState = 0;
  v2->_hasBias2 = 0;
  v2->_resetGateActivation = 3;
  v2->_updateGateActivation = 3;
  v2->_outputGateActivation = 2;
  v2->_resetGateFirst = 0;
  v2->_resetAfter = 0;
  v2->_flipZ = 0;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [MPSGraphGRUDescriptor alloc];
  *((unsigned char *)result + 11) = self->_reverse;
  *((unsigned char *)result + 12) = self->_training;
  *((unsigned char *)result + 13) = self->_bidirectional;
  *((unsigned char *)result + 8) = self->_hasMask;
  *((unsigned char *)result + 9) = self->_hasInitState;
  *((unsigned char *)result + 10) = self->_hasBias2;
  *((void *)result + 3) = self->_resetGateActivation;
  *((void *)result + 4) = self->_updateGateActivation;
  *((void *)result + 5) = self->_outputGateActivation;
  *((unsigned char *)result + 15) = self->_resetGateFirst;
  *((unsigned char *)result + 14) = self->_resetAfter;
  *((unsigned char *)result + 16) = self->_flipZ;
  return result;
}

- (BOOL)reverse
{
  return self->_reverse;
}

- (void)setReverse:(BOOL)reverse
{
  self->_reverse = reverse;
}

- (BOOL)training
{
  return self->_training;
}

- (void)setTraining:(BOOL)training
{
  self->_training = training;
}

- (BOOL)bidirectional
{
  return self->_bidirectional;
}

- (void)setBidirectional:(BOOL)bidirectional
{
  self->_bidirectional = bidirectional;
}

- (MPSGraphRNNActivation)resetGateActivation
{
  return self->_resetGateActivation;
}

- (void)setResetGateActivation:(MPSGraphRNNActivation)resetGateActivation
{
  self->_resetGateActivation = resetGateActivation;
}

- (MPSGraphRNNActivation)updateGateActivation
{
  return self->_updateGateActivation;
}

- (void)setUpdateGateActivation:(MPSGraphRNNActivation)updateGateActivation
{
  self->_updateGateActivation = updateGateActivation;
}

- (MPSGraphRNNActivation)outputGateActivation
{
  return self->_outputGateActivation;
}

- (void)setOutputGateActivation:(MPSGraphRNNActivation)outputGateActivation
{
  self->_outputGateActivation = outputGateActivation;
}

- (BOOL)resetAfter
{
  return self->_resetAfter;
}

- (void)setResetAfter:(BOOL)resetAfter
{
  self->_resetAfter = resetAfter;
}

- (BOOL)resetGateFirst
{
  return self->_resetGateFirst;
}

- (void)setResetGateFirst:(BOOL)resetGateFirst
{
  self->_resetGateFirst = resetGateFirst;
}

- (BOOL)flipZ
{
  return self->_flipZ;
}

- (void)setFlipZ:(BOOL)flipZ
{
  self->_flipZ = flipZ;
}

@end