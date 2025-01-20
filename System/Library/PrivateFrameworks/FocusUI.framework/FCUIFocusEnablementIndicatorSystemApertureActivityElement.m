@interface FCUIFocusEnablementIndicatorSystemApertureActivityElement
- (BOOL)hasActivityBehavior;
- (BOOL)hasAlertBehavior;
- (SAActivityHosting)activityHost;
- (id)elementIdentifier;
- (void)setActivityHost:(id)a3;
@end

@implementation FCUIFocusEnablementIndicatorSystemApertureActivityElement

- (BOOL)hasActivityBehavior
{
  return 1;
}

- (id)elementIdentifier
{
  return (id)*MEMORY[0x263F797A0];
}

- (BOOL)hasAlertBehavior
{
  return 0;
}

- (SAActivityHosting)activityHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityHost);
  return (SAActivityHosting *)WeakRetained;
}

- (void)setActivityHost:(id)a3
{
}

- (void).cxx_destruct
{
}

@end