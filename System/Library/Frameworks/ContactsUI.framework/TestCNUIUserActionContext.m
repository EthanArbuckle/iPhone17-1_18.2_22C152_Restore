@interface TestCNUIUserActionContext
- (BOOL)actionExecutionWasAttemted;
- (CNUIUserActionCurator)actionCurator;
- (CNUIUserActionDialRequestOpener)dialRequestOpener;
- (CNUIUserActionRecorder)actionRecorder;
- (CNUIUserActionURLOpener)urlOpener;
- (CNUIUserActionUserActivityOpener)userActivityOpener;
- (NSString)channelIdentifier;
- (id)nilValue;
- (void)setActionExecutionWasAttemted:(BOOL)a3;
- (void)setChannelIdentifier:(id)a3;
@end

@implementation TestCNUIUserActionContext

- (void).cxx_destruct
{
}

- (void)setActionExecutionWasAttemted:(BOOL)a3
{
  self->_actionExecutionWasAttemted = a3;
}

- (BOOL)actionExecutionWasAttemted
{
  return self->_actionExecutionWasAttemted;
}

- (void)setChannelIdentifier:(id)a3
{
}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (CNUIUserActionCurator)actionCurator
{
  [(TestCNUIUserActionContext *)self setActionExecutionWasAttemted:1];

  return (CNUIUserActionCurator *)[(TestCNUIUserActionContext *)self nilValue];
}

- (CNUIUserActionRecorder)actionRecorder
{
  [(TestCNUIUserActionContext *)self setActionExecutionWasAttemted:1];

  return (CNUIUserActionRecorder *)[(TestCNUIUserActionContext *)self nilValue];
}

- (CNUIUserActionDialRequestOpener)dialRequestOpener
{
  [(TestCNUIUserActionContext *)self setActionExecutionWasAttemted:1];

  return (CNUIUserActionDialRequestOpener *)[(TestCNUIUserActionContext *)self nilValue];
}

- (CNUIUserActionUserActivityOpener)userActivityOpener
{
  [(TestCNUIUserActionContext *)self setActionExecutionWasAttemted:1];

  return (CNUIUserActionUserActivityOpener *)[(TestCNUIUserActionContext *)self nilValue];
}

- (CNUIUserActionURLOpener)urlOpener
{
  [(TestCNUIUserActionContext *)self setActionExecutionWasAttemted:1];

  return (CNUIUserActionURLOpener *)[(TestCNUIUserActionContext *)self nilValue];
}

- (id)nilValue
{
  return 0;
}

@end