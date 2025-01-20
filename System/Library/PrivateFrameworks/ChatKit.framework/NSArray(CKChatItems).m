@interface NSArray(CKChatItems)
- (id)__ck_IMChatItemsAtIndexes:()CKChatItems;
- (id)__ck_chatItemWithGUID:()CKChatItems;
- (id)__ck_failedMessagesForChatItemsWithConversationID:()CKChatItems;
- (id)__ck_indexesOfPartsOfMessageWithGUID:()CKChatItems;
- (id)__ck_indexesOfPartsOfMessages:()CKChatItems;
- (id)__ck_indexesOfPartsOfNonAttachmentMessages:()CKChatItems;
- (id)__ck_indexesOfUnplayedAudioMessages;
- (id)__ck_messageForChatItemAtIndex:()CKChatItems;
- (id)__ck_parentChatItemWithMesssageGUID:()CKChatItems associatedMessageRange:;
- (uint64_t)__ck_catchUpScrollTargetForMessageGUID:()CKChatItems;
- (uint64_t)__ck_indexOfChatItemWithGUID:()CKChatItems;
- (uint64_t)__ck_indexOfMediaObject:()CKChatItems;
- (uint64_t)__ck_indexOfParentChatItemWithMesssageGUID:()CKChatItems associatedMessageRange:;
- (uint64_t)__ck_indexOfPartOfMessage:()CKChatItems withMessagePartIndex:;
- (uint64_t)__ck_indexOfPartOfMessageGUID:()CKChatItems withMessagePartIndex:;
- (uint64_t)__ck_indexOfTransfer:()CKChatItems;
- (void)__ck_unloadSizesAtIndexes:()CKChatItems;
- (void)__ck_unloadTranscriptTextAtIndexes:()CKChatItems;
@end

@implementation NSArray(CKChatItems)

- (uint64_t)__ck_indexOfMediaObject:()CKChatItems
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__NSArray_CKChatItems____ck_indexOfMediaObject___block_invoke;
  v8[3] = &unk_1E5622268;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateObjectsUsingBlock:v8];
  uint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (uint64_t)__ck_indexOfTransfer:()CKChatItems
{
  id v4 = a3;
  id v5 = [v4 guid];
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if ([v5 length])
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__NSArray_CKChatItems____ck_indexOfTransfer___block_invoke;
    v8[3] = &unk_1E5622268;
    id v9 = v5;
    v10 = &v11;
    [a1 enumerateObjectsUsingBlock:v8];
    uint64_t v6 = v12[3];

    _Block_object_dispose(&v11, 8);
  }

  return v6;
}

- (void)__ck_unloadSizesAtIndexes:()CKChatItems
{
  objc_msgSend(a1, "objectsAtIndexes:");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  +[CKChatItem unloadSizesOfChatItems:v1];
}

- (void)__ck_unloadTranscriptTextAtIndexes:()CKChatItems
{
  id v4 = a3;
  if ([v4 count]) {
    [a1 enumerateObjectsAtIndexes:v4 options:0 usingBlock:&__block_literal_global_78];
  }
}

- (id)__ck_indexesOfUnplayedAudioMessages
{
  v2 = [MEMORY[0x1E4F28E60] indexSet];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__NSArray_CKChatItems____ck_indexesOfUnplayedAudioMessages__block_invoke;
  v5[3] = &unk_1E56255D8;
  id v3 = v2;
  id v6 = v3;
  [a1 enumerateObjectsUsingBlock:v5];

  return v3;
}

- (id)__ck_IMChatItemsAtIndexes:()CKChatItems
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__NSArray_CKChatItems____ck_IMChatItemsAtIndexes___block_invoke;
    v8[3] = &unk_1E56255D8;
    id v6 = v5;
    id v9 = v6;
    [a1 enumerateObjectsAtIndexes:v4 options:0 usingBlock:v8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)__ck_messageForChatItemAtIndex:()CKChatItems
{
  id v1 = objc_msgSend(a1, "objectAtIndex:");
  v2 = [v1 IMChatItem];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 message];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)__ck_failedMessagesForChatItemsWithConversationID:()CKChatItems
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__28;
  v14[4] = __Block_byref_object_dispose__28;
  id v15 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__NSArray_CKChatItems____ck_failedMessagesForChatItemsWithConversationID___block_invoke;
  v10[3] = &unk_1E5625A98;
  v12 = v14;
  uint64_t v13 = a3;
  id v6 = v5;
  id v11 = v6;
  [a1 enumerateObjectsWithOptions:2 usingBlock:v10];
  v7 = v11;
  id v8 = v6;

  _Block_object_dispose(v14, 8);

  return v8;
}

- (uint64_t)__ck_catchUpScrollTargetForMessageGUID:()CKChatItems
{
  id v4 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3010000000;
  id v15 = "";
  long long v16 = xmmword_18F81C890;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__NSArray_CKChatItems____ck_catchUpScrollTargetForMessageGUID___block_invoke;
  v8[3] = &unk_1E5625AC0;
  id v5 = v4;
  id v9 = v5;
  v10 = v17;
  id v11 = &v12;
  [a1 enumerateObjectsUsingBlock:v8];
  uint64_t v6 = v13[4];
  if (v13[5] == 0x7FFFFFFFFFFFFFFFLL) {
    v13[5] = v6;
  }

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v17, 8);

  return v6;
}

- (id)__ck_indexesOfPartsOfMessageWithGUID:()CKChatItems
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28E60] indexSet];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__NSArray_CKChatItems____ck_indexesOfPartsOfMessageWithGUID___block_invoke;
  v11[3] = &unk_1E5623738;
  id v12 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [a1 enumerateObjectsWithOptions:2 usingBlock:v11];
  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (uint64_t)__ck_indexOfPartOfMessageGUID:()CKChatItems withMessagePartIndex:
{
  id v6 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__NSArray_CKChatItems____ck_indexOfPartOfMessageGUID_withMessagePartIndex___block_invoke;
  v10[3] = &unk_1E5625AE8;
  id v7 = v6;
  id v12 = &v14;
  uint64_t v13 = a4;
  id v11 = v7;
  [a1 enumerateObjectsWithOptions:2 usingBlock:v10];
  uint64_t v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (uint64_t)__ck_indexOfPartOfMessage:()CKChatItems withMessagePartIndex:
{
  id v6 = [a3 guid];
  uint64_t v7 = objc_msgSend(a1, "__ck_indexOfPartOfMessageGUID:withMessagePartIndex:", v6, a4);

  return v7;
}

- (id)__ck_indexesOfPartsOfNonAttachmentMessages:()CKChatItems
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28E60] indexSet];
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v21 + 1) + 8 * v11) guid];
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__NSArray_CKChatItems____ck_indexesOfPartsOfNonAttachmentMessages___block_invoke;
  v18[3] = &unk_1E5623738;
  id v19 = v6;
  id v13 = v5;
  id v20 = v13;
  id v14 = v6;
  [a1 enumerateObjectsWithOptions:2 usingBlock:v18];
  id v15 = v20;
  id v16 = v13;

  return v16;
}

- (id)__ck_indexesOfPartsOfMessages:()CKChatItems
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28E60] indexSet];
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v21 + 1) + 8 * v11) guid];
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __54__NSArray_CKChatItems____ck_indexesOfPartsOfMessages___block_invoke;
  v18[3] = &unk_1E5623738;
  id v19 = v6;
  id v13 = v5;
  id v20 = v13;
  id v14 = v6;
  [a1 enumerateObjectsWithOptions:2 usingBlock:v18];
  id v15 = v20;
  id v16 = v13;

  return v16;
}

- (uint64_t)__ck_indexOfChatItemWithGUID:()CKChatItems
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v10), "IMChatItem", (void)v17);
        id v13 = [v12 guid];
        char v14 = [v13 isEqualToString:v4];

        if (v14)
        {
          uint64_t v15 = v8 + v10;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v15;
}

- (id)__ck_chatItemWithGUID:()CKChatItems
{
  uint64_t v2 = objc_msgSend(a1, "__ck_indexOfChatItemWithGUID:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [a1 objectAtIndexedSubscript:v2];
  }

  return v3;
}

- (uint64_t)__ck_indexOfParentChatItemWithMesssageGUID:()CKChatItems associatedMessageRange:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = a1;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v25;
      do
      {
        uint64_t v11 = 0;
        uint64_t v21 = v9;
        uint64_t v22 = v9 + v8;
        do
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = [v12 IMChatItem];
            char v14 = [v13 guid];
            if ([v14 containsString:v5]
              && ![v12 itemIsReplyContextPreview])
            {
              char v15 = [v12 isEditedMessageHistory];

              if ((v15 & 1) == 0)
              {
                unint64_t v16 = [v12 originalMessagePartRange];
                if (a4 >= v16 && a4 - v16 < v17)
                {
                  uint64_t v19 = v21 + v11;
                  goto LABEL_20;
                }
              }
            }
            else
            {
            }
          }
          ++v11;
        }
        while (v8 != v11);
        uint64_t v18 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
        uint64_t v8 = v18;
        uint64_t v9 = v22;
      }
      while (v18);
    }
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_20:
  }
  else
  {
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v19;
}

- (id)__ck_parentChatItemWithMesssageGUID:()CKChatItems associatedMessageRange:
{
  unint64_t v2 = objc_msgSend(a1, "__ck_indexOfParentChatItemWithMesssageGUID:associatedMessageRange:");
  if (v2 >= [a1 count])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [a1 objectAtIndex:v2];
  }

  return v3;
}

@end