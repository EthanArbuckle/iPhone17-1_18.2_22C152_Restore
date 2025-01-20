@interface ASDTPMEnabler
- (ASDTPMEnabler)initWithConfig:(id)a3 forSequencer:(id)a4;
- (BOOL)asdtHandlesPowerTransition:(int)a3;
- (int)asdtPowerStateChange:(int)a3;
- (int)disableTransition;
- (int)enable:(BOOL)a3;
- (int)enableTransition;
- (void)setDisableTransition:(int)a3;
- (void)setEnableTransition:(int)a3;
@end

@implementation ASDTPMEnabler

- (ASDTPMEnabler)initWithConfig:(id)a3 forSequencer:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASDTPMEnabler;
  v7 = [(ASDTPMDevice *)&v10 initWithConfig:v6 forSequencer:a4];
  v8 = v7;
  if (v7)
  {
    [(ASDTPMDevice *)v7 setPmNoStateChangeOnFailure:1];
    -[ASDTPMEnabler setEnableTransition:](v8, "setEnableTransition:", [v6 asdtPMEnablerEnableTransition]);
    -[ASDTPMEnabler setDisableTransition:](v8, "setDisableTransition:", [v6 asdtPMEnablerDisableTransition]);
  }

  return v8;
}

- (int)asdtPowerStateChange:(int)a3
{
  if (a3 == 1970563428)
  {
    uint64_t v4 = asdtPowerTransitionUpwards([(ASDTPMEnabler *)self disableTransition]);
  }
  else if ([(ASDTPMEnabler *)self enableTransition] == a3)
  {
    uint64_t v4 = 1;
  }
  else
  {
    if ([(ASDTPMEnabler *)self disableTransition] != a3) {
      return 0;
    }
    uint64_t v4 = 0;
  }
  return [(ASDTPMEnabler *)self enable:v4];
}

- (BOOL)asdtHandlesPowerTransition:(int)a3
{
  if (a3 == 1970563428) {
    return 1;
  }
  if ([(ASDTPMEnabler *)self enableTransition] == a3) {
    return 1;
  }
  return [(ASDTPMEnabler *)self disableTransition] == a3;
}

- (int)enable:(BOOL)a3
{
  return 560227702;
}

- (int)enableTransition
{
  return self->_enableTransition;
}

- (void)setEnableTransition:(int)a3
{
  self->_enableTransition = a3;
}

- (int)disableTransition
{
  return self->_disableTransition;
}

- (void)setDisableTransition:(int)a3
{
  self->_disableTransition = a3;
}

@end