@interface ADInterSessionFilterParameters
- (ADInterSessionFilterParameters)init;
- (BOOL)isStepDetectionActive;
- (float)maximalWeight;
- (float)minimalWeight;
- (float)outlierWeight;
- (float)stepDetectionThreshold;
- (unsigned)capacity;
- (unsigned)minStepIndex;
- (unsigned)minStepSize;
- (unsigned)minimalEntriesForResult;
- (unsigned)outlierNumber;
- (void)setCapacity:(unsigned int)a3;
- (void)setIsStepDetectionActive:(BOOL)a3;
- (void)setMaximalWeight:(float)a3;
- (void)setMinStepIndex:(unsigned int)a3;
- (void)setMinStepSize:(unsigned int)a3;
- (void)setMinimalEntriesForResult:(unsigned int)a3;
- (void)setMinimalWeight:(float)a3;
- (void)setOutlierNumber:(unsigned int)a3;
- (void)setOutlierWeight:(float)a3;
- (void)setStepDetectionThreshold:(float)a3;
@end

@implementation ADInterSessionFilterParameters

- (float)minimalWeight
{
  return self->_minimalWeight;
}

- (float)maximalWeight
{
  return self->_maximalWeight;
}

- (unsigned)capacity
{
  return self->_capacity;
}

- (void)setStepDetectionThreshold:(float)a3
{
  self->_stepDetectionThreshold = a3;
}

- (void)setOutlierWeight:(float)a3
{
  self->_outlierWeight = a3;
}

- (void)setOutlierNumber:(unsigned int)a3
{
  self->_outlierNumber = a3;
}

- (void)setMinimalWeight:(float)a3
{
  self->_minimalWeight = a3;
}

- (void)setMinimalEntriesForResult:(unsigned int)a3
{
  self->_minimalEntriesForResult = a3;
}

- (void)setMinStepSize:(unsigned int)a3
{
  self->_minStepSize = a3;
}

- (void)setMinStepIndex:(unsigned int)a3
{
  self->_minStepIndex = a3;
}

- (void)setMaximalWeight:(float)a3
{
  self->_maximalWeight = a3;
}

- (void)setIsStepDetectionActive:(BOOL)a3
{
  self->_isStepDetectionActive = a3;
}

- (void)setCapacity:(unsigned int)a3
{
  self->_capacity = a3;
}

- (ADInterSessionFilterParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)ADInterSessionFilterParameters;
  result = [(ADInterSessionFilterParameters *)&v3 init];
  if (result)
  {
    *(void *)&result->_minimalEntriesForResult = 0x4B0000004BLL;
    *(void *)&result->_minimalWeight = 0x3E8000003CE56042;
    *(void *)&result->_outlierNumber = 0x3CE5604200000011;
    result->_isStepDetectionActive = 1;
    *(void *)&result->_minStepIndex = 0xF00000002;
    result->_stepDetectionThreshold = 5.342;
  }
  return result;
}

- (float)stepDetectionThreshold
{
  return self->_stepDetectionThreshold;
}

- (unsigned)minStepSize
{
  return self->_minStepSize;
}

- (unsigned)minStepIndex
{
  return self->_minStepIndex;
}

- (BOOL)isStepDetectionActive
{
  return self->_isStepDetectionActive;
}

- (float)outlierWeight
{
  return self->_outlierWeight;
}

- (unsigned)outlierNumber
{
  return self->_outlierNumber;
}

- (unsigned)minimalEntriesForResult
{
  return self->_minimalEntriesForResult;
}

@end