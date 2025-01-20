@interface _CDInteraction
+ (BOOL)supportsSecureCoding;
+ (id)_internPool;
+ (id)conversationIdPercentEscapes;
+ (id)generateConversationIdFromHandle:(id)a3;
+ (id)generateConversationIdFromObjectsWithIdentifiers:(id)a3;
+ (id)inverseConversationIdPercentEscapes;
+ (id)recipientIdentifiersFromMobileMailConversationId:(id)a3;
+ (id)shareSheetInteractionFromINInteraction:(id)a3 bundleID:(id)a4 nsUserName:(id)a5 knowledgeStore:(id)a6;
- (BOOL)forcePersistInteraction;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroupChat;
- (BOOL)isInteractionMechanismCalls;
- (BOOL)isResponse;
- (BOOL)isUncachedSentinel;
- (BOOL)isValidInteraction;
- (BOOL)mailShareSheetDeletionCandidate;
- (BOOL)userIsSender;
- (BOOL)userIsThreadInitiator;
- (NSArray)attachments;
- (NSArray)keywords;
- (NSArray)peopleIdentifiers;
- (NSArray)recipients;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDate)updateDate;
- (NSString)account;
- (NSString)bundleId;
- (NSString)derivedIntentIdentifier;
- (NSString)description;
- (NSString)domainIdentifier;
- (NSString)groupName;
- (NSString)locationUUID;
- (NSString)nsUserName;
- (NSString)targetBundleId;
- (NSString)title;
- (NSString)uuid;
- (NSURL)contentURL;
- (_CDContact)sender;
- (_CDInteraction)init;
- (_CDInteraction)initWithCoder:(id)a3;
- (_CDInteraction)initWithINInteraction:(id)a3 bundleID:(id)a4 nsUserName:(id)a5;
- (id)dateInterval;
- (id)descriptionRedacted:(BOOL)a3;
- (id)metadataFromFeedbackEvent:(id)a3;
- (id)redactedDescription;
- (int64_t)direction;
- (int64_t)mechanism;
- (int64_t)selfParticipantStatus;
- (unint64_t)hash;
- (unint64_t)recipientsCount;
- (void)encodeWithCoder:(id)a3;
- (void)fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:(id)a3;
- (void)isValidInteraction;
- (void)setAccount:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setContentURL:(id)a3;
- (void)setDerivedIntentIdentifier:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setDomainIdentifier:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setForcePersistInteraction:(BOOL)a3;
- (void)setGroupName:(id)a3;
- (void)setIsResponse:(BOOL)a3;
- (void)setKeywords:(id)a3;
- (void)setLocationUUID:(id)a3;
- (void)setMailShareSheetDeletionCandidate:(BOOL)a3;
- (void)setMechanism:(int64_t)a3;
- (void)setNsUserName:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSelfParticipantStatus:(int64_t)a3;
- (void)setSender:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTargetBundleId:(id)a3;
- (void)setUpdateDate:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation _CDInteraction

- (BOOL)isUncachedSentinel
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CDInteraction)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_CDInteraction;
  v5 = [(_CDInteraction *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateDate"];
    updateDate = v5->_updateDate;
    v5->_updateDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationUUID"];
    locationUUID = v5->_locationUUID;
    v5->_locationUUID = (NSString *)v14;

    v5->_mechanism = [v4 decodeInt64ForKey:@"mechanism"];
    v5->_direction = [v4 decodeInt64ForKey:@"direction"];
    v5->_isResponse = [v4 decodeBoolForKey:@"isResponse"];
    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
    [(_CDInteraction *)v5 setBundleId:v16];

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetBundleId"];
    [(_CDInteraction *)v5 setTargetBundleId:v17];

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupName"];
    [(_CDInteraction *)v5 setGroupName:v18];

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentURL"];
    [(_CDInteraction *)v5 setContentURL:v19];

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"derivedIntentIdentifier"];
    [(_CDInteraction *)v5 setDerivedIntentIdentifier:v20];

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domainIdentifier"];
    [(_CDInteraction *)v5 setDomainIdentifier:v21];

    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"account"];
    [(_CDInteraction *)v5 setAccount:v22];

    v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sender"];
    [(_CDInteraction *)v5 setSender:v23];

    v24 = [v4 decodeObjectForKey:@"recipients"];
    [(_CDInteraction *)v5 setRecipients:v24];

    uint64_t v25 = [v4 decodeObjectForKey:@"keywords"];
    keywords = v5->_keywords;
    v5->_keywords = (NSArray *)v25;

    uint64_t v27 = [v4 decodeObjectForKey:@"attachments"];
    attachments = v5->_attachments;
    v5->_attachments = (NSArray *)v27;

    v5->_selfParticipantStatus = [v4 decodeInt64ForKey:@"selfParticipantStatus"];
    v5->_forcePersistInteraction = [v4 decodeBoolForKey:@"forcePersistInteraction"];
    v5->_mailShareSheetDeletionCandidate = [v4 decodeBoolForKey:@"mailShareSheetDeletionCandidate"];
    v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nsUserName"];
    [(_CDInteraction *)v5 setNsUserName:v29];

    v30 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  startDate = self->_startDate;
  id v6 = a3;
  [v6 encodeObject:startDate forKey:@"startDate"];
  [v6 encodeObject:self->_updateDate forKey:@"updateDate"];
  [v6 encodeObject:self->_endDate forKey:@"endDate"];
  [v6 encodeObject:self->_uuid forKey:@"uuid"];
  [v6 encodeObject:self->_locationUUID forKey:@"locationUUID"];
  [v6 encodeInt64:self->_mechanism forKey:@"mechanism"];
  [v6 encodeInt64:self->_direction forKey:@"direction"];
  [v6 encodeBool:self->_isResponse forKey:@"isResponse"];
  [v6 encodeObject:self->_bundleId forKey:@"bundleId"];
  [v6 encodeObject:self->_targetBundleId forKey:@"targetBundleId"];
  [v6 encodeObject:self->_groupName forKey:@"groupName"];
  [v6 encodeObject:self->_contentURL forKey:@"contentURL"];
  [v6 encodeObject:self->_derivedIntentIdentifier forKey:@"derivedIntentIdentifier"];
  [v6 encodeObject:self->_domainIdentifier forKey:@"domainIdentifier"];
  [v6 encodeObject:self->_account forKey:@"account"];
  v5 = [(_CDInteraction *)self recipients];
  [v6 encodeObject:v5 forKey:@"recipients"];

  [v6 encodeObject:self->_sender forKey:@"sender"];
  [v6 encodeObject:self->_keywords forKey:@"keywords"];
  [v6 encodeObject:self->_attachments forKey:@"attachments"];
  [v6 encodeBool:self->_forcePersistInteraction forKey:@"forcePersistInteraction"];
  [v6 encodeBool:self->_mailShareSheetDeletionCandidate forKey:@"mailShareSheetDeletionCandidate"];
  [v6 encodeInt64:self->_selfParticipantStatus forKey:@"selfParticipantStatus"];
  [v6 encodeObject:self->_nsUserName forKey:@"nsUserName"];
}

- (_CDInteraction)init
{
  v9.receiver = self;
  v9.super_class = (Class)_CDInteraction;
  v2 = [(_CDInteraction *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    id v4 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v3;

    objc_storeStrong((id *)v2 + 13, *((id *)v2 + 12));
    objc_storeStrong((id *)v2 + 14, *((id *)v2 + 12));
    v5 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v6 = [v5 UUIDString];
    v7 = (void *)*((void *)v2 + 15);
    *((void *)v2 + 15) = v6;

    *(_OWORD *)(v2 + 136) = xmmword_18EEAC360;
    v2[88] = 0;
    v2[90] = 0;
  }
  return (_CDInteraction *)v2;
}

+ (id)_internPool
{
  if (_internPool__pasOnceToken5 != -1) {
    dispatch_once(&_internPool__pasOnceToken5, &__block_literal_global_13);
  }
  v2 = (void *)_internPool__pasExprOnceResult;
  return v2;
}

- (NSArray)recipients
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (self->_recipients)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = self->_recipients;
    }
    else
    {
      id v4 = (void *)MEMORY[0x192FB2F20]();
      v6[0] = self->_recipients;
      id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    }
  }
  else
  {
    id v3 = (id)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v3;
}

- (void)setRecipients:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 1)
  {
    v5 = [v4 objectAtIndexedSubscript:0];
    id recipients = self->_recipients;
    self->_id recipients = v5;
    id obj = v4;
    goto LABEL_19;
  }
  id obj = (id)[v4 copy];

  v7 = +[_CDInteraction _internPool];
  id recipients = [v7 intern:obj];

  p_id recipients = &self->_recipients;
  if (recipients == obj)
  {
    id v22 = obj;
    id v15 = *p_recipients;
    *p_id recipients = v22;
  }
  else
  {
    objc_storeStrong(p_recipients, recipients);
    if (![obj count]) {
      goto LABEL_19;
    }
    uint64_t v9 = 0;
    uint64_t v10 = obj;
    while (1)
    {
      v11 = [v10 objectAtIndexedSubscript:v9];
      uint64_t v12 = [v11 displayName];
      v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        id v14 = [MEMORY[0x1E4F1CA98] null];
      }
      id v15 = v14;

      v16 = [recipients objectAtIndexedSubscript:v9];
      v17 = [v16 displayName];
      v18 = v17;
      if (v17)
      {
        id v19 = v17;
      }
      else
      {
        id v19 = [MEMORY[0x1E4F1CA98] null];
      }
      v20 = v19;

      if (([v15 isEqual:v20] & 1) == 0) {
        break;
      }

      BOOL v21 = ++v9 >= (unint64_t)[obj count];
      uint64_t v10 = obj;
      if (v21) {
        goto LABEL_19;
      }
    }
    objc_storeStrong(p_recipients, obj);
  }
LABEL_19:
}

- (unint64_t)recipientsCount
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 1;
  }
  id recipients = self->_recipients;
  return [recipients count];
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  id v4 = a3;
  id v8 = +[_CDInteraction _internPool];
  v5 = (void *)[v4 copy];

  uint64_t v6 = [v8 intern:v5];
  bundleId = self->_bundleId;
  self->_bundleId = v6;
}

- (NSString)targetBundleId
{
  return self->_targetBundleId;
}

- (void)setTargetBundleId:(id)a3
{
  id v4 = a3;
  id v8 = +[_CDInteraction _internPool];
  v5 = (void *)[v4 copy];

  uint64_t v6 = [v8 intern:v5];
  targetBundleId = self->_targetBundleId;
  self->_targetBundleId = v6;
}

- (NSString)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  id v4 = a3;
  id v8 = +[_CDInteraction _internPool];
  v5 = (void *)[v4 copy];

  uint64_t v6 = [v8 intern:v5];
  account = self->_account;
  self->_account = v6;
}

- (NSString)derivedIntentIdentifier
{
  return self->_derivedIntentIdentifier;
}

- (void)setDerivedIntentIdentifier:(id)a3
{
  id v4 = a3;
  id v8 = +[_CDInteraction _internPool];
  v5 = (void *)[v4 copy];

  uint64_t v6 = [v8 intern:v5];
  derivedIntentIdentifier = self->_derivedIntentIdentifier;
  self->_derivedIntentIdentifier = v6;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
  id v4 = a3;
  id v8 = +[_CDInteraction _internPool];
  v5 = (void *)[v4 copy];

  uint64_t v6 = [v8 intern:v5];
  domainIdentifier = self->_domainIdentifier;
  self->_domainIdentifier = v6;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  id v4 = a3;
  id v8 = +[_CDInteraction _internPool];
  v5 = (void *)[v4 copy];

  uint64_t v6 = [v8 intern:v5];
  groupName = self->_groupName;
  self->_groupName = v6;
}

- (_CDContact)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  id v4 = a3;
  id v8 = +[_CDInteraction _internPool];
  v5 = (void *)[v4 copy];

  uint64_t v6 = [v8 intern:v5];
  sender = self->_sender;
  self->_sender = v6;
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (void)setContentURL:(id)a3
{
  id v4 = a3;
  id v8 = +[_CDInteraction _internPool];
  v5 = (void *)[v4 copy];

  uint64_t v6 = [v8 intern:v5];
  contentURL = self->_contentURL;
  self->_contentURL = v6;
}

- (NSString)nsUserName
{
  return self->_nsUserName;
}

- (void)setNsUserName:(id)a3
{
  id v4 = a3;
  id v8 = +[_CDInteraction _internPool];
  v5 = (void *)[v4 copy];

  uint64_t v6 = [v8 intern:v5];
  nsUserName = self->_nsUserName;
  self->_nsUserName = v6;
}

- (NSString)description
{
  return (NSString *)[(_CDInteraction *)self descriptionRedacted:0];
}

- (id)redactedDescription
{
  return [(_CDInteraction *)self descriptionRedacted:1];
}

- (id)descriptionRedacted:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v5 appendString:@"Interaction { \n"];
  uint64_t v6 = [(_CDInteraction *)self startDate];
  [v5 appendFormat:@"                startDate: %@\n", v6];

  v7 = [(_CDInteraction *)self updateDate];
  [v5 appendFormat:@"               updateDate: %@\n", v7];

  id v8 = [(_CDInteraction *)self endDate];
  [v5 appendFormat:@"                  endDate: %@\n", v8];

  uint64_t v9 = [(_CDInteraction *)self uuid];
  [v5 appendFormat:@"                     uuid: %@\n", v9];

  if (v3)
  {
    [v5 appendFormat:@"             locationUUID: %@\n", @"redacted"];
  }
  else
  {
    uint64_t v10 = [(_CDInteraction *)self locationUUID];
    [v5 appendFormat:@"             locationUUID: %@\n", v10];
  }
  v11 = mechanismToString([(_CDInteraction *)self mechanism]);
  [v5 appendFormat:@"                mechanism: %@ (%ld)\n", v11, -[_CDInteraction mechanism](self, "mechanism")];

  unint64_t v12 = [(_CDInteraction *)self direction] - 1;
  if (v12 > 3) {
    v13 = @"Incoming";
  }
  else {
    v13 = off_1E560E390[v12];
  }
  [v5 appendFormat:@"                direction: %@ (%ld)\n", v13, -[_CDInteraction direction](self, "direction")];
  objc_msgSend(v5, "appendFormat:", @"               isResponse: %d\n", -[_CDInteraction isResponse](self, "isResponse"));
  id v14 = [(_CDInteraction *)self bundleId];
  [v5 appendFormat:@"                 bundleId: %@\n", v14];

  id v15 = [(_CDInteraction *)self targetBundleId];
  [v5 appendFormat:@"           targetBundleId: %@\n", v15];

  v16 = [(_CDInteraction *)self groupName];
  v17 = +[_CDLogging descriptionOfObject:v16 redacted:v3];
  [v5 appendFormat:@"                groupName: %@\n", v17];

  v18 = [(_CDInteraction *)self contentURL];
  id v19 = +[_CDLogging descriptionOfObject:v18 redacted:v3];
  [v5 appendFormat:@"               contentURL: %@\n", v19];

  v20 = [(_CDInteraction *)self derivedIntentIdentifier];
  BOOL v21 = +[_CDLogging descriptionOfObject:v20 redacted:v3];
  [v5 appendFormat:@"  derivedIntentIdentifier: %@\n", v21];

  id v22 = [(_CDInteraction *)self domainIdentifier];
  v23 = +[_CDLogging descriptionOfObject:v22 redacted:v3];
  [v5 appendFormat:@"         domainIdentifier: %@\n", v23];

  v24 = [(_CDInteraction *)self account];
  uint64_t v25 = +[_CDLogging descriptionOfObject:v24 redacted:v3];
  [v5 appendFormat:@"                  account: %@\n", v25];

  v26 = [(_CDInteraction *)self sender];
  uint64_t v27 = +[_CDLogging descriptionOfObject:v26 redacted:v3];
  [v5 appendFormat:@"                   sender: %@\n", v27];

  v28 = [(_CDInteraction *)self recipients];
  v29 = +[_CDLogging descriptionOfArray:v28 redacted:v3];
  [v5 appendFormat:@"               recipients: %@\n", v29];

  v30 = [(_CDInteraction *)self keywords];
  v31 = +[_CDLogging descriptionOfArray:v30 redacted:v3];
  [v5 appendFormat:@"                 keywords: %@\n", v31];

  objc_super v32 = [(_CDInteraction *)self attachments];
  v33 = +[_CDLogging descriptionOfArray:v32 redacted:v3];
  [v5 appendFormat:@"              attachments: %@\n", v33];

  if ([(_CDInteraction *)self mechanism] == 5)
  {
    v34 = meetingStatusToString([(_CDInteraction *)self selfParticipantStatus]);
    [v5 appendFormat:@"    selfParticipantStatus: %@\n", v34];
  }
  v35 = [(_CDInteraction *)self nsUserName];
  [v5 appendFormat:@"               nsUserName: %@\n", v35];

  [v5 appendString:@"}\n"];
  return v5;
}

- (unint64_t)hash
{
  v2 = [(_CDInteraction *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_CDInteraction *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = [(_CDInteraction *)v5 uuid];
    v7 = [(_CDInteraction *)self uuid];
    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isInteractionMechanismCalls
{
  return (self->_mechanism < 0x12uLL) & (0x31D01u >> self->_mechanism);
}

- (BOOL)isValidInteraction
{
  unint64_t v3 = (void *)MEMORY[0x192FB2F20](self, a2);
  id v13 = 0;
  id v4 = objc_msgSend(MEMORY[0x1E4F28DB0], "archivedDataWithRootObject:requiringSecureCoding:error:", self, +[_CDInteraction supportsSecureCoding](_CDInteraction, "supportsSecureCoding"), &v13);
  id v5 = v13;
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F28DC0];
    char v8 = +[_CDXPCCodecs supportedClassesToUnarchive];
    id v12 = 0;
    id v9 = (id)[v7 unarchivedObjectOfClasses:v8 fromData:v4 error:&v12];
    id v6 = v12;

    if (!v6) {
      return 1;
    }
  }
  uint64_t v10 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    -[_CDInteraction isValidInteraction]();
  }

  return 0;
}

- (BOOL)isGroupChat
{
  if ([(_CDInteraction *)self direction] == 1
    && [(_CDInteraction *)self recipientsCount] > 1)
  {
    return 1;
  }
  if ([(_CDInteraction *)self direction]) {
    return 0;
  }
  return [(_CDInteraction *)self recipientsCount] != 0;
}

- (id)dateInterval
{
  unint64_t v3 = [(NSDate *)self->_startDate earlierDate:self->_endDate];
  id v4 = [(NSDate *)self->_startDate laterDate:self->_endDate];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v3 endDate:v4];

  return v5;
}

+ (id)conversationIdPercentEscapes
{
  if (initPercentEscapes_onceToken != -1) {
    dispatch_once(&initPercentEscapes_onceToken, &__block_literal_global_922);
  }
  v2 = (void *)percentEscapes;
  return v2;
}

+ (id)inverseConversationIdPercentEscapes
{
  if (initPercentEscapes_onceToken != -1) {
    dispatch_once(&initPercentEscapes_onceToken, &__block_literal_global_922);
  }
  v2 = (void *)inversePercentEscapes;
  return v2;
}

+ (id)generateConversationIdFromObjectsWithIdentifiers:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 count];
  uint64_t v5 = v4 - 1;
  if (v4 == 1)
  {
    uint64_t v25 = [v3 objectAtIndexedSubscript:0];
    v26 = [v25 identifier];
    uint64_t v27 = +[_CDInteraction generateConversationIdFromHandle:v26];

    goto LABEL_31;
  }
  size_t v6 = v4;
  if (!v4)
  {
    uint64_t v27 = &stru_1EDDE58B8;
    goto LABEL_31;
  }
  unint64_t v7 = (8 * v4) | 7;
  memptr = 0;
  uint64_t v46 = 0;
  unint64_t v42 = v7;
  uint64_t v43 = MEMORY[0x192FB2F20]();
  if (v7 > 0x400)
  {
    int v35 = malloc_type_posix_memalign(&memptr, 8uLL, 8 * v6, 0x80040B8603338uLL);
    LOBYTE(v46) = 0;
    if (v35) {
      goto LABEL_40;
    }
    char v8 = (char *)memptr;
  }
  else
  {
    MEMORY[0x1F4188790]();
    char v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v8, (8 * v6) | 7);
  }
  id v44 = v3;
  objc_msgSend(v3, "getObjects:range:", v8, 0, v6);
  qsort_b(v8, v6, 8uLL, &__block_literal_global_727);
  char v9 = 0;
  uint64_t v10 = 0;
  do
  {
    uint64_t v11 = v5;
    [*(id *)&v8[8 * v10] identifier];
    v13 = id v12 = (id *)v8;
    id v14 = +[_CDInteraction generateConversationIdFromHandle:v13];
    size_t v15 = v6;
    v16 = v14;
    if (v13 != v14) {
      char v9 = 1;
    }
    uint64_t v17 = [v14 length];
    v5 += v17;

    size_t v6 = v15;
    char v8 = (char *)v12;
    ++v10;
  }
  while (v15 != v10);
  uint64_t v41 = v11;
  memptr = 0;
  uint64_t v46 = 0;
  uint64_t v39 = 2 * v5;
  if (((2 * v5) | 1uLL) < 0x401)
  {
    MEMORY[0x1F4188790]();
    id v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v19, v18);
    memptr = v19;
    LOBYTE(v46) = 1;
    goto LABEL_11;
  }
  int v36 = malloc_type_posix_memalign(&memptr, 8uLL, 2 * v5, 0xC021AE26uLL);
  LOBYTE(v46) = 0;
  if (v36)
  {
LABEL_40:
    id v37 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v37);
  }
  id v19 = (char *)memptr;
LABEL_11:
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v40 = v46;
  do
  {
    if (v20) {
      *(_WORD *)&v19[2 * v21++] = 10;
    }
    [v12[v20] identifier];
    if (v9) {
      v24 = {;
    }
      id v22 = +[_CDInteraction generateConversationIdFromHandle:v24];
    }
    else {
      id v22 = {;
    }
    }
    uint64_t v23 = [v22 length];
    objc_msgSend(v22, "getCharacters:range:", &v19[2 * v21], 0, v23);
    v21 += v23;

    ++v20;
  }
  while (v15 != v20);
  if (v42 > 0x400) {
    free(v12);
  }
  v28 = (void *)v43;
  if (v5)
  {
    uint64_t v29 = v17 + v41;
    v30 = v19;
    do
    {
      unsigned int v31 = *(unsigned __int16 *)v30;
      v30 += 2;
      if (v31 >= 0x80)
      {
        objc_msgSend(NSString, "_pas_stringWithConsumedAllocaDescrNoCopy:bufferSize:encoding:nullTerminated:isExternalRepresentation:", v19, v40, v39, 2483028224, 0, 0);
        uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
      --v29;
    }
    while (v29);
    uint64_t v32 = 0;
    uint64_t v33 = v17 + v41;
    do
    {
      v19[v32] = *(_WORD *)&v19[2 * v32];
      ++v32;
    }
    while (v33 != v32);
  }
  uint64_t v27 = (__CFString *)[[NSString alloc] initWithBytes:v19 length:v5 encoding:1];
  if ((v40 & 1) == 0) {
    free(v19);
  }
LABEL_30:
  id v3 = v44;
LABEL_31:

  return v27;
}

+ (id)generateConversationIdFromHandle:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[_CDInteraction conversationIdPercentEscapes];
  uint64_t v5 = [v3 rangeOfCharacterFromSet:v4 options:2];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    size_t v6 = (__CFString *)v3;
  }
  else
  {
    unint64_t v7 = (void *)MEMORY[0x192FB2F20]();
    char v8 = +[_CDInteraction inverseConversationIdPercentEscapes];
    uint64_t v9 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:v8];
    uint64_t v10 = (void *)v9;
    uint64_t v11 = &stru_1EDDE58B8;
    if (v9) {
      uint64_t v11 = (__CFString *)v9;
    }
    size_t v6 = v11;
  }

  return v6;
}

+ (id)recipientIdentifiersFromMobileMailConversationId:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67___CDInteraction_recipientIdentifiersFromMobileMailConversationId___block_invoke;
  v7[3] = &unk_1E560E280;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateLinesUsingBlock:v7];

  return v5;
}

- (id)metadataFromFeedbackEvent:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [v3 derivedIntentIdentifier];

  if (v5)
  {
    size_t v6 = [v3 derivedIntentIdentifier];
    unint64_t v7 = +[_DKShareSheetFeedbackMetadataKey derivedIntentIdentifier];
    [v4 setObject:v6 forKeyedSubscript:v7];
  }
  id v8 = [v3 targetBundleID];

  if (v8)
  {
    uint64_t v9 = [v3 targetBundleID];
    uint64_t v10 = +[_DKShareSheetFeedbackMetadataKey targetBundleID];
    [v4 setObject:v9 forKeyedSubscript:v10];
  }
  uint64_t v11 = [v3 extensionContextUUID];

  if (v11)
  {
    id v12 = [v3 extensionContextUUID];
    id v13 = +[_DKShareSheetFeedbackMetadataKey extensionContextUUID];
    [v4 setObject:v12 forKeyedSubscript:v13];
  }
  id v14 = [v3 attachments];

  if (v14)
  {
    size_t v15 = [v3 attachments];
    v16 = +[_DKShareSheetFeedbackMetadataKey attachments];
    [v4 setObject:v15 forKeyedSubscript:v16];
  }
  uint64_t v17 = [v3 locationUUIDs];

  if (v17)
  {
    size_t v18 = [v3 locationUUIDs];
    id v19 = +[_DKShareSheetFeedbackMetadataKey locationUUIDs];
    [v4 setObject:v18 forKeyedSubscript:v19];
  }
  uint64_t v20 = [v3 photoSuggestedContacts];

  if (v20)
  {
    uint64_t v21 = [v3 photoSuggestedContacts];
    id v22 = +[_DKShareSheetFeedbackMetadataKey photoSuggestedContacts];
    [v4 setObject:v21 forKeyedSubscript:v22];
  }
  uint64_t v23 = [v3 sourceBundleID];

  if (v23)
  {
    v24 = [v3 sourceBundleID];
    uint64_t v25 = +[_DKShareSheetFeedbackMetadataKey sourceBundleID];
    [v4 setObject:v24 forKeyedSubscript:v25];
  }
  v26 = [v3 modelSuggestionProxies];

  if (v26)
  {
    uint64_t v27 = [v3 modelSuggestionProxies];
    v28 = +[_DKShareSheetFeedbackMetadataKey modelSuggestionProxies];
    [v4 setObject:v27 forKeyedSubscript:v28];
  }
  uint64_t v29 = [v3 adaptedModelRecipeID];

  if (v29)
  {
    v30 = [v3 adaptedModelRecipeID];
    unsigned int v31 = +[_DKShareSheetFeedbackMetadataKey adaptedModelRecipeID];
    [v4 setObject:v30 forKeyedSubscript:v31];
  }
  uint64_t v32 = [v3 supportedBundleIDs];

  if (v32)
  {
    uint64_t v33 = [v3 supportedBundleIDs];
    v34 = +[_DKShareSheetFeedbackMetadataKey supportedBundleIDs];
    [v4 setObject:v33 forKeyedSubscript:v34];
  }
  int v35 = [v3 reasonType];

  if (v35)
  {
    int v36 = [v3 reasonType];
    id v37 = +[_DKShareSheetFeedbackMetadataKey reasonType];
    [v4 setObject:v36 forKeyedSubscript:v37];
  }
  uint64_t v38 = [v3 reason];

  if (v38)
  {
    uint64_t v39 = [v3 reason];
    uint64_t v40 = +[_DKShareSheetFeedbackMetadataKey reason];
    [v4 setObject:v39 forKeyedSubscript:v40];
  }
  uint64_t v41 = [v3 transportBundleID];

  if (v41)
  {
    unint64_t v42 = [v3 transportBundleID];
    uint64_t v43 = +[_DKShareSheetFeedbackMetadataKey transportBundleID];
    [v4 setObject:v42 forKeyedSubscript:v43];
  }
  id v44 = [v3 trackingID];

  if (v44)
  {
    v45 = [v3 trackingID];
    uint64_t v46 = +[_DKShareSheetFeedbackMetadataKey trackingID];
    [v4 setObject:v45 forKeyedSubscript:v46];
  }
  uint64_t v47 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isAdaptedModelUsed"));
  v48 = +[_DKShareSheetFeedbackMetadataKey isAdaptedModelUsed];
  [v4 setObject:v47 forKeyedSubscript:v48];

  v49 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isAdaptedModelCreated"));
  v50 = +[_DKShareSheetFeedbackMetadataKey isAdaptedModelCreated];
  [v4 setObject:v49 forKeyedSubscript:v50];

  v51 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "indexSelected"));
  v52 = +[_DKShareSheetFeedbackMetadataKey indexSelected];
  [v4 setObject:v51 forKeyedSubscript:v52];

  v53 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "engagementType"));
  v54 = +[_DKShareSheetFeedbackMetadataKey engagementType];
  [v4 setObject:v53 forKeyedSubscript:v54];

  v55 = NSNumber;
  [v3 numberOfVisibleSuggestions];
  v56 = objc_msgSend(v55, "numberWithDouble:");
  v57 = +[_DKShareSheetFeedbackMetadataKey numberOfVisibleSuggestions];
  [v4 setObject:v56 forKeyedSubscript:v57];

  v58 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "iCloudFamilyInvocation"));
  v59 = +[_DKShareSheetFeedbackMetadataKey iCloudFamilyInvocation];
  [v4 setObject:v58 forKeyedSubscript:v59];

  v60 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "peopleSuggestionsDisabled"));
  v61 = +[_DKShareSheetFeedbackMetadataKey peopleSuggestionsDisabled];
  [v4 setObject:v60 forKeyedSubscript:v61];

  return v4;
}

- (void)fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:(id)a3
{
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  id v97 = a3;
  v105 = self;
  if (self->_mechanism == 13)
  {
    targetBundleId = self->_targetBundleId;
    id v5 = +[_CDConstants shareSheetTargetBundleIdMessages]();
    LODWORD(targetBundleId) = [(NSString *)targetBundleId isEqualToString:v5];

    size_t v6 = v105->_bundleId;
    if (targetBundleId)
    {
      uint64_t v7 = +[_CDConstants mobileMessagesBundleId]();

      char v93 = 1;
      size_t v6 = (NSString *)v7;
      goto LABEL_6;
    }
  }
  else
  {
    size_t v6 = self->_bundleId;
  }
  char v93 = 0;
LABEL_6:
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v6, 0);
  v104 = v6;
  v106 = [MEMORY[0x1E4F223F0] bundleProxyForIdentifier:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    uint64_t v9 = [v106 plugInKitPlugins];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v135 objects:v142 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v136;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v136 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v135 + 1) + 8 * i);
          id v14 = [v13 bundleIdentifier];
          if (v14)
          {
            size_t v15 = [v13 protocol];
            int v16 = [v15 isEqualToString:@"com.apple.share-services"];

            if (v16) {
              [v8 addObject:v14];
            }
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v135 objects:v142 count:16];
      }
      while (v10);
    }
  }
  uint64_t v17 = +[_CDConstants mobileMessagesBundleId]();
  BOOL v18 = [(NSString *)v104 isEqualToString:v17];

  if (v18)
  {
    id v19 = +[_CDConstants shareSheetTargetBundleIdMessages]();
    [v8 addObject:v19];
  }
  uint64_t v129 = 0;
  v130 = &v129;
  uint64_t v131 = 0x3032000000;
  v132 = __Block_byref_object_copy__6;
  v133 = __Block_byref_object_dispose__6;
  id v134 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v20 = BiomeLibrary();
  uint64_t v21 = [v20 ShareSheet];
  v103 = [v21 Feedback];

  id v22 = [v103 publisherWithUseCase:@"ShareSheetFeedback"];
  v125[0] = MEMORY[0x1E4F143A8];
  v125[1] = 3221225472;
  v125[2] = __78___CDInteraction_fetchAndAddShareSheetContentToInteractionWithKnowledgeStore___block_invoke_749;
  v125[3] = &unk_1E560E2C8;
  id v95 = v8;
  id v126 = v95;
  v127 = v105;
  v128 = &v129;
  id v23 = (id)[v22 sinkWithCompletion:&__block_literal_global_748 receiveInput:v125];
  v96 = v22;
  v24 = [(id)v130[5] anyObject];
  v102 = v24;
  if (v24)
  {
    uint64_t v25 = [v24 source];
    v99 = [v25 bundleID];

    v26 = [v102 metadata];
    uint64_t v27 = +[_DKShareSheetFeedbackMetadataKey targetBundleID];
    v98 = [v26 objectForKeyedSubscript:v27];

    if (!v98 || ![v98 length] || !v99 || !-[NSObject length](v99, "length"))
    {
      v94 = +[_CDLogging interactionChannel];
      if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
        -[_CDInteraction fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:]();
      }
      goto LABEL_44;
    }
    v28 = [v102 metadata];
    uint64_t v29 = +[_DKShareSheetFeedbackMetadataKey attachments];
    v94 = [v28 objectForKeyedSubscript:v29];

    if (v94)
    {
      get_PSAttachmentClass();
      uint64_t v30 = objc_opt_class();
      if (!v30)
      {
        uint64_t v33 = +[_CDLogging interactionChannel];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[_CDInteraction fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:](v33);
        }
        goto LABEL_42;
      }
      objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), v30, 0);
      v88 = id v124 = 0;
      unsigned int v31 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v88 fromData:v94 error:&v124];
      v89 = v124;
      if (v89)
      {
        uint64_t v32 = +[_CDLogging interactionChannel];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[_CDInteraction fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:].cold.4();
        }

        uint64_t v33 = v89;
LABEL_42:

        v110 = 0;
LABEL_43:

LABEL_44:
        goto LABEL_45;
      }
      v110 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v31, "count"));
      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      id obj = v31;
      uint64_t v92 = [obj countByEnumeratingWithState:&v120 objects:v141 count:16];
      if (v92)
      {
        uint64_t v91 = *(void *)v121;
        do
        {
          for (uint64_t j = 0; j != v92; ++j)
          {
            if (*(void *)v121 != v91) {
              objc_enumerationMutation(obj);
            }
            uint64_t v39 = *(void **)(*((void *)&v120 + 1) + 8 * j);
            uint64_t v40 = [_CDAttachment alloc];
            uint64_t v41 = [v39 identifier];
            unint64_t v42 = [v39 cloudIdentifier];
            uint64_t v43 = [v39 photoLocalIdentifier];
            id v44 = [v39 UTI];
            v45 = [v39 creationDate];
            uint64_t v46 = [v39 contentURL];
            uint64_t v47 = [v39 contentText];
            v100 = [(_CDAttachment *)v40 initWithIdentifier:v41 cloudIdentifier:v42 photoLocalIdentifier:v43 type:v44 sizeInBytes:0 creationDate:v45 contentURL:v46 contentText:v47 photoSceneDescriptor:0 personInPhoto:0];
            v111 = v39;

            [v110 addObject:v100];
            v48 = [v39 peopleInPhoto];

            if (v48)
            {
              long long v118 = 0u;
              long long v119 = 0u;
              long long v116 = 0u;
              long long v117 = 0u;
              v49 = [v39 peopleInPhoto];
              uint64_t v50 = [v49 countByEnumeratingWithState:&v116 objects:v140 count:16];
              if (v50)
              {
                uint64_t v51 = *(void *)v117;
                do
                {
                  for (uint64_t k = 0; k != v50; ++k)
                  {
                    if (*(void *)v117 != v51) {
                      objc_enumerationMutation(v49);
                    }
                    uint64_t v53 = *(void *)(*((void *)&v116 + 1) + 8 * k);
                    v54 = [_CDAttachment alloc];
                    v55 = [v111 identifier];
                    v56 = [v111 cloudIdentifier];
                    v57 = [v111 photoLocalIdentifier];
                    v58 = [v111 UTI];
                    v59 = [(_CDAttachment *)v54 initWithIdentifier:v55 cloudIdentifier:v56 photoLocalIdentifier:v57 type:v58 sizeInBytes:0 creationDate:0 contentURL:0 contentText:0 photoSceneDescriptor:0 personInPhoto:v53];

                    [v110 addObject:v59];
                  }
                  uint64_t v50 = [v49 countByEnumeratingWithState:&v116 objects:v140 count:16];
                }
                while (v50);
              }
            }
            v60 = [v111 photoSceneDescriptors];

            if (v60)
            {
              long long v114 = 0u;
              long long v115 = 0u;
              long long v112 = 0u;
              long long v113 = 0u;
              v61 = [v111 photoSceneDescriptors];
              uint64_t v62 = [v61 countByEnumeratingWithState:&v112 objects:v139 count:16];
              if (v62)
              {
                id v107 = v61;
                uint64_t v108 = *(void *)v113;
                do
                {
                  uint64_t v109 = v62;
                  for (uint64_t m = 0; m != v109; ++m)
                  {
                    if (*(void *)v113 != v108) {
                      objc_enumerationMutation(v107);
                    }
                    uint64_t v64 = *(void *)(*((void *)&v112 + 1) + 8 * m);
                    v65 = [_CDAttachment alloc];
                    v66 = [v111 identifier];
                    v67 = [v111 cloudIdentifier];
                    v68 = [v111 photoLocalIdentifier];
                    v69 = [v111 UTI];
                    v70 = [v111 creationDate];
                    v71 = [v111 contentURL];
                    v72 = [v111 contentText];
                    v73 = [(_CDAttachment *)v65 initWithIdentifier:v66 cloudIdentifier:v67 photoLocalIdentifier:v68 type:v69 sizeInBytes:0 creationDate:v70 contentURL:v71 contentText:v72 photoSceneDescriptor:v64 personInPhoto:0];

                    [v110 addObject:v73];
                  }
                  v61 = v107;
                  uint64_t v62 = [v107 countByEnumeratingWithState:&v112 objects:v139 count:16];
                }
                while (v62);
              }
            }
            v74 = [v111 contentURL];
            v75 = [v74 host];

            v76 = [v111 contentURL];
            if (v76) {
              BOOL v77 = v75 == 0;
            }
            else {
              BOOL v77 = 1;
            }
            int v78 = !v77;

            if (v78)
            {
              v79 = [_CDAttachment alloc];
              v80 = [v111 identifier];
              v81 = [v111 cloudIdentifier];
              v82 = [v111 photoLocalIdentifier];
              v83 = [v111 UTI];
              v84 = [v111 creationDate];
              v85 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v75];
              v86 = [v111 contentText];
              v87 = [(_CDAttachment *)v79 initWithIdentifier:v80 cloudIdentifier:v81 photoLocalIdentifier:v82 type:v83 sizeInBytes:0 creationDate:v84 contentURL:v85 contentText:v86];

              [v110 addObject:v87];
            }
          }
          uint64_t v92 = [obj countByEnumeratingWithState:&v120 objects:v141 count:16];
        }
        while (v92);
      }
    }
    else
    {
      v110 = 0;
    }
    v34 = +[_CDConstants shareSheetTargetBundleIdMessages]();
    int v35 = [v34 isEqualToString:v98];

    if (v35) {
      [(_CDInteraction *)v105 setDerivedIntentIdentifier:0];
    }
    int v36 = (void *)[v110 copy];
    [(_CDInteraction *)v105 setAttachments:v36];

    id v37 = [v102 source];
    uint64_t v38 = [v37 bundleID];
    [(_CDInteraction *)v105 setBundleId:v38];

    if ((v93 & 1) == 0) {
      [(_CDInteraction *)v105 setTargetBundleId:v98];
    }
    goto LABEL_43;
  }
  v99 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR)) {
    -[_CDInteraction fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:]();
  }
LABEL_45:

  _Block_object_dispose(&v129, 8);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)updateDate
{
  return self->_updateDate;
}

- (void)setUpdateDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)locationUUID
{
  return self->_locationUUID;
}

- (void)setLocationUUID:(id)a3
{
}

- (int64_t)mechanism
{
  return self->_mechanism;
}

- (void)setMechanism:(int64_t)a3
{
  self->_mechanisuint64_t m = a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (BOOL)isResponse
{
  return self->_isResponse;
}

- (void)setIsResponse:(BOOL)a3
{
  self->_isResponse = a3;
}

- (NSArray)keywords
{
  return self->_keywords;
}

- (void)setKeywords:(id)a3
{
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (int64_t)selfParticipantStatus
{
  return self->_selfParticipantStatus;
}

- (void)setSelfParticipantStatus:(int64_t)a3
{
  self->_selfParticipantStatus = a3;
}

- (BOOL)forcePersistInteraction
{
  return self->_forcePersistInteraction;
}

- (void)setForcePersistInteraction:(BOOL)a3
{
  self->_forcePersistInteraction = a3;
}

- (BOOL)mailShareSheetDeletionCandidate
{
  return self->_mailShareSheetDeletionCandidate;
}

- (void)setMailShareSheetDeletionCandidate:(BOOL)a3
{
  self->_mailShareSheetDeletionCandidate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_locationUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_updateDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_nsUserName, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_derivedIntentIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_targetBundleId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong(&self->_recipients, 0);
}

- (BOOL)userIsSender
{
  return [(_CDInteraction *)self direction] == 1;
}

- (NSArray)peopleIdentifiers
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(_CDInteraction *)self recipients];
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count") + 1);

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  size_t v6 = [(_CDInteraction *)self recipients];
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
        id v12 = [v11 identifier];
        uint64_t v13 = [v12 length];

        if (v13)
        {
          id v14 = [v11 identifier];
          [v5 addObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  size_t v15 = [(_CDInteraction *)self sender];
  int v16 = [v15 identifier];
  if ([v16 length])
  {
    int64_t v17 = [(_CDInteraction *)self direction];

    if (v17) {
      goto LABEL_14;
    }
    size_t v15 = [(_CDInteraction *)self sender];
    int v16 = [v15 identifier];
    [v5 addObject:v16];
  }

LABEL_14:
  return (NSArray *)v5;
}

- (NSString)title
{
  v2 = [(_CDInteraction *)self keywords];
  id v3 = [v2 componentsJoinedByString:@","];

  return (NSString *)v3;
}

- (BOOL)userIsThreadInitiator
{
  return ![(_CDInteraction *)self isResponse];
}

- (_CDInteraction)initWithINInteraction:(id)a3 bundleID:(id)a4 nsUserName:(id)a5
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[_CDInteraction(INInteraction) initWithINInteraction:bundleID:nsUserName:]((uint64_t)v8, (uint64_t)v9, v11);
  }

  if (v8)
  {
    self = [(_CDInteraction *)self init];
    id v12 = [v8 intent];
    uint64_t v13 = +[_CDConstants mobileMessagesBundleId]();
    if ([v9 isEqualToString:v13])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_10;
      }
      uint64_t v13 = [v12 donationMetadata];
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && ([v13 isBusinessChat])
      {
        size_t v15 = 0;

LABEL_50:
        goto LABEL_51;
      }
    }

LABEL_10:
    -[_CDInteraction setMechanism:](self, "setMechanism:", objc_msgSend(v12, "cd_interactionMechanism"));
    uint64_t v16 = [v8 identifier];
    if (!v16)
    {
      id v17 = v9;
      BOOL v18 = +[_CDLogging interactionChannel];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[_CDInteraction(INInteraction) initWithINInteraction:bundleID:nsUserName:](v18);
      }

      long long v19 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v16 = [v19 UUIDString];

      id v9 = v17;
    }
    if ([(_CDInteraction *)self mechanism] == 11 || [(_CDInteraction *)self mechanism] == 17)
    {
      long long v20 = +[_CDConstants facetimeBundleId]();
      [(_CDInteraction *)self setBundleId:v20];
    }
    else
    {
      [(_CDInteraction *)self setBundleId:v9];
    }
    long long v21 = [(_CDInteraction *)self bundleId];
    long long v22 = +[_CDSpotlightItemUtils interactionUUIDForSearchableItemWithUID:v16 bundleID:v21];
    [(_CDInteraction *)self setUuid:v22];

    id v23 = [v8 dateInterval];
    uint64_t v24 = [v23 startDate];
    [(_CDInteraction *)self setStartDate:v24];

    uint64_t v25 = [v8 dateInterval];
    v26 = [v25 endDate];
    [(_CDInteraction *)self setEndDate:v26];

    uint64_t v27 = [v12 imageForParameterNamed:@"speakableGroupName"];
    v28 = [v27 _uri];

    v73 = (void *)v16;
    if (v28)
    {
      uint64_t v29 = [v27 _uri];
      [(_CDInteraction *)self setContentURL:v29];
      goto LABEL_26;
    }
    uint64_t v30 = [v27 _identifier];

    if (v30)
    {
      unsigned int v31 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v29 = [v27 _identifier];
      uint64_t v32 = [v31 URLWithString:v29];
    }
    else
    {
      uint64_t v33 = [v12 _keyImage];
      v34 = [v33 _uri];

      int v35 = [v12 _keyImage];
      uint64_t v29 = v35;
      if (!v34)
      {
        v65 = [v35 _identifier];

        if (!v65) {
          goto LABEL_27;
        }
        v66 = (void *)MEMORY[0x1E4F1CB10];
        uint64_t v29 = [v12 _keyImage];
        v67 = [v29 _identifier];
        v68 = [v66 URLWithString:v67];
        [(_CDInteraction *)self setContentURL:v68];

LABEL_26:
LABEL_27:
        v71 = v27;
        id v72 = v10;
        id v37 = [v8 groupIdentifier];
        [(_CDInteraction *)self setDomainIdentifier:v37];

        uint64_t v38 = objc_msgSend(v12, "cd_groupName");
        [(_CDInteraction *)self setGroupName:v38];

        uint64_t v39 = objc_msgSend(v12, "cd_derivedIntentIdentifier");
        [(_CDInteraction *)self setDerivedIntentIdentifier:v39];

        uint64_t v40 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        uint64_t v41 = [v12 _className];
        unint64_t v42 = (objc_class *)objc_opt_class();
        uint64_t v43 = NSStringFromClass(v42);
        if ([v41 isEqualToString:v43] && objc_msgSend(v8, "direction") == 2)
        {
          id v44 = objc_msgSend(v12, "cd_recipients");
          uint64_t v45 = [v44 count];

          if (v45 == 1)
          {
            uint64_t v46 = [_CDContact alloc];
            uint64_t v47 = objc_msgSend(v12, "cd_sender");
            v48 = [(_CDContact *)v46 initWithINPerson:v47];
            [(_CDInteraction *)self setSender:v48];

LABEL_42:
            v54 = [v12 _className];
            v55 = (objc_class *)objc_opt_class();
            v56 = NSStringFromClass(v55);
            char v57 = [v54 isEqualToString:v56];

            id v10 = v72;
            if ((v57 & 1) == 0)
            {
              v58 = [_CDContact alloc];
              v59 = objc_msgSend(v12, "cd_sender");
              v60 = [(_CDContact *)v58 initWithINPerson:v59];
              [(_CDInteraction *)self setSender:v60];
            }
            [(_CDInteraction *)self setRecipients:v40];
            uint64_t v61 = [v8 direction];
            uint64_t v62 = 3;
            if (v61 == 1) {
              uint64_t v62 = 1;
            }
            if (v61 == 2) {
              uint64_t v63 = 0;
            }
            else {
              uint64_t v63 = v62;
            }
            [(_CDInteraction *)self setDirection:v63];
            [(_CDInteraction *)self setNsUserName:v72];
            size_t v15 = self;

            goto LABEL_50;
          }
        }
        else
        {
        }
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        uint64_t v47 = objc_msgSend(v12, "cd_recipients");
        uint64_t v49 = [v47 countByEnumeratingWithState:&v74 objects:v78 count:16];
        if (v49)
        {
          uint64_t v50 = v49;
          id v69 = v9;
          id v70 = v8;
          uint64_t v51 = *(void *)v75;
          do
          {
            for (uint64_t i = 0; i != v50; ++i)
            {
              if (*(void *)v75 != v51) {
                objc_enumerationMutation(v47);
              }
              uint64_t v53 = [[_CDContact alloc] initWithINPerson:*(void *)(*((void *)&v74 + 1) + 8 * i)];
              if (v53) {
                [v40 addObject:v53];
              }
            }
            uint64_t v50 = [v47 countByEnumeratingWithState:&v74 objects:v78 count:16];
          }
          while (v50);
          id v9 = v69;
          id v8 = v70;
        }
        goto LABEL_42;
      }
      uint64_t v32 = [v35 _uri];
    }
    int v36 = (void *)v32;
    [(_CDInteraction *)self setContentURL:v32];

    goto LABEL_26;
  }
  size_t v15 = 0;
LABEL_51:

  return v15;
}

+ (id)shareSheetInteractionFromINInteraction:(id)a3 bundleID:(id)a4 nsUserName:(id)a5 knowledgeStore:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = v12;
  id v14 = 0;
  if (v9 && v10 && v12)
  {
    size_t v15 = [v9 _contextExtensionUUID];
    uint64_t v16 = [v15 UUIDString];

    if (v16)
    {
      id v14 = [[_CDInteraction alloc] initWithINInteraction:v9 bundleID:v10 nsUserName:v11];
      [(_CDInteraction *)v14 setMechanism:13];
      [(_CDInteraction *)v14 fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:v13];
    }
    else
    {
      id v14 = 0;
    }
  }
  return v14;
}

- (void)isValidInteraction
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_18ECEB000, v1, OS_LOG_TYPE_FAULT, "Not recording %{sensitive}@ as it is not a valid interaction, error: %@", v2, 0x16u);
}

- (void)fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "No corresponding share sheet feedback for interaction %{sensitive}@", v2, v3, v4, v5, v6);
}

- (void)fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Missing sharingSourceBundleID or targetBundleID on share sheet feedback for interaction %{sensitive}@", v2, v3, v4, v5, v6);
}

- (void)fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "Failure to load soft-linked people suggester class when converting INInteraction to share sheet interaction", v1, 2u);
}

- (void)fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Error unarchiving share sheet attachments: %@", v2, v3, v4, v5, v6);
}

@end