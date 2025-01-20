@interface SGQuickResponsesReplies
+ (id)normalizeReplyText:(id)a3;
+ (id)normalizeReplyTextInternal:(id)a3;
+ (id)repliesWithArray:(id)a3;
- (SGQuickResponsesReplies)initWithArray:(id)a3;
- (id)normalizedReplyTextsSet;
- (id)replyTextForIndex:(unint64_t)a3 position:(unint64_t)a4;
- (id)replyTextForIndexAndPosition:(id)a3;
- (id)replyTextsForIndex:(unint64_t)a3;
- (unint64_t)maxDistinctReplies;
- (unint64_t)modelCount;
- (unint64_t)replyClassCount;
- (unint64_t)replyCountForIndex:(unint64_t)a3;
- (unint64_t)replyTextCount;
@end

@implementation SGQuickResponsesReplies

- (SGQuickResponsesReplies)initWithArray:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"SGQuickResponsesConfig.m", 488, @"%@ must implement -initWithArray:", objc_opt_class() object file lineNumber description];

  return 0;
}

- (unint64_t)maxDistinctReplies
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"SGQuickResponsesConfig.m", 482, @"%@ must implement -maxDistinctReplies:", objc_opt_class() object file lineNumber description];

  return 0;
}

- (unint64_t)modelCount
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"SGQuickResponsesConfig.m", 476, @"%@ must implement -modelCount:", objc_opt_class() object file lineNumber description];

  return 0;
}

- (unint64_t)replyClassCount
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"SGQuickResponsesConfig.m", 470, @"%@ must implement -replyClassCount:", objc_opt_class() object file lineNumber description];

  return 0;
}

- (unint64_t)replyTextCount
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"SGQuickResponsesConfig.m", 464, @"%@ must implement -replyTextCount:", objc_opt_class() object file lineNumber description];

  return 0;
}

- (unint64_t)replyCountForIndex:(unint64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"SGQuickResponsesConfig.m", 458, @"%@ must implement -replyTextCount:", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)replyTextsForIndex:(unint64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"SGQuickResponsesConfig.m", 452, @"%@ must implement -replyTextsForIndex:", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)replyTextForIndexAndPosition:(id)a3
{
  id v4 = a3;
  v5 = [v4 first];
  uint64_t v6 = [v5 unsignedIntegerValue];
  v7 = [v4 second];

  v8 = -[SGQuickResponsesReplies replyTextForIndex:position:](self, "replyTextForIndex:position:", v6, [v7 unsignedIntegerValue]);

  return v8;
}

- (id)replyTextForIndex:(unint64_t)a3 position:(unint64_t)a4
{
  uint64_t v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2, self, @"SGQuickResponsesConfig.m", 441, @"%@ must implement -replyTextsForIndex:position:", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)normalizedReplyTextsSet
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"SGQuickResponsesConfig.m", 435, @"%@ must implement -normalizedReplyTextsSet:", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (id)repliesWithArray:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {

    v5 = [v4 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = SGQuickResponsesRepliesNested;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v9 = 0;
            _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Failure to read SGQuickResponsesReplies from config.", v9, 2u);
          }
          v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = SGQuickResponsesRepliesFlattened;
    }
    v7 = (void *)[[v6 alloc] initWithArray:v4];
LABEL_11:

    goto LABEL_12;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "array", buf, 2u);
  }
  v7 = 0;
LABEL_12:

  return v7;
}

+ (id)normalizeReplyTextInternal:(id)a3
{
  return (id)[a3 localizedLowercaseString];
}

+ (id)normalizeReplyText:(id)a3
{
  id v3 = SGNormalizeEmojisInString(a3);
  id v4 = [v3 localizedLowercaseString];

  return v4;
}

@end