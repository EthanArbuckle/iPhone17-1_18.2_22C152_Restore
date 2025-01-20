@interface SGMessage
+ (BOOL)supportsSecureCoding;
+ (id)fromDictionary:(id)a3;
+ (id)messageWithSearchableItem:(id)a3;
+ (id)preferredLanguages;
- (BOOL)isEqualToMessage:(id)a3;
- (BOOL)isInhumanContent;
- (BOOL)isInhumanContentNoncached;
- (BOOL)isInhumanSender;
- (BOOL)isSent;
- (BOOL)isStoredEncrypted;
- (NSArray)accountHandles;
- (NSArray)attachments;
- (NSArray)messageSubjectDetectedData;
- (NSArray)plainTextDetectedData;
- (NSArray)taggedCharacterRanges;
- (NSDate)date;
- (NSString)accountType;
- (NSString)bundleIdentifier;
- (NSString)contentProtection;
- (NSString)domainIdentifier;
- (NSString)mailConversationIdentifier;
- (NSString)source;
- (NSString)subject;
- (NSString)textContent;
- (NSString)textContentLanguageIdentifier;
- (NSString)uniqueIdentifier;
- (SGHarvestQueueMetrics)harvestMetrics;
- (SGMessage)initWithCoder:(id)a3;
- (SGMessage)initWithMailContentEvent:(id)a3 contentProtection:(id)a4;
- (SGMessage)initWithMessageDictionary:(id)a3;
- (SGMessage)initWithMessagesContentEvent:(id)a3 contentProtection:(id)a4;
- (SGMessage)initWithSearchableItem:(id)a3;
- (_NSRange)detectedDataSignatureRange;
- (id)asDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataDetectorMatchesWithSignature;
- (id)initForBuilding;
- (id)spotlightBundleIdentifier;
- (id)spotlightDomainIdentifier;
- (id)spotlightReference;
- (id)spotlightUniqueIdentifier;
- (int64_t)contentLength;
- (void)_dataDetectorMatchesWithSignatureCached;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountHandles:(id)a3;
- (void)setAccountType:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setContentProtection:(id)a3;
- (void)setDate:(id)a3;
- (void)setDomainIdentifier:(id)a3;
- (void)setHarvestMetrics:(id)a3;
- (void)setIsSent:(BOOL)a3;
- (void)setIsStoredEncrypted:(BOOL)a3;
- (void)setMailConversationIdentifier:(id)a3;
- (void)setSource:(id)a3;
- (void)setSubject:(id)a3;
- (void)setTextContent:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation SGMessage

- (id)spotlightReference
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SGMessage *)self spotlightBundleIdentifier];
  uint64_t v4 = [(SGMessage *)self spotlightUniqueIdentifier];
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    v7 = (void *)MEMORY[0x1E4F93858];
    v8 = [(SGMessage *)self spotlightDomainIdentifier];
    v11[0] = v5;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v6 = [v7 referenceWithBundleId:v3 domainId:v8 itemIds:v9];
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_harvestMetrics, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_accountHandles, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_mailConversationIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_textContent, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_textContentLanguageIdentifierCached, 0);
  objc_storeStrong((id *)&self->_dataDetectorMatchesWithSignatureForContentCached, 0);
  objc_storeStrong((id *)&self->_messageSubjectDetectedDataCached, 0);
  objc_storeStrong((id *)&self->_taggedCharacterRangesCached, 0);
  objc_storeStrong((id *)&self->_isInhumanContentCached, 0);
  objc_storeStrong((id *)&self->_isInhumanSenderCached, 0);
}

- (void)setContentProtection:(id)a3
{
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void)setHarvestMetrics:(id)a3
{
}

- (SGHarvestQueueMetrics)harvestMetrics
{
  return self->_harvestMetrics;
}

- (void)setIsStoredEncrypted:(BOOL)a3
{
  self->_isStoredEncrypted = a3;
}

- (BOOL)isStoredEncrypted
{
  return self->_isStoredEncrypted;
}

- (void)setAccountType:(id)a3
{
}

- (NSString)accountType
{
  return self->_accountType;
}

- (void)setIsSent:(BOOL)a3
{
  self->_isSent = a3;
}

- (BOOL)isSent
{
  return self->_isSent;
}

- (void)setAccountHandles:(id)a3
{
}

- (NSArray)accountHandles
{
  return self->_accountHandles;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setDomainIdentifier:(id)a3
{
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setMailConversationIdentifier:(id)a3
{
}

- (NSString)mailConversationIdentifier
{
  return self->_mailConversationIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setDate:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setSource:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setTextContent:(id)a3
{
}

- (NSString)textContent
{
  return self->_textContent;
}

- (void)setSubject:(id)a3
{
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setAttachments:(id)a3
{
}

- (id)spotlightUniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (id)spotlightDomainIdentifier
{
  return self->_domainIdentifier;
}

- (id)spotlightBundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)contentLength
{
  v2 = [(SGMessage *)self textContent];
  int64_t v3 = [v2 length];

  return v3;
}

- (_NSRange)detectedDataSignatureRange
{
  v2 = -[SGMessage _dataDetectorMatchesWithSignatureCached](self);
  uint64_t v3 = [v2 signatureRange];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)_dataDetectorMatchesWithSignatureCached
{
  if (a1)
  {
    v2 = (void *)a1[5];
    var28[0] = MEMORY[0x1E4F143A8];
    var28[1] = 3221225472;
    var28[2] = __52__SGMessage__dataDetectorMatchesWithSignatureCached__block_invoke;
    var28[3] = &unk_1E65BB8A0;
    var28[4] = a1;
    a1 = [v2 resultNonnullWithBlock:var28];
    uint64_t v1 = var28[6];
  }
  return a1;
}

id __52__SGMessage__dataDetectorMatchesWithSignatureCached__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) harvestMetrics];
  [v2 startTimer:kHarvestMetricsMessageDetectedData];

  uint64_t v3 = [*(id *)(a1 + 32) dataDetectorMatchesWithSignature];
  NSUInteger v4 = [*(id *)(a1 + 32) harvestMetrics];
  uint64_t v5 = kHarvestMetricsMessageDetectedData;
  NSUInteger v6 = [v3 matches];
  objc_msgSend(v4, "endTimer:significantWork:", v5, objc_msgSend(v6, "count") != 0);

  return v3;
}

- (NSArray)plainTextDetectedData
{
  v2 = -[SGMessage _dataDetectorMatchesWithSignatureCached](self);
  uint64_t v3 = [v2 matches];

  return (NSArray *)v3;
}

- (id)dataDetectorMatchesWithSignature
{
  uint64_t v3 = [(SGMessage *)self textContent];
  NSUInteger v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, objc_msgSend(v3, "length"));
  uint64_t v5 = [(SGMessage *)self date];
  NSUInteger v6 = +[SGDataDetectorMatch detectionsAndSignatureInText:v3 eligibleRegions:v4 baseDate:v5];

  return v6;
}

- (NSArray)messageSubjectDetectedData
{
  messageSubjectDetectedDataCached = self->_messageSubjectDetectedDataCached;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__SGMessage_messageSubjectDetectedData__block_invoke;
  v5[3] = &unk_1E65BB9A8;
  v5[4] = self;
  uint64_t v3 = [(_PASCachedResult *)messageSubjectDetectedDataCached resultNonnullWithBlock:v5];
  return (NSArray *)v3;
}

id __39__SGMessage_messageSubjectDetectedData__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) harvestMetrics];
  [v2 startTimer:kHarvestMetricsMessageSubjectDetectedData];

  uint64_t v3 = [*(id *)(a1 + 32) subject];
  NSUInteger v4 = [*(id *)(a1 + 32) date];
  uint64_t v5 = +[SGDataDetectorMatch detectionsInPlainText:v3 baseDate:v4];

  NSUInteger v6 = objc_msgSend(v5, "_pas_filteredArrayWithTest:", &__block_literal_global_76_30607);
  NSUInteger v7 = [*(id *)(a1 + 32) harvestMetrics];
  objc_msgSend(v7, "endTimer:significantWork:", kHarvestMetricsMessageSubjectDetectedData, objc_msgSend(v6, "count") != 0);

  return v6;
}

BOOL __39__SGMessage_messageSubjectDetectedData__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 matchType] == 7;
}

- (NSArray)taggedCharacterRanges
{
  taggedCharacterRangesCached = self->_taggedCharacterRangesCached;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SGMessage_taggedCharacterRanges__block_invoke;
  v5[3] = &unk_1E65BB9A8;
  v5[4] = self;
  uint64_t v3 = [(_PASCachedResult *)taggedCharacterRangesCached resultNonnullWithBlock:v5];
  return (NSArray *)v3;
}

id __34__SGMessage_taggedCharacterRanges__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v24 = objc_opt_new();
  v2 = [*(id *)(a1 + 32) textContent];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [*(id *)(a1 + 32) plainTextDetectedData];
  uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(obj);
        }
        NSUInteger v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1CB79B230]();
        v9 = (void *)MEMORY[0x1CB79B230]();
        uint64_t v10 = [v7 valueRange];
        v12 = objc_msgSend(v2, "substringWithRange:", v10, v11);
        if (v12)
        {
          v13 = [SGTaggedCharacterRange alloc];
          unsigned int v14 = [v7 matchType];
          v15 = @"SGDDMatchOther";
          if (v14 <= 8) {
            v15 = off_1E65B96D8[v14];
          }
          v16 = v15;
          v29 = v16;
          v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
          uint64_t v18 = [v7 valueRange];
          v20 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v13, "initWithAnnotationType:tags:range:text:", 1, v17, v18, v19, v12);
          [v24 addObject:v20];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v4);
  }

  v21 = (void *)[v24 copy];
  return v21;
}

- (BOOL)isInhumanContent
{
  isInhumanContentCached = self->_isInhumanContentCached;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__SGMessage_isInhumanContent__block_invoke;
  v6[3] = &unk_1E65BB858;
  v6[4] = self;
  uint64_t v3 = [(_PASCachedResult *)isInhumanContentCached resultNonnullWithBlock:v6];
  char v4 = [v3 BOOLValue];

  return v4;
}

uint64_t __29__SGMessage_isInhumanContent__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) harvestMetrics];
  [v2 startTimer:kHarvestMetricsMessageInhumanBody];

  uint64_t v3 = [*(id *)(a1 + 32) isInhumanContentNoncached];
  char v4 = [*(id *)(a1 + 32) harvestMetrics];
  [v4 endTimer:kHarvestMetricsMessageInhumanBody significantWork:v3];

  uint64_t v5 = NSNumber;
  return [v5 numberWithBool:v3];
}

- (BOOL)isInhumanContentNoncached
{
  v2 = [(SGMessage *)self textContent];
  if (v2) {
    BOOL v3 = +[SGInhumans isInhumanBody:v2];
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)isInhumanSender
{
  isInhumanSenderCached = self->_isInhumanSenderCached;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__SGMessage_isInhumanSender__block_invoke;
  v6[3] = &unk_1E65BB858;
  v6[4] = self;
  BOOL v3 = [(_PASCachedResult *)isInhumanSenderCached resultNonnullWithBlock:v6];
  char v4 = [v3 BOOLValue];

  return v4;
}

id __28__SGMessage_isInhumanSender__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) author];
  v2 = NSNumber;
  if (v1) {
    BOOL v3 = +[SGInhumans isInhumanPerson:v1];
  }
  else {
    BOOL v3 = 0;
  }
  char v4 = [v2 numberWithInt:v3];

  return v4;
}

- (NSString)textContentLanguageIdentifier
{
  textContentLanguageIdentifierCached = self->_textContentLanguageIdentifierCached;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__SGMessage_textContentLanguageIdentifier__block_invoke;
  v5[3] = &unk_1E65BB830;
  v5[4] = self;
  BOOL v3 = [(_PASCachedResult *)textContentLanguageIdentifierCached resultNonnullWithBlock:v5];
  return (NSString *)v3;
}

id __42__SGMessage_textContentLanguageIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) textContent];
  if (v1)
  {
    v2 = (void *)MEMORY[0x1E4F89D60];
    BOOL v3 = +[SGMessage preferredLanguages];
    char v4 = [v2 detectLanguageFromTextHeuristicallyWithLanguages:v1 languages:v3 defaultLanguage:0];
    uint64_t v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      NSUInteger v7 = [MEMORY[0x1E4F1CA20] currentLocale];
      id v6 = [v7 languageCode];
    }
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v6 = [v3 languageCode];
  }

  return v6;
}

- (id)asDictionary
{
  if (asDictionary_onceToken_30617 != -1) {
    dispatch_once(&asDictionary_onceToken_30617, &__block_literal_global_30618);
  }
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionaryWithSharedKeySet:asDictionary_sharedKeySet_30620];
  char v4 = v3;
  textContent = self->_textContent;
  if (textContent) {
    [v3 setObject:textContent forKeyedSubscript:@"body"];
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v4 setObject:bundleIdentifier forKeyedSubscript:@"bundleIdentifier"];
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier) {
    [v4 setObject:uniqueIdentifier forKeyedSubscript:@"uniqueIdentifier"];
  }
  mailConversationIdentifier = self->_mailConversationIdentifier;
  if (mailConversationIdentifier) {
    [v4 setObject:mailConversationIdentifier forKeyedSubscript:@"mailConversationIdentifier"];
  }
  domainIdentifier = self->_domainIdentifier;
  if (domainIdentifier) {
    [v4 setObject:domainIdentifier forKeyedSubscript:@"domainIdentifier"];
  }
  subject = self->_subject;
  if (subject) {
    [v4 setObject:subject forKeyedSubscript:@"subject"];
  }
  date = self->_date;
  if (date)
  {
    v12 = NSNumber;
    [(NSDate *)date timeIntervalSince1970];
    unsigned int v14 = [v12 numberWithLong:(uint64_t)v13];
    [v4 setObject:v14 forKeyedSubscript:@"date"];
  }
  if (self->_isSent) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isSent"];
  }
  accountType = self->_accountType;
  if (accountType) {
    [v4 setObject:accountType forKeyedSubscript:@"accountType"];
  }
  if (self->_isStoredEncrypted) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isStoredEncrypted"];
  }
  source = self->_source;
  if (source) {
    [v4 setObject:source forKeyedSubscript:@"sourceId"];
  }
  contentProtection = self->_contentProtection;
  if (contentProtection) {
    [v4 setObject:contentProtection forKeyedSubscript:@"contentProtection"];
  }
  return v4;
}

uint64_t __25__SGMessage_asDictionary__block_invoke()
{
  asDictionary_sharedKeySet_30620 = [MEMORY[0x1E4F1C9E8] sharedKeySetForKeys:&unk_1F2536B30];
  return MEMORY[0x1F41817F8]();
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(SGMessage *)self textContent];
  [v4 setTextContent:v5];

  id v6 = [(SGMessage *)self subject];
  [v4 setSubject:v6];

  NSUInteger v7 = [(SGMessage *)self date];
  [v4 setDate:v7];

  v8 = [(SGMessage *)self source];
  [v4 setSource:v8];

  v9 = [(SGMessage *)self bundleIdentifier];
  [v4 setBundleIdentifier:v9];

  uint64_t v10 = [(SGMessage *)self uniqueIdentifier];
  [v4 setUniqueIdentifier:v10];

  uint64_t v11 = [(SGMessage *)self mailConversationIdentifier];
  [v4 setMailConversationIdentifier:v11];

  v12 = [(SGMessage *)self domainIdentifier];
  [v4 setDomainIdentifier:v12];

  [v4 setIsSent:self->_isSent];
  [v4 setAccountType:self->_accountType];
  [v4 setIsStoredEncrypted:self->_isStoredEncrypted];
  [v4 setContentProtection:self->_contentProtection];
  return v4;
}

- (BOOL)isEqualToMessage:(id)a3
{
  char v4 = (SGMessage *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    textContent = self->_textContent;
    NSUInteger v7 = v4->_textContent;
    if (textContent == v7)
    {
    }
    else
    {
      v8 = v7;
      v9 = textContent;
      char v10 = [(NSString *)v9 isEqual:v8];

      if ((v10 & 1) == 0) {
        goto LABEL_43;
      }
    }
    subject = self->_subject;
    double v13 = v5->_subject;
    if (subject == v13)
    {
    }
    else
    {
      unsigned int v14 = v13;
      v15 = subject;
      char v16 = [(NSString *)v15 isEqual:v14];

      if ((v16 & 1) == 0) {
        goto LABEL_43;
      }
    }
    date = self->_date;
    uint64_t v18 = v5->_date;
    if (date == v18)
    {
    }
    else
    {
      uint64_t v19 = v18;
      v20 = date;
      char v21 = [(NSDate *)v20 isEqual:v19];

      if ((v21 & 1) == 0) {
        goto LABEL_43;
      }
    }
    source = self->_source;
    v23 = v5->_source;
    if (source == v23)
    {
    }
    else
    {
      v24 = v23;
      long long v25 = source;
      char v26 = [(NSString *)v25 isEqual:v24];

      if ((v26 & 1) == 0) {
        goto LABEL_43;
      }
    }
    bundleIdentifier = self->_bundleIdentifier;
    long long v28 = v5->_bundleIdentifier;
    if (bundleIdentifier == v28)
    {
    }
    else
    {
      v29 = v28;
      v30 = bundleIdentifier;
      char v31 = [(NSString *)v30 isEqual:v29];

      if ((v31 & 1) == 0) {
        goto LABEL_43;
      }
    }
    uniqueIdentifier = self->_uniqueIdentifier;
    v33 = v5->_uniqueIdentifier;
    if (uniqueIdentifier == v33)
    {
    }
    else
    {
      v34 = v33;
      v35 = uniqueIdentifier;
      char v36 = [(NSString *)v35 isEqual:v34];

      if ((v36 & 1) == 0) {
        goto LABEL_43;
      }
    }
    mailConversationIdentifier = self->_mailConversationIdentifier;
    v38 = v5->_mailConversationIdentifier;
    if (mailConversationIdentifier == v38)
    {
    }
    else
    {
      v39 = v38;
      v40 = mailConversationIdentifier;
      char v41 = [(NSString *)v40 isEqual:v39];

      if ((v41 & 1) == 0) {
        goto LABEL_43;
      }
    }
    domainIdentifier = self->_domainIdentifier;
    v43 = v5->_domainIdentifier;
    if (domainIdentifier == v43)
    {
    }
    else
    {
      v44 = v43;
      v45 = domainIdentifier;
      char v46 = [(NSString *)v45 isEqual:v44];

      if ((v46 & 1) == 0) {
        goto LABEL_43;
      }
    }
    BOOL isSent = self->_isSent;
    if (isSent != [(SGMessage *)v5 isSent]) {
      goto LABEL_43;
    }
    accountType = self->_accountType;
    v49 = v5->_accountType;
    if (accountType == v49)
    {
    }
    else
    {
      v50 = v49;
      v51 = accountType;
      char v52 = [(NSString *)v51 isEqual:v50];

      if ((v52 & 1) == 0) {
        goto LABEL_43;
      }
    }
    BOOL isStoredEncrypted = self->_isStoredEncrypted;
    if (isStoredEncrypted != [(SGMessage *)v5 isStoredEncrypted])
    {
LABEL_43:
      char v11 = 0;
      goto LABEL_44;
    }
    v54 = self->_contentProtection;
    v55 = v54;
    if (v54 == v5->_contentProtection) {
      char v11 = 1;
    }
    else {
      char v11 = -[NSString isEqual:](v54, "isEqual:");
    }
  }
LABEL_44:

  return v11;
}

- (SGMessage)initWithMessageDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SGMessage *)self init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"body"];
    [(SGMessage *)v5 setTextContent:v6];

    NSUInteger v7 = [v4 objectForKeyedSubscript:@"date"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [v4 objectForKeyedSubscript:@"date"];
      [(SGMessage *)v5 setDate:v8];
    }
    else
    {
      v9 = (void *)MEMORY[0x1E4F1C9C8];
      v8 = [v4 objectForKeyedSubscript:@"date"];
      char v10 = objc_msgSend(v9, "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v8, "longValue"));
      [(SGMessage *)v5 setDate:v10];
    }
    char v11 = [v4 objectForKeyedSubscript:@"subject"];
    [(SGMessage *)v5 setSubject:v11];

    v12 = [v4 objectForKeyedSubscript:@"bundleIdentifier"];
    [(SGMessage *)v5 setBundleIdentifier:v12];

    double v13 = [v4 objectForKeyedSubscript:@"uniqueIdentifier"];
    [(SGMessage *)v5 setUniqueIdentifier:v13];

    unsigned int v14 = [v4 objectForKeyedSubscript:@"mailConversationIdentifier"];
    [(SGMessage *)v5 setMailConversationIdentifier:v14];

    v15 = [v4 objectForKeyedSubscript:@"domainIdentifier"];
    [(SGMessage *)v5 setDomainIdentifier:v15];

    char v16 = [v4 objectForKeyedSubscript:@"accountHandles"];
    [(SGMessage *)v5 setAccountHandles:v16];

    uint64_t v17 = [v4 objectForKeyedSubscript:@"attachments"];
    attachments = v5->_attachments;
    v5->_attachments = (NSArray *)v17;

    uint64_t v19 = [v4 objectForKeyedSubscript:@"isSent"];
    v5->_BOOL isSent = [v19 BOOLValue];

    v20 = [v4 objectForKeyedSubscript:@"accountType"];
    [(SGMessage *)v5 setAccountType:v20];

    char v21 = [v4 objectForKeyedSubscript:@"isStoredEncrypted"];
    v5->_BOOL isStoredEncrypted = [v21 BOOLValue];

    uint64_t v22 = [v4 objectForKeyedSubscript:@"sourceId"];
    v23 = (void *)v22;
    if (v22) {
      v24 = (__CFString *)v22;
    }
    else {
      v24 = @"test-source";
    }
    [(SGMessage *)v5 setSource:v24];

    long long v25 = [v4 objectForKeyedSubscript:@"contentProtection"];
    [(SGMessage *)v5 setContentProtection:v25];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  textContent = self->_textContent;
  id v5 = a3;
  [v5 encodeObject:textContent forKey:@"textContent"];
  [v5 encodeObject:self->_subject forKey:@"subject"];
  [v5 encodeObject:self->_date forKey:@"date"];
  [v5 encodeObject:self->_source forKey:@"source"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  [v5 encodeObject:self->_uniqueIdentifier forKey:@"uniqueIdentifier"];
  [v5 encodeObject:self->_mailConversationIdentifier forKey:@"mailConversationIdentifier"];
  [v5 encodeObject:self->_domainIdentifier forKey:@"domainIdentifier"];
  [v5 encodeBool:self->_isSent forKey:@"isSent"];
  [v5 encodeObject:self->_accountType forKey:@"accountType"];
  [v5 encodeBool:self->_isStoredEncrypted forKey:@"isStoredEncrypted"];
  [v5 encodeObject:self->_contentProtection forKey:@"contentProtection"];
}

- (SGMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SGMessage *)self init];
  if (v5)
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"textContent"];
    textContent = v5->_textContent;
    v5->_textContent = (NSString *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"subject"];
    subject = v5->_subject;
    v5->_subject = (NSString *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"source"];
    source = v5->_source;
    v5->_source = (NSString *)v16;

    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v19;

    char v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"uniqueIdentifier"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v22;

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"mailConversationIdentifier"];
    mailConversationIdentifier = v5->_mailConversationIdentifier;
    v5->_mailConversationIdentifier = (NSString *)v25;

    long long v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"domainIdentifier"];
    domainIdentifier = v5->_domainIdentifier;
    v5->_domainIdentifier = (NSString *)v28;

    v5->_BOOL isSent = [v4 decodeBoolForKey:@"isSent"];
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"accountType"];
    accountType = v5->_accountType;
    v5->_accountType = (NSString *)v31;

    v5->_BOOL isStoredEncrypted = [v4 decodeBoolForKey:@"isStoredEncrypted"];
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"contentProtection"];
    contentProtection = v5->_contentProtection;
    v5->_contentProtection = (NSString *)v34;
  }
  return v5;
}

- (SGMessage)initWithMessagesContentEvent:(id)a3 contentProtection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SGMessage *)self init];
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v6 absoluteTimestamp];
    uint64_t v10 = objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
    date = v8->_date;
    v8->_date = (NSDate *)v10;

    objc_storeStrong((id *)&v8->_bundleIdentifier, (id)*MEMORY[0x1E4F937C0]);
    uint64_t v12 = [v6 uniqueId];
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSString *)v12;

    uint64_t v14 = [v6 domainId];
    domainIdentifier = v8->_domainIdentifier;
    v8->_domainIdentifier = (NSString *)v14;

    uint64_t v16 = [v6 domainId];
    source = v8->_source;
    v8->_source = (NSString *)v16;

    uint64_t v18 = [v6 accountHandles];
    accountHandles = v8->_accountHandles;
    v8->_accountHandles = (NSArray *)v18;

    uint64_t v20 = [v6 accountType];
    accountType = v8->_accountType;
    v8->_accountType = (NSString *)v20;

    v8->_BOOL isStoredEncrypted = 0;
    objc_storeStrong((id *)&v8->_contentProtection, a4);
  }

  return v8;
}

- (SGMessage)initWithMailContentEvent:(id)a3 contentProtection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SGMessage *)self init];
  if (v8)
  {
    uint64_t v9 = [v6 subject];
    subject = v8->_subject;
    v8->_subject = (NSString *)v9;

    id v11 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v6 absoluteTimestamp];
    uint64_t v12 = objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:");
    date = v8->_date;
    v8->_date = (NSDate *)v12;

    objc_storeStrong((id *)&v8->_bundleIdentifier, (id)*MEMORY[0x1E4F937B0]);
    uint64_t v14 = [v6 uniqueId];
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSString *)v14;

    uint64_t v16 = [v6 domainId];
    domainIdentifier = v8->_domainIdentifier;
    v8->_domainIdentifier = (NSString *)v16;

    uint64_t v18 = [v6 accountIdentifier];
    source = v8->_source;
    v8->_source = (NSString *)v18;

    uint64_t v20 = [v6 accountHandles];
    accountHandles = v8->_accountHandles;
    v8->_accountHandles = (NSArray *)v20;

    uint64_t v22 = [v6 accountType];
    accountType = v8->_accountType;
    v8->_accountType = (NSString *)v22;

    v24 = [v6 attachments];
    uint64_t v25 = +[SGMailAttachment attachmentsFromBiomeAttachments:v24];
    attachments = v8->_attachments;
    v8->_attachments = (NSArray *)v25;

    long long v27 = [v6 securityMethod];
    v8->_BOOL isStoredEncrypted = v27 != 0;

    objc_storeStrong((id *)&v8->_contentProtection, a4);
  }

  return v8;
}

- (SGMessage)initWithSearchableItem:(id)a3
{
  id v4 = a3;
  id v5 = [(SGMessage *)self init];
  if (v5)
  {
    id v6 = [v4 attributeSet];
    id v7 = [v6 subject];
    [(SGMessage *)v5 setSubject:v7];

    v8 = [MEMORY[0x1E4F93790] textContentNoCopyRetainingBackingBuffer:v4];
    [(SGMessage *)v5 setTextContent:v8];

    uint64_t v9 = [v6 contentCreationDate];
    [(SGMessage *)v5 setDate:v9];

    uint64_t v10 = [v4 bundleID];
    [(SGMessage *)v5 setBundleIdentifier:v10];

    id v11 = [v4 uniqueIdentifier];
    [(SGMessage *)v5 setUniqueIdentifier:v11];

    uint64_t v12 = [v6 attributeForKey:*MEMORY[0x1E4F236F0]];
    [(SGMessage *)v5 setMailConversationIdentifier:v12];

    uint64_t v13 = [v4 domainIdentifier];
    [(SGMessage *)v5 setDomainIdentifier:v13];

    uint64_t v14 = [v6 accountHandles];
    [(SGMessage *)v5 setAccountHandles:v14];

    v15 = [v6 accountType];
    [(SGMessage *)v5 setAccountType:v15];

    uint64_t v16 = [v4 domainIdentifier];
    [(SGMessage *)v5 setSource:v16];

    uint64_t v17 = +[SGMailAttachment attachmentsFromSearchableItem:v4];
    attachments = v5->_attachments;
    v5->_attachments = (NSArray *)v17;

    uint64_t v19 = (void *)MEMORY[0x1E4F93770];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __36__SGMessage_initWithSearchableItem___block_invoke;
    v25[3] = &unk_1E65BB808;
    id v20 = v4;
    id v26 = v20;
    char v21 = [v20 bundleID];
    v5->_BOOL isStoredEncrypted = [v19 searchableItemIsStoredEncryptedWithGetterBlock:v25 bundleIdentifier:v21];

    uint64_t v22 = [v20 protection];
    contentProtection = v5->_contentProtection;
    v5->_contentProtection = (NSString *)v22;
  }
  return v5;
}

id __36__SGMessage_initWithSearchableItem___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)initForBuilding
{
  v17.receiver = self;
  v17.super_class = (Class)SGMessage;
  v2 = [(SGMessage *)&v17 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    isInhumanSenderCached = v2->_isInhumanSenderCached;
    v2->_isInhumanSenderCached = (_PASCachedResult *)v3;

    uint64_t v5 = objc_opt_new();
    isInhumanContentCached = v2->_isInhumanContentCached;
    v2->_isInhumanContentCached = (_PASCachedResult *)v5;

    uint64_t v7 = objc_opt_new();
    textContentLanguageIdentifierCached = v2->_textContentLanguageIdentifierCached;
    v2->_textContentLanguageIdentifierCached = (_PASCachedResult *)v7;

    uint64_t v9 = objc_opt_new();
    taggedCharacterRangesCached = v2->_taggedCharacterRangesCached;
    v2->_taggedCharacterRangesCached = (_PASCachedResult *)v9;

    uint64_t v11 = objc_opt_new();
    messageSubjectDetectedDataCached = v2->_messageSubjectDetectedDataCached;
    v2->_messageSubjectDetectedDataCached = (_PASCachedResult *)v11;

    uint64_t v13 = objc_opt_new();
    dataDetectorMatchesWithSignatureForContentCached = v2->_dataDetectorMatchesWithSignatureForContentCached;
    v2->_dataDetectorMatchesWithSignatureForContentCached = (_PASCachedResult *)v13;

    source = v2->_source;
    v2->_source = (NSString *)@"Internal";

    objc_storeStrong((id *)&v2->_contentProtection, (id)*MEMORY[0x1E4F28378]);
  }
  return v2;
}

+ (id)preferredLanguages
{
  if (preferredLanguages__pasOnceToken4 != -1) {
    dispatch_once(&preferredLanguages__pasOnceToken4, &__block_literal_global_80_30700);
  }
  v2 = (void *)preferredLanguages__pasExprOnceResult;
  return v2;
}

void __31__SGMessage_preferredLanguages__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  id v1 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v2 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_83_30702);
  uint64_t v4 = [v1 initWithArray:v3];
  uint64_t v5 = (void *)preferredLanguages__pasExprOnceResult;
  preferredLanguages__pasExprOnceResult = v4;
}

id __31__SGMessage_preferredLanguages__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:a2];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];

  return v3;
}

+ (id)fromDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithMessageDictionary:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)messageWithSearchableItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithSearchableItem:v4];

  return v5;
}

@end