@interface NSArray
@end

@implementation NSArray

uint64_t __59__NSArray_CKEntity____im_canonicalIDSAddressesFromEntities__block_invoke(uint64_t a1, void *a2)
{
  return [a2 IDSCanonicalAddress];
}

void __63__NSArray_CKUtilities____ck_indexSetForIndexPathRowsInSection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 section] == *(void *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(v3, "row"));
  }
}

void __64__NSArray_CKUtilities____ck_indexSetForIndexPathItemsInSection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 section] == *(void *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(v3, "item"));
  }
}

void __48__NSArray_CKChatItems____ck_indexOfMediaObject___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v11 mediaObject];
    char v8 = [v7 isEqual:*(void *)(a1 + 32)];

    if ((v8 & 1) == 0) {
      goto LABEL_7;
    }
LABEL_6:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v11 mediaObjects];
    int v10 = [v9 containsObject:*(void *)(a1 + 32)];

    if (v10) {
      goto LABEL_6;
    }
  }
LABEL_7:
}

void __45__NSArray_CKChatItems____ck_indexOfTransfer___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char v8 = [v7 mediaObject];
    v9 = [v8 transfer];
    int v10 = [v9 guid];

    if (v10 && [*(id *)(a1 + 32) isEqualToString:v10])
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
      *a4 = 1;
    }
  }
  else
  {
    int v10 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v7 containsTransferGUID:*(void *)(a1 + 32)])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = a4;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = [v7 mediaObjects];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v19 + 1) + 8 * i) transferGUID];
          int v17 = [v16 isEqualToString:v10];

          if (v17)
          {
            *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
            unsigned char *v18 = 1;
            goto LABEL_21;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_21:
  }
}

uint64_t __59__NSArray_CKChatItems____ck_unloadTranscriptTextAtIndexes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 unloadTranscriptText];
}

void __59__NSArray_CKChatItems____ck_indexesOfUnplayedAudioMessages__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v5 isFromMe] & 1) == 0
    && ([v5 isPlayed] & 1) == 0)
  {
    [*(id *)(a1 + 32) addIndex:a3];
  }
}

void __50__NSArray_CKChatItems____ck_IMChatItemsAtIndexes___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 IMChatItem];
  [v2 addObject:v3];
}

void __74__NSArray_CKChatItems____ck_failedMessagesForChatItemsWithConversationID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = [a2 IMChatItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v12 message];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    char v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if ([v12 stewieConversationID] == *(void *)(a1 + 48))
    {
      v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (v9)
      {
        int v10 = [v9 error];
        uint64_t v11 = [v10 code];

        if (v11 == 4) {
          [*(id *)(a1 + 32) insertObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) atIndex:0];
        }
      }
    }
    else
    {
      *a4 = 1;
    }
  }
}

void __63__NSArray_CKChatItems____ck_catchUpScrollTargetForMessageGUID___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = [a2 IMChatItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v15 message];
    char v8 = [v7 guid];

    if ([v8 isEqualToString:a1[4]])
    {
      uint64_t v9 = *(void *)(a1[5] + 8);
      if (!*(unsigned char *)(v9 + 24))
      {
        *(unsigned char *)(v9 + 24) = 1;
        *(void *)(*(void *)(a1[6] + 8) + 32) = a3;
      }
    }

    goto LABEL_8;
  }
  int v10 = [v15 guid];
  int v11 = [v10 containsString:a1[4]];

  if (v11)
  {
    *(void *)(*(void *)(a1[6] + 8) + 40) = a3;
LABEL_8:
    id v12 = v15;
    goto LABEL_9;
  }
  id v12 = v15;
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t v13 = [v15 guid];
    char v14 = [v13 containsString:a1[4]];

    id v12 = v15;
    if ((v14 & 1) == 0) {
      *a4 = 1;
    }
  }
LABEL_9:
}

void __61__NSArray_CKChatItems____ck_indexesOfPartsOfMessageWithGUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = [a2 IMChatItem];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v7 = [v10 message];
    char v8 = [v7 guid];
    int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

    if (v9) {
      [*(id *)(a1 + 40) addIndex:a3];
    }
  }
  else if ([*(id *)(a1 + 40) count])
  {
    *a4 = 1;
  }
}

void __75__NSArray_CKChatItems____ck_indexOfPartOfMessageGUID_withMessagePartIndex___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = [a2 IMChatItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v7 = v10;
      char v8 = [v7 message];
      int v9 = [v8 guid];

      if ([v9 isEqualToString:a1[4]] && objc_msgSend(v7, "index") == a1[6])
      {
        *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
        *a4 = 1;
      }
    }
  }
}

void __67__NSArray_CKChatItems____ck_indexesOfPartsOfNonAttachmentMessages___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = [a2 IMChatItem];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v7 = [v9 message];
    char v8 = [v7 guid];

    if ([*(id *)(a1 + 32) containsObject:v8]) {
      [*(id *)(a1 + 40) addIndex:a3];
    }
  }
  else if ([*(id *)(a1 + 40) count])
  {
    *a4 = 1;
  }
}

void __54__NSArray_CKChatItems____ck_indexesOfPartsOfMessages___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  int v11 = [a2 IMChatItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v11 message];
    char v8 = [v7 guid];

    if ([*(id *)(a1 + 32) containsObject:v8]) {
      [*(id *)(a1 + 40) addIndex:a3];
    }

    id v9 = v11;
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 40) count];
    id v9 = v11;
    if (v10) {
      *a4 = 1;
    }
  }
}

void __62__NSArray__CKAppInstallation____ck_proxyWithBundleIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v8 = v12;
  if (isKindOfClass)
  {
    id v9 = v12;
    uint64_t v10 = [v9 bundleIdentifier];
    int v11 = [v10 isEqualToString:*(void *)(a1 + 32)];

    if (v11)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }

    char v8 = v12;
  }
}

@end