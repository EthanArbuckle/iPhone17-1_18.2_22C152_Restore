@interface EKEvent
+ (BOOL)_allowSlicingFromDetachedOccurrence;
+ (BOOL)_calendarsAreSharedToMeInSameSourceAndHaveSameOwner:(id)a3;
+ (BOOL)_notDetachedOccurrenceOfEvent:(id)a3 existsInDateRangeWithStartDate:(id)a4 endDate:(id)a5 inTimeZone:(id)a6;
+ (BOOL)_validateSpanForRemove:(int64_t)a3 error:(id *)a4;
+ (BOOL)isMultiDayTimedEventWithStartDate:(id)a3 endDate:(id)a4 allDay:(BOOL)a5 inCalendar:(id)a6;
+ (Class)frozenClass;
+ (EKEvent)eventWithEventStore:(EKEventStore *)eventStore;
+ (id)EKObjectChangeSummarizer_multiValueDiffKeys;
+ (id)EKObjectChangeSummarizer_singleValueDiffKeys;
+ (id)_basicChangesRequiringSpanAll;
+ (id)_locationStringForLocations:(id)a3;
+ (id)_modifiedNotificationUserInfoWithIdentifier:(id)a3 forRevert:(BOOL)a4;
+ (id)_relatedCachedTimeKeys;
+ (id)_updatedPredictedLocationRespectingTimeoutBudgetForEvent:(id)a3 error:(id *)a4;
+ (id)eventFromICSEvent:(id)a3 inStore:(id)a4;
+ (id)externalUriScheme;
+ (id)generateUniqueIDWithEvent:(id)a3 originalEvent:(id)a4 calendar:(id)a5;
+ (id)knownKeysToSkipForFutureChanges;
+ (id)knownKeysToUseForFutureChanges;
+ (id)knownPerUserPropertyKeys;
+ (id)knownRelationshipMultiValueKeys;
+ (id)knownRelationshipSingleValueKeys;
+ (id)knownRequireRSVPKeys;
+ (id)knownSingleValueKeysForComparison;
+ (int64_t)_coercedEventAvailabilityForDesiredAvailability:(int64_t)a3 supportedAvailabilities:(unint64_t)a4;
+ (int64_t)_eventAvailabilityForParticipantStatus:(int64_t)a3 supportedEventAvailabilities:(unint64_t)a4 isAllDayEvent:(BOOL)a5;
+ (int64_t)ekWeekDayFromVCSWeekDay:(unint64_t)a3;
+ (void)_detachOrSliceEvent:(id)a3 withSpan:(int64_t)a4 savingEvent:(id)a5 withOriginalStartDate:(id)a6 newStartDate:(id)a7;
- (BOOL)_attemptToUpdateComplexRecurrenceRule;
- (BOOL)_canMoveOrCopyFromCalendar:(id)a3 toCalendar:(id)a4 allowedRequirements:(int64_t)a5 error:(id *)a6;
- (BOOL)_cancelWithSpan:(int64_t)a3 error:(id *)a4;
- (BOOL)_changesRequireDetachOrSlice;
- (BOOL)_checkStartDateConstraintAgainstDate:(id)a3 timeZone:(id)a4 error:(id *)a5;
- (BOOL)_couldBeJunkCommon;
- (BOOL)_detectedConferenceURLOnBackingObjectMayBeInvalid;
- (BOOL)_diff:(id)a3 isDifferentFromCommittedEventHelperRequiresReschedule:(BOOL)a4;
- (BOOL)_eligibleForTravelAdvisoriesIncludePotential:(BOOL)a3;
- (BOOL)_eventIsTheOnlyRemainingOccurrence;
- (BOOL)_fetchedEventIsConflict:(id)a3 forStartDate:(id)a4 endDate:(id)a5;
- (BOOL)_hasAbsoluteAlarms;
- (BOOL)_hasBasicChangesRequiringSpanAll;
- (BOOL)_hasExternalIDOrDeliverySource;
- (BOOL)_hasOrHadRecurrenceRule;
- (BOOL)_hasRecurrenceRuleChangeRequiringSpanAll;
- (BOOL)_invitationChangedPropertyForFlag:(unsigned int)a3;
- (BOOL)_isAllDay;
- (BOOL)_isOnlyChangeToAttendeesSelfAttendeeParticipationStatus;
- (BOOL)_isOriginalOccurrenceStartDateSameAsCommittedStartDate;
- (BOOL)_isParticipationStatusDirty;
- (BOOL)_isSignificantlyDetachedComparedToMaster:(id)a3 shouldIgnorePartStat:(BOOL)a4;
- (BOOL)_isSimpleRepeatingEvent;
- (BOOL)_isValidAttendee:(id)a3 forCalendar:(id)a4 selfAttendeeIsValid:(BOOL)a5;
- (BOOL)_needsAttendeePartStatReset;
- (BOOL)_needsPredictedLocationCacheUpdateHoldingLock;
- (BOOL)_noRemainingEarlierOccurrences;
- (BOOL)_occurrenceExistsOnDate:(id)a3 timeZone:(id)a4;
- (BOOL)_requirementsToMoveOrCopyToCalendarHelperAllowedToMoveOrCopyEventFromCalendar:(id)a3 toCalendar:(id)a4;
- (BOOL)_requirementsToMoveToCalendarHelperAlterationsRequiredToMoveEventFromCalendar:(id)a3 toCalendar:(id)a4;
- (BOOL)_requirementsToMoveToCalendarHelperDuplicationRequiredToMoveEventFromCalendar:(id)a3 toCalendar:(id)a4;
- (BOOL)_requirementsToMoveToCalendarHelperNeedToRemoveOriginalToMoveEventFromCalendar:(id)a3 toCalendar:(id)a4;
- (BOOL)_requirementsToMoveToCalendarHelperReinviteAttendeesRequiredToMoveEventFromCalendar:(id)a3 toCalendar:(id)a4;
- (BOOL)_requirementsToMoveToCalendarHelperRemoveAttendeesRequiredToMoveEventFromCalendar:(id)a3 toCalendar:(id)a4;
- (BOOL)_reset;
- (BOOL)_revertIncludingCoCommits:(BOOL)a3;
- (BOOL)_saveUndetachedOccurrenceWithError:(id *)a3;
- (BOOL)_settingTimeZoneChangesStartEndDates;
- (BOOL)_shouldAlertInviteeDeclines;
- (BOOL)_shouldCancelInsteadOfDeleteWithSpan:(int64_t)a3;
- (BOOL)_shouldDeclineInsteadOfDelete;
- (BOOL)_shouldPreserveFutureWhenSlicingWithStartDate:(id)a3 newStartDate:(id)a4;
- (BOOL)_suggestedStartDateHelperRecurrenceRuleRequiresExpansion:(id)a3 forDate:(id)a4;
- (BOOL)_userAddressesRepresentInvitedAttendee:(id)a3 checkEmailAddresses:(BOOL)a4;
- (BOOL)_validateDatesAndRecurrencesGivenSpan:(int64_t)a3 error:(id *)a4;
- (BOOL)allowsAlarmModifications;
- (BOOL)allowsAllDayModifications;
- (BOOL)allowsAttendeesModifications;
- (BOOL)allowsAvailabilityModifications;
- (BOOL)allowsCalendarModifications;
- (BOOL)allowsClearingCommentsAsOrganizer;
- (BOOL)allowsNonzeroDuration;
- (BOOL)allowsParticipationStatusModifications;
- (BOOL)allowsPrivacyLevelModifications;
- (BOOL)allowsProposedTimeModifications;
- (BOOL)allowsRecurrenceModificationsForSpan:(int64_t)a3;
- (BOOL)allowsResponseCommentModifications;
- (BOOL)allowsSpansOtherThanThisEvent;
- (BOOL)allowsTravelTimeModifications;
- (BOOL)attendeeComment;
- (BOOL)attendeeDeclinedStartDate;
- (BOOL)attendeeProposedStartDate;
- (BOOL)attendeeReplyChanged;
- (BOOL)attendeeStatus;
- (BOOL)automaticLocationGeocodingAllowed;
- (BOOL)canDetachSingleOccurrence;
- (BOOL)canForward;
- (BOOL)canMoveOrCopyToCalendar:(id)a3 fromCalendar:(id)a4 error:(id *)a5;
- (BOOL)canMoveToCalendar:(id)a3 fromCalendar:(id)a4 allowedRequirements:(int64_t)a5 error:(id *)a6;
- (BOOL)canMoveToCalendar:(id)a3 fromCalendar:(id)a4 error:(id *)a5;
- (BOOL)canWeInferUpdateToComplexRecurrenceRule;
- (BOOL)changingAllDayPropertyIsAllowed;
- (BOOL)completed;
- (BOOL)conferenceURLForDisplayCached;
- (BOOL)conformsToRecurrenceRules:(id)a3;
- (BOOL)currentUserMayActAsOrganizer;
- (BOOL)dateChanged;
- (BOOL)disallowProposeNewTime;
- (BOOL)durationOverlapsRecurrenceInterval;
- (BOOL)eligibleForTravelAdvisories;
- (BOOL)firedTTL;
- (BOOL)flag:(unint64_t)a3;
- (BOOL)futureOccurrencesCannotBeAffectedByChangingStartDateToDate:(id)a3;
- (BOOL)hasADateChangeAndComplexRecurrenceWeDontKnowHowToUpdate;
- (BOOL)hasAttachmentChanges;
- (BOOL)hasAttendeeProposedTimes;
- (BOOL)hasChangesRequiringSpanAll;
- (BOOL)hasCustomRecurrence;
- (BOOL)hasPredictedLocation;
- (BOOL)hasValidEventAction;
- (BOOL)isAlerted;
- (BOOL)isAllDay;
- (BOOL)isAllDayDirty;
- (BOOL)isAttendeeSameAsOrganizer:(id)a3;
- (BOOL)isBirthday;
- (BOOL)isCurrentUserInvitedAttendee;
- (BOOL)isDetached;
- (BOOL)isDifferentAndHasForwardedAttendeesWithDiff:(id)a3;
- (BOOL)isDifferentAndHasNewProposedTimeWithDiff:(id)a3;
- (BOOL)isDifferentAndHasUnscheduledAttendeesWithDiff:(id)a3;
- (BOOL)isDifferentAndModifiedAttendeesWithDiff:(id)a3;
- (BOOL)isDifferentAndRequiresRSVPWithDiff:(id)a3;
- (BOOL)isDifferentAndRequiresRescheduleWithDiff:(id)a3;
- (BOOL)isDifferentExceptingPerUserPropertiesWithDiff:(id)a3;
- (BOOL)isDifferentFromCommittedEventAndHasUnscheduledAttendees;
- (BOOL)isDifferentFromCommittedEventAndRequiresRSVP;
- (BOOL)isDifferentFromCommittedEventAndRequiresReschedule;
- (BOOL)isDifferentWithDiff:(id)a3;
- (BOOL)isEditable;
- (BOOL)isEndDateDirty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqual:(id)a3 comparingKeys:(id)a4;
- (BOOL)isFirstOccurrence;
- (BOOL)isFirstOccurrenceIncludingSlices;
- (BOOL)isFloating;
- (BOOL)isIntegrationEvent;
- (BOOL)isMainOccurrence;
- (BOOL)isMasterOrDetachedOccurrence;
- (BOOL)isMultiDayTimedEventInCalendar:(id)a3;
- (BOOL)isOrWasIntegrationEvent;
- (BOOL)isOrWasPartOfRecurringSeries;
- (BOOL)isOriginalItemPhantom;
- (BOOL)isOutOfOrderWithEventInSeries;
- (BOOL)isPhantom;
- (BOOL)isPrivacySet;
- (BOOL)isPrivateEventSharedToMe;
- (BOOL)isProposedTimeEvent;
- (BOOL)isReminderIntegrationEvent;
- (BOOL)isSignificantlyDetached;
- (BOOL)isSignificantlyDetachedIgnoringParticipation;
- (BOOL)isStartDateDirty;
- (BOOL)isStatusDirty;
- (BOOL)isTentative;
- (BOOL)isUndetached;
- (BOOL)isValidAttendee:(id)a3 forCalendar:(id)a4;
- (BOOL)locationChanged;
- (BOOL)locationIsAConferenceRoom;
- (BOOL)needsGeocoding;
- (BOOL)occurrenceIsAllDay;
- (BOOL)overlapsWithOrIsSameDayAsEventInSeries;
- (BOOL)potentiallyEligibleForTravelAdvisories;
- (BOOL)preventConferenceURLDetection;
- (BOOL)recurrenceChanged;
- (BOOL)refresh;
- (BOOL)refreshAndNotify:(BOOL)a3;
- (BOOL)refreshIfRefreshableAndNotify:(BOOL)a3;
- (BOOL)removeWithSpan:(int64_t)a3 error:(id *)a4;
- (BOOL)requiresCopyToMoveFromCalendar:(id)a3 toCalendar:(id)a4;
- (BOOL)requiresDetach;
- (BOOL)requiresDetachDueToSnoozedAlarm;
- (BOOL)responseMustApplyToAll;
- (BOOL)revert;
- (BOOL)saveWithSpan:(int64_t)a3 error:(id *)a4;
- (BOOL)seriesHasOutOfOrderEvents;
- (BOOL)seriesHasOverlappingOrOnSameDayOrOutOfOrderEvents;
- (BOOL)serverSupportedProposeNewTime;
- (BOOL)shouldHaveDefaultAlarms;
- (BOOL)supportsAddingAttachments;
- (BOOL)supportsJunkReporting;
- (BOOL)supportsParticipationStatusModificationsWithoutNotification;
- (BOOL)timeChanged;
- (BOOL)titleChanged;
- (BOOL)travelAdvisoryBehaviorIsEffectivelyEnabled;
- (BOOL)updateEventToEvent:(id)a3;
- (BOOL)updateEventToEvent:(id)a3 commit:(BOOL)a4;
- (BOOL)updateWithGeocodedMapItemAndSaveWithCommit:(id)a3 eventStore:(id)a4 error:(id *)a5;
- (BOOL)validate:(id *)a3;
- (BOOL)validateOccurrenceDateStillMatchesRecurrenceRules;
- (BOOL)validateRecurrenceRule:(id)a3 error:(id *)a4;
- (BOOL)validateWithSpan:(int64_t)a3 error:(id *)a4;
- (BOOL)videoConferenceChanged;
- (EKCalendarDate)occurrenceEndDate;
- (EKCalendarDate)occurrenceStartDate;
- (EKCalendarDate)originalOccurrenceEndDate;
- (EKCalendarDate)originalOccurrenceStartDate;
- (EKCalendarDate)startCalendarDate;
- (EKCalendarDate)startCalendarDateIncludingTravelTime;
- (EKColor)color;
- (EKEvent)init;
- (EKEvent)initWithEventStore:(id)a3;
- (EKEvent)initWithPersistentObject:(id)a3;
- (EKEvent)initWithPersistentObject:(id)a3 objectForCopy:(id)a4;
- (EKEvent)initWithPersistentObject:(id)a3 occurrenceDate:(id)a4;
- (EKEventAvailability)availability;
- (EKEventStatus)status;
- (EKImage)image;
- (EKRecurrenceIdentifier)recurrenceIdentifier;
- (EKStructuredLocation)endLocation;
- (EKStructuredLocation)preferredLocationWithoutPrediction;
- (EKStructuredLocation)structuredLocation;
- (EKSuggestedEventInfo)suggestionInfo;
- (EKVirtualConference)virtualConference;
- (NSArray)locations;
- (NSArray)locationsWithoutPrediction;
- (NSComparisonResult)compareStartDateWithEvent:(EKEvent *)other;
- (NSDate)endDateUnadjustedForLegacyClients;
- (NSDate)initialEndDate;
- (NSDate)initialStartDate;
- (NSDate)occurrenceDate;
- (NSDate)originalStartDate;
- (NSDate)participationStatusModifiedDate;
- (NSDate)proposedEndDate;
- (NSDate)proposedStartDate;
- (NSDate)recurrenceDate;
- (NSDate)startDate;
- (NSDate)startDateIncludingTravel;
- (NSDateComponents)startDateComponents;
- (NSInteger)birthdayPersonID;
- (NSNumber)originalOccurrenceIsAllDay;
- (NSSet)actions;
- (NSString)birthdayContactIdentifier;
- (NSString)birthdayContactName;
- (NSString)birthdayPersonUniqueID;
- (NSString)description;
- (NSString)eventIdentifier;
- (NSString)eventOccurrenceID;
- (NSString)locationWithoutPrediction;
- (NSString)recurrenceSet;
- (NSString)sendersEmail;
- (NSString)sendersPhoneNumber;
- (NSString)showEventURLString;
- (NSString)virtualConferenceTextRepresentation;
- (NSURL)conferenceURL;
- (NSURL)externalURL;
- (NSURL)launchURL;
- (double)duration;
- (double)durationIncludingTravel;
- (double)travelTime;
- (id)URL;
- (id)_adjustDateIfFloatingForDate:(id)a3;
- (id)_buildConferenceStringFromNotesWithoutConference:(id)a3 serializedConference:(id)a4;
- (id)_calculateDurationWithStart:(id)a3 end:(id)a4 allDay:(BOOL)a5;
- (id)_committedEndDate;
- (id)_committedStartDate;
- (id)_conferenceRoomDisplayStrings;
- (id)_defaultAlarmOffset;
- (id)_detectConferenceURL;
- (id)_ekRecurrenceRuleFromICSRecurrenceRule:(id)a3;
- (id)_ekRecurrenceRuleFromVCSRecurrenceRule:(id)a3;
- (id)_eventKitPropertyKeyForCalendarItemErrorPropertyKey:(id)a3;
- (id)_firstNonConferenceRoomLocationTitle;
- (id)_generateNewUniqueID;
- (id)_keysToChangeForDuplicateWithOptions:(int64_t)a3;
- (id)_lastRecurrenceDate;
- (id)_leftoversInDates:(id)a3 withGeneratedDates:(id)a4;
- (id)_nextReminderOccurrenceDate;
- (id)_nsCalendar;
- (id)_occurrenceDatesForCount:(unint64_t)a3;
- (id)_originallyCommittedVirtualConference;
- (id)_pinDate:(id)a3 withPinMode:(unint64_t)a4;
- (id)_prioritizedConferencesSources;
- (id)_travelTimeInternalDescription;
- (id)_updateMasterDate:(id)a3 forChangeToOccurrenceDate:(id)a4 fromOriginalOccurrenceDate:(id)a5;
- (id)_updatePredictedLocationCacheIfNeeded;
- (id)_updatePredictedLocationCacheIfNeededHoldingLock;
- (id)adjustedPersistedDateForDate:(id)a3 withAdjustmentMode:(unint64_t)a4 pinMode:(unint64_t)a5 clientCalendarDate:(id *)a6;
- (id)attendeesNotIncludingOrganizer;
- (id)attendeesNotIncludingOrganizerOrLocationsOrResources;
- (id)birthdayID;
- (id)coCommitEvents;
- (id)committedConstraints;
- (id)committedCopy;
- (id)committedValueForKey:(id)a3;
- (id)conferenceURLDetected;
- (id)conferenceURLDetectedString;
- (id)conferenceURLForDisplay;
- (id)conferenceURLString;
- (id)constraints;
- (id)copyToCalendar:(id)a3 withOptions:(int64_t)a4;
- (id)defaultAlarm;
- (id)defaultAlarms;
- (id)diffFromCommitted;
- (id)displayNotes;
- (id)duplicateWithOptions:(int64_t)a3;
- (id)earliestOccurrenceEndingAfter:(id)a3;
- (id)earliestOccurrenceEndingAfter:(id)a3 excludeSignificantDetachments:(BOOL)a4 excludeCanceledDetachments:(BOOL)a5 excludeDeclinedDetachments:(BOOL)a6;
- (id)effectiveTimeZone;
- (id)endDateRaw;
- (id)masterEvent;
- (id)nextOccurrence;
- (id)nextOccurrenceOrDetachmentAfter:(id)a3;
- (id)potentialConflictOccurrenceDatesInTimePeriod:(double *)a3;
- (id)previousOccurrence;
- (id)previousOccurrenceOrDetachmentBefore:(id)a3;
- (id)previouslySavedCopy;
- (id)privacyDescription;
- (id)privacyLevelString;
- (id)privacySafeIntegrationEventDescription;
- (id)propertiesThatCanBeModifiedOnReadOnlyCalendars;
- (id)recurrenceRule;
- (id)responseComment;
- (id)roomAttendees;
- (id)scanForConflicts;
- (id)singleRecurrenceRule;
- (id)snapshotCopyWithPropertyKeysToCopy:(id)a3 propertyKeysToSkip:(id)a4;
- (id)specialDayString;
- (id)startDateRaw;
- (id)startOfDayForEndDateInCalendar:(id)a3;
- (id)startOfDayForStartDateInCalendar:(id)a3;
- (id)suggestedStartDateForCurrentRecurrenceRule;
- (id)suggestedStartDateForCurrentRecurrenceRuleWithSimulatedNowDate:(id)a3;
- (id)title;
- (int)clearModifiedFlags;
- (int)externalTrackingStatus;
- (int64_t)_parentParticipationStatus;
- (int64_t)compareOriginalStartDateWithEvent:(id)a3;
- (int64_t)compareStartDateIncludingTravelWithEvent:(id)a3;
- (int64_t)currentUserGeneralizedParticipantRole;
- (int64_t)daysSpannedInCalendar:(id)a3;
- (int64_t)locationPredictionState;
- (int64_t)participationStatus;
- (int64_t)pendingParticipationStatus;
- (int64_t)privacyLevel;
- (int64_t)requirementsToMoveFromCalendar:(id)a3 toCalendar:(id)a4;
- (int64_t)requirementsToMoveToCalendar:(id)a3;
- (int64_t)selfParticipantStatus;
- (int64_t)specialDayType;
- (int64_t)travelAdvisoryBehavior;
- (int64_t)travelRoutingMode;
- (unint64_t)_integrationType;
- (unint64_t)cachedJunkStatus;
- (unint64_t)countOfAttendeeProposedTimes;
- (unint64_t)entityType;
- (unint64_t)flags;
- (unint64_t)hash;
- (unint64_t)invitationStatus;
- (unint64_t)junkStatus;
- (unint64_t)reminderOccurrenceType;
- (unsigned)invitationChangedProperties;
- (void)_addNewAttendeesToRecentsIfNeeded;
- (void)_addOrganizerToRecentsIfNeeded;
- (void)_adjustAfterMovingOrCopyingFromOldCalendar:(id)a3 toNewCalendar:(id)a4 cachedConstraintsForOldCalendar:(id)a5 savingItem:(id)a6;
- (void)_adjustAttachmentsAfterMovingOrCopyingFromCalendar:(id)a3 toCalendar:(id)a4 cachedConstraintsForOldCalendar:(id)a5 savingItem:(id)a6;
- (void)_adjustAttendeesAfterMovingOrCopyingFromCalendar:(id)a3 toCalendar:(id)a4;
- (void)_adjustAvailabilityAfterMovingOrCopyingFromCalendar:(id)a3 toCalendar:(id)a4;
- (void)_adjustExternalFieldsAfterMovingOrCopyingFromCalendar:(id)a3 toCalendar:(id)a4 cachedConstraintsForOldCalendar:(id)a5;
- (void)_adjustPrivacyAfterMovingOrCopyingFromCalendar:(id)a3 toCalendar:(id)a4 cachedConstraintsForOldCalendar:(id)a5 savingItem:(id)a6;
- (void)_adjustRecurrenceRulesAfterMovingOrCopyingFromCalendar:(id)a3 toCalendar:(id)a4 notes:(id)a5;
- (void)_adjustTimeZoneAfterMovingOrCopyingToCalendar:(id)a3 notes:(id)a4;
- (void)_adjustURLAfterMovingOrCopyingToCalendar:(id)a3 notes:(id)a4;
- (void)_applyTimeChangesToMaster;
- (void)_assignAllAttachmentsNewIdentities;
- (void)_cancelDetachedEvents;
- (void)_clearAttendeeChangedFlags;
- (void)_clearExceptionDatesAndUpdateDetachedOriginalDates:(id)a3;
- (void)_clearLocationPredictionCacheIfNotFrozen;
- (void)_clearLocationPredictionCacheIfNotFrozenHoldingLock;
- (void)_clearOriginalDateFields;
- (void)_deleteErrorIfInvalid;
- (void)_deleteFromOccurrenceDateOnward:(id)a3 includeSlices:(BOOL)a4;
- (void)_deleteThisOccurrence;
- (void)_deleteWithSpan:(int64_t)a3;
- (void)_detachOrSliceWithSpan:(int64_t)a3 withOriginalStartDate:(id)a4 newStartDate:(id)a5;
- (void)_duplicateAddedAttachmentsToDetachedEvents:(id)a3;
- (void)_extendConferenceURLExpirationDateToDate:(id)a3;
- (void)_filterExceptionDatesAndDetachments;
- (void)_hasRecurrenceRuleChangeRequiringSpanAll;
- (void)_invalidateRecurrenceIdentifier;
- (void)_propagateChangesToDetachedEvents:(id)a3 originalItemBeforeSave:(id)a4 startDateOffset:(id)a5 duration:(id)a6 calendar:(id)a7;
- (void)_propagateChangesToSlice:(id)a3 originalItemBeforeSave:(id)a4 startDateOffset:(id)a5 duration:(id)a6 calendar:(id)a7 updateRecurrenceEnd:(BOOL)a8;
- (void)_recursivelyAssignAllAttachmentsNewIdentities;
- (void)_removeInvalidAlarmsDuringSave;
- (void)_resetInternalStateWithForce:(BOOL)a3;
- (void)_respondToProposedTimeFromAttendee:(id)a3 shouldAccept:(BOOL)a4;
- (void)_saveUndeletedDetachedOccurrence;
- (void)_setEndDateUnadjustedForLegacyClients:(id)a3 allowSettingIfNotEditable:(BOOL)a4;
- (void)_setInvitationChangedProperty:(BOOL)a3 forFlag:(unsigned int)a4;
- (void)_setInvitationStatusAlertedIfNecessary;
- (void)_setInvitationStatusUnalertedIfNecessary;
- (void)_setNextCachedReminderOccurrenceDate:(id)a3;
- (void)_setStartDate:(id)a3 andClearProposedTimes:(BOOL)a4 allowSettingIfNotEditable:(BOOL)a5;
- (void)_snoozeAlarm:(id)a3 withTimeIntervalFromNow:(double)a4 orTargetDate:(id)a5 pinsTriggerToStartDate:(BOOL)a6;
- (void)_updateEndDateForDate:(id)a3 withAdjustmentMode:(unint64_t)a4;
- (void)_updateEndDateForDate:(id)a3 withAdjustmentMode:(unint64_t)a4 adjustStartDate:(BOOL)a5;
- (void)_updateModifiedProperties;
- (void)_updateModifiedPropertiesForThisEventAndAllDetachments;
- (void)_updatePredictedLocationCacheIfNeededHoldingLock;
- (void)_updateRecurrenceEndDateForEvent:(id)a3 calendar:(id)a4 withOffset:(id)a5;
- (void)_updateRecurrenceEndDatesWithAdjustmentMode:(unint64_t)a3;
- (void)_updateSelfAttendeeToMatchSelfAttendee:(id)a3;
- (void)_updateSelfFromDetachedEventIfNeededForDelete;
- (void)_updateStartDateForDate:(id)a3 withAdjustmentMode:(unint64_t)a4;
- (void)_updateStartDateForDate:(id)a3 withAdjustmentMode:(unint64_t)a4 adjustEndDate:(BOOL)a5;
- (void)_updateUUIDForNewParticipants;
- (void)_updateVideoConferenceOnlyModified;
- (void)_willSave;
- (void)acceptProposedTimeNotificationFromAttendee:(id)a3;
- (void)addConferenceRooms:(id)a3;
- (void)addEventAction:(id)a3;
- (void)adjustedDatesForDate:(id)a3 persistedDateIsInUTC:(BOOL)a4 withAdjustmentMode:(unint64_t)a5 pinMode:(unint64_t)a6 outClientCalendarDate:(id *)a7 outPersistedDate:(id *)a8;
- (void)applyChangesFromEvent:(id)a3 toEvent:(id)a4 ignoringDifferencesFrom:(id)a5;
- (void)clearCachedTimeValues;
- (void)clearDetectedConferenceURL;
- (void)clearIntegrationType;
- (void)clearInvitationStatus;
- (void)clearNextCachedReminderOccurrenceDate;
- (void)clearParsedConference;
- (void)clearVirtualConferenceURLsQueuedForInvalidation;
- (void)confirmPredictedLocation:(id)a3;
- (void)declineProposedTimeNotificationFromAttendee:(id)a3;
- (void)dismissAcceptedProposeNewTimeNotification;
- (void)dismissAttendeeRepliedNotification;
- (void)forceSetTimeZone:(id)a3;
- (void)invalidateRemovedVirtualConferences;
- (void)invalidateVirtualConferenceURLIfNeededOnCommit:(id)a3;
- (void)makeRecurrenceEndCountBased;
- (void)makeRecurrenceEndDateBased;
- (void)markAsCommitted;
- (void)markAsSaved;
- (void)markAsUndeleted;
- (void)markAsUndetachedWithStartDate:(id)a3 endDate:(id)a4;
- (void)markEventAsAttendeeForward;
- (void)overrideEndDate:(id)a3;
- (void)overrideStartDate:(id)a3;
- (void)parsedConference:(id *)a3 andNotes:(id *)a4;
- (void)postModifiedNotification;
- (void)postModifiedNotificationWithUserInfo:(id)a3;
- (void)prefetchAttendeesWithAdditionalProperties:(id)a3;
- (void)rebaseSkippingRelationProperties:(id)a3;
- (void)rebaseSkippingRelationProperties:(id)a3 toEventStore:(id)a4;
- (void)rebaseToEventStore:(id)a3;
- (void)rejectPredictedLocation;
- (void)removeConferenceRooms:(id)a3;
- (void)removeEventAction:(id)a3;
- (void)removeServerRefreshRelatedProperties;
- (void)reset;
- (void)rollback;
- (void)setActions:(id)a3;
- (void)setAllDay:(BOOL)allDay;
- (void)setAttendeeComment:(BOOL)a3;
- (void)setAttendeeDeclinedStartDate:(BOOL)a3;
- (void)setAttendeeProposedStartDate:(BOOL)a3;
- (void)setAttendeeStatus:(BOOL)a3;
- (void)setAvailability:(EKEventAvailability)availability;
- (void)setBirthdayContact:(id)a3;
- (void)setBirthdayContactIdentifier:(id)a3;
- (void)setCachedJunkStatus:(unint64_t)a3;
- (void)setCalendar:(id)a3;
- (void)setClearModifiedFlags:(int)a3;
- (void)setColor:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setConferenceURL:(id)a3;
- (void)setConferenceURLString:(id)a3;
- (void)setDateChanged:(BOOL)a3;
- (void)setDisplayNotes:(id)a3;
- (void)setEndDateRaw:(id)a3;
- (void)setEndDateUnadjustedForLegacyClients:(id)a3;
- (void)setEndLocation:(id)a3;
- (void)setExternalTrackingStatus:(int)a3;
- (void)setFiredTTL:(BOOL)a3;
- (void)setFlag:(unint64_t)a3 value:(BOOL)a4;
- (void)setFlags:(unint64_t)a3;
- (void)setImage:(id)a3;
- (void)setInvitationChangedProperties:(unsigned int)a3;
- (void)setInvitationStatus:(unint64_t)a3;
- (void)setIsAlerted:(BOOL)a3;
- (void)setIsJunk:(BOOL)a3 shouldSave:(BOOL)a4;
- (void)setIsOriginalItemPhantom:(BOOL)a3;
- (void)setIsPhantom:(BOOL)a3;
- (void)setJunkStatus:(unint64_t)a3;
- (void)setLocationChanged:(BOOL)a3;
- (void)setLocationPredictionAllowed:(BOOL)a3;
- (void)setLocationPredictionState:(int64_t)a3;
- (void)setLocations:(id)a3;
- (void)setNeedsGeocoding:(BOOL)a3;
- (void)setNotes:(id)a3;
- (void)setNotesCommon:(id)a3;
- (void)setOccurrenceEndDate:(id)a3;
- (void)setOccurrenceIsAllDay:(BOOL)a3;
- (void)setOccurrenceStartDate:(id)a3;
- (void)setOriginalOccurrenceEndDate:(id)a3;
- (void)setOriginalOccurrenceIsAllDay:(id)a3;
- (void)setOriginalOccurrenceStartDate:(id)a3;
- (void)setOriginalStartDate:(id)a3;
- (void)setParticipationStatus:(int64_t)a3;
- (void)setParticipationStatusModifiedDate:(id)a3;
- (void)setPredictedLocationFrozen:(BOOL)a3;
- (void)setPreventConferenceURLDetection:(BOOL)a3;
- (void)setPrivacyLevel:(int64_t)a3;
- (void)setPrivacyLevelWithoutVerifyingPrivacyModificationsAllowed:(int64_t)a3;
- (void)setProposedStartDate:(id)a3;
- (void)setRecurrenceChanged:(BOOL)a3;
- (void)setRecurrenceRule:(id)a3;
- (void)setRecurrenceRuleFromICSString:(id)a3;
- (void)setRecurrenceRules:(id)a3;
- (void)setRecurrenceSet:(id)a3;
- (void)setRequiresDetachDueToSnoozedAlarm:(BOOL)a3;
- (void)setResponseComment:(id)a3;
- (void)setSpecialDayString:(id)a3;
- (void)setSpecialDayType:(int64_t)a3;
- (void)setStartDate:(NSDate *)startDate;
- (void)setStartDateComponentsPreservingDuration:(id)a3;
- (void)setStartDateRaw:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setStructuredLocation:(EKStructuredLocation *)structuredLocation;
- (void)setStructuredLocation:(id)a3 preserveConferenceRooms:(BOOL)a4;
- (void)setSuggestionInfo:(id)a3;
- (void)setTimeChanged:(BOOL)a3;
- (void)setTimeZone:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleChanged:(BOOL)a3;
- (void)setTravelAdvisoryBehavior:(int64_t)a3;
- (void)setTravelTime:(double)a3;
- (void)setURL:(id)a3;
- (void)setVideoConferenceChanged:(BOOL)a3;
- (void)setVirtualConference:(id)a3;
- (void)setVirtualConferenceTextRepresentation:(id)a3;
- (void)snoozeAlarm:(id)a3 untilTargetDate:(id)a4;
- (void)snoozeAlarm:(id)a3 untilTargetDate:(id)a4 pinsTriggerToStartDate:(BOOL)a5;
- (void)snoozeAlarm:(id)a3 withTimeIntervalFromNow:(double)a4;
- (void)snoozeAlarm:(id)a3 withTimeIntervalFromNow:(double)a4 pinsTriggerToStartDate:(BOOL)a5;
- (void)updateDefaultAlarms;
- (void)updateWithVCSEntity:(id)a3 inCalendar:(id)a4;
@end

@implementation EKEvent

- (BOOL)isEqual:(id)a3
{
  v4 = (EKEvent *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = [(EKObject *)v4 objectID];
      v8 = [(EKObject *)self objectID];
      if ([v7 isEqual:v8])
      {
        v9 = [(EKEvent *)v4 originalOccurrenceStartDate];
        v10 = [(EKEvent *)self originalOccurrenceStartDate];
        if (v9 == v10)
        {
          char v6 = 1;
        }
        else
        {
          v11 = [(EKEvent *)v4 originalOccurrenceStartDate];
          v12 = [(EKEvent *)self originalOccurrenceStartDate];
          char v6 = [v11 isEqual:v12];
        }
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (EKEvent)initWithPersistentObject:(id)a3 occurrenceDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Can't create EKEvent without persistent event"];
  }
  v26.receiver = self;
  v26.super_class = (Class)EKEvent;
  v8 = [(EKObject *)&v26 initWithPersistentObject:v6];
  v9 = v8;
  if (v8)
  {
    v8->_locationPredictionLock._os_unfair_lock_opaque = 0;
    v8->_locationPredictionAllowed = 1;
    [(EKEvent *)v8 setOccurrenceIsAllDay:[(EKEvent *)v8 _isAllDay]];
    v10 = [(EKEvent *)v9 startDateRaw];
    id v25 = 0;
    id v11 = [(EKEvent *)v9 adjustedPersistedDateForDate:v10 withAdjustmentMode:1 pinMode:0 clientCalendarDate:&v25];
    id v12 = v25;

    v13 = [(EKEvent *)v9 endDateRaw];
    id v24 = 0;
    id v14 = [(EKEvent *)v9 adjustedPersistedDateForDate:v13 withAdjustmentMode:1 pinMode:1 clientCalendarDate:&v24];
    id v15 = v24;

    if (v7)
    {
      v16 = (void *)MEMORY[0x1E4F57838];
      v17 = [(EKEvent *)v9 effectiveTimeZone];
      v18 = [v16 calendarDateWithDate:v7 timeZone:v17];

      [(EKEvent *)v9 setOccurrenceStartDate:v18];
      v19 = [(EKEvent *)v9 _calculateDurationWithStart:v12 end:v15 allDay:[(EKEvent *)v9 occurrenceIsAllDay]];

      if (v19)
      {
        v20 = [v18 calendarDateByComponentwiseAddingComponents:v19];
        [(EKEvent *)v9 setOccurrenceEndDate:v20];
      }
      else
      {
        [(EKEvent *)v9 setOccurrenceEndDate:v18];
      }
    }
    else
    {
      [(EKEvent *)v9 setOccurrenceStartDate:v12];
      [(EKEvent *)v9 setOccurrenceEndDate:v15];
      v18 = v15;
    }

    BOOL v21 = ![(EKEvent *)v9 isDetached] && [(EKEvent *)v9 isFirstOccurrence];
    v9->_isMainOccurrence = v21;
    [(EKEvent *)v9 _invalidateRecurrenceIdentifier];
    if ([v6 isNew]
      && [(EKEvent *)v9 isReminderIntegrationEvent]
      && ![(EKEvent *)v9 isDetached])
    {
      v22 = [v6 eventStore];
      [v22 addPendingIntegrationEvent:v9];
    }
  }

  return v9;
}

- (id)adjustedPersistedDateForDate:(id)a3 withAdjustmentMode:(unint64_t)a4 pinMode:(unint64_t)a5 clientCalendarDate:(id *)a6
{
  id v10 = a3;
  BOOL v11 = [(EKEvent *)self isFloating] || [(EKEvent *)self isAllDay];
  id v14 = 0;
  [(EKEvent *)self adjustedDatesForDate:v10 persistedDateIsInUTC:v11 withAdjustmentMode:a4 pinMode:a5 outClientCalendarDate:a6 outPersistedDate:&v14];
  id v12 = v14;

  return v12;
}

- (BOOL)isAllDay
{
  return self->_occurrenceIsAllDay;
}

- (BOOL)isFloating
{
  v2 = [(EKCalendarItem *)self timeZone];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)effectiveTimeZone
{
  BOOL v3 = [(EKCalendarItem *)self timeZone];
  if (!v3)
  {
    v4 = [(EKObject *)self eventStore];
    BOOL v3 = [v4 timeZone];
  }

  return v3;
}

- (void)adjustedDatesForDate:(id)a3 persistedDateIsInUTC:(BOOL)a4 withAdjustmentMode:(unint64_t)a5 pinMode:(unint64_t)a6 outClientCalendarDate:(id *)a7 outPersistedDate:(id *)a8
{
  BOOL v12 = a4;
  id v20 = a3;
  id v14 = [(EKEvent *)self effectiveTimeZone];
  if (a5 == 1)
  {
    if (v12)
    {
      id v18 = [v20 dateInTimeZone:v14 fromTimeZone:0];
    }
    else
    {
      id v18 = v20;
    }
    v16 = v18;
    id v17 = v20;
LABEL_12:
    v19 = v17;
    if (!a7) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (!a5)
  {
    id v15 = [(EKEvent *)self _pinDate:v20 withPinMode:a6];
    v16 = v15;
    if (v12)
    {
      id v17 = [v15 dateInTimeZone:0 fromTimeZone:v14];
    }
    else
    {
      id v17 = v15;
      v16 = v17;
    }
    goto LABEL_12;
  }
  v16 = 0;
  v19 = 0;
  if (a7)
  {
LABEL_13:
    *a7 = [MEMORY[0x1E4F57838] calendarDateWithDate:v16 timeZone:v14];
  }
LABEL_14:
  if (a8) {
    *a8 = v19;
  }
}

- (unint64_t)_integrationType
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__EKEvent__integrationType__block_invoke;
  v5[3] = &unk_1E5B96908;
  v5[4] = self;
  v2 = [(EKObject *)self cachedValueForKey:@"eKEventIntegrationTypeKey" populateBlock:v5];
  unint64_t v3 = [v2 integerValue];

  return v3;
}

- (id)title
{
  v15.receiver = self;
  v15.super_class = (Class)EKEvent;
  unint64_t v3 = [(EKCalendarItem *)&v15 title];
  uint64_t v4 = [(__CFString *)v3 length];
  int64_t v5 = [(EKEvent *)self privacyLevel];
  if (![(EKObject *)self isNew] && (!v4 ? (BOOL v6 = (v5 & 0xFFFFFFFFFFFFFFFELL) == 2) : (BOOL v6 = 0), v6))
  {
    id v7 = EKBundle();
    uint64_t v8 = [v7 localizedStringForKey:@"Private Event" value:&stru_1EF932508 table:0];

    unint64_t v3 = (__CFString *)v8;
  }
  else
  {
    v9 = [(EKEvent *)self birthdayContactIdentifier];

    if (v9)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __16__EKEvent_title__block_invoke;
      v14[3] = &unk_1E5B96908;
      v14[4] = self;
      id v10 = [(EKObject *)self cachedValueForKey:@"birthdayTitle" populateBlock:v14];
      goto LABEL_13;
    }
  }
  BOOL v11 = &stru_1EF932508;
  if (v3) {
    BOOL v11 = v3;
  }
  id v10 = v11;
  unint64_t v3 = v10;
LABEL_13:
  BOOL v12 = v10;

  return v12;
}

- (NSString)birthdayContactIdentifier
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56F60]];
}

- (int64_t)privacyLevel
{
  v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57000]];
  unint64_t v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)startDateRaw
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56D00]];
}

- (void)setOccurrenceStartDate:(id)a3
{
}

- (void)setOccurrenceIsAllDay:(BOOL)a3
{
  BOOL v3 = a3;
  self->_occurrenceIsAllDay = a3;
  if ([(EKObject *)self isNew])
  {
    id v5 = [NSNumber numberWithBool:v3];
    [(EKEvent *)self setOriginalOccurrenceIsAllDay:v5];
  }
}

- (void)setOccurrenceEndDate:(id)a3
{
}

- (BOOL)occurrenceIsAllDay
{
  return self->_occurrenceIsAllDay;
}

- (BOOL)isFirstOccurrence
{
  if ([(EKObject *)self isNew]) {
    return 1;
  }
  int64_t v4 = [(EKCalendarItem *)self originalItem];
  if ([(EKCalendarItem *)self hasRecurrenceRules]
    || ([(EKCalendarItem *)self originalItem],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    if (v4)
    {
      BOOL v6 = [(EKEvent *)self originalStartDate];
      id v7 = [v4 _committedStartDate];
      char v3 = [v6 isEqualToDate:v7];
    }
    else
    {
      char v3 = [(EKEvent *)self _isOriginalOccurrenceStartDateSameAsCommittedStartDate];
    }
  }
  else
  {
    char v3 = 1;
  }

  return v3;
}

- (BOOL)isDetached
{
  v2 = [(EKObject *)self frozenOrMeltedCachedSingleRelationObjectForKey:*MEMORY[0x1E4F56C68]];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)endDateRaw
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56FB0]];
}

- (void)_invalidateRecurrenceIdentifier
{
}

- (id)_committedStartDate
{
  uint64_t v2 = *MEMORY[0x1E4F56D00];
  v5.receiver = self;
  v5.super_class = (Class)EKEvent;
  BOOL v3 = [(EKObject *)&v5 committedValueForKey:v2];

  return v3;
}

- (BOOL)_isOriginalOccurrenceStartDateSameAsCommittedStartDate
{
  BOOL v3 = [(EKEvent *)self originalOccurrenceStartDate];
  int64_t v4 = [(EKEvent *)self _committedStartDate];
  [v4 timeIntervalSinceReferenceDate];
  double v6 = v5;

  [v3 absoluteTime];
  double v8 = v7;
  v9 = [(EKObject *)self _previousValueForKey:*MEMORY[0x1E4F56D08]];
  id v10 = v9;
  if (!v9 || [v9 isEqualToString:@"_float"])
  {
    BOOL v11 = (const void *)CalTimeZoneCopyCFTimeZone();
    [(EKEvent *)self effectiveTimeZone];
    CalAbsoluteTimeGetAbsoluteTimeInTimeZone();
    double v8 = v12;
    CFRelease(v11);
  }

  return vabdd_f64(v8, v6) < 2.22044605e-16;
}

- (BOOL)isProposedTimeEvent
{
  BOOL v3 = [(EKEvent *)self proposedStartDate];
  if (v3)
  {
    int64_t v4 = [(EKEvent *)self proposedStartDate];
    double v5 = [(EKEvent *)self startDate];
    char v6 = [v4 isEqualToDate:v5];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (NSDate)proposedStartDate
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57008]];
  [v2 timeIntervalSinceReferenceDate];
  if (fabs(v3) >= 2.22044605e-16) {
    id v4 = v2;
  }
  else {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (EKCalendarDate)originalOccurrenceStartDate
{
  originalOccurrenceStartDate = self->_originalOccurrenceStartDate;
  if (!originalOccurrenceStartDate) {
    originalOccurrenceStartDate = self->_occurrenceStartDate;
  }
  double v3 = originalOccurrenceStartDate;

  return v3;
}

+ (id)knownRelationshipSingleValueKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__EKEvent_knownRelationshipSingleValueKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (knownRelationshipSingleValueKeys_onceToken_2 != -1) {
    dispatch_once(&knownRelationshipSingleValueKeys_onceToken_2, block);
  }
  uint64_t v2 = (void *)knownRelationshipSingleValueKeys_keys_2;

  return v2;
}

+ (id)knownRelationshipMultiValueKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__EKEvent_knownRelationshipMultiValueKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (knownRelationshipMultiValueKeys_onceToken_2 != -1) {
    dispatch_once(&knownRelationshipMultiValueKeys_onceToken_2, block);
  }
  uint64_t v2 = (void *)knownRelationshipMultiValueKeys_keys_2;

  return v2;
}

- (id)_calculateDurationWithStart:(id)a3 end:(id)a4 allDay:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (a5)
  {
    id v10 = [v8 differenceAsDateComponents:v7 units:242];
    if ([v10 hour] <= 11) {
      objc_msgSend(v10, "setDay:", objc_msgSend(v10, "day") - 1);
    }
    [v10 setHour:23];
    [v10 setMinute:59];
    [v10 setSecond:59];
  }
  else
  {
    BOOL v11 = [v7 timeZone];
    double v12 = [v7 date];
    v13 = [v9 date];
    uint64_t v14 = [v11 secondsFromGMTForDate:v12];
    uint64_t v15 = [v11 secondsFromGMTForDate:v13];
    BOOL v16 = v14 <= v15;
    uint64_t v17 = v14 - v15;
    if (v16)
    {

      id v10 = [v9 differenceAsDateComponents:v7 units:242];
    }
    else
    {
      id v18 = [v7 calendar];
      v19 = [v12 dateByAddingTimeInterval:(double)v17];
      id v10 = [v18 components:242 fromDate:v19 toDate:v13 options:0];
    }
  }

  return v10;
}

- (BOOL)_isAllDay
{
  CFBooleanRef v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56C38]];
  CFBooleanRef v3 = v2;
  if (v2) {
    BOOL v4 = CFBooleanGetValue(v2) != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (EKStructuredLocation)preferredLocationWithoutPrediction
{
  CFBooleanRef v3 = [(EKCalendarItem *)self clientLocation];
  if (!v3)
  {
    CFBooleanRef v3 = [(EKCalendarItem *)self structuredLocationWithoutPrediction];
  }

  return (EKStructuredLocation *)v3;
}

- (EKStructuredLocation)structuredLocation
{
  CFBooleanRef v3 = [(EKEvent *)self _updatePredictedLocationCacheIfNeeded];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(EKCalendarItem *)self structuredLocationWithoutPrediction];
  }
  char v6 = v5;

  return (EKStructuredLocation *)v6;
}

- (id)_updatePredictedLocationCacheIfNeeded
{
  p_locationPredictionLock = &self->_locationPredictionLock;
  os_unfair_lock_lock(&self->_locationPredictionLock);
  BOOL v4 = self->_cachedLocationPrediction;
  BOOL v5 = [(EKEvent *)self _needsPredictedLocationCacheUpdateHoldingLock];
  os_unfair_lock_unlock(p_locationPredictionLock);
  if (v5)
  {
    os_unfair_lock_lock(p_locationPredictionLock);
    uint64_t v6 = [(EKEvent *)self _updatePredictedLocationCacheIfNeededHoldingLock];

    os_unfair_lock_unlock(p_locationPredictionLock);
    BOOL v4 = (EKStructuredLocation *)v6;
  }
  id v7 = v4;

  return v7;
}

- (BOOL)_needsPredictedLocationCacheUpdateHoldingLock
{
  if (self->_locationPredictionFrozen || !self->_locationPredictionAllowed) {
    return 0;
  }
  cachedLocationPredictionExpirationDate = self->_cachedLocationPredictionExpirationDate;
  if (!cachedLocationPredictionExpirationDate) {
    return 1;
  }
  BOOL v4 = cachedLocationPredictionExpirationDate;
  BOOL v5 = objc_opt_new();
  char v6 = [(NSDate *)v4 CalIsAfterDate:v5];

  return v6 ^ 1;
}

uint64_t __27__EKEvent__integrationType__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) calendar];
  CFBooleanRef v2 = [v1 source];
  uint64_t v3 = [v2 sourceType];

  if (v3 == 6) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  BOOL v5 = NSNumber;

  return [v5 numberWithUnsignedInteger:v4];
}

- (BOOL)completed
{
  return [(EKEvent *)self flag:1];
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)EKEvent;
  unint64_t v3 = [(EKObject *)&v8 hash];
  uint64_t v4 = [(EKEvent *)self occurrenceStartDate];
  [v4 absoluteTime];
  unint64_t v6 = v3 ^ (unint64_t)v5;

  return v6;
}

- (EKCalendarDate)occurrenceStartDate
{
  return self->_occurrenceStartDate;
}

- (unint64_t)reminderOccurrenceType
{
  if (![(EKEvent *)self isReminderIntegrationEvent]
    || ![(EKCalendarItem *)self hasRecurrenceRules])
  {
    return 0;
  }
  unint64_t v3 = [MEMORY[0x1E4F1C9C8] CalSimulatedDateForNow];
  uint64_t v4 = [(EKEvent *)self startDate];
  double v5 = (void *)MEMORY[0x1E4F1C9A8];
  unint64_t v6 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  id v7 = [v5 CalGregorianCalendarForTimeZone:v6];

  unint64_t v8 = [v4 compareDateIgnoringTimeComponents:v3 inCalendar:v7];
  if (v8)
  {
    if (v8 == 1)
    {
      if ([(EKEvent *)self isFirstOccurrence]) {
        unint64_t v8 = 0;
      }
      else {
        unint64_t v8 = 2;
      }
    }
    else
    {
      v9 = [(EKEvent *)self _nextReminderOccurrenceDate];
      unint64_t v8 = [v9 compareDateIgnoringTimeComponents:v3 inCalendar:v7] != 1;
    }
  }

  return v8;
}

- (BOOL)isReminderIntegrationEvent
{
  return [(EKEvent *)self _integrationType] == 2;
}

- (BOOL)isIntegrationEvent
{
  return [(EKEvent *)self _integrationType] > 1;
}

- (BOOL)flag:(unint64_t)a3
{
  return ([(EKEvent *)self flags] & a3) != 0;
}

- (unint64_t)flags
{
  CFBooleanRef v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56C18]];
  unint64_t v3 = (int)[v2 intValue];

  return v3;
}

- (int64_t)travelRoutingMode
{
  CFBooleanRef v2 = (void *)MEMORY[0x1E4F57740];
  unint64_t v3 = [(EKCalendarItem *)self travelStartLocation];
  uint64_t v4 = [v3 routing];
  int64_t v5 = [v2 routingModeEnumForCalRouteType:v4];

  return v5;
}

- (BOOL)isOriginalItemPhantom
{
  CFBooleanRef v2 = [(EKCalendarItem *)self originalItem];
  char v3 = [v2 isPhantom];

  return v3;
}

- (id)conferenceURLForDisplay
{
  char v3 = [(EKCalendarItem *)self calendar];
  uint64_t v4 = [v3 source];
  uint64_t v5 = [v4 sourceType];

  if (v5 == 2)
  {
    unint64_t v6 = [(EKEvent *)self conferenceURLDetected];
    if (!v6)
    {
      id v7 = [(EKEvent *)self conferenceURL];
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  unint64_t v6 = [(EKEvent *)self conferenceURL];
  if (v6)
  {
LABEL_5:
    id v7 = v6;
    unint64_t v6 = v7;
    goto LABEL_7;
  }
  id v7 = [(EKEvent *)self conferenceURLDetected];
LABEL_7:
  unint64_t v8 = v7;

  return v8;
}

- (id)conferenceURLDetected
{
  if ([(EKEvent *)self _detectedConferenceURLOnBackingObjectMayBeInvalid])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__EKEvent_EKEvent_Shared__conferenceURLDetected__block_invoke;
    v8[3] = &unk_1E5B96908;
    v8[4] = self;
    char v3 = [(EKObject *)self cachedValueForKey:@"conferenceURLDetectedKey" populateBlock:v8];
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];

    if (v3 != v4)
    {
      id v5 = v3;
LABEL_6:
      unint64_t v6 = v5;
      goto LABEL_8;
    }
  }
  else
  {
    char v3 = [(EKEvent *)self conferenceURLDetectedString];
    if (v3)
    {
      id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
      goto LABEL_6;
    }
  }
  unint64_t v6 = 0;
LABEL_8:

  return v6;
}

- (BOOL)_detectedConferenceURLOnBackingObjectMayBeInvalid
{
  if ([(EKObject *)self isNew]
    || [(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56C58]]
    || [(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56B88]]
    || [(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56BC0]]
    || [(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56D10]])
  {
    return 1;
  }
  id v5 = [(EKCalendarItem *)self preferredLocation];
  if ([v5 _hasChangesForKey:*MEMORY[0x1E4F570D0]]) {
    char v3 = 1;
  }
  else {
    char v3 = [v5 _hasChangesForKey:*MEMORY[0x1E4F57078]];
  }

  return v3;
}

- (NSURL)conferenceURL
{
  CFBooleanRef v2 = [(EKEvent *)self conferenceURLString];
  if (v2)
  {
    char v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    char v3 = 0;
  }

  return (NSURL *)v3;
}

- (id)conferenceURLString
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56F90]];
}

- (id)conferenceURLDetectedString
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56F88]];
}

- (NSString)locationWithoutPrediction
{
  char v3 = [(EKEvent *)self preferredLocationWithoutPrediction];
  uint64_t v4 = [v3 title];

  id v5 = [(EKEvent *)self preferredLocationWithoutPrediction];
  unint64_t v6 = [v5 address];

  id v7 = [MEMORY[0x1E4F57740] fullDisplayStringWithTitle:v4 address:v6];

  return (NSString *)v7;
}

- (int64_t)locationPredictionState
{
  CFBooleanRef v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56FE8]];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (NSURL)externalURL
{
  int64_t v3 = [(EKCalendarItem *)self calendar];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 source];
    unint64_t v6 = v5;
    if (v5)
    {
      id v7 = [v5 sourceIdentifier];
      if (v7)
      {
        unint64_t v8 = [(EKEvent *)self uniqueId];
        if (v8)
        {
          if (externalURL_onceToken != -1) {
            dispatch_once(&externalURL_onceToken, &__block_literal_global_59);
          }
          v9 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:externalURL_allowedCharacters];
          id v10 = [v8 stringByAddingPercentEncodingWithAllowedCharacters:externalURL_allowedCharacters];
          BOOL v11 = NSString;
          double v12 = [(EKEvent *)self startDate];
          [v12 timeIntervalSinceReferenceDate];
          uint64_t v14 = [v11 stringWithFormat:@"x-apple-calevent://%@/%@?o=%lld", v9, v10, (uint64_t)v13];

          uint64_t v15 = [MEMORY[0x1E4F1CB10] URLWithString:v14];
        }
        else
        {
          uint64_t v15 = 0;
        }
      }
      else
      {
        uint64_t v15 = 0;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return (NSURL *)v15;
}

- (int64_t)compareStartDateIncludingTravelWithEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(EKEvent *)self startDateIncludingTravel];
  unint64_t v6 = [v4 startDateIncludingTravel];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSDate)startDateIncludingTravel
{
  int64_t v3 = [(EKEvent *)self startDate];
  [(EKEvent *)self travelTime];
  id v5 = [v3 dateByAddingTimeInterval:-v4];

  return (NSDate *)v5;
}

- (NSDate)startDate
{
  return (NSDate *)[(EKCalendarDate *)self->_occurrenceStartDate date];
}

- (double)travelTime
{
  CFBooleanRef v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57040]];
  [v2 doubleValue];
  double v4 = v3;

  return fmax(v4, 0.0);
}

- (NSString)eventIdentifier
{
  double v3 = [(EKCalendarItem *)self uniqueID];
  double v4 = [(EKObject *)self eventStore];
  id v5 = [v4 sourceIdentifierForEvent:self];

  unint64_t v6 = 0;
  if (v3 && v5)
  {
    unint64_t v6 = [NSString stringWithFormat:@"%@%@%@", v5, *MEMORY[0x1E4F57918], v3];
  }

  return (NSString *)v6;
}

- (BOOL)conferenceURLForDisplayCached
{
  double v3 = [(EKCalendarItem *)self calendar];
  double v4 = [v3 source];
  uint64_t v5 = [v4 sourceType];

  if (v5 == 2)
  {
    unint64_t v6 = [(EKObject *)self cachedValueForKey:@"conferenceURLDetectedKey" populateBlock:0];
    BOOL v7 = v6 != 0;
  }
  else
  {
    unint64_t v6 = [(EKEvent *)self conferenceURL];
    if (v6)
    {
      BOOL v7 = 1;
    }
    else
    {
      unint64_t v8 = [(EKObject *)self cachedValueForKey:@"conferenceURLDetectedKey" populateBlock:0];
      BOOL v7 = v8 != 0;
    }
  }

  return v7;
}

- (int64_t)specialDayType
{
  double v3 = [(EKCalendarItem *)self calendar];
  int v4 = [v3 isChinaHolidayCalendar];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(EKEvent *)self specialDayString];
  unint64_t v6 = v5;
  if (v5)
  {
    if ([v5 isEqualToString:*MEMORY[0x1E4FB8080]])
    {
      int64_t v7 = 1;
    }
    else if ([v6 isEqualToString:*MEMORY[0x1E4FB8078]])
    {
      int64_t v7 = 3;
    }
    else
    {
      int64_t v7 = 4;
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)setLocationPredictionAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  p_locationPredictionLock = &self->_locationPredictionLock;
  os_unfair_lock_lock(&self->_locationPredictionLock);
  if (self->_locationPredictionAllowed != v3) {
    self->_locationPredictionAllowed = v3;
  }

  os_unfair_lock_unlock(p_locationPredictionLock);
}

- (BOOL)isOrWasPartOfRecurringSeries
{
  if ([(EKCalendarItem *)self hasRecurrenceRules]
    || [(EKCalendarItem *)self _hadRecurrenceRules])
  {
    return 1;
  }

  return [(EKEvent *)self isDetached];
}

id __31__EKEvent_recurrenceIdentifier__block_invoke(uint64_t a1)
{
  CFBooleanRef v2 = [*(id *)(a1 + 32) localUID];
  BOOL v3 = [*(id *)(a1 + 32) recurrenceDate];
  int v4 = +[EKRecurrenceIdentifier recurrenceIdentifierWithLocalUID:v2 recurrenceDate:v3];

  return v4;
}

- (NSDate)recurrenceDate
{
  BOOL v3 = [(EKEvent *)self originalStartDate];
  int v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else if ([(EKCalendarItem *)self hasRecurrenceRules])
  {
    unint64_t v6 = [(EKEvent *)self originalOccurrenceStartDate];
    id v5 = [v6 date];

    int64_t v7 = [(EKCalendarItem *)self timeZone];

    if (!v7)
    {
      unint64_t v8 = [(EKEvent *)self effectiveTimeZone];
      uint64_t v9 = [v5 dateInTimeZone:0 fromTimeZone:v8];

      id v5 = (id)v9;
    }
  }
  else
  {
    id v5 = 0;
  }

  return (NSDate *)v5;
}

- (NSDate)originalStartDate
{
  return (NSDate *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56FF0]];
}

id __48__EKEvent_EKEvent_Shared__conferenceURLDetected__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _detectConferenceURL];
  CFBooleanRef v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1CA98] null];
  }
  int v4 = v3;

  return v4;
}

- (id)_detectConferenceURL
{
  CFBooleanRef v2 = (void *)MEMORY[0x1E4F576A0];
  id v3 = [(EKEvent *)self _prioritizedConferencesSources];
  int v4 = [v2 conferenceURLFromSources:v3];

  return v4;
}

- (id)_prioritizedConferencesSources
{
  id v3 = objc_opt_new();
  int v4 = [(EKEvent *)self locationWithoutPrediction];

  if (v4)
  {
    id v5 = [(EKEvent *)self locationWithoutPrediction];
    [v3 addObject:v5];
  }
  unint64_t v6 = [(EKEvent *)self displayNotes];

  if (v6)
  {
    int64_t v7 = [(EKEvent *)self displayNotes];
    [v3 addObject:v7];
  }
  unint64_t v8 = [(EKEvent *)self URL];

  if (v8)
  {
    uint64_t v9 = [(EKEvent *)self URL];
    id v10 = [v9 absoluteString];
    [v3 addObject:v10];
  }

  return v3;
}

- (id)displayNotes
{
  id v11 = 0;
  id v12 = 0;
  [(EKEvent *)self parsedConference:&v12 andNotes:&v11];
  id v3 = v12;
  id v4 = v11;
  if (v3)
  {
    uint64_t v5 = [v3 range];
    int64_t v7 = objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v5, v6, &stru_1EF932508);

    if (![v7 hasSuffix:@"\n\n"]) {
      goto LABEL_6;
    }
    uint64_t v8 = objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - 2);
  }
  else
  {
    uint64_t v8 = [(EKCalendarItem *)self notes];
    int64_t v7 = v4;
  }

  int64_t v7 = (void *)v8;
LABEL_6:
  uint64_t v9 = [v7 CDVStringByXMLUnquoting];

  return v9;
}

- (EKVirtualConference)virtualConference
{
  id v5 = 0;
  [(EKEvent *)self parsedConference:&v5 andNotes:0];
  id v2 = v5;
  id v3 = [v2 conference];

  return (EKVirtualConference *)v3;
}

- (void)parsedConference:(id *)a3 andNotes:(id *)a4
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__EKEvent_EKEvent_Shared__parsedConference_andNotes___block_invoke;
  v10[3] = &unk_1E5B96908;
  v10[4] = self;
  uint64_t v6 = [(EKObject *)self cachedValueForKey:@"parsedConferenceKey" populateBlock:v10];
  int64_t v7 = [MEMORY[0x1E4F1CA98] null];

  if (v6 == v7)
  {
    if (a3) {
      *a3 = 0;
    }
    if (a4) {
      *a4 = 0;
    }
  }
  else
  {
    uint64_t v8 = [v6 objectForKey:@"parseResult"];
    uint64_t v9 = [v6 objectForKey:@"notes"];
    if (a3) {
      *a3 = v8;
    }
    if (a4) {
      *a4 = v9;
    }
  }
}

id __53__EKEvent_EKEvent_Shared__parsedConference_andNotes___block_invoke(uint64_t a1)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) notes];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) notes];
    uint64_t v4 = +[EKConferencePersistence deserializeConference:v3];
    id v5 = (void *)v4;
    if (v3) {
      BOOL v6 = v4 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
    }
    else
    {
      v10[0] = @"parseResult";
      v10[1] = @"notes";
      v11[0] = v4;
      v11[1] = v3;
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    }
    int64_t v7 = (void *)v8;
  }
  else
  {
    int64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }

  return v7;
}

- (id)URL
{
  v11.receiver = self;
  v11.super_class = (Class)EKEvent;
  id v3 = [(EKCalendarItem *)&v11 URL];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else if ([(EKEvent *)self isBirthday])
  {
    BOOL v6 = (void *)MEMORY[0x1E4F1CB10];
    int64_t v7 = NSString;
    uint64_t v8 = [(EKEvent *)self birthdayContactIdentifier];
    uint64_t v9 = [v7 stringWithFormat:@"addressbook://%@", v8];
    id v5 = [v6 URLWithString:v9];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)isBirthday
{
  id v2 = [(EKEvent *)self birthdayContactIdentifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_updatePredictedLocationCacheIfNeededHoldingLock
{
  if ([(EKEvent *)self _needsPredictedLocationCacheUpdateHoldingLock])
  {
    cachedLocationPrediction = self->_cachedLocationPrediction;
    self->_cachedLocationPrediction = 0;

    cachedLocationPredictionExpirationDate = self->_cachedLocationPredictionExpirationDate;
    self->_cachedLocationPredictionExpirationDate = 0;

    id v5 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      -[EKEvent _updatePredictedLocationCacheIfNeededHoldingLock].cold.4(v5);
    }
    id v18 = 0;
    BOOL v6 = +[EKEvent _updatedPredictedLocationRespectingTimeoutBudgetForEvent:self error:&v18];
    id v7 = v18;
    uint64_t v8 = (void *)EKLogHandle;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        [(EKEvent *)v8 _updatePredictedLocationCacheIfNeededHoldingLock];
      }
      uint64_t v9 = objc_opt_new();
      id v10 = v9;
      double v11 = 120.0;
      goto LABEL_16;
    }
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    {
      [(EKEvent *)(uint64_t)v6 _updatePredictedLocationCacheIfNeededHoldingLock];
      if (v6) {
        goto LABEL_10;
      }
    }
    else if (v6)
    {
LABEL_10:
      id v12 = [(EKEvent *)self _firstNonConferenceRoomLocationTitle];
      if (!v12)
      {
        id v12 = [v6 address];
      }
      [v6 setTitle:v12];
      double v13 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
        [(EKEvent *)(uint64_t)v12 _updatePredictedLocationCacheIfNeededHoldingLock];
      }
    }
    objc_storeStrong((id *)&self->_cachedLocationPrediction, v6);
    uint64_t v9 = objc_opt_new();
    id v10 = v9;
    double v11 = 300.0;
LABEL_16:
    uint64_t v14 = [v9 dateByAddingTimeInterval:v11];
    uint64_t v15 = self->_cachedLocationPredictionExpirationDate;
    self->_cachedLocationPredictionExpirationDate = v14;
  }
  BOOL v16 = self->_cachedLocationPrediction;

  return v16;
}

+ (id)_updatedPredictedLocationRespectingTimeoutBudgetForEvent:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [MEMORY[0x1E4F29060] isMainThread];
  double v7 = *(double *)&remainingTimeout;
  if (v6) {
    double v8 = *(double *)&remainingTimeout;
  }
  else {
    double v8 = 0.1;
  }
  uint64_t v9 = EKLogHandle;
  BOOL v10 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG);
  if (v6 && v7 <= 0.0)
  {
    if (v10) {
      +[EKEvent _updatedPredictedLocationRespectingTimeoutBudgetForEvent:error:]();
    }
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"Prediction not attempted due to past timeouts";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F57620] code:0 userInfo:v12];
    }

    double v13 = 0;
    goto LABEL_22;
  }
  if (v10)
  {
    +[EKEvent _updatedPredictedLocationRespectingTimeoutBudgetForEvent:v11 error:v8];
    if (v6) {
      goto LABEL_13;
    }
  }
  else if (v6)
  {
LABEL_13:
    uint64_t v14 = mach_absolute_time();
    goto LABEL_16;
  }
  uint64_t v14 = 0;
LABEL_16:
  double v13 = +[EKStructuredLocationPrediction locationPredictionForEvent:v5 error:a4 timeout:v8];
  if (v6)
  {
    uint64_t v15 = mach_absolute_time();
    mach_timebase_info v22 = 0;
    mach_timebase_info(&v22);
    unint64_t v16 = (v15 - v14) * v22.numer / v22.denom;
    if (*(double *)&remainingTimeout == 0.1) {
      dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_158);
    }
    double v17 = (double)v16 / 1000000000.0;
    id v18 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      +[EKEvent _updatedPredictedLocationRespectingTimeoutBudgetForEvent:v19 error:v20];
    }
    *(double *)&remainingTimeout = *(double *)&remainingTimeout - v17;
  }
LABEL_22:

  return v13;
}

- (NSArray)locationsWithoutPrediction
{
  id v2 = [(EKEvent *)self locationWithoutPrediction];
  BOOL v3 = [v2 componentsSeparatedByString:@"; "];

  return (NSArray *)v3;
}

- (id)_firstNonConferenceRoomLocationTitle
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(EKEvent *)self locationsWithoutPrediction];
  if ([(EKCalendarItem *)self hasAttendees])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = v3;
    uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v20 = *(void *)v26;
      id v18 = v3;
      while (1)
      {
        uint64_t v6 = 0;
LABEL_5:
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(obj);
        }
        double v7 = *(void **)(*((void *)&v25 + 1) + 8 * v6);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        double v8 = [(EKCalendarItem *)self attendees];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (!v9) {
          break;
        }
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v22;
LABEL_9:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
          if ([v13 participantType] == 2)
          {
            uint64_t v14 = [v13 name];
            int v15 = [v14 isEqualToString:v7];

            if (v15) {
              break;
            }
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v10) {
              goto LABEL_9;
            }
            goto LABEL_21;
          }
        }

        if (++v6 != v5) {
          goto LABEL_5;
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
        id v16 = 0;
        BOOL v3 = v18;
        if (!v5) {
          goto LABEL_23;
        }
      }
LABEL_21:

      id v16 = v7;
      BOOL v3 = v18;
    }
    else
    {
      id v16 = 0;
    }
LABEL_23:
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (int64_t)currentUserGeneralizedParticipantRole
{
  if (![(EKCalendarItem *)self hasAttendees]) {
    return 0;
  }
  if ([(EKEvent *)self currentUserMayActAsOrganizer]) {
    return 2;
  }
  uint64_t v4 = [(EKCalendarItem *)self selfAttendee];

  if (v4) {
    return 1;
  }
  else {
    return 3;
  }
}

- (BOOL)hasAttendeeProposedTimes
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![(EKCalendarItem *)self isSelfOrganizedInvitation]) {
    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v3 = [(EKCalendarItem *)self attendees];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          uint64_t v10 = [v9 proposedStartDateForEvent:self];
          if (v10)
          {
            uint64_t v11 = (void *)v10;
            int v12 = [v9 proposedStartDateStatus];

            if (v12 != 3)
            {

              BOOL v13 = 1;
              goto LABEL_16;
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_16:

  return v13;
}

- (EKEventStatus)status
{
  id v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57028]];
  EKEventStatus v3 = [v2 integerValue];

  return v3;
}

- (int64_t)selfParticipantStatus
{
  if (![(EKObject *)self isNew]
    && ([(EKObject *)self isPropertyUnavailable:*MEMORY[0x1E4F56C88]]
     || ([(EKCalendarItem *)self selfAttendee],
         EKEventStatus v3 = objc_claimAutoreleasedReturnValue(),
         int v4 = [v3 isPropertyUnavailable:*MEMORY[0x1E4F56B78]],
         v3,
         v4)))
  {
    v6.receiver = self;
    v6.super_class = (Class)EKEvent;
    return [(EKCalendarItem *)&v6 selfParticipantStatus];
  }
  else
  {
    return [(EKEvent *)self participationStatus];
  }
}

- (int64_t)participationStatus
{
  id v2 = [(EKCalendarItem *)self selfAttendee];
  EKEventStatus v3 = v2;
  if (v2) {
    int64_t v4 = [v2 participantStatus];
  }
  else {
    int64_t v4 = 2;
  }

  return v4;
}

- (BOOL)_invitationChangedPropertyForFlag:(unsigned int)a3
{
  return ([(EKEvent *)self invitationChangedProperties] & a3) != 0;
}

- (unsigned)invitationChangedProperties
{
  id v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56FD0]];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (unint64_t)invitationStatus
{
  id v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56FD8]];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (BOOL)videoConferenceChanged
{
  return [(EKEvent *)self _invitationChangedPropertyForFlag:256];
}

- (BOOL)titleChanged
{
  return [(EKEvent *)self _invitationChangedPropertyForFlag:4];
}

- (BOOL)timeChanged
{
  return [(EKEvent *)self _invitationChangedPropertyForFlag:2];
}

- (BOOL)recurrenceChanged
{
  return [(EKEvent *)self _invitationChangedPropertyForFlag:512];
}

- (BOOL)locationChanged
{
  return [(EKEvent *)self _invitationChangedPropertyForFlag:8];
}

- (BOOL)dateChanged
{
  return [(EKEvent *)self _invitationChangedPropertyForFlag:1];
}

- (BOOL)attendeeReplyChanged
{
  return [(EKEvent *)self _invitationChangedPropertyForFlag:240];
}

- (NSDate)participationStatusModifiedDate
{
  return (NSDate *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56FF8]];
}

- (id)earliestOccurrenceEndingAfter:(id)a3 excludeSignificantDetachments:(BOOL)a4 excludeCanceledDetachments:(BOOL)a5 excludeDeclinedDetachments:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if ([(EKCalendarItem *)self hasRecurrenceRules])
  {
    v54 = v10;
    v53 = objc_alloc_init(EKRecurrenceGenerator);
    uint64_t v11 = [(EKCalendarItem *)self exceptionDates];
    v51 = [(EKCalendarItem *)self detachedItems];
    int v12 = [v51 allObjects];
    BOOL v13 = [v12 sortedArrayUsingSelector:sel_compareStartDateWithEvent_];

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v59 objects:v64 count:16];
    v52 = v11;
    if (v15)
    {
      uint64_t v16 = v15;
      v49 = self;
      uint64_t v17 = *(void *)v60;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v60 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          if ((!v8 || ([*(id *)(*((void *)&v59 + 1) + 8 * i) isSignificantlyDetached] & 1) == 0)
            && (!v7 || [v19 status] != 3)
            && (!v6 || [v19 selfParticipantStatus] != 3))
          {
            uint64_t v20 = [v19 endDateUnadjustedForLegacyClients];
            int v21 = [v20 CalIsAfterDate:v54];

            if (v21)
            {
              id v47 = v19;
              goto LABEL_20;
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v59 objects:v64 count:16];
        if (v16) {
          continue;
        }
        break;
      }
      id v47 = 0;
LABEL_20:
      uint64_t v11 = v52;
      self = v49;
    }
    else
    {
      id v47 = 0;
    }

    if ([v14 count])
    {
      long long v25 = (void *)[v11 mutableCopy];
      if (!v25)
      {
        long long v25 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v14, "count"));
      }
    }
    else
    {
      long long v25 = 0;
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v26 = v14;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v55 objects:v63 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v56;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v56 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = objc_msgSend(*(id *)(*((void *)&v55 + 1) + 8 * j), "recurrenceDate", v47);
          if (v31) {
            [v25 addObject:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v55 objects:v63 count:16];
      }
      while (v28);
    }

    [(EKEvent *)self duration];
    id v10 = v54;
    uint64_t v33 = [v54 dateByAddingTimeInterval:-v32];
    v34 = [(EKCalendarItem *)self recurrenceRules];
    if (v25) {
      v35 = v25;
    }
    else {
      v35 = v11;
    }
    v36 = [(EKEvent *)self startCalendarDate];
    v37 = (void *)MEMORY[0x1E4F57838];
    v38 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    v50 = (void *)v33;
    v39 = [v37 calendarDateWithDate:v33 timeZone:v38];
    v40 = [(EKRecurrenceGenerator *)v53 nextOccurrenceDateWithEKRecurrences:v34 forCalendarItem:self exceptionDates:v35 initialDate:v36 afterDate:v39];

    if (v40)
    {
      v41 = v48;
      if (!v48
        || ([v48 startDate],
            v42 = objc_claimAutoreleasedReturnValue(),
            int v43 = [v42 CalIsBeforeDate:v40],
            v42,
            !v43))
      {
        v44 = [EKEvent alloc];
        v45 = [(EKObject *)self persistentObject];
        long long v24 = [(EKEvent *)v44 initWithPersistentObject:v45 occurrenceDate:v40];

LABEL_45:
        goto LABEL_46;
      }
    }
    else
    {
      v41 = v48;
    }
    long long v24 = (EKEvent *)[v41 copy];
    goto LABEL_45;
  }
  long long v22 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
  int v23 = [v22 CalIsAfterDate:v10];

  if (v23) {
    long long v24 = self;
  }
  else {
    long long v24 = 0;
  }
LABEL_46:

  return v24;
}

- (EKCalendarDate)startCalendarDate
{
  return self->_occurrenceStartDate;
}

- (double)duration
{
  unint64_t v3 = [(EKEvent *)self occurrenceEndDate];
  int64_t v4 = [v3 date];
  uint64_t v5 = [(EKCalendarDate *)self->_occurrenceStartDate date];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  return v7;
}

- (NSDate)endDateUnadjustedForLegacyClients
{
  id v2 = [(EKEvent *)self occurrenceEndDate];
  unint64_t v3 = [v2 date];

  return (NSDate *)v3;
}

- (EKCalendarDate)occurrenceEndDate
{
  return self->_occurrenceEndDate;
}

- (EKRecurrenceIdentifier)recurrenceIdentifier
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__EKEvent_recurrenceIdentifier__block_invoke;
  v4[3] = &unk_1E5B96908;
  v4[4] = self;
  id v2 = [(EKObject *)self cachedValueForKey:@"recurrenceIdentifier" populateBlock:v4];

  return (EKRecurrenceIdentifier *)v2;
}

void __22__EKEvent_externalURL__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B88] URLFragmentAllowedCharacterSet];
  id v3 = (id)[v0 mutableCopy];

  [v3 removeCharactersInString:@"/?&:$+,;=@"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)externalURL_allowedCharacters;
  externalURL_allowedCharacters = v1;
}

void __43__EKEvent_knownRelationshipSingleValueKeys__block_invoke(uint64_t a1)
{
  v11[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F56BE8];
  v11[0] = *MEMORY[0x1E4F57030];
  v11[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F56F80];
  v11[2] = *MEMORY[0x1E4F56FC8];
  void v11[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  uint64_t v5 = (void *)knownRelationshipSingleValueKeys_keys_2;
  knownRelationshipSingleValueKeys_keys_2 = v4;

  double v6 = (void *)knownRelationshipSingleValueKeys_keys_2;
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___EKEvent;
  double v7 = objc_msgSendSuper2(&v10, sel_knownRelationshipSingleValueKeys);
  uint64_t v8 = [v6 arrayByAddingObjectsFromArray:v7];
  id v9 = (void *)knownRelationshipSingleValueKeys_keys_2;
  knownRelationshipSingleValueKeys_keys_2 = v8;
}

void __42__EKEvent_knownRelationshipMultiValueKeys__block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = *MEMORY[0x1E4F56F50];
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  uint64_t v3 = (void *)knownRelationshipMultiValueKeys_keys_2;
  knownRelationshipMultiValueKeys_keys_2 = v2;

  uint64_t v4 = (void *)knownRelationshipMultiValueKeys_keys_2;
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___EKEvent;
  uint64_t v5 = objc_msgSendSuper2(&v8, sel_knownRelationshipMultiValueKeys);
  uint64_t v6 = [v4 arrayByAddingObjectsFromArray:v5];
  double v7 = (void *)knownRelationshipMultiValueKeys_keys_2;
  knownRelationshipMultiValueKeys_keys_2 = v6;
}

- (id)constraints
{
  uint64_t v3 = [(EKObject *)self eventStore];
  uint64_t v4 = [v3 cachedConstraintsForEvent:self];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualConferenceTextRepresentation, 0);
  objc_storeStrong((id *)&self->_showEventURLString, 0);
  objc_storeStrong((id *)&self->_originalOccurrenceIsAllDay, 0);
  objc_storeStrong((id *)&self->_originalOccurrenceEndDate, 0);
  objc_storeStrong((id *)&self->_originalOccurrenceStartDate, 0);
  objc_storeStrong((id *)&self->_occurrenceEndDate, 0);
  objc_storeStrong((id *)&self->_occurrenceStartDate, 0);
  objc_storeStrong((id *)&self->_birthdayPersonUniqueID, 0);
  objc_storeStrong((id *)&self->_virtualConferenceURLsToInvalidateOnCommit, 0);
  objc_storeStrong((id *)&self->_cachedLocationPredictionExpirationDate, 0);

  objc_storeStrong((id *)&self->_cachedLocationPrediction, 0);
}

- (void)setIsJunk:(BOOL)a3 shouldSave:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  [(EKEvent *)self setJunkStatus:v7];
  if (v4)
  {
    objc_super v8 = [(EKObject *)self eventStore];
    id v11 = 0;
    [v8 saveEvent:self span:2 commit:1 error:&v11];
    id v9 = v11;

    if (v9)
    {
      objc_super v10 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        -[EKEvent(EKEvent_Shared) setIsJunk:shouldSave:](a3, (uint64_t)v9, v10);
      }
    }
  }
}

- (unint64_t)cachedJunkStatus
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke;
  v5[3] = &unk_1E5B96908;
  v5[4] = self;
  uint64_t v2 = [(EKObject *)self cachedValueForKey:@"cachedJunkStatus" populateBlock:v5];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

id __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) junkStatus];
  unint64_t v3 = [*(id *)(a1 + 32) selfAttendee];
  uint64_t v4 = [v3 participantStatus];

  if (v2)
  {
    uint64_t v5 = +[EKLogSubsystem junk];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke_cold_5(v2, v5);
    }
    goto LABEL_14;
  }
  if ([*(id *)(a1 + 32) isNew])
  {
    uint64_t v5 = +[EKLogSubsystem junk];
    uint64_t v2 = 2;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_14;
    }
    __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
LABEL_20:
    uint64_t v2 = 2;
    goto LABEL_14;
  }
  if (([*(id *)(a1 + 32) isSelfOrganized] & 1) != 0
    || ([*(id *)(a1 + 32) hasAttendees] & 1) == 0)
  {
    uint64_t v5 = +[EKLogSubsystem junk];
    uint64_t v2 = 2;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_14;
    }
    __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke_cold_2(v5, v20, v21, v22, v23, v24, v25, v26);
    goto LABEL_20;
  }
  if (v4 == 4 || v4 == 2)
  {
    uint64_t v5 = +[EKLogSubsystem junk];
    uint64_t v2 = 2;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_14;
    }
    __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke_cold_4(v5, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_20;
  }
  uint64_t v2 = +[EKJunkInvitationProtocol_Shared junkStatusForInvitation:*(void *)(a1 + 32)];
  uint64_t v5 = +[EKLogSubsystem junk];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke_cold_3(v2, v5, v29, v30, v31, v32, v33, v34);
  }
LABEL_14:

  uint64_t v27 = [NSNumber numberWithUnsignedInteger:v2];

  return v27;
}

- (void)setCachedJunkStatus:(unint64_t)a3
{
  if (a3)
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(EKObject *)self setCachedValue:v4 forKey:@"cachedJunkStatus"];
  }
  else
  {
    [(EKObject *)self clearCachedValueForKey:@"cachedJunkStatus"];
  }
}

- (BOOL)_couldBeJunkCommon
{
  unint64_t v3 = [(EKEvent *)self cachedJunkStatus];
  id v4 = +[EKLogSubsystem junk];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3 == 3)
  {
    if (v5) {
      [(EKEvent(EKEvent_Shared) *)(uint64_t)self _couldBeJunkCommon];
    }
  }
  else if (v5)
  {
    [(EKEvent(EKEvent_Shared) *)(uint64_t)self _couldBeJunkCommon];
  }

  return v3 == 3;
}

- (NSArray)locations
{
  uint64_t v2 = [(EKCalendarItem *)self location];
  unint64_t v3 = [v2 componentsSeparatedByString:@"; "];

  return (NSArray *)v3;
}

- (void)setLocations:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _locationStringForLocations:v4];

  [(EKCalendarItem *)self setLocation:v5];
}

+ (id)_locationStringForLocations:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 componentsJoinedByString:@"; "];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setNotesCommon:(id)a3
{
  [(EKEvent *)self clearDetectedConferenceURL];

  [(EKEvent *)self clearParsedConference];
}

- (void)clearParsedConference
{
}

- (void)clearDetectedConferenceURL
{
}

+ (id)EKObjectChangeSummarizer_singleValueDiffKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__EKEvent_EKObjectChangeSummarizer__EKObjectChangeSummarizer_singleValueDiffKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (EKObjectChangeSummarizer_singleValueDiffKeys_onceToken_150 != -1) {
    dispatch_once(&EKObjectChangeSummarizer_singleValueDiffKeys_onceToken_150, block);
  }
  uint64_t v2 = (void *)EKObjectChangeSummarizer_singleValueDiffKeys_diffKeys_149;

  return v2;
}

void __81__EKEvent_EKObjectChangeSummarizer__EKObjectChangeSummarizer_singleValueDiffKeys__block_invoke(uint64_t a1)
{
  v14[9] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F57040];
  v13[0] = *MEMORY[0x1E4F56F58];
  v13[1] = v2;
  v14[0] = @"EKChangedAvailability";
  v14[1] = @"EKChangedTravelTime";
  uint64_t v3 = *MEMORY[0x1E4F56FB0];
  v13[2] = *MEMORY[0x1E4F57000];
  v13[3] = v3;
  v14[2] = @"EKChangedPrivacy";
  v14[3] = @"EKChangedEndDate";
  uint64_t v4 = *MEMORY[0x1E4F56FE0];
  v13[4] = *MEMORY[0x1E4F56BF0];
  v13[5] = v4;
  v14[4] = @"EKChangedEndTimeZone";
  void v14[5] = @"EKChangedJunkStatus";
  id v5 = +[EKDiff summaryKeyForChangedProperty:*MEMORY[0x1E4F56C88] subProperty:*MEMORY[0x1E4F56B78]];
  uint64_t v6 = *MEMORY[0x1E4F57008];
  v13[6] = v5;
  v13[7] = v6;
  v14[6] = @"EKChangedParticipationStatus";
  v14[7] = @"EKChangedAlternateTimeProposal";
  v13[8] = *MEMORY[0x1E4F57018];
  v14[8] = @"EKChangedResponseComment";
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:9];

  v12.receiver = *(id *)(a1 + 32);
  v12.super_class = (Class)&OBJC_METACLASS___EKEvent;
  uint64_t v8 = objc_msgSendSuper2(&v12, sel_EKObjectChangeSummarizer_singleValueDiffKeys);
  uint64_t v9 = (void *)[v8 mutableCopy];

  [v9 addEntriesFromDictionary:v7];
  uint64_t v10 = [v9 copy];
  uint64_t v11 = (void *)EKObjectChangeSummarizer_singleValueDiffKeys_diffKeys_149;
  EKObjectChangeSummarizer_singleValueDiffKeys_diffKeys_149 = v10;
}

+ (id)EKObjectChangeSummarizer_multiValueDiffKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__EKEvent_EKObjectChangeSummarizer__EKObjectChangeSummarizer_multiValueDiffKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (EKObjectChangeSummarizer_multiValueDiffKeys_onceToken_154 != -1) {
    dispatch_once(&EKObjectChangeSummarizer_multiValueDiffKeys_onceToken_154, block);
  }
  uint64_t v2 = (void *)EKObjectChangeSummarizer_multiValueDiffKeys_diffKeys_153;

  return v2;
}

void __80__EKEvent_EKObjectChangeSummarizer__EKObjectChangeSummarizer_multiValueDiffKeys__block_invoke(uint64_t a1)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F56BA8];
  v12[0] = @"add";
  v12[1] = @"remove";
  v13[0] = @"EKChangedAttendeesAdded";
  v13[1] = @"EKChangedAttendeesRemoved";
  v12[2] = @"modify";
  v13[2] = @"EKChangedAttendeesModified";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v14[1] = *MEMORY[0x1E4F56BA0];
  v15[0] = v2;
  v10[0] = @"add";
  v10[1] = @"remove";
  v11[0] = @"EKChangedAttachmentsAdded";
  v11[1] = @"EKChangedAttachmentsRemoved";
  void v10[2] = @"modify";
  v11[2] = @"EKChangedAttachmentsModified";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  v15[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)&OBJC_METACLASS___EKEvent;
  id v5 = objc_msgSendSuper2(&v9, sel_EKObjectChangeSummarizer_multiValueDiffKeys);
  uint64_t v6 = (void *)[v5 mutableCopy];

  [v6 addEntriesFromDictionary:v4];
  uint64_t v7 = [v6 copy];
  uint64_t v8 = (void *)EKObjectChangeSummarizer_multiValueDiffKeys_diffKeys_153;
  EKObjectChangeSummarizer_multiValueDiffKeys_diffKeys_153 = v7;
}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownKeysToSkipForFutureChanges
{
  if (knownKeysToSkipForFutureChanges_onceToken != -1) {
    dispatch_once(&knownKeysToSkipForFutureChanges_onceToken, &__block_literal_global_57);
  }
  uint64_t v2 = (void *)knownKeysToSkipForFutureChanges_knownKeysToSkipForFutureChanges;

  return v2;
}

void __42__EKEvent_knownKeysToSkipForFutureChanges__block_invoke()
{
  v7[10] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F56FB0];
  v7[0] = *MEMORY[0x1E4F56D00];
  v7[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F56C30];
  v7[2] = *MEMORY[0x1E4F56C80];
  v7[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F56BE0];
  v7[4] = *MEMORY[0x1E4F56BD8];
  v7[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F56D38];
  v7[6] = *MEMORY[0x1E4F56C68];
  v7[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F56FF0];
  v7[8] = *MEMORY[0x1E4F56BB0];
  v7[9] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:10];
  uint64_t v6 = (void *)knownKeysToSkipForFutureChanges_knownKeysToSkipForFutureChanges;
  knownKeysToSkipForFutureChanges_knownKeysToSkipForFutureChanges = v5;
}

+ (id)knownKeysToUseForFutureChanges
{
  if (knownKeysToUseForFutureChanges_onceToken != -1) {
    dispatch_once(&knownKeysToUseForFutureChanges_onceToken, &__block_literal_global_24_1);
  }
  uint64_t v2 = (void *)knownKeysToUseForFutureChanges_knownKeysToUseForFutureChanges;

  return v2;
}

void __41__EKEvent_knownKeysToUseForFutureChanges__block_invoke()
{
  v5[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F56BA0];
  v5[0] = *MEMORY[0x1E4F56BA8];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F56C60];
  v5[2] = *MEMORY[0x1E4F57000];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F57040];
  v5[4] = *MEMORY[0x1E4F56D10];
  void v5[5] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:6];
  uint64_t v4 = (void *)knownKeysToUseForFutureChanges_knownKeysToUseForFutureChanges;
  knownKeysToUseForFutureChanges_knownKeysToUseForFutureChanges = v3;
}

+ (id)knownSingleValueKeysForComparison
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__EKEvent_knownSingleValueKeysForComparison__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (knownSingleValueKeysForComparison_onceToken_4 != -1) {
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_4, block);
  }
  uint64_t v2 = (void *)knownSingleValueKeysForComparison_keys_4;

  return v2;
}

void __44__EKEvent_knownSingleValueKeysForComparison__block_invoke(uint64_t a1)
{
  v19[23] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F56F60];
  v19[0] = *MEMORY[0x1E4F56F58];
  v19[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F56F78];
  v19[2] = *MEMORY[0x1E4F56F70];
  v19[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F56FA8];
  v19[4] = *MEMORY[0x1E4F56F90];
  v19[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F56FB8];
  v19[6] = *MEMORY[0x1E4F56FB0];
  v19[7] = v5;
  uint64_t v6 = *MEMORY[0x1E4F56FD0];
  v19[8] = *MEMORY[0x1E4F56FC0];
  v19[9] = v6;
  uint64_t v7 = *MEMORY[0x1E4F56FE0];
  v19[10] = *MEMORY[0x1E4F56FD8];
  v19[11] = v7;
  uint64_t v8 = *MEMORY[0x1E4F56FF0];
  v19[12] = *MEMORY[0x1E4F56FE8];
  v19[13] = v8;
  uint64_t v9 = *MEMORY[0x1E4F56C70];
  v19[14] = *MEMORY[0x1E4F56FF8];
  v19[15] = v9;
  uint64_t v10 = *MEMORY[0x1E4F57008];
  v19[16] = *MEMORY[0x1E4F57000];
  v19[17] = v10;
  uint64_t v11 = *MEMORY[0x1E4F56D00];
  v19[18] = *MEMORY[0x1E4F57018];
  v19[19] = v11;
  uint64_t v12 = *MEMORY[0x1E4F57038];
  v19[20] = *MEMORY[0x1E4F57028];
  v19[21] = v12;
  v19[22] = *MEMORY[0x1E4F57040];
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:23];
  uint64_t v14 = (void *)knownSingleValueKeysForComparison_keys_4;
  knownSingleValueKeysForComparison_keys_4 = v13;

  v18.receiver = *(id *)(a1 + 32);
  v18.super_class = (Class)&OBJC_METACLASS___EKEvent;
  uint64_t v15 = objc_msgSendSuper2(&v18, sel_knownSingleValueKeysForComparison);
  uint64_t v16 = [v15 arrayByAddingObjectsFromArray:knownSingleValueKeysForComparison_keys_4];
  uint64_t v17 = (void *)knownSingleValueKeysForComparison_keys_4;
  knownSingleValueKeysForComparison_keys_4 = v16;
}

+ (EKEvent)eventWithEventStore:(EKEventStore *)eventStore
{
  uint64_t v4 = eventStore;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithEventStore:v4];

  return (EKEvent *)v5;
}

- (EKEvent)init
{
  return 0;
}

- (EKEvent)initWithEventStore:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    -[EKEvent initWithEventStore:]();
  }
  uint64_t v5 = objc_alloc_init(EKPersistentEvent);
  [v4 _registerObject:v5];
  uint64_t v6 = [(EKEvent *)self initWithPersistentObject:v5 occurrenceDate:0];
  uint64_t v7 = EKUUIDString();
  [(EKCalendarItem *)v6 setCalendarItemIdentifier:v7];

  uint64_t v8 = [v4 timeZone];
  [(EKEvent *)v6 setTimeZone:v8];

  uint64_t v9 = [(EKEvent *)v6 defaultAlarms];
  uint64_t v10 = [v9 anyObject];

  if (!v10)
  {
    uint64_t v10 = +[EKAlarm alarmWithRelativeOffset:0.0];
    [v10 setDefaultAlarm:1];
  }
  [(EKCalendarItem *)v6 addAlarm:v10];

  return v6;
}

- (EKEvent)initWithPersistentObject:(id)a3
{
  return [(EKEvent *)self initWithPersistentObject:a3 occurrenceDate:0];
}

- (EKEvent)initWithPersistentObject:(id)a3 objectForCopy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v9 = (void *)MEMORY[0x1E4F1C3C8];
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Trying to initialize an EKEvent as a copy of an object that is not an EKEvent" userInfo:0];
    [v10 raise];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*v9 reason:@"Trying to initialize an EKEvent with a backing object that is not an EKPersistentEvent" userInfo:0];
    [v11 raise];
  }
  uint64_t v12 = v7;
  uint64_t v13 = [v12 originalOccurrenceStartDate];
  uint64_t v14 = [v13 date];
  uint64_t v15 = [(EKEvent *)self initWithPersistentObject:v6 occurrenceDate:v14];

  LOBYTE(v14) = v12[108];
  v15->_isMainOccurrence = (char)v14;

  return v15;
}

- (unint64_t)entityType
{
  return 0;
}

- (NSString)eventOccurrenceID
{
  uint64_t v2 = [(EKEvent *)self recurrenceIdentifier];
  uint64_t v3 = [v2 identifierString];

  return (NSString *)v3;
}

+ (id)externalUriScheme
{
  return @"x-apple-calevent";
}

- (BOOL)isStatusDirty
{
  return [(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F57028]];
}

- (BOOL)isStartDateDirty
{
  return [(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56D00]];
}

- (BOOL)isEndDateDirty
{
  return [(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56FB0]];
}

- (BOOL)isAllDayDirty
{
  return [(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56C38]];
}

+ (id)_modifiedNotificationUserInfoWithIdentifier:(id)a3 forRevert:(BOOL)a4
{
  BOOL v4 = a4;
  v16[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v15[0] = @"EKEventStoreModifiedEventIdentifier";
      v15[1] = @"EKEventStoreRevert";
      v16[0] = v5;
      v16[1] = MEMORY[0x1E4F1CC38];
      id v7 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v8 = (id *)v16;
      uint64_t v9 = (__CFString **)v15;
      uint64_t v10 = 2;
    }
    else
    {
      uint64_t v13 = @"EKEventStoreModifiedEventIdentifier";
      id v14 = v5;
      id v7 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v8 = &v14;
      uint64_t v9 = &v13;
      uint64_t v10 = 1;
    }
    uint64_t v11 = [v7 dictionaryWithObjects:v8 forKeys:v9 count:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)postModifiedNotification
{
  uint64_t v3 = objc_opt_class();
  id v5 = [(EKObject *)self uniqueIdentifier];
  BOOL v4 = [v3 _modifiedNotificationUserInfoWithIdentifier:v5 forRevert:0];
  [(EKEvent *)self postModifiedNotificationWithUserInfo:v4];
}

- (void)postModifiedNotificationWithUserInfo:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"EKEventModifiedNotification" object:self userInfo:v4];
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__EKEvent_postModifiedNotificationWithUserInfo___block_invoke;
    v6[3] = &unk_1E5B97140;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __48__EKEvent_postModifiedNotificationWithUserInfo___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"EKEventModifiedNotification" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (BOOL)needsGeocoding
{
  id v2 = self;
  uint64_t v3 = [(EKObject *)self eventStore];
  LOBYTE(v2) = [v3 needsGeocodingForEvent:v2];

  return (char)v2;
}

- (void)setNeedsGeocoding:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(EKObject *)self eventStore];
  [v5 setNeedsGeocoding:v3 forEvent:self];
}

- (id)committedValueForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4F56D00]])
  {
    id v5 = [(EKEvent *)self originalOccurrenceStartDate];
LABEL_5:
    id v6 = v5;
    id v7 = [v5 date];

    goto LABEL_7;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F56FB0]])
  {
    id v5 = [(EKEvent *)self originalOccurrenceEndDate];
    goto LABEL_5;
  }
  v9.receiver = self;
  v9.super_class = (Class)EKEvent;
  id v7 = [(EKObject *)&v9 committedValueForKey:v4];
LABEL_7:

  return v7;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  [(EKEvent *)self _clearLocationPredictionCacheIfNotFrozen];
  v5.receiver = self;
  v5.super_class = (Class)EKEvent;
  [(EKCalendarItem *)&v5 setTitle:v4];
}

id __16__EKEvent_title__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F1C9A8];
  BOOL v3 = [*(id *)(a1 + 32) calendarScale];
  id v4 = [v2 CalCalendarWithUnsanitizedCalendarIdentifier:v3];

  objc_super v5 = [v4 calendarIdentifier];
  id v6 = (void *)MEMORY[0x1E4F576B0];
  id v7 = [*(id *)(a1 + 32) birthdayContactName];
  uint64_t v8 = [*(id *)(a1 + 32) startDate];
  objc_super v9 = [*(id *)(a1 + 32) _committedStartDate];
  uint64_t v10 = [v6 birthdayStringForContactName:v7 eventDate:v8 birthDate:v9 lunarCalendar:v5];

  return v10;
}

- (BOOL)isPhantom
{
  id v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56C70]];
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setIsPhantom:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56C70]];
}

- (void)setAllDay:(BOOL)allDay
{
  BOOL v3 = allDay;
  if ([(EKEvent *)self isEditable] && [(EKEvent *)self isAllDay] != v3)
  {
    if (![(EKObject *)self isNew] && !self->_originalOccurrenceIsAllDay)
    {
      objc_super v5 = [NSNumber numberWithBool:self->_occurrenceIsAllDay];
      [(EKEvent *)self setOriginalOccurrenceIsAllDay:v5];
    }
    [(EKEvent *)self setOccurrenceIsAllDay:v3];
    v16.receiver = self;
    v16.super_class = (Class)EKEvent;
    [(EKCalendarItem *)&v16 setAllDay:v3];
    if ([(EKEvent *)self isAllDay])
    {
      id v6 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
      [(EKEvent *)self duration];
      if (v7 > 0.0)
      {
        uint64_t v8 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
        objc_super v9 = [(EKEvent *)self effectiveTimeZone];
        uint64_t v10 = [v8 components:254 forDayInTimeZone:v9];

        if (![v10 hour] && !objc_msgSend(v10, "minute") && !objc_msgSend(v10, "second"))
        {
          objc_msgSend(v10, "setDay:", objc_msgSend(v10, "day") - 1);
          uint64_t v11 = [v10 date];

          id v6 = (void *)v11;
        }
      }
      uint64_t v12 = [(EKEvent *)self startDate];
      [(EKEvent *)self _updateStartDateForDate:v12 withAdjustmentMode:0];

      [(EKEvent *)self _updateEndDateForDate:v6 withAdjustmentMode:0];
      [(EKEvent *)self forceSetTimeZone:0];
    }
    else
    {
      uint64_t v13 = [(EKEvent *)self occurrenceStartDate];
      id v14 = [v13 timeZone];
      [(EKEvent *)self forceSetTimeZone:v14];

      uint64_t v15 = [(EKEvent *)self startDate];
      [(EKEvent *)self _updateStartDateForDate:v15 withAdjustmentMode:0];

      id v6 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
      [(EKEvent *)self _updateEndDateForDate:v6 withAdjustmentMode:0];
    }

    [(EKEvent *)self updateDefaultAlarms];
    +[EKAlarmUtils adjustRelativeAlarmsForEvent:self whenConvertingToIsAllDay:v3];
    [(EKEvent *)self clearCachedTimeValues];
  }
}

- (void)updateDefaultAlarms
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v3 = [(EKCalendarItem *)self alarms];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 isDefaultAlarm] && (objc_msgSend(v8, "isAbsolute") & 1) == 0)
        {
          objc_super v9 = [(EKEvent *)self _defaultAlarmOffset];
          uint64_t v10 = v9;
          if (v9)
          {
            [v9 doubleValue];
            if (v11 != 9.22337204e18)
            {
              [v10 doubleValue];
              objc_msgSend(v8, "setRelativeOffset:");
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)_updateRecurrenceEndDatesWithAdjustmentMode:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = self;
  uint64_t v6 = [(EKCalendarItem *)self recurrenceRules];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v12 = [v11 recurrenceEnd];
        long long v13 = [v12 endDate];

        if (v13)
        {
          long long v14 = [(EKEvent *)v5 adjustedPersistedDateForDate:v13 withAdjustmentMode:a3 pinMode:1 clientCalendarDate:0];
          long long v15 = +[EKRecurrenceEnd recurrenceEndWithEndDate:v14];
          [v11 setRecurrenceEnd:v15];
        }
        [v4 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  [(EKEvent *)v5 setRecurrenceRules:v4];
}

- (EKCalendarDate)startCalendarDateIncludingTravelTime
{
  BOOL v3 = (void *)MEMORY[0x1E4F57838];
  uint64_t v4 = [(EKEvent *)self startDateIncludingTravel];
  uint64_t v5 = [(EKCalendarItem *)self timeZone];
  uint64_t v6 = [v3 calendarDateWithDate:v4 timeZone:v5];

  return (EKCalendarDate *)v6;
}

- (void)setStartDateRaw:(id)a3
{
  [(EKObject *)self setSingleChangedValue:a3 forKey:*MEMORY[0x1E4F56D00]];

  [(EKEvent *)self clearCachedTimeValues];
}

- (id)_committedEndDate
{
  uint64_t v2 = *MEMORY[0x1E4F56FB0];
  v5.receiver = self;
  v5.super_class = (Class)EKEvent;
  BOOL v3 = [(EKObject *)&v5 committedValueForKey:v2];

  return v3;
}

- (NSDateComponents)startDateComponents
{
  BOOL v3 = [(EKEvent *)self isAllDay];
  occurrenceStartDate = self->_occurrenceStartDate;
  if (v3) {
    [(EKCalendarDate *)occurrenceStartDate dayComponents];
  }
  else {
  objc_super v5 = [(EKCalendarDate *)occurrenceStartDate allComponents];
  }
  if ([(EKEvent *)self isFloating]) {
    [v5 setTimeZone:0];
  }

  return (NSDateComponents *)v5;
}

- (void)setStartDateComponentsPreservingDuration:(id)a3
{
  id v26 = a3;
  int v4 = [v26 CalHasTimeComponents];
  char v5 = v4;
  uint64_t v6 = v4 ^ 1u;
  uint64_t v7 = [MEMORY[0x1E4F57710] shared];
  [v7 defaultEventDuration];
  double v9 = v8;

  if ([(EKEvent *)self isAllDay])
  {
    uint64_t v10 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
    double v11 = [v10 dateByAddingTimeInterval:1.0];

    long long v12 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    long long v13 = [MEMORY[0x1E4F1C9A8] CalGregorianCalendarForTimeZone:v12];
    long long v14 = [(EKEvent *)self startDate];
    long long v15 = [v13 components:16 fromDate:v14 toDate:v11 options:0];

    uint64_t v16 = [v15 day];
  }
  else
  {
    [(EKEvent *)self duration];
    double v9 = v17;
    uint64_t v16 = 1;
  }
  long long v18 = [v26 timeZone];
  long long v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  }
  uint64_t v21 = v20;
  uint64_t v22 = [MEMORY[0x1E4F1C9A8] CalGregorianCalendarForTimeZone:v20];
  uint64_t v23 = [v22 dateFromComponents:v26];
  [(EKEvent *)self setAllDay:v6];
  [(EKEvent *)self setTimeZone:v19];
  [(EKEvent *)self setStartDate:v23];
  if (v5)
  {
    uint64_t v24 = [v23 dateByAddingTimeInterval:v9];
  }
  else
  {
    uint64_t v25 = [v22 dateByAddingUnit:16 value:v16 toDate:v23 options:0];
    uint64_t v24 = [v25 dateByAddingTimeInterval:-1.0];
  }
  [(EKEvent *)self setEndDateUnadjustedForLegacyClients:v24];
}

- (void)setStartDate:(NSDate *)startDate
{
}

- (void)overrideStartDate:(id)a3
{
}

- (void)overrideEndDate:(id)a3
{
}

- (id)_pinDate:(id)a3 withPinMode:(unint64_t)a4
{
  id v6 = a3;
  if ([(EKEvent *)self isAllDay])
  {
    if (a4 == 1)
    {
      uint64_t v7 = [(EKEvent *)self effectiveTimeZone];
      uint64_t v8 = objc_msgSend(v6, "ek_ios_dateForEndOfDayInTimeZone:", v7);
      goto LABEL_8;
    }
    if (!a4)
    {
      uint64_t v7 = [(EKEvent *)self effectiveTimeZone];
      uint64_t v8 = [v6 dateForDayInTimeZone:v7];
LABEL_8:
      double v11 = (void *)v8;

      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Invalid pin mode: %d", a4);
  }
  else if (v6)
  {
    double v9 = (void *)MEMORY[0x1E4F1C9C8];
    [v6 timeIntervalSinceReferenceDate];
    double v11 = [v9 dateWithTimeIntervalSinceReferenceDate:floor(v10)];
    goto LABEL_11;
  }
  double v11 = 0;
LABEL_11:

  return v11;
}

- (void)_updateStartDateForDate:(id)a3 withAdjustmentMode:(unint64_t)a4
{
}

- (void)_updateStartDateForDate:(id)a3 withAdjustmentMode:(unint64_t)a4 adjustEndDate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (![(EKObject *)self isNew] && !self->_originalOccurrenceStartDate)
  {
    double v9 = [(EKEvent *)self occurrenceStartDate];
    [(EKEvent *)self setOriginalOccurrenceStartDate:v9];

    double v10 = [(EKEvent *)self occurrenceEndDate];
    [(EKEvent *)self setOriginalOccurrenceEndDate:v10];
  }
  id v16 = 0;
  double v11 = [(EKEvent *)self adjustedPersistedDateForDate:v8 withAdjustmentMode:a4 pinMode:0 clientCalendarDate:&v16];
  id v12 = v16;
  [(EKEvent *)self setOccurrenceStartDate:v12];
  [(EKEvent *)self setStartDateRaw:v11];
  if (v5 && ![(EKEvent *)self isEndDateDirty])
  {
    long long v13 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
    long long v14 = [(EKEvent *)self adjustedPersistedDateForDate:v13 withAdjustmentMode:a4 pinMode:1 clientCalendarDate:0];

    long long v15 = [(EKObject *)self changeSet];
    [v15 forceChangeValue:v14 forKey:*MEMORY[0x1E4F56FB0]];
  }
}

- (void)_setStartDate:(id)a3 andClearProposedTimes:(BOOL)a4 allowSettingIfNotEditable:(BOOL)a5
{
  BOOL v6 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a5 || [(EKEvent *)self isEditable])
  {
    double v9 = [(EKEvent *)self startDate];
    char v10 = [v9 isEqual:v8];

    if ((v10 & 1) == 0)
    {
      [(EKEvent *)self _updateStartDateForDate:v8 withAdjustmentMode:0];
      if (v6)
      {
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        double v11 = [(EKCalendarItem *)self attendees];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v18;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v18 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
              [v16 setProposedStartDate:0 forEvent:self];
              [v16 setProposedStartDateChanged:0];
              [v16 setCommentChanged:0];
              [v16 setStatusChanged:0];
              [v16 setProposedStartDateStatus:0];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
          }
          while (v13);
        }
      }
    }
  }
}

- (double)durationIncludingTravel
{
  [(EKEvent *)self duration];
  double v4 = v3;
  [(EKEvent *)self travelTime];
  return v4 + v5;
}

- (void)setEndDateRaw:(id)a3
{
  [(EKObject *)self setSingleChangedValue:a3 forKey:*MEMORY[0x1E4F56FB0]];

  [(EKEvent *)self clearCachedTimeValues];
}

- (void)setEndDateUnadjustedForLegacyClients:(id)a3
{
}

- (void)_setEndDateUnadjustedForLegacyClients:(id)a3 allowSettingIfNotEditable:(BOOL)a4
{
  id v8 = a3;
  if (a4 || [(EKEvent *)self isEditable])
  {
    BOOL v6 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
    char v7 = [v6 isEqual:v8];

    if ((v7 & 1) == 0) {
      [(EKEvent *)self _updateEndDateForDate:v8 withAdjustmentMode:0];
    }
  }
}

- (void)_updateEndDateForDate:(id)a3 withAdjustmentMode:(unint64_t)a4
{
}

- (void)_updateEndDateForDate:(id)a3 withAdjustmentMode:(unint64_t)a4 adjustStartDate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (![(EKObject *)self isNew] && !self->_originalOccurrenceEndDate)
  {
    double v9 = [(EKEvent *)self occurrenceStartDate];
    [(EKEvent *)self setOriginalOccurrenceStartDate:v9];

    char v10 = [(EKEvent *)self occurrenceEndDate];
    [(EKEvent *)self setOriginalOccurrenceEndDate:v10];
  }
  id v18 = 0;
  double v11 = [(EKEvent *)self adjustedPersistedDateForDate:v8 withAdjustmentMode:a4 pinMode:1 clientCalendarDate:&v18];
  id v12 = v18;
  [(EKEvent *)self setOccurrenceEndDate:v12];
  uint64_t v13 = [(EKEvent *)self endDateRaw];
  char v14 = [v13 isEqual:v11];

  if ((v14 & 1) == 0)
  {
    [(EKEvent *)self setEndDateRaw:v11];
    if (v5 && ![(EKEvent *)self isStartDateDirty])
    {
      long long v15 = [(EKEvent *)self startDate];
      id v16 = [(EKEvent *)self adjustedPersistedDateForDate:v15 withAdjustmentMode:a4 pinMode:0 clientCalendarDate:0];

      long long v17 = [(EKObject *)self changeSet];
      [v17 forceChangeValue:v16 forKey:*MEMORY[0x1E4F56D00]];
    }
  }
}

- (void)forceSetTimeZone:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)EKEvent;
  [(EKCalendarItem *)&v3 setTimeZone:a3];
}

- (void)setTimeZone:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(EKCalendarItem *)self timeZone];
  if ([(EKEvent *)self isEditable])
  {
    v18.receiver = self;
    v18.super_class = (Class)EKEvent;
    [(EKCalendarItem *)&v18 setTimeZone:v4];
    if (v4)
    {
      if ([(EKEvent *)self isAllDay])
      {
        if (![(EKObject *)self isNew] && !self->_originalOccurrenceIsAllDay)
        {
          BOOL v6 = [NSNumber numberWithBool:self->_occurrenceIsAllDay];
          [(EKEvent *)self setOriginalOccurrenceIsAllDay:v6];
        }
        [(EKEvent *)self setOccurrenceIsAllDay:0];
        char v7 = [NSNumber numberWithBool:0];
        [(EKObject *)self setSingleChangedValue:v7 forKey:*MEMORY[0x1E4F56C38]];
      }
      if (v5)
      {
        if (![(EKEvent *)self _settingTimeZoneChangesStartEndDates]) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
      BOOL v8 = 0;
    }
    else
    {
      BOOL v8 = v5 != 0;
    }
    double v9 = [(EKEvent *)self startDate];
    [(EKEvent *)self _updateStartDateForDate:v9 withAdjustmentMode:0];

    char v10 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
    [(EKEvent *)self _updateEndDateForDate:v10 withAdjustmentMode:0];

    if ([(EKEvent *)self _settingTimeZoneChangesStartEndDates])
    {
      if (!v8)
      {
        double v11 = [(EKObject *)self eventStore];
        uint64_t v12 = [v11 timeZone];

        BOOL v5 = (void *)v12;
      }
LABEL_16:
      uint64_t v13 = [(EKEvent *)self effectiveTimeZone];
      char v14 = [(EKEvent *)self startDate];
      long long v15 = [v14 dateInTimeZone:v13 fromTimeZone:v5];

      [(EKEvent *)self setStartDate:v15];
      id v16 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
      long long v17 = [v16 dateInTimeZone:v13 fromTimeZone:v5];

      [(EKEvent *)self setEndDateUnadjustedForLegacyClients:v17];
    }
  }
LABEL_17:
}

- (BOOL)_settingTimeZoneChangesStartEndDates
{
  return 0;
}

- (void)setOriginalStartDate:(id)a3
{
}

- (NSDate)initialStartDate
{
  if ([(EKObject *)self isNew])
  {
    objc_super v3 = [(EKEvent *)self startDate];
  }
  else
  {
    id v4 = [(EKObject *)self _previousValueForKey:*MEMORY[0x1E4F56D00]];
    BOOL v5 = [(EKEvent *)self originalOccurrenceIsAllDay];
    if (v5)
    {
      BOOL v6 = [(EKEvent *)self originalOccurrenceIsAllDay];
      unsigned int v7 = [v6 BOOLValue];
    }
    else
    {
      unsigned int v7 = [(EKEvent *)self occurrenceIsAllDay];
    }

    BOOL v8 = [(EKObject *)self _previousValueForKey:*MEMORY[0x1E4F56D08]];
    double v9 = [(id)objc_opt_class() timeZoneFromTimeZoneName:v8 withFloatingTimeZone:0];

    if (v9) {
      uint64_t v10 = v7;
    }
    else {
      uint64_t v10 = 1;
    }
    id v13 = 0;
    [(EKEvent *)self adjustedDatesForDate:v4 persistedDateIsInUTC:v10 withAdjustmentMode:1 pinMode:0 outClientCalendarDate:&v13 outPersistedDate:0];
    id v11 = v13;
    objc_super v3 = [v11 date];
  }

  return (NSDate *)v3;
}

- (NSDate)initialEndDate
{
  if ([(EKObject *)self isNew])
  {
    objc_super v3 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
  }
  else
  {
    id v4 = [(EKObject *)self _previousValueForKey:*MEMORY[0x1E4F56FB0]];
    BOOL v5 = [(EKEvent *)self originalOccurrenceIsAllDay];
    if (v5)
    {
      BOOL v6 = [(EKEvent *)self originalOccurrenceIsAllDay];
      unsigned int v7 = [v6 BOOLValue];
    }
    else
    {
      unsigned int v7 = [(EKEvent *)self occurrenceIsAllDay];
    }

    BOOL v8 = [(EKObject *)self _previousValueForKey:*MEMORY[0x1E4F56D08]];
    double v9 = [(id)objc_opt_class() timeZoneFromTimeZoneName:v8 withFloatingTimeZone:0];

    if (v9) {
      uint64_t v10 = v7;
    }
    else {
      uint64_t v10 = 1;
    }
    id v13 = 0;
    [(EKEvent *)self adjustedDatesForDate:v4 persistedDateIsInUTC:v10 withAdjustmentMode:1 pinMode:1 outClientCalendarDate:&v13 outPersistedDate:0];
    id v11 = v13;
    objc_super v3 = [v11 date];
  }

  return (NSDate *)v3;
}

- (BOOL)isMasterOrDetachedOccurrence
{
  if ([(EKObject *)self isNew] || self->_isMainOccurrence) {
    return 1;
  }

  return [(EKEvent *)self isDetached];
}

- (EKCalendarDate)originalOccurrenceEndDate
{
  originalOccurrenceEndDate = self->_originalOccurrenceEndDate;
  if (originalOccurrenceEndDate)
  {
    objc_super v3 = originalOccurrenceEndDate;
  }
  else
  {
    objc_super v3 = [(EKEvent *)self occurrenceEndDate];
  }

  return v3;
}

- (NSDate)occurrenceDate
{
  uint64_t v2 = [(EKEvent *)self occurrenceStartDate];
  objc_super v3 = [v2 date];

  return (NSDate *)v3;
}

- (void)setStatus:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F57028]];
}

- (void)setLocationPredictionState:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56FE8]];
}

- (BOOL)firedTTL
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56FC0]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setFiredTTL:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56FC0]];
}

- (BOOL)_isParticipationStatusDirty
{
  uint64_t v2 = [(EKCalendarItem *)self selfAttendee];
  char v3 = [v2 _isParticipantStatusDirty];

  return v3;
}

- (BOOL)_isOnlyChangeToAttendeesSelfAttendeeParticipationStatus
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  char v3 = [(EKCalendarItem *)self selfAttendee];
  if (v3)
  {
    id v4 = [(EKObject *)self _previousValueForKey:*MEMORY[0x1E4F56C88]];
    if (v4)
    {
      BOOL v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F56B78], *MEMORY[0x1E4F56B70], 0);
      BOOL v6 = 0;
      if (+[EKObject _compareAllKnownKeysExceptKeys:v5 forObject:v3 againstObject:v4 compareIdentityKeys:0])
      {
        unsigned int v7 = [(EKObject *)self changeSet];
        char v8 = [v7 hasUnsavedMultiValueRemovalForKey:*MEMORY[0x1E4F56BA8]];

        if (v8)
        {
          BOOL v6 = 0;
        }
        else
        {
          [(EKCalendarItem *)self attendeesRaw];
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          id v9 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v17;
            while (2)
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v17 != v12) {
                  objc_enumerationMutation(v9);
                }
                char v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
                if (v14 != v3 && ([v14 hasChanges] & 1) != 0)
                {
                  BOOL v6 = 0;
                  goto LABEL_19;
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }
          BOOL v6 = 1;
LABEL_19:
        }
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setParticipationStatus:(int64_t)a3
{
  if (![(EKEvent *)self allowsParticipationStatusModifications]) {
    return;
  }
  BOOL v5 = [(EKCalendarItem *)self selfAttendee];
  if (!v5) {
    goto LABEL_16;
  }
  id v12 = v5;
  BOOL v6 = [v5 participantStatus] == a3;
  BOOL v5 = v12;
  if (v6) {
    goto LABEL_16;
  }
  [v12 setParticipantStatus:a3];
  [(EKCalendarItem *)self setModifiedProperties:[(EKCalendarItem *)self modifiedProperties] | 0x40];
  if (a3 == 3)
  {
    uint64_t v7 = 1;
  }
  else
  {
    char v8 = objc_opt_class();
    id v9 = [(EKCalendarItem *)self calendar];
    uint64_t v7 = objc_msgSend(v8, "_eventAvailabilityForParticipantStatus:supportedEventAvailabilities:isAllDayEvent:", a3, objc_msgSend(v9, "supportedEventAvailabilities"), -[EKEvent isAllDay](self, "isAllDay"));

    if (v7 == -1
      || [(EKEvent *)self isAllDay]
      && [(EKEvent *)self availability] != EKEventAvailabilityFree)
    {
      goto LABEL_11;
    }
  }
  [(EKEvent *)self setAvailability:v7];
LABEL_11:
  uint64_t v10 = [(EKCalendarItem *)self calendar];
  uint64_t v11 = [v10 source];
  if ([v11 sourceType] != 1)
  {

    goto LABEL_15;
  }

  BOOL v5 = v12;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    [(EKEvent *)self setProposedStartDate:0];
LABEL_15:
    BOOL v5 = v12;
  }
LABEL_16:
}

- (BOOL)supportsParticipationStatusModificationsWithoutNotification
{
  id v4 = [(EKCalendarItem *)self organizer];
  if (v4)
  {
    uint64_t v2 = [(EKCalendarItem *)self organizer];
    if ([v2 scheduleAgent] == 1)
    {
      BOOL v5 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  BOOL v6 = [(EKEvent *)self constraints];
  if ([v6 supportsInvitationModificationsWithoutNotification])
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v7 = [(EKCalendarItem *)self calendar];
    char v8 = [v7 source];
    BOOL v5 = [v8 sourceType] == 0;
  }
  if (v4) {
    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (BOOL)_userAddressesRepresentInvitedAttendee:(id)a3 checkEmailAddresses:(BOOL)a4
{
  BOOL v35 = a4;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [MEMORY[0x1E4F1CA80] set];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v40 + 1) + 8 * i) stringRemovingMailto];
        id v13 = [v12 lowercaseString];
        [v6 addObject:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v9);
  }

  char v14 = [(EKCalendarItem *)self organizer];
  long long v15 = [v14 URL];
  long long v16 = [v15 absoluteString];
  long long v17 = [v16 stringRemovingMailto];
  long long v18 = [v17 lowercaseString];

  if ([v6 containsObject:v18])
  {
    BOOL v19 = 0;
  }
  else
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = [(EKCalendarItem *)self attendees];
    uint64_t v20 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v33 = v18;
      uint64_t v22 = *(void *)v37;
      while (2)
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void **)(*((void *)&v36 + 1) + 8 * j);
          uint64_t v25 = [v24 URL];
          id v26 = [v25 absoluteString];
          uint64_t v27 = [v26 stringRemovingMailto];
          uint64_t v28 = [v27 lowercaseString];

          if (v28 && ([v6 containsObject:v28] & 1) != 0) {
            goto LABEL_26;
          }
          if (v35)
          {
            uint64_t v29 = [v24 emailAddress];
            uint64_t v30 = [v29 stringRemovingMailto];
            uint64_t v31 = [v30 lowercaseString];

            if (v31 && ([v6 containsObject:v31] & 1) != 0)
            {

LABEL_26:
              BOOL v19 = 1;
              goto LABEL_27;
            }
          }
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v21) {
          continue;
        }
        break;
      }
      BOOL v19 = 0;
LABEL_27:
      long long v18 = v33;
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  return v19;
}

- (BOOL)isCurrentUserInvitedAttendee
{
  if (![(EKCalendarItem *)self isExternallyOrganizedInvitation]) {
    return 0;
  }
  char v3 = [(EKCalendarItem *)self selfAttendee];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)currentUserMayActAsOrganizer
{
  char v3 = [(EKCalendarItem *)self calendar];
  int v4 = [v3 allowsContentModifications];

  if (!v4) {
    return 0;
  }
  if ([(EKCalendarItem *)self isSelfOrganized]) {
    return 1;
  }
  BOOL v6 = [(EKCalendarItem *)self calendar];
  if ([v6 allowsScheduling])
  {
    id v7 = [(EKCalendarItem *)self calendar];
    BOOL v5 = [v7 sharingStatus] == 2
      && [(EKCalendarItem *)self isOrganizedBySharedCalendarOwner];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)markEventAsAttendeeForward
{
  uint64_t v3 = [(EKCalendarItem *)self modifiedProperties] | 0x800;

  [(EKCalendarItem *)self setModifiedProperties:v3];
}

+ (int64_t)_eventAvailabilityForParticipantStatus:(int64_t)a3 supportedEventAvailabilities:(unint64_t)a4 isAllDayEvent:(BOOL)a5
{
  int64_t v5 = -1;
  if (a4) {
    int64_t v5 = 1;
  }
  unint64_t v6 = -1;
  if (a3 == 4) {
    unint64_t v6 = (a4 >> 1) & 2;
  }
  if (a3 == 2) {
    unint64_t v6 = 0;
  }
  if (a5) {
    unint64_t v6 = v5;
  }
  if (a4) {
    return v6;
  }
  else {
    return v5;
  }
}

- (int64_t)_parentParticipationStatus
{
  uint64_t v2 = [(EKCalendarItem *)self originalItem];
  uint64_t v3 = v2;
  if (v2) {
    int64_t v4 = [v2 participationStatus];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (EKImage)image
{
  return (EKImage *)[(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F56FC8]];
}

- (void)setImage:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F56FC8];
  id v5 = a3;
  [(EKObject *)self updateMeltedAndCachedSingleRelationObject:v5 forKey:v4 frozenClass:objc_opt_class()];
}

- (EKColor)color
{
  return (EKColor *)[(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F56F80]];
}

- (void)setColor:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F56F80];
  id v5 = a3;
  [(EKObject *)self updateMeltedAndCachedSingleRelationObject:v5 forKey:v4 frozenClass:objc_opt_class()];
}

- (id)birthdayID
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56F70]];
}

- (NSInteger)birthdayPersonID
{
  uint64_t v2 = [(EKEvent *)self birthdayID];
  uint64_t v3 = v2;
  if (v2) {
    NSInteger v4 = [v2 integerValue];
  }
  else {
    NSInteger v4 = -1;
  }

  return v4;
}

- (void)setBirthdayContactIdentifier:(id)a3
{
}

- (NSString)birthdayContactName
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56F68]];
}

- (void)setBirthdayContact:(id)a3
{
  id v4 = a3;
  id v5 = [v4 CalDisplayName];
  [(EKObject *)self setSingleChangedValue:v5 forKey:*MEMORY[0x1E4F56F68]];

  id v6 = [v4 identifier];

  [(EKEvent *)self setBirthdayContactIdentifier:v6];
}

- (id)recurrenceRule
{
  if ([(EKCalendarItem *)self hasRecurrenceRules])
  {
    uint64_t v3 = [(EKCalendarItem *)self recurrenceRules];
    id v4 = [v3 objectAtIndex:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setRecurrenceRule:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v5, 0);
    [(EKEvent *)self setRecurrenceRules:v4];
  }
  else
  {
    [(EKEvent *)self setRecurrenceRules:0];
  }
}

- (void)setRecurrenceRules:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKEvent;
  [(EKCalendarItem *)&v4 setRecurrenceRules:a3];
  [(EKEvent *)self clearNextCachedReminderOccurrenceDate];
}

- (id)singleRecurrenceRule
{
  if ([(EKEvent *)self isDetached])
  {
    uint64_t v3 = [(EKCalendarItem *)self originalItem];
    objc_super v4 = [v3 singleRecurrenceRule];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)EKEvent;
    objc_super v4 = [(EKCalendarItem *)&v6 singleRecurrenceRule];
  }

  return v4;
}

- (void)makeRecurrenceEndDateBased
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(EKCalendarItem *)self recurrenceRules];
  objc_super v4 = [v3 lastObject];

  if (v4)
  {
    id v5 = [v4 recurrenceEnd];
    objc_super v6 = [v5 endDate];

    if (!v6)
    {
      id v7 = [(EKEvent *)self _lastRecurrenceDate];
      uint64_t v8 = [MEMORY[0x1E4F1C9A8] sharedAutoupdatingCurrentCalendar];
      uint64_t v9 = (void *)[v8 copy];

      uint64_t v10 = [(EKEvent *)self effectiveTimeZone];
      [v9 setTimeZone:v10];

      uint64_t v11 = [v7 dateByAddingDays:1 inCalendar:v9];

      id v12 = [v11 dateRemovingTimeComponentsInCalendar:v9];

      objc_super v6 = [v12 dateByAddingTimeInterval:-1.0];
    }
    id v13 = +[EKRecurrenceEnd recurrenceEndWithEndDate:v6];
    [v4 setRecurrenceEnd:v13];
    v15[0] = v4;
    char v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [(EKEvent *)self setRecurrenceRules:v14];
  }
}

- (id)_occurrenceDatesForCount:(unint64_t)a3
{
  id v5 = [(EKEvent *)self masterEvent];
  objc_super v6 = [v5 startDate];
  id v7 = [(EKEvent *)self _adjustDateIfFloatingForDate:v6];

  uint64_t v8 = objc_alloc_init(EKRecurrenceGenerator);
  uint64_t v9 = [(EKCalendarItem *)self recurrenceRules];
  uint64_t v10 = [v9 lastObject];
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v12 = [(EKEvent *)self effectiveTimeZone];
  LOBYTE(v15) = 0;
  id v13 = [(EKRecurrenceGenerator *)v8 copyOccurrenceDatesWithEKEvent:self recurrenceRule:v10 startDate:v7 endDate:v11 timeZone:v12 exceptionDates:0 limit:a3 adjustDatesForAllDayEvents:v15];

  return v13;
}

- (id)_lastRecurrenceDate
{
  uint64_t v3 = [(EKCalendarItem *)self recurrenceRules];
  objc_super v4 = [v3 lastObject];

  id v5 = [v4 recurrenceEnd];
  uint64_t v6 = [v5 occurrenceCount];

  if (v6)
  {
    id v7 = [v4 recurrenceEnd];
    uint64_t v8 = -[EKEvent _occurrenceDatesForCount:](self, "_occurrenceDatesForCount:", [v7 occurrenceCount]);

    [v8 lastObject];
  }
  else
  {
    uint64_t v8 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
    [(EKEvent *)self _adjustDateIfFloatingForDate:v8];
  uint64_t v9 = };

  return v9;
}

- (id)_adjustDateIfFloatingForDate:(id)a3
{
  id v4 = a3;
  if ([(EKEvent *)self isFloating])
  {
    id v5 = [(EKEvent *)self effectiveTimeZone];
    id v6 = [v4 dateInTimeZone:0 fromTimeZone:v5];
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (void)makeRecurrenceEndCountBased
{
  v27[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(EKEvent *)self singleRecurrenceRule];
  id v4 = v3;
  if (!v3) {
    goto LABEL_18;
  }
  id v5 = [v3 recurrenceEnd];
  unint64_t v6 = [v5 occurrenceCount];

  if (!v6)
  {
    id v7 = [v4 recurrenceEnd];
    uint64_t v8 = [v7 endDate];
    if (v8)
    {

LABEL_7:
      uint64_t v10 = [(EKEvent *)self masterEvent];
      uint64_t v11 = [v10 startDate];
      id v12 = [(EKEvent *)self _adjustDateIfFloatingForDate:v11];

      if (v12)
      {
        id v13 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
        char v14 = [(EKEvent *)self _adjustDateIfFloatingForDate:v13];

        uint64_t v15 = [v4 recurrenceEnd];
        uint64_t v16 = [v15 endDate];
        long long v17 = (void *)v16;
        if (v16) {
          long long v18 = (void *)v16;
        }
        else {
          long long v18 = v14;
        }
        id v19 = v18;

        uint64_t v20 = objc_alloc_init(EKRecurrenceGenerator);
        uint64_t v21 = [(EKEvent *)self effectiveTimeZone];
        LOBYTE(v26) = 0;
        id v22 = [(EKRecurrenceGenerator *)v20 copyOccurrenceDatesWithEKEvent:self recurrenceRule:v4 startDate:v12 endDate:v19 timeZone:v21 exceptionDates:0 limit:0 adjustDatesForAllDayEvents:v26];

        unint64_t v6 = [v22 count];
      }
      else
      {
        unint64_t v6 = 0;
      }

      goto LABEL_14;
    }
    BOOL v9 = [(EKEvent *)self isMainOccurrence];

    if (!v9) {
      goto LABEL_7;
    }
    unint64_t v6 = 0;
  }
LABEL_14:
  if (v6 <= 1) {
    uint64_t v23 = 1;
  }
  else {
    uint64_t v23 = v6;
  }
  uint64_t v24 = +[EKRecurrenceEnd recurrenceEndWithOccurrenceCount:v23];
  [v4 setRecurrenceEnd:v24];
  v27[0] = v4;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  [(EKEvent *)self setRecurrenceRules:v25];

LABEL_18:
}

- (BOOL)canWeInferUpdateToComplexRecurrenceRule
{
  if ([(EKCalendarItem *)self hasComplexRecurrence])
  {
    uint64_t v3 = [(EKEvent *)self singleRecurrenceRule];
    id v4 = [v3 daysOfTheYear];
    if ([v4 count])
    {
      BOOL v5 = 0;
LABEL_4:

LABEL_11:
      return v5;
    }
    unint64_t v6 = [v3 weeksOfTheYear];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      BOOL v5 = 0;
      goto LABEL_11;
    }
    if (![v3 frequency] || objc_msgSend(v3, "frequency") == 1)
    {
      BOOL v5 = 1;
      goto LABEL_11;
    }
    id v4 = [v3 daysOfTheWeek];
    BOOL v9 = [v3 daysOfTheMonth];
    uint64_t v10 = [v3 setPositions];
    uint64_t v11 = [v3 monthsOfTheYear];
    if ([v3 frequency] == 2)
    {
      if ([v9 count] && !objc_msgSend(v10, "count")
        || [v4 count] == 1 && objc_msgSend(v10, "count") == 1
        || [v4 count] == 7 && objc_msgSend(v10, "count") == 1)
      {
        BOOL v5 = 1;
LABEL_25:

        goto LABEL_4;
      }
    }
    else if ([v3 frequency] == 3 {
           && ![v10 count]
    }
           && (unint64_t)[v4 count] <= 1)
    {
      BOOL v5 = [v11 count] != 0;
      goto LABEL_25;
    }
    BOOL v5 = 0;
    goto LABEL_25;
  }
  return 1;
}

- (BOOL)hasADateChangeAndComplexRecurrenceWeDontKnowHowToUpdate
{
  if (![(EKEvent *)self isStartDateDirty]) {
    return 0;
  }
  if (![(EKCalendarItem *)self hasComplexRecurrence]) {
    return 0;
  }
  uint64_t v3 = [(EKEvent *)self startDate];
  id v4 = [(EKEvent *)self occurrenceStartDate];
  BOOL v5 = [v4 timeZone];
  BOOL v6 = [(EKEvent *)self _occurrenceExistsOnDate:v3 timeZone:v5];

  if (v6) {
    return 0;
  }

  return [(EKEvent *)self canWeInferUpdateToComplexRecurrenceRule];
}

- (BOOL)hasCustomRecurrence
{
  uint64_t v3 = [(EKEvent *)self singleRecurrenceRule];
  id v4 = [MEMORY[0x1E4F1C9A8] sharedAutoupdatingCurrentCalendar];
  BOOL v5 = [(EKCalendarItem *)self timeZone];
  [v4 setTimeZone:v5];

  if (!v3) {
    goto LABEL_4;
  }
  BOOL v6 = [(EKEvent *)self startDate];

  if (v6)
  {
    if ([v3 isPinnedToEndOfFrequency])
    {
LABEL_4:
      LOBYTE(v6) = 0;
      goto LABEL_30;
    }
    uint64_t v7 = [(EKEvent *)self startDate];
    uint64_t v8 = [v4 components:536 fromDate:v7];

    if ([v3 frequency])
    {
      if ([v3 frequency] == 1)
      {
        if ([v3 interval] == 1)
        {
          BOOL v9 = [v3 daysOfTheWeek];
          BOOL v6 = v9;
          if (v9)
          {
            if ([v9 count] == 1)
            {
              uint64_t v10 = [v6 objectAtIndexedSubscript:0];
              uint64_t v11 = [v10 dayOfTheWeek];
              uint64_t v12 = [v8 weekday];
              goto LABEL_11;
            }
            goto LABEL_27;
          }
LABEL_29:

          goto LABEL_30;
        }
LABEL_28:
        LOBYTE(v6) = 1;
        goto LABEL_29;
      }
      if ([v3 frequency] != 2)
      {
        if ([v3 frequency] != 3) {
          goto LABEL_28;
        }
        if ([v3 interval] != 1) {
          goto LABEL_28;
        }
        uint64_t v16 = [v3 daysOfTheWeek];
        uint64_t v17 = [v16 count];

        if (v17) {
          goto LABEL_28;
        }
        long long v18 = [v3 monthsOfTheYear];
        BOOL v6 = v18;
        if (!v18) {
          goto LABEL_29;
        }
        if ([v18 count] == 1)
        {
          uint64_t v10 = [v6 objectAtIndexedSubscript:0];
          uint64_t v11 = [v10 integerValue];
          uint64_t v12 = [v8 month];
LABEL_11:
          uint64_t v13 = v12;

          if (v11 != v13) {
            goto LABEL_28;
          }
          goto LABEL_14;
        }
LABEL_27:

        goto LABEL_28;
      }
      if ([v3 interval] != 1) {
        goto LABEL_28;
      }
      char v14 = [v3 daysOfTheWeek];
      uint64_t v15 = [v14 count];

      if (v15) {
        goto LABEL_28;
      }
      BOOL v6 = [v3 daysOfTheMonth];
      if ([v6 count])
      {
        if ([v6 count] == 1)
        {
          uint64_t v10 = [v6 objectAtIndexedSubscript:0];
          uint64_t v11 = [v10 integerValue];
          uint64_t v12 = [v8 day];
          goto LABEL_11;
        }
        goto LABEL_27;
      }
    }
    else if ([v3 interval] != 1)
    {
      goto LABEL_28;
    }
LABEL_14:
    LOBYTE(v6) = 0;
    goto LABEL_29;
  }
LABEL_30:

  return (char)v6;
}

- (BOOL)futureOccurrencesCannotBeAffectedByChangingStartDateToDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(EKCalendarItem *)self recurrenceRules];
  BOOL v6 = [v5 firstObject];

  if ([v6 hasDuplicateMonthsOfYear])
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v8 = [v6 endDate];
    if ([v4 isAfterDate:v8])
    {
      BOOL v7 = 1;
    }
    else
    {
      BOOL v9 = [(EKEvent *)self startDate];
      uint64_t v10 = [(EKEvent *)self _nsCalendar];
      if ([v6 newStartDateIsInvalid:v4 currentStartDate:v9 calendar:v10]) {
        BOOL v7 = [v6 interval] > 1;
      }
      else {
        BOOL v7 = 0;
      }
    }
  }

  return v7;
}

- (EKEventAvailability)availability
{
  if (![(EKEvent *)self allowsAvailabilityModifications]) {
    return -1;
  }
  uint64_t v3 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56F58]];
  EKEventAvailability v4 = (int)[v3 intValue];

  return v4;
}

- (void)setAvailability:(EKEventAvailability)availability
{
  BOOL v5 = [(EKEvent *)self allowsAvailabilityModifications];
  if (availability != EKEventAvailabilityNotSupported && v5)
  {
    id v6 = [NSNumber numberWithInteger:availability];
    [(EKObject *)self setSingleChangedValue:v6 forKey:*MEMORY[0x1E4F56F58]];
  }
}

- (id)responseComment
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57018]];
}

- (void)setResponseComment:(id)a3
{
}

- (id)_defaultAlarmOffset
{
  BOOL v3 = [(EKEvent *)self isAllDay];
  EKEventAvailability v4 = [(EKCalendarItem *)self calendar];
  BOOL v5 = [v4 source];
  id v6 = v5;
  if (!v3)
  {
    id v7 = [v5 defaultAlarmOffset];
    if (!v7)
    {
      uint64_t v8 = [(EKObject *)self eventStore];
      uint64_t v9 = [v8 defaultTimedAlarmOffset];
      goto LABEL_7;
    }
LABEL_5:
    id v7 = v7;
    uint64_t v10 = v7;
    goto LABEL_8;
  }
  id v7 = [v5 defaultAllDayAlarmOffset];
  if (v7) {
    goto LABEL_5;
  }
  uint64_t v8 = [(EKObject *)self eventStore];
  uint64_t v9 = [v8 defaultAllDayAlarmOffset];
LABEL_7:
  uint64_t v10 = (void *)v9;

LABEL_8:

  return v10;
}

- (BOOL)shouldHaveDefaultAlarms
{
  uint64_t v2 = [(EKEvent *)self _defaultAlarmOffset];
  BOOL v3 = v2;
  if (v2) {
    BOOL v4 = [v2 integerValue] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)defaultAlarm
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v3 = [(EKCalendarItem *)self alarms];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v13 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
      if ([v8 isDefaultAlarm]) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v9 = v8;

    if (v9) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  uint64_t v10 = [(EKEvent *)self defaultAlarms];
  id v9 = [v10 anyObject];

LABEL_12:

  return v9;
}

- (id)defaultAlarms
{
  uint64_t v2 = [(EKEvent *)self _defaultAlarmOffset];
  BOOL v3 = v2;
  if (v2
    && [v2 integerValue] != 0x7FFFFFFFFFFFFFFFLL
    && (+[EKAlarm alarmWithRelativeOffset:](EKAlarm, "alarmWithRelativeOffset:", (double)[v3 integerValue]), uint64_t v4 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v4, "setDefaultAlarm:", 1), v4))
  {
    uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v5;
}

- (NSString)virtualConferenceTextRepresentation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(EKEvent *)self virtualConference];
  BOOL v3 = [MEMORY[0x1E4F28E78] string];
  uint64_t v4 = [v2 title];

  if (v4)
  {
    uint64_t v5 = [v2 title];
    [v3 appendFormat:@"%@\n\n", v5];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v2 joinMethods];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v12 = [v11 title];

        if (v12)
        {
          long long v13 = [v11 title];
          [v3 appendFormat:@"%@\n", v13];
        }
        long long v14 = [v11 URL];
        long long v15 = [v14 absoluteString];
        [v3 appendFormat:@"%@\n\n", v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  uint64_t v16 = [v2 conferenceDetails];

  if (v16)
  {
    uint64_t v17 = [v2 conferenceDetails];
    [v3 appendString:v17];
  }

  return (NSString *)v3;
}

- (id)_originallyCommittedVirtualConference
{
  uint64_t v2 = [(EKEvent *)self committedValueForKey:*MEMORY[0x1E4F56C58]];
  if (v2)
  {
    BOOL v3 = +[EKConferencePersistence deserializeConference:v2];
    uint64_t v4 = [v3 conference];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)setVirtualConference:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(EKEvent *)self virtualConference];
  uint64_t v6 = v5;
  if (v5)
  {
    if (![v5 isWritable]) {
      goto LABEL_21;
    }
    if (v4)
    {
      if (![v4 isWritable])
      {
LABEL_11:
        long long v13 = [(EKEvent *)self _originallyCommittedVirtualConference];
        if (([v13 isEqual:v6] & 1) == 0)
        {
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v14 = objc_msgSend(v6, "joinMethods", 0);
          uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v21;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v21 != v17) {
                  objc_enumerationMutation(v14);
                }
                long long v19 = [*(id *)(*((void *)&v20 + 1) + 8 * i) URL];
                +[EKConferenceUtils invalidateConferenceURL:v19];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
            }
            while (v16);
          }
        }
        goto LABEL_21;
      }
      uint64_t v7 = +[EKConferencePersistence serializeConference:v4];
      uint64_t v8 = [(EKEvent *)self displayNotes];
      uint64_t v9 = [(EKEvent *)self _buildConferenceStringFromNotesWithoutConference:v8 serializedConference:v7];
      [(EKEvent *)self setNotes:v9];
    }
    else
    {
      uint64_t v7 = [(EKEvent *)self displayNotes];
      [(EKEvent *)self setNotes:v7];
    }

    goto LABEL_11;
  }
  if (v4 && [v4 isWritable])
  {
    uint64_t v10 = +[EKConferencePersistence serializeConference:v4];
    uint64_t v11 = [(EKCalendarItem *)self notes];
    long long v12 = [(EKEvent *)self _buildConferenceStringFromNotesWithoutConference:v11 serializedConference:v10];
    [(EKEvent *)self setNotes:v12];
  }
LABEL_21:
}

- (void)invalidateVirtualConferenceURLIfNeededOnCommit:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    virtualConferenceURLsToInvalidateOnCommit = self->_virtualConferenceURLsToInvalidateOnCommit;
    id v9 = v5;
    if (!virtualConferenceURLsToInvalidateOnCommit)
    {
      uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v8 = self->_virtualConferenceURLsToInvalidateOnCommit;
      self->_virtualConferenceURLsToInvalidateOnCommit = v7;

      virtualConferenceURLsToInvalidateOnCommit = self->_virtualConferenceURLsToInvalidateOnCommit;
    }
    id v4 = (id)[(NSMutableArray *)virtualConferenceURLsToInvalidateOnCommit addObject:v9];
    id v5 = v9;
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)clearVirtualConferenceURLsQueuedForInvalidation
{
  self->_virtualConferenceURLsToInvalidateOnCommit = 0;
  MEMORY[0x1F41817F8]();
}

- (void)invalidateRemovedVirtualConferences
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = self->_virtualConferenceURLsToInvalidateOnCommit;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        id v9 = [(EKObject *)self eventStore];
        +[EKConferenceUtils invalidateConferenceURLIfNeeded:v8 inEventStore:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)_buildConferenceStringFromNotesWithoutConference:(id)a3 serializedConference:(id)a4
{
  id v5 = a4;
  if (a3) {
    uint64_t v6 = (__CFString *)a3;
  }
  else {
    uint64_t v6 = &stru_1EF932508;
  }
  uint64_t v7 = [MEMORY[0x1E4F28E78] stringWithString:v6];
  if ([v7 length]
    && [v5 length]
    && ([v7 hasSuffix:@"\n\n"] & 1) == 0)
  {
    [v7 appendString:@"\n\n"];
  }
  if ([v5 length]) {
    [v7 appendString:v5];
  }

  return v7;
}

- (void)setSpecialDayType:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 3)
    {
      BOOL v3 = (int64_t *)MEMORY[0x1E4FB8078];
    }
    else
    {
      if (a3 != 1) {
        return;
      }
      BOOL v3 = (int64_t *)MEMORY[0x1E4FB8080];
    }
    a3 = *v3;
  }
  [(EKEvent *)self setSpecialDayString:a3];
}

- (id)specialDayString
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57020]];
}

- (void)setSpecialDayString:(id)a3
{
}

- (void)removeServerRefreshRelatedProperties
{
  [(EKCalendarItem *)self setExternalModificationTag:0];

  [(EKCalendarItem *)self setExternalID:0];
}

- (void)setFlags:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56C18]];
}

- (void)setFlag:(unint64_t)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = [(EKEvent *)self flags];
  if (v4) {
    unint64_t v8 = v7 | a3;
  }
  else {
    unint64_t v8 = v7 & ~a3;
  }

  [(EKEvent *)self setFlags:v8];
}

- (void)setInvitationStatus:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56FD8]];
}

- (void)clearInvitationStatus
{
  id v2 = [(EKObject *)self persistentObject];
  [v2 unloadPropertyForKey:*MEMORY[0x1E4F56FD8]];
}

- (NSSet)actions
{
  return (NSSet *)[(EKObject *)self meltedAndCachedMultiRelationObjectsForKey:*MEMORY[0x1E4F56F50]];
}

- (void)setActions:(id)a3
{
}

- (void)addEventAction:(id)a3
{
}

- (void)removeEventAction:(id)a3
{
}

- (BOOL)isAlerted
{
  return [(EKEvent *)self invitationStatus] != 3
      && [(EKEvent *)self invitationStatus] != 0;
}

- (void)setIsAlerted:(BOOL)a3
{
  if (a3) {
    [(EKEvent *)self _setInvitationStatusAlertedIfNecessary];
  }
  else {
    [(EKEvent *)self _setInvitationStatusUnalertedIfNecessary];
  }
}

- (void)_setInvitationStatusAlertedIfNecessary
{
  if ([(EKEvent *)self invitationStatus] == 3)
  {
    [(EKEvent *)self setInvitationStatus:2];
  }
}

- (void)_setInvitationStatusUnalertedIfNecessary
{
  unsigned int v3 = [(EKEvent *)self invitationChangedProperties];
  BOOL v4 = [(EKEvent *)self _shouldAlertInviteeDeclines];
  if (v3 != 32 || v4) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 2;
  }

  [(EKEvent *)self setInvitationStatus:v6];
}

- (BOOL)_shouldAlertInviteeDeclines
{
  return CalAlertInviteeDeclines() != 0;
}

- (int)externalTrackingStatus
{
  id v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56FB8]];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setExternalTrackingStatus:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56FB8]];
}

- (id)_travelTimeInternalDescription
{
  [(EKEvent *)self travelTime];
  if (v2 <= 0.0)
  {
    unint64_t v8 = 0;
  }
  else
  {
    double v3 = v2;
    id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v5 sinceDate:v3];
    unint64_t v7 = [v4 components:96 fromDate:v5 toDate:v6 options:0];
    if ([v7 hour]) {
      [NSString localizedStringWithFormat:@"%ld hours, %ld minutes", objc_msgSend(v7, "hour"), objc_msgSend(v7, "minute")];
    }
    else {
    unint64_t v8 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%ld minutes", objc_msgSend(v7, "minute"), v10);
    }
  }

  return v8;
}

- (void)setTravelTime:(double)a3
{
  objc_msgSend(NSNumber, "numberWithDouble:", fmax(a3, 0.0));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F57040]];
}

- (void)setProposedStartDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKCalendarItem *)self selfAttendee];
  if (v5
    && (uint64_t v6 = (void *)v5,
        BOOL v7 = [(EKCalendarItem *)self isExternallyOrganizedInvitation],
        v6,
        v7))
  {
    [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F57008]];
    unint64_t v8 = [(EKCalendarItem *)self selfAttendee];
    [v8 setProposedStartDate:v4 forEvent:self];

    if (v4) {
      [(EKEvent *)self setInvitationStatus:0];
    }
  }
  else
  {
    id v9 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKEvent setProposedStartDate:](v9);
    }
  }
}

- (NSDate)proposedEndDate
{
  double v3 = [(EKEvent *)self proposedStartDate];
  [(EKEvent *)self duration];
  id v4 = objc_msgSend(v3, "dateByAddingTimeInterval:");

  return (NSDate *)v4;
}

- (BOOL)allowsAttendeesModifications
{
  if ([(EKEvent *)self status] == EKEventStatusCanceled) {
    return 0;
  }
  id v4 = [(EKObject *)self eventStore];
  char v5 = [v4 skipModificationValidation];

  if (v5 & 1) != 0 || ([MEMORY[0x1E4F57700] currentProcessHasSyncClientEntitlement]) {
    return 1;
  }
  if ([(EKEvent *)self currentUserMayActAsOrganizer])
  {
    char v7 = 0;
  }
  else if ([(EKCalendarItem *)self isExternallyOrganizedInvitation])
  {
    char v7 = ![(EKEvent *)self canForward];
  }
  else
  {
    char v7 = 1;
  }
  unint64_t v8 = [(EKEvent *)self constraints];
  int v9 = [v8 supportsOutgoingInvitations];

  char v3 = 0;
  if ((v7 & 1) == 0 && v9)
  {
    uint64_t v10 = [(EKCalendarItem *)self calendar];
    if ([v10 allowsScheduling])
    {
      long long v11 = [(EKCalendarItem *)self calendar];
      int v12 = [v11 allowsContentModifications];

      if (!v12) {
        return 0;
      }
      uint64_t v10 = [(EKEvent *)self constraints];
      if ([v10 requiresOutgoingInvitationsInDefaultCalendar])
      {
        BOOL v13 = [(EKCalendarItem *)self hasAttendees];

        if (v13) {
          return 1;
        }
        uint64_t v10 = [(EKCalendarItem *)self calendar];
        char v3 = [v10 isDefaultSchedulingCalendar];
      }
      else
      {
        char v3 = 1;
      }
    }
    else
    {
      char v3 = 0;
    }
  }
  return v3;
}

- (BOOL)allowsTravelTimeModifications
{
  char v3 = [(EKCalendarItem *)self calendar];
  if ([v3 allowsContentModifications])
  {
    id v4 = [(EKEvent *)self constraints];
    if ([v4 supportsTravelTime]) {
      BOOL v5 = ![(EKEvent *)self isAllDay];
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)allowsPrivacyLevelModifications
{
  char v3 = [(EKCalendarItem *)self calendar];
  id v4 = [(EKEvent *)self constraints];
  if (![v4 supportsPrivateEvents]) {
    goto LABEL_9;
  }
  BOOL v5 = [(EKObject *)self eventStore];
  if (([v5 skipModificationValidation] & 1) == 0)
  {
    char v6 = [MEMORY[0x1E4F57700] currentProcessHasSyncClientEntitlement];

    if (v6) {
      goto LABEL_5;
    }
    unint64_t v8 = [v3 source];
    int v9 = [v8 isDelegate];

    uint64_t v10 = [v3 sharingStatus];
    if (v10 == 2 || !v9)
    {
      if (v10 == 2) {
        goto LABEL_9;
      }
    }
    else if (([v4 allowsPrivateEventAccessByDelegate] & 1) == 0)
    {
LABEL_9:
      LOBYTE(v7) = 0;
      goto LABEL_10;
    }
    if ([v4 prohibitsPrivateEventsWithAttendees])
    {
      BOOL v7 = ![(EKCalendarItem *)self hasAttendees];
      goto LABEL_10;
    }
    goto LABEL_5;
  }

LABEL_5:
  LOBYTE(v7) = 1;
LABEL_10:

  return v7;
}

- (BOOL)allowsAllDayModifications
{
  if ([(EKEvent *)self isEditable])
  {
    if (![(EKCalendarItem *)self hasRecurrenceRules]) {
      return 1;
    }
    if (![(EKEvent *)self isDetached])
    {
      id v4 = [(EKCalendarItem *)self detachedItems];
      BOOL v3 = [v4 count] == 0;

      return v3;
    }
  }
  return 0;
}

- (void)setPrivacyLevel:(int64_t)a3
{
  if ([(EKEvent *)self allowsPrivacyLevelModifications])
  {
    id v5 = [NSNumber numberWithInteger:a3];
    [(EKObject *)self setSingleChangedValue:v5 forKey:*MEMORY[0x1E4F57000]];
  }
}

- (void)setPrivacyLevelWithoutVerifyingPrivacyModificationsAllowed:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F57000]];
}

- (BOOL)locationIsAConferenceRoom
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(EKEvent *)self locationWithoutPrediction];
  id v4 = v3;
  if (v3 && [v3 length] && -[EKCalendarItem hasAttendees](self, "hasAttendees"))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(EKCalendarItem *)self attendees];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v9 participantType] == 2)
          {
            uint64_t v10 = [v9 name];
            char v11 = [v10 isEqualToString:v4];

            if (v11)
            {
              LOBYTE(v6) = 1;
              goto LABEL_17;
            }
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)setInvitationChangedProperties:(unsigned int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56FD0]];
}

- (void)_setInvitationChangedProperty:(BOOL)a3 forFlag:(unsigned int)a4
{
  BOOL v5 = a3;
  unsigned int v7 = [(EKEvent *)self invitationChangedProperties];
  if (v5) {
    uint64_t v8 = v7 | a4;
  }
  else {
    uint64_t v8 = v7 & ~a4;
  }
  id v9 = [NSNumber numberWithUnsignedInt:v8];
  [(EKObject *)self setSingleChangedValue:v9 forKey:*MEMORY[0x1E4F56FD0]];
}

- (BOOL)attendeeComment
{
  return [(EKEvent *)self _invitationChangedPropertyForFlag:16];
}

- (BOOL)attendeeStatus
{
  return [(EKEvent *)self _invitationChangedPropertyForFlag:32];
}

- (BOOL)attendeeProposedStartDate
{
  return [(EKEvent *)self _invitationChangedPropertyForFlag:64];
}

- (BOOL)attendeeDeclinedStartDate
{
  return [(EKEvent *)self _invitationChangedPropertyForFlag:128];
}

- (void)setDateChanged:(BOOL)a3
{
}

- (void)setTimeChanged:(BOOL)a3
{
}

- (void)setTitleChanged:(BOOL)a3
{
}

- (void)setLocationChanged:(BOOL)a3
{
}

- (void)setVideoConferenceChanged:(BOOL)a3
{
}

- (void)setRecurrenceChanged:(BOOL)a3
{
}

- (void)setAttendeeComment:(BOOL)a3
{
}

- (void)setAttendeeStatus:(BOOL)a3
{
}

- (void)setAttendeeProposedStartDate:(BOOL)a3
{
}

- (void)setAttendeeDeclinedStartDate:(BOOL)a3
{
}

- (BOOL)canForward
{
  BOOL v3 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56F78]];
  id v4 = v3;
  if (v3 && [v3 BOOLValue])
  {
    BOOL v5 = [(EKEvent *)self constraints];
    char v6 = [v5 supportsEventForwarding];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)serverSupportedProposeNewTime
{
  BOOL v3 = [(EKEvent *)self constraints];
  if ([v3 allowsProposeNewTime])
  {
    char v4 = 1;
  }
  else
  {
    BOOL v5 = [(EKEvent *)self constraints];
    char v4 = [v5 supportsResponseComments];
  }
  return v4;
}

- (BOOL)disallowProposeNewTime
{
  double v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56FA8]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)allowsProposedTimeModifications
{
  if ([(EKEvent *)self disallowProposeNewTime]) {
    goto LABEL_13;
  }
  if ([(EKEvent *)self isAllDay]) {
    goto LABEL_13;
  }
  if ([(EKEvent *)self status] == EKEventStatusCanceled) {
    goto LABEL_13;
  }
  char v3 = [(EKCalendarItem *)self calendar];
  int v4 = [v3 allowsContentModifications];

  if (!v4) {
    goto LABEL_13;
  }
  BOOL v5 = [(EKCalendarItem *)self isExternallyOrganizedInvitation];
  if (v5)
  {
    char v6 = [(EKCalendarItem *)self selfAttendee];

    if (v6)
    {
      if (![(EKCalendarItem *)self isOrganizedBySharedCalendarOwner])
      {
        unsigned int v7 = [(EKCalendarItem *)self calendar];
        int v8 = [v7 allowsScheduling];

        if (v8)
        {
          if ([(EKEvent *)self serverSupportedProposeNewTime]) {
            goto LABEL_12;
          }
          id v9 = [(EKCalendarItem *)self organizer];
          uint64_t v10 = [v9 emailAddress];

          if (v10)
          {
            char v11 = [(EKCalendarItem *)self calendar];
            int v12 = [v11 source];
            int v13 = [v12 hasOwnerEmailAddress];

            if (v13)
            {
LABEL_12:
              LOBYTE(v5) = 1;
              return v5;
            }
          }
        }
      }
    }
LABEL_13:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)supportsAddingAttachments
{
  if ([(EKCalendarItem *)self isExternallyOrganizedInvitation]) {
    return 0;
  }
  char v3 = [(EKCalendarItem *)self calendar];
  int v4 = [v3 allowsContentModifications];

  if (!v4) {
    return 0;
  }
  BOOL v5 = [(EKEvent *)self constraints];
  char v6 = [v5 supportsAttachments];

  return v6;
}

- (void)setNotes:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(EKCalendarItem *)self notes];
  if ([v5 isEqual:v4])
  {
  }
  else
  {
    if ([v4 isEqualToString:&stru_1EF932508])
    {
      char v6 = [(EKCalendarItem *)self notes];

      if (!v6) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    v7.receiver = self;
    v7.super_class = (Class)EKEvent;
    [(EKCalendarItem *)&v7 setNotes:v4];
    [(EKEvent *)self setNotesCommon:v4];
  }
LABEL_8:
}

- (void)setDisplayNotes:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  id v12 = 0;
  [(EKEvent *)self parsedConference:&v12 andNotes:&v11];
  id v5 = v12;
  id v6 = v11;
  objc_super v7 = v4;
  if (v5)
  {
    uint64_t v8 = [v5 range];
    uint64_t v10 = objc_msgSend(v6, "substringWithRange:", v8, v9);
    objc_super v7 = [(EKEvent *)self _buildConferenceStringFromNotesWithoutConference:v4 serializedConference:v10];
  }
  [(EKEvent *)self setNotes:v7];
}

- (void)setURL:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKEvent;
  id v4 = a3;
  [(EKCalendarItem *)&v5 setURL:v4];
  -[EKEvent setURLCommon:](self, "setURLCommon:", v4, v5.receiver, v5.super_class);
}

- (void)setStructuredLocation:(EKStructuredLocation *)structuredLocation
{
  id v4 = structuredLocation;
  [(EKEvent *)self setPredictedLocationFrozen:0];
  [(EKEvent *)self _clearLocationPredictionCacheIfNotFrozen];
  [(EKCalendarItem *)self setStructuredLocationWithoutPrediction:v4];

  [(EKEvent *)self clearDetectedConferenceURL];
}

- (void)setStructuredLocation:(id)a3 preserveConferenceRooms:(BOOL)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v8 = [(EKEvent *)self _conferenceRoomDisplayStrings];
    uint64_t v9 = [v7 arrayWithArray:v8];

    if (v6)
    {
      uint64_t v10 = [v6 title];

      if (v10)
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v11 = objc_msgSend(v6, "title", 0);
        id v12 = [v11 componentsSeparatedByString:@"; "];

        uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v23 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
              if (([v9 containsObject:v17] & 1) == 0) {
                [v9 addObject:v17];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v14);
        }
      }
    }
    [(EKEvent *)self setStructuredLocation:v6];
    uint64_t v18 = [(id)objc_opt_class() _locationStringForLocations:v9];
    long long v19 = [(EKEvent *)self structuredLocation];

    if (v19)
    {
      long long v20 = [(EKEvent *)self structuredLocation];
      [v20 setTitle:v18];
    }
    else
    {
      long long v20 = +[EKStructuredLocation locationWithTitle:v18];
      [(EKEvent *)self setStructuredLocation:v20];
    }
  }
  else
  {
    long long v21 = [(EKEvent *)self roomAttendees];
    [(EKEvent *)self removeConferenceRooms:v21];

    [(EKEvent *)self setStructuredLocation:v6];
  }
}

- (id)roomAttendees
{
  double v2 = [(EKCalendarItem *)self attendees];
  char v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_152];
  id v4 = [v2 filteredArrayUsingPredicate:v3];

  return v4;
}

uint64_t __24__EKEvent_roomAttendees__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isLocationRoom];
}

- (void)addConferenceRooms:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [(EKCalendarItem *)self addAttendee:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  uint64_t v9 = [(EKEvent *)self structuredLocation];
  [(EKEvent *)self setStructuredLocation:v9 preserveConferenceRooms:1];
}

- (void)removeConferenceRooms:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(EKEvent *)self roomAttendees];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithArray:v5];
  [v6 removeObjectsInArray:v4];
  if ([v6 count])
  {
    BOOL v23 = 0;
  }
  else
  {
    uint64_t v7 = [(EKEvent *)self locations];
    uint64_t v8 = [v7 count];
    BOOL v23 = v8 == [v5 count];
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F1CA48];
  long long v10 = [(EKEvent *)self structuredLocation];
  long long v11 = [v10 title];
  long long v12 = [v11 componentsSeparatedByString:@"; "];
  long long v13 = [v9 arrayWithArray:v12];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v4;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = [v19 displayString];
        if (v20) {
          [v13 removeObject:v20];
        }
        [(EKCalendarItem *)self removeAttendee:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }

  if (v23)
  {
    [(EKEvent *)self setStructuredLocation:0];
  }
  else
  {
    long long v21 = [(id)objc_opt_class() _locationStringForLocations:v13];
    long long v22 = [(EKEvent *)self structuredLocation];
    [v22 setTitle:v21];
  }
}

- (id)_conferenceRoomDisplayStrings
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(EKEvent *)self roomAttendees];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) displayString];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

void __74__EKEvent__updatedPredictedLocationRespectingTimeoutBudgetForEvent_error___block_invoke()
{
  remainingTimeout = 0x3FB999999999999ALL;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    __74__EKEvent__updatedPredictedLocationRespectingTimeoutBudgetForEvent_error___block_invoke_cold_1();
  }
}

- (void)_clearLocationPredictionCacheIfNotFrozenHoldingLock
{
  if (!self->_locationPredictionFrozen)
  {
    cachedLocationPrediction = self->_cachedLocationPrediction;
    self->_cachedLocationPrediction = 0;

    cachedLocationPredictionExpirationDate = self->_cachedLocationPredictionExpirationDate;
    self->_cachedLocationPredictionExpirationDate = 0;
  }
}

- (void)_clearLocationPredictionCacheIfNotFrozen
{
  p_locationPredictionLock = &self->_locationPredictionLock;
  os_unfair_lock_lock(&self->_locationPredictionLock);
  [(EKEvent *)self _clearLocationPredictionCacheIfNotFrozenHoldingLock];

  os_unfair_lock_unlock(p_locationPredictionLock);
}

- (void)confirmPredictedLocation:(id)a3
{
  id v4 = a3;
  [(EKEvent *)self setPredictedLocationFrozen:0];
  if (!v4)
  {
    id v4 = [(EKEvent *)self structuredLocation];
  }
  id v8 = [v4 duplicate];

  [v8 setPredictedLOI:0];
  if ([(EKEvent *)self isEditable]
    && ([(EKEvent *)self constraints],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 supportsStructuredLocations],
        v5,
        v6))
  {
    [(EKEvent *)self setStructuredLocation:v8];
  }
  else
  {
    uint64_t v7 = [(EKEvent *)self locationWithoutPrediction];
    [v8 setDerivedFrom:v7];

    [(EKCalendarItem *)self setClientLocation:v8];
  }
  [(EKEvent *)self setLocationPredictionState:2];
}

- (void)rejectPredictedLocation
{
  [(EKEvent *)self setPredictedLocationFrozen:0];
  char v3 = [(EKEvent *)self preferredLocationWithoutPrediction];
  [(EKEvent *)self setStructuredLocation:v3];

  [(EKEvent *)self setLocationPredictionState:3];
}

- (BOOL)hasPredictedLocation
{
  double v2 = [(EKCalendarItem *)self preferredLocation];
  char v3 = [v2 isPrediction];

  return v3;
}

- (void)setPredictedLocationFrozen:(BOOL)a3
{
  BOOL v3 = a3;
  p_locationPredictionLock = &self->_locationPredictionLock;
  os_unfair_lock_lock(&self->_locationPredictionLock);
  if (self->_locationPredictionFrozen != v3)
  {
    if (v3
      && +[EKStructuredLocationPrediction shouldDoLocationPredictionForEvent:self])
    {
      id v6 = [(EKEvent *)self _updatePredictedLocationCacheIfNeededHoldingLock];
    }
    self->_locationPredictionFrozen = v3;
    [(EKEvent *)self _clearLocationPredictionCacheIfNotFrozenHoldingLock];
  }

  os_unfair_lock_unlock(p_locationPredictionLock);
}

- (void)setConferenceURLString:(id)a3
{
}

- (void)setConferenceURL:(id)a3
{
  id v4 = [a3 absoluteString];
  [(EKEvent *)self setConferenceURLString:v4];
}

- (void)setCalendar:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)EKEvent;
    [(EKCalendarItem *)&v12 setCalendar:0];
    goto LABEL_11;
  }
  id v6 = [(EKCalendarItem *)self calendar];
  uint64_t v7 = [v6 source];
  if (v7 || ([v5 source], (BOOL v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = [(EKCalendarItem *)self calendar];
    uint64_t v9 = [v8 source];
    long long v10 = [v5 source];
    int v11 = [v9 isEqual:v10] ^ 1;

    if (v7) {
      goto LABEL_9;
    }
  }
  else
  {
    int v11 = 0;
  }

LABEL_9:
  v12.receiver = self;
  v12.super_class = (Class)EKEvent;
  [(EKCalendarItem *)&v12 setCalendar:v5];
  if (v11) {
    [(EKEvent *)self updateDefaultAlarms];
  }
LABEL_11:
  [(EKEvent *)self clearIntegrationType];
}

- (void)setEndLocation:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F56BE8];
  id v5 = a3;
  [(EKObject *)self updateMeltedAndCachedSingleRelationObject:v5 forKey:v4 frozenClass:+[EKStructuredLocation frozenClass]];
}

- (EKStructuredLocation)endLocation
{
  return (EKStructuredLocation *)[(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F56BE8]];
}

- (void)setParticipationStatusModifiedDate:(id)a3
{
}

- (void)setCompleted:(BOOL)a3
{
}

- (BOOL)isTentative
{
  int64_t v3 = [(EKEvent *)self participationStatus];
  if (v3 == 2) {
    return 0;
  }
  int64_t v4 = v3;
  if (![(EKCalendarItem *)self isExternallyOrganizedInvitation]) {
    return 0;
  }
  EKEventStatus v5 = [(EKEvent *)self status];
  char v6 = v5 != EKEventStatusCanceled;
  if (v4 == 4 && v5 != EKEventStatusCanceled)
  {
    uint64_t v7 = [(EKEvent *)self constraints];
    id v8 = v7;
    if (v7) {
      char v6 = [v7 statusesAreAccurate];
    }
    else {
      char v6 = 1;
    }
  }
  return v6;
}

- (NSComparisonResult)compareStartDateWithEvent:(EKEvent *)other
{
  int64_t v4 = other;
  EKEventStatus v5 = [(EKEvent *)self occurrenceStartDate];
  char v6 = [(EKEvent *)v4 occurrenceStartDate];

  NSComparisonResult v7 = [v5 compare:v6];
  return v7;
}

- (int64_t)compareOriginalStartDateWithEvent:(id)a3
{
  id v4 = a3;
  if ([(EKEvent *)self isDetached]) {
    [(EKEvent *)self originalStartDate];
  }
  else {
  EKEventStatus v5 = [(EKEvent *)self startDate];
  }
  if ([v4 isDetached]) {
    [v4 originalStartDate];
  }
  else {
  char v6 = [v4 startDate];
  }
  int64_t v7 = [v5 compare:v6];

  return v7;
}

- (BOOL)isEditable
{
  int64_t v3 = [(EKObject *)self eventStore];
  if ([v3 skipModificationValidation])
  {

    return 1;
  }
  char v4 = [MEMORY[0x1E4F57700] currentProcessHasSyncClientEntitlement];

  if (v4) {
    return 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)EKEvent;
  unsigned __int8 v6 = [(EKCalendarItem *)&v7 isEditable];
  return v6 & ~[(EKEvent *)self isPrivateEventSharedToMe];
}

- (BOOL)isPrivateEventSharedToMe
{
  int64_t v3 = [(EKEvent *)self privacyLevel];
  char v4 = [(EKCalendarItem *)self calendar];
  EKEventStatus v5 = [v4 source];
  char v6 = [v5 isDelegate];

  objc_super v7 = [(EKCalendarItem *)self calendar];
  uint64_t v8 = [v7 sharingStatus];

  if (v8 == 2) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v6;
  }
  return v3 && v9;
}

- (BOOL)allowsRecurrenceModificationsForSpan:(int64_t)a3
{
  char v5 = [(EKEvent *)self isEditable];
  if ([(EKEvent *)self isDetached])
  {
    if (a3 != 1 && a3 != 4)
    {
      char v6 = [(EKCalendarItem *)self calendar];

      if (v6)
      {
        objc_super v7 = [(EKEvent *)self constraints];
        char v5 = [v7 supportsRecurrencesOnDetachedEvents];
      }
    }
  }
  return v5;
}

- (BOOL)allowsCalendarModifications
{
  v5.receiver = self;
  v5.super_class = (Class)EKEvent;
  BOOL v3 = [(EKCalendarItem *)&v5 allowsCalendarModifications];
  if (v3)
  {
    if ([(EKObject *)self isNew]) {
      LOBYTE(v3) = 1;
    }
    else {
      LOBYTE(v3) = ![(EKCalendarItem *)self isExternallyOrganizedInvitation];
    }
  }
  return v3;
}

- (BOOL)responseMustApplyToAll
{
  if (![(EKEvent *)self isOrWasPartOfRecurringSeries]) {
    return 0;
  }
  BOOL v3 = [(EKEvent *)self constraints];
  int v4 = [v3 mustAcknowledgeMasterEvent];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(EKCalendarItem *)self originalItem];
  char v6 = (void *)v5;
  if (v5) {
    objc_super v7 = (EKEvent *)v5;
  }
  else {
    objc_super v7 = self;
  }
  uint64_t v8 = v7;

  if ([(EKEvent *)v8 participationStatus] == 1)
  {
    BOOL v9 = 1;
  }
  else
  {
    long long v10 = [(EKCalendarItem *)v8 externalID];
    BOOL v9 = v10 == 0;
  }
  return v9;
}

- (BOOL)_changesRequireDetachOrSlice
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(EKObject *)self changeSet];
  int v4 = [v3 changedKeys];

  uint64_t v5 = [v4 count];
  char v6 = [MEMORY[0x1E4F1CA80] setWithObject:*MEMORY[0x1E4F56BB0]];
  objc_super v7 = [(EKEvent *)self constraints];
  int v8 = [v7 requiresSamePrivacyLevelAcrossRecurrenceSeries];

  if (v8) {
    [v6 addObject:*MEMORY[0x1E4F57000]];
  }
  BOOL v9 = [(EKEvent *)self constraints];
  if ([v9 prohibitsDetachmentOnCommentChange])
  {
    char v10 = [v4 containsObject:*MEMORY[0x1E4F57008]];

    if ((v10 & 1) == 0) {
      [v6 addObject:*MEMORY[0x1E4F57018]];
    }
    if (!v5) {
      goto LABEL_17;
    }
  }
  else
  {

    if (!v5) {
      goto LABEL_17;
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v12)
  {
    BOOL v16 = 1;
    goto LABEL_21;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v19 != v14) {
        objc_enumerationMutation(v11);
      }
      v5 -= objc_msgSend(v4, "containsObject:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v13);

  if (v5) {
    goto LABEL_18;
  }
LABEL_17:
  if (![(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56C80]])
  {
    id v11 = [v6 allObjects];
    BOOL v16 = [(EKObject *)self hasUnsavedChangesIgnoreKeys:v11];
LABEL_21:

    goto LABEL_22;
  }
LABEL_18:
  BOOL v16 = 1;
LABEL_22:

  return v16;
}

- (BOOL)requiresDetach
{
  if ([(EKObject *)self isNew] || ![(EKCalendarItem *)self _hadRecurrenceRules]) {
    return 0;
  }

  return [(EKEvent *)self _changesRequireDetachOrSlice];
}

- (BOOL)canDetachSingleOccurrence
{
  if ([(EKEvent *)self isDetached])
  {
    BOOL v3 = [(EKEvent *)self singleRecurrenceRule];
    char v4 = [v3 hasChanges];

    if (v4) {
      return 0;
    }
  }
  if ([(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56C80]]
    || [(EKEvent *)self isAllDayDirty])
  {
    return 0;
  }
  else
  {
    return ![(EKEvent *)self hasAttachmentChanges];
  }
}

- (BOOL)hasAttachmentChanges
{
  return [(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56BA0]];
}

- (BOOL)changingAllDayPropertyIsAllowed
{
  if ([(EKEvent *)self isDetached]) {
    return 0;
  }
  if (![(EKCalendarItem *)self hasRecurrenceRules] || [(EKObject *)self isNew]) {
    return 1;
  }
  char v4 = [(EKCalendarItem *)self calendar];
  uint64_t v5 = [v4 source];
  BOOL v3 = [v5 sourceType] != 1;

  return v3;
}

+ (id)_basicChangesRequiringSpanAll
{
  if (_basicChangesRequiringSpanAll_onceToken != -1) {
    dispatch_once(&_basicChangesRequiringSpanAll_onceToken, &__block_literal_global_170);
  }
  double v2 = (void *)_basicChangesRequiringSpanAll_basicChangesRequiringSpanAll;

  return v2;
}

void __40__EKEvent__basicChangesRequiringSpanAll__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F56BA0];
  v3[0] = @"privacyLevelString";
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E4F56BB0];
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  double v2 = (void *)_basicChangesRequiringSpanAll_basicChangesRequiringSpanAll;
  _basicChangesRequiringSpanAll_basicChangesRequiringSpanAll = v1;
}

- (BOOL)hasChangesRequiringSpanAll
{
  if ([(EKObject *)self isSaved]
    && [(EKEvent *)self _hasBasicChangesRequiringSpanAll])
  {
    return 1;
  }

  return [(EKEvent *)self _hasRecurrenceRuleChangeRequiringSpanAll];
}

- (BOOL)_hasOrHadRecurrenceRule
{
  if ([(EKCalendarItem *)self hasRecurrenceRules]) {
    return 1;
  }
  uint64_t v4 = *MEMORY[0x1E4F56C80];

  return [(EKObject *)self _hasChangesForKey:v4];
}

- (BOOL)_hasBasicChangesRequiringSpanAll
{
  BOOL v3 = [(id)objc_opt_class() _basicChangesRequiringSpanAll];
  if ([(EKEvent *)self _hasOrHadRecurrenceRule])
  {
    BOOL v4 = [(EKObject *)self hasUnsavedChangesInKeys:v3];
  }
  else
  {
    uint64_t v5 = [(EKCalendarItem *)self originalItem];
    if ([v5 _hasOrHadRecurrenceRule]) {
      BOOL v4 = [(EKObject *)self hasUnsavedChangesInKeys:v3];
    }
    else {
      BOOL v4 = 0;
    }
  }
  return v4;
}

- (BOOL)_hasRecurrenceRuleChangeRequiringSpanAll
{
  BOOL v3 = [(EKObject *)self _previousValueForKey:*MEMORY[0x1E4F56C80]];
  uint64_t v4 = [v3 count];
  BOOL v5 = [(EKCalendarItem *)self hasRecurrenceRules];
  if (!v5 || v4)
  {
    if (!v5)
    {
      LOBYTE(v6) = v4 != 0;
      goto LABEL_13;
    }
    objc_super v7 = [(EKCalendarItem *)self recurrenceRules];
    if ([v7 count] == 1)
    {
      uint64_t v8 = [v3 count];

      if (v8 == 1)
      {
LABEL_12:
        char v10 = [(EKCalendarItem *)self recurrenceRules];
        id v11 = [v10 firstObject];

        uint64_t v12 = [EKRecurrenceRule alloc];
        uint64_t v13 = [v3 anyObject];
        uint64_t v14 = [(EKObject *)v12 initWithPersistentObject:v13];

        int v6 = [v11 isEqualToRecurrenceRule:v14] ^ 1;
        goto LABEL_13;
      }
    }
    else
    {
    }
    BOOL v9 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      [(EKEvent *)v9 _hasRecurrenceRuleChangeRequiringSpanAll];
    }
    goto LABEL_12;
  }
  LOBYTE(v6) = 0;
LABEL_13:

  return v6;
}

- (BOOL)automaticLocationGeocodingAllowed
{
  double v2 = [(EKCalendarItem *)self calendar];
  char v3 = [v2 automaticEventLocationGeocodingAllowed];

  return v3;
}

- (BOOL)eligibleForTravelAdvisories
{
  return [(EKEvent *)self _eligibleForTravelAdvisoriesIncludePotential:0];
}

- (BOOL)potentiallyEligibleForTravelAdvisories
{
  return [(EKEvent *)self _eligibleForTravelAdvisoriesIncludePotential:1];
}

- (BOOL)_eligibleForTravelAdvisoriesIncludePotential:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(EKEvent *)self isAllDay]
    || [(EKEvent *)self selfParticipantStatus] == 3
    || [(EKEvent *)self status] == EKEventStatusCanceled
    || [(EKEvent *)self locationIsAConferenceRoom])
  {
    return 0;
  }
  objc_super v7 = [(EKCalendarItem *)self preferredLocation];
  if (([v7 hasKnownSpatialData] & 1) != 0
    || v3 && [(EKEvent *)self automaticLocationGeocodingAllowed])
  {
    if ([v7 isPrediction]
      && ([v7 predictedLOI],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          unint64_t v9 = [v8 type],
          v8,
          v9 <= 1))
    {
      char v10 = [(EKEvent *)self conferenceURLForDisplay];
      if (v10)
      {
        BOOL v5 = 0;
      }
      else
      {
        id v11 = [(EKEvent *)self virtualConference];
        BOOL v5 = v11 == 0;
      }
    }
    else
    {
      BOOL v5 = 1;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (int64_t)travelAdvisoryBehavior
{
  double v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57038]];
  BOOL v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)setTravelAdvisoryBehavior:(int64_t)a3
{
  if ([(EKEvent *)self eligibleForTravelAdvisories])
  {
    id v5 = [NSNumber numberWithInteger:a3];
    [(EKObject *)self setSingleChangedValue:v5 forKey:*MEMORY[0x1E4F57038]];
  }
}

- (BOOL)travelAdvisoryBehaviorIsEffectivelyEnabled
{
  int64_t v2 = [(EKEvent *)self travelAdvisoryBehavior];
  if (v2 == 2) {
    return 0;
  }
  if (v2) {
    return 1;
  }
  BOOL v3 = [MEMORY[0x1E4F57440] shared];
  char v4 = objc_msgSend(v3, "get_enableTravelAdvisoriesForAutomaticBehavior");

  return v4;
}

- (unint64_t)junkStatus
{
  int64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56FE0]];
  unint64_t v3 = (int)[v2 intValue];

  return v3;
}

- (void)setJunkStatus:(unint64_t)a3
{
  -[EKEvent setCachedJunkStatus:](self, "setCachedJunkStatus:");
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  [(EKObject *)self setSingleChangedValue:v5 forKey:*MEMORY[0x1E4F56FE0]];
}

- (NSString)sendersEmail
{
  int64_t v2 = [(EKCalendarItem *)self organizer];
  unint64_t v3 = [v2 emailAddress];

  return (NSString *)v3;
}

- (NSString)sendersPhoneNumber
{
  int64_t v2 = [(EKCalendarItem *)self organizer];
  unint64_t v3 = [v2 phoneNumber];

  return (NSString *)v3;
}

- (BOOL)supportsJunkReporting
{
  int64_t v2 = [(EKCalendarItem *)self calendar];
  char v3 = [v2 supportsJunkReporting];

  return v3;
}

+ (id)_relatedCachedTimeKeys
{
  if (_relatedCachedTimeKeys_onceToken != -1) {
    dispatch_once(&_relatedCachedTimeKeys_onceToken, &__block_literal_global_198);
  }
  int64_t v2 = (void *)_relatedCachedTimeKeys_relatedKeys;

  return v2;
}

void __33__EKEvent__relatedCachedTimeKeys__block_invoke()
{
  v2[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"cachedStartOfDayForStartDate";
  v2[1] = @"cachedStartOfDayForEndDate";
  v2[2] = @"cachedDaysSpanned";
  v2[3] = @"cachedIsMultiDayTimedEvent";
  v2[4] = @"nextReminderOccurrenceDateKey";
  v2[5] = @"isFirstOccurrenceIncludingSlices";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:6];
  uint64_t v1 = (void *)_relatedCachedTimeKeys_relatedKeys;
  _relatedCachedTimeKeys_relatedKeys = v0;
}

- (void)clearCachedTimeValues
{
  id v3 = [(id)objc_opt_class() _relatedCachedTimeKeys];
  [(EKObject *)self clearCachedValuesForKeys:v3];
}

- (id)startOfDayForStartDateInCalendar:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _relatedCachedTimeKeys];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __44__EKEvent_startOfDayForStartDateInCalendar___block_invoke;
  v9[3] = &unk_1E5B989A8;
  id v10 = v4;
  id v11 = self;
  id v6 = v4;
  objc_super v7 = [(EKObject *)self cachedValueForKey:@"cachedStartOfDayForStartDate" expectingCachedValue:v6 forMasterKey:@"cachedTimeValuesCalendar" relatedKeys:v5 populateBlock:v9];

  return v7;
}

id __44__EKEvent_startOfDayForStartDateInCalendar___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  int64_t v2 = [*(id *)(a1 + 40) startDate];
  id v3 = [v1 startOfDayForDate:v2];

  return v3;
}

- (id)startOfDayForEndDateInCalendar:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _relatedCachedTimeKeys];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __42__EKEvent_startOfDayForEndDateInCalendar___block_invoke;
  v9[3] = &unk_1E5B989A8;
  void v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  objc_super v7 = [(EKObject *)self cachedValueForKey:@"cachedStartOfDayForEndDate" expectingCachedValue:v6 forMasterKey:@"cachedTimeValuesCalendar" relatedKeys:v5 populateBlock:v9];

  return v7;
}

id __42__EKEvent_startOfDayForEndDateInCalendar___block_invoke(uint64_t a1)
{
  int64_t v2 = [*(id *)(a1 + 32) startOfDayForStartDateInCalendar:*(void *)(a1 + 40)];
  id v3 = objc_msgSend(v2, "dateByAddingDays:inCalendar:", objc_msgSend(*(id *)(a1 + 32), "daysSpannedInCalendar:", *(void *)(a1 + 40)) - 1, *(void *)(a1 + 40));

  return v3;
}

- (int64_t)daysSpannedInCalendar:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _relatedCachedTimeKeys];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __33__EKEvent_daysSpannedInCalendar___block_invoke;
  uint64_t v13 = &unk_1E5B989A8;
  uint64_t v14 = self;
  id v15 = v4;
  id v6 = v4;
  objc_super v7 = [(EKObject *)self cachedValueForKey:@"cachedDaysSpanned" expectingCachedValue:v6 forMasterKey:@"cachedTimeValuesCalendar" relatedKeys:v5 populateBlock:&v10];

  int64_t v8 = objc_msgSend(v7, "integerValue", v10, v11, v12, v13, v14);
  return v8;
}

uint64_t __33__EKEvent_daysSpannedInCalendar___block_invoke(uint64_t a1)
{
  int64_t v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = [*(id *)(a1 + 32) startDate];
  id v4 = [*(id *)(a1 + 32) endDateUnadjustedForLegacyClients];
  uint64_t v5 = objc_msgSend(v2, "daysSpannedFromStartDate:toEndDate:allDay:inCalendar:", v3, v4, objc_msgSend(*(id *)(a1 + 32), "isAllDay"), *(void *)(a1 + 40));

  id v6 = NSNumber;

  return [v6 numberWithInteger:v5];
}

- (BOOL)isMultiDayTimedEventInCalendar:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKEvent *)self startDate];
  if (v5
    && (id v6 = (void *)v5,
        [(EKEvent *)self endDateUnadjustedForLegacyClients],
        objc_super v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    int64_t v8 = [(id)objc_opt_class() _relatedCachedTimeKeys];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __42__EKEvent_isMultiDayTimedEventInCalendar___block_invoke;
    id v15 = &unk_1E5B989A8;
    BOOL v16 = self;
    id v17 = v4;
    unint64_t v9 = [(EKObject *)self cachedValueForKey:@"cachedIsMultiDayTimedEvent" expectingCachedValue:v17 forMasterKey:@"cachedTimeValuesCalendar" relatedKeys:v8 populateBlock:&v12];

    char v10 = objc_msgSend(v9, "BOOLValue", v12, v13, v14, v15, v16);
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

id __42__EKEvent_isMultiDayTimedEventInCalendar___block_invoke(uint64_t a1)
{
  int64_t v2 = NSNumber;
  id v3 = objc_opt_class();
  id v4 = [*(id *)(a1 + 32) startDate];
  uint64_t v5 = [*(id *)(a1 + 32) endDateUnadjustedForLegacyClients];
  id v6 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isMultiDayTimedEventWithStartDate:endDate:allDay:inCalendar:", v4, v5, objc_msgSend(*(id *)(a1 + 32), "isAllDay"), *(void *)(a1 + 40)));

  return v6;
}

+ (BOOL)isMultiDayTimedEventWithStartDate:(id)a3 endDate:(id)a4 allDay:(BOOL)a5 inCalendar:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  char v12 = 0;
  if (v9 && v10 && !a5)
  {
    if ([v9 isSameDayAsDate:v10 inCalendar:v11])
    {
      char v12 = 0;
    }
    else
    {
      uint64_t v13 = [v11 startOfDayForDate:v9];
      uint64_t v14 = [v13 dateByAddingDays:1 inCalendar:v11];
      id v15 = [v14 dateOnlyComponentsInCalendar:v11];

      [v15 setHour:5];
      BOOL v16 = [v11 dateFromComponents:v15];
      char v12 = [v10 isAfterDate:v16];
    }
  }

  return v12;
}

- (void)_clearOriginalDateFields
{
  [(EKEvent *)self setOriginalOccurrenceStartDate:0];
  [(EKEvent *)self setOriginalOccurrenceEndDate:0];

  [(EKEvent *)self setOriginalOccurrenceIsAllDay:0];
}

- (id)snapshotCopyWithPropertyKeysToCopy:(id)a3 propertyKeysToSkip:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)EKEvent;
  uint64_t v5 = [(EKObject *)&v9 snapshotCopyWithPropertyKeysToCopy:a3 propertyKeysToSkip:a4];
  objc_msgSend(v5, "setOccurrenceIsAllDay:", -[EKEvent occurrenceIsAllDay](self, "occurrenceIsAllDay"));
  id v6 = [(EKEvent *)self occurrenceStartDate];
  [v5 setOccurrenceStartDate:v6];

  objc_super v7 = [(EKEvent *)self occurrenceEndDate];
  [v5 setOccurrenceEndDate:v7];

  return v5;
}

- (id)previouslySavedCopy
{
  v9.receiver = self;
  v9.super_class = (Class)EKEvent;
  id v3 = [(EKObject *)&v9 previouslySavedCopy];
  id v4 = [(EKEvent *)self originalOccurrenceIsAllDay];

  if (v4)
  {
    uint64_t v5 = [(EKEvent *)self originalOccurrenceIsAllDay];
    objc_msgSend(v3, "setOccurrenceIsAllDay:", objc_msgSend(v5, "BOOLValue"));
  }
  else
  {
    objc_msgSend(v3, "setOccurrenceIsAllDay:", -[EKEvent occurrenceIsAllDay](self, "occurrenceIsAllDay"));
  }
  id v6 = [(EKEvent *)self originalOccurrenceStartDate];
  [v3 setOccurrenceStartDate:v6];

  objc_super v7 = [(EKEvent *)self originalOccurrenceEndDate];
  [v3 setOccurrenceEndDate:v7];

  return v3;
}

- (void)_resetInternalStateWithForce:(BOOL)a3
{
  BOOL v3 = a3;
  [(EKEvent *)self clearCachedTimeValues];
  if (v3 || [(EKEvent *)self isAllDayDirty])
  {
    self->_occurrenceIsAllDay = [(EKEvent *)self _isAllDay];
    uint64_t v5 = [(EKEvent *)self committedValueForKey:*MEMORY[0x1E4F56C38]];
    originalOccurrenceIsAllDay = self->_originalOccurrenceIsAllDay;
    self->_originalOccurrenceIsAllDay = v5;

    if (v3)
    {
      objc_super v7 = [(EKEvent *)self startDateRaw];
      [(EKEvent *)self _updateStartDateForDate:v7 withAdjustmentMode:1 adjustEndDate:0];

LABEL_8:
      objc_super v9 = [(EKEvent *)self endDateRaw];
      [(EKEvent *)self _updateEndDateForDate:v9 withAdjustmentMode:1 adjustStartDate:v3 ^ 1];

      goto LABEL_9;
    }
  }
  if ([(EKEvent *)self isStartDateDirty])
  {
    int64_t v8 = [(EKEvent *)self startDateRaw];
    [(EKEvent *)self _updateStartDateForDate:v8 withAdjustmentMode:1 adjustEndDate:v3 ^ 1];
  }
  if ([(EKEvent *)self isEndDateDirty]) {
    goto LABEL_8;
  }
LABEL_9:
  v10.receiver = self;
  v10.super_class = (Class)EKEvent;
  [(EKObject *)&v10 _resetInternalStateWithForce:v3];
  [(EKEvent *)self _invalidateRecurrenceIdentifier];
}

- (int64_t)pendingParticipationStatus
{
  int64_t v2 = [(EKCalendarItem *)self selfAttendee];
  int64_t v3 = [v2 pendingStatus];

  return v3;
}

- (BOOL)allowsAvailabilityModifications
{
  if ([(EKEvent *)self status] == EKEventStatusCanceled) {
    return 0;
  }
  int64_t v3 = [(EKCalendarItem *)self calendar];
  uint64_t v4 = [v3 supportedEventAvailabilities];

  if (!v4) {
    return 0;
  }
  if (![(EKEvent *)self privacyLevel]) {
    return 1;
  }
  uint64_t v5 = [(EKCalendarItem *)self calendar];
  BOOL v6 = [v5 sharingStatus] != 2;

  return v6;
}

- (BOOL)allowsAlarmModifications
{
  if ([(EKEvent *)self status] == EKEventStatusCanceled) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)EKEvent;
  return [(EKCalendarItem *)&v4 allowsAlarmModifications];
}

- (BOOL)_hasExternalIDOrDeliverySource
{
  int64_t v3 = [(EKCalendarItem *)self externalID];

  if (v3) {
    return 1;
  }
  objc_super v4 = [(EKCalendarItem *)self originalItem];
  uint64_t v5 = [v4 externalID];

  if (v5) {
    return 1;
  }

  return [(EKEvent *)self hasValidEventAction];
}

- (BOOL)hasValidEventAction
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int64_t v2 = [(EKEvent *)self actions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        BOOL v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_super v7 = [v6 externalID];
        if (v7)
        {
          int64_t v8 = [v6 externalFolderID];

          if (v8)
          {

            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)allowsParticipationStatusModifications
{
  if ([(EKObject *)self isNew]) {
    return 0;
  }
  EKEventStatus v5 = [(EKEvent *)self status];
  BOOL v6 = [(EKCalendarItem *)self isExternallyOrganizedInvitation];
  objc_super v7 = [(EKCalendarItem *)self selfAttendee];

  BOOL v3 = 0;
  if (v5 != EKEventStatusCanceled && v6 && v7)
  {
    if ([(EKCalendarItem *)self isOrganizedBySharedCalendarOwner]) {
      return 0;
    }
    int64_t v8 = [(EKEvent *)self constraints];
    uint64_t v9 = [(EKCalendarItem *)self calendar];
    long long v10 = (void *)v9;
    BOOL v3 = 0;
    if (v8 && v9)
    {
      long long v11 = [(EKCalendarItem *)self organizer];
      objc_opt_class();
      BOOL v3 = (objc_opt_isKindOfClass() & 1) != 0
        && [v11 scheduleAgent] != 1
        && [v10 allowsContentModifications]
        && (![v8 proposedStatusRequiredForResponse] || v5 == EKEventStatusConfirmed)
        && [v8 supportsInvitationModifications]
        && [v10 allowsScheduling]
        && (![v8 deliverySourceOrExternalIDRequiredForResponse]
         || [(EKEvent *)self _hasExternalIDOrDeliverySource])
        && ([(EKEvent *)self participationStatus] != 3
         || ![v8 declinedStatusChangeRequiresNoPendingStatus]
         || ![(EKEvent *)self pendingParticipationStatus]);
    }
  }
  return v3;
}

- (NSString)description
{
  v18.receiver = self;
  v18.super_class = (Class)EKEvent;
  id v17 = [(EKCalendarItem *)&v18 description];
  if ([(EKCalendarItem *)self hasRecurrenceRules])
  {
    BOOL v3 = [(EKCalendarItem *)self recurrenceRules];
    BOOL v16 = [v3 objectAtIndex:0];
  }
  else
  {
    BOOL v16 = 0;
  }
  uint64_t v15 = NSString;
  uint64_t v14 = objc_opt_class();
  uint64_t v4 = [(EKCalendarItem *)self location];
  EKEventStatus v5 = [(EKEvent *)self structuredLocation];
  BOOL v6 = [(EKEvent *)self startDate];
  objc_super v7 = [(EKEvent *)self endDate];
  BOOL v8 = [(EKEvent *)self isAllDay];
  BOOL v9 = [(EKEvent *)self isFloating];
  long long v10 = [(EKEvent *)self _travelTimeInternalDescription];
  long long v11 = [(EKCalendarItem *)self travelStartLocation];
  objc_msgSend(v15, "stringWithFormat:", @"%@ <%p>\n{\n\t %@; \n\t location = \t%@; \n\t structuredLocation = \t%@; \n\t startDate = \t%@; \n\t endDate = \t\t%@; \n\t allDay = \t\t%u; \n\t floating = \t%u; \n\t recurrence = \t%@; \n\t travelTime = \t%@; \n\t startLocation = \t%@;\n};",
    v14,
    self,
    v17,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v16,
    v10,
  long long v12 = v11);

  return (NSString *)v12;
}

- (id)privacyDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  EKEventStatus v5 = [(EKObject *)self objectID];
  uint64_t v6 = [v5 rowID];
  objc_super v7 = [(EKCalendarItem *)self UUID];
  BOOL v8 = [(EKEvent *)self startDate];
  BOOL v9 = [v8 debugDescription];
  long long v10 = [v3 stringWithFormat:@"<%@ rowid=[%d] UUID=[%@] start-date=[%@]>", v4, v6, v7, v9];

  return v10;
}

- (BOOL)refresh
{
  v3.receiver = self;
  v3.super_class = (Class)EKEvent;
  return [(EKObject *)&v3 refresh];
}

- (BOOL)refreshAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(EKObject *)self isNew])
  {
    uint64_t v6 = [(EKEvent *)self clearModifiedFlags];
    if (self->_originalOccurrenceStartDate || self->_originalOccurrenceEndDate || self->_originalOccurrenceIsAllDay)
    {
      objc_super v7 = self->_occurrenceStartDate;
      BOOL v8 = self->_occurrenceEndDate;
      BOOL occurrenceIsAllDay = self->_occurrenceIsAllDay;
    }
    else
    {
      objc_super v7 = 0;
      BOOL v8 = 0;
      BOOL occurrenceIsAllDay = 0;
    }
    v16.receiver = self;
    v16.super_class = (Class)EKEvent;
    if (![(EKObject *)&v16 refreshAndNotify:v3]) {
      goto LABEL_18;
    }
    [(EKEvent *)self setClearModifiedFlags:v6];
    if (v7)
    {
      objc_storeStrong((id *)&self->_originalOccurrenceStartDate, self->_occurrenceStartDate);
      objc_storeStrong((id *)&self->_occurrenceStartDate, v7);
      objc_storeStrong((id *)&self->_originalOccurrenceEndDate, self->_occurrenceEndDate);
      objc_storeStrong((id *)&self->_occurrenceEndDate, v8);
      long long v10 = [NSNumber numberWithBool:self->_occurrenceIsAllDay];
      originalOccurrenceIsAllDay = self->_originalOccurrenceIsAllDay;
      self->_originalOccurrenceIsAllDay = v10;

      self->_BOOL occurrenceIsAllDay = occurrenceIsAllDay;
    }
    if (!-[EKEvent validateOccurrenceDateStillMatchesRecurrenceRules](self, "validateOccurrenceDateStillMatchesRecurrenceRules")|| -[EKEvent isReminderIntegrationEvent](self, "isReminderIntegrationEvent")&& -[EKEvent completed](self, "completed")&& (-[EKObject eventStore](self, "eventStore"), long long v12 = objc_claimAutoreleasedReturnValue(), v13 = [v12 showCompletedReminders], v12, !v13))
    {
LABEL_18:
      LOBYTE(v5) = 0;
LABEL_19:

      return v5;
    }
    if ([(EKEvent *)self participationStatus] == 3)
    {
      uint64_t v14 = [(EKObject *)self eventStore];
      int v5 = [v14 showDeclinedEvents];

      if (!v5 || !v3) {
        goto LABEL_19;
      }
    }
    else if (!v3)
    {
LABEL_23:
      LOBYTE(v5) = 1;
      goto LABEL_19;
    }
    [(EKEvent *)self postModifiedNotification];
    goto LABEL_23;
  }
  LOBYTE(v5) = 0;
  return v5;
}

- (BOOL)validateOccurrenceDateStillMatchesRecurrenceRules
{
  BOOL result = 1;
  if ([(EKCalendarItem *)self _hadRecurrenceRules])
  {
    BOOL v3 = objc_alloc_init(EKRecurrenceGenerator);
    uint64_t v4 = [(EKEvent *)self originalOccurrenceStartDate];
    BOOL v5 = [(EKRecurrenceGenerator *)v3 isOccurrenceDate:v4 validForEvent:self];

    if (!v5) {
      return 0;
    }
  }
  return result;
}

- (void)snoozeAlarm:(id)a3 withTimeIntervalFromNow:(double)a4
{
}

- (void)snoozeAlarm:(id)a3 withTimeIntervalFromNow:(double)a4 pinsTriggerToStartDate:(BOOL)a5
{
}

- (void)snoozeAlarm:(id)a3 untilTargetDate:(id)a4
{
}

- (void)snoozeAlarm:(id)a3 untilTargetDate:(id)a4 pinsTriggerToStartDate:(BOOL)a5
{
}

- (void)_snoozeAlarm:(id)a3 withTimeIntervalFromNow:(double)a4 orTargetDate:(id)a5 pinsTriggerToStartDate:(BOOL)a6
{
  BOOL v6 = a6;
  id v27 = a3;
  id v10 = a5;
  if (v27)
  {
    long long v11 = [MEMORY[0x1E4F1C9C8] date];
    long long v12 = [(EKEvent *)self constraints];
    int v13 = [v12 snoozeAlarmRequiresDetach];

    if (v13)
    {
      id v14 = v27;
      [(EKEvent *)self setRequiresDetachDueToSnoozedAlarm:1];
    }
    else
    {
      id v14 = [v27 duplicate];
      [v27 setAcknowledgedDate:v11];
    }
    [v14 setDefaultAlarm:0];
    if (!v10)
    {
      id v10 = [v11 dateByAddingTimeInterval:a4];
    }
    uint64_t v15 = [(EKEvent *)self startDate];
    int v16 = [v11 isAfterDate:v15];

    id v17 = [(EKEvent *)self startDate];
    [v10 timeIntervalSinceDate:v17];
    double v19 = v18;

    int v20 = !v6;
    if (v19 <= 0.0) {
      int v20 = 1;
    }
    int v21 = (v20 | v16) ^ 1;
    if (v19 > 0.0 && (v21 & 1) == 0)
    {
      long long v22 = [(EKEvent *)self constraints];
      int v21 = [v22 supportsAlarmsTriggeringAfterStartDate] ^ 1;
    }
    double v23 = 0.0;
    if (!v21) {
      double v23 = v19;
    }
    [v14 setRelativeOffset:v23];
    long long v24 = [(EKEvent *)self constraints];
    int v25 = [v24 snoozeAlarmRequiresDetach];

    if (v25)
    {
      [(EKCalendarItem *)self setModifiedProperties:[(EKCalendarItem *)self modifiedProperties] | 0x80];
    }
    else
    {
      long long v26 = [(EKCalendarItem *)self findOriginalAlarmStartingWith:v27];
      [v14 setOriginalAlarm:v26];
      [(EKCalendarItem *)self addAlarm:v14];
    }
  }
}

- (id)propertiesThatCanBeModifiedOnReadOnlyCalendars
{
  v5.receiver = self;
  v5.super_class = (Class)EKEvent;
  int64_t v2 = [(EKCalendarItem *)&v5 propertiesThatCanBeModifiedOnReadOnlyCalendars];
  BOOL v3 = [v2 setByAddingObject:*MEMORY[0x1E4F56BC0]];

  return v3;
}

- (BOOL)validate:(id *)a3
{
  return [(EKEvent *)self validateWithSpan:0 error:a3];
}

- (BOOL)validateWithSpan:(int64_t)a3 error:(id *)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  v69.receiver = self;
  v69.super_class = (Class)EKEvent;
  BOOL v7 = [(EKCalendarItem *)&v69 validate:a4];
  if (v7)
  {
    BOOL v8 = [(EKCalendarItem *)self calendar];
    char v9 = [v8 allowEvents];

    if ((v9 & 1) == 0)
    {
      if (a4)
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = 22;
        goto LABEL_18;
      }
LABEL_102:
      LOBYTE(v7) = 0;
      return v7;
    }
    id v10 = [(EKEvent *)self startDate];

    if (!v10)
    {
      if (a4)
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = 2;
        goto LABEL_18;
      }
      goto LABEL_102;
    }
    long long v11 = [(EKEvent *)self endDateUnadjustedForLegacyClients];

    if (!v11)
    {
      if (a4)
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = 3;
        goto LABEL_18;
      }
      goto LABEL_102;
    }
    long long v12 = [(EKEvent *)self startDate];
    int v13 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
    uint64_t v14 = [v12 compare:v13];

    if (v14 >= 1)
    {
      if (a4)
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = 4;
LABEL_18:
        id v18 = [v15 errorWithEKErrorCode:v16];
        LOBYTE(v7) = 0;
        *a4 = v18;
        return v7;
      }
      goto LABEL_102;
    }
    BOOL v17 = [(EKEvent *)self _isParticipationStatusDirty];
    if (a3 == 1 && v17)
    {
      if (a4)
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = 13;
        goto LABEL_18;
      }
      goto LABEL_102;
    }
    uint64_t v19 = *MEMORY[0x1E4F56C80];
    if ([(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56C80]])
    {
      if ([(EKCalendarItem *)self hasRecurrenceRules])
      {
        int v20 = [(EKCalendarItem *)self recurrenceRules];
        int v21 = [v20 objectAtIndexedSubscript:0];

        if (v21 && ![(EKEvent *)self validateRecurrenceRule:v21 error:a4])
        {

          goto LABEL_102;
        }
      }
      else
      {
        int v21 = 0;
      }
    }
    BOOL v7 = [(EKEvent *)self _validateDatesAndRecurrencesGivenSpan:a3 error:a4];
    if (!v7) {
      return v7;
    }
    long long v22 = [(EKObject *)self eventStore];
    if (([v22 skipModificationValidation] & 1) != 0
      || ([MEMORY[0x1E4F57700] currentProcessHasSyncClientEntitlement] & 1) != 0)
    {
    }
    else
    {
      if ([(EKObject *)self isNew])
      {
        BOOL v28 = [(EKCalendarItem *)self hasAttendees];

        if (!v28) {
          goto LABEL_30;
        }
      }
      else
      {
      }
      uint64_t v29 = *MEMORY[0x1E4F56BA8];
      if ([(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56BA8]]
        && ![(EKEvent *)self allowsAttendeesModifications])
      {
        if (![(EKEvent *)self _isOnlyChangeToAttendeesSelfAttendeeParticipationStatus])
        {
          uint64_t v59 = v19;
          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          id obj = [(EKCalendarItem *)self attendees];
          uint64_t v50 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
          if (v50)
          {
            uint64_t v51 = v50;
            uint64_t v52 = *(void *)v66;
            uint64_t v53 = *MEMORY[0x1E4F56B48];
            int v54 = 1;
            do
            {
              for (uint64_t i = 0; i != v51; ++i)
              {
                if (*(void *)v66 != v52) {
                  objc_enumerationMutation(obj);
                }
                long long v56 = [*(id *)(*((void *)&v65 + 1) + 8 * i) changeSet];
                int v57 = [v56 hasUnsavedChangeForKey:v53];

                v54 &= v57 ^ 1;
              }
              uint64_t v51 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
            }
            while (v51);
          }
          else
          {
            int v54 = 1;
          }

          if (a4 && v54)
          {
            *a4 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:41];
          }
          uint64_t v19 = v59;
          if (v54) {
            goto LABEL_102;
          }
        }
      }
      else if ([(EKObject *)self _hasChangesForKey:v29] {
             && [(EKCalendarItem *)self isExternallyOrganizedInvitation])
      }
      {
        uint64_t v30 = [(EKEvent *)self committedValueForKey:v29];
        uint64_t v31 = [v30 valueForKey:*MEMORY[0x1E4F57150]];

        uint64_t v32 = (void *)MEMORY[0x1E4F1CA48];
        uint64_t v33 = [v31 allObjects];
        uint64_t v34 = [v32 arrayWithArray:v33];

        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v35 = v31;
        uint64_t v36 = [v35 countByEnumeratingWithState:&v61 objects:v70 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v62;
          do
          {
            for (uint64_t j = 0; j != v37; ++j)
            {
              if (*(void *)v62 != v38) {
                objc_enumerationMutation(v35);
              }
              [v34 removeObject:*(void *)(*((void *)&v61 + 1) + 8 * j)];
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v61 objects:v70 count:16];
          }
          while (v37);
        }

        uint64_t v40 = [v34 count];
        uint64_t v41 = v40;
        if (a4 && v40)
        {
          *a4 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:41];

          goto LABEL_102;
        }

        if (v41) {
          goto LABEL_102;
        }
      }
      else if ([(EKCalendarItem *)self hasAttendees])
      {
        long long v42 = [(EKCalendarItem *)self calendar];
        char v43 = [v42 allowsScheduling];

        if ((v43 & 1) == 0)
        {
          if (a4)
          {
            uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v16 = 0;
            goto LABEL_18;
          }
          goto LABEL_102;
        }
      }
    }
LABEL_30:
    if ([(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56B98]]
      && ![(EKEvent *)self allowsAlarmModifications])
    {
      if (a4)
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = 40;
        goto LABEL_18;
      }
      goto LABEL_102;
    }
    if ([(EKObject *)self _hasChangesForKey:v19]
      && ![(EKEvent *)self allowsRecurrenceModificationsForSpan:a3])
    {
      if (a4)
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = 39;
        goto LABEL_18;
      }
      goto LABEL_102;
    }
    if ([(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F57000]]
      && ![(EKEvent *)self allowsPrivacyLevelModifications])
    {
      if (a4)
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = 38;
        goto LABEL_18;
      }
      goto LABEL_102;
    }
    if ([(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56F80]])
    {
      double v23 = [(EKCalendarItem *)self calendar];
      long long v24 = [v23 source];

      int v25 = [(EKEvent *)self color];
      uint64_t v26 = [v25 source];
      id v27 = (void *)v26;
      if (v26 && v24)
      {
        if (([v24 isEqual:v26] & 1) == 0)
        {
          if (a4)
          {
            *a4 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:71];
          }

          goto LABEL_102;
        }
      }
      else if (v24 && v25 && !v26)
      {
        [v25 setSource:v24];
      }
    }
    v44 = [(EKEvent *)self constraints];
    if (![v44 supportsStructuredLocations])
    {
      v45 = [(EKCalendarItem *)self calendar];
      if (![v45 isSuggestedEventCalendar])
      {
        uint64_t v46 = [(EKCalendarItem *)self calendar];
        char v47 = [v46 isNaturalLanguageSuggestedEventCalendar];

        if ((v47 & 1) == 0)
        {
          if ([(EKObject *)self _hasChangesForKey:@"endLocation"])
          {
            v48 = [(EKEvent *)self endLocation];
            int v49 = [v48 isStructured];

            if (v49)
            {
              if (a4)
              {
                uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v16 = 19;
                goto LABEL_18;
              }
              goto LABEL_102;
            }
          }
        }
LABEL_80:
        LOBYTE(v7) = 1;
        return v7;
      }
    }
    goto LABEL_80;
  }
  return v7;
}

- (id)_generateNewUniqueID
{
  if ([(EKEvent *)self isReminderIntegrationEvent])
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2050000000;
    BOOL v3 = (void *)getREMReminderClass_softClass_1;
    uint64_t v16 = getREMReminderClass_softClass_1;
    if (!getREMReminderClass_softClass_1)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getREMReminderClass_block_invoke_1;
      void v12[3] = &unk_1E5B969D8;
      v12[4] = &v13;
      __getREMReminderClass_block_invoke_1((uint64_t)v12);
      BOOL v3 = (void *)v14[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v13, 8);
    objc_super v5 = (void *)[v4 newObjectID];
    BOOL v6 = [v5 urlRepresentation];
    BOOL v7 = [v6 absoluteString];
  }
  else
  {
    BOOL v8 = objc_opt_class();
    char v9 = [(EKCalendarItem *)self originalItem];
    id v10 = [(EKCalendarItem *)self calendar];
    BOOL v7 = [v8 generateUniqueIDWithEvent:self originalEvent:v9 calendar:v10];
  }

  return v7;
}

- (void)_willSave
{
  v3.receiver = self;
  v3.super_class = (Class)EKEvent;
  [(EKCalendarItem *)&v3 _willSave];
  [(EKEvent *)self _removeInvalidAlarmsDuringSave];
}

+ (BOOL)_allowSlicingFromDetachedOccurrence
{
  return [MEMORY[0x1E4F57690] isProgramSDKAtLeast:0x7E60901FFFFFFFFLL];
}

- (BOOL)saveWithSpan:(int64_t)a3 error:(id *)a4
{
  BOOL v6 = self;
  uint64_t v285 = *MEMORY[0x1E4F143B8];
  if (a4) {
    *a4 = 0;
  }
  if (![(EKObject *)self hasChanges]) {
    return 1;
  }
  if ([(EKObject *)v6 isUndeleted])
  {
    if (a3 && a3 != 3)
    {
      if (!a4) {
        return 0;
      }
      BOOL v8 = (void *)MEMORY[0x1E4F28C58];
      char v9 = @"Cannot undelete an event with the given span";
LABEL_31:
      uint64_t v10 = 13;
      goto LABEL_32;
    }
    if ([(EKEvent *)v6 isDetached])
    {
      [(EKEvent *)v6 _saveUndeletedDetachedOccurrence];
      return 1;
    }
    if ([(EKCalendarItem *)v6 hasRecurrenceRules])
    {
      if (a4)
      {
        BOOL v8 = (void *)MEMORY[0x1E4F28C58];
        char v9 = @"Cannot undelete an event that is part of a recurring series and not detached";
        uint64_t v10 = 5;
LABEL_32:
        [v8 errorWithEKErrorCode:v10 description:v9];
        BOOL v7 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        return v7;
      }
      return 0;
    }
  }
  if (![(EKEvent *)v6 isUndetached])
  {
    int64_t v12 = a3;
    if ((unint64_t)(a3 - 4) >= 0xFFFFFFFFFFFFFFFELL)
    {
      if ([(EKEvent *)v6 isDetached]) {
        int64_t v12 = 0;
      }
      else {
        int64_t v12 = 4;
      }
    }
    if ([(EKObject *)v6 _hasChangesForKey:*MEMORY[0x1E4F56C58]])
    {
      uint64_t v13 = [(EKEvent *)v6 _originallyCommittedVirtualConference];
      uint64_t v14 = [(EKEvent *)v6 virtualConference];
      if ([v13 isEqual:v14]) {
        id v227 = 0;
      }
      else {
        id v227 = v13;
      }
    }
    else
    {
      id v227 = 0;
    }
    if ([(EKEvent *)v6 _detectedConferenceURLOnBackingObjectMayBeInvalid])
    {
      uint64_t v15 = [(EKEvent *)v6 conferenceURLDetected];
      uint64_t v16 = [v15 absoluteString];
      [(EKObject *)v6 setSingleChangedValue:v16 forKey:*MEMORY[0x1E4F56F88]];
    }
    if ([(EKEvent *)v6 _needsAttendeePartStatReset])
    {
      [(EKEvent *)v6 dismissAttendeeRepliedNotification];
      long long v274 = 0u;
      long long v275 = 0u;
      long long v272 = 0u;
      long long v273 = 0u;
      BOOL v17 = [(EKEvent *)v6 attendeesNotIncludingOrganizer];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v272 objects:v284 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v273;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v273 != v20) {
              objc_enumerationMutation(v17);
            }
            [*(id *)(*((void *)&v272 + 1) + 8 * i) setParticipantStatus:1];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v272 objects:v284 count:16];
        }
        while (v19);
      }
    }
    uint64_t v234 = *MEMORY[0x1E4F56FB0];
    long long v22 = -[EKEvent committedValueForKey:](v6, "committedValueForKey:");
    double v23 = [MEMORY[0x1E4F1C9C8] date];
    v228 = v22;
    if ([v22 compare:v23] == -1)
    {
      id v35 = [(EKEvent *)v6 virtualConference];

      if (v35)
      {
        if ([(EKObject *)v6 _hasChangesForKey:*MEMORY[0x1E4F56C80]])
        {
          BOOL v223 = [(EKCalendarItem *)v6 hasRecurrenceRules];
          goto LABEL_49;
        }
        if ([(EKObject *)v6 _hasChangesForKey:v234])
        {
          uint64_t v53 = [(EKEvent *)v6 endDateUnadjustedForLegacyClients];
          BOOL v223 = [v23 compare:v53] == -1;

LABEL_49:
          BOOL v24 = [(EKObject *)v6 isPropertyUnavailable:*MEMORY[0x1E4F56BA8]];
          int v25 = (void *)MEMORY[0x1E4F56C88];
          v229 = v23;
          if (v24)
          {
            if ([(EKObject *)v6 isPropertyUnavailable:*MEMORY[0x1E4F56C88]]) {
              goto LABEL_74;
            }
            LOBYTE(v26) = 0;
          }
          else
          {
            long long v270 = 0u;
            long long v271 = 0u;
            long long v268 = 0u;
            long long v269 = 0u;
            id v27 = [(EKCalendarItem *)v6 attendees];
            uint64_t v28 = [v27 countByEnumeratingWithState:&v268 objects:v283 count:16];
            if (v28)
            {
              uint64_t v29 = v28;
              int64_t v230 = v12;
              uint64_t v30 = v6;
              uint64_t v31 = *(void *)v269;
              uint64_t v32 = *MEMORY[0x1E4F56B78];
              while (2)
              {
                for (uint64_t j = 0; j != v29; ++j)
                {
                  if (*(void *)v269 != v31) {
                    objc_enumerationMutation(v27);
                  }
                  uint64_t v34 = *(void **)(*((void *)&v268 + 1) + 8 * j);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass() & 1) != 0 && ([v34 _hasChangesForKey:v32])
                  {
                    int v26 = 1;
                    goto LABEL_66;
                  }
                }
                uint64_t v29 = [v27 countByEnumeratingWithState:&v268 objects:v283 count:16];
                if (v29) {
                  continue;
                }
                break;
              }
              int v26 = 0;
LABEL_66:
              BOOL v6 = v30;
              int64_t v12 = v230;
            }
            else
            {
              int v26 = 0;
            }

            if ([(EKObject *)v6 isPropertyUnavailable:*v25])
            {
              if (!v26) {
                goto LABEL_74;
              }
              goto LABEL_73;
            }
          }
          uint64_t v36 = [(EKCalendarItem *)v6 selfAttendee];
          char v37 = [v36 _hasChangesForKey:*MEMORY[0x1E4F56B78]];

          if (v26 & 1) != 0 || (v37)
          {
LABEL_73:
            uint64_t v38 = [MEMORY[0x1E4F1C9C8] date];
            [(EKEvent *)v6 setParticipationStatusModifiedDate:v38];
          }
LABEL_74:
          uint64_t v39 = *MEMORY[0x1E4F56F58];
          if ([(EKObject *)v6 _hasChangesForKey:*MEMORY[0x1E4F56F58]])
          {
            uint64_t v40 = [(EKCalendarItem *)v6 calendar];
            uint64_t v41 = [v40 supportedEventAvailabilities];

            if (!v41) {
              [(EKObject *)v6 setSingleChangedValue:&unk_1EF952BE0 forKey:v39];
            }
          }
          BOOL v222 = [(EKEvent *)v6 isMasterOrDetachedOccurrence];
          long long v42 = [(EKEvent *)v6 originalOccurrenceStartDate];
          char v43 = [v42 date];

          uint64_t v44 = *MEMORY[0x1E4F56D00];
          if ([(EKObject *)v6 _hasChangesForKey:*MEMORY[0x1E4F56D00]]
            || [(EKObject *)v6 _hasChangesForKey:v234]
            || [(EKObject *)v6 _hasChangesForKey:*MEMORY[0x1E4F56C38]])
          {
            v45 = [(EKEvent *)v6 recurrenceDate];
            if (v45)
            {
              id v267 = 0;
              id v46 = [(EKEvent *)v6 adjustedPersistedDateForDate:v45 withAdjustmentMode:1 pinMode:0 clientCalendarDate:&v267];
              id v47 = v267;
              uint64_t v48 = [v47 date];

              char v43 = (void *)v48;
            }
          }
          BOOL v49 = [(EKObject *)v6 _hasChangesForKey:v44];
          uint64_t v50 = [MEMORY[0x1E4F1C9A8] currentCalendar];
          v239 = (void *)[v50 copy];

          BOOL v221 = v49;
          if (v49)
          {
            if (v12)
            {
              if (![(EKObject *)v6 _hasChangesForKey:*MEMORY[0x1E4F56C80]])
              {
                uint64_t v51 = [(EKEvent *)v6 startDate];
                char v52 = [v43 isSameDayAsDate:v51 inCalendar:v239];

                if ((v52 & 1) == 0)
                {
                  if ([(EKCalendarItem *)v6 hasComplexRecurrence])
                  {
                    if (![(EKEvent *)v6 _attemptToUpdateComplexRecurrenceRule]) {
                      int64_t v12 = 0;
                    }
                  }
                  else
                  {
                    [(EKCalendarItem *)v6 pinRecurrenceRuleToEndsOfFreqency];
                  }
                }
              }
            }
          }
          int v54 = [(EKObject *)v6 eventStore];
          v233 = v43;
          if ([v54 eventAccessLevel] == 1)
          {
            long long v55 = [(EKCalendarItem *)v6 calendar];
            int v56 = [v55 isNew];

            if (v56)
            {
              if (a4)
              {
                id v57 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:61];
                v235 = 0;
LABEL_98:
                BOOL v7 = 0;
                *a4 = v57;
LABEL_118:
                long long v65 = v227;
                long long v64 = v228;
LABEL_296:

                return v7;
              }
              v235 = 0;
              goto LABEL_117;
            }
          }
          else
          {
          }
          uint64_t v226 = v44;
          if ([(EKObject *)v6 isNew])
          {
            v235 = 0;
          }
          else
          {
            BOOL v58 = [(EKEvent *)v6 _changesRequireDetachOrSlice];
            if ([(EKEvent *)v6 isDetached])
            {
              int v59 = [(id)objc_opt_class() _allowSlicingFromDetachedOccurrence];
              if (v12 == 1) {
                int v60 = v59;
              }
              else {
                int v60 = 1;
              }
              if (v60) {
                int64_t v61 = v12;
              }
              else {
                int64_t v61 = 0;
              }
              BOOL v62 = v61 == 1 && v58;
              if (v61)
              {
                long long v63 = [(EKCalendarItem *)v6 originalItem];
                v235 = [v63 previouslySavedCopy];
              }
              else
              {
                int64_t v12 = 0;
                v235 = 0;
              }
            }
            else
            {
              BOOL v62 = v58 && [(EKCalendarItem *)v6 _hadRecurrenceRules];
              v235 = [(EKEvent *)v6 previouslySavedCopy];
            }
            if ([(EKObject *)v6 _hasChangesForKey:*MEMORY[0x1E4F56BB0]])
            {
              int64_t v236 = a3;
              long long v66 = [(EKCalendarItem *)v6 calendar];
              [(EKCalendarItem *)v6 moveToCalendar:v66];

              if ([(EKEvent *)v6 isDetached])
              {
                long long v67 = [(EKCalendarItem *)v6 originalItem];
                long long v68 = [v67 calendar];
                objc_super v69 = [(EKCalendarItem *)v6 calendar];
                char v70 = [v68 isEqual:v69];

                if ((v70 & 1) == 0)
                {
                  if (a4)
                  {
                    id v57 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:37];
                    goto LABEL_98;
                  }
LABEL_117:
                  BOOL v7 = 0;
                  goto LABEL_118;
                }
              }
              int64_t v231 = v12;
              long long v265 = 0u;
              long long v266 = 0u;
              long long v263 = 0u;
              long long v264 = 0u;
              v71 = [(EKCalendarItem *)v6 detachedItems];
              uint64_t v72 = [v71 countByEnumeratingWithState:&v263 objects:v282 count:16];
              if (v72)
              {
                uint64_t v73 = v72;
                uint64_t v74 = *(void *)v264;
                while (2)
                {
                  for (uint64_t k = 0; k != v73; ++k)
                  {
                    if (*(void *)v264 != v74) {
                      objc_enumerationMutation(v71);
                    }
                    v76 = [*(id *)(*((void *)&v263 + 1) + 8 * k) calendar];
                    v77 = [(EKCalendarItem *)v6 calendar];
                    char v78 = [v76 isEqual:v77];

                    if ((v78 & 1) == 0)
                    {
                      if (a4)
                      {
                        *a4 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:37];
                      }

                      BOOL v7 = 0;
                      long long v65 = v227;
                      goto LABEL_295;
                    }
                  }
                  uint64_t v73 = [v71 countByEnumeratingWithState:&v263 objects:v282 count:16];
                  if (v73) {
                    continue;
                  }
                  break;
                }
              }

              int64_t v12 = v231;
              a3 = v236;
              uint64_t v44 = v226;
            }
            if ([(EKEvent *)v6 _isParticipationStatusDirty] && !v12)
            {
              if ([(EKCalendarItem *)v6 hasRecurrenceRules]
                && ([(EKEvent *)v6 constraints],
                    v79 = objc_claimAutoreleasedReturnValue(),
                    int v80 = [v79 mustAcknowledgeMasterEvent],
                    v79,
                    v80))
              {
                if ([(EKEvent *)v6 responseMustApplyToAll]) {
                  int64_t v12 = 4;
                }
                else {
                  int64_t v12 = 0;
                }
              }
              else
              {
                int64_t v12 = 0;
              }
            }
            v81 = [(EKEvent *)v6 constraints];
            int v82 = [v81 snoozeAlarmRequiresDetach];

            if (v82 && [(EKEvent *)v6 requiresDetachDueToSnoozedAlarm]) {
              int64_t v12 = 0;
            }
            if ([(EKObject *)v6 _hasChangesForKey:v44]
              || [(EKObject *)v6 _hasChangesForKey:v234]
              || [(EKObject *)v6 _hasChangesForKey:*MEMORY[0x1E4F56C38]])
            {
              [(EKCalendarItem *)v6 removeAllSnoozedAlarms];
            }
            else if ([(EKCalendarItem *)v6 isAlarmAcknowledgedPropertyDirty])
            {
              [(EKCalendarItem *)v6 removeAcknowledgedSnoozedAlarms];
            }
            if ([(EKEvent *)v6 isFirstOccurrence] && v12 == 1) {
              int64_t v12 = 4;
            }
            if (v12 != 4 && v62)
            {
              v84 = [(EKEvent *)v6 originalOccurrenceStartDate];
              v85 = [v84 date];

              v86 = [(EKEvent *)v6 occurrenceStartDate];
              v87 = [v86 date];

              if ([(EKEvent *)v6 isFloating])
              {
                v88 = [(EKObject *)v6 eventStore];
                v89 = [v88 timeZone];
                uint64_t v90 = [v85 dateInTimeZone:0 fromTimeZone:v89];

                v91 = [(EKObject *)v6 eventStore];
                v92 = [v91 timeZone];
                uint64_t v93 = [v87 dateInTimeZone:0 fromTimeZone:v92];

                v85 = (void *)v90;
                v87 = (void *)v93;
              }
              [(EKEvent *)v6 _detachOrSliceWithSpan:v12 withOriginalStartDate:v85 newStartDate:v87];
            }
            if ([(EKEvent *)v6 requiresDetachDueToSnoozedAlarm])
            {
              [(EKEvent *)v6 setRequiresDetachDueToSnoozedAlarm:0];
            }
            else if (([(EKCalendarItem *)v6 modifiedProperties] & 0x80) != 0)
            {
              [(EKCalendarItem *)v6 setModifiedProperties:[(EKCalendarItem *)v6 modifiedProperties] & 0xFFFFFF7FLL];
            }
            [(EKCalendarItem *)v6 _updateModifiedAlarmByAcknowledging];
            if (([(EKCalendarItem *)v6 modifiedProperties] & 0x200) != 0
              && ![(EKObject *)v6 _hasChangesForKey:*MEMORY[0x1E4F56FD8]])
            {
              [(EKCalendarItem *)v6 setModifiedProperties:[(EKCalendarItem *)v6 modifiedProperties] & 0xFFFFFDFFLL];
            }
          }
          [(EKCalendarItem *)v6 addOrganizerAndSelfAttendeeForNewInvitation];
          [(EKCalendarItem *)v6 removeLastExtraneousOrganizerAndSelfAttendee];
          [(EKEvent *)v6 _updateUUIDForNewParticipants];
          v94 = [(EKEvent *)v6 constraints];
          int v95 = [v94 requiresOccurrencesConformToRecurrenceRule];

          if (v95)
          {
            if ([(EKEvent *)v6 _isSimpleRepeatingEvent])
            {
              v96 = [(EKCalendarItem *)v6 recurrenceRules];
              BOOL v97 = [(EKEvent *)v6 conformsToRecurrenceRules:v96];

              if (!v97)
              {
                if (v12)
                {
                  v98 = [(EKCalendarItem *)v6 recurrenceRules];
                  v99 = [v98 objectAtIndexedSubscript:0];

                  uint64_t v100 = [v99 frequency];
                  uint64_t v101 = [v99 interval];
                  v102 = [v99 recurrenceEnd];
                  v103 = +[EKRecurrenceRule recurrenceRuleWithType:v100 interval:v101 end:v102];
                  v281 = v103;
                  v104 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v281 count:1];
                  [(EKEvent *)v6 setRecurrenceRules:v104];
                }
              }
            }
          }
          if ([(EKEvent *)v6 _isParticipationStatusDirty])
          {
            v105 = [(EKEvent *)v6 constraints];
            int v106 = [v105 mustAcknowledgeMasterEvent];

            if (v106)
            {
              if ([(EKEvent *)v6 isDetached] && v12 == 4)
              {
                v107 = [(EKCalendarItem *)v6 originalItem];
                if (v107)
                {
                  uint64_t v108 = [(EKEvent *)v6 participationStatus];
                  if (v108 == 3) {
                    uint64_t v109 = 4;
                  }
                  else {
                    uint64_t v109 = v108;
                  }
                  [v107 setParticipationStatus:v109];
                }
              }
            }
          }
          uint64_t v110 = *MEMORY[0x1E4F56FC8];
          if ([(EKObject *)v6 _hasChangesForKey:*MEMORY[0x1E4F56FC8]])
          {
            v111 = [(EKEvent *)v6 image];
            v112 = [(EKCalendarItem *)v6 calendar];
            [v111 saveInCalendar:v112];

            v113 = [(EKObject *)v6 changeSet];
            v114 = [(EKEvent *)v6 image];
            v115 = [v114 backingObject];
            [v113 forceChangeValue:v115 forKey:v110];
          }
          if ([(EKEvent *)v6 isDetached])
          {
            uint64_t v116 = *MEMORY[0x1E4F56C80];
            if ([(EKObject *)v6 _hasChangesForKey:*MEMORY[0x1E4F56C80]])
            {
              v117 = [(EKCalendarItem *)v6 recurrenceRules];
              uint64_t v118 = [(EKCalendarItem *)v6 originalItem];
              [(id)v118 setRecurrenceRules:v117];

              v119 = [(EKCalendarItem *)v6 originalItem];
              LOBYTE(v118) = [v119 hasRecurrenceRules];

              v120 = [(EKCalendarItem *)v6 originalItem];
              v121 = v120;
              if (v118)
              {
                [v120 _filterExceptionDatesAndDetachments];
              }
              else
              {
                [v120 setExceptionDates:0];

                v121 = [(EKCalendarItem *)v6 originalItem];
                [v121 setDetachedItems:0];
              }

              v122 = [(EKCalendarItem *)v6 originalItem];
              [v122 _updateModifiedProperties];

              v123 = [(EKCalendarItem *)v6 originalItem];
              [v123 updatePersistentValueForKeyIfNeeded:v116];

              v124 = [(EKCalendarItem *)v6 originalItem];
              [(EKObject *)v6 addCoCommitObject:v124];

              v125 = [(EKObject *)v6 changeSet];
              uint64_t v280 = v116;
              v126 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v280 count:1];
              [v125 rollbackChangesForKeys:v126];

              [(EKObject *)v6 emptyMeltedCacheForKey:v116];
            }
          }
          BOOL v129 = a3 != 3 && v12 != 0 && v235 != 0;
          v130 = [(EKCalendarItem *)v6 timeZone];
          [v239 setTimeZone:v130];

          v131 = (void *)MEMORY[0x1E4F56BD8];
          int64_t v232 = v12;
          if (v129)
          {
            v132 = objc_opt_new();
            uint64_t v133 = [(EKCalendarItem *)v6 originalItem];
            v134 = (void *)v133;
            if (v133) {
              v135 = (void *)v133;
            }
            else {
              v135 = v6;
            }
            id v136 = v135;

            v137 = [v136 singleRecurrenceRule];
            v138 = [v137 recurrenceEnd];

            v238 = v132;
            v220 = v136;
            v219 = v138;
            if (v138)
            {
              if ([v138 occurrenceCount])
              {
                v139 = objc_alloc_init(EKRecurrenceGenerator);
                v140 = [v136 singleRecurrenceRule];
                [v220 startDate];
                v142 = v141 = v131;
                v143 = [MEMORY[0x1E4F1C9C8] distantFuture];
                uint64_t v144 = [(EKEvent *)v6 effectiveTimeZone];
                v145 = v138;
                v146 = (void *)v144;
                LOBYTE(v218) = 0;
                int64_t v147 = a3;
                id v148 = -[EKRecurrenceGenerator copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:](v139, "copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:", v220, v140, v142, v143, v144, 0, [v145 occurrenceCount], v218);

                v132 = v238;
                v131 = v141;

                id v136 = v220;
                v138 = [v148 lastObject];

                a3 = v147;
              }
              else
              {
                v138 = [v138 endDate];
              }
            }
            int64_t v237 = a3;
            if (v232 == 4) {
              [v136 emptyMeltedCacheForKey:*v131];
            }
            long long v261 = 0u;
            long long v262 = 0u;
            long long v259 = 0u;
            long long v260 = 0u;
            v149 = [v136 detachedItems];
            uint64_t v150 = [v149 countByEnumeratingWithState:&v259 objects:v279 count:16];
            if (v150)
            {
              uint64_t v151 = v150;
              uint64_t v152 = *(void *)v260;
              do
              {
                for (uint64_t m = 0; m != v151; ++m)
                {
                  if (*(void *)v260 != v152) {
                    objc_enumerationMutation(v149);
                  }
                  uint64_t v154 = *(void *)(*((void *)&v259 + 1) + 8 * m);
                  if (v138)
                  {
                    v155 = [*(id *)(*((void *)&v259 + 1) + 8 * m) startDate];
                    int v156 = [v155 isBeforeOrSameDayAsDate:v138 inCalendar:v239];

                    v132 = v238;
                    if (!v156) {
                      continue;
                    }
                  }
                  [v132 addObject:v154];
                }
                uint64_t v151 = [v149 countByEnumeratingWithState:&v259 objects:v279 count:16];
              }
              while (v151);
            }

            if ([(EKEvent *)v6 isDetached])
            {
              v157 = [(EKCalendarItem *)v6 originalItem];
              [v132 addObject:v157];
            }
            v158 = [(EKEvent *)v6 startDate];
            v225 = [v239 components:254 fromDate:v233 toDate:v158 options:0];

            v159 = [(EKEvent *)v6 occurrenceStartDate];
            v160 = [(EKEvent *)v6 occurrenceEndDate];
            v224 = [(EKEvent *)v6 _calculateDurationWithStart:v159 end:v160 allDay:[(EKEvent *)v6 occurrenceIsAllDay]];

            v240 = objc_opt_new();
            long long v255 = 0u;
            long long v256 = 0u;
            long long v257 = 0u;
            long long v258 = 0u;
            v161 = [(EKObject *)v6 eventStore];
            v162 = [v161 eventsWithSameRecurrenceSetAsEvent:v6];

            uint64_t v163 = [v162 countByEnumeratingWithState:&v255 objects:v278 count:16];
            int64_t v164 = v237;
            if (v163)
            {
              uint64_t v165 = v163;
              uint64_t v166 = *(void *)v256;
              do
              {
                for (uint64_t n = 0; n != v165; ++n)
                {
                  if (*(void *)v256 != v166) {
                    objc_enumerationMutation(v162);
                  }
                  uint64_t v168 = *(void *)(*((void *)&v255 + 1) + 8 * n);
                  if (v164 == 4) {
                    goto LABEL_230;
                  }
                  v169 = [*(id *)(*((void *)&v255 + 1) + 8 * n) startDate];
                  [(EKEvent *)v6 startDate];
                  v171 = v170 = v6;
                  int v172 = [v169 isAfterDate:v171];

                  BOOL v6 = v170;
                  int64_t v164 = v237;
                  if (v172) {
LABEL_230:
                  }
                    [v240 addObject:v168];
                }
                uint64_t v165 = [v162 countByEnumeratingWithState:&v255 objects:v278 count:16];
              }
              while (v165);
            }

            [v240 sortUsingSelector:sel_compareStartDateWithEvent_];
            BOOL v129 = 1;
            v131 = (void *)MEMORY[0x1E4F56BD8];
          }
          else
          {
            v238 = 0;
            v240 = 0;
            v224 = 0;
            v225 = 0;
          }
          [(EKObject *)v6 insertPersistentObjectIfNeeded];
          [(EKEvent *)v6 _willSave];
          [(EKEvent *)v6 _updateVideoConferenceOnlyModified];
          v173 = [(EKObject *)v6 eventStore];
          char v174 = [v173 allowsIntegrationModifications];

          if ((v174 & 1) == 0 && [(EKEvent *)v6 isOrWasIntegrationEvent])
          {
            v175 = [(EKObject *)v6 eventStore];
            v176 = [(EKObject *)v6 backingObject];
            [v175 _markObjectUncommittable:v176];

            v177 = [(EKObject *)v6 persistentObject];
            if ([v177 isNew])
            {
              BOOL v178 = [(EKEvent *)v6 isDetached];

              if (v178) {
                goto LABEL_245;
              }
              v179 = v131;
              v177 = [(EKEvent *)v6 committedValueForKey:*MEMORY[0x1E4F56D38]];
              v180 = [(EKCalendarItem *)v6 uniqueID];
              v181 = v180;
              if (v177
                && v180
                && ([v180 isEqualToString:v177] & 1) == 0
                && ![(EKEvent *)v6 isDetached])
              {
                v182 = [(EKObject *)v6 eventStore];
                [v182 pendingIntegrationEventChangedIdentifierFrom:v177 to:v181];
              }
              v183 = [(EKObject *)v6 eventStore];
              [v183 addPendingIntegrationEvent:v6];

              v131 = v179;
            }
          }
LABEL_245:
          uint64_t v184 = *MEMORY[0x1E4F56BE0];
          uint64_t v185 = *v131;
          uint64_t v186 = *MEMORY[0x1E4F56C68];
          uint64_t v187 = *MEMORY[0x1E4F56C50];
          uint64_t v188 = *MEMORY[0x1E4F56FF0];
          uint64_t v189 = *MEMORY[0x1E4F56C80];
          uint64_t v190 = v185;
          v191 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v226, v234, *MEMORY[0x1E4F56BE0], v185, *MEMORY[0x1E4F56C68], *MEMORY[0x1E4F56C50], *MEMORY[0x1E4F56FF0], *MEMORY[0x1E4F56C80], 0);
          [(EKObject *)v6 updatePersistentObjectSkippingProperties:v191];

          if (v129)
          {
            if ([v238 count]) {
              [(EKEvent *)v6 _propagateChangesToDetachedEvents:v238 originalItemBeforeSave:v235 startDateOffset:v225 duration:v224 calendar:v239];
            }
            if ([v240 count])
            {
              [(EKEvent *)v6 _updateRecurrenceEndDateForEvent:v6 calendar:v239 withOffset:v225];
              v249[0] = MEMORY[0x1E4F143A8];
              v249[1] = 3221225472;
              v249[2] = __30__EKEvent_saveWithSpan_error___block_invoke;
              v249[3] = &unk_1E5B989D0;
              v249[4] = v6;
              id v250 = v235;
              id v251 = v225;
              id v252 = v224;
              id v253 = v239;
              id v254 = v240;
              [v254 enumerateObjectsUsingBlock:v249];
            }
          }
          uint64_t v192 = *MEMORY[0x1E4F56C38];
          if ([(EKObject *)v6 _hasChangesForKey:*MEMORY[0x1E4F56C38]])
          {
            v193 = v6;
            v194 = objc_msgSend(NSNumber, "numberWithBool:", -[EKEvent occurrenceIsAllDay](v6, "occurrenceIsAllDay"));
            [(EKEvent *)v193 setOriginalOccurrenceIsAllDay:v194];

            BOOL v6 = v193;
          }
          if (v221 && ![(EKObject *)v6 isNew] && v232)
          {
            [(EKEvent *)v6 _clearExceptionDatesAndUpdateDetachedOriginalDates:v6];
          }
          else if ([(EKObject *)v6 _hasChangesForKey:v189])
          {
            if ([(EKCalendarItem *)v6 hasRecurrenceRules])
            {
              [(EKEvent *)v6 _filterExceptionDatesAndDetachments];
            }
            else
            {
              [(EKCalendarItem *)v6 setExceptionDates:0];
              [(EKCalendarItem *)v6 setDetachedItems:0];
            }
          }
          [(EKObject *)v6 updatePersistentValueForKeyIfNeeded:v188];
          if (!v222 && [(EKCalendarItem *)v6 hasRecurrenceRules] && v232 == 4)
          {
            [(EKEvent *)v6 _applyTimeChangesToMaster];
          }
          else
          {
            [(EKObject *)v6 updatePersistentValueForKeyIfNeeded:v226];
            [(EKObject *)v6 updatePersistentValueForKeyIfNeeded:v234];
          }
          [(EKObject *)v6 updatePersistentValueForKeyIfNeeded:v184];
          [(EKObject *)v6 updatePersistentValueForKeyIfNeeded:v186];
          [(EKEvent *)v6 _updateModifiedPropertiesForThisEventAndAllDetachments];
          uint64_t v195 = [(EKCalendarItem *)v6 originalItem];
          v196 = (void *)v195;
          if (v195) {
            v197 = (void *)v195;
          }
          else {
            v197 = v6;
          }
          v198 = v197;

          [(EKObject *)v198 updatePersistentValueForKeyIfNeeded:v190];
          v199 = v6;
          if ([(EKObject *)v6 _hasChangesForKey:v192]
            || [(EKObject *)v6 _hasChangesForKey:v189])
          {
            if ([(EKEvent *)v6 isAllDay])
            {
              v200 = [(EKCalendarItem *)v6 recurrenceRules];
              v201 = [v200 lastObject];
              v202 = [v201 endDate];

              if (v202) {
                [(EKEvent *)v199 _updateRecurrenceEndDatesWithAdjustmentMode:0];
              }
            }
          }
          [(EKObject *)v198 updatePersistentValueForKeyIfNeeded:v189];
          [(EKObject *)v199 updatePersistentValueForKeyIfNeeded:v187];
          [(EKEvent *)v199 setPredictedLocationFrozen:0];
          v203 = [(EKEvent *)v199 occurrenceStartDate];
          [(EKEvent *)v199 setOriginalOccurrenceStartDate:v203];

          v204 = [(EKEvent *)v199 occurrenceEndDate];
          [(EKEvent *)v199 setOriginalOccurrenceEndDate:v204];

          [(EKEvent *)v199 _invalidateRecurrenceIdentifier];
          long long v65 = v227;
          v205 = v199;
          if (v198 == v199)
          {
            [(EKObject *)v199 cachedMeltedObjectsForMultiValueKey:v190];
            long long v245 = 0u;
            long long v246 = 0u;
            long long v247 = 0u;
            long long v248 = 0u;
            id v206 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v207 = [v206 countByEnumeratingWithState:&v245 objects:v277 count:16];
            if (v207)
            {
              uint64_t v208 = v207;
              uint64_t v209 = *(void *)v246;
              do
              {
                for (iuint64_t i = 0; ii != v208; ++ii)
                {
                  if (*(void *)v246 != v209) {
                    objc_enumerationMutation(v206);
                  }
                  [*(id *)(*((void *)&v245 + 1) + 8 * ii) _invalidateRecurrenceIdentifier];
                }
                uint64_t v208 = [v206 countByEnumeratingWithState:&v245 objects:v277 count:16];
              }
              while (v208);
            }
          }
          else
          {
            [(EKEvent *)v198 _deleteErrorIfInvalid];
          }
          [(EKEvent *)v205 _deleteErrorIfInvalid];
          if (v227)
          {
            long long v243 = 0u;
            long long v244 = 0u;
            long long v241 = 0u;
            long long v242 = 0u;
            v211 = [v227 joinMethods];
            uint64_t v212 = [v211 countByEnumeratingWithState:&v241 objects:v276 count:16];
            if (v212)
            {
              uint64_t v213 = v212;
              uint64_t v214 = *(void *)v242;
              do
              {
                for (juint64_t j = 0; jj != v213; ++jj)
                {
                  if (*(void *)v242 != v214) {
                    objc_enumerationMutation(v211);
                  }
                  v216 = [*(id *)(*((void *)&v241 + 1) + 8 * jj) URL];
                  [(EKEvent *)v205 invalidateVirtualConferenceURLIfNeededOnCommit:v216];
                }
                uint64_t v213 = [v211 countByEnumeratingWithState:&v241 objects:v276 count:16];
              }
              while (v213);
            }
          }
          if (v223)
          {
            v217 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:31622400.0];
            [(EKEvent *)v205 _extendConferenceURLExpirationDateToDate:v217];
          }
          BOOL v7 = 1;
LABEL_295:
          long long v64 = v228;
          goto LABEL_296;
        }
      }
    }
    BOOL v223 = 0;
    goto LABEL_49;
  }
  if (a3 && a3 != 3)
  {
    if (!a4) {
      return 0;
    }
    BOOL v8 = (void *)MEMORY[0x1E4F28C58];
    char v9 = @"Cannot undetach an event with the given span";
    goto LABEL_31;
  }

  return [(EKEvent *)v6 _saveUndetachedOccurrenceWithError:a4];
}

void __30__EKEvent_saveWithSpan_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  uint64_t v8 = a1[8];
  char v9 = (void *)a1[9];
  id v10 = a2;
  objc_msgSend(v4, "_propagateChangesToSlice:originalItemBeforeSave:startDateOffset:duration:calendar:updateRecurrenceEnd:", v10, v5, v6, v7, v8, objc_msgSend(v9, "count") - 1 != a3);
}

- (BOOL)_needsAttendeePartStatReset
{
  if (([MEMORY[0x1E4F57700] currentProcessHasSyncClientEntitlement] & 1) != 0
    || ![(EKCalendarItem *)self hasAttendees]
    || [(EKCalendarItem *)self isExternallyOrganizedInvitation])
  {
    return 0;
  }

  return [(EKEvent *)self isDifferentFromCommittedEventAndRequiresRSVP];
}

- (void)_deleteErrorIfInvalid
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(EKCalendarItem *)self syncError];
  id v4 = v3;
  if (v3 && ([v3 isNew] & 1) == 0)
  {
    uint64_t v5 = [v4 userInfo];
    uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F57550]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        while (2)
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            int64_t v12 = -[EKEvent _eventKitPropertyKeyForCalendarItemErrorPropertyKey:](self, "_eventKitPropertyKeyForCalendarItemErrorPropertyKey:", *(void *)(*((void *)&v13 + 1) + 8 * v11), (void)v13);
            if (v12 && [(EKObject *)self _hasChangesForKey:v12])
            {

              [(EKCalendarItem *)self setSyncError:0];
              [(EKObject *)self updatePersistentValueForKeyIfNeeded:*MEMORY[0x1E4F56D28]];
              goto LABEL_15;
            }

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
LABEL_15:
  }
}

- (id)_eventKitPropertyKeyForCalendarItemErrorPropertyKey:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F57558];
  v9[0] = *MEMORY[0x1E4F56BA0];
  objc_super v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  uint64_t v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)_saveUndeletedDetachedOccurrence
{
  [(EKObject *)self _initChangeSetIfNone];
  id v12 = [(EKCalendarItem *)self originalItem];
  objc_super v3 = [(EKEvent *)self originalStartDate];
  [v12 _removeExceptionDate:v3];

  [v12 updatePersistentValueForKeyIfNeeded:*MEMORY[0x1E4F56BE0]];
  id v4 = [(EKObject *)self frozenObject];
  uint64_t v5 = *MEMORY[0x1E4F56BD8];
  [v12 addMultiChangedObjectValue:v4 forKey:*MEMORY[0x1E4F56BD8]];

  [v12 emptyMeltedCacheForKey:v5];
  uint64_t v6 = [(EKObject *)self changeSet];
  id v7 = [v12 frozenObject];
  uint64_t v8 = *MEMORY[0x1E4F56C68];
  [v6 forceChangeValue:v7 forKey:*MEMORY[0x1E4F56C68]];

  uint64_t v9 = [(EKObject *)self changeSet];
  uint64_t v10 = [(EKEvent *)self _generateNewUniqueID];
  uint64_t v11 = *MEMORY[0x1E4F56D38];
  [v9 forceChangeValue:v10 forKey:*MEMORY[0x1E4F56D38]];

  [(EKObject *)self updatePersistentValueForKeyIfNeeded:v11];
  [(EKObject *)self updatePersistentValueForKeyIfNeeded:v8];
  [(EKObject *)self addCoCommitObject:v12];
  [(EKObject *)self insertPersistentObjectIfNeeded];
}

- (BOOL)_saveUndetachedOccurrenceWithError:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = [(EKEvent *)self masterEvent];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v4 detachedItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
      uint64_t v11 = [v10 originalStartDate];
      id v12 = [(EKEvent *)self startDate];
      char v13 = [v11 isEqualToDate:v12];

      if (v13) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v10;

    if (!v14) {
      goto LABEL_12;
    }
    [v14 _deleteSelfAndDetached];

    BOOL v15 = 1;
  }
  else
  {
LABEL_9:

LABEL_12:
    if (a3)
    {
      [MEMORY[0x1E4F28C58] errorWithEKErrorCode:5 description:@"Cannot undetach an event that is not detached"];
      BOOL v15 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (void)_extendConferenceURLExpirationDateToDate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(EKEvent *)self virtualConference];
  uint64_t v6 = v5;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = objc_msgSend(v5, "joinMethods", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v13 + 1) + 8 * v11) URL];
          +[EKConferenceUtils renewConferenceURL:v12 toDate:v4];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void)_updateModifiedPropertiesForThisEventAndAllDetachments
{
  id v2 = a1;
  objc_super v3 = [(id)OUTLINED_FUNCTION_5() privacyDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_10_0(&dword_1A4E47000, v4, v5, "Updating modified properties for event: %{public}@.", v6, v7, v8, v9, v10);
}

- (void)_updateVideoConferenceOnlyModified
{
  uint64_t v3 = *MEMORY[0x1E4F56C58];
  if (![(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56C58]]) {
    return;
  }
  id v18 = [(EKEvent *)self committedValueForKey:v3];
  uint64_t v4 = [(EKCalendarItem *)self notes];
  uint64_t v5 = [MEMORY[0x1E4F57698] deserializeConference:v18];
  uint64_t v6 = [MEMORY[0x1E4F57698] deserializeConference:v4];
  uint64_t v7 = [v5 conference];
  uint64_t v8 = [v6 conference];
  if (v7 == 0) != (v8 != 0) && (!v7 || ([v7 isEqual:v8])) {
    goto LABEL_14;
  }
  uint64_t v9 = [v5 range];
  uint64_t v11 = objc_msgSend(v18, "stringByReplacingCharactersInRange:withString:", v9, v10, &stru_1EF932508);
  if ([v11 hasSuffix:@"\n\n"])
  {
    uint64_t v12 = objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") - 2);

    uint64_t v11 = (void *)v12;
  }
  uint64_t v13 = [v6 range];
  long long v15 = objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v13, v14, &stru_1EF932508);
  if ([v15 hasSuffix:@"\n\n"])
  {
    uint64_t v16 = objc_msgSend(v15, "substringToIndex:", objc_msgSend(v15, "length") - 2);

    long long v15 = (void *)v16;
  }
  if ((!v11 || ([v11 isEqualToString:v15] & 1) == 0)
    && ([v11 length] || objc_msgSend(v15, "length")))
  {

LABEL_14:
    uint64_t v17 = [(EKCalendarItem *)self modifiedProperties] & 0xFFFFDFFFLL;
    goto LABEL_15;
  }

  if (([(EKCalendarItem *)self modifiedProperties] & 0x20) != 0) {
    goto LABEL_16;
  }
  uint64_t v17 = [(EKCalendarItem *)self modifiedProperties] | 0x2000;
LABEL_15:
  [(EKCalendarItem *)self setModifiedProperties:v17];
LABEL_16:
}

- (void)_updateModifiedProperties
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v6 = [a1 modifiedProperties];
  int v7 = [a1 modifiedProperties];
  if (v7 == a2)
  {
    uint64_t v8 = @"Modified properties changed: NO";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Modified properties changed: YES. Old modified properties: %u", a2);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v9 = (int)[a1 clearModifiedFlags];
  uint64_t v10 = [a1 privacyDescription];
  *(_DWORD *)buf = 67109890;
  int v12 = v6;
  __int16 v13 = 2114;
  uint64_t v14 = v8;
  __int16 v15 = 2048;
  uint64_t v16 = v9;
  __int16 v17 = 2114;
  id v18 = v10;
  _os_log_debug_impl(&dword_1A4E47000, a3, OS_LOG_TYPE_DEBUG, "Updated modified properties: %u. %{public}@. Clear modified flags: %lu. Event: %{public}@", buf, 0x26u);

  if (v7 != a2) {
}
  }

- (void)applyChangesFromEvent:(id)a3 toEvent:(id)a4 ignoringDifferencesFrom:(id)a5
{
  v18[5] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CA80];
  id v10 = a5;
  id v11 = a3;
  int v12 = +[EKEvent knownKeysToSkipForFutureChanges];
  __int16 v13 = [v9 setWithArray:v12];

  uint64_t v14 = [(EKEvent *)self constraints];
  LODWORD(v12) = [v14 requiresSeparateFilesForAllAttachments];

  if (v12) {
    [v13 addObject:*MEMORY[0x1E4F56BA0]];
  }
  if (([v8 isSelfOrganized] & 1) == 0
    && [v8 isSignificantlyDetachedIgnoringParticipation])
  {
    uint64_t v15 = *MEMORY[0x1E4F56B78];
    v18[0] = *MEMORY[0x1E4F56B70];
    v18[1] = v15;
    uint64_t v16 = *MEMORY[0x1E4F56FD8];
    v18[2] = *MEMORY[0x1E4F56B58];
    v18[3] = v16;
    v18[4] = *MEMORY[0x1E4F56FF8];
    __int16 v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:5];
    [v13 addObjectsFromArray:v17];
  }
  [v13 addObject:*MEMORY[0x1E4F56C88]];
  +[EKObject addChangesFromObject:v11 toObject:v8 exceptWhereObjectIsDifferentFrom:v10 skippingChanges:v13];
}

- (void)_updateRecurrenceEndDateForEvent:(id)a3 calendar:(id)a4 withOffset:(id)a5
{
  id v20 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v20 singleRecurrenceRule];
  id v10 = v9;
  if (v9)
  {
    if ([v9 interval] >= 1)
    {
      id v11 = [v10 recurrenceEnd];
      int v12 = [v11 endDate];

      if (v12)
      {
        __int16 v13 = [v10 recurrenceEnd];
        uint64_t v14 = [v13 endDate];
        uint64_t v15 = [v7 dateByAddingComponents:v8 toDate:v14 options:0];

        uint64_t v16 = [v10 frequency];
        uint64_t v17 = [v10 interval];
        id v18 = +[EKRecurrenceEnd recurrenceEndWithEndDate:v15];
        uint64_t v19 = +[EKRecurrenceRule recurrenceRuleWithType:v16 interval:v17 end:v18];

        [v20 removeRecurrenceRule:v10];
        [v20 addRecurrenceRule:v19];
      }
    }
  }
}

- (void)_propagateChangesToSlice:(id)a3 originalItemBeforeSave:(id)a4 startDateOffset:(id)a5 duration:(id)a6 calendar:(id)a7 updateRecurrenceEnd:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  [(EKEvent *)self applyChangesFromEvent:self toEvent:v14 ignoringDifferencesFrom:v15];
  uint64_t v19 = [v15 startCalendarDate];
  id v20 = [v19 dayTimeComponents];

  long long v21 = [v14 startCalendarDate];
  long long v22 = [v21 dayTimeComponents];

  if (v8) {
    [v14 _updateRecurrenceEndDateForEvent:v14 calendar:v18 withOffset:v16];
  }
  uint64_t v23 = [v20 hour];
  if (v23 != [v22 hour]
    || (uint64_t v24 = [v20 minute], v24 != objc_msgSend(v22, "minute"))
    || (uint64_t v25 = [v20 second], v25 != objc_msgSend(v22, "second")))
  {
    [v16 setHour:0];
    [v16 setMinute:0];
    [v16 setSecond:0];
  }
  id v47 = v20;
  [v14 duration];
  double v27 = v26;
  uint64_t v28 = [v14 startDate];
  uint64_t v29 = [v18 dateByAddingComponents:v16 toDate:v28 options:0];
  [v14 setStartDate:v29];

  [v15 duration];
  id v46 = v22;
  if (v30 == v27)
  {
    uint64_t v31 = [v14 occurrenceStartDate];
    uint64_t v32 = [v31 calendarDateByComponentwiseAddingComponents:v17];
    uint64_t v33 = [v32 date];
  }
  else
  {
    uint64_t v31 = [v14 startDate];
    uint64_t v33 = [v31 dateByAddingTimeInterval:v27];
  }

  v45 = (void *)v33;
  [v14 _updateEndDateForDate:v33 withAdjustmentMode:0];
  [v14 _updateModifiedProperties];
  [v14 updatePersistentObjectSkippingProperties:0];
  [(EKObject *)self addCoCommitObject:v14];
  uint64_t v34 = [v14 detachedItems];
  uint64_t v50 = v15;
  uint64_t v48 = v18;
  BOOL v49 = v17;
  [(EKEvent *)self _propagateChangesToDetachedEvents:v34 originalItemBeforeSave:v15 startDateOffset:v16 duration:v17 calendar:v18];

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v51 = v14;
  id v35 = [v14 detachedItems];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v53;
    uint64_t v39 = *MEMORY[0x1E4F56BD8];
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v53 != v38) {
          objc_enumerationMutation(v35);
        }
        uint64_t v41 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        [v41 _updateModifiedProperties];
        long long v42 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v56 = v39;
        char v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
        uint64_t v44 = [v42 setWithArray:v43];
        [v41 updatePersistentObjectSkippingProperties:v44];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v37);
  }
}

- (void)_propagateChangesToDetachedEvents:(id)a3 originalItemBeforeSave:(id)a4 startDateOffset:(id)a5 duration:(id)a6 calendar:(id)a7
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v78 = a6;
  id v85 = a7;
  id v15 = [(EKEvent *)self constraints];
  int v77 = [v15 requiresSeparateFilesForAllAttachments];

  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v16 = v12;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v98 objects:v105 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v99;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v99 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v98 + 1) + 8 * i);
        if (([v21 isEqual:self] & 1) == 0) {
          [(EKEvent *)self applyChangesFromEvent:self toEvent:v21 ignoringDifferencesFrom:v13];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v98 objects:v105 count:16];
    }
    while (v18);
  }

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id obj = v16;
  uint64_t v22 = [obj countByEnumeratingWithState:&v94 objects:v104 count:16];
  uint64_t v23 = v85;
  if (v22)
  {
    uint64_t v24 = v22;
    uint64_t v25 = *(void *)v95;
    uint64_t v80 = *(void *)v95;
    v81 = self;
    do
    {
      uint64_t v26 = 0;
      uint64_t v82 = v24;
      do
      {
        if (*(void *)v95 != v25) {
          objc_enumerationMutation(obj);
        }
        double v27 = *(void **)(*((void *)&v94 + 1) + 8 * v26);
        uint64_t v28 = [v27 originalStartDate];
        if (v28)
        {
          uint64_t v29 = [v23 dateByAddingComponents:v14 toDate:v28 options:0];
          [v27 setOriginalStartDate:v29];

          if ([v27 isEqual:self]) {
            goto LABEL_35;
          }
          double v30 = (void *)MEMORY[0x1E4F57838];
          uint64_t v31 = (uint64_t)v28;
        }
        else
        {
          if ([v27 isEqual:self]) {
            goto LABEL_35;
          }
          double v30 = (void *)MEMORY[0x1E4F57838];
          uint64_t v31 = [v27 startDate];
          v79 = (void *)v31;
        }
        uint64_t v32 = [v23 timeZone];
        [v30 calendarDateWithDate:v31 timeZone:v32];
        v34 = uint64_t v33 = v23;

        if (!v28) {
        id v35 = (void *)MEMORY[0x1E4F57838];
        }
        uint64_t v36 = [v27 startDate];
        uint64_t v37 = [v33 timeZone];
        uint64_t v38 = [v35 calendarDateWithDate:v36 timeZone:v37];

        uint64_t v39 = objc_opt_new();
        uint64_t v40 = [v34 hour];
        if (v40 == [v38 hour])
        {
          uint64_t v41 = [v34 minute];
          if (v41 == [v38 minute])
          {
            uint64_t v42 = [v34 second];
            if (v42 == [v38 second])
            {
              objc_msgSend(v39, "setHour:", objc_msgSend(v14, "hour"));
              objc_msgSend(v39, "setMinute:", objc_msgSend(v14, "minute"));
              objc_msgSend(v39, "setSecond:", objc_msgSend(v14, "second"));
            }
          }
        }
        uint64_t v43 = [v34 era];
        if (v43 == [v38 era])
        {
          uint64_t v44 = [v34 year];
          if (v44 == [v38 year])
          {
            uint64_t v45 = [v34 month];
            if (v45 == [v38 month])
            {
              uint64_t v46 = [v34 day];
              if (v46 == [v38 day])
              {
                objc_msgSend(v39, "setEra:", objc_msgSend(v14, "era"));
                objc_msgSend(v39, "setYear:", objc_msgSend(v14, "year"));
                objc_msgSend(v39, "setMonth:", objc_msgSend(v14, "month"));
                objc_msgSend(v39, "setDay:", objc_msgSend(v14, "day"));
              }
            }
          }
        }
        v84 = v34;
        [v27 duration];
        double v48 = v47;
        BOOL v49 = [v27 startDate];
        uint64_t v50 = v39;
        uint64_t v51 = [v85 dateByAddingComponents:v39 toDate:v49 options:0];
        [v27 setStartDate:v51];

        [v13 duration];
        if (v52 == v48)
        {
          long long v53 = [v27 occurrenceStartDate];
          [v53 calendarDateByComponentwiseAddingComponents:v78];
          id v54 = v14;
          v56 = id v55 = v13;
          id v57 = [v56 date];

          id v13 = v55;
          id v14 = v54;
        }
        else
        {
          long long v53 = [v27 startDate];
          id v57 = [v53 dateByAddingTimeInterval:v48];
        }
        uint64_t v25 = v80;

        [v27 _updateEndDateForDate:v57 withAdjustmentMode:0];
        self = v81;
        uint64_t v24 = v82;
        uint64_t v23 = v85;
LABEL_35:

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [obj countByEnumeratingWithState:&v94 objects:v104 count:16];
    }
    while (v24);
  }

  uint64_t v58 = (void *)MEMORY[0x1E4F1CA80];
  int v59 = +[EKEvent knownKeysToUseForFutureChanges];
  int v60 = [v58 setWithArray:v59];

  if (v77)
  {
    [v60 removeObject:*MEMORY[0x1E4F56BA0]];
    [(EKEvent *)self _duplicateAddedAttachmentsToDetachedEvents:obj];
  }
  int64_t v61 = [(EKCalendarItem *)self selfAttendee];
  BOOL v62 = [(EKObject *)self changeSet];
  int v63 = [v62 hasUnsavedChangeForKey:*MEMORY[0x1E4F56C88]];

  if (v63)
  {
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v64 = obj;
    uint64_t v65 = [v64 countByEnumeratingWithState:&v90 objects:v103 count:16];
    if (v65)
    {
      uint64_t v66 = v65;
      uint64_t v67 = *(void *)v91;
      do
      {
        for (uint64_t j = 0; j != v66; ++j)
        {
          if (*(void *)v91 != v67) {
            objc_enumerationMutation(v64);
          }
          [*(id *)(*((void *)&v90 + 1) + 8 * j) _updateSelfAttendeeToMatchSelfAttendee:v61];
        }
        uint64_t v66 = [v64 countByEnumeratingWithState:&v90 objects:v103 count:16];
      }
      while (v66);
    }
  }
  if ([(EKEvent *)self isDetached])
  {
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v69 = obj;
    uint64_t v70 = [v69 countByEnumeratingWithState:&v86 objects:v102 count:16];
    if (v70)
    {
      uint64_t v71 = v70;
      uint64_t v72 = *(void *)v87;
      do
      {
        uint64_t v73 = 0;
        do
        {
          if (*(void *)v87 != v72) {
            objc_enumerationMutation(v69);
          }
          __102__EKEvent__propagateChangesToDetachedEvents_originalItemBeforeSave_startDateOffset_duration_calendar___block_invoke(v70, *(void **)(*((void *)&v86 + 1) + 8 * v73++));
        }
        while (v71 != v73);
        uint64_t v70 = [v69 countByEnumeratingWithState:&v86 objects:v102 count:16];
        uint64_t v71 = v70;
      }
      while (v70);
    }

    uint64_t v74 = [(EKEvent *)self originalStartDate];

    if (v74)
    {
      v75 = [(EKEvent *)self originalStartDate];
      v76 = [v85 dateByAddingComponents:v14 toDate:v75 options:0];
      [(EKEvent *)self setOriginalStartDate:v76];
    }
  }
}

void __102__EKEvent__propagateChangesToDetachedEvents_originalItemBeforeSave_startDateOffset_duration_calendar___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  [v2 _updateModifiedProperties];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = *MEMORY[0x1E4F56BD8];
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  uint64_t v5 = [v3 setWithArray:v4];
  [v2 updatePersistentObjectSkippingProperties:v5];
}

- (void)_updateSelfAttendeeToMatchSelfAttendee:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = [(EKCalendarItem *)self attendeesRaw];
    id v6 = (id)[v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if ([v9 isEqualToParticipant:v4])
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }
  [(EKCalendarItem *)self setSelfAttendee:v6];
}

- (void)_duplicateAddedAttachmentsToDetachedEvents:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(EKObject *)self changeSet];
  uint64_t v6 = *MEMORY[0x1E4F56BA0];
  int v7 = [v5 hasUnsavedMultiValueAdditionForKey:*MEMORY[0x1E4F56BA0]];

  if (v7)
  {
    uint64_t v38 = self;
    BOOL v8 = [(EKObject *)self changeSet];
    uint64_t v9 = [v8 multiValueAdditions];
    long long v10 = [v9 objectForKeyedSubscript:v6];

    long long v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v10, "count"));
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v51 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          uint64_t v18 = [v17 uniqueIdentifier];
          if (v18)
          {
            [v11 addObject:v18];
          }
          else
          {
            uint64_t v19 = EKLogHandle;
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v57 = v17;
              _os_log_error_impl(&dword_1A4E47000, v19, OS_LOG_TYPE_ERROR, "Ignoring added attachment without a UUID: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v50 objects:v58 count:16];
      }
      while (v14);
    }
    uint64_t v39 = v4;

    id v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v21 = [(EKCalendarItem *)v38 attachments];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v47 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void **)(*((void *)&v46 + 1) + 8 * j);
          double v27 = [v26 uniqueIdentifier];
          int v28 = [v11 containsObject:v27];

          if (v28) {
            [v20 addObject:v26];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v46 objects:v55 count:16];
      }
      while (v23);
    }

    uint64_t v29 = [v20 count];
    if (v29 != [v11 count])
    {
      double v30 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        [(EKEvent *)v30 _duplicateAddedAttachmentsToDetachedEvents:v11];
      }
    }
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __54__EKEvent__duplicateAddedAttachmentsToDetachedEvents___block_invoke;
    v44[3] = &unk_1E5B989F8;
    id v31 = v20;
    id v45 = v31;
    uint64_t v32 = (void (**)(void, void))MEMORY[0x1A6266730](v44);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v33 = v39;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v40 objects:v54 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v41;
      do
      {
        for (uint64_t k = 0; k != v35; ++k)
        {
          if (*(void *)v41 != v36) {
            objc_enumerationMutation(v33);
          }
          v32[2](v32, *(void *)(*((void *)&v40 + 1) + 8 * k));
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v40 objects:v54 count:16];
      }
      while (v35);
    }

    id v4 = v39;
  }
}

void __54__EKEvent__duplicateAddedAttachmentsToDetachedEvents___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "duplicateWithNewIdentity", (void)v10);
        [v3 addAttachment:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_updateUUIDForNewParticipants
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56BA8]];
  BOOL v4 = [(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56C60]];
  if (v4 || v3)
  {
    if (v4)
    {
      uint64_t v5 = [(EKCalendarItem *)self organizer];
      if ([v5 isNew]) {
        id v6 = v5;
      }
      else {
        id v6 = 0;
      }

      if (v3)
      {
LABEL_11:
        uint64_t v8 = [(EKCalendarItem *)self attendeesRaw];
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v50 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v7 = 0;
          uint64_t v11 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v46 != v11) {
                objc_enumerationMutation(v8);
              }
              long long v13 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              if ([v13 isNew])
              {
                if (!v7)
                {
                  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
                }
                [v7 addObject:v13];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v45 objects:v50 count:16];
          }
          while (v10);
        }
        else
        {
          uint64_t v7 = 0;
        }

        if (v6) {
          goto LABEL_26;
        }
LABEL_25:
        if (![v7 count])
        {
LABEL_43:

          return;
        }
LABEL_26:
        uint64_t v14 = objc_opt_new();
        uint64_t v15 = objc_opt_new();
        uint64_t v16 = [(EKCalendarItem *)self originalItem];
        uint64_t v17 = (void *)v16;
        if (v16) {
          uint64_t v18 = (EKEvent *)v16;
        }
        else {
          uint64_t v18 = self;
        }
        uint64_t v19 = v18;

        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __40__EKEvent__updateUUIDForNewParticipants__block_invoke_2;
        v41[3] = &unk_1E5B98A40;
        v41[4] = self;
        id v44 = &__block_literal_global_264;
        id v20 = v15;
        id v42 = v20;
        id v21 = v14;
        id v43 = v21;
        uint64_t v35 = v19;
        [(EKCalendarItem *)v19 _recursivelyPerformBlockOnSelfAndDetachedItems:v41 forSavingItem:self];
        uint64_t v22 = (uint64_t *)MEMORY[0x1E4F57150];
        if (v6)
        {
          uint64_t v23 = [v6 generateSemanticIdentifier];
          uint64_t v24 = [v20 objectForKeyedSubscript:v23];
          if (v24)
          {
            [v6 setUUID:v24];
            [v6 updatePersistentValueForKeyIfNeeded:*v22];
          }
        }
        uint64_t v34 = v20;
        id v36 = v6;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v25 = v7;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v49 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v38;
          uint64_t v29 = *v22;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v38 != v28) {
                objc_enumerationMutation(v25);
              }
              id v31 = *(void **)(*((void *)&v37 + 1) + 8 * j);
              uint64_t v32 = [v31 generateSemanticIdentifier];
              id v33 = [v21 objectForKeyedSubscript:v32];
              if (v33)
              {
                [v31 setUUID:v33];
                [v31 updatePersistentValueForKeyIfNeeded:v29];
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v49 count:16];
          }
          while (v27);
        }

        id v6 = v36;
        goto LABEL_43;
      }
    }
    else
    {
      id v6 = 0;
      if (v3) {
        goto LABEL_11;
      }
    }
    uint64_t v7 = 0;
    if (v6) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
}

void __40__EKEvent__updateUUIDForNewParticipants__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v4 = a3;
  uint64_t v5 = [v4 generateSemanticIdentifier];
  id v6 = [v4 UUID];

  if (v5)
  {
    if (v6)
    {
      uint64_t v7 = [v8 objectForKeyedSubscript:v5];

      if (!v7) {
        [v8 setObject:v6 forKeyedSubscript:v5];
      }
    }
  }
}

void __40__EKEvent__updateUUIDForNewParticipants__block_invoke_2(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if ((id)a1[4] != v3)
  {
    uint64_t v5 = a1[7];
    uint64_t v6 = a1[5];
    uint64_t v7 = [v3 organizer];
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = objc_msgSend(v4, "attendeesRaw", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          (*(void (**)(void))(a1[7] + 16))();
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (BOOL)isSignificantlyDetached
{
  id v2 = self;
  id v3 = [(EKCalendarItem *)self originalItem];
  LOBYTE(v2) = [(EKEvent *)v2 _isSignificantlyDetachedComparedToMaster:v3 shouldIgnorePartStat:0];

  return (char)v2;
}

- (BOOL)isSignificantlyDetachedIgnoringParticipation
{
  id v2 = self;
  id v3 = [(EKCalendarItem *)self originalItem];
  LOBYTE(v2) = [(EKEvent *)v2 _isSignificantlyDetachedComparedToMaster:v3 shouldIgnorePartStat:1];

  return (char)v2;
}

- (BOOL)_isSignificantlyDetachedComparedToMaster:(id)a3 shouldIgnorePartStat:(BOOL)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    long long v13 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      long long v14 = v13;
      long long v15 = [(EKEvent *)self privacyDescription];
      int v51 = 138543362;
      long long v52 = v15;
      _os_log_impl(&dword_1A4E47000, v14, OS_LOG_TYPE_INFO, "Event %{public}@ is not significantly detached because it is not detached", (uint8_t *)&v51, 0xCu);
    }
    goto LABEL_7;
  }
  if ([v6 isPhantom])
  {
    id v8 = (void *)EKLogHandle;
    BOOL v9 = 1;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = v8;
      uint64_t v11 = [(EKEvent *)self privacyDescription];
      int v51 = 138543362;
      long long v52 = v11;
      uint64_t v12 = "Event %{public}@ is significantly detached because its master is a phantom";
LABEL_31:
      _os_log_impl(&dword_1A4E47000, v10, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v51, 0xCu);

      goto LABEL_35;
    }
    goto LABEL_35;
  }
  long long v16 = [(EKEvent *)self startDate];
  uint64_t v17 = [(EKEvent *)self originalStartDate];
  char v18 = [v16 isEqualToDate:v17];

  if (v18)
  {
    uint64_t v19 = [(EKEvent *)self occurrenceStartDate];
    id v20 = [(EKEvent *)self occurrenceEndDate];
    id v21 = [v7 occurrenceStartDate];
    uint64_t v22 = [v7 occurrenceEndDate];
    uint64_t v23 = -[EKEvent _calculateDurationWithStart:end:allDay:](self, "_calculateDurationWithStart:end:allDay:", v21, v22, [v7 occurrenceIsAllDay]);
    uint64_t v24 = [v19 calendarDateByComponentwiseAddingComponents:v23];
    if (([v24 isEqual:v20] & 1) == 0)
    {
      id v42 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
      {
        id v43 = v42;
        id v44 = [(EKEvent *)self privacyDescription];
        int v51 = 138543362;
        long long v52 = v44;
        _os_log_impl(&dword_1A4E47000, v43, OS_LOG_TYPE_INFO, "Event %{public}@ is significantly detached because its end date differs", (uint8_t *)&v51, 0xCu);
      }
      BOOL v9 = 1;
      goto LABEL_35;
    }

    id v25 = [(EKEvent *)self locationWithoutPrediction];
    if (v25
      || ([v7 locationWithoutPrediction], (id v20 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v26 = [(EKEvent *)self locationWithoutPrediction];
      uint64_t v27 = [v7 locationWithoutPrediction];
      char v28 = [v26 isEqualToString:v27];

      if (v25)
      {

        if (v28) {
          goto LABEL_14;
        }
      }
      else
      {

        if (v28) {
          goto LABEL_14;
        }
      }
      long long v46 = (void *)EKLogHandle;
      BOOL v9 = 1;
      if (!os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO)) {
        goto LABEL_35;
      }
      uint64_t v10 = v46;
      uint64_t v11 = [(EKEvent *)self privacyDescription];
      int v51 = 138543362;
      long long v52 = v11;
      uint64_t v12 = "Event %{public}@ is significantly detached because its location differs";
      goto LABEL_31;
    }
LABEL_14:
    uint64_t v29 = [(EKEvent *)self title];
    if (v29 || ([v7 title], (id v20 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      double v30 = [(EKEvent *)self title];
      id v31 = [v7 title];
      char v32 = [v30 isEqualToString:v31];

      if (v29)
      {

        if (v32) {
          goto LABEL_18;
        }
LABEL_40:
        long long v47 = (void *)EKLogHandle;
        BOOL v9 = 1;
        if (!os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO)) {
          goto LABEL_35;
        }
        uint64_t v10 = v47;
        uint64_t v11 = [(EKEvent *)self privacyDescription];
        int v51 = 138543362;
        long long v52 = v11;
        uint64_t v12 = "Event %{public}@ is significantly detached because its title differs";
        goto LABEL_31;
      }

      if ((v32 & 1) == 0) {
        goto LABEL_40;
      }
    }
LABEL_18:
    EKEventStatus v33 = [(EKEvent *)self status];
    if (v33 != [v7 status])
    {
      long long v48 = (void *)EKLogHandle;
      BOOL v9 = 1;
      if (!os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO)) {
        goto LABEL_35;
      }
      uint64_t v10 = v48;
      uint64_t v11 = [(EKEvent *)self privacyDescription];
      int v51 = 138543362;
      long long v52 = v11;
      uint64_t v12 = "Event %{public}@ is significantly detached because its status differs";
      goto LABEL_31;
    }
    if (!a4)
    {
      if ([(EKCalendarItem *)self isExternallyOrganizedInvitation])
      {
        EKEventStatus v33 = [(EKEvent *)self participationStatus];
        uint64_t v34 = [v7 participationStatus];
        if (v33 != v34)
        {
          uint64_t v35 = v34;
          EKEventStatus v33 = +[EKParticipant needsResponseForParticipantStatus:v33];
          BOOL v36 = +[EKParticipant needsResponseForParticipantStatus:v35];
          if (!v33 || !v36)
          {
            long long v50 = (void *)EKLogHandle;
            BOOL v9 = 1;
            if (!os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO)) {
              goto LABEL_35;
            }
            uint64_t v10 = v50;
            uint64_t v11 = [(EKEvent *)self privacyDescription];
            int v51 = 138543362;
            long long v52 = v11;
            uint64_t v12 = "Event %{public}@ is significantly detached because it is externally organized and its participation status differs";
            goto LABEL_31;
          }
        }
      }
    }
    long long v37 = [(EKCalendarItem *)self organizer];
    if (v37 || ([v7 organizer], (EKEventStatus v33 = objc_claimAutoreleasedReturnValue()) != EKEventStatusNone))
    {
      long long v38 = [(EKCalendarItem *)self organizer];
      long long v39 = [v7 organizer];
      char v40 = [v38 isEqualToParticipant:v39];

      if (v37)
      {

        if ((v40 & 1) == 0) {
          goto LABEL_45;
        }
      }
      else
      {

        if ((v40 & 1) == 0)
        {
LABEL_45:
          long long v49 = (void *)EKLogHandle;
          BOOL v9 = 1;
          if (!os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO)) {
            goto LABEL_35;
          }
          uint64_t v10 = v49;
          uint64_t v11 = [(EKEvent *)self privacyDescription];
          int v51 = 138543362;
          long long v52 = v11;
          uint64_t v12 = "Event %{public}@ is significantly detached because its organizer differs";
          goto LABEL_31;
        }
      }
    }
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_35;
  }
  long long v41 = (void *)EKLogHandle;
  BOOL v9 = 1;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v41;
    uint64_t v11 = [(EKEvent *)self privacyDescription];
    int v51 = 138543362;
    long long v52 = v11;
    uint64_t v12 = "Event %{public}@ is significantly detached because its start date differs";
    goto LABEL_31;
  }
LABEL_35:

  return v9;
}

- (id)_updateMasterDate:(id)a3 forChangeToOccurrenceDate:(id)a4 fromOriginalOccurrenceDate:(id)a5
{
  id v6 = a3;
  uint64_t v7 = [(EKEvent *)self originalOccurrenceStartDate];
  id v8 = [(EKEvent *)self occurrenceStartDate];
  BOOL v9 = [v8 differenceAsDateComponents:v7 units:254];
  uint64_t v10 = [v6 calendarDateByComponentwiseAddingComponents:v9];

  uint64_t v11 = [v10 date];

  return v11;
}

- (void)_applyTimeChangesToMaster
{
  uint64_t v3 = *MEMORY[0x1E4F56D00];
  BOOL v4 = [(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56D00]];
  uint64_t v5 = *MEMORY[0x1E4F56FB0];
  BOOL v6 = [(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56FB0]];
  BOOL v7 = v6;
  if (v4 || v6)
  {
    id v8 = [EKEvent alloc];
    BOOL v9 = [(EKObject *)self persistentObject];
    char v18 = [(EKEvent *)v8 initWithPersistentObject:v9];

    if (v4)
    {
      uint64_t v10 = [(EKEvent *)v18 occurrenceStartDate];
      uint64_t v11 = [(EKEvent *)self occurrenceStartDate];
      uint64_t v12 = [(EKEvent *)self originalOccurrenceStartDate];
      long long v13 = [(EKEvent *)self _updateMasterDate:v10 forChangeToOccurrenceDate:v11 fromOriginalOccurrenceDate:v12];
      [(EKEvent *)v18 setStartDateRaw:v13];

      [(EKObject *)v18 updatePersistentValueForKeyIfNeeded:v3];
    }
    if (v7)
    {
      long long v14 = [(EKEvent *)v18 occurrenceEndDate];
      long long v15 = [(EKEvent *)self occurrenceEndDate];
      long long v16 = [(EKEvent *)self originalOccurrenceEndDate];
      uint64_t v17 = [(EKEvent *)self _updateMasterDate:v14 forChangeToOccurrenceDate:v15 fromOriginalOccurrenceDate:v16];
      [(EKEvent *)v18 setEndDateRaw:v17];

      [(EKObject *)v18 updatePersistentValueForKeyIfNeeded:v5];
    }
  }
}

- (void)_clearExceptionDatesAndUpdateDetachedOriginalDates:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(EKEvent *)self isDetached])
  {
    uint64_t v5 = [(EKCalendarItem *)self originalItem];
    [v5 _clearExceptionDatesAndUpdateDetachedOriginalDates:v4];
  }
  else
  {
    [(EKCalendarItem *)self setExceptionDates:0];
    if (![(EKEvent *)self isAllDay])
    {
      BOOL v6 = [(EKCalendarItem *)self detachedItems];
      if ([v6 count])
      {
        if ([(EKEvent *)self isFloating]) {
          [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
        }
        else {
        BOOL v7 = [(EKCalendarItem *)self timeZone];
        }
        id v8 = [(EKEvent *)self startDateRaw];
        [v8 timeIntervalSinceReferenceDate];
        MEMORY[0x1A6265D40](v7);

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        uint64_t v23 = v6;
        id obj = v6;
        uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v30 != v11) {
                objc_enumerationMutation(obj);
              }
              long long v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              if ([v13 isEqual:v4]) {
                long long v14 = v4;
              }
              else {
                long long v14 = v13;
              }
              id v15 = v14;
              long long v16 = [v15 originalStartDate];
              [v16 timeIntervalSinceReferenceDate];
              MEMORY[0x1A6265D40](v7);
              uint64_t v17 = (void *)MEMORY[0x1E4F1C9C8];
              CalGregorianDateGetAbsoluteTimeWithFallbackToDefaultTimeZone();
              char v18 = objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");

              [v15 setOriginalStartDate:v18];
            }
            uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
          }
          while (v10);
        }

        BOOL v6 = v23;
      }
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v5 = [(EKCalendarItem *)self recurrenceRules];
    uint64_t v19 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * j) invalidateCachedEndDate];
        }
        uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v20);
    }
  }
}

- (BOOL)_attemptToUpdateComplexRecurrenceRule
{
  v194[1] = *MEMORY[0x1E4F143B8];
  if ([(EKCalendarItem *)self hasComplexRecurrence])
  {
    uint64_t v3 = [(EKEvent *)self singleRecurrenceRule];
    id v4 = (void *)MEMORY[0x1E4F1C9A8];
    uint64_t v5 = [(EKCalendarItem *)self timeZone];
    BOOL v6 = [v4 CalGregorianCalendarForTimeZone:v5];

    [v6 setFirstWeekday:1];
    BOOL v7 = [(EKEvent *)self originalOccurrenceStartDate];
    id v8 = [v7 date];
    uint64_t v9 = [v6 components:5656 fromDate:v8];

    uint64_t v10 = [(EKEvent *)self startDate];
    uint64_t v11 = [v6 components:5656 fromDate:v10];

    v179[0] = MEMORY[0x1E4F143A8];
    v179[1] = 3221225472;
    v179[2] = __48__EKEvent__attemptToUpdateComplexRecurrenceRule__block_invoke;
    v179[3] = &unk_1E5B98A68;
    id v12 = v3;
    id v180 = v12;
    id v13 = v11;
    id v181 = v13;
    id v166 = v9;
    id v182 = v166;
    v183 = self;
    id v14 = v6;
    id v184 = v14;
    id v15 = (void (**)(void))MEMORY[0x1A6266730](v179);
    if ([v12 frequency] == 1)
    {
      long long v16 = [v12 daysOfTheWeek];
      if (![(EKRecurrenceRule *)v16 count])
      {
        BOOL v36 = 1;
LABEL_77:

        goto LABEL_78;
      }
      id v155 = v14;
      uint64_t v17 = -[EKRecurrenceDayOfWeek initWithDayOfTheWeek:weekNumber:]([EKRecurrenceDayOfWeek alloc], "initWithDayOfTheWeek:weekNumber:", [v13 weekday], 0);
      id v18 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v163 = v17;
      v194[0] = v17;
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v194 count:1];
      uint64_t v20 = (void *)[v18 initWithArray:v19];

      long long v177 = 0u;
      long long v178 = 0u;
      long long v175 = 0u;
      long long v176 = 0u;
      long long v16 = v16;
      uint64_t v21 = [(EKRecurrenceRule *)v16 countByEnumeratingWithState:&v175 objects:v193 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v176;
        id v151 = v12;
        while (2)
        {
          uint64_t v24 = v15;
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v176 != v23) {
              objc_enumerationMutation(v16);
            }
            long long v26 = *(void **)(*((void *)&v175 + 1) + 8 * i);
            if ([v26 weekNumber]
              || (uint64_t v27 = [v26 dayOfTheWeek], v27 == objc_msgSend(v13, "weekday")))
            {
              BOOL v36 = 0;
              uint64_t v35 = v16;
              id v15 = v24;
              id v12 = v151;
              id v14 = v155;
              long long v37 = v163;
              id v34 = v20;
              goto LABEL_75;
            }
            uint64_t v28 = [v26 dayOfTheWeek];
            if (v28 != [v166 weekday]) {
              [v20 addObject:v26];
            }
          }
          uint64_t v22 = [(EKRecurrenceRule *)v16 countByEnumeratingWithState:&v175 objects:v193 count:16];
          id v15 = v24;
          id v12 = v151;
          if (v22) {
            continue;
          }
          break;
        }
      }

      [v20 sortUsingComparator:&__block_literal_global_274];
      long long v29 = [EKRecurrenceRule alloc];
      uint64_t v30 = [v12 frequency];
      uint64_t v31 = [v12 interval];
      long long v32 = [v12 recurrenceEnd];
      EKEventStatus v33 = v29;
      id v34 = v20;
      uint64_t v35 = [(EKRecurrenceRule *)v33 initRecurrenceWithFrequency:v30 interval:v31 daysOfTheWeek:v20 daysOfTheMonth:0 monthsOfTheYear:0 weeksOfTheYear:0 daysOfTheYear:0 setPositions:0 end:v32];

      [(EKEvent *)self setRecurrenceRule:v35];
      BOOL v36 = 1;
      id v14 = v155;
      long long v37 = v163;
      goto LABEL_75;
    }
    if ([v12 frequency] == 2)
    {
      long long v16 = [v12 daysOfTheWeek];
      long long v38 = [v12 daysOfTheMonth];
      id v34 = [v12 setPositions];
      if ([(EKRecurrenceDayOfWeek *)v38 count])
      {
        id v146 = v34;
        uint64_t v152 = v12;
        v142 = v15;
        id v156 = v14;
        uint64_t v39 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "day"));
        id v40 = objc_alloc(MEMORY[0x1E4F1CA48]);
        long long v41 = (EKRecurrenceRule *)v39;
        uint64_t v192 = v39;
        id v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v192 count:1];
        id v43 = (void *)[v40 initWithArray:v42];

        long long v173 = 0u;
        long long v174 = 0u;
        long long v171 = 0u;
        long long v172 = 0u;
        id v44 = v38;
        uint64_t v45 = [(EKRecurrenceRule *)v44 countByEnumeratingWithState:&v171 objects:v191 count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v172;
          v140 = v16;
          while (2)
          {
            for (uint64_t j = 0; j != v46; ++j)
            {
              if (*(void *)v172 != v47) {
                objc_enumerationMutation(v44);
              }
              long long v49 = *(void **)(*((void *)&v171 + 1) + 8 * j);
              uint64_t v50 = [v49 integerValue];
              if (v50 == [v13 day])
              {
                BOOL v36 = 0;
                long long v37 = (EKRecurrenceDayOfWeek *)v44;
                uint64_t v56 = v44;
                long long v16 = v140;
                id v12 = v152;
                goto LABEL_54;
              }
              uint64_t v51 = [v49 integerValue];
              if (v51 != [v166 day]) {
                [v43 addObject:v49];
              }
            }
            uint64_t v46 = [(EKRecurrenceRule *)v44 countByEnumeratingWithState:&v171 objects:v191 count:16];
            long long v16 = v140;
            if (v46) {
              continue;
            }
            break;
          }
        }
        long long v52 = v44;

        [v43 sortUsingComparator:&__block_literal_global_277];
        int64_t v164 = [EKRecurrenceRule alloc];
        id v12 = v152;
        uint64_t v53 = [v152 frequency];
        uint64_t v54 = [v152 interval];
        id v55 = [v152 recurrenceEnd];
        uint64_t v56 = [(EKRecurrenceRule *)v164 initRecurrenceWithFrequency:v53 interval:v54 daysOfTheWeek:0 daysOfTheMonth:v43 monthsOfTheYear:0 weeksOfTheYear:0 daysOfTheYear:0 setPositions:0 end:v55];

        id v57 = self;
        long long v37 = (EKRecurrenceDayOfWeek *)v52;
        [(EKEvent *)v57 setRecurrenceRule:v56];
        BOOL v36 = 1;
LABEL_54:

        id v14 = v156;
        id v15 = v142;
        id v34 = v146;
        uint64_t v35 = v41;
        goto LABEL_75;
      }
      uint64_t v165 = v38;
      if ([(EKRecurrenceRule *)v16 count] == 1)
      {
        uint64_t v80 = [EKRecurrenceRule alloc];
        uint64_t v144 = [v12 frequency];
        uint64_t v139 = [v12 interval];
        v15[2](v15);
        v158 = id v149 = v34;
        uint64_t v190 = v158;
        BOOL v36 = 1;
        v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v190 count:1];
        [v12 recurrenceEnd];
        v83 = id v82 = v14;
        uint64_t v35 = [(EKRecurrenceRule *)v80 initRecurrenceWithFrequency:v144 interval:v139 daysOfTheWeek:v81 daysOfTheMonth:0 monthsOfTheYear:0 weeksOfTheYear:0 daysOfTheYear:0 setPositions:0 end:v83];

        id v14 = v82;
        id v34 = v149;
        [(EKEvent *)self setRecurrenceRule:v35];
LABEL_74:
        long long v37 = v165;
        goto LABEL_75;
      }
      if (-[EKRecurrenceRule count](v16, "count") == 7 && [v34 count] == 1)
      {
        id v148 = v34;
        long long v93 = [v34 objectAtIndexedSubscript:0];
        uint64_t v94 = [v93 integerValue];

        if (v94 > 0) {
          goto LABEL_62;
        }
        v123 = [v148 objectAtIndexedSubscript:0];
        uint64_t v124 = [v123 integerValue];

        if (v124 < 0)
        {
          v125 = [(EKEvent *)self startDate];
          uint64_t v126 = [v14 daysInMonthContainingDate:v125];

          uint64_t v127 = v126 - [v13 day];
          if (v127 <= 1)
          {
            v128 = [EKRecurrenceRule alloc];
            uint64_t v162 = [v12 frequency];
            uint64_t v145 = [v12 interval];
            uint64_t v129 = [NSNumber numberWithInteger:~v127];
            id v130 = v14;
            v131 = (void *)v129;
            uint64_t v189 = v129;
            v132 = v12;
            uint64_t v133 = v16;
            v134 = v15;
            v135 = v130;
            id v136 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v189 count:1];
            v137 = [v132 recurrenceEnd];
            uint64_t v138 = [(EKRecurrenceRule *)v128 initRecurrenceWithFrequency:v162 interval:v145 daysOfTheWeek:v133 daysOfTheMonth:0 monthsOfTheYear:0 weeksOfTheYear:0 daysOfTheYear:0 setPositions:v136 end:v137];

            [(EKEvent *)self setRecurrenceRule:v138];
            BOOL v36 = 1;
            id v14 = v135;
            id v15 = v134;
            long long v16 = v133;
            id v12 = v132;
            uint64_t v35 = (EKRecurrenceRule *)v138;
            goto LABEL_63;
          }
LABEL_62:
          long long v95 = [EKRecurrenceRule alloc];
          uint64_t v96 = [v12 frequency];
          uint64_t v97 = [v12 interval];
          [v12 recurrenceEnd];
          v99 = id v98 = v14;
          uint64_t v35 = [(EKRecurrenceRule *)v95 initRecurrenceWithFrequency:v96 interval:v97 daysOfTheWeek:0 daysOfTheMonth:0 monthsOfTheYear:0 weeksOfTheYear:0 daysOfTheYear:0 setPositions:0 end:v99];

          id v14 = v98;
          [(EKEvent *)self setRecurrenceRule:v35];
          BOOL v36 = 1;
LABEL_63:
          long long v37 = v165;
          id v34 = v148;
LABEL_75:

          goto LABEL_76;
        }
LABEL_81:
        BOOL v36 = 0;
        long long v37 = v165;
        id v34 = v148;
        goto LABEL_76;
      }
      goto LABEL_66;
    }
    if ([v12 frequency] != 3)
    {
      BOOL v36 = 0;
LABEL_78:

      return v36;
    }
    long long v16 = [v12 daysOfTheWeek];
    uint64_t v58 = [v12 setPositions];
    id v34 = [v12 monthsOfTheYear];
    uint64_t v165 = v58;
    if (![(EKRecurrenceDayOfWeek *)v58 count]
      || [(EKRecurrenceRule *)v16 count] == 1
      || [(EKRecurrenceRule *)v16 count] == 7)
    {
      uint64_t v59 = [v13 month];
      if (v59 != [v166 month])
      {
        id v153 = v12;
        id v157 = v14;
        int v60 = v16;
        v143 = v15;
        uint64_t v61 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "month"));
        id v62 = objc_alloc(MEMORY[0x1E4F1CA48]);
        int64_t v147 = (EKRecurrenceRule *)v61;
        uint64_t v188 = v61;
        int v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v188 count:1];
        id v64 = (void *)[v62 initWithArray:v63];

        long long v169 = 0u;
        long long v170 = 0u;
        long long v167 = 0u;
        long long v168 = 0u;
        id v34 = v34;
        uint64_t v65 = [v34 countByEnumeratingWithState:&v167 objects:v187 count:16];
        if (v65)
        {
          uint64_t v66 = v65;
          uint64_t v67 = *(void *)v168;
          while (2)
          {
            for (uint64_t k = 0; k != v66; ++k)
            {
              if (*(void *)v168 != v67) {
                objc_enumerationMutation(v34);
              }
              id v69 = *(void **)(*((void *)&v167 + 1) + 8 * k);
              uint64_t v70 = [v69 integerValue];
              if (v70 == [v13 month])
              {

                BOOL v36 = 0;
                id v15 = v143;
                uint64_t v35 = v147;
                long long v16 = v60;
                id v12 = v153;
                id v14 = v157;
                goto LABEL_74;
              }
              uint64_t v71 = [v69 integerValue];
              if (v71 != [v166 month]) {
                [v64 addObject:v69];
              }
            }
            uint64_t v66 = [v34 countByEnumeratingWithState:&v167 objects:v187 count:16];
            if (v66) {
              continue;
            }
            break;
          }
        }

        [v64 sortUsingComparator:&__block_literal_global_279];
        id v34 = v64;

        id v15 = v143;
        long long v16 = v60;
        id v12 = v153;
        id v14 = v157;
      }
      if ([(EKRecurrenceRule *)v16 count] == 7 && [(EKRecurrenceDayOfWeek *)v165 count] == 1)
      {
        id v148 = v34;
        uint64_t v72 = [(EKRecurrenceDayOfWeek *)v165 objectAtIndexedSubscript:0];
        uint64_t v73 = [v72 integerValue];

        if (v73 <= 0)
        {
          v102 = [(EKRecurrenceDayOfWeek *)v165 objectAtIndexedSubscript:0];
          uint64_t v103 = [v102 integerValue];

          if ((v103 & 0x8000000000000000) == 0) {
            goto LABEL_81;
          }
          v104 = [(EKEvent *)self startDate];
          uint64_t v105 = [v14 daysInMonthContainingDate:v104];

          uint64_t v106 = v105 - [v13 day];
          if (v106 <= 1)
          {
            v107 = [EKRecurrenceRule alloc];
            uint64_t v108 = [v12 frequency];
            uint64_t v160 = [v12 interval];
            uint64_t v109 = [NSNumber numberWithInteger:~v106];
            id v110 = v14;
            v111 = (void *)v109;
            uint64_t v186 = v109;
            uint64_t v154 = v12;
            v112 = v16;
            v113 = v15;
            v114 = v110;
            v115 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v186 count:1];
            uint64_t v116 = [v154 recurrenceEnd];
            uint64_t v35 = [(EKRecurrenceRule *)v107 initRecurrenceWithFrequency:v108 interval:v160 daysOfTheWeek:v112 daysOfTheMonth:0 monthsOfTheYear:v148 weeksOfTheYear:0 daysOfTheYear:0 setPositions:v115 end:v116];

            id v34 = v148;
            [(EKEvent *)self setRecurrenceRule:v35];
            BOOL v36 = 1;
            id v14 = v114;
            id v15 = v113;
            long long v16 = v112;
            id v12 = v154;
            goto LABEL_74;
          }
        }
        uint64_t v74 = [EKRecurrenceRule alloc];
        uint64_t v75 = [v12 frequency];
        uint64_t v76 = [v12 interval];
        [v12 recurrenceEnd];
        id v78 = v77 = v14;
        v79 = v74;
        id v34 = v148;
        uint64_t v35 = [(EKRecurrenceRule *)v79 initRecurrenceWithFrequency:v75 interval:v76 daysOfTheWeek:0 daysOfTheMonth:0 monthsOfTheYear:v148 weeksOfTheYear:0 daysOfTheYear:0 setPositions:0 end:v78];

        id v14 = v77;
        goto LABEL_73;
      }
      if ([(EKRecurrenceRule *)v16 count] == 1)
      {
        v159 = [EKRecurrenceRule alloc];
        uint64_t v150 = [v12 frequency];
        uint64_t v84 = [v12 interval];
        uint64_t v85 = v15[2](v15);
        id v86 = v14;
        long long v87 = (void *)v85;
        uint64_t v185 = v85;
        v141 = v16;
        long long v88 = v15;
        long long v89 = v86;
        [MEMORY[0x1E4F1C978] arrayWithObjects:&v185 count:1];
        v91 = id v90 = v34;
        long long v92 = [v12 recurrenceEnd];
        uint64_t v35 = [(EKRecurrenceRule *)v159 initRecurrenceWithFrequency:v150 interval:v84 daysOfTheWeek:v91 daysOfTheMonth:0 monthsOfTheYear:v90 weeksOfTheYear:0 daysOfTheYear:0 setPositions:0 end:v92];

        id v34 = v90;
        [(EKEvent *)self setRecurrenceRule:v35];
        BOOL v36 = 1;
        id v14 = v89;
        id v15 = v88;
        long long v16 = v141;
        goto LABEL_74;
      }
      if (![(EKRecurrenceRule *)v16 count])
      {
        id v100 = v34;
        uint64_t v101 = [v13 month];
        if (v101 == [v166 month])
        {
          BOOL v36 = 1;
          long long v37 = v165;
          id v34 = v100;
          goto LABEL_76;
        }
        v117 = [EKRecurrenceRule alloc];
        uint64_t v118 = [v12 frequency];
        uint64_t v119 = [v12 interval];
        [v12 recurrenceEnd];
        v120 = id v161 = v14;
        v121 = v117;
        id v34 = v100;
        uint64_t v35 = [(EKRecurrenceRule *)v121 initRecurrenceWithFrequency:v118 interval:v119 daysOfTheWeek:v16 daysOfTheMonth:0 monthsOfTheYear:v100 weeksOfTheYear:0 daysOfTheYear:0 setPositions:0 end:v120];

        id v14 = v161;
LABEL_73:
        [(EKEvent *)self setRecurrenceRule:v35];
        BOOL v36 = 1;
        goto LABEL_74;
      }
    }
LABEL_66:
    BOOL v36 = 0;
    long long v37 = v165;
LABEL_76:

    goto LABEL_77;
  }
  return 1;
}

EKRecurrenceDayOfWeek *__48__EKEvent__attemptToUpdateComplexRecurrenceRule__block_invoke(id *a1)
{
  id v2 = [a1[4] daysOfTheWeek];
  uint64_t v3 = [v2 firstObject];

  uint64_t v4 = [a1[5] weekOfMonth];
  if (v4 == [a1[6] weekOfMonth])
  {
    uint64_t v5 = [EKRecurrenceDayOfWeek alloc];
    uint64_t v6 = [a1[5] weekday];
    uint64_t v7 = [v3 weekNumber];
    id v8 = v5;
    uint64_t v9 = v6;
LABEL_5:
    id v12 = [(EKRecurrenceDayOfWeek *)v8 initWithDayOfTheWeek:v9 weekNumber:v7];
    goto LABEL_6;
  }
  if ([v3 weekNumber] >= 1)
  {
    uint64_t v10 = [EKRecurrenceDayOfWeek alloc];
    uint64_t v11 = [a1[5] weekday];
    uint64_t v7 = [a1[5] weekdayOrdinal];
    id v8 = v10;
    uint64_t v9 = v11;
    goto LABEL_5;
  }
  uint64_t v14 = [a1[5] month];
  id v15 = [a1[7] startDate];
  id v16 = a1[8];
  uint64_t v17 = [a1[7] startDate];
  id v18 = [v16 components:5656 fromDate:v17];

  if ([v18 month] != v14)
  {
    unint64_t v19 = 0;
LABEL_17:
    uint64_t v27 = [EKRecurrenceDayOfWeek alloc];
    uint64_t v26 = [a1[5] weekday];
    uint64_t v24 = ~v19;
    long long v25 = v27;
    goto LABEL_18;
  }
  unint64_t v19 = 0;
  do
  {
    uint64_t v20 = v15;
    uint64_t v21 = v18;
    id v15 = [a1[8] dateByAddingUnit:4096 value:1 toDate:v15 options:0];

    id v18 = [a1[8] components:5656 fromDate:v15];

    if ([v18 month] == v14) {
      ++v19;
    }
  }
  while ([v18 month] == v14);
  if (v19 <= 1) {
    goto LABEL_17;
  }
  uint64_t v22 = [EKRecurrenceDayOfWeek alloc];
  uint64_t v23 = [a1[5] weekday];
  uint64_t v24 = [a1[5] weekdayOrdinal];
  long long v25 = v22;
  uint64_t v26 = v23;
LABEL_18:
  id v12 = [(EKRecurrenceDayOfWeek *)v25 initWithDayOfTheWeek:v26 weekNumber:v24];

LABEL_6:

  return v12;
}

uint64_t __48__EKEvent__attemptToUpdateComplexRecurrenceRule__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "dayOfTheWeek"));
  uint64_t v7 = NSNumber;
  uint64_t v8 = [v5 dayOfTheWeek];

  uint64_t v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

uint64_t __48__EKEvent__attemptToUpdateComplexRecurrenceRule__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __48__EKEvent__attemptToUpdateComplexRecurrenceRule__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)_filterExceptionDatesAndDetachments
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(EKObject *)self changeSet];
  char v4 = [v3 hasUnsavedMultiValueRemovalForKey:*MEMORY[0x1E4F56C80]];

  if (v4)
  {
    int v5 = 1;
  }
  else
  {
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    uint64_t v6 = [(EKCalendarItem *)self recurrenceRules];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v78 objects:v85 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v79;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v79 != v9) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v78 + 1) + 8 * i) dirtyStateMayAffectExceptionDates])
          {
            int v5 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v78 objects:v85 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    int v5 = 0;
LABEL_13:
  }
  uint64_t v11 = [(EKCalendarItem *)self exceptionDates];
  uint64_t v12 = [(EKCalendarItem *)self detachedItems];
  id v13 = (void *)v12;
  if (!v11)
  {
    BOOL v14 = 0;
    if (v12) {
      goto LABEL_16;
    }
LABEL_18:
    BOOL v15 = 0;
    goto LABEL_19;
  }
  BOOL v14 = [v11 count] != 0;
  if (!v13) {
    goto LABEL_18;
  }
LABEL_16:
  BOOL v15 = [v13 count] != 0;
LABEL_19:
  if ((v5 & v14 & 1) != 0 || v15)
  {
    uint64_t v16 = [(EKEvent *)self startDateRaw];
    if (v5)
    {
      int v63 = [v11 allObjects];
      uint64_t v17 = [(EKCalendarItem *)self exceptionDatesAdjustedForFloatingEvents];
      id v18 = [v17 allObjects];
    }
    else
    {
      id v18 = (void *)MEMORY[0x1E4F1CBF0];
      int v63 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v62 = v18;
    uint64_t v19 = [v18 valueForKeyPath:@"@max.self"];
    uint64_t v20 = (void *)v19;
    id v64 = (void *)v16;
    if (v19) {
      uint64_t v21 = (void *)v19;
    }
    else {
      uint64_t v21 = (void *)v16;
    }
    id v65 = v21;

    uint64_t v22 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v23 = [(EKCalendarItem *)self detachedItems];
    uint64_t v24 = objc_msgSend(v22, "dictionaryWithCapacity:", objc_msgSend(v23, "count"));

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v25 = [(EKCalendarItem *)self detachedItems];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v74 objects:v84 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v75;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v75 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void **)(*((void *)&v74 + 1) + 8 * j);
          uint64_t v31 = [v30 originalStartDate];
          [v24 setObject:v30 forKeyedSubscript:v31];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v74 objects:v84 count:16];
      }
      while (v27);
    }

    long long v32 = [v24 allKeys];
    uint64_t v33 = [v32 valueForKeyPath:@"@max.self"];
    id v34 = (void *)v33;
    uint64_t v35 = v64;
    if (v33) {
      BOOL v36 = (void *)v33;
    }
    else {
      BOOL v36 = v64;
    }
    id v37 = v36;

    long long v38 = [v65 laterDate:v37];
    uint64_t v39 = [v38 dateByAddingTimeInterval:1.0];

    id v40 = [(EKCalendarItem *)self timeZone];
    long long v41 = objc_alloc_init(EKRecurrenceGenerator);
    LOBYTE(v57) = 1;
    id v42 = [(EKRecurrenceGenerator *)v41 copyOccurrenceDatesWithEKEvent:self startDate:v64 endDate:v39 timeZone:v40 exceptionDates:0 limit:0 adjustDatesForAllDayEvents:v57];
    if ([v42 count])
    {
      uint64_t v58 = v41;
      uint64_t v59 = v40;
      int v60 = v39;
      id v61 = v37;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v43 = v63;
      uint64_t v44 = [v43 countByEnumeratingWithState:&v70 objects:v83 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v71;
        do
        {
          for (uint64_t k = 0; k != v45; ++k)
          {
            if (*(void *)v71 != v46) {
              objc_enumerationMutation(v43);
            }
            uint64_t v48 = *(void *)(*((void *)&v70 + 1) + 8 * k);
            if (([v42 containsObject:v48] & 1) == 0) {
              [(EKCalendarItem *)self _removeExceptionDate:v48];
            }
          }
          uint64_t v45 = [v43 countByEnumeratingWithState:&v70 objects:v83 count:16];
        }
        while (v45);
      }

      long long v49 = [v24 allKeys];
      uint64_t v50 = [(EKEvent *)self _leftoversInDates:v49 withGeneratedDates:v42];

      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v51 = v50;
      uint64_t v52 = [v51 countByEnumeratingWithState:&v66 objects:v82 count:16];
      if (v52)
      {
        uint64_t v53 = v52;
        uint64_t v54 = *(void *)v67;
        do
        {
          for (uint64_t m = 0; m != v53; ++m)
          {
            if (*(void *)v67 != v54) {
              objc_enumerationMutation(v51);
            }
            uint64_t v56 = [v24 objectForKeyedSubscript:*(void *)(*((void *)&v66 + 1) + 8 * m)];
            [(EKCalendarItem *)self _removeDetachedItem:v56];
          }
          uint64_t v53 = [v51 countByEnumeratingWithState:&v66 objects:v82 count:16];
        }
        while (v53);
      }

      uint64_t v35 = v64;
      uint64_t v39 = v60;
      id v37 = v61;
      long long v41 = v58;
      id v40 = v59;
    }
    else
    {
      [(EKCalendarItem *)self setExceptionDates:0];
      [(EKCalendarItem *)self setDetachedItems:0];
    }
  }
}

- (id)_leftoversInDates:(id)a3 withGeneratedDates:(id)a4
{
  int v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a3;
  uint64_t v7 = [v5 setWithArray:a4];
  uint64_t v8 = [MEMORY[0x1E4F1CA80] setWithArray:v6];

  uint64_t v9 = (void *)[v8 mutableCopy];
  [v9 intersectSet:v7];
  [v8 minusSet:v9];

  return v8;
}

- (void)_removeInvalidAlarmsDuringSave
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (![(EKObject *)self isPropertyUnavailable:*MEMORY[0x1E4F56B98]])
  {
    uint64_t v3 = [(EKCalendarItem *)self alarms];
    if ([v3 count])
    {
      char v4 = [(EKEvent *)self constraints];
      char v5 = [v4 supportsAlarmTriggerDates];

      if ((v5 & 1) == 0)
      {
        id v6 = [(EKCalendarItem *)self alarms];
        uint64_t v7 = (void *)[v6 copy];

        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v59 objects:v65 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v60;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v60 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v59 + 1) + 8 * i);
              if ([v13 isAbsolute])
              {
                [(EKCalendarItem *)self removeAlarm:v13];
                BOOL v14 = [(EKEvent *)self constraints];
                int v15 = [v14 supportsAlarmTriggerIntervals];

                if (v15)
                {
                  uint64_t v16 = [v13 absoluteDate];
                  uint64_t v17 = [(EKEvent *)self startDate];
                  [v16 timeIntervalSinceDate:v17];
                  double v19 = v18;

                  uint64_t v20 = +[EKAlarm alarmWithRelativeOffset:v19];
                  [(EKCalendarItem *)self addAlarm:v20];
                }
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v59 objects:v65 count:16];
          }
          while (v10);
        }
      }
      uint64_t v21 = [(EKEvent *)self constraints];
      char v22 = [v21 supportsAlarmTriggerIntervals];

      if ((v22 & 1) == 0)
      {
        uint64_t v23 = [(EKCalendarItem *)self alarms];
        uint64_t v24 = (void *)[v23 copy];

        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v25 = v24;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v55 objects:v64 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v56;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v56 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = *(void **)(*((void *)&v55 + 1) + 8 * j);
              if (([v30 isAbsolute] & 1) == 0) {
                [(EKCalendarItem *)self removeAlarm:v30];
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v55 objects:v64 count:16];
          }
          while (v27);
        }
      }
      uint64_t v31 = [(EKEvent *)self constraints];
      char v32 = [v31 supportsAlarmsTriggeringAfterStartDate];

      if ((v32 & 1) == 0)
      {
        uint64_t v33 = [(EKCalendarItem *)self alarms];
        id v34 = (void *)[v33 copy];

        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v35 = v34;
        uint64_t v36 = [v35 countByEnumeratingWithState:&v51 objects:v63 count:16];
        if (!v36) {
          goto LABEL_39;
        }
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v52;
        while (1)
        {
          for (uint64_t k = 0; k != v37; ++k)
          {
            if (*(void *)v52 != v38) {
              objc_enumerationMutation(v35);
            }
            id v40 = *(void **)(*((void *)&v51 + 1) + 8 * k);
            if (!objc_msgSend(v40, "isAbsolute", (void)v51))
            {
              [v40 relativeOffset];
              if (v44 <= 0.0) {
                continue;
              }
LABEL_36:
              [(EKCalendarItem *)self removeAlarm:v40];
              continue;
            }
            long long v41 = [v40 absoluteDate];
            id v42 = [(EKEvent *)self startDate];
            uint64_t v43 = [v41 compare:v42];

            if (v43 == 1) {
              goto LABEL_36;
            }
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v51 objects:v63 count:16];
          if (!v37)
          {
LABEL_39:

            break;
          }
        }
      }
      uint64_t v45 = [(EKEvent *)self constraints];
      LODWORD(v46) = [v45 maxAlarmsAllowed];

      uint64_t v47 = [(EKCalendarItem *)self sortedAlarms];
      unint64_t v48 = [v47 count];
      if ((v46 & 0x80000000) == 0)
      {
        unint64_t v49 = v48;
        uint64_t v46 = v46;
        if (v48 > v46)
        {
          do
          {
            uint64_t v50 = [v47 objectAtIndexedSubscript:v46];
            [(EKCalendarItem *)self removeAlarm:v50];

            ++v46;
          }
          while (v49 != v46);
        }
      }
    }
  }
}

- (void)_adjustRecurrenceRulesAfterMovingOrCopyingFromCalendar:(id)a3 toCalendar:(id)a4 notes:(id)a5
{
  id v41 = a4;
  id v7 = a5;
  if (![(EKCalendarItem *)self hasRecurrenceRules]) {
    goto LABEL_29;
  }
  id v8 = [(EKCalendarItem *)self recurrenceRules];
  uint64_t v9 = [v41 constraints];
  unsigned int v10 = [v9 maxRecurrencesAllowed];

  unint64_t v11 = [v8 count];
  if ((v10 & 0x80000000) == 0)
  {
    unint64_t v12 = v11 - v10;
    if (v11 > v10)
    {
      do
      {
        id v13 = [(EKCalendarItem *)self recurrenceRules];
        BOOL v14 = [v13 firstObject];

        [(EKCalendarItem *)self removeRecurrenceRule:v14];
        --v12;
      }
      while (v12);
    }
  }
  int v15 = [v8 firstObject];
  if ([v15 frequency] != 2)
  {
LABEL_11:
    if ([v15 frequency] == 3)
    {
      uint64_t v20 = [v15 monthsOfTheYear];
      if ((unint64_t)[v20 count] <= 1)
      {
      }
      else
      {
        uint64_t v21 = [v41 constraints];
        int v22 = [v21 prohibitsMultipleMonthsInYearlyRecurrence];

        if (v22)
        {
          double v19 = (void *)[v15 copy];
          [v19 setMonthsOfTheYear:0];
          if (!v19) {
            goto LABEL_24;
          }
LABEL_21:
          if (v7)
          {
            id v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            uint64_t v26 = [v25 localizedStringForKey:@"repeat" value:&stru_1EF932508 table:0];

            uint64_t v27 = [(EKEvent *)self startDate];
            uint64_t v28 = [v15 humanReadableDescriptionWithStartDate:v27];
            [v7 appendFormat:@"\n%@:%@", v26, v28];
          }
          [(EKCalendarItem *)self removeRecurrenceRule:v15];
          [(EKCalendarItem *)self addRecurrenceRule:v19];

          goto LABEL_24;
        }
      }
    }
    if ([v15 frequency] != 3) {
      goto LABEL_24;
    }
    if ([v15 interval] < 2) {
      goto LABEL_24;
    }
    uint64_t v23 = [v41 constraints];
    int v24 = [v23 prohibitsYearlyRecurrenceInterval];

    if (!v24) {
      goto LABEL_24;
    }
    double v19 = (void *)[v15 copy];
    [v19 setInterval:1];
    if (!v19) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
  uint64_t v16 = [v15 daysOfTheMonth];
  if ((unint64_t)[v16 count] <= 1)
  {

    goto LABEL_11;
  }
  uint64_t v17 = [v41 constraints];
  int v18 = [v17 prohibitsMultipleDaysInMonthlyRecurrence];

  if (!v18) {
    goto LABEL_11;
  }
  double v19 = (void *)[v15 copy];
  [v19 setDaysOfTheMonth:0];
  if (v19) {
    goto LABEL_21;
  }
LABEL_24:
  long long v29 = [v41 constraints];
  int v30 = [v29 requiresOccurrencesConformToRecurrenceRule];

  if (v30)
  {
    uint64_t v31 = [(EKEvent *)self suggestedStartDateForCurrentRecurrenceRule];
    char v32 = [(EKEvent *)self startDate];
    char v33 = [v32 isEqualToDate:v31];

    if ((v33 & 1) == 0)
    {
      id v34 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
      id v35 = [(EKEvent *)self startDate];
      [v34 timeIntervalSinceDate:v35];
      double v37 = v36;

      [(EKEvent *)self setStartDate:v31];
      uint64_t v38 = (void *)MEMORY[0x1E4F1C9C8];
      uint64_t v39 = [(EKEvent *)self startDate];
      id v40 = [v38 dateWithTimeInterval:v39 sinceDate:v37];
      [(EKEvent *)self setEndDateUnadjustedForLegacyClients:v40];
    }
  }

LABEL_29:
}

- (void)_adjustAfterMovingOrCopyingFromOldCalendar:(id)a3 toNewCalendar:(id)a4 cachedConstraintsForOldCalendar:(id)a5 savingItem:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(EKEvent *)self _adjustAttendeesAfterMovingOrCopyingFromCalendar:v13 toCalendar:v12];
  [(EKEvent *)self _adjustPrivacyAfterMovingOrCopyingFromCalendar:v13 toCalendar:v12 cachedConstraintsForOldCalendar:v11 savingItem:v10];
  [(EKEvent *)self _adjustAvailabilityAfterMovingOrCopyingFromCalendar:v13 toCalendar:v12];
  [(EKEvent *)self _adjustScheduleAgentAfterMovingOrCopyingFromCalendar:v13 toCalendar:v12 cachedConstraintsForOldCalendar:v11];
  [(EKEvent *)self _adjustAttachmentsAfterMovingOrCopyingFromCalendar:v13 toCalendar:v12 cachedConstraintsForOldCalendar:v11 savingItem:v10];

  id v21 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [(EKEvent *)self _adjustURLAfterMovingOrCopyingToCalendar:v12 notes:v21];
  [(EKEvent *)self _adjustAlarmsAfterMovingOrCopyingFromCalendar:v13 toCalendar:v12];
  [(EKEvent *)self _adjustRecurrenceRulesAfterMovingOrCopyingFromCalendar:v13 toCalendar:v12 notes:v21];
  [(EKEvent *)self _adjustTimeZoneAfterMovingOrCopyingToCalendar:v12 notes:v21];
  [(EKEvent *)self _adjustExternalFieldsAfterMovingOrCopyingFromCalendar:v13 toCalendar:v12 cachedConstraintsForOldCalendar:v11];

  if ([v21 length])
  {
    BOOL v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int v15 = [v14 localizedStringForKey:@"The following information couldn’t be added to Exchange:" value:&stru_1EF932508 table:0];

    uint64_t v16 = [(EKCalendarItem *)self notes];
    uint64_t v17 = [v16 length];
    int v18 = NSString;
    if (v17)
    {
      double v19 = [(EKCalendarItem *)self notes];
      uint64_t v20 = [v18 stringWithFormat:@"%@\n\n%@%@", v19, v15, v21];
      [(EKEvent *)self setNotes:v20];
    }
    else
    {
      double v19 = [NSString stringWithFormat:@"%@%@", v15, v21];
      [(EKEvent *)self setNotes:v19];
    }
  }
  [(EKEvent *)self _invalidateRecurrenceIdentifier];
}

- (void)_adjustExternalFieldsAfterMovingOrCopyingFromCalendar:(id)a3 toCalendar:(id)a4 cachedConstraintsForOldCalendar:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v19 constraints];
  }
  id v12 = v11;
  int v13 = [v11 externalDataFormat];
  BOOL v14 = [v8 constraints];
  int v15 = [v14 externalDataFormat];

  if (v13 != v15)
  {
    [(EKCalendarItem *)self setExternalData:0];
    uint64_t v16 = [(EKObject *)self eventStore];
    int v17 = [v16 eventAccessLevel];

    if (v17 == 1)
    {
      int v18 = [(EKObject *)self changeSet];
      [v18 forceChangeValue:0 forKey:*MEMORY[0x1E4F56BF8]];
    }
  }
}

- (void)_adjustAttendeesAfterMovingOrCopyingFromCalendar:(id)a3 toCalendar:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(EKEvent *)self _requirementsToMoveToCalendarHelperRemoveAttendeesRequiredToMoveEventFromCalendar:v6 toCalendar:v7])
  {
    [(EKCalendarItem *)self setAttendees:0];
    [(EKCalendarItem *)self setOrganizer:0];
  }
  else
  {
    id v8 = [v6 source];
    id v9 = [v7 source];
    char v10 = [v8 isEqual:v9];

    if (v10)
    {
      id v11 = 0;
    }
    else
    {
      id v11 = [(EKCalendarItem *)self organizer];
      [(EKCalendarItem *)self setOrganizer:0];
      [(EKCalendarItem *)self setSelfAttendee:0];
      [(EKCalendarItem *)self addOrganizerAndSelfAttendeeForNewInvitation];
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = [(EKCalendarItem *)self attendees];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if (([v11 isEqualToParticipant:v17] & 1) != 0
            || ![(EKEvent *)self _isValidAttendee:v17 forCalendar:v7 selfAttendeeIsValid:1])
          {
            [(EKCalendarItem *)self removeAttendee:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
}

- (void)_adjustPrivacyAfterMovingOrCopyingFromCalendar:(id)a3 toCalendar:(id)a4 cachedConstraintsForOldCalendar:(id)a5 savingItem:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(EKEvent *)self isPrivacySet]
    && ![(EKEvent *)self allowsPrivacyLevelModifications])
  {
    [(EKEvent *)self setPrivacyLevelWithoutVerifyingPrivacyModificationsAllowed:0];
  }
  else
  {
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [v10 constraints];
    }
    uint64_t v15 = v14;
    uint64_t v16 = objc_msgSend(v11, "constraints", v10);
    int v17 = [v16 requiresSamePrivacyLevelAcrossRecurrenceSeries];

    int v18 = [v15 requiresSamePrivacyLevelAcrossRecurrenceSeries];
    long long v19 = [v11 constraints];
    int64_t v20 = +[EKSource _calEventPrivacyLevelToEKPrivacyLevel:](EKSource, "_calEventPrivacyLevelToEKPrivacyLevel:", [v19 strictestEventPrivateValue]);

    if (v20 != +[EKSource _calEventPrivacyLevelToEKPrivacyLevel:](EKSource, "_calEventPrivacyLevelToEKPrivacyLevel:", [v15 strictestEventPrivateValue])|| (v17 & (v18 ^ 1)) != 0)
    {
      BOOL v21 = 0;
      uint64_t v28 = 0;
      long long v29 = &v28;
      uint64_t v30 = 0x2020000000;
      char v31 = 0;
      if (v17)
      {
        BOOL v22 = [(EKEvent *)self privacyLevel] != 0;
        *((unsigned char *)v29 + 24) = v22;
        uint64_t v23 = [(EKCalendarItem *)self detachedItems];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        void v27[2] = __112__EKEvent__adjustPrivacyAfterMovingOrCopyingFromCalendar_toCalendar_cachedConstraintsForOldCalendar_savingItem___block_invoke;
        v27[3] = &unk_1E5B98AD0;
        v27[4] = &v28;
        [v23 enumerateObjectsUsingBlock:v27];

        BOOL v21 = *((unsigned char *)v29 + 24) != 0;
      }
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __112__EKEvent__adjustPrivacyAfterMovingOrCopyingFromCalendar_toCalendar_cachedConstraintsForOldCalendar_savingItem___block_invoke_2;
      v25[3] = &__block_descriptor_41_e24_v16__0__EKCalendarItem_8l;
      BOOL v26 = v21;
      v25[4] = v20;
      [(EKCalendarItem *)self _recursivelyPerformBlockOnSelfAndDetachedItems:v25 forSavingItem:v13];
      _Block_object_dispose(&v28, 8);
    }

    id v10 = v24;
  }
}

uint64_t __112__EKEvent__adjustPrivacyAfterMovingOrCopyingFromCalendar_toCalendar_cachedConstraintsForOldCalendar_savingItem___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 privacyLevel];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __112__EKEvent__adjustPrivacyAfterMovingOrCopyingFromCalendar_toCalendar_cachedConstraintsForOldCalendar_savingItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40) || [v3 privacyLevel]) {
    [v3 setPrivacyLevel:*(void *)(a1 + 32)];
  }
}

- (void)_adjustAvailabilityAfterMovingOrCopyingFromCalendar:(id)a3 toCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EKObject *)self eventStore];
  int v9 = [v8 eventAccessLevel];

  if (v9 != 1)
  {
    id v10 = [v6 source];
    id v11 = [v7 source];
    uint64_t v12 = [v10 sourceType];
    uint64_t v13 = [v11 sourceType];
    if (v12 == 5 && v13 != 5)
    {
      id v14 = [(EKEvent *)self suggestionInfo];

      if (v14)
      {
        uint64_t v22 = 0;
        uint64_t v23 = &v22;
        uint64_t v24 = 0x2020000000;
        uint64_t v15 = (void *)getkSuggestionsEKEventAvailabilityStateSymbolLoc_ptr;
        uint64_t v25 = getkSuggestionsEKEventAvailabilityStateSymbolLoc_ptr;
        if (!getkSuggestionsEKEventAvailabilityStateSymbolLoc_ptr)
        {
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __getkSuggestionsEKEventAvailabilityStateSymbolLoc_block_invoke;
          v21[3] = &unk_1E5B969D8;
          v21[4] = &v22;
          __getkSuggestionsEKEventAvailabilityStateSymbolLoc_block_invoke((uint64_t)v21);
          uint64_t v15 = (void *)v23[3];
        }
        _Block_object_dispose(&v22, 8);
        if (!v15) {
          -[EKEvent _adjustAvailabilityAfterMovingOrCopyingFromCalendar:toCalendar:]();
        }
        uint64_t v16 = [(EKCalendarItem *)self localCustomObjectForKey:*v15];
        if (v16)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v17 = [v16 integerValue];
            int v18 = objc_opt_class();
            long long v19 = [(EKCalendarItem *)self calendar];
            uint64_t v20 = objc_msgSend(v18, "_coercedEventAvailabilityForDesiredAvailability:supportedAvailabilities:", v17, objc_msgSend(v19, "supportedEventAvailabilities"));

            [(EKEvent *)self setAvailability:v20];
          }
        }
      }
    }
  }
}

- (void)_adjustAttachmentsAfterMovingOrCopyingFromCalendar:(id)a3 toCalendar:(id)a4 cachedConstraintsForOldCalendar:(id)a5 savingItem:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (EKEvent *)a6;
  id v14 = [v10 source];
  uint64_t v15 = [v11 source];
  char v16 = [v14 isEqual:v15];

  if ((v16 & 1) == 0)
  {
    if (v12)
    {
      id v17 = v12;
    }
    else
    {
      id v17 = [v10 constraints];
    }
    int v18 = v17;
    long long v19 = [v11 constraints];
    if ([v19 supportsAttachments])
    {
      uint64_t v20 = [v11 constraints];
      if (![v20 requiresOpeningAttachmentAsLink])
      {
        char v21 = [v18 requiresOpeningAttachmentAsLink];

        if ((v21 & 1) == 0)
        {
          if (self == v13)
          {
            uint64_t v22 = [(EKCalendarItem *)self originalItem];
            if (!v22) {
              uint64_t v22 = self;
            }
            uint64_t v23 = [v11 constraints];
            char v24 = [v23 requiresSeparateFilesForAllAttachments];

            if (v24) {
              uint64_t v25 = 0;
            }
            else {
              uint64_t v25 = objc_opt_new();
            }
            v27[0] = MEMORY[0x1E4F143A8];
            v27[1] = 3221225472;
            void v27[2] = __116__EKEvent__adjustAttachmentsAfterMovingOrCopyingFromCalendar_toCalendar_cachedConstraintsForOldCalendar_savingItem___block_invoke;
            v27[3] = &unk_1E5B98B18;
            id v28 = v25;
            long long v29 = self;
            id v26 = v25;
            [(EKCalendarItem *)v22 _recursivelyPerformBlockOnSelfAndDetachedItems:v27 forSavingItem:self];
          }
          goto LABEL_10;
        }
LABEL_9:
        [(EKCalendarItem *)self setAttachments:0];
LABEL_10:

        goto LABEL_11;
      }
    }
    goto LABEL_9;
  }
LABEL_11:
}

void __116__EKEvent__adjustAttachmentsAfterMovingOrCopyingFromCalendar_toCalendar_cachedConstraintsForOldCalendar_savingItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = [a2 attachments];
  char v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
        id v10 = [v9 UUID];
        uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
        if (v11)
        {
          id v12 = (void *)v11;
          [v9 assignIdentity:v11];
          [v9 invalidateLocalFilePropertiesForNewCopiedFile];
LABEL_10:
          [v9 setExternalID:0];
          [v9 setURL:0];

          goto LABEL_11;
        }
        [v9 assignNewIdentity];
        if ([v9 copyLocalFileToNewSource])
        {
          id v12 = [v9 UUID];
          [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v10];
          goto LABEL_10;
        }
        uint64_t v13 = EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
          __116__EKEvent__adjustAttachmentsAfterMovingOrCopyingFromCalendar_toCalendar_cachedConstraintsForOldCalendar_savingItem___block_invoke_cold_1(&v15, v16, v13);
        }
        [*(id *)(a1 + 40) removeAttachment:v9];
LABEL_11:

        ++v8;
      }
      while (v6 != v8);
      uint64_t v14 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v6 = v14;
    }
    while (v14);
  }
}

- (void)_adjustURLAfterMovingOrCopyingToCalendar:(id)a3 notes:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  uint64_t v7 = [(EKEvent *)self URL];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    int v9 = [v17 constraints];
    char v10 = [v9 supportsURLField];

    if ((v10 & 1) == 0)
    {
      if (v6)
      {
        uint64_t v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v12 = [v11 localizedStringForKey:@"url" value:&stru_1EF932508 table:0];

        uint64_t v13 = NSString;
        uint64_t v14 = [(EKEvent *)self URL];
        uint8_t v15 = [v14 absoluteString];
        char v16 = [v13 stringWithFormat:@"\n%@:%@", v12, v15];

        [v6 appendString:v16];
      }
      [(EKEvent *)self setURL:0];
    }
  }
}

- (void)_adjustTimeZoneAfterMovingOrCopyingToCalendar:(id)a3 notes:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  uint64_t v7 = [(EKCalendarItem *)self timeZone];
  if (!v7 && ![(EKEvent *)self isAllDay])
  {
    uint64_t v8 = [v15 constraints];
    char v9 = [v8 supportsFloatingTimeZone];

    if (v9) {
      goto LABEL_8;
    }
    if (v6)
    {
      char v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v11 = [v10 localizedStringForKey:@"time zone" value:&stru_1EF932508 table:0];

      id v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v13 = [v12 localizedStringForKey:@"Floating" value:&stru_1EF932508 table:0];

      uint64_t v14 = [NSString stringWithFormat:@"\n%@:%@", v11, v13];
      [v6 appendString:v14];
    }
    uint64_t v7 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    [(EKEvent *)self setTimeZone:v7];
  }

LABEL_8:
}

+ (int64_t)_coercedEventAvailabilityForDesiredAvailability:(int64_t)a3 supportedAvailabilities:(unint64_t)a4
{
  if (!a4) {
    return -1;
  }
  int64_t result = a3;
  switch(a3)
  {
    case -1:
      return result;
    case 0:
      if ((a4 & 1) == 0) {
        return -1;
      }
      int64_t result = 0;
      break;
    case 1:
      if ((a4 & 2) == 0) {
        return -1;
      }
      int64_t result = 1;
      break;
    case 2:
      if ((a4 & 4) == 0) {
        return -1;
      }
      int64_t result = 2;
      break;
    case 3:
      if ((a4 & 8) == 0) {
        return -1;
      }
      int64_t result = 3;
      break;
    default:
      return -1;
  }
  return result;
}

- (void)markAsSaved
{
  [(EKEvent *)self _addOrganizerToRecentsIfNeeded];
  [(EKEvent *)self _addNewAttendeesToRecentsIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)EKEvent;
  [(EKObject *)&v3 markAsSaved];
  [(EKEvent *)self _clearOriginalDateFields];
}

- (void)markAsCommitted
{
  v3.receiver = self;
  v3.super_class = (Class)EKEvent;
  [(EKObject *)&v3 markAsCommitted];
  [(EKEvent *)self setClearModifiedFlags:0];
  [(EKEvent *)self invalidateRemovedVirtualConferences];
}

- (void)markAsUndeleted
{
  if ([(EKCalendarItem *)self _hadRecurrenceRules] && ![(EKEvent *)self isDetached])
  {
    [(EKObject *)self _markAsUndeletedCommon];
  }
  else
  {
    objc_super v3 = [(EKEvent *)self uniqueId];
    char v4 = [(EKCalendarItem *)self calendarItemIdentifier];
    uint64_t v5 = [(EKCalendarItem *)self externalID];
    v9.receiver = self;
    v9.super_class = (Class)EKEvent;
    [(EKObject *)&v9 markAsUndeleted];
    [(EKObject *)self _initChangeSetIfNone];
    id v6 = [(EKObject *)self changeSet];
    [v6 forceChangeValue:v3 forKey:*MEMORY[0x1E4F56D38]];

    uint64_t v7 = [(EKObject *)self changeSet];
    [v7 forceChangeValue:v4 forKey:*MEMORY[0x1E4F57150]];

    uint64_t v8 = [(EKObject *)self changeSet];
    [v8 forceChangeValue:v5 forKey:*MEMORY[0x1E4F56C00]];
  }
}

- (void)markAsUndetachedWithStartDate:(id)a3 endDate:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  [(EKObject *)self _initChangeSetIfNone];
  uint64_t v7 = [(EKObject *)self changeSet];
  [v7 setIsUndetached:1];

  [(EKEvent *)self setStartDate:v6];
  [(EKEvent *)self setEndDateUnadjustedForLegacyClients:v8];
}

- (BOOL)isUndetached
{
  id v2 = [(EKObject *)self changeSet];
  char v3 = [v2 isUndetached];

  return v3;
}

- (BOOL)isOrWasIntegrationEvent
{
  if ([(EKEvent *)self isIntegrationEvent]) {
    return 1;
  }
  uint64_t v4 = *MEMORY[0x1E4F56BB0];
  if (![(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56BB0]]) {
    return 0;
  }
  uint64_t v5 = [(EKObject *)self _previousValueForKey:v4];
  id v6 = [(EKObject *)self eventStore];
  uint64_t v7 = [v5 meltedObjectInStore:v6];

  id v8 = [v7 source];
  BOOL v3 = [v8 sourceType] == 6;

  return v3;
}

- (void)clearIntegrationType
{
}

- (BOOL)allowsNonzeroDuration
{
  return ![(EKEvent *)self isIntegrationEvent];
}

- (id)_nextReminderOccurrenceDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__EKEvent__nextReminderOccurrenceDate__block_invoke;
  v4[3] = &unk_1E5B96908;
  v4[4] = self;
  id v2 = [(EKObject *)self cachedValueForKey:@"nextReminderOccurrenceDateKey" populateBlock:v4];

  return v2;
}

id __38__EKEvent__nextReminderOccurrenceDate__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) nextOccurrence];
  BOOL v3 = [v2 startDate];

  uint64_t v4 = [*(id *)(a1 + 32) startDate];
  uint64_t v5 = [*(id *)(a1 + 32) exceptionDates];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v10 isAfterDate:v4] && objc_msgSend(v10, "isBeforeDate:", v3))
        {
          id v11 = v10;

          BOOL v3 = v11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  id v12 = v3;

  return v12;
}

- (void)clearNextCachedReminderOccurrenceDate
{
}

- (void)_setNextCachedReminderOccurrenceDate:(id)a3
{
}

- (id)privacySafeIntegrationEventDescription
{
  BOOL v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = [(EKCalendarItem *)self uniqueID];
  uint64_t v5 = [v3 stringWithFormat:@"[Event: %@: ", v4];

  uint64_t v6 = [(EKCalendarItem *)self timeZone];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  }
  char v32 = v8;
  objc_super v9 = objc_msgSend(MEMORY[0x1E4F1C9A8], "CalGregorianCalendarForTimeZone:");
  BOOL v10 = [(EKEvent *)self isAllDay];
  BOOL v11 = v10;
  if (v10) {
    uint64_t v12 = 28;
  }
  else {
    uint64_t v12 = 124;
  }
  uint64_t v13 = [(EKEvent *)self startDate];
  char v31 = v9;
  long long v14 = [v9 components:v12 fromDate:v13];
  uint64_t v15 = [v14 year];
  uint64_t v16 = [v14 month];
  uint64_t v17 = [v14 day];
  uint64_t v18 = v17;
  if (v11)
  {
    objc_msgSend(v5, "appendFormat:", @"%li-%li-%li", v15, v16, v17, v27, v28);
  }
  else
  {
    uint64_t v19 = [v14 hour];
    uint64_t v20 = [v14 minute];
    if (v7)
    {
      uint64_t v29 = v20;
      uint64_t v30 = v19;
      char v21 = [v7 abbreviationForDate:v13];
      uint64_t v22 = v21;
      if (v21)
      {
        id v23 = v21;
      }
      else
      {
        id v23 = [v7 name];
      }
      char v24 = v23;

      [v5 appendFormat:@"%li-%li-%li %li:%02li %@", v15, v16, v18, v30, v29, v24];
    }
    else
    {
      objc_msgSend(v5, "appendFormat:", @"%li-%li-%li %li:%02li float", v15, v16, v18, v19, v20);
    }
  }
  [v5 appendString:@", "];
  if ([(EKEvent *)self completed]) {
    uint64_t v25 = @"complete";
  }
  else {
    uint64_t v25 = @"incomplete";
  }
  [v5 appendString:v25];
  [v5 appendString:@"]"];

  return v5;
}

- (BOOL)refreshIfRefreshableAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(EKObject *)self _refreshable]) {
    return 1;
  }

  return [(EKEvent *)self refreshAndNotify:v3];
}

- (void)_addOrganizerToRecentsIfNeeded
{
  if ([(EKEvent *)self _isParticipationStatusDirty])
  {
    int64_t v3 = [(EKEvent *)self participationStatus];
    if (v3 == 4 || v3 == 2)
    {
      id v7 = [(EKCalendarItem *)self organizer];
      uint64_t v4 = [v7 name];
      uint64_t v5 = [v7 emailAddress];
      uint64_t v6 = [v7 phoneNumber];
      +[EKRecents recordRecentForContactWithName:v4 emailAddress:v5 phoneNumber:v6];
    }
  }
}

- (void)_addNewAttendeesToRecentsIfNeeded
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F56BA8];
  if ([(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56BA8]])
  {
    uint64_t v4 = [(EKObject *)self changeSet];
    uint64_t v5 = [v4 unsavedMultiValueAddedObjectsForKey:v3];

    if ([v5 count])
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F1CA60];
      id v7 = [(EKCalendarItem *)self attendees];
      id v8 = objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v7, "count"));

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      objc_super v9 = [(EKCalendarItem *)self attendees];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v32 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            uint64_t v15 = [v14 uniqueIdentifier];
            [v8 setObject:v14 forKeyedSubscript:v15];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v11);
      }

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v25 = v5;
      id obj = v5;
      uint64_t v16 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v28;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v28 != v18) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * j), "uniqueIdentifier", v25);
            char v21 = [v8 objectForKeyedSubscript:v20];

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v22 = [v21 name];
              id v23 = [v21 emailAddress];
              char v24 = [v21 phoneNumber];
              +[EKRecents recordRecentForContactWithName:v22 emailAddress:v23 phoneNumber:v24];
            }
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v17);
      }

      uint64_t v5 = v25;
    }
  }
}

- (void)reset
{
  [(EKEvent *)self setPredictedLocationFrozen:0];
  v3.receiver = self;
  v3.super_class = (Class)EKEvent;
  [(EKObject *)&v3 reset];
}

- (BOOL)_reset
{
  v24.receiver = self;
  v24.super_class = (Class)EKEvent;
  if (![(EKObject *)&v24 _reset]) {
    return 0;
  }
  [(EKEvent *)self clearDetectedConferenceURL];
  [(EKEvent *)self clearParsedConference];
  [(EKEvent *)self clearVirtualConferenceURLsQueuedForInvalidation];
  [(EKEvent *)self setClearModifiedFlags:0];
  p_originalOccurrenceStartDate = &self->_originalOccurrenceStartDate;
  originalOccurrenceStartDate = self->_originalOccurrenceStartDate;
  if (originalOccurrenceStartDate)
  {
    objc_storeStrong((id *)&self->_occurrenceStartDate, originalOccurrenceStartDate);
    uint64_t v5 = *p_originalOccurrenceStartDate;
    *p_originalOccurrenceStartDate = 0;
  }
  originalOccurrenceEndDate = self->_originalOccurrenceEndDate;
  if (originalOccurrenceEndDate)
  {
    objc_storeStrong((id *)&self->_occurrenceEndDate, originalOccurrenceEndDate);
    id v7 = self->_originalOccurrenceEndDate;
    self->_originalOccurrenceEndDate = 0;
  }
  originalOccurrenceIsAllDay = self->_originalOccurrenceIsAllDay;
  if (originalOccurrenceIsAllDay)
  {
    self->_BOOL occurrenceIsAllDay = [(NSNumber *)originalOccurrenceIsAllDay BOOLValue];
    objc_super v9 = self->_originalOccurrenceIsAllDay;
    self->_originalOccurrenceIsAllDay = 0;
  }
  if (![(EKEvent *)self validateOccurrenceDateStillMatchesRecurrenceRules])return 0; {
  uint64_t v10 = [(EKEvent *)self _committedStartDate];
  }
  id v23 = 0;
  id v11 = [(EKEvent *)self adjustedPersistedDateForDate:v10 withAdjustmentMode:1 pinMode:0 clientCalendarDate:&v23];
  id v12 = v23;
  id v13 = v23;

  if (![(EKCalendarItem *)self _hadRecurrenceRules])
  {
    objc_storeStrong((id *)&self->_originalOccurrenceStartDate, v12);
    objc_storeStrong((id *)&self->_occurrenceStartDate, v12);
  }
  long long v14 = [(EKEvent *)self _committedEndDate];
  id v22 = 0;
  BOOL v15 = 1;
  id v16 = [(EKEvent *)self adjustedPersistedDateForDate:v14 withAdjustmentMode:1 pinMode:1 clientCalendarDate:&v22];
  id v17 = v22;

  uint64_t v18 = [(EKEvent *)self _calculateDurationWithStart:v13 end:v17 allDay:[(EKEvent *)self _isAllDay]];
  uint64_t v19 = [(EKEvent *)self occurrenceStartDate];
  uint64_t v20 = [v19 calendarDateByComponentwiseAddingComponents:v18];
  [(EKEvent *)self setOccurrenceEndDate:v20];

  [(EKEvent *)self setOccurrenceIsAllDay:[(EKEvent *)self _isAllDay]];
  return v15;
}

- (id)coCommitEvents
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(EKObject *)self persistentObject];
  uint64_t v4 = [v3 coCommitObjects];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA48];
    id v7 = [(EKObject *)self persistentObject];
    id v8 = [v7 coCommitObjects];
    objc_super v9 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v8, "count"));

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v10 = [(EKObject *)self persistentObject];
    id v11 = [v10 coCommitObjects];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = [[EKEvent alloc] initWithPersistentObject:v16];
            [v9 addObject:v17];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (BOOL)revert
{
  return [(EKEvent *)self _revertIncludingCoCommits:1];
}

- (BOOL)_revertIncludingCoCommits:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(EKObject *)self uniqueIdentifier];
  if ([(EKObject *)self hasNeverBeenCommitted]) {
    BOOL v6 = [(EKEvent *)self isDetached];
  }
  else {
    BOOL v6 = 0;
  }
  id v7 = [(EKCalendarItem *)self originalItem];
  id v8 = [(EKEvent *)self occurrenceStartDate];
  objc_super v9 = [(EKEvent *)self occurrenceEndDate];
  BOOL v10 = [(EKEvent *)self occurrenceIsAllDay];
  BOOL v11 = v10;
  if (v3)
  {
    BOOL v27 = v10;
    uint64_t v12 = v8;
    uint64_t v13 = v7;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v14 = [(EKEvent *)self coCommitEvents];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v30;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v29 + 1) + 8 * v18++) _revertIncludingCoCommits:0];
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v16);
    }

    id v7 = v13;
    id v8 = v12;
    BOOL v11 = v27;
  }
  v28.receiver = self;
  v28.super_class = (Class)EKEvent;
  BOOL v19 = [(EKObject *)&v28 revert];
  if (v6)
  {
    long long v20 = [v7 backingObject];
    [(EKObject *)self setBackingObject:v20];

    [(EKObject *)self _resetAfterUpdatingChangeSetOrBackingObject];
    [(EKEvent *)self reset];
    [(EKEvent *)self setOccurrenceStartDate:v8];
    [(EKEvent *)self setOccurrenceEndDate:v9];
    [(EKEvent *)self setOccurrenceIsAllDay:v11];
  }
  else
  {
    long long v21 = [(EKEvent *)self originalOccurrenceStartDate];
    [(EKEvent *)self setOccurrenceStartDate:v21];

    long long v22 = [(EKEvent *)self originalOccurrenceEndDate];
    [(EKEvent *)self setOccurrenceEndDate:v22];

    id v23 = [(EKEvent *)self originalOccurrenceIsAllDay];

    if (v23)
    {
      uint64_t v24 = [(EKEvent *)self originalOccurrenceIsAllDay];
      -[EKEvent setOccurrenceIsAllDay:](self, "setOccurrenceIsAllDay:", [v24 BOOLValue]);
    }
  }
  [(EKEvent *)self _clearOriginalDateFields];
  [(EKEvent *)self setPredictedLocationFrozen:0];
  uint64_t v25 = [(id)objc_opt_class() _modifiedNotificationUserInfoWithIdentifier:v5 forRevert:1];
  [(EKEvent *)self postModifiedNotificationWithUserInfo:v25];

  return v19;
}

- (void)rollback
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56C58]])
  {
    BOOL v3 = [(EKEvent *)self virtualConference];
    uint64_t v4 = [(EKEvent *)self _originallyCommittedVirtualConference];
    char v5 = [v3 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      BOOL v6 = [(EKEvent *)self virtualConference];
      id v7 = [v6 joinMethods];

      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = [*(id *)(*((void *)&v18 + 1) + 8 * v11) URL];
            +[EKConferenceUtils invalidateConferenceURL:v12];

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v9);
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)EKEvent;
  [(EKObject *)&v17 rollback];
  [(EKEvent *)self clearDetectedConferenceURL];
  [(EKEvent *)self clearParsedConference];
  [(EKEvent *)self clearVirtualConferenceURLsQueuedForInvalidation];
  uint64_t v13 = [(EKEvent *)self originalOccurrenceStartDate];
  [(EKEvent *)self setOccurrenceStartDate:v13];

  uint64_t v14 = [(EKEvent *)self originalOccurrenceEndDate];
  [(EKEvent *)self setOccurrenceEndDate:v14];

  uint64_t v15 = [(EKEvent *)self originalOccurrenceIsAllDay];

  if (v15)
  {
    uint64_t v16 = [(EKEvent *)self originalOccurrenceIsAllDay];
    -[EKEvent setOccurrenceIsAllDay:](self, "setOccurrenceIsAllDay:", [v16 BOOLValue]);
  }
  [(EKEvent *)self setPredictedLocationFrozen:0];
}

- (id)nextOccurrence
{
  BOOL v3 = [(EKEvent *)self startDate];
  uint64_t v4 = [(EKEvent *)self nextOccurrenceOrDetachmentAfter:v3];

  return v4;
}

- (id)nextOccurrenceOrDetachmentAfter:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(EKEvent *)self singleRecurrenceRule];

  if (v5)
  {
    BOOL v6 = objc_alloc_init(EKRecurrenceGenerator);
    uint64_t v51 = 0;
    long long v52 = &v51;
    uint64_t v53 = 0x3032000000;
    long long v54 = __Block_byref_object_copy__17;
    long long v55 = __Block_byref_object_dispose__17;
    id v56 = 0;
    uint64_t v45 = 0;
    uint64_t v46 = &v45;
    uint64_t v47 = 0x3032000000;
    unint64_t v48 = __Block_byref_object_copy__17;
    unint64_t v49 = __Block_byref_object_dispose__17;
    id v50 = 0;
    uint64_t v41 = 0;
    id v42 = &v41;
    uint64_t v43 = 0x2020000000;
    char v44 = 0;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __43__EKEvent_nextOccurrenceOrDetachmentAfter___block_invoke;
    v35[3] = &unk_1E5B98B40;
    long long v30 = v6;
    double v36 = v30;
    id v37 = v4;
    uint64_t v38 = &v51;
    uint64_t v39 = &v45;
    id v40 = &v41;
    id v7 = (void (**)(void, void))MEMORY[0x1A6266730](v35);
    uint64_t v8 = [(EKEvent *)self masterEvent];
    uint64_t v9 = (void *)v8;
    if (v8) {
      uint64_t v10 = (EKEvent *)v8;
    }
    else {
      uint64_t v10 = self;
    }
    uint64_t v11 = v10;

    uint64_t v12 = [(EKEvent *)v11 recurrenceSet];

    if (v12)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v13 = [(EKObject *)self eventStore];
      uint64_t v14 = [v13 eventsWithSameRecurrenceSetAsEvent:v11];

      uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v57 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v32 != v16) {
              objc_enumerationMutation(v14);
            }
            long long v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            uint64_t v19 = [v18 masterEvent];
            long long v20 = (void *)v19;
            if (v19) {
              uint64_t v21 = v19;
            }
            else {
              uint64_t v21 = (uint64_t)v18;
            }
            v7[2](v7, v21);
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v57 count:16];
        }
        while (v15);
      }
    }
    else
    {
      ((void (**)(void, EKEvent *))v7)[2](v7, v11);
    }
    if (v52[5])
    {
      if (!*((unsigned char *)v42 + 24))
      {
        uint64_t v25 = [EKEvent alloc];
        id v26 = [(id)v46[5] persistentObject];
        uint64_t v27 = [(EKEvent *)v25 initWithPersistentObject:v26 occurrenceDate:v52[5]];
        objc_super v28 = (void *)v46[5];
        v46[5] = v27;
      }
      uint64_t v24 = (EKEvent *)(id)v46[5];
    }
    else
    {
      uint64_t v24 = 0;
    }

    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v45, 8);

    _Block_object_dispose(&v51, 8);
  }
  else
  {
    long long v22 = [(EKEvent *)self startDate];
    int v23 = [v22 isAfterDate:v4];

    if (v23) {
      uint64_t v24 = self;
    }
    else {
      uint64_t v24 = 0;
    }
  }

  return v24;
}

void __43__EKEvent_nextOccurrenceOrDetachmentAfter___block_invoke(void *a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  char v5 = [v4 exceptionDates];
  BOOL v6 = [v4 detachedItems];
  id v35 = v5;
  if ([v6 count])
  {
    id v7 = (void *)[v5 mutableCopy];
    if (!v7)
    {
      id v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
    }
  }
  else
  {
    id v7 = 0;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v40 + 1) + 8 * i) recurrenceDate];
        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [v4 singleRecurrenceRule];

  if (v14)
  {
    id obj = a2;
    long long v33 = (void *)a1[4];
    long long v34 = [v4 singleRecurrenceRule];
    uint64_t v45 = v34;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
    if (v7) {
      uint64_t v16 = v7;
    }
    else {
      uint64_t v16 = v35;
    }
    objc_super v17 = [v4 startCalendarDate];
    long long v18 = (void *)MEMORY[0x1E4F57838];
    uint64_t v19 = a1[5];
    long long v20 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    uint64_t v21 = [v18 calendarDateWithDate:v19 timeZone:v20];
    long long v22 = [v33 nextOccurrenceDateWithEKRecurrences:v15 forCalendarItem:v4 exceptionDates:v16 initialDate:v17 afterDate:v21];

    int v23 = *(void **)(*(void *)(a1[6] + 8) + 40);
    if ((!v23 || [v23 isAfterDate:v22])
      && [v22 isAfterDate:a1[5]])
    {
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v22);
      objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), obj);
      *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 0;
    }
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v24 = v8;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v37 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = *(void **)(*((void *)&v36 + 1) + 8 * j);
        long long v30 = [v29 startDate];
        long long v31 = *(void **)(*(void *)(a1[6] + 8) + 40);
        if (!v31 || [v31 isAfterDate:v30])
        {
          if ([v30 isAfterDate:a1[5]])
          {
            objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v30);
            objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v29);
            *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
          }
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v26);
  }
}

- (id)previousOccurrence
{
  BOOL v3 = [(EKEvent *)self startDate];
  id v4 = [(EKEvent *)self previousOccurrenceOrDetachmentBefore:v3];

  return v4;
}

- (id)previousOccurrenceOrDetachmentBefore:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(EKEvent *)self singleRecurrenceRule];

  if (v5)
  {
    BOOL v6 = objc_alloc_init(EKRecurrenceGenerator);
    uint64_t v52 = 0;
    uint64_t v53 = &v52;
    uint64_t v54 = 0x3032000000;
    long long v55 = __Block_byref_object_copy__17;
    id v56 = __Block_byref_object_dispose__17;
    id v57 = 0;
    uint64_t v46 = 0;
    uint64_t v47 = &v46;
    uint64_t v48 = 0x3032000000;
    unint64_t v49 = __Block_byref_object_copy__17;
    id v50 = __Block_byref_object_dispose__17;
    id v51 = 0;
    uint64_t v42 = 0;
    long long v43 = &v42;
    uint64_t v44 = 0x2020000000;
    char v45 = 0;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __48__EKEvent_previousOccurrenceOrDetachmentBefore___block_invoke;
    v35[3] = &unk_1E5B98B90;
    long long v30 = v6;
    long long v36 = v30;
    id v37 = v4;
    long long v38 = self;
    long long v39 = &v52;
    long long v40 = &v46;
    long long v41 = &v42;
    id v7 = (void (**)(void, void))MEMORY[0x1A6266730](v35);
    uint64_t v8 = [(EKEvent *)self masterEvent];
    uint64_t v9 = (void *)v8;
    if (v8) {
      uint64_t v10 = (EKEvent *)v8;
    }
    else {
      uint64_t v10 = self;
    }
    uint64_t v11 = v10;

    uint64_t v12 = [(EKEvent *)v11 recurrenceSet];

    if (v12)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v13 = [(EKObject *)self eventStore];
      uint64_t v14 = [v13 eventsWithSameRecurrenceSetAsEvent:v11];

      uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v58 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v32 != v16) {
              objc_enumerationMutation(v14);
            }
            long long v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            uint64_t v19 = [v18 masterEvent];
            long long v20 = (void *)v19;
            if (v19) {
              uint64_t v21 = v19;
            }
            else {
              uint64_t v21 = (uint64_t)v18;
            }
            v7[2](v7, v21);
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v58 count:16];
        }
        while (v15);
      }
    }
    else
    {
      ((void (**)(void, EKEvent *))v7)[2](v7, v11);
    }
    if (v53[5])
    {
      if (!*((unsigned char *)v43 + 24))
      {
        uint64_t v25 = [EKEvent alloc];
        uint64_t v26 = [(id)v47[5] persistentObject];
        uint64_t v27 = [(EKEvent *)v25 initWithPersistentObject:v26 occurrenceDate:v53[5]];
        objc_super v28 = (void *)v47[5];
        v47[5] = v27;
      }
      id v24 = (EKEvent *)(id)v47[5];
    }
    else
    {
      id v24 = 0;
    }

    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v46, 8);

    _Block_object_dispose(&v52, 8);
  }
  else
  {
    long long v22 = [(EKEvent *)self startDate];
    int v23 = [v22 isBeforeDate:v4];

    if (v23) {
      id v24 = self;
    }
    else {
      id v24 = 0;
    }
  }

  return v24;
}

void __48__EKEvent_previousOccurrenceOrDetachmentBefore___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 exceptionDates];
  char v5 = [v3 detachedItems];
  if ([v5 count])
  {
    BOOL v6 = (void *)[v4 mutableCopy];
    if (!v6)
    {
      BOOL v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  long long v34 = v4;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v45 + 1) + 8 * i) recurrenceDate];
        if (v12) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v9);
  }

  uint64_t v13 = *(void **)(a1 + 32);
  uint64_t v14 = [v3 startDate];
  uint64_t v15 = *(void **)(a1 + 40);
  [v3 duration];
  objc_super v17 = [v15 dateByAddingTimeInterval:-v16];
  long long v18 = [*(id *)(a1 + 48) effectiveTimeZone];
  LOBYTE(v32) = 1;
  uint64_t v19 = (void *)[v13 copyOccurrenceDatesWithEKEvent:v3 startDate:v14 endDate:v17 timeZone:v18 exceptionDates:0 limit:1000 adjustDatesForAllDayEvents:v32];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __48__EKEvent_previousOccurrenceOrDetachmentBefore___block_invoke_2;
  v39[3] = &unk_1E5B98B68;
  id v40 = *(id *)(a1 + 40);
  id v20 = v6;
  id v41 = v20;
  long long v43 = *(_OWORD *)(a1 + 56);
  id v21 = v3;
  uint64_t v22 = *(void *)(a1 + 72);
  id v42 = v21;
  uint64_t v44 = v22;
  long long v33 = v19;
  [v19 enumerateObjectsWithOptions:2 usingBlock:v39];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v23 = v7;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v49 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(v23);
        }
        objc_super v28 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        long long v29 = [v28 startDate];
        long long v30 = v29;
        if (v29 && [v29 isBeforeDate:*(void *)(a1 + 40)])
        {
          uint64_t v31 = *(void *)(*(void *)(a1 + 56) + 8);
          if (*(void *)(v31 + 40))
          {
            if (!objc_msgSend(v30, "isAfterDate:")) {
              goto LABEL_25;
            }
            uint64_t v31 = *(void *)(*(void *)(a1 + 56) + 8);
          }
          objc_storeStrong((id *)(v31 + 40), v30);
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v28);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
        }
LABEL_25:
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v49 count:16];
    }
    while (v25);
  }
}

void __48__EKEvent_previousOccurrenceOrDetachmentBefore___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ([v8 isBeforeDate:*(void *)(a1 + 32)]
    && ([*(id *)(a1 + 40) containsObject:v8] & 1) == 0)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(void *)(v7 + 40))
    {
      if (!objc_msgSend(v8, "isAfterDate:")) {
        goto LABEL_7;
      }
      uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    }
    objc_storeStrong((id *)(v7 + 40), a2);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 48));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    *a4 = 1;
  }
LABEL_7:
}

- (id)earliestOccurrenceEndingAfter:(id)a3
{
  return [(EKEvent *)self earliestOccurrenceEndingAfter:a3 excludeSignificantDetachments:0 excludeCanceledDetachments:0 excludeDeclinedDetachments:0];
}

- (id)copyToCalendar:(id)a3 withOptions:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(EKCalendarItem *)self calendar];
  BOOL v8 = [(EKEvent *)self _requirementsToMoveToCalendarHelperRemoveAttendeesRequiredToMoveEventFromCalendar:v7 toCalendar:v6];

  if (v8) {
    int64_t v9 = a4 | 4;
  }
  else {
    int64_t v9 = a4;
  }
  uint64_t v10 = [(EKEvent *)self duplicateWithOptions:v9];
  [v10 setCalendar:v6];
  uint64_t v11 = [(EKCalendarItem *)self calendar];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __38__EKEvent_copyToCalendar_withOptions___block_invoke;
  v18[3] = &unk_1E5B98BB8;
  id v19 = v11;
  id v20 = v6;
  id v12 = v10;
  id v21 = v12;
  id v13 = v6;
  id v14 = v11;
  [v12 _recursivelyPerformBlockOnSelfAndDetachedItems:v18 forSavingItem:v12];
  uint64_t v15 = v21;
  id v16 = v12;

  return v16;
}

uint64_t __38__EKEvent_copyToCalendar_withOptions___block_invoke(void *a1, void *a2)
{
  return [a2 _adjustAfterMovingOrCopyingFromOldCalendar:a1[4] toNewCalendar:a1[5] cachedConstraintsForOldCalendar:0 savingItem:a1[6]];
}

- (id)duplicateWithOptions:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v5 = [(EKObject *)self duplicate];
  long long v18 = self;
  id v6 = [(EKEvent *)self _keysToChangeForDuplicateWithOptions:a3];
  uint64_t v7 = [v6 allKeys];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v13 = [v6 objectForKeyedSubscript:v12];
        id v14 = [MEMORY[0x1E4F1CA98] null];

        if (v13 == v14)
        {

          id v13 = 0;
        }
        [v5 setValue:v13 forKey:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  if ((a3 & 0x20) != 0) {
    [v5 removeAllSnoozedAlarms];
  }
  if ((a3 & 2) != 0)
  {
    uint64_t v15 = [(EKEvent *)v18 startDate];
    [v5 _updateStartDateForDate:v15 withAdjustmentMode:0];

    id v16 = [(EKEvent *)v18 endDateUnadjustedForLegacyClients];
    [v5 _updateEndDateForDate:v16 withAdjustmentMode:0];
  }

  return v5;
}

- (id)_keysToChangeForDuplicateWithOptions:(int64_t)a3
{
  char v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v3)
  {
    if ((v3 & 2) == 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    if (!v7
      || (uint64_t v8 = v7,
          uint64_t v9 = (void *)MEMORY[0x1E4F1C9C8],
          [v7 timeIntervalSinceReferenceDate],
          [v9 dateWithTimeIntervalSinceReferenceDate:floor(v10)],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          v8,
          !v11))
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
    }
    [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F56BC8]];

    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  [v4 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F56C80]];

  id v13 = [MEMORY[0x1E4F1CA98] null];
  [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F56BD8]];

  id v14 = [MEMORY[0x1E4F1CA98] null];
  [v4 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F56C68]];

  uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  [v4 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F56FF0]];

  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  id v16 = [MEMORY[0x1E4F1CA98] null];
  [v4 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F56BA8]];

  objc_super v17 = [MEMORY[0x1E4F1CA98] null];
  [v4 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F56C88]];

  long long v18 = [MEMORY[0x1E4F1CA98] null];
  [v4 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F56C60]];

  long long v19 = [MEMORY[0x1E4F1CA98] null];
  [v4 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F56FF8]];

  [v4 setObject:&unk_1EF952BF8 forKeyedSubscript:*MEMORY[0x1E4F56FD8]];
  [v4 setObject:&unk_1EF952C10 forKeyedSubscript:*MEMORY[0x1E4F56FD0]];
  long long v20 = [MEMORY[0x1E4F1CA98] null];
  [v4 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F57018]];

  [v4 setObject:&unk_1EF952BF8 forKeyedSubscript:*MEMORY[0x1E4F56FE0]];
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_16:
  long long v21 = [MEMORY[0x1E4F1CA98] null];
  [v4 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F56BA0]];

  if ((v3 & 0x10) != 0)
  {
LABEL_6:
    char v5 = [MEMORY[0x1E4F1CA98] null];
    [v4 setObject:v5 forKeyedSubscript:@"suggestionInfo"];
  }
LABEL_7:

  return v4;
}

- (unint64_t)countOfAttendeeProposedTimes
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![(EKCalendarItem *)self isSelfOrganizedInvitation]) {
    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v3 = [(EKCalendarItem *)self attendees];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          uint64_t v11 = [v10 proposedStartDateForEvent:self];
          if (v11)
          {
            uint64_t v12 = (void *)v11;
            int v13 = [v10 proposedStartDateStatus];

            if (v13 != 3) {
              ++v6;
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (NSString)recurrenceSet
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57010]];
}

- (void)setRecurrenceSet:(id)a3
{
}

- (id)committedConstraints
{
  char v3 = [(EKObject *)self eventStore];
  int v4 = [v3 eventAccessLevel];

  if (v4 == 1)
  {
    uint64_t v5 = [(EKObject *)self eventStore];
    unint64_t v6 = [(EKObject *)self CADObjectID];
    uint64_t v7 = [v5 cachedConstraintsForEventOrSourceWithCADObjectID:v6];
  }
  else
  {
    uint64_t v5 = [(EKEvent *)self committedValueForKey:*MEMORY[0x1E4F56BB0]];
    uint64_t v7 = [v5 constraints];
  }

  return v7;
}

- (BOOL)validateRecurrenceRule:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 frequency];
    uint64_t v9 = [(EKEvent *)self constraints];
    if ([(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56BB0]])
    {
      id v10 = [(EKEvent *)self committedConstraints];
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v12 = EKBundle();
    int v13 = [v12 localizedStringForKey:@"Choose another way to repeat this event or move it to another calendar." value:&stru_1EF932508 table:0];
    if ([v10 prohibitsMultipleMonthsInYearlyRecurrence])
    {
      if ([v9 prohibitsMultipleMonthsInYearlyRecurrence])
      {
        if (v8 == 3)
        {
          id v14 = [v7 monthsOfTheYear];
          unint64_t v15 = [v14 count];

          if (v15 >= 2)
          {
            long long v16 = [v12 localizedStringForKey:@"This Calendar Cannot Repeat Events on Multiple Months in a Year" value:&stru_1EF932508 table:0];
            uint64_t v17 = 45;
            if (!a4) {
              goto LABEL_18;
            }
            goto LABEL_17;
          }
        }
      }
    }
    if ([v10 prohibitsMultipleDaysInMonthlyRecurrence]
      && [v9 prohibitsMultipleDaysInMonthlyRecurrence]
      && v8 == 2
      && ([v7 daysOfTheMonth],
          long long v18 = objc_claimAutoreleasedReturnValue(),
          unint64_t v19 = [v18 count],
          v18,
          v19 >= 2))
    {
      long long v16 = [v12 localizedStringForKey:@"This Calendar Cannot Repeat Events on Multiple Days in a Month" value:&stru_1EF932508 table:0];
      uint64_t v17 = 46;
      if (a4)
      {
LABEL_17:
        *a4 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:v17 description:v13 reason:v16];
      }
    }
    else
    {
      if (![v10 prohibitsYearlyRecurrenceInterval]
        || ![v9 prohibitsYearlyRecurrenceInterval]
        || [v7 frequency] != 3
        || [v7 interval] < 2)
      {
        BOOL v11 = 1;
        goto LABEL_26;
      }
      uint64_t v20 = NSString;
      long long v21 = [v12 localizedStringForKey:@"This Calendar Cannot Repeat Events Every %ld Years" value:&stru_1EF932508 table:0];
      long long v16 = objc_msgSend(v20, "localizedStringWithFormat:", v21, objc_msgSend(v7, "interval"));

      uint64_t v17 = 47;
      if (a4) {
        goto LABEL_17;
      }
    }
LABEL_18:

    BOOL v11 = 0;
LABEL_26:

    goto LABEL_27;
  }
  BOOL v11 = 1;
LABEL_27:

  return v11;
}

- (BOOL)overlapsWithOrIsSameDayAsEventInSeries
{
  char v3 = [(EKEvent *)self occurrenceStartDate];
  if (!v3) {
    return 0;
  }
  originalOccurrenceStartDate = self->_originalOccurrenceStartDate;

  if (!originalOccurrenceStartDate) {
    return 0;
  }
  uint64_t v5 = [(EKCalendarDate *)self->_originalOccurrenceStartDate date];
  id v6 = [(EKEvent *)self startDate];
  uint64_t v7 = [(EKCalendarItem *)self timeZone];
  if (![(EKEvent *)self isFloating])
  {
    uint64_t v8 = [(EKObject *)self eventStore];
    uint64_t v9 = [v8 timeZone];
    uint64_t v10 = [v5 dateInTimeZone:v7 fromTimeZone:v9];

    BOOL v11 = [(EKObject *)self eventStore];
    uint64_t v12 = [v11 timeZone];
    uint64_t v13 = [v6 dateInTimeZone:v7 fromTimeZone:v12];

    id v6 = (void *)v13;
    uint64_t v5 = (void *)v10;
  }
  id v14 = [v5 dateForStartOfDayInTimeZone:v7];
  unint64_t v15 = [v6 dateForStartOfDayInTimeZone:v7];
  [v14 timeIntervalSinceReferenceDate];
  double v17 = v16;
  [v15 timeIntervalSinceReferenceDate];
  if (vabdd_f64(v17, v18) >= 2.22044605e-16)
  {
    uint64_t v20 = [(EKEvent *)self startDate];
    long long v21 = [(EKEvent *)self occurrenceStartDate];
    long long v22 = [v21 timeZone];
    BOOL v19 = [(EKEvent *)self _occurrenceExistsOnDate:v20 timeZone:v22];
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)_validateDatesAndRecurrencesGivenSpan:(int64_t)a3 error:(id *)a4
{
  if (([MEMORY[0x1E4F57700] currentProcessHasSyncClientEntitlement] & 1) == 0)
  {
    uint64_t v8 = [(EKEvent *)self constraints];
    if (v8)
    {
      uint64_t v9 = [(EKEvent *)self startDate];
      [v9 timeIntervalSinceReferenceDate];
      uint64_t v10 = [(EKObject *)self eventStore];
      BOOL v11 = [v10 timeZone];
      uint64_t GregorianDateWithFallbackToDefaultTimeZone = CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone();
      uint64_t v14 = v13;

      if ([(EKEvent *)self isAllDay])
      {
        uint64_t GregorianDateWithFallbackToDefaultTimeZone = CalGregorianDateGetGregorianDateForDay();
        uint64_t v14 = v15;
      }
      double v16 = [(EKObject *)self eventStore];
      double v17 = [v16 timeZone];
      BOOL v18 = -[EKEvent _checkStartDateConstraintAgainstDate:timeZone:error:](self, "_checkStartDateConstraintAgainstDate:timeZone:error:", GregorianDateWithFallbackToDefaultTimeZone, v14, v17, a4);

      if (!v18) {
        goto LABEL_28;
      }
      if ([v8 eventDurationConstrainedToRecurrenceInterval]
        && [(EKEvent *)self durationOverlapsRecurrenceInterval])
      {
        if (a4)
        {
          BOOL v19 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v20 = 7;
LABEL_20:
          [v19 errorWithEKErrorCode:v20];
          BOOL v7 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

          return v7;
        }
        goto LABEL_28;
      }
      if (![(EKObject *)self isNew])
      {
        int v21 = [v8 requiresOccurrencesConformToRecurrenceRule];
        if (a3)
        {
          if (v21)
          {
            long long v22 = [(EKCalendarItem *)self recurrenceRules];
            BOOL v23 = [(EKEvent *)self conformsToRecurrenceRules:v22];

            if (!v23 && ![(EKEvent *)self _isSimpleRepeatingEvent])
            {
              if (a4)
              {
                uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v25 = EKBundle();
                uint64_t v26 = [v25 localizedStringForKey:@"Choose another way to repeat this event or move it to another calendar." value:&stru_1EF932508 table:0];
                uint64_t v27 = EKBundle();
                objc_super v28 = [v27 localizedStringForKey:@"That calendar does not allow events to start outside of their recurrence patterns." value:&stru_1EF932508 table:0];
                *a4 = [v24 errorWithEKErrorCode:13 description:v26 reason:v28];
              }
              goto LABEL_28;
            }
          }
        }
      }
      if ([v8 occurrencesMustOccurOnSeparateDays]
        && [(EKEvent *)self overlapsWithOrIsSameDayAsEventInSeries])
      {
        if (a4)
        {
          BOOL v19 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v20 = 10;
          goto LABEL_20;
        }
LABEL_28:
        BOOL v7 = 0;
        goto LABEL_29;
      }
      if ([v8 occurrenceOrderEnforcedAfterDetachment]
        && [(EKEvent *)self isOutOfOrderWithEventInSeries])
      {
        if (a4)
        {
          BOOL v19 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v20 = 69;
          goto LABEL_20;
        }
        goto LABEL_28;
      }
    }
    BOOL v7 = 1;
    goto LABEL_29;
  }
  return 1;
}

- (BOOL)durationOverlapsRecurrenceInterval
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  char v3 = [(EKCalendarItem *)self recurrenceRules];
  if ([v3 count])
  {
    int v4 = (void *)MEMORY[0x1E4F1C9A8];
    uint64_t v5 = [(EKObject *)self eventStore];
    id v6 = [v5 timeZone];
    BOOL v7 = [v4 CalGregorianCalendarForTimeZone:v6];

    uint64_t v8 = [(EKEvent *)self startDate];
    uint64_t v9 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    int v21 = v3;
    id v10 = v3;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      char v14 = 1;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          double v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v16 interval] >= 1)
          {
            double v17 = [v16 dateComponents];
            BOOL v18 = [v7 dateByAddingComponents:v17 toDate:v8 options:0];
            if ([v18 CalIsBeforeDate:v9]) {
              char v14 = 0;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }
    else
    {
      char v14 = 1;
    }

    BOOL v19 = (v14 & 1) == 0;
    char v3 = v21;
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

+ (BOOL)_notDetachedOccurrenceOfEvent:(id)a3 existsInDateRangeWithStartDate:(id)a4 endDate:(id)a5 inTimeZone:(id)a6
{
  id v9 = a3;
  id v42 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([v9 hasRecurrenceRules])
  {
    uint64_t v12 = [v9 recurrenceRules];
    [v9 duration];
    double v14 = v13;
    id v41 = v12;
    if ([v12 count])
    {
      char v15 = 0;
      double v16 = 0;
      long long v43 = 0;
      uint64_t v44 = 0;
      uint64_t v17 = 0;
      double v18 = (double)(unint64_t)v14;
      long long v45 = v9;
      while (1)
      {
        id v19 = v42;
        if ((v15 & 1) == 0) {
          break;
        }
LABEL_37:

        if (++v17 >= (unint64_t)[v41 count]) {
          goto LABEL_41;
        }
      }
      while (1)
      {
        if (![v19 CalIsBeforeOrSameAsDate:v10]) {
          goto LABEL_37;
        }
        uint64_t v20 = objc_alloc_init(EKRecurrenceGenerator);
        LOBYTE(v39) = 1;
        id v21 = [(EKRecurrenceGenerator *)v20 copyOccurrenceDatesWithEKEvent:v9 startDate:v19 endDate:v10 timeZone:v11 exceptionDates:0 limit:1 adjustDatesForAllDayEvents:v39];
        if (![v21 count])
        {
          long long v23 = 0;
LABEL_36:

          goto LABEL_37;
        }
        long long v22 = [v21 objectAtIndex:0];
        long long v23 = v22;
        if (!v22 || ![v22 CalIsBeforeOrSameAsDate:v10]) {
          goto LABEL_36;
        }
        if ([v23 CalIsAfterOrSameAsDate:v19])
        {
          if (v16)
          {
            uint64_t v24 = v44;
            if (!v44) {
              goto LABEL_34;
            }
          }
          else
          {
            long long v29 = [v9 exceptionDatesAdjustedForFloatingEvents];
            long long v30 = v29;
            if (v29)
            {
              id v31 = v29;
            }
            else
            {
              id v31 = [MEMORY[0x1E4F1CAD0] set];
            }
            double v16 = v31;

            long long v34 = [v45 detachedItems];
            long long v35 = [v34 valueForKey:@"originalStartDate"];

            if (v35)
            {
              uint64_t v36 = [v16 setByAddingObjectsFromSet:v35];

              double v16 = (void *)v36;
            }
            uint64_t v24 = [v16 count];
            if ([v45 isFloating] && !v43)
            {
              long long v43 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
            }

            id v9 = v45;
            if (!v24)
            {
LABEL_34:
              uint64_t v44 = 0;
              char v15 = 1;
              goto LABEL_24;
            }
          }
          uint64_t v44 = v24;
          id v25 = v23;
          uint64_t v26 = v25;
          if (v43)
          {
            id v27 = v11;
            if (!v11)
            {
              id v40 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
              id v27 = v40;
            }
            objc_super v28 = [v26 dateInTimeZone:v43 fromTimeZone:v27];

            if (!v11) {
          }
            }
          else
          {
            objc_super v28 = v25;
          }
          int v32 = [v16 containsObject:v28];

          if (!v32)
          {
            char v15 = 1;
            goto LABEL_23;
          }
          char v15 = 0;
        }
        uint64_t v33 = [v23 dateByAddingTimeInterval:v18];

        id v19 = (id)v33;
LABEL_23:
        id v9 = v45;
LABEL_24:

        if (v15) {
          goto LABEL_37;
        }
      }
    }
    long long v43 = 0;
    double v16 = 0;
    char v15 = 0;
LABEL_41:

    BOOL v37 = v15 & 1;
  }
  else
  {
    BOOL v37 = 0;
  }

  return v37;
}

- (BOOL)_occurrenceExistsOnDate:(id)a3 timeZone:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(EKEvent *)self requiresDetach];
  id v9 = self;
  id v10 = v9;
  id v11 = v9;
  if (!v8)
  {
    uint64_t v12 = [(EKCalendarItem *)v9 originalItem];
    if (!v12)
    {
      BOOL v28 = 0;
      id v11 = v10;
      goto LABEL_24;
    }
    id v11 = (void *)v12;
  }
  double v13 = [v6 dateForStartOfDayInTimeZone:v7];
  double v14 = objc_msgSend(v13, "ek_ios_dateForEndOfDayInTimeZone:", v7);
  if ([(id)objc_opt_class() _notDetachedOccurrenceOfEvent:v11 existsInDateRangeWithStartDate:v13 endDate:v14 inTimeZone:v7])
  {
    char v15 = 1;
  }
  else
  {
    long long v30 = v14;
    id v31 = v11;
    id v32 = v6;
    double v16 = [v11 detachedItems];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      char v15 = 0;
      uint64_t v19 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v34 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (([v21 isEqual:v10] & 1) == 0)
          {
            long long v22 = [v21 startDate];
            if ([v21 isFloating])
            {
              uint64_t v23 = [v22 dateInTimeZone:v7 fromTimeZone:0];

              long long v22 = (void *)v23;
            }
            uint64_t v24 = [v22 dateForStartOfDayInTimeZone:v7];
            [v13 timeIntervalSinceReferenceDate];
            double v26 = v25;
            [v24 timeIntervalSinceReferenceDate];
            if (vabdd_f64(v26, v27) < 2.22044605e-16) {
              char v15 = 1;
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v18);
    }
    else
    {
      char v15 = 0;
    }

    id v11 = v31;
    id v6 = v32;
    double v14 = v30;
  }

  BOOL v28 = v15 & 1;
LABEL_24:

  return v28;
}

- (BOOL)_checkStartDateConstraintAgainstDate:(id)a3 timeZone:(id)a4 error:(id *)a5
{
  id v6 = a4;
  id v7 = [(EKEvent *)self constraints];
  int v8 = [v7 futureStartDateLimitedToOccurrenceCacheBounds];

  if (v8) {
    CalEventOccurrenceCacheCopyBoundsForTimeZone();
  }

  return 1;
}

- (BOOL)conformsToRecurrenceRules:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v8 frequency])
        {
          id v9 = objc_alloc_init(EKRecurrenceGenerator);
          id v10 = [(EKEvent *)self startDate];
          id v11 = [(EKCalendarItem *)self timeZone];
          uint64_t v12 = [v10 dateForDayInTimeZone:v11];

          double v13 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
          double v14 = [(EKCalendarItem *)self timeZone];
          char v15 = objc_msgSend(v13, "ek_ios_dateForEndOfDayInTimeZone:", v14);

          double v16 = [(EKCalendarItem *)self timeZone];
          id v17 = [(EKRecurrenceGenerator *)v9 copyOccurrenceDatesWithEKEvent:self recurrenceRule:v8 startDate:v12 endDate:v15 timeZone:v16 limit:1];

          uint64_t v18 = [v17 count];
          if (!v18)
          {
            BOOL v19 = 0;
            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 1;
LABEL_12:

  return v19;
}

- (BOOL)allowsSpansOtherThanThisEvent
{
  char v3 = [(EKEvent *)self constraints];
  int v4 = [v3 requiresOccurrencesConformToRecurrenceRule];

  if (!v4 || [(EKEvent *)self _isSimpleRepeatingEvent]) {
    return 1;
  }
  uint64_t v6 = [(EKCalendarItem *)self recurrenceRules];
  BOOL v7 = [(EKEvent *)self conformsToRecurrenceRules:v6];

  return v7;
}

- (BOOL)allowsResponseCommentModifications
{
  if (![(EKEvent *)self allowsParticipationStatusModifications]) {
    return 0;
  }
  char v3 = [(EKEvent *)self constraints];
  if ([v3 supportsResponseComments]) {
    BOOL v4 = [(EKCalendarItem *)self actionsState] == 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)allowsClearingCommentsAsOrganizer
{
  id v2 = [(EKEvent *)self constraints];
  char v3 = [v2 supportsClearingPrivateComments];

  return v3;
}

- (BOOL)_isSimpleRepeatingEvent
{
  char v3 = [(EKCalendarItem *)self recurrenceRules];
  if ([v3 count] == 1)
  {
    BOOL v4 = [(EKCalendarItem *)self recurrenceRules];
    uint64_t v5 = [v4 objectAtIndexedSubscript:0];
    char v6 = [v5 isSimpleRule];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldCancelInsteadOfDeleteWithSpan:(int64_t)a3
{
  if (a3 == 3)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    double v14 = v13;
    char v15 = @"EKSpanAutomaticChange not allowed here";
    SEL v16 = a2;
    id v17 = self;
    uint64_t v18 = 7299;
LABEL_16:
    [v13 handleFailureInMethod:v16 object:v17 file:@"EKEvent.m" lineNumber:v18 description:v15];

    goto LABEL_3;
  }
  if (a3 == 2)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    double v14 = v13;
    char v15 = @"EKSpanEveryOccurrenceUnlessAlreadyDetached not allowed here";
    SEL v16 = a2;
    id v17 = self;
    uint64_t v18 = 7300;
    goto LABEL_16;
  }
LABEL_3:
  char v6 = [(EKEvent *)self constraints];
  int v7 = [v6 shouldCancelDeletedEvents];

  if (!v7 || [(EKEvent *)self isDetached] || ![(EKCalendarItem *)self _hadAttendees]) {
    return 0;
  }
  int v8 = [(EKEvent *)self committedValueForKey:*MEMORY[0x1E4F56C60]];
  id v9 = v8;
  if (v8)
  {
    char v10 = [v8 isCurrentUser];
    if ((a3 & 0xFFFFFFFFFFFFFFFBLL) != 0) {
      BOOL v11 = 0;
    }
    else {
      BOOL v11 = v10;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_shouldDeclineInsteadOfDelete
{
  char v3 = [(EKEvent *)self constraints];
  int v4 = [v3 shouldDeclineDeletedInvitations];

  if (!v4 || ![(EKCalendarItem *)self _hadAttendees]) {
    return 0;
  }
  uint64_t v5 = [(EKEvent *)self committedValueForKey:*MEMORY[0x1E4F56C60]];
  char v6 = v5;
  BOOL v7 = v5 && ([v5 isCurrentUser] & 1) == 0 && -[EKEvent status](self, "status") != EKEventStatusCanceled;

  return v7;
}

- (void)_deleteWithSpan:(int64_t)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
      if ([(EKEvent *)self isDetached])
      {
        uint64_t v5 = [(EKCalendarItem *)self originalItem];
        char v6 = [(EKEvent *)self originalStartDate];
        [v5 _addExceptionDate:v6];

        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        BOOL v7 = [v5 detachedItems];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v42 objects:v47 count:16];
        if (!v8) {
          goto LABEL_20;
        }
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v43;
        while (1)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v43 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            if ([v12 isEqual:self])
            {
              id v14 = v12;

              if (v14)
              {
                [v5 _removeDetachedItem:v14];
                BOOL v7 = v14;
                goto LABEL_20;
              }
LABEL_21:
              [(EKCalendarItem *)self _deleteSelfAndDetached];
              [(EKObject *)self addCoCommitObject:v5];
              goto LABEL_50;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v42 objects:v47 count:16];
          if (!v9)
          {
LABEL_20:

            goto LABEL_21;
          }
        }
      }
      double v13 = [(EKEvent *)self singleRecurrenceRule];

      if (v13)
      {
        [(EKEvent *)self _deleteThisOccurrence];
      }
      else
      {
        [(EKCalendarItem *)self _deleteSelfAndDetached];
      }
      return;
    case 1:
      if ([(EKEvent *)self isDetached])
      {
        id v37 = [(EKEvent *)self originalStartDate];
      }
      else
      {
        SEL v16 = [(EKEvent *)self originalOccurrenceStartDate];
        id v37 = [v16 date];
      }
      if ([(EKEvent *)self isFloating] && ![(EKEvent *)self isAllDay])
      {
        id v17 = [(EKObject *)self eventStore];
        uint64_t v18 = [v17 timeZone];
        uint64_t v19 = [v37 dateInTimeZone:0 fromTimeZone:v18];

        id v37 = (id)v19;
      }
      if ([(EKEvent *)self isDetached])
      {
        uint64_t v20 = [(EKCalendarItem *)self originalItem];
        [v20 _deleteFromOccurrenceDateOnward:v37 includeSlices:1];
      }
      else
      {
        [(EKEvent *)self _deleteFromOccurrenceDateOnward:v37 includeSlices:1];
      }
      goto LABEL_31;
    case 2:
      id v32 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v33 = @"EKSpanEveryOccurrenceUnlessAlreadyDetached not allowed here";
      id v37 = v32;
      SEL v34 = a2;
      long long v35 = self;
      uint64_t v36 = 7345;
      goto LABEL_53;
    case 3:
      id v32 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v33 = @"EKSpanAutomaticChange not allowed here";
      id v37 = v32;
      SEL v34 = a2;
      long long v35 = self;
      uint64_t v36 = 7344;
LABEL_53:
      [v32 handleFailureInMethod:v34 object:v35 file:@"EKEvent.m" lineNumber:v36 description:v33];
LABEL_31:

      return;
    case 4:
      if ([(EKEvent *)self isDetached])
      {
        char v15 = [(EKCalendarItem *)self originalItem];
      }
      else
      {
        char v15 = self;
      }
      uint64_t v5 = v15;
      id v21 = [(EKEvent *)v15 recurrenceSet];

      if (v21)
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v22 = [(EKObject *)self eventStore];
        long long v23 = [v22 eventsWithSameRecurrenceSetAsEvent:v5];

        uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v39;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v39 != v26) {
                objc_enumerationMutation(v23);
              }
              BOOL v28 = *(void **)(*((void *)&v38 + 1) + 8 * j);
              long long v29 = [v28 eventOccurrenceID];
              long long v30 = [(EKEvent *)self eventOccurrenceID];
              char v31 = [v29 isEqualToString:v30];

              if ((v31 & 1) == 0)
              {
                [v28 _deleteSelfAndDetached];
                [v28 updatePersistentObject];
                [(EKObject *)self addCoCommitObject:v28];
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }
          while (v25);
        }
      }
      [v5 _deleteSelfAndDetached];
LABEL_50:

      return;
    default:
      return;
  }
}

- (void)_deleteFromOccurrenceDateOnward:(id)a3 includeSlices:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v67 = [(EKEvent *)self _committedStartDate];
  BOOL v7 = [(EKCalendarItem *)self timeZone];
  if (v7)
  {
    if (!v4) {
      goto LABEL_15;
    }
  }
  else
  {
    BOOL v7 = (void *)CalTimeZoneCopyCFTimeZone();
    if (!v4) {
      goto LABEL_15;
    }
  }
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  uint64_t v8 = [(EKObject *)self eventStore];
  uint64_t v9 = [v8 eventsWithSameRecurrenceSetAsEvent:self];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v94 objects:v102 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v95 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v94 + 1) + 8 * i);
        char v15 = [v14 startDate];
        int v16 = [v15 isAfterDate:v6];

        if (v16)
        {
          [v14 _deleteSelfAndDetached];
          [(EKObject *)self addCoCommitObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v94 objects:v102 count:16];
    }
    while (v11);
  }

LABEL_15:
  id v17 = [(EKEvent *)self constraints];
  int v18 = [v17 recurrenceSeriesMustIncludeMoreThanFirstOccurrence];

  int v73 = v18;
  if (v18) {
    id v72 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v72 = 0;
  }
  uint64_t v19 = [(EKCalendarItem *)self recurrenceRules];
  if ([v19 count])
  {
    id v20 = v67;
    id v21 = [v6 dateByAddingTimeInterval:-1.0];
    long long v75 = objc_alloc_init(EKRecurrenceGenerator);
  }
  else
  {
    long long v75 = 0;
    id v21 = 0;
    id v20 = 0;
  }
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id obj = v19;
  id v70 = v20;
  long long v71 = v21;
  uint64_t v77 = [obj countByEnumeratingWithState:&v90 objects:v101 count:16];
  if (v77)
  {
    uint64_t v76 = *(void *)v91;
    long long v68 = v7;
LABEL_23:
    uint64_t v22 = 0;
    while (1)
    {
      if (*(void *)v91 != v76) {
        objc_enumerationMutation(obj);
      }
      long long v23 = *(void **)(*((void *)&v90 + 1) + 8 * v22);
      uint64_t v24 = [v23 recurrenceEnd];
      if (![v24 occurrenceCount]) {
        break;
      }
      LOBYTE(v66) = 0;
      id v25 = [(EKRecurrenceGenerator *)v75 copyOccurrenceDatesWithEKEvent:self recurrenceRule:v23 startDate:v20 endDate:v21 timeZone:v7 exceptionDates:0 limit:0 adjustDatesForAllDayEvents:v66];
      unint64_t v26 = [v25 count];
      uint64_t v27 = v26;
      if (v26 >= 2) {
        goto LABEL_38;
      }
      if (v26 != 1)
      {
        [(EKCalendarItem *)self _deleteSelfAndDetached];
        id v65 = obj;
        id v51 = obj;
        goto LABEL_82;
      }
      if (!v73)
      {
        uint64_t v27 = 1;
LABEL_38:
        long long v30 = +[EKRecurrenceEnd recurrenceEndWithOccurrenceCount:v27];
        [v23 setRecurrenceEnd:v30];
        goto LABEL_47;
      }
      [v72 addObject:v23];
LABEL_48:

      if (v77 == ++v22)
      {
        uint64_t v77 = [obj countByEnumeratingWithState:&v90 objects:v101 count:16];
        if (v77) {
          goto LABEL_23;
        }
        goto LABEL_50;
      }
    }
    BOOL v28 = [v24 endDate];
    id v25 = v28;
    if (v28 && ![v28 CalIsAfterOrSameAsDate:v6]) {
      goto LABEL_48;
    }
    LOBYTE(v66) = 0;
    id v29 = [(EKRecurrenceGenerator *)v75 copyOccurrenceDatesWithEKEvent:self recurrenceRule:v23 startDate:v20 endDate:v21 timeZone:v7 exceptionDates:0 limit:0 adjustDatesForAllDayEvents:v66];
    long long v30 = v29;
    if (v73)
    {
      unint64_t v31 = [v29 count];
      if (v31 < 2)
      {
        if (v31 == 1) {
          [v72 addObject:v23];
        }
        goto LABEL_47;
      }
      id v32 = [v30 lastObject];
      long long v33 = +[EKRecurrenceEnd recurrenceEndWithEndDate:v32];
      [v23 setRecurrenceEnd:v33];

      id v20 = v70;
    }
    else
    {
      uint64_t v34 = [v29 lastObject];
      if (!v34)
      {
        [(EKCalendarItem *)self _deleteSelfAndDetached];

        id v65 = obj;
        id v51 = obj;
        id v21 = v71;
        goto LABEL_82;
      }
      long long v35 = (void *)v34;
      if ([(EKEvent *)self isAllDay])
      {
        uint64_t v36 = +[EKRecurrenceEnd recurrenceEndWithEndDate:v35];
        [v23 setRecurrenceEnd:v36];
      }
      else
      {
        id v37 = (void *)MEMORY[0x1E4F57838];
        long long v38 = [(EKEvent *)self effectiveTimeZone];
        uint64_t v36 = [v37 calendarDateWithDate:v35 timeZone:v38];

        long long v39 = [v36 calendarDateForEndOfDay];
        [v39 date];
        long long v40 = v69 = v30;

        long long v41 = +[EKRecurrenceEnd recurrenceEndWithEndDate:v40];
        [v23 setRecurrenceEnd:v41];

        BOOL v7 = v68;
        long long v30 = v69;
      }

      id v20 = v70;
    }
    id v21 = v71;
LABEL_47:

    goto LABEL_48;
  }
LABEL_50:

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v42 = v72;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v86 objects:v100 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v87;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v87 != v45) {
          objc_enumerationMutation(v42);
        }
        [(EKCalendarItem *)self removeRecurrenceRule:*(void *)(*((void *)&v86 + 1) + 8 * j)];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v86 objects:v100 count:16];
    }
    while (v44);
  }

  long long v47 = [(EKCalendarItem *)self recurrenceRules];
  uint64_t v48 = [v47 count];

  if (!v48) {
    [(EKEvent *)self _updateSelfFromDetachedEventIfNeededForDelete];
  }
  unint64_t v49 = [(EKCalendarItem *)self detachedItems];
  id v50 = [v49 allObjects];

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v51 = v50;
  uint64_t v52 = [v51 countByEnumeratingWithState:&v82 objects:v99 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v83;
    do
    {
      for (uint64_t k = 0; k != v53; ++k)
      {
        if (*(void *)v83 != v54) {
          objc_enumerationMutation(v51);
        }
        id v56 = *(void **)(*((void *)&v82 + 1) + 8 * k);
        if (([v56 hasRecurrenceRules] & 1) == 0)
        {
          id v57 = [v56 originalStartDate];
          if ([v57 CalIsAfterOrSameAsDate:v6]) {
            [(EKCalendarItem *)self _removeDetachedItem:v56];
          }
        }
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v82 objects:v99 count:16];
    }
    while (v53);
  }

  uint64_t v58 = [(EKCalendarItem *)self exceptionDates];
  uint64_t v59 = [v58 allObjects];

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v25 = v59;
  uint64_t v60 = [v25 countByEnumeratingWithState:&v78 objects:v98 count:16];
  if (v60)
  {
    uint64_t v61 = v60;
    uint64_t v62 = *(void *)v79;
    do
    {
      for (uint64_t m = 0; m != v61; ++m)
      {
        if (*(void *)v79 != v62) {
          objc_enumerationMutation(v25);
        }
        id v64 = *(void **)(*((void *)&v78 + 1) + 8 * m);
        if ([v64 CalIsAfterDate:v6]) {
          [(EKCalendarItem *)self _removeExceptionDate:v64];
        }
      }
      uint64_t v61 = [v25 countByEnumeratingWithState:&v78 objects:v98 count:16];
    }
    while (v61);
  }
  uint64_t v24 = v25;
  id v20 = v70;
  id v21 = v71;
  id v65 = obj;
LABEL_82:
}

- (void)_updateSelfFromDetachedEventIfNeededForDelete
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  char v3 = [(EKEvent *)self _committedStartDate];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  BOOL v4 = [(EKCalendarItem *)self detachedItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v69;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v69 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v68 + 1) + 8 * v8);
      uint64_t v10 = [v9 originalStartDate];
      char v11 = [v10 isEqualToDate:v3];

      if (v11) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v68 objects:v76 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v9;

    if (!v12) {
      goto LABEL_45;
    }
    double v13 = [v12 startDate];
    [(EKEvent *)self setStartDate:v13];

    id v14 = [v12 endDateUnadjustedForLegacyClients];
    [(EKEvent *)self setEndDateUnadjustedForLegacyClients:v14];

    char v15 = [v12 timeZone];
    [(EKEvent *)self setTimeZone:v15];

    int v16 = [v12 title];
    [(EKEvent *)self setTitle:v16];

    id v17 = [v12 structuredLocationWithoutPrediction];
    int v18 = [v17 duplicate];
    [(EKEvent *)self setStructuredLocation:v18];

    uint64_t v19 = [v12 clientLocation];
    id v20 = [v19 duplicate];
    [(EKCalendarItem *)self setClientLocation:v20];

    id v21 = [v12 notes];
    [(EKEvent *)self setNotes:v21];

    -[EKEvent setStatus:](self, "setStatus:", [v12 status]);
    -[EKEvent setAvailability:](self, "setAvailability:", [v12 availability]);
    -[EKEvent setPrivacyLevel:](self, "setPrivacyLevel:", [v12 privacyLevel]);
    [v12 travelTime];
    -[EKEvent setTravelTime:](self, "setTravelTime:");
    uint64_t v22 = [v12 URL];
    [(EKEvent *)self setURL:v22];

    -[EKEvent setTravelAdvisoryBehavior:](self, "setTravelAdvisoryBehavior:", [v12 travelAdvisoryBehavior]);
    [(EKCalendarItem *)self setAlarms:0];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v23 = [v12 alarms];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v64 objects:v75 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v65 != v26) {
            objc_enumerationMutation(v23);
          }
          BOOL v28 = [*(id *)(*((void *)&v64 + 1) + 8 * i) duplicate];
          [(EKCalendarItem *)self addAlarm:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v64 objects:v75 count:16];
      }
      while (v25);
    }

    id v29 = [(EKCalendarItem *)self selfAttendee];
    long long v30 = [(EKCalendarItem *)self attendees];
    unint64_t v31 = (void *)[v30 copy];

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v32 = v31;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v60 objects:v74 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v61 != v35) {
            objc_enumerationMutation(v32);
          }
          id v37 = *(void **)(*((void *)&v60 + 1) + 8 * j);
          if (([v37 isEqual:v29] & 1) == 0) {
            [(EKCalendarItem *)self removeAttendee:v37];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v60 objects:v74 count:16];
      }
      while (v34);
    }

    long long v38 = [v12 selfAttendee];

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v39 = [v12 attendees];
    uint64_t v40 = [v39 countByEnumeratingWithState:&v56 objects:v73 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v57;
      do
      {
        for (uint64_t k = 0; k != v41; ++k)
        {
          if (*(void *)v57 != v42) {
            objc_enumerationMutation(v39);
          }
          uint64_t v44 = *(void **)(*((void *)&v56 + 1) + 8 * k);
          if (([v44 isEqual:v38] & 1) == 0)
          {
            uint64_t v45 = (void *)[v44 copy];
            [(EKCalendarItem *)self addAttendee:v45];
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v56 objects:v73 count:16];
      }
      while (v41);
    }

    [(EKCalendarItem *)self setAttachments:0];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v46 = objc_msgSend(v12, "attachments", 0);
    uint64_t v47 = [v46 countByEnumeratingWithState:&v52 objects:v72 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v53;
      do
      {
        for (uint64_t m = 0; m != v48; ++m)
        {
          if (*(void *)v53 != v49) {
            objc_enumerationMutation(v46);
          }
          id v51 = [*(id *)(*((void *)&v52 + 1) + 8 * m) duplicate];
          [(EKCalendarItem *)self addAttachment:v51];
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v52 objects:v72 count:16];
      }
      while (v48);
    }

    [(EKCalendarItem *)self _removeDetachedItem:v12];
  }
  else
  {
LABEL_9:
    id v12 = v4;
  }

LABEL_45:
}

- (void)_deleteThisOccurrence
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  long long v39 = [(EKEvent *)self originalOccurrenceStartDate];
  uint64_t v36 = [v39 date];
  if ([(EKEvent *)self isFloating])
  {
    char v3 = [(EKObject *)self eventStore];
    BOOL v4 = [v3 timeZone];
    uint64_t v5 = [v36 dateInTimeZone:0 fromTimeZone:v4];

    uint64_t v36 = (void *)v5;
  }
  uint64_t v6 = [(EKCalendarItem *)self exceptionDates];
  uint64_t v7 = (void *)[v6 mutableCopy];

  uint64_t v43 = v7;
  [v7 addObject:v36];
  uint64_t v44 = objc_alloc_init(EKRecurrenceGenerator);
  uint64_t v35 = [(EKEvent *)self _committedStartDate];
  uint64_t v8 = (void *)MEMORY[0x1E4F57838];
  uint64_t v9 = [(EKCalendarItem *)self timeZone];
  uint64_t v10 = [v8 calendarDateWithDate:v35 timeZone:v9];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v58 = 0u;
  long long v57 = 0u;
  char v11 = [(EKCalendarItem *)self recurrenceRules];
  id v12 = (void *)[v11 copy];

  id obj = v12;
  uint64_t v42 = [v12 countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (!v42)
  {

    char v13 = 0;
    goto LABEL_34;
  }
  char v13 = 0;
  char v40 = 0;
  uint64_t v41 = *(void *)v58;
  do
  {
    for (uint64_t i = 0; i != v42; ++i)
    {
      if (*(void *)v58 != v41) {
        objc_enumerationMutation(obj);
      }
      char v15 = *(void **)(*((void *)&v57 + 1) + 8 * i);
      int v16 = [MEMORY[0x1E4F1C978] arrayWithObject:v15];
      id v17 = [(EKRecurrenceGenerator *)v44 nextOccurrenceDateWithEKRecurrences:v16 forCalendarItem:self exceptionDates:v43 initialDate:v10 afterDate:v10];

      if (!v17)
      {
        [(EKCalendarItem *)self removeRecurrenceRule:v15];
        char v13 = 1;
        goto LABEL_29;
      }
      int v18 = [v15 recurrenceEnd];
      if (v18)
      {
        uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObject:v15];
        id v20 = [(EKRecurrenceGenerator *)v44 nextOccurrenceDateWithEKRecurrences:v19 forCalendarItem:self exceptionDates:v43 initialDate:v10 afterDate:v39];

        if (!v20)
        {
          id v21 = [(EKEvent *)self _committedStartDate];
          if ([(EKEvent *)self isFloating])
          {
            uint64_t v22 = [(EKObject *)self eventStore];
            long long v23 = [v22 timeZone];
            uint64_t v24 = [v21 dateInTimeZone:0 fromTimeZone:v23];

            id v21 = (void *)v24;
          }
          uint64_t v25 = [v18 endDate];

          BOOL v26 = v25 == 0;
          uint64_t v27 = [v39 date];
          BOOL v28 = [(EKCalendarItem *)self timeZone];
          if (v26)
          {
            id v29 = [(EKRecurrenceGenerator *)v44 copyOccurrenceDatesWithEKEvent:self recurrenceRule:v15 startDate:v21 endDate:v27 timeZone:v28 exceptionDates:0 limit:0];

            uint64_t v53 = 0;
            long long v54 = &v53;
            uint64_t v55 = 0x2020000000;
            char v56 = 0;
            uint64_t v49 = 0;
            id v50 = &v49;
            uint64_t v51 = 0x2020000000;
            uint64_t v52 = 0;
            v45[0] = MEMORY[0x1E4F143A8];
            v45[1] = 3221225472;
            v45[2] = __32__EKEvent__deleteThisOccurrence__block_invoke;
            v45[3] = &unk_1E5B98BE0;
            id v46 = v43;
            uint64_t v47 = &v49;
            uint64_t v48 = &v53;
            [v29 enumerateObjectsWithOptions:2 usingBlock:v45];
            if (*((unsigned char *)v54 + 24))
            {
              unint64_t v31 = +[EKRecurrenceEnd recurrenceEndWithOccurrenceCount:v50[3]];
            }
            else
            {
              unint64_t v31 = 0;
            }

            _Block_object_dispose(&v49, 8);
            _Block_object_dispose(&v53, 8);
          }
          else
          {
            id v29 = [(EKRecurrenceGenerator *)v44 copyOccurrenceDatesWithEKEvent:self recurrenceRule:v15 startDate:v21 endDate:v27 timeZone:v28 exceptionDates:v43 limit:0];

            if ([v29 count])
            {
              long long v30 = [v29 lastObject];
            }
            else
            {
              id v32 = [MEMORY[0x1E4F28B00] currentHandler];
              [v32 handleFailureInMethod:a2 object:self file:@"EKEvent.m" lineNumber:7756 description:@"Unexpected number of occurrences (0) remaining in series after deleting the last remaining occurrence."];

              long long v30 = 0;
            }
            unint64_t v31 = +[EKRecurrenceEnd recurrenceEndWithEndDate:v30];
          }
          [v15 setRecurrenceEnd:v31];

          char v13 = 1;
          goto LABEL_28;
        }
      }
      if (v40) {
        char v40 = 1;
      }
      else {
        char v40 = [(EKRecurrenceGenerator *)v44 occurrenceDate:v39 matchesRecurrenceRule:v15 forEvent:self includeDetachedEventsInSeries:1];
      }
LABEL_28:

LABEL_29:
    }
    uint64_t v42 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
  }
  while (v42);

  if (v40) {
    [(EKCalendarItem *)self _addExceptionDate:v36];
  }
LABEL_34:
  uint64_t v33 = [(EKCalendarItem *)self recurrenceRules];
  BOOL v34 = [v33 count] == 0;

  if (v34) {
    [(EKEvent *)self _updateSelfFromDetachedEventIfNeededForDelete];
  }
  if (v13) {
    [(EKEvent *)self _filterExceptionDatesAndDetachments];
  }
}

uint64_t __32__EKEvent__deleteThisOccurrence__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 + 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)_cancelWithSpan:(int64_t)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 4:
      -[EKEvent setStatus:](self, "setStatus:", 3, a4);
      [(EKEvent *)self _cancelDetachedEvents];
      char v17 = 1;
      goto LABEL_11;
    case 3:
      id v32 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 3, a4);
      uint64_t v33 = v32;
      BOOL v34 = @"EKSpanAutomaticChange not allowed here";
      SEL v35 = a2;
      uint64_t v36 = self;
      uint64_t v37 = 7835;
      break;
    case 2:
      id v32 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 2, a4);
      uint64_t v33 = v32;
      BOOL v34 = @"EKSpanEveryOccurrenceUnlessAlreadyDetached not allowed here";
      SEL v35 = a2;
      uint64_t v36 = self;
      uint64_t v37 = 7836;
      break;
    default:
      goto LABEL_4;
  }
  [v32 handleFailureInMethod:v35 object:v36 file:@"EKEvent.m" lineNumber:v37 description:v34];

LABEL_4:
  if ([(EKCalendarItem *)self _hadRecurrenceRules])
  {
    uint64_t v7 = [(EKEvent *)self originalOccurrenceStartDate];
    uint64_t v8 = [v7 date];

    uint64_t v9 = [(EKEvent *)self occurrenceStartDate];
    uint64_t v10 = [v9 date];

    if ([(EKEvent *)self isFloating])
    {
      char v11 = [(EKObject *)self eventStore];
      id v12 = [v11 timeZone];
      uint64_t v13 = [v8 dateInTimeZone:0 fromTimeZone:v12];

      id v14 = [(EKObject *)self eventStore];
      char v15 = [v14 timeZone];
      uint64_t v16 = [v10 dateInTimeZone:0 fromTimeZone:v15];

      uint64_t v10 = (void *)v16;
      uint64_t v8 = (void *)v13;
    }
    [(EKEvent *)self _detachOrSliceWithSpan:a3 withOriginalStartDate:v8 newStartDate:v10];
    [(EKObject *)self insertPersistentObjectIfNeeded];
  }
  [(EKEvent *)self setStatus:3];
  if (a3 == 1)
  {
    char v17 = 0;
LABEL_11:
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    int v18 = [(EKObject *)self eventStore];
    uint64_t v19 = [v18 eventsWithSameRecurrenceSetAsEvent:self];

    uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v39 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v25 = [v24 eventOccurrenceID];
          BOOL v26 = [(EKEvent *)self eventOccurrenceID];
          char v27 = [v25 isEqualToString:v26];

          if ((v27 & 1) == 0)
          {
            if ((v17 & 1) != 0
              || ([v24 startDate],
                  BOOL v28 = objc_claimAutoreleasedReturnValue(),
                  [(EKEvent *)self startDate],
                  id v29 = objc_claimAutoreleasedReturnValue(),
                  int v30 = [v28 isAfterDate:v29],
                  v29,
                  v28,
                  v30))
            {
              [v24 setStatus:3];
              if (([v24 modifiedProperties] & 0x200) != 0) {
                objc_msgSend(v24, "setModifiedProperties:", objc_msgSend(v24, "modifiedProperties") & 0xFFFFFDFFLL);
              }
              [(EKObject *)self addCoCommitObject:v24];
            }
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v21);
    }
  }
  if (([(EKCalendarItem *)self modifiedProperties] & 0x200) != 0) {
    [(EKCalendarItem *)self setModifiedProperties:[(EKCalendarItem *)self modifiedProperties] & 0xFFFFFDFFLL];
  }
  return 1;
}

- (void)_cancelDetachedEvents
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(EKCalendarItem *)self detachedItems];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setStatus:3];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

+ (BOOL)_validateSpanForRemove:(int64_t)a3 error:(id *)a4
{
  BOOL result = 1;
  if ((unint64_t)a3 >= 2 && a3 != 2 && a3 != 4)
  {
    if (a4)
    {
      id v6 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:13];
      BOOL result = 0;
      *a4 = v6;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)removeWithSpan:(int64_t)a3 error:(id *)a4
{
  int64_t v5 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v7 = [(id)objc_opt_class() _validateSpanForRemove:a3 error:a4];
  if (!v7) {
    return v7;
  }
  if ([(EKEvent *)self isDetached]
    && ![(id)objc_opt_class() _allowSlicingFromDetachedOccurrence])
  {
    int64_t v5 = 0;
  }
  if (![(EKEvent *)self isOrWasPartOfRecurringSeries])
  {
    long long v8 = [(EKEvent *)self recurrenceSet];

    if (!v8)
    {
LABEL_12:
      int64_t v5 = 4;
      goto LABEL_14;
    }
  }
  if (!v5) {
    goto LABEL_10;
  }
  if (v5 == 2)
  {
    if ([(EKEvent *)self isDetached])
    {
LABEL_10:
      if ([(EKEvent *)self _eventIsTheOnlyRemainingOccurrence])
      {
        long long v9 = [(EKEvent *)self recurrenceSet];
        BOOL v10 = v9 == 0;

        int64_t v5 = 4 * v10;
      }
      else
      {
        int64_t v5 = 0;
      }
      goto LABEL_14;
    }
    goto LABEL_12;
  }
LABEL_14:
  if ([(EKEvent *)self isFirstOccurrenceIncludingSlices] && v5 == 1) {
    int64_t v5 = 4;
  }
  if ([(EKEvent *)self _shouldCancelInsteadOfDeleteWithSpan:v5])
  {
    int v7 = [(EKEvent *)self _cancelWithSpan:v5 error:a4];
    if (!v7) {
      return v7;
    }
  }
  else if ([(EKEvent *)self _shouldDeclineInsteadOfDelete])
  {
    char v11 = [(EKEvent *)self recurrenceSet];

    if (v11)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v12 = [(EKObject *)self eventStore];
      uint64_t v13 = [v12 eventsWithSameRecurrenceSetAsEvent:self];

      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(v13);
            }
            int v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            [v18 setParticipationStatus:3];
            [v18 setInvitationStatus:0];
            uint64_t v19 = [v18 eventOccurrenceID];
            uint64_t v20 = [(EKEvent *)self eventOccurrenceID];
            char v21 = [v19 isEqualToString:v20];

            if ((v21 & 1) == 0) {
              [(EKObject *)self addCoCommitObject:v18];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v15);
      }
    }
    else
    {
      [(EKEvent *)self setParticipationStatus:3];
      [(EKEvent *)self setInvitationStatus:0];
    }
  }
  else
  {
    [(EKEvent *)self _deleteWithSpan:v5];
  }
  [(EKObject *)self updatePersistentObject];
  if (!v5) {
    [(EKObject *)self clearCachedValueForKey:@"isFirstOccurrenceIncludingSlices"];
  }
  LOBYTE(v7) = 1;
  return v7;
}

- (BOOL)isFirstOccurrenceIncludingSlices
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__EKEvent_isFirstOccurrenceIncludingSlices__block_invoke;
  v5[3] = &unk_1E5B96908;
  v5[4] = self;
  id v2 = [(EKObject *)self cachedValueForKey:@"isFirstOccurrenceIncludingSlices" populateBlock:v5];
  char v3 = [v2 BOOLValue];

  return v3;
}

id __43__EKEvent_isFirstOccurrenceIncludingSlices__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) originalItem];
  char v3 = [*(id *)(a1 + 32) eventStore];
  uint64_t v4 = v3;
  int64_t v5 = v2;
  if (!v2) {
    int64_t v5 = *(void **)(a1 + 32);
  }
  id v6 = [v3 eventsWithSameRecurrenceSetAsEvent:v5];

  int v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_398];
  if (![v7 count]) {
    goto LABEL_8;
  }
  long long v8 = [v7 objectAtIndexedSubscript:0];
  long long v9 = [v8 startDate];
  uint64_t v10 = [*(id *)(a1 + 32) originalStartDate];
  if (!v10)
  {
    uint64_t v10 = [*(id *)(a1 + 32) startDate];
  }
  char v11 = (void *)v10;
  char v12 = [v9 isBeforeDate:v10];

  if (v12)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC28];
  }
  else
  {
LABEL_8:
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "_noRemainingEarlierOccurrences"));
  }

  return v13;
}

uint64_t __43__EKEvent_isFirstOccurrenceIncludingSlices__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int64_t v5 = [a2 startDate];
  id v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)masterEvent
{
  char v3 = [(EKCalendarItem *)self originalItem];
  if (v3
    || ([(EKCalendarItem *)self _hadRecurrenceRules] || [(EKEvent *)self isPhantom])
    && (char v3 = self) != 0)
  {
    id v4 = [EKEvent alloc];
    int64_t v5 = [(EKObject *)v3 persistentObject];
    id v6 = [(EKEvent *)v4 initWithPersistentObject:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)_eventIsTheOnlyRemainingOccurrence
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if ([(EKEvent *)self isDetached])
  {
    char v3 = [(EKCalendarItem *)self originalItem];
  }
  else
  {
    if (![(EKCalendarItem *)self hasRecurrenceRules]) {
      return 1;
    }
    char v3 = self;
  }
  id v4 = v3;
  if ([(EKEvent *)v3 isPhantom])
  {
    int64_t v5 = [(EKCalendarItem *)v4 detachedItems];
    BOOL v6 = (unint64_t)[v5 count] < 2;
  }
  else
  {
    uint64_t v7 = [(EKObject *)self eventStore];
    long long v8 = [v7 eventsWithSameRecurrenceSetAsEvent:v4];
    unint64_t v9 = [v8 count];

    if (v9 <= 1)
    {
      uint64_t v10 = [(EKEvent *)self originalOccurrenceStartDate];
      char v11 = [v10 date];
      if ([(EKEvent *)self isFloating])
      {
        char v12 = [(EKObject *)self eventStore];
        uint64_t v13 = [v12 timeZone];
        uint64_t v14 = [v11 dateInTimeZone:0 fromTimeZone:v13];

        char v11 = (void *)v14;
      }
      uint64_t v15 = [(EKCalendarItem *)v4 exceptionDates];
      if (v15)
      {
        uint64_t v16 = (void *)v15;
        char v17 = [(EKCalendarItem *)v4 exceptionDates];
        int v18 = [v17 setByAddingObject:v11];
      }
      else
      {
        int v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
      }
      uint64_t v19 = [v18 count];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id obj = [(EKCalendarItem *)v4 recurrenceRules];
      uint64_t v20 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        SEL v35 = v11;
        uint64_t v36 = v10;
        uint64_t v39 = v19 + 2;
        long long v40 = v18;
        uint64_t v38 = *(void *)v42;
        uint64_t v22 = *MEMORY[0x1E4F56C38];
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v42 != v38) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            long long v25 = objc_alloc_init(EKRecurrenceGenerator);
            long long v26 = [(EKEvent *)self committedValueForKey:v22];
            char v27 = [v26 BOOLValue];

            if (v27)
            {
              uint64_t v28 = [(EKObject *)self eventStore];
              id v29 = [v28 timeZone];
            }
            else
            {
              id v29 = [(EKCalendarItem *)v4 timeZone];
            }
            int v30 = [MEMORY[0x1E4F1C9C8] distantPast];
            unint64_t v31 = [MEMORY[0x1E4F1C9C8] distantFuture];
            id v32 = [(EKRecurrenceGenerator *)v25 copyOccurrenceDatesWithEKEvent:v4 recurrenceRule:v24 startDate:v30 endDate:v31 timeZone:v29 exceptionDates:v40 limit:v39];

            uint64_t v33 = [v32 count];
            if (v33)
            {
              BOOL v6 = 0;
              goto LABEL_28;
            }
          }
          uint64_t v21 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
          if (v21) {
            continue;
          }
          break;
        }
        BOOL v6 = 1;
LABEL_28:
        char v11 = v35;
        uint64_t v10 = v36;
        int v18 = v40;
      }
      else
      {
        BOOL v6 = 1;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (BOOL)_noRemainingEarlierOccurrences
{
  if (![(EKEvent *)self isOrWasPartOfRecurringSeries]) {
    return 1;
  }
  char v3 = [(EKEvent *)self committedValueForKey:*MEMORY[0x1E4F56C38]];
  int v4 = [v3 BOOLValue];

  int v5 = [(EKEvent *)self isFloating] & (v4 ^ 1);
  if (v5)
  {
    BOOL v6 = [(EKObject *)self eventStore];
    uint64_t v7 = [v6 timeZone];
  }
  else
  {
    uint64_t v7 = [(EKCalendarItem *)self timeZone];
  }
  unint64_t v9 = [(EKEvent *)self originalOccurrenceStartDate];
  uint64_t v10 = [v9 date];

  if (v5)
  {
    uint64_t v11 = [v10 dateInTimeZone:0 fromTimeZone:v7];

    uint64_t v10 = (void *)v11;
  }
  if ([(EKEvent *)self isDetached])
  {
    char v12 = [(EKCalendarItem *)self originalItem];
  }
  else
  {
    char v12 = self;
  }
  uint64_t v13 = v12;
  uint64_t v14 = [(EKObject *)self eventStore];
  uint64_t v15 = [v14 eventsWithSameRecurrenceSetAsEvent:v13];

  id v32 = v15;
  uint64_t v16 = [v15 sortedArrayUsingComparator:&__block_literal_global_400];
  if (![v16 count]) {
    goto LABEL_14;
  }
  char v17 = [v16 objectAtIndexedSubscript:0];
  int v18 = [v17 startDate];
  uint64_t v19 = [(EKEvent *)v13 startDate];
  char v20 = [v18 isBeforeDate:v19];

  if (v20)
  {
    BOOL v8 = 0;
  }
  else
  {
LABEL_14:
    unint64_t v31 = v7;
    uint64_t v21 = [(EKCalendarItem *)v13 recurrenceRules];
    uint64_t v22 = [v21 firstObject];

    long long v23 = [(EKCalendarItem *)v13 exceptionDates];
    uint64_t v24 = [v23 count] + 1;
    long long v25 = objc_alloc_init(EKRecurrenceGenerator);
    if (v4)
    {
      long long v26 = [(EKObject *)self eventStore];
      char v27 = [v26 timeZone];
    }
    else
    {
      char v27 = [(EKCalendarItem *)v13 timeZone];
    }
    uint64_t v28 = [MEMORY[0x1E4F1C9C8] distantPast];
    id v29 = [(EKRecurrenceGenerator *)v25 copyOccurrenceDatesWithEKEvent:v13 recurrenceRule:v22 startDate:v28 endDate:v10 timeZone:v27 exceptionDates:v23 limit:v24];

    BOOL v8 = [v29 count] == 0;
    uint64_t v7 = v31;
  }

  return v8;
}

uint64_t __41__EKEvent__noRemainingEarlierOccurrences__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 startDate];
  BOOL v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)rebaseToEventStore:(id)a3
{
  id v4 = a3;
  int v5 = [(EKEvent *)self constraints];
  int v6 = [v5 requiresSeparateFilesForAllAttachments];

  id v8 = [(EKCalendarItem *)self selfAttendee];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F56F50], *MEMORY[0x1E4F56D28], *MEMORY[0x1E4F56C88], 0);
  [(EKEvent *)self rebaseSkippingRelationProperties:v7 toEventStore:v4];

  if (v6) {
    [(EKEvent *)self _recursivelyAssignAllAttachmentsNewIdentities];
  }
  if (v8) {
    [(EKEvent *)self _updateSelfAttendeeToMatchSelfAttendee:v8];
  }
}

- (void)rebaseSkippingRelationProperties:(id)a3 toEventStore:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EKCalendarItem *)self allAlarms];
  uint64_t v9 = *MEMORY[0x1E4F56B98];
  uint64_t v10 = [v6 setByAddingObject:*MEMORY[0x1E4F56B98]];
  v60.receiver = self;
  v60.super_class = (Class)EKEvent;
  [(EKObject *)&v60 rebaseSkippingRelationProperties:v10 toEventStore:v7];

  if (([v6 containsObject:v9] & 1) == 0)
  {
    id v43 = v6;
    id v11 = objc_alloc(MEMORY[0x1E4F1CA60]);
    long long v44 = self;
    char v12 = [(EKCalendarItem *)self allAlarms];
    uint64_t v13 = objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v12, "count"));

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v42 = v8;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v56 objects:v63 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v57 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          if (objc_msgSend(v19, "isSnoozed", v42))
          {
            char v20 = [v19 originalAlarm];
            uint64_t v21 = [v20 UUID];
            uint64_t v22 = [v13 objectForKeyedSubscript:v21];

            if (!v22)
            {
              uint64_t v22 = objc_opt_new();
              long long v23 = [v20 UUID];
              [v13 setObject:v22 forKeyedSubscript:v23];
            }
            [v22 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v56 objects:v63 count:16];
      }
      while (v16);
    }

    uint64_t v24 = (void *)MEMORY[0x1E4F1CA80];
    long long v25 = [(EKCalendarItem *)v44 allAlarms];
    long long v26 = objc_msgSend(v24, "setWithCapacity:", objc_msgSend(v25, "count"));

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = v14;
    uint64_t v27 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v53;
      uint64_t v45 = *(void *)v53;
      do
      {
        uint64_t v30 = 0;
        uint64_t v46 = v28;
        do
        {
          if (*(void *)v53 != v29) {
            objc_enumerationMutation(obj);
          }
          unint64_t v31 = *(void **)(*((void *)&v52 + 1) + 8 * v30);
          if ((objc_msgSend(v31, "isSnoozed", v42) & 1) == 0)
          {
            id v32 = [v31 duplicateToEventStore:v7];
            [v26 addObject:v32];
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            uint64_t v33 = [v31 UUID];
            BOOL v34 = v13;
            SEL v35 = [v13 objectForKeyedSubscript:v33];

            uint64_t v36 = [v35 countByEnumeratingWithState:&v48 objects:v61 count:16];
            if (v36)
            {
              uint64_t v37 = v36;
              uint64_t v38 = *(void *)v49;
              do
              {
                for (uint64_t j = 0; j != v37; ++j)
                {
                  if (*(void *)v49 != v38) {
                    objc_enumerationMutation(v35);
                  }
                  long long v40 = [*(id *)(*((void *)&v48 + 1) + 8 * j) duplicateToEventStore:v7];
                  [v40 setOriginalAlarm:v32];
                  [v26 addObject:v40];
                }
                uint64_t v37 = [v35 countByEnumeratingWithState:&v48 objects:v61 count:16];
              }
              while (v37);
            }

            uint64_t v13 = v34;
            uint64_t v29 = v45;
            uint64_t v28 = v46;
          }
          ++v30;
        }
        while (v30 != v28);
        uint64_t v28 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
      }
      while (v28);
    }

    long long v41 = [v26 allObjects];
    [(EKCalendarItem *)v44 setAllAlarms:v41];

    id v8 = v42;
    id v6 = v43;
  }
}

- (void)rebaseSkippingRelationProperties:(id)a3
{
  id v4 = a3;
  int v5 = [(EKEvent *)self constraints];
  if ([v5 requiresSeparateFilesForAllAttachments])
  {
    char v6 = [v4 containsObject:*MEMORY[0x1E4F56BA0]];

    v7.receiver = self;
    v7.super_class = (Class)EKEvent;
    [(EKObject *)&v7 rebaseSkippingRelationProperties:v4];

    if ((v6 & 1) == 0) {
      [(EKEvent *)self _recursivelyAssignAllAttachmentsNewIdentities];
    }
  }
  else
  {

    v7.receiver = self;
    v7.super_class = (Class)EKEvent;
    [(EKObject *)&v7 rebaseSkippingRelationProperties:v4];
  }
}

- (void)_recursivelyAssignAllAttachmentsNewIdentities
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(EKEvent *)self _assignAllAttachmentsNewIdentities];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  char v3 = [(EKCalendarItem *)self detachedItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) _assignAllAttachmentsNewIdentities];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_assignAllAttachmentsNewIdentities
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(EKCalendarItem *)self attachments];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) assignNewIdentity];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)_shouldPreserveFutureWhenSlicingWithStartDate:(id)a3 newStartDate:(id)a4
{
  uint64_t v4 = [(EKEvent *)self constraints];
  char v5 = [v4 supportsRecurrenceSplit];

  return v5;
}

- (void)_detachOrSliceWithSpan:(int64_t)a3 withOriginalStartDate:(id)a4 newStartDate:(id)a5
{
  long long v8 = self;
  id v9 = a5;
  id v10 = a4;
  uint64_t v17 = v8;
  if ([(EKEvent *)v8 isDetached])
  {
    if (!a3)
    {
      long long v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot detach an already detached occurrence" userInfo:0];
      [v11 raise];
    }
    uint64_t v12 = [EKEvent alloc];
    uint64_t v13 = [(EKCalendarItem *)v8 originalItem];
    id v14 = [v13 persistentObject];
    uint64_t v15 = [(EKEvent *)v8 originalStartDate];
    uint64_t v17 = [(EKEvent *)v12 initWithPersistentObject:v14 occurrenceDate:v15];

    if ([(EKObject *)v8 _hasChangesForKey:*MEMORY[0x1E4F56C80]])
    {
      uint64_t v16 = [(EKCalendarItem *)v8 recurrenceRules];
      [(EKEvent *)v17 setRecurrenceRules:v16];
    }
  }
  [(id)objc_opt_class() _detachOrSliceEvent:v17 withSpan:a3 savingEvent:v8 withOriginalStartDate:v10 newStartDate:v9];

  v8->_isMainOccurrence = ![(EKEvent *)v8 isDetached];
}

+ (void)_detachOrSliceEvent:(id)a3 withSpan:(int64_t)a4 savingEvent:(id)a5 withOriginalStartDate:(id)a6 newStartDate:(id)a7
{
  uint64_t v197 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (a4 == 1) {
    int v15 = [v12 _shouldPreserveFutureWhenSlicingWithStartDate:v13 newStartDate:v14];
  }
  else {
    int v15 = 0;
  }
  int v141 = [v12 isFirstOccurrence];
  char v153 = [v13 isEqual:v14];
  uint64_t v16 = [v12 originalStartDate];
  uint64_t v17 = (void *)v16;
  if (v16) {
    int v18 = (void *)v16;
  }
  else {
    int v18 = v13;
  }
  id v156 = v18;

  uint64_t v19 = [v12 masterEvent];
  char v20 = [v11 selfAttendee];
  id v146 = [v11 attendees];
  uint64_t v144 = [v11 alarms];
  v143 = [v11 recurrenceRules];
  uint64_t v21 = *MEMORY[0x1E4F56F50];
  uint64_t v22 = *MEMORY[0x1E4F56D28];
  uint64_t v23 = *MEMORY[0x1E4F56C88];
  int v155 = v15;
  if (v15)
  {
    uint64_t v152 = *MEMORY[0x1E4F56BD8];
    uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v21, v22, *MEMORY[0x1E4F56BD8], v23, 0);
    [v19 rebaseSkippingRelationProperties:v24];

    long long v25 = [v11 _generateNewUniqueID];
    [v19 setUniqueID:v25];

    [v12 addCoCommitObject:v19];
  }
  else
  {
    uint64_t v152 = *MEMORY[0x1E4F56BD8];
    long long v26 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", v21, v22, *MEMORY[0x1E4F56BA8], v23, *MEMORY[0x1E4F56BE0], *MEMORY[0x1E4F56BD8], *MEMORY[0x1E4F56B98], 0);
    uint64_t v27 = v26;
    if (!a4) {
      [v26 addObject:*MEMORY[0x1E4F56C80]];
    }
    uint64_t v28 = [v11 persistentObject];
    [v11 rebaseSkippingRelationProperties:v27];
    uint64_t v29 = [v11 persistentObject];
    [v29 addCoCommitObject:v28];

    uint64_t v30 = [v27 allObjects];
    [v11 emptyMeltedCacheForKeys:v30];

    unint64_t v31 = [v11 _generateNewUniqueID];
    [v11 setUniqueID:v31];

    if (v12 != v11)
    {
      [v12 addCoCommitObject:v11];
      if ([v12 _hasChangesForKey:*MEMORY[0x1E4F56BB0]])
      {
        id v32 = [v12 calendar];
        [v11 setCalendar:v32];
      }
    }

    int v15 = 0;
  }
  if (a4 == 1)
  {
    uint64_t v33 = [v11 recurrenceSet];

    if (!v33)
    {
      BOOL v34 = [v19 recurrenceSet];

      if (v34)
      {
        SEL v35 = [v19 recurrenceSet];
        [v11 setRecurrenceSet:v35];
      }
      else
      {
        SEL v35 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v36 = [v35 UUIDString];
        [v11 setRecurrenceSet:v36];
      }
    }
    uint64_t v37 = [v11 recurrenceSet];
    [v19 setRecurrenceSet:v37];
  }
  [v12 setStartDateRaw:v14];
  [v12 duration];
  uint64_t v38 = objc_msgSend(v14, "dateByAddingTimeInterval:");
  [v12 setEndDateRaw:v38];

  if (v11 != v12)
  {
    [v11 setStartDateRaw:v156];
    [v19 duration];
    uint64_t v39 = objc_msgSend(v156, "dateByAddingTimeInterval:");
    [v11 setEndDateRaw:v39];
  }
  id v145 = v12;
  uint64_t v150 = v19;
  int64_t v142 = a4;
  if (v15)
  {
    [v19 _updateSelfAttendeeToMatchSelfAttendee:v20];
  }
  else
  {
    [v11 setAttendees:MEMORY[0x1E4F1CBF0]];
    long long v40 = [v11 constraints];
    int v41 = [v40 attendeesUseDeletedByOrganizerStatus];

    if (v41)
    {
      v135 = v20;
      id v137 = v14;
      id v139 = v13;
      long long v42 = (void *)MEMORY[0x1E4F1CAD0];
      id v43 = [v146 valueForKey:*MEMORY[0x1E4F57150]];
      long long v44 = [v42 setWithArray:v43];

      long long v187 = 0u;
      long long v188 = 0u;
      long long v185 = 0u;
      long long v186 = 0u;
      uint64_t v45 = [v19 attendees];
      uint64_t v46 = [v45 countByEnumeratingWithState:&v185 objects:v196 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v186;
        do
        {
          for (uint64_t i = 0; i != v47; ++i)
          {
            if (*(void *)v186 != v48) {
              objc_enumerationMutation(v45);
            }
            long long v50 = *(void **)(*((void *)&v185 + 1) + 8 * i);
            long long v51 = [v50 UUID];
            char v52 = [v44 containsObject:v51];

            if ((v52 & 1) == 0)
            {
              long long v53 = [EKAttendee alloc];
              long long v54 = [v50 persistentObject];
              long long v55 = [(EKObject *)v53 initWithPersistentObject:v54];

              [(EKObject *)v55 rebase];
              [(EKAttendee *)v55 setParticipantStatus:-1];
              [v11 addAttendee:v55];
            }
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v185 objects:v196 count:16];
        }
        while (v47);
      }

      id v14 = v137;
      id v13 = v139;
      char v20 = v135;
    }
    long long v183 = 0u;
    long long v184 = 0u;
    long long v181 = 0u;
    long long v182 = 0u;
    id v56 = v146;
    uint64_t v57 = [v56 countByEnumeratingWithState:&v181 objects:v195 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v182;
      do
      {
        for (uint64_t j = 0; j != v58; ++j)
        {
          if (*(void *)v182 != v59) {
            objc_enumerationMutation(v56);
          }
          long long v61 = *(void **)(*((void *)&v181 + 1) + 8 * j);
          int v62 = [v61 isEqual:v20];
          [v61 rebase];
          [v11 addAttendee:v61];
          if (v62)
          {
            [v11 setSelfAttendee:v20];
            long long v63 = [v61 persistentObject];
            [v20 setPersistentObject:v63];

            [v20 _resetAfterUpdatingChangeSetOrBackingObject];
          }
        }
        uint64_t v58 = [v56 countByEnumeratingWithState:&v181 objects:v195 count:16];
      }
      while (v58);
    }

    [v11 setAllAlarms:MEMORY[0x1E4F1CBF0]];
    long long v179 = 0u;
    long long v180 = 0u;
    long long v177 = 0u;
    long long v178 = 0u;
    id v64 = v144;
    uint64_t v65 = [v64 countByEnumeratingWithState:&v177 objects:v194 count:16];
    uint64_t v19 = v150;
    if (v65)
    {
      uint64_t v66 = v65;
      uint64_t v67 = *(void *)v178;
      do
      {
        for (uint64_t k = 0; k != v66; ++k)
        {
          if (*(void *)v178 != v67) {
            objc_enumerationMutation(v64);
          }
          long long v69 = *(void **)(*((void *)&v177 + 1) + 8 * k);
          [v69 rebaseForDetachment];
          [v11 addAlarm:v69];
        }
        uint64_t v66 = [v64 countByEnumeratingWithState:&v177 objects:v194 count:16];
      }
      while (v66);
    }

    id v12 = v145;
    a4 = v142;
    int v15 = v155;
  }
  if (a4 == 1)
  {
    if (v11 == v12) {
      char v70 = v153;
    }
    else {
      char v70 = 1;
    }
    if (v70)
    {
      if (v15)
      {
        long long v71 = [v11 exceptionDates];
        long long v173 = 0u;
        long long v174 = 0u;
        long long v175 = 0u;
        long long v176 = 0u;
        uint64_t v72 = [v71 countByEnumeratingWithState:&v173 objects:v193 count:16];
        if (v72)
        {
          uint64_t v73 = v72;
          uint64_t v74 = *(void *)v174;
          do
          {
            for (uint64_t m = 0; m != v73; ++m)
            {
              if (*(void *)v174 != v74) {
                objc_enumerationMutation(v71);
              }
              uint64_t v76 = *(void **)(*((void *)&v173 + 1) + 8 * m);
              if ([v76 CalIsBeforeDate:v156]) {
                [v11 _removeExceptionDate:v76];
              }
            }
            uint64_t v73 = [v71 countByEnumeratingWithState:&v173 objects:v193 count:16];
          }
          while (v73);
        }
      }
      else
      {
        long long v171 = 0u;
        long long v172 = 0u;
        long long v169 = 0u;
        long long v170 = 0u;
        long long v71 = [v19 exceptionDates];
        uint64_t v77 = [v71 countByEnumeratingWithState:&v169 objects:v192 count:16];
        if (v77)
        {
          uint64_t v78 = v77;
          uint64_t v79 = *(void *)v170;
          do
          {
            for (uint64_t n = 0; n != v78; ++n)
            {
              if (*(void *)v170 != v79) {
                objc_enumerationMutation(v71);
              }
              long long v81 = *(void **)(*((void *)&v169 + 1) + 8 * n);
              if ([v81 CalIsAfterDate:v156]) {
                [v11 _addExceptionDate:v81];
              }
            }
            uint64_t v78 = [v71 countByEnumeratingWithState:&v169 objects:v192 count:16];
          }
          while (v78);
        }
      }
    }
    else
    {
      [v12 setExceptionDates:0];
    }
    id v138 = v14;
    id v140 = v13;
    uint64_t v154 = v11;
    id v148 = [v19 startDate];
    id v149 = [v19 timeZone];
    if (!v149) {
      id v149 = (void *)CalTimeZoneCopyCFTimeZone();
    }
    id v136 = v20;
    long long v167 = 0u;
    long long v168 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    id v82 = v143;
    uint64_t v83 = [v82 countByEnumeratingWithState:&v165 objects:v191 count:16];
    if (v83)
    {
      uint64_t v84 = v83;
      uint64_t v85 = *(void *)v166;
      do
      {
        for (iuint64_t i = 0; ii != v84; ++ii)
        {
          if (*(void *)v166 != v85) {
            objc_enumerationMutation(v82);
          }
          long long v87 = *(void **)(*((void *)&v165 + 1) + 8 * ii);
          long long v88 = [v87 recurrenceEnd];
          uint64_t v89 = [v88 endDate];
          if (v89
            && (long long v90 = (void *)v89,
                [v88 endDate],
                long long v91 = objc_claimAutoreleasedReturnValue(),
                int v92 = [v91 CalIsBeforeDate:v156],
                v91,
                v90,
                v92))
          {
            [v154 removeRecurrenceRule:v87];
          }
          else if ([v88 occurrenceCount])
          {
            uint64_t v93 = [v88 occurrenceCount];
            long long v94 = objc_alloc_init(EKRecurrenceGenerator);
            long long v95 = [v156 dateByAddingTimeInterval:-1.0];
            LOBYTE(v134) = 0;
            id v96 = [(EKRecurrenceGenerator *)v94 copyOccurrenceDatesWithEKEvent:v150 recurrenceRule:v87 startDate:v148 endDate:v95 timeZone:v149 exceptionDates:0 limit:0 adjustDatesForAllDayEvents:v134];

            uint64_t v97 = [v96 count];
            if (v93 == v97)
            {
              [v154 removeRecurrenceRule:v87];
            }
            else
            {
              id v98 = +[EKRecurrenceEnd recurrenceEndWithOccurrenceCount:v93 - v97];
              [v87 setRecurrenceEnd:v98];
            }
          }
        }
        uint64_t v84 = [v82 countByEnumeratingWithState:&v165 objects:v191 count:16];
      }
      while (v84);
    }

    if (v155) {
      long long v99 = v154;
    }
    else {
      long long v99 = v150;
    }
    if (v155) {
      id v100 = v150;
    }
    else {
      id v100 = v154;
    }
    id v101 = v99;
    id v102 = v100;
    long long v161 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    long long v164 = 0u;
    id v151 = v101;
    uint64_t v103 = [v101 detachedItems];
    uint64_t v104 = [v103 countByEnumeratingWithState:&v161 objects:v190 count:16];
    id v12 = v145;
    if (v104)
    {
      uint64_t v105 = v104;
      uint64_t v106 = *(void *)v162;
      uint64_t v147 = *MEMORY[0x1E4F56C68];
      do
      {
        for (juint64_t j = 0; jj != v105; ++jj)
        {
          if (*(void *)v162 != v106) {
            objc_enumerationMutation(v103);
          }
          id v108 = *(id *)(*((void *)&v161 + 1) + 8 * jj);
          id v109 = v108;
          if ([v108 isEqual:v145])
          {
            id v109 = v145;
          }
          id v110 = [v109 originalStartDate];
          if (v155 == [v110 CalIsBeforeDate:v156])
          {
            [v151 _removeDetachedItem:v108];
            v111 = [v109 persistentObject];
            char v112 = [v111 isNew];

            if ((v112 & 1) == 0)
            {
              v113 = [v109 persistentObject];
              [v109 rebase];
              v114 = [v154 eventStore];
              [v114 _deleteObject:v113];

              v115 = [v145 persistentObject];
              [v115 addCoCommitObject:v113];
            }
            uint64_t v116 = [v109 frozenObject];
            [v102 addMultiChangedObjectValue:v116 forKey:v152];

            [v109 setOriginalItem:v102];
            v117 = objc_opt_class();
            uint64_t v118 = [v102 calendar];
            uint64_t v119 = [v117 generateUniqueIDWithEvent:v109 originalEvent:v102 calendar:v118];
            [v109 setUniqueID:v119];

            if (v109 != v145)
            {
              v120 = [MEMORY[0x1E4F1CAD0] setWithObject:v147];
              [v109 updatePersistentObjectSkippingProperties:v120];

              [v109 insertPersistentObjectIfNeeded];
            }
          }
        }
        uint64_t v105 = [v103 countByEnumeratingWithState:&v161 objects:v190 count:16];
      }
      while (v105);
    }

    [v102 emptyMeltedCacheForKey:v152];
    uint64_t v19 = v150;
    [v150 _deleteFromOccurrenceDateOnward:v156 includeSlices:0];

    id v11 = v154;
    id v14 = v138;
    id v13 = v140;
    char v20 = v136;
    a4 = v142;
  }
  if (v141)
  {
    long long v159 = 0u;
    long long v160 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    v121 = [v19 alarms];
    uint64_t v122 = [v121 countByEnumeratingWithState:&v157 objects:v189 count:16];
    if (v122)
    {
      uint64_t v123 = v122;
      uint64_t v124 = *(void *)v158;
      do
      {
        for (kuint64_t k = 0; kk != v123; ++kk)
        {
          if (*(void *)v158 != v124) {
            objc_enumerationMutation(v121);
          }
          uint64_t v126 = *(void **)(*((void *)&v157 + 1) + 8 * kk);
          if ([v126 isAbsolute]) {
            [v19 removeAlarm:v126];
          }
        }
        uint64_t v123 = [v121 countByEnumeratingWithState:&v157 objects:v189 count:16];
      }
      while (v123);
    }

    id v12 = v145;
    a4 = v142;
  }
  if (a4)
  {
    [v19 _updatePersistentObjectOfSelfAndDetachedItemsExceptForSavingItem:v12];
    [v19 updatePersistentValueForKeyIfNeeded:v152];
  }
  else
  {
    uint64_t v127 = [v11 frozenObject];
    [v19 addMultiChangedObjectValue:v127 forKey:v152];

    [v19 emptyMeltedCacheForKey:v152];
    [v11 setOriginalItem:v19];
    [v11 setOriginalStartDate:v13];
    v128 = objc_opt_class();
    uint64_t v129 = [v19 calendar];
    id v130 = [v128 generateUniqueIDWithEvent:v11 originalEvent:v19 calendar:v129];
    [v11 setUniqueID:v130];

    v131 = [MEMORY[0x1E4F1CAD0] setWithObject:v152];
    [v19 updatePersistentObjectSkippingProperties:v131];
  }
  v132 = [v11 eventStore];
  [v132 _addObjectToPendingCommits:v19];

  [v12 emptyMeltedCacheForKey:*MEMORY[0x1E4F56C68]];
  if (v11 != v12)
  {
    [v11 _updatePersistentObjectOfSelfAndDetachedItemsExceptForSavingItem:v12];
    [v11 updatePersistentValueForKeyIfNeeded:v152];
    uint64_t v133 = [v11 eventStore];
    [v133 _addObjectToPendingCommits:v11];
  }
}

- (id)privacyLevelString
{
  unint64_t v2 = [(EKEvent *)self privacyLevel];
  if (v2 > 3) {
    return 0;
  }
  else {
    return off_1E5B98CC8[v2];
  }
}

- (EKSuggestedEventInfo)suggestionInfo
{
  return (EKSuggestedEventInfo *)[(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F57030]];
}

- (void)setSuggestionInfo:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F57030];
  id v5 = a3;
  [(EKObject *)self updateMeltedAndCachedSingleRelationObject:v5 forKey:v4 frozenClass:objc_opt_class()];
}

- (BOOL)updateEventToEvent:(id)a3
{
  return [(EKEvent *)self updateEventToEvent:a3 commit:1];
}

- (BOOL)updateEventToEvent:(id)a3 commit:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(EKEvent *)self suggestionInfo];
  long long v8 = (void *)v7;
  if (v6 && v7)
  {
    id v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v10 = [(EKEvent *)self startDate];
    id v11 = [v6 startDate];
    if (([v10 isEqualToDate:v11] & 1) == 0)
    {
      [(EKEvent *)self setStartDate:v11];
      objc_msgSend(v8, "setChangedFields:", objc_msgSend(v8, "changedFields") | 2);
      if (([v9 isDate:v10 inSameDayAsDate:v11] & 1) == 0) {
        objc_msgSend(v8, "setChangedFields:", objc_msgSend(v8, "changedFields") | 1);
      }
    }
    id v12 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
    uint64_t v13 = [v6 endDateUnadjustedForLegacyClients];
    if (([v12 isEqualToDate:v13] & 1) == 0)
    {
      [(EKEvent *)self setEndDateUnadjustedForLegacyClients:v13];
      objc_msgSend(v8, "setChangedFields:", objc_msgSend(v8, "changedFields") | 2);
      if (([v9 isDate:v12 inSameDayAsDate:v13] & 1) == 0) {
        objc_msgSend(v8, "setChangedFields:", objc_msgSend(v8, "changedFields") | 1);
      }
    }
    id v14 = [(EKEvent *)self title];
    [v6 title];
    v46 = int v41 = v14;
    if ((objc_msgSend(v14, "isEqualToString:") & 1) == 0)
    {
      [(EKEvent *)self setTitle:v46];
      objc_msgSend(v8, "setChangedFields:", objc_msgSend(v8, "changedFields") | 4);
    }
    uint64_t v45 = v9;
    uint64_t v15 = [(EKCalendarItem *)self location];
    uint64_t v16 = [v6 location];
    long long v42 = (void *)v13;
    id v43 = v12;
    long long v40 = (void *)v15;
    if (v15 | v16) {
      int v17 = [(id)v15 isEqualToString:v16] ^ 1;
    }
    else {
      int v17 = 0;
    }
    uint64_t v23 = [v6 structuredLocation];
    uint64_t v24 = [(EKEvent *)self structuredLocation];
    long long v25 = (void *)v24;
    int v26 = v24 | v23;
    if (v24 | v23) {
      int v26 = [(id)v24 isEqualToLocation:v23] ^ 1;
    }
    long long v44 = v10;
    if ((v17 | v26) == 1)
    {
      [(EKCalendarItem *)self setLocation:v16];
      uint64_t v27 = [(id)v23 duplicate];
      [(EKEvent *)self setStructuredLocation:v27];

      objc_msgSend(v8, "setChangedFields:", objc_msgSend(v8, "changedFields") | 8);
    }
    uint64_t v28 = objc_msgSend(v6, "notes", v16);
    [(EKEvent *)self setNotes:v28];

    uint64_t v29 = [v6 localStructuredData];
    [(EKCalendarItem *)self setLocalStructuredData:v29];

    uint64_t v30 = [v6 structuredData];
    [(EKCalendarItem *)self setStructuredData:v30];

    unint64_t v31 = [v6 suggestionInfo];
    id v32 = v31;
    if (v31)
    {
      uint64_t v33 = [v31 duplicate];
      [(EKEvent *)self setSuggestionInfo:v33];

      uint64_t v34 = [v8 changedFields];
      SEL v35 = [(EKEvent *)self suggestionInfo];
      [v35 setChangedFields:v34];
    }
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      -[EKEvent updateEventToEvent:commit:]();
    }
    uint64_t v36 = [(EKObject *)self eventStore];
    id v49 = 0;
    char v21 = [v36 saveEvent:self span:0 commit:v4 error:&v49];
    id v37 = v49;

    if (v21)
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
        -[EKEvent updateEventToEvent:commit:]();
      }
    }
    else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      -[EKEvent updateEventToEvent:commit:]();
    }
  }
  else if (v6 || !v7)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKEvent updateEventToEvent:commit:].cold.4();
    }
    char v21 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      -[EKEvent updateEventToEvent:commit:].cold.9();
    }
    id v48 = 0;
    BOOL v18 = [(EKEvent *)self _cancelWithSpan:0 error:&v48];
    id v19 = v48;
    if (v18)
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
        -[EKEvent updateEventToEvent:commit:].cold.7();
      }
      char v20 = [(EKObject *)self eventStore];
      id v47 = 0;
      char v21 = [v20 saveEvent:self span:0 commit:v4 error:&v47];
      id v22 = v47;

      if (v21)
      {
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
          -[EKEvent updateEventToEvent:commit:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      {
        -[EKEvent updateEventToEvent:commit:]();
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        -[EKEvent updateEventToEvent:commit:].cold.8();
      }
      char v21 = 0;
    }
  }
  return v21;
}

- (BOOL)_fetchedEventIsConflict:(id)a3 forStartDate:(id)a4 endDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(EKEvent *)self uniqueId];
  id v12 = [v11 componentsSeparatedByString:@"/RID="];
  uint64_t v13 = [v12 firstObject];

  id v14 = [v8 uniqueId];
  uint64_t v15 = [v14 componentsSeparatedByString:@"/RID="];
  uint64_t v16 = [v15 firstObject];

  if (([v13 isEqual:v16] & 1) == 0
    && [v8 status] != 3
    && [v8 participationStatus] != 3
    && ([v8 status] || (objc_msgSend(v8, "isAllDay") & 1) == 0)
    && (![v8 status] || objc_msgSend(v8, "availability") != 1))
  {
    int v17 = [v8 endDateUnadjustedForLegacyClients];
    if ([v17 isEqualToDate:v9])
    {
    }
    else
    {
      BOOL v18 = [v8 startDate];
      int v19 = [v18 isEqualToDate:v10];

      if (!v19)
      {
        BOOL v20 = 1;
        goto LABEL_12;
      }
    }
  }
  BOOL v20 = 0;
LABEL_12:

  return v20;
}

- (id)potentialConflictOccurrenceDatesInTimePeriod:(double *)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if ([(EKEvent *)self isAllDay]
    || ([(EKEvent *)self endDateUnadjustedForLegacyClients],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v6 = [(EKEvent *)self startDate];
    v21[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];

    id v8 = [(EKCalendarItem *)self recurrenceRules];
    id v9 = [v8 firstObject];

    uint64_t v10 = 0;
    if (v9 && [v9 frequency] != 3)
    {
      unint64_t v11 = [v9 frequency];
      if (v11 > 2)
      {
        unint64_t v12 = 1;
        uint64_t v10 = 0x417E133800000000;
      }
      else
      {
        uint64_t v10 = qword_1A4F90040[v11];
        unint64_t v12 = qword_1A4F90058[v11];
      }
      uint64_t v13 = objc_alloc_init(EKRecurrenceGenerator);
      id v14 = [(EKEvent *)self startCalendarDate];
      uint64_t v15 = [v14 date];
      uint64_t v16 = [MEMORY[0x1E4F1C9C8] distantFuture];
      int v17 = [(EKCalendarItem *)self timeZone];
      id v18 = [(EKRecurrenceGenerator *)v13 copyOccurrenceDatesWithEKEvent:self recurrenceRule:v9 startDate:v15 endDate:v16 timeZone:v17 limit:v12];

      if ([v18 count] > v12)
      {
        uint64_t v19 = objc_msgSend(v18, "subarrayWithRange:", 0, v12);

        id v18 = (id)v19;
      }

      uint64_t v7 = v18;
    }
    if (a3) {
      *(void *)a3 = v10;
    }
  }

  return v7;
}

- (id)scanForConflicts
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  if ([(EKEvent *)self isAllDay]
    || ([(EKEvent *)self endDateUnadjustedForLegacyClients],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    id v43 = +[EKConflictDetails infoWithConflicts:0 needsAction:0 event:0];
  }
  else
  {
    BOOL v4 = [(EKCalendarItem *)self calendar];
    id v5 = [v4 source];

    id v6 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v7 = [v5 calendarsForEntityType:0];
    id v8 = [v7 allObjects];
    id v9 = [v6 arrayWithArray:v8];

    uint64_t v74 = v5;
    int v10 = [v5 supportsAvailabilityRequests];
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    unint64_t v11 = (void *)[v9 copy];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v106 objects:v113 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v107;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v107 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v106 + 1) + 8 * i);
          if (v10 && ![*(id *)(*((void *)&v106 + 1) + 8 * i) isAffectingAvailability]
            || ![v16 allowsScheduling]
            || ([v16 isFacebookBirthdayCalendar] & 1) != 0
            || ([v16 isSubscribedHolidayCalendar] & 1) != 0
            || ([v16 isSuggestedEventCalendar] & 1) != 0
            || [v16 isNaturalLanguageSuggestedEventCalendar])
          {
            [v9 removeObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v106 objects:v113 count:16];
      }
      while (v13);
    }

    double v105 = 0.0;
    int v17 = [(EKEvent *)self potentialConflictOccurrenceDatesInTimePeriod:&v105];
    uint64_t v103 = 0;
    uint64_t v104 = 0;
    CalEventOccurrenceCacheGetIdealRangeAndTimeZone();
    id v18 = 0;
    id v19 = 0;
    BOOL v20 = [v19 dateByAddingTimeInterval:-176400.0];

    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __27__EKEvent_scanForConflicts__block_invoke;
    v100[3] = &unk_1E5B98C28;
    id v21 = v18;
    id v101 = v21;
    id v73 = v20;
    id v102 = v73;
    id v22 = (unsigned int (**)(void, void))MEMORY[0x1A6266730](v100);
    long long v81 = v9;
    uint64_t v77 = v22;
    if ((unint64_t)[v17 count] > 1)
    {
      id v70 = v21;
      uint64_t v76 = objc_opt_new();
      long long v44 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
      uint64_t v45 = [(EKEvent *)self startDate];
      [v44 timeIntervalSinceDate:v45];
      double v47 = v46;

      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      uint64_t v72 = v17;
      id v48 = v17;
      uint64_t v87 = [v48 countByEnumeratingWithState:&v92 objects:v111 count:16];
      if (v87)
      {
        obja = 0;
        uint64_t v49 = 0;
        uint64_t v50 = *(void *)v93;
        uint64_t v78 = *(void *)v93;
        id v80 = v48;
        do
        {
          for (uint64_t j = 0; j != v87; ++j)
          {
            if (*(void *)v93 != v50) {
              objc_enumerationMutation(v48);
            }
            uint64_t v52 = *(void *)(*((void *)&v92 + 1) + 8 * j);
            long long v53 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeInterval:sinceDate:", v52, v47, v70);
            if (v22[2](v22, v52) && ((unsigned int (**)(void, void *))v22)[2](v22, v53))
            {
              long long v54 = [(EKObject *)self eventStore];
              long long v55 = [v54 predicateForEventsWithStartDate:v52 endDate:v53 calendars:v9 loadDefaultProperties:0];

              id v56 = [(EKObject *)self eventStore];
              uint64_t v57 = [v56 eventsMatchingPredicate:v55];

              long long v90 = 0u;
              long long v91 = 0u;
              long long v88 = 0u;
              long long v89 = 0u;
              id v58 = v57;
              uint64_t v59 = [v58 countByEnumeratingWithState:&v88 objects:v110 count:16];
              if (v59)
              {
                uint64_t v60 = v59;
                uint64_t v85 = v49;
                uint64_t v61 = *(void *)v89;
                while (2)
                {
                  for (uint64_t k = 0; k != v60; ++k)
                  {
                    if (*(void *)v89 != v61) {
                      objc_enumerationMutation(v58);
                    }
                    if ([(EKEvent *)self _fetchedEventIsConflict:*(void *)(*((void *)&v88 + 1) + 8 * k) forStartDate:v52 endDate:v53])
                    {
                      ++obja;
                      [v76 addObject:v52];
                      goto LABEL_53;
                    }
                  }
                  uint64_t v60 = [v58 countByEnumeratingWithState:&v88 objects:v110 count:16];
                  if (v60) {
                    continue;
                  }
                  break;
                }
LABEL_53:
                id v22 = v77;
                uint64_t v49 = v85;
              }
              ++v49;

              id v48 = v80;
              id v9 = v81;
              uint64_t v50 = v78;
            }
          }
          uint64_t v87 = [v48 countByEnumeratingWithState:&v92 objects:v111 count:16];
        }
        while (v87);
      }
      else
      {
        obja = 0;
        uint64_t v49 = 0;
      }

      uint64_t v64 = v49;
      uint64_t v65 = (void *)MEMORY[0x1E4F576D0];
      uint64_t v66 = [(EKEvent *)self startCalendarDate];
      uint64_t v67 = [v66 date];
      uint64_t v24 = [v65 rangeWithStartDate:v67 duration:v105];

      long long v63 = v76;
      id v43 = +[EKConflictDetails infoWithConflictsInSeries:obja outOf:v64 withPeriod:v24 conflictingDates:v76];
      id v21 = v70;
      int v17 = v72;
    }
    else
    {
      uint64_t v23 = [(EKEvent *)self startDate];
      uint64_t v24 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
      long long v75 = (void *)v23;
      if (v22[2](v22, v23) && (((uint64_t (*)(void, void *))v22[2])(v22, v24) & 1) != 0)
      {
        id v69 = v21;
        long long v71 = v17;
        long long v25 = [(EKObject *)self eventStore];
        int v26 = [(EKEvent *)self startDate];
        uint64_t v27 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
        uint64_t v28 = [v25 predicateForEventsWithStartDate:v26 endDate:v27 calendars:v9 loadDefaultProperties:0];

        uint64_t v29 = [(EKObject *)self eventStore];
        uint64_t v79 = (void *)v28;
        uint64_t v30 = [v29 eventsMatchingPredicate:v28];

        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        id obj = v30;
        uint64_t v31 = [obj countByEnumeratingWithState:&v96 objects:v112 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          uint64_t v84 = *(void *)v97;
          long long v86 = 0;
          do
          {
            for (uint64_t m = 0; m != v32; ++m)
            {
              uint64_t v36 = v24;
              if (*(void *)v97 != v84) {
                objc_enumerationMutation(obj);
              }
              id v37 = *(void **)(*((void *)&v96 + 1) + 8 * m);
              uint64_t v38 = [(EKEvent *)self startDate];
              uint64_t v39 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
              BOOL v40 = [(EKEvent *)self _fetchedEventIsConflict:v37 forStartDate:v38 endDate:v39];

              if (v40)
              {
                unsigned int v41 = [v37 isTentative];
                v33 += v41;
                v34 += v41 ^ 1;
                if (v34 + v33 == 1) {
                  id v42 = v37;
                }
                else {
                  id v42 = 0;
                }
                uint64_t v24 = v36;

                long long v86 = v42;
              }
              else
              {
                uint64_t v24 = v36;
              }
            }
            uint64_t v32 = [obj countByEnumeratingWithState:&v96 objects:v112 count:16];
          }
          while (v32);
        }
        else
        {
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          long long v86 = 0;
        }

        id v43 = +[EKConflictDetails infoWithConflicts:v34 needsAction:v33 event:v86];

        id v9 = v81;
        id v21 = v69;
        int v17 = v71;
        long long v63 = v75;
        id v22 = v77;
      }
      else
      {
        id v43 = +[EKConflictDetails infoWithConflicts:0 needsAction:0 event:0];
        long long v63 = (void *)v23;
      }
    }
  }

  return v43;
}

uint64_t __27__EKEvent_scanForConflicts__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 CalIsAfterOrSameAsDate:*(void *)(a1 + 32)]) {
    uint64_t v4 = [v3 CalIsBeforeOrSameAsDate:*(void *)(a1 + 40)];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)updateWithGeocodedMapItemAndSaveWithCommit:(id)a3 eventStore:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  int v10 = [(EKCalendarItem *)self structuredLocationWithoutPrediction];
  unint64_t v11 = [v10 duplicate];

  [v11 updateFromMapItem:v9];
  if (![(EKEvent *)self isEditable]) {
    goto LABEL_6;
  }
  uint64_t v12 = [(EKEvent *)self constraints];
  if (([v12 supportsStructuredLocations] & 1) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v13 = [(EKEvent *)self constraints];
  int v14 = [v13 supportsAutoGeocodingStructuredLocations];

  if (!v14)
  {
LABEL_6:
    [(EKCalendarItem *)self setClientLocation:v11];
    goto LABEL_7;
  }
  [(EKEvent *)self setStructuredLocation:v11];
LABEL_7:
  char v15 = [v8 saveEvent:self span:3 commit:1 error:a5];

  return v15;
}

- (NSURL)launchURL
{
  id v3 = [(EKObject *)self objectID];
  int v4 = [v3 databaseID];
  int v5 = *MEMORY[0x1E4F574B8];
  id v6 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v7 = NSString;
  id v8 = [(EKEvent *)self startDate];
  [v8 timeIntervalSinceReferenceDate];
  if (v4 == v5) {
    objc_msgSend(v7, "stringWithFormat:", @"calshow:%lf?eventid=%d", v9, objc_msgSend(v3, "rowID"), v13);
  }
  else {
  int v10 = objc_msgSend(v7, "stringWithFormat:", @"calshow:%lf?eventid=%d_%d", v9, objc_msgSend(v3, "databaseID"), objc_msgSend(v3, "rowID"));
  }
  unint64_t v11 = [v6 URLWithString:v10];

  return (NSURL *)v11;
}

+ (id)generateUniqueIDWithEvent:(id)a3 originalEvent:(id)a4 calendar:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 constraints];
  int v9 = [v8 requiresMSFormattedUID];

  if (v9)
  {
    int v10 = [v6 startTimeZone];
    if (v10)
    {
      if (v7)
      {
LABEL_4:
        unint64_t v11 = [v7 uniqueID];
        uint64_t v12 = [v6 originalStartDate];
        [v6 isAllDay];
        uint64_t v13 = _EKMSUUIDStringForDetachedEvent();

LABEL_11:
        goto LABEL_14;
      }
    }
    else
    {
      int v10 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
      if (v7) {
        goto LABEL_4;
      }
    }
    uint64_t v13 = _EKMSUUIDString();
    goto LABEL_11;
  }
  if ([v7 isReminderIntegrationEvent])
  {
    uint64_t v14 = [v7 uniqueID];
  }
  else
  {
    if (v7)
    {
      char v15 = NSString;
      uint64_t v16 = [v7 uniqueID];
      int v17 = [v6 originalStartDate];
      [v17 timeIntervalSinceReferenceDate];
      uint64_t v13 = [v15 stringWithFormat:@"%@/RID=%llu", v16, (unint64_t)v18];

      goto LABEL_14;
    }
    uint64_t v14 = EKUUIDString();
  }
  uint64_t v13 = (void *)v14;
LABEL_14:

  return v13;
}

- (void)dismissAcceptedProposeNewTimeNotification
{
  [(EKEvent *)self _clearAttendeeChangedFlags];
  [(EKEvent *)self setInvitationStatus:0];
  uint64_t v3 = [(EKEvent *)self clearModifiedFlags] | 0x200;

  [(EKEvent *)self setClearModifiedFlags:v3];
}

- (void)_clearAttendeeChangedFlags
{
  [(EKEvent *)self setAttendeeComment:0];
  [(EKEvent *)self setAttendeeStatus:0];
  [(EKEvent *)self setAttendeeProposedStartDate:0];

  [(EKEvent *)self setAttendeeDeclinedStartDate:0];
}

- (void)dismissAttendeeRepliedNotification
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(EKEvent *)self setInvitationStatus:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(EKCalendarItem *)self attendees];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          [v9 setCommentChanged:0];
          [v9 setStatusChanged:0];
          [v9 setProposedStartDateChanged:0];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_respondToProposedTimeFromAttendee:(id)a3 shouldAccept:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = a3;
  [v14 setCommentChanged:0];
  [v14 setStatusChanged:0];
  [v14 setProposedStartDateChanged:0];
  if (v4) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 3;
  }
  [v14 setProposedStartDateStatus:v6];
  uint64_t v7 = v14;
  if (v4)
  {
    id v8 = [v14 proposedStartDateForEvent:self];
    if (v8)
    {
      id v9 = [(EKEvent *)self endDateUnadjustedForLegacyClients];
      long long v10 = [(EKEvent *)self startDate];
      [v9 timeIntervalSinceDate:v10];
      double v12 = v11;

      [(EKEvent *)self setStartDate:v8];
      long long v13 = [v8 dateByAddingTimeInterval:v12];
      [(EKEvent *)self setEndDateUnadjustedForLegacyClients:v13];
    }
    [(EKEvent *)self dismissAcceptedProposeNewTimeNotification];

    uint64_t v7 = v14;
  }
}

- (void)acceptProposedTimeNotificationFromAttendee:(id)a3
{
}

- (void)declineProposedTimeNotificationFromAttendee:(id)a3
{
}

- (id)committedCopy
{
  if ([(EKEvent *)self isDetached] && [(EKObject *)self hasNeverBeenCommitted])
  {
    id v3 = objc_alloc((Class)objc_opt_class());
    BOOL v4 = [(EKCalendarItem *)self originalItem];
    uint64_t v5 = [v4 persistentObject];
    uint64_t v6 = [(EKEvent *)self originalStartDate];
    uint64_t v7 = (void *)[v3 initWithPersistentObject:v5 occurrenceDate:v6];

    id v8 = [v7 committedCopy];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)EKEvent;
    id v8 = [(EKObject *)&v10 committedCopy];
  }

  return v8;
}

- (id)diffFromCommitted
{
  id v3 = [(EKEvent *)self committedCopy];
  BOOL v4 = v3;
  if (v3) {
    [v3 diffWithObject:self];
  }
  else {
  uint64_t v5 = +[EKDiff diffBetweenObject:0 andObject:self];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3 comparingKeys:(id)a4
{
  return [(EKObject *)self isEqual:a3 comparingKeys:a4 compareImmutableKeys:0 ignoringProperties:0];
}

- (BOOL)isDifferentWithDiff:(id)a3
{
  return [a3 result] != 0;
}

+ (id)knownRequireRSVPKeys
{
  if (knownRequireRSVPKeys_onceToken != -1) {
    dispatch_once(&knownRequireRSVPKeys_onceToken, &__block_literal_global_441);
  }
  unint64_t v2 = (void *)knownRequireRSVPKeys_knownRequireRSVPKeys;

  return v2;
}

void __31__EKEvent_knownRequireRSVPKeys__block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F56D10];
  v4[0] = *MEMORY[0x1E4F56FB0];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F56D00];
  v4[2] = *MEMORY[0x1E4F56C80];
  v4[3] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  id v3 = (void *)knownRequireRSVPKeys_knownRequireRSVPKeys;
  knownRequireRSVPKeys_knownRequireRSVPKeys = v2;
}

+ (id)knownPerUserPropertyKeys
{
  if (knownPerUserPropertyKeys_onceToken != -1) {
    dispatch_once(&knownPerUserPropertyKeys_onceToken, &__block_literal_global_443);
  }
  uint64_t v2 = (void *)knownPerUserPropertyKeys_knownPerUserPropertyKeys;

  return v2;
}

void __35__EKEvent_knownPerUserPropertyKeys__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F57040];
  v3[0] = @"alarms";
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E4F56F58];
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  uint64_t v2 = (void *)knownPerUserPropertyKeys_knownPerUserPropertyKeys;
  knownPerUserPropertyKeys_knownPerUserPropertyKeys = v1;
}

- (BOOL)_diff:(id)a3 isDifferentFromCommittedEventHelperRequiresReschedule:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(EKEvent *)self isDifferentWithDiff:v6];
  id v8 = [v6 differentKeys];
  if ([(EKCalendarItem *)self hasAttendees]
    || [v8 containsObject:*MEMORY[0x1E4F56BA8]])
  {
    id v9 = (void *)MEMORY[0x1E4F1CA80];
    objc_super v10 = [(id)objc_opt_class() knownRequireRSVPKeys];
    double v11 = [v9 setWithArray:v10];

    double v12 = [v6 firstObject];
    long long v13 = [v6 secondObject];
    if (([v12 isDetached] & 1) == 0 && objc_msgSend(v13, "isDetached"))
    {
      id v14 = [v12 startDate];
      uint64_t v15 = [v13 startDate];
      int v16 = [v14 isEqual:v15];

      if (v16) {
        [v11 removeObject:*MEMORY[0x1E4F56D00]];
      }
      int v17 = [v12 endDateUnadjustedForLegacyClients];
      double v18 = [v13 endDateUnadjustedForLegacyClients];
      int v19 = [v17 isEqual:v18];

      if (v19) {
        [v11 removeObject:*MEMORY[0x1E4F56FB0]];
      }
      [v11 removeObject:*MEMORY[0x1E4F56C80]];
    }
    if (v4)
    {
      [v11 addObject:*MEMORY[0x1E4F56BA8]];
      [v11 addObject:*MEMORY[0x1E4F57018]];
    }
    BOOL v20 = [v12 location];
    id v21 = [v13 location];
    int v22 = [v20 isEqual:v21];

    if (v22) {
      [v11 removeObject:*MEMORY[0x1E4F56D10]];
    }
    char v23 = [v8 intersectsSet:v11];
  }
  else
  {
    if (!v7)
    {
      char v23 = 0;
      goto LABEL_16;
    }
    double v11 = [(EKEvent *)self masterEvent];
    char v23 = [v11 hasAttendees];
  }

LABEL_16:
  return v23;
}

- (BOOL)isDifferentAndRequiresRescheduleWithDiff:(id)a3
{
  return [(EKEvent *)self _diff:a3 isDifferentFromCommittedEventHelperRequiresReschedule:1];
}

- (BOOL)isDifferentAndModifiedAttendeesWithDiff:(id)a3
{
  id v4 = a3;
  if ([(EKEvent *)self isDifferentWithDiff:v4])
  {
    uint64_t v5 = [v4 differentKeys];
    if ([v5 containsObject:*MEMORY[0x1E4F56BA8]]
      && ([v5 containsObject:*MEMORY[0x1E4F56F58]] & 1) == 0)
    {
      int v6 = [v5 containsObject:*MEMORY[0x1E4F56C88]] ^ 1;
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isDifferentAndHasForwardedAttendeesWithDiff:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(EKEvent *)self status] != EKEventStatusCanceled
    && [(EKEvent *)self currentUserGeneralizedParticipantRole] == 1
    && [(EKEvent *)self allowsAttendeesModifications]
    && [(EKEvent *)self isDifferentAndModifiedAttendeesWithDiff:v4];

  return v5;
}

- (BOOL)isDifferentAndHasNewProposedTimeWithDiff:(id)a3
{
  id v4 = a3;
  if ([(EKEvent *)self isDifferentWithDiff:v4])
  {
    BOOL v5 = [v4 summaryDictionary];
    int v6 = [v5 objectForKey:*MEMORY[0x1E4F57008]];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isDifferentExceptingPerUserPropertiesWithDiff:(id)a3
{
  id v4 = a3;
  if ([(EKEvent *)self isDifferentWithDiff:v4])
  {
    BOOL v5 = (void *)MEMORY[0x1E4F1CA80];
    int v6 = [(id)objc_opt_class() knownPerUserPropertyKeys];
    BOOL v7 = [v5 setWithArray:v6];

    id v8 = objc_alloc(MEMORY[0x1E4F1CA80]);
    id v9 = [v4 differentKeys];
    objc_super v10 = (void *)[v8 initWithSet:v9];

    [v10 minusSet:v7];
    BOOL v11 = [v10 count] != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)isDifferentFromCommittedEventAndRequiresReschedule
{
  uint64_t v2 = self;
  id v3 = [(EKEvent *)self diffFromCommitted];
  LOBYTE(v2) = [(EKEvent *)v2 isDifferentAndRequiresRescheduleWithDiff:v3];

  return (char)v2;
}

- (BOOL)isDifferentAndRequiresRSVPWithDiff:(id)a3
{
  return [(EKEvent *)self _diff:a3 isDifferentFromCommittedEventHelperRequiresReschedule:0];
}

- (BOOL)isDifferentFromCommittedEventAndRequiresRSVP
{
  uint64_t v2 = self;
  id v3 = [(EKEvent *)self diffFromCommitted];
  LOBYTE(v2) = [(EKEvent *)v2 isDifferentAndRequiresRSVPWithDiff:v3];

  return (char)v2;
}

- (BOOL)isDifferentAndHasUnscheduledAttendeesWithDiff:(id)a3
{
  id v3 = [a3 summaryDictionary];
  id v4 = +[EKDiff summaryKeyForMultiValueAddOfPropertyKey:*MEMORY[0x1E4F56BA8]];
  BOOL v5 = [v3 objectForKey:v4];
  BOOL v6 = v5 != 0;

  return v6;
}

- (BOOL)isDifferentFromCommittedEventAndHasUnscheduledAttendees
{
  uint64_t v2 = self;
  id v3 = [(EKEvent *)self diffFromCommitted];
  LOBYTE(v2) = [(EKEvent *)v2 isDifferentAndHasUnscheduledAttendeesWithDiff:v3];

  return (char)v2;
}

- (BOOL)isPrivacySet
{
  return [(EKEvent *)self privacyLevel] != 0;
}

- (int64_t)requirementsToMoveFromCalendar:(id)a3 toCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(EKEvent *)self _requirementsToMoveOrCopyToCalendarHelperAllowedToMoveOrCopyEventFromCalendar:v6 toCalendar:v7])
  {
    if ([(EKEvent *)self _requirementsToMoveToCalendarHelperDuplicationRequiredToMoveEventFromCalendar:v6 toCalendar:v7])
    {
      uint64_t v8 = 4;
    }
    else
    {
      uint64_t v8 = 0;
    }
    if ([(EKEvent *)self _requirementsToMoveToCalendarHelperAlterationsRequiredToMoveEventFromCalendar:v6 toCalendar:v7])
    {
      uint64_t v9 = v8 | 8;
    }
    else
    {
      uint64_t v9 = v8;
    }
    if ([(EKEvent *)self _requirementsToMoveToCalendarHelperReinviteAttendeesRequiredToMoveEventFromCalendar:v6 toCalendar:v7])
    {
      unint64_t v10 = v9 | 0x20;
      if (!_bitmaskContainsOption(v9 | 0x20, 4)
        && [(EKEvent *)self _requirementsToMoveToCalendarHelperNeedToRemoveOriginalToMoveEventFromCalendar:v6 toCalendar:v7])
      {
        unint64_t v10 = v9 | 0x30;
      }
    }
    else if ([(EKEvent *)self _requirementsToMoveToCalendarHelperRemoveAttendeesRequiredToMoveEventFromCalendar:v6 toCalendar:v7])
    {
      unint64_t v10 = v9 | 0x40;
    }
    else
    {
      unint64_t v10 = v9;
    }
    if (v10 <= 1) {
      int64_t v11 = 1;
    }
    else {
      int64_t v11 = v10;
    }
  }
  else
  {
    int64_t v11 = 2;
  }

  return v11;
}

- (int64_t)requirementsToMoveToCalendar:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(EKCalendarItem *)self calendar];
  int64_t v6 = [(EKEvent *)self requirementsToMoveFromCalendar:v5 toCalendar:v4];

  return v6;
}

- (BOOL)canMoveToCalendar:(id)a3 fromCalendar:(id)a4 error:(id *)a5
{
  return [(EKEvent *)self canMoveToCalendar:a3 fromCalendar:a4 allowedRequirements:121 error:a5];
}

- (BOOL)canMoveToCalendar:(id)a3 fromCalendar:(id)a4 allowedRequirements:(int64_t)a5 error:(id *)a6
{
  return [(EKEvent *)self _canMoveOrCopyFromCalendar:a4 toCalendar:a3 allowedRequirements:a5 error:a6];
}

- (BOOL)canMoveOrCopyToCalendar:(id)a3 fromCalendar:(id)a4 error:(id *)a5
{
  return [(EKEvent *)self _canMoveOrCopyFromCalendar:a4 toCalendar:a3 allowedRequirements:125 error:a5];
}

- (BOOL)requiresCopyToMoveFromCalendar:(id)a3 toCalendar:(id)a4
{
  return ((unint64_t)[(EKEvent *)self requirementsToMoveFromCalendar:a3 toCalendar:a4] >> 2) & 1;
}

- (BOOL)_canMoveOrCopyFromCalendar:(id)a3 toCalendar:(id)a4 allowedRequirements:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  double v12 = [v11 source];
  if (v12)
  {
    long long v13 = [v11 source];
    int v14 = [v13 isEnabledForEvents] ^ 1;
  }
  else
  {
    int v14 = 0;
  }

  if (![v11 allowEvents] || v14)
  {
    if (a6)
    {
      uint64_t v17 = 22;
      goto LABEL_15;
    }
LABEL_21:
    BOOL v18 = 0;
    goto LABEL_22;
  }
  if ([v11 type] == 6 || objc_msgSend(v10, "type") == 6) {
    goto LABEL_21;
  }
  if (([v10 isEqual:v11] & 1) != 0
    || ([(EKEvent *)self constraints],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v15 requiresOutgoingInvitationsInDefaultCalendar],
        v15,
        !v16)
    || ![(EKCalendarItem *)self isSelfOrganizedInvitation])
  {
    uint64_t v19 = [(EKEvent *)self requirementsToMoveFromCalendar:v10 toCalendar:v11];
    if (v19 != 2 && _bitmaskContainsOption(a5, v19))
    {
      BOOL v18 = 1;
      goto LABEL_22;
    }
    if (a6)
    {
      uint64_t v17 = 0;
      goto LABEL_15;
    }
    goto LABEL_21;
  }
  if (!a6) {
    goto LABEL_21;
  }
  uint64_t v17 = 12;
LABEL_15:
  [MEMORY[0x1E4F28C58] errorWithEKErrorCode:v17];
  BOOL v18 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v18;
}

- (BOOL)seriesHasOutOfOrderEvents
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = [(EKCalendarItem *)self recurrenceRules];
  if (![v3 count])
  {

    return 0;
  }
  id v4 = [(EKCalendarItem *)self detachedItems];
  uint64_t v5 = [v4 count];

  if (!v5) {
    return 0;
  }
  uint64_t v33 = [(EKEvent *)self masterEvent];
  int64_t v6 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v7 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v8 = [v33 detachedItems];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(v8);
        }
        double v12 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        long long v13 = [v12 startDate];
        [v7 setObject:v12 forKeyedSubscript:v13];

        int v14 = [v12 startDate];
        int v15 = [v14 isAfterDate:v6];

        if (v15)
        {
          uint64_t v16 = [v12 startDate];

          int64_t v6 = (void *)v16;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v9);
  }

  uint64_t v17 = [(EKCalendarItem *)self recurrenceRules];
  BOOL v18 = [v17 objectAtIndexedSubscript:0];

  uint64_t v19 = (void *)MEMORY[0x1E4F1C9A8];
  BOOL v20 = [(EKCalendarItem *)self timeZone];
  id v21 = [v19 CalGregorianCalendarForTimeZone:v20];

  int v22 = [v18 dateComponents];
  char v23 = [v21 dateByAddingComponents:v22 toDate:v6 options:0];

  uint64_t v24 = objc_alloc_init(EKRecurrenceGenerator);
  long long v25 = [v33 startDate];
  int v26 = [(EKCalendarItem *)self timeZone];
  LOBYTE(v32) = 1;
  id v27 = [(EKRecurrenceGenerator *)v24 copyOccurrenceDatesWithEKEvent:self startDate:v25 endDate:v23 timeZone:v26 exceptionDates:0 limit:0 adjustDatesForAllDayEvents:v32];

  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __36__EKEvent_seriesHasOutOfOrderEvents__block_invoke;
  v34[3] = &unk_1E5B98C50;
  id v28 = v7;
  id v35 = v28;
  id v29 = v27;
  id v36 = v29;
  id v37 = &v38;
  [v29 enumerateObjectsUsingBlock:v34];
  BOOL v30 = *((unsigned char *)v39 + 24) != 0;

  _Block_object_dispose(&v38, 8);
  return v30;
}

void __36__EKEvent_seriesHasOutOfOrderEvents__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v7)
  {
    id v14 = v7;
    if (a3)
    {
      uint64_t v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3 - 1];
      uint64_t v9 = [v14 startDate];
      int v10 = [v9 isBeforeDate:v8];

      if (v10) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
    }
    if ([*(id *)(a1 + 40) count] - 1 > a3)
    {
      id v11 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3 + 1];
      double v12 = [v14 startDate];
      int v13 = [v12 isAfterDate:v11];

      if (v13) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
    }
    id v7 = v14;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *a4 = 1;
    }
  }
}

- (BOOL)isOutOfOrderWithEventInSeries
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = [(EKCalendarItem *)self originalItem];
  id v4 = [(EKCalendarItem *)self recurrenceRules];
  uint64_t v5 = [v4 count];

  if (v5 || v3)
  {
    if (!v3) {
      id v3 = self;
    }
    id v7 = [(EKEvent *)self originalStartDate];
    if (!v7)
    {
      uint64_t v8 = [(EKEvent *)self originalOccurrenceStartDate];
      id v7 = [v8 date];
    }
    [(EKEvent *)self startDate];
    long long v43 = v42 = v3;
    uint64_t v9 = [(EKCalendarItem *)v3 detachedItems];
    int v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v49;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v49 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          id v17 = [v16 originalStartDate];
          uint64_t v18 = [v17 compare:v7];
          if (v18)
          {
            uint64_t v19 = v18;
            [v10 addObject:v17];
            BOOL v20 = [v16 startDate];
            uint64_t v21 = [v20 compare:v43];

            if (v21 != v19)
            {
              LOBYTE(v6) = 1;
              int v22 = v11;
              goto LABEL_37;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v48 objects:v53 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    int v22 = [(EKCalendarItem *)v42 exceptionDates];
    char v23 = v43;
    int v24 = [v43 isBeforeDate:v7];
    if (v24) {
      long long v25 = v43;
    }
    else {
      long long v25 = v7;
    }
    if (v24) {
      char v23 = v7;
    }
    id v17 = v25;
    id v41 = v23;
    int v26 = objc_alloc_init(EKRecurrenceGenerator);
    uint64_t v27 = [(EKEvent *)v42 effectiveTimeZone];
    id v28 = [(EKCalendarItem *)v42 recurrenceRules];
    uint64_t v29 = [v28 firstObject];

    LOBYTE(v37) = 1;
    uint64_t v39 = (void *)v27;
    uint64_t v40 = v26;
    uint64_t v38 = (void *)v29;
    uint64_t v30 = v29;
    uint64_t v31 = v41;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v32 = [(EKRecurrenceGenerator *)v26 copyOccurrenceDatesWithEKEvent:v42 recurrenceRule:v30 startDate:v17 endDate:v41 timeZone:v27 exceptionDates:0 limit:0 adjustDatesForAllDayEvents:v37];
    uint64_t v6 = [v32 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v6)
    {
      uint64_t v33 = *(void *)v45;
      while (2)
      {
        for (uint64_t j = 0; j != v6; ++j)
        {
          if (*(void *)v45 != v33) {
            objc_enumerationMutation(v32);
          }
          id v35 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          if (([v35 isEqualToDate:v7] & 1) == 0
            && ([v22 containsObject:v35] & 1) == 0
            && ![v10 containsObject:v35])
          {
            LOBYTE(v6) = 1;
            goto LABEL_35;
          }
        }
        uint64_t v6 = [v32 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v6) {
          continue;
        }
        break;
      }
LABEL_35:
      uint64_t v31 = v41;
    }

LABEL_37:
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)seriesHasOverlappingOrOnSameDayOrOutOfOrderEvents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(EKCalendarItem *)self recurrenceRuleString];

  if (!v3) {
    return 0;
  }
  id v4 = [(EKEvent *)self masterEvent];
  if ([v4 overlapsWithOrIsSameDayAsEventInSeries])
  {
LABEL_14:
    BOOL v10 = 1;
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [(EKCalendarItem *)self detachedItems];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v12 + 1) + 8 * i) overlapsWithOrIsSameDayAsEventInSeries])
          {

            goto LABEL_14;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    BOOL v10 = [(EKEvent *)self seriesHasOutOfOrderEvents];
  }

  return v10;
}

- (BOOL)_requirementsToMoveOrCopyToCalendarHelperAllowedToMoveOrCopyEventFromCalendar:(id)a3 toCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 allowsContentModifications] & 1) == 0)
  {
    uint64_t v8 = [(EKEvent *)self suggestionInfo];
    if (!v8) {
      goto LABEL_17;
    }
    uint64_t v9 = (void *)v8;
    int v10 = [v7 isSuggestedEventCalendar];

    if (!v10) {
      goto LABEL_17;
    }
  }
  if ([v6 sharingStatus] == 2)
  {
    if (![(EKEvent *)self privacyLevel]) {
      goto LABEL_11;
    }
  }
  else
  {
    id v11 = [v6 source];
    if (([v11 isDelegate] & 1) == 0)
    {

      goto LABEL_11;
    }
    int64_t v12 = [(EKEvent *)self privacyLevel];

    if (!v12)
    {
LABEL_11:
      long long v13 = [v7 constraints];
      if ([v13 eventDurationConstrainedToRecurrenceInterval])
      {
        BOOL v14 = [(EKEvent *)self durationOverlapsRecurrenceInterval];

        if (v14) {
          goto LABEL_17;
        }
      }
      else
      {
      }
      long long v15 = [v7 constraints];
      if ([v15 occurrencesMustOccurOnSeparateDays])
      {
        BOOL v16 = [(EKEvent *)self seriesHasOverlappingOrOnSameDayOrOutOfOrderEvents];

        if (v16) {
          goto LABEL_17;
        }
      }
      else
      {
      }
      BOOL v17 = 1;
      goto LABEL_20;
    }
  }
LABEL_17:
  BOOL v17 = 0;
LABEL_20:

  return v17;
}

- (BOOL)_hasAbsoluteAlarms
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(EKCalendarItem *)self hasAlarms])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = [(EKCalendarItem *)self alarms];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v3);
          }
          id v7 = [*(id *)(*((void *)&v9 + 1) + 8 * i) absoluteDate];

          if (v7)
          {
            LOBYTE(v4) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)_nsCalendar
{
  if ([(EKEvent *)self isAllDay]
    || ([(EKCalendarItem *)self timeZone],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    id v6 = [MEMORY[0x1E4F1C9A8] CalGregorianGMTCalendar];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1C9A8];
    uint64_t v5 = [(EKCalendarItem *)self timeZone];
    id v6 = [v4 CalGregorianCalendarForTimeZone:v5];
  }

  return v6;
}

- (BOOL)_suggestedStartDateHelperRecurrenceRuleRequiresExpansion:(id)a3 forDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 frequency] == 3)
  {
    uint64_t v8 = [v6 daysOfTheYear];
    if ([v8 count])
    {
    }
    else
    {
      long long v11 = [v6 monthsOfTheYear];
      uint64_t v12 = [v11 count];

      if (v12)
      {
        long long v13 = [(EKEvent *)self _nsCalendar];
        uint64_t v14 = [v13 component:8 fromDate:v7];

        long long v10 = [v6 monthsOfTheYear];
        long long v15 = [NSNumber numberWithInteger:v14];
        int v9 = [v10 containsObject:v15] ^ 1;
        goto LABEL_22;
      }
    }
  }
  if (([v6 isPinnedToEndOfFrequency] & 1) == 0)
  {
    long long v10 = [v6 daysOfTheMonth];
    if ([v10 count])
    {
      LOBYTE(v9) = 1;
LABEL_23:

      goto LABEL_24;
    }
    long long v15 = [v6 daysOfTheWeek];
    if ([v15 count])
    {
      LOBYTE(v9) = 1;
    }
    else
    {
      BOOL v16 = [v6 daysOfTheYear];
      if ([v16 count])
      {
        LOBYTE(v9) = 1;
      }
      else
      {
        BOOL v17 = [v6 monthsOfTheYear];
        if ([v17 count])
        {
          LOBYTE(v9) = 1;
        }
        else
        {
          uint64_t v18 = [v6 setPositions];
          if ([v18 count])
          {
            LOBYTE(v9) = 1;
          }
          else
          {
            uint64_t v19 = [v6 weeksOfTheYear];
            LOBYTE(v9) = [v19 count] != 0;
          }
        }
      }
    }
LABEL_22:

    goto LABEL_23;
  }
  LOBYTE(v9) = 0;
LABEL_24:

  return v9;
}

- (id)suggestedStartDateForCurrentRecurrenceRule
{
  return [(EKEvent *)self suggestedStartDateForCurrentRecurrenceRuleWithSimulatedNowDate:0];
}

- (id)suggestedStartDateForCurrentRecurrenceRuleWithSimulatedNowDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKEvent *)self startDate];
  id v6 = [(EKCalendarItem *)self recurrenceRules];
  id v7 = [v6 firstObject];

  if (v7
    && [(EKEvent *)self _suggestedStartDateHelperRecurrenceRuleRequiresExpansion:v7 forDate:v5])
  {
    if ([v7 interval] != 1)
    {
      uint64_t v8 = (void *)[v7 copy];

      [v8 setInterval:1];
      id v7 = v8;
    }
    int v9 = [(EKEvent *)self _nsCalendar];
    long long v10 = (void *)[v9 copy];

    objc_msgSend(v10, "setFirstWeekday:", objc_msgSend(v7, "firstDayOfTheWeek"));
    if (v4)
    {
      id v11 = v4;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F1C9C8] date];
    }
    id v12 = v11;
    long long v13 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v14 = [(EKEvent *)self startDate];
    uint64_t v29 = v12;
    long long v15 = [v13 dateWithDatePartFromDate:v12 timePartFromDate:v14 inCalendar:v10];

    BOOL v16 = [(EKEvent *)self startDate];
    LODWORD(v12) = [v16 isSameWeekAsDate:v15 inCalendar:v10];

    BOOL v17 = [(EKEvent *)self startDate];
    uint64_t v18 = v17;
    if (v12)
    {
      if ([v17 isBeforeDate:v15])
      {
        id v19 = [(EKEvent *)self startDate];
      }
      else
      {
        id v19 = v15;
      }
    }
    else
    {
      int v20 = [v17 isAfterDate:v15];

      uint64_t v18 = [(EKEvent *)self startDate];
      if (!v20)
      {
LABEL_15:
        int v22 = (void *)MEMORY[0x1E4F57838];
        char v23 = [(EKCalendarItem *)self timeZone];
        int v24 = [v22 calendarDateWithDate:v18 timeZone:v23];

        long long v25 = objc_alloc_init(EKRecurrenceGenerator);
        [(CalRecurrenceGenerator *)v25 setOnlyIncludeInitialDateIfItMatchesRecurrence:1];
        int v26 = [(EKCalendarItem *)self recurrenceRules];
        uint64_t v27 = [(EKRecurrenceGenerator *)v25 nextOccurrenceDateWithEKRecurrences:v26 forCalendarItem:self initialDate:v24 afterDate:v24 inclusive:1];

        uint64_t v5 = (void *)v27;
        goto LABEL_16;
      }
      objc_msgSend(v18, "roundToCurrentWeekInCalendar:withFirstWeekdayIndex:", v10, objc_msgSend(v7, "firstDayOfTheWeek"));
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v21 = v19;

    uint64_t v18 = v21;
    goto LABEL_15;
  }
LABEL_16:

  return v5;
}

- (BOOL)isValidAttendee:(id)a3 forCalendar:(id)a4
{
  return [(EKEvent *)self _isValidAttendee:a3 forCalendar:a4 selfAttendeeIsValid:0];
}

- (BOOL)_isValidAttendee:(id)a3 forCalendar:(id)a4 selfAttendeeIsValid:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v5
    || ([(EKCalendarItem *)self selfAttendee],
        long long v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isEqualToParticipant:v8],
        v10,
        (v11 & 1) == 0))
  {
    long long v13 = [v8 URL];
    uint64_t v14 = [MEMORY[0x1E4F1CB10] URLForNoMail];
    char v15 = [v13 isEqual:v14];

    if ((v15 & 1) != 0
      || ([v9 ownerIdentityAddress],
          BOOL v16 = objc_claimAutoreleasedReturnValue(),
          char v17 = [v13 isEqual:v16],
          v16,
          (v17 & 1) != 0))
    {
      BOOL v12 = 0;
LABEL_31:

      goto LABEL_32;
    }
    uint64_t v18 = [v8 emailAddress];
    id v19 = [v9 ownerIdentityAddress];
    int v20 = [v19 resourceSpecifier];

    id v21 = [v9 ownerIdentityEmail];
    if ([v18 isEqual:v21])
    {

LABEL_10:
      BOOL v12 = 0;
LABEL_30:

      goto LABEL_31;
    }
    char v22 = [v18 isEqual:v20];

    if (v22) {
      goto LABEL_10;
    }
    char v23 = [v8 phoneNumber];
    int v24 = [v9 ownerIdentityPhoneNumber];
    if ([v23 isEqual:v24])
    {
    }
    else
    {
      char v25 = [v23 isEqual:v20];

      if ((v25 & 1) == 0)
      {
        id v35 = [v13 absoluteString];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        int v26 = [v9 source];
        uint64_t v27 = [v26 ownerAddresses];

        id obj = v27;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v37;
          while (2)
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v37 != v30) {
                objc_enumerationMutation(obj);
              }
              uint64_t v32 = *(void *)(*((void *)&v36 + 1) + 8 * i);
              if (([v18 isEqual:v32] & 1) != 0
                || ([v23 isEqual:v32] & 1) != 0
                || ([v35 isEqual:v32] & 1) != 0)
              {
                BOOL v12 = 0;
                goto LABEL_28;
              }
            }
            uint64_t v29 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
            BOOL v12 = 1;
            if (v29) {
              continue;
            }
            break;
          }
        }
        else
        {
          BOOL v12 = 1;
        }
LABEL_28:

        goto LABEL_29;
      }
    }
    BOOL v12 = 0;
LABEL_29:

    goto LABEL_30;
  }
  BOOL v12 = 1;
LABEL_32:

  return v12;
}

- (id)attendeesNotIncludingOrganizer
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(EKCalendarItem *)self attendees];
  id v4 = [(EKCalendarItem *)self organizer];

  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if (-[EKEvent isAttendeeSameAsOrganizer:](self, "isAttendeeSameAsOrganizer:", v10, (void)v15))
          {
            uint64_t v19 = v10;
            BOOL v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
            long long v13 = [v5 arrayByExcludingObjectsInArray:v12];

            goto LABEL_14;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    id v11 = v5;
  }
  else
  {
    id v11 = v3;
  }
  long long v13 = v11;
LABEL_14:

  return v13;
}

- (BOOL)isAttendeeSameAsOrganizer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(EKCalendarItem *)self organizer];
    if (v5)
    {
      uint64_t v6 = [(EKCalendarItem *)self organizer];
      char v7 = [v6 isEqualToParticipant:v4];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)attendeesNotIncludingOrganizerOrLocationsOrResources
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v4 = [(EKCalendarItem *)self attendees];
  id v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  uint64_t v6 = [(EKCalendarItem *)self organizer];
  if (([v6 isNew] & 1) != 0 || (int v12 = objc_msgSend(v6, "existsInStore"), !v6) || v12)
  {
    char v7 = [(EKCalendarItem *)self attendees];
    uint64_t v8 = [(EKObject *)self eventStore];
    id v9 = +[EKObject objectsIDsExistingInStoreFromObjects:v7 eventStore:v8];

    uint64_t v10 = [(EKCalendarItem *)self attendees];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __63__EKEvent_attendeesNotIncludingOrganizerOrLocationsOrResources__block_invoke;
    void v15[3] = &unk_1E5B98C78;
    id v16 = v9;
    id v17 = v6;
    id v18 = v5;
    id v11 = v9;
    [v10 enumerateObjectsUsingBlock:v15];
  }
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithArray:v5];

  return v13;
}

uint64_t __63__EKEvent_attendeesNotIncludingOrganizerOrLocationsOrResources__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (([v9 isNew] & 1) == 0)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v9 CADObjectID];
    if (([v5 containsObject:v6] & 1) == 0 || objc_msgSend(v9, "participantType") == 2)
    {

LABEL_11:
      id v4 = v9;
      goto LABEL_12;
    }
    uint64_t v7 = [v9 participantType];

    id v4 = v9;
    if (v7 == 3) {
      goto LABEL_12;
    }
LABEL_9:
    uint64_t v3 = [v4 isEqualToParticipant:*(void *)(a1 + 40)];
    id v4 = v9;
    if (v3) {
      goto LABEL_12;
    }
    uint64_t v3 = [*(id *)(a1 + 48) addObject:v9];
    goto LABEL_11;
  }
  uint64_t v3 = [v9 participantType];
  id v4 = v9;
  if (v3 != 2)
  {
    uint64_t v3 = [v9 participantType];
    id v4 = v9;
    if (v3 != 3) {
      goto LABEL_9;
    }
  }
LABEL_12:

  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)prefetchAttendeesWithAdditionalProperties:(id)a3
{
  id v8 = a3;
  id v4 = +[EKPersistentAttendee defaultPropertiesToLoad];
  id v5 = v4;
  if ([v8 count])
  {
    id v5 = [v8 arrayByAddingObjectsFromArray:v4];
  }
  uint64_t v6 = [(EKObject *)self eventStore];
  uint64_t v7 = [(EKCalendarItem *)self attendeesRaw];
  [v6 ensureLoadedProperties:v5 forObjects:v7];
}

- (BOOL)_requirementsToMoveToCalendarHelperAlterationsRequiredToMoveEventFromCalendar:(id)a3 toCalendar:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(EKEvent *)self isPrivacySet])
  {
    id v8 = [v7 source];
    if ([v8 supportsPrivateEvents]) {
      BOOL v9 = [v7 sharingStatus] != 2;
    }
    else {
      BOOL v9 = 0;
    }
    int v10 = !v9;
  }
  else
  {
    int v10 = 0;
  }
  id v11 = [(EKCalendarItem *)self alarms];
  if ((unint64_t)[v11 count] < 2) {
    int v12 = 0;
  }
  else {
    int v12 = [v7 supportsMultipleAlarms] ^ 1;
  }
  int v13 = v10 | v12;

  if ([(EKEvent *)self _hasAbsoluteAlarms])
  {
    uint64_t v14 = [v7 constraints];
    v13 |= [v14 supportsAlarmTriggerDates] ^ 1;
  }
  if ([(EKCalendarItem *)self hasRecurrenceRules])
  {
    long long v15 = [v7 constraints];
    if ([v15 requiresOccurrencesConformToRecurrenceRule])
    {
      id v16 = [(EKEvent *)self startDate];
      id v17 = [(EKEvent *)self suggestedStartDateForCurrentRecurrenceRule];
      v13 |= [v16 isEqualToDate:v17] ^ 1;
    }
  }
  id v18 = [(EKEvent *)self URL];
  if (v18)
  {
    uint64_t v19 = [v7 constraints];
    v13 |= [v19 supportsURLField] ^ 1;
  }
  int v20 = [v6 source];
  uint64_t v21 = [v20 sourceIdentifier];
  char v22 = [v7 source];
  char v23 = [v22 sourceIdentifier];
  if (([v21 isEqualToString:v23] & 1) == 0)
  {
    int v24 = [(EKCalendarItem *)self attachments];
    if ([v24 count]) {
      int v13 = 1;
    }
  }
  char v25 = [(EKCalendarItem *)self timeZone];
  if (v25)
  {
  }
  else
  {
    int v26 = [v7 constraints];
    char v27 = [v26 supportsFloatingTimeZone];

    if ((v27 & 1) == 0) {
      v13 |= ![(EKEvent *)self isAllDay];
    }
  }
  if ([(EKCalendarItem *)self hasAttendees])
  {
    uint64_t v28 = [v6 source];
    uint64_t v29 = [v28 sourceIdentifier];
    uint64_t v30 = [v7 source];
    uint64_t v31 = [v30 sourceIdentifier];
    char v32 = [v29 isEqualToString:v31];

    if ((v32 & 1) == 0)
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      uint64_t v33 = [(EKCalendarItem *)self attendees];
      uint64_t v34 = [v33 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v49;
        while (2)
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v49 != v36) {
              objc_enumerationMutation(v33);
            }
            if (![(EKEvent *)self isValidAttendee:*(void *)(*((void *)&v48 + 1) + 8 * i) forCalendar:v7])
            {
              int v13 = 1;
              goto LABEL_38;
            }
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v48 objects:v52 count:16];
          if (v35) {
            continue;
          }
          break;
        }
      }
LABEL_38:
    }
    if (![v6 type] && objc_msgSend(v7, "type") != 2 && objc_msgSend(v7, "type"))
    {
      long long v38 = [(EKCalendarItem *)self organizer];
      if ([v38 scheduleAgent] == 1) {
        int v39 = v13;
      }
      else {
        int v39 = 1;
      }
      int v13 = v39 != 0;
    }
  }
  if ([(EKCalendarItem *)self hasRecurrenceRules])
  {
    uint64_t v40 = [(EKCalendarItem *)self recurrenceRules];
    uint64_t v41 = [v40 firstObject];

    if ([v41 frequency] == 2)
    {
      long long v42 = [v41 daysOfTheMonth];
      if ((unint64_t)[v42 count] >= 2)
      {
        long long v43 = [v7 constraints];
        v13 |= [v43 prohibitsMultipleDaysInMonthlyRecurrence];
      }
    }
    if ([v41 frequency] == 3)
    {
      long long v44 = [v41 monthsOfTheYear];
      if ((unint64_t)[v44 count] >= 2)
      {
        long long v45 = [v7 constraints];
        v13 |= [v45 prohibitsMultipleMonthsInYearlyRecurrence];
      }
    }
    if ([v41 frequency] == 3 && objc_msgSend(v41, "interval") >= 2)
    {
      long long v46 = [v7 constraints];
      v13 |= [v46 prohibitsYearlyRecurrenceInterval];
    }
    LOBYTE(v13) = v13 != 0;
  }
  return v13;
}

+ (BOOL)_calendarsAreSharedToMeInSameSourceAndHaveSameOwner:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    id v5 = [v4 source];

    id v6 = [v3 objectAtIndexedSubscript:0];
    id v7 = [v6 sharedOwnerAddress];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v13, "sharingStatus", (void)v20) != 2) {
            goto LABEL_13;
          }
          uint64_t v14 = [v13 source];
          int v15 = [v5 isEqual:v14];

          if (v15)
          {
            id v16 = [v13 sharedOwnerAddress];
            int v17 = [v7 isEqualToString:v16];

            if (v17) {
              continue;
            }
          }
LABEL_13:
          BOOL v18 = 0;
          goto LABEL_16;
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        BOOL v18 = 1;
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v18 = 1;
    }
LABEL_16:
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)_requirementsToMoveToCalendarHelperDuplicationRequiredToMoveEventFromCalendar:(id)a3 toCalendar:(id)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 allowsContentModifications]) {
    int v8 = 0;
  }
  else {
    int v8 = [v6 isSuggestedEventCalendar] ^ 1;
  }
  if ([(EKCalendarItem *)self hasAttendees])
  {
    if ([v6 type]
      && ([(EKCalendarItem *)self organizer],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 scheduleAgent],
          v9,
          v10 != 1))
    {
      if ([(EKEvent *)self isCurrentUserInvitedAttendee]
        || ![(EKEvent *)self currentUserMayActAsOrganizer])
      {
        if ([v6 sharingStatus] == 2 || objc_msgSend(v7, "sharingStatus") == 2)
        {
          v23[0] = v6;
          v23[1] = v7;
          uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
          int v15 = v8 | !+[EKEvent _calendarsAreSharedToMeInSameSourceAndHaveSameOwner:v14];

          if ([v6 sharingStatus] == 2) {
            int v16 = [v6 allowsScheduling] ^ 1;
          }
          else {
            int v16 = 0;
          }
          int v8 = v16 | v15;
          if ([v7 sharingStatus] == 2) {
            int v17 = [v7 allowsScheduling] ^ 1;
          }
          else {
            int v17 = 0;
          }
          LOBYTE(v8) = (v8 | v17) != 0;
        }
        else
        {
          BOOL v18 = [v6 source];
          uint64_t v19 = [v18 sourceIdentifier];
          long long v20 = [v7 source];
          long long v21 = [v20 sourceIdentifier];
          v8 |= [v19 isEqualToString:v21] ^ 1;
        }
      }
    }
    else if ([(EKEvent *)self isCurrentUserInvitedAttendee])
    {
      uint64_t v11 = [v7 sharingStatus];
      uint64_t v12 = [v7 type];
      if (v11 == 2 || v12 == 2) {
        LOBYTE(v8) = 1;
      }
    }
  }

  return v8;
}

- (BOOL)_requirementsToMoveToCalendarHelperNeedToRemoveOriginalToMoveEventFromCalendar:(id)a3 toCalendar:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(EKCalendarItem *)self organizer];
  if ([v8 scheduleAgent] == 1)
  {

LABEL_9:
    LOBYTE(v16) = 0;
    goto LABEL_10;
  }
  uint64_t v9 = [v6 type];

  if (!v9 || ![(EKCalendarItem *)self hasAttendees]) {
    goto LABEL_9;
  }
  v18[0] = v6;
  v18[1] = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  uint64_t v11 = [v6 source];
  uint64_t v12 = [v11 sourceIdentifier];
  int v13 = [v7 source];
  uint64_t v14 = [v13 sourceIdentifier];
  int v15 = [v12 isEqualToString:v14];

  if (v15)
  {
    if ([v6 sharingStatus] == 2 || objc_msgSend(v7, "sharingStatus") == 2) {
      BOOL v16 = !+[EKEvent _calendarsAreSharedToMeInSameSourceAndHaveSameOwner:v10];
    }
    else {
      LOBYTE(v16) = 0;
    }
  }
  else
  {
    LOBYTE(v16) = 1;
  }

LABEL_10:
  return v16;
}

- (BOOL)_requirementsToMoveToCalendarHelperReinviteAttendeesRequiredToMoveEventFromCalendar:(id)a3 toCalendar:(id)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(EKCalendarItem *)self hasAttendees]
    || ![(EKEvent *)self currentUserMayActAsOrganizer])
  {
    goto LABEL_17;
  }
  int v8 = [(EKCalendarItem *)self organizer];
  if ([v8 scheduleAgent] != 1)
  {
    uint64_t v9 = [v6 type];

    if (!v9
      || [v6 type] != 2 && objc_msgSend(v7, "type") == 2
      || [v6 sharingStatus] == 2
      && [v7 sharingStatus] != 2
      && [(EKEvent *)self isCurrentUserInvitedAttendee])
    {
      goto LABEL_17;
    }
    if ([v6 sharingStatus] == 2 || objc_msgSend(v7, "sharingStatus") == 2)
    {
      if ([v6 sharingStatus] != 2
        || ([v6 allowsScheduling] & 1) != 0
        || [v7 sharingStatus] != 2
        || ([v7 allowsScheduling] & 1) != 0)
      {
        goto LABEL_17;
      }
      v16[0] = v6;
      v16[1] = v7;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
      int v10 = !+[EKEvent _calendarsAreSharedToMeInSameSourceAndHaveSameOwner:v12];
    }
    else
    {
      uint64_t v12 = [v6 source];
      int v13 = [v12 sourceIdentifier];
      uint64_t v14 = [v7 source];
      int v15 = [v14 sourceIdentifier];
      int v10 = [v13 isEqualToString:v15] ^ 1;
    }
    goto LABEL_18;
  }

LABEL_17:
  LOBYTE(v10) = 0;
LABEL_18:

  return v10;
}

- (BOOL)_requirementsToMoveToCalendarHelperRemoveAttendeesRequiredToMoveEventFromCalendar:(id)a3 toCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(EKCalendarItem *)self hasAttendees])
  {
    if ([v6 type] != 2 && objc_msgSend(v7, "type") == 2
      || [v6 sharingStatus] == 2
      && [v7 sharingStatus] != 2
      && [(EKEvent *)self isCurrentUserInvitedAttendee])
    {
      LOBYTE(v8) = 1;
    }
    else
    {
      BOOL v8 = [(EKEvent *)self _requirementsToMoveToCalendarHelperDuplicationRequiredToMoveEventFromCalendar:v6 toCalendar:v7];
      if ([(EKEvent *)self currentUserMayActAsOrganizer])
      {
        if ([v7 sharingStatus] == 2) {
          int v9 = [v7 allowsScheduling] ^ 1;
        }
        else {
          int v9 = 0;
        }
        LOBYTE(v8) = (v9 | v8) != 0;
      }
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (id)eventFromICSEvent:(id)a3 inStore:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1A62664B0]();
  id v8 = objc_alloc_init(MEMORY[0x1E4FB7F00]);
  v18[0] = v5;
  int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v8 setComponents:v9 options:0];

  int v10 = (void *)[objc_alloc(MEMORY[0x1E4FB7F48]) initWithCalendar:v8];
  uint64_t v11 = [v10 ICSDataWithOptions:0];
  uint64_t v12 = [[EKEventStore alloc] initWithEKOptions:48];
  int v13 = [(EKEventStore *)v12 defaultCalendarForNewEvents];
  uint64_t v14 = [(EKEventStore *)v12 importICSData:v11 intoCalendar:v13 options:*MEMORY[0x1E4F574D0]];

  int v15 = [v14 firstObject];
  BOOL v16 = [v15 duplicateToEventStore:v6];
  [v16 setCalendar:0];

  return v16;
}

- (void)setRecurrenceRuleFromICSString:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FB7F78] recurrenceRuleFromICSString:v4];
  if (v5)
  {
    id v6 = [(EKEvent *)self _ekRecurrenceRuleFromICSRecurrenceRule:v5];
    v8[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [(EKEvent *)self setRecurrenceRules:v7];
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEvent setRecurrenceRuleFromICSString:]();
  }
}

- (id)_ekRecurrenceRuleFromICSRecurrenceRule:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v25 = self;
    context = (void *)MEMORY[0x1A62664B0]();
    id v5 = objc_opt_new();
    [v5 setSummary:@"Temp event"];
    id v26 = v4;
    v29[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    [v5 setRrule:v6];

    id v7 = objc_alloc(MEMORY[0x1E4FB7F28]);
    id v8 = [MEMORY[0x1E4FB7F38] dateFromICSString:@"20220717T000000Z"];
    int v9 = (void *)[v7 initWithValue:v8];
    [v5 setDtstart:v9];

    int v10 = [v5 dtstart];
    [v5 setDtend:v10];

    id v11 = objc_alloc_init(MEMORY[0x1E4FB7F00]);
    uint64_t v28 = v5;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    [v11 setComponents:v12 options:0];

    int v13 = (void *)[objc_alloc(MEMORY[0x1E4FB7F48]) initWithCalendar:v11];
    uint64_t v14 = [v13 ICSDataWithOptions:0];
    int v15 = [[EKEventStore alloc] initWithEKOptions:48];
    BOOL v16 = [(EKEventStore *)v15 defaultCalendarForNewEvents];
    int v17 = [(EKEventStore *)v15 importICSData:v14 intoCalendar:v16 options:0];

    BOOL v18 = [v17 firstObject];
    uint64_t v19 = [v18 recurrenceRules];
    long long v20 = [v19 lastObject];

    if (v20)
    {
      long long v21 = [(EKObject *)v25 eventStore];
      long long v22 = [v20 duplicateToEventStore:v21];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        -[EKEvent _ekRecurrenceRuleFromICSRecurrenceRule:]();
      }
      long long v22 = 0;
    }
    id v4 = v26;

    if (v20) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (void)updateWithVCSEntity:(id)a3 inCalendar:(id)a4
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v68.receiver = self;
  v68.super_class = (Class)EKEvent;
  [(EKCalendarItem *)&v68 updateWithVCSEntity:v6 inCalendar:a4];
  id v7 = v6;
  id v8 = [v7 startDate];
  int v9 = [(EKEvent *)self effectiveTimeZone];
  uint64_t v10 = [v8 nsDateWithLocalTimeZone:v9];

  id v11 = [v7 endDate];
  uint64_t v12 = [(EKEvent *)self effectiveTimeZone];
  uint64_t v13 = [v11 nsDateWithLocalTimeZone:v12];

  if ([v8 floating])
  {
    [(EKEvent *)self setTimeZone:0];
  }
  else
  {
    uint64_t v14 = [(EKEvent *)self effectiveTimeZone];
    [(EKEvent *)self setTimeZone:v14];
  }
  -[EKEvent setAllDay:](self, "setAllDay:", [v8 dateOnly]);
  [(EKEvent *)self setStartDate:v10];
  [(EKEvent *)self setEndDateUnadjustedForLegacyClients:v13];
  int v15 = [v7 propertyForName:@"LOCATION"];
  BOOL v16 = [v15 singleValue];
  int v17 = [v16 value];
  BOOL v18 = [v17 componentsJoinedByString:@"; "];

  if ([v18 length])
  {
    uint64_t v19 = objc_alloc_init(EKStructuredLocation);
    [(EKStructuredLocation *)v19 setTitle:v18];
    [(EKEvent *)self setStructuredLocation:v19];
  }
  long long v20 = [v7 propertyForName:@"RRULE"];
  long long v21 = [v20 singleValue];
  uint64_t v22 = [v21 value];

  if (v22)
  {
    uint64_t v23 = [(EKEvent *)self _ekRecurrenceRuleFromVCSRecurrenceRule:v22];
    int v24 = (void *)v23;
    if (v23)
    {
      v71[0] = v23;
      uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];
      [(EKEvent *)self setRecurrenceRules:v25];
    }
  }
  uint64_t v59 = (void *)v10;
  id v26 = [v7 propertyForName:@"TRANSP"];
  char v27 = [v26 singleValue];
  uint64_t v28 = [v27 value];
  uint64_t v29 = [v28 unsignedIntegerValue];

  switch(v29)
  {
    case 1:
    case 2:
      break;
    case 3:
      uint64_t v30 = [(EKCalendarItem *)self calendar];
      if (([v30 supportedEventAvailabilities] & 0x10) != 0) {
        uint64_t v29 = 4;
      }
      else {
        uint64_t v29 = 3;
      }
      goto LABEL_18;
    case 4:
      uint64_t v30 = [(EKCalendarItem *)self calendar];
      if (([v30 supportedEventAvailabilities] & 0x20) != 0) {
        uint64_t v29 = 5;
      }
      else {
        uint64_t v29 = 3;
      }
LABEL_18:

      break;
    default:
      uint64_t v29 = 0;
      break;
  }
  [(EKEvent *)self setAvailability:v29];
  uint64_t v57 = v18;
  id v58 = (void *)v13;
  uint64_t v55 = v22;
  if (![v7 hasPropertyWithName:@"STATUS"])
  {
LABEL_24:
    uint64_t v35 = 0;
    goto LABEL_25;
  }
  uint64_t v31 = objc_msgSend(v7, "propertyForName:", @"STATUS", v22, v18, v13);
  char v32 = [v31 singleValue];
  uint64_t v33 = [v32 value];
  uint64_t v34 = [v33 unsignedIntegerValue];

  if (v34)
  {
    if (v34 != 7)
    {
      if (v34 == 1)
      {
        uint64_t v35 = 1;
        goto LABEL_25;
      }
      goto LABEL_24;
    }
    uint64_t v35 = 3;
  }
  else
  {
    uint64_t v35 = 2;
  }
LABEL_25:
  -[EKEvent setStatus:](self, "setStatus:", v35, v55);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v36 = [v7 propertyForName:@"ATTENDEE"];
  long long v37 = [v36 values];

  uint64_t v38 = [v37 countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v65 != v40) {
          objc_enumerationMutation(v37);
        }
        long long v42 = [*(id *)(*((void *)&v64 + 1) + 8 * i) value];
        long long v43 = +[EKAttendee attendeeWithName:0 url:v42];
        [(EKCalendarItem *)self addAttendee:v43];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v64 objects:v70 count:16];
    }
    while (v39);
  }

  long long v44 = [v7 propertyForName:@"EXDATE"];
  long long v45 = [v44 values];

  long long v46 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v45, "count"));
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v47 = v45;
  uint64_t v48 = [v47 countByEnumeratingWithState:&v60 objects:v69 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v61;
    do
    {
      for (uint64_t j = 0; j != v49; ++j)
      {
        if (*(void *)v61 != v50) {
          objc_enumerationMutation(v47);
        }
        uint64_t v52 = [*(id *)(*((void *)&v60 + 1) + 8 * j) value];
        uint64_t v53 = [v52 nsDateWithLocalTimeZone:0];
        [v46 addObject:v53];
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v60 objects:v69 count:16];
    }
    while (v49);
  }

  [(EKCalendarItem *)self setExceptionDates:v46];
  uint64_t v54 = [(EKObject *)self eventStore];
  [v54 saveEvent:self span:1 commit:0 error:0];
}

- (id)_ekRecurrenceRuleFromVCSRecurrenceRule:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = 0;
    switch([v3 recurrenceType])
    {
      case 0:
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
          -[EKEvent _ekRecurrenceRuleFromVCSRecurrenceRule:]();
        }
        goto LABEL_7;
      case 2:
        uint64_t v5 = 1;
        break;
      case 3:
      case 4:
        uint64_t v5 = 2;
        break;
      case 5:
      case 6:
        uint64_t v5 = 3;
        break;
      default:
        break;
    }
    uint64_t v33 = v5;
    if ([v4 hasDuration] && objc_msgSend(v4, "duration") >= 1)
    {
      char v32 = -[EKRecurrenceEnd initWithOccurrenceCount:]([EKRecurrenceEnd alloc], "initWithOccurrenceCount:", [v4 duration]);
    }
    else
    {
      id v7 = [v4 endDate];

      if (v7)
      {
        id v8 = [v4 endDate];
        int v9 = [v8 nsDateWithLocalTimeZone:0];

        char v32 = [[EKRecurrenceEnd alloc] initWithEndDate:v9];
      }
      else
      {
        char v32 = 0;
      }
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA48];
    id v11 = [v4 weekdayList];
    uint64_t v12 = objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v11, "count"));

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = [v4 weekdayList];
    uint64_t v13 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v44;
      uint64_t v34 = *(void *)v44;
      uint64_t v35 = v4;
      do
      {
        uint64_t v16 = 0;
        uint64_t v36 = v14;
        do
        {
          if (*(void *)v44 != v15) {
            objc_enumerationMutation(obj);
          }
          int v17 = *(void **)(*((void *)&v43 + 1) + 8 * v16);
          BOOL v18 = [v4 occurrenceList];
          uint64_t v19 = [v18 count];

          if (v19)
          {
            long long v41 = 0u;
            long long v42 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            long long v20 = [v4 occurrenceList];
            uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v38 = v16;
              uint64_t v23 = *(void *)v40;
              do
              {
                for (uint64_t i = 0; i != v22; ++i)
                {
                  if (*(void *)v40 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  uint64_t v25 = +[EKRecurrenceDayOfWeek dayOfWeek:weekNumber:](EKRecurrenceDayOfWeek, "dayOfWeek:weekNumber:", objc_msgSend((id)objc_opt_class(), "ekWeekDayFromVCSWeekDay:", objc_msgSend(v17, "unsignedIntegerValue")), objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * i), "integerValue"));
                  [v12 addObject:v25];
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
              }
              while (v22);
              uint64_t v15 = v34;
              id v4 = v35;
              uint64_t v14 = v36;
              uint64_t v16 = v38;
            }
          }
          else
          {
            long long v20 = +[EKRecurrenceDayOfWeek dayOfWeek:](EKRecurrenceDayOfWeek, "dayOfWeek:", objc_msgSend((id)objc_opt_class(), "ekWeekDayFromVCSWeekDay:", objc_msgSend(v17, "unsignedIntegerValue")));
            [v12 addObject:v20];
          }

          ++v16;
        }
        while (v16 != v14);
        uint64_t v14 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v14);
    }

    id v26 = [EKRecurrenceRule alloc];
    uint64_t v27 = [v4 interval];
    uint64_t v28 = [v4 dayNumberList];
    uint64_t v29 = [v4 monthList];
    uint64_t v30 = [v4 dayList];
    id v6 = [(EKRecurrenceRule *)v26 initRecurrenceWithFrequency:v33 interval:v27 daysOfTheWeek:v12 daysOfTheMonth:v28 monthsOfTheYear:v29 weeksOfTheYear:0 daysOfTheYear:v30 setPositions:0 end:v32];
  }
  else
  {
LABEL_7:
    id v6 = 0;
  }

  return v6;
}

+ (int64_t)ekWeekDayFromVCSWeekDay:(unint64_t)a3
{
  if (a3 - 1 < 6) {
    return a3 + 1;
  }
  else {
    return 1;
  }
}

- (NSString)birthdayPersonUniqueID
{
  return self->_birthdayPersonUniqueID;
}

- (void)setOriginalOccurrenceStartDate:(id)a3
{
}

- (void)setOriginalOccurrenceEndDate:(id)a3
{
}

- (NSNumber)originalOccurrenceIsAllDay
{
  return self->_originalOccurrenceIsAllDay;
}

- (void)setOriginalOccurrenceIsAllDay:(id)a3
{
}

- (BOOL)requiresDetachDueToSnoozedAlarm
{
  return self->_requiresDetachDueToSnoozedAlarm;
}

- (void)setRequiresDetachDueToSnoozedAlarm:(BOOL)a3
{
  self->_requiresDetachDueToSnoozedAlaruint64_t m = a3;
}

- (int)clearModifiedFlags
{
  return self->_clearModifiedFlags;
}

- (void)setClearModifiedFlags:(int)a3
{
  self->_clearModifiedFlags = a3;
}

- (void)setIsOriginalItemPhantom:(BOOL)a3
{
  self->_isOriginalItemPhantouint64_t m = a3;
}

- (BOOL)preventConferenceURLDetection
{
  return self->_preventConferenceURLDetection;
}

- (void)setPreventConferenceURLDetection:(BOOL)a3
{
  self->_preventConferenceURLDetectiouint64_t n = a3;
}

- (NSString)showEventURLString
{
  return self->_showEventURLString;
}

- (BOOL)isMainOccurrence
{
  return self->_isMainOccurrence;
}

- (void)setVirtualConferenceTextRepresentation:(id)a3
{
}

void __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __43__EKEvent_EKEvent_Shared__cachedJunkStatus__block_invoke_cold_5(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_DEBUG, "(cachedJunkStatus) junkStatus was set on the event to %d", (uint8_t *)v2, 8u);
}

- (void)initWithEventStore:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "API MISUSE: nil event store used in initialization of EKEvent instance", v2, v3, v4, v5, v6);
}

- (void)setProposedStartDate:(void *)a1 .cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5() privacyDescription];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1A4E47000, v1, OS_LOG_TYPE_ERROR, "Tried to set proposed start date on invalid event: %@", v4, 0xCu);
}

- (void)_updatePredictedLocationCacheIfNeededHoldingLock
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5() privacyDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_10_0(&dword_1A4E47000, v4, v5, "Beginning location prediction for event: %@", v6, v7, v8, v9, v10);
}

+ (void)_updatedPredictedLocationRespectingTimeoutBudgetForEvent:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_1A4E47000, v0, OS_LOG_TYPE_DEBUG, "LocationPrediction: Not attempting prediction due to past timeouts", v1, 2u);
}

+ (void)_updatedPredictedLocationRespectingTimeoutBudgetForEvent:(uint64_t)a3 error:(uint64_t)a4 .cold.2(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 134218240;
  uint64_t v5 = remainingTimeout;
  __int16 v6 = 2048;
  double v7 = *(double *)&remainingTimeout - a2;
  OUTLINED_FUNCTION_4_2(&dword_1A4E47000, a1, a4, "LocationPrediction: Updating timeout from %f to %f", (uint8_t *)&v4);
}

+ (void)_updatedPredictedLocationRespectingTimeoutBudgetForEvent:(uint64_t)a3 error:(double)a4 .cold.3(char a1, NSObject *a2, uint64_t a3, double a4)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = &stru_1EF932508;
  if ((a1 & 1) == 0) {
    int v4 = @"NOT ";
  }
  int v5 = 138412546;
  __int16 v6 = v4;
  __int16 v7 = 2048;
  double v8 = a4;
  OUTLINED_FUNCTION_4_2(&dword_1A4E47000, a2, a3, "LocationPrediction: this is %@the main thread. Using timeout %f", (uint8_t *)&v5);
}

void __74__EKEvent__updatedPredictedLocationRespectingTimeoutBudgetForEvent_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_1A4E47000, v0, OS_LOG_TYPE_DEBUG, "LocationPrediction: Reset timeout", v1, 2u);
}

- (void)_hasRecurrenceRuleChangeRequiringSpanAll
{
  id v5 = a1;
  __int16 v6 = [a2 recurrenceRules];
  [v6 count];
  [a3 count];
  OUTLINED_FUNCTION_7_0();
  _os_log_error_impl(v7, v8, v9, v10, v11, 0xEu);
}

- (void)_duplicateAddedAttachmentsToDetachedEvents:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  [a2 count];
  [a3 count];
  OUTLINED_FUNCTION_7_0();
  _os_log_error_impl(v6, v7, v8, v9, v10, 0x20u);
}

- (void)_adjustAvailabilityAfterMovingOrCopyingFromCalendar:toCalendar:.cold.1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getkSuggestionsEKEventAvailabilityState(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKEvent.m", 110, @"%s", dlerror());

  __break(1u);
}

void __116__EKEvent__adjustAttachmentsAfterMovingOrCopyingFromCalendar_toCalendar_cachedConstraintsForOldCalendar_savingItem___block_invoke_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Couldn't copy attachment file, so we're just going to have to remove the attachment from the moved event", buf, 2u);
}

- (void)updateEventToEvent:commit:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "-[EKEvent updateEventToEvent:] saved itself correctly [%@]", v2, v3, v4, v5, v6);
}

- (void)updateEventToEvent:commit:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "-[EKEvent updateEventToEvent:] failed to save with error: %@", v2, v3, v4, v5, v6);
}

- (void)updateEventToEvent:commit:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_2(&dword_1A4E47000, v0, (uint64_t)v0, "-[EKEvent updateEventToEvent:] is about to save itself [%@] with EKSuggestedEventInfo [%@]", v1);
}

- (void)updateEventToEvent:commit:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "-[EKEvent updateEventToEvent:] was called on an event without a EKSuggestedEventInfo: %@", v2, v3, v4, v5, v6);
}

- (void)updateEventToEvent:commit:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "-[EKEvent updateEventToEvent:] CANCEL finished correctly [%@], now attempting to save", v2, v3, v4, v5, v6);
}

- (void)updateEventToEvent:commit:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "-[EKEvent updateEventToEvent:] CANCEL failed with error: %@", v2, v3, v4, v5, v6);
}

- (void)updateEventToEvent:commit:.cold.9()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_2(&dword_1A4E47000, v0, (uint64_t)v0, "-[EKEvent updateEventToEvent:] was given a nil event and will CANCEL itself [%@] with EKSuggestedEventInfo [%@]", v1);
}

- (void)setRecurrenceRuleFromICSString:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Could not parse ICS recurrence rule: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_ekRecurrenceRuleFromICSRecurrenceRule:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "Could not construct EKRecurrenceRule from ICS recurrence rule", v2, v3, v4, v5, v6);
}

- (void)_ekRecurrenceRuleFromVCSRecurrenceRule:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "@Unknown recurrence type", v2, v3, v4, v5, v6);
}

@end