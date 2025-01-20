@interface _INPBPayloadUnsupported
+ (BOOL)supportsSecureCoding;
+ (Class)conflictingParametersType;
- (BOOL)hasAddCallParticipantIntentParticipantsUnsupportedReason;
- (BOOL)hasAddMediaIntentMediaDestinationUnsupportedReason;
- (BOOL)hasAddMediaIntentMediaItemsUnsupportedReason;
- (BOOL)hasAddTasksIntentContactEventTriggerUnsupportedReason;
- (BOOL)hasAddTasksIntentTargetTaskListMembersUnsupportedReason;
- (BOOL)hasAddTasksIntentTemporalEventTriggerUnsupportedReason;
- (BOOL)hasChangeAlarmStatusIntentAlarmsUnsupportedReason;
- (BOOL)hasCreateTimerIntentLabelUnsupportedReason;
- (BOOL)hasCustomUnsupportedReason;
- (BOOL)hasDateTimeRangeUnsupportedReason;
- (BOOL)hasDeleteAlarmIntentAlarmsUnsupportedReason;
- (BOOL)hasDeleteTasksIntentTaskListUnsupportedReason;
- (BOOL)hasDeleteTasksIntentTaskUnsupportedReason;
- (BOOL)hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason;
- (BOOL)hasJoinCallIntentGroupConversationUnsupportedReason;
- (BOOL)hasParticipantUnsupportedReason;
- (BOOL)hasPlayMediaIntentMediaItemsUnsupportedReason;
- (BOOL)hasPlayMediaIntentPlaybackSpeedUnsupportedReason;
- (BOOL)hasReason;
- (BOOL)hasReportIncidentIntentIncidentTypeUnsupportedReason;
- (BOOL)hasRequestPaymentIntentCurrencyAmountUnsupportedReason;
- (BOOL)hasRequestPaymentIntentPayerUnsupportedReason;
- (BOOL)hasRunWorkflowIntentWorkflowUnsupportedReason;
- (BOOL)hasSaveHealthSampleIntentRecordDateUnsupportedReason;
- (BOOL)hasSearchAlarmIntentAlarmsUnsupportedReason;
- (BOOL)hasSearchForMediaIntentMediaItemsUnsupportedReason;
- (BOOL)hasSendAnnouncementIntentAnnouncementUnsupportedReason;
- (BOOL)hasSendAnnouncementIntentRecipientsUnsupportedReason;
- (BOOL)hasSendMessageIntentRecipientUnsupportedReason;
- (BOOL)hasSendPaymentIntentCurrencyAmountUnsupportedReason;
- (BOOL)hasSendPaymentIntentPayeeUnsupportedReason;
- (BOOL)hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason;
- (BOOL)hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason;
- (BOOL)hasSetTimerAttributeIntentTargetTimerUnsupportedReason;
- (BOOL)hasShareETAIntentRecipientUnsupportedReason;
- (BOOL)hasSnoozeAlarmIntentAlarmsUnsupportedReason;
- (BOOL)hasSnoozeTasksIntentTaskUnsupportedReason;
- (BOOL)hasStartCallIntentCallCapabilityUnsupportedReason;
- (BOOL)hasStartCallIntentCallRecordToCallBackUnsupportedReason;
- (BOOL)hasStartCallIntentContactsUnsupportedReason;
- (BOOL)hasStartCallIntentPreferredCallProviderUnsupportedReason;
- (BOOL)hasStopShareETAIntentRecipientUnsupportedReason;
- (BOOL)hasTargetEventUnsupportedReason;
- (BOOL)hasUpdateAlarmIntentAlarmUnsupportedReason;
- (BOOL)hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)conflictingParameters;
- (_INPBPayloadUnsupported)initWithCoder:(id)a3;
- (id)addCallParticipantIntentParticipantsUnsupportedReasonAsString:(int)a3;
- (id)addMediaIntentMediaDestinationUnsupportedReasonAsString:(int)a3;
- (id)addMediaIntentMediaItemsUnsupportedReasonAsString:(int)a3;
- (id)addTasksIntentContactEventTriggerUnsupportedReasonAsString:(int)a3;
- (id)addTasksIntentTargetTaskListMembersUnsupportedReasonAsString:(int)a3;
- (id)addTasksIntentTemporalEventTriggerUnsupportedReasonAsString:(int)a3;
- (id)changeAlarmStatusIntentAlarmsUnsupportedReasonAsString:(int)a3;
- (id)conflictingParametersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createTimerIntentLabelUnsupportedReasonAsString:(int)a3;
- (id)dateTimeRangeUnsupportedReasonAsString:(int)a3;
- (id)deleteAlarmIntentAlarmsUnsupportedReasonAsString:(int)a3;
- (id)deleteTasksIntentTaskListUnsupportedReasonAsString:(int)a3;
- (id)deleteTasksIntentTaskUnsupportedReasonAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)findDeviceAndPlaySoundIntentDeviceUnsupportedReasonAsString:(int)a3;
- (id)joinCallIntentGroupConversationUnsupportedReasonAsString:(int)a3;
- (id)participantUnsupportedReasonAsString:(int)a3;
- (id)playMediaIntentMediaItemsUnsupportedReasonAsString:(int)a3;
- (id)playMediaIntentPlaybackSpeedUnsupportedReasonAsString:(int)a3;
- (id)reasonAsString:(int)a3;
- (id)reportIncidentIntentIncidentTypeUnsupportedReasonAsString:(int)a3;
- (id)requestPaymentIntentCurrencyAmountUnsupportedReasonAsString:(int)a3;
- (id)requestPaymentIntentPayerUnsupportedReasonAsString:(int)a3;
- (id)runWorkflowIntentWorkflowUnsupportedReasonAsString:(int)a3;
- (id)saveHealthSampleIntentRecordDateUnsupportedReasonAsString:(int)a3;
- (id)searchAlarmIntentAlarmsUnsupportedReasonAsString:(int)a3;
- (id)searchForMediaIntentMediaItemsUnsupportedReasonAsString:(int)a3;
- (id)sendAnnouncementIntentAnnouncementUnsupportedReasonAsString:(int)a3;
- (id)sendAnnouncementIntentRecipientsUnsupportedReasonAsString:(int)a3;
- (id)sendMessageIntentRecipientUnsupportedReasonAsString:(int)a3;
- (id)sendPaymentIntentCurrencyAmountUnsupportedReasonAsString:(int)a3;
- (id)sendPaymentIntentPayeeUnsupportedReasonAsString:(int)a3;
- (id)setTaskAttributeIntentContactEventTriggerUnsupportedReasonAsString:(int)a3;
- (id)setTaskAttributeIntentTemporalEventTriggerUnsupportedReasonAsString:(int)a3;
- (id)setTimerAttributeIntentTargetTimerUnsupportedReasonAsString:(int)a3;
- (id)shareETAIntentRecipientUnsupportedReasonAsString:(int)a3;
- (id)snoozeAlarmIntentAlarmsUnsupportedReasonAsString:(int)a3;
- (id)snoozeTasksIntentTaskUnsupportedReasonAsString:(int)a3;
- (id)startCallIntentCallCapabilityUnsupportedReasonAsString:(int)a3;
- (id)startCallIntentCallRecordToCallBackUnsupportedReasonAsString:(int)a3;
- (id)startCallIntentContactsUnsupportedReasonAsString:(int)a3;
- (id)startCallIntentPreferredCallProviderUnsupportedReasonAsString:(int)a3;
- (id)stopShareETAIntentRecipientUnsupportedReasonAsString:(int)a3;
- (id)targetEventUnsupportedReasonAsString:(int)a3;
- (id)updateAlarmIntentAlarmUnsupportedReasonAsString:(int)a3;
- (id)updateMediaAffinityIntentMediaItemsUnsupportedReasonAsString:(int)a3;
- (int)StringAsAddCallParticipantIntentParticipantsUnsupportedReason:(id)a3;
- (int)StringAsAddMediaIntentMediaDestinationUnsupportedReason:(id)a3;
- (int)StringAsAddMediaIntentMediaItemsUnsupportedReason:(id)a3;
- (int)StringAsAddTasksIntentContactEventTriggerUnsupportedReason:(id)a3;
- (int)StringAsAddTasksIntentTargetTaskListMembersUnsupportedReason:(id)a3;
- (int)StringAsAddTasksIntentTemporalEventTriggerUnsupportedReason:(id)a3;
- (int)StringAsChangeAlarmStatusIntentAlarmsUnsupportedReason:(id)a3;
- (int)StringAsCreateTimerIntentLabelUnsupportedReason:(id)a3;
- (int)StringAsDateTimeRangeUnsupportedReason:(id)a3;
- (int)StringAsDeleteAlarmIntentAlarmsUnsupportedReason:(id)a3;
- (int)StringAsDeleteTasksIntentTaskListUnsupportedReason:(id)a3;
- (int)StringAsDeleteTasksIntentTaskUnsupportedReason:(id)a3;
- (int)StringAsFindDeviceAndPlaySoundIntentDeviceUnsupportedReason:(id)a3;
- (int)StringAsJoinCallIntentGroupConversationUnsupportedReason:(id)a3;
- (int)StringAsParticipantUnsupportedReason:(id)a3;
- (int)StringAsPlayMediaIntentMediaItemsUnsupportedReason:(id)a3;
- (int)StringAsPlayMediaIntentPlaybackSpeedUnsupportedReason:(id)a3;
- (int)StringAsReason:(id)a3;
- (int)StringAsReportIncidentIntentIncidentTypeUnsupportedReason:(id)a3;
- (int)StringAsRequestPaymentIntentCurrencyAmountUnsupportedReason:(id)a3;
- (int)StringAsRequestPaymentIntentPayerUnsupportedReason:(id)a3;
- (int)StringAsRunWorkflowIntentWorkflowUnsupportedReason:(id)a3;
- (int)StringAsSaveHealthSampleIntentRecordDateUnsupportedReason:(id)a3;
- (int)StringAsSearchAlarmIntentAlarmsUnsupportedReason:(id)a3;
- (int)StringAsSearchForMediaIntentMediaItemsUnsupportedReason:(id)a3;
- (int)StringAsSendAnnouncementIntentAnnouncementUnsupportedReason:(id)a3;
- (int)StringAsSendAnnouncementIntentRecipientsUnsupportedReason:(id)a3;
- (int)StringAsSendMessageIntentRecipientUnsupportedReason:(id)a3;
- (int)StringAsSendPaymentIntentCurrencyAmountUnsupportedReason:(id)a3;
- (int)StringAsSendPaymentIntentPayeeUnsupportedReason:(id)a3;
- (int)StringAsSetTaskAttributeIntentContactEventTriggerUnsupportedReason:(id)a3;
- (int)StringAsSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason:(id)a3;
- (int)StringAsSetTimerAttributeIntentTargetTimerUnsupportedReason:(id)a3;
- (int)StringAsShareETAIntentRecipientUnsupportedReason:(id)a3;
- (int)StringAsSnoozeAlarmIntentAlarmsUnsupportedReason:(id)a3;
- (int)StringAsSnoozeTasksIntentTaskUnsupportedReason:(id)a3;
- (int)StringAsStartCallIntentCallCapabilityUnsupportedReason:(id)a3;
- (int)StringAsStartCallIntentCallRecordToCallBackUnsupportedReason:(id)a3;
- (int)StringAsStartCallIntentContactsUnsupportedReason:(id)a3;
- (int)StringAsStartCallIntentPreferredCallProviderUnsupportedReason:(id)a3;
- (int)StringAsStopShareETAIntentRecipientUnsupportedReason:(id)a3;
- (int)StringAsTargetEventUnsupportedReason:(id)a3;
- (int)StringAsUpdateAlarmIntentAlarmUnsupportedReason:(id)a3;
- (int)StringAsUpdateMediaAffinityIntentMediaItemsUnsupportedReason:(id)a3;
- (int)addCallParticipantIntentParticipantsUnsupportedReason;
- (int)addMediaIntentMediaDestinationUnsupportedReason;
- (int)addMediaIntentMediaItemsUnsupportedReason;
- (int)addTasksIntentContactEventTriggerUnsupportedReason;
- (int)addTasksIntentTargetTaskListMembersUnsupportedReason;
- (int)addTasksIntentTemporalEventTriggerUnsupportedReason;
- (int)changeAlarmStatusIntentAlarmsUnsupportedReason;
- (int)createTimerIntentLabelUnsupportedReason;
- (int)dateTimeRangeUnsupportedReason;
- (int)deleteAlarmIntentAlarmsUnsupportedReason;
- (int)deleteTasksIntentTaskListUnsupportedReason;
- (int)deleteTasksIntentTaskUnsupportedReason;
- (int)findDeviceAndPlaySoundIntentDeviceUnsupportedReason;
- (int)joinCallIntentGroupConversationUnsupportedReason;
- (int)participantUnsupportedReason;
- (int)playMediaIntentMediaItemsUnsupportedReason;
- (int)playMediaIntentPlaybackSpeedUnsupportedReason;
- (int)reason;
- (int)reportIncidentIntentIncidentTypeUnsupportedReason;
- (int)requestPaymentIntentCurrencyAmountUnsupportedReason;
- (int)requestPaymentIntentPayerUnsupportedReason;
- (int)runWorkflowIntentWorkflowUnsupportedReason;
- (int)saveHealthSampleIntentRecordDateUnsupportedReason;
- (int)searchAlarmIntentAlarmsUnsupportedReason;
- (int)searchForMediaIntentMediaItemsUnsupportedReason;
- (int)sendAnnouncementIntentAnnouncementUnsupportedReason;
- (int)sendAnnouncementIntentRecipientsUnsupportedReason;
- (int)sendMessageIntentRecipientUnsupportedReason;
- (int)sendPaymentIntentCurrencyAmountUnsupportedReason;
- (int)sendPaymentIntentPayeeUnsupportedReason;
- (int)setTaskAttributeIntentContactEventTriggerUnsupportedReason;
- (int)setTaskAttributeIntentTemporalEventTriggerUnsupportedReason;
- (int)setTimerAttributeIntentTargetTimerUnsupportedReason;
- (int)shareETAIntentRecipientUnsupportedReason;
- (int)snoozeAlarmIntentAlarmsUnsupportedReason;
- (int)snoozeTasksIntentTaskUnsupportedReason;
- (int)startCallIntentCallCapabilityUnsupportedReason;
- (int)startCallIntentCallRecordToCallBackUnsupportedReason;
- (int)startCallIntentContactsUnsupportedReason;
- (int)startCallIntentPreferredCallProviderUnsupportedReason;
- (int)stopShareETAIntentRecipientUnsupportedReason;
- (int)targetEventUnsupportedReason;
- (int)updateAlarmIntentAlarmUnsupportedReason;
- (int)updateMediaAffinityIntentMediaItemsUnsupportedReason;
- (unint64_t)conflictingParametersCount;
- (unint64_t)hash;
- (unsigned)customUnsupportedReason;
- (void)addConflictingParameters:(id)a3;
- (void)clearConflictingParameters;
- (void)encodeWithCoder:(id)a3;
- (void)setAddCallParticipantIntentParticipantsUnsupportedReason:(int)a3;
- (void)setAddMediaIntentMediaDestinationUnsupportedReason:(int)a3;
- (void)setAddMediaIntentMediaItemsUnsupportedReason:(int)a3;
- (void)setAddTasksIntentContactEventTriggerUnsupportedReason:(int)a3;
- (void)setAddTasksIntentTargetTaskListMembersUnsupportedReason:(int)a3;
- (void)setAddTasksIntentTemporalEventTriggerUnsupportedReason:(int)a3;
- (void)setChangeAlarmStatusIntentAlarmsUnsupportedReason:(int)a3;
- (void)setConflictingParameters:(id)a3;
- (void)setCreateTimerIntentLabelUnsupportedReason:(int)a3;
- (void)setCustomUnsupportedReason:(unsigned int)a3;
- (void)setDateTimeRangeUnsupportedReason:(int)a3;
- (void)setDeleteAlarmIntentAlarmsUnsupportedReason:(int)a3;
- (void)setDeleteTasksIntentTaskListUnsupportedReason:(int)a3;
- (void)setDeleteTasksIntentTaskUnsupportedReason:(int)a3;
- (void)setFindDeviceAndPlaySoundIntentDeviceUnsupportedReason:(int)a3;
- (void)setHasAddCallParticipantIntentParticipantsUnsupportedReason:(BOOL)a3;
- (void)setHasAddMediaIntentMediaDestinationUnsupportedReason:(BOOL)a3;
- (void)setHasAddMediaIntentMediaItemsUnsupportedReason:(BOOL)a3;
- (void)setHasAddTasksIntentContactEventTriggerUnsupportedReason:(BOOL)a3;
- (void)setHasAddTasksIntentTargetTaskListMembersUnsupportedReason:(BOOL)a3;
- (void)setHasAddTasksIntentTemporalEventTriggerUnsupportedReason:(BOOL)a3;
- (void)setHasChangeAlarmStatusIntentAlarmsUnsupportedReason:(BOOL)a3;
- (void)setHasCreateTimerIntentLabelUnsupportedReason:(BOOL)a3;
- (void)setHasCustomUnsupportedReason:(BOOL)a3;
- (void)setHasDateTimeRangeUnsupportedReason:(BOOL)a3;
- (void)setHasDeleteAlarmIntentAlarmsUnsupportedReason:(BOOL)a3;
- (void)setHasDeleteTasksIntentTaskListUnsupportedReason:(BOOL)a3;
- (void)setHasDeleteTasksIntentTaskUnsupportedReason:(BOOL)a3;
- (void)setHasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason:(BOOL)a3;
- (void)setHasJoinCallIntentGroupConversationUnsupportedReason:(BOOL)a3;
- (void)setHasParticipantUnsupportedReason:(BOOL)a3;
- (void)setHasPlayMediaIntentMediaItemsUnsupportedReason:(BOOL)a3;
- (void)setHasPlayMediaIntentPlaybackSpeedUnsupportedReason:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setHasReportIncidentIntentIncidentTypeUnsupportedReason:(BOOL)a3;
- (void)setHasRequestPaymentIntentCurrencyAmountUnsupportedReason:(BOOL)a3;
- (void)setHasRequestPaymentIntentPayerUnsupportedReason:(BOOL)a3;
- (void)setHasRunWorkflowIntentWorkflowUnsupportedReason:(BOOL)a3;
- (void)setHasSaveHealthSampleIntentRecordDateUnsupportedReason:(BOOL)a3;
- (void)setHasSearchAlarmIntentAlarmsUnsupportedReason:(BOOL)a3;
- (void)setHasSearchForMediaIntentMediaItemsUnsupportedReason:(BOOL)a3;
- (void)setHasSendAnnouncementIntentAnnouncementUnsupportedReason:(BOOL)a3;
- (void)setHasSendAnnouncementIntentRecipientsUnsupportedReason:(BOOL)a3;
- (void)setHasSendMessageIntentRecipientUnsupportedReason:(BOOL)a3;
- (void)setHasSendPaymentIntentCurrencyAmountUnsupportedReason:(BOOL)a3;
- (void)setHasSendPaymentIntentPayeeUnsupportedReason:(BOOL)a3;
- (void)setHasSetTaskAttributeIntentContactEventTriggerUnsupportedReason:(BOOL)a3;
- (void)setHasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason:(BOOL)a3;
- (void)setHasSetTimerAttributeIntentTargetTimerUnsupportedReason:(BOOL)a3;
- (void)setHasShareETAIntentRecipientUnsupportedReason:(BOOL)a3;
- (void)setHasSnoozeAlarmIntentAlarmsUnsupportedReason:(BOOL)a3;
- (void)setHasSnoozeTasksIntentTaskUnsupportedReason:(BOOL)a3;
- (void)setHasStartCallIntentCallCapabilityUnsupportedReason:(BOOL)a3;
- (void)setHasStartCallIntentCallRecordToCallBackUnsupportedReason:(BOOL)a3;
- (void)setHasStartCallIntentContactsUnsupportedReason:(BOOL)a3;
- (void)setHasStartCallIntentPreferredCallProviderUnsupportedReason:(BOOL)a3;
- (void)setHasStopShareETAIntentRecipientUnsupportedReason:(BOOL)a3;
- (void)setHasTargetEventUnsupportedReason:(BOOL)a3;
- (void)setHasUpdateAlarmIntentAlarmUnsupportedReason:(BOOL)a3;
- (void)setHasUpdateMediaAffinityIntentMediaItemsUnsupportedReason:(BOOL)a3;
- (void)setJoinCallIntentGroupConversationUnsupportedReason:(int)a3;
- (void)setParticipantUnsupportedReason:(int)a3;
- (void)setPlayMediaIntentMediaItemsUnsupportedReason:(int)a3;
- (void)setPlayMediaIntentPlaybackSpeedUnsupportedReason:(int)a3;
- (void)setReason:(int)a3;
- (void)setReportIncidentIntentIncidentTypeUnsupportedReason:(int)a3;
- (void)setRequestPaymentIntentCurrencyAmountUnsupportedReason:(int)a3;
- (void)setRequestPaymentIntentPayerUnsupportedReason:(int)a3;
- (void)setRunWorkflowIntentWorkflowUnsupportedReason:(int)a3;
- (void)setSaveHealthSampleIntentRecordDateUnsupportedReason:(int)a3;
- (void)setSearchAlarmIntentAlarmsUnsupportedReason:(int)a3;
- (void)setSearchForMediaIntentMediaItemsUnsupportedReason:(int)a3;
- (void)setSendAnnouncementIntentAnnouncementUnsupportedReason:(int)a3;
- (void)setSendAnnouncementIntentRecipientsUnsupportedReason:(int)a3;
- (void)setSendMessageIntentRecipientUnsupportedReason:(int)a3;
- (void)setSendPaymentIntentCurrencyAmountUnsupportedReason:(int)a3;
- (void)setSendPaymentIntentPayeeUnsupportedReason:(int)a3;
- (void)setSetTaskAttributeIntentContactEventTriggerUnsupportedReason:(int)a3;
- (void)setSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason:(int)a3;
- (void)setSetTimerAttributeIntentTargetTimerUnsupportedReason:(int)a3;
- (void)setShareETAIntentRecipientUnsupportedReason:(int)a3;
- (void)setSnoozeAlarmIntentAlarmsUnsupportedReason:(int)a3;
- (void)setSnoozeTasksIntentTaskUnsupportedReason:(int)a3;
- (void)setStartCallIntentCallCapabilityUnsupportedReason:(int)a3;
- (void)setStartCallIntentCallRecordToCallBackUnsupportedReason:(int)a3;
- (void)setStartCallIntentContactsUnsupportedReason:(int)a3;
- (void)setStartCallIntentPreferredCallProviderUnsupportedReason:(int)a3;
- (void)setStopShareETAIntentRecipientUnsupportedReason:(int)a3;
- (void)setTargetEventUnsupportedReason:(int)a3;
- (void)setUpdateAlarmIntentAlarmUnsupportedReason:(int)a3;
- (void)setUpdateMediaAffinityIntentMediaItemsUnsupportedReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPayloadUnsupported

- (void)setSendAnnouncementIntentAnnouncementUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFFFFFDFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x20);
    self->_sendAnnouncementIntentAnnouncementUnsupportedReason = a3;
  }
}

- (void)setDeleteTasksIntentTaskUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFEFFFFFFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has | 0x10000000000);
    self->_deleteTasksIntentTaskUnsupportedReason = a3;
  }
}

- (id)deleteTasksIntentTaskUnsupportedReasonAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"NO_TASKS_FOUND";
  }
  else if (a3 == 2)
  {
    v4 = @"NO_TASKS_IN_APP";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsSearchAlarmIntentAlarmsUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NOT_FOUND"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"NO_ALARM_EXISTS"];
  }

  return v4;
}

- (id)searchAlarmIntentAlarmsUnsupportedReasonAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"NO_ALARM_EXISTS";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"NOT_FOUND";
  }
  return v4;
}

- (id)changeAlarmStatusIntentAlarmsUnsupportedReasonAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E551AA40[a3];
  }

  return v3;
}

- (int)StringAsDeleteAlarmIntentAlarmsUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NOT_FOUND"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"NO_ALARM_EXISTS"];
  }

  return v4;
}

- (void).cxx_destruct
{
}

- (int)runWorkflowIntentWorkflowUnsupportedReason
{
  return self->_runWorkflowIntentWorkflowUnsupportedReason;
}

- (int)setTaskAttributeIntentTemporalEventTriggerUnsupportedReason
{
  return self->_setTaskAttributeIntentTemporalEventTriggerUnsupportedReason;
}

- (int)addTasksIntentTemporalEventTriggerUnsupportedReason
{
  return self->_addTasksIntentTemporalEventTriggerUnsupportedReason;
}

- (int)snoozeTasksIntentTaskUnsupportedReason
{
  return self->_snoozeTasksIntentTaskUnsupportedReason;
}

- (int)deleteTasksIntentTaskUnsupportedReason
{
  return self->_deleteTasksIntentTaskUnsupportedReason;
}

- (int)deleteTasksIntentTaskListUnsupportedReason
{
  return self->_deleteTasksIntentTaskListUnsupportedReason;
}

- (int)setTimerAttributeIntentTargetTimerUnsupportedReason
{
  return self->_setTimerAttributeIntentTargetTimerUnsupportedReason;
}

- (int)addTasksIntentTargetTaskListMembersUnsupportedReason
{
  return self->_addTasksIntentTargetTaskListMembersUnsupportedReason;
}

- (int)targetEventUnsupportedReason
{
  return self->_targetEventUnsupportedReason;
}

- (int)saveHealthSampleIntentRecordDateUnsupportedReason
{
  return self->_saveHealthSampleIntentRecordDateUnsupportedReason;
}

- (int)sendAnnouncementIntentRecipientsUnsupportedReason
{
  return self->_sendAnnouncementIntentRecipientsUnsupportedReason;
}

- (int)sendMessageIntentRecipientUnsupportedReason
{
  return self->_sendMessageIntentRecipientUnsupportedReason;
}

- (int)stopShareETAIntentRecipientUnsupportedReason
{
  return self->_stopShareETAIntentRecipientUnsupportedReason;
}

- (int)shareETAIntentRecipientUnsupportedReason
{
  return self->_shareETAIntentRecipientUnsupportedReason;
}

- (int)reason
{
  return self->_reason;
}

- (int)startCallIntentPreferredCallProviderUnsupportedReason
{
  return self->_startCallIntentPreferredCallProviderUnsupportedReason;
}

- (int)playMediaIntentPlaybackSpeedUnsupportedReason
{
  return self->_playMediaIntentPlaybackSpeedUnsupportedReason;
}

- (int)requestPaymentIntentPayerUnsupportedReason
{
  return self->_requestPaymentIntentPayerUnsupportedReason;
}

- (int)sendPaymentIntentPayeeUnsupportedReason
{
  return self->_sendPaymentIntentPayeeUnsupportedReason;
}

- (int)addCallParticipantIntentParticipantsUnsupportedReason
{
  return self->_addCallParticipantIntentParticipantsUnsupportedReason;
}

- (int)participantUnsupportedReason
{
  return self->_participantUnsupportedReason;
}

- (int)updateMediaAffinityIntentMediaItemsUnsupportedReason
{
  return self->_updateMediaAffinityIntentMediaItemsUnsupportedReason;
}

- (int)searchForMediaIntentMediaItemsUnsupportedReason
{
  return self->_searchForMediaIntentMediaItemsUnsupportedReason;
}

- (int)playMediaIntentMediaItemsUnsupportedReason
{
  return self->_playMediaIntentMediaItemsUnsupportedReason;
}

- (int)addMediaIntentMediaItemsUnsupportedReason
{
  return self->_addMediaIntentMediaItemsUnsupportedReason;
}

- (int)addMediaIntentMediaDestinationUnsupportedReason
{
  return self->_addMediaIntentMediaDestinationUnsupportedReason;
}

- (int)createTimerIntentLabelUnsupportedReason
{
  return self->_createTimerIntentLabelUnsupportedReason;
}

- (int)reportIncidentIntentIncidentTypeUnsupportedReason
{
  return self->_reportIncidentIntentIncidentTypeUnsupportedReason;
}

- (int)joinCallIntentGroupConversationUnsupportedReason
{
  return self->_joinCallIntentGroupConversationUnsupportedReason;
}

- (int)findDeviceAndPlaySoundIntentDeviceUnsupportedReason
{
  return self->_findDeviceAndPlaySoundIntentDeviceUnsupportedReason;
}

- (int)dateTimeRangeUnsupportedReason
{
  return self->_dateTimeRangeUnsupportedReason;
}

- (unsigned)customUnsupportedReason
{
  return self->_customUnsupportedReason;
}

- (int)sendPaymentIntentCurrencyAmountUnsupportedReason
{
  return self->_sendPaymentIntentCurrencyAmountUnsupportedReason;
}

- (int)requestPaymentIntentCurrencyAmountUnsupportedReason
{
  return self->_requestPaymentIntentCurrencyAmountUnsupportedReason;
}

- (int)startCallIntentContactsUnsupportedReason
{
  return self->_startCallIntentContactsUnsupportedReason;
}

- (int)setTaskAttributeIntentContactEventTriggerUnsupportedReason
{
  return self->_setTaskAttributeIntentContactEventTriggerUnsupportedReason;
}

- (int)addTasksIntentContactEventTriggerUnsupportedReason
{
  return self->_addTasksIntentContactEventTriggerUnsupportedReason;
}

- (NSArray)conflictingParameters
{
  return self->_conflictingParameters;
}

- (int)startCallIntentCallRecordToCallBackUnsupportedReason
{
  return self->_startCallIntentCallRecordToCallBackUnsupportedReason;
}

- (int)startCallIntentCallCapabilityUnsupportedReason
{
  return self->_startCallIntentCallCapabilityUnsupportedReason;
}

- (int)sendAnnouncementIntentAnnouncementUnsupportedReason
{
  return self->_sendAnnouncementIntentAnnouncementUnsupportedReason;
}

- (int)snoozeAlarmIntentAlarmsUnsupportedReason
{
  return self->_snoozeAlarmIntentAlarmsUnsupportedReason;
}

- (int)searchAlarmIntentAlarmsUnsupportedReason
{
  return self->_searchAlarmIntentAlarmsUnsupportedReason;
}

- (int)deleteAlarmIntentAlarmsUnsupportedReason
{
  return self->_deleteAlarmIntentAlarmsUnsupportedReason;
}

- (int)changeAlarmStatusIntentAlarmsUnsupportedReason
{
  return self->_changeAlarmStatusIntentAlarmsUnsupportedReason;
}

- (int)updateAlarmIntentAlarmUnsupportedReason
{
  return self->_updateAlarmIntentAlarmUnsupportedReason;
}

- (id)dictionaryRepresentation
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBPayloadUnsupported *)self hasUpdateAlarmIntentAlarmUnsupportedReason])
  {
    uint64_t v4 = [(_INPBPayloadUnsupported *)self updateAlarmIntentAlarmUnsupportedReason];
    if (v4)
    {
      if (v4 == 3)
      {
        v5 = @"SLEEP_ALARM_NOT_SUPPORTED";
      }
      else if (v4 == 1)
      {
        v5 = @"NO_ALARM_EXISTS";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = @"NOT_FOUND";
    }
    [v3 setObject:v5 forKeyedSubscript:@"alarmUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasChangeAlarmStatusIntentAlarmsUnsupportedReason])
  {
    uint64_t v6 = [(_INPBPayloadUnsupported *)self changeAlarmStatusIntentAlarmsUnsupportedReason];
    if (v6 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E551AA40[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"alarmsUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasDeleteAlarmIntentAlarmsUnsupportedReason])
  {
    uint64_t v8 = [(_INPBPayloadUnsupported *)self deleteAlarmIntentAlarmsUnsupportedReason];
    if (v8)
    {
      if (v8 == 1)
      {
        v9 = @"NO_ALARM_EXISTS";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v9 = @"NOT_FOUND";
    }
    [v3 setObject:v9 forKeyedSubscript:@"alarmsUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasSearchAlarmIntentAlarmsUnsupportedReason])
  {
    uint64_t v10 = [(_INPBPayloadUnsupported *)self searchAlarmIntentAlarmsUnsupportedReason];
    if (v10)
    {
      if (v10 == 1)
      {
        v11 = @"NO_ALARM_EXISTS";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v11 = @"NOT_FOUND";
    }
    [v3 setObject:v11 forKeyedSubscript:@"alarmsUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasSnoozeAlarmIntentAlarmsUnsupportedReason])
  {
    uint64_t v12 = [(_INPBPayloadUnsupported *)self snoozeAlarmIntentAlarmsUnsupportedReason];
    if (v12)
    {
      if (v12 == 1)
      {
        v13 = @"CANT_SNOOZE_MUSIC_ALARM";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v13 = @"NO_ALARM_FIRING";
    }
    [v3 setObject:v13 forKeyedSubscript:@"alarmsUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasSendAnnouncementIntentAnnouncementUnsupportedReason])
  {
    uint64_t v14 = [(_INPBPayloadUnsupported *)self sendAnnouncementIntentAnnouncementUnsupportedReason];
    if (v14 == 1)
    {
      v15 = @"NO_ANNOUNCEMENT_TO_REPLY_TO";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v15 forKeyedSubscript:@"announcementUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasStartCallIntentCallCapabilityUnsupportedReason])
  {
    uint64_t v16 = [(_INPBPayloadUnsupported *)self startCallIntentCallCapabilityUnsupportedReason];
    if ((v16 - 1) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v16);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E551AA70[(v16 - 1)];
    }
    [v3 setObject:v17 forKeyedSubscript:@"callCapabilityUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasStartCallIntentCallRecordToCallBackUnsupportedReason])
  {
    uint64_t v18 = [(_INPBPayloadUnsupported *)self startCallIntentCallRecordToCallBackUnsupportedReason];
    if (v18 == 1)
    {
      v19 = @"NO_MATCHING_CALL";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v18);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v19 forKeyedSubscript:@"callRecordToCallBackUnsupportedReason"];
  }
  if ([(NSArray *)self->_conflictingParameters count])
  {
    v20 = [MEMORY[0x1E4F1CA48] array];
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    v21 = self->_conflictingParameters;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v105 objects:v109 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v106;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v106 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v105 + 1) + 8 * i) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v105 objects:v109 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKeyedSubscript:@"conflictingParameters"];
  }
  if ([(_INPBPayloadUnsupported *)self hasAddTasksIntentContactEventTriggerUnsupportedReason])
  {
    uint64_t v27 = [(_INPBPayloadUnsupported *)self addTasksIntentContactEventTriggerUnsupportedReason];
    if (v27 == 1)
    {
      v28 = @"ACCOUNT_DOES_NOT_SUPPORT";
    }
    else if (v27 == 2)
    {
      v28 = @"CLOUDKIT_NOT_UPGRADED";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v27);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v28 forKeyedSubscript:@"contactEventTriggerUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason])
  {
    uint64_t v29 = [(_INPBPayloadUnsupported *)self setTaskAttributeIntentContactEventTriggerUnsupportedReason];
    if (v29 == 1)
    {
      v30 = @"ACCOUNT_DOES_NOT_SUPPORT";
    }
    else if (v29 == 2)
    {
      v30 = @"CLOUDKIT_NOT_UPGRADED";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v29);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v30 forKeyedSubscript:@"contactEventTriggerUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasStartCallIntentContactsUnsupportedReason])
  {
    uint64_t v31 = [(_INPBPayloadUnsupported *)self startCallIntentContactsUnsupportedReason];
    int v32 = v31 - 1;
    if (v31 - 1) < 0xA && ((0x2FFu >> v32))
    {
      v33 = off_1E551AA88[v32];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v31);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v33 forKeyedSubscript:@"contactsUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasRequestPaymentIntentCurrencyAmountUnsupportedReason])
  {
    uint64_t v34 = [(_INPBPayloadUnsupported *)self requestPaymentIntentCurrencyAmountUnsupportedReason];
    if ((v34 - 1) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v34);
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = off_1E551AAD8[(v34 - 1)];
    }
    [v3 setObject:v35 forKeyedSubscript:@"currencyAmountUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasSendPaymentIntentCurrencyAmountUnsupportedReason])
  {
    uint64_t v36 = [(_INPBPayloadUnsupported *)self sendPaymentIntentCurrencyAmountUnsupportedReason];
    if ((v36 - 1) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v36);
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = off_1E551AAD8[(v36 - 1)];
    }
    [v3 setObject:v37 forKeyedSubscript:@"currencyAmountUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasCustomUnsupportedReason])
  {
    v38 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[_INPBPayloadUnsupported customUnsupportedReason](self, "customUnsupportedReason"));
    [v3 setObject:v38 forKeyedSubscript:@"customUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasDateTimeRangeUnsupportedReason])
  {
    uint64_t v39 = [(_INPBPayloadUnsupported *)self dateTimeRangeUnsupportedReason];
    if (v39 == 1)
    {
      v40 = @"PAST_DATE_TIME";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v39);
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v40 forKeyedSubscript:@"dateTimeRangeUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason])
  {
    uint64_t v41 = [(_INPBPayloadUnsupported *)self findDeviceAndPlaySoundIntentDeviceUnsupportedReason];
    if (v41 == 1)
    {
      v42 = @"UNKNOWN";
    }
    else if (v41 == 2)
    {
      v42 = @"SERVICE_UNAVAILABLE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v41);
      v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v42 forKeyedSubscript:@"deviceUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasJoinCallIntentGroupConversationUnsupportedReason])
  {
    uint64_t v43 = [(_INPBPayloadUnsupported *)self joinCallIntentGroupConversationUnsupportedReason];
    if (v43 == 1)
    {
      v44 = @"NO_ACTIVE_NOTIFICATIONS";
    }
    else if (v43 == 2)
    {
      v44 = @"NO_MATCHING_NOTIFICATIONS";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v43);
      v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v44 forKeyedSubscript:@"groupConversationUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasReportIncidentIntentIncidentTypeUnsupportedReason])
  {
    uint64_t v45 = [(_INPBPayloadUnsupported *)self reportIncidentIntentIncidentTypeUnsupportedReason];
    if (v45 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v45);
      v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v46 = off_1E551AAF0[v45];
    }
    [v3 setObject:v46 forKeyedSubscript:@"incidentTypeUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasCreateTimerIntentLabelUnsupportedReason])
  {
    uint64_t v47 = [(_INPBPayloadUnsupported *)self createTimerIntentLabelUnsupportedReason];
    if (v47)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v47);
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v48 = @"AMBIGUOUS_UNNAMED_TIMER";
    }
    [v3 setObject:v48 forKeyedSubscript:@"labelUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasAddMediaIntentMediaDestinationUnsupportedReason])
  {
    uint64_t v49 = [(_INPBPayloadUnsupported *)self addMediaIntentMediaDestinationUnsupportedReason];
    if (v49 == 1)
    {
      v50 = @"PLAYLIST_NAME_NOT_FOUND";
    }
    else if (v49 == 2)
    {
      v50 = @"PLAYLIST_NOT_EDITABLE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v49);
      v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v50 forKeyedSubscript:@"mediaDestinationUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasAddMediaIntentMediaItemsUnsupportedReason])
  {
    uint64_t v51 = [(_INPBPayloadUnsupported *)self addMediaIntentMediaItemsUnsupportedReason];
    if (!v53 & v52)
    {
      switch((int)v51)
      {
        case 'd':
          v54 = @"APP_NOT_CONFIGURED";
          break;
        case 'e':
          v54 = @"APP_NOT_AVAILABLE";
          break;
        case 'f':
          v54 = @"APP_ACCOUNT_FAILURE";
          break;
        case 'g':
          v54 = @"APP_DOESNT_SUPPORT_INTENT";
          break;
        case 'h':
          v54 = @"ALREADY_IN_LIBRARY";
          break;
        case 'i':
          v54 = @"CLOUD_SYNC_OFF";
          break;
        case 'j':
          v54 = @"GET_NOWPLAYING_FAILURE";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v51);
          v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
    }
    else
    {
      v54 = @"LOGIN_REQUIRED";
      switch((int)v51)
      {
        case 1:
          break;
        case 2:
          v54 = @"SUBSCRIPTION_REQUIRED";
          break;
        case 3:
          v54 = @"UNSUPPORTED_MEDIA_TYPE";
          break;
        case 4:
          v54 = @"EXPLICIT_CONTENT_SETTINGS";
          break;
        case 5:
          v54 = @"CELLULAR_DATA_SETTINGS";
          break;
        case 6:
          v54 = @"RESTRICTED_CONTENT";
          break;
        case 7:
          v54 = @"SERVICE_UNAVAILABLE";
          break;
        case 8:
          v54 = @"REGION_RESTRICTION";
          break;
        default:
LABEL_328:
          JUMPOUT(0);
      }
    }
    [v3 setObject:v54 forKeyedSubscript:@"mediaItemsUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasPlayMediaIntentMediaItemsUnsupportedReason])
  {
    uint64_t v55 = [(_INPBPayloadUnsupported *)self playMediaIntentMediaItemsUnsupportedReason];
    if (!(!v53 & v52))
    {
      v56 = @"LOGIN_REQUIRED";
      switch((int)v55)
      {
        case 1:
          goto LABEL_169;
        case 2:
          v56 = @"SUBSCRIPTION_REQUIRED";
          goto LABEL_169;
        case 3:
          v56 = @"UNSUPPORTED_MEDIA_TYPE";
          goto LABEL_169;
        case 4:
          v56 = @"EXPLICIT_CONTENT_SETTINGS";
          goto LABEL_169;
        case 5:
          v56 = @"CELLULAR_DATA_SETTINGS";
          goto LABEL_169;
        case 6:
          v56 = @"RESTRICTED_CONTENT";
          goto LABEL_169;
        case 7:
          v56 = @"SERVICE_UNAVAILABLE";
          goto LABEL_169;
        case 8:
          v56 = @"REGION_RESTRICTION";
          goto LABEL_169;
        case 9:
          v56 = @"NOT_DOWNLOADED_FOR_OFFLINE";
          goto LABEL_169;
        default:
          goto LABEL_328;
      }
    }
    switch((int)v55)
    {
      case 'd':
        v56 = @"APP_NOT_CONFIGURED";
        break;
      case 'e':
        v56 = @"APP_NOT_AVAILABLE";
        break;
      case 'f':
        v56 = @"APP_ACCOUNT_FAILURE";
        break;
      case 'g':
        v56 = @"APP_DOESNT_SUPPORT_INTENT";
        break;
      case 'h':
        v56 = @"MS_LIMIT_REACHED";
        break;
      case 'i':
        v56 = @"MEDIA_PLAYBACK_DISABLED";
        break;
      default:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v55);
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
LABEL_169:
    [v3 setObject:v56 forKeyedSubscript:@"mediaItemsUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasSearchForMediaIntentMediaItemsUnsupportedReason])
  {
    uint64_t v57 = [(_INPBPayloadUnsupported *)self searchForMediaIntentMediaItemsUnsupportedReason];
    v58 = @"LOGIN_REQUIRED";
    switch((int)v57)
    {
      case 1:
        break;
      case 2:
        v58 = @"SUBSCRIPTION_REQUIRED";
        break;
      case 3:
        v58 = @"UNSUPPORTED_MEDIA_TYPE";
        break;
      case 4:
        v58 = @"EXPLICIT_CONTENT_SETTINGS";
        break;
      case 5:
        v58 = @"CELLULAR_DATA_SETTINGS";
        break;
      case 6:
        v58 = @"RESTRICTED_CONTENT";
        break;
      case 7:
        v58 = @"SERVICE_UNAVAILABLE";
        break;
      case 8:
        v58 = @"REGION_RESTRICTION";
        break;
      default:
        switch((int)v57)
        {
          case 'd':
            v58 = @"APP_NOT_CONFIGURED";
            break;
          case 'e':
            v58 = @"APP_NOT_AVAILABLE";
            break;
          case 'f':
            v58 = @"APP_ACCOUNT_FAILURE";
            break;
          case 'g':
            v58 = @"APP_DOESNT_SUPPORT_INTENT";
            break;
          default:
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v57);
            v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
            break;
        }
        break;
    }
    [v3 setObject:v58 forKeyedSubscript:@"mediaItemsUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason])
  {
    uint64_t v59 = [(_INPBPayloadUnsupported *)self updateMediaAffinityIntentMediaItemsUnsupportedReason];
    v60 = @"LOGIN_REQUIRED";
    switch((int)v59)
    {
      case 1:
        break;
      case 2:
        v60 = @"SUBSCRIPTION_REQUIRED";
        break;
      case 3:
        v60 = @"UNSUPPORTED_MEDIA_TYPE";
        break;
      case 4:
        v60 = @"EXPLICIT_CONTENT_SETTINGS";
        break;
      case 5:
        v60 = @"CELLULAR_DATA_SETTINGS";
        break;
      case 6:
        v60 = @"RESTRICTED_CONTENT";
        break;
      case 7:
        v60 = @"SERVICE_UNAVAILABLE";
        break;
      case 8:
        v60 = @"REGION_RESTRICTION";
        break;
      default:
        switch((int)v59)
        {
          case 'd':
            v60 = @"APP_NOT_CONFIGURED";
            break;
          case 'e':
            v60 = @"APP_NOT_AVAILABLE";
            break;
          case 'f':
            v60 = @"APP_ACCOUNT_FAILURE";
            break;
          case 'g':
            v60 = @"APP_DOESNT_SUPPORT_INTENT";
            break;
          default:
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v59);
            v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
            break;
        }
        break;
    }
    [v3 setObject:v60 forKeyedSubscript:@"mediaItemsUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasParticipantUnsupportedReason])
  {
    uint64_t v61 = [(_INPBPayloadUnsupported *)self participantUnsupportedReason];
    if (v61 == 1)
    {
      v62 = @"INVALID_PARTICIPANT";
    }
    else if (v61 == 2)
    {
      v62 = @"PARTICIPANT_NOT_FOUND";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v61);
      v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v62 forKeyedSubscript:@"participantUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasAddCallParticipantIntentParticipantsUnsupportedReason])
  {
    uint64_t v63 = [(_INPBPayloadUnsupported *)self addCallParticipantIntentParticipantsUnsupportedReason];
    if ((v63 - 1) >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v63);
      v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v64 = off_1E551AB18[(v63 - 1)];
    }
    [v3 setObject:v64 forKeyedSubscript:@"participantsUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasSendPaymentIntentPayeeUnsupportedReason])
  {
    uint64_t v65 = [(_INPBPayloadUnsupported *)self sendPaymentIntentPayeeUnsupportedReason];
    if ((v65 - 1) >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v65);
      v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v66 = off_1E551AB48[(v65 - 1)];
    }
    [v3 setObject:v66 forKeyedSubscript:@"payeeUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasRequestPaymentIntentPayerUnsupportedReason])
  {
    uint64_t v67 = [(_INPBPayloadUnsupported *)self requestPaymentIntentPayerUnsupportedReason];
    if ((v67 - 1) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v67);
      v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v68 = off_1E551AB68[(v67 - 1)];
    }
    [v3 setObject:v68 forKeyedSubscript:@"payerUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasPlayMediaIntentPlaybackSpeedUnsupportedReason])
  {
    uint64_t v69 = [(_INPBPayloadUnsupported *)self playMediaIntentPlaybackSpeedUnsupportedReason];
    if (v69 == 1)
    {
      v70 = @"BELOW_MINIMUM";
    }
    else if (v69 == 2)
    {
      v70 = @"ABOVE_MAXIMUM";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v69);
      v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v70 forKeyedSubscript:@"playbackSpeedUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasStartCallIntentPreferredCallProviderUnsupportedReason])
  {
    uint64_t v71 = [(_INPBPayloadUnsupported *)self startCallIntentPreferredCallProviderUnsupportedReason];
    if ((v71 - 1) >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v71);
      v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v72 = off_1E551AB80[(v71 - 1)];
    }
    [v3 setObject:v72 forKeyedSubscript:@"preferredCallProviderUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasReason])
  {
    uint64_t v73 = [(_INPBPayloadUnsupported *)self reason];
    v74 = @"None";
    switch((int)v73)
    {
      case 1:
        break;
      case 2:
        v74 = @"NotNow";
        break;
      case 3:
        v74 = @"NotHere";
        break;
      case 4:
        v74 = @"ConflictWithOtherFields";
        break;
      default:
        if (v73 == 1000)
        {
          v74 = @"UnsupportedReasonExtension";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v73);
          v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
    [v3 setObject:v74 forKeyedSubscript:@"reason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasShareETAIntentRecipientUnsupportedReason])
  {
    uint64_t v75 = [(_INPBPayloadUnsupported *)self shareETAIntentRecipientUnsupportedReason];
    if (v75 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v75);
      v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v76 = off_1E551ABB0[v75];
    }
    [v3 setObject:v76 forKeyedSubscript:@"recipientUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasStopShareETAIntentRecipientUnsupportedReason])
  {
    uint64_t v77 = [(_INPBPayloadUnsupported *)self stopShareETAIntentRecipientUnsupportedReason];
    if (v77 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v77);
      v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v78 = off_1E551ABB0[v77];
    }
    [v3 setObject:v78 forKeyedSubscript:@"recipientUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasSendMessageIntentRecipientUnsupportedReason])
  {
    uint64_t v79 = [(_INPBPayloadUnsupported *)self sendMessageIntentRecipientUnsupportedReason];
    if ((v79 - 1) >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v79);
      v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v80 = off_1E551ABD8[(v79 - 1)];
    }
    [v3 setObject:v80 forKeyedSubscript:@"recipientUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasSendAnnouncementIntentRecipientsUnsupportedReason])
  {
    uint64_t v81 = [(_INPBPayloadUnsupported *)self sendAnnouncementIntentRecipientsUnsupportedReason];
    if ((v81 - 1) >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v81);
      v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v82 = off_1E551AC28[(v81 - 1)];
    }
    [v3 setObject:v82 forKeyedSubscript:@"recipientsUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasSaveHealthSampleIntentRecordDateUnsupportedReason])
  {
    uint64_t v83 = [(_INPBPayloadUnsupported *)self saveHealthSampleIntentRecordDateUnsupportedReason];
    if ((v83 - 1) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v83);
      v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v84 = off_1E551AC48[(v83 - 1)];
    }
    [v3 setObject:v84 forKeyedSubscript:@"recordDateUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasTargetEventUnsupportedReason])
  {
    uint64_t v85 = [(_INPBPayloadUnsupported *)self targetEventUnsupportedReason];
    if (v85 == 1)
    {
      v86 = @"TARGET_EVENT_NOT_FOUND";
    }
    else if (v85 == 2)
    {
      v86 = @"TARGET_EVENT_NOT_CREATED_BY_USER";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v85);
      v86 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v86 forKeyedSubscript:@"targetEventUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasAddTasksIntentTargetTaskListMembersUnsupportedReason])
  {
    uint64_t v87 = [(_INPBPayloadUnsupported *)self addTasksIntentTargetTaskListMembersUnsupportedReason];
    if (v87 == 1)
    {
      v88 = @"NO_SHARED_LIST_WITH_CONTACT";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v87);
      v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v88 forKeyedSubscript:@"targetTaskListMembersUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasSetTimerAttributeIntentTargetTimerUnsupportedReason])
  {
    uint64_t v89 = [(_INPBPayloadUnsupported *)self setTimerAttributeIntentTargetTimerUnsupportedReason];
    if (v89)
    {
      if (v89 == 1)
      {
        v90 = @"NO_TIMERS";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v89);
        v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v90 = @"NOT_FOUND";
    }
    [v3 setObject:v90 forKeyedSubscript:@"targetTimerUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasDeleteTasksIntentTaskListUnsupportedReason])
  {
    uint64_t v91 = [(_INPBPayloadUnsupported *)self deleteTasksIntentTaskListUnsupportedReason];
    if (v91 == 1)
    {
      v92 = @"NO_TASK_LIST_FOUND";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v91);
      v92 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v92 forKeyedSubscript:@"taskListUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasDeleteTasksIntentTaskUnsupportedReason])
  {
    uint64_t v93 = [(_INPBPayloadUnsupported *)self deleteTasksIntentTaskUnsupportedReason];
    if (v93 == 1)
    {
      v94 = @"NO_TASKS_FOUND";
    }
    else if (v93 == 2)
    {
      v94 = @"NO_TASKS_IN_APP";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v93);
      v94 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v94 forKeyedSubscript:@"taskUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasSnoozeTasksIntentTaskUnsupportedReason])
  {
    uint64_t v95 = [(_INPBPayloadUnsupported *)self snoozeTasksIntentTaskUnsupportedReason];
    if (v95 == 1)
    {
      v96 = @"NO_TASKS_FOUND";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v95);
      v96 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v96 forKeyedSubscript:@"taskUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasAddTasksIntentTemporalEventTriggerUnsupportedReason])
  {
    uint64_t v97 = [(_INPBPayloadUnsupported *)self addTasksIntentTemporalEventTriggerUnsupportedReason];
    if (v97 == 1)
    {
      v98 = @"TIME_IN_PAST";
    }
    else if (v97 == 2)
    {
      v98 = @"INVALID_RECURRENCE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v97);
      v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v98 forKeyedSubscript:@"temporalEventTriggerUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason])
  {
    uint64_t v99 = [(_INPBPayloadUnsupported *)self setTaskAttributeIntentTemporalEventTriggerUnsupportedReason];
    if (v99 == 1)
    {
      v100 = @"TIME_IN_PAST";
    }
    else if (v99 == 2)
    {
      v100 = @"INVALID_RECURRENCE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v99);
      v100 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v100 forKeyedSubscript:@"temporalEventTriggerUnsupportedReason"];
  }
  if ([(_INPBPayloadUnsupported *)self hasRunWorkflowIntentWorkflowUnsupportedReason])
  {
    uint64_t v101 = [(_INPBPayloadUnsupported *)self runWorkflowIntentWorkflowUnsupportedReason];
    if (v101)
    {
      if (v101 == 1)
      {
        v102 = @"NO_WORKFLOWS";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v101);
        v102 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v102 = @"NOT_FOUND";
    }
    [v3 setObject:v102 forKeyedSubscript:@"workflowUnsupportedReason"];
  }
  id v103 = v3;

  return v103;
}

- (unint64_t)hash
{
  if ([(_INPBPayloadUnsupported *)self hasUpdateAlarmIntentAlarmUnsupportedReason])
  {
    uint64_t v50 = 2654435761 * self->_updateAlarmIntentAlarmUnsupportedReason;
  }
  else
  {
    uint64_t v50 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasChangeAlarmStatusIntentAlarmsUnsupportedReason])
  {
    uint64_t v49 = 2654435761 * self->_changeAlarmStatusIntentAlarmsUnsupportedReason;
  }
  else
  {
    uint64_t v49 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasDeleteAlarmIntentAlarmsUnsupportedReason])
  {
    uint64_t v48 = 2654435761 * self->_deleteAlarmIntentAlarmsUnsupportedReason;
  }
  else
  {
    uint64_t v48 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasSearchAlarmIntentAlarmsUnsupportedReason])
  {
    uint64_t v47 = 2654435761 * self->_searchAlarmIntentAlarmsUnsupportedReason;
  }
  else
  {
    uint64_t v47 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasSnoozeAlarmIntentAlarmsUnsupportedReason])
  {
    uint64_t v46 = 2654435761 * self->_snoozeAlarmIntentAlarmsUnsupportedReason;
  }
  else
  {
    uint64_t v46 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasSendAnnouncementIntentAnnouncementUnsupportedReason])
  {
    uint64_t v45 = 2654435761 * self->_sendAnnouncementIntentAnnouncementUnsupportedReason;
  }
  else
  {
    uint64_t v45 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasStartCallIntentCallCapabilityUnsupportedReason])
  {
    uint64_t v44 = 2654435761 * self->_startCallIntentCallCapabilityUnsupportedReason;
  }
  else
  {
    uint64_t v44 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasStartCallIntentCallRecordToCallBackUnsupportedReason])
  {
    uint64_t v43 = 2654435761 * self->_startCallIntentCallRecordToCallBackUnsupportedReason;
  }
  else
  {
    uint64_t v43 = 0;
  }
  uint64_t v42 = [(NSArray *)self->_conflictingParameters hash];
  if ([(_INPBPayloadUnsupported *)self hasAddTasksIntentContactEventTriggerUnsupportedReason])
  {
    uint64_t v41 = 2654435761 * self->_addTasksIntentContactEventTriggerUnsupportedReason;
  }
  else
  {
    uint64_t v41 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason])
  {
    uint64_t v40 = 2654435761 * self->_setTaskAttributeIntentContactEventTriggerUnsupportedReason;
  }
  else
  {
    uint64_t v40 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasStartCallIntentContactsUnsupportedReason])
  {
    uint64_t v39 = 2654435761 * self->_startCallIntentContactsUnsupportedReason;
  }
  else
  {
    uint64_t v39 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasRequestPaymentIntentCurrencyAmountUnsupportedReason])
  {
    uint64_t v38 = 2654435761 * self->_requestPaymentIntentCurrencyAmountUnsupportedReason;
  }
  else
  {
    uint64_t v38 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasSendPaymentIntentCurrencyAmountUnsupportedReason])
  {
    uint64_t v37 = 2654435761 * self->_sendPaymentIntentCurrencyAmountUnsupportedReason;
  }
  else
  {
    uint64_t v37 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasCustomUnsupportedReason]) {
    uint64_t v36 = 2654435761 * self->_customUnsupportedReason;
  }
  else {
    uint64_t v36 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasDateTimeRangeUnsupportedReason]) {
    uint64_t v35 = 2654435761 * self->_dateTimeRangeUnsupportedReason;
  }
  else {
    uint64_t v35 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason])
  {
    uint64_t v34 = 2654435761 * self->_findDeviceAndPlaySoundIntentDeviceUnsupportedReason;
  }
  else
  {
    uint64_t v34 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasJoinCallIntentGroupConversationUnsupportedReason])
  {
    uint64_t v33 = 2654435761 * self->_joinCallIntentGroupConversationUnsupportedReason;
  }
  else
  {
    uint64_t v33 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasReportIncidentIntentIncidentTypeUnsupportedReason])
  {
    uint64_t v32 = 2654435761 * self->_reportIncidentIntentIncidentTypeUnsupportedReason;
  }
  else
  {
    uint64_t v32 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasCreateTimerIntentLabelUnsupportedReason])
  {
    uint64_t v31 = 2654435761 * self->_createTimerIntentLabelUnsupportedReason;
  }
  else
  {
    uint64_t v31 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasAddMediaIntentMediaDestinationUnsupportedReason])
  {
    uint64_t v30 = 2654435761 * self->_addMediaIntentMediaDestinationUnsupportedReason;
  }
  else
  {
    uint64_t v30 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasAddMediaIntentMediaItemsUnsupportedReason])
  {
    uint64_t v29 = 2654435761 * self->_addMediaIntentMediaItemsUnsupportedReason;
  }
  else
  {
    uint64_t v29 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasPlayMediaIntentMediaItemsUnsupportedReason])
  {
    uint64_t v28 = 2654435761 * self->_playMediaIntentMediaItemsUnsupportedReason;
  }
  else
  {
    uint64_t v28 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasSearchForMediaIntentMediaItemsUnsupportedReason])
  {
    uint64_t v27 = 2654435761 * self->_searchForMediaIntentMediaItemsUnsupportedReason;
  }
  else
  {
    uint64_t v27 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason])
  {
    uint64_t v26 = 2654435761 * self->_updateMediaAffinityIntentMediaItemsUnsupportedReason;
  }
  else
  {
    uint64_t v26 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasParticipantUnsupportedReason]) {
    uint64_t v25 = 2654435761 * self->_participantUnsupportedReason;
  }
  else {
    uint64_t v25 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasAddCallParticipantIntentParticipantsUnsupportedReason])
  {
    uint64_t v24 = 2654435761 * self->_addCallParticipantIntentParticipantsUnsupportedReason;
  }
  else
  {
    uint64_t v24 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasSendPaymentIntentPayeeUnsupportedReason])
  {
    uint64_t v23 = 2654435761 * self->_sendPaymentIntentPayeeUnsupportedReason;
  }
  else
  {
    uint64_t v23 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasRequestPaymentIntentPayerUnsupportedReason])
  {
    uint64_t v22 = 2654435761 * self->_requestPaymentIntentPayerUnsupportedReason;
  }
  else
  {
    uint64_t v22 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasPlayMediaIntentPlaybackSpeedUnsupportedReason])
  {
    uint64_t v21 = 2654435761 * self->_playMediaIntentPlaybackSpeedUnsupportedReason;
  }
  else
  {
    uint64_t v21 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasStartCallIntentPreferredCallProviderUnsupportedReason])
  {
    uint64_t v20 = 2654435761 * self->_startCallIntentPreferredCallProviderUnsupportedReason;
  }
  else
  {
    uint64_t v20 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasReason]) {
    uint64_t v19 = 2654435761 * self->_reason;
  }
  else {
    uint64_t v19 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasShareETAIntentRecipientUnsupportedReason])
  {
    uint64_t v18 = 2654435761 * self->_shareETAIntentRecipientUnsupportedReason;
  }
  else
  {
    uint64_t v18 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasStopShareETAIntentRecipientUnsupportedReason])
  {
    uint64_t v17 = 2654435761 * self->_stopShareETAIntentRecipientUnsupportedReason;
  }
  else
  {
    uint64_t v17 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasSendMessageIntentRecipientUnsupportedReason])
  {
    uint64_t v16 = 2654435761 * self->_sendMessageIntentRecipientUnsupportedReason;
  }
  else
  {
    uint64_t v16 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasSendAnnouncementIntentRecipientsUnsupportedReason])
  {
    uint64_t v15 = 2654435761 * self->_sendAnnouncementIntentRecipientsUnsupportedReason;
  }
  else
  {
    uint64_t v15 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasSaveHealthSampleIntentRecordDateUnsupportedReason])
  {
    BOOL v3 = [(_INPBPayloadUnsupported *)self hasTargetEventUnsupportedReason];
  }
  else
  {
    BOOL v3 = [(_INPBPayloadUnsupported *)self hasTargetEventUnsupportedReason];
  }
  if (v3) {
    uint64_t v4 = 2654435761 * self->_targetEventUnsupportedReason;
  }
  else {
    uint64_t v4 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasAddTasksIntentTargetTaskListMembersUnsupportedReason])
  {
    uint64_t v5 = 2654435761 * self->_addTasksIntentTargetTaskListMembersUnsupportedReason;
  }
  else
  {
    uint64_t v5 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasSetTimerAttributeIntentTargetTimerUnsupportedReason])
  {
    uint64_t v6 = 2654435761 * self->_setTimerAttributeIntentTargetTimerUnsupportedReason;
  }
  else
  {
    uint64_t v6 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasDeleteTasksIntentTaskListUnsupportedReason])
  {
    uint64_t v7 = 2654435761 * self->_deleteTasksIntentTaskListUnsupportedReason;
  }
  else
  {
    uint64_t v7 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasDeleteTasksIntentTaskUnsupportedReason])
  {
    uint64_t v8 = 2654435761 * self->_deleteTasksIntentTaskUnsupportedReason;
  }
  else
  {
    uint64_t v8 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasSnoozeTasksIntentTaskUnsupportedReason])
  {
    uint64_t v9 = 2654435761 * self->_snoozeTasksIntentTaskUnsupportedReason;
  }
  else
  {
    uint64_t v9 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasAddTasksIntentTemporalEventTriggerUnsupportedReason])
  {
    uint64_t v10 = 2654435761 * self->_addTasksIntentTemporalEventTriggerUnsupportedReason;
  }
  else
  {
    uint64_t v10 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason])
  {
    uint64_t v11 = 2654435761 * self->_setTaskAttributeIntentTemporalEventTriggerUnsupportedReason;
  }
  else
  {
    uint64_t v11 = 0;
  }
  if ([(_INPBPayloadUnsupported *)self hasRunWorkflowIntentWorkflowUnsupportedReason])
  {
    uint64_t v12 = 2654435761 * self->_runWorkflowIntentWorkflowUnsupportedReason;
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v49 ^ v50 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v42 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_185;
  }
  int v5 = [(_INPBPayloadUnsupported *)self hasUpdateAlarmIntentAlarmUnsupportedReason];
  if (v5 != [v4 hasUpdateAlarmIntentAlarmUnsupportedReason]) {
    goto LABEL_185;
  }
  if ([(_INPBPayloadUnsupported *)self hasUpdateAlarmIntentAlarmUnsupportedReason])
  {
    if ([v4 hasUpdateAlarmIntentAlarmUnsupportedReason])
    {
      int updateAlarmIntentAlarmUnsupportedReason = self->_updateAlarmIntentAlarmUnsupportedReason;
      if (updateAlarmIntentAlarmUnsupportedReason != [v4 updateAlarmIntentAlarmUnsupportedReason])goto LABEL_185; {
    }
      }
  }
  int v7 = [(_INPBPayloadUnsupported *)self hasChangeAlarmStatusIntentAlarmsUnsupportedReason];
  if (v7 != [v4 hasChangeAlarmStatusIntentAlarmsUnsupportedReason]) {
    goto LABEL_185;
  }
  if ([(_INPBPayloadUnsupported *)self hasChangeAlarmStatusIntentAlarmsUnsupportedReason])
  {
    if ([v4 hasChangeAlarmStatusIntentAlarmsUnsupportedReason])
    {
      int changeAlarmStatusIntentAlarmsUnsupportedReason = self->_changeAlarmStatusIntentAlarmsUnsupportedReason;
      if (changeAlarmStatusIntentAlarmsUnsupportedReason != [v4 changeAlarmStatusIntentAlarmsUnsupportedReason])goto LABEL_185; {
    }
      }
  }
  int v9 = [(_INPBPayloadUnsupported *)self hasDeleteAlarmIntentAlarmsUnsupportedReason];
  if (v9 != [v4 hasDeleteAlarmIntentAlarmsUnsupportedReason]) {
    goto LABEL_185;
  }
  if ([(_INPBPayloadUnsupported *)self hasDeleteAlarmIntentAlarmsUnsupportedReason])
  {
    if ([v4 hasDeleteAlarmIntentAlarmsUnsupportedReason])
    {
      int deleteAlarmIntentAlarmsUnsupportedReason = self->_deleteAlarmIntentAlarmsUnsupportedReason;
      if (deleteAlarmIntentAlarmsUnsupportedReason != [v4 deleteAlarmIntentAlarmsUnsupportedReason])goto LABEL_185; {
    }
      }
  }
  int v11 = [(_INPBPayloadUnsupported *)self hasSearchAlarmIntentAlarmsUnsupportedReason];
  if (v11 != [v4 hasSearchAlarmIntentAlarmsUnsupportedReason]) {
    goto LABEL_185;
  }
  if ([(_INPBPayloadUnsupported *)self hasSearchAlarmIntentAlarmsUnsupportedReason])
  {
    if ([v4 hasSearchAlarmIntentAlarmsUnsupportedReason])
    {
      int searchAlarmIntentAlarmsUnsupportedReason = self->_searchAlarmIntentAlarmsUnsupportedReason;
      if (searchAlarmIntentAlarmsUnsupportedReason != [v4 searchAlarmIntentAlarmsUnsupportedReason])goto LABEL_185; {
    }
      }
  }
  int v13 = [(_INPBPayloadUnsupported *)self hasSnoozeAlarmIntentAlarmsUnsupportedReason];
  if (v13 != [v4 hasSnoozeAlarmIntentAlarmsUnsupportedReason]) {
    goto LABEL_185;
  }
  if ([(_INPBPayloadUnsupported *)self hasSnoozeAlarmIntentAlarmsUnsupportedReason])
  {
    if ([v4 hasSnoozeAlarmIntentAlarmsUnsupportedReason])
    {
      int snoozeAlarmIntentAlarmsUnsupportedReason = self->_snoozeAlarmIntentAlarmsUnsupportedReason;
      if (snoozeAlarmIntentAlarmsUnsupportedReason != [v4 snoozeAlarmIntentAlarmsUnsupportedReason])goto LABEL_185; {
    }
      }
  }
  int v15 = [(_INPBPayloadUnsupported *)self hasSendAnnouncementIntentAnnouncementUnsupportedReason];
  if (v15 != [v4 hasSendAnnouncementIntentAnnouncementUnsupportedReason]) {
    goto LABEL_185;
  }
  if ([(_INPBPayloadUnsupported *)self hasSendAnnouncementIntentAnnouncementUnsupportedReason])
  {
    if ([v4 hasSendAnnouncementIntentAnnouncementUnsupportedReason])
    {
      int sendAnnouncementIntentAnnouncementUnsupportedReason = self->_sendAnnouncementIntentAnnouncementUnsupportedReason;
      if (sendAnnouncementIntentAnnouncementUnsupportedReason != [v4 sendAnnouncementIntentAnnouncementUnsupportedReason])goto LABEL_185; {
    }
      }
  }
  int v17 = [(_INPBPayloadUnsupported *)self hasStartCallIntentCallCapabilityUnsupportedReason];
  if (v17 != [v4 hasStartCallIntentCallCapabilityUnsupportedReason]) {
    goto LABEL_185;
  }
  if ([(_INPBPayloadUnsupported *)self hasStartCallIntentCallCapabilityUnsupportedReason])
  {
    if ([v4 hasStartCallIntentCallCapabilityUnsupportedReason])
    {
      int startCallIntentCallCapabilityUnsupportedReason = self->_startCallIntentCallCapabilityUnsupportedReason;
      if (startCallIntentCallCapabilityUnsupportedReason != [v4 startCallIntentCallCapabilityUnsupportedReason])goto LABEL_185; {
    }
      }
  }
  int v19 = [(_INPBPayloadUnsupported *)self hasStartCallIntentCallRecordToCallBackUnsupportedReason];
  if (v19 != [v4 hasStartCallIntentCallRecordToCallBackUnsupportedReason]) {
    goto LABEL_185;
  }
  if ([(_INPBPayloadUnsupported *)self hasStartCallIntentCallRecordToCallBackUnsupportedReason])
  {
    if ([v4 hasStartCallIntentCallRecordToCallBackUnsupportedReason])
    {
      int startCallIntentCallRecordToCallBackUnsupportedReason = self->_startCallIntentCallRecordToCallBackUnsupportedReason;
      if (startCallIntentCallRecordToCallBackUnsupportedReason != [v4 startCallIntentCallRecordToCallBackUnsupportedReason])goto LABEL_185; {
    }
      }
  }
  uint64_t v21 = [(_INPBPayloadUnsupported *)self conflictingParameters];
  uint64_t v22 = [v4 conflictingParameters];
  uint64_t v23 = v22;
  if ((v21 == 0) != (v22 != 0))
  {
    uint64_t v24 = [(_INPBPayloadUnsupported *)self conflictingParameters];
    if (v24)
    {
      uint64_t v25 = (void *)v24;
      uint64_t v26 = [(_INPBPayloadUnsupported *)self conflictingParameters];
      uint64_t v27 = [v4 conflictingParameters];
      int v28 = [v26 isEqual:v27];

      if (!v28) {
        goto LABEL_185;
      }
    }
    else
    {
    }
    int v29 = [(_INPBPayloadUnsupported *)self hasAddTasksIntentContactEventTriggerUnsupportedReason];
    if (v29 == [v4 hasAddTasksIntentContactEventTriggerUnsupportedReason])
    {
      if (!-[_INPBPayloadUnsupported hasAddTasksIntentContactEventTriggerUnsupportedReason](self, "hasAddTasksIntentContactEventTriggerUnsupportedReason")|| ![v4 hasAddTasksIntentContactEventTriggerUnsupportedReason]|| (int addTasksIntentContactEventTriggerUnsupportedReason = self->_addTasksIntentContactEventTriggerUnsupportedReason, addTasksIntentContactEventTriggerUnsupportedReason == objc_msgSend(v4, "addTasksIntentContactEventTriggerUnsupportedReason")))
      {
        int v31 = [(_INPBPayloadUnsupported *)self hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason];
        if (v31 == [v4 hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason])
        {
          if (!-[_INPBPayloadUnsupported hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason](self, "hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason")|| ![v4 hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason]|| (int setTaskAttributeIntentContactEventTriggerUnsupportedReason = self->_setTaskAttributeIntentContactEventTriggerUnsupportedReason, setTaskAttributeIntentContactEventTriggerUnsupportedReason == objc_msgSend(v4, "setTaskAttributeIntentContactEventTriggerUnsupportedReason")))
          {
            int v33 = [(_INPBPayloadUnsupported *)self hasStartCallIntentContactsUnsupportedReason];
            if (v33 == [v4 hasStartCallIntentContactsUnsupportedReason])
            {
              if (!-[_INPBPayloadUnsupported hasStartCallIntentContactsUnsupportedReason](self, "hasStartCallIntentContactsUnsupportedReason")|| ![v4 hasStartCallIntentContactsUnsupportedReason]|| (int startCallIntentContactsUnsupportedReason = self->_startCallIntentContactsUnsupportedReason, startCallIntentContactsUnsupportedReason == objc_msgSend(v4, "startCallIntentContactsUnsupportedReason")))
              {
                int v35 = [(_INPBPayloadUnsupported *)self hasRequestPaymentIntentCurrencyAmountUnsupportedReason];
                if (v35 == [v4 hasRequestPaymentIntentCurrencyAmountUnsupportedReason])
                {
                  if (!-[_INPBPayloadUnsupported hasRequestPaymentIntentCurrencyAmountUnsupportedReason](self, "hasRequestPaymentIntentCurrencyAmountUnsupportedReason")|| ![v4 hasRequestPaymentIntentCurrencyAmountUnsupportedReason]|| (int requestPaymentIntentCurrencyAmountUnsupportedReason = self->_requestPaymentIntentCurrencyAmountUnsupportedReason, requestPaymentIntentCurrencyAmountUnsupportedReason == objc_msgSend(v4, "requestPaymentIntentCurrencyAmountUnsupportedReason")))
                  {
                    int v37 = [(_INPBPayloadUnsupported *)self hasSendPaymentIntentCurrencyAmountUnsupportedReason];
                    if (v37 == [v4 hasSendPaymentIntentCurrencyAmountUnsupportedReason])
                    {
                      if (!-[_INPBPayloadUnsupported hasSendPaymentIntentCurrencyAmountUnsupportedReason](self, "hasSendPaymentIntentCurrencyAmountUnsupportedReason")|| ![v4 hasSendPaymentIntentCurrencyAmountUnsupportedReason]|| (int sendPaymentIntentCurrencyAmountUnsupportedReason = self->_sendPaymentIntentCurrencyAmountUnsupportedReason, sendPaymentIntentCurrencyAmountUnsupportedReason == objc_msgSend(v4, "sendPaymentIntentCurrencyAmountUnsupportedReason")))
                      {
                        int v39 = [(_INPBPayloadUnsupported *)self hasCustomUnsupportedReason];
                        if (v39 == [v4 hasCustomUnsupportedReason])
                        {
                          if (!-[_INPBPayloadUnsupported hasCustomUnsupportedReason](self, "hasCustomUnsupportedReason")|| ![v4 hasCustomUnsupportedReason]|| (unsigned int customUnsupportedReason = self->_customUnsupportedReason, customUnsupportedReason == objc_msgSend(v4, "customUnsupportedReason")))
                          {
                            int v41 = [(_INPBPayloadUnsupported *)self hasDateTimeRangeUnsupportedReason];
                            if (v41 == [v4 hasDateTimeRangeUnsupportedReason])
                            {
                              if (!-[_INPBPayloadUnsupported hasDateTimeRangeUnsupportedReason](self, "hasDateTimeRangeUnsupportedReason")|| ![v4 hasDateTimeRangeUnsupportedReason]|| (int dateTimeRangeUnsupportedReason = self->_dateTimeRangeUnsupportedReason, dateTimeRangeUnsupportedReason == objc_msgSend(v4, "dateTimeRangeUnsupportedReason")))
                              {
                                int v43 = [(_INPBPayloadUnsupported *)self hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason];
                                if (v43 == [v4 hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason])
                                {
                                  if (!-[_INPBPayloadUnsupported hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason](self, "hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason")|| ![v4 hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason]|| (int findDeviceAndPlaySoundIntentDeviceUnsupportedReason = self->_findDeviceAndPlaySoundIntentDeviceUnsupportedReason, findDeviceAndPlaySoundIntentDeviceUnsupportedReason == objc_msgSend(v4, "findDeviceAndPlaySoundIntentDeviceUnsupportedReason")))
                                  {
                                    int v45 = [(_INPBPayloadUnsupported *)self hasJoinCallIntentGroupConversationUnsupportedReason];
                                    if (v45 == [v4 hasJoinCallIntentGroupConversationUnsupportedReason])
                                    {
                                      if (!-[_INPBPayloadUnsupported hasJoinCallIntentGroupConversationUnsupportedReason](self, "hasJoinCallIntentGroupConversationUnsupportedReason")|| ![v4 hasJoinCallIntentGroupConversationUnsupportedReason]|| (int joinCallIntentGroupConversationUnsupportedReason = self->_joinCallIntentGroupConversationUnsupportedReason, joinCallIntentGroupConversationUnsupportedReason == objc_msgSend(v4, "joinCallIntentGroupConversationUnsupportedReason")))
                                      {
                                        int v47 = [(_INPBPayloadUnsupported *)self hasReportIncidentIntentIncidentTypeUnsupportedReason];
                                        if (v47 == [v4 hasReportIncidentIntentIncidentTypeUnsupportedReason])
                                        {
                                          if (!-[_INPBPayloadUnsupported hasReportIncidentIntentIncidentTypeUnsupportedReason](self, "hasReportIncidentIntentIncidentTypeUnsupportedReason")|| ![v4 hasReportIncidentIntentIncidentTypeUnsupportedReason]|| (int reportIncidentIntentIncidentTypeUnsupportedReason = self->_reportIncidentIntentIncidentTypeUnsupportedReason, reportIncidentIntentIncidentTypeUnsupportedReason == objc_msgSend(v4, "reportIncidentIntentIncidentTypeUnsupportedReason")))
                                          {
                                            int v49 = [(_INPBPayloadUnsupported *)self hasCreateTimerIntentLabelUnsupportedReason];
                                            if (v49 == [v4 hasCreateTimerIntentLabelUnsupportedReason])
                                            {
                                              if (!-[_INPBPayloadUnsupported hasCreateTimerIntentLabelUnsupportedReason](self, "hasCreateTimerIntentLabelUnsupportedReason")|| ![v4 hasCreateTimerIntentLabelUnsupportedReason]|| (int createTimerIntentLabelUnsupportedReason = self->_createTimerIntentLabelUnsupportedReason, createTimerIntentLabelUnsupportedReason == objc_msgSend(v4, "createTimerIntentLabelUnsupportedReason")))
                                              {
                                                int v51 = [(_INPBPayloadUnsupported *)self hasAddMediaIntentMediaDestinationUnsupportedReason];
                                                if (v51 == [v4 hasAddMediaIntentMediaDestinationUnsupportedReason])
                                                {
                                                  if (!-[_INPBPayloadUnsupported hasAddMediaIntentMediaDestinationUnsupportedReason](self, "hasAddMediaIntentMediaDestinationUnsupportedReason")|| ![v4 hasAddMediaIntentMediaDestinationUnsupportedReason]|| (int addMediaIntentMediaDestinationUnsupportedReason = self->_addMediaIntentMediaDestinationUnsupportedReason, addMediaIntentMediaDestinationUnsupportedReason == objc_msgSend(v4, "addMediaIntentMediaDestinationUnsupportedReason")))
                                                  {
                                                    int v53 = [(_INPBPayloadUnsupported *)self hasAddMediaIntentMediaItemsUnsupportedReason];
                                                    if (v53 == [v4 hasAddMediaIntentMediaItemsUnsupportedReason])
                                                    {
                                                      if (!-[_INPBPayloadUnsupported hasAddMediaIntentMediaItemsUnsupportedReason](self, "hasAddMediaIntentMediaItemsUnsupportedReason")|| ![v4 hasAddMediaIntentMediaItemsUnsupportedReason]|| (int addMediaIntentMediaItemsUnsupportedReason = self->_addMediaIntentMediaItemsUnsupportedReason, addMediaIntentMediaItemsUnsupportedReason == objc_msgSend(v4, "addMediaIntentMediaItemsUnsupportedReason")))
                                                      {
                                                        int v55 = [(_INPBPayloadUnsupported *)self hasPlayMediaIntentMediaItemsUnsupportedReason];
                                                        if (v55 == [v4 hasPlayMediaIntentMediaItemsUnsupportedReason])
                                                        {
                                                          if (!-[_INPBPayloadUnsupported hasPlayMediaIntentMediaItemsUnsupportedReason](self, "hasPlayMediaIntentMediaItemsUnsupportedReason")|| ![v4 hasPlayMediaIntentMediaItemsUnsupportedReason]|| (int playMediaIntentMediaItemsUnsupportedReason = self->_playMediaIntentMediaItemsUnsupportedReason, playMediaIntentMediaItemsUnsupportedReason == objc_msgSend(v4, "playMediaIntentMediaItemsUnsupportedReason")))
                                                          {
                                                            int v57 = [(_INPBPayloadUnsupported *)self hasSearchForMediaIntentMediaItemsUnsupportedReason];
                                                            if (v57 == [v4 hasSearchForMediaIntentMediaItemsUnsupportedReason])
                                                            {
                                                              if (!-[_INPBPayloadUnsupported hasSearchForMediaIntentMediaItemsUnsupportedReason](self, "hasSearchForMediaIntentMediaItemsUnsupportedReason")|| ![v4 hasSearchForMediaIntentMediaItemsUnsupportedReason]|| (int searchForMediaIntentMediaItemsUnsupportedReason = self->_searchForMediaIntentMediaItemsUnsupportedReason, searchForMediaIntentMediaItemsUnsupportedReason == objc_msgSend(v4, "searchForMediaIntentMediaItemsUnsupportedReason")))
                                                              {
                                                                int v59 = [(_INPBPayloadUnsupported *)self hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason];
                                                                if (v59 == [v4 hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason])
                                                                {
                                                                  if (!-[_INPBPayloadUnsupported hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason](self, "hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason")|| ![v4 hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason]|| (int updateMediaAffinityIntentMediaItemsUnsupportedReason = self->_updateMediaAffinityIntentMediaItemsUnsupportedReason, updateMediaAffinityIntentMediaItemsUnsupportedReason == objc_msgSend(v4, "updateMediaAffinityIntentMediaItemsUnsupportedReason")))
                                                                  {
                                                                    int v61 = [(_INPBPayloadUnsupported *)self hasParticipantUnsupportedReason];
                                                                    if (v61 == [v4 hasParticipantUnsupportedReason])
                                                                    {
                                                                      if (!-[_INPBPayloadUnsupported hasParticipantUnsupportedReason](self, "hasParticipantUnsupportedReason")|| ![v4 hasParticipantUnsupportedReason]|| (int participantUnsupportedReason = self->_participantUnsupportedReason, participantUnsupportedReason == objc_msgSend(v4, "participantUnsupportedReason")))
                                                                      {
                                                                        int v63 = [(_INPBPayloadUnsupported *)self hasAddCallParticipantIntentParticipantsUnsupportedReason];
                                                                        if (v63 == [v4 hasAddCallParticipantIntentParticipantsUnsupportedReason])
                                                                        {
                                                                          if (!-[_INPBPayloadUnsupported hasAddCallParticipantIntentParticipantsUnsupportedReason](self, "hasAddCallParticipantIntentParticipantsUnsupportedReason")|| ![v4 hasAddCallParticipantIntentParticipantsUnsupportedReason]|| (int addCallParticipantIntentParticipantsUnsupportedReason = self->_addCallParticipantIntentParticipantsUnsupportedReason, addCallParticipantIntentParticipantsUnsupportedReason == objc_msgSend(v4, "addCallParticipantIntentParticipantsUnsupportedReason")))
                                                                          {
                                                                            int v65 = [(_INPBPayloadUnsupported *)self hasSendPaymentIntentPayeeUnsupportedReason];
                                                                            if (v65 == [v4 hasSendPaymentIntentPayeeUnsupportedReason])
                                                                            {
                                                                              if (!-[_INPBPayloadUnsupported hasSendPaymentIntentPayeeUnsupportedReason](self, "hasSendPaymentIntentPayeeUnsupportedReason")|| ![v4 hasSendPaymentIntentPayeeUnsupportedReason]|| (int sendPaymentIntentPayeeUnsupportedReason = self->_sendPaymentIntentPayeeUnsupportedReason, sendPaymentIntentPayeeUnsupportedReason == objc_msgSend(v4, "sendPaymentIntentPayeeUnsupportedReason")))
                                                                              {
                                                                                int v67 = [(_INPBPayloadUnsupported *)self hasRequestPaymentIntentPayerUnsupportedReason];
                                                                                if (v67 == [v4 hasRequestPaymentIntentPayerUnsupportedReason])
                                                                                {
                                                                                  if (!-[_INPBPayloadUnsupported hasRequestPaymentIntentPayerUnsupportedReason](self, "hasRequestPaymentIntentPayerUnsupportedReason")|| ![v4 hasRequestPaymentIntentPayerUnsupportedReason]|| (int requestPaymentIntentPayerUnsupportedReason = self->_requestPaymentIntentPayerUnsupportedReason, requestPaymentIntentPayerUnsupportedReason == objc_msgSend(v4, "requestPaymentIntentPayerUnsupportedReason")))
                                                                                  {
                                                                                    int v69 = [(_INPBPayloadUnsupported *)self hasPlayMediaIntentPlaybackSpeedUnsupportedReason];
                                                                                    if (v69 == [v4 hasPlayMediaIntentPlaybackSpeedUnsupportedReason])
                                                                                    {
                                                                                      if (!-[_INPBPayloadUnsupported hasPlayMediaIntentPlaybackSpeedUnsupportedReason](self, "hasPlayMediaIntentPlaybackSpeedUnsupportedReason")|| ![v4 hasPlayMediaIntentPlaybackSpeedUnsupportedReason]|| (int playMediaIntentPlaybackSpeedUnsupportedReason = self->_playMediaIntentPlaybackSpeedUnsupportedReason, playMediaIntentPlaybackSpeedUnsupportedReason == objc_msgSend(v4, "playMediaIntentPlaybackSpeedUnsupportedReason")))
                                                                                      {
                                                                                        int v71 = [(_INPBPayloadUnsupported *)self hasStartCallIntentPreferredCallProviderUnsupportedReason];
                                                                                        if (v71 == [v4 hasStartCallIntentPreferredCallProviderUnsupportedReason])
                                                                                        {
                                                                                          if (!-[_INPBPayloadUnsupported hasStartCallIntentPreferredCallProviderUnsupportedReason](self, "hasStartCallIntentPreferredCallProviderUnsupportedReason")|| ![v4 hasStartCallIntentPreferredCallProviderUnsupportedReason]|| (int startCallIntentPreferredCallProviderUnsupportedReason = self->_startCallIntentPreferredCallProviderUnsupportedReason, startCallIntentPreferredCallProviderUnsupportedReason == objc_msgSend(v4, "startCallIntentPreferredCallProviderUnsupportedReason")))
                                                                                          {
                                                                                            int v73 = [(_INPBPayloadUnsupported *)self hasReason];
                                                                                            if (v73 == [v4 hasReason])
                                                                                            {
                                                                                              if (![(_INPBPayloadUnsupported *)self hasReason]
                                                                                                || ![v4 hasReason]
                                                                                                || (int reason = self->_reason,
                                                                                                    reason == [v4 reason]))
                                                                                              {
                                                                                                int v75 = [(_INPBPayloadUnsupported *)self hasShareETAIntentRecipientUnsupportedReason];
                                                                                                if (v75 == [v4 hasShareETAIntentRecipientUnsupportedReason])
                                                                                                {
                                                                                                  if (!-[_INPBPayloadUnsupported hasShareETAIntentRecipientUnsupportedReason](self, "hasShareETAIntentRecipientUnsupportedReason") || ![v4 hasShareETAIntentRecipientUnsupportedReason] || (int shareETAIntentRecipientUnsupportedReason = self->_shareETAIntentRecipientUnsupportedReason, shareETAIntentRecipientUnsupportedReason == objc_msgSend(v4, "shareETAIntentRecipientUnsupportedReason")))
                                                                                                  {
                                                                                                    int v77 = [(_INPBPayloadUnsupported *)self hasStopShareETAIntentRecipientUnsupportedReason];
                                                                                                    if (v77 == [v4 hasStopShareETAIntentRecipientUnsupportedReason])
                                                                                                    {
                                                                                                      if (!-[_INPBPayloadUnsupported hasStopShareETAIntentRecipientUnsupportedReason](self, "hasStopShareETAIntentRecipientUnsupportedReason") || ![v4 hasStopShareETAIntentRecipientUnsupportedReason] || (int stopShareETAIntentRecipientUnsupportedReason = self->_stopShareETAIntentRecipientUnsupportedReason, stopShareETAIntentRecipientUnsupportedReason == objc_msgSend(v4, "stopShareETAIntentRecipientUnsupportedReason")))
                                                                                                      {
                                                                                                        int v79 = [(_INPBPayloadUnsupported *)self hasSendMessageIntentRecipientUnsupportedReason];
                                                                                                        if (v79 == [v4 hasSendMessageIntentRecipientUnsupportedReason])
                                                                                                        {
                                                                                                          if (!-[_INPBPayloadUnsupported hasSendMessageIntentRecipientUnsupportedReason](self, "hasSendMessageIntentRecipientUnsupportedReason") || ![v4 hasSendMessageIntentRecipientUnsupportedReason] || (int sendMessageIntentRecipientUnsupportedReason = self->_sendMessageIntentRecipientUnsupportedReason, sendMessageIntentRecipientUnsupportedReason == objc_msgSend(v4, "sendMessageIntentRecipientUnsupportedReason")))
                                                                                                          {
                                                                                                            int v81 = [(_INPBPayloadUnsupported *)self hasSendAnnouncementIntentRecipientsUnsupportedReason];
                                                                                                            if (v81 == [v4 hasSendAnnouncementIntentRecipientsUnsupportedReason])
                                                                                                            {
                                                                                                              if (!-[_INPBPayloadUnsupported hasSendAnnouncementIntentRecipientsUnsupportedReason](self, "hasSendAnnouncementIntentRecipientsUnsupportedReason") || ![v4 hasSendAnnouncementIntentRecipientsUnsupportedReason] || (int sendAnnouncementIntentRecipientsUnsupportedReason = self->_sendAnnouncementIntentRecipientsUnsupportedReason, sendAnnouncementIntentRecipientsUnsupportedReason == objc_msgSend(v4, "sendAnnouncementIntentRecipientsUnsupportedReason")))
                                                                                                              {
                                                                                                                int v83 = [(_INPBPayloadUnsupported *)self hasSaveHealthSampleIntentRecordDateUnsupportedReason];
                                                                                                                if (v83 == [v4 hasSaveHealthSampleIntentRecordDateUnsupportedReason])
                                                                                                                {
                                                                                                                  if (!-[_INPBPayloadUnsupported hasSaveHealthSampleIntentRecordDateUnsupportedReason](self, "hasSaveHealthSampleIntentRecordDateUnsupportedReason") || ![v4 hasSaveHealthSampleIntentRecordDateUnsupportedReason] || (int saveHealthSampleIntentRecordDateUnsupportedReason = self->_saveHealthSampleIntentRecordDateUnsupportedReason, saveHealthSampleIntentRecordDateUnsupportedReason == objc_msgSend(v4, "saveHealthSampleIntentRecordDateUnsupportedReason")))
                                                                                                                  {
                                                                                                                    int v85 = [(_INPBPayloadUnsupported *)self hasTargetEventUnsupportedReason];
                                                                                                                    if (v85 == [v4 hasTargetEventUnsupportedReason])
                                                                                                                    {
                                                                                                                      if (!-[_INPBPayloadUnsupported hasTargetEventUnsupportedReason](self, "hasTargetEventUnsupportedReason") || ![v4 hasTargetEventUnsupportedReason] || (int targetEventUnsupportedReason = self->_targetEventUnsupportedReason, targetEventUnsupportedReason == objc_msgSend(v4, "targetEventUnsupportedReason")))
                                                                                                                      {
                                                                                                                        int v87 = [(_INPBPayloadUnsupported *)self hasAddTasksIntentTargetTaskListMembersUnsupportedReason];
                                                                                                                        if (v87 == [v4 hasAddTasksIntentTargetTaskListMembersUnsupportedReason])
                                                                                                                        {
                                                                                                                          if (!-[_INPBPayloadUnsupported hasAddTasksIntentTargetTaskListMembersUnsupportedReason](self, "hasAddTasksIntentTargetTaskListMembersUnsupportedReason") || ![v4 hasAddTasksIntentTargetTaskListMembersUnsupportedReason] || (int addTasksIntentTargetTaskListMembersUnsupportedReason = self->_addTasksIntentTargetTaskListMembersUnsupportedReason, addTasksIntentTargetTaskListMembersUnsupportedReason == objc_msgSend(v4, "addTasksIntentTargetTaskListMembersUnsupportedReason")))
                                                                                                                          {
                                                                                                                            int v89 = [(_INPBPayloadUnsupported *)self hasSetTimerAttributeIntentTargetTimerUnsupportedReason];
                                                                                                                            if (v89 == [v4 hasSetTimerAttributeIntentTargetTimerUnsupportedReason])
                                                                                                                            {
                                                                                                                              if (!-[_INPBPayloadUnsupported hasSetTimerAttributeIntentTargetTimerUnsupportedReason](self, "hasSetTimerAttributeIntentTargetTimerUnsupportedReason") || ![v4 hasSetTimerAttributeIntentTargetTimerUnsupportedReason] || (int setTimerAttributeIntentTargetTimerUnsupportedReason = self->_setTimerAttributeIntentTargetTimerUnsupportedReason, setTimerAttributeIntentTargetTimerUnsupportedReason == objc_msgSend(v4, "setTimerAttributeIntentTargetTimerUnsupportedReason")))
                                                                                                                              {
                                                                                                                                int v91 = [(_INPBPayloadUnsupported *)self hasDeleteTasksIntentTaskListUnsupportedReason];
                                                                                                                                if (v91 == [v4 hasDeleteTasksIntentTaskListUnsupportedReason])
                                                                                                                                {
                                                                                                                                  if (!-[_INPBPayloadUnsupported hasDeleteTasksIntentTaskListUnsupportedReason](self, "hasDeleteTasksIntentTaskListUnsupportedReason") || ![v4 hasDeleteTasksIntentTaskListUnsupportedReason] || (int deleteTasksIntentTaskListUnsupportedReason = self->_deleteTasksIntentTaskListUnsupportedReason, deleteTasksIntentTaskListUnsupportedReason == objc_msgSend(v4, "deleteTasksIntentTaskListUnsupportedReason")))
                                                                                                                                  {
                                                                                                                                    int v93 = [(_INPBPayloadUnsupported *)self hasDeleteTasksIntentTaskUnsupportedReason];
                                                                                                                                    if (v93 == [v4 hasDeleteTasksIntentTaskUnsupportedReason])
                                                                                                                                    {
                                                                                                                                      if (!-[_INPBPayloadUnsupported hasDeleteTasksIntentTaskUnsupportedReason](self, "hasDeleteTasksIntentTaskUnsupportedReason") || ![v4 hasDeleteTasksIntentTaskUnsupportedReason] || (int deleteTasksIntentTaskUnsupportedReason = self->_deleteTasksIntentTaskUnsupportedReason, deleteTasksIntentTaskUnsupportedReason == objc_msgSend(v4, "deleteTasksIntentTaskUnsupportedReason")))
                                                                                                                                      {
                                                                                                                                        int v95 = [(_INPBPayloadUnsupported *)self hasSnoozeTasksIntentTaskUnsupportedReason];
                                                                                                                                        if (v95 == [v4 hasSnoozeTasksIntentTaskUnsupportedReason])
                                                                                                                                        {
                                                                                                                                          if (!-[_INPBPayloadUnsupported hasSnoozeTasksIntentTaskUnsupportedReason](self, "hasSnoozeTasksIntentTaskUnsupportedReason") || ![v4 hasSnoozeTasksIntentTaskUnsupportedReason] || (int snoozeTasksIntentTaskUnsupportedReason = self->_snoozeTasksIntentTaskUnsupportedReason, snoozeTasksIntentTaskUnsupportedReason == objc_msgSend(v4, "snoozeTasksIntentTaskUnsupportedReason")))
                                                                                                                                          {
                                                                                                                                            int v97 = [(_INPBPayloadUnsupported *)self hasAddTasksIntentTemporalEventTriggerUnsupportedReason];
                                                                                                                                            if (v97 == [v4 hasAddTasksIntentTemporalEventTriggerUnsupportedReason])
                                                                                                                                            {
                                                                                                                                              if (!-[_INPBPayloadUnsupported hasAddTasksIntentTemporalEventTriggerUnsupportedReason](self, "hasAddTasksIntentTemporalEventTriggerUnsupportedReason") || ![v4 hasAddTasksIntentTemporalEventTriggerUnsupportedReason] || (int addTasksIntentTemporalEventTriggerUnsupportedReason = self->_addTasksIntentTemporalEventTriggerUnsupportedReason, addTasksIntentTemporalEventTriggerUnsupportedReason == objc_msgSend(v4, "addTasksIntentTemporalEventTriggerUnsupportedReason")))
                                                                                                                                              {
                                                                                                                                                int v99 = [(_INPBPayloadUnsupported *)self hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason];
                                                                                                                                                if (v99 == [v4 hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason])
                                                                                                                                                {
                                                                                                                                                  if (!-[_INPBPayloadUnsupported hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason](self, "hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason") || ![v4 hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason] || (int setTaskAttributeIntentTemporalEventTriggerUnsupportedReason = self->_setTaskAttributeIntentTemporalEventTriggerUnsupportedReason, setTaskAttributeIntentTemporalEventTriggerUnsupportedReason == objc_msgSend(v4, "setTaskAttributeIntentTemporalEventTriggerUnsupportedReason")))
                                                                                                                                                  {
                                                                                                                                                    int v101 = [(_INPBPayloadUnsupported *)self hasRunWorkflowIntentWorkflowUnsupportedReason];
                                                                                                                                                    if (v101 == [v4 hasRunWorkflowIntentWorkflowUnsupportedReason])
                                                                                                                                                    {
                                                                                                                                                      if (!-[_INPBPayloadUnsupported hasRunWorkflowIntentWorkflowUnsupportedReason](self, "hasRunWorkflowIntentWorkflowUnsupportedReason") || ![v4 hasRunWorkflowIntentWorkflowUnsupportedReason] || (int runWorkflowIntentWorkflowUnsupportedReason = self->_runWorkflowIntentWorkflowUnsupportedReason, runWorkflowIntentWorkflowUnsupportedReason == objc_msgSend(v4, "runWorkflowIntentWorkflowUnsupportedReason")))
                                                                                                                                                      {
                                                                                                                                                        BOOL v102 = 1;
                                                                                                                                                        goto LABEL_186;
                                                                                                                                                      }
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                  }
                                                                                                                                }
                                                                                                                              }
                                                                                                                            }
                                                                                                                          }
                                                                                                                        }
                                                                                                                      }
                                                                                                                    }
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
  }
LABEL_185:
  BOOL v102 = 0;
LABEL_186:

  return v102;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBPayloadUnsupported allocWithZone:](_INPBPayloadUnsupported, "allocWithZone:") init];
  if ([(_INPBPayloadUnsupported *)self hasUpdateAlarmIntentAlarmUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setUpdateAlarmIntentAlarmUnsupportedReason:[(_INPBPayloadUnsupported *)self updateAlarmIntentAlarmUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasChangeAlarmStatusIntentAlarmsUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setChangeAlarmStatusIntentAlarmsUnsupportedReason:[(_INPBPayloadUnsupported *)self changeAlarmStatusIntentAlarmsUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasDeleteAlarmIntentAlarmsUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setDeleteAlarmIntentAlarmsUnsupportedReason:[(_INPBPayloadUnsupported *)self deleteAlarmIntentAlarmsUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasSearchAlarmIntentAlarmsUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setSearchAlarmIntentAlarmsUnsupportedReason:[(_INPBPayloadUnsupported *)self searchAlarmIntentAlarmsUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasSnoozeAlarmIntentAlarmsUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setSnoozeAlarmIntentAlarmsUnsupportedReason:[(_INPBPayloadUnsupported *)self snoozeAlarmIntentAlarmsUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasSendAnnouncementIntentAnnouncementUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setSendAnnouncementIntentAnnouncementUnsupportedReason:[(_INPBPayloadUnsupported *)self sendAnnouncementIntentAnnouncementUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasStartCallIntentCallCapabilityUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setStartCallIntentCallCapabilityUnsupportedReason:[(_INPBPayloadUnsupported *)self startCallIntentCallCapabilityUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasStartCallIntentCallRecordToCallBackUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setStartCallIntentCallRecordToCallBackUnsupportedReason:[(_INPBPayloadUnsupported *)self startCallIntentCallRecordToCallBackUnsupportedReason]];
  }
  uint64_t v6 = (void *)[(NSArray *)self->_conflictingParameters copyWithZone:a3];
  [(_INPBPayloadUnsupported *)v5 setConflictingParameters:v6];

  if ([(_INPBPayloadUnsupported *)self hasAddTasksIntentContactEventTriggerUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setAddTasksIntentContactEventTriggerUnsupportedReason:[(_INPBPayloadUnsupported *)self addTasksIntentContactEventTriggerUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setSetTaskAttributeIntentContactEventTriggerUnsupportedReason:[(_INPBPayloadUnsupported *)self setTaskAttributeIntentContactEventTriggerUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasStartCallIntentContactsUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setStartCallIntentContactsUnsupportedReason:[(_INPBPayloadUnsupported *)self startCallIntentContactsUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasRequestPaymentIntentCurrencyAmountUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setRequestPaymentIntentCurrencyAmountUnsupportedReason:[(_INPBPayloadUnsupported *)self requestPaymentIntentCurrencyAmountUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasSendPaymentIntentCurrencyAmountUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setSendPaymentIntentCurrencyAmountUnsupportedReason:[(_INPBPayloadUnsupported *)self sendPaymentIntentCurrencyAmountUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasCustomUnsupportedReason]) {
    [(_INPBPayloadUnsupported *)v5 setCustomUnsupportedReason:[(_INPBPayloadUnsupported *)self customUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasDateTimeRangeUnsupportedReason]) {
    [(_INPBPayloadUnsupported *)v5 setDateTimeRangeUnsupportedReason:[(_INPBPayloadUnsupported *)self dateTimeRangeUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setFindDeviceAndPlaySoundIntentDeviceUnsupportedReason:[(_INPBPayloadUnsupported *)self findDeviceAndPlaySoundIntentDeviceUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasJoinCallIntentGroupConversationUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setJoinCallIntentGroupConversationUnsupportedReason:[(_INPBPayloadUnsupported *)self joinCallIntentGroupConversationUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasReportIncidentIntentIncidentTypeUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setReportIncidentIntentIncidentTypeUnsupportedReason:[(_INPBPayloadUnsupported *)self reportIncidentIntentIncidentTypeUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasCreateTimerIntentLabelUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setCreateTimerIntentLabelUnsupportedReason:[(_INPBPayloadUnsupported *)self createTimerIntentLabelUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasAddMediaIntentMediaDestinationUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setAddMediaIntentMediaDestinationUnsupportedReason:[(_INPBPayloadUnsupported *)self addMediaIntentMediaDestinationUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasAddMediaIntentMediaItemsUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setAddMediaIntentMediaItemsUnsupportedReason:[(_INPBPayloadUnsupported *)self addMediaIntentMediaItemsUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasPlayMediaIntentMediaItemsUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setPlayMediaIntentMediaItemsUnsupportedReason:[(_INPBPayloadUnsupported *)self playMediaIntentMediaItemsUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasSearchForMediaIntentMediaItemsUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setSearchForMediaIntentMediaItemsUnsupportedReason:[(_INPBPayloadUnsupported *)self searchForMediaIntentMediaItemsUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setUpdateMediaAffinityIntentMediaItemsUnsupportedReason:[(_INPBPayloadUnsupported *)self updateMediaAffinityIntentMediaItemsUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasParticipantUnsupportedReason]) {
    [(_INPBPayloadUnsupported *)v5 setParticipantUnsupportedReason:[(_INPBPayloadUnsupported *)self participantUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasAddCallParticipantIntentParticipantsUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setAddCallParticipantIntentParticipantsUnsupportedReason:[(_INPBPayloadUnsupported *)self addCallParticipantIntentParticipantsUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasSendPaymentIntentPayeeUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setSendPaymentIntentPayeeUnsupportedReason:[(_INPBPayloadUnsupported *)self sendPaymentIntentPayeeUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasRequestPaymentIntentPayerUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setRequestPaymentIntentPayerUnsupportedReason:[(_INPBPayloadUnsupported *)self requestPaymentIntentPayerUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasPlayMediaIntentPlaybackSpeedUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setPlayMediaIntentPlaybackSpeedUnsupportedReason:[(_INPBPayloadUnsupported *)self playMediaIntentPlaybackSpeedUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasStartCallIntentPreferredCallProviderUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setStartCallIntentPreferredCallProviderUnsupportedReason:[(_INPBPayloadUnsupported *)self startCallIntentPreferredCallProviderUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasReason]) {
    [(_INPBPayloadUnsupported *)v5 setReason:[(_INPBPayloadUnsupported *)self reason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasShareETAIntentRecipientUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setShareETAIntentRecipientUnsupportedReason:[(_INPBPayloadUnsupported *)self shareETAIntentRecipientUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasStopShareETAIntentRecipientUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setStopShareETAIntentRecipientUnsupportedReason:[(_INPBPayloadUnsupported *)self stopShareETAIntentRecipientUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasSendMessageIntentRecipientUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setSendMessageIntentRecipientUnsupportedReason:[(_INPBPayloadUnsupported *)self sendMessageIntentRecipientUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasSendAnnouncementIntentRecipientsUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setSendAnnouncementIntentRecipientsUnsupportedReason:[(_INPBPayloadUnsupported *)self sendAnnouncementIntentRecipientsUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasSaveHealthSampleIntentRecordDateUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setSaveHealthSampleIntentRecordDateUnsupportedReason:[(_INPBPayloadUnsupported *)self saveHealthSampleIntentRecordDateUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasTargetEventUnsupportedReason]) {
    [(_INPBPayloadUnsupported *)v5 setTargetEventUnsupportedReason:[(_INPBPayloadUnsupported *)self targetEventUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasAddTasksIntentTargetTaskListMembersUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setAddTasksIntentTargetTaskListMembersUnsupportedReason:[(_INPBPayloadUnsupported *)self addTasksIntentTargetTaskListMembersUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasSetTimerAttributeIntentTargetTimerUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setSetTimerAttributeIntentTargetTimerUnsupportedReason:[(_INPBPayloadUnsupported *)self setTimerAttributeIntentTargetTimerUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasDeleteTasksIntentTaskListUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setDeleteTasksIntentTaskListUnsupportedReason:[(_INPBPayloadUnsupported *)self deleteTasksIntentTaskListUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasDeleteTasksIntentTaskUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setDeleteTasksIntentTaskUnsupportedReason:[(_INPBPayloadUnsupported *)self deleteTasksIntentTaskUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasSnoozeTasksIntentTaskUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setSnoozeTasksIntentTaskUnsupportedReason:[(_INPBPayloadUnsupported *)self snoozeTasksIntentTaskUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasAddTasksIntentTemporalEventTriggerUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setAddTasksIntentTemporalEventTriggerUnsupportedReason:[(_INPBPayloadUnsupported *)self addTasksIntentTemporalEventTriggerUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason:[(_INPBPayloadUnsupported *)self setTaskAttributeIntentTemporalEventTriggerUnsupportedReason]];
  }
  if ([(_INPBPayloadUnsupported *)self hasRunWorkflowIntentWorkflowUnsupportedReason])
  {
    [(_INPBPayloadUnsupported *)v5 setRunWorkflowIntentWorkflowUnsupportedReason:[(_INPBPayloadUnsupported *)self runWorkflowIntentWorkflowUnsupportedReason]];
  }
  int v7 = v5;

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPayloadUnsupported *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPayloadUnsupported)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPayloadUnsupported *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPayloadUnsupported *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPayloadUnsupported *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBPayloadUnsupported *)self hasUpdateAlarmIntentAlarmUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasChangeAlarmStatusIntentAlarmsUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasDeleteAlarmIntentAlarmsUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasSearchAlarmIntentAlarmsUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasSnoozeAlarmIntentAlarmsUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasSendAnnouncementIntentAnnouncementUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasStartCallIntentCallCapabilityUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasStartCallIntentCallRecordToCallBackUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v5 = self->_conflictingParameters;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if ([(_INPBPayloadUnsupported *)self hasAddTasksIntentContactEventTriggerUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasStartCallIntentContactsUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasRequestPaymentIntentCurrencyAmountUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasSendPaymentIntentCurrencyAmountUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasCustomUnsupportedReason]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasDateTimeRangeUnsupportedReason]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasJoinCallIntentGroupConversationUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasReportIncidentIntentIncidentTypeUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasCreateTimerIntentLabelUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasAddMediaIntentMediaDestinationUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasAddMediaIntentMediaItemsUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasPlayMediaIntentMediaItemsUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasSearchForMediaIntentMediaItemsUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasParticipantUnsupportedReason]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasAddCallParticipantIntentParticipantsUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasSendPaymentIntentPayeeUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasRequestPaymentIntentPayerUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasPlayMediaIntentPlaybackSpeedUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasStartCallIntentPreferredCallProviderUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasReason]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasShareETAIntentRecipientUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasStopShareETAIntentRecipientUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasSendMessageIntentRecipientUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasSendAnnouncementIntentRecipientsUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasSaveHealthSampleIntentRecordDateUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasTargetEventUnsupportedReason]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasAddTasksIntentTargetTaskListMembersUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasSetTimerAttributeIntentTargetTimerUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasDeleteTasksIntentTaskListUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasDeleteTasksIntentTaskUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasSnoozeTasksIntentTaskUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasAddTasksIntentTemporalEventTriggerUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadUnsupported *)self hasRunWorkflowIntentWorkflowUnsupportedReason])
  {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPayloadUnsupportedReadFrom(self, (uint64_t)a3);
}

- (int)StringAsRunWorkflowIntentWorkflowUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NOT_FOUND"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"NO_WORKFLOWS"];
  }

  return v4;
}

- (id)runWorkflowIntentWorkflowUnsupportedReasonAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"NO_WORKFLOWS";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"NOT_FOUND";
  }
  return v4;
}

- (void)setHasRunWorkflowIntentWorkflowUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasRunWorkflowIntentWorkflowUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setRunWorkflowIntentWorkflowUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFEFFFFFFFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has | 0x100000000000);
    self->_int runWorkflowIntentWorkflowUnsupportedReason = a3;
  }
}

- (int)StringAsSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"TIME_IN_PAST"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"INVALID_RECURRENCE"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)setTaskAttributeIntentTemporalEventTriggerUnsupportedReasonAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"TIME_IN_PAST";
  }
  else if (a3 == 2)
  {
    int v4 = @"INVALID_RECURRENCE";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFF7FFFFFFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has | 0x80000000000);
    self->_int setTaskAttributeIntentTemporalEventTriggerUnsupportedReason = a3;
  }
}

- (int)StringAsAddTasksIntentTemporalEventTriggerUnsupportedReason:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"TIME_IN_PAST"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"INVALID_RECURRENCE"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)addTasksIntentTemporalEventTriggerUnsupportedReasonAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"TIME_IN_PAST";
  }
  else if (a3 == 2)
  {
    int v4 = @"INVALID_RECURRENCE";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasAddTasksIntentTemporalEventTriggerUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasAddTasksIntentTemporalEventTriggerUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setAddTasksIntentTemporalEventTriggerUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFBFFFFFFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has | 0x40000000000);
    self->_int addTasksIntentTemporalEventTriggerUnsupportedReason = a3;
  }
}

- (int)StringAsSnoozeTasksIntentTaskUnsupportedReason:(id)a3
{
  return 1;
}

- (id)snoozeTasksIntentTaskUnsupportedReasonAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"NO_TASKS_FOUND";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasSnoozeTasksIntentTaskUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasSnoozeTasksIntentTaskUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setSnoozeTasksIntentTaskUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFDFFFFFFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has | 0x20000000000);
    self->_int snoozeTasksIntentTaskUnsupportedReason = a3;
  }
}

- (int)StringAsDeleteTasksIntentTaskUnsupportedReason:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"NO_TASKS_FOUND"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"NO_TASKS_IN_APP"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (void)setHasDeleteTasksIntentTaskUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasDeleteTasksIntentTaskUnsupportedReason
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (int)StringAsDeleteTasksIntentTaskListUnsupportedReason:(id)a3
{
  return 1;
}

- (id)deleteTasksIntentTaskListUnsupportedReasonAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"NO_TASK_LIST_FOUND";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasDeleteTasksIntentTaskListUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasDeleteTasksIntentTaskListUnsupportedReason
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setDeleteTasksIntentTaskListUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFF7FFFFFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has | 0x8000000000);
    self->_int deleteTasksIntentTaskListUnsupportedReason = a3;
  }
}

- (int)StringAsSetTimerAttributeIntentTargetTimerUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NOT_FOUND"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"NO_TIMERS"];
  }

  return v4;
}

- (id)setTimerAttributeIntentTargetTimerUnsupportedReasonAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"NO_TIMERS";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"NOT_FOUND";
  }
  return v4;
}

- (void)setHasSetTimerAttributeIntentTargetTimerUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasSetTimerAttributeIntentTargetTimerUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setSetTimerAttributeIntentTargetTimerUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFBFFFFFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has | 0x4000000000);
    self->_int setTimerAttributeIntentTargetTimerUnsupportedReason = a3;
  }
}

- (int)StringAsAddTasksIntentTargetTaskListMembersUnsupportedReason:(id)a3
{
  return 1;
}

- (id)addTasksIntentTargetTaskListMembersUnsupportedReasonAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"NO_SHARED_LIST_WITH_CONTACT";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasAddTasksIntentTargetTaskListMembersUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasAddTasksIntentTargetTaskListMembersUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setAddTasksIntentTargetTaskListMembersUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFDFFFFFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has | 0x2000000000);
    self->_int addTasksIntentTargetTaskListMembersUnsupportedReason = a3;
  }
}

- (int)StringAsTargetEventUnsupportedReason:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"TARGET_EVENT_NOT_FOUND"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"TARGET_EVENT_NOT_CREATED_BY_USER"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)targetEventUnsupportedReasonAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"TARGET_EVENT_NOT_FOUND";
  }
  else if (a3 == 2)
  {
    int v4 = @"TARGET_EVENT_NOT_CREATED_BY_USER";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasTargetEventUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasTargetEventUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setTargetEventUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFEFFFFFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has | 0x1000000000);
    self->_int targetEventUnsupportedReason = a3;
  }
}

- (int)StringAsSaveHealthSampleIntentRecordDateUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NO_FUTURE_DATETIME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NO_FUZZY_TIME"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NO_FUZZY_DATE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)saveHealthSampleIntentRecordDateUnsupportedReasonAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551AC48[a3 - 1];
  }

  return v3;
}

- (void)setHasSaveHealthSampleIntentRecordDateUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasSaveHealthSampleIntentRecordDateUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setSaveHealthSampleIntentRecordDateUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFF7FFFFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has | 0x800000000);
    self->_int saveHealthSampleIntentRecordDateUnsupportedReason = a3;
  }
}

- (int)StringAsSendAnnouncementIntentRecipientsUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TARGET_NOT_FOUND"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ANNOUNCING_TO_SELF"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SPEAKER_GROUPS_NOT_SUPPORTED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"INTERCOM_DISABLED_ON_ALL_DEVICES"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)sendAnnouncementIntentRecipientsUnsupportedReasonAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551AC28[a3 - 1];
  }

  return v3;
}

- (void)setHasSendAnnouncementIntentRecipientsUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasSendAnnouncementIntentRecipientsUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setSendAnnouncementIntentRecipientsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFBFFFFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has | 0x400000000);
    self->_int sendAnnouncementIntentRecipientsUnsupportedReason = a3;
  }
}

- (int)StringAsSendMessageIntentRecipientUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NO_ACCOUNT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"OFFLINE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MESSAGING_SERVICE_NOT_ENABLED_FOR_RECIPIENT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NO_VALID_HANDLE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"REQUESTED_HANDLE_INVALID"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"NO_HANDLE_FOR_LABEL"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SCREEN_TIME_RESTRICTION_ENABLED"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"NOT_A_MEMBER_OF_CONVERSATION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"DOWN_TIME_RESTRICTION_ENABLED"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"REQUIRING_IN_APP_AUTHENTICATION"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)sendMessageIntentRecipientUnsupportedReasonAsString:(int)a3
{
  if ((a3 - 1) >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551ABD8[a3 - 1];
  }

  return v3;
}

- (void)setHasSendMessageIntentRecipientUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasSendMessageIntentRecipientUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setSendMessageIntentRecipientUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFDFFFFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has | 0x200000000);
    self->_int sendMessageIntentRecipientUnsupportedReason = a3;
  }
}

- (int)StringAsStopShareETAIntentRecipientUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NO_RECIPIENTS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CONTACT_ID_MISSING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CONTACT_NOT_FOUND"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CONTACT_HANDLE_MISSING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CONTACT_SHARED_TRIP_FAILED"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)stopShareETAIntentRecipientUnsupportedReasonAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551ABB0[a3];
  }

  return v3;
}

- (void)setHasStopShareETAIntentRecipientUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasStopShareETAIntentRecipientUnsupportedReason
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setStopShareETAIntentRecipientUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFEFFFFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has | 0x100000000);
    self->_int stopShareETAIntentRecipientUnsupportedReason = a3;
  }
}

- (int)StringAsShareETAIntentRecipientUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NO_RECIPIENTS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CONTACT_ID_MISSING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CONTACT_NOT_FOUND"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CONTACT_HANDLE_MISSING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CONTACT_SHARED_TRIP_FAILED"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)shareETAIntentRecipientUnsupportedReasonAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551ABB0[a3];
  }

  return v3;
}

- (void)setHasShareETAIntentRecipientUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasShareETAIntentRecipientUnsupportedReason
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setShareETAIntentRecipientUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFF7FFFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x80000000);
    self->_int shareETAIntentRecipientUnsupportedReason = a3;
  }
}

- (int)StringAsReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NotNow"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NotHere"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ConflictWithOtherFields"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"UnsupportedReasonExtension"])
  {
    int v4 = 1000;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)reasonAsString:(int)a3
{
  int v4 = @"None";
  switch(a3)
  {
    case 1:
      goto LABEL_16;
    case 2:
      int v4 = @"NotNow";
      break;
    case 3:
      int v4 = @"NotHere";
      break;
    case 4:
      int v4 = @"ConflictWithOtherFields";
      break;
    default:
      if (a3 == 1000)
      {
        int v4 = @"UnsupportedReasonExtension";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_16:
      }
      break;
  }
  return v4;
}

- (void)setHasReason:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasReason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFBFFFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x40000000);
    self->_int reason = a3;
  }
}

- (int)StringAsStartCallIntentPreferredCallProviderUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TELEPHONY_UNSUPPORTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CALL_PROVIDER_NOT_ACCESSIBLE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EMERGENCY_CALL_PROVIDER_NOT_ACCESSIBLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SETTINGS_RESTRICTED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ACCOUNT_SETUP_REQUIRED"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PROVIDER_DISABLED_IN_SETTINGS"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)startCallIntentPreferredCallProviderUnsupportedReasonAsString:(int)a3
{
  if ((a3 - 1) >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551AB80[a3 - 1];
  }

  return v3;
}

- (void)setHasStartCallIntentPreferredCallProviderUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasStartCallIntentPreferredCallProviderUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setStartCallIntentPreferredCallProviderUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFDFFFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x20000000);
    self->_int startCallIntentPreferredCallProviderUnsupportedReason = a3;
  }
}

- (int)StringAsPlayMediaIntentPlaybackSpeedUnsupportedReason:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"BELOW_MINIMUM"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"ABOVE_MAXIMUM"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)playMediaIntentPlaybackSpeedUnsupportedReasonAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"BELOW_MINIMUM";
  }
  else if (a3 == 2)
  {
    int v4 = @"ABOVE_MAXIMUM";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasPlayMediaIntentPlaybackSpeedUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasPlayMediaIntentPlaybackSpeedUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setPlayMediaIntentPlaybackSpeedUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFEFFFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x10000000);
    self->_int playMediaIntentPlaybackSpeedUnsupportedReason = a3;
  }
}

- (int)StringAsRequestPaymentIntentPayerUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CREDENTIALS_UNVERIFIED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NO_ACCOUNT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NO_VALID_HANDLE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)requestPaymentIntentPayerUnsupportedReasonAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551AB68[a3 - 1];
  }

  return v3;
}

- (void)setHasRequestPaymentIntentPayerUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasRequestPaymentIntentPayerUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setRequestPaymentIntentPayerUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFF7FFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x8000000);
    self->_int requestPaymentIntentPayerUnsupportedReason = a3;
  }
}

- (int)StringAsSendPaymentIntentPayeeUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CREDENTIALS_UNVERIFIED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INSUFFICIENT_FUNDS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NO_ACCOUNT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NO_VALID_HANDLE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)sendPaymentIntentPayeeUnsupportedReasonAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551AB48[a3 - 1];
  }

  return v3;
}

- (void)setHasSendPaymentIntentPayeeUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasSendPaymentIntentPayeeUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setSendPaymentIntentPayeeUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFBFFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x4000000);
    self->_int sendPaymentIntentPayeeUnsupportedReason = a3;
  }
}

- (int)StringAsAddCallParticipantIntentParticipantsUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NO_CONTACT_FOUND"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MULTIPLE_CONTACTS_UNSUPPORTED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NO_HANDLE_FOUND"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"INVALID_HANDLE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LOCAL_EMERGENCY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FOREIGN_EMERGENCY"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)addCallParticipantIntentParticipantsUnsupportedReasonAsString:(int)a3
{
  if ((a3 - 1) >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551AB18[a3 - 1];
  }

  return v3;
}

- (void)setHasAddCallParticipantIntentParticipantsUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasAddCallParticipantIntentParticipantsUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setAddCallParticipantIntentParticipantsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFDFFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x2000000);
    self->_int addCallParticipantIntentParticipantsUnsupportedReason = a3;
  }
}

- (int)StringAsParticipantUnsupportedReason:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"INVALID_PARTICIPANT"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"PARTICIPANT_NOT_FOUND"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)participantUnsupportedReasonAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"INVALID_PARTICIPANT";
  }
  else if (a3 == 2)
  {
    int v4 = @"PARTICIPANT_NOT_FOUND";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasParticipantUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasParticipantUnsupportedReason
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setParticipantUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFEFFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x1000000);
    self->_int participantUnsupportedReason = a3;
  }
}

- (int)StringAsUpdateMediaAffinityIntentMediaItemsUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LOGIN_REQUIRED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SUBSCRIPTION_REQUIRED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"UNSUPPORTED_MEDIA_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EXPLICIT_CONTENT_SETTINGS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CELLULAR_DATA_SETTINGS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RESTRICTED_CONTENT"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SERVICE_UNAVAILABLE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"REGION_RESTRICTION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"APP_NOT_CONFIGURED"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"APP_NOT_AVAILABLE"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"APP_ACCOUNT_FAILURE"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"APP_DOESNT_SUPPORT_INTENT"])
  {
    int v4 = 103;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)updateMediaAffinityIntentMediaItemsUnsupportedReasonAsString:(int)a3
{
  int v4 = @"LOGIN_REQUIRED";
  switch(a3)
  {
    case 1:
LABEL_28:
      break;
    case 2:
      int v4 = @"SUBSCRIPTION_REQUIRED";
      break;
    case 3:
      int v4 = @"UNSUPPORTED_MEDIA_TYPE";
      break;
    case 4:
      int v4 = @"EXPLICIT_CONTENT_SETTINGS";
      break;
    case 5:
      int v4 = @"CELLULAR_DATA_SETTINGS";
      break;
    case 6:
      int v4 = @"RESTRICTED_CONTENT";
      break;
    case 7:
      int v4 = @"SERVICE_UNAVAILABLE";
      break;
    case 8:
      int v4 = @"REGION_RESTRICTION";
      break;
    default:
      switch(a3)
      {
        case 'd':
          int v4 = @"APP_NOT_CONFIGURED";
          break;
        case 'e':
          int v4 = @"APP_NOT_AVAILABLE";
          break;
        case 'f':
          int v4 = @"APP_ACCOUNT_FAILURE";
          break;
        case 'g':
          int v4 = @"APP_DOESNT_SUPPORT_INTENT";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
          int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
      }
      break;
  }
  return v4;
}

- (void)setHasUpdateMediaAffinityIntentMediaItemsUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setUpdateMediaAffinityIntentMediaItemsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFF7FFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x800000);
    self->_int updateMediaAffinityIntentMediaItemsUnsupportedReason = a3;
  }
}

- (int)StringAsSearchForMediaIntentMediaItemsUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LOGIN_REQUIRED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SUBSCRIPTION_REQUIRED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"UNSUPPORTED_MEDIA_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EXPLICIT_CONTENT_SETTINGS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CELLULAR_DATA_SETTINGS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RESTRICTED_CONTENT"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SERVICE_UNAVAILABLE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"REGION_RESTRICTION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"APP_NOT_CONFIGURED"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"APP_NOT_AVAILABLE"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"APP_ACCOUNT_FAILURE"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"APP_DOESNT_SUPPORT_INTENT"])
  {
    int v4 = 103;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)searchForMediaIntentMediaItemsUnsupportedReasonAsString:(int)a3
{
  int v4 = @"LOGIN_REQUIRED";
  switch(a3)
  {
    case 1:
LABEL_28:
      break;
    case 2:
      int v4 = @"SUBSCRIPTION_REQUIRED";
      break;
    case 3:
      int v4 = @"UNSUPPORTED_MEDIA_TYPE";
      break;
    case 4:
      int v4 = @"EXPLICIT_CONTENT_SETTINGS";
      break;
    case 5:
      int v4 = @"CELLULAR_DATA_SETTINGS";
      break;
    case 6:
      int v4 = @"RESTRICTED_CONTENT";
      break;
    case 7:
      int v4 = @"SERVICE_UNAVAILABLE";
      break;
    case 8:
      int v4 = @"REGION_RESTRICTION";
      break;
    default:
      switch(a3)
      {
        case 'd':
          int v4 = @"APP_NOT_CONFIGURED";
          break;
        case 'e':
          int v4 = @"APP_NOT_AVAILABLE";
          break;
        case 'f':
          int v4 = @"APP_ACCOUNT_FAILURE";
          break;
        case 'g':
          int v4 = @"APP_DOESNT_SUPPORT_INTENT";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
          int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
      }
      break;
  }
  return v4;
}

- (void)setHasSearchForMediaIntentMediaItemsUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasSearchForMediaIntentMediaItemsUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setSearchForMediaIntentMediaItemsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFBFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x400000);
    self->_int searchForMediaIntentMediaItemsUnsupportedReason = a3;
  }
}

- (int)StringAsPlayMediaIntentMediaItemsUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LOGIN_REQUIRED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SUBSCRIPTION_REQUIRED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"UNSUPPORTED_MEDIA_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EXPLICIT_CONTENT_SETTINGS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CELLULAR_DATA_SETTINGS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RESTRICTED_CONTENT"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SERVICE_UNAVAILABLE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"REGION_RESTRICTION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"NOT_DOWNLOADED_FOR_OFFLINE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"APP_NOT_CONFIGURED"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"APP_NOT_AVAILABLE"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"APP_ACCOUNT_FAILURE"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"APP_DOESNT_SUPPORT_INTENT"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"MS_LIMIT_REACHED"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"MEDIA_PLAYBACK_DISABLED"])
  {
    int v4 = 105;
  }
  else if ([v3 isEqualToString:@"PLAYBACK_DEVICE_NOT_FOUND"])
  {
    int v4 = 1000;
  }
  else if ([v3 isEqualToString:@"EMPTY_LIBRARY"])
  {
    int v4 = 1001;
  }
  else if ([v3 isEqualToString:@"CREATE_RADIO_FAILED"])
  {
    int v4 = 1002;
  }
  else if ([v3 isEqualToString:@"UNSUPPORTED_PLAYBACK_QUEUE_LOCATION"])
  {
    int v4 = 1003;
  }
  else if ([v3 isEqualToString:@"UNSUPPORTED_PLAYBACK_QUEUE_LOCATION_WITH_LIVE_RADIO"])
  {
    int v4 = 1004;
  }
  else if ([v3 isEqualToString:@"STILL_LOADING_CLOUD_LIBRARY"])
  {
    int v4 = 1005;
  }
  else if ([v3 isEqualToString:@"ITUNES_ACCOUNT_ERROR"])
  {
    int v4 = 1006;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)playMediaIntentMediaItemsUnsupportedReasonAsString:(int)a3
{
  if (!(!v4 & v3))
  {
    uint64_t v7 = @"LOGIN_REQUIRED";
    switch(a3)
    {
      case 1:
        goto LABEL_12;
      case 2:
        uint64_t v7 = @"SUBSCRIPTION_REQUIRED";
        return v7;
      case 3:
        uint64_t v7 = @"UNSUPPORTED_MEDIA_TYPE";
        return v7;
      case 4:
        uint64_t v7 = @"EXPLICIT_CONTENT_SETTINGS";
        return v7;
      case 5:
        uint64_t v7 = @"CELLULAR_DATA_SETTINGS";
        return v7;
      case 6:
        uint64_t v7 = @"RESTRICTED_CONTENT";
        return v7;
      case 7:
        uint64_t v7 = @"SERVICE_UNAVAILABLE";
        return v7;
      case 8:
        uint64_t v7 = @"REGION_RESTRICTION";
        return v7;
      case 9:
        uint64_t v7 = @"NOT_DOWNLOADED_FOR_OFFLINE";
        return v7;
      default:
        JUMPOUT(0);
    }
  }
  switch(a3)
  {
    case 'd':
      uint64_t v7 = @"APP_NOT_CONFIGURED";
      break;
    case 'e':
      uint64_t v7 = @"APP_NOT_AVAILABLE";
      break;
    case 'f':
      uint64_t v7 = @"APP_ACCOUNT_FAILURE";
      break;
    case 'g':
      uint64_t v7 = @"APP_DOESNT_SUPPORT_INTENT";
      break;
    case 'h':
      uint64_t v7 = @"MS_LIMIT_REACHED";
      break;
    case 'i':
      uint64_t v7 = @"MEDIA_PLAYBACK_DISABLED";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      break;
  }
  return v7;
}

- (void)setHasPlayMediaIntentMediaItemsUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasPlayMediaIntentMediaItemsUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setPlayMediaIntentMediaItemsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFDFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x200000);
    self->_int playMediaIntentMediaItemsUnsupportedReason = a3;
  }
}

- (int)StringAsAddMediaIntentMediaItemsUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LOGIN_REQUIRED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SUBSCRIPTION_REQUIRED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"UNSUPPORTED_MEDIA_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EXPLICIT_CONTENT_SETTINGS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CELLULAR_DATA_SETTINGS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RESTRICTED_CONTENT"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SERVICE_UNAVAILABLE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"REGION_RESTRICTION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"APP_NOT_CONFIGURED"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"APP_NOT_AVAILABLE"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"APP_ACCOUNT_FAILURE"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"APP_DOESNT_SUPPORT_INTENT"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"ALREADY_IN_LIBRARY"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"CLOUD_SYNC_OFF"])
  {
    int v4 = 105;
  }
  else if ([v3 isEqualToString:@"GET_NOWPLAYING_FAILURE"])
  {
    int v4 = 106;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)addMediaIntentMediaItemsUnsupportedReasonAsString:(int)a3
{
  if (!(!v4 & v3))
  {
    uint64_t v7 = @"LOGIN_REQUIRED";
    switch(a3)
    {
      case 1:
        goto LABEL_12;
      case 2:
        uint64_t v7 = @"SUBSCRIPTION_REQUIRED";
        return v7;
      case 3:
        uint64_t v7 = @"UNSUPPORTED_MEDIA_TYPE";
        return v7;
      case 4:
        uint64_t v7 = @"EXPLICIT_CONTENT_SETTINGS";
        return v7;
      case 5:
        uint64_t v7 = @"CELLULAR_DATA_SETTINGS";
        return v7;
      case 6:
        uint64_t v7 = @"RESTRICTED_CONTENT";
        return v7;
      case 7:
        uint64_t v7 = @"SERVICE_UNAVAILABLE";
        return v7;
      case 8:
        uint64_t v7 = @"REGION_RESTRICTION";
        return v7;
      default:
        JUMPOUT(0);
    }
  }
  switch(a3)
  {
    case 'd':
      uint64_t v7 = @"APP_NOT_CONFIGURED";
      break;
    case 'e':
      uint64_t v7 = @"APP_NOT_AVAILABLE";
      break;
    case 'f':
      uint64_t v7 = @"APP_ACCOUNT_FAILURE";
      break;
    case 'g':
      uint64_t v7 = @"APP_DOESNT_SUPPORT_INTENT";
      break;
    case 'h':
      uint64_t v7 = @"ALREADY_IN_LIBRARY";
      break;
    case 'i':
      uint64_t v7 = @"CLOUD_SYNC_OFF";
      break;
    case 'j':
      uint64_t v7 = @"GET_NOWPLAYING_FAILURE";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      break;
  }
  return v7;
}

- (void)setHasAddMediaIntentMediaItemsUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasAddMediaIntentMediaItemsUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setAddMediaIntentMediaItemsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFEFFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x100000);
    self->_int addMediaIntentMediaItemsUnsupportedReason = a3;
  }
}

- (int)StringAsAddMediaIntentMediaDestinationUnsupportedReason:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"PLAYLIST_NAME_NOT_FOUND"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"PLAYLIST_NOT_EDITABLE"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)addMediaIntentMediaDestinationUnsupportedReasonAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"PLAYLIST_NAME_NOT_FOUND";
  }
  else if (a3 == 2)
  {
    int v4 = @"PLAYLIST_NOT_EDITABLE";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasAddMediaIntentMediaDestinationUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasAddMediaIntentMediaDestinationUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setAddMediaIntentMediaDestinationUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFF7FFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x80000);
    self->_int addMediaIntentMediaDestinationUnsupportedReason = a3;
  }
}

- (int)StringAsCreateTimerIntentLabelUnsupportedReason:(id)a3
{
  return 0;
}

- (id)createTimerIntentLabelUnsupportedReasonAsString:(int)a3
{
  if (a3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = @"AMBIGUOUS_UNNAMED_TIMER";
  }
  return v4;
}

- (void)setHasCreateTimerIntentLabelUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasCreateTimerIntentLabelUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setCreateTimerIntentLabelUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFFBFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x40000);
    self->_int createTimerIntentLabelUnsupportedReason = a3;
  }
}

- (int)StringAsReportIncidentIntentIncidentTypeUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNSUPPORTED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UNSUPPORTED_INCIDENT_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"UNSUPPORTED_REGION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MAPS_LOCATION_DISABLED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_INCIDENT_TYPE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)reportIncidentIntentIncidentTypeUnsupportedReasonAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551AAF0[a3];
  }

  return v3;
}

- (void)setHasReportIncidentIntentIncidentTypeUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasReportIncidentIntentIncidentTypeUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setReportIncidentIntentIncidentTypeUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFFDFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x20000);
    self->_int reportIncidentIntentIncidentTypeUnsupportedReason = a3;
  }
}

- (int)StringAsJoinCallIntentGroupConversationUnsupportedReason:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"NO_ACTIVE_NOTIFICATIONS"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"NO_MATCHING_NOTIFICATIONS"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)joinCallIntentGroupConversationUnsupportedReasonAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"NO_ACTIVE_NOTIFICATIONS";
  }
  else if (a3 == 2)
  {
    int v4 = @"NO_MATCHING_NOTIFICATIONS";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasJoinCallIntentGroupConversationUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasJoinCallIntentGroupConversationUnsupportedReason
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setJoinCallIntentGroupConversationUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFFEFFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x10000);
    self->_int joinCallIntentGroupConversationUnsupportedReason = a3;
  }
}

- (int)StringAsFindDeviceAndPlaySoundIntentDeviceUnsupportedReason:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"UNKNOWN"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"SERVICE_UNAVAILABLE"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)findDeviceAndPlaySoundIntentDeviceUnsupportedReasonAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"UNKNOWN";
  }
  else if (a3 == 2)
  {
    int v4 = @"SERVICE_UNAVAILABLE";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setFindDeviceAndPlaySoundIntentDeviceUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFFF7FFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x8000);
    self->_int findDeviceAndPlaySoundIntentDeviceUnsupportedReason = a3;
  }
}

- (int)StringAsDateTimeRangeUnsupportedReason:(id)a3
{
  return 1;
}

- (id)dateTimeRangeUnsupportedReasonAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"PAST_DATE_TIME";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasDateTimeRangeUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasDateTimeRangeUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setDateTimeRangeUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFFFBFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x4000);
    self->_int dateTimeRangeUnsupportedReason = a3;
  }
}

- (void)setHasCustomUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasCustomUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setCustomUnsupportedReason:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_unsigned int customUnsupportedReason = a3;
}

- (int)StringAsSendPaymentIntentCurrencyAmountUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PAYMENTS_AMOUNT_BELOW_MINIMUM"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PAYMENTS_AMOUNT_ABOVE_MAXIMUM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PAYMENTS_CURRENCY_UNSUPPORTED"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)sendPaymentIntentCurrencyAmountUnsupportedReasonAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551AAD8[a3 - 1];
  }

  return v3;
}

- (void)setHasSendPaymentIntentCurrencyAmountUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasSendPaymentIntentCurrencyAmountUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setSendPaymentIntentCurrencyAmountUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFFFEFFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x1000);
    self->_int sendPaymentIntentCurrencyAmountUnsupportedReason = a3;
  }
}

- (int)StringAsRequestPaymentIntentCurrencyAmountUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PAYMENTS_AMOUNT_BELOW_MINIMUM"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PAYMENTS_AMOUNT_ABOVE_MAXIMUM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PAYMENTS_CURRENCY_UNSUPPORTED"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)requestPaymentIntentCurrencyAmountUnsupportedReasonAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551AAD8[a3 - 1];
  }

  return v3;
}

- (void)setHasRequestPaymentIntentCurrencyAmountUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasRequestPaymentIntentCurrencyAmountUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setRequestPaymentIntentCurrencyAmountUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFFFF7FFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x800);
    self->_int requestPaymentIntentCurrencyAmountUnsupportedReason = a3;
  }
}

- (int)StringAsStartCallIntentContactsUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NO_CONTACT_FOUND"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MULTIPLE_CONTACTS_UNSUPPORTED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NO_HANDLE_FOR_LABEL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"INVALID_HANDLE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"UNSUPPORTED_MMI_USSD"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"NO_CALL_HISTORY_FOR_REDIAL"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"NO_USABLE_HANDLE_FOR_REDIAL"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"FOREIGN_EMERGENCY_DISAMBIGUATION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"REQUIRING_IN_APP_AUTHENTICATION"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)startCallIntentContactsUnsupportedReasonAsString:(int)a3
{
  int v3 = a3 - 1;
  if (a3 - 1) < 0xA && ((0x2FFu >> v3))
  {
    int v4 = off_1E551AA88[v3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)setHasStartCallIntentContactsUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasStartCallIntentContactsUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setStartCallIntentContactsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFFFFBFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x400);
    self->_int startCallIntentContactsUnsupportedReason = a3;
  }
}

- (int)StringAsSetTaskAttributeIntentContactEventTriggerUnsupportedReason:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"ACCOUNT_DOES_NOT_SUPPORT"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"CLOUDKIT_NOT_UPGRADED"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)setTaskAttributeIntentContactEventTriggerUnsupportedReasonAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"ACCOUNT_DOES_NOT_SUPPORT";
  }
  else if (a3 == 2)
  {
    int v4 = @"CLOUDKIT_NOT_UPGRADED";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasSetTaskAttributeIntentContactEventTriggerUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setSetTaskAttributeIntentContactEventTriggerUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFFFFDFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x200);
    self->_int setTaskAttributeIntentContactEventTriggerUnsupportedReason = a3;
  }
}

- (int)StringAsAddTasksIntentContactEventTriggerUnsupportedReason:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"ACCOUNT_DOES_NOT_SUPPORT"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"CLOUDKIT_NOT_UPGRADED"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)addTasksIntentContactEventTriggerUnsupportedReasonAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"ACCOUNT_DOES_NOT_SUPPORT";
  }
  else if (a3 == 2)
  {
    int v4 = @"CLOUDKIT_NOT_UPGRADED";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasAddTasksIntentContactEventTriggerUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasAddTasksIntentContactEventTriggerUnsupportedReason
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setAddTasksIntentContactEventTriggerUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFFFFEFFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x100);
    self->_int addTasksIntentContactEventTriggerUnsupportedReason = a3;
  }
}

- (id)conflictingParametersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_conflictingParameters objectAtIndexedSubscript:a3];
}

- (unint64_t)conflictingParametersCount
{
  return [(NSArray *)self->_conflictingParameters count];
}

- (void)addConflictingParameters:(id)a3
{
  id v4 = a3;
  conflictingParameters = self->_conflictingParameters;
  id v8 = v4;
  if (!conflictingParameters)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_conflictingParameters;
    self->_conflictingParameters = v6;

    id v4 = v8;
    conflictingParameters = self->_conflictingParameters;
  }
  [(NSArray *)conflictingParameters addObject:v4];
}

- (void)clearConflictingParameters
{
}

- (void)setConflictingParameters:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  conflictingParameters = self->_conflictingParameters;
  self->_conflictingParameters = v4;

  MEMORY[0x1F41817F8](v4, conflictingParameters);
}

- (int)StringAsStartCallIntentCallRecordToCallBackUnsupportedReason:(id)a3
{
  return 1;
}

- (id)startCallIntentCallRecordToCallBackUnsupportedReasonAsString:(int)a3
{
  if (a3 == 1)
  {
    id v4 = @"NO_MATCHING_CALL";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasStartCallIntentCallRecordToCallBackUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasStartCallIntentCallRecordToCallBackUnsupportedReason
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setStartCallIntentCallRecordToCallBackUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFFFFF7FLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x80);
    self->_int startCallIntentCallRecordToCallBackUnsupportedReason = a3;
  }
}

- (int)StringAsStartCallIntentCallCapabilityUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"VIDEO_CALL_UNSUPPORTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MICROPHONE_NOT_ACCESSIBLE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CAMERA_NOT_ACCESSIBLE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)startCallIntentCallCapabilityUnsupportedReasonAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551AA70[a3 - 1];
  }

  return v3;
}

- (void)setHasStartCallIntentCallCapabilityUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasStartCallIntentCallCapabilityUnsupportedReason
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setStartCallIntentCallCapabilityUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFFFFFBFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x40);
    self->_int startCallIntentCallCapabilityUnsupportedReason = a3;
  }
}

- (int)StringAsSendAnnouncementIntentAnnouncementUnsupportedReason:(id)a3
{
  return 1;
}

- (id)sendAnnouncementIntentAnnouncementUnsupportedReasonAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"NO_ANNOUNCEMENT_TO_REPLY_TO";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasSendAnnouncementIntentAnnouncementUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasSendAnnouncementIntentAnnouncementUnsupportedReason
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (int)StringAsSnoozeAlarmIntentAlarmsUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NO_ALARM_FIRING"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"CANT_SNOOZE_MUSIC_ALARM"];
  }

  return v4;
}

- (id)snoozeAlarmIntentAlarmsUnsupportedReasonAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"CANT_SNOOZE_MUSIC_ALARM";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"NO_ALARM_FIRING";
  }
  return v4;
}

- (void)setHasSnoozeAlarmIntentAlarmsUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasSnoozeAlarmIntentAlarmsUnsupportedReason
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setSnoozeAlarmIntentAlarmsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFFFFFEFLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x10);
    self->_int snoozeAlarmIntentAlarmsUnsupportedReason = a3;
  }
}

- (void)setHasSearchAlarmIntentAlarmsUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasSearchAlarmIntentAlarmsUnsupportedReason
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSearchAlarmIntentAlarmsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFFFFFF7);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 8);
    self->_int searchAlarmIntentAlarmsUnsupportedReason = a3;
  }
}

- (id)deleteAlarmIntentAlarmsUnsupportedReasonAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"NO_ALARM_EXISTS";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"NOT_FOUND";
  }
  return v4;
}

- (void)setHasDeleteAlarmIntentAlarmsUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasDeleteAlarmIntentAlarmsUnsupportedReason
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDeleteAlarmIntentAlarmsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFFFFFFBLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 4);
    self->_int deleteAlarmIntentAlarmsUnsupportedReason = a3;
  }
}

- (int)StringAsChangeAlarmStatusIntentAlarmsUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NOT_FOUND"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NO_ALARM_EXISTS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ALARM_ALREADY_ENABLED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ALARM_ALREADY_DISABLED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ALARM_NOT_FIRING"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SLEEP_ALARM_NOT_SUPPORTED"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setHasChangeAlarmStatusIntentAlarmsUnsupportedReason:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasChangeAlarmStatusIntentAlarmsUnsupportedReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setChangeAlarmStatusIntentAlarmsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFFFFFFDLL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 2);
    self->_int changeAlarmStatusIntentAlarmsUnsupportedReason = a3;
  }
}

- (int)StringAsUpdateAlarmIntentAlarmUnsupportedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NOT_FOUND"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NO_ALARM_EXISTS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SLEEP_ALARM_NOT_SUPPORTED"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)updateAlarmIntentAlarmUnsupportedReasonAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 3)
    {
      int v4 = @"SLEEP_ALARM_NOT_SUPPORTED";
    }
    else if (a3 == 1)
    {
      int v4 = @"NO_ALARM_EXISTS";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"NOT_FOUND";
  }
  return v4;
}

- (void)setHasUpdateAlarmIntentAlarmUnsupportedReason:(BOOL)a3
{
  self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasUpdateAlarmIntentAlarmUnsupportedReason
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setUpdateAlarmIntentAlarmUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(void *)&has & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    self->_$6684D1921AA65EBAD0A930EA955AC65C has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 1);
    self->_int updateAlarmIntentAlarmUnsupportedReason = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)conflictingParametersType
{
  return (Class)objc_opt_class();
}

@end