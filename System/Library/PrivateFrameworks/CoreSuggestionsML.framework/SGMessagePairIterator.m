@interface SGMessagePairIterator
- (BOOL)isDoneIterating;
- (NSDate)latestProcessedDate;
- (SGMessagePairIterator)initWithStartDate:(id)a3 maxBatchSize:(unint64_t)a4 maxReplyLength:(unint64_t)a5 maxReplyGap:(double)a6;
- (id)handleFromConversationId:(id)a3;
- (id)nextMessagePair;
- (id)removeBreadcrumbsFromMessage:(id)a3;
@end

@implementation SGMessagePairIterator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestProcessedDate, 0);
  objc_storeStrong((id *)&self->_latestPromptForHandle, 0);
  objc_storeStrong((id *)&self->_breadcrumbCharacterString, 0);
  objc_storeStrong((id *)&self->_attachmentCharacterString, 0);
  objc_storeStrong((id *)&self->_messageEvents, 0);
}

- (NSDate)latestProcessedDate
{
  return self->_latestProcessedDate;
}

- (BOOL)isDoneIterating
{
  return self->_messageEventIndex >= self->_messageEventCount;
}

- (id)nextMessagePair
{
  if ([(SGMessagePairIterator *)self isDoneIterating])
  {
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"SGMessagePairIterator.m" lineNumber:159 description:@"Iterator exhausted!"];
  }
  messageEvents = self->_messageEvents;
  if (!messageEvents)
  {
    v30 = [MEMORY[0x263F08690] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"SGMessagePairIterator.m" lineNumber:160 description:@"messageEvents is nil"];

    messageEvents = self->_messageEvents;
  }
  v5 = [(NSArray *)messageEvents objectAtIndexedSubscript:self->_messageEventIndex];
  ++self->_messageEventIndex;
  v6 = [v5 startDate];
  latestProcessedDate = self->_latestProcessedDate;
  self->_latestProcessedDate = v6;

  v8 = [v5 interaction];
  v9 = INTypedInteractionWithInteraction();
  v10 = [v9 intent];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = 0;
    goto LABEL_24;
  }
  id v11 = v10;
  uint64_t v12 = [v11 conversationIdentifier];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [v11 content];

    if (v14)
    {
      v15 = [v11 content];
      v16 = (__CFString *)[v15 mutableCopy];

      CFStringTrimWhitespace(v16);
      v17 = [v11 conversationIdentifier];
      v18 = [(SGMessagePairIterator *)self handleFromConversationId:v17];

      uint64_t v19 = [v8 direction];
      if (v19 == 1)
      {
        v21 = [(NSMutableDictionary *)self->_latestPromptForHandle objectForKeyedSubscript:v18];
        [(NSMutableDictionary *)self->_latestPromptForHandle setObject:0 forKeyedSubscript:v18];
        if (!v21)
        {
          v23 = 0;
          goto LABEL_20;
        }
        v24 = [v21 first];
        v22 = [(SGMessagePairIterator *)self removeBreadcrumbsFromMessage:v24];

        v25 = [(SGMessagePairIterator *)self removeBreadcrumbsFromMessage:v16];
        if ([v25 length]
          && [v22 length]
          && [v25 length] <= self->_maxReplyLength)
        {
          v32 = [v5 startDate];
          v27 = [v21 second];
          if (v27)
          {
            v31 = v27;
            [v32 timeIntervalSinceDate:v27];
            if (v28 <= self->_maxReplyGap) {
              v23 = [[SGMessagePair alloc] initWithReply:v25 prompt:v22 handle:v18 sentAt:v32];
            }
            else {
              v23 = 0;
            }
            v27 = v31;
          }
          else
          {
            v23 = 0;
          }
        }
        else
        {
          v23 = 0;
        }
      }
      else
      {
        if (v19 != 2)
        {
          v23 = 0;
          goto LABEL_22;
        }
        v20 = (void *)MEMORY[0x263F61EA8];
        v21 = [v5 startDate];
        v22 = [v20 tupleWithFirst:v16 second:v21];
        [(NSMutableDictionary *)self->_latestPromptForHandle setObject:v22 forKeyedSubscript:v18];
        v23 = 0;
      }

LABEL_20:
LABEL_22:

      goto LABEL_23;
    }
  }
  v23 = 0;
LABEL_23:

LABEL_24:
  return v23;
}

- (id)removeBreadcrumbsFromMessage:(id)a3
{
  v5 = (void *)MEMORY[0x22A66BDC0](self, a2);
  v6 = [a3 stringByReplacingOccurrencesOfString:self->_attachmentCharacterString withString:&stru_26DAF9368];
  v7 = [v6 stringByReplacingOccurrencesOfString:self->_breadcrumbCharacterString withString:&stru_26DAF9368];

  return v7;
}

- (SGMessagePairIterator)initWithStartDate:(id)a3 maxBatchSize:(unint64_t)a4 maxReplyLength:(unint64_t)a5 maxReplyGap:(double)a6
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v10 = a3;
  v55.receiver = self;
  v55.super_class = (Class)SGMessagePairIterator;
  id v11 = [(SGMessagePairIterator *)&v55 init];
  uint64_t v12 = v11;
  if (!v11) {
    goto LABEL_17;
  }
  v11->_done = 0;
  v11->_maxReplyLength = a5;
  v11->_maxReplyGap = a6;
  uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
  latestPromptForHandle = v12->_latestPromptForHandle;
  v12->_latestPromptForHandle = (NSMutableDictionary *)v13;

  latestProcessedDate = v12->_latestProcessedDate;
  v12->_latestProcessedDate = 0;

  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  v16 = (id *)getIMAttachmentCharacterStringSymbolLoc_ptr;
  uint64_t v59 = getIMAttachmentCharacterStringSymbolLoc_ptr;
  if (!getIMAttachmentCharacterStringSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v65 = __getIMAttachmentCharacterStringSymbolLoc_block_invoke;
    v66 = &unk_2647EB178;
    v67 = &v56;
    v17 = IMFoundationLibrary();
    v18 = dlsym(v17, "IMAttachmentCharacterString");
    *(void *)(v67[1] + 24) = v18;
    getIMAttachmentCharacterStringSymbolLoc_ptr = *(void *)(v67[1] + 24);
    v16 = (id *)v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v16)
  {
    v49 = [MEMORY[0x263F08690] currentHandler];
    v50 = [NSString stringWithUTF8String:"NSString *getIMAttachmentCharacterString(void)"];
    objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, @"SGMessagePairIterator.m", 26, @"%s", dlerror());

    goto LABEL_21;
  }
  objc_storeStrong((id *)&v12->_attachmentCharacterString, *v16);
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  uint64_t v19 = (id *)getIMBreadcrumbCharacterStringSymbolLoc_ptr;
  uint64_t v59 = getIMBreadcrumbCharacterStringSymbolLoc_ptr;
  if (!getIMBreadcrumbCharacterStringSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v65 = __getIMBreadcrumbCharacterStringSymbolLoc_block_invoke;
    v66 = &unk_2647EB178;
    v67 = &v56;
    v20 = IMFoundationLibrary();
    v21 = dlsym(v20, "IMBreadcrumbCharacterString");
    *(void *)(v67[1] + 24) = v21;
    getIMBreadcrumbCharacterStringSymbolLoc_ptr = *(void *)(v67[1] + 24);
    uint64_t v19 = (id *)v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v19)
  {
    v51 = [MEMORY[0x263F08690] currentHandler];
    v52 = [NSString stringWithUTF8String:"NSString *getIMBreadcrumbCharacterString(void)"];
    objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v52, @"SGMessagePairIterator.m", 27, @"%s", dlerror());

LABEL_21:
    __break(1u);
  }
  objc_storeStrong((id *)&v12->_breadcrumbCharacterString, *v19);
  v53 = [MEMORY[0x263F350B8] knowledgeStore];
  v22 = (void *)MEMORY[0x263F35110];
  v23 = [MEMORY[0x263F350A8] intentClass];
  v24 = [v22 predicateForObjectsWithMetadataKey:v23 inValues:&unk_26DB016C0];

  if (v10)
  {
    v25 = (void *)MEMORY[0x263F08730];
    v63[0] = v24;
    v26 = [MEMORY[0x263F08A98] predicateWithFormat:@"startDate > %@", v10];
    v63[1] = v26;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:2];
    uint64_t v28 = [v25 andPredicateWithSubpredicates:v27];

    v24 = (void *)v28;
  }
  v29 = (void *)MEMORY[0x263F08730];
  v62[0] = v24;
  v30 = (void *)MEMORY[0x263F35110];
  v31 = [MEMORY[0x263F35118] intentsSourceID];
  v32 = [v30 predicateForEventsWithSourceID:v31 bundleID:@"com.apple.MobileSMS"];
  v62[1] = v32;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:2];
  v34 = [v29 andPredicateWithSubpredicates:v33];

  v35 = (void *)MEMORY[0x263F35090];
  v36 = [MEMORY[0x263F35148] appIntentsStream];
  v61 = v36;
  v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v61 count:1];
  v38 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"startDate" ascending:1];
  v60 = v38;
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v60 count:1];
  v40 = [v35 eventQueryWithPredicate:v34 eventStreams:v37 offset:0 limit:a4 sortDescriptors:v39];

  v41 = [MEMORY[0x263F35090] allDevices];
  [v40 setDeviceIDs:v41];

  id v54 = 0;
  uint64_t v42 = [v53 executeQuery:v40 error:&v54];
  id v43 = v54;
  messageEvents = v12->_messageEvents;
  v12->_messageEvents = (NSArray *)v42;

  if (v43 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    v48 = [v43 description];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v48;
    _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Failed to retrieve message events from CoreDuet. Error: %@", (uint8_t *)&buf, 0xCu);
  }
  v45 = v12->_messageEvents;
  if (v45 && [(NSArray *)v45 count] >= 2)
  {
    v12->_messageEventCount = [(NSArray *)v12->_messageEvents count];
    v12->_messageEventIndex = 0;

LABEL_17:
    v46 = v12;
    goto LABEL_18;
  }

  v46 = 0;
LABEL_18:

  return v46;
}

- (id)handleFromConversationId:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x22A66BDC0]();
  v5 = [v3 componentsSeparatedByString:@";"];
  if ([v5 count] == 3)
  {
    uint64_t v6 = [v5 objectAtIndexedSubscript:2];
  }
  else
  {
    uint64_t v6 = [v3 copy];
  }
  v7 = (void *)v6;

  return v7;
}

@end