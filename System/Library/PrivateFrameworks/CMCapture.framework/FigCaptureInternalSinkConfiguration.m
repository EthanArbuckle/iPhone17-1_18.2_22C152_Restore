@interface FigCaptureInternalSinkConfiguration
- (FigCaptureInternalSinkConfiguration)initWithSinkSubType:(int)a3;
- (int)sinkType;
- (int)subType;
@end

@implementation FigCaptureInternalSinkConfiguration

- (FigCaptureInternalSinkConfiguration)initWithSinkSubType:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FigCaptureInternalSinkConfiguration;
  result = [(FigCaptureInternalSinkConfiguration *)&v5 init];
  if (result) {
    result->_subType = a3;
  }
  return result;
}

- (int)subType
{
  return self->_subType;
}

- (int)sinkType
{
  return 14;
}

@end