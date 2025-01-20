@interface EKSourceConstraints
+ (BOOL)supportsSecureCoding;
+ (id)allAllowSourceConstraints;
- (BOOL)allowsCalendarAddDeleteModify;
- (BOOL)allowsEvents;
- (BOOL)allowsPrivateEventAccessByDelegate;
- (BOOL)allowsProposeNewTime;
- (BOOL)allowsTasks;
- (BOOL)attendeesUseDeletedByOrganizerStatus;
- (BOOL)canSetAvailability;
- (BOOL)declinedStatusChangeRequiresNoPendingStatus;
- (BOOL)deliverySourceOrExternalIDRequiredForResponse;
- (BOOL)eventAvailabilityLimited;
- (BOOL)eventDurationConstrainedToRecurrenceInterval;
- (BOOL)futureStartDateLimitedToOccurrenceCacheBounds;
- (BOOL)inviteesCanSeeAttendeeStatuses;
- (BOOL)isFacebook;
- (BOOL)isLocalStore;
- (BOOL)mustAcknowledgeMasterEvent;
- (BOOL)occurrenceOrderEnforcedAfterDetachment;
- (BOOL)occurrencesMustOccurOnSeparateDays;
- (BOOL)organizerCanSeeAttendeeStatuses;
- (BOOL)prohibitsDetachmentOnCommentChange;
- (BOOL)prohibitsICSImport;
- (BOOL)prohibitsMultipleDaysInMonthlyRecurrence;
- (BOOL)prohibitsMultipleMonthsInYearlyRecurrence;
- (BOOL)prohibitsPrivateEventsWithAttendees;
- (BOOL)prohibitsSlicingEventsWithAttendees;
- (BOOL)prohibitsUsingEventOrganizerEmailWhenComposingMail;
- (BOOL)prohibitsYearlyRecurrenceInterval;
- (BOOL)proposedStatusRequiredForResponse;
- (BOOL)recurrenceSeriesMustIncludeMoreThanFirstOccurrence;
- (BOOL)recurrencesShouldPinToMonthDays;
- (BOOL)requiresAttendeeSearchInSingleAccount;
- (BOOL)requiresMSFormattedUID;
- (BOOL)requiresOccurrencesConformToRecurrenceRule;
- (BOOL)requiresOpeningAttachmentAsLink;
- (BOOL)requiresOutgoingInvitationsInDefaultCalendar;
- (BOOL)requiresSamePrivacyLevelAcrossRecurrenceSeries;
- (BOOL)requiresSeparateFilesForAllAttachments;
- (BOOL)shouldCancelDeletedEvents;
- (BOOL)shouldDeclineDeletedInvitations;
- (BOOL)shouldUseDeleteAndAddInsteadOfMoveBetweenCalendars;
- (BOOL)snoozeAlarmRequiresDetach;
- (BOOL)statusesAreAccurate;
- (BOOL)supportsAlarmProximity;
- (BOOL)supportsAlarmTriggerDates;
- (BOOL)supportsAlarmTriggerIntervals;
- (BOOL)supportsAlarmsTriggeringAfterStartDate;
- (BOOL)supportsAllDayDueDates;
- (BOOL)supportsAttachments;
- (BOOL)supportsAutoGeocodingStructuredLocations;
- (BOOL)supportsAvailabilityRequests;
- (BOOL)supportsClearingPrivateComments;
- (BOOL)supportsDelegateEnumeration;
- (BOOL)supportsDelegation;
- (BOOL)supportsEventForwarding;
- (BOOL)supportsFloatingTimeZone;
- (BOOL)supportsIgnoringEventsInAvailabilityRequests;
- (BOOL)supportsInboxAvailability;
- (BOOL)supportsIncomingInvitations;
- (BOOL)supportsInvitationModifications;
- (BOOL)supportsInvitationModificationsWithoutNotification;
- (BOOL)supportsJunkReporting;
- (BOOL)supportsLocationDirectorySearches;
- (BOOL)supportsManagedSubscribedCalendars;
- (BOOL)supportsOutgoingInvitations;
- (BOOL)supportsParticipantRoles;
- (BOOL)supportsPhoneNumbers;
- (BOOL)supportsPrivateEvents;
- (BOOL)supportsPush;
- (BOOL)supportsRecurrenceSplit;
- (BOOL)supportsRecurrencesOnDetachedEvents;
- (BOOL)supportsReminderActions;
- (BOOL)supportsReminderLocations;
- (BOOL)supportsResponseComments;
- (BOOL)supportsSharedCalendars;
- (BOOL)supportsStructuredLocations;
- (BOOL)supportsSubscribedCalendars;
- (BOOL)supportsSubscriptionMirroring;
- (BOOL)supportsTravelTime;
- (BOOL)supportsURLField;
- (EKSourceConstraints)init;
- (EKSourceConstraints)initWithCDBSourceConstraintFlags:(id *)a3;
- (EKSourceConstraints)initWithCoder:(id)a3;
- (EKSourceConstraints)initWithData:(id)a3;
- (id)serialized;
- (int)maxAlarmsAllowed;
- (int)maxRecurrencesAllowed;
- (int)strictestEventPrivateValue;
- (unsigned)externalDataFormat;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsCalendarAddDeleteModify:(BOOL)a3;
- (void)setAllowsEvents:(BOOL)a3;
- (void)setAllowsPrivateEventAccessByDelegate:(BOOL)a3;
- (void)setAllowsProposeNewTime:(BOOL)a3;
- (void)setAllowsTasks:(BOOL)a3;
- (void)setAttendeesUseDeletedByOrganizerStatus:(BOOL)a3;
- (void)setCanSetAvailability:(BOOL)a3;
- (void)setDeclinedStatusChangeRequiresNoPendingStatus:(BOOL)a3;
- (void)setDeliverySourceOrExternalIDRequiredForResponse:(BOOL)a3;
- (void)setEventAvailabilityLimited:(BOOL)a3;
- (void)setEventDurationConstrainedToRecurrenceInterval:(BOOL)a3;
- (void)setExternalDataFormat:(unsigned int)a3;
- (void)setFutureStartDateLimitedToOccurrenceCacheBounds:(BOOL)a3;
- (void)setInviteesCanSeeAttendeeStatuses:(BOOL)a3;
- (void)setIsFacebook:(BOOL)a3;
- (void)setIsLocalStore:(BOOL)a3;
- (void)setMaxAlarmsAllowed:(int)a3;
- (void)setMaxRecurrencesAllowed:(int)a3;
- (void)setMustAcknowledgeMasterEvent:(BOOL)a3;
- (void)setOccurrenceOrderEnforcedAfterDetachment:(BOOL)a3;
- (void)setOccurrencesMustOccurOnSeparateDays:(BOOL)a3;
- (void)setOrganizerCanSeeAttendeeStatuses:(BOOL)a3;
- (void)setProhibitsDetachmentOnCommentChange:(BOOL)a3;
- (void)setProhibitsICSImport:(BOOL)a3;
- (void)setProhibitsMultipleDaysInMonthlyRecurrence:(BOOL)a3;
- (void)setProhibitsMultipleMonthsInYearlyRecurrence:(BOOL)a3;
- (void)setProhibitsPrivateEventsWithAttendees:(BOOL)a3;
- (void)setProhibitsSlicingEventsWithAttendees:(BOOL)a3;
- (void)setProhibitsUsingEventOrganizerEmailWhenComposingMail:(BOOL)a3;
- (void)setProhibitsYearlyRecurrenceInterval:(BOOL)a3;
- (void)setProposedStatusRequiredForResponse:(BOOL)a3;
- (void)setRecurrenceSeriesMustIncludeMoreThanFirstOccurrence:(BOOL)a3;
- (void)setRecurrencesShouldPinToMonthDays:(BOOL)a3;
- (void)setRequiresAttendeeSearchInSingleAccount:(BOOL)a3;
- (void)setRequiresMSFormattedUID:(BOOL)a3;
- (void)setRequiresOccurrencesConformToRecurrenceRule:(BOOL)a3;
- (void)setRequiresOpeningAttachmentAsLink:(BOOL)a3;
- (void)setRequiresOutgoingInvitationsInDefaultCalendar:(BOOL)a3;
- (void)setRequiresSamePrivacyLevelAcrossRecurrenceSeries:(BOOL)a3;
- (void)setRequiresSeparateFilesForAllAttachments:(BOOL)a3;
- (void)setShouldCancelDeletedEvents:(BOOL)a3;
- (void)setShouldDeclineDeletedInvitations:(BOOL)a3;
- (void)setShouldUseDeleteAndAddInsteadOfMoveBetweenCalendars:(BOOL)a3;
- (void)setSnoozeAlarmRequiresDetach:(BOOL)a3;
- (void)setStatusesAreAccurate:(BOOL)a3;
- (void)setStrictestEventPrivateValue:(int)a3;
- (void)setSupportsAlarmProximity:(BOOL)a3;
- (void)setSupportsAlarmTriggerDates:(BOOL)a3;
- (void)setSupportsAlarmTriggerIntervals:(BOOL)a3;
- (void)setSupportsAlarmsTriggeringAfterStartDate:(BOOL)a3;
- (void)setSupportsAllDayDueDates:(BOOL)a3;
- (void)setSupportsAttachments:(BOOL)a3;
- (void)setSupportsAutoGeocodingStructuredLocations:(BOOL)a3;
- (void)setSupportsAvailabilityRequests:(BOOL)a3;
- (void)setSupportsClearingPrivateComments:(BOOL)a3;
- (void)setSupportsDelegateEnumeration:(BOOL)a3;
- (void)setSupportsDelegation:(BOOL)a3;
- (void)setSupportsEventForwarding:(BOOL)a3;
- (void)setSupportsFloatingTimeZone:(BOOL)a3;
- (void)setSupportsIgnoringEventsInAvailabilityRequests:(BOOL)a3;
- (void)setSupportsInboxAvailability:(BOOL)a3;
- (void)setSupportsIncomingInvitations:(BOOL)a3;
- (void)setSupportsInvitationModifications:(BOOL)a3;
- (void)setSupportsInvitationModificationsWithoutNotification:(BOOL)a3;
- (void)setSupportsJunkReporting:(BOOL)a3;
- (void)setSupportsLocationDirectorySearches:(BOOL)a3;
- (void)setSupportsManagedSubscribedCalendars:(BOOL)a3;
- (void)setSupportsOutgoingInvitations:(BOOL)a3;
- (void)setSupportsParticipantRoles:(BOOL)a3;
- (void)setSupportsPhoneNumbers:(BOOL)a3;
- (void)setSupportsPrivateEvents:(BOOL)a3;
- (void)setSupportsPush:(BOOL)a3;
- (void)setSupportsRecurrenceSplit:(BOOL)a3;
- (void)setSupportsRecurrencesOnDetachedEvents:(BOOL)a3;
- (void)setSupportsReminderActions:(BOOL)a3;
- (void)setSupportsReminderLocations:(BOOL)a3;
- (void)setSupportsResponseComments:(BOOL)a3;
- (void)setSupportsSharedCalendars:(BOOL)a3;
- (void)setSupportsStructuredLocations:(BOOL)a3;
- (void)setSupportsSubscribedCalendars:(BOOL)a3;
- (void)setSupportsSubscriptionMirroring:(BOOL)a3;
- (void)setSupportsTravelTime:(BOOL)a3;
- (void)setSupportsURLField:(BOOL)a3;
@end

@implementation EKSourceConstraints

- (BOOL)recurrencesShouldPinToMonthDays
{
  return (*((void *)&self->_flags + 2) >> 22) & 1;
}

- (EKSourceConstraints)initWithData:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v10, 0, 28);
  if ([v4 length] == 28)
  {
    [v4 getBytes:v10 length:28];
    v5 = [EKSourceConstraints alloc];
    v9[0] = v10[0];
    *(_OWORD *)((char *)v9 + 12) = *(_OWORD *)((char *)v10 + 12);
    v6 = [(EKSourceConstraints *)v5 initWithCDBSourceConstraintFlags:v9];
  }
  else
  {
    v7 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKSourceConstraints initWithData:](v7);
    }
    v6 = 0;
  }

  return v6;
}

- (EKSourceConstraints)initWithCDBSourceConstraintFlags:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKSourceConstraints;
  result = [(EKSourceConstraints *)&v6 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->var0;
    *(_OWORD *)&result->_flags.strictestEventPrivateValue = *(_OWORD *)&a3->var3;
    *(_OWORD *)&result->_flags.maxAlarmsAllowed = v5;
  }
  return result;
}

+ (id)allAllowSourceConstraints
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4[0] = xmmword_1A4F8FD3C;
  *(_OWORD *)((char *)v4 + 12) = *(long long *)((char *)&xmmword_1A4F8FD3C + 12);
  v2 = [[EKSourceConstraints alloc] initWithCDBSourceConstraintFlags:v4];

  return v2;
}

- (EKSourceConstraints)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3[0] = *MEMORY[0x1E4F57530];
  *(_OWORD *)((char *)v3 + 12) = *(_OWORD *)(MEMORY[0x1E4F57530] + 12);
  return [(EKSourceConstraints *)self initWithCDBSourceConstraintFlags:v3];
}

- (id)serialized
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&self->_flags length:28];

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (EKSourceConstraints)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EKSourceConstraints;
  uint64_t v5 = [(EKSourceConstraints *)&v12 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v11 = 0;
  objc_super v6 = (long long *)[v4 decodeBytesForKey:@"flags" returnedLength:&v11];
  if (v11 == 28)
  {
    long long v7 = *v6;
    *(_OWORD *)(v5 + 20) = *(long long *)((char *)v6 + 12);
    *(_OWORD *)(v5 + 8) = v7;
LABEL_4:
    v8 = v5;
    goto LABEL_8;
  }
  v9 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    -[EKSourceConstraints initWithData:](v9);
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (int)maxAlarmsAllowed
{
  return self->_flags.maxAlarmsAllowed;
}

- (void)setMaxAlarmsAllowed:(int)a3
{
  self->_flags.maxAlarmsAllowed = a3;
}

- (int)maxRecurrencesAllowed
{
  return self->_flags.maxRecurrencesAllowed;
}

- (void)setMaxRecurrencesAllowed:(int)a3
{
  self->_flags.maxRecurrencesAllowed = a3;
}

- (unsigned)externalDataFormat
{
  return self->_flags.externalDataFormat;
}

- (void)setExternalDataFormat:(unsigned int)a3
{
  self->_flags.externalDataFormat = a3;
}

- (int)strictestEventPrivateValue
{
  return self->_flags.strictestEventPrivateValue;
}

- (void)setStrictestEventPrivateValue:(int)a3
{
  self->_flags.strictestEventPrivateValue = a3;
}

- (BOOL)isLocalStore
{
  return *((_DWORD *)&self->_flags + 4) & 1;
}

- (void)setIsLocalStore:(BOOL)a3
{
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)supportsAlarmTriggerIntervals
{
  return (*((void *)&self->_flags + 2) >> 1) & 1;
}

- (void)setSupportsAlarmTriggerIntervals:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)supportsAlarmTriggerDates
{
  return (*((void *)&self->_flags + 2) >> 2) & 1;
}

- (void)setSupportsAlarmTriggerDates:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)supportsAlarmsTriggeringAfterStartDate
{
  return (*((void *)&self->_flags + 2) >> 3) & 1;
}

- (void)setSupportsAlarmsTriggeringAfterStartDate:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)snoozeAlarmRequiresDetach
{
  return (*((void *)&self->_flags + 2) >> 4) & 1;
}

- (void)setSnoozeAlarmRequiresDetach:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)organizerCanSeeAttendeeStatuses
{
  return (*((void *)&self->_flags + 2) >> 5) & 1;
}

- (void)setOrganizerCanSeeAttendeeStatuses:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)inviteesCanSeeAttendeeStatuses
{
  return (*((void *)&self->_flags + 2) >> 6) & 1;
}

- (void)setInviteesCanSeeAttendeeStatuses:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)statusesAreAccurate
{
  return (*((void *)&self->_flags + 2) >> 7) & 1;
}

- (void)setStatusesAreAccurate:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)supportsIncomingInvitations
{
  return (*((void *)&self->_flags + 2) >> 8) & 1;
}

- (void)setSupportsIncomingInvitations:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)supportsOutgoingInvitations
{
  return (*((void *)&self->_flags + 2) >> 9) & 1;
}

- (void)setSupportsOutgoingInvitations:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)requiresOutgoingInvitationsInDefaultCalendar
{
  return (*((void *)&self->_flags + 2) >> 10) & 1;
}

- (void)setRequiresOutgoingInvitationsInDefaultCalendar:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)supportsInvitationModifications
{
  return (*((void *)&self->_flags + 2) >> 11) & 1;
}

- (void)setSupportsInvitationModifications:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)supportsEventForwarding
{
  return (*((void *)&self->_flags + 2) >> 12) & 1;
}

- (void)setSupportsEventForwarding:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)supportsResponseComments
{
  return (*((void *)&self->_flags + 2) >> 13) & 1;
}

- (void)setSupportsResponseComments:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)deliverySourceOrExternalIDRequiredForResponse
{
  return (*((void *)&self->_flags + 2) >> 14) & 1;
}

- (void)setDeliverySourceOrExternalIDRequiredForResponse:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)proposedStatusRequiredForResponse
{
  return (*((void *)&self->_flags + 2) >> 15) & 1;
}

- (void)setProposedStatusRequiredForResponse:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)declinedStatusChangeRequiresNoPendingStatus
{
  return (*((void *)&self->_flags + 2) >> 16) & 1;
}

- (void)setDeclinedStatusChangeRequiresNoPendingStatus:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)eventDurationConstrainedToRecurrenceInterval
{
  return (*((void *)&self->_flags + 2) >> 17) & 1;
}

- (void)setEventDurationConstrainedToRecurrenceInterval:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)occurrencesMustOccurOnSeparateDays
{
  return (*((void *)&self->_flags + 2) >> 19) & 1;
}

- (void)setOccurrencesMustOccurOnSeparateDays:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)futureStartDateLimitedToOccurrenceCacheBounds
{
  return (*((void *)&self->_flags + 2) >> 20) & 1;
}

- (void)setFutureStartDateLimitedToOccurrenceCacheBounds:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)supportsRecurrencesOnDetachedEvents
{
  return (*((void *)&self->_flags + 2) >> 21) & 1;
}

- (void)setSupportsRecurrencesOnDetachedEvents:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (void)setRecurrencesShouldPinToMonthDays:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)requiresAttendeeSearchInSingleAccount
{
  return (*((void *)&self->_flags + 2) >> 23) & 1;
}

- (void)setRequiresAttendeeSearchInSingleAccount:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)mustAcknowledgeMasterEvent
{
  return (*((void *)&self->_flags + 2) >> 24) & 1;
}

- (void)setMustAcknowledgeMasterEvent:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)canSetAvailability
{
  return (*((void *)&self->_flags + 2) >> 25) & 1;
}

- (void)setCanSetAvailability:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)eventAvailabilityLimited
{
  return (*((void *)&self->_flags + 2) >> 26) & 1;
}

- (void)setEventAvailabilityLimited:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)requiresMSFormattedUID
{
  return (*((void *)&self->_flags + 2) >> 27) & 1;
}

- (void)setRequiresMSFormattedUID:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)shouldCancelDeletedEvents
{
  return (*((void *)&self->_flags + 2) >> 28) & 1;
}

- (void)setShouldCancelDeletedEvents:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)shouldDeclineDeletedInvitations
{
  return (*((void *)&self->_flags + 2) >> 29) & 1;
}

- (void)setShouldDeclineDeletedInvitations:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)supportsStructuredLocations
{
  return (*((void *)&self->_flags + 2) >> 30) & 1;
}

- (void)setSupportsStructuredLocations:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)supportsReminderActions
{
  return (*((void *)&self->_flags + 2) >> 31) & 1;
}

- (void)setSupportsReminderActions:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)supportsReminderLocations
{
  return HIDWORD(*((void *)&self->_flags + 2)) & 1;
}

- (void)setSupportsReminderLocations:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)supportsAlarmProximity
{
  return (*((void *)&self->_flags + 2) >> 33) & 1;
}

- (void)setSupportsAlarmProximity:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)allowsCalendarAddDeleteModify
{
  return (*((void *)&self->_flags + 2) >> 34) & 1;
}

- (void)setAllowsCalendarAddDeleteModify:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)allowsTasks
{
  return (*((void *)&self->_flags + 2) >> 35) & 1;
}

- (void)setAllowsTasks:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)allowsEvents
{
  return (*((void *)&self->_flags + 2) >> 36) & 1;
}

- (void)setAllowsEvents:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)supportsURLField
{
  return (*((void *)&self->_flags + 2) >> 37) & 1;
}

- (void)setSupportsURLField:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)supportsAllDayDueDates
{
  return (*((void *)&self->_flags + 2) >> 38) & 1;
}

- (void)setSupportsAllDayDueDates:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)supportsSharedCalendars
{
  return (*((void *)&self->_flags + 2) >> 39) & 1;
}

- (void)setSupportsSharedCalendars:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)isFacebook
{
  return (*((void *)&self->_flags + 2) >> 40) & 1;
}

- (void)setIsFacebook:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)recurrenceSeriesMustIncludeMoreThanFirstOccurrence
{
  return (*((void *)&self->_flags + 2) >> 41) & 1;
}

- (void)setRecurrenceSeriesMustIncludeMoreThanFirstOccurrence:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)supportsPrivateEvents
{
  return (*((void *)&self->_flags + 2) >> 42) & 1;
}

- (void)setSupportsPrivateEvents:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)prohibitsPrivateEventsWithAttendees
{
  return (*((void *)&self->_flags + 2) >> 43) & 1;
}

- (void)setProhibitsPrivateEventsWithAttendees:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)supportsAvailabilityRequests
{
  return (*((void *)&self->_flags + 2) >> 44) & 1;
}

- (void)setSupportsAvailabilityRequests:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)supportsIgnoringEventsInAvailabilityRequests
{
  return (*((void *)&self->_flags + 2) >> 45) & 1;
}

- (void)setSupportsIgnoringEventsInAvailabilityRequests:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)supportsLocationDirectorySearches
{
  return (*((void *)&self->_flags + 2) >> 46) & 1;
}

- (void)setSupportsLocationDirectorySearches:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)requiresSamePrivacyLevelAcrossRecurrenceSeries
{
  return (*((void *)&self->_flags + 2) >> 47) & 1;
}

- (void)setRequiresSamePrivacyLevelAcrossRecurrenceSeries:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)supportsInboxAvailability
{
  return HIWORD(*((void *)&self->_flags + 2)) & 1;
}

- (void)setSupportsInboxAvailability:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)prohibitsMultipleMonthsInYearlyRecurrence
{
  return (*((void *)&self->_flags + 2) >> 49) & 1;
}

- (void)setProhibitsMultipleMonthsInYearlyRecurrence:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)prohibitsMultipleDaysInMonthlyRecurrence
{
  return (*((void *)&self->_flags + 2) >> 50) & 1;
}

- (void)setProhibitsMultipleDaysInMonthlyRecurrence:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)prohibitsYearlyRecurrenceInterval
{
  return (*((void *)&self->_flags + 2) >> 51) & 1;
}

- (void)setProhibitsYearlyRecurrenceInterval:(BOOL)a3
{
  uint64_t v3 = 0x8000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)requiresOccurrencesConformToRecurrenceRule
{
  return (*((void *)&self->_flags + 2) >> 52) & 1;
}

- (void)setRequiresOccurrencesConformToRecurrenceRule:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)prohibitsDetachmentOnCommentChange
{
  return (*((void *)&self->_flags + 2) >> 53) & 1;
}

- (void)setProhibitsDetachmentOnCommentChange:(BOOL)a3
{
  uint64_t v3 = 0x20000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)allowsProposeNewTime
{
  return (*((void *)&self->_flags + 2) >> 54) & 1;
}

- (void)setAllowsProposeNewTime:(BOOL)a3
{
  uint64_t v3 = 0x40000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)prohibitsICSImport
{
  return (*((void *)&self->_flags + 2) >> 55) & 1;
}

- (void)setProhibitsICSImport:(BOOL)a3
{
  uint64_t v3 = 0x80000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)supportsAutoGeocodingStructuredLocations
{
  return HIBYTE(*((void *)&self->_flags + 2)) & 1;
}

- (void)setSupportsAutoGeocodingStructuredLocations:(BOOL)a3
{
  uint64_t v3 = 0x100000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)supportsJunkReporting
{
  return (*((void *)&self->_flags + 2) >> 57) & 1;
}

- (void)setSupportsJunkReporting:(BOOL)a3
{
  uint64_t v3 = 0x200000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)supportsPhoneNumbers
{
  return (*((void *)&self->_flags + 2) >> 58) & 1;
}

- (void)setSupportsPhoneNumbers:(BOOL)a3
{
  uint64_t v3 = 0x400000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)attendeesUseDeletedByOrganizerStatus
{
  return (*((void *)&self->_flags + 2) >> 59) & 1;
}

- (void)setAttendeesUseDeletedByOrganizerStatus:(BOOL)a3
{
  uint64_t v3 = 0x800000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)prohibitsSlicingEventsWithAttendees
{
  return (*((void *)&self->_flags + 2) >> 60) & 1;
}

- (void)setProhibitsSlicingEventsWithAttendees:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)supportsSubscribedCalendars
{
  return (*((void *)&self->_flags + 2) >> 61) & 1;
}

- (void)setSupportsSubscribedCalendars:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)supportsManagedSubscribedCalendars
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 7) & 1;
}

- (void)setSupportsManagedSubscribedCalendars:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFF7F | v3;
}

- (BOOL)supportsSubscriptionMirroring
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 8) & 1;
}

- (void)setSupportsSubscriptionMirroring:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFEFF | v3;
}

- (BOOL)supportsParticipantRoles
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 9) & 1;
}

- (void)setSupportsParticipantRoles:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFDFF | v3;
}

- (BOOL)supportsAttachments
{
  return (*((void *)&self->_flags + 2) >> 62) & 1;
}

- (void)setSupportsAttachments:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = *((void *)&self->_flags + 2) & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)requiresOpeningAttachmentAsLink
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 4) & 1;
}

- (void)setRequiresOpeningAttachmentAsLink:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFFEF | v3;
}

- (BOOL)supportsClearingPrivateComments
{
  return (unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 15;
}

- (void)setSupportsClearingPrivateComments:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_flags + 12) = v3 & 0x8000 | *((_WORD *)&self->_flags + 12) & 0x7FFF;
}

- (BOOL)shouldUseDeleteAndAddInsteadOfMoveBetweenCalendars
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 5) & 1;
}

- (void)setShouldUseDeleteAndAddInsteadOfMoveBetweenCalendars:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFFDF | v3;
}

- (BOOL)supportsFloatingTimeZone
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 1) & 1;
}

- (void)setSupportsFloatingTimeZone:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFFFD | v3;
}

- (BOOL)prohibitsUsingEventOrganizerEmailWhenComposingMail
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 2) & 1;
}

- (void)setProhibitsUsingEventOrganizerEmailWhenComposingMail:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFFFB | v3;
}

- (BOOL)supportsDelegation
{
  return *((void *)&self->_flags + 2) >> 63;
}

- (void)setSupportsDelegation:(BOOL)a3
{
  unint64_t v3 = 0x8000000000000000;
  if (!a3) {
    unint64_t v3 = 0;
  }
  *((void *)&self->_flags + 2) = v3 & 0x8000000000000000 | *((void *)&self->_flags + 2) & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)supportsDelegateEnumeration
{
  return *((_WORD *)&self->_flags + 12) & 1;
}

- (void)setSupportsDelegateEnumeration:(BOOL)a3
{
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFFFE | a3;
}

- (BOOL)supportsInvitationModificationsWithoutNotification
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 6) & 1;
}

- (void)setSupportsInvitationModificationsWithoutNotification:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFFBF | v3;
}

- (BOOL)supportsRecurrenceSplit
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 3) & 1;
}

- (void)setSupportsRecurrenceSplit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFFF7 | v3;
}

- (BOOL)supportsPush
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 10) & 1;
}

- (void)setSupportsPush:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFBFF | v3;
}

- (BOOL)supportsTravelTime
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 11) & 1;
}

- (void)setSupportsTravelTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xF7FF | v3;
}

- (BOOL)requiresSeparateFilesForAllAttachments
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 12) & 1;
}

- (void)setRequiresSeparateFilesForAllAttachments:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xEFFF | v3;
}

- (BOOL)occurrenceOrderEnforcedAfterDetachment
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 13) & 1;
}

- (void)setOccurrenceOrderEnforcedAfterDetachment:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xDFFF | v3;
}

- (BOOL)allowsPrivateEventAccessByDelegate
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 14) & 1;
}

- (void)setAllowsPrivateEventAccessByDelegate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xBFFF | v3;
}

- (void)initWithData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Constraints data size is wrong. Your version of EventKit is incompatible with the running version of calaccessd.", v1, 2u);
}

@end