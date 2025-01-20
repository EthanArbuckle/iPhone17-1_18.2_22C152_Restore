@interface IAMMessageGroup
- (BOOL)shouldPerformModalMessagePresentation;
- (IAMMessageCoordinator)messageCoordinator;
- (IAMMessageGroup)initWithGroupIdentifier:(id)a3;
- (IAMMessageGroupInternalDelegate)internalDelegate;
- (NSString)groupIdentifier;
- (id)contextPropertyWithName:(id)a3;
- (void)receiveEvent:(id)a3;
- (void)reportContextPropertiesDidChange:(id)a3;
- (void)reportModalMessagePresentationFailedWithIdentifier:(id)a3;
- (void)reportModalMessageWasDismissedWithIdentifier:(id)a3;
- (void)reportModalMessageWasPresentedWithIdentifier:(id)a3;
- (void)reportModalMessageWithIdentifier:(id)a3 actionWasPerformedWithIdentifier:(id)a4;
- (void)setInternalDelegate:(id)a3;
- (void)setMessageCoordinator:(id)a3;
- (void)viewControllerForModalMessagePresentation:(id)a3 completion:(id)a4;
@end

@implementation IAMMessageGroup

- (IAMMessageGroup)initWithGroupIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IAMMessageGroup;
  v5 = [(IAMMessageGroup *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)setMessageCoordinator:(id)a3
{
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)viewControllerForModalMessagePresentation:(id)a3 completion:(id)a4
{
}

- (void)reportModalMessageWithIdentifier:(id)a3 actionWasPerformedWithIdentifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_internalDelegate);
    objc_super v9 = (void *)[v11 copy];
    v10 = (void *)[v6 copy];
    [v8 messageGroup:self didReportModalMessageWithIdentifier:v9 actionWasPerformedWithIdentifier:v10];
  }
}

- (void)receiveEvent:(id)a3
{
  p_messageCoordinator = &self->_messageCoordinator;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_messageCoordinator);
  id v6 = [[IAMReceivedEventTriggerContext alloc] initWithEvent:v5 bundleIdentifier:self->_groupIdentifier];

  [WeakRetained receiveTriggerEventContext:v6];
}

- (void)reportContextPropertiesDidChange:(id)a3
{
  p_messageCoordinator = &self->_messageCoordinator;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_messageCoordinator);
  id v6 = [[IAMChangedContextPropertiesTriggerContext alloc] initWithContextPropertyNames:v5 bundleIdentifier:self->_groupIdentifier];

  [WeakRetained reportChangedContextPropertiesContext:v6];
}

- (id)contextPropertyWithName:(id)a3
{
  return 0;
}

- (BOOL)shouldPerformModalMessagePresentation
{
  return 0;
}

- (void)reportModalMessagePresentationFailedWithIdentifier:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_internalDelegate);
    id v6 = (void *)[v7 copy];
    [v5 messageGroup:self didReportModalMessagePresentationFailedWithIdentifier:v6];
  }
}

- (void)reportModalMessageWasPresentedWithIdentifier:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_internalDelegate);
    id v6 = (void *)[v7 copy];
    [v5 messageGroup:self didReportModalMessageWasPresentedWithIdentifier:v6];
  }
}

- (void)reportModalMessageWasDismissedWithIdentifier:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_internalDelegate);
    id v6 = (void *)[v7 copy];
    [v5 messageGroup:self didReportModalMessageWasDismissedWithIdentifier:v6];
  }
}

- (IAMMessageCoordinator)messageCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageCoordinator);

  return (IAMMessageCoordinator *)WeakRetained;
}

- (IAMMessageGroupInternalDelegate)internalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);

  return (IAMMessageGroupInternalDelegate *)WeakRetained;
}

- (void)setInternalDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_internalDelegate);
  objc_destroyWeak((id *)&self->_messageCoordinator);

  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end