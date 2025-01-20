@interface SGEntityTag
+ (id)allDay;
+ (id)allExtractedEventTags;
+ (id)allTags;
+ (id)appleMailMessageId:(id)a3 fromSource:(id)a4;
+ (id)author:(id)a3;
+ (id)calendarAppUsageLevel:(float)a3;
+ (id)categoryTagWithCategoryType:(int)a3;
+ (id)confidenceScore:(float)a3;
+ (id)contactDetail:(id)a3;
+ (id)containsEntityExtraction:(int64_t)a3;
+ (id)defaultDuration;
+ (id)domain:(id)a3;
+ (id)ekEventAvailabilityState:(id)a3;
+ (id)entityTagToEventCategoryMapping;
+ (id)eventCategoryToEntityTagMapping;
+ (id)eventCompleteness:(BOOL)a3;
+ (id)eventExtractedFromOldDocument;
+ (id)eventHash:(id)a3;
+ (id)eventMetadata:(id)a3;
+ (id)eventSourceMetadata:(id)a3;
+ (id)extraKey:(id)a3;
+ (id)extractedAppointment;
+ (id)extractedBoat;
+ (id)extractedBus;
+ (id)extractedCarRental;
+ (id)extractedEvent;
+ (id)extractedEventCancellation;
+ (id)extractedFlight;
+ (id)extractedFood;
+ (id)extractedFromTemplateWithName:(id)a3;
+ (id)extractedFromTemplateWithShortName:(id)a3;
+ (id)extractedHotel;
+ (id)extractedMovie;
+ (id)extractedSocial;
+ (id)extractedTicket;
+ (id)extractedTrain;
+ (id)fieldReverseMapped:(id)a3;
+ (id)fromCalendarAttachment;
+ (id)fromExtractedDomain;
+ (id)fromForwardedMessage;
+ (id)fromInteraction;
+ (id)fromReply;
+ (id)fromSync;
+ (id)fromTextMessage;
+ (id)fullyDissected;
+ (id)geocodingModeAddressOnly;
+ (id)geocodingModeAddressThenPOI;
+ (id)geocodingModeAddressWithCanonicalSearch;
+ (id)geocodingModePOIOnly;
+ (id)hardName;
+ (id)human;
+ (id)icsAttachmentData:(id)a3;
+ (id)inhuman;
+ (id)intentResponseUserActivityString:(id)a3;
+ (id)interactionBundleId:(id)a3;
+ (id)interactionContactIdentifier:(id)a3;
+ (id)interactionGroupId:(id)a3;
+ (id)interactionId:(id)a3;
+ (id)interactionTeamId:(id)a3;
+ (id)isForwardedMail:(BOOL)a3;
+ (id)isPartiallyDownloaded;
+ (id)isSent;
+ (id)mailAppUsageLevel:(unsigned __int8)a3;
+ (id)mailboxIdentifier:(id)a3;
+ (id)mailingListId:(id)a3;
+ (id)managedSourceAccount:(id)a3;
+ (id)messageWithMailMessageKey:(id)a3;
+ (id)messageWithMessageId:(id)a3 fromSource:(id)a4;
+ (id)messagesAppUsageLevel:(unsigned __int8)a3;
+ (id)naturalLanguageEvent;
+ (id)naturalLanguageEventAttributes:(unint64_t)a3;
+ (id)naturalLanguageEventLanguageID:(id)a3;
+ (id)naturalLanguageEventTypeIdentifier:(id)a3;
+ (id)participantCount:(unsigned __int8)a3;
+ (id)poiFilters:(id)a3;
+ (id)remember:(id)a3;
+ (id)reminderHash:(id)a3;
+ (id)reminderMetadata:(id)a3;
+ (id)requiresDeferredDissection;
+ (id)reservationContainerReference:(id)a3;
+ (id)reservationContainerReferenceWithData:(id)a3;
+ (id)reservationItemReferences:(id)a3;
+ (id)reservationItemReferencesWithData:(id)a3;
+ (id)resolveName:(id)a3;
+ (id)schemaOrg:(id)a3;
+ (id)significantSender;
+ (id)tagForLabel:(id)a3 value:(id)a4;
+ (id)templateException;
+ (id)testTag:(int)a3;
+ (id)textCalendarAttachment:(id)a3;
+ (id)timezoneIdentifier:(id)a3;
+ (id)titleGeneratedFromSubject;
+ (id)titleGeneratedFromTemplate;
+ (id)url:(id)a3;
+ (id)usedBubblesCount:(unsigned __int8)a3;
+ (id)walletOrderData:(id)a3;
+ (id)walletOrderDictionary:(id)a3;
+ (id)walletPassData:(id)a3;
+ (id)walletPassDictionary:(id)a3;
+ (void)initialize;
+ (void)rememberLabel:(id)a3 stored:(BOOL)a4 indexed:(BOOL)a5 tracked:(BOOL)a6;
+ (void)tombstoneLabel:(id)a3;
- (BOOL)indexed;
- (BOOL)isAppleMailMessageId;
- (BOOL)isAuthorTag;
- (BOOL)isCalendarAppUsageLevel;
- (BOOL)isConfidenceScore;
- (BOOL)isContactDetail;
- (BOOL)isDomain;
- (BOOL)isEKEventAvailabilityState;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEntityTag:(id)a3;
- (BOOL)isEventCompletenessTag;
- (BOOL)isEventHash;
- (BOOL)isEventMetadata;
- (BOOL)isEventSourceMetadata;
- (BOOL)isExtraKey;
- (BOOL)isExtractedEventCategory;
- (BOOL)isFieldReverseMapped;
- (BOOL)isForwardedMailTag;
- (BOOL)isIcsAttachmentData;
- (BOOL)isIntentResponseUserActivityString;
- (BOOL)isInteractionBundleId;
- (BOOL)isInteractionContactIdentifier;
- (BOOL)isInteractionGroupId;
- (BOOL)isInteractionId;
- (BOOL)isInteractionTeamId;
- (BOOL)isMailAppUsageLevel;
- (BOOL)isMailboxIdentifier;
- (BOOL)isMailingListId;
- (BOOL)isManagedSourceAccount;
- (BOOL)isMessagesAppUsageLevel;
- (BOOL)isNaturalLanguageEventAttributes;
- (BOOL)isNaturalLanguageEventLanguageID;
- (BOOL)isNaturalLanguageEventTypeIdentifier;
- (BOOL)isPOIFilters;
- (BOOL)isParticipantCount;
- (BOOL)isReminderHash;
- (BOOL)isReminderMetadata;
- (BOOL)isReservationContainerReference;
- (BOOL)isReservationItemReferences;
- (BOOL)isSchemaOrg;
- (BOOL)isTemplateName;
- (BOOL)isTemplateShortName;
- (BOOL)isUrl;
- (BOOL)isUsedBubblesCount;
- (BOOL)isWalletOrderData;
- (BOOL)isWalletOrderDictionary;
- (BOOL)isWalletPassData;
- (BOOL)isWalletPassDictionary;
- (BOOL)stored;
- (BOOL)tracked;
- (NSString)label;
- (NSString)value;
- (SGEntityTag)initWithLabel:(id)a3 stored:(BOOL)a4 indexed:(BOOL)a5 tracked:(BOOL)a6;
- (SGEntityTag)initWithLabel:(id)a3 value:(id)a4 stored:(BOOL)a5 indexed:(BOOL)a6 tracked:(BOOL)a7;
- (id)description;
- (id)eventMetadata;
- (id)icsAttachmentData;
- (id)isEventComplete;
- (id)isForwardedMail;
- (id)name;
- (id)reminderMetadata;
- (id)reservationContainerReference;
- (id)reservationItemReferences;
- (id)walletOrderData;
- (id)walletOrderDictionary;
- (id)walletPassData;
- (id)walletPassDictionary;
- (unint64_t)hash;
@end

@implementation SGEntityTag

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (BOOL)tracked
{
  return self->_tracked;
}

- (BOOL)stored
{
  return self->_stored;
}

- (BOOL)indexed
{
  return self->_indexed;
}

- (NSString)value
{
  return self->_value;
}

- (NSString)label
{
  return self->_label;
}

- (id)walletPassDictionary
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(SGEntityTag *)self isWalletPassDictionary])
  {
    v3 = (void *)MEMORY[0x1A6265250]();
    v4 = (void *)MEMORY[0x1E4F28D90];
    v5 = [(SGEntityTag *)self value];
    v6 = [v5 dataUsingEncoding:4];
    id v13 = 0;
    v7 = [v4 JSONObjectWithData:v6 options:0 error:&v13];
    id v8 = v13;

    if (!v7)
    {
      v9 = sgLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        *(_DWORD *)buf = 138412546;
        v15 = v12;
        __int16 v16 = 2112;
        id v17 = v8;
        _os_log_error_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_ERROR, "%@: Error encountered while creating dict for walletDictionary tag, %@", buf, 0x16u);
      }
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isWalletPassDictionary
{
  return [(NSString *)self->_label isEqual:@"WPDD"];
}

- (id)walletPassData
{
  if ([(SGEntityTag *)self isWalletPassData])
  {
    v3 = (void *)MEMORY[0x1A6265250]();
    id v4 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v5 = [(SGEntityTag *)self value];
    v6 = (void *)[v4 initWithBase64EncodedString:v5 options:0];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isWalletPassData
{
  return [(NSString *)self->_label isEqual:@"WPD"];
}

- (id)walletOrderDictionary
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(SGEntityTag *)self isWalletOrderDictionary])
  {
    v3 = (void *)MEMORY[0x1A6265250]();
    id v4 = (void *)MEMORY[0x1E4F28D90];
    v5 = [(SGEntityTag *)self value];
    v6 = [v5 dataUsingEncoding:4];
    id v13 = 0;
    v7 = [v4 JSONObjectWithData:v6 options:0 error:&v13];
    id v8 = v13;

    if (v8)
    {
      v9 = sgLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        *(_DWORD *)buf = 138412546;
        v15 = v12;
        __int16 v16 = 2112;
        id v17 = v8;
        _os_log_error_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_ERROR, "%@: Error encountered while creating dict for walletDictionary tag, %@", buf, 0x16u);
      }
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isWalletOrderDictionary
{
  return [(NSString *)self->_label isEqual:@"WODD"];
}

- (id)walletOrderData
{
  if ([(SGEntityTag *)self isWalletOrderData])
  {
    v3 = (void *)MEMORY[0x1A6265250]();
    id v4 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v5 = [(SGEntityTag *)self value];
    v6 = (void *)[v4 initWithBase64EncodedString:v5 options:0];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isWalletOrderData
{
  return [(NSString *)self->_label isEqual:@"WOD"];
}

- (id)icsAttachmentData
{
  if ([(SGEntityTag *)self isIcsAttachmentData])
  {
    v3 = (void *)MEMORY[0x1A6265250]();
    id v4 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v5 = [(SGEntityTag *)self value];
    v6 = (void *)[v4 initWithBase64EncodedString:v5 options:0];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isIcsAttachmentData
{
  return [(NSString *)self->_label isEqual:@"ICSD"];
}

- (BOOL)isManagedSourceAccount
{
  return [(NSString *)self->_label isEqual:@"ICSM"];
}

- (id)reservationContainerReference
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![(SGEntityTag *)self isReservationContainerReference])
  {
    v6 = 0;
    goto LABEL_20;
  }
  v3 = (void *)MEMORY[0x1A6265250]();
  id v4 = [(SGEntityTag *)self value];
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v4 options:0];
    if (v5)
    {
      id v12 = 0;
      v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v12];
      id v7 = v12;
      if (v7)
      {
        id v8 = sgLogHandle();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v14 = v7;
          _os_log_error_impl(&dword_1A4D8C000, v8, OS_LOG_TYPE_ERROR, "SGEntityTag Error decoding reservation container reference: %@", buf, 0xCu);
        }
      }
      goto LABEL_18;
    }
    v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1A4D8C000, v10, OS_LOG_TYPE_FAULT, "serialized reservation container reference value should not be nil", buf, 2u);
    }

    if (!_PASEvaluateLogFaultAndProbCrashCriteria())
    {
      v6 = 0;
LABEL_18:

      goto LABEL_19;
    }
LABEL_23:
    abort();
  }
  v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_FAULT, "reservation container reference value should not be nil", buf, 2u);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
    goto LABEL_23;
  }
  v6 = 0;
LABEL_19:

LABEL_20:

  return v6;
}

- (id)reservationItemReferences
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (![(SGEntityTag *)self isReservationItemReferences])
  {
    v10 = 0;
    goto LABEL_20;
  }
  v3 = (void *)MEMORY[0x1A6265250]();
  id v4 = [(SGEntityTag *)self value];
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v4 options:0];
    v6 = (void *)MEMORY[0x1A6265250]();
    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    if (v5)
    {
      id v16 = 0;
      v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v9 fromData:v5 error:&v16];
      id v11 = v16;
      if (v11)
      {
        id v12 = sgLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v11;
          _os_log_error_impl(&dword_1A4D8C000, v12, OS_LOG_TYPE_ERROR, "SGEntityTag Error decoding reservation item references: %@", buf, 0xCu);
        }
      }
      goto LABEL_18;
    }
    id v14 = sgLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1A4D8C000, v14, OS_LOG_TYPE_FAULT, "serialized reservation item reference value should not be nil", buf, 2u);
    }

    if (!_PASEvaluateLogFaultAndProbCrashCriteria())
    {
      v10 = 0;
LABEL_18:

      goto LABEL_19;
    }
LABEL_23:
    abort();
  }
  id v13 = sgLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1A4D8C000, v13, OS_LOG_TYPE_FAULT, "reservation item reference value should not be nil", buf, 2u);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
    goto LABEL_23;
  }
  v10 = 0;
LABEL_19:

LABEL_20:

  return v10;
}

- (id)reminderMetadata
{
  if ([(SGEntityTag *)self isReminderMetadata])
  {
    v3 = (void *)MEMORY[0x1A6265250]();
    id v4 = (void *)MEMORY[0x1E4F28D90];
    v5 = [(SGEntityTag *)self value];
    v6 = [v5 dataUsingEncoding:4];
    id v10 = 0;
    id v7 = [v4 JSONObjectWithData:v6 options:0 error:&v10];
    id v8 = v10;

    if (v8)
    {

      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)isReminderMetadata
{
  return [(NSString *)self->_label isEqual:@"REM"];
}

- (BOOL)isAuthorTag
{
  return [(NSString *)self->_label isEqualToString:@"ATHR"];
}

- (BOOL)isEventCompletenessTag
{
  return [(NSString *)self->_label isEqualToString:@"EVNTC"];
}

- (id)isEventComplete
{
  v3 = &unk_1EF92F670;
  if ([(SGEntityTag *)self isEventCompletenessTag]
    && [(NSString *)self->_value isEqualToString:@"1"])
  {
    return &unk_1EF92F658;
  }
  return v3;
}

- (BOOL)isForwardedMailTag
{
  return [(NSString *)self->_label isEqualToString:@"FWDM"];
}

- (id)isForwardedMail
{
  v3 = &unk_1EF92F670;
  if ([(SGEntityTag *)self isForwardedMailTag]
    && [(NSString *)self->_value isEqualToString:@"1"])
  {
    return &unk_1EF92F658;
  }
  return v3;
}

- (BOOL)isEventSourceMetadata
{
  return [(NSString *)self->_label isEqual:@"ESM"];
}

- (BOOL)isExtractedEventCategory
{
  return [(id)extractedEventCategoryTags containsObject:self];
}

- (BOOL)isEKEventAvailabilityState
{
  return [(NSString *)self->_label isEqual:@"EKEA"];
}

- (BOOL)isPOIFilters
{
  return [(NSString *)self->_label isEqual:@"POIF"];
}

- (BOOL)isReminderHash
{
  return [(NSString *)self->_label isEqual:@"RHSH"];
}

- (BOOL)isEventHash
{
  return [(NSString *)self->_label isEqual:@"EHSH"];
}

- (BOOL)isDomain
{
  return [(NSString *)self->_label isEqual:@"DOM"];
}

- (BOOL)isFieldReverseMapped
{
  return [(NSString *)self->_label isEqual:@"RMF"];
}

- (BOOL)isTemplateName
{
  return [(NSString *)self->_label isEqual:@"TMPN"];
}

- (BOOL)isTemplateShortName
{
  return [(NSString *)self->_label isEqual:@"TMPL"];
}

- (BOOL)isMailboxIdentifier
{
  return [(NSString *)self->_label isEqual:@"MBOX"];
}

- (BOOL)isAppleMailMessageId
{
  return [(NSString *)self->_label isEqual:@"AMSG"];
}

- (id)eventMetadata
{
  if ([(SGEntityTag *)self isEventMetadata])
  {
    v3 = (void *)MEMORY[0x1A6265250]();
    id v4 = (void *)MEMORY[0x1E4F28D90];
    v5 = [(SGEntityTag *)self value];
    v6 = [v5 dataUsingEncoding:4];
    id v10 = 0;
    id v7 = [v4 JSONObjectWithData:v6 options:0 error:&v10];
    id v8 = v10;

    if (v8)
    {

      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)isEventMetadata
{
  return [(NSString *)self->_label isEqual:@"EM"];
}

- (BOOL)isReservationItemReferences
{
  return [(NSString *)self->_label isEqual:@"IRIR"];
}

- (BOOL)isReservationContainerReference
{
  return [(NSString *)self->_label isEqual:@"IRCR"];
}

- (BOOL)isSchemaOrg
{
  return [(NSString *)self->_label isEqual:@"SO"];
}

- (BOOL)isMessagesAppUsageLevel
{
  return [(NSString *)self->_label isEqual:@"MEUL"];
}

- (BOOL)isMailAppUsageLevel
{
  return [(NSString *)self->_label isEqual:@"MAUL"];
}

- (BOOL)isCalendarAppUsageLevel
{
  return [(NSString *)self->_label isEqual:@"CAUL"];
}

- (BOOL)isUsedBubblesCount
{
  return [(NSString *)self->_label isEqual:@"NLBC"];
}

- (BOOL)isParticipantCount
{
  return [(NSString *)self->_label isEqual:@"NLPC"];
}

- (BOOL)isConfidenceScore
{
  return [(NSString *)self->_label isEqual:@"NLCS"];
}

- (BOOL)isNaturalLanguageEventLanguageID
{
  return [(NSString *)self->_label isEqual:@"NLLI"];
}

- (BOOL)isNaturalLanguageEventAttributes
{
  return [(NSString *)self->_label isEqual:@"NLEA"];
}

- (BOOL)isNaturalLanguageEventTypeIdentifier
{
  return [(NSString *)self->_label isEqual:@"NLET"];
}

- (BOOL)isExtraKey
{
  return [(NSString *)self->_label isEqual:@"EX"];
}

- (BOOL)isInteractionContactIdentifier
{
  return [(NSString *)self->_label isEqual:@"ICN"];
}

- (BOOL)isContactDetail
{
  return [(NSString *)self->_label isEqual:@"CD"];
}

- (BOOL)isMailingListId
{
  return [(NSString *)self->_label isEqual:@"L"];
}

- (BOOL)isUrl
{
  return [(NSString *)self->_label isEqual:@"U"];
}

- (BOOL)isIntentResponseUserActivityString
{
  return [(NSString *)self->_label isEqual:@"IRUA"];
}

- (BOOL)isInteractionTeamId
{
  return [(NSString *)self->_label isEqual:@"ITID"];
}

- (BOOL)isInteractionBundleId
{
  return [(NSString *)self->_label isEqual:@"IBID"];
}

- (BOOL)isInteractionGroupId
{
  return [(NSString *)self->_label isEqual:@"IGID"];
}

- (BOOL)isInteractionId
{
  return [(NSString *)self->_label isEqual:@"IUID"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1A6265250](self, a2);
  id v4 = [NSString alloc];
  v5 = [(SGEntityTag *)self name];
  v6 = (void *)[v4 initWithFormat:@"SGEntityTag<%@>", v5];

  return v6;
}

- (id)name
{
  if (self->_value)
  {
    v3 = (void *)MEMORY[0x1A6265250]();
    id v4 = (NSString *)[[NSString alloc] initWithFormat:@"%@:%@", self->_label, self->_value];
  }
  else
  {
    id v4 = self->_label;
  }

  return v4;
}

- (BOOL)isEqualToEntityTag:(id)a3
{
  id v4 = (id *)a3;
  label = self->_label;
  v6 = (NSString *)v4[2];
  if (label == v6)
  {
  }
  else
  {
    id v7 = v6;
    id v8 = label;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      char v10 = 0;
      goto LABEL_9;
    }
  }
  id v11 = self->_value;
  id v12 = v11;
  if (v11 == v4[3]) {
    char v10 = 1;
  }
  else {
    char v10 = -[NSString isEqual:](v11, "isEqual:");
  }

LABEL_9:
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SGEntityTag *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGEntityTag *)self isEqualToEntityTag:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_label hash];
  return [(NSString *)self->_value hash] - v3 + 32 * v3;
}

- (SGEntityTag)initWithLabel:(id)a3 value:(id)a4 stored:(BOOL)a5 indexed:(BOOL)a6 tracked:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  if (!v13)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SGEntityTag.m", 76, @"Invalid parameter not satisfying: %@", @"label" object file lineNumber description];
  }
  if ([v13 containsString:@":"])
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SGEntityTag.m", 77, @"Invalid parameter not satisfying: %@", @"![label containsString:@\":\"]" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)SGEntityTag;
  uint64_t v15 = [(SGEntityTag *)&v23 init];
  if (v15)
  {
    uint64_t v16 = [v13 copy];
    label = v15->_label;
    v15->_label = (NSString *)v16;

    uint64_t v18 = [v14 copy];
    value = v15->_value;
    v15->_value = (NSString *)v18;

    v15->_stored = a5;
    v15->_indexed = a6;
    v15->_tracked = a7;
  }

  return v15;
}

- (SGEntityTag)initWithLabel:(id)a3 stored:(BOOL)a4 indexed:(BOOL)a5 tracked:(BOOL)a6
{
  return [(SGEntityTag *)self initWithLabel:a3 value:0 stored:a4 indexed:a5 tracked:a6];
}

+ (id)walletPassDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (!v3 || ![v3 count]) {
    goto LABEL_9;
  }
  v5 = (void *)MEMORY[0x1A6265250]();
  if (([MEMORY[0x1E4F28D90] isValidJSONObject:v4] & 1) == 0)
  {
    char v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138739971;
      v20 = v4;
      _os_log_error_impl(&dword_1A4D8C000, v10, OS_LOG_TYPE_ERROR, "Cannot serialize pass dictionary: %{sensitive}@", buf, 0xCu);
    }

    goto LABEL_15;
  }
  id v18 = 0;
  BOOL v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:0 error:&v18];
  id v7 = v18;
  if (v7)
  {
    id v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138412546;
      v20 = v17;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_error_impl(&dword_1A4D8C000, v8, OS_LOG_TYPE_ERROR, "%@: Error encountered while creating tag for walletPassDictionary, %@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  if (!v6)
  {
LABEL_8:

LABEL_9:
    char v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138412290;
      v20 = v15;
      _os_log_debug_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEBUG, "%@: Couldnt create a entity tag from walletPassDictionary", buf, 0xCu);
    }
LABEL_15:
    id v11 = 0;
    goto LABEL_16;
  }
  id v13 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
  id v11 = +[SGEntityTag tagForLabel:@"WPDD" value:v13];

LABEL_16:

  return v11;
}

+ (id)walletPassData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1A6265250]();
    v5 = (void *)MEMORY[0x1A6265250]();
    BOOL v6 = [v3 base64EncodedStringWithOptions:0];
    if (v6)
    {
      id v7 = +[SGEntityTag tagForLabel:@"WPD" value:v6];

      goto LABEL_8;
    }
    id v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      char v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      int v12 = 138412290;
      id v13 = v11;
      _os_log_error_impl(&dword_1A4D8C000, v8, OS_LOG_TYPE_ERROR, "%@: Error encountered while creating tag for walletPassData", (uint8_t *)&v12, 0xCu);
    }
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

+ (id)walletOrderDictionary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    v5 = (void *)MEMORY[0x1A6265250]();
    id v13 = 0;
    BOOL v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:0 error:&v13];
    id v7 = v13;
    if (v6)
    {
      id v8 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
      char v9 = +[SGEntityTag tagForLabel:@"WODD" value:v8];
    }
    else
    {
      BOOL v6 = sgLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v11 = (objc_class *)objc_opt_class();
        int v12 = NSStringFromClass(v11);
        *(_DWORD *)buf = 138412546;
        uint64_t v15 = v12;
        __int16 v16 = 2112;
        id v17 = v7;
        _os_log_error_impl(&dword_1A4D8C000, v6, OS_LOG_TYPE_ERROR, "%@: Error encountered while creating tag for walletOrderDictionary, %@", buf, 0x16u);
      }
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (id)walletOrderData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1A6265250]();
    v5 = (void *)MEMORY[0x1A6265250]();
    BOOL v6 = [v3 base64EncodedStringWithOptions:0];
    if (v6)
    {
      id v7 = +[SGEntityTag tagForLabel:@"WOD" value:v6];

      goto LABEL_8;
    }
    id v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      char v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      int v12 = 138412290;
      id v13 = v11;
      _os_log_error_impl(&dword_1A4D8C000, v8, OS_LOG_TYPE_ERROR, "%@: Error encountered while creating tag for walletOrderData", (uint8_t *)&v12, 0xCu);
    }
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

+ (id)icsAttachmentData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1A6265250]();
    v5 = (void *)MEMORY[0x1A6265250]();
    BOOL v6 = [v3 base64EncodedStringWithOptions:0];
    if (v6)
    {
      id v7 = +[SGEntityTag tagForLabel:@"ICSD" value:v6];

      goto LABEL_8;
    }
    id v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      char v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      int v12 = 138412290;
      id v13 = v11;
      _os_log_error_impl(&dword_1A4D8C000, v8, OS_LOG_TYPE_ERROR, "%@: Error encountered while creating tag for ics attachment data", (uint8_t *)&v12, 0xCu);
    }
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

+ (id)managedSourceAccount:(id)a3
{
  return +[SGEntityTag tagForLabel:@"ICSM" value:a3];
}

+ (id)reminderMetadata:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    v5 = (void *)MEMORY[0x1A6265250]();
    uint64_t v11 = 0;
    uint64_t v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:0 error:&v11];
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
      char v9 = +[SGEntityTag tagForLabel:@"REM" value:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (id)author:(id)a3
{
  uint64_t v7 = 0;
  id v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:1 error:&v7];
  if (v3)
  {
    id v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
    v5 = +[SGEntityTag tagForLabel:@"ATHR" value:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)eventCompleteness:(BOOL)a3
{
  if (a3) {
    id v3 = @"1";
  }
  else {
    id v3 = @"0";
  }
  id v4 = +[SGEntityTag tagForLabel:@"EVNTC" value:v3];

  return v4;
}

+ (id)isForwardedMail:(BOOL)a3
{
  if (a3) {
    id v3 = @"1";
  }
  else {
    id v3 = @"0";
  }
  id v4 = +[SGEntityTag tagForLabel:@"FWDM" value:v3];

  return v4;
}

+ (id)eventSourceMetadata:(id)a3
{
  return +[SGEntityTag tagForLabel:@"ESM" value:a3];
}

+ (id)testTag:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [(id)byLabel objectForKeyedSubscript:@"TEST"];

  if (!v5)
  {
    uint64_t v6 = [[SGEntityTag alloc] initWithLabel:@"TEST" stored:1 indexed:1 tracked:1];
    id v7 = (id)[a1 remember:v6];
  }
  id v8 = [SGEntityTag alloc];
  char v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d", v3);
  char v10 = [(SGEntityTag *)v8 initWithLabel:@"TEST" value:v9 stored:1 indexed:1 tracked:1];

  return v10;
}

+ (id)allTags
{
  v2 = (void *)[(id)extractedEventCategoryTags copy];

  return v2;
}

+ (id)ekEventAvailabilityState:(id)a3
{
  return +[SGEntityTag tagForLabel:@"EKEA" value:a3];
}

+ (id)poiFilters:(id)a3
{
  return +[SGEntityTag tagForLabel:@"POIF" value:a3];
}

+ (id)reminderHash:(id)a3
{
  return +[SGEntityTag tagForLabel:@"RHSH" value:a3];
}

+ (id)eventHash:(id)a3
{
  return +[SGEntityTag tagForLabel:@"EHSH" value:a3];
}

+ (id)domain:(id)a3
{
  return +[SGEntityTag tagForLabel:@"DOM" value:a3];
}

+ (id)fieldReverseMapped:(id)a3
{
  return +[SGEntityTag tagForLabel:@"RMF" value:a3];
}

+ (id)extractedFromTemplateWithName:(id)a3
{
  return +[SGEntityTag tagForLabel:@"TMPN" value:a3];
}

+ (id)extractedFromTemplateWithShortName:(id)a3
{
  return +[SGEntityTag tagForLabel:@"TMPL" value:a3];
}

+ (id)messageWithMailMessageKey:(id)a3
{
  id v4 = a3;
  v5 = [v4 messageId];
  uint64_t v6 = [v4 source];

  id v7 = [a1 messageWithMessageId:v5 fromSource:v6];

  return v7;
}

+ (id)mailboxIdentifier:(id)a3
{
  return +[SGEntityTag tagForLabel:@"MBOX" value:a3];
}

+ (id)appleMailMessageId:(id)a3 fromSource:(id)a4
{
  id v8 = SGDelimitedStringsSerialize(a4, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)a3);
  char v9 = +[SGEntityTag tagForLabel:@"AMSG" value:v8];

  return v9;
}

+ (id)messageWithMessageId:(id)a3 fromSource:(id)a4
{
  id v8 = SGDelimitedStringsSerialize(a4, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)a3);
  char v9 = +[SGEntityTag tagForLabel:@"MSG" value:v8];

  return v9;
}

+ (id)containsEntityExtraction:(int64_t)a3
{
  uint64_t v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", a3);
  uint64_t v4 = +[SGEntityTag tagForLabel:@"ET" value:v3];

  return v4;
}

+ (id)extraKey:(id)a3
{
  return +[SGEntityTag tagForLabel:@"EX" value:a3];
}

+ (id)interactionContactIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"SGEntityTag.m", 758, @"Invalid parameter not satisfying: %@", @"contactIdentifier" object file lineNumber description];
  }
  uint64_t v6 = +[SGEntityTag tagForLabel:@"ICN" value:v5];

  return v6;
}

+ (id)contactDetail:(id)a3
{
  return +[SGEntityTag tagForLabel:@"CD" value:a3];
}

+ (id)mailingListId:(id)a3
{
  return +[SGEntityTag tagForLabel:@"L" value:a3];
}

+ (id)url:(id)a3
{
  uint64_t v3 = [a3 absoluteString];
  uint64_t v4 = +[SGEntityTag tagForLabel:@"U" value:v3];

  return v4;
}

+ (id)tagForLabel:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  char v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"SGEntityTag.m", 718, @"Invalid parameter not satisfying: %@", @"label" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, a1, @"SGEntityTag.m", 719, @"Invalid parameter not satisfying: %@", @"value" object file lineNumber description];

LABEL_3:
  char v10 = [(id)optionsByLabel objectForKeyedSubscript:v7];
  if (!v10)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"SGEntityTag.m", 721, @"Invalid parameter not satisfying: %@", @"opts" object file lineNumber description];
  }
  uint64_t v11 = [[SGEntityTag alloc] initWithLabel:v7 value:v9 stored:v10[8] indexed:v10[9] tracked:v10[10]];

  return v11;
}

+ (id)eventExtractedFromOldDocument
{
  return (id)eventExtractedFromOldDocument;
}

+ (id)fullyDissected
{
  return (id)fullyDissected;
}

+ (id)requiresDeferredDissection
{
  return (id)requiresDeferredDissection;
}

+ (id)isPartiallyDownloaded
{
  return (id)isPartiallyDownloaded;
}

+ (id)fromReply
{
  return (id)fromReply;
}

+ (id)fromForwardedMessage
{
  return (id)fromForwardedMessage;
}

+ (id)defaultDuration
{
  return (id)defaultDuration;
}

+ (id)templateException
{
  return (id)templateException;
}

+ (id)titleGeneratedFromSubject
{
  return (id)titleGeneratedFromSubject;
}

+ (id)titleGeneratedFromTemplate
{
  return (id)titleGeneratedFromTemplate;
}

+ (id)significantSender
{
  return (id)significantSender;
}

+ (id)isSent
{
  return (id)isSent;
}

+ (id)fromSync
{
  return (id)fromSync;
}

+ (id)fromTextMessage
{
  return (id)fromTextMessage;
}

+ (id)eventMetadata:(id)a3
{
  return +[SGEntityTag tagForLabel:@"EM" value:a3];
}

+ (id)intentResponseUserActivityString:(id)a3
{
  return +[SGEntityTag tagForLabel:@"IRUA" value:a3];
}

+ (id)reservationItemReferences:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1A6265250]();
  id v9 = 0;
  id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v9];
  id v6 = v9;
  if (v5)
  {
    id v7 = +[SGEntityTag reservationItemReferencesWithData:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)reservationItemReferencesWithData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1A6265250]();
  id v5 = [v3 base64EncodedStringWithOptions:0];
  id v6 = +[SGEntityTag tagForLabel:@"IRIR" value:v5];

  return v6;
}

+ (id)reservationContainerReference:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1A6265250]();
  id v9 = 0;
  id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v9];
  id v6 = v9;
  if (v5)
  {
    id v7 = +[SGEntityTag reservationContainerReferenceWithData:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)reservationContainerReferenceWithData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1A6265250]();
  id v5 = [v3 base64EncodedStringWithOptions:0];
  id v6 = +[SGEntityTag tagForLabel:@"IRCR" value:v5];

  return v6;
}

+ (id)schemaOrg:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = (void *)MEMORY[0x1A6265250]();
    uint64_t v11 = 0;
    uint64_t v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:0 error:&v11];
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
      id v9 = +[SGEntityTag tagForLabel:@"SO" value:v8];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)messagesAppUsageLevel:(unsigned __int8)a3
{
  id v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%hhu", a3);
  uint64_t v4 = +[SGEntityTag tagForLabel:@"MEUL" value:v3];

  return v4;
}

+ (id)mailAppUsageLevel:(unsigned __int8)a3
{
  id v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%hhu", a3);
  uint64_t v4 = +[SGEntityTag tagForLabel:@"MAUL" value:v3];

  return v4;
}

+ (id)calendarAppUsageLevel:(float)a3
{
  id v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%f", a3);
  uint64_t v4 = +[SGEntityTag tagForLabel:@"CAUL" value:v3];

  return v4;
}

+ (id)usedBubblesCount:(unsigned __int8)a3
{
  id v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%hhu", a3);
  uint64_t v4 = +[SGEntityTag tagForLabel:@"NLBC" value:v3];

  return v4;
}

+ (id)participantCount:(unsigned __int8)a3
{
  id v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%hhu", a3);
  uint64_t v4 = +[SGEntityTag tagForLabel:@"NLPC" value:v3];

  return v4;
}

+ (id)confidenceScore:(float)a3
{
  id v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%f", a3);
  uint64_t v4 = +[SGEntityTag tagForLabel:@"NLCS" value:v3];

  return v4;
}

+ (id)naturalLanguageEventAttributes:(unint64_t)a3
{
  id v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lu", a3);
  uint64_t v4 = +[SGEntityTag tagForLabel:@"NLEA" value:v3];

  return v4;
}

+ (id)naturalLanguageEventLanguageID:(id)a3
{
  return +[SGEntityTag tagForLabel:@"NLLI" value:a3];
}

+ (id)naturalLanguageEventTypeIdentifier:(id)a3
{
  return +[SGEntityTag tagForLabel:@"NLET" value:a3];
}

+ (id)interactionTeamId:(id)a3
{
  return +[SGEntityTag tagForLabel:@"ITID" value:a3];
}

+ (id)interactionBundleId:(id)a3
{
  return +[SGEntityTag tagForLabel:@"IBID" value:a3];
}

+ (id)interactionGroupId:(id)a3
{
  return +[SGEntityTag tagForLabel:@"IGID" value:a3];
}

+ (id)interactionId:(id)a3
{
  return +[SGEntityTag tagForLabel:@"IUID" value:a3];
}

+ (id)fromInteraction
{
  return (id)fromInteraction;
}

+ (id)timezoneIdentifier:(id)a3
{
  return +[SGEntityTag tagForLabel:@"TZID" value:a3];
}

+ (id)textCalendarAttachment:(id)a3
{
  return +[SGEntityTag tagForLabel:@"ICST" value:a3];
}

+ (id)fromCalendarAttachment
{
  return (id)fromCalendarAttachment;
}

+ (id)naturalLanguageEvent
{
  return (id)naturalLanguageEvent;
}

+ (id)hardName
{
  return (id)hardName;
}

+ (id)human
{
  return (id)human;
}

+ (id)inhuman
{
  return (id)inhuman;
}

+ (id)allDay
{
  return (id)allDay;
}

+ (id)extractedEventCancellation
{
  return (id)cancelled;
}

+ (id)fromExtractedDomain
{
  return (id)fromExtractedDomain;
}

+ (id)geocodingModeAddressWithCanonicalSearch
{
  return (id)geocodingModeAddressWithCanonicalSearch;
}

+ (id)geocodingModeAddressThenPOI
{
  return (id)geocodingModeAddressThenPOI;
}

+ (id)geocodingModePOIOnly
{
  return (id)geocodingModePOIOnly;
}

+ (id)geocodingModeAddressOnly
{
  return (id)geocodingModeAddressOnly;
}

+ (id)allExtractedEventTags
{
  id v3 = (void *)MEMORY[0x1A6265250](a1, a2);
  uint64_t v4 = [a1 eventCategoryToEntityTagMapping];
  id v5 = [v4 allValues];

  return v5;
}

+ (id)entityTagToEventCategoryMapping
{
  id v3 = (void *)MEMORY[0x1A6265250](a1, a2);
  uint64_t v4 = [a1 eventCategoryToEntityTagMapping];
  id v5 = [v4 allKeys];
  id v6 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__SGEntityTag_entityTagToEventCategoryMapping__block_invoke;
  v11[3] = &unk_1E5B8E0A8;
  id v12 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", v11);
  id v9 = (void *)[v6 initWithObjects:v5 forKeys:v8];

  return v9;
}

uint64_t __46__SGEntityTag_entityTagToEventCategoryMapping__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

+ (id)eventCategoryToEntityTagMapping
{
  id v3 = objc_opt_new();
  uint64_t v4 = 1;
  do
  {
    id v5 = (void *)MEMORY[0x1A6265250]();
    id v6 = [a1 categoryTagWithCategoryType:v4];
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 label];
      if ([v8 rangeOfString:@"^ex[A-Z][a-zA-Z]*$" options:1026] == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2, a1, @"SGEntityTag.m", 395, @"expected exSomething, got %@ for tag %@", v8, v7 object file lineNumber description];
      }
      id v9 = [v7 label];
      char v10 = [v9 substringFromIndex:objc_msgSend(@"ex", "length")];

      [v3 setObject:v7 forKeyedSubscript:v10];
    }

    uint64_t v4 = (v4 + 1);
  }
  while (v4 != 12);

  return v3;
}

+ (id)categoryTagWithCategoryType:(int)a3
{
  switch(a3)
  {
    case 1:
      id v5 = +[SGEntityTag extractedFlight];
      goto LABEL_16;
    case 2:
      id v5 = +[SGEntityTag extractedBus];
      goto LABEL_16;
    case 3:
      id v5 = +[SGEntityTag extractedTrain];
      goto LABEL_16;
    case 4:
      id v5 = +[SGEntityTag extractedHotel];
      goto LABEL_16;
    case 5:
      id v5 = +[SGEntityTag extractedCarRental];
      goto LABEL_16;
    case 6:
      id v5 = +[SGEntityTag extractedTicket];
      goto LABEL_16;
    case 7:
      id v5 = +[SGEntityTag extractedMovie];
      goto LABEL_16;
    case 8:
      id v5 = +[SGEntityTag extractedFood];
      goto LABEL_16;
    case 9:
      id v5 = +[SGEntityTag extractedSocial];
      goto LABEL_16;
    case 10:
      id v5 = +[SGEntityTag extractedBoat];
      goto LABEL_16;
    case 11:
      id v5 = +[SGEntityTag extractedAppointment];
LABEL_16:
      break;
    default:
      id v5 = 0;
      break;
  }
  return v5;
}

+ (id)extractedAppointment
{
  return (id)extractedAppointment;
}

+ (id)extractedBoat
{
  return (id)extractedBoat;
}

+ (id)extractedSocial
{
  return (id)extractedSocial;
}

+ (id)extractedFood
{
  return (id)extractedFood;
}

+ (id)extractedMovie
{
  return (id)extractedMovie;
}

+ (id)extractedTicket
{
  return (id)extractedTicket;
}

+ (id)extractedCarRental
{
  return (id)extractedCarRental;
}

+ (id)extractedHotel
{
  return (id)extractedHotel;
}

+ (id)extractedTrain
{
  return (id)extractedTrain;
}

+ (id)extractedBus
{
  return (id)extractedBus;
}

+ (id)extractedFlight
{
  return (id)extractedFlight;
}

+ (id)extractedEvent
{
  return (id)extracted;
}

+ (id)resolveName:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (__CFString *)a3;
  CStringPtr = (char *)CFStringGetCStringPtr(v3, 0x600u);
  if (CStringPtr)
  {
    id v5 = (const UInt8 *)CStringPtr;
    id v6 = memchr(CStringPtr, 58, [(__CFString *)v3 length]);
    if (!v6)
    {

      goto LABEL_12;
    }
    id v7 = (__CFString *)CFStringCreateWithBytesNoCopy(0, v5, v6 - v5, 0x600u, 0, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  }
  else
  {
    id v8 = (void *)MEMORY[0x1A6265250]();
    uint64_t v9 = [(__CFString *)v3 rangeOfString:@":" options:2];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = 0;
    }
    else
    {
      id v7 = [(__CFString *)v3 substringToIndex:v9];
    }
  }

  if (v7)
  {
    char v10 = [(id)byLabel objectForKeyedSubscript:v7];
    if (v10)
    {
      uint64_t v11 = [SGEntityTag alloc];
      id v12 = [v10 label];
      goto LABEL_20;
    }
    if ([(id)tombstonedLabels containsObject:v7])
    {
      uint64_t v11 = [SGEntityTag alloc];
      id v12 = v7;
LABEL_20:
      uint64_t v15 = (void *)MEMORY[0x1A6265250]();
      __int16 v16 = [(__CFString *)v3 substringFromIndex:[(__CFString *)v7 length] + 1];
      id v13 = -[SGEntityTag initWithLabel:value:stored:indexed:tracked:](v11, "initWithLabel:value:stored:indexed:tracked:", v12, v16, [v10 stored], objc_msgSend(v10, "indexed"), objc_msgSend(v10, "tracked"));

      if (v10) {
      goto LABEL_26;
      }
    }
    id v17 = sgLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      int v19 = 138412290;
      v20 = v7;
      _os_log_fault_impl(&dword_1A4D8C000, v17, OS_LOG_TYPE_FAULT, "Unable to resolve tag label: %@", (uint8_t *)&v19, 0xCu);
    }

    if (!_PASEvaluateLogFaultAndProbCrashCriteria())
    {
      id v13 = 0;
LABEL_26:

      goto LABEL_27;
    }
LABEL_30:
    abort();
  }
LABEL_12:
  id v13 = [(id)byLabel objectForKeyedSubscript:v3];
  if (!v13 && ([(id)tombstonedLabels containsObject:0] & 1) == 0)
  {
    uint64_t v14 = sgLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      int v19 = 138412290;
      v20 = v3;
      _os_log_fault_impl(&dword_1A4D8C000, v14, OS_LOG_TYPE_FAULT, "Unable to resolve tag name: %@", (uint8_t *)&v19, 0xCu);
    }

    if (!_PASEvaluateLogFaultAndProbCrashCriteria())
    {
      id v13 = 0;
      goto LABEL_27;
    }
    goto LABEL_30;
  }
LABEL_27:

  return v13;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = (void *)yyyymmdd;
    yyyymmdd = v3;

    [(id)yyyymmdd setDateFormat:@"yyyyMMdd"];
    uint64_t v5 = objc_opt_new();
    id v6 = (void *)byLabel;
    byLabel = v5;

    id v7 = [[SGEntityTag alloc] initWithLabel:@"ex" stored:1 indexed:0 tracked:0];
    uint64_t v8 = [a1 remember:v7];
    uint64_t v9 = (void *)extracted;
    extracted = v8;

    char v10 = [[SGEntityTag alloc] initWithLabel:@"cancel" stored:1 indexed:0 tracked:0];
    uint64_t v11 = [a1 remember:v10];
    id v12 = (void *)cancelled;
    cancelled = v11;

    id v13 = [[SGEntityTag alloc] initWithLabel:@"fromEx" stored:1 indexed:0 tracked:0];
    uint64_t v14 = [a1 remember:v13];
    uint64_t v15 = (void *)fromExtractedDomain;
    fromExtractedDomain = v14;

    __int16 v16 = [[SGEntityTag alloc] initWithLabel:@"allDay" stored:1 indexed:0 tracked:0];
    uint64_t v17 = [a1 remember:v16];
    uint64_t v18 = (void *)allDay;
    allDay = v17;

    int v19 = [[SGEntityTag alloc] initWithLabel:@"inhuman" stored:1 indexed:1 tracked:0];
    uint64_t v20 = [a1 remember:v19];
    uint64_t v21 = (void *)inhuman;
    inhuman = v20;

    id v22 = [[SGEntityTag alloc] initWithLabel:@"human" stored:1 indexed:0 tracked:0];
    uint64_t v23 = [a1 remember:v22];
    v24 = (void *)human;
    human = v23;

    v25 = [[SGEntityTag alloc] initWithLabel:@"defaultDuration" stored:1 indexed:0 tracked:0];
    uint64_t v26 = [a1 remember:v25];
    v27 = (void *)defaultDuration;
    defaultDuration = v26;

    v28 = [[SGEntityTag alloc] initWithLabel:@"fwd" stored:1 indexed:0 tracked:0];
    uint64_t v29 = [a1 remember:v28];
    v30 = (void *)fromForwardedMessage;
    fromForwardedMessage = v29;

    v31 = [[SGEntityTag alloc] initWithLabel:@"re" stored:1 indexed:0 tracked:0];
    uint64_t v32 = [a1 remember:v31];
    v33 = (void *)fromReply;
    fromReply = v32;

    v34 = [[SGEntityTag alloc] initWithLabel:@"nl" stored:1 indexed:0 tracked:1];
    uint64_t v35 = [a1 remember:v34];
    v36 = (void *)naturalLanguageEvent;
    naturalLanguageEvent = v35;

    v37 = [[SGEntityTag alloc] initWithLabel:@"ics" stored:1 indexed:0 tracked:1];
    uint64_t v38 = [a1 remember:v37];
    v39 = (void *)fromCalendarAttachment;
    fromCalendarAttachment = v38;

    v40 = [[SGEntityTag alloc] initWithLabel:@"partial" stored:1 indexed:0 tracked:0];
    uint64_t v41 = [a1 remember:v40];
    v42 = (void *)isPartiallyDownloaded;
    isPartiallyDownloaded = v41;

    v43 = [[SGEntityTag alloc] initWithLabel:@"exFlight" stored:1 indexed:0 tracked:1];
    uint64_t v44 = [a1 remember:v43];
    v45 = (void *)extractedFlight;
    extractedFlight = v44;

    v46 = [[SGEntityTag alloc] initWithLabel:@"exBus" stored:1 indexed:0 tracked:1];
    uint64_t v47 = [a1 remember:v46];
    v48 = (void *)extractedBus;
    extractedBus = v47;

    v49 = [[SGEntityTag alloc] initWithLabel:@"exTrain" stored:1 indexed:0 tracked:1];
    uint64_t v50 = [a1 remember:v49];
    v51 = (void *)extractedTrain;
    extractedTrain = v50;

    v52 = [[SGEntityTag alloc] initWithLabel:@"exBoat" stored:1 indexed:0 tracked:1];
    uint64_t v53 = [a1 remember:v52];
    v54 = (void *)extractedBoat;
    extractedBoat = v53;

    v55 = [[SGEntityTag alloc] initWithLabel:@"exHotel" stored:1 indexed:0 tracked:1];
    uint64_t v56 = [a1 remember:v55];
    v57 = (void *)extractedHotel;
    extractedHotel = v56;

    v58 = [[SGEntityTag alloc] initWithLabel:@"exCarRental" stored:1 indexed:0 tracked:1];
    uint64_t v59 = [a1 remember:v58];
    v60 = (void *)extractedCarRental;
    extractedCarRental = v59;

    v61 = [[SGEntityTag alloc] initWithLabel:@"exTicket" stored:1 indexed:0 tracked:1];
    uint64_t v62 = [a1 remember:v61];
    v63 = (void *)extractedTicket;
    extractedTicket = v62;

    v64 = [[SGEntityTag alloc] initWithLabel:@"exMovie" stored:1 indexed:0 tracked:1];
    uint64_t v65 = [a1 remember:v64];
    v66 = (void *)extractedMovie;
    extractedMovie = v65;

    v67 = [[SGEntityTag alloc] initWithLabel:@"exFood" stored:1 indexed:0 tracked:1];
    uint64_t v68 = [a1 remember:v67];
    v69 = (void *)extractedFood;
    extractedFood = v68;

    v70 = [[SGEntityTag alloc] initWithLabel:@"exSocial" stored:1 indexed:0 tracked:1];
    uint64_t v71 = [a1 remember:v70];
    v72 = (void *)extractedSocial;
    extractedSocial = v71;

    v73 = [[SGEntityTag alloc] initWithLabel:@"exAppointment" stored:1 indexed:0 tracked:1];
    uint64_t v74 = [a1 remember:v73];
    v75 = (void *)extractedAppointment;
    extractedAppointment = v74;

    v76 = (void *)MEMORY[0x1A6265250]();
    id v77 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v78 = objc_msgSend(v77, "initWithObjects:", extractedFlight, extractedBus, extractedTrain, extractedBoat, extractedHotel, extractedCarRental, extractedTicket, extractedMovie, extractedFood, extractedSocial, extractedAppointment, 0);
    v79 = (void *)extractedEventCategoryTags;
    extractedEventCategoryTags = v78;

    v80 = [[SGEntityTag alloc] initWithLabel:@"hardName" stored:1 indexed:0 tracked:0];
    uint64_t v81 = [a1 remember:v80];
    v82 = (void *)hardName;
    hardName = v81;

    v83 = [[SGEntityTag alloc] initWithLabel:@"fullyDissected" stored:1 indexed:0 tracked:0];
    uint64_t v84 = [a1 remember:v83];
    v85 = (void *)fullyDissected;
    fullyDissected = v84;

    v86 = [[SGEntityTag alloc] initWithLabel:@"fromInteraction" stored:1 indexed:0 tracked:0];
    uint64_t v87 = [a1 remember:v86];
    v88 = (void *)fromInteraction;
    fromInteraction = v87;

    v89 = [[SGEntityTag alloc] initWithLabel:@"fromTextMessage" stored:1 indexed:0 tracked:0];
    uint64_t v90 = [a1 remember:v89];
    v91 = (void *)fromTextMessage;
    fromTextMessage = v90;

    v92 = [[SGEntityTag alloc] initWithLabel:@"fromSync" stored:1 indexed:1 tracked:0];
    uint64_t v93 = [a1 remember:v92];
    v94 = (void *)fromSync;
    fromSync = v93;

    v95 = [[SGEntityTag alloc] initWithLabel:@"isSent" stored:1 indexed:0 tracked:0];
    uint64_t v96 = [a1 remember:v95];
    v97 = (void *)isSent;
    isSent = v96;

    v98 = [[SGEntityTag alloc] initWithLabel:@"significantSender" stored:1 indexed:0 tracked:0];
    uint64_t v99 = [a1 remember:v98];
    v100 = (void *)significantSender;
    significantSender = v99;

    v101 = [[SGEntityTag alloc] initWithLabel:@"titleGeneratedFromTemplate" stored:1 indexed:0 tracked:0];
    uint64_t v102 = [a1 remember:v101];
    v103 = (void *)titleGeneratedFromTemplate;
    titleGeneratedFromTemplate = v102;

    v104 = [[SGEntityTag alloc] initWithLabel:@"titleGeneratedFromSubject" stored:1 indexed:0 tracked:0];
    uint64_t v105 = [a1 remember:v104];
    v106 = (void *)titleGeneratedFromSubject;
    titleGeneratedFromSubject = v105;

    v107 = [[SGEntityTag alloc] initWithLabel:@"templateException" stored:1 indexed:0 tracked:0];
    uint64_t v108 = [a1 remember:v107];
    v109 = (void *)templateException;
    templateException = v108;

    v110 = [[SGEntityTag alloc] initWithLabel:@"geocodingModeAddressOnly" stored:1 indexed:0 tracked:0];
    uint64_t v111 = [a1 remember:v110];
    v112 = (void *)geocodingModeAddressOnly;
    geocodingModeAddressOnly = v111;

    v113 = [[SGEntityTag alloc] initWithLabel:@"geocodingModePOIOnly" stored:1 indexed:0 tracked:0];
    uint64_t v114 = [a1 remember:v113];
    v115 = (void *)geocodingModePOIOnly;
    geocodingModePOIOnly = v114;

    v116 = [[SGEntityTag alloc] initWithLabel:@"geocodingModeAddressThenPOI" stored:1 indexed:0 tracked:0];
    uint64_t v117 = [a1 remember:v116];
    v118 = (void *)geocodingModeAddressThenPOI;
    geocodingModeAddressThenPOI = v117;

    v119 = [[SGEntityTag alloc] initWithLabel:@"geocodingModeAddressWithCanonicalSearch" stored:1 indexed:0 tracked:0];
    uint64_t v120 = [a1 remember:v119];
    v121 = (void *)geocodingModeAddressWithCanonicalSearch;
    geocodingModeAddressWithCanonicalSearch = v120;

    v122 = (void *)MEMORY[0x1A6265250]();
    id v123 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v124 = objc_msgSend(v123, "initWithObjects:", geocodingModeAddressOnly, geocodingModePOIOnly, geocodingModeAddressThenPOI, geocodingModeAddressWithCanonicalSearch, 0);
    v125 = (void *)geocodingModeTags;
    geocodingModeTags = v124;

    v126 = [[SGEntityTag alloc] initWithLabel:@"requiresDeferredDissection" stored:1 indexed:0 tracked:0];
    uint64_t v127 = [a1 remember:v126];
    v128 = (void *)requiresDeferredDissection;
    requiresDeferredDissection = v127;

    v129 = [[SGEntityTag alloc] initWithLabel:@"eventExtractedFromOldDocument" stored:1 indexed:0 tracked:0];
    uint64_t v130 = [a1 remember:v129];
    v131 = (void *)eventExtractedFromOldDocument;
    eventExtractedFromOldDocument = v130;

    uint64_t v132 = objc_opt_new();
    v133 = (void *)optionsByLabel;
    optionsByLabel = v132;

    [a1 rememberLabel:@"U" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"CD" stored:1 indexed:1 tracked:0];
    [a1 rememberLabel:@"ID" stored:1 indexed:1 tracked:0];
    [a1 rememberLabel:@"EX" stored:1 indexed:1 tracked:0];
    [a1 rememberLabel:@"MSG" stored:0 indexed:1 tracked:0];
    [a1 rememberLabel:@"AMSG" stored:1 indexed:1 tracked:0];
    [a1 rememberLabel:@"MBOX" stored:1 indexed:1 tracked:0];
    [a1 rememberLabel:@"ICST" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"TZID" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"ET" stored:1 indexed:1 tracked:0];
    [a1 rememberLabel:@"TMPL" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"TMPN" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"RMF" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"EHSH" stored:1 indexed:1 tracked:0];
    [a1 rememberLabel:@"L" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"ICN" stored:1 indexed:1 tracked:0];
    [a1 rememberLabel:@"IUID" stored:1 indexed:1 tracked:0];
    [a1 rememberLabel:@"IGID" stored:1 indexed:1 tracked:0];
    [a1 rememberLabel:@"IBID" stored:1 indexed:1 tracked:0];
    [a1 rememberLabel:@"ITID" stored:1 indexed:1 tracked:0];
    [a1 rememberLabel:@"NLET" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"NLLI" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"NLEA" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"NLCS" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"NLPC" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"NLBC" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"SO" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"EM" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"DOM" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"CAUL" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"MAUL" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"MEUL" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"REM" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"RHSH" stored:1 indexed:1 tracked:0];
    [a1 rememberLabel:@"IRCR" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"IRIR" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"POIF" stored:1 indexed:1 tracked:0];
    [a1 rememberLabel:@"IRUA" stored:1 indexed:0 tracked:0];
    [a1 rememberLabel:@"EKEA" stored:1 indexed:1 tracked:0];
    [a1 rememberLabel:@"ICSM" stored:1 indexed:1 tracked:0];
    [a1 rememberLabel:@"ICSD" stored:1 indexed:1 tracked:0];
    [a1 rememberLabel:@"WOD" stored:1 indexed:1 tracked:0];
    [a1 rememberLabel:@"WODD" stored:1 indexed:1 tracked:0];
    [a1 rememberLabel:@"WPD" stored:1 indexed:1 tracked:0];
    [a1 rememberLabel:@"WPDD" stored:1 indexed:1 tracked:0];
    [a1 rememberLabel:@"ESM" stored:0 indexed:0 tracked:0];
    [a1 rememberLabel:@"FWDM" stored:0 indexed:0 tracked:0];
    [a1 rememberLabel:@"EVNTC" stored:1 indexed:1 tracked:1];
    [a1 rememberLabel:@"ATHR" stored:0 indexed:0 tracked:0];
    uint64_t v134 = objc_opt_new();
    v135 = (void *)tombstonedLabels;
    tombstonedLabels = v134;

    [a1 tombstoneLabel:@"HHSH"];
    [a1 tombstoneLabel:@"INTE"];
    [a1 tombstoneLabel:@"nonUserFacingUpdate"];
    [a1 tombstoneLabel:@"FBU"];
  }
}

+ (void)tombstoneLabel:(id)a3
{
}

+ (void)rememberLabel:(id)a3 stored:(BOOL)a4 indexed:(BOOL)a5 tracked:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  uint64_t v11 = (unsigned char *)objc_opt_new();
  v11[8] = v8;
  v11[9] = v7;
  v11[10] = v6;
  [(id)optionsByLabel setObject:v11 forKeyedSubscript:v9];
  char v10 = [[SGEntityTag alloc] initWithLabel:v9 stored:v8 indexed:v7 tracked:v6];
  [(id)byLabel setObject:v10 forKeyedSubscript:v9];
}

+ (id)remember:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)byLabel;
  uint64_t v5 = [v3 label];
  [v4 setObject:v3 forKeyedSubscript:v5];

  return v3;
}

@end