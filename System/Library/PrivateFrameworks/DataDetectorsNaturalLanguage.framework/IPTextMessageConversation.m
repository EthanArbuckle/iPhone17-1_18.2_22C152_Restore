@interface IPTextMessageConversation
+ (id)collapseMessages:(id)a3;
+ (id)collapsedMessagesFromMessages:(id)a3;
- (IPTextMessageConversation)init;
- (NSArray)allMessages;
- (NSMutableDictionary)eventsByMessageIdentifierDictionary;
- (NSMutableDictionary)messageByMessageIdentifierDictionary;
- (id)eventsInPreviouslyScannedMessageWithIdentifier:(id)a3;
- (id)messageForIdentifier:(id)a3;
- (void)_scanEventsInLastMessageOnly:(BOOL)a3 synchronously:(BOOL)a4 completionHandler:(id)a5;
- (void)addMessage:(id)a3;
- (void)reset;
- (void)scanEventsInLastMessageOnly:(BOOL)a3 synchronously:(BOOL)a4 completionHandler:(id)a5;
- (void)setAllMessages:(id)a3;
- (void)setEventsByMessageIdentifierDictionary:(id)a3;
- (void)setMessageByMessageIdentifierDictionary:(id)a3;
@end

@implementation IPTextMessageConversation

- (IPTextMessageConversation)init
{
  v10.receiver = self;
  v10.super_class = (Class)IPTextMessageConversation;
  v2 = [(IPTextMessageConversation *)&v10 init];
  uint64_t v3 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:100];
  messageByMessageIdentifierDictionary = v2->_messageByMessageIdentifierDictionary;
  v2->_messageByMessageIdentifierDictionary = (NSMutableDictionary *)v3;

  uint64_t v5 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:100];
  eventsByMessageIdentifierDictionary = v2->_eventsByMessageIdentifierDictionary;
  v2->_eventsByMessageIdentifierDictionary = (NSMutableDictionary *)v5;

  v7 = [[IPCircularBufferArray alloc] initWithCapacity:30];
  lastMessages = v2->_lastMessages;
  v2->_lastMessages = v7;

  return v2;
}

- (NSArray)allMessages
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(IPCircularBufferArray *)v2->_lastMessages allObjects];
  v4 = (void *)[v3 copy];

  objc_sync_exit(v2);
  return (NSArray *)v4;
}

- (void)addMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  [v4 setType:IPMessageTypeShortMessage];
  v6 = [v4 identifier];
  v7 = [(NSMutableDictionary *)v5->_messageByMessageIdentifierDictionary objectForKeyedSubscript:v6];

  if (!v7)
  {
    [(NSMutableDictionary *)v5->_messageByMessageIdentifierDictionary setObject:v4 forKeyedSubscript:v6];
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3032000000;
    v10[3] = __Block_byref_object_copy__2;
    v10[4] = __Block_byref_object_dispose__2;
    v11 = v5;
    lastMessages = v11->_lastMessages;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __40__IPTextMessageConversation_addMessage___block_invoke;
    v9[3] = &unk_264723008;
    v9[4] = v10;
    [(IPCircularBufferArray *)lastMessages addObject:v4 completionHandler:v9];
    _Block_object_dispose(v10, 8);
  }
  objc_sync_exit(v5);
}

void __40__IPTextMessageConversation_addMessage___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v5 = [a2 identifier];
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) messageByMessageIdentifierDictionary];
    [v3 setObject:0 forKeyedSubscript:v5];

    id v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) eventsByMessageIdentifierDictionary];
    [v4 setObject:0 forKeyedSubscript:v5];
  }
}

- (void)reset
{
  obj = self;
  objc_sync_enter(obj);
  [(NSMutableDictionary *)obj->_messageByMessageIdentifierDictionary removeAllObjects];
  [(NSMutableDictionary *)obj->_eventsByMessageIdentifierDictionary removeAllObjects];
  [(IPCircularBufferArray *)obj->_lastMessages removeAllObjects];
  objc_sync_exit(obj);
}

- (id)messageForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)v5->_messageByMessageIdentifierDictionary objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)scanEventsInLastMessageOnly:(BOOL)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __89__IPTextMessageConversation_scanEventsInLastMessageOnly_synchronously_completionHandler___block_invoke;
  v10[3] = &unk_264723030;
  id v11 = v8;
  id v9 = v8;
  [(IPTextMessageConversation *)self _scanEventsInLastMessageOnly:v6 synchronously:v5 completionHandler:v10];
}

uint64_t __89__IPTextMessageConversation_scanEventsInLastMessageOnly_synchronously_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_scanEventsInLastMessageOnly:(BOOL)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__2;
  v29[4] = __Block_byref_object_dispose__2;
  id v9 = self;
  v30 = v9;
  objc_super v10 = [(IPTextMessageConversation *)v9 allMessages];
  id v11 = [v10 lastObject];
  int v12 = [v11 isGroupConversation];

  if (_scanEventsInLastMessageOnly_synchronously_completionHandler__onceToken != -1) {
    dispatch_once(&_scanEventsInLastMessageOnly_synchronously_completionHandler__onceToken, &__block_literal_global_5);
  }
  if (v12) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = _scanEventsInLastMessageOnly_synchronously_completionHandler__sKMaxNumberOfMessagesToKeep;
  }
  v14 = [MEMORY[0x263EFF980] arrayWithCapacity:v13];
  v15 = [(IPTextMessageConversation *)v9 allMessages];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __90__IPTextMessageConversation__scanEventsInLastMessageOnly_synchronously_completionHandler___block_invoke_2;
  v22[3] = &unk_264723080;
  v22[4] = v9;
  id v16 = v8;
  id v25 = v16;
  id v17 = v15;
  id v23 = v17;
  uint64_t v27 = v13;
  id v18 = v14;
  BOOL v28 = a3;
  id v24 = v18;
  v26 = v29;
  uint64_t v19 = MEMORY[0x22A632750](v22);
  v20 = (void *)v19;
  if (v5)
  {
    (*(void (**)(uint64_t))(v19 + 16))(v19);
  }
  else
  {
    v21 = dispatch_get_global_queue(17, 0);
    dispatch_async(v21, v20);
  }
  _Block_object_dispose(v29, 8);
}

void __90__IPTextMessageConversation__scanEventsInLastMessageOnly_synchronously_completionHandler___block_invoke()
{
  v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  _scanEventsInLastMessageOnly_synchronously_completionHandler__sKMaxNumberOfMessagesToKeep = [v0 integerForKey:@"IPTextMessageConversationMaxNumberOfMessagesToKeep"];

  if ((unint64_t)(_scanEventsInLastMessageOnly_synchronously_completionHandler__sKMaxNumberOfMessagesToKeep - 21) <= 0xFFFFFFFFFFFFFFEBLL) {
    _scanEventsInLastMessageOnly_synchronously_completionHandler__sKMaxNumberOfMessagesToKeep = 7;
  }
  v1 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v2 = [v1 integerForKey:@"IPTextMessageConversationMaxTimeIntervalInHoursForMessagesToKeep"];

  uint64_t v3 = 86400;
  if ((unint64_t)(v2 - 101) >= 0xFFFFFFFFFFFFFF9CLL) {
    uint64_t v3 = 3600 * v2;
  }
  _scanEventsInLastMessageOnly_synchronously_completionHandler__kMaxTimeIntervalInSecondsForMessagesToKeep = v3;
}

void __90__IPTextMessageConversation__scanEventsInLastMessageOnly_synchronously_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  obuint64_t j = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  uint64_t v49 = a1;
  if ([*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    objc_sync_exit(obj);

    v43 = objc_opt_new();
    v39 = [*(id *)(a1 + 40) lastObject];
    v46 = [v39 dateSent];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v2 = *(id *)(a1 + 40);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v62 objects:v67 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v63 != v4) {
            objc_enumerationMutation(v2);
          }
          BOOL v6 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          v7 = [v6 dateSent];
          [v7 timeIntervalSinceDate:v46];
          BOOL v9 = v8 > (double)(unint64_t)(3600
                                             * _scanEventsInLastMessageOnly_synchronously_completionHandler__kMaxTimeIntervalInSecondsForMessagesToKeep);

          if (!v9) {
            [v43 addObject:v6];
          }
        }
        uint64_t v3 = [v2 countByEnumeratingWithState:&v62 objects:v67 count:16];
      }
      while (v3);
    }

    v40 = +[IPTextMessageConversation collapsedMessagesFromMessages:v43];
    unint64_t v10 = [v40 count];
    unint64_t v11 = v10;
    unint64_t v12 = *(void *)(v49 + 72);
    unint64_t v13 = v10 - v12;
    if (v10 < v12) {
      unint64_t v13 = 0;
    }
    if (v13 < v10)
    {
      if (v10 < v12) {
        unint64_t v12 = v10;
      }
      uint64_t v14 = -(uint64_t)v12;
      do
      {
        v15 = [v40 objectAtIndexedSubscript:v11 + v14];
        [*(id *)(v49 + 48) addObject:v15];
      }
      while (!__CFADD__(v14++, 1));
    }
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v42 = *(id *)(v49 + 48);
    uint64_t v17 = [v42 countByEnumeratingWithState:&v58 objects:v66 count:16];
    if (v17)
    {
      uint64_t v44 = *(void *)v59;
      uint64_t v41 = 0;
      do
      {
        uint64_t v18 = 0;
        uint64_t v19 = v41;
        uint64_t v45 = v17;
        v41 += v17;
        do
        {
          if (*(void *)v59 != v44) {
            objc_enumerationMutation(v42);
          }
          v20 = *(void **)(*((void *)&v58 + 1) + 8 * v18);
          if (!*(unsigned char *)(v49 + 80)
            || ([*(id *)(v49 + 48) lastObject],
                v21 = objc_claimAutoreleasedReturnValue(),
                BOOL v22 = v20 == v21,
                v21,
                v22))
          {
            id v23 = [v20 identifier];
            if (v23)
            {
              id v24 = *(id *)(v49 + 32);
              objc_sync_enter(v24);
              id v25 = [*(id *)(*(void *)(*(void *)(v49 + 64) + 8) + 40) eventsByMessageIdentifierDictionary];
              id obja = [v25 objectForKeyedSubscript:v23];

              objc_sync_exit(v24);
              if (obja)
              {
                [obja count];
                (*(void (**)(void))(*(void *)(v49 + 56) + 16))();
              }
              else
              {
                v26 = objc_opt_new();
                if (v19)
                {
                  for (uint64_t j = 0; j != v19; ++j)
                  {
                    BOOL v28 = [*(id *)(v49 + 48) objectAtIndexedSubscript:j];
                    v29 = [v28 messageUnits];
                    v30 = [v29 firstObject];
                    v31 = [v30 text];

                    if ([v31 length])
                    {
                      v32 = [v28 messageUnits];
                      [v26 addObjectsFromArray:v32];
                    }
                  }
                }
                v33 = objc_alloc_init(IPFeatureTextMessageScanner);
                v34 = [v20 messageUnits];
                v50[0] = MEMORY[0x263EF8330];
                v50[1] = 3221225472;
                v50[2] = __90__IPTextMessageConversation__scanEventsInLastMessageOnly_synchronously_completionHandler___block_invoke_3;
                v50[3] = &unk_264723058;
                uint64_t v35 = *(void *)(v49 + 64);
                v50[4] = *(void *)(v49 + 32);
                uint64_t v57 = v35;
                id v51 = v23;
                id v52 = v43;
                id v36 = *(id *)(v49 + 56);
                v53 = v20;
                id v54 = v26;
                id v55 = v34;
                id v56 = v36;
                id v37 = v34;
                id v38 = v26;
                [(IPFeatureTextMessageScanner *)v33 scanEventsInMessageUnits:v37 contextMessageUnits:v38 synchronously:1 completionHandler:v50];
              }
            }
          }
          ++v19;
          ++v18;
        }
        while (v18 != v45);
        uint64_t v17 = [v42 countByEnumeratingWithState:&v58 objects:v66 count:16];
      }
      while (v17);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    objc_sync_exit(obj);
  }
}

void __90__IPTextMessageConversation__scanEventsInLastMessageOnly_synchronously_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = (void *)MEMORY[0x263EFFA68];
  }
  id v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  BOOL v6 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) eventsByMessageIdentifierDictionary];
  [v6 setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

  objc_sync_exit(v5);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setIpsos_usedBubblesCount:", objc_msgSend(*(id *)(a1 + 48), "count", (void)v11));
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

- (id)eventsInPreviouslyScannedMessageWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = [(NSMutableDictionary *)v5->_eventsByMessageIdentifierDictionary objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

+ (id)collapsedMessagesFromMessages:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v31 = objc_opt_new();
  id v4 = [v3 firstObject];
  id v5 = [v4 dateSent];
  BOOL v6 = [v4 sender];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v33 = *(void *)v35;
    do
    {
      uint64_t v11 = 0;
      uint64_t v30 = v10;
      uint64_t v12 = -v10;
      uint64_t v13 = v33;
      do
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v7);
        }
        if (v12 != v11)
        {
          long long v14 = *(void **)(*((void *)&v34 + 1) + 8 * v11);
          v15 = [v14 dateSent];
          [v15 timeIntervalSinceDate:v5];
          double v17 = v16;

          uint64_t v18 = [v14 sender];

          if (v18 == v6 && v17 < 60.0)
          {
            v38[0] = v4;
            v38[1] = v14;
            id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];
            [a1 collapseMessages:v23];
            id v24 = v6;
            v26 = id v25 = v7;

            id v27 = v26;
            id v7 = v25;
            BOOL v6 = v24;
            uint64_t v13 = v33;
            id v22 = v27;

            uint64_t v21 = [v14 dateSent];

            id v20 = v22;
          }
          else
          {
            if (v4) {
              [v31 addObject:v4];
            }
            id v20 = v14;

            uint64_t v21 = [v20 dateSent];

            [v20 sender];
            BOOL v6 = v22 = v6;
          }

          id v5 = (void *)v21;
          id v4 = v20;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v10 = v30 + v9;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v9);
  }

  [v31 addObject:v4];
  id v28 = v31;

  return v28;
}

+ (id)collapseMessages:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 count];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = [*(id *)(*((void *)&v27 + 1) + 8 * i) messageUnits];
        uint64_t v13 = [v12 firstObject];
        long long v14 = [v13 text];

        if ([v14 length])
        {
          [v4 appendString:v14];
          if (v5 - 1 - v9 != i) {
            [v4 appendString:@" "];
          }
        }
      }
      v9 += v8;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }

  v15 = [v6 lastObject];
  double v16 = [IPMessage alloc];
  double v17 = [v15 identifier];
  uint64_t v18 = [v15 subject];
  uint64_t v19 = [v15 sender];
  id v20 = [v15 recipients];
  uint64_t v21 = [v15 dateSent];
  id v22 = [v15 type];
  id v23 = [(IPMessage *)v16 initWithIdentifier:v17 subject:v18 sender:v19 recipients:v20 dateSent:v21 type:v22];

  id v24 = [[IPMessageUnit alloc] initWithText:v4 originalMessage:v23 index:0];
  v31 = v24;
  id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
  [(IPMessage *)v23 setMessageUnits:v25];

  return v23;
}

- (void)setAllMessages:(id)a3
{
}

- (NSMutableDictionary)messageByMessageIdentifierDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMessageByMessageIdentifierDictionary:(id)a3
{
}

- (NSMutableDictionary)eventsByMessageIdentifierDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEventsByMessageIdentifierDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsByMessageIdentifierDictionary, 0);
  objc_storeStrong((id *)&self->_messageByMessageIdentifierDictionary, 0);
  objc_storeStrong((id *)&self->_allMessages, 0);
  objc_storeStrong((id *)&self->_lastMessages, 0);
}

@end