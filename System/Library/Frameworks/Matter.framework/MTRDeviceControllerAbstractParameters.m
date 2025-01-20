@interface MTRDeviceControllerAbstractParameters
- (BOOL)startSuspended;
- (id)_initInternal;
- (void)setStartSuspended:(BOOL)a3;
@end

@implementation MTRDeviceControllerAbstractParameters

- (id)_initInternal
{
  v6.receiver = self;
  v6.super_class = (Class)MTRDeviceControllerAbstractParameters;
  v2 = [(MTRDeviceControllerAbstractParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_startSuspended = 0;
    v4 = v2;
  }

  return v3;
}

- (BOOL)startSuspended
{
  return self->_startSuspended;
}

- (void)setStartSuspended:(BOOL)a3
{
  self->_startSuspended = a3;
}

@end