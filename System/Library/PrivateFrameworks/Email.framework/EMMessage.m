@interface EMMessage
+ (BOOL)supportsSecureCoding;
+ (NSArray)externalDataTypeIdentifiers;
+ (NSString)uniformTypeIdentifier;
+ (OS_os_log)log;
+ (id)_predicateForMessagesWithObjectIDConstantValue:(id)a3 operatorType:(unint64_t)a4;
+ (id)combinedFlagsForMessageListItemFlags:(id)a3 forDisplay:(BOOL)a4;
+ (id)combinedFlagsForMessageListItems:(id)a3;
+ (id)combinedFlagsForMessageListItems:(id)a3 forDisplay:(BOOL)a4;
+ (id)predicateForExcludingMessageWithObjectID:(id)a3;
+ (id)predicateForExcludingMessagesWithObjectIDs:(id)a3;
+ (id)predicateForMessageWithItemID:(id)a3 mailboxPredicate:(id)a4 mailboxTypeResolver:(id)a5;
+ (id)predicateForMessageWithObjectID:(id)a3;
+ (id)predicateForMessagesWithObjectIDs:(id)a3;
- (BOOL)isAvailableLocally;
- (BOOL)isInManagedAccountWithSourceMailboxScope:(id)a3;
- (BOOL)shouldShowReplyAll;
- (EMCollectionItemID)itemID;
- (EMMailDropMetadata)mailDropMetadata;
- (EMMessage)initWithCoder:(id)a3;
- (EMMessage)initWithObjectID:(id)a3;
- (EMMessage)initWithObjectID:(id)a3 builder:(id)a4;
- (EMMessageRepository)repository;
- (EMSearchableMessageID)searchableMessageID;
- (NSArray)availableRepresentations;
- (NSString)contentID;
- (NSString)debugDescription;
- (NSString)displayName;
- (NSString)ef_publicDescription;
- (NSString)mailProviderDisplayNameForBIMI;
- (NSString)uniformTypeIdentifier;
- (NSUUID)documentID;
- (UTType)type;
- (id)cachedMetadataOfClass:(Class)a3 forKey:(id)a4;
- (id)loaderBlock;
- (id)requestRepresentationWithOptions:(id)a3 completionHandler:(id)a4;
- (id)requestRepresentationWithOptions:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (id)senderDisplayNameUsingContactStore:(id)a3;
- (int)exchangeEventUID;
- (int64_t)dataTransferByteCount;
- (int64_t)storageByteCount;
- (void)_commonInitWithBuilder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAvailableRepresentations:(id)a3;
- (void)setCachedMetadata:(id)a3 forKey:(id)a4;
- (void)setContentID:(id)a3;
- (void)setDataTransferByteCount:(int64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setDocumentID:(id)a3;
- (void)setExchangeEventUID:(int)a3;
- (void)setIsAvailableLocally:(BOOL)a3;
- (void)setLoaderBlock:(id)a3;
- (void)setMailDropMetadata:(id)a3;
- (void)setRepository:(id)a3;
- (void)setSearchableMessageID:(id)a3;
- (void)setStorageByteCount:(int64_t)a3;
- (void)setUniformTypeIdentifier:(id)a3;
@end

@implementation EMMessage

+ (NSArray)externalDataTypeIdentifiers
{
  if (externalDataTypeIdentifiers_onceToken != -1) {
    dispatch_once(&externalDataTypeIdentifiers_onceToken, &__block_literal_global_439);
  }
  v2 = (void *)externalDataTypeIdentifiers_identifiers;
  return (NSArray *)v2;
}

- (EMMessageRepository)repository
{
  v7.receiver = self;
  v7.super_class = (Class)EMMessage;
  v4 = [(EMBaseMessageListItem *)&v7 repository];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"EMMessage.m" lineNumber:37 description:@"Wrong repository type"];
    }
  }
  return (EMMessageRepository *)v4;
}

- (void)setRepository:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"EMMessage.m" lineNumber:37 description:@"Wrong repository type"];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)EMMessage;
  [(EMBaseMessageListItem *)&v7 setRepository:v5];
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __16__EMMessage_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_23 != -1) {
    dispatch_once(&log_onceToken_23, block);
  }
  v2 = (void *)log_log_23;
  return (OS_os_log *)v2;
}

void __16__EMMessage_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_23;
  log_log_23 = (uint64_t)v1;
}

- (EMMessage)initWithObjectID:(id)a3
{
  id v5 = a3;
  [(EMMessage *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EMMessage initWithObjectID:]", "EMMessage.m", 63, "0");
}

- (EMMessage)initWithObjectID:(id)a3 builder:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"EMMessage.m", 67, @"Invalid parameter not satisfying: %@", @"builderBlock" object file lineNumber description];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __38__EMMessage_initWithObjectID_builder___block_invoke;
  v19[3] = &unk_1E63E34E8;
  v20 = self;
  id v9 = v8;
  id v21 = v9;
  v18.receiver = v20;
  v18.super_class = (Class)EMMessage;
  v10 = [(EMBaseMessageListItem *)&v18 initWithObjectID:v7 baseBuilder:v19];
  if (![(EMBaseMessageListItem *)v10 conversationID])
  {
    v11 = +[EMMessage log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      uint64_t v12 = [(EMBaseMessageListItem *)v10 conversationID];
      v13 = [(EMMessage *)v10 description];
      [(EMMessage *)v13 initWithObjectID:v12 builder:v11];
    }
  }
  v14 = v21;
  v15 = v10;

  return v15;
}

uint64_t __38__EMMessage_initWithObjectID_builder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _commonInitWithBuilder:*(void *)(a1 + 40)];
}

- (void)_commonInitWithBuilder:(id)a3
{
}

+ (id)combinedFlagsForMessageListItems:(id)a3
{
  id v3 = +[EMMessage combinedFlagsForMessageListItems:a3 forDisplay:1];
  return v3;
}

+ (id)combinedFlagsForMessageListItems:(id)a3 forDisplay:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = objc_msgSend(a3, "ef_map:", &__block_literal_global_30);
  id v7 = [a1 combinedFlagsForMessageListItemFlags:v6 forDisplay:v4];

  return v7;
}

id __57__EMMessage_combinedFlagsForMessageListItems_forDisplay___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 flags];
  return v2;
}

+ (id)combinedFlagsForMessageListItemFlags:(id)a3 forDisplay:(BOOL)a4
{
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F608C0]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__EMMessage_combinedFlagsForMessageListItemFlags_forDisplay___block_invoke;
  v10[3] = &unk_1E63E45D0;
  id v7 = v5;
  id v11 = v7;
  BOOL v12 = a4;
  id v8 = (void *)[v6 initWithBuilder:v10];

  return v8;
}

void __61__EMMessage_combinedFlagsForMessageListItemFlags_forDisplay___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v90 objects:v103 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v91;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v91 != v6) {
          objc_enumerationMutation(v4);
        }
        if (([*(id *)(*((void *)&v90 + 1) + 8 * i) read] & 1) == 0)
        {
          uint64_t v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v90 objects:v103 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 1;
LABEL_11:

  [v3 setRead:v8];
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v86 objects:v102 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v87;
    while (2)
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v87 != v11) {
          objc_enumerationMutation(v9);
        }
        if (([*(id *)(*((void *)&v86 + 1) + 8 * j) deleted] & 1) == 0)
        {
          uint64_t v13 = 0;
          goto LABEL_21;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v86 objects:v102 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 1;
LABEL_21:

  [v3 setDeleted:v13];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v14 = *(id *)(a1 + 32);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v82 objects:v101 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v83;
    while (2)
    {
      for (uint64_t k = 0; k != v15; ++k)
      {
        if (*(void *)v83 != v16) {
          objc_enumerationMutation(v14);
        }
        if ([*(id *)(*((void *)&v82 + 1) + 8 * k) replied])
        {
          uint64_t v15 = 1;
          goto LABEL_31;
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v82 objects:v101 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_31:

  [v3 setReplied:v15];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v18 = *(id *)(a1 + 32);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v78 objects:v100 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v79;
    while (2)
    {
      for (uint64_t m = 0; m != v19; ++m)
      {
        if (*(void *)v79 != v20) {
          objc_enumerationMutation(v18);
        }
        if ([*(id *)(*((void *)&v78 + 1) + 8 * m) draft])
        {
          uint64_t v19 = 1;
          goto LABEL_41;
        }
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v78 objects:v100 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
LABEL_41:

  [v3 setDraft:v19];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v22 = *(id *)(a1 + 32);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v74 objects:v99 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v75;
    while (2)
    {
      for (uint64_t n = 0; n != v23; ++n)
      {
        if (*(void *)v75 != v24) {
          objc_enumerationMutation(v22);
        }
        if ([*(id *)(*((void *)&v74 + 1) + 8 * n) forwarded])
        {
          uint64_t v23 = 1;
          goto LABEL_51;
        }
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v74 objects:v99 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }
LABEL_51:

  [v3 setForwarded:v23];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v26 = *(id *)(a1 + 32);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v70 objects:v98 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v71;
    while (2)
    {
      for (iuint64_t i = 0; ii != v27; ++ii)
      {
        if (*(void *)v71 != v28) {
          objc_enumerationMutation(v26);
        }
        if ([*(id *)(*((void *)&v70 + 1) + 8 * ii) redirected])
        {
          uint64_t v27 = 1;
          goto LABEL_61;
        }
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v70 objects:v98 count:16];
      if (v27) {
        continue;
      }
      break;
    }
  }
LABEL_61:

  [v3 setRedirected:v27];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v30 = *(id *)(a1 + 32);
  uint64_t v31 = [v30 countByEnumeratingWithState:&v66 objects:v97 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v67;
    while (2)
    {
      for (juint64_t j = 0; jj != v31; ++jj)
      {
        if (*(void *)v67 != v32) {
          objc_enumerationMutation(v30);
        }
        if ([*(id *)(*((void *)&v66 + 1) + 8 * jj) junkLevelSetByUser])
        {
          uint64_t v31 = 1;
          goto LABEL_71;
        }
      }
      uint64_t v31 = [v30 countByEnumeratingWithState:&v66 objects:v97 count:16];
      if (v31) {
        continue;
      }
      break;
    }
  }
LABEL_71:

  [v3 setJunkLevelSetByUser:v31];
  if (*(unsigned char *)(a1 + 40))
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v34 = *(id *)(a1 + 32);
    uint64_t v35 = [v34 countByEnumeratingWithState:&v62 objects:v96 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v63;
      while (2)
      {
        for (kuint64_t k = 0; kk != v35; ++kk)
        {
          if (*(void *)v63 != v36) {
            objc_enumerationMutation(v34);
          }
          if ([*(id *)(*((void *)&v62 + 1) + 8 * kk) flagged])
          {
            uint64_t v35 = 1;
            goto LABEL_82;
          }
        }
        uint64_t v35 = [v34 countByEnumeratingWithState:&v62 objects:v96 count:16];
        if (v35) {
          continue;
        }
        break;
      }
    }
LABEL_82:

    [v3 setFlagged:v35];
  }
  else
  {
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v38 = *(id *)(a1 + 32);
    uint64_t v39 = [v38 countByEnumeratingWithState:&v58 objects:v95 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v59;
      while (2)
      {
        for (muint64_t m = 0; mm != v39; ++mm)
        {
          if (*(void *)v59 != v40) {
            objc_enumerationMutation(v38);
          }
          if (([*(id *)(*((void *)&v58 + 1) + 8 * mm) flagged] & 1) == 0)
          {
            uint64_t v42 = 0;
            goto LABEL_93;
          }
        }
        uint64_t v39 = [v38 countByEnumeratingWithState:&v58 objects:v95 count:16];
        if (v39) {
          continue;
        }
        break;
      }
    }
    uint64_t v42 = 1;
LABEL_93:

    [v3 setFlagged:v42];
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v43 = *(id *)(a1 + 32);
  v53 = v3;
  uint64_t v44 = 0;
  uint64_t v45 = [v43 countByEnumeratingWithState:&v54 objects:v94 count:16];
  if (v45)
  {
    BOOL v46 = 0;
    char v47 = 0;
    uint64_t v48 = *(void *)v55;
    uint64_t v49 = 1;
    while (1)
    {
      for (nuint64_t n = 0; nn != v45; ++nn)
      {
        if (*(void *)v55 != v48) {
          objc_enumerationMutation(v43);
        }
        v51 = *(void **)(*((void *)&v54 + 1) + 8 * nn);
        if (v46)
        {
          BOOL v46 = 1;
          if (v47) {
            goto LABEL_101;
          }
        }
        else
        {
          uint64_t v52 = [*(id *)(*((void *)&v54 + 1) + 8 * nn) junkLevel];
          BOOL v46 = (v52 & 0xFFFFFFFFFFFFFFFDLL) == 0;
          if ((v52 & 0xFFFFFFFFFFFFFFFDLL) == 0) {
            uint64_t v49 = 2;
          }
          if (v47)
          {
LABEL_101:
            if (v46) {
              goto LABEL_114;
            }
LABEL_108:
            char v47 = 1;
            continue;
          }
        }
        if ([v51 flagged])
        {
          uint64_t v44 = [v51 flagColor];
          if (v46) {
            goto LABEL_114;
          }
          goto LABEL_108;
        }
        char v47 = 0;
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v54 objects:v94 count:16];
      if (!v45) {
        goto LABEL_114;
      }
    }
  }
  uint64_t v49 = 1;
LABEL_114:

  [v53 setJunkLevel:v49];
  [v53 setFlagColor:v44];
}

- (NSString)mailProviderDisplayNameForBIMI
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(EMBaseMessageListItem *)self mailboxes];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "account", (void)v13);
        id v9 = [v8 hostname];

        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  uint64_t v10 = objc_msgSend(v3, "ef_anyPassingTest:", &__block_literal_global_30);
  uint64_t v11 = EMBIMIMailProviderDisplayNameForIncomingMailServer((uint64_t)v10);

  return (NSString *)v11;
}

uint64_t __43__EMMessage_mailProviderDisplayNameForBIMI__block_invoke(uint64_t a1, uint64_t a2)
{
  return EMBIMIIncomingServerIsAllowlisted(a2);
}

- (void)setCachedMetadata:(id)a3 forKey:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(EMMessage *)self repository];
  id v9 = v6;
  id v10 = v7;
  if (v9)
  {
    id v17 = 0;
    uint64_t v11 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v9 options:12 error:&v17];
    id v12 = v17;
    if (!v11)
    {
      long long v13 = +[EMMessage log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        long long v14 = objc_msgSend(v12, "ef_publicDescription");
        -[EMMessage setCachedMetadata:forKey:]((uint64_t)v10, v14, (uint64_t)v18);
      }
    }
    long long v15 = (void *)[[NSString alloc] initWithData:v11 encoding:4];
  }
  else
  {
    long long v15 = 0;
  }

  long long v16 = [(EMObject *)self objectID];
  [v8 setCachedMetadataJSON:v15 forKey:v10 messageID:v16];
}

- (id)cachedMetadataOfClass:(Class)a3 forKey:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(EMMessage *)self repository];
  id v7 = [(EMObject *)self objectID];
  uint64_t v8 = [v6 cachedMetadataJSONForKey:v5 messageID:v7];

  id v9 = v8;
  id v10 = v5;
  if (!v9)
  {
    id v12 = 0;
    goto LABEL_12;
  }
  uint64_t v11 = [v9 dataUsingEncoding:4];
  if (!v11)
  {
    long long v13 = +[EMMessage log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[EMMessage cachedMetadataOfClass:forKey:]((uint64_t)v10, v13);
    }
    goto LABEL_10;
  }
  id v19 = 0;
  id v12 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v11 options:4 error:&v19];
  long long v13 = v19;
  if (!v12)
  {
    long long v14 = +[EMMessage log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      long long v15 = [v13 ef_publicDescription];
      -[EMMessage cachedMetadataOfClass:forKey:]((uint64_t)v10, v15, (uint64_t)v20);
    }

LABEL_10:
    id v12 = 0;
  }

LABEL_12:
  if (v12)
  {
    if (objc_opt_isKindOfClass())
    {
      id v16 = v12;
      goto LABEL_19;
    }
    id v17 = +[EMMessage log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[EMMessage cachedMetadataOfClass:forKey:]((uint64_t)v10, v17);
    }
  }
  id v16 = 0;
LABEL_19:

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMMessage;
  id v5 = [(EMBaseMessageListItem *)&v9 initWithCoder:v4];
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __27__EMMessage_initWithCoder___block_invoke;
    v7[3] = &unk_1E63E45F8;
    id v8 = v4;
    [(EMMessage *)v5 _commonInitWithBuilder:v7];
  }
  return v5;
}

void __27__EMMessage_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_documentID"];
  [v5 setDocumentID:v3];

  id v4 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_searchableMessageID"];
  [v5 setSearchableMessageID:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EMMessage;
  [(EMBaseMessageListItem *)&v7 encodeWithCoder:v4];
  id v5 = [(EMMessage *)self documentID];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_documentID"];

  id v6 = [(EMMessage *)self searchableMessageID];
  [v4 encodeObject:v6 forKey:@"EFPropertyKey_searchableMessageID"];
}

- (NSString)debugDescription
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)EMMessage;
  id v4 = [(EMBaseMessageListItem *)&v8 debugDescription];
  id v5 = [(EMMessage *)self searchableMessageID];
  id v6 = [v3 stringWithFormat:@"%@\n\tsearchableMessageID:%@", v4, v5];

  return (NSString *)v6;
}

- (NSString)ef_publicDescription
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)EMMessage;
  id v4 = [(EMBaseMessageListItem *)&v8 ef_publicDescription];
  id v5 = [(EMMessage *)self searchableMessageID];
  id v6 = [v3 stringWithFormat:@"%@\n\tsearchableMessageID:%@", v4, v5];

  return (NSString *)v6;
}

- (EMCollectionItemID)itemID
{
  v2 = [(EMObject *)self objectID];
  id v3 = [v2 collectionItemID];

  return (EMCollectionItemID *)v3;
}

- (NSArray)availableRepresentations
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"raw";
  v4[1] = @"text/plain";
  v4[2] = @"text/html";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return (NSArray *)v2;
}

- (void)setAvailableRepresentations:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"EMMessage.m" lineNumber:285 description:@"EMMessage has a static set of availableRepresentations"];
}

- (NSString)uniformTypeIdentifier
{
  v2 = objc_opt_class();
  return (NSString *)[v2 uniformTypeIdentifier];
}

- (void)setUniformTypeIdentifier:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    id v5 = [(id)objc_opt_class() uniformTypeIdentifier];
    char v6 = [v9 isEqualToString:v5];

    if ((v6 & 1) == 0)
    {
      objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_super v8 = [(id)objc_opt_class() uniformTypeIdentifier];
      [v7 handleFailureInMethod:a2, self, @"EMMessage.m", 293, @"%@ can not be changed.", v8 object file lineNumber description];
    }
  }
}

- (UTType)type
{
  id v3 = [(EMMessage *)self uniformTypeIdentifier];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F442D8];
    id v5 = [(EMMessage *)self uniformTypeIdentifier];
    char v6 = [v4 typeWithIdentifier:v5];
  }
  else
  {
    char v6 = 0;
  }

  return (UTType *)v6;
}

- (NSString)contentID
{
  v2 = [(EMObject *)self objectID];
  id v3 = [v2 stringHash];
  id v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (void)setContentID:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"EMMessage.m" lineNumber:305 description:@"EMMessage has an unmodifiable content identifier"];
}

- (NSString)displayName
{
  v2 = [(EMBaseMessageListItem *)self subject];
  id v3 = [v2 subjectString];

  return (NSString *)v3;
}

- (void)setDisplayName:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"EMMessage.m" lineNumber:313 description:@"EMMessage has an unmodifiable display name"];
}

- (id)requestRepresentationWithOptions:(id)a3 completionHandler:(id)a4
{
  id v4 = [(EMMessage *)self requestRepresentationWithOptions:a3 delegate:0 completionHandler:a4];
  return v4;
}

- (id)requestRepresentationWithOptions:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _os_activity_create(&dword_1BEFDB000, "message content representation request", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v11, &state);
  id v12 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    long long v13 = [v8 requestedRepresentation];
    long long v14 = [(EMMessage *)self ef_publicDescription];
    long long v15 = [(EMObject *)self objectID];
    *(_DWORD *)buf = 138543874;
    v29 = v13;
    __int16 v30 = 2114;
    uint64_t v31 = v14;
    __int16 v32 = 2114;
    v33 = v15;
    _os_log_impl(&dword_1BEFDB000, v12, OS_LOG_TYPE_DEFAULT, "requesting %{public}@ content for message %{public}@ (%{public}@)", buf, 0x20u);
  }
  id v16 = [(EMMessage *)self availableRepresentations];
  id v17 = [v8 requestedRepresentation];
  char v18 = [v16 containsObject:v17];

  if (v18)
  {
    id v19 = [(EMMessage *)self loaderBlock];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __73__EMMessage_requestRepresentationWithOptions_delegate_completionHandler___block_invoke;
    v25[3] = &unk_1E63E2628;
    v25[4] = self;
    id v26 = v10;
    uint64_t v20 = ((void (**)(void, id, id, void *))v19)[2](v19, v8, v9, v25);
  }
  else
  {
    uint64_t v21 = +[EMMessage log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = [(EMMessage *)self availableRepresentations];
      uint64_t v23 = [v22 componentsJoinedByString:@", "];
      -[EMMessage requestRepresentationWithOptions:delegate:completionHandler:](v23, buf, v21, v22);
    }

    id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EMErrorDomain" code:2048 userInfo:0];
    uint64_t v20 = 0;
    (*((void (**)(id, void, void (**)(void, void, void, void)))v10 + 2))(v10, 0, v19);
  }

  os_activity_scope_leave(&state);
  return v20;
}

void __73__EMMessage_requestRepresentationWithOptions_delegate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [v6 setContentItem:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)loaderBlock
{
  if (self->_loaderBlock)
  {
    loaderBlocuint64_t k = self->_loaderBlock;
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __24__EMMessage_loaderBlock__block_invoke;
    v5[3] = &unk_1E63E4620;
    v5[4] = self;
    loaderBlocuint64_t k = v5;
  }
  id v3 = (void *)MEMORY[0x1C18A2160](loaderBlock, a2);
  return v3;
}

id __24__EMMessage_loaderBlock__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [*(id *)(a1 + 32) repository];
  uint64_t v11 = [*(id *)(a1 + 32) objectID];
  id v12 = [v10 requestRepresentationForMessageWithID:v11 options:v7 delegate:v8 completionHandler:v9];

  return v12;
}

- (BOOL)isAvailableLocally
{
  return self->_isAvailableLocally;
}

- (void)setIsAvailableLocally:(BOOL)a3
{
  self->_isAvailableLocally = a3;
}

- (int64_t)dataTransferByteCount
{
  return self->_dataTransferByteCount;
}

- (void)setDataTransferByteCount:(int64_t)a3
{
  self->_dataTransferByteCount = a3;
}

- (int64_t)storageByteCount
{
  return self->_storageByteCount;
}

- (void)setStorageByteCount:(int64_t)a3
{
  self->_storageByteCount = a3;
}

- (EMMailDropMetadata)mailDropMetadata
{
  return self->_mailDropMetadata;
}

- (void)setMailDropMetadata:(id)a3
{
}

- (int)exchangeEventUID
{
  return self->_exchangeEventUID;
}

- (void)setExchangeEventUID:(int)a3
{
  self->_exchangeEventUID = a3;
}

- (void)setLoaderBlock:(id)a3
{
}

- (NSUUID)documentID
{
  return self->_documentID;
}

- (void)setDocumentID:(id)a3
{
}

- (EMSearchableMessageID)searchableMessageID
{
  return self->_searchableMessageID;
}

- (void)setSearchableMessageID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchableMessageID, 0);
  objc_storeStrong((id *)&self->_documentID, 0);
  objc_storeStrong(&self->_loaderBlock, 0);
  objc_storeStrong((id *)&self->_mailDropMetadata, 0);
}

+ (NSString)uniformTypeIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E4F60CC8];
}

void __59__EMMessage_ExternalDataTypes__externalDataTypeIdentifiers__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CA48] array];
  os_log_t v1 = +[EMMessage uniformTypeIdentifier];
  [v0 addObject:v1];

  v2 = [(id)*MEMORY[0x1E4F443A8] identifier];
  [v0 addObject:v2];

  id v3 = [MEMORY[0x1E4F1CB10] writableTypeIdentifiersForItemProvider];
  [v0 addObjectsFromArray:v3];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v0, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F28B18], "performSelector:", sel_writableTypeIdentifiersForItemProvider));
  }
  id v4 = [NSString writableTypeIdentifiersForItemProvider];
  [v0 addObjectsFromArray:v4];

  id v5 = (void *)externalDataTypeIdentifiers_identifiers;
  externalDataTypeIdentifiers_identifiers = (uint64_t)v0;
}

- (BOOL)isInManagedAccountWithSourceMailboxScope:(id)a3
{
  id v4 = a3;
  id v5 = [(EMBaseMessageListItem *)self mailboxes];
  id v6 = objc_msgSend(v5, "ef_filter:", &__block_literal_global_451);

  if ([v6 count])
  {
    id v7 = +[EMMailboxScope allMailboxesScope];

    if (v7 == v4)
    {
      char v14 = 1;
    }
    else
    {
      char v20 = 0;
      id v8 = [(EMMessage *)self repository];
      id v9 = [v8 mailboxRepository];
      id v10 = [v4 allMailboxObjectIDsWithMailboxTypeResolver:v9 forExclusion:&v20];

      if (v20)
      {
        id v11 = objc_alloc(MEMORY[0x1E4F1CA80]);
        id v12 = [(EMBaseMessageListItem *)self mailboxObjectIDs];
        long long v13 = (void *)[v11 initWithArray:v12];

        [v13 minusSet:v10];
      }
      else
      {
        id v15 = objc_alloc(MEMORY[0x1E4F1CA80]);
        id v16 = [(EMBaseMessageListItem *)self mailboxObjectIDs];
        long long v13 = (void *)[v15 initWithArray:v16];

        [v13 intersectSet:v10];
      }
      if ([v13 count])
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __69__EMMessage_ManagedSource__isInManagedAccountWithSourceMailboxScope___block_invoke_2;
        v18[3] = &unk_1E63E4648;
        id v19 = v13;
        char v14 = objc_msgSend(v6, "ef_any:", v18);
      }
      else
      {
        char v14 = 1;
      }
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

uint64_t __69__EMMessage_ManagedSource__isInManagedAccountWithSourceMailboxScope___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 account];
  uint64_t v3 = [v2 sourceIsManaged];

  return v3;
}

uint64_t __69__EMMessage_ManagedSource__isInManagedAccountWithSourceMailboxScope___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 objectID];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)senderDisplayNameUsingContactStore:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = [(EMBaseMessageListItem *)self senderList];
    if ([v5 count] == 1)
    {
      id v6 = [v5 firstObject];
      id v7 = [v4 displayNameForEmailAddress:v6 abbreviated:1];
    }
    else
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

- (BOOL)shouldShowReplyAll
{
  if (!_os_feature_enabled_impl()) {
    return 1;
  }
  uint64_t v3 = [(EMBaseMessageListItem *)self toList];
  uint64_t v4 = [v3 count];
  id v5 = [(EMBaseMessageListItem *)self ccList];
  BOOL v6 = (unint64_t)([v5 count] + v4) > 1;

  return v6;
}

+ (id)predicateForMessageWithItemID:(id)a3 mailboxPredicate:(id)a4 mailboxTypeResolver:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"EMMessageQueryAdditions.m", 24, @"Invalid parameter not satisfying: %@", @"[itemID isKindOfClass:[EMMessageCollectionItemID class]]" object file lineNumber description];
  }
  id v12 = [[EMMessageObjectID alloc] initWithCollectionItemID:v9 predicate:v10 mailboxTypeResolver:v11];
  long long v13 = [a1 predicateForMessageWithObjectID:v12];

  return v13;
}

+ (id)predicateForMessageWithObjectID:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"EMMessageQueryAdditions.m", 30, @"Invalid parameter not satisfying: %@", @"[objectID isKindOfClass:[EMMessageObjectID class]]" object file lineNumber description];
  }
  BOOL v6 = [v5 serializedRepresentation];
  id v7 = [a1 _predicateForMessagesWithObjectIDConstantValue:v6 operatorType:4];

  return v7;
}

+ (id)predicateForMessagesWithObjectIDs:(id)a3
{
  uint64_t v4 = objc_msgSend(a3, "ef_filter:", &__block_literal_global_35);
  id v5 = objc_msgSend(v4, "ef_map:", &__block_literal_global_24);

  BOOL v6 = [a1 _predicateForMessagesWithObjectIDConstantValue:v5 operatorType:10];

  return v6;
}

uint64_t __65__EMMessage_EMQueryAdditions__predicateForMessagesWithObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __65__EMMessage_EMQueryAdditions__predicateForMessagesWithObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 serializedRepresentation];
  return v2;
}

+ (id)predicateForExcludingMessageWithObjectID:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"EMMessageQueryAdditions.m", 44, @"Invalid parameter not satisfying: %@", @"[objectID isKindOfClass:[EMMessageObjectID class]]" object file lineNumber description];
  }
  BOOL v6 = [v5 serializedRepresentation];
  id v7 = [a1 _predicateForMessagesWithObjectIDConstantValue:v6 operatorType:5];

  return v7;
}

+ (id)predicateForExcludingMessagesWithObjectIDs:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v4 = [a1 predicateForMessagesWithObjectIDs:a3];
  id v5 = [v3 notPredicateWithSubpredicate:v4];

  return v5;
}

+ (id)_predicateForMessagesWithObjectIDConstantValue:(id)a3 operatorType:(unint64_t)a4
{
  id v5 = a3;
  BOOL v6 = (void *)MEMORY[0x1E4F28B98];
  id v7 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"objectID.serializedRepresentation"];
  id v8 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v5];
  id v9 = [v6 predicateWithLeftExpression:v7 rightExpression:v8 modifier:0 type:a4 options:0];

  return v9;
}

- (void)initWithObjectID:(uint64_t)a3 builder:(os_log_t)log .cold.1(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_fault_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_FAULT, "Error Message has NO conversationID:%llu, please check previous logs for more info %@", buf, 0x16u);
}

- (void)setCachedMetadata:(uint64_t)a3 forKey:.cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_2(a1, (uint64_t)a2, a3, 5.8382e-34);
  _os_log_error_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_ERROR, "Unable to encode object for key '%{public}@': %{public}@", v4, 0x16u);
}

- (void)cachedMetadataOfClass:(uint64_t)a1 forKey:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_ERROR, "Cached metadata for key '%{public}@' is of unexpected class.", (uint8_t *)&v2, 0xCu);
}

- (void)cachedMetadataOfClass:(uint64_t)a1 forKey:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_ERROR, "Found invalid JSON for key '%{public}@'.", (uint8_t *)&v2, 0xCu);
}

- (void)cachedMetadataOfClass:(uint64_t)a3 forKey:.cold.3(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_2(a1, (uint64_t)a2, a3, 5.8382e-34);
  _os_log_error_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_ERROR, "Unable to decode cached metadata for key '%{public}@': %{public}@", v4, 0x16u);
}

- (void)requestRepresentationWithOptions:(os_log_t)log delegate:(void *)a4 completionHandler:.cold.1(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "available representations does not contain requested representation: {%{public}@}", buf, 0xCu);
}

@end