@interface BBBulletin
+ (BOOL)supportsSecureCoding;
+ (id)_lifeAssertionAssociationSet;
+ (id)_observerAssociationSet;
+ (id)bulletinReferenceDateFromDate:(id)a3;
+ (id)bulletinWithBulletin:(id)a3;
+ (id)validSortDescriptorsFromSortDescriptors:(id)a3;
+ (void)vetSortDescriptor:(id)a3;
- (BBAccessoryIcon)accessoryIconMask;
- (BBAction)acknowledgeAction;
- (BBAction)alternateAction;
- (BBAction)defaultAction;
- (BBAction)expireAction;
- (BBAction)followActivityAction;
- (BBAction)raiseAction;
- (BBAction)snoozeAction;
- (BBAttachmentMetadata)primaryAttachment;
- (BBBulletin)init;
- (BBBulletin)initWithCoder:(id)a3;
- (BBCommunicationContext)communicationContext;
- (BBContent)content;
- (BBContent)modalAlertContent;
- (BBContent)starkBannerContent;
- (BBImage)accessoryImage;
- (BBSectionIcon)icon;
- (BBSectionIcon)sectionIcon;
- (BBSound)sound;
- (BOOL)allowsAddingToLockScreenWhenUnlocked;
- (BOOL)allowsAutomaticRemovalFromLockScreen;
- (BOOL)allowsPersistentBannersInCarPlay;
- (BOOL)allowsSupplementaryActionsInCarPlay;
- (BOOL)canBeSilencedByMenuButtonPress;
- (BOOL)clearable;
- (BOOL)coalescesWhenLocked;
- (BOOL)dateIsAllDay;
- (BOOL)displaysActionsInline;
- (BOOL)expiresOnPublisherDeath;
- (BOOL)hasCriticalIcon;
- (BOOL)hasEventDate;
- (BOOL)hasPrivateContent;
- (BOOL)hasSubordinateIcon;
- (BOOL)hideDismissActionInCarPlay;
- (BOOL)ignoresDowntime;
- (BOOL)ignoresQuietMode;
- (BOOL)inertWhenLocked;
- (BOOL)isCallNotification;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighlight;
- (BOOL)isLoading;
- (BOOL)isMessagingNotification;
- (BOOL)orderSectionUsingRecencyDate;
- (BOOL)playsMediaWhenRaised;
- (BOOL)playsSoundForModify;
- (BOOL)preemptsPresentedAlert;
- (BOOL)preservesUnlockActionCase;
- (BOOL)preventAutomaticRemovalFromLockScreen;
- (BOOL)preventLock;
- (BOOL)prioritizeAtTopOfLockScreen;
- (BOOL)revealsAdditionalContentOnPresentation;
- (BOOL)screenCaptureProhibited;
- (BOOL)shouldDismissBulletinWhenClosed;
- (BOOL)showsContactPhoto;
- (BOOL)showsDateInFloatingLockScreenAlert;
- (BOOL)showsMessagePreview;
- (BOOL)showsSubtitle;
- (BOOL)showsUnreadIndicatorForNoticesFeed;
- (BOOL)suppressDelayForForwardedBulletins;
- (BOOL)suppressPresentationInAmbient;
- (BOOL)suppressesAlertsWhenAppIsActive;
- (BOOL)suppressesMessageForPrivacy;
- (BOOL)suppressesTitle;
- (BOOL)turnsOnDisplay;
- (BOOL)usesExternalSync;
- (BOOL)usesVariableLayout;
- (BOOL)visuallyIndicatesWhenDateIsInFuture;
- (BOOL)wantsFullscreenPresentation;
- (DNDClientEventBehavior)eventBehavior;
- (NSArray)additionalAttachments;
- (NSArray)buttons;
- (NSArray)intentIDs;
- (NSArray)peopleIDs;
- (NSAttributedString)attributedMessage;
- (NSAttributedString)summary;
- (NSAttributedString)threadSummary;
- (NSDate)date;
- (NSDate)endDate;
- (NSDate)expirationDate;
- (NSDate)lastInterruptDate;
- (NSDate)publicationDate;
- (NSDate)recencyDate;
- (NSDictionary)context;
- (NSMutableDictionary)actions;
- (NSMutableDictionary)supplementaryActionsByLayout;
- (NSSet)alertSuppressionAppIDs;
- (NSSet)alertSuppressionAppIDs_deprecated;
- (NSSet)alertSuppressionContexts;
- (NSSet)subsectionIDs;
- (NSString)alternateActionLabel;
- (NSString)bannerAccessoryRemoteServiceBundleIdentifier;
- (NSString)bannerAccessoryRemoteViewControllerClassName;
- (NSString)bulletinID;
- (NSString)bulletinVersionID;
- (NSString)categoryID;
- (NSString)contentType;
- (NSString)dismissalID;
- (NSString)filterCriteria;
- (NSString)footer;
- (NSString)fullAlternateActionLabel;
- (NSString)fullUnlockActionLabel;
- (NSString)header;
- (NSString)hiddenPreviewsBodyPlaceholder;
- (NSString)message;
- (NSString)missedBannerDescriptionFormat;
- (NSString)parentSectionID;
- (NSString)publisherBulletinID;
- (NSString)publisherMatchID;
- (NSString)recordID;
- (NSString)secondaryContentRemoteServiceBundleIdentifier;
- (NSString)secondaryContentRemoteViewControllerClassName;
- (NSString)sectionBundlePath;
- (NSString)sectionDisplayName;
- (NSString)sectionID;
- (NSString)speechLanguage;
- (NSString)spotlightIdentifier;
- (NSString)subtitle;
- (NSString)subtypeSummaryFormat;
- (NSString)summaryArgument;
- (NSString)threadID;
- (NSString)title;
- (NSString)topic;
- (NSString)universalSectionID;
- (NSString)unlockActionLabel;
- (NSString)unlockActionLabelOverride;
- (NSTimeZone)timeZone;
- (float)relevanceScore;
- (id)_actionKeyForType:(int64_t)a3;
- (id)_actionWithID:(id)a3 fromActions:(id)a4;
- (id)_allActions;
- (id)_allSupplementaryActions;
- (id)_responseForAction:(id)a3;
- (id)_safeDescription:(BOOL)a3;
- (id)_sectionParameters;
- (id)_sectionSubtypeParameters;
- (id)actionForResponse:(id)a3;
- (id)actionWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dismissAction;
- (id)firstValidObserver;
- (id)lifeAssertions;
- (id)responseForAcknowledgeAction;
- (id)responseForAction:(id)a3;
- (id)responseForButtonActionAtIndex:(unint64_t)a3;
- (id)responseForDefaultAction;
- (id)responseForExpireAction;
- (id)responseForRaiseAction;
- (id)responseForSnoozeAction;
- (id)responseSendBlock;
- (id)safeDescription;
- (id)shortDescription;
- (id)silenceAction;
- (id)supplementaryActions;
- (id)supplementaryActionsForLayout:(int64_t)a3;
- (id)syncHash;
- (id)toUNCBulletin;
- (int64_t)backgroundStyle;
- (int64_t)contentPreviewSetting;
- (int64_t)dateFormatStyle;
- (int64_t)iPodOutAlertType;
- (int64_t)lockScreenPriority;
- (int64_t)primaryAttachmentType;
- (int64_t)sectionSubtype;
- (unint64_t)counter;
- (unint64_t)expirationEvents;
- (unint64_t)hash;
- (unint64_t)interruptionLevel;
- (unint64_t)messageNumberOfLines;
- (unint64_t)notificationSummaryStatus;
- (unint64_t)numberOfAdditionalAttachments;
- (unint64_t)numberOfAdditionalAttachmentsOfType:(int64_t)a3;
- (unint64_t)priorityNotificationStatus;
- (unint64_t)privacySettings;
- (unint64_t)realertCount;
- (unint64_t)subtypePriority;
- (unint64_t)summaryArgumentCount;
- (void)_fillOutCopy:(id)a3 withZone:(_NSZone *)a4;
- (void)addLifeAssertion:(id)a3;
- (void)addObserver:(id)a3;
- (void)copyAssociationsForBulletin:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryIconMask:(id)a3;
- (void)setAccessoryImage:(id)a3;
- (void)setAcknowledgeAction:(id)a3;
- (void)setActions:(id)a3;
- (void)setAdditionalAttachments:(id)a3;
- (void)setAlertSuppressionAppIDs_deprecated:(id)a3;
- (void)setAlertSuppressionContexts:(id)a3;
- (void)setAlternateAction:(id)a3;
- (void)setAttributedMessage:(id)a3;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setBulletinID:(id)a3;
- (void)setBulletinVersionID:(id)a3;
- (void)setButtons:(id)a3;
- (void)setCategoryID:(id)a3;
- (void)setClearable:(BOOL)a3;
- (void)setCommunicationContext:(id)a3;
- (void)setContent:(id)a3;
- (void)setContentPreviewSetting:(int64_t)a3;
- (void)setContentType:(id)a3;
- (void)setContext:(id)a3;
- (void)setCounter:(unint64_t)a3;
- (void)setDate:(id)a3;
- (void)setDateFormatStyle:(int64_t)a3;
- (void)setDateIsAllDay:(BOOL)a3;
- (void)setDefaultAction:(id)a3;
- (void)setDismissAction:(id)a3;
- (void)setDismissalID:(id)a3;
- (void)setDisplaysActionsInline:(BOOL)a3;
- (void)setEndDate:(id)a3;
- (void)setEventBehavior:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setExpirationEvents:(unint64_t)a3;
- (void)setExpireAction:(id)a3;
- (void)setExpiresOnPublisherDeath:(BOOL)a3;
- (void)setFilterCriteria:(id)a3;
- (void)setFollowActivityAction:(id)a3;
- (void)setFooter:(id)a3;
- (void)setHasCriticalIcon:(BOOL)a3;
- (void)setHasEventDate:(BOOL)a3;
- (void)setHasPrivateContent:(BOOL)a3;
- (void)setHasSubordinateIcon:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIgnoresDowntime:(BOOL)a3;
- (void)setIgnoresQuietMode:(BOOL)a3;
- (void)setIntentIDs:(id)a3;
- (void)setInterruptionLevel:(unint64_t)a3;
- (void)setIsHighlight:(BOOL)a3;
- (void)setLastInterruptDate:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setLockScreenPriority:(int64_t)a3;
- (void)setMessage:(id)a3;
- (void)setModalAlertContent:(id)a3;
- (void)setNotificationSummaryStatus:(unint64_t)a3;
- (void)setParentSectionID:(id)a3;
- (void)setPeopleIDs:(id)a3;
- (void)setPreemptsPresentedAlert:(BOOL)a3;
- (void)setPreventAutomaticRemovalFromLockScreen:(BOOL)a3;
- (void)setPrimaryAttachment:(id)a3;
- (void)setPriorityNotificationStatus:(unint64_t)a3;
- (void)setPublicationDate:(id)a3;
- (void)setPublisherBulletinID:(id)a3;
- (void)setRaiseAction:(id)a3;
- (void)setRealertCount:(unint64_t)a3;
- (void)setRecencyDate:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setRelevanceScore:(float)a3;
- (void)setScreenCaptureProhibited:(BOOL)a3;
- (void)setSectionBundlePath:(id)a3;
- (void)setSectionID:(id)a3;
- (void)setSectionSubtype:(int64_t)a3;
- (void)setShowsMessagePreview:(BOOL)a3;
- (void)setSilenceAction:(id)a3;
- (void)setSnoozeAction:(id)a3;
- (void)setSound:(id)a3;
- (void)setSpeechLanguage:(id)a3;
- (void)setSpotlightIdentifier:(id)a3;
- (void)setStarkBannerContent:(id)a3;
- (void)setSubsectionIDs:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSummary:(id)a3;
- (void)setSummaryArgument:(id)a3;
- (void)setSummaryArgumentCount:(unint64_t)a3;
- (void)setSupplementaryActionsByLayout:(id)a3;
- (void)setThreadID:(id)a3;
- (void)setThreadSummary:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTurnsOnDisplay:(BOOL)a3;
- (void)setUniversalSectionID:(id)a3;
- (void)setUnlockActionLabelOverride:(id)a3;
- (void)setUsesExternalSync:(BOOL)a3;
- (void)setWantsFullscreenPresentation:(BOOL)a3;
@end

@implementation BBBulletin

+ (void)vetSortDescriptor:(id)a3
{
  v12[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v10 = v3;
  if (vetSortDescriptor__onceToken != -1)
  {
    dispatch_once(&vetSortDescriptor__onceToken, &__block_literal_global);
    id v3 = v10;
  }
  v4 = [v3 key];
  if (([(id)vetSortDescriptor__sKeyAllowedList containsObject:v4] & 1) == 0)
  {
    v5 = (void *)MEMORY[0x263EFF940];
    uint64_t v6 = *MEMORY[0x263EFF4A0];
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid sort descriptor key passed from BBDataProvider: %@; Only the following keys may be used: %@",
      v4,
    v7 = vetSortDescriptor__sKeyAllowedList);
    v11[0] = @"sortDescriptor";
    v11[1] = @"offendingKey";
    v12[0] = v10;
    v12[1] = v4;
    v11[2] = @"allowedKeys";
    v12[2] = vetSortDescriptor__sKeyAllowedList;
    v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
    id v9 = [v5 exceptionWithName:v6 reason:v7 userInfo:v8];

    objc_exception_throw(v9);
  }
}

uint64_t __32__BBBulletin_vetSortDescriptor___block_invoke()
{
  vetSortDescriptor__sKeyAllowedList = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:&unk_26C7ABB48];
  return MEMORY[0x270F9A758]();
}

+ (id)validSortDescriptorsFromSortDescriptors:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        +[BBBulletin vetSortDescriptor:v9];
        [v9 allowEvaluation];
        [v4 addObject:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)bulletinWithBulletin:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(BBBulletin);
  [v3 _fillOutCopy:v4 withZone:MEMORY[0x21D449CA0]()];

  return v4;
}

+ (id)bulletinReferenceDateFromDate:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263EFF918];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDay:-7];
  uint64_t v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v7 = [v6 dateByAddingComponents:v5 toDate:v4 options:0];

  return v7;
}

- (BBBulletin)init
{
  v8.receiver = self;
  v8.super_class = (Class)BBBulletin;
  v2 = [(BBBulletin *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v4 = (void *)*((void *)v2 + 38);
    *((void *)v2 + 38) = v3;

    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v6 = (void *)*((void *)v2 + 39);
    *((void *)v2 + 39) = v5;

    *(_WORD *)(v2 + 13) = 257;
    *((_OWORD *)v2 + 9) = xmmword_2176FF850;
    *((_DWORD *)v2 + 7) = 0;
  }
  return (BBBulletin *)v2;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = [a2 bulletinID];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_debug_impl(&dword_217675000, v3, OS_LOG_TYPE_DEBUG, "Deallocating %@", (uint8_t *)&v5, 0xCu);
}

- (unint64_t)hash
{
  v126 = [(BBBulletin *)self bulletinID];
  uint64_t v3 = [v126 hash];
  v125 = [(BBBulletin *)self bulletinVersionID];
  uint64_t v4 = [v125 hash] ^ v3;
  v124 = [(BBBulletin *)self sectionID];
  uint64_t v5 = [v124 hash];
  v123 = [(BBBulletin *)self sectionBundlePath];
  uint64_t v6 = v4 ^ v5 ^ [v123 hash];
  v122 = [(BBBulletin *)self universalSectionID];
  uint64_t v7 = [v122 hash];
  v121 = [(BBBulletin *)self parentSectionID];
  uint64_t v8 = v7 ^ [v121 hash];
  v120 = [(BBBulletin *)self subsectionIDs];
  uint64_t v9 = v6 ^ v8 ^ [v120 hash];
  v119 = [(BBBulletin *)self recordID];
  uint64_t v10 = [v119 hash];
  v118 = [(BBBulletin *)self publisherBulletinID];
  uint64_t v11 = v10 ^ [v118 hash];
  v117 = [(BBBulletin *)self dismissalID];
  uint64_t v12 = v11 ^ [v117 hash];
  v116 = [(BBBulletin *)self categoryID];
  uint64_t v13 = v9 ^ v12 ^ [v116 hash];
  v115 = [(BBBulletin *)self threadID];
  uint64_t v14 = [v115 hash];
  v114 = [(BBBulletin *)self eventBehavior];
  uint64_t v15 = v14 ^ [v114 hash];
  uint64_t v16 = v15 ^ [(BBBulletin *)self isHighlight];
  unint64_t v17 = v16 ^ [(BBBulletin *)self priorityNotificationStatus];
  unint64_t v18 = v13 ^ v17 ^ [(BBBulletin *)self notificationSummaryStatus];
  int64_t v19 = [(BBBulletin *)self sectionSubtype];
  v113 = [(BBBulletin *)self intentIDs];
  uint64_t v20 = v19 ^ [v113 hash];
  unint64_t v21 = v20 ^ [(BBBulletin *)self counter];
  unint64_t v22 = v21 ^ [(BBBulletin *)self interruptionLevel];
  int64_t v23 = v22 ^ [(BBBulletin *)self contentPreviewSetting];
  v112 = [(BBBulletin *)self content];
  uint64_t v24 = v18 ^ v23 ^ [v112 hash];
  v111 = [(BBBulletin *)self communicationContext];
  uint64_t v25 = [v111 hash];
  v110 = [(BBBulletin *)self modalAlertContent];
  uint64_t v26 = v25 ^ [v110 hash];
  v109 = [(BBBulletin *)self starkBannerContent];
  uint64_t v27 = v26 ^ [v109 hash];
  v108 = [(BBBulletin *)self summaryArgument];
  uint64_t v28 = v27 ^ [v108 hash];
  unint64_t v29 = v28 ^ [(BBBulletin *)self summaryArgumentCount];
  v107 = [(BBBulletin *)self icon];
  uint64_t v30 = v29 ^ [v107 hash];
  uint64_t v31 = v24 ^ v30 ^ [(BBBulletin *)self hasCriticalIcon];
  uint64_t v32 = [(BBBulletin *)self hasSubordinateIcon];
  uint64_t v33 = v32 ^ [(BBBulletin *)self hasEventDate];
  v106 = [(BBBulletin *)self date];
  uint64_t v34 = v33 ^ [v106 hash];
  v105 = [(BBBulletin *)self endDate];
  uint64_t v35 = v34 ^ [v105 hash];
  v104 = [(BBBulletin *)self recencyDate];
  uint64_t v36 = v35 ^ [v104 hash];
  int64_t v37 = v36 ^ [(BBBulletin *)self dateFormatStyle];
  int64_t v38 = v31 ^ v37 ^ [(BBBulletin *)self dateIsAllDay];
  v103 = [(BBBulletin *)self timeZone];
  uint64_t v39 = [v103 hash];
  v102 = [(BBBulletin *)self accessoryIconMask];
  uint64_t v40 = v39 ^ [v102 hash];
  v101 = [(BBBulletin *)self accessoryImage];
  uint64_t v41 = v40 ^ [v101 hash];
  uint64_t v42 = v41 ^ [(BBBulletin *)self clearable];
  v100 = [(BBBulletin *)self sound];
  uint64_t v43 = v42 ^ [v100 hash];
  uint64_t v44 = v43 ^ [(BBBulletin *)self turnsOnDisplay];
  v99 = [(BBBulletin *)self primaryAttachment];
  uint64_t v45 = v44 ^ [v99 hash];
  v98 = [(BBBulletin *)self additionalAttachments];
  uint64_t v46 = v45 ^ [v98 hash];
  v97 = [(BBBulletin *)self unlockActionLabelOverride];
  uint64_t v47 = v38 ^ v46 ^ [v97 hash];
  uint64_t v48 = [(BBBulletin *)self wantsFullscreenPresentation];
  uint64_t v49 = v48 ^ [(BBBulletin *)self ignoresQuietMode];
  uint64_t v50 = v49 ^ [(BBBulletin *)self ignoresDowntime];
  uint64_t v51 = v50 ^ [(BBBulletin *)self preemptsPresentedAlert];
  uint64_t v52 = v51 ^ [(BBBulletin *)self displaysActionsInline];
  v96 = [(BBBulletin *)self actions];
  uint64_t v53 = v52 ^ [v96 hash];
  v94 = [(BBBulletin *)self buttons];
  uint64_t v54 = v53 ^ [v94 hash];
  v93 = [(BBBulletin *)self supplementaryActionsByLayout];
  uint64_t v55 = v54 ^ [v93 hash];
  v92 = [(BBBulletin *)self alertSuppressionContexts];
  uint64_t v56 = v47 ^ v55 ^ [v92 hash];
  v91 = [(BBBulletin *)self context];
  uint64_t v57 = [v91 hash];
  v90 = [(BBBulletin *)self expirationDate];
  uint64_t v58 = v57 ^ [v90 hash];
  unint64_t v59 = v58 ^ [(BBBulletin *)self expirationEvents];
  v89 = [(BBBulletin *)self lastInterruptDate];
  uint64_t v60 = v59 ^ [v89 hash];
  v88 = [(BBBulletin *)self publicationDate];
  uint64_t v61 = v60 ^ [v88 hash];
  uint64_t v62 = v61 ^ [(BBBulletin *)self usesExternalSync];
  uint64_t v63 = v62 ^ [(BBBulletin *)self isLoading];
  uint64_t v64 = v63 ^ [(BBBulletin *)self preventAutomaticRemovalFromLockScreen];
  int64_t v65 = v64 ^ [(BBBulletin *)self lockScreenPriority];
  int64_t v66 = v65 ^ [(BBBulletin *)self backgroundStyle];
  v67 = [(BBBulletin *)self header];
  uint64_t v95 = v56 ^ v66 ^ [v67 hash];
  v68 = [(BBBulletin *)self footer];
  uint64_t v69 = [v68 hash];
  v70 = [(BBBulletin *)self threadSummary];
  uint64_t v71 = v69 ^ [v70 hash];
  v72 = [(BBBulletin *)self spotlightIdentifier];
  uint64_t v73 = v71 ^ [v72 hash];
  unint64_t v74 = v73 ^ [(BBBulletin *)self realertCount];
  v75 = [(BBBulletin *)self alertSuppressionAppIDs_deprecated];
  uint64_t v76 = v74 ^ [v75 hash];
  v77 = [(BBBulletin *)self contentType];
  uint64_t v78 = v76 ^ [v77 hash];
  uint64_t v79 = v78 ^ [(BBBulletin *)self screenCaptureProhibited];
  v80 = NSNumber;
  [(BBBulletin *)self relevanceScore];
  v81 = objc_msgSend(v80, "numberWithFloat:");
  uint64_t v82 = v79 ^ [v81 hash];
  v83 = [(BBBulletin *)self filterCriteria];
  uint64_t v84 = v82 ^ [v83 hash];

  v85 = [(BBBulletin *)self speechLanguage];
  unint64_t v86 = v95 ^ v84 ^ [v85 hash];

  return v86;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (BBBulletin *)a3;
  if (self == v4)
  {
    char v46 = 1;
    goto LABEL_136;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v46 = 0;
    goto LABEL_136;
  }
  uint64_t v5 = v4;
  uint64_t v6 = [(BBBulletin *)self bulletinID];
  v224 = [(BBBulletin *)v5 bulletinID];
  v225 = (void *)v6;
  int v7 = BSEqualObjects();
  int v223 = v7;
  if (!v7
    || ([(BBBulletin *)self bulletinVersionID],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [(BBBulletin *)v5 bulletinVersionID],
        v200 = (void *)v9,
        v199 = objc_claimAutoreleasedReturnValue(),
        (int v7 = BSEqualObjects()) == 0))
  {
    long long v222 = 0uLL;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    long long v219 = 0uLL;
    uint64_t v213 = 0;
    uint64_t v214 = 0;
    uint64_t v217 = 0;
    int v212 = 0;
    int v206 = 0;
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v50 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    goto LABEL_40;
  }
  uint64_t v10 = [(BBBulletin *)self sectionID];
  [(BBBulletin *)v5 sectionID];
  v196 = v197 = (void *)v10;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    *(void *)((char *)&v222 + 4) = 0;
    LODWORD(v222) = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    long long v219 = 0uLL;
    uint64_t v213 = 0;
    uint64_t v214 = 0;
    uint64_t v217 = 0;
    int v212 = 0;
    int v206 = 0;
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v50 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    HIDWORD(v222) = 1;
    goto LABEL_40;
  }
  uint64_t v11 = [(BBBulletin *)self sectionBundlePath];
  [(BBBulletin *)v5 sectionBundlePath];
  v194 = v195 = (void *)v11;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    *(void *)&long long v222 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    long long v219 = 0uLL;
    uint64_t v213 = 0;
    uint64_t v214 = 0;
    uint64_t v217 = 0;
    int v212 = 0;
    int v206 = 0;
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v50 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    goto LABEL_40;
  }
  uint64_t v12 = [(BBBulletin *)self universalSectionID];
  [(BBBulletin *)v5 universalSectionID];
  v192 = v193 = (void *)v12;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    *(void *)&long long v222 = 0x100000000;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    long long v219 = 0uLL;
    uint64_t v213 = 0;
    uint64_t v214 = 0;
    uint64_t v217 = 0;
    int v212 = 0;
    int v206 = 0;
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v50 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    goto LABEL_40;
  }
  uint64_t v13 = [(BBBulletin *)self parentSectionID];
  [(BBBulletin *)v5 parentSectionID];
  v190 = v191 = (void *)v13;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    long long v219 = 0uLL;
    uint64_t v213 = 0;
    uint64_t v214 = 0;
    uint64_t v217 = 0;
    int v212 = 0;
    int v206 = 0;
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v50 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    goto LABEL_40;
  }
  uint64_t v14 = [(BBBulletin *)self subsectionIDs];
  [(BBBulletin *)v5 subsectionIDs];
  v188 = v189 = (void *)v14;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v48 = 0;
    int v49 = 0;
    long long v219 = 0uLL;
    uint64_t v213 = 0;
    uint64_t v214 = 0;
    uint64_t v217 = 0;
    int v212 = 0;
    int v206 = 0;
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v50 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    goto LABEL_40;
  }
  uint64_t v15 = [(BBBulletin *)self recordID];
  [(BBBulletin *)v5 recordID];
  v186 = v187 = (void *)v15;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v49 = 0;
    long long v219 = 0uLL;
    uint64_t v213 = 0;
    uint64_t v214 = 0;
    uint64_t v217 = 0;
    int v212 = 0;
    int v206 = 0;
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v50 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    goto LABEL_40;
  }
  uint64_t v16 = [(BBBulletin *)self publisherBulletinID];
  [(BBBulletin *)v5 publisherBulletinID];
  v184 = v185 = (void *)v16;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    long long v219 = 0uLL;
    uint64_t v213 = 0;
    uint64_t v214 = 0;
    uint64_t v217 = 0;
    int v212 = 0;
    int v206 = 0;
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v50 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    goto LABEL_40;
  }
  uint64_t v17 = [(BBBulletin *)self dismissalID];
  [(BBBulletin *)v5 dismissalID];
  v182 = v183 = (void *)v17;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    *(void *)&long long v219 = 0;
    uint64_t v213 = 0;
    uint64_t v214 = 0;
    uint64_t v217 = 0;
    int v212 = 0;
    int v206 = 0;
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v50 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 1;
    goto LABEL_40;
  }
  uint64_t v18 = [(BBBulletin *)self categoryID];
  [(BBBulletin *)v5 categoryID];
  v180 = v181 = (void *)v18;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    *(void *)&long long v219 = 0x100000000;
    uint64_t v213 = 0;
    uint64_t v214 = 0;
    uint64_t v217 = 0;
    int v212 = 0;
    int v206 = 0;
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v50 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 1;
    goto LABEL_40;
  }
  uint64_t v19 = [(BBBulletin *)self threadID];
  [(BBBulletin *)v5 threadID];
  v178 = v179 = (void *)v19;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    uint64_t v213 = 0;
    uint64_t v214 = 0;
    uint64_t v217 = 0;
    int v212 = 0;
    int v206 = 0;
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v50 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 1;
    *(void *)&long long v219 = 0x100000001;
    goto LABEL_40;
  }
  v220 = self;
  uint64_t v20 = [(BBBulletin *)self eventBehavior];
  unint64_t v21 = v5;
  [(BBBulletin *)v5 eventBehavior];
  v176 = v177 = (void *)v20;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    uint64_t v217 = 0;
    uint64_t v213 = 0;
    HIDWORD(v214) = 0;
    int v212 = 0;
    int v206 = 0;
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
LABEL_149:
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *(void *)((char *)&v219 + 4) = 0x100000001;
    LODWORD(v219) = 1;
    LODWORD(v214) = 1;
LABEL_150:
    uint64_t v5 = v21;
    int v50 = 0;
LABEL_151:
    self = v220;
    goto LABEL_40;
  }
  BOOL v22 = [(BBBulletin *)self isHighlight];
  if (v22 != [(BBBulletin *)v5 isHighlight]
    || (unint64_t v23 = [(BBBulletin *)self priorityNotificationStatus],
        v23 != [(BBBulletin *)v5 priorityNotificationStatus])
    || (unint64_t v24 = [(BBBulletin *)self notificationSummaryStatus],
        v24 != [(BBBulletin *)v5 notificationSummaryStatus]))
  {
    uint64_t v217 = 0;
    uint64_t v213 = 0;
    HIDWORD(v214) = 0;
    int v212 = 0;
    int v206 = 0;
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    int v7 = 0;
    goto LABEL_149;
  }
  uint64_t v25 = [(BBBulletin *)self peopleIDs];
  [(BBBulletin *)v5 peopleIDs];
  v174 = v175 = (void *)v25;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    uint64_t v213 = 0;
    LODWORD(v217) = 0;
    HIDWORD(v214) = 0;
    int v212 = 0;
    int v206 = 0;
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
LABEL_154:
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *(void *)((char *)&v219 + 4) = 0x100000001;
    LODWORD(v219) = 1;
    LODWORD(v214) = 1;
    HIDWORD(v217) = 1;
    goto LABEL_150;
  }
  int64_t v26 = [(BBBulletin *)self sectionSubtype];
  if (v26 != [(BBBulletin *)v5 sectionSubtype])
  {
    uint64_t v213 = 0;
    LODWORD(v217) = 0;
    HIDWORD(v214) = 0;
    int v212 = 0;
    int v206 = 0;
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    int v7 = 0;
    goto LABEL_154;
  }
  uint64_t v27 = [(BBBulletin *)self intentIDs];
  v172 = [(BBBulletin *)v5 intentIDs];
  v173 = (void *)v27;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    LODWORD(v217) = 0;
    HIDWORD(v214) = 0;
    HIDWORD(v213) = 0;
    int v212 = 0;
    int v206 = 0;
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
LABEL_157:
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *(void *)((char *)&v219 + 4) = 0x100000001;
    LODWORD(v219) = 1;
    LODWORD(v214) = 1;
    HIDWORD(v217) = 1;
    LODWORD(v213) = 1;
    goto LABEL_150;
  }
  unint64_t v28 = [(BBBulletin *)self counter];
  if (v28 != [(BBBulletin *)v5 counter]
    || (unint64_t v29 = [(BBBulletin *)self interruptionLevel],
        v29 != [(BBBulletin *)v5 interruptionLevel])
    || (int64_t v30 = [(BBBulletin *)self contentPreviewSetting],
        v30 != [(BBBulletin *)v5 contentPreviewSetting]))
  {
    LODWORD(v217) = 0;
    HIDWORD(v214) = 0;
    HIDWORD(v213) = 0;
    int v212 = 0;
    int v206 = 0;
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    int v7 = 0;
    goto LABEL_157;
  }
  uint64_t v31 = [(BBBulletin *)self content];
  v170 = [(BBBulletin *)v5 content];
  v171 = (void *)v31;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v212 = 0;
    int v206 = 0;
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 1;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 1;
    uint64_t v213 = 1;
    uint64_t v217 = 0x100000001;
    goto LABEL_150;
  }
  uint64_t v32 = [(BBBulletin *)self modalAlertContent];
  v168 = [(BBBulletin *)v5 modalAlertContent];
  v169 = (void *)v32;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v212 = 0;
    int v206 = 0;
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 1;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 1;
    goto LABEL_150;
  }
  uint64_t v33 = [(BBBulletin *)self starkBannerContent];
  v166 = [(BBBulletin *)v5 starkBannerContent];
  v167 = (void *)v33;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v212 = 0;
    int v206 = 0;
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 1;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    goto LABEL_150;
  }
  uint64_t v34 = [(BBBulletin *)self communicationContext];
  v164 = [(BBBulletin *)v5 communicationContext];
  v165 = (void *)v34;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v206 = 0;
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 1;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    goto LABEL_150;
  }
  uint64_t v35 = [(BBBulletin *)self summaryArgument];
  v162 = [(BBBulletin *)v5 summaryArgument];
  v163 = (void *)v35;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
LABEL_164:
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *(void *)((char *)&v219 + 4) = 0x100000001;
    LODWORD(v219) = 1;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    goto LABEL_150;
  }
  unint64_t v36 = [(BBBulletin *)self summaryArgumentCount];
  if (v36 != [(BBBulletin *)v5 summaryArgumentCount])
  {
    int v202 = 0;
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    int v7 = 0;
    goto LABEL_164;
  }
  uint64_t v37 = [(BBBulletin *)self icon];
  v160 = [(BBBulletin *)v5 icon];
  v161 = (void *)v37;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    goto LABEL_166;
  }
  BOOL v38 = [(BBBulletin *)self hasCriticalIcon];
  if (v38 != [(BBBulletin *)v5 hasCriticalIcon]
    || (BOOL v39 = [(BBBulletin *)self hasSubordinateIcon],
        v39 != [(BBBulletin *)v5 hasSubordinateIcon])
    || (BOOL v40 = [(BBBulletin *)self hasEventDate], v40 != [(BBBulletin *)v5 hasEventDate]))
  {
    int v211 = 0;
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    int v7 = 0;
LABEL_166:
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *(void *)((char *)&v219 + 4) = 0x100000001;
    LODWORD(v219) = 1;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    goto LABEL_150;
  }
  uint64_t v65 = [(BBBulletin *)self date];
  v158 = [(BBBulletin *)v5 date];
  v159 = (void *)v65;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v209 = 0;
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 1;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    goto LABEL_150;
  }
  uint64_t v66 = [(BBBulletin *)self endDate];
  v156 = [(BBBulletin *)v21 endDate];
  v157 = (void *)v66;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v203 = 0;
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 1;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    goto LABEL_150;
  }
  uint64_t v67 = [(BBBulletin *)self recencyDate];
  v154 = [(BBBulletin *)v21 recencyDate];
  v155 = (void *)v67;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    goto LABEL_176;
  }
  int64_t v68 = [(BBBulletin *)self dateFormatStyle];
  if (v68 != [(BBBulletin *)v21 dateFormatStyle]
    || (BOOL v69 = [(BBBulletin *)self dateIsAllDay], v69 != [(BBBulletin *)v21 dateIsAllDay]))
  {
    int v210 = 0;
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    int v7 = 0;
LABEL_176:
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *(void *)((char *)&v219 + 4) = 0x100000001;
    LODWORD(v219) = 1;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    goto LABEL_150;
  }
  uint64_t v70 = [(BBBulletin *)self timeZone];
  v152 = [(BBBulletin *)v21 timeZone];
  v153 = (void *)v70;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v207 = 0;
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 1;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    int v210 = 1;
    goto LABEL_150;
  }
  uint64_t v71 = [(BBBulletin *)v220 accessoryIconMask];
  v150 = [(BBBulletin *)v21 accessoryIconMask];
  v151 = (void *)v71;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    uint64_t v204 = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 1;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    int v210 = 1;
    int v207 = 1;
    goto LABEL_150;
  }
  uint64_t v72 = [(BBBulletin *)v220 accessoryImage];
  v148 = [(BBBulletin *)v21 accessoryImage];
  v149 = (void *)v72;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    HIDWORD(v204) = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    goto LABEL_185;
  }
  BOOL v73 = [(BBBulletin *)v220 clearable];
  if (v73 != [(BBBulletin *)v21 clearable])
  {
    HIDWORD(v204) = 0;
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    int v7 = 0;
LABEL_185:
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *(void *)((char *)&v219 + 4) = 0x100000001;
    LODWORD(v219) = 1;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    int v210 = 1;
    int v207 = 1;
    LODWORD(v204) = 1;
    goto LABEL_150;
  }
  uint64_t v74 = [(BBBulletin *)v220 sound];
  v146 = [(BBBulletin *)v21 sound];
  v147 = (void *)v74;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    goto LABEL_190;
  }
  BOOL v75 = [(BBBulletin *)v220 turnsOnDisplay];
  if (v75 != [(BBBulletin *)v21 turnsOnDisplay])
  {
    int v208 = 0;
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    int v7 = 0;
LABEL_190:
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *(void *)((char *)&v219 + 4) = 0x100000001;
    LODWORD(v219) = 1;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    int v210 = 1;
    int v207 = 1;
    uint64_t v204 = 0x100000001;
    goto LABEL_150;
  }
  uint64_t v76 = [(BBBulletin *)v220 primaryAttachment];
  v144 = [(BBBulletin *)v21 primaryAttachment];
  v145 = (void *)v76;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v205 = 0;
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 1;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    int v210 = 1;
    int v207 = 1;
    uint64_t v204 = 0x100000001;
    int v208 = 1;
    goto LABEL_150;
  }
  uint64_t v77 = [(BBBulletin *)v220 additionalAttachments];
  v142 = [(BBBulletin *)v21 additionalAttachments];
  v143 = (void *)v77;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v201 = 0;
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 1;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    int v210 = 1;
    int v207 = 1;
    uint64_t v204 = 0x100000001;
    int v208 = 1;
    int v205 = 1;
    goto LABEL_150;
  }
  uint64_t v78 = [(BBBulletin *)v220 unlockActionLabelOverride];
  v140 = [(BBBulletin *)v21 unlockActionLabelOverride];
  v141 = (void *)v78;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    goto LABEL_203;
  }
  BOOL v79 = [(BBBulletin *)v220 wantsFullscreenPresentation];
  if (v79 != [(BBBulletin *)v21 wantsFullscreenPresentation]
    || (BOOL v80 = [(BBBulletin *)v220 ignoresQuietMode],
        v80 != [(BBBulletin *)v21 ignoresQuietMode])
    || (BOOL v81 = [(BBBulletin *)v220 ignoresDowntime],
        v81 != [(BBBulletin *)v21 ignoresDowntime])
    || (BOOL v82 = [(BBBulletin *)v220 preemptsPresentedAlert],
        v82 != [(BBBulletin *)v21 preemptsPresentedAlert])
    || (BOOL v83 = [(BBBulletin *)v220 displaysActionsInline],
        v83 != [(BBBulletin *)v21 displaysActionsInline]))
  {
    uint64_t v215 = 0;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    int v7 = 0;
LABEL_203:
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *(void *)((char *)&v219 + 4) = 0x100000001;
    LODWORD(v219) = 1;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    int v210 = 1;
    int v207 = 1;
    uint64_t v204 = 0x100000001;
    int v208 = 1;
    int v205 = 1;
    int v201 = 1;
    goto LABEL_150;
  }
  uint64_t v84 = [(BBBulletin *)v220 actions];
  v138 = [(BBBulletin *)v21 actions];
  v139 = (void *)v84;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    uint64_t v215 = 0x100000000;
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 1;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    int v210 = 1;
    int v207 = 1;
    uint64_t v204 = 0x100000001;
    int v208 = 1;
    int v205 = 1;
    int v201 = 1;
    goto LABEL_150;
  }
  uint64_t v85 = [(BBBulletin *)v220 buttons];
  v136 = [(BBBulletin *)v21 buttons];
  v137 = (void *)v85;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    long long v216 = 0uLL;
    uint64_t v218 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 1;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    int v210 = 1;
    int v207 = 1;
    uint64_t v204 = 0x100000001;
    int v208 = 1;
    int v205 = 1;
    int v201 = 1;
    uint64_t v215 = 0x100000001;
    goto LABEL_150;
  }
  uint64_t v86 = [(BBBulletin *)v220 supplementaryActionsByLayout];
  v134 = [(BBBulletin *)v21 supplementaryActionsByLayout];
  v135 = (void *)v86;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    long long v216 = 1uLL;
    uint64_t v218 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 1;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    int v210 = 1;
    int v207 = 1;
    uint64_t v204 = 0x100000001;
    int v208 = 1;
    int v205 = 1;
    int v201 = 1;
    uint64_t v215 = 0x100000001;
    goto LABEL_150;
  }
  uint64_t v87 = [(BBBulletin *)v220 alertSuppressionContexts];
  v132 = [(BBBulletin *)v21 alertSuppressionContexts];
  v133 = (void *)v87;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    uint64_t v218 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 1;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    int v210 = 1;
    int v207 = 1;
    uint64_t v204 = 0x100000001;
    int v208 = 1;
    int v205 = 1;
    int v201 = 1;
    uint64_t v215 = 0x100000001;
    long long v216 = 0x100000001uLL;
    goto LABEL_150;
  }
  uint64_t v88 = [(BBBulletin *)v220 context];
  v130 = [(BBBulletin *)v21 context];
  v131 = (void *)v88;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    *((void *)&v216 + 1) = 0x100000000;
    uint64_t v218 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 1;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    int v210 = 1;
    int v207 = 1;
    uint64_t v204 = 0x100000001;
    int v208 = 1;
    int v205 = 1;
    int v201 = 1;
    uint64_t v215 = 0x100000001;
    *(void *)&long long v216 = 0x100000001;
    goto LABEL_150;
  }
  uint64_t v89 = [(BBBulletin *)v220 expirationDate];
  v128 = [(BBBulletin *)v21 expirationDate];
  v129 = (void *)v89;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    uint64_t v218 = 0;
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
LABEL_235:
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *(void *)((char *)&v219 + 4) = 0x100000001;
    LODWORD(v219) = 1;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    int v210 = 1;
    int v207 = 1;
    uint64_t v204 = 0x100000001;
    int v208 = 1;
    int v205 = 1;
    int v201 = 1;
    uint64_t v215 = 0x100000001;
    LODWORD(v216) = 1;
    *(void *)((char *)&v216 + 4) = 0x100000001;
    HIDWORD(v216) = 1;
    goto LABEL_150;
  }
  uint64_t v90 = [(BBBulletin *)v220 expirationEvents];
  if (v90 != [(BBBulletin *)v21 expirationEvents])
  {
    uint64_t v218 = 0;
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    int v7 = 0;
    goto LABEL_235;
  }
  uint64_t v91 = [(BBBulletin *)v220 lastInterruptDate];
  v126 = [(BBBulletin *)v21 lastInterruptDate];
  v127 = (void *)v91;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 1;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 0x100000001;
    uint64_t v218 = 0x100000000;
    uint64_t v213 = 0x100000001;
    uint64_t v217 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    int v210 = 1;
    int v207 = 1;
    uint64_t v204 = 0x100000001;
    int v208 = 1;
    int v205 = 1;
    int v201 = 1;
    uint64_t v215 = 0x100000001;
    *(void *)&long long v216 = 0x100000001;
    *((void *)&v216 + 1) = 0x100000001;
    goto LABEL_150;
  }
  uint64_t v92 = [(BBBulletin *)v220 publicationDate];
  v124 = [(BBBulletin *)v21 publicationDate];
  v125 = (void *)v92;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    goto LABEL_239;
  }
  BOOL v93 = [(BBBulletin *)v220 usesExternalSync];
  if (v93 != [(BBBulletin *)v21 usesExternalSync]
    || (BOOL v94 = [(BBBulletin *)v220 isLoading], v94 != [(BBBulletin *)v21 isLoading])
    || (BOOL v95 = [(BBBulletin *)v220 preventAutomaticRemovalFromLockScreen],
        v95 != [(BBBulletin *)v21 preventAutomaticRemovalFromLockScreen])
    || (uint64_t v96 = [(BBBulletin *)v220 lockScreenPriority],
        v96 != [(BBBulletin *)v21 lockScreenPriority])
    || (uint64_t v97 = [(BBBulletin *)v220 backgroundStyle],
        v97 != [(BBBulletin *)v21 backgroundStyle]))
  {
    HIDWORD(v219) = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    int v7 = 0;
LABEL_239:
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *(void *)((char *)&v219 + 4) = 0x100000001;
    LODWORD(v219) = 1;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    int v210 = 1;
    int v207 = 1;
    uint64_t v204 = 0x100000001;
    int v208 = 1;
    int v205 = 1;
    int v201 = 1;
    uint64_t v215 = 0x100000001;
    *(void *)&long long v216 = 0x100000001;
    *((void *)&v216 + 1) = 0x100000001;
    uint64_t v218 = 0x100000001;
    goto LABEL_150;
  }
  uint64_t v98 = [(BBBulletin *)v220 header];
  v122 = [(BBBulletin *)v21 header];
  v123 = (void *)v98;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 0x100000001;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    int v210 = 1;
    int v207 = 1;
    uint64_t v204 = 0x100000001;
    int v208 = 1;
    int v205 = 1;
    int v201 = 1;
    uint64_t v215 = 0x100000001;
    *(void *)&long long v216 = 0x100000001;
    *((void *)&v216 + 1) = 0x100000001;
    uint64_t v218 = 0x100000001;
    goto LABEL_150;
  }
  uint64_t v99 = [(BBBulletin *)v220 footer];
  v120 = [(BBBulletin *)v21 footer];
  v121 = (void *)v99;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 0x100000001;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    int v210 = 1;
    int v207 = 1;
    uint64_t v204 = 0x100000001;
    int v208 = 1;
    int v205 = 1;
    int v201 = 1;
    uint64_t v215 = 0x100000001;
    *(void *)&long long v216 = 0x100000001;
    *((void *)&v216 + 1) = 0x100000001;
    uint64_t v218 = 0x100000001;
LABEL_250:
    uint64_t v5 = v21;
    int v50 = 1;
    goto LABEL_151;
  }
  uint64_t v100 = [(BBBulletin *)v220 threadSummary];
  v118 = [(BBBulletin *)v21 threadSummary];
  v119 = (void *)v100;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 0x100000001;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    int v210 = 1;
    int v207 = 1;
    uint64_t v204 = 0x100000001;
    int v208 = 1;
    int v205 = 1;
    int v201 = 1;
    uint64_t v215 = 0x100000001;
    *(void *)&long long v216 = 0x100000001;
    *((void *)&v216 + 1) = 0x100000001;
    uint64_t v218 = 0x100000001;
    int v41 = 1;
    goto LABEL_250;
  }
  uint64_t v101 = [(BBBulletin *)v220 spotlightIdentifier];
  v116 = [(BBBulletin *)v21 spotlightIdentifier];
  v117 = (void *)v101;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
LABEL_245:
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 0x100000001;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    int v210 = 1;
    int v207 = 1;
    uint64_t v204 = 0x100000001;
    int v208 = 1;
    int v205 = 1;
    int v201 = 1;
    uint64_t v215 = 0x100000001;
    *(void *)&long long v216 = 0x100000001;
    *((void *)&v216 + 1) = 0x100000001;
    uint64_t v218 = 0x100000001;
    int v41 = 1;
    int v42 = 1;
    goto LABEL_250;
  }
  uint64_t v102 = [(BBBulletin *)v220 realertCount];
  if (v102 != [(BBBulletin *)v21 realertCount])
  {
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    int v7 = 0;
    goto LABEL_245;
  }
  uint64_t v103 = [(BBBulletin *)v220 alertSuppressionAppIDs_deprecated];
  v114 = [(BBBulletin *)v21 alertSuppressionAppIDs_deprecated];
  v115 = (void *)v103;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v44 = 0;
    int v45 = 0;
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 0x100000001;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    int v210 = 1;
    int v207 = 1;
    uint64_t v204 = 0x100000001;
    int v208 = 1;
    int v205 = 1;
    int v201 = 1;
    uint64_t v215 = 0x100000001;
    *(void *)&long long v216 = 0x100000001;
    *((void *)&v216 + 1) = 0x100000001;
    uint64_t v218 = 0x100000001;
    int v41 = 1;
    int v42 = 1;
    int v43 = 1;
    goto LABEL_250;
  }
  uint64_t v104 = [(BBBulletin *)v220 contentType];
  v112 = [(BBBulletin *)v21 contentType];
  v113 = (void *)v104;
  int v7 = BSEqualObjects();
  if (!v7)
  {
    int v45 = 0;
LABEL_249:
    *((void *)&v222 + 1) = 0x100000001;
    *(void *)&long long v222 = 0x100000001;
    int v47 = 1;
    int v48 = 1;
    int v49 = 1;
    *((void *)&v219 + 1) = 0x100000001;
    *(void *)&long long v219 = 0x100000001;
    uint64_t v214 = 0x100000001;
    uint64_t v217 = 0x100000001;
    uint64_t v213 = 0x100000001;
    int v212 = 1;
    int v206 = 1;
    int v202 = 1;
    int v211 = 1;
    int v209 = 1;
    int v203 = 1;
    int v210 = 1;
    int v207 = 1;
    uint64_t v204 = 0x100000001;
    int v208 = 1;
    int v205 = 1;
    int v201 = 1;
    uint64_t v215 = 0x100000001;
    *(void *)&long long v216 = 0x100000001;
    *((void *)&v216 + 1) = 0x100000001;
    uint64_t v218 = 0x100000001;
    int v41 = 1;
    int v42 = 1;
    int v43 = 1;
    int v44 = 1;
    goto LABEL_250;
  }
  BOOL v105 = [(BBBulletin *)v220 screenCaptureProhibited];
  if (v105 != [(BBBulletin *)v21 screenCaptureProhibited]
    || ([(BBBulletin *)v220 relevanceScore],
        float v107 = v106,
        [(BBBulletin *)v21 relevanceScore],
        v107 != v108))
  {
    int v45 = 0;
    int v7 = 0;
    goto LABEL_249;
  }
  self = v220;
  uint64_t v109 = [(BBBulletin *)v220 filterCriteria];
  uint64_t v5 = v21;
  uint64_t v110 = [(BBBulletin *)v21 filterCriteria];
  v111 = (void *)v109;
  int v7 = BSEqualObjects();
  uint64_t v8 = (void *)v110;
  int v45 = 1;
  *((void *)&v222 + 1) = 0x100000001;
  *(void *)&long long v222 = 0x100000001;
  int v47 = 1;
  int v48 = 1;
  int v49 = 1;
  *((void *)&v219 + 1) = 0x100000001;
  *(void *)&long long v219 = 0x100000001;
  uint64_t v214 = 0x100000001;
  uint64_t v217 = 0x100000001;
  uint64_t v213 = 0x100000001;
  int v212 = 1;
  int v206 = 1;
  int v202 = 1;
  int v211 = 1;
  int v209 = 1;
  int v203 = 1;
  int v210 = 1;
  int v207 = 1;
  uint64_t v204 = 0x100000001;
  int v208 = 1;
  int v205 = 1;
  int v201 = 1;
  uint64_t v215 = 0x100000001;
  *(void *)&long long v216 = 0x100000001;
  *((void *)&v216 + 1) = 0x100000001;
  uint64_t v218 = 0x100000001;
  int v50 = 1;
  int v41 = 1;
  int v42 = 1;
  int v43 = 1;
  int v44 = 1;
LABEL_40:
  int v221 = v7;
  if (v45)
  {
    int v198 = v50;
    uint64_t v51 = v4;
    uint64_t v52 = self;
    int v53 = v49;
    int v54 = v41;
    int v55 = v42;
    int v56 = v48;
    uint64_t v57 = v5;
    int v58 = v43;
    int v59 = v47;
    int v60 = v44;

    int v61 = v60;
    int v47 = v59;
    int v43 = v58;
    uint64_t v5 = v57;
    int v48 = v56;
    int v42 = v55;
    int v41 = v54;
    int v49 = v53;
    self = v52;
    uint64_t v4 = v51;
    int v50 = v198;
    if (!v61) {
      goto LABEL_42;
    }
  }
  else if (!v44)
  {
LABEL_42:
    if (v43) {
      goto LABEL_43;
    }
    goto LABEL_49;
  }

  if (v43)
  {
LABEL_43:

    if (!v42) {
      goto LABEL_44;
    }
    goto LABEL_50;
  }
LABEL_49:
  if (!v42)
  {
LABEL_44:
    if (v41) {
      goto LABEL_45;
    }
LABEL_51:
    if (!v50) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
LABEL_50:

  if (!v41) {
    goto LABEL_51;
  }
LABEL_45:

  if (v50)
  {
LABEL_52:
  }
LABEL_53:
  if (HIDWORD(v219))
  {
  }
  if (v218)
  {
  }
  if (HIDWORD(v218))
  {
  }
  if (DWORD2(v216))
  {
  }
  if (HIDWORD(v216))
  {
  }
  if (DWORD1(v216))
  {
  }
  if (v216)
  {
  }
  if (v215)
  {
  }
  if (HIDWORD(v215))
  {
  }
  if (v201)
  {
  }
  if (v205)
  {
  }
  if (v208)
  {
  }
  if (HIDWORD(v204))
  {
  }
  if (v204)
  {
  }
  if (v207)
  {
  }
  if (v210)
  {
  }
  if (v203)
  {
  }
  if (v209)
  {
  }
  if (v211)
  {
  }
  if (v202)
  {
  }
  if (v206)
  {
  }
  if (v212)
  {
  }
  if (HIDWORD(v213))
  {
  }
  if (HIDWORD(v214))
  {
  }
  if (v217)
  {
  }
  if (v213)
  {
  }
  if (HIDWORD(v217))
  {
  }
  if (v214)
  {
  }
  if (v219)
  {
  }
  if (DWORD1(v219))
  {
  }
  if (DWORD2(v219))
  {

    if (!v49) {
      goto LABEL_115;
    }
  }
  else if (!v49)
  {
LABEL_115:
    if (v48) {
      goto LABEL_116;
    }
    goto LABEL_120;
  }

  if (v48)
  {
LABEL_116:

    if (!v47) {
      goto LABEL_122;
    }
    goto LABEL_121;
  }
LABEL_120:
  if (v47)
  {
LABEL_121:
  }
LABEL_122:
  if (v222)
  {
  }
  if (DWORD1(v222))
  {
  }
  if (DWORD2(v222))
  {
  }
  if (HIDWORD(v222))
  {
  }
  if (v223)
  {
  }
  if (v221)
  {
    uint64_t v62 = [(BBBulletin *)self speechLanguage];
    uint64_t v63 = [(BBBulletin *)v5 speechLanguage];
    char v46 = BSEqualObjects();
  }
  else
  {
    char v46 = 0;
  }

LABEL_136:
  return v46;
}

- (NSString)title
{
  v2 = [(BBBulletin *)self content];
  uint64_t v3 = [v2 title];

  return (NSString *)v3;
}

- (NSString)subtitle
{
  v2 = [(BBBulletin *)self content];
  uint64_t v3 = [v2 subtitle];

  return (NSString *)v3;
}

- (NSString)message
{
  v2 = [(BBBulletin *)self content];
  uint64_t v3 = [v2 message];

  return (NSString *)v3;
}

- (NSAttributedString)attributedMessage
{
  v2 = [(BBBulletin *)self content];
  uint64_t v3 = [v2 attributedMessage];

  return (NSAttributedString *)v3;
}

- (NSAttributedString)summary
{
  v2 = [(BBBulletin *)self content];
  uint64_t v3 = [v2 summary];

  return (NSAttributedString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(BBBulletin *)self content];
  [v5 setTitle:v4];
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = [(BBBulletin *)self content];
  [v5 setSubtitle:v4];
}

- (void)setMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(BBBulletin *)self content];
  [v5 setMessage:v4];
}

- (void)setAttributedMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(BBBulletin *)self content];
  [v5 setAttributedMessage:v4];
}

- (void)setSummary:(id)a3
{
  id v4 = a3;
  id v5 = [(BBBulletin *)self content];
  [v5 setSummary:v4];
}

- (BBContent)content
{
  content = self->_content;
  if (!content)
  {
    id v4 = objc_alloc_init(BBContent);
    id v5 = self->_content;
    self->_content = v4;

    content = self->_content;
  }
  return content;
}

- (BOOL)isMessagingNotification
{
  if ([(NSString *)self->_contentType isEqualToString:@"BBBulletinContentTypeMessagingDirect"])
  {
    return 1;
  }
  contentType = self->_contentType;
  return [(NSString *)contentType isEqualToString:@"BBBulletinContentTypeMessagingGroup"];
}

- (BOOL)isCallNotification
{
  if ([(NSString *)self->_contentType isEqualToString:@"BBBulletinContentTypeIncomingCall"]
    || [(NSString *)self->_contentType isEqualToString:@"BBBulletinContentTypeMissedCall"]
    || [(NSString *)self->_contentType isEqualToString:@"BBBulletinContentTypeVoicemail"])
  {
    return 1;
  }
  contentType = self->_contentType;
  return [(NSString *)contentType isEqualToString:@"BBBulletinContentTypeCallOther"];
}

- (void)setAlertSuppressionContexts:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  alertSuppressionContexts = self->_alertSuppressionContexts;
  self->_alertSuppressionContexts = 0;

  if (v4)
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = objc_msgSend(v12, "copy", (void)v16);
            [v6 addObject:v13];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    uint64_t v14 = (NSSet *)[objc_alloc(MEMORY[0x263EFFA08]) initWithSet:v6];
    uint64_t v15 = self->_alertSuppressionContexts;
    self->_alertSuppressionContexts = v14;
  }
}

- (int64_t)primaryAttachmentType
{
  v2 = [(BBBulletin *)self primaryAttachment];
  int64_t v3 = [v2 type];

  return v3;
}

- (unint64_t)numberOfAdditionalAttachments
{
  v2 = [(BBBulletin *)self additionalAttachments];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)numberOfAdditionalAttachmentsOfType:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = [(BBBulletin *)self additionalAttachments];
  id v5 = (void *)[v4 copy];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "type", (void)v13) == a3) {
          ++v9;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (id)_actionKeyForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xA) {
    return 0;
  }
  else {
    return off_264295D90[a3 - 1];
  }
}

- (BBAction)defaultAction
{
  return (BBAction *)[(NSMutableDictionary *)self->_actions valueForKey:@"default"];
}

- (void)setDefaultAction:(id)a3
{
  id v4 = a3;
  [v4 setActionType:1];
  actions = self->_actions;
  id v6 = (id)[v4 copy];

  [(NSMutableDictionary *)actions setValue:v6 forKey:@"default"];
}

- (id)dismissAction
{
  return (id)[(NSMutableDictionary *)self->_actions valueForKey:@"dismiss"];
}

- (void)setDismissAction:(id)a3
{
  id v4 = a3;
  [v4 setActionType:8];
  actions = self->_actions;
  id v6 = (id)[v4 copy];

  [(NSMutableDictionary *)actions setValue:v6 forKey:@"dismiss"];
}

- (BBAction)alternateAction
{
  return (BBAction *)[(NSMutableDictionary *)self->_actions valueForKey:@"alternate"];
}

- (void)setAlternateAction:(id)a3
{
  id v4 = a3;
  [v4 setActionType:2];
  actions = self->_actions;
  id v6 = (id)[v4 copy];

  [(NSMutableDictionary *)actions setValue:v6 forKey:@"alternate"];
}

- (BBAction)acknowledgeAction
{
  return (BBAction *)[(NSMutableDictionary *)self->_actions valueForKey:@"acknowledge"];
}

- (void)setAcknowledgeAction:(id)a3
{
  id v4 = a3;
  [v4 setActionType:3];
  actions = self->_actions;
  id v6 = (id)[v4 copy];

  [(NSMutableDictionary *)actions setValue:v6 forKey:@"acknowledge"];
}

- (BBAction)expireAction
{
  return (BBAction *)[(NSMutableDictionary *)self->_actions valueForKey:@"expire"];
}

- (void)setExpireAction:(id)a3
{
  id v4 = a3;
  [v4 setActionType:5];
  actions = self->_actions;
  id v6 = (id)[v4 copy];

  [(NSMutableDictionary *)actions setValue:v6 forKey:@"expire"];
}

- (BBAction)snoozeAction
{
  return (BBAction *)[(NSMutableDictionary *)self->_actions valueForKey:@"snooze"];
}

- (void)setSnoozeAction:(id)a3
{
  id v4 = a3;
  [v4 setActionType:6];
  actions = self->_actions;
  id v6 = (id)[v4 copy];

  [(NSMutableDictionary *)actions setValue:v6 forKey:@"snooze"];
}

- (BBAction)raiseAction
{
  return (BBAction *)[(NSMutableDictionary *)self->_actions valueForKey:@"raise"];
}

- (void)setRaiseAction:(id)a3
{
  id v4 = a3;
  [v4 setActionType:9];
  actions = self->_actions;
  id v6 = (id)[v4 copy];

  [(NSMutableDictionary *)actions setValue:v6 forKey:@"raise"];
}

- (BBAction)followActivityAction
{
  return (BBAction *)[(NSMutableDictionary *)self->_actions valueForKey:@"follow-activity"];
}

- (void)setFollowActivityAction:(id)a3
{
  id v4 = a3;
  [v4 setActionType:11];
  actions = self->_actions;
  id v6 = (id)[v4 copy];

  [(NSMutableDictionary *)actions setValue:v6 forKey:@"follow-activity"];
}

- (id)silenceAction
{
  return (id)[(NSMutableDictionary *)self->_actions valueForKey:@"silence"];
}

- (void)setSilenceAction:(id)a3
{
  id v4 = a3;
  [v4 setActionType:10];
  actions = self->_actions;
  id v6 = (id)[v4 copy];

  [(NSMutableDictionary *)actions setValue:v6 forKey:@"silence"];
}

- (id)actionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(BBBulletin *)self _allActions];
  id v6 = [(BBBulletin *)self _actionWithID:v4 fromActions:v5];

  return v6;
}

- (id)_actionWithID:(id)a3 fromActions:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v13 = [v12 actions];
          id v14 = [(BBBulletin *)self _actionWithID:v6 fromActions:v13];

          if (v14) {
            goto LABEL_14;
          }
        }
        else
        {
          long long v15 = objc_msgSend(v12, "identifier", (void)v18);
          int v16 = [v15 isEqualToString:v6];

          if (v16)
          {
            id v14 = v12;
            if (v14) {
              goto LABEL_14;
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
  id v14 = 0;
LABEL_14:

  return v14;
}

- (id)supplementaryActions
{
  return [(BBBulletin *)self supplementaryActionsForLayout:0];
}

- (id)supplementaryActionsForLayout:(int64_t)a3
{
  supplementaryActionsByLayout = self->_supplementaryActionsByLayout;
  id v4 = [NSNumber numberWithInteger:a3];
  id v5 = [(NSMutableDictionary *)supplementaryActionsByLayout objectForKey:v4];

  return v5;
}

- (id)_allSupplementaryActions
{
  v2 = [(NSMutableDictionary *)self->_supplementaryActionsByLayout allValues];
  unint64_t v3 = objc_msgSend(v2, "bs_flatten");

  return v3;
}

- (id)_allActions
{
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(NSMutableDictionary *)self->_actions allValues];
  [v3 addObjectsFromArray:v4];

  id v5 = [(BBBulletin *)self _allSupplementaryActions];
  [v3 addObjectsFromArray:v5];

  return v3;
}

- (void)setButtons:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v13 = v4;
    uint64_t v5 = [v4 count];
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v5];
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v9 = [v13 objectAtIndex:i];
        uint64_t v10 = (void *)[v9 copy];

        [v7 addObject:v10];
      }
    }
    else
    {
      id v7 = 0;
    }
    uint64_t v11 = (NSArray *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v7];
    buttons = self->_buttons;
    self->_buttons = v11;

    id v4 = v13;
  }
}

- (id)_responseForAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(BBResponse);
  uint64_t v6 = [(BBBulletin *)self lifeAssertions];
  [(BBResponse *)v5 setLifeAssertions:v6];

  id v7 = [(BBBulletin *)self responseSendBlock];
  [(BBResponse *)v5 setSendBlock:v7];

  uint64_t v8 = [(BBBulletin *)self bulletinID];
  [(BBResponse *)v5 setBulletinID:v8];

  -[BBResponse setActionActivationMode:](v5, "setActionActivationMode:", [v4 activationMode]);
  -[BBResponse setActionBehavior:](v5, "setActionBehavior:", [v4 behavior]);
  -[BBResponse setActionType:](v5, "setActionType:", [v4 actionType]);
  uint64_t v9 = [v4 identifier];
  [(BBResponse *)v5 setActionID:v9];

  uint64_t v10 = [v4 launchURL];

  [(BBResponse *)v5 setActionLaunchURL:v10];
  return v5;
}

- (id)responseForAction:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    NSLog(&cfstr_SErrorYouCanTS.isa, "-[BBBulletin responseForAction:]");
LABEL_4:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = [(BBBulletin *)self _responseForAction:v4];
LABEL_6:

  return v5;
}

- (id)responseForDefaultAction
{
  unint64_t v3 = [(BBBulletin *)self defaultAction];
  id v4 = [(BBBulletin *)self responseForAction:v3];

  return v4;
}

- (id)responseForAcknowledgeAction
{
  unint64_t v3 = [(BBBulletin *)self acknowledgeAction];
  id v4 = [(BBBulletin *)self responseForAction:v3];

  return v4;
}

- (id)responseForButtonActionAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_buttons count] <= a3)
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v5 = [(NSArray *)self->_buttons objectAtIndex:a3];
    uint64_t v6 = [v5 action];
    id v7 = [(BBBulletin *)self _responseForAction:v6];

    uint64_t v8 = [v5 identifier];
    if (v8)
    {
      [v7 setButtonID:v8];
    }
    else
    {
      uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
      uint64_t v10 = [v9 stringValue];
      [v7 setButtonID:v10];
    }
  }
  return v7;
}

- (id)responseForSnoozeAction
{
  unint64_t v3 = [(BBBulletin *)self snoozeAction];
  id v4 = [(BBBulletin *)self responseForAction:v3];

  return v4;
}

- (id)responseForRaiseAction
{
  unint64_t v3 = [(BBBulletin *)self raiseAction];
  id v4 = [(BBBulletin *)self responseForAction:v3];

  return v4;
}

- (id)responseForExpireAction
{
  unint64_t v3 = objc_alloc_init(BBResponse);
  id v4 = [(BBBulletin *)self bulletinID];
  [(BBResponse *)v3 setBulletinID:v4];

  uint64_t v5 = [(BBBulletin *)self expireAction];
  -[BBResponse setActionActivationMode:](v3, "setActionActivationMode:", [v5 activationMode]);

  [(BBResponse *)v3 setActionType:5];
  uint64_t v6 = [(BBBulletin *)self expireAction];
  id v7 = [v6 identifier];
  [(BBResponse *)v3 setActionID:v7];

  return v3;
}

- (id)responseSendBlock
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__BBBulletin_responseSendBlock__block_invoke;
  v5[3] = &unk_264295D70;
  v5[4] = self;
  v2 = (void *)MEMORY[0x21D44A270](v5, a2);
  unint64_t v3 = (void *)MEMORY[0x21D44A270]();

  return v3;
}

void __31__BBBulletin_responseSendBlock__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 firstValidObserver];
  [v4 sendResponse:v3];
}

- (id)actionForResponse:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    NSLog(&cfstr_BbbulletinHand.isa);
LABEL_8:
    uint64_t v12 = 0;
    goto LABEL_28;
  }
  uint64_t v5 = [(BBBulletin *)self bulletinID];
  uint64_t v6 = [v4 bulletinID];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    id v13 = [(BBBulletin *)self bulletinID];
    id v14 = [v4 bulletinID];
    NSLog(&cfstr_BbbulletinHand_0.isa, v13, v14);

    goto LABEL_8;
  }
  uint64_t v8 = -[BBBulletin _actionKeyForType:](self, "_actionKeyForType:", [v4 actionType]);
  uint64_t v9 = [v4 actionType];
  if (v8)
  {
    if (v9 == 7)
    {
      uint64_t v10 = [v4 actionID];
      uint64_t v11 = [(BBBulletin *)self _allSupplementaryActions];
      uint64_t v12 = [(BBBulletin *)self _actionWithID:v10 fromActions:v11];
    }
    else if ([v8 isEqualToString:@"button"])
    {
      uint64_t v27 = v8;
      long long v15 = [v4 buttonID];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      int v16 = self->_buttons;
      uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v29;
LABEL_13:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = *(void **)(*((void *)&v28 + 1) + 8 * v20);
          BOOL v22 = [v21 identifier];
          char v23 = [v22 isEqualToString:v15];

          if (v23) {
            break;
          }
          if (v18 == ++v20)
          {
            uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
            if (v18) {
              goto LABEL_13;
            }
            goto LABEL_19;
          }
        }
        uint64_t v12 = [v21 action];

        if (v12) {
          goto LABEL_24;
        }
      }
      else
      {
LABEL_19:
      }
      unint64_t v24 = [v15 integerValue];
      if (v24 < [(NSArray *)self->_buttons count]
        && ([(NSArray *)self->_buttons objectAtIndex:v24],
            uint64_t v25 = objc_claimAutoreleasedReturnValue(),
            [v25 action],
            uint64_t v12 = objc_claimAutoreleasedReturnValue(),
            v25,
            v12))
      {
LABEL_24:
      }
      else
      {
        NSLog(&cfstr_BbbulletinHand_2.isa, v15);

        uint64_t v12 = 0;
      }
      uint64_t v8 = v27;
    }
    else
    {
      uint64_t v12 = [(NSMutableDictionary *)self->_actions objectForKey:v8];
    }
  }
  else
  {
    NSLog(&cfstr_BbbulletinHand_1.isa, v9);
    uint64_t v12 = 0;
  }

LABEL_28:
  return v12;
}

- (void)_fillOutCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v64 = a3;
  uint64_t v6 = [(BBBulletin *)self sectionID];
  [v64 setSectionID:v6];

  char v7 = [(BBBulletin *)self sectionBundlePath];
  [v64 setSectionBundlePath:v7];

  uint64_t v8 = [(BBBulletin *)self universalSectionID];
  [v64 setUniversalSectionID:v8];

  uint64_t v9 = [(BBBulletin *)self parentSectionID];
  [v64 setParentSectionID:v9];

  uint64_t v10 = [(BBBulletin *)self subsectionIDs];
  [v64 setSubsectionIDs:v10];

  uint64_t v11 = [(BBBulletin *)self recordID];
  [v64 setRecordID:v11];

  uint64_t v12 = [(BBBulletin *)self publisherBulletinID];
  [v64 setPublisherBulletinID:v12];

  id v13 = [(BBBulletin *)self dismissalID];
  [v64 setDismissalID:v13];

  id v14 = [(BBBulletin *)self categoryID];
  [v64 setCategoryID:v14];

  long long v15 = [(BBBulletin *)self threadID];
  [v64 setThreadID:v15];

  int v16 = [(BBBulletin *)self eventBehavior];
  [v64 setEventBehavior:v16];

  objc_msgSend(v64, "setIsHighlight:", -[BBBulletin isHighlight](self, "isHighlight"));
  objc_msgSend(v64, "setPriorityNotificationStatus:", -[BBBulletin priorityNotificationStatus](self, "priorityNotificationStatus"));
  objc_msgSend(v64, "setNotificationSummaryStatus:", -[BBBulletin notificationSummaryStatus](self, "notificationSummaryStatus"));
  uint64_t v17 = [(BBBulletin *)self peopleIDs];
  [v64 setPeopleIDs:v17];

  objc_msgSend(v64, "setSectionSubtype:", -[BBBulletin sectionSubtype](self, "sectionSubtype"));
  uint64_t v18 = [(BBBulletin *)self intentIDs];
  [v64 setIntentIDs:v18];

  objc_msgSend(v64, "setCounter:", -[BBBulletin counter](self, "counter"));
  objc_msgSend(v64, "setInterruptionLevel:", -[BBBulletin interruptionLevel](self, "interruptionLevel"));
  objc_msgSend(v64, "setContentPreviewSetting:", -[BBBulletin contentPreviewSetting](self, "contentPreviewSetting"));
  uint64_t v19 = [(BBBulletin *)self content];
  uint64_t v20 = (void *)[v19 copyWithZone:a4];
  [v64 setContent:v20];

  long long v21 = [(BBBulletin *)self modalAlertContent];
  BOOL v22 = (void *)[v21 copyWithZone:a4];
  [v64 setModalAlertContent:v22];

  char v23 = [(BBBulletin *)self starkBannerContent];
  unint64_t v24 = (void *)[v23 copyWithZone:a4];
  [v64 setStarkBannerContent:v24];

  uint64_t v25 = [(BBBulletin *)self communicationContext];
  int64_t v26 = (void *)[v25 copyWithZone:a4];
  [v64 setCommunicationContext:v26];

  uint64_t v27 = [(BBBulletin *)self summaryArgument];
  long long v28 = (void *)[v27 copyWithZone:a4];
  [v64 setSummaryArgument:v28];

  objc_msgSend(v64, "setSummaryArgumentCount:", -[BBBulletin summaryArgumentCount](self, "summaryArgumentCount"));
  long long v29 = [(BBBulletin *)self icon];
  long long v30 = (void *)[v29 copyWithZone:a4];
  [v64 setIcon:v30];

  objc_msgSend(v64, "setHasCriticalIcon:", -[BBBulletin hasCriticalIcon](self, "hasCriticalIcon"));
  objc_msgSend(v64, "setHasSubordinateIcon:", -[BBBulletin hasSubordinateIcon](self, "hasSubordinateIcon"));
  objc_msgSend(v64, "setHasEventDate:", -[BBBulletin hasEventDate](self, "hasEventDate"));
  long long v31 = [(BBBulletin *)self date];
  [v64 setDate:v31];

  uint64_t v32 = [(BBBulletin *)self endDate];
  [v64 setEndDate:v32];

  uint64_t v33 = [(BBBulletin *)self recencyDate];
  [v64 setRecencyDate:v33];

  objc_msgSend(v64, "setDateFormatStyle:", -[BBBulletin dateFormatStyle](self, "dateFormatStyle"));
  objc_msgSend(v64, "setDateIsAllDay:", -[BBBulletin dateIsAllDay](self, "dateIsAllDay"));
  uint64_t v34 = [(BBBulletin *)self timeZone];
  [v64 setTimeZone:v34];

  uint64_t v35 = [(BBBulletin *)self accessoryIconMask];
  [v64 setAccessoryIconMask:v35];

  unint64_t v36 = [(BBBulletin *)self accessoryImage];
  [v64 setAccessoryImage:v36];

  objc_msgSend(v64, "setClearable:", -[BBBulletin clearable](self, "clearable"));
  uint64_t v37 = [(BBBulletin *)self sound];
  BOOL v38 = (void *)[v37 copyWithZone:a4];
  [v64 setSound:v38];

  objc_msgSend(v64, "setTurnsOnDisplay:", -[BBBulletin turnsOnDisplay](self, "turnsOnDisplay"));
  BOOL v39 = [(BBBulletin *)self primaryAttachment];
  [v64 setPrimaryAttachment:v39];

  BOOL v40 = [(BBBulletin *)self additionalAttachments];
  [v64 setAdditionalAttachments:v40];

  int v41 = [(BBBulletin *)self unlockActionLabelOverride];
  [v64 setUnlockActionLabelOverride:v41];

  objc_msgSend(v64, "setWantsFullscreenPresentation:", -[BBBulletin wantsFullscreenPresentation](self, "wantsFullscreenPresentation"));
  objc_msgSend(v64, "setIgnoresQuietMode:", -[BBBulletin ignoresQuietMode](self, "ignoresQuietMode"));
  objc_msgSend(v64, "setIgnoresDowntime:", -[BBBulletin ignoresDowntime](self, "ignoresDowntime"));
  objc_msgSend(v64, "setPreemptsPresentedAlert:", -[BBBulletin preemptsPresentedAlert](self, "preemptsPresentedAlert"));
  objc_msgSend(v64, "setDisplaysActionsInline:", -[BBBulletin displaysActionsInline](self, "displaysActionsInline"));
  int v42 = [(BBBulletin *)self actions];
  int v43 = (void *)[v42 mutableCopy];
  [v64 setActions:v43];

  int v44 = [(BBBulletin *)self buttons];
  [v64 setButtons:v44];

  int v45 = [(BBBulletin *)self supplementaryActionsByLayout];
  [v64 setSupplementaryActionsByLayout:v45];

  char v46 = [(BBBulletin *)self context];
  [v64 setContext:v46];

  int v47 = [(BBBulletin *)self expirationDate];
  [v64 setExpirationDate:v47];

  objc_msgSend(v64, "setExpirationEvents:", -[BBBulletin expirationEvents](self, "expirationEvents"));
  int v48 = [(BBBulletin *)self alertSuppressionContexts];
  [v64 setAlertSuppressionContexts:v48];

  int v49 = [(BBBulletin *)self bulletinID];
  [v64 setBulletinID:v49];

  int v50 = [(BBBulletin *)self lastInterruptDate];
  [v64 setLastInterruptDate:v50];

  uint64_t v51 = [(BBBulletin *)self publicationDate];
  [v64 setPublicationDate:v51];

  objc_msgSend(v64, "setUsesExternalSync:", -[BBBulletin usesExternalSync](self, "usesExternalSync"));
  objc_msgSend(v64, "setLoading:", -[BBBulletin isLoading](self, "isLoading"));
  objc_msgSend(v64, "setPreventAutomaticRemovalFromLockScreen:", -[BBBulletin preventAutomaticRemovalFromLockScreen](self, "preventAutomaticRemovalFromLockScreen"));
  objc_msgSend(v64, "setLockScreenPriority:", -[BBBulletin lockScreenPriority](self, "lockScreenPriority"));
  objc_msgSend(v64, "setBackgroundStyle:", -[BBBulletin backgroundStyle](self, "backgroundStyle"));
  uint64_t v52 = [(BBBulletin *)self header];
  [v64 setHeader:v52];

  int v53 = [(BBBulletin *)self footer];
  [v64 setFooter:v53];

  int v54 = [(BBBulletin *)self threadSummary];
  [v64 setThreadSummary:v54];

  int v55 = [(BBBulletin *)self spotlightIdentifier];
  [v64 setSpotlightIdentifier:v55];

  if ([v64 isMemberOfClass:objc_opt_class()])
  {
    int v56 = [(BBBulletin *)self bulletinVersionID];
    [v64 setBulletinVersionID:v56];

    uint64_t v57 = [v64 bulletinVersionID];

    if (!v57)
    {
      int v58 = [MEMORY[0x263F08C38] UUID];
      int v59 = [v58 UUIDString];
      [v64 setBulletinVersionID:v59];
    }
  }
  objc_msgSend(v64, "setRealertCount:", -[BBBulletin realertCount](self, "realertCount"));
  int v60 = [(BBBulletin *)self alertSuppressionAppIDs_deprecated];
  objc_msgSend(v64, "setAlertSuppressionAppIDs_deprecated:", v60);

  int v61 = [(BBBulletin *)self contentType];
  [v64 setContentType:v61];

  objc_msgSend(v64, "setScreenCaptureProhibited:", -[BBBulletin screenCaptureProhibited](self, "screenCaptureProhibited"));
  uint64_t v62 = [(BBBulletin *)self speechLanguage];
  [v64 setSpeechLanguage:v62];

  [(BBBulletin *)self relevanceScore];
  objc_msgSend(v64, "setRelevanceScore:");
  uint64_t v63 = [(BBBulletin *)self filterCriteria];
  [v64 setFilterCriteria:v63];

  [v64 copyAssociationsForBulletin:self];
}

- (NSString)publisherMatchID
{
  id v3 = [(BBBulletin *)self publisherBulletinID];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(BBBulletin *)self recordID];
  }
  uint64_t v6 = v5;

  return (NSString *)v6;
}

- (BOOL)showsMessagePreview
{
  return ![(BBBulletin *)self hasPrivateContent];
}

- (void)setShowsMessagePreview:(BOOL)a3
{
}

- (BOOL)hasPrivateContent
{
  return [(BBBulletin *)self contentPreviewSetting] == 3;
}

- (void)setHasPrivateContent:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 1;
  }
  [(BBBulletin *)self setContentPreviewSetting:v3];
}

- (id)toUNCBulletin
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(BBBulletin *)self _fillOutCopy:v5 withZone:a3];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBBulletin)initWithCoder:(id)a3
{
  v94[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v88.receiver = self;
  v88.super_class = (Class)BBBulletin;
  id v5 = [(BBBulletin *)&v88 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bulletinID"];
    [(BBBulletin *)v5 setBulletinID:v6];

    char v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"versionID"];
    [(BBBulletin *)v5 setBulletinVersionID:v7];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sectionID"];
    [(BBBulletin *)v5 setSectionID:v8];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sectionBundlePathKey"];
    [(BBBulletin *)v5 setSectionBundlePath:v9];

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"universalSectionID"];
    [(BBBulletin *)v5 setUniversalSectionID:v10];

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentSectionID"];
    [(BBBulletin *)v5 setParentSectionID:v11];

    uint64_t v12 = (void *)MEMORY[0x263EFFA08];
    v94[0] = objc_opt_class();
    v94[1] = objc_opt_class();
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v94 count:2];
    id v14 = [v12 setWithArray:v13];
    long long v15 = [v4 decodeObjectOfClasses:v14 forKey:@"subsectionIDs"];
    [(BBBulletin *)v5 setSubsectionIDs:v15];

    int v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publisherRecordID"];
    [(BBBulletin *)v5 setRecordID:v16];

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publisherBulletinID"];
    [(BBBulletin *)v5 setPublisherBulletinID:v17];

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dismissalID"];
    [(BBBulletin *)v5 setDismissalID:v18];

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"categoryID"];
    [(BBBulletin *)v5 setCategoryID:v19];

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"threadID"];
    [(BBBulletin *)v5 setThreadID:v20];

    long long v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventBehavior"];
    [(BBBulletin *)v5 setEventBehavior:v21];

    -[BBBulletin setIsHighlight:](v5, "setIsHighlight:", [v4 decodeBoolForKey:@"isHighlight"]);
    -[BBBulletin setPriorityNotificationStatus:](v5, "setPriorityNotificationStatus:", [v4 decodeIntegerForKey:@"priorityNotificationStatus"]);
    -[BBBulletin setNotificationSummaryStatus:](v5, "setNotificationSummaryStatus:", [v4 decodeIntegerForKey:@"notificationSummaryStatus"]);
    BOOL v22 = (void *)MEMORY[0x263EFFA08];
    uint64_t v23 = objc_opt_class();
    unint64_t v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"peopleIDs"];
    [(BBBulletin *)v5 setPeopleIDs:v25];

    -[BBBulletin setSectionSubtype:](v5, "setSectionSubtype:", [v4 decodeIntegerForKey:@"sectionSubtype"]);
    int64_t v26 = (void *)MEMORY[0x263EFFA08];
    uint64_t v27 = objc_opt_class();
    long long v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    long long v29 = [v4 decodeObjectOfClasses:v28 forKey:@"intentIDs"];
    [(BBBulletin *)v5 setIntentIDs:v29];

    -[BBBulletin setCounter:](v5, "setCounter:", [v4 decodeIntegerForKey:@"counter"]);
    -[BBBulletin setInterruptionLevel:](v5, "setInterruptionLevel:", [v4 decodeIntegerForKey:@"interruptionLevel"]);
    -[BBBulletin setContentPreviewSetting:](v5, "setContentPreviewSetting:", [v4 decodeIntegerForKey:@"contentPreviewSetting"]);
    [v4 decodeFloatForKey:@"relevanceScore"];
    -[BBBulletin setRelevanceScore:](v5, "setRelevanceScore:");
    long long v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filterCriteria"];
    [(BBBulletin *)v5 setFilterCriteria:v30];

    long long v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"content"];
    [(BBBulletin *)v5 setContent:v31];

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"communicationContext"];
    [(BBBulletin *)v5 setCommunicationContext:v32];

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modalAlertContent"];
    [(BBBulletin *)v5 setModalAlertContent:v33];

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"starkBannerContent"];
    [(BBBulletin *)v5 setStarkBannerContent:v34];

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"summaryArgument"];
    [(BBBulletin *)v5 setSummaryArgument:v35];

    -[BBBulletin setSummaryArgumentCount:](v5, "setSummaryArgumentCount:", [v4 decodeIntegerForKey:@"summaryArgumentCount"]);
    unint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
    [(BBBulletin *)v5 setIcon:v36];

    -[BBBulletin setHasCriticalIcon:](v5, "setHasCriticalIcon:", [v4 decodeBoolForKey:@"hasCriticalIcon"]);
    -[BBBulletin setHasSubordinateIcon:](v5, "setHasSubordinateIcon:", [v4 decodeBoolForKey:@"hasSubordinateIcon"]);
    -[BBBulletin setHasEventDate:](v5, "setHasEventDate:", [v4 decodeBoolForKey:@"hasEventDate"]);
    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    [(BBBulletin *)v5 setDate:v37];

    BOOL v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    [(BBBulletin *)v5 setEndDate:v38];

    BOOL v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recencyDate"];
    [(BBBulletin *)v5 setRecencyDate:v39];

    -[BBBulletin setDateFormatStyle:](v5, "setDateFormatStyle:", [v4 decodeIntegerForKey:@"dateFormatStyle"]);
    -[BBBulletin setDateIsAllDay:](v5, "setDateIsAllDay:", [v4 decodeBoolForKey:@"allDay"]);
    BOOL v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];
    [(BBBulletin *)v5 setTimeZone:v40];

    int v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryIconMask"];
    [(BBBulletin *)v5 setAccessoryIconMask:v41];

    int v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryImage"];
    [(BBBulletin *)v5 setAccessoryImage:v42];

    -[BBBulletin setClearable:](v5, "setClearable:", [v4 decodeBoolForKey:@"clearable"]);
    int v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sound"];
    [(BBBulletin *)v5 setSound:v43];

    -[BBBulletin setTurnsOnDisplay:](v5, "setTurnsOnDisplay:", [v4 decodeBoolForKey:@"turnsOnDisplay"]);
    int v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unlockActionLabelOverride"];
    [(BBBulletin *)v5 setUnlockActionLabelOverride:v44];

    int v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryAttachment"];
    [(BBBulletin *)v5 setPrimaryAttachment:v45];

    char v46 = (void *)MEMORY[0x263EFFA08];
    uint64_t v47 = objc_opt_class();
    int v48 = objc_msgSend(v46, "setWithObjects:", v47, objc_opt_class(), 0);
    int v49 = [v4 decodeObjectOfClasses:v48 forKey:@"additionalAttachments"];
    [(BBBulletin *)v5 setAdditionalAttachments:v49];

    -[BBBulletin setWantsFullscreenPresentation:](v5, "setWantsFullscreenPresentation:", [v4 decodeBoolForKey:@"wantsFullscreenPresentation"]);
    -[BBBulletin setIgnoresQuietMode:](v5, "setIgnoresQuietMode:", [v4 decodeBoolForKey:@"ignoresQuietMode"]);
    -[BBBulletin setIgnoresDowntime:](v5, "setIgnoresDowntime:", [v4 decodeBoolForKey:@"ignoresDowntime"]);
    -[BBBulletin setPreemptsPresentedAlert:](v5, "setPreemptsPresentedAlert:", [v4 decodeBoolForKey:@"preemptsPresentedAlert"]);
    -[BBBulletin setDisplaysActionsInline:](v5, "setDisplaysActionsInline:", [v4 decodeBoolForKey:@"displaysActionsInline"]);
    int v50 = (void *)MEMORY[0x263EFFA08];
    v93[0] = objc_opt_class();
    v93[1] = objc_opt_class();
    v93[2] = objc_opt_class();
    uint64_t v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v93 count:3];
    uint64_t v52 = [v50 setWithArray:v51];
    int v53 = [v4 decodeObjectOfClasses:v52 forKey:@"actions"];
    [(BBBulletin *)v5 setActions:v53];

    int v54 = (void *)MEMORY[0x263EFFA08];
    v92[0] = objc_opt_class();
    v92[1] = objc_opt_class();
    int v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:v92 count:2];
    int v56 = [v54 setWithArray:v55];
    uint64_t v57 = [v4 decodeObjectOfClasses:v56 forKey:@"buttons"];
    [(BBBulletin *)v5 setButtons:v57];

    int v58 = (void *)MEMORY[0x263EFFA08];
    v91[0] = objc_opt_class();
    v91[1] = objc_opt_class();
    v91[2] = objc_opt_class();
    v91[3] = objc_opt_class();
    int v59 = [MEMORY[0x263EFF8C0] arrayWithObjects:v91 count:4];
    int v60 = [v58 setWithArray:v59];
    int v61 = [v4 decodeObjectOfClasses:v60 forKey:@"supplementaryActionsByLayout"];
    [(BBBulletin *)v5 setSupplementaryActionsByLayout:v61];

    uint64_t v62 = (void *)MEMORY[0x263EFFA08];
    v90[0] = objc_opt_class();
    v90[1] = objc_opt_class();
    uint64_t v63 = [MEMORY[0x263EFF8C0] arrayWithObjects:v90 count:2];
    id v64 = [v62 setWithArray:v63];
    uint64_t v65 = [v4 decodeObjectOfClasses:v64 forKey:@"alertSuppressionContexts"];
    [(BBBulletin *)v5 setAlertSuppressionContexts:v65];

    uint64_t v66 = BBAllowedClasses();
    uint64_t v67 = [v4 decodeObjectOfClasses:v66 forKey:@"context"];
    [(BBBulletin *)v5 setContext:v67];

    int64_t v68 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    [(BBBulletin *)v5 setExpirationDate:v68];

    -[BBBulletin setExpirationEvents:](v5, "setExpirationEvents:", [v4 decodeIntegerForKey:@"expirationEvents"]);
    BOOL v69 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastInterruptDate"];
    [(BBBulletin *)v5 setLastInterruptDate:v69];

    uint64_t v70 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicationDate"];
    [(BBBulletin *)v5 setPublicationDate:v70];

    -[BBBulletin setUsesExternalSync:](v5, "setUsesExternalSync:", [v4 decodeBoolForKey:@"usesExternalSync"]);
    -[BBBulletin setLoading:](v5, "setLoading:", [v4 decodeBoolForKey:@"loading"]);
    -[BBBulletin setPreventAutomaticRemovalFromLockScreen:](v5, "setPreventAutomaticRemovalFromLockScreen:", [v4 decodeBoolForKey:@"preventAutomaticRemovalFromLockScreen"]);
    -[BBBulletin setLockScreenPriority:](v5, "setLockScreenPriority:", [v4 decodeIntegerForKey:@"lockScreenPriority"]);
    -[BBBulletin setBackgroundStyle:](v5, "setBackgroundStyle:", [v4 decodeIntegerForKey:@"backgroundStyle"]);
    uint64_t v71 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"header"];
    [(BBBulletin *)v5 setHeader:v71];

    uint64_t v72 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"footer"];
    [(BBBulletin *)v5 setFooter:v72];

    BOOL v73 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"threadSummary"];
    [(BBBulletin *)v5 setThreadSummary:v73];

    uint64_t v74 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"spotlightIdentifier"];
    [(BBBulletin *)v5 setSpotlightIdentifier:v74];

    -[BBBulletin setRealertCount:](v5, "setRealertCount:", [v4 decodeIntegerForKey:@"realertCount"]);
    BOOL v75 = (void *)MEMORY[0x263EFFA08];
    v89[0] = objc_opt_class();
    v89[1] = objc_opt_class();
    uint64_t v76 = [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:2];
    uint64_t v77 = [v75 setWithArray:v76];
    uint64_t v78 = [v4 decodeObjectOfClasses:v77 forKey:@"alertSuppressionIDs"];
    [(BBBulletin *)v5 setAlertSuppressionAppIDs_deprecated:v78];

    BOOL v79 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentType"];
    [(BBBulletin *)v5 setContentType:v79];

    -[BBBulletin setScreenCaptureProhibited:](v5, "setScreenCaptureProhibited:", [v4 decodeBoolForKey:@"screenCaptureProhibited"]);
    BOOL v80 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"speechLanguage"];
    [(BBBulletin *)v5 setSpeechLanguage:v80];

    if ([v4 containsValueForKey:@"attachments"])
    {
      BOOL v81 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attachments"];
      if ([v81 primaryType])
      {
        BOOL v82 = objc_alloc_init(BBMutableAttachmentMetadata);
        -[BBMutableAttachmentMetadata setType:](v82, "setType:", [v81 primaryType]);
        [(BBBulletin *)v5 setPrimaryAttachment:v82];
      }
      for (uint64_t i = 1; i != 7; ++i)
      {
        uint64_t v84 = [MEMORY[0x263EFF980] array];
        for (uint64_t j = [v81 numberOfAdditionalAttachmentsOfType:i]; j; --j)
        {
          uint64_t v86 = objc_alloc_init(BBMutableAttachmentMetadata);
          [(BBMutableAttachmentMetadata *)v86 setType:i];
          [v84 addObject:v86];
        }
        if ([v84 count]) {
          [(BBBulletin *)v5 setAdditionalAttachments:v84];
        }
      }
    }
    if ([v4 containsValueForKey:@"hasPrivateContent"]) {
      -[BBBulletin setHasPrivateContent:](v5, "setHasPrivateContent:", [v4 decodeBoolForKey:@"hasPrivateContent"]);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BBBulletin *)self bulletinID];
  [v4 encodeObject:v5 forKey:@"bulletinID"];

  uint64_t v6 = [(BBBulletin *)self sectionID];
  [v4 encodeObject:v6 forKey:@"sectionID"];

  char v7 = [(BBBulletin *)self sectionBundlePath];
  [v4 encodeObject:v7 forKey:@"sectionBundlePathKey"];

  uint64_t v8 = [(BBBulletin *)self universalSectionID];
  [v4 encodeObject:v8 forKey:@"universalSectionID"];

  uint64_t v9 = [(BBBulletin *)self parentSectionID];
  [v4 encodeObject:v9 forKey:@"parentSectionID"];

  uint64_t v10 = [(BBBulletin *)self subsectionIDs];
  [v4 encodeObject:v10 forKey:@"subsectionIDs"];

  uint64_t v11 = [(BBBulletin *)self recordID];
  [v4 encodeObject:v11 forKey:@"publisherRecordID"];

  uint64_t v12 = [(BBBulletin *)self publisherBulletinID];
  [v4 encodeObject:v12 forKey:@"publisherBulletinID"];

  id v13 = [(BBBulletin *)self dismissalID];
  [v4 encodeObject:v13 forKey:@"dismissalID"];

  id v14 = [(BBBulletin *)self categoryID];
  [v4 encodeObject:v14 forKey:@"categoryID"];

  long long v15 = [(BBBulletin *)self threadID];
  [v4 encodeObject:v15 forKey:@"threadID"];

  int v16 = [(BBBulletin *)self eventBehavior];
  [v4 encodeObject:v16 forKey:@"eventBehavior"];

  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin isHighlight](self, "isHighlight"), @"isHighlight");
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin priorityNotificationStatus](self, "priorityNotificationStatus"), @"priorityNotificationStatus");
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin notificationSummaryStatus](self, "notificationSummaryStatus"), @"notificationSummaryStatus");
  uint64_t v17 = [(BBBulletin *)self peopleIDs];
  [v4 encodeObject:v17 forKey:@"peopleIDs"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin sectionSubtype](self, "sectionSubtype"), @"sectionSubtype");
  uint64_t v18 = [(BBBulletin *)self intentIDs];
  [v4 encodeObject:v18 forKey:@"intentIDs"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin counter](self, "counter"), @"counter");
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin interruptionLevel](self, "interruptionLevel"), @"interruptionLevel");
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin contentPreviewSetting](self, "contentPreviewSetting"), @"contentPreviewSetting");
  [(BBBulletin *)self relevanceScore];
  objc_msgSend(v4, "encodeFloat:forKey:", @"relevanceScore");
  uint64_t v19 = [(BBBulletin *)self filterCriteria];
  [v4 encodeObject:v19 forKey:@"filterCriteria"];

  uint64_t v20 = [(BBBulletin *)self content];
  [v4 encodeObject:v20 forKey:@"content"];

  long long v21 = [(BBBulletin *)self modalAlertContent];
  [v4 encodeObject:v21 forKey:@"modalAlertContent"];

  BOOL v22 = [(BBBulletin *)self starkBannerContent];
  [v4 encodeObject:v22 forKey:@"starkBannerContent"];

  uint64_t v23 = [(BBBulletin *)self communicationContext];
  [v4 encodeObject:v23 forKey:@"communicationContext"];

  unint64_t v24 = [(BBBulletin *)self summaryArgument];
  [v4 encodeObject:v24 forKey:@"summaryArgument"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin summaryArgumentCount](self, "summaryArgumentCount"), @"summaryArgumentCount");
  uint64_t v25 = [(BBBulletin *)self icon];
  [v4 encodeObject:v25 forKey:@"icon"];

  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin hasCriticalIcon](self, "hasCriticalIcon"), @"hasCriticalIcon");
  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin hasSubordinateIcon](self, "hasSubordinateIcon"), @"hasSubordinateIcon");
  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin hasEventDate](self, "hasEventDate"), @"hasEventDate");
  int64_t v26 = [(BBBulletin *)self date];
  [v4 encodeObject:v26 forKey:@"date"];

  uint64_t v27 = [(BBBulletin *)self endDate];
  [v4 encodeObject:v27 forKey:@"endDate"];

  long long v28 = [(BBBulletin *)self recencyDate];
  [v4 encodeObject:v28 forKey:@"recencyDate"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin dateFormatStyle](self, "dateFormatStyle"), @"dateFormatStyle");
  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin dateIsAllDay](self, "dateIsAllDay"), @"allDay");
  long long v29 = [(BBBulletin *)self timeZone];
  [v4 encodeObject:v29 forKey:@"timeZone"];

  long long v30 = [(BBBulletin *)self accessoryIconMask];
  [v4 encodeObject:v30 forKey:@"accessoryIconMask"];

  long long v31 = [(BBBulletin *)self accessoryImage];
  [v4 encodeObject:v31 forKey:@"accessoryImage"];

  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin clearable](self, "clearable"), @"clearable");
  uint64_t v32 = [(BBBulletin *)self sound];
  [v4 encodeObject:v32 forKey:@"sound"];

  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin turnsOnDisplay](self, "turnsOnDisplay"), @"turnsOnDisplay");
  uint64_t v33 = [(BBBulletin *)self unlockActionLabelOverride];
  [v4 encodeObject:v33 forKey:@"unlockActionLabelOverride"];

  uint64_t v34 = [(BBBulletin *)self primaryAttachment];
  [v4 encodeObject:v34 forKey:@"primaryAttachment"];

  uint64_t v35 = [(BBBulletin *)self additionalAttachments];
  [v4 encodeObject:v35 forKey:@"additionalAttachments"];

  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin wantsFullscreenPresentation](self, "wantsFullscreenPresentation"), @"wantsFullscreenPresentation");
  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin ignoresQuietMode](self, "ignoresQuietMode"), @"ignoresQuietMode");
  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin ignoresDowntime](self, "ignoresDowntime"), @"ignoresDowntime");
  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin preemptsPresentedAlert](self, "preemptsPresentedAlert"), @"preemptsPresentedAlert");
  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin displaysActionsInline](self, "displaysActionsInline"), @"displaysActionsInline");
  unint64_t v36 = [(BBBulletin *)self actions];
  [v4 encodeObject:v36 forKey:@"actions"];

  uint64_t v37 = [(BBBulletin *)self buttons];
  [v4 encodeObject:v37 forKey:@"buttons"];

  BOOL v38 = [(BBBulletin *)self supplementaryActionsByLayout];
  [v4 encodeObject:v38 forKey:@"supplementaryActionsByLayout"];

  BOOL v39 = [(BBBulletin *)self alertSuppressionContexts];
  [v4 encodeObject:v39 forKey:@"alertSuppressionContexts"];

  BOOL v40 = [(BBBulletin *)self context];
  [v4 encodeObject:v40 forKey:@"context"];

  int v41 = [(BBBulletin *)self expirationDate];
  [v4 encodeObject:v41 forKey:@"expirationDate"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin expirationEvents](self, "expirationEvents"), @"expirationEvents");
  int v42 = [(BBBulletin *)self lastInterruptDate];
  [v4 encodeObject:v42 forKey:@"lastInterruptDate"];

  int v43 = [(BBBulletin *)self publicationDate];
  [v4 encodeObject:v43 forKey:@"publicationDate"];

  int v44 = [(BBBulletin *)self bulletinVersionID];
  [v4 encodeObject:v44 forKey:@"versionID"];

  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin usesExternalSync](self, "usesExternalSync"), @"usesExternalSync");
  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin isLoading](self, "isLoading"), @"loading");
  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin preventAutomaticRemovalFromLockScreen](self, "preventAutomaticRemovalFromLockScreen"), @"preventAutomaticRemovalFromLockScreen");
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin lockScreenPriority](self, "lockScreenPriority"), @"lockScreenPriority");
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin backgroundStyle](self, "backgroundStyle"), @"backgroundStyle");
  int v45 = [(BBBulletin *)self header];
  [v4 encodeObject:v45 forKey:@"header"];

  char v46 = [(BBBulletin *)self footer];
  [v4 encodeObject:v46 forKey:@"footer"];

  uint64_t v47 = [(BBBulletin *)self threadSummary];
  [v4 encodeObject:v47 forKey:@"threadSummary"];

  int v48 = [(BBBulletin *)self spotlightIdentifier];
  [v4 encodeObject:v48 forKey:@"spotlightIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin realertCount](self, "realertCount"), @"realertCount");
  int v49 = [(BBBulletin *)self alertSuppressionAppIDs_deprecated];
  [v4 encodeObject:v49 forKey:@"alertSuppressionIDs"];

  int v50 = [(BBBulletin *)self contentType];
  [v4 encodeObject:v50 forKey:@"contentType"];

  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin screenCaptureProhibited](self, "screenCaptureProhibited"), @"screenCaptureProhibited");
  id v51 = [(BBBulletin *)self speechLanguage];
  [v4 encodeObject:v51 forKey:@"speechLanguage"];
}

- (id)_safeDescription:(BOOL)a3
{
  long long v30 = NSString;
  uint64_t v29 = objc_opt_class();
  uint64_t v37 = [(BBBulletin *)self bulletinID];
  unint64_t v36 = [(BBBulletin *)self bulletinVersionID];
  uint64_t v35 = [(BBBulletin *)self sectionID];
  int64_t v27 = [(BBBulletin *)self sectionSubtype];
  uint64_t v34 = [(BBBulletin *)self publisherBulletinID];
  uint64_t v33 = [(BBBulletin *)self categoryID];
  if (a3)
  {
    uint64_t v32 = @"<redacted>";
    id v5 = @"<redacted>";
  }
  else
  {
    uint64_t v32 = [(BBBulletin *)self threadID];
    id v5 = [(BBBulletin *)self peopleIDs];
  }
  uint64_t v6 = [(BBBulletin *)self communicationContext];
  long long v28 = (__CFString *)v6;
  if (v6) {
    BOOL v7 = a3;
  }
  else {
    BOOL v7 = 1;
  }
  if (v6) {
    uint64_t v8 = @"<redacted>";
  }
  else {
    uint64_t v8 = @"(null)";
  }
  BOOL v26 = v7;
  long long v31 = v5;
  if (!v7)
  {
    uint64_t v8 = [(BBBulletin *)self communicationContext];
  }
  uint64_t v9 = [(BBBulletin *)self recordID];
  uint64_t v10 = [(BBBulletin *)self intentIDs];
  if (a3)
  {
    uint64_t v11 = @"<redacted>";
  }
  else
  {
    uint64_t v11 = [(BBBulletin *)self content];
  }
  uint64_t v12 = [(BBBulletin *)self date];
  id v13 = [(BBBulletin *)self sound];
  unint64_t v14 = [(BBBulletin *)self interruptionLevel];
  [(BBBulletin *)self relevanceScore];
  double v16 = v15;
  uint64_t v17 = [(BBBulletin *)self filterCriteria];
  objc_msgSend(v30, "stringWithFormat:", @"<%@: %p; ID: %@; versionID: %@> {\n\t%@ / subtype = %ld\n\tPublisher Bulletin ID: %@\n\tCategory ID: %@\n\tThread ID: %@\n\tPeople IDs: %@\n\tCommunication Context: %@\n\tRecord ID: %@\n\tIntent IDs: %@\n\tContent: %@\n\tDate: %@\n\tSound: %@\n\tInterruption Level: %lu\n\t Relevance Score: %.2f\n\t Filteria Criteria: %@",
    v29,
    self,
    v37,
    v36,
    v35,
    v27,
    v34,
    v33,
    v32,
    v31,
    v8,
    v9,
    v10,
    v11,
    v12,
    v13,
    v14,
    *(void *)&v16,
  uint64_t v18 = v17);

  if (a3)
  {
    uint64_t v19 = v28;
  }
  else
  {

    if (!v26) {
    uint64_t v10 = v28;
    }
    uint64_t v9 = v31;
    uint64_t v19 = v32;
  }

  uint64_t v20 = [(BBBulletin *)self subsectionIDs];
  uint64_t v21 = [v20 count];

  if (v21)
  {
    BOOL v22 = [(BBBulletin *)self subsectionIDs];
    uint64_t v23 = [v18 stringByAppendingFormat:@"\n\tSubsections: %@", v22];

    uint64_t v18 = (void *)v23;
  }
  unint64_t v24 = [v18 stringByAppendingString:@"\n}"];

  return v24;
}

- (id)description
{
  uint64_t v3 = BSIsBeingDebugged() ^ 1;
  return [(BBBulletin *)self _safeDescription:v3];
}

- (id)safeDescription
{
  return [(BBBulletin *)self _safeDescription:1];
}

- (id)shortDescription
{
  if (self->_sectionID || self->_bulletinID) {
    objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; [%@] bulletinID: %@; publisherBulletinID: %@, categoryID:%@, threadID:%@, peopleIDs:%@, recordID: %@; intentIDs: %@; revisionID: %@>",
  }
      objc_opt_class(),
      self,
      self->_sectionID,
      self->_bulletinID,
      self->_publisherBulletinID,
      self->_categoryID,
      self->_threadID,
      self->_peopleIDs,
      self->_publisherRecordID,
      self->_intentIDs,
      self->_bulletinVersionID);
  else {
    objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; (no identifying details)>",
  }
      objc_opt_class(),
      self,
      v4,
      v5,
      v6,
      v7,
      v8,
      v9,
      v10,
      v11,
  v2 = v12);
  return v2;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (NSString)sectionBundlePath
{
  return self->_sectionBundlePath;
}

- (void)setSectionBundlePath:(id)a3
{
}

- (NSSet)subsectionIDs
{
  return self->_subsectionIDs;
}

- (void)setSubsectionIDs:(id)a3
{
}

- (NSString)recordID
{
  return self->_publisherRecordID;
}

- (void)setRecordID:(id)a3
{
}

- (NSString)publisherBulletinID
{
  return self->_publisherBulletinID;
}

- (void)setPublisherBulletinID:(id)a3
{
}

- (NSString)dismissalID
{
  return self->_dismissalID;
}

- (void)setDismissalID:(id)a3
{
}

- (NSString)categoryID
{
  return self->_categoryID;
}

- (void)setCategoryID:(id)a3
{
}

- (NSString)threadID
{
  return self->_threadID;
}

- (void)setThreadID:(id)a3
{
}

- (DNDClientEventBehavior)eventBehavior
{
  return self->_eventBehavior;
}

- (void)setEventBehavior:(id)a3
{
}

- (BOOL)isHighlight
{
  return self->_isHighlight;
}

- (void)setIsHighlight:(BOOL)a3
{
  self->_isHighlight = a3;
}

- (unint64_t)priorityNotificationStatus
{
  return self->_priorityNotificationStatus;
}

- (void)setPriorityNotificationStatus:(unint64_t)a3
{
  self->_priorityNotificationStatus = a3;
}

- (unint64_t)notificationSummaryStatus
{
  return self->_notificationSummaryStatus;
}

- (void)setNotificationSummaryStatus:(unint64_t)a3
{
  self->_notificationSummaryStatus = a3;
}

- (NSArray)peopleIDs
{
  return self->_peopleIDs;
}

- (void)setPeopleIDs:(id)a3
{
}

- (int64_t)sectionSubtype
{
  return self->_sectionSubtype;
}

- (void)setSectionSubtype:(int64_t)a3
{
  self->_sectionSubtype = a3;
}

- (NSArray)intentIDs
{
  return self->_intentIDs;
}

- (void)setIntentIDs:(id)a3
{
}

- (unint64_t)counter
{
  return self->_counter;
}

- (void)setCounter:(unint64_t)a3
{
  self->_counter = a3;
}

- (unint64_t)interruptionLevel
{
  return self->_interruptionLevel;
}

- (void)setInterruptionLevel:(unint64_t)a3
{
  self->_interruptionLevel = a3;
}

- (float)relevanceScore
{
  return self->_relevanceScore;
}

- (void)setRelevanceScore:(float)a3
{
  self->_relevanceScore = a3;
}

- (NSString)filterCriteria
{
  return self->_filterCriteria;
}

- (void)setFilterCriteria:(id)a3
{
}

- (void)setContent:(id)a3
{
}

- (BBContent)modalAlertContent
{
  return self->_modalAlertContent;
}

- (void)setModalAlertContent:(id)a3
{
}

- (BBContent)starkBannerContent
{
  return self->_starkBannerContent;
}

- (void)setStarkBannerContent:(id)a3
{
}

- (NSString)summaryArgument
{
  return self->_summaryArgument;
}

- (void)setSummaryArgument:(id)a3
{
}

- (unint64_t)summaryArgumentCount
{
  return self->_summaryArgumentCount;
}

- (void)setSummaryArgumentCount:(unint64_t)a3
{
  self->_summaryArgumentCount = a3;
}

- (BBSectionIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (BOOL)hasCriticalIcon
{
  return self->_hasCriticalIcon;
}

- (void)setHasCriticalIcon:(BOOL)a3
{
  self->_hasCriticalIcon = a3;
}

- (BOOL)hasSubordinateIcon
{
  return self->_hasSubordinateIcon;
}

- (void)setHasSubordinateIcon:(BOOL)a3
{
  self->_hasSubordinateIcon = a3;
}

- (BOOL)hasEventDate
{
  return self->_hasEventDate;
}

- (void)setHasEventDate:(BOOL)a3
{
  self->_hasEventDate = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)recencyDate
{
  return self->_recencyDate;
}

- (void)setRecencyDate:(id)a3
{
}

- (int64_t)dateFormatStyle
{
  return self->_dateFormatStyle;
}

- (void)setDateFormatStyle:(int64_t)a3
{
  self->_dateFormatStyle = a3;
}

- (BOOL)dateIsAllDay
{
  return self->_dateIsAllDay;
}

- (void)setDateIsAllDay:(BOOL)a3
{
  self->_dateIsAllDay = a3;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (BBAccessoryIcon)accessoryIconMask
{
  return self->_accessoryIconMask;
}

- (void)setAccessoryIconMask:(id)a3
{
}

- (BBImage)accessoryImage
{
  return self->_accessoryImage;
}

- (void)setAccessoryImage:(id)a3
{
}

- (BOOL)clearable
{
  return self->_clearable;
}

- (void)setClearable:(BOOL)a3
{
  self->_clearable = a3;
}

- (BBSound)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
}

- (BOOL)turnsOnDisplay
{
  return self->_turnsOnDisplay;
}

- (void)setTurnsOnDisplay:(BOOL)a3
{
  self->_turnsOnDisplay = a3;
}

- (BBAttachmentMetadata)primaryAttachment
{
  return self->_primaryAttachment;
}

- (void)setPrimaryAttachment:(id)a3
{
}

- (NSArray)additionalAttachments
{
  return self->_additionalAttachments;
}

- (void)setAdditionalAttachments:(id)a3
{
}

- (NSString)unlockActionLabelOverride
{
  return self->_unlockActionLabelOverride;
}

- (void)setUnlockActionLabelOverride:(id)a3
{
}

- (BOOL)wantsFullscreenPresentation
{
  return self->_wantsFullscreenPresentation;
}

- (void)setWantsFullscreenPresentation:(BOOL)a3
{
  self->_wantsFullscreenPresentation = a3;
}

- (BOOL)ignoresQuietMode
{
  return self->_ignoresQuietMode;
}

- (void)setIgnoresQuietMode:(BOOL)a3
{
  self->_ignoresQuietMode = a3;
}

- (BOOL)ignoresDowntime
{
  return self->_ignoresDowntime;
}

- (void)setIgnoresDowntime:(BOOL)a3
{
  self->_ignoresDowntime = a3;
}

- (BOOL)preemptsPresentedAlert
{
  return self->_preemptsPresentedAlert;
}

- (void)setPreemptsPresentedAlert:(BOOL)a3
{
  self->_preemptsPresentedAlert = a3;
}

- (BOOL)displaysActionsInline
{
  return self->_displaysActionsInline;
}

- (void)setDisplaysActionsInline:(BOOL)a3
{
  self->_displaysActionsInline = a3;
}

- (NSMutableDictionary)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (NSMutableDictionary)supplementaryActionsByLayout
{
  return self->_supplementaryActionsByLayout;
}

- (void)setSupplementaryActionsByLayout:(id)a3
{
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (BOOL)expiresOnPublisherDeath
{
  return self->_expiresOnPublisherDeath;
}

- (void)setExpiresOnPublisherDeath:(BOOL)a3
{
  self->_expiresOnPublisherDeath = a3;
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (unint64_t)expirationEvents
{
  return self->_expirationEvents;
}

- (void)setExpirationEvents:(unint64_t)a3
{
  self->_expirationEvents = a3;
}

- (NSSet)alertSuppressionContexts
{
  return self->_alertSuppressionContexts;
}

- (NSString)bulletinID
{
  return self->_bulletinID;
}

- (void)setBulletinID:(id)a3
{
}

- (NSDate)lastInterruptDate
{
  return self->_lastInterruptDate;
}

- (void)setLastInterruptDate:(id)a3
{
}

- (NSDate)publicationDate
{
  return self->_publicationDate;
}

- (void)setPublicationDate:(id)a3
{
}

- (NSString)bulletinVersionID
{
  return self->_bulletinVersionID;
}

- (void)setBulletinVersionID:(id)a3
{
}

- (BOOL)usesExternalSync
{
  return self->_usesExternalSync;
}

- (void)setUsesExternalSync:(BOOL)a3
{
  self->_usesExternalSync = a3;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (NSString)parentSectionID
{
  return self->_parentSectionID;
}

- (void)setParentSectionID:(id)a3
{
}

- (NSString)universalSectionID
{
  return self->_universalSectionID;
}

- (void)setUniversalSectionID:(id)a3
{
}

- (int64_t)contentPreviewSetting
{
  return self->_contentPreviewSetting;
}

- (void)setContentPreviewSetting:(int64_t)a3
{
  self->_contentPreviewSetting = a3;
}

- (BOOL)preventAutomaticRemovalFromLockScreen
{
  return self->_preventAutomaticRemovalFromLockScreen;
}

- (void)setPreventAutomaticRemovalFromLockScreen:(BOOL)a3
{
  self->_preventAutomaticRemovalFromLockScreen = a3;
}

- (int64_t)lockScreenPriority
{
  return self->_lockScreenPriority;
}

- (void)setLockScreenPriority:(int64_t)a3
{
  self->_lockScreenPriority = a3;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (NSAttributedString)threadSummary
{
  return self->_threadSummary;
}

- (void)setThreadSummary:(id)a3
{
}

- (NSString)spotlightIdentifier
{
  return self->_spotlightIdentifier;
}

- (void)setSpotlightIdentifier:(id)a3
{
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (unint64_t)realertCount
{
  return self->realertCount;
}

- (void)setRealertCount:(unint64_t)a3
{
  self->realertCount = a3;
}

- (NSSet)alertSuppressionAppIDs_deprecated
{
  return self->alertSuppressionAppIDs_deprecated;
}

- (void)setAlertSuppressionAppIDs_deprecated:(id)a3
{
}

- (BBCommunicationContext)communicationContext
{
  return self->_communicationContext;
}

- (void)setCommunicationContext:(id)a3
{
}

- (BOOL)screenCaptureProhibited
{
  return self->_screenCaptureProhibited;
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  self->_screenCaptureProhibited = a3;
}

- (NSString)speechLanguage
{
  return self->_speechLanguage;
}

- (void)setSpeechLanguage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechLanguage, 0);
  objc_storeStrong((id *)&self->_communicationContext, 0);
  objc_storeStrong((id *)&self->alertSuppressionAppIDs_deprecated, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_spotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_threadSummary, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_universalSectionID, 0);
  objc_storeStrong((id *)&self->_parentSectionID, 0);
  objc_storeStrong((id *)&self->_bulletinVersionID, 0);
  objc_storeStrong((id *)&self->_publicationDate, 0);
  objc_storeStrong((id *)&self->_lastInterruptDate, 0);
  objc_storeStrong((id *)&self->_bulletinID, 0);
  objc_storeStrong((id *)&self->_alertSuppressionContexts, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_supplementaryActionsByLayout, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_unlockActionLabelOverride, 0);
  objc_storeStrong((id *)&self->_additionalAttachments, 0);
  objc_storeStrong((id *)&self->_primaryAttachment, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_accessoryImage, 0);
  objc_storeStrong((id *)&self->_accessoryIconMask, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_recencyDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_summaryArgument, 0);
  objc_storeStrong((id *)&self->_starkBannerContent, 0);
  objc_storeStrong((id *)&self->_modalAlertContent, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_filterCriteria, 0);
  objc_storeStrong((id *)&self->_intentIDs, 0);
  objc_storeStrong((id *)&self->_peopleIDs, 0);
  objc_storeStrong((id *)&self->_eventBehavior, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_categoryID, 0);
  objc_storeStrong((id *)&self->_dismissalID, 0);
  objc_storeStrong((id *)&self->_publisherBulletinID, 0);
  objc_storeStrong((id *)&self->_publisherRecordID, 0);
  objc_storeStrong((id *)&self->_subsectionIDs, 0);
  objc_storeStrong((id *)&self->_sectionBundlePath, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

+ (id)_lifeAssertionAssociationSet
{
  if (_lifeAssertionAssociationSet___onceToken != -1) {
    dispatch_once(&_lifeAssertionAssociationSet___onceToken, &__block_literal_global_5);
  }
  v2 = (void *)_lifeAssertionAssociationSet___lifeAssertionAssociationSet;
  return v2;
}

uint64_t __56__BBBulletin_Associations___lifeAssertionAssociationSet__block_invoke()
{
  _lifeAssertionAssociationSet___lifeAssertionAssociationSet = +[BBAssociationSet setWithStrongAssociation];
  return MEMORY[0x270F9A758]();
}

- (id)lifeAssertions
{
  id v3 = [(id)objc_opt_class() _lifeAssertionAssociationSet];
  objc_sync_enter(v3);
  uint64_t v4 = [v3 associatedObjectsForObject:self];
  objc_sync_exit(v3);

  uint64_t v5 = [v4 allObjects];

  return v5;
}

- (void)addLifeAssertion:(id)a3
{
  id v5 = a3;
  id v4 = [(id)objc_opt_class() _lifeAssertionAssociationSet];
  objc_sync_enter(v4);
  [v4 associateObject:v5 withObject:self];
  objc_sync_exit(v4);
}

+ (id)_observerAssociationSet
{
  if (_observerAssociationSet___onceToken != -1) {
    dispatch_once(&_observerAssociationSet___onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_observerAssociationSet___observerAssociationSet;
  return v2;
}

uint64_t __51__BBBulletin_Associations___observerAssociationSet__block_invoke()
{
  _observerAssociationSet___observerAssociationSet = +[BBAssociationSet setWithWeakAssociation];
  return MEMORY[0x270F9A758]();
}

- (id)firstValidObserver
{
  id v3 = [(id)objc_opt_class() _observerAssociationSet];
  objc_sync_enter(v3);
  id v4 = [v3 associatedObjectsForObject:self];
  objc_sync_exit(v3);

  id v5 = [v4 anyObject];

  return v5;
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  id v4 = [(id)objc_opt_class() _observerAssociationSet];
  objc_sync_enter(v4);
  [v4 associateObject:v5 withObject:self];
  objc_sync_exit(v4);
}

- (void)copyAssociationsForBulletin:(id)a3
{
  id v8 = a3;
  id v4 = [(id)objc_opt_class() _lifeAssertionAssociationSet];
  id v5 = [(id)objc_opt_class() _observerAssociationSet];
  id v6 = v4;
  objc_sync_enter(v6);
  [v6 copyAssociationsForObject:v8 toObject:self];
  objc_sync_exit(v6);

  id v7 = v5;
  objc_sync_enter(v7);
  [v7 copyAssociationsForObject:v8 toObject:self];
  objc_sync_exit(v7);
}

- (NSString)sectionDisplayName
{
  v2 = [(BBBulletin *)self _sectionParameters];
  id v3 = [v2 displayName];

  return (NSString *)v3;
}

- (BBSectionIcon)sectionIcon
{
  id v3 = [(BBBulletin *)self icon];
  id v4 = [(BBBulletin *)self _sectionSubtypeParameters];
  id v5 = [v4 sectionIconOverride];
  id v6 = [(BBBulletin *)self _sectionParameters];
  uint64_t v7 = [v6 icon];
  id v8 = (void *)v7;
  if (v5) {
    uint64_t v9 = v5;
  }
  else {
    uint64_t v9 = (void *)v7;
  }
  if (v3) {
    uint64_t v10 = v3;
  }
  else {
    uint64_t v10 = v9;
  }
  uint64_t v11 = v10;

  return v11;
}

- (BOOL)showsSubtitle
{
  v2 = [(BBBulletin *)self _sectionParameters];
  char v3 = [v2 showsSubtitle];

  return v3;
}

- (unint64_t)messageNumberOfLines
{
  v2 = [(BBBulletin *)self _sectionParameters];
  unint64_t v3 = [v2 messageNumberOfLines];

  return v3;
}

- (BOOL)usesVariableLayout
{
  v2 = [(BBBulletin *)self _sectionParameters];
  char v3 = [v2 usesVariableLayout];

  return v3;
}

- (BOOL)orderSectionUsingRecencyDate
{
  v2 = [(BBBulletin *)self _sectionParameters];
  char v3 = [v2 orderSectionUsingRecencyDate];

  return v3;
}

- (BOOL)showsDateInFloatingLockScreenAlert
{
  v2 = [(BBBulletin *)self _sectionParameters];
  char v3 = [v2 showsDateInFloatingLockScreenAlert];

  return v3;
}

- (NSString)hiddenPreviewsBodyPlaceholder
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 hiddenPreviewsBodyPlaceholder];

  return (NSString *)v3;
}

- (NSString)subtypeSummaryFormat
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 subtypeSummaryFormat];

  return (NSString *)v3;
}

- (NSString)topic
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 topic];

  return (NSString *)v3;
}

- (NSString)missedBannerDescriptionFormat
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 missedBannerDescriptionFormat];

  return (NSString *)v3;
}

- (NSString)fullUnlockActionLabel
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 fullUnlockActionLabel];

  return (NSString *)v3;
}

- (NSString)unlockActionLabel
{
  char v3 = [(BBBulletin *)self unlockActionLabelOverride];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(BBBulletin *)self _sectionSubtypeParameters];
    id v5 = [v6 unlockActionLabel];
  }
  return (NSString *)v5;
}

- (NSString)fullAlternateActionLabel
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 fullAlternateActionLabel];

  return (NSString *)v3;
}

- (NSString)alternateActionLabel
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 alternateActionLabel];

  return (NSString *)v3;
}

- (NSSet)alertSuppressionAppIDs
{
  if ([(BBBulletin *)self suppressesAlertsWhenAppIsActive])
  {
    char v3 = (void *)MEMORY[0x263EFFA08];
    id v4 = [(BBBulletin *)self sectionID];
    id v5 = [v3 setWithObject:v4];
  }
  else
  {
    id v5 = 0;
  }
  return (NSSet *)v5;
}

- (BOOL)suppressesAlertsWhenAppIsActive
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 suppressesAlertsWhenAppIsActive];

  return v3;
}

- (BOOL)coalescesWhenLocked
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 coalescesWhenLocked];

  return v3;
}

- (BOOL)suppressesMessageForPrivacy
{
  return [(BBBulletin *)self contentPreviewSetting] == 3;
}

- (BOOL)inertWhenLocked
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 inertWhenLocked];

  return v3;
}

- (BOOL)preservesUnlockActionCase
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 preservesUnlockActionCase];

  return v3;
}

- (BOOL)visuallyIndicatesWhenDateIsInFuture
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 visuallyIndicatesWhenDateIsInFuture];

  return v3;
}

- (BOOL)canBeSilencedByMenuButtonPress
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 canBeSilencedByMenuButtonPress];

  return v3;
}

- (BOOL)preventLock
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 preventLock];

  return v3;
}

- (BOOL)suppressesTitle
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 suppressesTitle];

  return v3;
}

- (BOOL)showsUnreadIndicatorForNoticesFeed
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 showsUnreadIndicatorForNoticesFeed];

  return v3;
}

- (BOOL)showsContactPhoto
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 showsContactPhoto];

  return v3;
}

- (BOOL)playsSoundForModify
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 playsSoundForModify];

  return v3;
}

- (unint64_t)subtypePriority
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  unint64_t v3 = [v2 subtypePriority];

  return v3;
}

- (int64_t)iPodOutAlertType
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  int64_t v3 = [v2 iPodOutAlertType];

  return v3;
}

- (NSString)bannerAccessoryRemoteViewControllerClassName
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  int64_t v3 = [v2 bannerAccessoryRemoteViewControllerClassName];

  return (NSString *)v3;
}

- (NSString)bannerAccessoryRemoteServiceBundleIdentifier
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  int64_t v3 = [v2 bannerAccessoryRemoteServiceBundleIdentifier];

  return (NSString *)v3;
}

- (NSString)secondaryContentRemoteViewControllerClassName
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  int64_t v3 = [v2 secondaryContentRemoteViewControllerClassName];

  return (NSString *)v3;
}

- (NSString)secondaryContentRemoteServiceBundleIdentifier
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  int64_t v3 = [v2 secondaryContentRemoteServiceBundleIdentifier];

  return (NSString *)v3;
}

- (id)_sectionParameters
{
  int64_t v3 = [(BBBulletin *)self firstValidObserver];
  id v4 = [(BBBulletin *)self sectionID];
  id v5 = [v3 parametersForSectionID:v4];

  return v5;
}

- (id)_sectionSubtypeParameters
{
  int64_t v3 = [(BBBulletin *)self _sectionParameters];
  id v4 = objc_msgSend(v3, "parametersForSubtype:", -[BBBulletin sectionSubtype](self, "sectionSubtype"));

  return v4;
}

- (BOOL)allowsAutomaticRemovalFromLockScreen
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 allowsAutomaticRemovalFromLockScreen];

  return v3;
}

- (BOOL)allowsAddingToLockScreenWhenUnlocked
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 allowsAddingToLockScreenWhenUnlocked];

  return v3;
}

- (BOOL)prioritizeAtTopOfLockScreen
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 prioritizeAtTopOfLockScreen];

  return v3;
}

- (BOOL)revealsAdditionalContentOnPresentation
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 revealsAdditionalContentOnPresentation];

  return v3;
}

- (BOOL)allowsPersistentBannersInCarPlay
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 allowsPersistentBannersInCarPlay];

  return v3;
}

- (BOOL)allowsSupplementaryActionsInCarPlay
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 allowsSupplementaryActionsInCarPlay];

  return v3;
}

- (unint64_t)privacySettings
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  unint64_t v3 = [v2 privacySettings];

  return v3;
}

- (BOOL)shouldDismissBulletinWhenClosed
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 shouldDismissBulletinWhenClosed];

  return v3;
}

- (BOOL)playsMediaWhenRaised
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 playsMediaWhenRaised];

  return v3;
}

- (BOOL)suppressDelayForForwardedBulletins
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 suppressDelayForForwardedBulletins];

  return v3;
}

- (BOOL)hideDismissActionInCarPlay
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 hideDismissActionInCarPlay];

  return v3;
}

- (BOOL)suppressPresentationInAmbient
{
  v2 = [(BBBulletin *)self _sectionSubtypeParameters];
  char v3 = [v2 suppressPresentationInAmbient];

  return v3;
}

- (id)syncHash
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v4 = [(BBBulletin *)self title];
  if (v4) {
    [v3 appendString:v4];
  }
  id v5 = [(BBBulletin *)self subtitle];
  if (v5) {
    [v3 appendString:v5];
  }
  id v6 = [(BBBulletin *)self message];
  if (v6) {
    [v3 appendString:v6];
  }
  id v7 = [v3 dataUsingEncoding:4];
  CC_MD5((const void *)[v7 bytes], objc_msgSend(v7, "length"), md);
  id v8 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:32];
  for (uint64_t i = 0; i != 16; ++i)
    objc_msgSend(v8, "appendFormat:", @"%02x", md[i]);

  return v8;
}

@end