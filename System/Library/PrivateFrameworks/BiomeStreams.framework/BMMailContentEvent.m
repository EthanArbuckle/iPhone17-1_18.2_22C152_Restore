@interface BMMailContentEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMMailContentEvent)initWithCoder:(id)a3;
- (BMMailContentEvent)initWithProto:(id)a3;
- (BMMailContentEvent)initWithProtoData:(id)a3;
- (BMMailContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 accountIdentifier:(id)a6 messageIdentifier:(id)a7 fromHandle:(id)a8 toHandles:(id)a9 ccHandles:(id)a10 bccHandles:(id)a11 headers:(id)a12 subject:(id)a13 htmlContent:(id)a14 textContent:(id)a15 isFullyDownloaded:(BOOL)a16 securityMethod:(id)a17 accountHandles:(id)a18 replyTo:(id)a19 mailboxIdentifiers:(id)a20 listId:(id)a21 accountType:(id)a22 attachments:(id)a23;
- (BMMailContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 accountIdentifier:(id)a6 messageIdentifier:(id)a7 fromHandle:(id)a8 toHandles:(id)a9 ccHandles:(id)a10 bccHandles:(id)a11 headers:(id)a12 subject:(id)a13 htmlContent:(id)a14 textContent:(id)a15 isFullyDownloaded:(BOOL)a16 securityMethod:(id)a17 accountHandles:(id)a18 replyTo:(id)a19 mailboxIdentifiers:(id)a20 listId:(id)a21 accountType:(id)a22 attachments:(id)a23 contentProtection:(id)a24;
- (BMMailContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 accountIdentifier:(id)a7 messageIdentifier:(id)a8 fromHandle:(id)a9 toHandles:(id)a10 ccHandles:(id)a11 bccHandles:(id)a12 headers:(id)a13 subject:(id)a14 htmlContent:(id)a15 textContent:(id)a16 isFullyDownloaded:(BOOL)a17 securityMethod:(id)a18 accountHandles:(id)a19 replyTo:(id)a20 mailboxIdentifiers:(id)a21 listId:(id)a22 accountType:(id)a23 attachments:(id)a24 contentProtection:(id)a25;
- (BMMailContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 accountIdentifier:(id)a7 messageIdentifier:(id)a8 fromHandle:(id)a9 toHandles:(id)a10 ccHandles:(id)a11 bccHandles:(id)a12 headers:(id)a13 subject:(id)a14 htmlContent:(id)a15 textContent:(id)a16 isFullyDownloaded:(BOOL)a17 securityMethod:(id)a18 accountHandles:(id)a19 replyTo:(id)a20 mailboxIdentifiers:(id)a21 listId:(id)a22 accountType:(id)a23 attachments:(id)a24 contentProtection:(id)a25 conversationId:(id)a26 dateReceived:(id)a27 mailCategories:(id)a28 isNew:(id)a29 isTwoFactorCode:(id)a30 isFromMe:(id)a31 isJunk:(id)a32 isRead:(id)a33 isVIP:(id)a34 isFlagged:(id)a35;
- (BMNamedHandle)fromHandle;
- (BMNamedHandle)listId;
- (BMNamedHandle)replyTo;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)attachments;
- (NSArray)bccHandles;
- (NSArray)ccHandles;
- (NSArray)toHandles;
- (NSDate)dateReceived;
- (NSDictionary)headers;
- (NSNumber)isFlagged;
- (NSNumber)isFromMe;
- (NSNumber)isJunk;
- (NSNumber)isNew;
- (NSNumber)isRead;
- (NSNumber)isTwoFactorCode;
- (NSNumber)isVIP;
- (NSNumber)mailCategories;
- (NSString)debugDescription;
- (NSString)domainId;
- (NSString)personaId;
- (NSString)uniqueId;
- (id)_initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)_inflateFromProto:(id)a3;
- (void)_loadData;
- (void)encodeWithCoder:(id)a3;
- (void)json;
@end

@implementation BMMailContentEvent

- (id)proto
{
  [(BMMailContentEvent *)self _loadData];
  proto = self->_proto;

  return proto;
}

- (void)_inflateFromProto:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v5 = (BMPBMailContentEvent *)a3;
  if (self->_proto)
  {
    v66 = [MEMORY[0x1E4F28B00] currentHandler];
    [v66 handleFailureInMethod:a2, self, @"BMMailContentEvent.m", 63, @"Invalid parameter not satisfying: %@", @"_proto == nil" object file lineNumber description];
  }
  v6 = [BMNamedHandle alloc];
  v7 = [(BMPBMailContentEvent *)v5 fromHandle];
  v8 = [(BMNamedHandle *)v6 initWithProto:v7];
  fromHandle = self->_fromHandle;
  self->_fromHandle = v8;

  if ([(BMPBMailContentEvent *)v5 hasReplyTo])
  {
    v10 = [BMNamedHandle alloc];
    v11 = [(BMPBMailContentEvent *)v5 replyTo];
    v12 = [(BMNamedHandle *)v10 initWithProto:v11];
    replyTo = self->_replyTo;
    self->_replyTo = v12;
  }
  if ([(BMPBMailContentEvent *)v5 hasListId])
  {
    v14 = [BMNamedHandle alloc];
    v15 = [(BMPBMailContentEvent *)v5 listId];
    v16 = [(BMNamedHandle *)v14 initWithProto:v15];
    listId = self->_listId;
    self->_listId = v16;
  }
  v18 = [(BMPBMailContentEvent *)v5 toHandles];
  objc_msgSend(v18, "_pas_mappedArrayWithTransform:", &__block_literal_global_18);
  v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  toHandles = self->_toHandles;
  self->_toHandles = v19;

  v21 = [(BMPBMailContentEvent *)v5 ccHandles];
  objc_msgSend(v21, "_pas_mappedArrayWithTransform:", &__block_literal_global_13_0);
  v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
  ccHandles = self->_ccHandles;
  self->_ccHandles = v22;

  v24 = [(BMPBMailContentEvent *)v5 bccHandles];
  objc_msgSend(v24, "_pas_mappedArrayWithTransform:", &__block_literal_global_15);
  v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
  bccHandles = self->_bccHandles;
  v68 = self;
  self->_bccHandles = v25;

  id v27 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v28 = [(BMPBMailContentEvent *)v5 headers];
  v29 = objc_msgSend(v27, "initWithCapacity:", objc_msgSend(v28, "count"));

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v67 = v5;
  id obj = [(BMPBMailContentEvent *)v5 headers];
  uint64_t v30 = [obj countByEnumeratingWithState:&v70 objects:v75 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v71 != v32) {
          objc_enumerationMutation(obj);
        }
        v34 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        v35 = (void *)MEMORY[0x192FB0D60]();
        v36 = [v34 key];
        v37 = [v34 value];
        v38 = [v29 objectForKeyedSubscript:v36];
        if (v38)
        {
          v39 = [v29 objectForKeyedSubscript:v36];
          v40 = [v39 arrayByAddingObject:v37];
          [v29 setObject:v40 forKeyedSubscript:v36];
        }
        else
        {
          v74 = v37;
          v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
          [v29 setObject:v39 forKeyedSubscript:v36];
        }
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v70 objects:v75 count:16];
    }
    while (v31);
  }

  uint64_t v41 = [v29 copy];
  headers = v68->_headers;
  v68->_headers = (NSDictionary *)v41;

  v43 = [(BMPBMailContentEvent *)v67 attachments];
  uint64_t v44 = objc_msgSend(v43, "_pas_mappedArrayWithTransform:", &__block_literal_global_20);
  attachments = v68->_attachments;
  v68->_attachments = (NSArray *)v44;

  if ([(BMPBMailContentEvent *)v67 hasDateReceived])
  {
    id v46 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [(BMPBMailContentEvent *)v67 dateReceived];
    uint64_t v47 = objc_msgSend(v46, "initWithTimeIntervalSinceReferenceDate:");
    dateReceived = v68->_dateReceived;
    v68->_dateReceived = (NSDate *)v47;
  }
  if ([(BMPBMailContentEvent *)v67 hasMailCategories])
  {
    uint64_t v49 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPBMailContentEvent mailCategories](v67, "mailCategories"));
    mailCategories = v68->_mailCategories;
    v68->_mailCategories = (NSNumber *)v49;
  }
  if ([(BMPBMailContentEvent *)v67 hasIsNew])
  {
    uint64_t v51 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPBMailContentEvent isNew](v67, "isNew"));
    isNew = v68->_isNew;
    v68->_isNew = (NSNumber *)v51;
  }
  if ([(BMPBMailContentEvent *)v67 hasIsTwoFactorCode])
  {
    uint64_t v53 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPBMailContentEvent isTwoFactorCode](v67, "isTwoFactorCode"));
    isTwoFactorCode = v68->_isTwoFactorCode;
    v68->_isTwoFactorCode = (NSNumber *)v53;
  }
  if ([(BMPBMailContentEvent *)v67 hasIsFromMe])
  {
    uint64_t v55 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPBMailContentEvent isFromMe](v67, "isFromMe"));
    isFromMe = v68->_isFromMe;
    v68->_isFromMe = (NSNumber *)v55;
  }
  if ([(BMPBMailContentEvent *)v67 hasIsJunk])
  {
    uint64_t v57 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPBMailContentEvent isJunk](v67, "isJunk"));
    isJunk = v68->_isJunk;
    v68->_isJunk = (NSNumber *)v57;
  }
  if ([(BMPBMailContentEvent *)v67 hasIsRead])
  {
    uint64_t v59 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPBMailContentEvent isRead](v67, "isRead"));
    isRead = v68->_isRead;
    v68->_isRead = (NSNumber *)v59;
  }
  if ([(BMPBMailContentEvent *)v67 hasIsVIP])
  {
    uint64_t v61 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPBMailContentEvent isVIP](v67, "isVIP"));
    isVIP = v68->_isVIP;
    v68->_isVIP = (NSNumber *)v61;
  }
  if ([(BMPBMailContentEvent *)v67 hasIsFlagged])
  {
    uint64_t v63 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPBMailContentEvent isFlagged](v67, "isFlagged"));
    isFlagged = v68->_isFlagged;
    v68->_isFlagged = (NSNumber *)v63;
  }
  proto = v68->_proto;
  v68->_proto = v67;
}

BMNamedHandle *__40__BMMailContentEvent__inflateFromProto___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[BMNamedHandle alloc] initWithProto:v2];

  return v3;
}

BMNamedHandle *__40__BMMailContentEvent__inflateFromProto___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[BMNamedHandle alloc] initWithProto:v2];

  return v3;
}

BMNamedHandle *__40__BMMailContentEvent__inflateFromProto___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[BMNamedHandle alloc] initWithProto:v2];

  return v3;
}

BMContentAttachment *__40__BMMailContentEvent__inflateFromProto___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[BMContentAttachment alloc] initWithProto:v2];

  return v3;
}

- (void)_loadData
{
  p_protoLock = &self->_protoLock;
  os_unfair_lock_lock(&self->_protoLock);
  v4 = self->_proto;
  if (!v4)
  {
    if (self->_data)
    {
      v5 = (void *)MEMORY[0x192FB0D60]();
      v6 = [[BMPBMailContentEvent alloc] initWithData:self->_data];
      v9 = v6;
      if (v6)
      {
        [(BMMailContentEvent *)self _inflateFromProto:v6];
      }
      else
      {
        data = self->_data;
        self->_data = 0;
      }
      v4 = v9;
    }
    else
    {
      v4 = 0;
    }
  }
  v8 = v4;
  os_unfair_lock_unlock(p_protoLock);
}

- (id)_initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)BMMailContentEvent;
  v11 = [(BMMailContentEvent *)&v20 init];
  v12 = v11;
  if (v11)
  {
    v11->_protoLock._os_unfair_lock_opaque = 0;
    uint64_t v13 = [v8 copy];
    uniqueId = v12->_uniqueId;
    v12->_uniqueId = (NSString *)v13;

    uint64_t v15 = [v9 copy];
    domainId = v12->_domainId;
    v12->_domainId = (NSString *)v15;

    uint64_t v17 = [v10 copy];
    personaId = v12->_personaId;
    v12->_personaId = (NSString *)v17;
  }
  return v12;
}

- (BMMailContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 accountIdentifier:(id)a7 messageIdentifier:(id)a8 fromHandle:(id)a9 toHandles:(id)a10 ccHandles:(id)a11 bccHandles:(id)a12 headers:(id)a13 subject:(id)a14 htmlContent:(id)a15 textContent:(id)a16 isFullyDownloaded:(BOOL)a17 securityMethod:(id)a18 accountHandles:(id)a19 replyTo:(id)a20 mailboxIdentifiers:(id)a21 listId:(id)a22 accountType:(id)a23 attachments:(id)a24 contentProtection:(id)a25 conversationId:(id)a26 dateReceived:(id)a27 mailCategories:(id)a28 isNew:(id)a29 isTwoFactorCode:(id)a30 isFromMe:(id)a31 isJunk:(id)a32 isRead:(id)a33 isVIP:(id)a34 isFlagged:(id)a35
{
  id v40 = a3;
  id v41 = a4;
  id v42 = a5;
  id v43 = a7;
  id v113 = a8;
  id v112 = a9;
  id v109 = a10;
  id v108 = a11;
  id v107 = a12;
  id v44 = a13;
  id v45 = a14;
  id v46 = a15;
  id v106 = a16;
  id v105 = a18;
  id v104 = a19;
  id v103 = a20;
  id v102 = a21;
  id v101 = a22;
  id v100 = a23;
  id v99 = a24;
  id v98 = a25;
  id v97 = a26;
  id v96 = a27;
  id v95 = a28;
  id v94 = a29;
  id v47 = a30;
  id v48 = a31;
  id v110 = a32;
  id v91 = a33;
  id v90 = a34;
  id v89 = a35;
  if (!v40)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v74 = id v73 = v46;
    [v74 handleFailureInMethod:a2, self, @"BMMailContentEvent.m", 206, @"Invalid parameter not satisfying: %@", @"uniqueId" object file lineNumber description];

    id v46 = v73;
  }
  v92 = v48;
  v93 = v47;
  uint64_t v49 = v43;
  if (!v43)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v76 = v75 = v46;
    [v76 handleFailureInMethod:a2, self, @"BMMailContentEvent.m", 207, @"Invalid parameter not satisfying: %@", @"accountIdentifier" object file lineNumber description];

    id v46 = v75;
  }
  v50 = v41;
  uint64_t v51 = v94;
  if (!v113)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v78 = id v77 = v46;
    [v78 handleFailureInMethod:a2, self, @"BMMailContentEvent.m", 208, @"Invalid parameter not satisfying: %@", @"messageIdentifier" object file lineNumber description];

    id v46 = v77;
  }
  v52 = v110;
  if (v112)
  {
    if (v44) {
      goto LABEL_9;
    }
LABEL_34:
    [MEMORY[0x1E4F28B00] currentHandler];
    v82 = id v81 = v46;
    [v82 handleFailureInMethod:a2, self, @"BMMailContentEvent.m", 210, @"Invalid parameter not satisfying: %@", @"headers" object file lineNumber description];

    id v46 = v81;
    if (v45) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
  [MEMORY[0x1E4F28B00] currentHandler];
  v80 = id v79 = v46;
  [v80 handleFailureInMethod:a2, self, @"BMMailContentEvent.m", 209, @"Invalid parameter not satisfying: %@", @"fromHandle" object file lineNumber description];

  id v46 = v79;
  if (!v44) {
    goto LABEL_34;
  }
LABEL_9:
  if (v45) {
    goto LABEL_10;
  }
LABEL_35:
  [MEMORY[0x1E4F28B00] currentHandler];
  v84 = id v83 = v46;
  [v84 handleFailureInMethod:a2, self, @"BMMailContentEvent.m", 211, @"Invalid parameter not satisfying: %@", @"subject" object file lineNumber description];

  id v46 = v83;
LABEL_10:
  uint64_t v53 = [(BMMailContentEvent *)self _initWithUniqueId:v40 domainId:v50 personaId:v42];
  if (v53)
  {
    id v54 = v46;
    id v55 = v45;
    v56 = objc_opt_new();
    [v56 setUniqueId:v40];
    [v56 setDomainId:v50];
    id v88 = v42;
    [v56 setPersonaId:v42];
    [v56 setAbsoluteTimestamp:a6];
    v86 = v49;
    [v56 setAccountIdentifier:v49];
    [v56 setMessageIdentifier:v113];
    uint64_t v57 = [v112 proto];
    [v56 setFromHandle:v57];

    v58 = objc_msgSend(v109, "_pas_mappedArrayWithTransform:", &__block_literal_global_45);
    uint64_t v59 = (void *)[v58 mutableCopy];
    [v56 setToHandles:v59];

    v60 = objc_msgSend(v108, "_pas_mappedArrayWithTransform:", &__block_literal_global_47);
    uint64_t v61 = (void *)[v60 mutableCopy];
    [v56 setCcHandles:v61];

    v62 = objc_msgSend(v107, "_pas_mappedArrayWithTransform:", &__block_literal_global_49);
    uint64_t v63 = (void *)[v62 mutableCopy];
    [v56 setBccHandles:v63];

    if ([v44 count])
    {
      v64 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v44, "count"));
      v114[0] = MEMORY[0x1E4F143A8];
      v114[1] = 3221225472;
      v114[2] = __422__BMMailContentEvent_initWithUniqueId_domainId_personaId_absoluteTimestamp_accountIdentifier_messageIdentifier_fromHandle_toHandles_ccHandles_bccHandles_headers_subject_htmlContent_textContent_isFullyDownloaded_securityMethod_accountHandles_replyTo_mailboxIdentifiers_listId_accountType_attachments_contentProtection_conversationId_dateReceived_mailCategories_isNew_isTwoFactorCode_isFromMe_isJunk_isRead_isVIP_isFlagged___block_invoke_4;
      v114[3] = &unk_1E55D8590;
      id v115 = v64;
      id v65 = v64;
      [v44 enumerateKeysAndObjectsUsingBlock:v114];
      [v56 setHeaders:v65];
    }
    [v56 setSubject:v55];
    [v56 setHtmlContent:v46];
    [v56 setTextContent:v106];
    [v56 setIsFullyDownloaded:a17];
    [v56 setSecurityMethod:v105];
    v66 = (void *)[v104 mutableCopy];
    [v56 setAccountHandles:v66];

    v67 = [v103 proto];
    [v56 setReplyTo:v67];

    v68 = (void *)[v102 mutableCopy];
    [v56 setMailboxIdentifiers:v68];

    v69 = [v101 proto];
    [v56 setListId:v69];

    [v56 setAccountType:v100];
    long long v70 = objc_msgSend(v99, "_pas_mappedArrayWithTransform:", &__block_literal_global_55);
    long long v71 = (void *)[v70 mutableCopy];
    [v56 setAttachments:v71];

    [v56 setContentProtection:v98];
    [v56 setConversationId:v97];
    if (v96)
    {
      [v96 timeIntervalSinceReferenceDate];
      objc_msgSend(v56, "setDateReceived:");
    }
    uint64_t v49 = v86;
    id v42 = v88;
    if (v95) {
      objc_msgSend(v56, "setMailCategories:", objc_msgSend(v95, "intValue"));
    }
    id v46 = v54;
    uint64_t v51 = v94;
    if (v94) {
      objc_msgSend(v56, "setIsNew:", objc_msgSend(v94, "BOOLValue"));
    }
    if (v93) {
      objc_msgSend(v56, "setIsTwoFactorCode:", objc_msgSend(v93, "BOOLValue"));
    }
    if (v92) {
      objc_msgSend(v56, "setIsFromMe:", objc_msgSend(v92, "BOOLValue"));
    }
    if (v110) {
      objc_msgSend(v56, "setIsJunk:", objc_msgSend(v110, "BOOLValue"));
    }
    if (v91) {
      objc_msgSend(v56, "setIsRead:", objc_msgSend(v91, "BOOLValue"));
    }
    if (v90) {
      objc_msgSend(v56, "setIsVIP:", objc_msgSend(v90, "BOOLValue"));
    }
    if (v89) {
      objc_msgSend(v56, "setIsFlagged:", objc_msgSend(v89, "BOOLValue"));
    }
    [(BMMailContentEvent *)v53 _inflateFromProto:v56];

    id v45 = v55;
    v52 = v110;
  }

  return v53;
}

uint64_t __422__BMMailContentEvent_initWithUniqueId_domainId_personaId_absoluteTimestamp_accountIdentifier_messageIdentifier_fromHandle_toHandles_ccHandles_bccHandles_headers_subject_htmlContent_textContent_isFullyDownloaded_securityMethod_accountHandles_replyTo_mailboxIdentifiers_listId_accountType_attachments_contentProtection_conversationId_dateReceived_mailCategories_isNew_isTwoFactorCode_isFromMe_isJunk_isRead_isVIP_isFlagged___block_invoke(uint64_t a1, void *a2)
{
  return [a2 proto];
}

uint64_t __422__BMMailContentEvent_initWithUniqueId_domainId_personaId_absoluteTimestamp_accountIdentifier_messageIdentifier_fromHandle_toHandles_ccHandles_bccHandles_headers_subject_htmlContent_textContent_isFullyDownloaded_securityMethod_accountHandles_replyTo_mailboxIdentifiers_listId_accountType_attachments_contentProtection_conversationId_dateReceived_mailCategories_isNew_isTwoFactorCode_isFromMe_isJunk_isRead_isVIP_isFlagged___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 proto];
}

uint64_t __422__BMMailContentEvent_initWithUniqueId_domainId_personaId_absoluteTimestamp_accountIdentifier_messageIdentifier_fromHandle_toHandles_ccHandles_bccHandles_headers_subject_htmlContent_textContent_isFullyDownloaded_securityMethod_accountHandles_replyTo_mailboxIdentifiers_listId_accountType_attachments_contentProtection_conversationId_dateReceived_mailCategories_isNew_isTwoFactorCode_isFromMe_isJunk_isRead_isVIP_isFlagged___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 proto];
}

void __422__BMMailContentEvent_initWithUniqueId_domainId_personaId_absoluteTimestamp_accountIdentifier_messageIdentifier_fromHandle_toHandles_ccHandles_bccHandles_headers_subject_htmlContent_textContent_isFullyDownloaded_securityMethod_accountHandles_replyTo_mailboxIdentifiers_listId_accountType_attachments_contentProtection_conversationId_dateReceived_mailCategories_isNew_isTwoFactorCode_isFromMe_isJunk_isRead_isVIP_isFlagged___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x192FB0D60](v7);
        uint64_t v13 = objc_opt_new();
        objc_msgSend(v13, "setKey:", v5, (void)v14);
        [v13 setValue:v11];
        [*(id *)(a1 + 32) addObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v8 = v7;
    }
    while (v7);
  }
}

uint64_t __422__BMMailContentEvent_initWithUniqueId_domainId_personaId_absoluteTimestamp_accountIdentifier_messageIdentifier_fromHandle_toHandles_ccHandles_bccHandles_headers_subject_htmlContent_textContent_isFullyDownloaded_securityMethod_accountHandles_replyTo_mailboxIdentifiers_listId_accountType_attachments_contentProtection_conversationId_dateReceived_mailCategories_isNew_isTwoFactorCode_isFromMe_isJunk_isRead_isVIP_isFlagged___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 proto];
}

- (BMMailContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 accountIdentifier:(id)a7 messageIdentifier:(id)a8 fromHandle:(id)a9 toHandles:(id)a10 ccHandles:(id)a11 bccHandles:(id)a12 headers:(id)a13 subject:(id)a14 htmlContent:(id)a15 textContent:(id)a16 isFullyDownloaded:(BOOL)a17 securityMethod:(id)a18 accountHandles:(id)a19 replyTo:(id)a20 mailboxIdentifiers:(id)a21 listId:(id)a22 accountType:(id)a23 attachments:(id)a24 contentProtection:(id)a25
{
  LOBYTE(v26) = a17;
  return -[BMMailContentEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:accountIdentifier:messageIdentifier:fromHandle:toHandles:ccHandles:bccHandles:headers:subject:htmlContent:textContent:isFullyDownloaded:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listId:accountType:attachments:contentProtection:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:accountIdentifier:messageIdentifier:fromHandle:toHandles:ccHandles:bccHandles:headers:subject:htmlContent:textContent:isFullyDownloaded:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listId:accountType:attachments:contentProtection:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:", a3, a4, a5, a7, a8, a9, a6, a10, a11, a12, a13, a14, a15, a16,
           v26,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0);
}

- (BMMailContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 accountIdentifier:(id)a6 messageIdentifier:(id)a7 fromHandle:(id)a8 toHandles:(id)a9 ccHandles:(id)a10 bccHandles:(id)a11 headers:(id)a12 subject:(id)a13 htmlContent:(id)a14 textContent:(id)a15 isFullyDownloaded:(BOOL)a16 securityMethod:(id)a17 accountHandles:(id)a18 replyTo:(id)a19 mailboxIdentifiers:(id)a20 listId:(id)a21 accountType:(id)a22 attachments:(id)a23 contentProtection:(id)a24
{
  LOBYTE(v25) = a16;
  return -[BMMailContentEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:accountIdentifier:messageIdentifier:fromHandle:toHandles:ccHandles:bccHandles:headers:subject:htmlContent:textContent:isFullyDownloaded:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listId:accountType:attachments:contentProtection:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:accountIdentifier:messageIdentifier:fromHandle:toHandles:ccHandles:bccHandles:headers:subject:htmlContent:textContent:isFullyDownloaded:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listId:accountType:attachments:contentProtection:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:", a3, a4, 0, a6, a7, a8, a5, a9, a10, a11, a12, a13, a14, a15,
           v25,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0);
}

- (BMMailContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 accountIdentifier:(id)a6 messageIdentifier:(id)a7 fromHandle:(id)a8 toHandles:(id)a9 ccHandles:(id)a10 bccHandles:(id)a11 headers:(id)a12 subject:(id)a13 htmlContent:(id)a14 textContent:(id)a15 isFullyDownloaded:(BOOL)a16 securityMethod:(id)a17 accountHandles:(id)a18 replyTo:(id)a19 mailboxIdentifiers:(id)a20 listId:(id)a21 accountType:(id)a22 attachments:(id)a23
{
  LOBYTE(v24) = a16;
  return -[BMMailContentEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:accountIdentifier:messageIdentifier:fromHandle:toHandles:ccHandles:bccHandles:headers:subject:htmlContent:textContent:isFullyDownloaded:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listId:accountType:attachments:contentProtection:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:accountIdentifier:messageIdentifier:fromHandle:toHandles:ccHandles:bccHandles:headers:subject:htmlContent:textContent:isFullyDownloaded:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listId:accountType:attachments:contentProtection:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:", a3, a4, 0, a6, a7, a8, a5, a9, a10, a11, a12, a13, a14, a15,
           v24,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0);
}

- (unsigned)dataVersion
{
  return 3;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 3)
  {
    uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    uint64_t v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[BMMailContentEvent eventWithData:dataVersion:](a4, v8);
    }

    uint64_t v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  id v2 = [(BMMailContentEvent *)self proto];
  v3 = [v2 dictionaryRepresentation];

  v4 = [v3 objectForKeyedSubscript:@"htmlContent"];

  if (v4)
  {
    id v5 = (void *)[v3 mutableCopy];
    id v6 = [v5 objectForKeyedSubscript:@"htmlContent"];
    uint64_t v7 = [v6 base64EncodedStringWithOptions:0];
    [v5 setObject:v7 forKeyedSubscript:@"htmlContent"];

    v3 = v5;
  }

  return v3;
}

- (id)json
{
  id v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMMailContentEvent *)self jsonDict];
  id v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (!v4)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BMMailContentEvent *)(uint64_t)v5 json];
    }
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BMMailContentEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"dat"];
}

- (BMMailContentEvent)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"dat" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMMailContentEvent *)self initWithProtoData:v6];
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  id v2 = [(BMMailContentEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMMailContentEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    if ([v5 hasUniqueId]
      && [v5 hasAbsoluteTimestamp]
      && [v5 hasAccountIdentifier]
      && [v5 hasMessageIdentifier]
      && [v5 hasFromHandle]
      && [v5 hasSubject]
      && [v5 hasIsFullyDownloaded])
    {
      id v6 = [v5 uniqueId];
      uint64_t v7 = [v5 domainId];
      id v8 = [v5 personaId];
      id v9 = [(BMMailContentEvent *)self _initWithUniqueId:v6 domainId:v7 personaId:v8];

      if (v9) {
        [v9 _inflateFromProto:v5];
      }
      self = (BMMailContentEvent *)v9;
      uint64_t v10 = self;
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BMMailContentEvent)initWithProtoData:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [[BMPBMailContentEventFilteringSubset alloc] initWithData:v5];
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = [(BMPBMailContentEventFilteringSubset *)v6 uniqueId];
      id v9 = [(BMPBMailContentEventFilteringSubset *)v7 domainId];
      uint64_t v10 = [(BMPBMailContentEventFilteringSubset *)v7 personaId];
      uint64_t v11 = [(BMMailContentEvent *)self _initWithUniqueId:v8 domainId:v9 personaId:v10];

      if (v11) {
        objc_storeStrong(v11 + 1, a3);
      }
      self = v11;
      v12 = self;
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uniqueId hash];
  return [(NSString *)self->_domainId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(BMMailContentEvent *)self proto];
    uint64_t v7 = [v5 proto];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  id v6 = [(BMMailContentEvent *)self uniqueId];
  if (v6)
  {
    uint64_t v7 = [(BMMailContentEvent *)self accountIdentifier];
    if (v7)
    {
      char v8 = [(BMMailContentEvent *)self messageIdentifier];
      if (v8)
      {
        id v9 = [(BMMailContentEvent *)self fromHandle];
        if (v9)
        {
          uint64_t v10 = [(BMMailContentEvent *)self headers];
          if (v10)
          {
            uint64_t v11 = [(BMMailContentEvent *)self subject];
            if (v11)
            {
              v12 = [(BMMailContentEvent *)self htmlContent];
              if (v12)
              {
                BOOL v13 = 0;
              }
              else
              {
                long long v14 = [(BMMailContentEvent *)self textContent];
                BOOL v13 = v14 == 0;
              }
            }
            else
            {
              BOOL v13 = 1;
            }
          }
          else
          {
            BOOL v13 = 1;
          }
        }
        else
        {
          BOOL v13 = 1;
        }
      }
      else
      {
        BOOL v13 = 1;
      }
    }
    else
    {
      BOOL v13 = 1;
    }
  }
  else
  {
    BOOL v13 = 1;
  }

  if (a4 && v13)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BMStreamErrorDomain" code:3 userInfo:0];
  }
  return !v13;
}

- (NSString)debugDescription
{
  id v2 = [(BMMailContentEvent *)self proto];
  NSUInteger v3 = [v2 debugDescription];

  return (NSString *)v3;
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (NSString)domainId
{
  return self->_domainId;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (BMNamedHandle)fromHandle
{
  return self->_fromHandle;
}

- (NSArray)toHandles
{
  return self->_toHandles;
}

- (NSArray)ccHandles
{
  return self->_ccHandles;
}

- (NSArray)bccHandles
{
  return self->_bccHandles;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (BMNamedHandle)replyTo
{
  return self->_replyTo;
}

- (BMNamedHandle)listId
{
  return self->_listId;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (NSNumber)mailCategories
{
  return self->_mailCategories;
}

- (NSNumber)isNew
{
  return self->_isNew;
}

- (NSNumber)isTwoFactorCode
{
  return self->_isTwoFactorCode;
}

- (NSNumber)isFromMe
{
  return self->_isFromMe;
}

- (NSNumber)isJunk
{
  return self->_isJunk;
}

- (NSNumber)isRead
{
  return self->_isRead;
}

- (NSNumber)isVIP
{
  return self->_isVIP;
}

- (NSNumber)isFlagged
{
  return self->_isFlagged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isFlagged, 0);
  objc_storeStrong((id *)&self->_isVIP, 0);
  objc_storeStrong((id *)&self->_isRead, 0);
  objc_storeStrong((id *)&self->_isJunk, 0);
  objc_storeStrong((id *)&self->_isFromMe, 0);
  objc_storeStrong((id *)&self->_isTwoFactorCode, 0);
  objc_storeStrong((id *)&self->_isNew, 0);
  objc_storeStrong((id *)&self->_mailCategories, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_listId, 0);
  objc_storeStrong((id *)&self->_replyTo, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_bccHandles, 0);
  objc_storeStrong((id *)&self->_ccHandles, 0);
  objc_storeStrong((id *)&self->_toHandles, 0);
  objc_storeStrong((id *)&self->_fromHandle, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_proto, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 3;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMMailContentEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMMailContentEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

@end