@interface RPCCUIActivityBaubleCompleteDescription
- (RPCCUIActivityBaubleCompleteDescription)initWithActivityDescription:(id)a3 referencePointSize:(double)a4 maximumPointSize:(double)a5 referenceDimension:(double)a6;
- (RPCCUIActivityBaubleCompleteDescription)initWithSystemImageName:(id)a3 tintColor:(id)a4 referencePointSize:(double)a5 maximumPointSize:(double)a6 referenceDimension:(double)a7;
- (double)maximumPointSize;
- (double)referenceDimension;
- (double)referencePointSize;
@end

@implementation RPCCUIActivityBaubleCompleteDescription

- (RPCCUIActivityBaubleCompleteDescription)initWithSystemImageName:(id)a3 tintColor:(id)a4 referencePointSize:(double)a5 maximumPointSize:(double)a6 referenceDimension:(double)a7
{
  v11.receiver = self;
  v11.super_class = (Class)RPCCUIActivityBaubleCompleteDescription;
  result = [(RPCCUIActivityBaubleDescription *)&v11 initWithSystemImageName:a3 tintColor:a4];
  if (result)
  {
    result->_referencePointSize = a5;
    result->_maximumPointSize = a6;
    result->_referenceDimension = a7;
  }
  return result;
}

- (RPCCUIActivityBaubleCompleteDescription)initWithActivityDescription:(id)a3 referencePointSize:(double)a4 maximumPointSize:(double)a5 referenceDimension:(double)a6
{
  v10.receiver = self;
  v10.super_class = (Class)RPCCUIActivityBaubleCompleteDescription;
  result = [(RPCCUIActivityBaubleDescription *)&v10 initWithActivityDescription:a3];
  if (result)
  {
    result->_referencePointSize = a4;
    result->_maximumPointSize = a5;
    result->_referenceDimension = a6;
  }
  return result;
}

- (double)referencePointSize
{
  return self->_referencePointSize;
}

- (double)maximumPointSize
{
  return self->_maximumPointSize;
}

- (double)referenceDimension
{
  return self->_referenceDimension;
}

@end