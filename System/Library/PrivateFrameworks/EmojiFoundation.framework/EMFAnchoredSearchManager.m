@interface EMFAnchoredSearchManager
- (EMFAnchoredSearchAnchorsLoader)anchorsLoader;
- (EMFAnchoredSearchManager)initWithLocaleData:(id)a3;
- (EMFEmojiLocaleData)localeData;
- (NSArray)localizedLeftHandAnchors;
- (NSArray)localizedRightHandAnchors;
- (void)_enumerateAnchoredReplacementCandidatesForContextLeft:(id)a3 withOptions:(unint64_t)a4 usingBlock:(id)a5;
- (void)_enumerateAnchoredReplacementCandidatesForContextOmnidirectional:(id)a3 withOptions:(unint64_t)a4 usingBlock:(id)a5;
- (void)_enumerateAnchoredReplacementCandidatesForContextRight:(id)a3 withOptions:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateAnchoredReplacementCandidatesForContext:(id)a3 withOptions:(unint64_t)a4 usingBlock:(id)a5;
- (void)setLocaleData:(id)a3;
@end

@implementation EMFAnchoredSearchManager

- (EMFAnchoredSearchManager)initWithLocaleData:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EMFAnchoredSearchManager;
  result = [(EMFAnchoredSearchManager *)&v5 init];
  if (result) {
    result->_localeData = (EMFEmojiLocaleData *)a3;
  }
  return result;
}

- (EMFAnchoredSearchAnchorsLoader)anchorsLoader
{
  anchorsLoader = self->_anchorsLoader;
  if (anchorsLoader)
  {
    v3 = anchorsLoader;
  }
  else
  {
    objc_super v5 = [EMFAnchoredSearchAnchorsLoader alloc];
    v6 = [(EMFAnchoredSearchManager *)self localeData];
    v7 = [v6 localeIdentifier];
    v8 = [(EMFAnchoredSearchAnchorsLoader *)v5 initWithLocaleIdentifier:v7];

    v9 = self->_anchorsLoader;
    self->_anchorsLoader = v8;
    v10 = v8;

    v3 = self->_anchorsLoader;
  }
  return v3;
}

- (NSArray)localizedLeftHandAnchors
{
  v2 = [(EMFAnchoredSearchManager *)self anchorsLoader];
  v3 = [v2 leftHandAnchors];

  return (NSArray *)v3;
}

- (NSArray)localizedRightHandAnchors
{
  v2 = [(EMFAnchoredSearchManager *)self anchorsLoader];
  v3 = [v2 rightHandAnchors];

  return (NSArray *)v3;
}

- (void)enumerateAnchoredReplacementCandidatesForContext:(id)a3 withOptions:(unint64_t)a4 usingBlock:(id)a5
{
  id v17 = a3;
  id v8 = a5;
  v9 = [(EMFAnchoredSearchManager *)self localizedLeftHandAnchors];
  if (v9)
  {
    v10 = [(EMFAnchoredSearchManager *)self localizedLeftHandAnchors];
    BOOL v11 = [v10 count] != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  uint64_t v12 = [(EMFAnchoredSearchManager *)self localizedRightHandAnchors];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(EMFAnchoredSearchManager *)self localizedRightHandAnchors];
    uint64_t v15 = [v14 count];

    if (v15) {
      BOOL v16 = v11;
    }
    else {
      BOOL v16 = 0;
    }
    if (v16)
    {
      [(EMFAnchoredSearchManager *)self _enumerateAnchoredReplacementCandidatesForContextOmnidirectional:v17 withOptions:a4 usingBlock:v8];
      goto LABEL_16;
    }
    if (v11) {
      goto LABEL_13;
    }
    if (v15) {
      [(EMFAnchoredSearchManager *)self _enumerateAnchoredReplacementCandidatesForContextRight:v17 withOptions:a4 usingBlock:v8];
    }
  }
  else if (v11)
  {
LABEL_13:
    [(EMFAnchoredSearchManager *)self _enumerateAnchoredReplacementCandidatesForContextLeft:v17 withOptions:a4 usingBlock:v8];
  }
LABEL_16:
}

- (void)_enumerateAnchoredReplacementCandidatesForContextLeft:(id)a3 withOptions:(unint64_t)a4 usingBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__3;
  v18[4] = __Block_byref_object_dispose__3;
  id v19 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v9 = objc_alloc_init(EMFContextBuilderLeftHand);
  uint64_t v10 = [v7 length];
  BOOL v11 = [(EMFAnchoredSearchManager *)self localizedLeftHandAnchors];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __105__EMFAnchoredSearchManager__enumerateAnchoredReplacementCandidatesForContextLeft_withOptions_usingBlock___block_invoke;
  v14[3] = &unk_1E61A9B00;
  v14[4] = self;
  id v12 = v7;
  id v15 = v12;
  id v17 = v18;
  id v13 = v8;
  id v16 = v13;
  -[EMFContextBuilderLeftHand enumerateWindowsForContext:range:searchAnchors:usingBlock:](v9, "enumerateWindowsForContext:range:searchAnchors:usingBlock:", v12, 0, v10, v11, v14);

  _Block_object_dispose(v18, 8);
}

void __105__EMFAnchoredSearchManager__enumerateAnchoredReplacementCandidatesForContextLeft_withOptions_usingBlock___block_invoke(id *a1)
{
  id v2 = [a1[4] localeData];
  [v2 emojiLocaleDataRef];
  id v3 = a1[5];
  id v4 = a1[6];
  CEMEmojiLocaleDataEnumerateSearchResultsInStringWithBlock();
}

void __105__EMFAnchoredSearchManager__enumerateAnchoredReplacementCandidatesForContextLeft_withOptions_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "containsIndexesInRange:") & 1) == 0)
  {
    CFIndex v10 = a3 + a4;
    uint64_t v11 = *(void *)(a1 + 64) + *(void *)(a1 + 56);
    if (a3 + a4 == v11
      || v10 == v11 - 1
      && (uint64_t CharacterAtIndex = CFStringGetCharacterAtIndex(*(CFStringRef *)(a1 + 32), v10),
          [MEMORY[0x1E4F28B88] whitespaceCharacterSet],
          id v13 = objc_claimAutoreleasedReturnValue(),
          LODWORD(CharacterAtIndex) = [v13 characterIsMember:CharacterAtIndex],
          v13,
          CharacterAtIndex))
    {
      v14 = +[EMFEmojiToken emojiTokensForCEMEmojiTokens:a2];
      id v16 = (id)[v14 mutableCopy];

      uint64_t v15 = *(void *)(a1 + 72) - a3 + *(void *)(a1 + 80);
      if ((unint64_t)[v16 count] >= 2) {
        [v16 sortUsingComparator:&__block_literal_global_11];
      }
      if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "containsIndexesInRange:", a3, v15) & 1) == 0)
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "addIndexesInRange:", a3, v15);
        *a5 = 1;
      }
    }
  }
}

int64_t __105__EMFAnchoredSearchManager__enumerateAnchoredReplacementCandidatesForContextLeft_withOptions_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[EMFQueryResultSorter compareEmojiTokenGenderInclusiveFirst:a2 withOtherToken:a3];
}

- (void)_enumerateAnchoredReplacementCandidatesForContextRight:(id)a3 withOptions:(unint64_t)a4 usingBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__3;
  v18[4] = __Block_byref_object_dispose__3;
  id v19 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v9 = objc_alloc_init(EMFContextBuilderRightHand);
  uint64_t v10 = [v7 length];
  uint64_t v11 = [(EMFAnchoredSearchManager *)self localizedRightHandAnchors];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __106__EMFAnchoredSearchManager__enumerateAnchoredReplacementCandidatesForContextRight_withOptions_usingBlock___block_invoke;
  v14[3] = &unk_1E61A9B00;
  v14[4] = self;
  id v12 = v7;
  id v15 = v12;
  id v17 = v18;
  id v13 = v8;
  id v16 = v13;
  -[EMFContextBuilderRightHand enumerateWindowsForContext:range:searchAnchors:usingBlock:](v9, "enumerateWindowsForContext:range:searchAnchors:usingBlock:", v12, 0, v10, v11, v14);

  _Block_object_dispose(v18, 8);
}

void __106__EMFAnchoredSearchManager__enumerateAnchoredReplacementCandidatesForContextRight_withOptions_usingBlock___block_invoke(id *a1)
{
  id v2 = [a1[4] localeData];
  [v2 emojiLocaleDataRef];
  id v3 = a1[5];
  id v4 = a1[6];
  CEMEmojiLocaleDataEnumerateSearchResultsInStringWithBlock();
}

void __106__EMFAnchoredSearchManager__enumerateAnchoredReplacementCandidatesForContextRight_withOptions_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "containsIndexesInRange:") & 1) == 0)
  {
    CFIndex v10 = *(void *)(a1 + 56);
    if (a3 == v10
      || a3 == v10 + 1
      && (uint64_t CharacterAtIndex = CFStringGetCharacterAtIndex(*(CFStringRef *)(a1 + 32), v10),
          [MEMORY[0x1E4F28B88] whitespaceCharacterSet],
          id v12 = objc_claimAutoreleasedReturnValue(),
          LODWORD(CharacterAtIndex) = [v12 characterIsMember:CharacterAtIndex],
          v12,
          CharacterAtIndex))
    {
      id v13 = +[EMFEmojiToken emojiTokensForCEMEmojiTokens:a2];
      id v16 = (id)[v13 mutableCopy];

      uint64_t v14 = *(void *)(a1 + 72);
      uint64_t v15 = a3 + a4 - v14;
      if ((unint64_t)[v16 count] >= 2) {
        [v16 sortUsingComparator:&__block_literal_global_10];
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "addIndexesInRange:", v14, v15);
      *a5 = 1;
    }
  }
}

int64_t __106__EMFAnchoredSearchManager__enumerateAnchoredReplacementCandidatesForContextRight_withOptions_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[EMFQueryResultSorter compareEmojiTokenGenderInclusiveFirst:a2 withOtherToken:a3];
}

- (void)_enumerateAnchoredReplacementCandidatesForContextOmnidirectional:(id)a3 withOptions:(unint64_t)a4 usingBlock:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(EMFAnchoredSearchManager *)self _enumerateAnchoredReplacementCandidatesForContextLeft:v9 withOptions:a4 usingBlock:v8];
  [(EMFAnchoredSearchManager *)self _enumerateAnchoredReplacementCandidatesForContextRight:v9 withOptions:a4 usingBlock:v8];
}

- (EMFEmojiLocaleData)localeData
{
  return self->_localeData;
}

- (void)setLocaleData:(id)a3
{
  self->_localeData = (EMFEmojiLocaleData *)a3;
}

- (void).cxx_destruct
{
}

@end