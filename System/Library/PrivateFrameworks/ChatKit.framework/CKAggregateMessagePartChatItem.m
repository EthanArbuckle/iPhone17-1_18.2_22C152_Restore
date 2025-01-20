@interface CKAggregateMessagePartChatItem
- (CKAggregateMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4;
- (Class)balloonViewClass;
- (NSArray)subparts;
- (NSString)title;
- (id)compositionWithContext:(id)a3;
- (id)loadTranscriptText;
- (id)pasteboardItemProviders;
- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4;
- (void)setSubparts:(id)a3;
@end

@implementation CKAggregateMessagePartChatItem

- (CKAggregateMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKAggregateMessagePartChatItem;
  v7 = [(CKMessagePartChatItem *)&v21 initWithIMChatItem:v6 maxWidth:a4];
  if (v7)
  {
    v8 = [v6 subparts];
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(objc_alloc((Class)objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "__ck_chatItemClass", (void)v17)), "initWithIMChatItem:maxWidth:", *(void *)(*((void *)&v17 + 1) + 8 * v14), a4);
          [v9 addObject:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v12);
    }

    [(CKAggregateMessagePartChatItem *)v7 setSubparts:v9];
  }

  return v7;
}

- (id)loadTranscriptText
{
  v5.receiver = self;
  v5.super_class = (Class)CKAggregateMessagePartChatItem;
  v2 = [(CKTextMessagePartChatItem *)&v5 loadTranscriptText];
  if ((unint64_t)[v2 length] >= 0x1F5)
  {
    uint64_t v3 = objc_msgSend(v2, "attributedSubstringFromRange:", 0, 499);

    v2 = (void *)v3;
  }

  return v2;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (id)pasteboardItemProviders
{
  v2 = [(CKAggregateMessagePartChatItem *)self subparts];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__CKAggregateMessagePartChatItem_pasteboardItemProviders__block_invoke;
  v6[3] = &unk_1E562ABF0;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateObjectsUsingBlock:v6];

  return v4;
}

void __57__CKAggregateMessagePartChatItem_pasteboardItemProviders__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 pasteboardItemProviders];
  [v2 addObjectsFromArray:v3];
}

- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v8 = [MEMORY[0x1E4F1CA48] array];
  v9 = [(CKAggregateMessagePartChatItem *)self subparts];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__CKAggregateMessagePartChatItem_rtfDocumentItemsWithFormatString_selectedTextRange___block_invoke;
  v15[3] = &unk_1E562AC18;
  id v10 = v8;
  id v16 = v10;
  id v17 = v7;
  NSUInteger v18 = location;
  NSUInteger v19 = length;
  id v11 = v7;
  [v9 enumerateObjectsUsingBlock:v15];
  uint64_t v12 = v17;
  id v13 = v10;

  return v13;
}

void __85__CKAggregateMessagePartChatItem_rtfDocumentItemsWithFormatString_selectedTextRange___block_invoke(void *a1, void *a2)
{
  v2 = (void *)a1[4];
  objc_msgSend(a2, "rtfDocumentItemsWithFormatString:selectedTextRange:", a1[5], a1[6], a1[7]);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];
}

- (NSString)title
{
  id v3 = [(CKTextMessagePartChatItem *)self subject];
  id v4 = [v3 string];
  objc_super v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(CKTextMessagePartChatItem *)self text];
    id v6 = [v7 string];
  }
  v8 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v9 = [v6 stringByTrimmingCharactersInSet:v8];

  uint64_t v10 = [v9 rangeOfString:@"\n"];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = [v9 substringToIndex:v10];

    v9 = (void *)v11;
  }

  return (NSString *)v9;
}

- (NSArray)subparts
{
  return self->_subparts;
}

- (void)setSubparts:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)compositionWithContext:(id)a3
{
  id v3 = [(CKAggregateMessagePartChatItem *)self subparts];
  id v4 = +[CKComposition compositionForMessageParts:v3 preserveSubject:1 contextIdentifier:0];

  return v4;
}

@end