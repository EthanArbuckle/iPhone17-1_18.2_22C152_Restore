@interface SGPipelineEntity
+ (id)fromCloudKitRecord:(id)a3;
- ($6B0E05CC9701154637DEC7A78D5B7DE9)inhumanFeatures;
- (BOOL)contactInformationExtracted;
- (BOOL)hasEventEnrichment;
- (BOOL)hasFullDownloadBeenRequested;
- (BOOL)isInhuman;
- (BOOL)needsSourceVerification;
- (BOOL)pendingVerification;
- (INInteraction)interaction;
- (NSArray)addresses;
- (NSArray)authorMatchingContacts;
- (NSArray)emailAddresses;
- (NSArray)enrichments;
- (NSArray)externalEnrichments;
- (NSArray)instantMessageAddresses;
- (NSArray)invalidatedMessageIdentifiers;
- (NSArray)phoneNumbers;
- (NSArray)taggedCharacterRanges;
- (NSMutableDictionary)emailToCanonicalEmailCache;
- (NSSet)authorMatchingContactsKeys;
- (NSString)accountType;
- (NSString)snippetsContent;
- (SGHarvestQueueMetrics)harvestMetrics;
- (SGMessage)message;
- (SGPipelineEntity)initWithDuplicateKey:(id)a3 title:(id)a4;
- (SGPipelineEntity)initWithEmailMessage:(id)a3;
- (SGPipelineEntity)initWithIntentPersonAtDate:(id)a3 bundleId:(id)a4 handle:(id)a5 displayName:(id)a6;
- (SGPipelineEntity)initWithInteraction:(id)a3 fromBundleIdentifier:(id)a4;
- (SGPipelineEntity)initWithInteraction:(id)a3 identifier:(id)a4 fromBundleIdentifier:(id)a5;
- (SGPipelineEntity)initWithInteractionIdentifier:(id)a3 fromBundleIdentifier:(id)a4;
- (SGPipelineEntity)initWithMessage:(id)a3;
- (SGPipelineEntity)initWithTextMessage:(id)a3;
- (SGSimpleMailMessage)mailMessage;
- (SGTextMessage)textMessage;
- (_NSRange)plainTextSigRange;
- (id)_initWithInteractionIdentifier:(id)a3 fromBundleIdentifier:(id)a4 creationTime:(id)a5;
- (id)birthday:(id)a3 forIdentity:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 extractionInfo:(id)a7;
- (id)contactDetailsWithType:(unint64_t)a3;
- (unint64_t)eventEnrichmentsCount;
- (void)_lazyCheckMessageForHumanness;
- (void)acquireDissectorLock;
- (void)addBirthdayEnrichment:(id)a3;
- (void)addDetectedBirthday:(id)a3 forIdentity:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 extractionInfo:(id)a7;
- (void)addDetectedEmailAddress:(id)a3 forIdentity:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 extractionInfo:(id)a7;
- (void)addDetectedInstantMessageAddress:(id)a3 forIdentity:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 extractionInfo:(id)a7;
- (void)addDetectedPhoneNumber:(id)a3 forIdentity:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 extractionInfo:(id)a7;
- (void)addDetectedPostalAddress:(id)a3 forIdentity:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 extractionInfo:(id)a7;
- (void)addDetectedSocialProfile:(id)a3 forIdentity:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 extractionInfo:(id)a7;
- (void)addDetection:(id)a3 forIdentity:(id)a4 extractionInfo:(id)a5;
- (void)addEmailAddressEnrichment:(id)a3;
- (void)addEnrichment:(id)a3;
- (void)addEnrichments:(id)a3;
- (void)addExternalEnrichment:(id)a3;
- (void)addInstantMessageAddressEnrichment:(id)a3;
- (void)addOrReplaceEventEnrichment:(id)a3;
- (void)addOrReplacePreferredEnrichment:(id)a3;
- (void)addSocialProfileEnrichment:(id)a3;
- (void)addTaggedCharacterRanges:(id)a3;
- (void)dealloc;
- (void)enumeratePeople:(id)a3;
- (void)flushExternalEnrichmentsUponDealloc;
- (void)releaseDissectorLock;
- (void)removeExternalEnrichmentAtIndex:(unint64_t)a3;
- (void)requestFullDownload;
- (void)runWithDissectorLock:(id)a3;
- (void)setAuthorMatchingContacts:(id)a3;
- (void)setAuthorMatchingContactsKeys:(id)a3;
- (void)setContactInformationExtracted:(BOOL)a3;
- (void)setCreationTimestamp:(SGUnixTimestamp_)a3;
- (void)setEnrichments:(id)a3;
- (void)setExternalEnrichments:(id)a3;
- (void)setHarvestMetrics:(id)a3;
- (void)setInvalidatedMessageIdentifiers:(id)a3;
- (void)setLastModifiedTimestamp:(SGUnixTimestamp_)a3;
- (void)setNeedsSourceVerification:(BOOL)a3;
- (void)setPendingVerification:(BOOL)a3;
- (void)setPlainTextSigRange:(_NSRange)a3;
- (void)setTaggedCharacterRanges:(id)a3;
- (void)stripEventInformation;
@end

@implementation SGPipelineEntity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_harvestMetrics, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_textMessage, 0);
  objc_storeStrong((id *)&self->_mailMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_authorMatchingContactsKeys, 0);
  objc_storeStrong((id *)&self->_authorMatchingContacts, 0);
  objc_storeStrong((id *)&self->_invalidatedMessageIdentifiers, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_emailToCanonicalEmailCache, 0);
  objc_storeStrong((id *)&self->_instantMessageAddresses, 0);
  objc_storeStrong((id *)&self->_lazySnippetsContent, 0);
  objc_storeStrong((id *)&self->_taggedCharacterRanges, 0);
  objc_storeStrong((id *)&self->_externalEnrichments, 0);
  objc_storeStrong((id *)&self->_enrichments, 0);
}

- (void)setHarvestMetrics:(id)a3
{
}

- (SGHarvestQueueMetrics)harvestMetrics
{
  return self->_harvestMetrics;
}

- (INInteraction)interaction
{
  return self->_interaction;
}

- (SGTextMessage)textMessage
{
  return self->_textMessage;
}

- (SGSimpleMailMessage)mailMessage
{
  return self->_mailMessage;
}

- (SGMessage)message
{
  return self->_message;
}

- (void)setPendingVerification:(BOOL)a3
{
  self->_pendingVerification = a3;
}

- (BOOL)pendingVerification
{
  return self->_pendingVerification;
}

- (void)setNeedsSourceVerification:(BOOL)a3
{
  self->_needsSourceVerification = a3;
}

- (BOOL)needsSourceVerification
{
  return self->_needsSourceVerification;
}

- (void)setAuthorMatchingContactsKeys:(id)a3
{
}

- (NSSet)authorMatchingContactsKeys
{
  return self->_authorMatchingContactsKeys;
}

- (void)setAuthorMatchingContacts:(id)a3
{
}

- (NSArray)authorMatchingContacts
{
  return self->_authorMatchingContacts;
}

- (void)setInvalidatedMessageIdentifiers:(id)a3
{
}

- (NSArray)invalidatedMessageIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 440, 1);
}

- (NSString)accountType
{
  return self->_accountType;
}

- (NSMutableDictionary)emailToCanonicalEmailCache
{
  return self->_emailToCanonicalEmailCache;
}

- (void)setTaggedCharacterRanges:(id)a3
{
}

- (NSArray)instantMessageAddresses
{
  return self->_instantMessageAddresses;
}

- (void)setContactInformationExtracted:(BOOL)a3
{
  self->_contactInformationExtracted = a3;
}

- (BOOL)contactInformationExtracted
{
  return self->_contactInformationExtracted;
}

- (void)setPlainTextSigRange:(_NSRange)a3
{
  self->_plainTextSigRange = a3;
}

- (_NSRange)plainTextSigRange
{
  p_plainTextSigRange = &self->_plainTextSigRange;
  NSUInteger location = self->_plainTextSigRange.location;
  NSUInteger length = p_plainTextSigRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setExternalEnrichments:(id)a3
{
}

- (void)setEnrichments:(id)a3
{
}

- (void)runWithDissectorLock:(id)a3
{
  p_dissectorLock = &self->_dissectorLock;
  v4 = (void (**)(void))a3;
  pthread_mutex_lock(p_dissectorLock);
  v4[2](v4);

  pthread_mutex_unlock(p_dissectorLock);
}

- (void)releaseDissectorLock
{
}

- (void)acquireDissectorLock
{
}

- (unint64_t)eventEnrichmentsCount
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_enrichments;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isEvent", (void)v9);
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)hasEventEnrichment
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_enrichments;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isEvent", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasFullDownloadBeenRequested
{
  return self->_fullDownloadRequested;
}

- (void)requestFullDownload
{
  if ([(SGEntity *)self isPartiallyDownloaded]) {
    self->_fullDownloadRequested = 1;
  }
}

- (BOOL)isInhuman
{
  if (self->_message && !self->_messageInhumannessChecked) {
    [(SGPipelineEntity *)self _lazyCheckMessageForHumanness];
  }
  v4.receiver = self;
  v4.super_class = (Class)SGPipelineEntity;
  return [(SGEntity *)&v4 isInhuman];
}

- ($6B0E05CC9701154637DEC7A78D5B7DE9)inhumanFeatures
{
  if (self->_message && !self->_messageInhumannessChecked) {
    [(SGPipelineEntity *)self _lazyCheckMessageForHumanness];
  }
  return ($6B0E05CC9701154637DEC7A78D5B7DE9 *)&self->_inhumanFeatures;
}

- (void)_lazyCheckMessageForHumanness
{
  uint64_t v3 = [(SGPipelineEntity *)self message];
  int v4 = [v3 isInhumanSender];

  if (v4)
  {
    unint64_t v5 = [MEMORY[0x1E4F5D9F0] inhuman];
    [(SGEntity *)self addTag:v5];
  }
  uint64_t v6 = [(SGPipelineEntity *)self message];
  self->_inhumanFeatures.inhumanBody = [v6 isInhumanContent];

  if (self->_inhumanFeatures.inhumanBody)
  {
    long long v7 = sgLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "Tagging as inhuman: Body", buf, 2u);
    }

    long long v8 = [MEMORY[0x1E4F5D9F0] inhuman];
    [(SGEntity *)self addTag:v8];
  }
  if ([(SGSimpleMailMessage *)self->_mailMessage hasHumanHeaders])
  {
    long long v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long v11 = 0;
      _os_log_debug_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEBUG, "Tagging as human: Headers", v11, 2u);
    }

    long long v10 = [MEMORY[0x1E4F5D9F0] human];
    [(SGEntity *)self addTag:v10];
  }
  self->_messageInhumannessChecked = 1;
}

- (void)enumeratePeople:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, void *))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v5 = [(SGPipelineEntity *)self enrichments];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        long long v11 = (void *)MEMORY[0x1CB79B230]();
        if ([v10 isPerson]) {
          v4[2](v4, v10);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (NSArray)emailAddresses
{
  return (NSArray *)[(SGPipelineEntity *)self contactDetailsWithType:2];
}

- (NSArray)addresses
{
  return (NSArray *)[(SGPipelineEntity *)self contactDetailsWithType:1];
}

- (NSArray)phoneNumbers
{
  return (NSArray *)[(SGPipelineEntity *)self contactDetailsWithType:0];
}

- (id)contactDetailsWithType:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3 > 6)
  {
    uint64_t v21 = 0;
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v21 = qword_1CA8D0C20[a3];
    uint64_t v4 = qword_1CA8D0C58[a3];
  }
  unint64_t v5 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(SGPipelineEntity *)self enrichments];
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v11 = objc_msgSend(v10, "duplicateKey", v21);
        if ([v11 entityType] == v4)
        {
        }
        else
        {
          long long v12 = [v10 duplicateKey];
          uint64_t v13 = [v12 entityType];

          if (v13 != v21) {
            continue;
          }
        }
        long long v14 = [v10 duplicateKey];
        long long v15 = [v14 contactDetailKey];
        v16 = [v15 label];
        uint64_t v17 = [v10 title];
        id v18 = v16;
        v19 = [[SGLabeledValue alloc] initWithLabel:v18 value:v17];

        [v5 addObject:v19];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  return v5;
}

- (void)addDetectedSocialProfile:(id)a3 forIdentity:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 extractionInfo:(id)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v21 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  uint64_t v17 = [(SGEntity *)self duplicateKey];
  [v17 entityType];
  int IsContact = SGEntityTypeIsContact();

  if (IsContact)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"SGPipelineEntity.m" lineNumber:610 description:@"Contacts can't have associated detected instant message addresses."];
  }
  v19 = +[SGPipelineEnrichment socialProfile:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:](SGPipelineEnrichment, "socialProfile:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:", v21, v14, self, 0, v15, location, length, v16);
  [(SGPipelineEntity *)self addSocialProfileEnrichment:v19];
}

- (void)addSocialProfileEnrichment:(id)a3
{
}

- (void)addDetectedInstantMessageAddress:(id)a3 forIdentity:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 extractionInfo:(id)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v21 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  uint64_t v17 = [(SGEntity *)self duplicateKey];
  [v17 entityType];
  int IsContact = SGEntityTypeIsContact();

  if (IsContact)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"SGPipelineEntity.m" lineNumber:585 description:@"Contacts can't have associated detected instant message addresses."];
  }
  v19 = +[SGPipelineEnrichment instantMessageAddress:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:](SGPipelineEnrichment, "instantMessageAddress:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:", v21, v14, self, 0, v15, location, length, v16);
  [(SGPipelineEntity *)self addInstantMessageAddressEnrichment:v19];
}

- (void)addInstantMessageAddressEnrichment:(id)a3
{
}

- (void)addDetectedBirthday:(id)a3 forIdentity:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 extractionInfo:(id)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v21 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  uint64_t v17 = [(SGEntity *)self duplicateKey];
  [v17 entityType];
  int IsContact = SGEntityTypeIsContact();

  if (IsContact)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"SGPipelineEntity.m" lineNumber:563 description:@"Contacts can't have associated detected birthdays."];
  }
  v19 = -[SGPipelineEntity birthday:forIdentity:context:contextRangeOfInterest:extractionInfo:](self, "birthday:forIdentity:context:contextRangeOfInterest:extractionInfo:", v21, v14, v15, location, length, v16);
  [(SGPipelineEntity *)self addBirthdayEnrichment:v19];
}

- (id)birthday:(id)a3 forIdentity:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 extractionInfo:(id)a7
{
  return +[SGPipelineEnrichment birthday:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:](SGPipelineEnrichment, "birthday:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:", a3, a4, self, 0, a5, a6.location, a6.length, a7);
}

- (void)addDetectedEmailAddress:(id)a3 forIdentity:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 extractionInfo:(id)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v21 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  uint64_t v17 = [(SGEntity *)self duplicateKey];
  [v17 entityType];
  int IsContact = SGEntityTypeIsContact();

  if (IsContact)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"SGPipelineEntity.m" lineNumber:534 description:@"Contacts can't have associated detected email addresses."];
  }
  v19 = +[SGPipelineEnrichment emailAddress:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:](SGPipelineEnrichment, "emailAddress:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:", v21, v14, self, 0, v15, location, length, v16);
  [(SGPipelineEntity *)self addEmailAddressEnrichment:v19];
}

- (void)addBirthdayEnrichment:(id)a3
{
  id v8 = a3;
  unint64_t v5 = [(SGEntity *)self duplicateKey];
  [v5 entityType];
  int IsContact = SGEntityTypeIsContact();

  if (IsContact)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SGPipelineEntity.m" lineNumber:519 description:@"Contacts can't have associated detected birthdays."];
  }
  [v8 title];

  [(NSMutableArray *)self->_enrichments addObject:v8];
}

- (void)addEmailAddressEnrichment:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 title];
  char v6 = [MEMORY[0x1E4F605B0] isLegalEmailAddress:v5];

  if (v6)
  {
    [(NSMutableArray *)self->_enrichments addObject:v4];
  }
  else
  {
    uint64_t v7 = sgLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v4 title];
      int v9 = 136315138;
      uint64_t v10 = [v8 UTF8String];
      _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_INFO, "Ignoring invalid email: %s", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)addDetectedPhoneNumber:(id)a3 forIdentity:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 extractionInfo:(id)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v21 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  uint64_t v17 = [(SGEntity *)self duplicateKey];
  [v17 entityType];
  int IsContact = SGEntityTypeIsContact();

  if (IsContact)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"SGPipelineEntity.m" lineNumber:495 description:@"Contacts can't have associated detected phone numbers."];
  }
  v19 = +[SGPipelineEnrichment phoneNumber:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:](SGPipelineEnrichment, "phoneNumber:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:", v21, v14, self, 0, v15, location, length, v16);
  [(SGPipelineEntity *)self addEnrichment:v19];
}

- (void)addDetectedPostalAddress:(id)a3 forIdentity:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 extractionInfo:(id)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v21 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  uint64_t v17 = [(SGEntity *)self duplicateKey];
  [v17 entityType];
  int IsContact = SGEntityTypeIsContact();

  if (IsContact)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"SGPipelineEntity.m" lineNumber:479 description:@"Contacts can't have associated detected addresses."];
  }
  v19 = +[SGPipelineEnrichment address:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:](SGPipelineEnrichment, "address:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:", v21, v14, self, 0, v15, location, length, v16);
  [(SGPipelineEntity *)self addEnrichment:v19];
}

- (void)addDetection:(id)a3 forIdentity:(id)a4 extractionInfo:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v23 label];
  uint64_t v11 = [v23 extraction];
  id v12 = v10;
  uint64_t v13 = [[SGLabeledValue alloc] initWithLabel:v12 value:v11];

  switch([v23 type])
  {
    case 0u:
      id v14 = [v23 context];
      uint64_t v15 = [v23 contextRangeOfInterest];
      -[SGPipelineEntity addDetectedPhoneNumber:forIdentity:context:contextRangeOfInterest:extractionInfo:](self, "addDetectedPhoneNumber:forIdentity:context:contextRangeOfInterest:extractionInfo:", v13, v8, v14, v15, v16, v9);
      goto LABEL_6;
    case 1u:
      id v14 = [v23 context];
      uint64_t v17 = [v23 contextRangeOfInterest];
      -[SGPipelineEntity addDetectedPostalAddress:forIdentity:context:contextRangeOfInterest:extractionInfo:](self, "addDetectedPostalAddress:forIdentity:context:contextRangeOfInterest:extractionInfo:", v13, v8, v14, v17, v18, v9);
      goto LABEL_6;
    case 2u:
      id v14 = [v23 context];
      uint64_t v19 = [v23 contextRangeOfInterest];
      -[SGPipelineEntity addDetectedEmailAddress:forIdentity:context:contextRangeOfInterest:extractionInfo:](self, "addDetectedEmailAddress:forIdentity:context:contextRangeOfInterest:extractionInfo:", v13, v8, v14, v19, v20, v9);
      goto LABEL_6;
    case 3u:
      id v14 = [v23 context];
      uint64_t v21 = [v23 contextRangeOfInterest];
      -[SGPipelineEntity addDetectedBirthday:forIdentity:context:contextRangeOfInterest:extractionInfo:](self, "addDetectedBirthday:forIdentity:context:contextRangeOfInterest:extractionInfo:", v13, v8, v14, v21, v22, v9);
LABEL_6:

      break;
    default:
      break;
  }
}

- (void)setLastModifiedTimestamp:(SGUnixTimestamp_)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v5 = self->_enrichments;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v9++) setLastModifiedTimestamp:a3.secondsFromUnixEpoch];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)SGPipelineEntity;
  [(SGEntity *)&v10 setLastModifiedTimestamp:a3.secondsFromUnixEpoch];
}

- (void)setCreationTimestamp:(SGUnixTimestamp_)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v5 = self->_enrichments;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v9++) setCreationTimestamp:a3.secondsFromUnixEpoch];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)SGPipelineEntity;
  [(SGEntity *)&v10 setCreationTimestamp:a3.secondsFromUnixEpoch];
}

- (void)stripEventInformation
{
  enrichments = self->_enrichments;
  id v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_42_7784];
  [(NSMutableArray *)enrichments filterUsingPredicate:v3];
}

BOOL __41__SGPipelineEntity_stripEventInformation__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 duplicateKey];
  BOOL v3 = [v2 entityType] != 2;

  return v3;
}

- (void)addTaggedCharacterRanges:(id)a3
{
  id v4 = a3;
  taggedCharacterRanges = self->_taggedCharacterRanges;
  id v12 = v4;
  if (!taggedCharacterRanges)
  {
    uint64_t v6 = [(SGPipelineEntity *)self message];
    uint64_t v7 = [v6 taggedCharacterRanges];
    uint64_t v8 = (void *)[v7 mutableCopy];
    uint64_t v9 = v8;
    if (v8) {
      objc_super v10 = v8;
    }
    else {
      objc_super v10 = (NSMutableArray *)objc_opt_new();
    }
    long long v11 = self->_taggedCharacterRanges;
    self->_taggedCharacterRanges = v10;

    taggedCharacterRanges = self->_taggedCharacterRanges;
    id v4 = v12;
  }
  [(NSMutableArray *)taggedCharacterRanges addObjectsFromArray:v4];
}

- (NSArray)taggedCharacterRanges
{
  p_taggedCharacterRanges = &self->_taggedCharacterRanges;
  taggedCharacterRanges = self->_taggedCharacterRanges;
  if (taggedCharacterRanges)
  {
    id v4 = taggedCharacterRanges;
  }
  else
  {
    unint64_t v5 = [(SGPipelineEntity *)self message];
    uint64_t v6 = [v5 taggedCharacterRanges];
    uint64_t v7 = (void *)[v6 mutableCopy];
    uint64_t v8 = v7;
    if (!v7) {
      uint64_t v8 = objc_opt_new();
    }
    objc_storeStrong((id *)p_taggedCharacterRanges, v8);
    id v4 = v8;
    if (!v7) {
  }
    }
  return (NSArray *)v4;
}

- (void)removeExternalEnrichmentAtIndex:(unint64_t)a3
{
}

- (void)addExternalEnrichment:(id)a3
{
}

- (void)flushExternalEnrichmentsUponDealloc
{
  self->_flushExternalEnrichments = 1;
}

- (NSArray)externalEnrichments
{
  return (NSArray *)self->_externalEnrichments;
}

- (void)addOrReplacePreferredEnrichment:(id)a3
{
  id v13 = a3;
  unint64_t v5 = [v13 duplicateKey];

  if (!v5)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"SGPipelineEntity.m" lineNumber:365 description:@"a preferred enrichment must have a duplicateKey"];
  }
  if (![(NSMutableArray *)self->_enrichments count]) {
    goto LABEL_9;
  }
  unint64_t v6 = 0;
  char v7 = 0;
  do
  {
    uint64_t v8 = [(NSMutableArray *)self->_enrichments objectAtIndexedSubscript:v6];
    uint64_t v9 = [v8 duplicateKey];
    objc_super v10 = [v13 duplicateKey];
    int v11 = [v9 isEqualToDuplicateKey:v10];

    if (v11)
    {
      [(NSMutableArray *)self->_enrichments setObject:v13 atIndexedSubscript:v6];
      char v7 = 1;
    }
    ++v6;
  }
  while (v6 < [(NSMutableArray *)self->_enrichments count]);
  if ((v7 & 1) == 0) {
LABEL_9:
  }
    [(SGPipelineEntity *)self addEnrichment:v13];
}

- (void)addOrReplaceEventEnrichment:(id)a3
{
  id v11 = a3;
  unint64_t v5 = [v11 duplicateKey];

  if (!v5)
  {
    objc_super v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SGPipelineEntity.m" lineNumber:347 description:@"a preferred enrichment must have a duplicateKey"];
  }
  if (![(NSMutableArray *)self->_enrichments count]) {
    goto LABEL_9;
  }
  unint64_t v6 = 0;
  char v7 = 0;
  do
  {
    uint64_t v8 = [v11 duplicateKey];
    uint64_t v9 = [v8 entityType];

    if (v9 == 2)
    {
      [(NSMutableArray *)self->_enrichments setObject:v11 atIndexedSubscript:v6];
      char v7 = 1;
    }
    ++v6;
  }
  while (v6 < [(NSMutableArray *)self->_enrichments count]);
  if ((v7 & 1) == 0) {
LABEL_9:
  }
    [(SGPipelineEntity *)self addEnrichment:v11];
}

- (void)addEnrichments:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NSMutableArray *)self->_enrichments addObject:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addEnrichment:(id)a3
{
}

- (NSArray)enrichments
{
  return (NSArray *)self->_enrichments;
}

- (NSString)snippetsContent
{
  return (NSString *)[(_PASLazyResult *)self->_lazySnippetsContent result];
}

- (void)dealloc
{
  if (self->_flushExternalEnrichments)
  {
    BOOL v3 = self->_externalEnrichments;
    if (dealloc__pasOnceToken7 != -1) {
      dispatch_once(&dealloc__pasOnceToken7, &__block_literal_global_7790);
    }
    id v4 = (void *)dealloc__pasExprOnceResult;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__SGPipelineEntity_dealloc__block_invoke_2;
    block[3] = &unk_1E65BEF88;
    long long v9 = v3;
    uint64_t v5 = v3;
    uint64_t v6 = v4;
    dispatch_async(v6, block);
  }
  v7.receiver = self;
  v7.super_class = (Class)SGPipelineEntity;
  [(SGEntity *)&v7 dealloc];
}

void __27__SGPipelineEntity_dealloc__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * v5);
        objc_super v7 = (void *)MEMORY[0x1CB79B230](v2);
        objc_msgSend(v6, "flushWrites", (void)v8);
        ++v5;
      }
      while (v3 != v5);
      uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v3 = v2;
    }
    while (v2);
  }
}

void __27__SGPipelineEntity_dealloc__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"SGPipelineEntity.flush" qosClass:9];
  uint64_t v2 = (void *)dealloc__pasExprOnceResult;
  dealloc__pasExprOnceResult = v1;
}

- (id)_initWithInteractionIdentifier:(id)a3 fromBundleIdentifier:(id)a4 creationTime:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  if (![v11 length])
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SGPipelineEntity.m", 279, @"Invalid parameter not satisfying: %@", @"interactionIdentifier.length > 0" object file lineNumber description];
  }
  if (![v9 length])
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SGPipelineEntity.m", 280, @"Invalid parameter not satisfying: %@", @"bundleIdentifier.length > 0" object file lineNumber description];
  }
  long long v12 = +[SGDuplicateKey duplicateKeyForInteractionIdentifier:v11 fromBundleIdentifier:v9];
  uint64_t v13 = [(SGPipelineEntity *)self initWithDuplicateKey:v12 title:v11];

  if (v10 && v13)
  {
    [v10 timeIntervalSince1970];
    -[SGPipelineEntity setCreationTimestamp:](v13, "setCreationTimestamp:");
  }

  return v13;
}

- (SGPipelineEntity)initWithInteractionIdentifier:(id)a3 fromBundleIdentifier:(id)a4
{
  return (SGPipelineEntity *)[(SGPipelineEntity *)self _initWithInteractionIdentifier:a3 fromBundleIdentifier:a4 creationTime:0];
}

- (SGPipelineEntity)initWithInteraction:(id)a3 identifier:(id)a4 fromBundleIdentifier:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SGPipelineEntity.m", 256, @"Invalid parameter not satisfying: %@", @"interaction" object file lineNumber description];
  }
  if (![v11 length])
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SGPipelineEntity.m", 257, @"Invalid parameter not satisfying: %@", @"identifier.length > 0" object file lineNumber description];
  }
  if (![v12 length])
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SGPipelineEntity.m", 258, @"Invalid parameter not satisfying: %@", @"bundleIdentifier.length > 0" object file lineNumber description];
  }
  uint64_t v13 = [v10 dateInterval];
  uint64_t v14 = [v13 startDate];
  uint64_t v15 = [(SGPipelineEntity *)self _initWithInteractionIdentifier:v11 fromBundleIdentifier:v12 creationTime:v14];

  if (v15) {
    objc_storeStrong((id *)&v15->_interaction, a3);
  }

  return v15;
}

- (SGPipelineEntity)initWithInteraction:(id)a3 fromBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = [v7 identifier];
  id v9 = [(SGPipelineEntity *)self initWithInteraction:v7 identifier:v8 fromBundleIdentifier:v6];

  return v9;
}

- (SGPipelineEntity)initWithIntentPersonAtDate:(id)a3 bundleId:(id)a4 handle:(id)a5 displayName:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SGPipelineEntity.m", 240, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"SGPipelineEntity.m", 241, @"Invalid parameter not satisfying: %@", @"handle" object file lineNumber description];

LABEL_3:
  uint64_t v15 = +[SGDuplicateKey duplicateKeyForInteractionWithBundleId:v12 personHandle:v13];
  uint64_t v16 = [(SGPipelineEntity *)self initWithDuplicateKey:v15 title:v14];
  if (v16)
  {
    [v11 timeIntervalSince1970];
    -[SGPipelineEntity setCreationTimestamp:](v16, "setCreationTimestamp:");
  }

  return v16;
}

- (SGPipelineEntity)initWithMessage:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SGPipelineEntity *)self initWithEmailMessage:v4];
LABEL_5:
    self = v5;
    id v6 = self;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SGPipelineEntity *)self initWithTextMessage:v4];
    goto LABEL_5;
  }
  id v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v9 = 0;
    _os_log_error_impl(&dword_1CA650000, v7, OS_LOG_TYPE_ERROR, "Unknown SGMessage subclass", v9, 2u);
  }

  id v6 = 0;
LABEL_9:

  return v6;
}

- (SGPipelineEntity)initWithTextMessage:(id)a3
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1CB79B230]();
  id v7 = [v5 source];
  long long v8 = [v5 uniqueIdentifier];
  id v9 = +[SGDuplicateKey duplicateKeyForTextMessageWithSource:v7 uniqueIdentifier:v8];

  id v10 = [v5 subject];
  id v11 = [(SGPipelineEntity *)self initWithDuplicateKey:v9 title:v10];

  if (v11)
  {
    id v12 = [v5 textContent];
    [(SGEntity *)v11 setContent:v12];

    id v13 = [v5 date];
    [v13 timeIntervalSince1970];
    double v15 = v14;
    -[SGPipelineEntity setLastModifiedTimestamp:](v11, "setLastModifiedTimestamp:");
    [(SGPipelineEntity *)v11 setCreationTimestamp:v15];

    uint64_t v16 = [v5 author];
    [(SGEntity *)v11 setAuthor:v16];

    uint64_t v17 = [v5 source];
    [(SGEntity *)v11 setSourceKey:v17];

    uint64_t v18 = [v5 nickname];
    [(SGEntity *)v11 setAuthorNickname:v18];

    uint64_t v19 = [v5 photoPath];
    [(SGEntity *)v11 setAuthorPhotoPath:v19];

    uint64_t v20 = [MEMORY[0x1E4F5D9F0] fromTextMessage];
    [(SGEntity *)v11 addTag:v20];

    objc_storeStrong((id *)&v11->_message, a3);
    objc_storeStrong((id *)&v11->_textMessage, a3);
    if ([v5 isSent])
    {
      uint64_t v21 = [MEMORY[0x1E4F5D9F0] isSent];
      [(SGEntity *)v11 addTag:v21];
    }
  }

  return v11;
}

- (SGPipelineEntity)initWithEmailMessage:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1CB79B230]();
  id v7 = [v5 messageId];
  if (!v7)
  {
    id v7 = [v5 uniqueIdentifier];
    long long v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v7;
      _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_INFO, "Message-Id header not found. Using hash: %@", buf, 0xCu);
    }
  }
  id v9 = [v5 source];
  id v10 = +[SGDuplicateKey duplicateKeyForEmailWithSource:v9 messageId:v7];
  id v11 = [v5 subject];
  id v12 = [(SGPipelineEntity *)self initWithDuplicateKey:v10 title:v11];

  if (v12)
  {
    v44 = v6;
    id v13 = [v5 source];
    [(SGEntity *)v12 setSourceKey:v13];

    double v14 = [v5 appleMailMessageId];

    if (v14)
    {
      double v15 = (void *)MEMORY[0x1E4F5D9F0];
      uint64_t v16 = [v5 appleMailMessageId];
      uint64_t v17 = [v5 source];
      uint64_t v18 = [v15 appleMailMessageId:v16 fromSource:v17];
      [(SGEntity *)v12 addTag:v18];
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v19 = [v5 mailboxIdentifiers];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v48;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v48 != v22) {
            objc_enumerationMutation(v19);
          }
          long long v24 = [MEMORY[0x1E4F5D9F0] mailboxIdentifier:*(void *)(*((void *)&v47 + 1) + 8 * v23)];
          [(SGEntity *)v12 addTag:v24];

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v21);
    }

    if ([v5 isSent])
    {
      long long v25 = [MEMORY[0x1E4F5D9F0] isSent];
      [(SGEntity *)v12 addTag:v25];
    }
    long long v26 = [v5 date];
    [v26 timeIntervalSince1970];
    double v28 = v27;
    -[SGPipelineEntity setLastModifiedTimestamp:](v12, "setLastModifiedTimestamp:");
    [(SGPipelineEntity *)v12 setCreationTimestamp:v28];

    v12->_inhumanFeatures.hasInhumanHeaders = [v5 hasInhumanHeaders];
    v29 = [v5 from];

    if (v29)
    {
      if ([MEMORY[0x1E4F5DAF0] detectContacts])
      {
        v30 = [v5 author];
        [(SGEntity *)v12 setAuthor:v30];
      }
      else
      {
        v30 = sgLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1CA650000, v30, OS_LOG_TYPE_DEBUG, "Skipping setAuthor: detectContacts is OFF", buf, 2u);
        }
      }
    }
    id v6 = v44;
    if ([v5 hasInhumanHeaders])
    {
      v12->_messageInhumannessChecked = 1;
      v31 = [MEMORY[0x1E4F5D9F0] inhuman];
      [(SGEntity *)v12 addTag:v31];
    }
    if ([v5 isPartiallyDownloaded])
    {
      v32 = [MEMORY[0x1E4F5D9F0] isPartiallyDownloaded];
      [(SGEntity *)v12 addTag:v32];
    }
    v33 = [v5 mailingList];
    v34 = v33;
    if (v33)
    {
      v35 = (void *)MEMORY[0x1E4F5D9F0];
      v36 = [v33 emailAddress];
      v37 = [v35 mailingListId:v36];
      [(SGEntity *)v12 addTag:v37];
    }
    uint64_t v38 = [v5 accountType];
    accountType = v12->_accountType;
    v12->_accountType = (NSString *)v38;

    objc_storeStrong((id *)&v12->_message, a3);
    objc_storeStrong((id *)&v12->_mailMessage, a3);
    id v40 = objc_alloc(MEMORY[0x1E4F93B68]);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __41__SGPipelineEntity_initWithEmailMessage___block_invoke;
    v45[3] = &unk_1E65BB830;
    id v46 = v5;
    uint64_t v41 = [v40 initWithBlock:v45];
    lazySnippetsContent = v12->_lazySnippetsContent;
    v12->_lazySnippetsContent = (_PASLazyResult *)v41;
  }

  return v12;
}

id __41__SGPipelineEntity_initWithEmailMessage___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) textContent];
  uint64_t v3 = [*(id *)(a1 + 32) textContent];
  unint64_t v4 = [v3 length];

  if (v4 >= 0x190) {
    uint64_t v5 = 400;
  }
  else {
    uint64_t v5 = v4;
  }
  id v6 = [v2 substringToIndex:v5];

  return v6;
}

- (SGPipelineEntity)initWithDuplicateKey:(id)a3 title:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SGPipelineEntity;
  long long v8 = [(SGEntity *)&v16 init];
  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    id v10 = (void *)*((void *)v8 + 32);
    *((void *)v8 + 32) = v9;

    uint64_t v11 = objc_opt_new();
    id v12 = (void *)*((void *)v8 + 33);
    *((void *)v8 + 33) = v11;

    v8[272] = 0;
    v8[288] = 0;
    *(_OWORD *)(v8 + 504) = xmmword_1CA8CB4A0;
    uint64_t v13 = objc_opt_new();
    double v14 = (void *)*((void *)v8 + 53);
    *((void *)v8 + 53) = v13;

    *(void *)(v8 + 290) = 196351;
    v8[298] = 0;
    v8[368] = 0;
    v8[392] = 0;
    *(_OWORD *)(v8 + 376) = xmmword_1CA8CB4A0;
    v17.__sig = 0;
    *(void *)v17.__opaque = 0;
    pthread_mutexattr_init(&v17);
    pthread_mutexattr_settype(&v17, 2);
    pthread_mutex_init((pthread_mutex_t *)(v8 + 304), &v17);
    pthread_mutexattr_destroy(&v17);
    [v8 setDuplicateKey:v6];
    [v8 setTitle:v7];
  }

  return (SGPipelineEntity *)v8;
}

+ (id)fromCloudKitRecord:(id)a3
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [v3 objectForKeyedSubscript:@"m"];
  unint64_t v5 = [v4 unsignedLongLongValue];

  if (v5 >= 5)
  {
    id v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [v3 objectForKeyedSubscript:@"v"];
      long long v8 = [v3 objectForKeyedSubscript:@"m"];
      *(_DWORD *)buf = 138412802;
      uint64_t v123 = (uint64_t)v7;
      __int16 v124 = 2112;
      v125 = v8;
      __int16 v126 = 2112;
      v127 = &unk_1F2535E80;
      _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_INFO, "SGCK Skipping unsupported CloudKit record (record created by version: %@, version required to process record: %@, version running on this device: %@)", buf, 0x20u);
    }
    goto LABEL_27;
  }
  uint64_t v9 = [v3 objectForKeyedSubscript:@"v"];
  unint64_t v10 = [v9 unsignedLongLongValue];

  if (v10 < 3)
  {
    long long v50 = sgLogHandle();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v50, OS_LOG_TYPE_INFO, "SGCK Reading pre-Manatee CloudKit record.", buf, 2u);
    }

    id v6 = [v3 objectForKeyedSubscript:@"p"];
    if (!v6) {
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v11 = [v3 encryptedValues];
    id v6 = [v11 objectForKeyedSubscript:@"pe"];

    if (!v6)
    {
LABEL_27:
      v51 = 0;
      goto LABEL_90;
    }
  }
  id v12 = [MEMORY[0x1E4F93AE0] decompress:v6];
  if (v12)
  {
    uint64_t v13 = [[SGDCKEvent alloc] initWithData:v12];
    if (!v13)
    {
      v51 = 0;
LABEL_88:

      goto LABEL_89;
    }
    double v14 = [v3 objectForKeyedSubscript:@"v"];
    unint64_t v15 = [v14 unsignedLongLongValue];

    if (v15 < 4) {
      goto LABEL_9;
    }
    if ([(SGDCKEvent *)v13 hasParentEntityType])
    {
      uint64_t v52 = [(SGDCKEvent *)v13 parentEntityType];
      if (v52 != 16)
      {
        uint64_t v53 = v52;
        if (v52 == 18)
        {
LABEL_9:
          uint64_t v16 = *MEMORY[0x1E4F5DC60];
          pthread_mutexattr_t v17 = +[SGDuplicateKey duplicateKeyForWebPageFromSource:*MEMORY[0x1E4F5DC60]];
          uint64_t v18 = [[SGPipelineEntity alloc] initWithDuplicateKey:v17 title:@"ck"];
          [(SGEntity *)v18 setSourceKey:v16];
          goto LABEL_10;
        }
        uint64_t v54 = sgLogHandle();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v123 = v53;
          v55 = "SGCK Error: Record contained unsupported entity type %lld";
          v56 = v54;
          uint32_t v57 = 12;
LABEL_100:
          _os_log_error_impl(&dword_1CA650000, v56, OS_LOG_TYPE_ERROR, v55, buf, v57);
        }
LABEL_47:
        v51 = 0;
LABEL_87:

        goto LABEL_88;
      }
      if ([(SGDCKEvent *)v13 hasInteractionInfo])
      {
        uint64_t v54 = [(SGDCKEvent *)v13 interactionInfo];
        if ([v54 hasInteractionBundleId])
        {
          pthread_mutexattr_t v17 = [v54 interactionBundleId];
          v75 = [SGPipelineEntity alloc];
          v76 = [v54 interactionId];
          uint64_t v18 = [(SGPipelineEntity *)v75 initWithInteractionIdentifier:v76 fromBundleIdentifier:v17];

LABEL_10:
          uint64_t v19 = [(SGDCKEvent *)v13 groupId];
          uint64_t v20 = [(SGEntity *)v18 duplicateKey];
          uint64_t v21 = +[SGDuplicateKey duplicateKeyForPseudoEventWithGroupId:v19 parentKey:v20];

          uint64_t v22 = [SGPipelineEnrichment alloc];
          uint64_t v23 = [(SGDCKEvent *)v13 title];
          v118 = (void *)v21;
          long long v24 = [(SGPipelineEnrichment *)v22 initWithDuplicateKey:v21 title:v23 parent:v18];

          [(SGDCKEvent *)v13 creationTimestamp];
          -[SGPipelineEnrichment setCreationTimestamp:](v24, "setCreationTimestamp:");
          [(SGDCKEvent *)v13 lastModifiedTimestamp];
          -[SGPipelineEnrichment setLastModifiedTimestamp:](v24, "setLastModifiedTimestamp:");
          long long v25 = [(SGDCKEvent *)v13 extraKey];

          if (v25)
          {
            long long v26 = (void *)MEMORY[0x1E4F5D9F0];
            double v27 = [(SGDCKEvent *)v13 extraKey];
            double v28 = [v26 extraKey:v27];
            [(SGEntity *)v24 addTag:v28];
          }
          if ([(SGDCKEvent *)v13 cancelled])
          {
            v29 = [MEMORY[0x1E4F5D9F0] extractedEventCancellation];
            [(SGEntity *)v24 addTag:v29];
          }
          if ([(SGDCKEvent *)v13 allDay])
          {
            v30 = [MEMORY[0x1E4F5D9F0] allDay];
            [(SGEntity *)v24 addTag:v30];
          }
          v31 = [(SGDCKEvent *)v13 domain];

          if (v31)
          {
            v32 = (void *)MEMORY[0x1E4F5D9F0];
            v33 = [(SGDCKEvent *)v13 domain];
            v34 = [v32 domain:v33];
            [(SGEntity *)v24 addTag:v34];
          }
          v35 = [(SGDCKEvent *)v13 templateName];

          if (v35)
          {
            v36 = (void *)MEMORY[0x1E4F5D9F0];
            v37 = [(SGDCKEvent *)v13 templateName];
            uint64_t v38 = [v36 extractedFromTemplateWithName:v37];
            [(SGEntity *)v24 addTag:v38];
          }
          uint64_t v39 = objc_msgSend(MEMORY[0x1E4F5D9F0], "categoryTagWithCategoryType:", -[SGDCKEvent categoryType](v13, "categoryType"));
          if (v39) {
            [(SGEntity *)v24 addTag:v39];
          }
          id v40 = [(SGDCKEvent *)v13 when];
          [v40 start];
          double v42 = v41;
          [v40 end];
          double v44 = v43;
          int v45 = [v40 hasStartUTCOffsetSeconds];
          id v46 = (void *)MEMORY[0x1E4F5DB40];
          v116 = v40;
          v117 = (void *)v39;
          if (v45)
          {
            long long v47 = objc_msgSend(MEMORY[0x1E4F1CAF0], "timeZoneForSecondsFromGMT:", objc_msgSend(v40, "startUTCOffsetSeconds"));
            long long v48 = objc_msgSend(MEMORY[0x1E4F1CAF0], "timeZoneForSecondsFromGMT:", objc_msgSend(v40, "endUTCOffsetSeconds"));
            uint64_t v49 = [v46 rangeWithStart:v47 startTimeZone:v48 end:v42 endTimeZone:v44];
          }
          else
          {
            uint64_t v49 = [MEMORY[0x1E4F5DB40] floatingRangeWithUTCStart:v42 end:v44];
          }
          [(SGEntity *)v24 setTimeRange:v49];
          v58 = [(SGEntity *)v24 locations];
          v59 = [(SGDCKEvent *)v13 locations];
          v60 = sgMap();
          [v58 addObjectsFromArray:v60];

          v61 = [(SGDCKEvent *)v13 content];

          if (v61)
          {
            v62 = [(SGDCKEvent *)v13 content];
            [(SGEntity *)v24 setContent:v62];
          }
          unint64_t v63 = 0x1E4F5D000uLL;
          if ([(SGDCKEvent *)v13 hasExtraKey])
          {
            v64 = (void *)MEMORY[0x1E4F5D9F0];
            v65 = [(SGDCKEvent *)v13 extraKey];
            v66 = [v64 extraKey:v65];
            [(SGEntity *)v24 addTag:v66];
          }
          v115 = (void *)v49;
          if ([(SGDCKEvent *)v13 cancelled])
          {
            v67 = [MEMORY[0x1E4F5D9F0] extractedEventCancellation];
            [(SGEntity *)v24 addTag:v67];
          }
          if ([(SGDCKEvent *)v13 hasSchemaOrg])
          {
            v68 = v18;
            v69 = (void *)MEMORY[0x1E4F28F98];
            v70 = [(SGDCKEvent *)v13 schemaOrg];
            id v121 = 0;
            v71 = [v69 propertyListWithData:v70 options:0 format:0 error:&v121];
            id v72 = v121;

            if (v71)
            {
              uint64_t v73 = [MEMORY[0x1E4F5D9F0] schemaOrg:v71];
              if (v73)
              {
                v74 = v73;
                [(SGEntity *)v24 addTag:v73];
              }
              else
              {
                v77 = sgLogHandle();
                if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v123 = (uint64_t)v72;
                  _os_log_error_impl(&dword_1CA650000, v77, OS_LOG_TYPE_ERROR, "SGCK Error decoding schema.org plist: %@", buf, 0xCu);
                }

                v74 = 0;
              }
            }
            else
            {
              v74 = sgLogHandle();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v123 = (uint64_t)v72;
                _os_log_error_impl(&dword_1CA650000, v74, OS_LOG_TYPE_ERROR, "SGCK error decoding schema.org plist: %@", buf, 0xCu);
              }
            }

            uint64_t v18 = v68;
            unint64_t v63 = 0x1E4F5D000;
          }
          if ([(SGDCKEvent *)v13 hasMetadata])
          {
            v114 = v18;
            v78 = (void *)MEMORY[0x1E4F28F98];
            v79 = [(SGDCKEvent *)v13 metadata];
            id v120 = 0;
            v80 = [v78 propertyListWithData:v79 options:0 format:0 error:&v120];
            id v81 = v120;

            if (v80)
            {
              id v119 = v81;
              v82 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v80 options:0 error:&v119];
              id v83 = v119;

              if (v82)
              {
                v84 = (void *)[[NSString alloc] initWithData:v82 encoding:4];
                if (v84)
                {
                  v85 = [MEMORY[0x1E4F5D9F0] eventMetadata:v84];
                  [(SGEntity *)v24 addTag:v85];
                }
              }
            }
            else
            {
              v82 = sgLogHandle();
              if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v123 = (uint64_t)v81;
                _os_log_error_impl(&dword_1CA650000, v82, OS_LOG_TYPE_ERROR, "SGCK Error decoding metadata plist: %@", buf, 0xCu);
              }
              id v83 = v81;
            }

            uint64_t v18 = v114;
            unint64_t v63 = 0x1E4F5D000uLL;
          }
          v86 = [(SGEntity *)v18 duplicateKey];
          if ([v86 entityType] == 16)
          {
            v87 = [(SGEntity *)v24 duplicateKey];
            uint64_t v88 = [v87 entityType];

            if (v88 != 2)
            {
LABEL_84:
              v111 = [*(id *)(v63 + 2544) fromSync];
              [(SGEntity *)v24 addTag:v111];

              if (v24)
              {
                [(SGEntity *)v24 lastModifiedTimestamp];
                -[SGPipelineEntity setLastModifiedTimestamp:](v18, "setLastModifiedTimestamp:");
                [(SGEntity *)v24 creationTimestamp];
                -[SGPipelineEntity setCreationTimestamp:](v18, "setCreationTimestamp:");
                [(SGPipelineEntity *)v18 addEnrichment:v24];
              }
              uint64_t v54 = v18;

              v51 = v54;
              goto LABEL_87;
            }
            v86 = [(SGDCKEvent *)v13 interactionInfo];
            if ([v86 hasInteractionId])
            {
              v89 = [*(id *)(v63 + 2544) fromInteraction];
              [(SGEntity *)v24 addTag:v89];

              v90 = *(void **)(v63 + 2544);
              v91 = [v86 interactionId];
              v92 = [v90 interactionId:v91];
              [(SGEntity *)v24 addTag:v92];
            }
            if ([v86 hasInteractionGroupId])
            {
              v93 = *(void **)(v63 + 2544);
              v94 = [v86 interactionGroupId];
              v95 = [v93 interactionGroupId:v94];
              [(SGEntity *)v24 addTag:v95];
            }
            if ([v86 hasInteractionTeamId])
            {
              v96 = *(void **)(v63 + 2544);
              v97 = [v86 interactionTeamId];
              v98 = [v96 interactionTeamId:v97];
              [(SGEntity *)v24 addTag:v98];
            }
            if ([v86 hasInteractionBundleId])
            {
              v99 = *(void **)(v63 + 2544);
              v100 = [v86 interactionBundleId];
              v101 = [v99 interactionBundleId:v100];
              [(SGEntity *)v24 addTag:v101];
            }
            if ([v86 hasReservationItemReferences])
            {
              v102 = *(void **)(v63 + 2544);
              v103 = [v86 reservationItemReferences];
              v104 = [v102 reservationItemReferencesWithData:v103];
              [(SGEntity *)v24 addTag:v104];
            }
            if ([v86 hasReservationContainerReference])
            {
              v105 = *(void **)(v63 + 2544);
              v106 = [v86 reservationContainerReference];
              v107 = [v105 reservationContainerReferenceWithData:v106];
              [(SGEntity *)v24 addTag:v107];
            }
            if ([v86 hasIntentResponseUserActivityString])
            {
              v108 = *(void **)(v63 + 2544);
              v109 = [v86 intentResponseUserActivityString];
              v110 = [v108 intentResponseUserActivityString:v109];
              [(SGEntity *)v24 addTag:v110];
            }
          }

          goto LABEL_84;
        }
        v113 = sgLogHandle();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA650000, v113, OS_LOG_TYPE_ERROR, "SGCK Error: Record with type interaction is missing interaction bundle id.", buf, 2u);
        }

        goto LABEL_47;
      }
      uint64_t v54 = sgLogHandle();
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        goto LABEL_47;
      }
      *(_WORD *)buf = 0;
      v55 = "SGCK Error: Record with type interaction is missing interaction info.";
    }
    else
    {
      uint64_t v54 = sgLogHandle();
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        goto LABEL_47;
      }
      *(_WORD *)buf = 0;
      v55 = "SGCK Error: Record version higher than 3 did not contain parent entity type.";
    }
    v56 = v54;
    uint32_t v57 = 2;
    goto LABEL_100;
  }
  v51 = 0;
LABEL_89:

LABEL_90:
  return v51;
}

SGStorageLocation *__55__SGPipelineEntity_CloudKitRecord__fromCloudKitRecord___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SGStorageLocation alloc];
  uint64_t v4 = [v2 locationType];
  unint64_t v5 = [v2 label];
  id v6 = [v2 address];
  id v7 = [v2 airportCode];
  if ([v2 hasLatitude])
  {
    [v2 latitude];
    double v9 = v8;
  }
  else
  {
    double v9 = NAN;
  }
  if ([v2 hasLongitude])
  {
    [v2 longitude];
    double v11 = v10;
  }
  else
  {
    double v11 = NAN;
  }
  [v2 accuracy];
  double v13 = v12;
  [v2 quality];
  double v15 = v14;
  uint64_t v16 = [v2 handle];
  pthread_mutexattr_t v17 = [(SGStorageLocation *)v3 initWithType:v4 label:v5 address:v6 airportCode:v7 latitude:v16 longitude:v9 accuracy:v11 quality:v13 handle:v15];

  return v17;
}

@end