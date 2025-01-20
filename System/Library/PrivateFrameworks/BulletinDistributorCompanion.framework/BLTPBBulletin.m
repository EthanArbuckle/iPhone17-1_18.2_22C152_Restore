@interface BLTPBBulletin
+ (Class)additionalAttachmentsType;
+ (Class)peopleIDsType;
+ (Class)subsectionIDsType;
+ (Class)supplementaryActionsType;
+ (id)_handleThumbnailResponse:(id)a3 attachmentMetadata:(id)a4 transcodedAttachmentSaveURL:(id)a5 wantsData:(BOOL)a6 imageContentType:(id)a7;
+ (id)bulletinWithBBBulletin:(id)a3 sockPuppetAppBundleID:(id)a4 observer:(id)a5 feed:(unint64_t)a6 teamID:(id)a7 universalSectionID:(id)a8 shouldUseExpirationDate:(BOOL)a9 replyToken:(id)a10 gizmoLegacyPublisherBulletinID:(id)a11 gizmoLegacyCategoryID:(id)a12 gizmoSectionID:(id)a13 gizmoSectionSubtype:(id)a14 useUserInfoForContext:(BOOL)a15 removeSubtitleForOlderWatches:(BOOL)a16;
+ (void)_addAttachmentsFromBBBulletin:(id)a3 toBLTPBBulletin:(id)a4 observer:(id)a5 attachOption:(unint64_t)a6 completion:(id)a7;
+ (void)_attachmentFromBBAttachmentMetadata:(id)a3 bulletin:(id)a4 observer:(id)a5 fileOption:(unint64_t)a6 attachOption:(unint64_t)a7 completion:(id)a8;
+ (void)bulletinWithBBBulletin:(id)a3 sockPuppetAppBundleID:(id)a4 observer:(id)a5 feed:(unint64_t)a6 teamID:(id)a7 universalSectionID:(id)a8 shouldUseExpirationDate:(BOOL)a9 replyToken:(id)a10 gizmoLegacyPublisherBulletinID:(id)a11 gizmoLegacyCategoryID:(id)a12 gizmoSectionID:(id)a13 gizmoSectionSubtype:(id)a14 useUserInfoForContext:(BOOL)a15 removeSubtitleForOlderWatches:(BOOL)a16 attachOption:(unint64_t)a17 completion:(id)a18;
- (BLTPBAction)dismissAction;
- (BLTPBAction)followActivityAction;
- (BLTPBAction)snoozeAction;
- (BLTPBCommunicationContext)communicationContext;
- (BLTPBSectionIcon)icon;
- (BOOL)containsUpdateIcon;
- (BOOL)containsUpdatedAttachment;
- (BOOL)hasAlertSuppressionContexts;
- (BOOL)hasAlertSuppressionContextsNulls;
- (BOOL)hasAttachment;
- (BOOL)hasAttachmentID;
- (BOOL)hasAttachmentType;
- (BOOL)hasAttachmentURL;
- (BOOL)hasAttributedMessage;
- (BOOL)hasBulletinID;
- (BOOL)hasCategory;
- (BOOL)hasCategoryID;
- (BOOL)hasCommunicationContext;
- (BOOL)hasContainsUpdateIcon;
- (BOOL)hasContainsUpdatedAttachment;
- (BOOL)hasContentType;
- (BOOL)hasContext;
- (BOOL)hasContextNulls;
- (BOOL)hasCriticalIcon;
- (BOOL)hasDate;
- (BOOL)hasDismissAction;
- (BOOL)hasDismissalID;
- (BOOL)hasEventBehavior;
- (BOOL)hasFilterCriteria;
- (BOOL)hasFollowActivityAction;
- (BOOL)hasHasCriticalIcon;
- (BOOL)hasHasSubordinateIcon;
- (BOOL)hasHeader;
- (BOOL)hasIcon;
- (BOOL)hasIgnoresQuietMode;
- (BOOL)hasInterruptionLevel;
- (BOOL)hasIsHighlight;
- (BOOL)hasLoading;
- (BOOL)hasMessageTitle;
- (BOOL)hasPreemptsPresentedAlert;
- (BOOL)hasPriorityNotificationStatus;
- (BOOL)hasPublicationDate;
- (BOOL)hasPublisherBulletinID;
- (BOOL)hasRecordID;
- (BOOL)hasReplyToken;
- (BOOL)hasRequiredExpirationDate;
- (BOOL)hasSectionDisplayName;
- (BOOL)hasSectionID;
- (BOOL)hasSectionSubtype;
- (BOOL)hasSnoozeAction;
- (BOOL)hasSockPuppetAppBundleID;
- (BOOL)hasSoundAccountIdentifier;
- (BOOL)hasSoundAlertType;
- (BOOL)hasSoundAudioVolume;
- (BOOL)hasSoundMaximumDuration;
- (BOOL)hasSoundShouldIgnoreRingerSwitch;
- (BOOL)hasSoundShouldRepeat;
- (BOOL)hasSoundToneIdentifier;
- (BOOL)hasSubordinateIcon;
- (BOOL)hasSubtitle;
- (BOOL)hasSummary;
- (BOOL)hasSuppressDelayForForwardedBulletins;
- (BOOL)hasTeamID;
- (BOOL)hasThreadID;
- (BOOL)hasThreadSummary;
- (BOOL)hasTitle;
- (BOOL)hasTurnsOnDisplay;
- (BOOL)hasUniversalSectionID;
- (BOOL)ignoresQuietMode;
- (BOOL)includesSound;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighlight;
- (BOOL)loading;
- (BOOL)preemptsPresentedAlert;
- (BOOL)readFrom:(id)a3;
- (BOOL)soundShouldIgnoreRingerSwitch;
- (BOOL)soundShouldRepeat;
- (BOOL)suppressDelayForForwardedBulletins;
- (BOOL)turnsOnDisplay;
- (NSData)alertSuppressionContexts;
- (NSData)alertSuppressionContextsNulls;
- (NSData)attachment;
- (NSData)attributedMessage;
- (NSData)context;
- (NSData)contextNulls;
- (NSData)eventBehavior;
- (NSData)summary;
- (NSData)threadSummary;
- (NSMutableArray)additionalAttachments;
- (NSMutableArray)peopleIDs;
- (NSMutableArray)subsectionIDs;
- (NSMutableArray)supplementaryActions;
- (NSString)attachmentID;
- (NSString)attachmentURL;
- (NSString)bulletinID;
- (NSString)category;
- (NSString)categoryID;
- (NSString)contentType;
- (NSString)dismissalID;
- (NSString)filterCriteria;
- (NSString)header;
- (NSString)messageTitle;
- (NSString)publisherBulletinID;
- (NSString)recordID;
- (NSString)replyToken;
- (NSString)sectionDisplayName;
- (NSString)sectionID;
- (NSString)sockPuppetAppBundleID;
- (NSString)soundAccountIdentifier;
- (NSString)soundToneIdentifier;
- (NSString)subtitle;
- (NSString)teamID;
- (NSString)threadID;
- (NSString)title;
- (NSString)universalSectionID;
- (double)date;
- (double)priorityNotificationStatus;
- (double)publicationDate;
- (double)requiredExpirationDate;
- (double)soundAudioVolume;
- (double)soundMaximumDuration;
- (id)additionalAttachmentsAtIndex:(unint64_t)a3;
- (id)attachmentKey:(id)a3;
- (id)attachmentURLURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)peopleIDsAtIndex:(unint64_t)a3;
- (id)publisherMatchID;
- (id)subsectionIDsAtIndex:(unint64_t)a3;
- (id)supplementaryActionsAtIndex:(unint64_t)a3;
- (int)sectionSubtype;
- (int)soundAlertType;
- (unint64_t)additionalAttachmentsCount;
- (unint64_t)hash;
- (unint64_t)peopleIDsCount;
- (unint64_t)subsectionIDsCount;
- (unint64_t)supplementaryActionsCount;
- (unsigned)attachmentType;
- (unsigned)feed;
- (unsigned)interruptionLevel;
- (void)addAdditionalAttachments:(id)a3;
- (void)addPeopleIDs:(id)a3;
- (void)addSubsectionIDs:(id)a3;
- (void)addSupplementaryActions:(id)a3;
- (void)clearAdditionalAttachments;
- (void)clearPeopleIDs;
- (void)clearSubsectionIDs;
- (void)clearSupplementaryActions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdditionalAttachments:(id)a3;
- (void)setAlertSuppressionContexts:(id)a3;
- (void)setAlertSuppressionContextsNulls:(id)a3;
- (void)setAttachment:(id)a3;
- (void)setAttachmentID:(id)a3;
- (void)setAttachmentType:(unsigned int)a3;
- (void)setAttachmentURL:(id)a3;
- (void)setAttributedMessage:(id)a3;
- (void)setBulletinID:(id)a3;
- (void)setCategory:(id)a3;
- (void)setCategoryID:(id)a3;
- (void)setCommunicationContext:(id)a3;
- (void)setContainsUpdateIcon:(BOOL)a3;
- (void)setContainsUpdatedAttachment:(BOOL)a3;
- (void)setContentType:(id)a3;
- (void)setContext:(id)a3;
- (void)setContextNulls:(id)a3;
- (void)setDate:(double)a3;
- (void)setDismissAction:(id)a3;
- (void)setDismissalID:(id)a3;
- (void)setEventBehavior:(id)a3;
- (void)setFeed:(unsigned int)a3;
- (void)setFilterCriteria:(id)a3;
- (void)setFollowActivityAction:(id)a3;
- (void)setHasAttachmentType:(BOOL)a3;
- (void)setHasContainsUpdateIcon:(BOOL)a3;
- (void)setHasContainsUpdatedAttachment:(BOOL)a3;
- (void)setHasCriticalIcon:(BOOL)a3;
- (void)setHasDate:(BOOL)a3;
- (void)setHasHasCriticalIcon:(BOOL)a3;
- (void)setHasHasSubordinateIcon:(BOOL)a3;
- (void)setHasIgnoresQuietMode:(BOOL)a3;
- (void)setHasInterruptionLevel:(BOOL)a3;
- (void)setHasIsHighlight:(BOOL)a3;
- (void)setHasLoading:(BOOL)a3;
- (void)setHasPreemptsPresentedAlert:(BOOL)a3;
- (void)setHasPriorityNotificationStatus:(BOOL)a3;
- (void)setHasPublicationDate:(BOOL)a3;
- (void)setHasRequiredExpirationDate:(BOOL)a3;
- (void)setHasSectionSubtype:(BOOL)a3;
- (void)setHasSoundAlertType:(BOOL)a3;
- (void)setHasSoundAudioVolume:(BOOL)a3;
- (void)setHasSoundMaximumDuration:(BOOL)a3;
- (void)setHasSoundShouldIgnoreRingerSwitch:(BOOL)a3;
- (void)setHasSoundShouldRepeat:(BOOL)a3;
- (void)setHasSubordinateIcon:(BOOL)a3;
- (void)setHasSuppressDelayForForwardedBulletins:(BOOL)a3;
- (void)setHasTurnsOnDisplay:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIgnoresQuietMode:(BOOL)a3;
- (void)setIncludesSound:(BOOL)a3;
- (void)setInterruptionLevel:(unsigned int)a3;
- (void)setIsHighlight:(BOOL)a3;
- (void)setLoading:(BOOL)a3;
- (void)setMessageTitle:(id)a3;
- (void)setPeopleIDs:(id)a3;
- (void)setPreemptsPresentedAlert:(BOOL)a3;
- (void)setPriorityNotificationStatus:(double)a3;
- (void)setPublicationDate:(double)a3;
- (void)setPublisherBulletinID:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setReplyToken:(id)a3;
- (void)setRequiredExpirationDate:(double)a3;
- (void)setSectionDisplayName:(id)a3;
- (void)setSectionID:(id)a3;
- (void)setSectionSubtype:(int)a3;
- (void)setSnoozeAction:(id)a3;
- (void)setSockPuppetAppBundleID:(id)a3;
- (void)setSoundAccountIdentifier:(id)a3;
- (void)setSoundAlertType:(int)a3;
- (void)setSoundAudioVolume:(double)a3;
- (void)setSoundMaximumDuration:(double)a3;
- (void)setSoundShouldIgnoreRingerSwitch:(BOOL)a3;
- (void)setSoundShouldRepeat:(BOOL)a3;
- (void)setSoundToneIdentifier:(id)a3;
- (void)setSubsectionIDs:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSummary:(id)a3;
- (void)setSupplementaryActions:(id)a3;
- (void)setSuppressDelayForForwardedBulletins:(BOOL)a3;
- (void)setTeamID:(id)a3;
- (void)setThreadID:(id)a3;
- (void)setThreadSummary:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTurnsOnDisplay:(BOOL)a3;
- (void)setUniversalSectionID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBBulletin

- (BOOL)hasBulletinID
{
  return self->_bulletinID != 0;
}

- (BOOL)hasSectionID
{
  return self->_sectionID != 0;
}

- (BOOL)hasSectionDisplayName
{
  return self->_sectionDisplayName != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasMessageTitle
{
  return self->_messageTitle != 0;
}

- (void)setDate:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasDate
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasAttachment
{
  return self->_attachment != 0;
}

- (void)clearSupplementaryActions
{
}

- (void)addSupplementaryActions:(id)a3
{
  id v4 = a3;
  supplementaryActions = self->_supplementaryActions;
  id v8 = v4;
  if (!supplementaryActions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_supplementaryActions;
    self->_supplementaryActions = v6;

    id v4 = v8;
    supplementaryActions = self->_supplementaryActions;
  }
  [(NSMutableArray *)supplementaryActions addObject:v4];
}

- (unint64_t)supplementaryActionsCount
{
  return [(NSMutableArray *)self->_supplementaryActions count];
}

- (id)supplementaryActionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_supplementaryActions objectAtIndex:a3];
}

+ (Class)supplementaryActionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSnoozeAction
{
  return self->_snoozeAction != 0;
}

- (BOOL)hasRecordID
{
  return self->_recordID != 0;
}

- (BOOL)hasPublisherBulletinID
{
  return self->_publisherBulletinID != 0;
}

- (BOOL)hasDismissAction
{
  return self->_dismissAction != 0;
}

- (void)setSectionSubtype:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_sectionSubtype = a3;
}

- (void)setHasSectionSubtype:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasSectionSubtype
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (BOOL)hasSockPuppetAppBundleID
{
  return self->_sockPuppetAppBundleID != 0;
}

- (BOOL)hasCategory
{
  return self->_category != 0;
}

- (void)setPublicationDate:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_publicationDate = a3;
}

- (void)setHasPublicationDate:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasPublicationDate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasTeamID
{
  return self->_teamID != 0;
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (BOOL)hasUniversalSectionID
{
  return self->_universalSectionID != 0;
}

- (BOOL)hasAlertSuppressionContexts
{
  return self->_alertSuppressionContexts != 0;
}

- (void)setSoundAlertType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_soundAlertType = a3;
}

- (void)setHasSoundAlertType:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasSoundAlertType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasSoundAccountIdentifier
{
  return self->_soundAccountIdentifier != 0;
}

- (BOOL)hasSoundToneIdentifier
{
  return self->_soundToneIdentifier != 0;
}

- (void)setAttachmentType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_attachmentType = a3;
}

- (void)setHasAttachmentType:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasAttachmentType
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setContainsUpdatedAttachment:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_containsUpdatedAttachment = a3;
}

- (void)setHasContainsUpdatedAttachment:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasContainsUpdatedAttachment
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setLoading:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_loading = a3;
}

- (void)setHasLoading:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasLoading
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setTurnsOnDisplay:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_turnsOnDisplay = a3;
}

- (void)setHasTurnsOnDisplay:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasTurnsOnDisplay
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)clearSubsectionIDs
{
}

- (void)addSubsectionIDs:(id)a3
{
  id v4 = a3;
  subsectionIDs = self->_subsectionIDs;
  id v8 = v4;
  if (!subsectionIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_subsectionIDs;
    self->_subsectionIDs = v6;

    id v4 = v8;
    subsectionIDs = self->_subsectionIDs;
  }
  [(NSMutableArray *)subsectionIDs addObject:v4];
}

- (unint64_t)subsectionIDsCount
{
  return [(NSMutableArray *)self->_subsectionIDs count];
}

- (id)subsectionIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_subsectionIDs objectAtIndex:a3];
}

+ (Class)subsectionIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDismissalID
{
  return self->_dismissalID != 0;
}

- (BOOL)hasAttachmentURL
{
  return self->_attachmentURL != 0;
}

- (void)clearPeopleIDs
{
}

- (void)addPeopleIDs:(id)a3
{
  id v4 = a3;
  peopleIDs = self->_peopleIDs;
  id v8 = v4;
  if (!peopleIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_peopleIDs;
    self->_peopleIDs = v6;

    id v4 = v8;
    peopleIDs = self->_peopleIDs;
  }
  [(NSMutableArray *)peopleIDs addObject:v4];
}

- (unint64_t)peopleIDsCount
{
  return [(NSMutableArray *)self->_peopleIDs count];
}

- (id)peopleIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_peopleIDs objectAtIndex:a3];
}

+ (Class)peopleIDsType
{
  return (Class)objc_opt_class();
}

- (void)setIgnoresQuietMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_ignoresQuietMode = a3;
}

- (void)setHasIgnoresQuietMode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIgnoresQuietMode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasCategoryID
{
  return self->_categoryID != 0;
}

- (BOOL)hasContextNulls
{
  return self->_contextNulls != 0;
}

- (BOOL)hasAlertSuppressionContextsNulls
{
  return self->_alertSuppressionContextsNulls != 0;
}

- (BOOL)hasThreadID
{
  return self->_threadID != 0;
}

- (BOOL)hasAttachmentID
{
  return self->_attachmentID != 0;
}

- (void)clearAdditionalAttachments
{
}

- (void)addAdditionalAttachments:(id)a3
{
  id v4 = a3;
  additionalAttachments = self->_additionalAttachments;
  id v8 = v4;
  if (!additionalAttachments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_additionalAttachments;
    self->_additionalAttachments = v6;

    id v4 = v8;
    additionalAttachments = self->_additionalAttachments;
  }
  [(NSMutableArray *)additionalAttachments addObject:v4];
}

- (unint64_t)additionalAttachmentsCount
{
  return [(NSMutableArray *)self->_additionalAttachments count];
}

- (id)additionalAttachmentsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_additionalAttachments objectAtIndex:a3];
}

+ (Class)additionalAttachmentsType
{
  return (Class)objc_opt_class();
}

- (void)setRequiredExpirationDate:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_requiredExpirationDate = a3;
}

- (void)setHasRequiredExpirationDate:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasRequiredExpirationDate
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasReplyToken
{
  return self->_replyToken != 0;
}

- (void)setSoundMaximumDuration:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_soundMaximumDuration = a3;
}

- (void)setHasSoundMaximumDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasSoundMaximumDuration
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setSoundShouldRepeat:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_soundShouldRepeat = a3;
}

- (void)setHasSoundShouldRepeat:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasSoundShouldRepeat
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSoundShouldIgnoreRingerSwitch:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_soundShouldIgnoreRingerSwitch = a3;
}

- (void)setHasSoundShouldIgnoreRingerSwitch:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSoundShouldIgnoreRingerSwitch
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasCriticalIcon:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_hasCriticalIcon = a3;
}

- (void)setHasHasCriticalIcon:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasHasCriticalIcon
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setSoundAudioVolume:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_soundAudioVolume = a3;
}

- (void)setHasSoundAudioVolume:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasSoundAudioVolume
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setPreemptsPresentedAlert:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_preemptsPresentedAlert = a3;
}

- (void)setHasPreemptsPresentedAlert:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasPreemptsPresentedAlert
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setSuppressDelayForForwardedBulletins:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_suppressDelayForForwardedBulletins = a3;
}

- (void)setHasSuppressDelayForForwardedBulletins:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasSuppressDelayForForwardedBulletins
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasIcon
{
  return self->_icon != 0;
}

- (void)setContainsUpdateIcon:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_containsUpdateIcon = a3;
}

- (void)setHasContainsUpdateIcon:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasContainsUpdateIcon
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasHeader
{
  return self->_header != 0;
}

- (void)setInterruptionLevel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_interruptionLevel = a3;
}

- (void)setHasInterruptionLevel:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasInterruptionLevel
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasCommunicationContext
{
  return self->_communicationContext != 0;
}

- (BOOL)hasContentType
{
  return self->_contentType != 0;
}

- (BOOL)hasFilterCriteria
{
  return self->_filterCriteria != 0;
}

- (BOOL)hasFollowActivityAction
{
  return self->_followActivityAction != 0;
}

- (void)setHasSubordinateIcon:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_hasSubordinateIcon = a3;
}

- (void)setHasHasSubordinateIcon:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasHasSubordinateIcon
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasSummary
{
  return self->_summary != 0;
}

- (BOOL)hasThreadSummary
{
  return self->_threadSummary != 0;
}

- (BOOL)hasAttributedMessage
{
  return self->_attributedMessage != 0;
}

- (BOOL)hasEventBehavior
{
  return self->_eventBehavior != 0;
}

- (void)setPriorityNotificationStatus:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_priorityNotificationStatus = a3;
}

- (void)setHasPriorityNotificationStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasPriorityNotificationStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsHighlight:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isHighlight = a3;
}

- (void)setHasIsHighlight:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DC19B4E307EAB6FC73F13B70E0C144DC)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsHighlight
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBBulletin;
  id v4 = [(BLTPBBulletin *)&v8 description];
  v5 = [(BLTPBBulletin *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  bulletinID = self->_bulletinID;
  if (bulletinID) {
    [v3 setObject:bulletinID forKey:@"bulletinID"];
  }
  sectionID = self->_sectionID;
  if (sectionID) {
    [v4 setObject:sectionID forKey:@"sectionID"];
  }
  sectionDisplayName = self->_sectionDisplayName;
  if (sectionDisplayName) {
    [v4 setObject:sectionDisplayName forKey:@"sectionDisplayName"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v4 setObject:subtitle forKey:@"subtitle"];
  }
  messageTitle = self->_messageTitle;
  if (messageTitle) {
    [v4 setObject:messageTitle forKey:@"messageTitle"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v11 = [NSNumber numberWithDouble:self->_date];
    [v4 setObject:v11 forKey:@"date"];
  }
  attachment = self->_attachment;
  if (attachment) {
    [v4 setObject:attachment forKey:@"attachment"];
  }
  if ([(NSMutableArray *)self->_supplementaryActions count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_supplementaryActions, "count"));
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    v14 = self->_supplementaryActions;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v96 objects:v101 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v97;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v97 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v96 + 1) + 8 * i) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v96 objects:v101 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"supplementaryActions"];
  }
  v20 = [NSNumber numberWithUnsignedInt:self->_feed];
  [v4 setObject:v20 forKey:@"feed"];

  snoozeAction = self->_snoozeAction;
  if (snoozeAction)
  {
    v22 = [(BLTPBAction *)snoozeAction dictionaryRepresentation];
    [v4 setObject:v22 forKey:@"snoozeAction"];
  }
  recordID = self->_recordID;
  if (recordID) {
    [v4 setObject:recordID forKey:@"recordID"];
  }
  publisherBulletinID = self->_publisherBulletinID;
  if (publisherBulletinID) {
    [v4 setObject:publisherBulletinID forKey:@"publisherBulletinID"];
  }
  dismissAction = self->_dismissAction;
  if (dismissAction)
  {
    v26 = [(BLTPBAction *)dismissAction dictionaryRepresentation];
    [v4 setObject:v26 forKey:@"dismissAction"];
  }
  if (*((unsigned char *)&self->_has + 1))
  {
    v27 = [NSNumber numberWithInt:self->_sectionSubtype];
    [v4 setObject:v27 forKey:@"sectionSubtype"];
  }
  sockPuppetAppBundleID = self->_sockPuppetAppBundleID;
  if (sockPuppetAppBundleID) {
    [v4 setObject:sockPuppetAppBundleID forKey:@"sockPuppetAppBundleID"];
  }
  category = self->_category;
  if (category) {
    [v4 setObject:category forKey:@"category"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v30 = [NSNumber numberWithDouble:self->_publicationDate];
    [v4 setObject:v30 forKey:@"publicationDate"];
  }
  v31 = [NSNumber numberWithBool:self->_includesSound];
  [v4 setObject:v31 forKey:@"includesSound"];

  teamID = self->_teamID;
  if (teamID) {
    [v4 setObject:teamID forKey:@"teamID"];
  }
  context = self->_context;
  if (context) {
    [v4 setObject:context forKey:@"context"];
  }
  universalSectionID = self->_universalSectionID;
  if (universalSectionID) {
    [v4 setObject:universalSectionID forKey:@"universalSectionID"];
  }
  alertSuppressionContexts = self->_alertSuppressionContexts;
  if (alertSuppressionContexts) {
    [v4 setObject:alertSuppressionContexts forKey:@"alertSuppressionContexts"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0)
  {
    v36 = [NSNumber numberWithInt:self->_soundAlertType];
    [v4 setObject:v36 forKey:@"soundAlertType"];
  }
  soundAccountIdentifier = self->_soundAccountIdentifier;
  if (soundAccountIdentifier) {
    [v4 setObject:soundAccountIdentifier forKey:@"soundAccountIdentifier"];
  }
  soundToneIdentifier = self->_soundToneIdentifier;
  if (soundToneIdentifier) {
    [v4 setObject:soundToneIdentifier forKey:@"soundToneIdentifier"];
  }
  $DC19B4E307EAB6FC73F13B70E0C144DC has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    v83 = [NSNumber numberWithUnsignedInt:self->_attachmentType];
    [v4 setObject:v83 forKey:@"attachmentType"];

    $DC19B4E307EAB6FC73F13B70E0C144DC has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_58:
      if ((*(_DWORD *)&has & 0x10000) == 0) {
        goto LABEL_59;
      }
      goto LABEL_135;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_58;
  }
  v84 = [NSNumber numberWithBool:self->_containsUpdatedAttachment];
  [v4 setObject:v84 forKey:@"containsUpdatedAttachment"];

  $DC19B4E307EAB6FC73F13B70E0C144DC has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_59:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_60;
  }
LABEL_135:
  v85 = [NSNumber numberWithBool:self->_loading];
  [v4 setObject:v85 forKey:@"loading"];

  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_60:
    v40 = [NSNumber numberWithBool:self->_turnsOnDisplay];
    [v4 setObject:v40 forKey:@"turnsOnDisplay"];
  }
LABEL_61:
  subsectionIDs = self->_subsectionIDs;
  if (subsectionIDs) {
    [v4 setObject:subsectionIDs forKey:@"subsectionIDs"];
  }
  dismissalID = self->_dismissalID;
  if (dismissalID) {
    [v4 setObject:dismissalID forKey:@"dismissalID"];
  }
  attachmentURL = self->_attachmentURL;
  if (attachmentURL) {
    [v4 setObject:attachmentURL forKey:@"attachmentURL"];
  }
  peopleIDs = self->_peopleIDs;
  if (peopleIDs) {
    [v4 setObject:peopleIDs forKey:@"peopleIDs"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    v45 = [NSNumber numberWithBool:self->_ignoresQuietMode];
    [v4 setObject:v45 forKey:@"ignoresQuietMode"];
  }
  categoryID = self->_categoryID;
  if (categoryID) {
    [v4 setObject:categoryID forKey:@"categoryID"];
  }
  contextNulls = self->_contextNulls;
  if (contextNulls) {
    [v4 setObject:contextNulls forKey:@"contextNulls"];
  }
  alertSuppressionContextsNulls = self->_alertSuppressionContextsNulls;
  if (alertSuppressionContextsNulls) {
    [v4 setObject:alertSuppressionContextsNulls forKey:@"alertSuppressionContextsNulls"];
  }
  threadID = self->_threadID;
  if (threadID) {
    [v4 setObject:threadID forKey:@"threadID"];
  }
  attachmentID = self->_attachmentID;
  if (attachmentID) {
    [v4 setObject:attachmentID forKey:@"attachmentID"];
  }
  if ([(NSMutableArray *)self->_additionalAttachments count])
  {
    v51 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_additionalAttachments, "count"));
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    v52 = self->_additionalAttachments;
    uint64_t v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v92 objects:v100 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v93;
      do
      {
        for (uint64_t j = 0; j != v54; ++j)
        {
          if (*(void *)v93 != v55) {
            objc_enumerationMutation(v52);
          }
          v57 = objc_msgSend(*(id *)(*((void *)&v92 + 1) + 8 * j), "dictionaryRepresentation", (void)v92);
          [v51 addObject:v57];
        }
        uint64_t v54 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v92 objects:v100 count:16];
      }
      while (v54);
    }

    [v4 setObject:v51 forKey:@"additionalAttachments"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v58 = [NSNumber numberWithDouble:self->_requiredExpirationDate];
    [v4 setObject:v58 forKey:@"requiredExpirationDate"];
  }
  replyToken = self->_replyToken;
  if (replyToken) {
    [v4 setObject:replyToken forKey:@"replyToken"];
  }
  $DC19B4E307EAB6FC73F13B70E0C144DC v60 = self->_has;
  if ((*(unsigned char *)&v60 & 0x20) != 0)
  {
    v86 = [NSNumber numberWithDouble:self->_soundMaximumDuration];
    [v4 setObject:v86 forKey:@"soundMaximumDuration"];

    $DC19B4E307EAB6FC73F13B70E0C144DC v60 = self->_has;
    if ((*(_DWORD *)&v60 & 0x80000) == 0)
    {
LABEL_96:
      if ((*(_DWORD *)&v60 & 0x40000) == 0) {
        goto LABEL_97;
      }
      goto LABEL_139;
    }
  }
  else if ((*(_DWORD *)&v60 & 0x80000) == 0)
  {
    goto LABEL_96;
  }
  v87 = objc_msgSend(NSNumber, "numberWithBool:", self->_soundShouldRepeat, (void)v92);
  [v4 setObject:v87 forKey:@"soundShouldRepeat"];

  $DC19B4E307EAB6FC73F13B70E0C144DC v60 = self->_has;
  if ((*(_DWORD *)&v60 & 0x40000) == 0)
  {
LABEL_97:
    if ((*(_WORD *)&v60 & 0x1000) == 0) {
      goto LABEL_98;
    }
    goto LABEL_140;
  }
LABEL_139:
  v88 = objc_msgSend(NSNumber, "numberWithBool:", self->_soundShouldIgnoreRingerSwitch, (void)v92);
  [v4 setObject:v88 forKey:@"soundShouldIgnoreRingerSwitch"];

  $DC19B4E307EAB6FC73F13B70E0C144DC v60 = self->_has;
  if ((*(_WORD *)&v60 & 0x1000) == 0)
  {
LABEL_98:
    if ((*(unsigned char *)&v60 & 0x10) == 0) {
      goto LABEL_99;
    }
    goto LABEL_141;
  }
LABEL_140:
  v89 = objc_msgSend(NSNumber, "numberWithBool:", self->_hasCriticalIcon, (void)v92);
  [v4 setObject:v89 forKey:@"hasCriticalIcon"];

  $DC19B4E307EAB6FC73F13B70E0C144DC v60 = self->_has;
  if ((*(unsigned char *)&v60 & 0x10) == 0)
  {
LABEL_99:
    if ((*(_DWORD *)&v60 & 0x20000) == 0) {
      goto LABEL_100;
    }
    goto LABEL_142;
  }
LABEL_141:
  v90 = objc_msgSend(NSNumber, "numberWithDouble:", self->_soundAudioVolume, (void)v92);
  [v4 setObject:v90 forKey:@"soundAudioVolume"];

  $DC19B4E307EAB6FC73F13B70E0C144DC v60 = self->_has;
  if ((*(_DWORD *)&v60 & 0x20000) == 0)
  {
LABEL_100:
    if ((*(_DWORD *)&v60 & 0x100000) == 0) {
      goto LABEL_102;
    }
    goto LABEL_101;
  }
LABEL_142:
  v91 = objc_msgSend(NSNumber, "numberWithBool:", self->_preemptsPresentedAlert, (void)v92);
  [v4 setObject:v91 forKey:@"preemptsPresentedAlert"];

  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_101:
    v61 = objc_msgSend(NSNumber, "numberWithBool:", self->_suppressDelayForForwardedBulletins, (void)v92);
    [v4 setObject:v61 forKey:@"suppressDelayForForwardedBulletins"];
  }
LABEL_102:
  icon = self->_icon;
  if (icon)
  {
    v63 = [(BLTPBSectionIcon *)icon dictionaryRepresentation];
    [v4 setObject:v63 forKey:@"icon"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0)
  {
    v64 = [NSNumber numberWithBool:self->_containsUpdateIcon];
    [v4 setObject:v64 forKey:@"containsUpdateIcon"];
  }
  header = self->_header;
  if (header) {
    [v4 setObject:header forKey:@"header"];
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    v66 = [NSNumber numberWithUnsignedInt:self->_interruptionLevel];
    [v4 setObject:v66 forKey:@"interruptionLevel"];
  }
  communicationContext = self->_communicationContext;
  if (communicationContext)
  {
    v68 = [(BLTPBCommunicationContext *)communicationContext dictionaryRepresentation];
    [v4 setObject:v68 forKey:@"communicationContext"];
  }
  contentType = self->_contentType;
  if (contentType) {
    [v4 setObject:contentType forKey:@"contentType"];
  }
  filterCriteria = self->_filterCriteria;
  if (filterCriteria) {
    [v4 setObject:filterCriteria forKey:@"filterCriteria"];
  }
  followActivityAction = self->_followActivityAction;
  if (followActivityAction)
  {
    v72 = [(BLTPBAction *)followActivityAction dictionaryRepresentation];
    [v4 setObject:v72 forKey:@"followActivityAction"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    v73 = [NSNumber numberWithBool:self->_hasSubordinateIcon];
    [v4 setObject:v73 forKey:@"hasSubordinateIcon"];
  }
  summary = self->_summary;
  if (summary) {
    [v4 setObject:summary forKey:@"summary"];
  }
  threadSummary = self->_threadSummary;
  if (threadSummary) {
    [v4 setObject:threadSummary forKey:@"threadSummary"];
  }
  attributedMessage = self->_attributedMessage;
  if (attributedMessage) {
    [v4 setObject:attributedMessage forKey:@"attributedMessage"];
  }
  eventBehavior = self->_eventBehavior;
  if (eventBehavior) {
    [v4 setObject:eventBehavior forKey:@"eventBehavior"];
  }
  $DC19B4E307EAB6FC73F13B70E0C144DC v78 = self->_has;
  if ((*(unsigned char *)&v78 & 2) != 0)
  {
    v79 = [NSNumber numberWithDouble:self->_priorityNotificationStatus];
    [v4 setObject:v79 forKey:@"priorityNotificationStatus"];

    $DC19B4E307EAB6FC73F13B70E0C144DC v78 = self->_has;
  }
  if ((*(_WORD *)&v78 & 0x8000) != 0)
  {
    v80 = [NSNumber numberWithBool:self->_isHighlight];
    [v4 setObject:v80 forKey:@"isHighlight"];
  }
  id v81 = v4;

  return v81;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBBulletinReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_bulletinID) {
    PBDataWriterWriteStringField();
  }
  if (self->_sectionID) {
    PBDataWriterWriteStringField();
  }
  if (self->_sectionDisplayName) {
    PBDataWriterWriteStringField();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_subtitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_messageTitle) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_attachment) {
    PBDataWriterWriteDataField();
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v5 = self->_supplementaryActions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v41;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v7);
  }

  PBDataWriterWriteUint32Field();
  if (self->_snoozeAction) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_recordID) {
    PBDataWriterWriteStringField();
  }
  if (self->_publisherBulletinID) {
    PBDataWriterWriteStringField();
  }
  if (self->_dismissAction) {
    PBDataWriterWriteSubmessage();
  }
  if (*((unsigned char *)&self->_has + 1)) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_sockPuppetAppBundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_category) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteBOOLField();
  if (self->_teamID) {
    PBDataWriterWriteStringField();
  }
  if (self->_context) {
    PBDataWriterWriteDataField();
  }
  if (self->_universalSectionID) {
    PBDataWriterWriteStringField();
  }
  if (self->_alertSuppressionContexts) {
    PBDataWriterWriteDataField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_soundAccountIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_soundToneIdentifier) {
    PBDataWriterWriteStringField();
  }
  $DC19B4E307EAB6FC73F13B70E0C144DC has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    $DC19B4E307EAB6FC73F13B70E0C144DC has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_56:
      if ((*(_DWORD *)&has & 0x10000) == 0) {
        goto LABEL_57;
      }
      goto LABEL_141;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_56;
  }
  PBDataWriterWriteBOOLField();
  $DC19B4E307EAB6FC73F13B70E0C144DC has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }
LABEL_141:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x200000) != 0) {
LABEL_58:
  }
    PBDataWriterWriteBOOLField();
LABEL_59:
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v11 = self->_subsectionIDs;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v37;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v13);
  }

  if (self->_dismissalID) {
    PBDataWriterWriteStringField();
  }
  if (self->_attachmentURL) {
    PBDataWriterWriteStringField();
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v16 = self->_peopleIDs;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v32 objects:v45 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteStringField();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v32 objects:v45 count:16];
    }
    while (v18);
  }

  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_categoryID) {
    PBDataWriterWriteStringField();
  }
  if (self->_contextNulls) {
    PBDataWriterWriteDataField();
  }
  if (self->_alertSuppressionContextsNulls) {
    PBDataWriterWriteDataField();
  }
  if (self->_threadID) {
    PBDataWriterWriteStringField();
  }
  if (self->_attachmentID) {
    PBDataWriterWriteStringField();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v21 = self->_additionalAttachments;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v44 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v29;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteSubmessage();
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v44 count:16];
    }
    while (v23);
  }

  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_replyToken) {
    PBDataWriterWriteStringField();
  }
  $DC19B4E307EAB6FC73F13B70E0C144DC v26 = self->_has;
  if ((*(unsigned char *)&v26 & 0x20) != 0)
  {
    PBDataWriterWriteDoubleField();
    $DC19B4E307EAB6FC73F13B70E0C144DC v26 = self->_has;
    if ((*(_DWORD *)&v26 & 0x80000) == 0)
    {
LABEL_102:
      if ((*(_DWORD *)&v26 & 0x40000) == 0) {
        goto LABEL_103;
      }
      goto LABEL_145;
    }
  }
  else if ((*(_DWORD *)&v26 & 0x80000) == 0)
  {
    goto LABEL_102;
  }
  PBDataWriterWriteBOOLField();
  $DC19B4E307EAB6FC73F13B70E0C144DC v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x40000) == 0)
  {
LABEL_103:
    if ((*(_WORD *)&v26 & 0x1000) == 0) {
      goto LABEL_104;
    }
    goto LABEL_146;
  }
LABEL_145:
  PBDataWriterWriteBOOLField();
  $DC19B4E307EAB6FC73F13B70E0C144DC v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x1000) == 0)
  {
LABEL_104:
    if ((*(unsigned char *)&v26 & 0x10) == 0) {
      goto LABEL_105;
    }
    goto LABEL_147;
  }
LABEL_146:
  PBDataWriterWriteBOOLField();
  $DC19B4E307EAB6FC73F13B70E0C144DC v26 = self->_has;
  if ((*(unsigned char *)&v26 & 0x10) == 0)
  {
LABEL_105:
    if ((*(_DWORD *)&v26 & 0x20000) == 0) {
      goto LABEL_106;
    }
    goto LABEL_148;
  }
LABEL_147:
  PBDataWriterWriteDoubleField();
  $DC19B4E307EAB6FC73F13B70E0C144DC v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x20000) == 0)
  {
LABEL_106:
    if ((*(_DWORD *)&v26 & 0x100000) == 0) {
      goto LABEL_108;
    }
    goto LABEL_107;
  }
LABEL_148:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x100000) != 0) {
LABEL_107:
  }
    PBDataWriterWriteBOOLField();
LABEL_108:
  if (self->_icon) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_header) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_communicationContext) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_contentType) {
    PBDataWriterWriteStringField();
  }
  if (self->_filterCriteria) {
    PBDataWriterWriteStringField();
  }
  if (self->_followActivityAction) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_summary) {
    PBDataWriterWriteDataField();
  }
  if (self->_threadSummary) {
    PBDataWriterWriteDataField();
  }
  if (self->_attributedMessage) {
    PBDataWriterWriteDataField();
  }
  if (self->_eventBehavior) {
    PBDataWriterWriteDataField();
  }
  $DC19B4E307EAB6FC73F13B70E0C144DC v27 = self->_has;
  if ((*(unsigned char *)&v27 & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    $DC19B4E307EAB6FC73F13B70E0C144DC v27 = self->_has;
  }
  if ((*(_WORD *)&v27 & 0x8000) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v26 = v4;
  if (self->_bulletinID)
  {
    objc_msgSend(v4, "setBulletinID:");
    id v4 = v26;
  }
  if (self->_sectionID)
  {
    objc_msgSend(v26, "setSectionID:");
    id v4 = v26;
  }
  if (self->_sectionDisplayName)
  {
    objc_msgSend(v26, "setSectionDisplayName:");
    id v4 = v26;
  }
  if (self->_title)
  {
    objc_msgSend(v26, "setTitle:");
    id v4 = v26;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v26, "setSubtitle:");
    id v4 = v26;
  }
  if (self->_messageTitle)
  {
    objc_msgSend(v26, "setMessageTitle:");
    id v4 = v26;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_date;
    *((_DWORD *)v4 + 110) |= 1u;
  }
  if (self->_attachment) {
    objc_msgSend(v26, "setAttachment:");
  }
  if ([(BLTPBBulletin *)self supplementaryActionsCount])
  {
    [v26 clearSupplementaryActions];
    unint64_t v5 = [(BLTPBBulletin *)self supplementaryActionsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(BLTPBBulletin *)self supplementaryActionsAtIndex:i];
        [v26 addSupplementaryActions:v8];
      }
    }
  }
  uint64_t v9 = v26;
  *((_DWORD *)v26 + 50) = self->_feed;
  if (self->_snoozeAction)
  {
    objc_msgSend(v26, "setSnoozeAction:");
    uint64_t v9 = v26;
  }
  if (self->_recordID)
  {
    objc_msgSend(v26, "setRecordID:");
    uint64_t v9 = v26;
  }
  if (self->_publisherBulletinID)
  {
    objc_msgSend(v26, "setPublisherBulletinID:");
    uint64_t v9 = v26;
  }
  if (self->_dismissAction)
  {
    objc_msgSend(v26, "setDismissAction:");
    uint64_t v9 = v26;
  }
  if (*((unsigned char *)&self->_has + 1))
  {
    v9[76] = self->_sectionSubtype;
    v9[110] |= 0x100u;
  }
  if (self->_sockPuppetAppBundleID)
  {
    objc_msgSend(v26, "setSockPuppetAppBundleID:");
    uint64_t v9 = v26;
  }
  if (self->_category)
  {
    objc_msgSend(v26, "setCategory:");
    uint64_t v9 = v26;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)v9 + 3) = *(void *)&self->_publicationDate;
    v9[110] |= 4u;
  }
  *((unsigned char *)v9 + 429) = self->_includesSound;
  if (self->_teamID)
  {
    objc_msgSend(v26, "setTeamID:");
    uint64_t v9 = v26;
  }
  if (self->_context)
  {
    objc_msgSend(v26, "setContext:");
    uint64_t v9 = v26;
  }
  if (self->_universalSectionID)
  {
    objc_msgSend(v26, "setUniversalSectionID:");
    uint64_t v9 = v26;
  }
  if (self->_alertSuppressionContexts)
  {
    objc_msgSend(v26, "setAlertSuppressionContexts:");
    uint64_t v9 = v26;
  }
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0)
  {
    v9[84] = self->_soundAlertType;
    v9[110] |= 0x200u;
  }
  if (self->_soundAccountIdentifier)
  {
    objc_msgSend(v26, "setSoundAccountIdentifier:");
    uint64_t v9 = v26;
  }
  if (self->_soundToneIdentifier)
  {
    objc_msgSend(v26, "setSoundToneIdentifier:");
    uint64_t v9 = v26;
  }
  $DC19B4E307EAB6FC73F13B70E0C144DC has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    v9[24] = self->_attachmentType;
    v9[110] |= 0x40u;
    $DC19B4E307EAB6FC73F13B70E0C144DC has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_53:
      if ((*(_DWORD *)&has & 0x10000) == 0) {
        goto LABEL_54;
      }
LABEL_131:
      *((unsigned char *)v9 + 431) = self->_loading;
      v9[110] |= 0x10000u;
      if ((*(_DWORD *)&self->_has & 0x200000) == 0) {
        goto LABEL_56;
      }
      goto LABEL_55;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_53;
  }
  *((unsigned char *)v9 + 425) = self->_containsUpdatedAttachment;
  v9[110] |= 0x800u;
  $DC19B4E307EAB6FC73F13B70E0C144DC has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0) {
    goto LABEL_131;
  }
LABEL_54:
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_55:
    *((unsigned char *)v9 + 436) = self->_turnsOnDisplay;
    v9[110] |= 0x200000u;
  }
LABEL_56:
  if ([(BLTPBBulletin *)self subsectionIDsCount])
  {
    [v26 clearSubsectionIDs];
    unint64_t v11 = [(BLTPBBulletin *)self subsectionIDsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
      {
        uint64_t v14 = [(BLTPBBulletin *)self subsectionIDsAtIndex:j];
        [v26 addSubsectionIDs:v14];
      }
    }
  }
  if (self->_dismissalID) {
    objc_msgSend(v26, "setDismissalID:");
  }
  if (self->_attachmentURL) {
    objc_msgSend(v26, "setAttachmentURL:");
  }
  if ([(BLTPBBulletin *)self peopleIDsCount])
  {
    [v26 clearPeopleIDs];
    unint64_t v15 = [(BLTPBBulletin *)self peopleIDsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t k = 0; k != v16; ++k)
      {
        uint64_t v18 = [(BLTPBBulletin *)self peopleIDsAtIndex:k];
        [v26 addPeopleIDs:v18];
      }
    }
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    *((unsigned char *)v26 + 428) = self->_ignoresQuietMode;
    *((_DWORD *)v26 + 110) |= 0x4000u;
  }
  if (self->_categoryID) {
    objc_msgSend(v26, "setCategoryID:");
  }
  if (self->_contextNulls) {
    objc_msgSend(v26, "setContextNulls:");
  }
  if (self->_alertSuppressionContextsNulls) {
    objc_msgSend(v26, "setAlertSuppressionContextsNulls:");
  }
  if (self->_threadID) {
    objc_msgSend(v26, "setThreadID:");
  }
  if (self->_attachmentID) {
    objc_msgSend(v26, "setAttachmentID:");
  }
  if ([(BLTPBBulletin *)self additionalAttachmentsCount])
  {
    [v26 clearAdditionalAttachments];
    unint64_t v19 = [(BLTPBBulletin *)self additionalAttachmentsCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t m = 0; m != v20; ++m)
      {
        uint64_t v22 = [(BLTPBBulletin *)self additionalAttachmentsAtIndex:m];
        [v26 addAdditionalAttachments:v22];
      }
    }
  }
  uint64_t v23 = v26;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((void *)v26 + 4) = *(void *)&self->_requiredExpirationDate;
    *((_DWORD *)v26 + 110) |= 8u;
  }
  if (self->_replyToken)
  {
    objc_msgSend(v26, "setReplyToken:");
    uint64_t v23 = v26;
  }
  $DC19B4E307EAB6FC73F13B70E0C144DC v24 = self->_has;
  if ((*(unsigned char *)&v24 & 0x20) != 0)
  {
    v23[6] = *(void *)&self->_soundMaximumDuration;
    *((_DWORD *)v23 + 110) |= 0x20u;
    $DC19B4E307EAB6FC73F13B70E0C144DC v24 = self->_has;
    if ((*(_DWORD *)&v24 & 0x80000) == 0)
    {
LABEL_90:
      if ((*(_DWORD *)&v24 & 0x40000) == 0) {
        goto LABEL_91;
      }
      goto LABEL_135;
    }
  }
  else if ((*(_DWORD *)&v24 & 0x80000) == 0)
  {
    goto LABEL_90;
  }
  *((unsigned char *)v23 + 434) = self->_soundShouldRepeat;
  *((_DWORD *)v23 + 110) |= 0x80000u;
  $DC19B4E307EAB6FC73F13B70E0C144DC v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x40000) == 0)
  {
LABEL_91:
    if ((*(_WORD *)&v24 & 0x1000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_136;
  }
LABEL_135:
  *((unsigned char *)v23 + 433) = self->_soundShouldIgnoreRingerSwitch;
  *((_DWORD *)v23 + 110) |= 0x40000u;
  $DC19B4E307EAB6FC73F13B70E0C144DC v24 = self->_has;
  if ((*(_WORD *)&v24 & 0x1000) == 0)
  {
LABEL_92:
    if ((*(unsigned char *)&v24 & 0x10) == 0) {
      goto LABEL_93;
    }
    goto LABEL_137;
  }
LABEL_136:
  *((unsigned char *)v23 + 426) = self->_hasCriticalIcon;
  *((_DWORD *)v23 + 110) |= 0x1000u;
  $DC19B4E307EAB6FC73F13B70E0C144DC v24 = self->_has;
  if ((*(unsigned char *)&v24 & 0x10) == 0)
  {
LABEL_93:
    if ((*(_DWORD *)&v24 & 0x20000) == 0) {
      goto LABEL_94;
    }
    goto LABEL_138;
  }
LABEL_137:
  v23[5] = *(void *)&self->_soundAudioVolume;
  *((_DWORD *)v23 + 110) |= 0x10u;
  $DC19B4E307EAB6FC73F13B70E0C144DC v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x20000) == 0)
  {
LABEL_94:
    if ((*(_DWORD *)&v24 & 0x100000) == 0) {
      goto LABEL_96;
    }
    goto LABEL_95;
  }
LABEL_138:
  *((unsigned char *)v23 + 432) = self->_preemptsPresentedAlert;
  *((_DWORD *)v23 + 110) |= 0x20000u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_95:
    *((unsigned char *)v23 + 435) = self->_suppressDelayForForwardedBulletins;
    *((_DWORD *)v23 + 110) |= 0x100000u;
  }
LABEL_96:
  if (self->_icon)
  {
    objc_msgSend(v26, "setIcon:");
    uint64_t v23 = v26;
  }
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0)
  {
    *((unsigned char *)v23 + 424) = self->_containsUpdateIcon;
    *((_DWORD *)v23 + 110) |= 0x400u;
  }
  if (self->_header)
  {
    objc_msgSend(v26, "setHeader:");
    uint64_t v23 = v26;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    *((_DWORD *)v23 + 60) = self->_interruptionLevel;
    *((_DWORD *)v23 + 110) |= 0x80u;
  }
  if (self->_communicationContext)
  {
    objc_msgSend(v26, "setCommunicationContext:");
    uint64_t v23 = v26;
  }
  if (self->_contentType)
  {
    objc_msgSend(v26, "setContentType:");
    uint64_t v23 = v26;
  }
  if (self->_filterCriteria)
  {
    objc_msgSend(v26, "setFilterCriteria:");
    uint64_t v23 = v26;
  }
  if (self->_followActivityAction)
  {
    objc_msgSend(v26, "setFollowActivityAction:");
    uint64_t v23 = v26;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    *((unsigned char *)v23 + 427) = self->_hasSubordinateIcon;
    *((_DWORD *)v23 + 110) |= 0x2000u;
  }
  if (self->_summary)
  {
    objc_msgSend(v26, "setSummary:");
    uint64_t v23 = v26;
  }
  if (self->_threadSummary)
  {
    objc_msgSend(v26, "setThreadSummary:");
    uint64_t v23 = v26;
  }
  if (self->_attributedMessage)
  {
    objc_msgSend(v26, "setAttributedMessage:");
    uint64_t v23 = v26;
  }
  if (self->_eventBehavior)
  {
    objc_msgSend(v26, "setEventBehavior:");
    uint64_t v23 = v26;
  }
  $DC19B4E307EAB6FC73F13B70E0C144DC v25 = self->_has;
  if ((*(unsigned char *)&v25 & 2) != 0)
  {
    v23[2] = *(void *)&self->_priorityNotificationStatus;
    *((_DWORD *)v23 + 110) |= 2u;
    $DC19B4E307EAB6FC73F13B70E0C144DC v25 = self->_has;
  }
  if ((*(_WORD *)&v25 & 0x8000) != 0)
  {
    *((unsigned char *)v23 + 430) = self->_isHighlight;
    *((_DWORD *)v23 + 110) |= 0x8000u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v128 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_bulletinID copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v6;

  uint64_t v8 = [(NSString *)self->_sectionID copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 296);
  *(void *)(v5 + 296) = v8;

  uint64_t v10 = [(NSString *)self->_sectionDisplayName copyWithZone:a3];
  unint64_t v11 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v10;

  uint64_t v12 = [(NSString *)self->_title copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 408);
  *(void *)(v5 + 408) = v12;

  uint64_t v14 = [(NSString *)self->_subtitle copyWithZone:a3];
  unint64_t v15 = *(void **)(v5 + 360);
  *(void *)(v5 + 360) = v14;

  uint64_t v16 = [(NSString *)self->_messageTitle copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v16;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_date;
    *(_DWORD *)(v5 + 440) |= 1u;
  }
  uint64_t v18 = [(NSData *)self->_attachment copyWithZone:a3];
  unint64_t v19 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v18;

  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  unint64_t v20 = self->_supplementaryActions;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v120 objects:v127 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v121;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v121 != v23) {
          objc_enumerationMutation(v20);
        }
        $DC19B4E307EAB6FC73F13B70E0C144DC v25 = (void *)[*(id *)(*((void *)&v120 + 1) + 8 * v24) copyWithZone:a3];
        [(id)v5 addSupplementaryActions:v25];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v120 objects:v127 count:16];
    }
    while (v22);
  }

  *(_DWORD *)(v5 + 200) = self->_feed;
  id v26 = [(BLTPBAction *)self->_snoozeAction copyWithZone:a3];
  $DC19B4E307EAB6FC73F13B70E0C144DC v27 = *(void **)(v5 + 312);
  *(void *)(v5 + 312) = v26;

  uint64_t v28 = [(NSString *)self->_recordID copyWithZone:a3];
  long long v29 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v28;

  uint64_t v30 = [(NSString *)self->_publisherBulletinID copyWithZone:a3];
  long long v31 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v30;

  id v32 = [(BLTPBAction *)self->_dismissAction copyWithZone:a3];
  long long v33 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v32;

  if (*((unsigned char *)&self->_has + 1))
  {
    *(_DWORD *)(v5 + 304) = self->_sectionSubtype;
    *(_DWORD *)(v5 + 440) |= 0x100u;
  }
  uint64_t v34 = [(NSString *)self->_sockPuppetAppBundleID copyWithZone:a3];
  long long v35 = *(void **)(v5 + 320);
  *(void *)(v5 + 320) = v34;

  uint64_t v36 = [(NSString *)self->_category copyWithZone:a3];
  long long v37 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v36;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_publicationDate;
    *(_DWORD *)(v5 + 440) |= 4u;
  }
  *(unsigned char *)(v5 + 429) = self->_includesSound;
  uint64_t v38 = [(NSString *)self->_teamID copyWithZone:a3];
  long long v39 = *(void **)(v5 + 384);
  *(void *)(v5 + 384) = v38;

  uint64_t v40 = [(NSData *)self->_context copyWithZone:a3];
  long long v41 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v40;

  uint64_t v42 = [(NSString *)self->_universalSectionID copyWithZone:a3];
  long long v43 = *(void **)(v5 + 416);
  *(void *)(v5 + 416) = v42;

  uint64_t v44 = [(NSData *)self->_alertSuppressionContexts copyWithZone:a3];
  v45 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v44;

  if ((*((unsigned char *)&self->_has + 1) & 2) != 0)
  {
    *(_DWORD *)(v5 + 336) = self->_soundAlertType;
    *(_DWORD *)(v5 + 440) |= 0x200u;
  }
  uint64_t v46 = [(NSString *)self->_soundAccountIdentifier copyWithZone:a3];
  v47 = *(void **)(v5 + 328);
  *(void *)(v5 + 328) = v46;

  uint64_t v48 = [(NSString *)self->_soundToneIdentifier copyWithZone:a3];
  v49 = *(void **)(v5 + 344);
  *(void *)(v5 + 344) = v48;

  $DC19B4E307EAB6FC73F13B70E0C144DC has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_attachmentType;
    *(_DWORD *)(v5 + 440) |= 0x40u;
    $DC19B4E307EAB6FC73F13B70E0C144DC has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_18:
      if ((*(_DWORD *)&has & 0x10000) == 0) {
        goto LABEL_19;
      }
      goto LABEL_67;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_18;
  }
  *(unsigned char *)(v5 + 425) = self->_containsUpdatedAttachment;
  *(_DWORD *)(v5 + 440) |= 0x800u;
  $DC19B4E307EAB6FC73F13B70E0C144DC has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_67:
  *(unsigned char *)(v5 + 431) = self->_loading;
  *(_DWORD *)(v5 + 440) |= 0x10000u;
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_20:
    *(unsigned char *)(v5 + 436) = self->_turnsOnDisplay;
    *(_DWORD *)(v5 + 440) |= 0x200000u;
  }
LABEL_21:
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  v51 = self->_subsectionIDs;
  uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v116 objects:v126 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v117;
    do
    {
      uint64_t v55 = 0;
      do
      {
        if (*(void *)v117 != v54) {
          objc_enumerationMutation(v51);
        }
        v56 = (void *)[*(id *)(*((void *)&v116 + 1) + 8 * v55) copyWithZone:a3];
        [(id)v5 addSubsectionIDs:v56];

        ++v55;
      }
      while (v53 != v55);
      uint64_t v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v116 objects:v126 count:16];
    }
    while (v53);
  }

  uint64_t v57 = [(NSString *)self->_dismissalID copyWithZone:a3];
  v58 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v57;

  uint64_t v59 = [(NSString *)self->_attachmentURL copyWithZone:a3];
  $DC19B4E307EAB6FC73F13B70E0C144DC v60 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v59;

  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  v61 = self->_peopleIDs;
  uint64_t v62 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v112 objects:v125 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v113;
    do
    {
      uint64_t v65 = 0;
      do
      {
        if (*(void *)v113 != v64) {
          objc_enumerationMutation(v61);
        }
        v66 = (void *)[*(id *)(*((void *)&v112 + 1) + 8 * v65) copyWithZone:a3];
        [(id)v5 addPeopleIDs:v66];

        ++v65;
      }
      while (v63 != v65);
      uint64_t v63 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v112 objects:v125 count:16];
    }
    while (v63);
  }

  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 428) = self->_ignoresQuietMode;
    *(_DWORD *)(v5 + 440) |= 0x4000u;
  }
  uint64_t v67 = [(NSString *)self->_categoryID copyWithZone:a3];
  v68 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v67;

  uint64_t v69 = [(NSData *)self->_contextNulls copyWithZone:a3];
  v70 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v69;

  uint64_t v71 = [(NSData *)self->_alertSuppressionContextsNulls copyWithZone:a3];
  v72 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v71;

  uint64_t v73 = [(NSString *)self->_threadID copyWithZone:a3];
  v74 = *(void **)(v5 + 392);
  *(void *)(v5 + 392) = v73;

  uint64_t v75 = [(NSString *)self->_attachmentID copyWithZone:a3];
  v76 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v75;

  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  v77 = self->_additionalAttachments;
  uint64_t v78 = [(NSMutableArray *)v77 countByEnumeratingWithState:&v108 objects:v124 count:16];
  if (v78)
  {
    uint64_t v79 = v78;
    uint64_t v80 = *(void *)v109;
    do
    {
      uint64_t v81 = 0;
      do
      {
        if (*(void *)v109 != v80) {
          objc_enumerationMutation(v77);
        }
        v82 = objc_msgSend(*(id *)(*((void *)&v108 + 1) + 8 * v81), "copyWithZone:", a3, (void)v108);
        [(id)v5 addAdditionalAttachments:v82];

        ++v81;
      }
      while (v79 != v81);
      uint64_t v79 = [(NSMutableArray *)v77 countByEnumeratingWithState:&v108 objects:v124 count:16];
    }
    while (v79);
  }

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_requiredExpirationDate;
    *(_DWORD *)(v5 + 440) |= 8u;
  }
  uint64_t v83 = -[NSString copyWithZone:](self->_replyToken, "copyWithZone:", a3, (void)v108);
  v84 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v83;

  $DC19B4E307EAB6FC73F13B70E0C144DC v85 = self->_has;
  if ((*(unsigned char *)&v85 & 0x20) != 0)
  {
    *(double *)(v5 + 48) = self->_soundMaximumDuration;
    *(_DWORD *)(v5 + 440) |= 0x20u;
    $DC19B4E307EAB6FC73F13B70E0C144DC v85 = self->_has;
    if ((*(_DWORD *)&v85 & 0x80000) == 0)
    {
LABEL_48:
      if ((*(_DWORD *)&v85 & 0x40000) == 0) {
        goto LABEL_49;
      }
      goto LABEL_71;
    }
  }
  else if ((*(_DWORD *)&v85 & 0x80000) == 0)
  {
    goto LABEL_48;
  }
  *(unsigned char *)(v5 + 434) = self->_soundShouldRepeat;
  *(_DWORD *)(v5 + 440) |= 0x80000u;
  $DC19B4E307EAB6FC73F13B70E0C144DC v85 = self->_has;
  if ((*(_DWORD *)&v85 & 0x40000) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&v85 & 0x1000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_72;
  }
LABEL_71:
  *(unsigned char *)(v5 + 433) = self->_soundShouldIgnoreRingerSwitch;
  *(_DWORD *)(v5 + 440) |= 0x40000u;
  $DC19B4E307EAB6FC73F13B70E0C144DC v85 = self->_has;
  if ((*(_WORD *)&v85 & 0x1000) == 0)
  {
LABEL_50:
    if ((*(unsigned char *)&v85 & 0x10) == 0) {
      goto LABEL_51;
    }
    goto LABEL_73;
  }
LABEL_72:
  *(unsigned char *)(v5 + 426) = self->_hasCriticalIcon;
  *(_DWORD *)(v5 + 440) |= 0x1000u;
  $DC19B4E307EAB6FC73F13B70E0C144DC v85 = self->_has;
  if ((*(unsigned char *)&v85 & 0x10) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v85 & 0x20000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_74;
  }
LABEL_73:
  *(double *)(v5 + 40) = self->_soundAudioVolume;
  *(_DWORD *)(v5 + 440) |= 0x10u;
  $DC19B4E307EAB6FC73F13B70E0C144DC v85 = self->_has;
  if ((*(_DWORD *)&v85 & 0x20000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v85 & 0x100000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
LABEL_74:
  *(unsigned char *)(v5 + 432) = self->_preemptsPresentedAlert;
  *(_DWORD *)(v5 + 440) |= 0x20000u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_53:
    *(unsigned char *)(v5 + 435) = self->_suppressDelayForForwardedBulletins;
    *(_DWORD *)(v5 + 440) |= 0x100000u;
  }
LABEL_54:
  id v86 = [(BLTPBSectionIcon *)self->_icon copyWithZone:a3];
  v87 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v86;

  if ((*((unsigned char *)&self->_has + 1) & 4) != 0)
  {
    *(unsigned char *)(v5 + 424) = self->_containsUpdateIcon;
    *(_DWORD *)(v5 + 440) |= 0x400u;
  }
  uint64_t v88 = [(NSString *)self->_header copyWithZone:a3];
  v89 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v88;

  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 240) = self->_interruptionLevel;
    *(_DWORD *)(v5 + 440) |= 0x80u;
  }
  id v90 = [(BLTPBCommunicationContext *)self->_communicationContext copyWithZone:a3];
  v91 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v90;

  uint64_t v92 = [(NSString *)self->_contentType copyWithZone:a3];
  long long v93 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v92;

  uint64_t v94 = [(NSString *)self->_filterCriteria copyWithZone:a3];
  long long v95 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v94;

  id v96 = [(BLTPBAction *)self->_followActivityAction copyWithZone:a3];
  long long v97 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v96;

  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 427) = self->_hasSubordinateIcon;
    *(_DWORD *)(v5 + 440) |= 0x2000u;
  }
  uint64_t v98 = [(NSData *)self->_summary copyWithZone:a3];
  long long v99 = *(void **)(v5 + 368);
  *(void *)(v5 + 368) = v98;

  uint64_t v100 = [(NSData *)self->_threadSummary copyWithZone:a3];
  v101 = *(void **)(v5 + 400);
  *(void *)(v5 + 400) = v100;

  uint64_t v102 = [(NSData *)self->_attributedMessage copyWithZone:a3];
  v103 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v102;

  uint64_t v104 = [(NSData *)self->_eventBehavior copyWithZone:a3];
  v105 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v104;

  $DC19B4E307EAB6FC73F13B70E0C144DC v106 = self->_has;
  if ((*(unsigned char *)&v106 & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_priorityNotificationStatus;
    *(_DWORD *)(v5 + 440) |= 2u;
    $DC19B4E307EAB6FC73F13B70E0C144DC v106 = self->_has;
  }
  if ((*(_WORD *)&v106 & 0x8000) != 0)
  {
    *(unsigned char *)(v5 + 430) = self->_isHighlight;
    *(_DWORD *)(v5 + 440) |= 0x8000u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_233;
  }
  bulletinID = self->_bulletinID;
  if ((unint64_t)bulletinID | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](bulletinID, "isEqual:")) {
      goto LABEL_233;
    }
  }
  sectionID = self->_sectionID;
  if ((unint64_t)sectionID | *((void *)v4 + 37))
  {
    if (!-[NSString isEqual:](sectionID, "isEqual:")) {
      goto LABEL_233;
    }
  }
  sectionDisplayName = self->_sectionDisplayName;
  if ((unint64_t)sectionDisplayName | *((void *)v4 + 36))
  {
    if (!-[NSString isEqual:](sectionDisplayName, "isEqual:")) {
      goto LABEL_233;
    }
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 51))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_233;
    }
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((void *)v4 + 45))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:")) {
      goto LABEL_233;
    }
  }
  messageTitle = self->_messageTitle;
  if ((unint64_t)messageTitle | *((void *)v4 + 31))
  {
    if (!-[NSString isEqual:](messageTitle, "isEqual:")) {
      goto LABEL_233;
    }
  }
  int v11 = *((_DWORD *)v4 + 110);
  if (*(unsigned char *)&self->_has)
  {
    if ((v11 & 1) == 0 || self->_date != *((double *)v4 + 1)) {
      goto LABEL_233;
    }
  }
  else if (v11)
  {
    goto LABEL_233;
  }
  attachment = self->_attachment;
  if ((unint64_t)attachment | *((void *)v4 + 10) && !-[NSData isEqual:](attachment, "isEqual:")) {
    goto LABEL_233;
  }
  supplementaryActions = self->_supplementaryActions;
  if ((unint64_t)supplementaryActions | *((void *)v4 + 47))
  {
    if (!-[NSMutableArray isEqual:](supplementaryActions, "isEqual:")) {
      goto LABEL_233;
    }
  }
  if (self->_feed != *((_DWORD *)v4 + 50)) {
    goto LABEL_233;
  }
  snoozeAction = self->_snoozeAction;
  if ((unint64_t)snoozeAction | *((void *)v4 + 39))
  {
    if (!-[BLTPBAction isEqual:](snoozeAction, "isEqual:")) {
      goto LABEL_233;
    }
  }
  recordID = self->_recordID;
  if ((unint64_t)recordID | *((void *)v4 + 34))
  {
    if (!-[NSString isEqual:](recordID, "isEqual:")) {
      goto LABEL_233;
    }
  }
  publisherBulletinID = self->_publisherBulletinID;
  if ((unint64_t)publisherBulletinID | *((void *)v4 + 33))
  {
    if (!-[NSString isEqual:](publisherBulletinID, "isEqual:")) {
      goto LABEL_233;
    }
  }
  dismissAction = self->_dismissAction;
  if ((unint64_t)dismissAction | *((void *)v4 + 22))
  {
    if (!-[BLTPBAction isEqual:](dismissAction, "isEqual:")) {
      goto LABEL_233;
    }
  }
  int v18 = *((_DWORD *)v4 + 110);
  if (*((unsigned char *)&self->_has + 1))
  {
    if ((v18 & 0x100) == 0 || self->_sectionSubtype != *((_DWORD *)v4 + 76)) {
      goto LABEL_233;
    }
  }
  else if ((v18 & 0x100) != 0)
  {
    goto LABEL_233;
  }
  sockPuppetAppBundleID = self->_sockPuppetAppBundleID;
  if ((unint64_t)sockPuppetAppBundleID | *((void *)v4 + 40)
    && !-[NSString isEqual:](sockPuppetAppBundleID, "isEqual:"))
  {
    goto LABEL_233;
  }
  category = self->_category;
  if ((unint64_t)category | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](category, "isEqual:")) {
      goto LABEL_233;
    }
  }
  int v21 = *((_DWORD *)v4 + 110);
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v21 & 4) == 0 || self->_publicationDate != *((double *)v4 + 3)) {
      goto LABEL_233;
    }
  }
  else if ((v21 & 4) != 0)
  {
    goto LABEL_233;
  }
  if (self->_includesSound)
  {
    if (!*((unsigned char *)v4 + 429)) {
      goto LABEL_233;
    }
  }
  else if (*((unsigned char *)v4 + 429))
  {
    goto LABEL_233;
  }
  teamID = self->_teamID;
  if ((unint64_t)teamID | *((void *)v4 + 48) && !-[NSString isEqual:](teamID, "isEqual:")) {
    goto LABEL_233;
  }
  context = self->_context;
  if ((unint64_t)context | *((void *)v4 + 20))
  {
    if (!-[NSData isEqual:](context, "isEqual:")) {
      goto LABEL_233;
    }
  }
  universalSectionID = self->_universalSectionID;
  if ((unint64_t)universalSectionID | *((void *)v4 + 52))
  {
    if (!-[NSString isEqual:](universalSectionID, "isEqual:")) {
      goto LABEL_233;
    }
  }
  alertSuppressionContexts = self->_alertSuppressionContexts;
  if ((unint64_t)alertSuppressionContexts | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](alertSuppressionContexts, "isEqual:")) {
      goto LABEL_233;
    }
  }
  int v26 = *((_DWORD *)v4 + 110);
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0)
  {
    if ((v26 & 0x200) == 0 || self->_soundAlertType != *((_DWORD *)v4 + 84)) {
      goto LABEL_233;
    }
  }
  else if ((v26 & 0x200) != 0)
  {
    goto LABEL_233;
  }
  soundAccountIdentifier = self->_soundAccountIdentifier;
  if ((unint64_t)soundAccountIdentifier | *((void *)v4 + 41)
    && !-[NSString isEqual:](soundAccountIdentifier, "isEqual:"))
  {
    goto LABEL_233;
  }
  soundToneIdentifier = self->_soundToneIdentifier;
  if ((unint64_t)soundToneIdentifier | *((void *)v4 + 43))
  {
    if (!-[NSString isEqual:](soundToneIdentifier, "isEqual:")) {
      goto LABEL_233;
    }
  }
  $DC19B4E307EAB6FC73F13B70E0C144DC has = self->_has;
  int v30 = *((_DWORD *)v4 + 110);
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v30 & 0x40) == 0 || self->_attachmentType != *((_DWORD *)v4 + 24)) {
      goto LABEL_233;
    }
  }
  else if ((v30 & 0x40) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v30 & 0x800) == 0) {
      goto LABEL_233;
    }
    if (self->_containsUpdatedAttachment)
    {
      if (!*((unsigned char *)v4 + 425)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 425))
    {
      goto LABEL_233;
    }
  }
  else if ((v30 & 0x800) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v30 & 0x10000) == 0) {
      goto LABEL_233;
    }
    if (self->_loading)
    {
      if (!*((unsigned char *)v4 + 431)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 431))
    {
      goto LABEL_233;
    }
  }
  else if ((v30 & 0x10000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v30 & 0x200000) == 0) {
      goto LABEL_233;
    }
    if (self->_turnsOnDisplay)
    {
      if (!*((unsigned char *)v4 + 436)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 436))
    {
      goto LABEL_233;
    }
  }
  else if ((v30 & 0x200000) != 0)
  {
    goto LABEL_233;
  }
  subsectionIDs = self->_subsectionIDs;
  if ((unint64_t)subsectionIDs | *((void *)v4 + 44)
    && !-[NSMutableArray isEqual:](subsectionIDs, "isEqual:"))
  {
    goto LABEL_233;
  }
  dismissalID = self->_dismissalID;
  if ((unint64_t)dismissalID | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](dismissalID, "isEqual:")) {
      goto LABEL_233;
    }
  }
  attachmentURL = self->_attachmentURL;
  if ((unint64_t)attachmentURL | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](attachmentURL, "isEqual:")) {
      goto LABEL_233;
    }
  }
  peopleIDs = self->_peopleIDs;
  if ((unint64_t)peopleIDs | *((void *)v4 + 32))
  {
    if (!-[NSMutableArray isEqual:](peopleIDs, "isEqual:")) {
      goto LABEL_233;
    }
  }
  int v35 = *((_DWORD *)v4 + 110);
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    if ((v35 & 0x4000) == 0) {
      goto LABEL_233;
    }
    if (self->_ignoresQuietMode)
    {
      if (!*((unsigned char *)v4 + 428)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 428))
    {
      goto LABEL_233;
    }
  }
  else if ((v35 & 0x4000) != 0)
  {
    goto LABEL_233;
  }
  categoryID = self->_categoryID;
  if ((unint64_t)categoryID | *((void *)v4 + 17)
    && !-[NSString isEqual:](categoryID, "isEqual:"))
  {
    goto LABEL_233;
  }
  contextNulls = self->_contextNulls;
  if ((unint64_t)contextNulls | *((void *)v4 + 21))
  {
    if (!-[NSData isEqual:](contextNulls, "isEqual:")) {
      goto LABEL_233;
    }
  }
  alertSuppressionContextsNulls = self->_alertSuppressionContextsNulls;
  if ((unint64_t)alertSuppressionContextsNulls | *((void *)v4 + 9))
  {
    if (!-[NSData isEqual:](alertSuppressionContextsNulls, "isEqual:")) {
      goto LABEL_233;
    }
  }
  threadID = self->_threadID;
  if ((unint64_t)threadID | *((void *)v4 + 49))
  {
    if (!-[NSString isEqual:](threadID, "isEqual:")) {
      goto LABEL_233;
    }
  }
  attachmentID = self->_attachmentID;
  if ((unint64_t)attachmentID | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](attachmentID, "isEqual:")) {
      goto LABEL_233;
    }
  }
  additionalAttachments = self->_additionalAttachments;
  if ((unint64_t)additionalAttachments | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](additionalAttachments, "isEqual:")) {
      goto LABEL_233;
    }
  }
  $DC19B4E307EAB6FC73F13B70E0C144DC v42 = self->_has;
  int v43 = *((_DWORD *)v4 + 110);
  if ((*(unsigned char *)&v42 & 8) != 0)
  {
    if ((v43 & 8) == 0 || self->_requiredExpirationDate != *((double *)v4 + 4)) {
      goto LABEL_233;
    }
  }
  else if ((v43 & 8) != 0)
  {
    goto LABEL_233;
  }
  replyToken = self->_replyToken;
  if ((unint64_t)replyToken | *((void *)v4 + 35))
  {
    if (!-[NSString isEqual:](replyToken, "isEqual:")) {
      goto LABEL_233;
    }
    $DC19B4E307EAB6FC73F13B70E0C144DC v42 = self->_has;
  }
  int v45 = *((_DWORD *)v4 + 110);
  if ((*(unsigned char *)&v42 & 0x20) != 0)
  {
    if ((v45 & 0x20) == 0 || self->_soundMaximumDuration != *((double *)v4 + 6)) {
      goto LABEL_233;
    }
  }
  else if ((v45 & 0x20) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v42 & 0x80000) != 0)
  {
    if ((v45 & 0x80000) == 0) {
      goto LABEL_233;
    }
    if (self->_soundShouldRepeat)
    {
      if (!*((unsigned char *)v4 + 434)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 434))
    {
      goto LABEL_233;
    }
  }
  else if ((v45 & 0x80000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v42 & 0x40000) != 0)
  {
    if ((v45 & 0x40000) == 0) {
      goto LABEL_233;
    }
    if (self->_soundShouldIgnoreRingerSwitch)
    {
      if (!*((unsigned char *)v4 + 433)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 433))
    {
      goto LABEL_233;
    }
  }
  else if ((v45 & 0x40000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_WORD *)&v42 & 0x1000) != 0)
  {
    if ((v45 & 0x1000) == 0) {
      goto LABEL_233;
    }
    if (self->_hasCriticalIcon)
    {
      if (!*((unsigned char *)v4 + 426)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 426))
    {
      goto LABEL_233;
    }
  }
  else if ((v45 & 0x1000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(unsigned char *)&v42 & 0x10) != 0)
  {
    if ((v45 & 0x10) == 0 || self->_soundAudioVolume != *((double *)v4 + 5)) {
      goto LABEL_233;
    }
  }
  else if ((v45 & 0x10) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v42 & 0x20000) != 0)
  {
    if ((v45 & 0x20000) == 0) {
      goto LABEL_233;
    }
    if (self->_preemptsPresentedAlert)
    {
      if (!*((unsigned char *)v4 + 432)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 432))
    {
      goto LABEL_233;
    }
  }
  else if ((v45 & 0x20000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v42 & 0x100000) != 0)
  {
    if ((v45 & 0x100000) == 0) {
      goto LABEL_233;
    }
    if (self->_suppressDelayForForwardedBulletins)
    {
      if (!*((unsigned char *)v4 + 435)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 435))
    {
      goto LABEL_233;
    }
  }
  else if ((v45 & 0x100000) != 0)
  {
    goto LABEL_233;
  }
  icon = self->_icon;
  if ((unint64_t)icon | *((void *)v4 + 29))
  {
    if (!-[BLTPBSectionIcon isEqual:](icon, "isEqual:")) {
      goto LABEL_233;
    }
    $DC19B4E307EAB6FC73F13B70E0C144DC v42 = self->_has;
  }
  int v47 = *((_DWORD *)v4 + 110);
  if ((*(_WORD *)&v42 & 0x400) != 0)
  {
    if ((v47 & 0x400) == 0) {
      goto LABEL_233;
    }
    if (self->_containsUpdateIcon)
    {
      if (!*((unsigned char *)v4 + 424)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 424))
    {
      goto LABEL_233;
    }
  }
  else if ((v47 & 0x400) != 0)
  {
    goto LABEL_233;
  }
  header = self->_header;
  if ((unint64_t)header | *((void *)v4 + 28))
  {
    if (!-[NSString isEqual:](header, "isEqual:")) {
      goto LABEL_233;
    }
    $DC19B4E307EAB6FC73F13B70E0C144DC v42 = self->_has;
  }
  int v49 = *((_DWORD *)v4 + 110);
  if ((*(unsigned char *)&v42 & 0x80) != 0)
  {
    if ((v49 & 0x80) == 0 || self->_interruptionLevel != *((_DWORD *)v4 + 60)) {
      goto LABEL_233;
    }
  }
  else if ((v49 & 0x80) != 0)
  {
    goto LABEL_233;
  }
  communicationContext = self->_communicationContext;
  if ((unint64_t)communicationContext | *((void *)v4 + 18)
    && !-[BLTPBCommunicationContext isEqual:](communicationContext, "isEqual:"))
  {
    goto LABEL_233;
  }
  contentType = self->_contentType;
  if ((unint64_t)contentType | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](contentType, "isEqual:")) {
      goto LABEL_233;
    }
  }
  filterCriteria = self->_filterCriteria;
  if ((unint64_t)filterCriteria | *((void *)v4 + 26))
  {
    if (!-[NSString isEqual:](filterCriteria, "isEqual:")) {
      goto LABEL_233;
    }
  }
  followActivityAction = self->_followActivityAction;
  if ((unint64_t)followActivityAction | *((void *)v4 + 27))
  {
    if (!-[BLTPBAction isEqual:](followActivityAction, "isEqual:")) {
      goto LABEL_233;
    }
  }
  int v54 = *((_DWORD *)v4 + 110);
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    if ((v54 & 0x2000) == 0) {
      goto LABEL_233;
    }
    if (self->_hasSubordinateIcon)
    {
      if (!*((unsigned char *)v4 + 427)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 427))
    {
      goto LABEL_233;
    }
  }
  else if ((v54 & 0x2000) != 0)
  {
    goto LABEL_233;
  }
  summary = self->_summary;
  if ((unint64_t)summary | *((void *)v4 + 46) && !-[NSData isEqual:](summary, "isEqual:")) {
    goto LABEL_233;
  }
  threadSummary = self->_threadSummary;
  if ((unint64_t)threadSummary | *((void *)v4 + 50))
  {
    if (!-[NSData isEqual:](threadSummary, "isEqual:")) {
      goto LABEL_233;
    }
  }
  attributedMessage = self->_attributedMessage;
  if ((unint64_t)attributedMessage | *((void *)v4 + 14))
  {
    if (!-[NSData isEqual:](attributedMessage, "isEqual:")) {
      goto LABEL_233;
    }
  }
  eventBehavior = self->_eventBehavior;
  if ((unint64_t)eventBehavior | *((void *)v4 + 24))
  {
    if (!-[NSData isEqual:](eventBehavior, "isEqual:")) {
      goto LABEL_233;
    }
  }
  $DC19B4E307EAB6FC73F13B70E0C144DC v59 = self->_has;
  int v60 = *((_DWORD *)v4 + 110);
  if ((*(unsigned char *)&v59 & 2) != 0)
  {
    if ((v60 & 2) == 0 || self->_priorityNotificationStatus != *((double *)v4 + 2)) {
      goto LABEL_233;
    }
  }
  else if ((v60 & 2) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_WORD *)&v59 & 0x8000) != 0)
  {
    if ((v60 & 0x8000) != 0)
    {
      if (self->_isHighlight)
      {
        if (!*((unsigned char *)v4 + 430)) {
          goto LABEL_233;
        }
      }
      else if (*((unsigned char *)v4 + 430))
      {
        goto LABEL_233;
      }
      BOOL v61 = 1;
      goto LABEL_234;
    }
LABEL_233:
    BOOL v61 = 0;
    goto LABEL_234;
  }
  BOOL v61 = (*((_DWORD *)v4 + 110) & 0x8000) == 0;
LABEL_234:

  return v61;
}

- (unint64_t)hash
{
  NSUInteger v99 = [(NSString *)self->_bulletinID hash];
  NSUInteger v98 = [(NSString *)self->_sectionID hash];
  NSUInteger v97 = [(NSString *)self->_sectionDisplayName hash];
  NSUInteger v96 = [(NSString *)self->_title hash];
  NSUInteger v95 = [(NSString *)self->_subtitle hash];
  NSUInteger v94 = [(NSString *)self->_messageTitle hash];
  if (*(unsigned char *)&self->_has)
  {
    double date = self->_date;
    double v5 = -date;
    if (date >= 0.0) {
      double v5 = self->_date;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  unint64_t v93 = v3;
  uint64_t v91 = [(NSData *)self->_attachment hash];
  uint64_t v89 = [(NSMutableArray *)self->_supplementaryActions hash];
  unsigned int feed = self->_feed;
  unint64_t v90 = [(BLTPBAction *)self->_snoozeAction hash];
  NSUInteger v88 = [(NSString *)self->_recordID hash];
  NSUInteger v87 = [(NSString *)self->_publisherBulletinID hash];
  unint64_t v86 = [(BLTPBAction *)self->_dismissAction hash];
  if (*((unsigned char *)&self->_has + 1)) {
    uint64_t v85 = 2654435761 * self->_sectionSubtype;
  }
  else {
    uint64_t v85 = 0;
  }
  NSUInteger v84 = [(NSString *)self->_sockPuppetAppBundleID hash];
  NSUInteger v83 = [(NSString *)self->_category hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    double publicationDate = self->_publicationDate;
    double v10 = -publicationDate;
    if (publicationDate >= 0.0) {
      double v10 = self->_publicationDate;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  unint64_t v82 = v8;
  BOOL includesSound = self->_includesSound;
  NSUInteger v81 = [(NSString *)self->_teamID hash];
  uint64_t v79 = [(NSData *)self->_context hash];
  NSUInteger v78 = [(NSString *)self->_universalSectionID hash];
  uint64_t v77 = [(NSData *)self->_alertSuppressionContexts hash];
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0) {
    uint64_t v76 = 2654435761 * self->_soundAlertType;
  }
  else {
    uint64_t v76 = 0;
  }
  NSUInteger v75 = [(NSString *)self->_soundAccountIdentifier hash];
  NSUInteger v74 = [(NSString *)self->_soundToneIdentifier hash];
  $DC19B4E307EAB6FC73F13B70E0C144DC has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    uint64_t v73 = 2654435761 * self->_attachmentType;
    if ((*(_WORD *)&has & 0x800) != 0)
    {
LABEL_25:
      uint64_t v72 = 2654435761 * self->_containsUpdatedAttachment;
      if ((*(_DWORD *)&has & 0x10000) != 0) {
        goto LABEL_26;
      }
LABEL_30:
      uint64_t v71 = 0;
      if ((*(_DWORD *)&has & 0x200000) != 0) {
        goto LABEL_27;
      }
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v73 = 0;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_25;
    }
  }
  uint64_t v72 = 0;
  if ((*(_DWORD *)&has & 0x10000) == 0) {
    goto LABEL_30;
  }
LABEL_26:
  uint64_t v71 = 2654435761 * self->_loading;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_27:
    uint64_t v70 = 2654435761 * self->_turnsOnDisplay;
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v70 = 0;
LABEL_32:
  uint64_t v69 = [(NSMutableArray *)self->_subsectionIDs hash];
  NSUInteger v68 = [(NSString *)self->_dismissalID hash];
  NSUInteger v67 = [(NSString *)self->_attachmentURL hash];
  uint64_t v66 = [(NSMutableArray *)self->_peopleIDs hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    uint64_t v65 = 2654435761 * self->_ignoresQuietMode;
  }
  else {
    uint64_t v65 = 0;
  }
  NSUInteger v64 = [(NSString *)self->_categoryID hash];
  uint64_t v63 = [(NSData *)self->_contextNulls hash];
  uint64_t v62 = [(NSData *)self->_alertSuppressionContextsNulls hash];
  NSUInteger v61 = [(NSString *)self->_threadID hash];
  NSUInteger v60 = [(NSString *)self->_attachmentID hash];
  uint64_t v59 = [(NSMutableArray *)self->_additionalAttachments hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    double requiredExpirationDate = self->_requiredExpirationDate;
    double v16 = -requiredExpirationDate;
    if (requiredExpirationDate >= 0.0) {
      double v16 = self->_requiredExpirationDate;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  unint64_t v58 = v14;
  NSUInteger v57 = [(NSString *)self->_replyToken hash];
  $DC19B4E307EAB6FC73F13B70E0C144DC v19 = self->_has;
  if ((*(unsigned char *)&v19 & 0x20) != 0)
  {
    double soundMaximumDuration = self->_soundMaximumDuration;
    double v22 = -soundMaximumDuration;
    if (soundMaximumDuration >= 0.0) {
      double v22 = self->_soundMaximumDuration;
    }
    long double v23 = floor(v22 + 0.5);
    double v24 = (v22 - v23) * 1.84467441e19;
    unint64_t v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v20 += (unint64_t)v24;
      }
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    unint64_t v20 = 0;
  }
  if ((*(_DWORD *)&v19 & 0x80000) != 0)
  {
    uint64_t v55 = 2654435761 * self->_soundShouldRepeat;
    if ((*(_DWORD *)&v19 & 0x40000) != 0)
    {
LABEL_53:
      uint64_t v54 = 2654435761 * self->_soundShouldIgnoreRingerSwitch;
      if ((*(_WORD *)&v19 & 0x1000) != 0) {
        goto LABEL_54;
      }
LABEL_61:
      uint64_t v56 = 0;
      if ((*(unsigned char *)&v19 & 0x10) != 0) {
        goto LABEL_55;
      }
LABEL_62:
      unint64_t v29 = 0;
      goto LABEL_65;
    }
  }
  else
  {
    uint64_t v55 = 0;
    if ((*(_DWORD *)&v19 & 0x40000) != 0) {
      goto LABEL_53;
    }
  }
  uint64_t v54 = 0;
  if ((*(_WORD *)&v19 & 0x1000) == 0) {
    goto LABEL_61;
  }
LABEL_54:
  uint64_t v56 = 2654435761 * self->_hasCriticalIcon;
  if ((*(unsigned char *)&v19 & 0x10) == 0) {
    goto LABEL_62;
  }
LABEL_55:
  double soundAudioVolume = self->_soundAudioVolume;
  double v26 = -soundAudioVolume;
  if (soundAudioVolume >= 0.0) {
    double v26 = self->_soundAudioVolume;
  }
  long double v27 = floor(v26 + 0.5);
  double v28 = (v26 - v27) * 1.84467441e19;
  unint64_t v29 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
  if (v28 >= 0.0)
  {
    if (v28 > 0.0) {
      v29 += (unint64_t)v28;
    }
  }
  else
  {
    v29 -= (unint64_t)fabs(v28);
  }
LABEL_65:
  if ((*(_DWORD *)&v19 & 0x20000) != 0) {
    uint64_t v52 = 2654435761 * self->_preemptsPresentedAlert;
  }
  else {
    uint64_t v52 = 0;
  }
  unint64_t v53 = v29;
  if ((*(_DWORD *)&v19 & 0x100000) != 0) {
    uint64_t v51 = 2654435761 * self->_suppressDelayForForwardedBulletins;
  }
  else {
    uint64_t v51 = 0;
  }
  unint64_t v50 = [(BLTPBSectionIcon *)self->_icon hash];
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    uint64_t v49 = 2654435761 * self->_containsUpdateIcon;
  }
  else {
    uint64_t v49 = 0;
  }
  NSUInteger v48 = [(NSString *)self->_header hash];
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    uint64_t v47 = 2654435761 * self->_interruptionLevel;
  }
  else {
    uint64_t v47 = 0;
  }
  unint64_t v46 = [(BLTPBCommunicationContext *)self->_communicationContext hash];
  NSUInteger v45 = [(NSString *)self->_contentType hash];
  NSUInteger v44 = [(NSString *)self->_filterCriteria hash];
  unint64_t v30 = [(BLTPBAction *)self->_followActivityAction hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    uint64_t v31 = 2654435761 * self->_hasSubordinateIcon;
  }
  else {
    uint64_t v31 = 0;
  }
  uint64_t v32 = [(NSData *)self->_summary hash];
  uint64_t v33 = [(NSData *)self->_threadSummary hash];
  uint64_t v34 = [(NSData *)self->_attributedMessage hash];
  uint64_t v35 = [(NSData *)self->_eventBehavior hash];
  $DC19B4E307EAB6FC73F13B70E0C144DC v36 = self->_has;
  if ((*(unsigned char *)&v36 & 2) != 0)
  {
    double priorityNotificationStatus = self->_priorityNotificationStatus;
    double v39 = -priorityNotificationStatus;
    if (priorityNotificationStatus >= 0.0) {
      double v39 = self->_priorityNotificationStatus;
    }
    long double v40 = floor(v39 + 0.5);
    double v41 = (v39 - v40) * 1.84467441e19;
    unint64_t v37 = 2654435761u * (unint64_t)fmod(v40, 1.84467441e19);
    if (v41 >= 0.0)
    {
      if (v41 > 0.0) {
        v37 += (unint64_t)v41;
      }
    }
    else
    {
      v37 -= (unint64_t)fabs(v41);
    }
  }
  else
  {
    unint64_t v37 = 0;
  }
  if ((*(_WORD *)&v36 & 0x8000) != 0) {
    uint64_t v42 = 2654435761 * self->_isHighlight;
  }
  else {
    uint64_t v42 = 0;
  }
  return v98 ^ v99 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v91 ^ v89 ^ (2654435761 * feed) ^ v90 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ (2654435761 * includesSound) ^ v81 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v20 ^ v55 ^ v54 ^ v56 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34 ^ v35 ^ v37 ^ v42;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 15)) {
    -[BLTPBBulletin setBulletinID:](self, "setBulletinID:");
  }
  if (*((void *)v4 + 37)) {
    -[BLTPBBulletin setSectionID:](self, "setSectionID:");
  }
  if (*((void *)v4 + 36)) {
    -[BLTPBBulletin setSectionDisplayName:](self, "setSectionDisplayName:");
  }
  if (*((void *)v4 + 51)) {
    -[BLTPBBulletin setTitle:](self, "setTitle:");
  }
  if (*((void *)v4 + 45)) {
    -[BLTPBBulletin setSubtitle:](self, "setSubtitle:");
  }
  if (*((void *)v4 + 31)) {
    -[BLTPBBulletin setMessageTitle:](self, "setMessageTitle:");
  }
  if (*((unsigned char *)v4 + 440))
  {
    self->_double date = *((double *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 10)) {
    -[BLTPBBulletin setAttachment:](self, "setAttachment:");
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v5 = *((id *)v4 + 47);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v51 != v8) {
          objc_enumerationMutation(v5);
        }
        [(BLTPBBulletin *)self addSupplementaryActions:*(void *)(*((void *)&v50 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v7);
  }

  self->_unsigned int feed = *((_DWORD *)v4 + 50);
  snoozeAction = self->_snoozeAction;
  uint64_t v11 = *((void *)v4 + 39);
  if (snoozeAction)
  {
    if (v11) {
      -[BLTPBAction mergeFrom:](snoozeAction, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[BLTPBBulletin setSnoozeAction:](self, "setSnoozeAction:");
  }
  if (*((void *)v4 + 34)) {
    -[BLTPBBulletin setRecordID:](self, "setRecordID:");
  }
  if (*((void *)v4 + 33)) {
    -[BLTPBBulletin setPublisherBulletinID:](self, "setPublisherBulletinID:");
  }
  dismissAction = self->_dismissAction;
  uint64_t v13 = *((void *)v4 + 22);
  if (dismissAction)
  {
    if (v13) {
      -[BLTPBAction mergeFrom:](dismissAction, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[BLTPBBulletin setDismissAction:](self, "setDismissAction:");
  }
  if (*((unsigned char *)v4 + 441))
  {
    self->_sectionSubtype = *((_DWORD *)v4 + 76);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((void *)v4 + 40)) {
    -[BLTPBBulletin setSockPuppetAppBundleID:](self, "setSockPuppetAppBundleID:");
  }
  if (*((void *)v4 + 16)) {
    -[BLTPBBulletin setCategory:](self, "setCategory:");
  }
  if ((*((unsigned char *)v4 + 440) & 4) != 0)
  {
    self->_double publicationDate = *((double *)v4 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
  self->_BOOL includesSound = *((unsigned char *)v4 + 429);
  if (*((void *)v4 + 48)) {
    -[BLTPBBulletin setTeamID:](self, "setTeamID:");
  }
  if (*((void *)v4 + 20)) {
    -[BLTPBBulletin setContext:](self, "setContext:");
  }
  if (*((void *)v4 + 52)) {
    -[BLTPBBulletin setUniversalSectionID:](self, "setUniversalSectionID:");
  }
  if (*((void *)v4 + 8)) {
    -[BLTPBBulletin setAlertSuppressionContexts:](self, "setAlertSuppressionContexts:");
  }
  if ((*((unsigned char *)v4 + 441) & 2) != 0)
  {
    self->_soundAlertType = *((_DWORD *)v4 + 84);
    *(_DWORD *)&self->_has |= 0x200u;
  }
  if (*((void *)v4 + 41)) {
    -[BLTPBBulletin setSoundAccountIdentifier:](self, "setSoundAccountIdentifier:");
  }
  if (*((void *)v4 + 43)) {
    -[BLTPBBulletin setSoundToneIdentifier:](self, "setSoundToneIdentifier:");
  }
  int v14 = *((_DWORD *)v4 + 110);
  if ((v14 & 0x40) != 0)
  {
    self->_attachmentType = *((_DWORD *)v4 + 24);
    *(_DWORD *)&self->_has |= 0x40u;
    int v14 = *((_DWORD *)v4 + 110);
    if ((v14 & 0x800) == 0)
    {
LABEL_62:
      if ((v14 & 0x10000) == 0) {
        goto LABEL_63;
      }
      goto LABEL_119;
    }
  }
  else if ((v14 & 0x800) == 0)
  {
    goto LABEL_62;
  }
  self->_containsUpdatedAttachment = *((unsigned char *)v4 + 425);
  *(_DWORD *)&self->_has |= 0x800u;
  int v14 = *((_DWORD *)v4 + 110);
  if ((v14 & 0x10000) == 0)
  {
LABEL_63:
    if ((v14 & 0x200000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }
LABEL_119:
  self->_loading = *((unsigned char *)v4 + 431);
  *(_DWORD *)&self->_has |= 0x10000u;
  if ((*((_DWORD *)v4 + 110) & 0x200000) != 0)
  {
LABEL_64:
    self->_turnsOnDisplay = *((unsigned char *)v4 + 436);
    *(_DWORD *)&self->_has |= 0x200000u;
  }
LABEL_65:
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v15 = *((id *)v4 + 44);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v47 != v18) {
          objc_enumerationMutation(v15);
        }
        [(BLTPBBulletin *)self addSubsectionIDs:*(void *)(*((void *)&v46 + 1) + 8 * j)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v17);
  }

  if (*((void *)v4 + 23)) {
    -[BLTPBBulletin setDismissalID:](self, "setDismissalID:");
  }
  if (*((void *)v4 + 13)) {
    -[BLTPBBulletin setAttachmentURL:](self, "setAttachmentURL:");
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v20 = *((id *)v4 + 32);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v42 objects:v55 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v43;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v43 != v23) {
          objc_enumerationMutation(v20);
        }
        [(BLTPBBulletin *)self addPeopleIDs:*(void *)(*((void *)&v42 + 1) + 8 * k)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v42 objects:v55 count:16];
    }
    while (v22);
  }

  if ((*((unsigned char *)v4 + 441) & 0x40) != 0)
  {
    self->_ignoresQuietMode = *((unsigned char *)v4 + 428);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
  if (*((void *)v4 + 17)) {
    -[BLTPBBulletin setCategoryID:](self, "setCategoryID:");
  }
  if (*((void *)v4 + 21)) {
    -[BLTPBBulletin setContextNulls:](self, "setContextNulls:");
  }
  if (*((void *)v4 + 9)) {
    -[BLTPBBulletin setAlertSuppressionContextsNulls:](self, "setAlertSuppressionContextsNulls:");
  }
  if (*((void *)v4 + 49)) {
    -[BLTPBBulletin setThreadID:](self, "setThreadID:");
  }
  if (*((void *)v4 + 11)) {
    -[BLTPBBulletin setAttachmentID:](self, "setAttachmentID:");
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v25 = *((id *)v4 + 7);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v38 objects:v54 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v39;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v39 != v28) {
          objc_enumerationMutation(v25);
        }
        -[BLTPBBulletin addAdditionalAttachments:](self, "addAdditionalAttachments:", *(void *)(*((void *)&v38 + 1) + 8 * m), (void)v38);
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v38 objects:v54 count:16];
    }
    while (v27);
  }

  if ((*((unsigned char *)v4 + 440) & 8) != 0)
  {
    self->_double requiredExpirationDate = *((double *)v4 + 4);
    *(_DWORD *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 35)) {
    -[BLTPBBulletin setReplyToken:](self, "setReplyToken:");
  }
  int v30 = *((_DWORD *)v4 + 110);
  if ((v30 & 0x20) != 0)
  {
    self->_double soundMaximumDuration = *((double *)v4 + 6);
    *(_DWORD *)&self->_has |= 0x20u;
    int v30 = *((_DWORD *)v4 + 110);
    if ((v30 & 0x80000) == 0)
    {
LABEL_108:
      if ((v30 & 0x40000) == 0) {
        goto LABEL_109;
      }
      goto LABEL_123;
    }
  }
  else if ((v30 & 0x80000) == 0)
  {
    goto LABEL_108;
  }
  self->_soundShouldRepeat = *((unsigned char *)v4 + 434);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v30 = *((_DWORD *)v4 + 110);
  if ((v30 & 0x40000) == 0)
  {
LABEL_109:
    if ((v30 & 0x1000) == 0) {
      goto LABEL_110;
    }
    goto LABEL_124;
  }
LABEL_123:
  self->_soundShouldIgnoreRingerSwitch = *((unsigned char *)v4 + 433);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v30 = *((_DWORD *)v4 + 110);
  if ((v30 & 0x1000) == 0)
  {
LABEL_110:
    if ((v30 & 0x10) == 0) {
      goto LABEL_111;
    }
    goto LABEL_125;
  }
LABEL_124:
  self->_hasCriticalIcon = *((unsigned char *)v4 + 426);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v30 = *((_DWORD *)v4 + 110);
  if ((v30 & 0x10) == 0)
  {
LABEL_111:
    if ((v30 & 0x20000) == 0) {
      goto LABEL_112;
    }
    goto LABEL_126;
  }
LABEL_125:
  self->_double soundAudioVolume = *((double *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v30 = *((_DWORD *)v4 + 110);
  if ((v30 & 0x20000) == 0)
  {
LABEL_112:
    if ((v30 & 0x100000) == 0) {
      goto LABEL_114;
    }
    goto LABEL_113;
  }
LABEL_126:
  self->_preemptsPresentedAlert = *((unsigned char *)v4 + 432);
  *(_DWORD *)&self->_has |= 0x20000u;
  if ((*((_DWORD *)v4 + 110) & 0x100000) != 0)
  {
LABEL_113:
    self->_suppressDelayForForwardedBulletins = *((unsigned char *)v4 + 435);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
LABEL_114:
  icon = self->_icon;
  uint64_t v32 = *((void *)v4 + 29);
  if (icon)
  {
    if (v32) {
      -[BLTPBSectionIcon mergeFrom:](icon, "mergeFrom:");
    }
  }
  else if (v32)
  {
    -[BLTPBBulletin setIcon:](self, "setIcon:");
  }
  if ((*((unsigned char *)v4 + 441) & 4) != 0)
  {
    self->_containsUpdateIcon = *((unsigned char *)v4 + 424);
    *(_DWORD *)&self->_has |= 0x400u;
  }
  if (*((void *)v4 + 28)) {
    -[BLTPBBulletin setHeader:](self, "setHeader:");
  }
  if ((*((unsigned char *)v4 + 440) & 0x80) != 0)
  {
    self->_interruptionLevel = *((_DWORD *)v4 + 60);
    *(_DWORD *)&self->_has |= 0x80u;
  }
  communicationContext = self->_communicationContext;
  uint64_t v34 = *((void *)v4 + 18);
  if (communicationContext)
  {
    if (v34) {
      -[BLTPBCommunicationContext mergeFrom:](communicationContext, "mergeFrom:");
    }
  }
  else if (v34)
  {
    -[BLTPBBulletin setCommunicationContext:](self, "setCommunicationContext:");
  }
  if (*((void *)v4 + 19)) {
    -[BLTPBBulletin setContentType:](self, "setContentType:");
  }
  if (*((void *)v4 + 26)) {
    -[BLTPBBulletin setFilterCriteria:](self, "setFilterCriteria:");
  }
  followActivityAction = self->_followActivityAction;
  uint64_t v36 = *((void *)v4 + 27);
  if (followActivityAction)
  {
    if (v36) {
      -[BLTPBAction mergeFrom:](followActivityAction, "mergeFrom:");
    }
  }
  else if (v36)
  {
    -[BLTPBBulletin setFollowActivityAction:](self, "setFollowActivityAction:");
  }
  if ((*((unsigned char *)v4 + 441) & 0x20) != 0)
  {
    self->_hasSubordinateIcon = *((unsigned char *)v4 + 427);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
  if (*((void *)v4 + 46)) {
    -[BLTPBBulletin setSummary:](self, "setSummary:");
  }
  if (*((void *)v4 + 50)) {
    -[BLTPBBulletin setThreadSummary:](self, "setThreadSummary:");
  }
  if (*((void *)v4 + 14)) {
    -[BLTPBBulletin setAttributedMessage:](self, "setAttributedMessage:");
  }
  if (*((void *)v4 + 24)) {
    -[BLTPBBulletin setEventBehavior:](self, "setEventBehavior:");
  }
  int v37 = *((_DWORD *)v4 + 110);
  if ((v37 & 2) != 0)
  {
    self->_double priorityNotificationStatus = *((double *)v4 + 2);
    *(_DWORD *)&self->_has |= 2u;
    int v37 = *((_DWORD *)v4 + 110);
  }
  if ((v37 & 0x8000) != 0)
  {
    self->_isHighlight = *((unsigned char *)v4 + 430);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
}

- (NSString)bulletinID
{
  return self->_bulletinID;
}

- (void)setBulletinID:(id)a3
{
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (NSString)sectionDisplayName
{
  return self->_sectionDisplayName;
}

- (void)setSectionDisplayName:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)messageTitle
{
  return self->_messageTitle;
}

- (void)setMessageTitle:(id)a3
{
}

- (double)date
{
  return self->_date;
}

- (NSData)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
}

- (NSMutableArray)supplementaryActions
{
  return self->_supplementaryActions;
}

- (void)setSupplementaryActions:(id)a3
{
}

- (unsigned)feed
{
  return self->_feed;
}

- (void)setFeed:(unsigned int)a3
{
  self->_unsigned int feed = a3;
}

- (BLTPBAction)snoozeAction
{
  return self->_snoozeAction;
}

- (void)setSnoozeAction:(id)a3
{
}

- (NSString)recordID
{
  return self->_recordID;
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

- (BLTPBAction)dismissAction
{
  return self->_dismissAction;
}

- (void)setDismissAction:(id)a3
{
}

- (int)sectionSubtype
{
  return self->_sectionSubtype;
}

- (NSString)sockPuppetAppBundleID
{
  return self->_sockPuppetAppBundleID;
}

- (void)setSockPuppetAppBundleID:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (double)publicationDate
{
  return self->_publicationDate;
}

- (BOOL)includesSound
{
  return self->_includesSound;
}

- (void)setIncludesSound:(BOOL)a3
{
  self->_BOOL includesSound = a3;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
}

- (NSData)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)universalSectionID
{
  return self->_universalSectionID;
}

- (void)setUniversalSectionID:(id)a3
{
}

- (NSData)alertSuppressionContexts
{
  return self->_alertSuppressionContexts;
}

- (void)setAlertSuppressionContexts:(id)a3
{
}

- (int)soundAlertType
{
  return self->_soundAlertType;
}

- (NSString)soundAccountIdentifier
{
  return self->_soundAccountIdentifier;
}

- (void)setSoundAccountIdentifier:(id)a3
{
}

- (NSString)soundToneIdentifier
{
  return self->_soundToneIdentifier;
}

- (void)setSoundToneIdentifier:(id)a3
{
}

- (unsigned)attachmentType
{
  return self->_attachmentType;
}

- (BOOL)containsUpdatedAttachment
{
  return self->_containsUpdatedAttachment;
}

- (BOOL)loading
{
  return self->_loading;
}

- (BOOL)turnsOnDisplay
{
  return self->_turnsOnDisplay;
}

- (NSMutableArray)subsectionIDs
{
  return self->_subsectionIDs;
}

- (void)setSubsectionIDs:(id)a3
{
}

- (NSString)dismissalID
{
  return self->_dismissalID;
}

- (void)setDismissalID:(id)a3
{
}

- (NSString)attachmentURL
{
  return self->_attachmentURL;
}

- (void)setAttachmentURL:(id)a3
{
}

- (NSMutableArray)peopleIDs
{
  return self->_peopleIDs;
}

- (void)setPeopleIDs:(id)a3
{
}

- (BOOL)ignoresQuietMode
{
  return self->_ignoresQuietMode;
}

- (NSString)categoryID
{
  return self->_categoryID;
}

- (void)setCategoryID:(id)a3
{
}

- (NSData)contextNulls
{
  return self->_contextNulls;
}

- (void)setContextNulls:(id)a3
{
}

- (NSData)alertSuppressionContextsNulls
{
  return self->_alertSuppressionContextsNulls;
}

- (void)setAlertSuppressionContextsNulls:(id)a3
{
}

- (NSString)threadID
{
  return self->_threadID;
}

- (void)setThreadID:(id)a3
{
}

- (NSString)attachmentID
{
  return self->_attachmentID;
}

- (void)setAttachmentID:(id)a3
{
}

- (NSMutableArray)additionalAttachments
{
  return self->_additionalAttachments;
}

- (void)setAdditionalAttachments:(id)a3
{
}

- (double)requiredExpirationDate
{
  return self->_requiredExpirationDate;
}

- (NSString)replyToken
{
  return self->_replyToken;
}

- (void)setReplyToken:(id)a3
{
}

- (double)soundMaximumDuration
{
  return self->_soundMaximumDuration;
}

- (BOOL)soundShouldRepeat
{
  return self->_soundShouldRepeat;
}

- (BOOL)soundShouldIgnoreRingerSwitch
{
  return self->_soundShouldIgnoreRingerSwitch;
}

- (BOOL)hasCriticalIcon
{
  return self->_hasCriticalIcon;
}

- (double)soundAudioVolume
{
  return self->_soundAudioVolume;
}

- (BOOL)preemptsPresentedAlert
{
  return self->_preemptsPresentedAlert;
}

- (BOOL)suppressDelayForForwardedBulletins
{
  return self->_suppressDelayForForwardedBulletins;
}

- (BLTPBSectionIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (BOOL)containsUpdateIcon
{
  return self->_containsUpdateIcon;
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (unsigned)interruptionLevel
{
  return self->_interruptionLevel;
}

- (BLTPBCommunicationContext)communicationContext
{
  return self->_communicationContext;
}

- (void)setCommunicationContext:(id)a3
{
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (NSString)filterCriteria
{
  return self->_filterCriteria;
}

- (void)setFilterCriteria:(id)a3
{
}

- (BLTPBAction)followActivityAction
{
  return self->_followActivityAction;
}

- (void)setFollowActivityAction:(id)a3
{
}

- (BOOL)hasSubordinateIcon
{
  return self->_hasSubordinateIcon;
}

- (NSData)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (NSData)threadSummary
{
  return self->_threadSummary;
}

- (void)setThreadSummary:(id)a3
{
}

- (NSData)attributedMessage
{
  return self->_attributedMessage;
}

- (void)setAttributedMessage:(id)a3
{
}

- (NSData)eventBehavior
{
  return self->_eventBehavior;
}

- (void)setEventBehavior:(id)a3
{
}

- (double)priorityNotificationStatus
{
  return self->_priorityNotificationStatus;
}

- (BOOL)isHighlight
{
  return self->_isHighlight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalSectionID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_threadSummary, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_supplementaryActions, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_subsectionIDs, 0);
  objc_storeStrong((id *)&self->_soundToneIdentifier, 0);
  objc_storeStrong((id *)&self->_soundAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_sockPuppetAppBundleID, 0);
  objc_storeStrong((id *)&self->_snoozeAction, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_sectionDisplayName, 0);
  objc_storeStrong((id *)&self->_replyToken, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_publisherBulletinID, 0);
  objc_storeStrong((id *)&self->_peopleIDs, 0);
  objc_storeStrong((id *)&self->_messageTitle, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_followActivityAction, 0);
  objc_storeStrong((id *)&self->_filterCriteria, 0);
  objc_storeStrong((id *)&self->_eventBehavior, 0);
  objc_storeStrong((id *)&self->_dismissalID, 0);
  objc_storeStrong((id *)&self->_dismissAction, 0);
  objc_storeStrong((id *)&self->_contextNulls, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_communicationContext, 0);
  objc_storeStrong((id *)&self->_categoryID, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_bulletinID, 0);
  objc_storeStrong((id *)&self->_attributedMessage, 0);
  objc_storeStrong((id *)&self->_attachmentURL, 0);
  objc_storeStrong((id *)&self->_attachmentID, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_alertSuppressionContextsNulls, 0);
  objc_storeStrong((id *)&self->_alertSuppressionContexts, 0);
  objc_storeStrong((id *)&self->_additionalAttachments, 0);
}

+ (id)bulletinWithBBBulletin:(id)a3 sockPuppetAppBundleID:(id)a4 observer:(id)a5 feed:(unint64_t)a6 teamID:(id)a7 universalSectionID:(id)a8 shouldUseExpirationDate:(BOOL)a9 replyToken:(id)a10 gizmoLegacyPublisherBulletinID:(id)a11 gizmoLegacyCategoryID:(id)a12 gizmoSectionID:(id)a13 gizmoSectionSubtype:(id)a14 useUserInfoForContext:(BOOL)a15 removeSubtitleForOlderWatches:(BOOL)a16
{
  uint64_t v282 = *MEMORY[0x263EF8340];
  id v20 = a3;
  id v231 = a4;
  id v221 = a5;
  id v230 = a7;
  id v229 = a8;
  id v222 = a10;
  id v21 = a11;
  id v228 = a12;
  id v22 = a13;
  id v227 = a14;
  uint64_t v23 = +[BLTPBActionFactory sharedInstance];
  double v24 = (void *)MEMORY[0x263EFF980];
  id v25 = [v20 supplementaryActions];
  uint64_t v26 = objc_msgSend(v24, "arrayWithCapacity:", objc_msgSend(v25, "count"));

  long long v268 = 0u;
  long long v269 = 0u;
  long long v266 = 0u;
  long long v267 = 0u;
  uint64_t v27 = [v20 supplementaryActions];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v266 objects:v281 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v267;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v267 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = [v23 actionWithBBAction:*(void *)(*((void *)&v266 + 1) + 8 * i)];
        if (v32) {
          [v26 addObject:v32];
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v266 objects:v281 count:16];
    }
    while (v29);
  }

  uint64_t v33 = [v20 snoozeAction];
  v226 = [v23 actionWithBBAction:v33];

  uint64_t v34 = [v20 dismissAction];
  v225 = [v23 actionWithBBAction:v34];

  uint64_t v35 = objc_alloc_init(BLTPBBulletin);
  uint64_t v36 = [v20 bulletinID];
  int v37 = nilForNSNull(v36);
  [(BLTPBBulletin *)v35 setBulletinID:v37];

  long long v38 = v22;
  if (!v22)
  {
    long long v38 = [v20 sectionID];
  }
  long long v39 = nilForNSNull(v38);
  [(BLTPBBulletin *)v35 setSectionID:v39];

  if (!v22) {
  long long v40 = [v20 sectionDisplayName];
  }
  long long v41 = nilForNSNull(v40);
  [(BLTPBBulletin *)v35 setSectionDisplayName:v41];

  long long v42 = [v20 recordID];
  long long v43 = nilForNSNull(v42);
  [(BLTPBBulletin *)v35 setRecordID:v43];

  long long v44 = v21;
  if (!v21)
  {
    long long v44 = [v20 publisherBulletinID];
  }
  long long v45 = nilForNSNull(v44);
  [(BLTPBBulletin *)v35 setPublisherBulletinID:v45];

  if (!v21) {
  v220 = v21;
  }
  if (v227) {
    uint64_t v46 = [v227 integerValue];
  }
  else {
    uint64_t v46 = [v20 sectionSubtype];
  }
  [(BLTPBBulletin *)v35 setSectionSubtype:v46];
  [(BLTPBBulletin *)v35 setFeed:a6];
  long long v47 = [v20 dismissalID];
  long long v48 = nilForNSNull(v47);
  [(BLTPBBulletin *)v35 setDismissalID:v48];

  if (v228)
  {
    uint64_t v49 = nilForNSNull(v228);
  }
  else
  {
    long long v50 = [v20 categoryID];
    uint64_t v49 = nilForNSNull(v50);
  }
  [(BLTPBBulletin *)v35 setCategoryID:v49];
  if (([MEMORY[0x263F57700] activePairedDeviceSupportsSendingOnlyCategoryID] & 1) == 0) {
    [(BLTPBBulletin *)v35 setCategory:v49];
  }
  v218 = (void *)v49;
  long long v51 = [v20 threadID];
  long long v52 = nilForNSNull(v51);
  [(BLTPBBulletin *)v35 setThreadID:v52];

  if (a9)
  {
    long long v53 = [v20 expirationDate];
    [v53 timeIntervalSince1970];
    -[BLTPBBulletin setRequiredExpirationDate:](v35, "setRequiredExpirationDate:");
  }
  if ([MEMORY[0x263F57700] activePairedDeviceSupportsAddBulletinReplyToken]) {
    [(BLTPBBulletin *)v35 setReplyToken:v222];
  }
  uint64_t v54 = [v20 subsectionIDs];
  uint64_t v55 = [v54 count];

  v219 = v22;
  if (v55)
  {
    uint64_t v56 = (void *)MEMORY[0x263EFF980];
    NSUInteger v57 = [v20 subsectionIDs];
    uint64_t v58 = objc_msgSend(v56, "arrayWithCapacity:", objc_msgSend(v57, "count"));

    long long v264 = 0u;
    long long v265 = 0u;
    long long v262 = 0u;
    long long v263 = 0u;
    uint64_t v59 = [v20 subsectionIDs];
    uint64_t v60 = [v59 countByEnumeratingWithState:&v262 objects:v280 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v263;
      do
      {
        for (uint64_t j = 0; j != v61; ++j)
        {
          if (*(void *)v263 != v62) {
            objc_enumerationMutation(v59);
          }
          [v58 addObject:*(void *)(*((void *)&v262 + 1) + 8 * j)];
        }
        uint64_t v61 = [v59 countByEnumeratingWithState:&v262 objects:v280 count:16];
      }
      while (v61);
    }

    [(BLTPBBulletin *)v35 setSubsectionIDs:v58];
  }
  NSUInteger v64 = [v20 peopleIDs];
  uint64_t v65 = (void *)[v64 mutableCopy];
  [(BLTPBBulletin *)v35 setPeopleIDs:v65];

  uint64_t v66 = [v20 date];

  if (v66)
  {
    NSUInteger v67 = [v20 date];
    [v67 timeIntervalSince1970];
    -[BLTPBBulletin setDate:](v35, "setDate:");
  }
  NSUInteger v68 = [v20 title];
  uint64_t v69 = nilForNSNull(v68);

  uint64_t v70 = [v20 subtitle];
  uint64_t v71 = nilForNSNull(v70);

  if ([MEMORY[0x263F57700] activePairedDeviceSupportsDisplayingSubtitle])
  {
    id v224 = v69;
  }
  else
  {
    if (v69 && v71)
    {
      id v72 = [NSString stringWithFormat:@"%@\n%@", v69, v71];

      id v224 = v72;
      uint64_t v69 = v72;
    }
    else
    {
      if (v69) {
        uint64_t v73 = v69;
      }
      else {
        uint64_t v73 = v71;
      }
      id v224 = v73;
    }

    if (a16)
    {

      uint64_t v71 = 0;
    }
  }
  uint64_t v74 = [v20 summary];
  if (v74)
  {
    NSUInteger v75 = (void *)v74;
    uint64_t v76 = (void *)MEMORY[0x263F08910];
    uint64_t v77 = [v20 summary];
    id v261 = 0;
    NSUInteger v78 = [v76 archivedDataWithRootObject:v77 requiringSecureCoding:1 error:&v261];
    id v79 = v261;
    id v80 = v78;

    if (v79)
    {
      NSUInteger v81 = blt_ids_log();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
        +[BLTPBBulletin(BBBulletin) bulletinWithBBBulletin:sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:].cold.5();
      }
    }
    if (v80)
    {
      [(BLTPBBulletin *)v35 setSummary:v80];
    }
  }
  uint64_t v82 = [v20 threadSummary];
  if (v82)
  {
    NSUInteger v83 = (void *)v82;
    NSUInteger v84 = (void *)MEMORY[0x263F08910];
    uint64_t v85 = [v20 threadSummary];
    id v260 = 0;
    unint64_t v86 = [v84 archivedDataWithRootObject:v85 requiringSecureCoding:1 error:&v260];
    id v87 = v260;
    id v88 = v86;

    if (v87)
    {
      uint64_t v89 = blt_ids_log();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
        +[BLTPBBulletin(BBBulletin) bulletinWithBBBulletin:sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:].cold.4();
      }
    }
    if (v88)
    {
      [(BLTPBBulletin *)v35 setThreadSummary:v88];
    }
  }
  uint64_t v90 = [v20 attributedMessage];
  if (v90)
  {
    uint64_t v91 = (void *)v90;
    uint64_t v92 = (void *)MEMORY[0x263F08910];
    unint64_t v93 = [v20 attributedMessage];
    id v259 = 0;
    NSUInteger v94 = [v92 archivedDataWithRootObject:v93 requiringSecureCoding:1 error:&v259];
    id v95 = v259;
    id v96 = v94;

    if (v95)
    {
      NSUInteger v97 = blt_ids_log();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
        +[BLTPBBulletin(BBBulletin) bulletinWithBBBulletin:sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:]();
      }
    }
    if (v96)
    {
      [(BLTPBBulletin *)v35 setAttributedMessage:v96];
    }
  }
  uint64_t v98 = [v20 eventBehavior];
  if (v98)
  {
    NSUInteger v99 = (void *)v98;
    uint64_t v100 = (void *)MEMORY[0x263F08910];
    v101 = [v20 eventBehavior];
    id v258 = 0;
    uint64_t v102 = [v100 archivedDataWithRootObject:v101 requiringSecureCoding:1 error:&v258];
    id v103 = v258;
    id v104 = v102;

    if (v103)
    {
      v105 = blt_ids_log();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
        +[BLTPBBulletin(BBBulletin) bulletinWithBBBulletin:sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:]();
      }
    }
    if (v104)
    {
      [(BLTPBBulletin *)v35 setEventBehavior:v104];
    }
  }
  $DC19B4E307EAB6FC73F13B70E0C144DC v106 = [v20 header];
  v107 = nilForNSNull(v106);
  [(BLTPBBulletin *)v35 setHeader:v107];

  [(BLTPBBulletin *)v35 setTitle:v224];
  [(BLTPBBulletin *)v35 setSubtitle:v71];
  long long v108 = [v20 message];
  long long v109 = nilForNSNull(v108);
  [(BLTPBBulletin *)v35 setMessageTitle:v109];

  -[BLTPBBulletin setLoading:](v35, "setLoading:", [v20 isLoading]);
  -[BLTPBBulletin setTurnsOnDisplay:](v35, "setTurnsOnDisplay:", [v20 turnsOnDisplay]);
  [(BLTPBBulletin *)v35 setSnoozeAction:v226];
  [(BLTPBBulletin *)v35 setDismissAction:v225];
  [(BLTPBBulletin *)v35 setSupplementaryActions:v26];
  [(BLTPBBulletin *)v35 setSockPuppetAppBundleID:v231];
  if ([v20 suppressDelayForForwardedBulletins]) {
    [(BLTPBBulletin *)v35 setSuppressDelayForForwardedBulletins:1];
  }
  v216 = [v20 publishDate];
  [v216 timeIntervalSince1970];
  -[BLTPBBulletin setPublicationDate:](v35, "setPublicationDate:");
  long long v110 = [v20 sound];
  [(BLTPBBulletin *)v35 setIncludesSound:v110 != 0];
  long long v111 = [v110 alertConfiguration];
  -[BLTPBBulletin setSoundAlertType:](v35, "setSoundAlertType:", [v111 type]);

  long long v112 = [v110 alertConfiguration];
  long long v113 = [v112 topic];
  long long v114 = nilForNSNull(v113);
  [(BLTPBBulletin *)v35 setSoundAccountIdentifier:v114];

  long long v115 = [v110 alertConfiguration];
  long long v116 = [v115 toneIdentifier];
  long long v117 = nilForNSNull(v116);
  [(BLTPBBulletin *)v35 setSoundToneIdentifier:v117];

  long long v118 = objc_msgSend(MEMORY[0x263F57730], "blt_boundedWaitForActivePairedDevice");
  unint64_t v119 = [v118 bltVersion];

  if (v119 >= 6)
  {
    unint64_t v120 = v119;
    long long v121 = [v110 alertConfiguration];
    if ([v121 shouldRepeat]) {
      uint64_t v122 = objc_msgSend(v20, "blt_isVOIPCall") ^ 1;
    }
    else {
      uint64_t v122 = 0;
    }

    [(BLTPBBulletin *)v35 setSoundShouldRepeat:v122];
    long long v123 = [v110 alertConfiguration];
    -[BLTPBBulletin setSoundShouldIgnoreRingerSwitch:](v35, "setSoundShouldIgnoreRingerSwitch:", [v123 shouldIgnoreRingerSwitch]);

    v124 = [v110 alertConfiguration];
    [v124 maximumDuration];
    -[BLTPBBulletin setSoundMaximumDuration:](v35, "setSoundMaximumDuration:");

    unint64_t v119 = v120;
  }
  if ([MEMORY[0x263F57700] activePairedDeviceSupportsCriticalAndGroupingSettings])
  {
    -[BLTPBBulletin setHasCriticalIcon:](v35, "setHasCriticalIcon:", [v20 hasCriticalIcon]);
    v125 = [v110 alertConfiguration];
    [v125 audioVolume];
    [(BLTPBBulletin *)v35 setSoundAudioVolume:v126];
  }
  [(BLTPBBulletin *)v35 setTeamID:v230];
  -[BLTPBBulletin setIgnoresQuietMode:](v35, "setIgnoresQuietMode:", [v20 ignoresQuietMode]);
  -[BLTPBBulletin setPreemptsPresentedAlert:](v35, "setPreemptsPresentedAlert:", [v20 preemptsPresentedAlert]);
  [v20 bltContext];
  v217 = v71;
  v232 = v215 = v110;
  if (v232 && v119 <= 7)
  {
    v127 = (void *)[v232 mutableCopy];
    [v127 removeObjectForKey:@"userInfo"];
    if (v119 == 7)
    {
      [MEMORY[0x263F1DF08] notificationForBulletin:v20];
      long long v254 = 0u;
      long long v255 = 0u;
      long long v256 = 0u;
      v211 = long long v257 = 0u;
      uint64_t v128 = [v211 request];
      v129 = [v128 content];
      v130 = [v129 attachments];

      uint64_t v131 = [v130 countByEnumeratingWithState:&v254 objects:v279 count:16];
      if (v131)
      {
        uint64_t v132 = v131;
        uint64_t v133 = *(void *)v255;
        do
        {
          for (uint64_t k = 0; k != v132; ++k)
          {
            if (*(void *)v255 != v133) {
              objc_enumerationMutation(v130);
            }
            objc_msgSend(*(id *)(*((void *)&v254 + 1) + 8 * k), "blt_preEncodeShouldAddNotificationAttachmentOptions");
          }
          uint64_t v132 = [v130 countByEnumeratingWithState:&v254 objects:v279 count:16];
        }
        while (v132);
      }

      v135 = objc_msgSend(v211, "bs_secureEncoded");
      long long v250 = 0u;
      long long v251 = 0u;
      long long v252 = 0u;
      long long v253 = 0u;
      v136 = [v211 request];
      v137 = [v136 content];
      v138 = [v137 attachments];

      uint64_t v139 = [v138 countByEnumeratingWithState:&v250 objects:v278 count:16];
      if (v139)
      {
        uint64_t v140 = v139;
        uint64_t v141 = *(void *)v251;
        do
        {
          for (uint64_t m = 0; m != v140; ++m)
          {
            if (*(void *)v251 != v141) {
              objc_enumerationMutation(v138);
            }
            objc_msgSend(*(id *)(*((void *)&v250 + 1) + 8 * m), "blt_postEncodeNotificationAttachmentOptions");
          }
          uint64_t v140 = [v138 countByEnumeratingWithState:&v250 objects:v278 count:16];
        }
        while (v140);
      }

      unint64_t v119 = 7;
      if (v211 && v135) {
        goto LABEL_111;
      }
      v143 = blt_ids_log();
      if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v273 = v20;
        __int16 v274 = 2112;
        uint64_t v275 = (uint64_t)v211;
        __int16 v276 = 2112;
        id v277 = v135;
        _os_log_error_impl(&dword_222F4C000, v143, OS_LOG_TYPE_ERROR, "Error getting a plist serialazable UNNotification from BBBulletin,  bulletin=%@ UNNotification=%@  plistSeriazableData=%@", buf, 0x20u);
      }

      if (v135) {
LABEL_111:
      }
        [v127 setObject:v135 forKeyedSubscript:@"UNBulletinContextArchivedUserNotification"];
    }
    id v144 = v127;

    if (a15
      || ![MEMORY[0x263F57700] activePairedDeviceSupportsUserNotificationListDestination]
      || (v232 = v144,
          ([MEMORY[0x263F57700] activePairedDeviceSupportsNoLocalRemoteNotificationInBulletinContext] & 1) == 0))
    {
      if (v144
        && ([MEMORY[0x263F1DF08] notificationForBulletin:v20],
            v145 = (id)objc_claimAutoreleasedReturnValue(),
            v145,
            v145))
      {
        if (a15)
        {
          id v146 = [v145 request];
          [v146 content];
          v148 = unint64_t v147 = v119;
          v232 = [v148 userInfo];

          unint64_t v119 = v147;
        }
        else
        {
          v149 = (void *)[v144 mutableCopy];
          unint64_t v210 = v119;
          if (([MEMORY[0x263F57700] activePairedDeviceSupportsUserNotificationListDestination] & 1) == 0)
          {
            v150 = [v145 request];
            v151 = [v150 content];

            if (v151)
            {
              v233 = v149;
              v152 = [v145 request];
              uint64_t v153 = [v152 destinations] & 6;

              v154 = blt_ids_log();
              if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v273) = v153 != 0;
                _os_log_impl(&dword_222F4C000, v154, OS_LOG_TYPE_DEFAULT, "Adding back shouldAddToNotificationsList: %{BOOL}u", buf, 8u);
              }
              uint64_t v212 = v153;

              long long v248 = 0u;
              long long v249 = 0u;
              long long v246 = 0u;
              long long v247 = 0u;
              v213 = v151;
              v155 = [v151 attachments];
              uint64_t v156 = [v155 countByEnumeratingWithState:&v246 objects:v271 count:16];
              if (v156)
              {
                uint64_t v157 = v156;
                uint64_t v158 = *(void *)v247;
                do
                {
                  for (uint64_t n = 0; n != v157; ++n)
                  {
                    if (*(void *)v247 != v158) {
                      objc_enumerationMutation(v155);
                    }
                    objc_msgSend(*(id *)(*((void *)&v246 + 1) + 8 * n), "blt_preEncodeShouldAddNotificationAttachmentOptions");
                  }
                  uint64_t v157 = [v155 countByEnumeratingWithState:&v246 objects:v271 count:16];
                }
                while (v157);
              }

              v151 = v213;
              objc_msgSend(v213, "blt_preEncodeShouldAddToNotificationsList:", v212 != 0);
              v160 = [v145 bs_secureEncoded];
              [v233 setObject:v160 forKeyedSubscript:@"UNBulletinContextArchivedUserNotification"];

              objc_msgSend(v213, "blt_postEncode");
              long long v244 = 0u;
              long long v245 = 0u;
              long long v242 = 0u;
              long long v243 = 0u;
              v161 = [v213 attachments];
              uint64_t v162 = [v161 countByEnumeratingWithState:&v242 objects:v270 count:16];
              if (v162)
              {
                uint64_t v163 = v162;
                uint64_t v164 = *(void *)v243;
                do
                {
                  for (iuint64_t i = 0; ii != v163; ++ii)
                  {
                    if (*(void *)v243 != v164) {
                      objc_enumerationMutation(v161);
                    }
                    objc_msgSend(*(id *)(*((void *)&v242 + 1) + 8 * ii), "blt_postEncodeNotificationAttachmentOptions");
                  }
                  uint64_t v163 = [v161 countByEnumeratingWithState:&v242 objects:v270 count:16];
                }
                while (v163);
                v149 = v233;
                v151 = v213;
              }
              else
              {
                v149 = v233;
              }
            }
            else
            {
              v161 = blt_ids_log();
              if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR)) {
                +[BLTPBBulletin(BBBulletin) bulletinWithBBBulletin:sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:]((uint64_t)v145, v161);
              }
            }

            unint64_t v119 = v210;
          }
          if (([MEMORY[0x263F57700] activePairedDeviceSupportsNoLocalRemoteNotificationInBulletinContext] & 1) == 0)
          {
            v234 = v149;
            v166 = [v145 request];
            v167 = [v166 trigger];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            v169 = blt_ids_log();
            BOOL v170 = os_log_type_enabled(v169, OS_LOG_TYPE_INFO);
            if (isKindOfClass)
            {
              if (v170)
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_222F4C000, v169, OS_LOG_TYPE_INFO, "Adding back remoteNotification to bulletin context for paired watch", buf, 2u);
              }

              v171 = [v145 request];
              v172 = [v171 content];
              v173 = [v172 userInfo];
              v149 = v234;
              [v234 setObject:v173 forKey:@"remoteNotification"];
            }
            else
            {
              if (v170)
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_222F4C000, v169, OS_LOG_TYPE_INFO, "Adding back localNotification to bulletin context for paired watch", buf, 2u);
              }

              v171 = (*(void (**)(void))(*MEMORY[0x263F1D848] + 16))();
              v172 = [MEMORY[0x263F08910] archivedDataWithRootObject:v171 requiringSecureCoding:1 error:0];
              v149 = v234;
              [v234 setObject:v172 forKey:@"localNotification"];
            }

            unint64_t v119 = v210;
          }
          id v146 = v149;

          v232 = v146;
        }
      }
      else
      {
        v145 = blt_ids_log();
        if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_222F4C000, v145, OS_LOG_TYPE_DEFAULT, "Changes to bulletin context were requested but context does not contain a valid UNNotification. No changes will be made to bulletin context.", buf, 2u);
        }
        v232 = v144;
      }
    }
  }
  if (v119 > 7)
  {
    uint64_t v239 = 0;
    v177 = (id *)&v239;
    uint64_t v178 = [MEMORY[0x263F08910] archivedDataWithRootObject:v232 requiringSecureCoding:1 error:&v239];
  }
  else
  {
    int v174 = [MEMORY[0x263F57700] activePairedDeviceSupportsNSNullPListExtenion];
    int v175 = v174;
    if (v174) {
      v176 = &v241;
    }
    else {
      v176 = 0;
    }
    if (v174) {
      id v241 = 0;
    }
    uint64_t v240 = 0;
    v177 = (id *)&v240;
    uint64_t v178 = +[BLTObjectSerializer serializeObject:v232 nulls:v176 error:&v240];
    if (v175)
    {
      id v179 = v241;
      v177 = (id *)&v240;
      goto LABEL_169;
    }
  }
  id v179 = 0;
LABEL_169:
  id v180 = *v177;
  v214 = (void *)v178;
  if (v180)
  {
    v181 = blt_ids_log();
    if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v273 = v180;
      __int16 v274 = 2112;
      uint64_t v275 = v178;
      __int16 v276 = 2112;
      id v277 = v20;
      _os_log_error_impl(&dword_222F4C000, v181, OS_LOG_TYPE_ERROR, "Error serializing bulletin context: %@, %@, %@", buf, 0x20u);
    }
  }
  else
  {
    [(BLTPBBulletin *)v35 setContext:v178];
    [(BLTPBBulletin *)v35 setContextNulls:v179];
  }
  v182 = (void *)MEMORY[0x263EFF980];
  v183 = [v20 alertSuppressionContexts];
  v184 = objc_msgSend(v182, "arrayWithCapacity:", objc_msgSend(v183, "count"));

  v185 = [v20 alertSuppressionContexts];
  v237[0] = MEMORY[0x263EF8330];
  v237[1] = 3221225472;
  v237[2] = __289__BLTPBBulletin_BBBulletin__bulletinWithBBBulletin_sockPuppetAppBundleID_observer_feed_teamID_universalSectionID_shouldUseExpirationDate_replyToken_gizmoLegacyPublisherBulletinID_gizmoLegacyCategoryID_gizmoSectionID_gizmoSectionSubtype_useUserInfoForContext_removeSubtitleForOlderWatches___block_invoke;
  v237[3] = &unk_264685620;
  id v186 = v184;
  id v238 = v186;
  [v185 enumerateObjectsUsingBlock:v237];

  int v187 = [MEMORY[0x263F57700] activePairedDeviceSupportsNSNullPListExtenion];
  int v188 = v187;
  if (v187) {
    v189 = &v236;
  }
  else {
    v189 = 0;
  }
  if (v187) {
    id v236 = 0;
  }
  id v235 = v180;
  v190 = +[BLTObjectSerializer serializeObject:v186 nulls:v189 error:&v235];
  if (v188) {
    id v191 = v236;
  }
  else {
    id v191 = 0;
  }
  id v192 = v235;

  if (v192)
  {
    v193 = blt_ids_log();
    if (os_log_type_enabled(v193, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v273 = v192;
      __int16 v274 = 2112;
      uint64_t v275 = (uint64_t)v190;
      __int16 v276 = 2112;
      id v277 = v20;
      _os_log_error_impl(&dword_222F4C000, v193, OS_LOG_TYPE_ERROR, "Error serializing alert suppression contexts: %@, %@, %@", buf, 0x20u);
    }
  }
  else
  {
    [(BLTPBBulletin *)v35 setAlertSuppressionContexts:v190];
    [(BLTPBBulletin *)v35 setAlertSuppressionContextsNulls:v191];
  }
  v194 = [(BLTPBBulletin *)v35 sectionDisplayName];

  if (!v194)
  {
    v195 = (void *)MEMORY[0x263F01888];
    v196 = [(BLTPBBulletin *)v35 sectionID];
    v197 = [v195 bundleProxyForIdentifier:v196];

    if (v197)
    {
      v198 = [v197 localizedName];
      [(BLTPBBulletin *)v35 setSectionDisplayName:v198];
    }
  }
  [(BLTPBBulletin *)v35 setUniversalSectionID:v229];
  if ([MEMORY[0x263F57700] activePairedDeviceSupportsIconsPerNotification])
  {
    v199 = [v20 icon];
    v200 = BLTPBSectionIconFromBBSectionIcon(v199, 0);
    [(BLTPBBulletin *)v35 setIcon:v200];
  }
  v201 = [v20 contentType];
  [(BLTPBBulletin *)v35 setContentType:v201];

  -[BLTPBBulletin setInterruptionLevel:](v35, "setInterruptionLevel:", [v20 interruptionLevel]);
  v202 = [v20 communicationContext];
  v203 = objc_msgSend(v202, "blt_protobuf");
  [(BLTPBBulletin *)v35 setCommunicationContext:v203];

  v204 = [v20 filterCriteria];
  [(BLTPBBulletin *)v35 setFilterCriteria:v204];

  v205 = [v20 followActivityAction];

  if (v205)
  {
    v206 = [v20 followActivityAction];
    v207 = [v23 actionWithBBAction:v206];
    [(BLTPBBulletin *)v35 setFollowActivityAction:v207];
  }
  -[BLTPBBulletin setHasSubordinateIcon:](v35, "setHasSubordinateIcon:", [v20 hasSubordinateIcon]);
  -[BLTPBBulletin setPriorityNotificationStatus:](v35, "setPriorityNotificationStatus:", (double)(unint64_t)[v20 priorityNotificationStatus]);
  -[BLTPBBulletin setIsHighlight:](v35, "setIsHighlight:", [v20 isHighlight]);
  v208 = v35;

  return v208;
}

uint64_t __289__BLTPBBulletin_BBBulletin__bulletinWithBBBulletin_sockPuppetAppBundleID_observer_feed_teamID_universalSectionID_shouldUseExpirationDate_replyToken_gizmoLegacyPublisherBulletinID_gizmoLegacyCategoryID_gizmoSectionID_gizmoSectionSubtype_useUserInfoForContext_removeSubtitleForOlderWatches___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (void)bulletinWithBBBulletin:(id)a3 sockPuppetAppBundleID:(id)a4 observer:(id)a5 feed:(unint64_t)a6 teamID:(id)a7 universalSectionID:(id)a8 shouldUseExpirationDate:(BOOL)a9 replyToken:(id)a10 gizmoLegacyPublisherBulletinID:(id)a11 gizmoLegacyCategoryID:(id)a12 gizmoSectionID:(id)a13 gizmoSectionSubtype:(id)a14 useUserInfoForContext:(BOOL)a15 removeSubtitleForOlderWatches:(BOOL)a16 attachOption:(unint64_t)a17 completion:(id)a18
{
  id v23 = a18;
  id v24 = a5;
  id v25 = a3;
  LOWORD(v29) = __PAIR16__(a16, a15);
  LOBYTE(v28) = a9;
  uint64_t v26 = objc_msgSend(a1, "bulletinWithBBBulletin:sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:", v25, a4, v24, a6, a7, a8, v28, a10, a11, a12, a13, a14, v29);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __313__BLTPBBulletin_BBBulletin__bulletinWithBBBulletin_sockPuppetAppBundleID_observer_feed_teamID_universalSectionID_shouldUseExpirationDate_replyToken_gizmoLegacyPublisherBulletinID_gizmoLegacyCategoryID_gizmoSectionID_gizmoSectionSubtype_useUserInfoForContext_removeSubtitleForOlderWatches_attachOption_completion___block_invoke;
  v32[3] = &unk_264685648;
  id v33 = v23;
  id v27 = v23;
  [a1 _addAttachmentsFromBBBulletin:v25 toBLTPBBulletin:v26 observer:v24 attachOption:a17 completion:v32];
}

uint64_t __313__BLTPBBulletin_BBBulletin__bulletinWithBBBulletin_sockPuppetAppBundleID_observer_feed_teamID_universalSectionID_shouldUseExpirationDate_replyToken_gizmoLegacyPublisherBulletinID_gizmoLegacyCategoryID_gizmoSectionID_gizmoSectionSubtype_useUserInfoForContext_removeSubtitleForOlderWatches_attachOption_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)publisherMatchID
{
  unint64_t v3 = [(BLTPBBulletin *)self publisherBulletinID];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(BLTPBBulletin *)self recordID];
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)attachmentKey:(id)a3
{
  id v4 = a3;
  id v5 = NSString;
  uint64_t v6 = [(BLTPBBulletin *)self sectionID];
  uint64_t v7 = [(BLTPBBulletin *)self publisherMatchID];
  uint64_t v8 = (void *)v7;
  if (v4) {
    [v5 stringWithFormat:@"%@--%@--%@", v6, v7, v4];
  }
  else {
  uint64_t v9 = [v5 stringWithFormat:@"%@--%@", v6, v7, v11];
  }

  return v9;
}

- (id)attachmentURLURL
{
  unint64_t v3 = [(BLTPBBulletin *)self attachmentURL];
  if (v3)
  {
    id v4 = NSURL;
    id v5 = [(BLTPBBulletin *)self attachmentURL];
    uint64_t v6 = [v4 URLWithString:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (void)_attachmentFromBBAttachmentMetadata:(id)a3 bulletin:(id)a4 observer:(id)a5 fileOption:(unint64_t)a6 attachOption:(unint64_t)a7 completion:(id)a8
{
  uint64_t v117 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if (!v17) {
    +[BLTPBBulletin(BBBulletin) _attachmentFromBBAttachmentMetadata:bulletin:observer:fileOption:attachOption:completion:]();
  }
  uint64_t v18 = v17;
  uint64_t v19 = [v14 type];
  BOOL v20 = a7 == 1;
  v107[0] = MEMORY[0x263EF8330];
  v107[1] = 3221225472;
  v107[2] = __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke;
  v107[3] = &unk_264685670;
  uint64_t v111 = v19;
  id v21 = v14;
  id v108 = v21;
  BOOL v113 = a7 == 2;
  id v22 = v15;
  id v109 = v22;
  id v23 = v18;
  id v110 = v23;
  unint64_t v112 = a6;
  id v24 = (void (**)(void, void))MEMORY[0x223CAC810](v107);
  if (a7 == 2) {
    goto LABEL_39;
  }
  if (v19 == 1)
  {
    id v25 = blt_ids_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v22;
      _os_log_impl(&dword_222F4C000, v25, OS_LOG_TYPE_INFO, "%@ Image attachment processing", buf, 0xCu);
    }

    if (!a6) {
      goto LABEL_39;
    }
    uint64_t v26 = [v21 URL];
    if (!v26) {
      goto LABEL_39;
    }
    id v27 = (id)v26;
    uint64_t v28 = [v21 URL];
    uint64_t v29 = [MEMORY[0x263EFF9D0] null];
    if (v28 == v29)
    {
    }
    else
    {
      uint64_t v30 = (void *)v29;
      [v21 URL];
      uint64_t v31 = v87 = v16;
      [v31 path];
      uint64_t v85 = v27;
      BOOL v32 = v20;
      id v33 = a1;
      v35 = uint64_t v34 = v28;

      id v16 = v87;
      id v36 = v33;
      BOOL v37 = v32;

      if (!v35)
      {
LABEL_39:
        v24[2](v24, 0);
        goto LABEL_40;
      }
      objc_msgSend(MEMORY[0x263F57730], "blt_boundedWaitForActivePairedDevice");
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      long long v38 = NSURL;
      long long v39 = [v21 URL];
      long long v40 = [v39 path];
      uint64_t v41 = [v38 fileURLWithPath:v40];

      long long v42 = BLTFileURLInAttachmentsPath(v22, v21);
      unint64_t v86 = v41;
      long long v43 = +[BLTImageAttachmentInfo imageAttachmentInfoForImageURL:v41];
      long long v44 = v43;
      if (!v43
        || ([v43 contentType], long long v45 = objc_claimAutoreleasedReturnValue(), v45, !v45))
      {
        uint64_t v77 = blt_ids_log();
        NSUInteger v64 = v86;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
          +[BLTPBBulletin(BBBulletin) _attachmentFromBBAttachmentMetadata:bulletin:observer:fileOption:attachOption:completion:]();
        }

        (*((void (**)(id, void, void))v23 + 2))(v23, 0, 0);
        goto LABEL_44;
      }
      NSUInteger v84 = v42;
      uint64_t v46 = blt_ids_log();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        long long v47 = [v22 publisherBulletinID];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v47;
        __int16 v115 = 2112;
        long long v116 = v86;
        _os_log_impl(&dword_222F4C000, v46, OS_LOG_TYPE_INFO, "%@ Image attachment processing: %@", buf, 0x16u);
      }
      if (v27 && v84)
      {
        long long v48 = [v27 valueForProperty:*MEMORY[0x263F57638]];
        [v48 floatValue];
        double v50 = v49;

        long long v51 = [v27 valueForProperty:*MEMORY[0x263F57640]];
        [v51 CGSizeValue];
        double v53 = v52;
        double v55 = v54;

        double v56 = v53 / v50;
        double v57 = v55 / v50;
        [v44 size];
        if (v58 <= 0.0
          || ([v44 size], v56 <= v59)
          || ([v44 size], v60 <= 0.0)
          || ([v44 size], v57 <= v61))
        {
          NSUInteger v83 = v44;
          NSUInteger v78 = blt_ids_log();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
          {
            id v79 = [v22 publisherBulletinID];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v79;
            __int16 v115 = 2112;
            long long v116 = v86;
            _os_log_impl(&dword_222F4C000, v78, OS_LOG_TYPE_INFO, "%@ Image attachment will be sent scaled: %@", buf, 0x16u);
          }
          uint64_t v82 = objc_msgSend(objc_alloc(MEMORY[0x263F160C8]), "initWithFileAtURL:size:scale:representationTypes:", v86, 4, v56, v57, v50);
          [v82 setMinimumDimension:50.0];
          id v80 = [MEMORY[0x263F160D0] sharedGenerator];
          NSUInteger v81 = [v83 contentType];
          v93[0] = MEMORY[0x263EF8330];
          v93[1] = 3221225472;
          v93[2] = __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_97;
          v93[3] = &unk_2646856E8;
          id v98 = v36;
          id v94 = v21;
          long long v42 = v84;
          id v95 = v84;
          BOOL v99 = v37;
          id v96 = v83;
          NSUInteger v97 = v24;
          [v80 saveBestRepresentationForRequest:v82 toFileAtURL:v95 withContentType:v81 completionHandler:v93];

          NSUInteger v64 = v86;
          long long v44 = v83;
        }
        else
        {
          uint64_t v62 = blt_ids_log();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            uint64_t v63 = [v22 publisherBulletinID];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v63;
            __int16 v115 = 2112;
            long long v116 = v86;
            _os_log_impl(&dword_222F4C000, v62, OS_LOG_TYPE_INFO, "%@ Image attachment will be sent without scaling: %@", buf, 0x16u);
          }
          v100[0] = MEMORY[0x263EF8330];
          v100[1] = 3221225472;
          v100[2] = __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_94;
          v100[3] = &unk_264685698;
          id v105 = v36;
          id v101 = v21;
          NSUInteger v64 = v86;
          uint64_t v102 = v86;
          BOOL v106 = v37;
          id v103 = v44;
          id v104 = v24;
          BLTDispatchWorkQueue(v100);

          long long v42 = v84;
        }
LABEL_44:

        id v16 = v87;
        goto LABEL_40;
      }

      uint64_t v28 = v86;
      id v16 = v87;
    }
    goto LABEL_37;
  }
  uint64_t v65 = [v21 URL];
  id v27 = v65;
  if ((v19 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
LABEL_38:

    goto LABEL_39;
  }

  uint64_t v66 = [v21 URL];
  if (!v27)
  {
    id v27 = v66;
    goto LABEL_38;
  }
  id v88 = v16;
  NSUInteger v67 = (void *)MEMORY[0x263F08850];
  id v27 = v66;
  NSUInteger v68 = [v67 defaultManager];
  uint64_t v69 = [v27 absoluteURL];

  uint64_t v70 = [v69 path];
  *(void *)buf = 0;
  uint64_t v71 = [v68 attributesOfItemAtPath:v70 error:buf];
  unint64_t v72 = [v71 fileSize];

  if (v72 <= 0x100000)
  {
    id v16 = v88;
    goto LABEL_38;
  }
  uint64_t v73 = BLTFileURLInAttachmentsPath(v22, v21);
  id v16 = v88;
  if (!v73)
  {
    uint64_t v28 = blt_general_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      +[BLTPBBulletin(BBBulletin) _attachmentFromBBAttachmentMetadata:bulletin:observer:fileOption:attachOption:completion:]((uint64_t)v22, v28);
    }
LABEL_37:

    goto LABEL_38;
  }
  uint64_t v74 = v73;
  v89[0] = MEMORY[0x263EF8330];
  v89[1] = 3221225472;
  v89[2] = __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_100;
  v89[3] = &unk_264685710;
  id v90 = v27;
  id v91 = v73;
  uint64_t v92 = v24;
  id v75 = v74;
  id v76 = v27;
  +[BLTAVUtil transcodeURL:v76 outURL:v75 maxBytes:0x100000 completion:v89];

LABEL_40:
}

void __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 56);
  if ((unint64_t)(v4 - 1) <= 2)
  {
    id v5 = "Video";
    if (v4 == 3) {
      id v5 = "Sound";
    }
    if (v4 == 1) {
      uint64_t v6 = "Image";
    }
    else {
      uint64_t v6 = v5;
    }
    uint64_t v7 = blt_ids_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v35 = 136315138;
      id v36 = v6;
      _os_log_impl(&dword_222F4C000, v7, OS_LOG_TYPE_INFO, "%s attachment will be sent with bulletin", (uint8_t *)&v35, 0xCu);
    }

    uint64_t v8 = objc_alloc_init(BLTPBBulletinAttachment);
    uint64_t v9 = [*(id *)(a1 + 32) UUID];
    double v10 = [v9 UUIDString];
    [(BLTPBBulletinAttachment *)v8 setIdentifier:v10];

    [(BLTPBBulletinAttachment *)v8 setType:*(unsigned int *)(a1 + 56)];
    if (!*(unsigned char *)(a1 + 72))
    {
      uint64_t v11 = [*(id *)(a1 + 32) URL];
      if (v11)
      {
        double v12 = (void *)v11;
        uint64_t v13 = [*(id *)(a1 + 32) URL];
        id v14 = [MEMORY[0x263EFF9D0] null];

        if (v13 != v14)
        {
          id v15 = blt_ids_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            int v35 = 136315138;
            id v36 = v6;
            _os_log_impl(&dword_222F4C000, v15, OS_LOG_TYPE_INFO, "%s retrieved url", (uint8_t *)&v35, 0xCu);
          }

          id v16 = BLTTranscodedFileURLForBulletin(*(void **)(a1 + 40), *(void **)(a1 + 32));
          id v17 = v16;
          if (v16)
          {
            uint64_t v18 = [v16 absoluteString];
            [(BLTPBBulletinAttachment *)v8 setURL:v18];
          }
          else
          {
            uint64_t v18 = [*(id *)(a1 + 32) URL];
            id v21 = [v18 absoluteString];
            [(BLTPBBulletinAttachment *)v8 setURL:v21];
          }
        }
      }
      if (!*(unsigned char *)(a1 + 72))
      {
        uint64_t v23 = *(void *)(a1 + 64);
        if (v23 != 2)
        {
          if (v23 != 1
            || ([(BLTPBBulletinAttachment *)v8 uRL],
                id v24 = objc_claimAutoreleasedReturnValue(),
                v24,
                !v24))
          {
            uint64_t v25 = *(void *)(a1 + 56);
            if (v25 == 3)
            {
              uint64_t v26 = blt_ids_log();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                int v35 = 136315138;
                id v36 = v6;
                _os_log_impl(&dword_222F4C000, v26, OS_LOG_TYPE_INFO, "%s retrieving data", (uint8_t *)&v35, 0xCu);
              }

              uint64_t v27 = [*(id *)(a1 + 32) URL];
              if (v27)
              {
                uint64_t v28 = (void *)v27;
                uint64_t v29 = [*(id *)(a1 + 32) URL];
                uint64_t v30 = [MEMORY[0x263EFF9D0] null];

                if (v29 != v30)
                {
                  uint64_t v31 = (void *)MEMORY[0x263EFF8F8];
                  BOOL v32 = [*(id *)(a1 + 32) URL];
                  id v33 = [v31 dataWithContentsOfURL:v32];

                  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
                }
              }
              goto LABEL_24;
            }
            if (v25 == 1)
            {
              id v22 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
              goto LABEL_23;
            }
            if (!v8)
            {
              uint64_t v34 = blt_ids_log();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
                __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_cold_1((uint64_t)v6, v34);
              }
            }
          }
        }
      }
    }
    id v22 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_23:
    v22();
LABEL_24:

    goto LABEL_25;
  }
  uint64_t v19 = blt_ids_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    BOOL v20 = *(const char **)(a1 + 56);
    int v35 = 134217984;
    id v36 = v20;
    _os_log_impl(&dword_222F4C000, v19, OS_LOG_TYPE_INFO, "Attachment data will be ignored for attachment type %ld", (uint8_t *)&v35, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_25:
}

void __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_94(uint64_t a1)
{
  v2 = *(void **)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v6 = [*(id *)(a1 + 48) contentType];
  id v7 = [v2 _handleThumbnailResponse:0 attachmentMetadata:v3 transcodedAttachmentSaveURL:v4 wantsData:v5 imageContentType:v6];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_97(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_2;
  v5[3] = &unk_2646856C0;
  uint64_t v11 = *(void *)(a1 + 64);
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  char v12 = *(unsigned char *)(a1 + 72);
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v4 = v3;
  BLTDispatchWorkQueue(v5);
}

void __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = [*(id *)(a1 + 56) contentType];
  id v8 = [v2 _handleThumbnailResponse:v3 attachmentMetadata:v4 transcodedAttachmentSaveURL:v6 wantsData:v5 imageContentType:v7];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_100(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = blt_general_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_100_cold_1(a1, (uint64_t)v3, v4);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (id)_handleThumbnailResponse:(id)a3 attachmentMetadata:(id)a4 transcodedAttachmentSaveURL:(id)a5 wantsData:(BOOL)a6 imageContentType:(id)a7
{
  BOOL v8 = a6;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = (UIImage *)a5;
  id v14 = a7;
  if (v11)
  {
    id v15 = blt_general_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[BLTPBBulletin(BBBulletin) _handleThumbnailResponse:attachmentMetadata:transcodedAttachmentSaveURL:wantsData:imageContentType:]((uint64_t)v11, v12);
    }
    id v16 = 0;
  }
  else
  {
    id v17 = blt_ids_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      uint64_t v26 = v13;
      _os_log_impl(&dword_222F4C000, v17, OS_LOG_TYPE_INFO, "_handleThumbnailResponse: Image attachment generated and saved to file URL %@", (uint8_t *)&v25, 0xCu);
    }

    if (!v8)
    {
      id v16 = 0;
      goto LABEL_18;
    }
    id v15 = [(UIImage *)v13 path];
    uint64_t v18 = [MEMORY[0x263F1C6B0] imageWithContentsOfFile:v15];
    uint64_t v19 = [(id)*MEMORY[0x263F1DC08] identifier];
    int v20 = [v14 isEqualToString:v19];

    id v21 = blt_ids_log();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
    if (v20)
    {
      if (v22)
      {
        int v25 = 138412802;
        uint64_t v26 = v18;
        __int16 v27 = 2112;
        uint64_t v28 = v15;
        __int16 v29 = 2112;
        id v30 = v14;
        _os_log_impl(&dword_222F4C000, v21, OS_LOG_TYPE_INFO, "_handleThumbnailResponse: PNG is being added manually, backwards compatibility for older watches image: %@ filepath: %@ imageContentType: %@", (uint8_t *)&v25, 0x20u);
      }

      uint64_t v23 = UIImagePNGRepresentation(v18);
    }
    else
    {
      if (v22)
      {
        int v25 = 138412802;
        uint64_t v26 = v18;
        __int16 v27 = 2112;
        uint64_t v28 = v15;
        __int16 v29 = 2112;
        id v30 = v14;
        _os_log_impl(&dword_222F4C000, v21, OS_LOG_TYPE_INFO, "_handleThumbnailResponse: JPEG attachment is being added manually, backwards compatibility for older watches image: %@ filepath: %@ imageContentType: %@", (uint8_t *)&v25, 0x20u);
      }

      uint64_t v23 = UIImageJPEGRepresentation(v18, 0.899999976);
    }
    id v16 = (void *)v23;
  }
LABEL_18:

  return v16;
}

+ (void)_addAttachmentsFromBBBulletin:(id)a3 toBLTPBBulletin:(id)a4 observer:(id)a5 attachOption:(unint64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  unsigned int v16 = [MEMORY[0x263F57700] activePairedDeviceSupportsMultipleAttachments];
  id v17 = [v12 primaryAttachment];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __108__BLTPBBulletin_BBBulletin___addAttachmentsFromBBBulletin_toBLTPBBulletin_observer_attachOption_completion___block_invoke;
  v22[3] = &unk_264685760;
  BOOL v29 = a6 == 1;
  char v30 = v16;
  id v23 = v13;
  id v24 = v12;
  id v27 = a1;
  unint64_t v28 = a6;
  id v25 = v14;
  id v26 = v15;
  id v18 = v15;
  id v19 = v14;
  id v20 = v12;
  id v21 = v13;
  [a1 _attachmentFromBBAttachmentMetadata:v17 bulletin:v20 observer:v19 fileOption:v16 attachOption:a6 completion:v22];
}

void __108__BLTPBBulletin_BBBulletin___addAttachmentsFromBBBulletin_toBLTPBBulletin_observer_attachOption_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  BOOL v8 = [v5 identifier];
  [v7 setAttachmentID:v8];

  objc_msgSend(*(id *)(a1 + 32), "setAttachmentType:", objc_msgSend(v5, "type"));
  if (*(unsigned char *)(a1 + 80))
  {
    if (!v6)
    {
      id v6 = [v5 uRL];

      if (v6)
      {
        id v9 = (void *)MEMORY[0x263EFF8F8];
        id v10 = NSURL;
        id v11 = [v5 uRL];
        id v12 = [v10 URLWithString:v11];
        id v6 = [v9 dataWithContentsOfURL:v12];
      }
    }
    goto LABEL_9;
  }
  if (*(unsigned char *)(a1 + 81))
  {
    id v13 = [v5 uRL];
    if (v13)
    {

LABEL_10:
      id v14 = *(void **)(a1 + 32);
      id v15 = [v5 uRL];
      [v14 setAttachmentURL:v15];

      goto LABEL_11;
    }
  }
  if (!v6) {
    goto LABEL_10;
  }
LABEL_9:
  [*(id *)(a1 + 32) setAttachment:v6];
LABEL_11:
  if (*(unsigned char *)(a1 + 81)
    && ([*(id *)(a1 + 40) additionalAttachments],
        unsigned int v16 = objc_claimAutoreleasedReturnValue(),
        uint64_t v17 = [v16 count],
        v16,
        v17))
  {
    id v28 = v6;
    id v29 = v5;
    id v18 = dispatch_group_create();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    obuint64_t j = [*(id *)(a1 + 40) additionalAttachments];
    uint64_t v19 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v31 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v39 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          dispatch_group_enter(v18);
          uint64_t v23 = *(void *)(a1 + 40);
          uint64_t v24 = *(void *)(a1 + 48);
          id v26 = *(void **)(a1 + 64);
          uint64_t v25 = *(void *)(a1 + 72);
          v35[0] = MEMORY[0x263EF8330];
          v35[1] = 3221225472;
          v35[2] = __108__BLTPBBulletin_BBBulletin___addAttachmentsFromBBBulletin_toBLTPBBulletin_observer_attachOption_completion___block_invoke_2;
          v35[3] = &unk_264685738;
          id v36 = *(id *)(a1 + 32);
          uint64_t v37 = v18;
          [v26 _attachmentFromBBAttachmentMetadata:v22 bulletin:v23 observer:v24 fileOption:2 attachOption:v25 completion:v35];
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v20);
    }

    id v27 = BLTWorkQueue();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __108__BLTPBBulletin_BBBulletin___addAttachmentsFromBBBulletin_toBLTPBBulletin_observer_attachOption_completion___block_invoke_3;
    block[3] = &unk_264683C28;
    id v34 = *(id *)(a1 + 56);
    id v33 = *(id *)(a1 + 32);
    dispatch_group_notify(v18, v27, block);

    id v6 = v28;
    id v5 = v29;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __108__BLTPBBulletin_BBBulletin___addAttachmentsFromBBBulletin_toBLTPBBulletin_observer_attachOption_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) addAdditionalAttachments:a2];
  }
  id v3 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v3);
}

uint64_t __108__BLTPBBulletin_BBBulletin___addAttachmentsFromBBBulletin_toBLTPBBulletin_observer_attachOption_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_222F4C000, a2, OS_LOG_TYPE_FAULT, "%s could not be retrieved from BulletinBoard!", (uint8_t *)&v2, 0xCu);
}

void __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_100_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "Error transcoding %@ to %@: %@", (uint8_t *)&v5, 0x20u);
}

@end