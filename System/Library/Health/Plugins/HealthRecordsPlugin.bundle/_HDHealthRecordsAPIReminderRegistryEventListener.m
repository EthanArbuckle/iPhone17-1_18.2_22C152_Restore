@interface _HDHealthRecordsAPIReminderRegistryEventListener
- (id)displayedAlertHandler;
- (id)droppedReminderHandler;
- (id)finishedProcessingReminderHandler;
- (id)handledApplicationsUninstalledHandler;
- (id)launchedClinicalSourceSettingsHandler;
- (id)receivedHomescreenUnlockedAtHomescreenNotificationHandler;
- (id)startedListeningForHomescreenUnlockedNotificationsHandler;
- (id)stoppedListeningForHomescreenUnlockedNotificationsHandler;
- (void)didFinishProcessingPendingReminderID:(id)a3;
- (void)displayedAlertForPendingReminderID:(id)a3;
- (void)droppedReminder:(id)a3;
- (void)handledApplicationsUninstalled;
- (void)launchedClinicalSettingsForSource:(id)a3;
- (void)receivedHomescreenUnlockedAtHomescreenNotification;
- (void)setDisplayedAlertHandler:(id)a3;
- (void)setDroppedReminderHandler:(id)a3;
- (void)setFinishedProcessingReminderHandler:(id)a3;
- (void)setHandledApplicationsUninstalledHandler:(id)a3;
- (void)setLaunchedClinicalSourceSettingsHandler:(id)a3;
- (void)setReceivedHomescreenUnlockedAtHomescreenNotificationHandler:(id)a3;
- (void)setStartedListeningForHomescreenUnlockedNotificationsHandler:(id)a3;
- (void)setStoppedListeningForHomescreenUnlockedNotificationsHandler:(id)a3;
- (void)startedListeningForHomescreenUnlockedNotifications;
- (void)stoppedListeningForHomescreenUnlockedNotifications;
@end

@implementation _HDHealthRecordsAPIReminderRegistryEventListener

- (void)handledApplicationsUninstalled
{
  v3 = [(_HDHealthRecordsAPIReminderRegistryEventListener *)self handledApplicationsUninstalledHandler];

  if (v3)
  {
    v4 = [(_HDHealthRecordsAPIReminderRegistryEventListener *)self handledApplicationsUninstalledHandler];
    v4[2]();
  }
}

- (void)displayedAlertForPendingReminderID:(id)a3
{
  id v6 = a3;
  v4 = [(_HDHealthRecordsAPIReminderRegistryEventListener *)self displayedAlertHandler];

  if (v4)
  {
    v5 = [(_HDHealthRecordsAPIReminderRegistryEventListener *)self displayedAlertHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)didFinishProcessingPendingReminderID:(id)a3
{
  id v6 = a3;
  v4 = [(_HDHealthRecordsAPIReminderRegistryEventListener *)self finishedProcessingReminderHandler];

  if (v4)
  {
    v5 = [(_HDHealthRecordsAPIReminderRegistryEventListener *)self finishedProcessingReminderHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)droppedReminder:(id)a3
{
  id v6 = a3;
  v4 = [(_HDHealthRecordsAPIReminderRegistryEventListener *)self droppedReminderHandler];

  if (v4)
  {
    v5 = [(_HDHealthRecordsAPIReminderRegistryEventListener *)self droppedReminderHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)launchedClinicalSettingsForSource:(id)a3
{
  id v6 = a3;
  v4 = [(_HDHealthRecordsAPIReminderRegistryEventListener *)self launchedClinicalSourceSettingsHandler];

  if (v4)
  {
    v5 = [(_HDHealthRecordsAPIReminderRegistryEventListener *)self launchedClinicalSourceSettingsHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)startedListeningForHomescreenUnlockedNotifications
{
  v3 = [(_HDHealthRecordsAPIReminderRegistryEventListener *)self startedListeningForHomescreenUnlockedNotificationsHandler];

  if (v3)
  {
    v4 = [(_HDHealthRecordsAPIReminderRegistryEventListener *)self startedListeningForHomescreenUnlockedNotificationsHandler];
    v4[2]();
  }
}

- (void)receivedHomescreenUnlockedAtHomescreenNotification
{
  v3 = [(_HDHealthRecordsAPIReminderRegistryEventListener *)self receivedHomescreenUnlockedAtHomescreenNotificationHandler];

  if (v3)
  {
    v4 = [(_HDHealthRecordsAPIReminderRegistryEventListener *)self receivedHomescreenUnlockedAtHomescreenNotificationHandler];
    v4[2]();
  }
}

- (void)stoppedListeningForHomescreenUnlockedNotifications
{
  v3 = [(_HDHealthRecordsAPIReminderRegistryEventListener *)self stoppedListeningForHomescreenUnlockedNotificationsHandler];

  if (v3)
  {
    v4 = [(_HDHealthRecordsAPIReminderRegistryEventListener *)self stoppedListeningForHomescreenUnlockedNotificationsHandler];
    v4[2]();
  }
}

- (id)handledApplicationsUninstalledHandler
{
  return self->_handledApplicationsUninstalledHandler;
}

- (void)setHandledApplicationsUninstalledHandler:(id)a3
{
}

- (id)displayedAlertHandler
{
  return self->_displayedAlertHandler;
}

- (void)setDisplayedAlertHandler:(id)a3
{
}

- (id)droppedReminderHandler
{
  return self->_droppedReminderHandler;
}

- (void)setDroppedReminderHandler:(id)a3
{
}

- (id)finishedProcessingReminderHandler
{
  return self->_finishedProcessingReminderHandler;
}

- (void)setFinishedProcessingReminderHandler:(id)a3
{
}

- (id)launchedClinicalSourceSettingsHandler
{
  return self->_launchedClinicalSourceSettingsHandler;
}

- (void)setLaunchedClinicalSourceSettingsHandler:(id)a3
{
}

- (id)startedListeningForHomescreenUnlockedNotificationsHandler
{
  return self->_startedListeningForHomescreenUnlockedNotificationsHandler;
}

- (void)setStartedListeningForHomescreenUnlockedNotificationsHandler:(id)a3
{
}

- (id)receivedHomescreenUnlockedAtHomescreenNotificationHandler
{
  return self->_receivedHomescreenUnlockedAtHomescreenNotificationHandler;
}

- (void)setReceivedHomescreenUnlockedAtHomescreenNotificationHandler:(id)a3
{
}

- (id)stoppedListeningForHomescreenUnlockedNotificationsHandler
{
  return self->_stoppedListeningForHomescreenUnlockedNotificationsHandler;
}

- (void)setStoppedListeningForHomescreenUnlockedNotificationsHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stoppedListeningForHomescreenUnlockedNotificationsHandler, 0);
  objc_storeStrong(&self->_receivedHomescreenUnlockedAtHomescreenNotificationHandler, 0);
  objc_storeStrong(&self->_startedListeningForHomescreenUnlockedNotificationsHandler, 0);
  objc_storeStrong(&self->_launchedClinicalSourceSettingsHandler, 0);
  objc_storeStrong(&self->_finishedProcessingReminderHandler, 0);
  objc_storeStrong(&self->_droppedReminderHandler, 0);
  objc_storeStrong(&self->_displayedAlertHandler, 0);

  objc_storeStrong(&self->_handledApplicationsUninstalledHandler, 0);
}

@end